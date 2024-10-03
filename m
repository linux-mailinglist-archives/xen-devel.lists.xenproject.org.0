Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980998EBF7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 11:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809210.1221414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swHg2-0002p0-F9; Thu, 03 Oct 2024 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809210.1221414; Thu, 03 Oct 2024 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swHg2-0002nB-CA; Thu, 03 Oct 2024 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 809210;
 Thu, 03 Oct 2024 08:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0QDS=Q7=bounce.vates.tech=bounce-md_30504962.66fe5cdc.v1-fd1ccc38f0e0447892f036cf9cebebba@srs-se1.protection.inumbo.net>)
 id 1swHg0-0002n0-4O
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 08:59:12 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0482f67-8165-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 10:59:09 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4XK5Fm0hJczRKLqbJ
 for <xen-devel@lists.xenproject.org>; Thu,  3 Oct 2024 08:59:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd1ccc38f0e0447892f036cf9cebebba; Thu, 03 Oct 2024 08:59:08 +0000
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
X-Inumbo-ID: c0482f67-8165-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727945948; x=1728206448;
	bh=DnaQOmgtpKihXwEX3e+F3OFuOYu4TbfWdL1ohbvSGHI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NQOuxt/swsXMFZPef90ANbTa3LVNY+LRVrezwq06cBadQ+1XpRvIrgmyaQ02uJULy
	 wKHBKicL68ow2fG0DAjJDiHnxfU4HgzjvJPDQfhTAS2rTMjYB91l9yQWDWBg8tptcF
	 ImgUShC9AuUuoeskToTNvW60jS9pifdysL31PBJMpaciY/h8DNN+D7ePl9GhcCndVL
	 jhjs5rV2SIPliOGOGbG/UQdSYXg0reKALYa3HIP49QjtORo3GZW6ezfX7FsRmMbwYS
	 MuJkbSOzLWveuLtLcMEkp1Qu3DxnnbAgmnJdutT7mh4UHmAOkm2oBW6qnayxn22ZTL
	 +ioB09/OaUxDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727945948; x=1728206448; i=anthony.perard@vates.tech;
	bh=DnaQOmgtpKihXwEX3e+F3OFuOYu4TbfWdL1ohbvSGHI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=peD/4CwAvCfctS2qhRGa7Z+SqNvooU/fvUO/jBUsgGTRQAlv2Ik3/KMVQkh8QzZCR
	 nZrZuMWN6NcyQinZ5r9IJiyDRqTBHi5sPGXlx3aeUHXNydQX4EWzhOCQu83r6qwfhg
	 g9MGFxitIcXDWXuVHkk34GELrXLXJv9Ej9HQxP1LxkyNOsvwekxp8ZDQFV9sR7NNp9
	 eu7nNpt02kHLbDvMMJqLMMn6EnLVVf6r538ZvnvshpxgQrvpl+JSH0qk0Hh03TK/EB
	 rJNaG+F0tScIJqpHvXM0LLmByBM0WqiaKm9VIMyswJVgsM62+3Co8BLGlqb3RMbvOc
	 JsLAQkS+c06TA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20stubdom:=20Fix=20newlib=20build=20with=20GCC-14?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727945946580
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <JBeulich@suse.com>
Message-Id: <Zv5c2ufz9lbMnpYp@l14>
References: <20241002224531.1966914-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241002224531.1966914-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd1ccc38f0e0447892f036cf9cebebba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241003:md
Date: Thu, 03 Oct 2024 08:59:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Oct 02, 2024 at 11:45:31PM +0100, Andrew Cooper wrote:
> Based on a fix from OpenSUSE, but adjusted to be Clang-compatible too.  Pass
> -Wno-implicit-function-declaration library-wide rather than using local GCC
> pragmas.
> 
> Fix of copy_past_newline() to avoid triggering -Wstrict-prototypes.
> 
> Link: https://build.opensuse.org/request/show/1178775
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

