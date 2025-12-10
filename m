Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9767CB2B8D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182817.1505655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHZe-00019B-B7; Wed, 10 Dec 2025 10:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182817.1505655; Wed, 10 Dec 2025 10:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHZe-00017i-7K; Wed, 10 Dec 2025 10:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1182817;
 Wed, 10 Dec 2025 10:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPBm=6Q=bounce.vates.tech=bounce-md_30504962.69394d68.v1-2252768df2a84190bb9c73e3cc827c0d@srs-se1.protection.inumbo.net>)
 id 1vTHZc-00016V-83
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:37:32 +0000
Received: from mail187-28.suw11.mandrillapp.com
 (mail187-28.suw11.mandrillapp.com [198.2.187.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39e8bdb8-d5b4-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 11:37:29 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-28.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dRBxN3HWvzMQxhqw
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:37:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2252768df2a84190bb9c73e3cc827c0d; Wed, 10 Dec 2025 10:37:28 +0000
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
X-Inumbo-ID: 39e8bdb8-d5b4-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765363048; x=1765633048;
	bh=RVsp7p7zybTYVeYG2bAVGQU7owNXisUPxzHggp7hWSw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sNXZOrQq4wrg/jfK0Ot8iVZCTNE5EbA5lgshbIZCBz6W2z9xQg5xt2GN0UL3ZUBP+
	 L50e1gQ/RqHsls97dCRgxOlksZFFY/zATaroJGy/3ipwZ/5n1AD/HlFsy5h8gBOxNF
	 c2wvFGdWvcVMZszQMY31A/iNdiqRHJPeZ7hUYMaKvHYxcYh541PY4hHmmirSBYH+mc
	 Yww7RXYHLOrLtQb94RR5XqpaYB/SNqrt55sazE5Br1DVabmYxWa4f126wMkqd9rjk2
	 E6kydaqh7mCDE/jQEO/iABPiflFFXknUXxrRrxtfNnZJYqX6lBPjPn0QQMnHlMBoHY
	 FvB+lN4H5u0dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765363048; x=1765623548; i=teddy.astie@vates.tech;
	bh=RVsp7p7zybTYVeYG2bAVGQU7owNXisUPxzHggp7hWSw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AtQR0p6V1mgL1IgysaUodrol/EQxtXeougwspFG9bG9HSfBI8lh724jA3S4D+HXCC
	 tQPGdzBagvVfb9chqfxhFk+jXjxoYjTq+40e4B+vhJKySBn61AAOCr/EulZx8Rhg/U
	 CoaLbzwQYvGs/W2mu4B+Qv3ug8flizSc4gIQlvsVkr1dfSgRCqmERgSaUR1LBj3Pda
	 rFqAp9pMLGWh/5i+LNXPJtQSHg51Cm7jV57BnqKVM88G5r0eyO8Fms9TkCcWcHKdcC
	 +30HtJKfmQ6tNu7OLYHpMxIyet5O2xA2rCu4mq0p9xzNgwn0jID5tbfer8zOk4TTfw
	 wMAMOeMtdQH5w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/3]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765363047903
Message-Id: <3e9f828a-218e-4b20-9fe1-c8da3f06f87d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech> <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech> <29100824-303a-46b2-b394-d15d617131bc@suse.com>
In-Reply-To: <29100824-303a-46b2-b394-d15d617131bc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2252768df2a84190bb9c73e3cc827c0d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251210:md
Date: Wed, 10 Dec 2025 10:37:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 10/12/2025 =C3=A0 09:50, Jan Beulich a =C3=A9crit=C2=A0:
> xc_resource_op() doesn't return errno values, so by using -EOPNOTSUPP her=
e you
> put the caller into a difficult position when actually looking at the ret=
urn
> value: Does -1 mean -1 or -EPERM?

That's a bit unfortunate as xc_resource_op() can return either -1 or 
some -errno; so -1 could be either -EPERM or a internal failure of 
xc_resource_op and we can't really know.

One thing is certain is that if xc_resource_op() returns ret >=3D 0, there 
is no failure aside that we may have no data (e.g no MSR yields a value).


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



