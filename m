Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEBA7A384
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 15:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936822.1337972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0KQJ-0003lM-7D; Thu, 03 Apr 2025 13:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936822.1337972; Thu, 03 Apr 2025 13:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0KQJ-0003j4-4U; Thu, 03 Apr 2025 13:15:59 +0000
Received: by outflank-mailman (input) for mailman id 936822;
 Thu, 03 Apr 2025 13:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIOE=WV=bounce.vates.tech=bounce-md_30504962.67ee8a09.v1-2714fdff1a4e4d1da47dff16fb2cf74c@srs-se1.protection.inumbo.net>)
 id 1u0KQG-0003iy-Qg
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 13:15:57 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5e151eb-108d-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 15:15:55 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZT2L14npzz7064Cq
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 13:15:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2714fdff1a4e4d1da47dff16fb2cf74c; Thu, 03 Apr 2025 13:15:53 +0000
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
X-Inumbo-ID: c5e151eb-108d-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743686153; x=1743956153;
	bh=pzx4TDn/ynKuZwN05x58kluDiwnrY6WdDIR6vuLWe6Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gOco+M8k3kveeT5THqmORh+oGihqtl8NbCopgeVvoezWsS5wMxU69aUY22v6TiB38
	 dR2zJazdnb1j5qroSNUTboydxSj9p/z/uws8EtyEOoH6Pp8tz25TEDrqXhB3qMjVb4
	 s/wLRQz5ExTEdFPvnyVePzuK44L7s9Aq4pxhej3RiYomA3F5Q+j1h8ONN9JkqfiUPC
	 EVaVpJLoTW5Eg+P78bGrEZOFnrgcxzA0BEFOoHHGz//cS3QCEDpKKUHt3Ld0DCRxRR
	 PiTOpAeEyc4V5wn/Hfz3kmFw0ReBgoPw0JUKTzB74PLJZe0pYNhLWp3a5+y63F96Dl
	 z4fB3aWGwWnvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743686153; x=1743946653; i=anthony.perard@vates.tech;
	bh=pzx4TDn/ynKuZwN05x58kluDiwnrY6WdDIR6vuLWe6Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RaSkQ2Fj8B1xDu4KFQ1mQ2efXIh31OPoKHAOuJEXhOBbY+ac1NxtIiBYMSeEA+kdm
	 MfpYcdBh5t3JzvMAOjYeuKdkF7Am4CpAhzC3Cxu/5MteJinzIC0lABj0bRh7pxvyZw
	 kwXLh2RW0q0SUSCyxuiZp6Xesi/c/W01938NuyjfH3YvoJrRXQKg00janj5jtMwPp6
	 ssQ/HmbD85gRCW01t7nzy9CXNEqT/QAvsBmjYv19BdlfMBdTZymUcbMslTEX6NpKC7
	 /sVSjnWGJ/VeZGm2kcO1m7DDmF4kPNAm01Pv3UEEqI48C5X6huONReksgJyp3CSIKF
	 kk8t62obf0mIw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/3]=20xen:=20debug:=20gcov:=20add=20condition=20coverage=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743686152338
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Z-6KA1Kto8PIJJkI@l14>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com> <20250401011744.2267367-4-volodymyr_babchuk@epam.com> <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com>
In-Reply-To: <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2714fdff1a4e4d1da47dff16fb2cf74c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 13:15:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 03, 2025 at 09:30:21AM +0200, Jan Beulich wrote:
> On 01.04.2025 03:17, Volodymyr Babchuk wrote:
> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
> >      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
> >  else
> >      COV_FLAGS := -fprofile-arcs -ftest-coverage
> > +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
> > +    COV_FLAGS += -fcondition-coverage
> > +endif
> >  endif
> 
> Personally I find ifeq() uses like this unhelpful, and would prefer
> 
> COV_FLAGS-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
> together with an eventual
> 
> COV_FLAGS += $(COV_FLAGS-y)
> 
> (if we don't already have one).

Not we don't. About renaming $(COV_FLAGS) to $(cov-flags-y) instead? It
is simpler as we stay with a single variable for coverage flags.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

