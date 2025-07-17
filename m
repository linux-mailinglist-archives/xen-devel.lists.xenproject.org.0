Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F050BB087E1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046377.1416690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJyo-00013S-Ja; Thu, 17 Jul 2025 08:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046377.1416690; Thu, 17 Jul 2025 08:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJyo-00011I-Fx; Thu, 17 Jul 2025 08:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1046377;
 Thu, 17 Jul 2025 08:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FsC8=Z6=bounce.vates.tech=bounce-md_30504962.6878b431.v1-834dca6ac82f42b1b4c34084e8dbe1b4@srs-se1.protection.inumbo.net>)
 id 1ucJyn-00011B-37
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:28:37 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0795740f-62e8-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 10:28:35 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bjR016lHrz8XRqR8
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 08:28:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 834dca6ac82f42b1b4c34084e8dbe1b4; Thu, 17 Jul 2025 08:28:33 +0000
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
X-Inumbo-ID: 0795740f-62e8-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752740913; x=1753010913;
	bh=nWZRmo01kkQQ0KNIieI7ztkt3BvH6E7DtTrgmkz4ldM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HMKpD1NybuXXrWEW36FbglNcGGfvBUQXSJz/1Wn7uS6JH5UaCxTMMtkU4OwQ/vv1g
	 xZ4d5uJ6/+bZ14gM01CI9ysE8a9z0DuzfmV1YKcrKRA9dwRw8m+iAzyPXaWKsNgl72
	 GIq1WgyAaNP2lp3OZX9mPJiK/wRAjycqwN5oKvxN//0yO4XMV6F/yarxQYcNBjm1oA
	 Hs1pNcKedg8gBGlFpl9/M3wpRIbU/opPU9kFEjCTkvtaef6GJ6Conn9Ewx7pylTsQU
	 Ojv3AP4dUQhUlqK0F9yaHfhsBn3/3D+a2UlQRJHVBWRxYUtRXmQOsltuHfwbyDvQrq
	 7CrwyRAD5NkIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752740913; x=1753001413; i=yann.sionneau@vates.tech;
	bh=nWZRmo01kkQQ0KNIieI7ztkt3BvH6E7DtTrgmkz4ldM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PniRwn7uID1uhpt/Juuch8uSg8WC/vMfq4UhgeeGoZsub5gYJjjkOYIh4GytjRL0i
	 lQAYnOpvmfsx+dlNiebd/3Pr97fe1RqDDt6iizNNcwEBrfB3wiBGM3K1jUCc6/iMhc
	 cU2NHGTmTXU0igjceMqpS0yeEP+e6nOdp3aX1nNoI6Sf3w47CUVedo9zWIGYUqaZE6
	 3nrR7I6c3l8LovxfV3Tdkm5yo3SP4pc6yi2ilXzjb2VS5mcaXDcbLb2ZXMzd/t2U2z
	 Aglb6zg/XfvoUfe1b4tNBbRko1c1ZAwKFLYUSz0wr+s4n8NC+lVeYUU8wcY7tLvnTi
	 kFkmPeYzkYN6A==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20xen.efi=20has=20MEM=5FDISCARDABLE=20flag=20in=20Characteristics=20field=20of=20.reloc=20section?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752740912856
Message-Id: <06ad1fe7-cc79-4976-8748-318a7f8f2b45@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: yann@sionneau.net, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>, nickc@redhat.com, "Demi Marie Obenour" <demiobenour@gmail.com>
References: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com> <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com> <7a7f40b8-5d73-421a-9358-30421d12a243@vates.tech> <2e1d2e67-ac14-4cb7-a6ea-4351d1418be9@suse.com>
In-Reply-To: <2e1d2e67-ac14-4cb7-a6ea-4351d1418be9@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.834dca6ac82f42b1b4c34084e8dbe1b4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250717:md
Date: Thu, 17 Jul 2025 08:28:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/17/25 10:22, Jan Beulich wrote:
> On 17.07.2025 09:32, Yann Sionneau wrote:
>> Hello Demi Marie, Jan, Nick, all,
>>
>> Thank you Demi Marie for bringing this topic on the mailing list.
>>
>> I discussed it a bit with Jan on Matrix but the situation is not pretty,
>> there is no clean solution that stands out easily.
>>
>> As Jan said, it seems .reloc is meant to be discardable, so we can't
>> blame binutils LD for putting it:
>>
>> https://github.com/bminor/binutils-gdb/commit/25c80428af3311e761c87d8f706596b9701602ec#diff-078cf751467928c038996b40073a682425712b9b01182424e68cf18fb08a75b5R953-R977
>>
>> And we can't obviously blame the loaders for honoring this flag.
>>
>> Most reasonable solution indeed would be to ask binutils to add a link
>> flag to say "please do not put the DISCARDABLE flag on the .reloc section"
>>
>> I'm adding Nick Clifton from binutils in CC so that he can comment on
>> this possible outcome or any other possible solution.
>>
>> In the mean time, while waiting for a solution to emerge (and be merged,
>> and released) what do we do?
>>
>> Do we put some hack in Xen build Makefiles so that xen.efi is
>> post-processed to strip this bit?
>>
>> This could be the temporary solution.
> 
> As indicated - I don't think this is just a temporary solution. Beyond Xen,
> I simply don't see value in adding a linker flag (which then, sooner or
> later, llvm would also need to support just for Xen). The question rather
> is how to make the Xen side hack as little hacky as possible, without
> relying on the fragile behavior of objcopy.
> 
> Jan
> 

Ok I didn't understand your previous answer, it's more clear now, thank you.
Would you consider using a tool like this less fragile than objcopy: 
https://github.com/fallen/keeprelocs ?

Regards,

PS: sorry for earlier top posting, my Thunderbird was badly configured 
(new computer).

-- 
Yann


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


