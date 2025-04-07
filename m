Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF649A7DCD7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939764.1339742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1l0u-0003ZW-PF; Mon, 07 Apr 2025 11:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939764.1339742; Mon, 07 Apr 2025 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1l0u-0003YK-M4; Mon, 07 Apr 2025 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 939764;
 Mon, 07 Apr 2025 11:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXMY=WZ=bounce.vates.tech=bounce-md_30504962.67f3bc44.v1-35d2ee55a2ce4d18ab7a95c563c93064@srs-se1.protection.inumbo.net>)
 id 1u1l0t-0003XD-Jc
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:51:39 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ff8976-13a6-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 13:51:34 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZWSGr63MKzS62Gxg
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 11:51:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 35d2ee55a2ce4d18ab7a95c563c93064; Mon, 07 Apr 2025 11:51:32 +0000
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
X-Inumbo-ID: a6ff8976-13a6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744026692; x=1744296692;
	bh=qtEn71v2OpHuKrtjo6onZ8xiQ5N+mWlANeV/iledBtE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yemBJ3w4icVqpe4GCcSRRl/GAIYUOKDqTL21sVgt0GHIGpK9MhOoKIUkUmLnjMcFc
	 vF+XJC+tfXkiPsuCqb0Pzd5q6t5lPEHNAlRrFCmbvTOWOAeCHVoJiGmpoISaiq0Qwd
	 ueoSCv+GBuHmCtje6rLRPPi2CJU5C8A7GFUMYye040i+nZ6lt2wZt0IFRvWEqqGSja
	 Xas8JFZvU8QvdasMT6oeYvlfLlXa/rFYNLmLAyNx9Bx0RJjXTYUKrnRD6zjUtvYKAx
	 H+gtsYyU2kSmXo1RCldANyypPIU6sc5hK1B8KXSQsROsb4Jg04AfV7dZIgA25rvYqD
	 yJMASPeCID8Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744026692; x=1744287192; i=anthony.perard@vates.tech;
	bh=qtEn71v2OpHuKrtjo6onZ8xiQ5N+mWlANeV/iledBtE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BI88uEHCy1bJu77Y5yOzEssnKorjgwv9E0xMaz/sKjC6GOYReMeEoUBYaH1Xjs3Oj
	 r1rj25nxOjYQnavBW3971XgZN956GnR/a0oy7F8oaPAceG9nBStqcHwkOmTK7adbg9
	 pBNng/Uus3J1haJ8/iDo1BZD1NpoO+d0NvTAy1Vc/fRA24Eos301oCzp5tNde3+K+P
	 rU8MZTQa5D6IvpCyHv+8Xtu4U9HMvimDgBD2C/pSbCDSCXmC5oAUo3B0OxFCtjmxIk
	 kA0VtgtSI1/dWLkD4WMlWpU6H0FqfpFBeJkGZSXHeJ7iDt2dS7mkuwkwKO7IN6UUuf
	 7yANzzDnIAm8g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/libxl:=20do=20not=20use=20`-c=20-E`=20compiler=20options=20together?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744026691708
To: "Roger Pau Monne" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Message-Id: <Z_O8P-W56XQZnQd3@l14>
References: <20250407110938.68174-1-roger.pau@citrix.com>
In-Reply-To: <20250407110938.68174-1-roger.pau@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.35d2ee55a2ce4d18ab7a95c563c93064?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 11:51:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 01:09:38PM +0200, Roger Pau Monne wrote:
> It makes no sense to request for preprocessor only output and also reques=
t
> object file generation.  Fix the _libxl.api-for-check target to only use
> -E (preprocessor output).
> 
> Also Clang 20.0 reports an error if both options are used.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 2862bf5b6c81 ('libxl: enforce prohibitions of internal callers')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




