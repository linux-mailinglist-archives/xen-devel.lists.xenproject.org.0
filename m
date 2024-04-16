Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8088A6E8B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 16:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707015.1104479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjwn-0005Ck-Rf; Tue, 16 Apr 2024 14:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707015.1104479; Tue, 16 Apr 2024 14:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjwn-0005BN-NS; Tue, 16 Apr 2024 14:38:09 +0000
Received: by outflank-mailman (input) for mailman id 707015;
 Tue, 16 Apr 2024 14:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kra8=LV=bounce.vates.tech=bounce-md_30504962.661e8d4b.v1-b50749b7fbaa4738baeb90085588e487@srs-se1.protection.inumbo.net>)
 id 1rwjwl-00059y-Lm
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 14:38:07 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eefb9df7-fbfe-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 16:38:05 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJmqH32RKz8XRvwn
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 14:38:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b50749b7fbaa4738baeb90085588e487; Tue, 16 Apr 2024 14:38:03 +0000
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
X-Inumbo-ID: eefb9df7-fbfe-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713278283; x=1713538783;
	bh=/H6Rjn33MOJzmOOpE/KPOYcVOSwDAB7pmcdTpRjGUmc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FPhsFAlWce62MKTJHSKS9/j3O86ee70TNH84Cnr3ZPlrLwk7hHVV/8ZJ335p60MYM
	 g2KyRZV1xNS7nJEuWGhWpXfYC0Vdbmcret/zX447WlR2lPlxGKr713WcAuhnUc83N+
	 mpNVOi67u+L1SIYfeOHTE3kJEgdV+s+LigpkstELpcbFQNaP3bR7oBxcxzfqdeO1OI
	 c651tfDYhrRunI754TKuWOha4fapa9pGUesfLlFCZ34GZ5OA76RHxMa1Us+Ks8a6Jb
	 BXMANEnGJGy3cwBtKlqEaTSwMo6FongyBhbSuwOz1hRM9PhoZBnRMGMu8RhYKdWwQ8
	 FaLCqha1wEtwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713278283; x=1713538783; i=vaishali.thakkar@vates.tech;
	bh=/H6Rjn33MOJzmOOpE/KPOYcVOSwDAB7pmcdTpRjGUmc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p7riS9asuiOx8FqxdXfi/CF3Bd0FiXX/+kcA6Yy2/urbZOGYpJMeg++Gj5Fj3TstH
	 tgjSucu+aOPjS7NZICpPcuV4GnipioSRniYr7B6z1m3kKGmI+J0plmXc7b/uDKe9pX
	 uJawwHI7WGBy51eq25z+FmS+3UBbDTShBgyrT+IFRiTzedF+U1jx1E8ib1RphDAZbz
	 MyJfcGc9UNVM1AYkRaJqF7Y9PPcC+t6Kz+Ruabkg2HVBDr+6HW+dQqcnWgD16gDVDe
	 t7V7uPoLFPrqBfRJjzdKJOZhGLqs5JApZsE/pmcjvnPV+xbMqL0JDf/KUCT2sqt7AY
	 qUNuBF7CQ+VIQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Allow=20supplying=20a=20dynamic=20start=20ASID?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713278282198
Message-Id: <53ff98a5-f565-421b-aa0b-4d4c359e7bdf@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <0d4ef987825080715873360c8b41ebb467b7dfdf.1713257278.git.vaishali.thakkar@vates.tech> <4915dde3-e798-4eb8-addd-b65a417cf3de@citrix.com> <61871a46-255e-44a5-ab48-0d40c4d24e33@vates.tech>
In-Reply-To: <61871a46-255e-44a5-ab48-0d40c4d24e33@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b50749b7fbaa4738baeb90085588e487?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 14:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/16/24 4:25 PM, Vaishali Thakkar wrote:
> On 4/16/24 4:12 PM, Andrew Cooper wrote:
>> On 16/04/2024 9:54 am, Vaishali Thakkar wrote:
>>> Currently, Xen always starts the ASID allocation at 1. But
>>> for SEV technologies the ASID space is divided. This is
>>> because it's a security issue if a guest is started as
>>> ES/SNP and is migrated to SEV-only. So, the types are
>>> tracked explicitly.
>>>
>>> Thus, in preparation of SEV support in Xen, add min_asid
>>> to allow supplying the dynamic start ASID during the
>>> allocation process.
>>>
>>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
>>
>> Mechanically, this is fine, but is it going to be useful in the long ter=
m?
>>
>> For SEV and SEV-ES/SNP, we must run the VM in the single fixed ASID
>> negotiated with the ASP.=C2=A0 This is not not optional.
>>
>> For non-encrypted VMs, we are free to choose between using the remaining
>> ASID space as we used to (i.e. run it per-pCPU and tick it over to flush
>> the TLBs), or to run it in a fixed ASID per guest too.
>>
>> The latter lets us use INVLPGB, and would avoid maintaining two
>> different TLB-tagging schemes.
>>
>>
>> I'd say that we absolutely do want INVLPGB support for managing
>> non-encrypted VMs, and we cannot mix both fixed and floating ASIDs at
>> the same time.
> 
> I agree that having a both schemes at the time is not practical. And I've=
 
> some RFC patches in work to propose fixed ASID scheme for all domains 
> (encrypted or not) to start a discussion regarding that.
> 
> IMO, this patch is still useful because my idea was to then use min_asid
> as a holder to separate out the non-encrypted, encrypted space and SEV ES=
/
> SNP ASID space. If it's more easier to see the usefulness of this patch
> along with other asid fixes, I'm fine with putting it in that RFC patchse=
t.
> But I thought that this change was independent enough to be sent by
> itself.

s/encrypted/SEV

>> We should seriously consider whether it's worth maintaining two schemes,
>> or just switching wholesale to a fixed ASID scheme.
>>
>> I don't have a good answer here...=C2=A0 If it where anything but TLB
>> flushing, it would be an obvious choice, but TLB handling bugs are some
>> of the nastiest to show up.
>>
>> ~Andrew
> 
>


