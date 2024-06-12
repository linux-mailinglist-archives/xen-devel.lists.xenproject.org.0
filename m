Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A865E904E1C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738948.1145819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJJt-00051a-S0; Wed, 12 Jun 2024 08:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738948.1145819; Wed, 12 Jun 2024 08:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJJt-0004zV-OX; Wed, 12 Jun 2024 08:27:01 +0000
Received: by outflank-mailman (input) for mailman id 738948;
 Wed, 12 Jun 2024 08:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UyOc=NO=bounce.vates.tech=bounce-md_30504962.66695bd2.v1-61969071693b4b219bff4215114ecb07@srs-se1.protection.inumbo.net>)
 id 1sHJJs-0004ys-MZ
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:27:00 +0000
Received: from mail112.us4.mandrillapp.com (mail112.us4.mandrillapp.com
 [205.201.136.112]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89547847-2895-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 10:26:59 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail112.us4.mandrillapp.com (Mailchimp) with ESMTP id 4Vzdtp4GJ4z8XRrPm
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:26:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 61969071693b4b219bff4215114ecb07; Wed, 12 Jun 2024 08:26:58 +0000
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
X-Inumbo-ID: 89547847-2895-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718180818; x=1718441318;
	bh=j6VIeUnTOqUuAjOuIeyai7Ic3Rr0EWVfW8bkQxexx94=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lNXFHiWayfGZsEWIOCHxfpe7NHNtfFTspErk8s/WuXbjLXc51ZUx3+QyIdwO+97B7
	 FSS9nujfqSGKp0nr6VPRKDdt9x/pHwqTYIRKHHKyymtyC7dgtQfGxUJeeJwOpueckq
	 v3QTChQAaJ750NjA0+vP/ClqkDPucQ/+Bwi+Vj/soSZ5naBCZhqCPkzDz38mvyG7CT
	 aALvqsJBVP8oGA7Z6HK+vDRT8p78YbYwQrZdEYMPxoKiO81e9DT/g+GkQNgA/vKqzD
	 xIDzloVsWiOF5voMP31HNa9ZvEg3f8uTntTaTzBdJChxU3m8O+CPFDGeEgWrlSHSGF
	 qedKCxXYuqrjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718180818; x=1718441318; i=anthony.perard@vates.tech;
	bh=j6VIeUnTOqUuAjOuIeyai7Ic3Rr0EWVfW8bkQxexx94=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=av72xdjc/PkgVNdcw+DDaprQmS0Cx7f2D2g/RWcyFAr48/iZvolFDawHMbytslTL2
	 MBteLucpN6zrHyaKKpMsFtBkeVJ1zYgXJUZ7lFdElXAocD8mbydy+C11nBrCj81Qkf
	 0SYaojxsfcvRE9LCJ7UADa/JnrF8F9m9nKz3zHlvr2i3HfBJXDa1HYx1Nk0BAuQetD
	 paBnF4se10hR1D7nxzUXOb2BiLC5ANPcXxd2f8Kws1LICDtFcqELcnWy9V7J+gecsO
	 vegD13FIj9nUv4UuPxIIxnd1j68NzgUTCmPbHhV/kXOQn1BQDWfMfi8HmKd4i1K67t
	 7fwXTL7B1C6aA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=3F=20v6=205/9]=20docs/man:=20Add=20altp2m=5Fcount=20parameter=20to=20the=20xl.cfg=20manual?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718180817728
To: =?utf-8?Q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Zmlb0eN1SEvTDL5P@l14>
References: <cover.1718038855.git.w1benny@gmail.com> <056a6d3337aafa36f341596e6236cf21dd7e705b.1718038855.git.w1benny@gmail.com>
In-Reply-To: <056a6d3337aafa36f341596e6236cf21dd7e705b.1718038855.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.61969071693b4b219bff4215114ecb07?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240612:md
Date: Wed, 12 Jun 2024 08:26:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:43PM +0000, Petr Bene=C5=A1 wrote:
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> 
> Update manual pages to include detailed information about the altp2m_coun=
t
> configuration parameter.
> 
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


