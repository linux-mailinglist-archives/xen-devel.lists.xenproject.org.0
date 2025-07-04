Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C72AF8F16
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033128.1406708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd3d-0004Mn-L5; Fri, 04 Jul 2025 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033128.1406708; Fri, 04 Jul 2025 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd3d-0004LS-GO; Fri, 04 Jul 2025 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1033128;
 Fri, 04 Jul 2025 09:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFqS=ZR=ynddal.dk=mads@srs-se1.protection.inumbo.net>)
 id 1uXcmG-00057X-8b
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:32:16 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster6-host10-snip4-10.eps.apple.com [57.103.85.231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e3e1de-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:32:15 +0200 (CEST)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by outbound.qs.icloud.com (Postfix) with ESMTPS id 09BCE180016E;
 Fri,  4 Jul 2025 09:32:09 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id 1E2D21800162;
 Fri,  4 Jul 2025 09:32:07 +0000 (UTC)
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
X-Inumbo-ID: c4e3e1de-58b9-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	bh=9rEB08GrSiVE+mWLaqMpZs2n04R7skd7dXhDs5UY6I8=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=w2Lqw+F6bxlrqGCYvmq8zo0WeLS3eRG69CjSsLO6LLcVikMY0oAvWusWaICebwIIA
	 d/owEDdwYKFOEY0SEcGYbNvfL810oF6M5MtGN42owYij3Ws2awsWi0+Nl0MddkfcNP
	 LrZ0YFuPb7i+f+o9qEAB10Zxzx+wH+h4PtJLcN0WnKWi3y88UMpG87gjjnhjVKJWiK
	 zlTuTYY6v9hFvHvezvq3r3EE9oNHWhC7SQWqNMx3ZkyMHKzdsmecxnxJCtzGmhvktj
	 qOds/ZxNTC2OrcL4t5t3ygKW1Q0cdqGuL8o/JxXxiz/Vf2qsC/V1fB19CugUajqSfv
	 Gec9AHcyOFazQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4 59/65] accel: Always register
 AccelOpsClass::get_virtual_clock() handler
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250702185332.43650-60-philmd@linaro.org>
Date: Fri, 4 Jul 2025 11:31:55 +0200
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DAE33222-93C1-4B29-A224-7FA6A4F0344C@ynddal.dk>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-60-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA3MyBTYWx0ZWRfX7ooy855ftlpJ
 382CqUnUzm9dvWFlJ4w3bZfbYCF+MOcu5YUJKVmNOQpMuB4hfyDeyYm012SCcxKjAoJ2iYF5NSI
 uirMv84bFEsrokKwUyE7eZorMGGObQZQzT6Inhhr9LehDsMZ1d1NY+RZTif+jvTs5FmpsQI199M
 sVsCd61OOzoBpfVIKqo3XaY74UAmhzazAduwUmWFJZpb7RSDpO8ottAZc/q+sjsCWln8q7BT5rU
 oW4o1oxFfr5sSbP3gC5XOoUOe0VJ3zhCKD4GAn8XrRsTgOFSWSKtJrn77XxbyXc5UG5CdariU=
X-Proofpoint-GUID: yZKEds9rpVCqOGHR4JbLjQYUEdwGwxVu
X-Proofpoint-ORIG-GUID: yZKEds9rpVCqOGHR4JbLjQYUEdwGwxVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1030 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2507040073


> On 2 Jul 2025, at 20.53, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> In order to dispatch over AccelOpsClass::get_virtual_clock(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_virtual_clock() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> include/system/accel-ops.h        | 2 ++
> accel/hvf/hvf-accel-ops.c         | 1 +
> accel/kvm/kvm-accel-ops.c         | 1 +
> accel/tcg/tcg-accel-ops.c         | 2 ++
> accel/xen/xen-all.c               | 1 +
> system/cpus.c                     | 7 ++++---
> target/i386/nvmm/nvmm-accel-ops.c | 1 +
> target/i386/whpx/whpx-accel-ops.c | 1 +
> 8 files changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

