Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403F3682AE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115485.220358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZac1-0003qo-PY; Thu, 22 Apr 2021 14:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115485.220358; Thu, 22 Apr 2021 14:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZac1-0003qS-MI; Thu, 22 Apr 2021 14:47:25 +0000
Received: by outflank-mailman (input) for mailman id 115485;
 Thu, 22 Apr 2021 14:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZac0-0003qI-IA
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:47:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 659f57e8-ec80-4d3c-9fdf-8d577b13b234;
 Thu, 22 Apr 2021 14:47:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C276ABB1;
 Thu, 22 Apr 2021 14:47:23 +0000 (UTC)
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
X-Inumbo-ID: 659f57e8-ec80-4d3c-9fdf-8d577b13b234
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vhMDJVGPLut9dUUvDo0ADaCfxiPqS6gGUbBUs/N0kg=;
	b=Lmgbr5OOk6rjy1YhZnMk1M8RsWc6m6E30tvi1IoNRWef79uUGW2MN3udMUMN1AB/ZjPEf9
	p1pMSw9hguRx5vH7rV1qYSKLC6xxFjz5Z5xtVdW4IbXJkwLpgLh1PJTQ8N4Ev6VXpKuLsW
	x+fuYOTJsLuRm3zRXxvrzfvey3lbITo=
Subject: [PATCH v3 07/22] x86/xstate: avoid accounting for unsupported
 components
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <a339c2a0-0a73-8e30-f802-cd905dca7f7e@suse.com>
Date: Thu, 22 Apr 2021 16:47:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point in including unsupported components in the size
calculations of xstate_{alloc,update}_save_area().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -501,8 +501,12 @@ int xstate_alloc_save_area(struct vcpu *
         unsigned int i;
 
         for ( size = 0, i = 2; i < xstate_features; ++i )
+        {
+            if ( !(xfeature_mask & (1ul << i)) )
+                continue;
             if ( size < xstate_size(i) )
                 size = xstate_size(i);
+        }
         size += XSTATE_AREA_MIN_SIZE;
     }
 
@@ -543,6 +547,8 @@ int xstate_update_save_area(struct vcpu
 
     for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
     {
+        if ( !(xfeature_mask & (1ul << i)) )
+            continue;
         if ( xcr0_max & (1ul << i) )
             size = max(size, xstate_offset(i) + xstate_size(i));
         if ( v->arch.xcr0_accum & (1ul << i) )


