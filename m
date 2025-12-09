Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA4CB0B2C
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182039.1505017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mq-0006bl-RK; Tue, 09 Dec 2025 17:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182039.1505017; Tue, 09 Dec 2025 17:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mq-0006YS-M7; Tue, 09 Dec 2025 17:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1182039;
 Tue, 09 Dec 2025 17:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0hE=6P=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vT1Mp-0005cC-1X
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:19:15 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster3-host9-snip4-10.eps.apple.com [57.103.66.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2de31db6-d523-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:19:12 +0100 (CET)
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-1a-20-percent-3 (Postfix) with ESMTPS id
 F2BEF18000BE; Tue,  9 Dec 2025 17:19:06 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.56.9.36])
 by p00-icloudmta-asmtp-us-west-1a-20-percent-3 (Postfix) with ESMTPSA id
 EB4C718000BB; Tue,  9 Dec 2025 17:19:05 +0000 (UTC)
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
X-Inumbo-ID: 2de31db6-d523-11f0-9cce-f158ae23cfc8
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=RNErpzZbcTJeDU6TKVZ8PzZlmV6CMi2ciqMc2TRk1Gk=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=UL/IbNoEwoD/QRO9D+725yIjAOhWYncYJPAXjiXvqUr2Q86b1lon+xbs13GKpSatkjdH0CpF+8ws44oxIAkwf1rcet5zU0dkPVLvaULmJQnENb/dMH/lY7ZwRUgeh3RGSYr8xf64m4shGjho4H+I8QrCRhllaXVi51kNBl/uIPgHleEcmmh9wEvnfDAY/o26kzmcWJKntmJHr5UnbhcVzhm1TpjCszm2xmtRtDyOV2zTUGXJycJ/MrpSo3ud1J8tAqA56Nqc5rKZyRl2satBPeLhCt/xRNw5Z7n9ExiOC3Bfm1VwgH9WXqcNJ+R7+sYiHs/GCLeHY5e1mDP8fWwP3g==
mail-alias-created-date: 1688796967087
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ariadne Conill <ariadne@ariadne.space>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] 9p/xen: mark 9p transport device as closing when removing it
Date: Tue, 9 Dec 2025 09:18:55 -0800
Message-Id: <AF8229BC-39BC-4857-AD06-1AB2E8748459@ariadne.space>
References: <efbab440-cb84-4900-989c-43d0d69b60f2@gmail.com>
Cc: v9fs@lists.linux.dev, xen-devel@lists.xenproject.org,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, lucho@ionkov.net,
 ericvh@kernel.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alex Zenla <alex@edera.dev>
In-Reply-To: <efbab440-cb84-4900-989c-43d0d69b60f2@gmail.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
X-Mailer: iPhone Mail (23B85)
X-Authority-Info: v=2.4 cv=Zqfg6t7G c=1 sm=1 tr=0 ts=69385a0c cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=eRcs-64NSlAV9zilaZwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7r_hZ7o3_Pm27eEs0aWveTRU2jd3sglZ
X-Proofpoint-ORIG-GUID: 7r_hZ7o3_Pm27eEs0aWveTRU2jd3sglZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEzMSBTYWx0ZWRfX9sVDiqgz8GJj
 hDpVAyhUCmHWNGTK4gMLhKwcbe8afPMZ4IbcBzustWCDhupJhf9B4KCY2QHNWfuSAFo37dlIYQr
 Uo2ueOAVLj5EuwM3Ky4uad5WK6sGeh89N3QCmBMkSkmI0y/omVlpr8xJmz4LJ/oBBz3oCcuurjF
 ht3XgdItbXqPGDX52dRJ59o0+Hm78EdCfjDh7oe4sgAntYB7dP+vdLGqOwVs6dt7uyS//cXFM02
 8CmLyEEplI/BvLsKdJEYaefjYzSHcQwqZAf/sEU0racMvxhpU4PHr/IyPjmLeJq4b65AODiU6Ax
 2sGtB06vMscJwPPXCF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1030 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090131
