Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6589461CED
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 18:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234791.407443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkfl-0003Tp-4k; Mon, 29 Nov 2021 17:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234791.407443; Mon, 29 Nov 2021 17:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkfl-0003RX-1i; Mon, 29 Nov 2021 17:42:37 +0000
Received: by outflank-mailman (input) for mailman id 234791;
 Mon, 29 Nov 2021 17:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9yz=QQ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mrkfi-0003RR-T9
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 17:42:34 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb52545a-513b-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 18:42:33 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39880)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mrkfg-000Q27-oP (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 29 Nov 2021 17:42:32 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5E2E921457;
 Mon, 29 Nov 2021 17:42:32 +0000 (GMT)
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
X-Inumbo-ID: bb52545a-513b-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <dbba70b3-d811-8f40-f847-d5f310a47c74@srcf.net>
Date: Mon, 29 Nov 2021 17:42:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211129172617.12779-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211129172617.12779-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 17:26, Andrew Cooper wrote:
> It has been 4 years since the default load address changed from 1M to 2M, and
> _stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
> mapping.
>
> To ensure we don't create/remove mappings accidentally, loop from 0 and obey
> _PAGE_PRESENT on all entries.
>
> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>
> I ought to have spotted this in c/s 52975142d154 ("x86/boot: Create the
> l2_xenmap[] mappings dynamically") too.
> ---
>  xen/arch/x86/setup.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index da47cdea14a1..6f241048425c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1279,16 +1279,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>              /* The only data mappings to be relocated are in the Xen area. */
>              pl2e = __va(__pa(l2_xenmap));
> -            /*
> -             * Undo the temporary-hooking of the l1_directmap.  __2M_text_start
> -             * is contained in this PTE.
> -             */
> +
>              BUG_ON(using_2M_mapping() &&
>                     l2_table_offset((unsigned long)_erodata) ==
>                     l2_table_offset((unsigned long)_stext));
> -            *pl2e++ = l2e_from_pfn(xen_phys_start >> PAGE_SHIFT,
> -                                   PAGE_HYPERVISOR_RX | _PAGE_PSE);
> -            for ( i = 1; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
> +
> +            for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
>              {
>                  unsigned int flags;
>  

Actually, on further consideration, this hunk should be included too, to
cross-check that we don't zap any of the dynamically created mappings.

~Andrew

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f241048425c..5c8026b30e3e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1320,7 +1320,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 }
                 else
                 {
-                    *pl2e = l2e_empty();
+                    ASSERT_UNREACHABLE();
                     continue;
                 }
 


