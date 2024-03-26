Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C351F88C52D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 15:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698107.1089446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7pI-00078A-EP; Tue, 26 Mar 2024 14:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698107.1089446; Tue, 26 Mar 2024 14:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7pI-000769-B9; Tue, 26 Mar 2024 14:30:56 +0000
Received: by outflank-mailman (input) for mailman id 698107;
 Tue, 26 Mar 2024 14:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp7pG-000761-JH
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 14:30:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7296f0b1-eb7d-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 15:30:52 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C7A904EE0739;
 Tue, 26 Mar 2024 15:30:51 +0100 (CET)
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
X-Inumbo-ID: 7296f0b1-eb7d-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 15:30:51 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 09/11] x86/msi: address violation of MISRA C Rule 20.7
 and coding style
In-Reply-To: <f2d393e9-6b70-4998-9d85-e070d6bba556@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
 <f2d393e9-6b70-4998-9d85-e070d6bba556@suse.com>
Message-ID: <e323ec0362a6b4b1811f2119a33b08f4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-26 11:05, Jan Beulich wrote:
> On 22.03.2024 17:01, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> While at it, the style of these macros has been somewhat uniformed.
> 
> Hmm, yes, but they then still leave more to be desired. I guess I can 
> see
> though why you don't want to e.g. ...
> 
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -147,33 +147,34 @@ int msi_free_irq(struct msi_desc *entry);
>>   */
>>  #define NR_HP_RESERVED_VECTORS 	20
>> 
>> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
>> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
>> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
>> -#define msi_data_reg(base, is64bit)	\
>> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
>> -#define msi_mask_bits_reg(base, is64bit) \
>> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
>> +#define msi_control_reg(base)        ((base) + PCI_MSI_FLAGS)
>> +#define msi_lower_address_reg(base)  ((base) + PCI_MSI_ADDRESS_LO)
>> +#define msi_upper_address_reg(base)  ((base) + PCI_MSI_ADDRESS_HI)
>> +#define msi_data_reg(base, is64bit) \
>> +    (((is64bit) == 1) ? (base) + PCI_MSI_DATA_64 : (base) + 
>> PCI_MSI_DATA_32)
>> +#define msi_mask_bits_reg(base, is64bit)                \
>> +    (((is64bit) == 1) ? (base) + PCI_MSI_MASK_BIT       \
>> +                      : (base) + PCI_MSI_MASK_BIT - 4)
> 
> ... drop the bogus == 1 in these two, making them similar to ...
> 
>>  #define msi_pending_bits_reg(base, is64bit) \
>> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
>> +    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> 
> ... this.
> 
>> +#define msi_disable(control) (control) &= ~PCI_MSI_FLAGS_ENABLE
> 
> Doesn't this need an outer pair of parentheses, too?
> 

Not necessarily. I'm in favour of a consistent style to be converted in. 
This also applies below.

>>  #define multi_msi_capable(control) \
>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>>  #define multi_msi_enable(control, num) \
>> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
>> -#define is_mask_bit_support(control)	(!!(control & 
>> PCI_MSI_FLAGS_MASKBIT))
>> +    (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> 
> And this, together with dropping the bogus semicolon?
> 

I'll drop the semicolon.

> There also look to be cases where MASK_EXTR() / MASK_INSR() would want 
> using,
> in favor of using open-coded numbers.
> 

Yes, perhaps. However, the risk that I make some mistakes in doing so 
are quite high, though.

>> +#define is_64bit_address(control) (!!((control) & 
>> PCI_MSI_FLAGS_64BIT))
>> +#define is_mask_bit_support(control) (!!((control) & 
>> PCI_MSI_FLAGS_MASKBIT))
>>  #define msi_enable(control, num) multi_msi_enable(control, num); \
>> -	control |= PCI_MSI_FLAGS_ENABLE
>> -
>> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
>> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
>> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
>> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
>> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
>> -#define msix_table_size(control) 	((control & 
>> PCI_MSIX_FLAGS_QSIZE)+1)
>> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
>> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
>> +                                 (control) |= PCI_MSI_FLAGS_ENABLE
> 
> This again is suspiciously missing outer parentheses; really here, with
> the earlier statement, it look like do { ... } while ( 0 ) or ({ ... })
> are wanted.
> 
>> +#define msix_control_reg(base)       ((base) + PCI_MSIX_FLAGS)
>> +#define msix_table_offset_reg(base)  ((base) + PCI_MSIX_TABLE)
>> +#define msix_pba_offset_reg(base)    ((base) + PCI_MSIX_PBA)
>> +#define msix_enable(control)         (control) |= 
>> PCI_MSIX_FLAGS_ENABLE
>> +#define msix_disable(control)        (control) &= 
>> ~PCI_MSIX_FLAGS_ENABLE
> 
> Outer parentheses missing for these two again?
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

