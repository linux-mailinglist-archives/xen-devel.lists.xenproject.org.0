Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586A1E8821
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 21:47:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jekyC-0001hH-TR; Fri, 29 May 2020 19:47:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jekyA-0001h8-On
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 19:47:06 +0000
X-Inumbo-ID: 2be55d28-a1e5-11ea-a910-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2be55d28-a1e5-11ea-a910-12813bfff9fa;
 Fri, 29 May 2020 19:47:05 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:42512
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeky4-000bfP-MQ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 20:47:03 +0100
Subject: Re: [PATCH v2 11/14] x86/alt: Adjust _alternative_instructions() to
 not create shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-12-andrew.cooper3@citrix.com>
 <1e6d1503-40a8-55b9-9bd3-750cf301220d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b56a9583-2a8a-6667-6753-8c3d25e1c3ab@citrix.com>
Date: Fri, 29 May 2020 20:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1e6d1503-40a8-55b9-9bd3-750cf301220d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 13:23, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> @@ -398,6 +399,19 @@ static void __init _alternative_instructions(bool force)
>>          panic("Timed out waiting for alternatives self-NMI to hit\n");
>>  
>>      set_nmi_callback(saved_nmi_callback);
>> +
>> +    /*
>> +     * When Xen is using shadow stacks, the alternatives clearing CR0.WP and
>> +     * writing into the mappings set dirty bits, turning the mappings into
>> +     * shadow stack mappings.
>> +     *
>> +     * While we can execute from them, this would also permit them to be the
>> +     * target of WRSS instructions, so reset the dirty after patching.
>> +     */
>> +    if ( cpu_has_xen_shstk )
>> +        modify_xen_mappings(XEN_VIRT_START + MB(2),
>> +                            (unsigned long)&__2M_text_end,
>> +                            PAGE_HYPERVISOR_RX);
> Am I misremembering, or did you post a patch before that should
> be part of this series, as being a prereq to this change,
> making modify_xen_mappings() also respect _PAGE_DIRTY as
> requested by the caller?

No.  Its the hunk you deleted from lower in this patch.

> Additionally I notice this
>
>         if ( desc->Attribute & (efi_bs_revision < EFI_REVISION(2, 5)
>                                 ? EFI_MEMORY_WP : EFI_MEMORY_RO) )
>             prot &= ~_PAGE_RW;
>
> in efi_init_memory(). Afaict we will need to clear _PAGE_DIRTY
> there as well, with prot starting out as PAGE_HYPERVISOR_RWX.

Ok.  I'll pull that out into a separate patch.

~Andrew

