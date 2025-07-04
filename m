Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FEBAF907F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 12:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033288.1406748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdhP-0005BN-B7; Fri, 04 Jul 2025 10:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033288.1406748; Fri, 04 Jul 2025 10:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdhP-00059H-7j; Fri, 04 Jul 2025 10:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1033288;
 Fri, 04 Jul 2025 10:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFqS=ZR=ynddal.dk=mads@srs-se1.protection.inumbo.net>)
 id 1uXdhN-00059B-7V
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 10:31:17 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster2-host6-snip4-10.eps.apple.com [57.103.87.191])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c24256-58c2-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 12:31:14 +0200 (CEST)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by outbound.qs.icloud.com (Postfix) with ESMTPS id AF6B218474DD;
 Fri,  4 Jul 2025 10:31:08 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id 201081800D26;
 Fri,  4 Jul 2025 10:31:05 +0000 (UTC)
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
X-Inumbo-ID: 02c24256-58c2-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	bh=sMuvWNAlThdQUT/Jm7Bs2UfiTYxk4u/ZKdImK+MyzHE=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=KQA9ilY+zLk/ev5yDcg6mI7uP2UwKDDek2FgQNBPu3X8F6yeTpo9yz9NTJqLzh7q0
	 fbA8xsY06V3wI5Tnb97jXJoG1InjTd5e6qTcqUbQXqhbb/0WyKEAgtfpUCplAZ5BcH
	 m+hdCMd9TaUu2n+COz/CB3+G7iDgGf8kC7mVVJNX9LJMDuDIoyLqTUzEPuPG2dnTb8
	 FiHULwMsMARvwg0ew8zkoTqppFU6hopNzdttzWfXO587RQHWA3w3T9fmDye0tEa48f
	 AuyWM0DIyaMYqYCZFNbzX6NbcRyDhp327CwGQyVQv5Ty7I9Wt8FQmvLAxD/VBhnn9I
	 4y5tDZvqmpHPA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4 56/65] accel: Expose and register
 generic_handle_interrupt()
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250702185332.43650-57-philmd@linaro.org>
Date: Fri, 4 Jul 2025 12:30:53 +0200
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2974E816-ED2F-45A3-988C-ABA4F52B3CCE@ynddal.dk>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-57-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-GUID: KQj32bSACKGkz9oeNzR-NIMXRigV6oVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4MCBTYWx0ZWRfX9balHnkxxi/e
 VU0upZooqQ0VYpwfKxM8EcAGk4hlTjFqBvN4x6d2apopuSDiOED5VzlE/O2FLhnWsp3LR4a/vzX
 vFLAMIEhhf/uxwm1MbJRzh6XhgsHqE+7xQ1HfBe8xym7SL/++rJRO6L0bbCMiP85fT+gr9BpUOV
 TDZsUjpZ6r4uNldEPAkDBJSEVqUQAliaffVx/0Q9Gbk93bAfFbav4DKAFqhQfPe+tiIbYty7Ic5
 FjyUTPSVQ3qfJGGVguN7cFDqT12dQ3NZB89x0HES3JRu0OZ8mqBC/trvm0E1/ul19OIU8j3i4=
X-Proofpoint-ORIG-GUID: KQj32bSACKGkz9oeNzR-NIMXRigV6oVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1030 phishscore=0 spamscore=0 mlxlogscore=704 malwarescore=0
 adultscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507040080


> On 2 Jul 2025, at 20.53, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> In order to dispatch over AccelOpsClass::handle_interrupt(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::handle_interrupt() mandatory.
> Expose generic_handle_interrupt() prototype and register it
> for each accelerator.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> include/system/accel-ops.h        | 3 +++
> accel/hvf/hvf-accel-ops.c         | 1 +
> accel/kvm/kvm-accel-ops.c         | 1 +
> accel/qtest/qtest.c               | 1 +
> accel/xen/xen-all.c               | 1 +
> system/cpus.c                     | 9 +++------
> target/i386/nvmm/nvmm-accel-ops.c | 1 +
> target/i386/whpx/whpx-accel-ops.c | 1 +
> 8 files changed, 12 insertions(+), 6 deletions(-)
>=20

Reviewed-by: Mads Ynddal <mads@ynddal.dk>


