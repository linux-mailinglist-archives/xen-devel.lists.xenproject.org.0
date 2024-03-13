Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA387A8C8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692441.1079572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP3Z-0005c8-9m; Wed, 13 Mar 2024 13:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692441.1079572; Wed, 13 Mar 2024 13:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP3Z-0005aO-7E; Wed, 13 Mar 2024 13:54:09 +0000
Received: by outflank-mailman (input) for mailman id 692441;
 Wed, 13 Mar 2024 13:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDzJ=KT=bounce.vates.tech=bounce-md_30504962.65f1affb.v1-2dd9f1f997894d55b7f668cd4a9fc651@srs-se1.protection.inumbo.net>)
 id 1rkP3X-0005aI-Jy
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:54:07 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 276d3f65-e141-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 14:54:05 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4TvsSC0wGdzB5p4x5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 13:54:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2dd9f1f997894d55b7f668cd4a9fc651; Wed, 13 Mar 2024 13:54:03 +0000
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
X-Inumbo-ID: 276d3f65-e141-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710338043; x=1710598543;
	bh=psve3gBLj3dQSMIfovgUuJgDvkc6PpGa0A4J3Xz7F8M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WBVMp/K1V9z7Ko/Nb9vFOgJvO0VZyZU38x8kNmB+4FLL1u+xMuhnL4Ac0zngxEiG4
	 3fXfh9HTwsWuRmtguFf3OWKxT3iR4LI+vKTtcAb7monFrk0F+nkLveIBMwG4flYvtR
	 Di/QdIbQJxn2Cp4Qx7ODI4/PvYiMwurejdw6KjZlVo+v4tQ1n9uFXRWbWJC6GEmrui
	 agDGmwJ5JQiOAumpjWwq4nsJJcQLH1KENjq8sN+6x1evZKsWC3cnXB4m/iMN7Fcr6j
	 GiKf44kj0U/MAFxK7dvp4oH2gpGVsY+46Kt79FW37zD8pXpLUGrECAHx6RoCRggUvA
	 g1pw3jT1kcmBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710338043; x=1710598543; i=vaishali.thakkar@vates.tech;
	bh=psve3gBLj3dQSMIfovgUuJgDvkc6PpGa0A4J3Xz7F8M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JQTB5cdqvptB9FkX859F6OV+9SY96bhRMCQUn4me6W9ia/cujUx+vKaZQKiQ8lFdR
	 rWI0K0M5Rd9l1rNPpS2qHBiKzPsA5cTKzZUXQmOfhK5KfIyBKkwv3ByLhzkTIjXJRl
	 BmCyl1omtWgu9FXryfESrbBO9zbvGp/aSSntmh3Ji6H42tfkGkatCNBDclNuA2DHNF
	 6OPPPtaLkJuG111omyG+fPiw9GYXY8rT9FTpHattM3lwM6AF8VXW0SSTrhnXcYxpep
	 nvWFlnv6PoDjWO9GUETd4knqC8qthLWl4vQEEhartfaydGhySvpIfEAXKVfMWEQFdl
	 ItfuuvQ416guw==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=203/3]=20x86/svmdebug:=20Print=20sev=20and=20sev=5Fes=20vmcb=20bits?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710338041482
Message-Id: <04e6cbd2-4235-4972-9f14-dd96ca3a3515@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech> <0e688a18a97e495352e2b08cb7634abbc238da1b.1710149462.git.vaishali.thakkar@vates.tech> <708aad8c-cf06-4a1d-b2d2-d4405cc19213@suse.com>
In-Reply-To: <708aad8c-cf06-4a1d-b2d2-d4405cc19213@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2dd9f1f997894d55b7f668cd4a9fc651?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240313:md
Date: Wed, 13 Mar 2024 13:54:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/24 09:05, Jan Beulich wrote:
> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>> While sev and sev_es bits are not yet enabled in xen,
>> including their status in the VMCB dump could be
>> informational.Therefore, print it via svmdebug.
> 
> Yet there are more bits there. I'm okay with leaving off printing of
> them here, but it wants clarifying why some are printed and some are
> not.

Well, the idea is to print the bits that are either enabled or has WIP
to enable them. (e.g. sev and sev_es) I didn't include other bits as
I'm not sure if there is any WIP to enable them. Particularly including
sev and sev_es is useful for us while working on the enablement of it.

Does a commit log like the following makes it clear for you?

" Currently only raw _np_ctrl is being printed. It can
   be informational to know about which particular bits
   are enabled. So, this commit adds the bit-by-bit decode
   for np, sev and sev_es bits.

   Note that while only np is enabled in certain scenarios
   at the moment, work for enabling sev and sev_es is in
   progress. And it's useful to have this information as
   part of svmdebug. "

I'm also fine with including other bits here if that's preferred.

>> --- a/xen/arch/x86/hvm/svm/svmdebug.c
>> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
>> @@ -51,8 +51,11 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>              vmcb->exitcode, vmcb->exit_int_info.raw);
>>       printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
>>              vmcb->exitinfo1, vmcb->exitinfo2);
>> -    printk("np_ctrl = %#"PRIx64" asid = %#x\n",
>> -           vmcb_get_np_ctrl(vmcb), vmcb_get_asid(vmcb));
>> +    printk("asid = %#x np_ctrl = %#"PRIx64" - %s%s%s\n",
>> +           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
>> +           vmcb_get_np(vmcb)     ? "NP"     : "",
>> +           vmcb_get_sev(vmcb)    ? "SEV"    : "",
>> +           vmcb_get_sev_es(vmcb) ? "SEV_ES" : "");
> 
> Each of these three string literals needs a leading blank as separator.
> In exchange the one in the format string immediately after '-' then
> will want dropping. That'll still lead to slightly odd output if none
> of the bits is set; imo it would be slightly less odd if you used
> 
>      printk("asid = %#x np_ctrl = %#"PRIx64":%s%s%s\n",
> 
> instead.
> 
> Jan

