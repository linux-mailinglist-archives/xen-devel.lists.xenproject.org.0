Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70380392CA7
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133020.248040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEBS-0000H2-TX; Thu, 27 May 2021 11:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133020.248040; Thu, 27 May 2021 11:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEBS-0000DN-PV; Thu, 27 May 2021 11:28:14 +0000
Received: by outflank-mailman (input) for mailman id 133020;
 Thu, 27 May 2021 11:28:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmEBR-0000DD-6l
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:28:13 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9f8fd59-2afa-49d5-b336-e0008c844830;
 Thu, 27 May 2021 11:28:12 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9829D218DD;
 Thu, 27 May 2021 11:28:11 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 6653611A98;
 Thu, 27 May 2021 11:28:11 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b9f8fd59-2afa-49d5-b336-e0008c844830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622114891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6aTSYEJ4zMIzcsHnssUxQ3Bp2aABIpTEIa3bDkYDGg=;
	b=acmKoGYDeHF6DyeYESAaaMb1IsZc3GKsB6z74gGCyYraRgBjoalxJAAq/olGOXV3UARR7v
	mBckfAt+971c2kTSy84zXDvvaKDqZQRTdWh53ADL6NedLlQ5QeU+yUzG9WWfbP0d8OcZ1h
	iVArkE/bcz5klrhJAx9n5n8vN5ap8a8=
Subject: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Message-ID: <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
Date: Thu, 27 May 2021 13:28:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

port_is_valid() and evtchn_from_port() are fine to use without holding
any locks. Accordingly acquire the per-domain lock slightly later in
evtchn_close() and evtchn_bind_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: Re-base for re-ordering / shrinking of series.
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -606,17 +606,14 @@ int evtchn_close(struct domain *d1, int
     int            port2;
     long           rc = 0;
 
- again:
-    spin_lock(&d1->event_lock);
-
     if ( !port_is_valid(d1, port1) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn1 = evtchn_from_port(d1, port1);
 
+ again:
+    spin_lock(&d1->event_lock);
+
     /* Guest cannot close a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn1)) && guest )
     {
@@ -1041,16 +1038,13 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
-
     if ( !port_is_valid(d, port) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn = evtchn_from_port(d, port);
 
+    spin_lock(&d->event_lock);
+
     /* Guest cannot re-bind a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn)) )
     {


