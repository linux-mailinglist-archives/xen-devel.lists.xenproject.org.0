Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B795B0F1BC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053833.1422627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY5q-0005zl-JT; Wed, 23 Jul 2025 11:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053833.1422627; Wed, 23 Jul 2025 11:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY5q-0005xS-GZ; Wed, 23 Jul 2025 11:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1053833;
 Wed, 23 Jul 2025 11:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0Ki=2E=bounce.vates.tech=bounce-md_30504962.6880ce0d.v1-fb7ca6fa8e444f4eb3876e615206c4b2@srs-se1.protection.inumbo.net>)
 id 1ueY5o-0005xL-Ro
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:57:04 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25246a04-67bc-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 13:57:03 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4bnCKn6ns0zNCd9Rc
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 11:57:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb7ca6fa8e444f4eb3876e615206c4b2; Wed, 23 Jul 2025 11:57:01 +0000
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
X-Inumbo-ID: 25246a04-67bc-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753271821; x=1753541821;
	bh=o9liH4uvbp+WlVQQHEW0ezOUzaHQGdIEZhIzyK5zqOI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FdhOtawAZyfFp1jQhNn2wQGSNHsERTxglKEb/nZLichBPQnvRK0B5R+ZuaMvpOTh1
	 pEo8zo9pcP4yWdJP+/lZXjEX2jiZ9Ii8lmBIT9B5HyizwvlpFULjQaXy2UUYoJxP/6
	 UUAee2cuoTTLi68akaOhxfm4mZS6Hc4SrHJMXFcZPVyg1fYa42z7b9D2TUAToGLtVt
	 B8a2oSBVou8NLhrYh+kSliKumTcuo5+9Mypeuik+oRC0uTsCpt4/BqVOlYQ+9NgDts
	 Uu1ppcjKERl0ed/7v1MK40tdFwHsYoLuFnS1pc2/z2p8V8jaTtVQ0FrSmMrWfi8oTG
	 OK6HIYRLFNijQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753271821; x=1753532321; i=teddy.astie@vates.tech;
	bh=o9liH4uvbp+WlVQQHEW0ezOUzaHQGdIEZhIzyK5zqOI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s+4nbkQ0vAKv7CnFk0I/Iy+FcHzRY7xIB/qgAhhzgPn6DcgzH38jmd5RISF9tAnHE
	 N7r+75gJMlG45OBlW7PMJ4SbUFZisBOa2zGWZGgfISJ23sSBTNaGfTA3lQaPjdSWXM
	 A4K7klkJX+Bn9S/VK75iyDanXlbnpqUZ8hi4wWpsKRKu1ghm0yB7vf/zO9X0h7nP6u
	 2z6CxUTQMxPMOtw0wMZAxSZ4gzK9AlgDUSTI8Jl5jYADKJ8zzf4kPV+4F6E0wFBp6r
	 8iRXS3J+wNNJWuzVhynCFb4X2vNqt4keTu6OQUIFDUQlmLtt/8P2+scMExcRTkdPUG
	 /iYrgKCZ/m+xg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20x86/hvm:=20Replace=20do=5Fsched=5Fop=20calls=20with=20their=20underlying=20logic?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753271820674
Message-Id: <477216c8-f31d-4f85-a743-aeba6d434ee0@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Paul Durrant" <paul@xen.org>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>
References: <584b490f7f26a746fd2c74be977a4769f73880bb.1753261165.git.teddy.astie@vates.tech> <01989510-d034-4a36-bced-fda8b8dbb537@citrix.com>
In-Reply-To: <01989510-d034-4a36-bced-fda8b8dbb537@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb7ca6fa8e444f4eb3876e615206c4b2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 11:57:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/07/2025 =C3=A0 13:16, Andrew Cooper a =C3=A9crit=C2=A0:
> On 23/07/2025 10:05 am, Teddy Astie wrote:
>> do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirecti=
on
>> through the hypercall handler and use the function directly.
>>
>> Perform the same for SCHEDOP_block.
>>
>> Not a functional change.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> v2:
>>   - For SCHEDOP_block case: export and use vcpu_block_enable_events inst=
ead
> 
> You need to adjust the commit message for this change, now that you're
> exporting vcpu_block_enable_events().
> 
> With that adjusted, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com=
>
> 
> If there are no other changes needed, you can propose some updated
> wording here and it can be adjusted on commit.
> 

Are you ok with

Export vcpu_block_enable_events() to perform the same for SCHEDOP_block.

(in place of "Perform the same for SCHEDOP_block")

?

> ~Andrew

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



