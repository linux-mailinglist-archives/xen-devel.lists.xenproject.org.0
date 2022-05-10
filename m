Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7705212C3
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325385.547933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNSB-0004wm-2e; Tue, 10 May 2022 10:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325385.547933; Tue, 10 May 2022 10:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNSA-0004tw-Vm; Tue, 10 May 2022 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 325385;
 Tue, 10 May 2022 10:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noNSA-0004tq-3x
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:50:54 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ece334d-d04f-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 12:50:51 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47088)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noNS0-000Sjz-K5 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 11:50:44 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DF8C51FA59;
 Tue, 10 May 2022 11:50:43 +0100 (BST)
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
X-Inumbo-ID: 0ece334d-d04f-11ec-8fc4-03012f2f19d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f117f4c3-4c70-c0de-3933-84f436ce74f7@srcf.net>
Date: Tue, 10 May 2022 11:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 1/6] xen: implement byteswap
In-Reply-To: <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2022 11:15, Lin Liu wrote:
> swab() is massively over complicated and can be simplified by builtins.
> The compilers provide builtin function to swap bytes.
> * gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
> * clang: https://clang.llvm.org/docs/LanguageExtensions.html
> This patch simplify swab() with builtins and fallback for old compilers.

Arguably, this patch introduces a new byteswapping infrastructure in
terms of compiler builtins and bswapXX(), so the swab() infrastructure
can be retired.

> diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
> index 9c712c4788..622eeaba07 100644
> --- a/xen/arch/arm/include/asm/byteorder.h
> +++ b/xen/arch/arm/include/asm/byteorder.h
> @@ -1,16 +1,10 @@
>  #ifndef __ASM_ARM_BYTEORDER_H__
>  #define __ASM_ARM_BYTEORDER_H__
>  
> -#define __BYTEORDER_HAS_U64__
> +#ifndef __BYTE_ORDER__
> +   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> +#endif

This won't actually do what you want on GCC 4.5 or older.  You also want

#ifndef __ORDER_LITTLE_ENDIAN__
# define __ORDER_LITTLE_ENDIAN__ 1234
#endif

#ifndef __ORDER_BIG_ENDIAN__
# define __ORDER_BIG_ENDIAN__ 4321
#endif

in compiler.h to cope with older GCC.

Otherwise, LGTM.  Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can fix this on commit if its the only issue issue.  Otherwise, please
correct it when posting v4.

~Andrew

