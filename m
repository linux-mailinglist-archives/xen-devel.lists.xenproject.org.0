Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9C230683
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0LsC-0002Y7-71; Tue, 28 Jul 2020 09:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0LsA-0002Y2-Fe
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:26:10 +0000
X-Inumbo-ID: 5e1447f2-d0b4-11ea-8b20-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e1447f2-d0b4-11ea-8b20-bc764e2007e4;
 Tue, 28 Jul 2020 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595928368;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JtQqa/GSc1fAEqGRuQBN4Er6GGqRLBpKt2Wq0dwMWvU=;
 b=UURj25CLdlyZbCh4A6nAogS38q7qWrDwjiK+eBqGCJTxbTLHvyo5Hxjp
 xXhRxJhjn02FFIXLHSwVUvZ+GH7u+wLW80lVVhIMpqXSBHsXnrm4dytX9
 RAXdGqdFuY8DdoCcMRNtjb5vxXf6ktmE5fdBZ4Qh9iS8W83w4THS/75rY w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Qb2MkFE+yO0eWbn4GnRskLe0dbzK2qXnHanbNaPZjeAtAh9/bs+u7PJljIsAxnQ/xKp+CamAAx
 xmdCbnyk+F5y4zDNrO1AbG/IpDo7Un/3A5PU8e29sCgbr35HKvC4Ja8En/ysBYk/tC2wQhDm56
 5Wh2htKYdILqbD+UZocK0VzDwNkJMrNwzpQ1T2UpiJc9o3+SGNYaBc6Jwdpj6GEO1Imjb1TScP
 U2hEKZ8HK7kt+nbp1px9/w19db/vxHp3UU3LVQNXZcIR98JAG8uoAOdW51wetoloF54UWQG63D
 V+A=
X-SBRS: 2.7
X-MesageID: 23663992
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="23663992"
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Eslam Elnikety <elnikety@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20200728083357.77999-1-elnikety@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
Date: Tue, 28 Jul 2020 10:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728083357.77999-1-elnikety@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 09:33, Eslam Elnikety wrote:
> The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
> size of left side of timer_int_route_valid to match.
>
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
>
> Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
> ---
>  xen/arch/x86/hvm/hpet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> index ca94e8b453..9afe6e6760 100644
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -66,7 +66,7 @@
>      MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
>  
>  #define timer_int_route_valid(h, n) \
> -    ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
> +    ((1ULL << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>  
>  static inline uint64_t hpet_read_maincounter(HPETState *h, uint64_t guest_time)
>  {

Does this work?

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b453..638f6174de 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -62,8 +62,7 @@
 
 #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n),
HPET_TN_ROUTE)
 
-#define timer_int_route_cap(h, n) \
-    MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
+#define timer_int_route_cap(h, n) (h)->hpet.timers[(n)].route
 
 #define timer_int_route_valid(h, n) \
     ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index f0e0eaec83..a41fc443cc 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -73,7 +73,13 @@ struct hpet_registers {
     uint64_t isr;               /* interrupt status reg */
     uint64_t mc64;              /* main counter */
     struct {                    /* timers */
-        uint64_t config;        /* configuration/cap */
+        union {
+            uint64_t config;    /* configuration/cap */
+            struct {
+                uint32_t _;
+                uint32_t route;
+            };
+        };
         uint64_t cmp;           /* comparator */
         uint64_t fsb;           /* FSB route, not supported now */
     } timers[HPET_TIMER_NUM];


