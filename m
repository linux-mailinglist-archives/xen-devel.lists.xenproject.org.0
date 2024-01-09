Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36C82849C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 12:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664494.1034616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNA3Z-0001Bu-KN; Tue, 09 Jan 2024 11:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664494.1034616; Tue, 09 Jan 2024 11:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNA3Z-0001AL-Hj; Tue, 09 Jan 2024 11:14:05 +0000
Received: by outflank-mailman (input) for mailman id 664494;
 Tue, 09 Jan 2024 11:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zgx0=IT=appli.se=niklas@srs-se1.protection.inumbo.net>)
 id 1rNA2q-00011T-OR
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 11:13:21 +0000
Received: from smtp-relay.appli.se (smtp-relay.appli.se [192.71.5.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1628ec7f-aee0-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 12:13:16 +0100 (CET)
Received: from smtp-relay.appli.se (localhost [127.0.0.1])
 by smtp-relay.appli.se (OpenSMTPD) with ESMTP id 1f2b035c;
 Tue, 9 Jan 2024 12:13:14 +0100 (CET)
Received: from smtpclient.apple (host.212.105.90.44.bitcom.se [212.105.90.44])
 by smtp-relay.appli.se (OpenSMTPD) with ESMTPSA id 77115c18
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO); 
 Tue, 9 Jan 2024 12:13:14 +0100 (CET)
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
X-Inumbo-ID: 1628ec7f-aee0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=appli.se; h=content-type
	:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=default;
	 bh=0SkVlyUxtdTh4zBzxcCG1PaGoR4=; b=pnyif7VdUUQmEq9Hq4DQ+saKU+j2
	cq4/Pgv7ccTWxKjFYZ5i0GYjnhSGi1JK+HVm0InHD5Z50QkssjQTxQG2X/Psi6gV
	cXjbFXmy17xPFihL2sRxbWPr0YW2T8Lxe9yvSoBDWYbWK8E8yoAJ3KuDZSh6XMxV
	5l7krq1plmDupdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=appli.se; h=content-type
	:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; q=dns; s=
	default; b=OoICKPBMjQ0PMzBrEbK0vby5C53EtP984s24304GYoHhTyQOxNVzd
	S7lxRYhmEC9Bk5smH9cuS7VWytoquhv1HKTytFNxq2t2Xo9cIaUCKkFFhtLP0NUp
	qSRm618omVzO8DUhQTDrdp9V8OtoA6EP+aNI1alg89x3Xs6wkJovi0=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
From: Niklas Hallqvist <niklas@appli.se>
In-Reply-To: <CAKhsbWZM3y7D=vQzng3GndQOzhx5RcDHWFVXdJZhCt-qz5CtwQ@mail.gmail.com>
Date: Tue, 9 Jan 2024 12:13:04 +0100
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Leiber <paul@onlineschubla.de>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DCF59D19-59C2-43E9-9F25-7F64FFF691F7@appli.se>
References: <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
 <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
 <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
 <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de>
 <Y2OwzjfUnCFf2EDU@Air-de-Roger>
 <CAKhsbWZM3y7D=vQzng3GndQOzhx5RcDHWFVXdJZhCt-qz5CtwQ@mail.gmail.com>
To: "G.R." <firemeteor@users.sourceforge.net>
X-Mailer: Apple Mail (2.3774.100.2.1.4)

> On 14 Dec 2022, at 07:16, G.R. <firemeteor@users.sourceforge.net> =
wrote:
>=20
> On Thu, Nov 3, 2022 at 8:37 PM Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com> wrote:
>>>>> Roger.
>>>> Hi Roger, any news for the upstream fix? I haven't heard any news =
since...
>>>> The reason I came back to this thread is that I totally forgot =
about
>>>> this issue and upgraded to FreeNAS 13 only to rediscover this issue
>>>> once again :-(
>>>>=20
>>>> Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?
>>>>=20
>>>> Thanks,
>>>> G.R.
>>>>=20
>>>=20
>>> Hi,
>>>=20
>>> I want to confirm that the patch in an official release would make =
quite some people very happy. E.g. among OPNsense users, there are some =
who
>>> suffer from the network issue [1]. FWIW, I compiled a kernel =
including Roger's patch, and it seems to be working without trouble in =
my OPNsense DomU.
>>=20
>> Hello to both,
>>=20
>> Sorry, I completely dropped the ball on that patch, didn't even
>> remember I had it pending :(.
>>=20
>> Will do a build test with it and commit later today, I don't think I
>> will get any feedback, and it seems to improve the situation for your
>> use-cases.
>=20
> Hi Roger,
> Just another query of the latest status. It'll be great if you can
> share a link to the upstream commit.
> I'm thinking of asking for a back-port of your fix to the FreeNAS
> community, assuming it will take a long time to roll out otherwise.
>=20
> Thanks,
> G.R.
>=20
>>=20
>> Thanks, Roger.
>=20
>=20

Hi everyone!

So did anything ever happen on this?  I find myself in the same =
situation with TrueNAS core 13, and can=E2=80=99t see any signs of =
changes in the FreeBSD 13 branches.

G.R: Did you ever build a kernel for TrueNAS 13?  Care to share it?  I =
don=E2=80=99t have a build environment setup, so I thought I=E2=80=99d =
just try to ask :-)

/Niklas


