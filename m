Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3AC22BF4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 00:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153979.1484154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEcUH-0003US-9l; Thu, 30 Oct 2025 23:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153979.1484154; Thu, 30 Oct 2025 23:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEcUH-0003TG-78; Thu, 30 Oct 2025 23:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1153979;
 Thu, 30 Oct 2025 23:55:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vEcUF-0003T8-DH
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 23:55:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vEcUD-009fbb-1F;
 Thu, 30 Oct 2025 23:55:21 +0000
Received: from [2a02:8012:3a1:0:91df:22e1:df64:1ce]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vEcUD-00G5ul-1H;
 Thu, 30 Oct 2025 23:55:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+H9TloTpuO+4W0z1kfiykk4dwSxPpmZYsYXVlIwpCko=; b=ZGc17raGNvtHJ8aWnR5+erjO/8
	xHVYRdaCOaBl74xK1nfbmQ3spjECWfh+VIw0zkRsxN/e8yRt+p5+jVVAyUO1Pc1LKrL8HLSa8Cr8v
	Kw6VT/vgA8U+FeK870SxGNRcQfCLwIxpmUGkEYtFDBp+GtM9cy9+12c8AHBDFsVBlyqI=;
Message-ID: <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
Date: Thu, 30 Oct 2025 23:55:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Limitations for Running Xen on KVM Arm64
Content-Language: en-GB
To: Mohamed Mediouni <mohamed@unpredictable.fr>, haseeb.ashraf@siemens.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mohamed,

On 30/10/2025 18:33, Mohamed Mediouni wrote:
> 
> 
>> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>>
>> Adding @julien@xen.org and replying to his questions he asked over #XenDevel:matrix.org.
>>
>> can you add some details why the implementation cannot be optimized in KVM? Asking because I have never seen such issue when running Xen on QEMU (without nested virt enabled).
>> AFAIK when Xen is run on QEMU without virtualization, then instructions are emulated in QEMU while with KVM, ideally the instruction should run directly on hardware except in some special cases (those trapped by FGT/CGT). Such as this one where KVM maintains shadow page tables for each VM. It traps these instructions and emulates them with callback such as handle_vmalls12e1is(). The way this callback is implemented, it has to iterate over the whole address space and clean-up the page tables which is a costly operation. Regardless of this, it should still be optimized in Xen as invalidating a selective range would be much better than invalidating a whole range of 48-bit address space.
>> Some details about your platform and use case would be helpful. I am interested to know whether you are using all the features for nested virt.
>> I am using AWS G4. My use case is to run Xen as guest hypervisor. Yes, most of the features are enabled except VHE or those which are disabled by KVM.
> 
> 
> Hello,
> 
> You mean Graviton4 (for reference to others, from a bare metal instance)? Interesting to see people caring about nested virt there :) - and hopefully using it wasn’t too much of a pain for you to deal with.
> 
>>
>> ; switch to current VMID
>> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for current VMID
>> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range for current VMID
>> dsb ish
>> isb
>> ; switch back the VMID
>>      • This is where I am not quite sure and I was hoping that if someone with Arm expertise could sign off on this so that I can work on its implementation in Xen. This will be an optimization not only for virtualized hardware but also in general for Xen on arm64 machines.
>>
> 
> Note that the documentation says
> 
>> The invalidation is not required to apply to caching structures that combine stage 1 and stage 2 translation table entries.
> 
> for TLBIP RIPAS2E1
>>      • The second place in Xen where this is problematic is when multiple vCPUs of the same domain juggle on single pCPU, TLBs are invalidated everytime a different vCPU runs on a pCPU. I do not know how this can be optimized. Any support on this is appreciated.
> 
> 
> One way to handle this is every invalidate within the VM a broadcast TLB invalidate (HCR_EL2.FB is what you’re looking for) and then forego that TLB maintenance as it’s no longer necessary. This should not have a practical performance impact.

To confirm my understanding, you are suggesting to rely on the L2 guest 
to send the TLB flush. Did I understanding correctly? If so, wouldn't 
this open a security hole because a misbehaving guest may never send the 
TLB flush?

Cheers,

-- 
Julien Grall