X-JNJ: AAAAAAABsFSdo+CoX8eF5pXh3rEpRXRMwQt0kJOVpLOpVXfRBU3ydhGou0ayG7Gi8jnDNoVfhJLVS7TdKSyyCDtY7cpIkbp+IxTULZqSowgUV7WYGDsSeulFdzR/Cvs43OBIteTraNI68j1jT97cvC+sIGx+QGyRGi3CiMqeSA0Yp+sseufh4DFemSb4yHkL/otYIyfm80duGdPXFf0eCMKrpmQNESR1AUvpXxsCrHXwwZw56r8ggycEZFX3Z4Th54ofXQlG6T7ANVh15YPEP4Q+H+vNZWtVF8z7QCKdSTkn25fY0IkFQSYU33oWx0d52FkARbDXiRtNNgpHnd5zQ2cO70xGdY5g3QofVLbralHR24VYJmrAwwS//DdX2PntqdyozP4+BCGRBatNuNDguq9n019PJlPireu7cMEywIQIquS92GJqGDO3an5LoQpvGccruTzJQkPxmr8rYMppEF4GlPVrGwVQUOMFrbvJDUOVlFh7nkgxLz56Znrhqx/WCJSOavbAECq7gYgatcizALqaMC9FiTKbhIWAokbkSto1MkciTK+LUD1udOYKhVRDg7CSPqaaMTlrT+RuqSRDqf8QpH9OIogY/lYz7sUM4ekLgI3FQ8cmJTyo93XTuqy11EAgfOXc7rbV1DMoEGnavlctuCE4tvbieWC/xCcvyaxtfacnKphW2dxHFt4hnVtgg7caxFEchJ1JaOl/XejDvBa8wqx+Br7YSHieMng5Qd+9qvYWFVCi7xc=

Hello,

> On Dec 9, 2025, at 9:12=E2=80=AFAM, Demi Marie Obenour <demiobenour@gmail.=
com> wrote:
>=20
> =EF=BB=BFOn 12/9/25 12:09, Ariadne Conill wrote:
>> Hello,
>>=20
>>>> On Dec 9, 2025, at 2:43=E2=80=AFAM, Demi Marie Obenour <demiobenour@gma=
il.com> wrote:
>>>=20
>>> =EF=BB=BFOn 12/8/25 14:51, Ariadne Conill wrote:
>>>> We need to do this so that we can signal to the other end that the
>>>> device is being removed, so that it will release its claim on the
>>>> underlying memory allocation.  Otherwise releasing the grant-table
>>>> entries is deferred resulting in a kernel oops since the pages have
>>>> already been freed.
>>>=20
>>> I don't think this is sufficient.  The backend can simply refuse
>>> to release the grants.  The frontend needs to ensure that the pages
>>> are not freed until the grant table entries are freed.  Right now,
>>> the backend can cause a use-after-free in the frontend, and my
>>> understanding of the Xen Project's security policy is that this is
>>> a security vulnerability in the frontend code.
>>>=20
>>> My instinct is that the core Xen code should take a reference on
>>> each page before granting it to another domain, and not release that
>>> reference until the pages are no longer granted.  This should prevent
>>> any use-after-free problems if I understand Linux core MM correctly.
>>=20
>> Yes, there are other issues in the 9p transport that are likely in play h=
ere.  In our internal testing, we confirm this is not a full fix for hotplug=
ging 9p transport devices, but no such claim of a complete fix has been made=
 here or in the Matrix thread.
>>=20
>> However, this is one defect that is contributing to the overall hotpluggi=
ng problem and should be merged regardless: if the driver isn=E2=80=99t tell=
ing the other side to disconnect, the other side will never release the gran=
ts to begin with.
>>=20
>> Ariadne
>=20
> I definitely agree that this should be merged!
>=20
> Is this code-path triggerable by the backend at will, or only during
> teardown by the toolstack?

In practice it only happens when the toolstack tears down a 9p transport.

In theory it can happen in any situation where the backend decides to tear d=
own the transport, which may or may not actually be mediated by the toolstac=
k.

Ariadne=

