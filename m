Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F26CB0ABF
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181982.1504937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1DL-00028V-1b; Tue, 09 Dec 2025 17:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181982.1504937; Tue, 09 Dec 2025 17:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1DK-00026A-V5; Tue, 09 Dec 2025 17:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1181982;
 Tue, 09 Dec 2025 17:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0hE=6P=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vT1DJ-000264-Hf
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:09:25 +0000
Received: from outbound.ms.icloud.com
 (p-west3-cluster2-host12-snip4-10.eps.apple.com [57.103.74.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce3a6ef4-d521-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 18:09:22 +0100 (CET)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPS id
 AC8A418011E8; Tue,  9 Dec 2025 17:09:19 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPSA id
 9B2EC18000AD; Tue,  9 Dec 2025 17:09:17 +0000 (UTC)
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
X-Inumbo-ID: ce3a6ef4-d521-11f0-b15b-2bf370ae4941
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=2Waf4NGfJpwjFcaXQ3o7PK0yB3PmgJFulZncjz1uAQQ=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=SUt5KYXH7DvUKX6LBDSv3iTvARxy6G9AEUvtTlqYnuAt3TrUGc2D+uyRygo8lvCXirPkadsscgbbsdyfL7N53gXsDkTnevO5PFne5YzDZNWdUY5hnrFszwROdrpU2+d2S0OSCSDGmu62WPo12Fbve7y98Q8iyg+Nx+X+LAO7vrvB0c9fqY8VnVyBBZQyuL5GxmgetQtyAZXjwOySGEx7S1VApv14okK73QLzVbTWWVmYlIpE+HoFQph0LGbVrrDQ7Qeq350cSp8kULElY7y5aWnCt7h8wek+u+quoscDnYiqstHR6Xs8twMC0CMVQg+EE9oc6Mg+8seVAm0RDWHafA==
mail-alias-created-date: 1688796967087
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ariadne Conill <ariadne@ariadne.space>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] 9p/xen: mark 9p transport device as closing when removing it
Date: Tue, 9 Dec 2025 09:09:06 -0800
Message-Id: <BD7157CB-3064-4194-ABD9-8A4D9F57E908@ariadne.space>
References: <409cccec-15dd-4e80-ba56-f0bba12772cb@gmail.com>
Cc: v9fs@lists.linux.dev, xen-devel@lists.xenproject.org,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, lucho@ionkov.net,
 ericvh@kernel.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alex Zenla <alex@edera.dev>
In-Reply-To: <409cccec-15dd-4e80-ba56-f0bba12772cb@gmail.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
X-Mailer: iPhone Mail (23B85)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEzMCBTYWx0ZWRfX8lMlJlwmH5WR
 fVIpI0yiHEd4Cb3VwpObNDwkTK0SX9Rh9t/YT/7ycNt+rdyZ2VHZkK90RvfFsolx0eoxJoacZf6
 nLrYlcVDqDSVJgME4iM2UHpdeum6XAr/6yVg8AfS+JV4iVl9OyjuQcY11M2Uh0pbK3lvGTeEiQn
 rNX5mrs52UX0tiHb9Ml2cMAn0p4y3LHjzTaToSATlTXr5bFahN+VBzWrLEgfPZucRbelrmZkiy8
 i0LKblfMNqktiad0b5EAz+BWj0p5zEbwWnhwPSIYerxNvjbVkRi3AMTe9J1W3AeoPWzc5lqBoX+
 3JXeOQE0sec00Tx7uhJ
X-Authority-Info: v=2.4 cv=MYRhep/f c=1 sm=1 tr=0 ts=693857c0 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=HZpLikwPdqgVQqDg3OYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4zPfDsAWTni_0hPDC8h7Hqj2HGICPk-S
X-Proofpoint-ORIG-GUID: 4zPfDsAWTni_0hPDC8h7Hqj2HGICPk-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090130
X-JNJ: AAAAAAABIspwEJwcHlLJ41pAALdNpZgmbkhqoWvZAGrU6f65dZCwqh+nTwsAAhktrvrx5G8Lrmy1lf1Yk7GbOhREkLbQe2y9VCf8cvcPrQcDxNeKu3IQPSnNQOR2HjPASmoyNQkgvcngYTWw24S8S8qhdC9VVWExt4f1MweR+4DBWdLnTsdgQg8MBdl7LdQ3+W+P3opfVR4eg1631gTjLcSMsSAbM6u9VphVdbl09n1WvYsa/chNmE5FQ+uFb9ubIvCHWeoQ+2gqjouc9BaGNPP9zLBUa/M2riSRQodDJGTvp11makAfTATk0HIlH+3h4IbYfk6E5f9Qy1ZwVyVYbTEtKFmOQl5a0be9nHtv8GVfDZHc4RhKE80eb7aZbVvwoEaObgqMP8uD4FmXXgH24xahowgbySI9mpKFTxGE5vuBZS0lbdrOUXaFwbe9ZajsfJ/N0nqy2E+i+vU9VfdOtneYck4tacBJXN+Lbph518UTZRMFO+6pK84GgKDGmmXBd483PlgRlOn+Y8krsAkHMIOl1O9e/VJZL9axXfwcduEFGsiDAqrrjg4bf5KUm5quolFfn6s/rY8nuoE2ei3RaNKQNVCerHqkuMVigdUovNGgHCHYr7j1pOULrte/DDZh/1wGZyk8Wn/rH8HMQDqsU9tz4cSbkMjWKuqCsF6FuM3CsKXjjFgyfLS14f9ra5SXtWc6AjTBdBjQbbpTA5lNB+Vo9DscGZk/GQcbonTB9FIij6nWxzeOpSEVMC3O

Hello,

> On Dec 9, 2025, at 2:43=E2=80=AFAM, Demi Marie Obenour <demiobenour@gmail.=
com> wrote:
>=20
> =EF=BB=BFOn 12/8/25 14:51, Ariadne Conill wrote:
>> We need to do this so that we can signal to the other end that the
>> device is being removed, so that it will release its claim on the
>> underlying memory allocation.  Otherwise releasing the grant-table
>> entries is deferred resulting in a kernel oops since the pages have
>> already been freed.
>=20
> I don't think this is sufficient.  The backend can simply refuse
> to release the grants.  The frontend needs to ensure that the pages
> are not freed until the grant table entries are freed.  Right now,
> the backend can cause a use-after-free in the frontend, and my
> understanding of the Xen Project's security policy is that this is
> a security vulnerability in the frontend code.
>=20
> My instinct is that the core Xen code should take a reference on
> each page before granting it to another domain, and not release that
> reference until the pages are no longer granted.  This should prevent
> any use-after-free problems if I understand Linux core MM correctly.

Yes, there are other issues in the 9p transport that are likely in play here=
.  In our internal testing, we confirm this is not a full fix for hotpluggin=
g 9p transport devices, but no such claim of a complete fix has been made he=
re or in the Matrix thread.

However, this is one defect that is contributing to the overall hotplugging p=
roblem and should be merged regardless: if the driver isn=E2=80=99t telling t=
he other side to disconnect, the other side will never release the grants to=
 begin with.

Ariadne

