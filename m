Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95E36FCA3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120575.228033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUNV-0002fy-UE; Fri, 30 Apr 2021 14:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120575.228033; Fri, 30 Apr 2021 14:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUNV-0002fb-R1; Fri, 30 Apr 2021 14:44:25 +0000
Received: by outflank-mailman (input) for mailman id 120575;
 Fri, 30 Apr 2021 14:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcUNT-0002fK-M6
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:44:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34d10e4c-b18a-48fb-a228-d36dbf4bd7cc;
 Fri, 30 Apr 2021 14:44:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A7ADB038;
 Fri, 30 Apr 2021 14:44:22 +0000 (UTC)
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
X-Inumbo-ID: 34d10e4c-b18a-48fb-a228-d36dbf4bd7cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619793862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WSaABwQNqG2JTm70xmiIAHfh+9L9Z20dtHsVXRIDIg=;
	b=TUXCJDj0WvBzBreDJt0SRxvGQx1jhnB+j2FvQP5UfpJVScQacYmgPOS0SvUqEuOcotyTXa
	8s+WExlwnFub7VBuF2xrw3t+DurZ65IPkrGDHzLERCqESrsKoN6RAGe6roAEEixmZOewaa
	WNnKM0FP05uCJZc/poHeIHvOFAtbFzU=
Subject: [PATCH 2/3] firmware/shim: drop XEN_CONFIG_EXPERT uses
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Message-ID: <56bb5e87-fe35-75a8-fe18-ecc959b21799@suse.com>
Date: Fri, 30 Apr 2021 16:44:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As of commit d155e4aef35c ("xen: Allow EXPERT mode to be selected from
the menuconfig directly") EXPERT is a regular config option.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -74,10 +74,10 @@ $(D): linkfarm.stamp
 	$(MAKE) -C $(D)/xen distclean
 
 $(D)/xen/.config: $(D)
-	$(MAKE) -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig XEN_CONFIG_EXPERT=y defconfig
+	$(MAKE) -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig defconfig
 
 xen-shim: $(D)/xen/.config
-	$(MAKE) -C $(<D) build XEN_CONFIG_EXPERT=y
+	$(MAKE) -C $(<D) build
 	ln -sf $(D)/xen/xen $@
 	ln -sf $(D)/xen/xen-syms $@-syms
 


