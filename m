Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820192ECAE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757633.1166685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRweB-0006dF-Sf; Thu, 11 Jul 2024 16:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757633.1166685; Thu, 11 Jul 2024 16:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRweB-0006aN-PL; Thu, 11 Jul 2024 16:27:55 +0000
Received: by outflank-mailman (input) for mailman id 757633;
 Thu, 11 Jul 2024 16:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iuPQ=OL=bounce.vates.tech=bounce-md_30504962.66900805.v1-c9f8b512ae1f47b89ad4c05371383c3a@srs-se1.protection.inumbo.net>)
 id 1sRwe9-0006aG-MD
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:27:53 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c0c5a2-3fa2-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 18:27:50 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKgBF20d7zB5p4qB
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 16:27:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c9f8b512ae1f47b89ad4c05371383c3a; Thu, 11 Jul 2024 16:27:49 +0000
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
X-Inumbo-ID: 83c0c5a2-3fa2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720715269; x=1720975769;
	bh=wrYCUQxBJkYsYocqOe2tO8Hsu8wbbxLMy2ZxkFCR5X8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ggueGdldV9hxWeAwCpZD7iOiddAJwOE89RxEVQ4cNDQ0pl0OTflZ0+m+RcrC3Uj7n
	 D/xy454B+rybTos5Q5YJcnIZFNsRnsp4JT5jViz0+L7q3OS7aWWCXipf01ea2ikGfA
	 Z7X7JuvhqsRAgb45ksWPZBo93dG2ZmGx9Pah2pYMe+61xJkuVV3Otwp+287uF5//RY
	 HH5Y5C+vLT0EuE8BgkIVsRkEuuJ+5OWL1bM/2da61eHehLLiBbyBnmcEhDtudJRvxg
	 EcEo6Kdy0Yrd7JzvvXbPujSYRslZteo5P9nz0MvFpMcyLX9mxA/LE0enRGrQOFQqiG
	 Z6rdEvGm1NV8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720715269; x=1720975769; i=anthony.perard@vates.tech;
	bh=wrYCUQxBJkYsYocqOe2tO8Hsu8wbbxLMy2ZxkFCR5X8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=X8RdASUFuJArm8gf3LUFTHluxR7DkaVYucNYNlYTYDPcHRhOj36MEs1IHbQrFOCpc
	 j7deXglD8df6RijkguzWBauuJRRLLGZTxkRFaEgKfSTveZZh3MmNbfNI6JAYbpzPRW
	 eBQHsnZbbsPdvca0MK3J5RafAn14bRR+/RCOwRMd4JiK/nPj92uhqySKYWoWPSupR+
	 cbOchwIhvp2K4Azy2WDQaWz4wjtoveMYk4ahk72Bmlga4+lCNK2KSzESofsnZs+FF8
	 LprEqLWzApv6kNqhVv46zGyf9eikfvAufeh5dNyk6e++9pStK2sZAtG+YI0c5H0M7S
	 ycVW/GgNMAGUw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2009/12]=20CI:=20Refresh=20bullseye-ppc64le=20as=20debian:11-ppc64le?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720715268002
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpAIA2SzOxvjmuVh@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-10-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-10-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c9f8b512ae1f47b89ad4c05371383c3a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 16:27:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:14PM +0100, Andrew Cooper wrote:
> ... in the style of bookworm-ppc64le
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

