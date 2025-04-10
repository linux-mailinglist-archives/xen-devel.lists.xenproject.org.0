Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D6A8459D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945774.1343893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2sVW-0006WI-KE; Thu, 10 Apr 2025 14:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945774.1343893; Thu, 10 Apr 2025 14:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2sVW-0006Us-Gk; Thu, 10 Apr 2025 14:03:54 +0000
Received: by outflank-mailman (input) for mailman id 945774;
 Thu, 10 Apr 2025 14:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PtDs=W4=bounce.vates.tech=bounce-md_30504962.67f7cfc5.v1-244598b51120453594d2e594126818b6@srs-se1.protection.inumbo.net>)
 id 1u2sVV-0006U0-DF
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:03:53 +0000
Received: from mail177-19.suw61.mandrillapp.com
 (mail177-19.suw61.mandrillapp.com [198.2.177.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0da630b-1614-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 16:03:51 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-19.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZYM45597HzJwJ
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:03:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 244598b51120453594d2e594126818b6; Thu, 10 Apr 2025 14:03:49 +0000
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
X-Inumbo-ID: a0da630b-1614-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744293829; x=1744563829;
	bh=94p1xXAvMSr+g/X8AYh+JeeYwBufCC7qjH0k1q3kpKY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HyihCjd1woJPcl8eviF2RYUcREjM2yVIh+fKokqQ2B46HsZFrjVUUi064mgKGfmgU
	 Euc0547rFYLSxLRd45d3SdOmEpir7sBL1vP52oAdNE5R/WMuW5CwheeHq57mJa0GK1
	 QpBAqCY/sxbzeUfHM9rM4vdeTUIYOt7O5R+pEgQDnYF6HWTs/J0VC1mKULELjWzPdG
	 IjtwcBX2M8kqA+WsggY4psNS5iLNb2viKoSLNtzxdkhQmi/A1mLCV+yJpC2kqKnHPR
	 n8DNaz2NhGIdE1ZYuw9MLttKnTuDkWI7TFYSxwZsBXoV4ZSuFDLro7Phjiw3BqUxkY
	 zuSvguRqQk94A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744293829; x=1744554329; i=anthony.perard@vates.tech;
	bh=94p1xXAvMSr+g/X8AYh+JeeYwBufCC7qjH0k1q3kpKY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sNjaw2yP4G9jCPfw+dpZjnRiPArh/hQ9/WzzBjEU/imMyJY3APXwal/uJ915Rrmvd
	 fanBHxzsyTOuif9dl26Q2bvBkfcy4oXGsTso/q8qTVv/jzfiTHZ6W8/r52LPK9yn/6
	 hAi99VJr4njLs1AVxj3hgKlzXzbBWtWAZ09v2fnG0xdnGxmNmBZ6bT39RQRKnh65i5
	 tE5FHKh2U3gISzRDTBaeOqgxEuOnKWdvdTCFQsaDECsTY/tcc00apkiPp66Z5kacNi
	 3W/YbTThU2/KYq5ckeF0Ija4YvvuSIEXTMpH6i1iXcP+PpfLc7YJukKAwRgls+yEiw
	 JQIc37fxigtMQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=206/6]=20Linux=20builds=20for=20x86=20and=20ARM64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744293827547
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_fPwwHQ4baXbg-a@l14>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com> <20250410114628.2060072-7-andrew.cooper3@citrix.com>
In-Reply-To: <20250410114628.2060072-7-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.244598b51120453594d2e594126818b6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 14:03:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 10, 2025 at 12:46:28PM +0100, Andrew Cooper wrote:
> For ARM64, the tests in Xen currently use 6.6.74, but 6.6.86 works so update
> to the latest.
> 
> For x86, stay at 6.6.56.  There's a PVH regression upstream in need of fixing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



