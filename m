Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E03C635CB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163584.1490665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvvA-0005OA-NQ; Mon, 17 Nov 2025 09:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163584.1490665; Mon, 17 Nov 2025 09:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvvA-0005Li-Kf; Mon, 17 Nov 2025 09:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1163584;
 Mon, 17 Nov 2025 09:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysB8=5Z=bounce.vates.tech=bounce-md_30504962.691af07f.v1-1639b5a3a34b456ab604e4a9394eca3d@srs-se1.protection.inumbo.net>)
 id 1vKvv9-0005Lb-6A
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:53:15 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3676a689-c39b-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 10:53:05 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d932l5MrtzCf9P12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 09:53:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1639b5a3a34b456ab604e4a9394eca3d; Mon, 17 Nov 2025 09:53:03 +0000
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
X-Inumbo-ID: 3676a689-c39b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763373183; x=1763643183;
	bh=TW+q7kz4pFqGUtX1qvXQLNZWq7C5KLYfbBXF5HZjESY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RT86bXjjmmobxBLQ6QdF5HBWeZUo5Tac0p4e7tUMx3vKqeREr9iON8nd3taHwsTp7
	 P7XvhwRpQoa/oj1fjM1yh8BegVmUIa6b/JSacj7jgNHimQZGqmn+YA3nmIgGpUxddv
	 //HUxB5xyYxMucaHHc2gjN3OoUO4xpbqURf+TF/nU5SC00cfKxfpNPct/I/YcwQ9xU
	 XvU1OMIBtk676VbvztyMRRno5n2+eQ7iUkOOol3dfHa+kXL6eOzjSI5bU9eK41SkE3
	 kqtW1cCKGtqY9Bv52N8JT9wLiFlhtSavCR6My8rInftg3tbwSVAMYNu/MhIyNgWSIe
	 iOvDSzM0HCWMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763373183; x=1763633683; i=teddy.astie@vates.tech;
	bh=TW+q7kz4pFqGUtX1qvXQLNZWq7C5KLYfbBXF5HZjESY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=I7rs0N2nMDtBabW71h9gMTwKqXTHk3+EwWuhFwPIh7gnvmhJ5EG1c0Co+4CGBgQKO
	 OgmbRmYgwPMC4p3vyToTgNqQKb6zQVtFapCAjfe0enYvvIu4kLTdnsHJ4HOmZhO8Xl
	 r/tS4BG41L7nyuINKwc+1Pc/E/Y8q7jzPGwY+4VGFpH0m4EXAX1u/GqRKcyWMg4ho/
	 Z5MU/ujUENMtagn6q8UT27e3oXWH6NPuIHzlRVl3ZPyAm1dRZMBxNzMpqU3kJfh9Cn
	 6A4LOV20C513v0GaRpfvt1PJ5DPHsp/TCEhPX07JsfNEyPAWT3ASCYfE1GHo0z0YOS
	 eaCqJSduEAotg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20ioreq:=20Check=20for=20out=20of=20bounds=20vCPU=20ID?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763373182364
Message-Id: <7128231e-8f52-49f1-9dfe-606616d11158@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech> <fadc4456-17d1-4ba5-9623-db928238f3b8@suse.com>
In-Reply-To: <fadc4456-17d1-4ba5-9623-db928238f3b8@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1639b5a3a34b456ab604e4a9394eca3d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 09:53:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 17/11/2025 =C3=A0 10:29, Jan Beulich a =C3=A9crit=C2=A0:
> On 14.11.2025 17:32, Teddy Astie wrote:
>> A 4K page appears to be able to hold 128 ioreq entries, which luckly
>> matches the current vCPU limit. However, if we decide to increase the
>> vCPU limit, that doesn't hold anymore and this function would now
>> silently fetch a out of bounds pointer.
>>
>> All architectures have no more than 128 as vCPU limit on HVM guests,
>> and have pages that are at most 4 KB, so this case doesn't occurs in
>> with the current limits.
> 
> DYM "at least 4 KB"? If there was an arch with 2k pages but 128 vCPU limi=
t,
> it would be affected, wouldn't it?
> 

Yes, made some typo here

>> Make sure that out of bounds attempts are reported and adjust the around
>> logic to at worst crash the offending domain instead.
> 
> Wouldn't we better prevent creation of such guests? And point out the nee=
d
> to adjust code by a build-time check?
> 

So overall just

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..7a0421cc07 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, 
struct vcpu *v)

      ASSERT((v =3D=3D current) || !vcpu_runnable(v));
      ASSERT(p !=3D NULL);
+    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));

      return &p->vcpu_ioreq[v->vcpu_id];
  }

>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -100,7 +100,14 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, s=
truct vcpu *v)
>>       ASSERT((v =3D=3D current) || !vcpu_runnable(v));
>>       ASSERT(p !=3D NULL);
>>   
>> -    return &p->vcpu_ioreq[v->vcpu_id];
>> +    if ( likely(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq))) )
>> +        return &p->vcpu_ioreq[v->vcpu_id];
> 
> Imo you then also need to use array_access_nospec() here.
> 
>> +    else
>> +    {
>> +        gprintk(XENLOG_ERR, "Out of bounds vCPU %pv in ioreq server\n",=
 v);
>> +        WARN();
>> +        return NULL;
>> +    }
>>   }
> 
> While I'm generally arguing against such needless uses of "else", this on=
e
> is imo a particularly bad example. The brace-enclosed scope give the stro=
ng
> (but misleading) impression that the function is lacking a trailing "retu=
rn".
> 
> Jan
> 




--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



