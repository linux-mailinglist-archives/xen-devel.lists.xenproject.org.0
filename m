Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19EAF8F19
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033130.1406714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd3d-0004TO-S8; Fri, 04 Jul 2025 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033130.1406714; Fri, 04 Jul 2025 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd3d-0004Mc-On; Fri, 04 Jul 2025 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1033130;
 Fri, 04 Jul 2025 09:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFqS=ZR=ynddal.dk=mads@srs-se1.protection.inumbo.net>)
 id 1uXcoj-0005Hd-1Q
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:34:49 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster2-host9-snip4-10.eps.apple.com [57.103.87.221])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2023a990-58ba-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:34:48 +0200 (CEST)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by outbound.qs.icloud.com (Postfix) with ESMTPS id 4B3EE1800146;
 Fri,  4 Jul 2025 09:34:42 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id 80C6D1800166;
 Fri,  4 Jul 2025 09:34:39 +0000 (UTC)
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
X-Inumbo-ID: 2023a990-58ba-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	bh=jC7wpVSfptGSKQNhfifAQf88TarhTWI3lXHmAPkaLIE=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=fv4d+/ssMjjZRvl+bi2zpn1ICNfnzzmG2pf+BB3syOrG+HLD2UnuHw9UJqfMpn0Cz
	 oCNxQG3iNNDAfVvMLWDOo0J8axx8pDeZA9iwsDphTABCjkHHOTiR60DePOKkzMhA1r
	 w6sqv/KEq4g6KRcEdpV5Fm25TcUL4dAtFDzMqdw2ATaqUqLAyBq0rWfOrV8m5hvkj8
	 8hfnr/Qd63XZYhOzP7VZwRN9noq/FbDkmYggLZP8BsG/4PNxOM0YCSSOfIwAEoDYUy
	 o/ejRzOVXWuwGp1nPBPwa48hsxjf76seYOyPTuerm61lx6CrricdKlBvnpmz3BAztG
	 UjS/kP4MWi5mQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4 58/65] accel: Always register
 AccelOpsClass::get_elapsed_ticks() handler
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250702185332.43650-59-philmd@linaro.org>
Date: Fri, 4 Jul 2025 11:34:28 +0200
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
Message-Id: <6E85BEC9-8431-4078-AE7D-B39575A0A155@ynddal.dk>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-59-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA3MyBTYWx0ZWRfX4RhBOv1FtGUi
 paYD8h7EWn4Xf8MRKYylkrEyXc7vsT7b8A8y8ICl5BJ44GCBKuwIMwd8OID7Lt1AmN6Xkbpkhxo
 evhMRfcU7UWhMWy3GNDmwmyoZiLPr6wGzGw2vkkRlXhJ64tqKG5+VrP8KolE79P+YubgkeKiqdy
 tbBKrZiEF/Wf3FDcv/Sk8qOgqjLaGWQvYvcNk2O5OxoM5dZDfsucgJRG9/dVgd1DvfbUy4ULiJO
 P6I5JALT74fCxmhI0WoAHBdkUjQpWs7e3kCzNKhfkcvVb6yQTSkeYbC/0i8HoZ9vCMH6tvFgY=
X-Proofpoint-GUID: koFkGGtkRgsisw6n9qz2oN3WDN2lMeNE
X-Proofpoint-ORIG-GUID: koFkGGtkRgsisw6n9qz2oN3WDN2lMeNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507040073


> On 2 Jul 2025, at 20.53, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> In order to dispatch over AccelOpsClass::get_elapsed_ticks(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_elapsed_ticks() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> include/system/accel-ops.h        | 1 +
> accel/hvf/hvf-accel-ops.c         | 2 ++
> accel/kvm/kvm-accel-ops.c         | 3 +++
> accel/qtest/qtest.c               | 2 ++
> accel/tcg/tcg-accel-ops.c         | 3 +++
> accel/xen/xen-all.c               | 2 ++
> system/cpus.c                     | 6 ++----
> target/i386/nvmm/nvmm-accel-ops.c | 3 +++
> target/i386/whpx/whpx-accel-ops.c | 3 +++
> 9 files changed, 21 insertions(+), 4 deletions(-)
>=20

Reviewed-by: Mads Ynddal <mads@ynddal.dk>


