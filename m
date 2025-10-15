Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE6BDF3DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 17:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143757.1477392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v932t-0001c2-RS; Wed, 15 Oct 2025 15:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143757.1477392; Wed, 15 Oct 2025 15:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v932t-0001b6-Oo; Wed, 15 Oct 2025 15:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1143757;
 Wed, 15 Oct 2025 15:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=03Ph=4Y=bounce.vates.tech=bounce-md_30504962.68efb7e2.v1-d058acf954d540e7958c5e7c7323e6f9@srs-se1.protection.inumbo.net>)
 id 1v932r-0001av-UV
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 15:04:05 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fef8e42-a9d8-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 17:04:03 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4cmvVp200Kz6CPyKw
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 15:04:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d058acf954d540e7958c5e7c7323e6f9; Wed, 15 Oct 2025 15:04:02 +0000
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
X-Inumbo-ID: 2fef8e42-a9d8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1760540642; x=1760810642;
	bh=z0ZXZLG35SQT0kdwf7o7cwRcW0KKQp51eFJdNmpLkeE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yeKdGXbm+6SqsenwWfY2iBQ+qNhVDpyVkngO4vOkRrkhp8I9NMPm/+I6wG/T5V08K
	 T7apAuFF7wwvbd8VHhEep3avM+WTdXN62yFQdOFQ1EQo175b8iPiRXBsCjFrb5f5bR
	 9p/Pi3LmW6H3CyBKwJ0aZcsjtWZCb54tWRHcLCO36zomRQKnZ+97RZMLrLJfzSYp14
	 nLOzGomBh5NgrYcYkfc3H5K0sJGHiQV3nh9gliP6ifrzkzZd+2ZbS5EcfMjn55k2TR
	 AvDLMte3JCWLu3GSB2h++wCbxpRQw1k5p7/Yx8LfhKEwaKdIzd6t/OJez0uSenuocP
	 dKEDHi9bwdRvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1760540642; x=1760801142; i=yann.sionneau@vates.tech;
	bh=z0ZXZLG35SQT0kdwf7o7cwRcW0KKQp51eFJdNmpLkeE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bbjCem2L1Gni8VwaXUAsEDKokWXsNAbOWKP45/llKkVNo0qJbSOmSUxJ8VOdl9MF/
	 WgMbr5VzjHb2xISqF0646wqLwgFdmfUnl3238Ycz2FKafdb+lkmG+kPNEG1SStsNFD
	 mda8yGKpla512C8BEqq1vMxEiNF70bw+Mc8v62VYDRpSVRvtSg0txc28C/yElswiTd
	 0rVrEjNj1UD/6+EZXYCVN72DopeyqabqrYPrusXP/gK8a9v5//5Qvd/aid5Cj+pnRq
	 Yt03pgpLZW1V+Hpo0HRTQU26197TpESiLf7B19Ecm8ZHnHwt62ZRm20pLemeCr1FzH
	 3iDKwdA+Ce5jA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.21=20v2]=20efi:=20Protect=20against=20unnecessary=20image=20unloading?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1760540639479
Message-Id: <a46d7bc6-7c9e-4415-8966-b3eb4b61a800@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Gerald Elder-Vass" <gerald.elder-vass@cloud.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
In-Reply-To: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d058acf954d540e7958c5e7c7323e6f9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251015:md
Date: Wed, 15 Oct 2025 15:04:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/14/25 15:09, Andrew Cooper wrote:
> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> 
> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
> image after loading it (for verification purposes) regardless of the
> returned status. The protocol API implies this is the correct behaviour
> but we should add a check to protect against the unlikely case this
> frees any memory in use.
> 
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Yann Sionneau <yann.sionneau@vates.tech>


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


