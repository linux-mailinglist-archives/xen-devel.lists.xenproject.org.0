Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B77C336F3
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 01:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155925.1485267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGQzF-0007Oj-81; Wed, 05 Nov 2025 00:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155925.1485267; Wed, 05 Nov 2025 00:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGQzF-0007NG-5R; Wed, 05 Nov 2025 00:02:53 +0000
Received: by outflank-mailman (input) for mailman id 1155925;
 Wed, 05 Nov 2025 00:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09oY=5N=bounce.vates.tech=bounce-md_30504962.690a9422.v1-8762eb93b4e846d182a0b8b2f4224069@srs-se1.protection.inumbo.net>)
 id 1vGQzC-0007NA-Ht
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 00:02:50 +0000
Received: from mail132-29.atl131.mandrillapp.com
 (mail132-29.atl131.mandrillapp.com [198.2.132.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c6cb83-b9da-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 01:02:44 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-29.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4d1QW64yM3z7lmFT0
 for <xen-devel@lists.xenproject.org>; Wed,  5 Nov 2025 00:02:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8762eb93b4e846d182a0b8b2f4224069; Wed, 05 Nov 2025 00:02:42 +0000
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
X-Inumbo-ID: c0c6cb83-b9da-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762300962; x=1762570962;
	bh=GOeejd4Z1hffN8ONQg2k3fMMI9NhYPCGOfRt4h2Y+g4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HNHuCkFjRJ6dat61nJfyqz2dAWkldfxMvfnpTbZOFkxxMmFhRyqyV7ORpMBT+MPup
	 q6x5uNm//A9ODbyNP/l2p4Fx2fLpwXhlYpZg9Wzrt85yCDjSddV0YsVSDljQgOk/+m
	 dg486NkfgziJkMR1YpDmW2JYb2e5yINKfeoM+w+sRfNpf03+BiScoKygJKWM/lZijz
	 mP1vbqseFTlN2YxyldEg9/3Joc5t+kMLtEmaPUpQ/tjT85dDNFzSov+/c7JjE35+0d
	 dLeNSyWIHZLBcyDOJzxUsuWGV6iBlKEyQ48eNbiuJpLxXtwt6RORaSF+U8FLuDvzwb
	 i48+65fKXzQNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762300962; x=1762561462; i=ngoc-tu.dinh@vates.tech;
	bh=GOeejd4Z1hffN8ONQg2k3fMMI9NhYPCGOfRt4h2Y+g4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GqE9+k9ur8Qsk4bUehkQgDpDgGkgpA3EATAQym2TL1gdcIsxei+knjyxGlqaKo3Qn
	 ik15bsIJ27DeOLWW8sYA1QtE3glQtr0AnF11wtRO9VKh8mLU4C1J2tDkF5A7MgYOwi
	 RhCwSfIfm0cEs6QAEd1/aHsQls7KPuTHBcDAa77ZsNGVmaKiL8fGJ54FlFMUTJ7eR4
	 qBSgYZQAcQylv+o+DzFBiUhBFUFJtEHcOlMOO4r9ozEYJ+dGJV/32RMyWE4qI2ZtUC
	 8reD6mGVe/92kGjflFSasf+gXgzaMs/6Wl01lSHEhAjj9KF1a5uUicZ6dKFEHhRm6G
	 8ACJdlZvcKtiw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20acpi:=20Set=20TPM2=20LAML=20to=20actual=20log=20area=20size?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762300961662
Message-Id: <e6dbb09f-e7a3-40e1-83b4-0e0904dfbc1c@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Daniel Smith" <dpsmith@apertussolutions.com>
References: <20251104161230.22789-1-ngoc-tu.dinh@vates.tech> <fa368639-41f4-4e6d-8f43-0e5d774b9add@citrix.com>
In-Reply-To: <fa368639-41f4-4e6d-8f43-0e5d774b9add@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8762eb93b4e846d182a0b8b2f4224069?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251105:md
Date: Wed, 05 Nov 2025 00:02:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/11/2025 18:11, Andrew Cooper wrote:
> On 04/11/2025 4:12 pm, Tu Dinh wrote:
>> The LAML field should follow the TCG PFP specification:
>>
>> The TCG ACPI specification uses the field name "Log Area Minimum
>> Length", but the field value is the actual log area length reserved by
>> Platform Firmware, not a lower bound.
>>
>> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
>> ---
>>   tools/libacpi/build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
>> index 2f29863db1..95188e217e 100644
>> --- a/tools/libacpi/build.c
>> +++ b/tools/libacpi/build.c
>> @@ -473,7 +473,7 @@ static int construct_secondary_tables(struct acpi_ct=
xt *ctxt,
>>               tpm2->platform_class =3D TPM2_ACPI_CLASS_CLIENT;
>>               tpm2->control_area_address =3D TPM_CRB_CTRL_REQ;
>>               tpm2->start_method =3D TPM2_START_METHOD_CRB;
>> -            tpm2->log_area_minimum_length =3D TPM_LOG_AREA_MINIMUM_SIZE=
;
>> +            tpm2->log_area_minimum_length =3D TPM_LOG_SIZE;
> 
> These happen to be the same number, but in making this change
> TPM_LOG_AREA_MINIMUM_SIZE becomes unused.
> 
> I suggest we delete the constant while at it.=C2=A0 I don't think anythin=
g
> good can come from having two of them.

Agreed.

> 
> Also, as it's no functional change, this is content for 4.22 I presume?
Yes, it's for 4.22.

> 
> ~Andrew
> 



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



