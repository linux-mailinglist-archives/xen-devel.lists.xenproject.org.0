Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D726257CDAA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 16:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372841.604832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXAf-00086Z-SR; Thu, 21 Jul 2022 14:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372841.604832; Thu, 21 Jul 2022 14:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXAf-00084U-Pb; Thu, 21 Jul 2022 14:28:57 +0000
Received: by outflank-mailman (input) for mailman id 372841;
 Thu, 21 Jul 2022 14:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Igjx=X2=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEXAd-00084O-Eh
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 14:28:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae8e2fd-0901-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 16:28:43 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658413711948827.866975293264;
 Thu, 21 Jul 2022 07:28:31 -0700 (PDT)
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
X-Inumbo-ID: 6ae8e2fd-0901-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658413714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QCNe8q+B5niVa7U9mY5uxNP6SmzxE+Afqhy1PEsR47KCM3yZ6fsQSqROjqlrgicdvUGfWa8jddYvV2HTSN4aqtXaFAuyzG/9wC1uImPCl2eqzKh6W/v75RLpYwkySAqi1SMN+xtzw84D4fEle4jEbHk2Hn4tnTZYP7H18Ef0ep8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658413714; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=0u9pK8qX7F3CAFSQGQt3egUVWbEcJ+dkb3mKmVnAkIg=; 
	b=Hylucoc9/WEcV3wguOPROjyJOp2wIFl/iJFrPeqGEj9omzA1B6xmCVR+n7/H9e8a13HtingJNflGCRRwXJP3HA96Jdsj/7PL9Z0n61Q5Oq8uuJvyOBsRsG8bny+auljK3q1/ILpBiVJAm+ZdT7wGVxV/iQIU7mWPXKcAJATGlqA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658413714;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0u9pK8qX7F3CAFSQGQt3egUVWbEcJ+dkb3mKmVnAkIg=;
	b=nfkUZP/bEbu4xl74tQ28Ov9NUpTDPnCVJyjDO2VFFNzx+XZ0v4wP/01KxBcKy0hj
	qpEcsSi5UXt7trOVpWnkmuEY3Jolu00JFaTtUihQBuDVhRo2505gq8xVkkgisffSEsH
	DbClqsBoefVYmp9q/rLcrFqtayy6k7J4elL4uFcc=
Message-ID: <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
Date: Thu, 21 Jul 2022 10:28:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
In-Reply-To: <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/19/22 09:11, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -0,0 +1,48 @@
>> +#ifndef __ARCH_X86_BOOTINFO_H__
>> +#define __ARCH_X86_BOOTINFO_H__
>> +
>> +/* unused for x86 */
>> +struct arch_bootstring { };
>> +
>> +struct __packed arch_bootmodule {
>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
> 
> Such macro expansions need parenthesizing.

Ack.

>> +    uint32_t flags;
>> +    uint32_t headroom;
>> +};
> 
> Since you're not following any external spec, on top of what Julien
> said about the __packed attribute I'd also like to point out that
> in many cases here there's no need to use fixed-width types.

Oh, I forgot to mention that in the reply to Julien. Yes, the __packed
is needed to correctly cross the 32bit to 64bit bridge from the x86
bootstrap in patch 4.

>> +struct __packed arch_boot_info {
>> +    uint32_t flags;
>> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
>> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
>> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
>> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
>> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
>> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
>> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
>> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
>> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
>> +
>> +    bool xen_guest;
> 
> As the example of this, with just the header files being introduced
> here it is not really possible to figure what these fields are to
> be used for and hence whether they're legitimately represented here.

I can add a comment to clarify these are a mirror of the multiboot
flags. These were mirrored to allow the multiboot flags to be direct
copied and eased the replacement locations where an mb flag is checked.

>> +    char *boot_loader_name;
>> +    char *kextra;
> 
> const?

I want to say const will not work based on usage, but I will double-check.


