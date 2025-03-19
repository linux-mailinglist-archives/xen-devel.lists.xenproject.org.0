Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF3A68E54
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 14:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920705.1324789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutuH-0000px-Lx; Wed, 19 Mar 2025 13:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920705.1324789; Wed, 19 Mar 2025 13:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutuH-0000oU-JK; Wed, 19 Mar 2025 13:56:29 +0000
Received: by outflank-mailman (input) for mailman id 920705;
 Wed, 19 Mar 2025 13:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWIU=WG=bounce.vates.tech=bounce-md_30504962.67dacd06.v1-2f0177316d44479db463c4be9dedb200@srs-se1.protection.inumbo.net>)
 id 1tutuG-0000oH-4w
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 13:56:28 +0000
Received: from mail136-29.atl41.mandrillapp.com
 (mail136-29.atl41.mandrillapp.com [198.2.136.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17410b5-04c9-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 14:56:24 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-29.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZHqxf691Qz6CQ32B
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 13:56:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2f0177316d44479db463c4be9dedb200; Wed, 19 Mar 2025 13:56:22 +0000
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
X-Inumbo-ID: f17410b5-04c9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742392582; x=1742662582;
	bh=S2HwWyjFnN9+yZcO348glRXKWzLF/ORVGltfzHFXYyc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Lex6L7WK8EEbR6akLulITdTMm0D1b7Gm9EMi7jFmB2iADeLwcY9vhOi7cqs9BDQbI
	 vC5aHzf9Dy2tCvdRscoTXLGJBM92IiiB88Pt4pfdA16sqVrZrMjHu6dQoTbeH5TTqU
	 ze8XBb8jhC2jMulhuxYk5pfrY+73+fP7FViVt7zJmQM8nKYv6NXXlwLqBJ+So4WeRg
	 uPZIWXRs6KDCIa/xv/eg77rq59E/OlCXkLAbEvcaTTg3JDLDWAhYqT//fZeIi9RQsp
	 e6HgqHE7e2SvFFWh5uEuR+QRpmc9DSCWg2OUQBdku2bNPVwdV82ybYqTyPVt2jvtx/
	 TrC0zE8WNG0JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742392582; x=1742653082; i=anthony.perard@vates.tech;
	bh=S2HwWyjFnN9+yZcO348glRXKWzLF/ORVGltfzHFXYyc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IUSOiq607XgXlY6pcpJNCwdlhwubCr1aBqiA1yLKgy4lB8sUXSe8y6U4LKPS9I2UX
	 7+P+s4pK5ewfPfnTu5L77uEqhim3y52j0FeocIsldb+H9hCknn6TNzj/D1u7coQbuC
	 DeMxACGuyUhM1ThfRDRrEGXcuoQGEvrzoHcvmrDlf7UwkBZhbMUmESqaYTGDJPDWg/
	 qTt9RfRlbZPrtw89CFZVV8UdrItMilc/QZALyJ8S8flmJhkASs9WpHMGGFtDaT19TI
	 yN01FvUae4qxg8pE6NQboxeylh1lI4vrYiL7n4I4wl6vg4A84ZDPCzEfjHRTVvmoWc
	 RisXW6TR680sw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=2013/18]=20system/xen:=20remove=20inline=20stubs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742392581417
To: "Pierrick Bouvier" <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, "Paul Durrant" <paul@xen.org>, xen-devel@lists.xenproject.org, "David Hildenbrand" <david@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org, "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Paolo Bonzini" <pbonzini@redhat.com>, "Harsh Prateek Bora" <harshpb@linux.ibm.com>, alex.bennee@linaro.org, manos.pitsidianakis@linaro.org, "Daniel Henrique Barboza" <danielhb413@gmail.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Alistair Francis" <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, "=?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, "Weiwei Li" <liwei1518@gmail.com>, kvm@vger.kernel.org, "Palmer Dabbelt" <palmer@dabbelt.com>, "Peter Xu" <peterx@redhat.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Stefano Stabellini" <sstabellini@kernel.org>, "Nicholas Piggin" <npiggin@gmail.com>
Message-Id: <Z9rNBFsWR39czUGQ@l14>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org> <20250317183417.285700-14-pierrick.bouvier@linaro.org>
In-Reply-To: <20250317183417.285700-14-pierrick.bouvier@linaro.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2f0177316d44479db463c4be9dedb200?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250319:md
Date: Wed, 19 Mar 2025 13:56:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 11:34:12AM -0700, Pierrick Bouvier wrote:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


