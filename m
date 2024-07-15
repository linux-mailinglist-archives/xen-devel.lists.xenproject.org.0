Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C98931393
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 14:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758850.1168360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTKSL-0005UK-PG; Mon, 15 Jul 2024 12:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758850.1168360; Mon, 15 Jul 2024 12:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTKSL-0005RC-MU; Mon, 15 Jul 2024 12:05:25 +0000
Received: by outflank-mailman (input) for mailman id 758850;
 Mon, 15 Jul 2024 12:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mLU5=OP=bounce.vates.tech=bounce-md_30504962.66951080.v1-67c0acd6f55f497e9f66d70de49b948f@srs-se1.protection.inumbo.net>)
 id 1sTKSK-0005R6-6Q
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 12:05:24 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8278f52f-42a2-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 14:05:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WN19X4gV9z6CQ6YM
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 12:05:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67c0acd6f55f497e9f66d70de49b948f; Mon, 15 Jul 2024 12:05:20 +0000
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
X-Inumbo-ID: 8278f52f-42a2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721045120; x=1721305620;
	bh=oikz1MSsaIHL0JMJlqbQdeTcbQZvhY9gO29ww/aRO6k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XvvxP3K4iQ3cKHi46gPQUXZ4/eZB2ZtzoXELmrBDZC0+MA4dWzVHPbIRGYGoc3oDu
	 c08t9uXj6+mOmUQL+G/OXjWOjy/4ghemBd0TnoFF2KY49BNHXTOegozLJvOJCWUtgI
	 CXEYxOiRjuZI7VEBiL+sw3PzKYH2Q1Ek+7CLVORkxK2pR9EyKP5Za+retFCLpTr9mC
	 jRDEMx/A5Uo13vKWsWK/EWbvoA+pjv6pPKNd0HjBlr3mHgYlQDbgbrSjoEpFXE4rcT
	 sMQVOgx4ezTXOe1I9II1irgDJedgKAxXOq7VTQneurGBtgbtogDojkrC1+XP85fDaD
	 Epqw0HYzDASKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721045120; x=1721305620; i=anthony.perard@vates.tech;
	bh=oikz1MSsaIHL0JMJlqbQdeTcbQZvhY9gO29ww/aRO6k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QbARuLrrbZzbWm3rbPnv9vqmfLnjtz29dhtz7t6aBymnDcmQHftGko61by9Nm9HG+
	 DNL6fH2Ohs51dI9e1vpek7TBTzoycBDfG4K8NWUMZ5HQS6KAVzlcbrb5kc870M5dvK
	 +SrAbDSPzKSxsuB9CBnQ7b79Q1EwPKLtFumgExDeUtd+NjjNcodyGW+cFjJ+W/sSU/
	 uFlgxvN5xaHWR+fm3DyDboZgNCVoW1DG3Vd/W0zbXdd8H4Ar+46FQbnXmbMcPiWBky
	 XK6KByffRBidR4h3qII3bFamrlYBR8qLk+g3vV5NLzhO72Ir60kIyWZk3LSPZEF4n/
	 xmmxtW2LADwQg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2019/12]=20docs:=20Fix=20install-man$(1)-pages=20if=20no=20manpages=20are=20generated?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721045119457
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZpUQf5PXqbvQY/1y@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240713180939.3363273-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240713180939.3363273-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67c0acd6f55f497e9f66d70de49b948f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240715:md
Date: Mon, 15 Jul 2024 12:05:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Jul 13, 2024 at 07:09:39PM +0100, Andrew Cooper wrote:
> All tools to build manpages are optional, and if none of them happen to be
> present, the intermediate working directory may not even be created.
> 
> Treat this as non-fatal, bringing the behaviour in line with install-html.
> Like the html side, it needs to be not-or to avoid Make thinking the rule has
> failed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

