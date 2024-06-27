Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC791A842
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 15:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750109.1158369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpSS-0007PW-U5; Thu, 27 Jun 2024 13:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750109.1158369; Thu, 27 Jun 2024 13:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpSS-0007N5-RC; Thu, 27 Jun 2024 13:46:40 +0000
Received: by outflank-mailman (input) for mailman id 750109;
 Thu, 27 Jun 2024 13:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKKR=N5=bounce.vates.tech=bounce-md_30504962.667d6d3d.v1-aa0f840678284325ab682a903935b7fc@srs-se1.protection.inumbo.net>)
 id 1sMpSR-0007Mu-AI
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 13:46:39 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf3deee-348b-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 15:46:38 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4W90Gj1lmQz35hb8X
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 13:46:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 aa0f840678284325ab682a903935b7fc; Thu, 27 Jun 2024 13:46:37 +0000
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
X-Inumbo-ID: acf3deee-348b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719495997; x=1719756497;
	bh=ZWn4d2IKJRseAJtsb8ByU866UJ02444cd+xNbgechO4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ogAHlDW7Gvb8Vfm8xXSG2RIxlvlcO3koPyMz6aZgDwiaWcKJ+0jTzHyzMzu8NkW/p
	 SSmcLXTZAkmC71616+v6uPVVfB/0JuEhgmkdbqN+oJ48zlfchJUh7nP+1CPEhEagt+
	 vaYsTd+pJwj5GB/TMYuXy89DCTp9TumQkVuHveC7V8tPmvIhZkKkSmFEfWhoGyEnAR
	 diq0XLxfBYa04MdexyJtXeP/FV2TqRYiwysdSVCmhlbtHRI4k1FSlPLWfZLjP21OQG
	 zYDQGOazYPTyRAsGhnpD1HppU+HcDz4U5a9plhehkd0C97bXXX61EgIuv3+FqWZI5F
	 Fi7KLiuLN5ePA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719495997; x=1719756497; i=anthony.perard@vates.tech;
	bh=ZWn4d2IKJRseAJtsb8ByU866UJ02444cd+xNbgechO4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SHajtEMYeIRUdcejO+Q5MD6s6sSBKvSJL9vvlJeBgJKvDhM5WRjRjmdoy4PtFzRG6
	 v0GGnYaUtCHlsvqhLqecEAcTrdxJ3lapiP1r7A1QMaifcNWFv1Lrk0p+5iUASjncbJ
	 dcHAj7agjzr4hFmGhDK1wxZxzOvIP5kdtf9diO36IRJ1AZSOAytIVEYUvPnQotxd2i
	 gzi7xVcDJcEadCYfLmbSRvAfnpGCWvsm7grd2zIE+NwWSbqaV4P/w+mG5gkzM9a5tD
	 jYdVJX1e2hZyFqqwSJKdTjnRCNWMiC5CWfWF7TIIe1OBinf9Y1yYvLsTdlHSrJIWNB
	 hFgmu08j5eJJg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19]=20tools/dombuilder:=20Correct=20the=20length=20calculation=20in=20xc=5Fdom=5Falloc=5Fsegment()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719495996062
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <Zn1tO2h6aps4Dwdc@l14>
References: <20240627130134.1006059-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240627130134.1006059-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.aa0f840678284325ab682a903935b7fc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240627:md
Date: Thu, 27 Jun 2024 13:46:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jun 27, 2024 at 02:01:34PM +0100, Andrew Cooper wrote:
> xc_dom_alloc_segment() is passed a size in bytes, calculates a size in pages
> from it, then fills in the new segment information with a bytes value
> re-calculated from the number of pages.
> 
> This causes the module information given to the guest (MB, or PVH) to have
> incorrect sizes; specifically, sizes rounded up to the next page.
> 
> This in turn is problematic for Xen.  When Xen finds a gzipped module, it
> peeks at the end metadata to judge the decompressed size, which is a -4
> backreference from the reported end of the module.
> 
> Fill in seg->vend using the correct number of bytes.
> 
> Fixes: ea7c8a3d0e82 ("libxc: reorganize domain builder guest memory allocator")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> 
> For 4.19: This was discovered when trying to test Daniel's gzip cleanup for
> Hyperlaunch.  It's a subtle bug, hidden inside a second bug which isn't
> appropriate content for 4.20.

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

