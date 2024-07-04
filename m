Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06E9271E8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 10:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753621.1161812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPI1t-0005Ir-Ao; Thu, 04 Jul 2024 08:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753621.1161812; Thu, 04 Jul 2024 08:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPI1t-0005GN-6K; Thu, 04 Jul 2024 08:41:25 +0000
Received: by outflank-mailman (input) for mailman id 753621;
 Thu, 04 Jul 2024 08:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IYk=OE=bounce.vates.tech=bounce-md_30504962.6686602e.v1-d0001d61f498441db65f8dfc174bbf2c@srs-se1.protection.inumbo.net>)
 id 1sPI1r-0005GH-Mj
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 08:41:23 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f8e5a0b-39e1-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 10:41:20 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WF99C0mn7z35hYbw
 for <xen-devel@lists.xenproject.org>; Thu,  4 Jul 2024 08:41:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d0001d61f498441db65f8dfc174bbf2c; Thu, 04 Jul 2024 08:41:18 +0000
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
X-Inumbo-ID: 2f8e5a0b-39e1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720082479; x=1720342979;
	bh=7O573AZm1Kh9wV2KaCajqtMZbo71gXpjVbYEO+3OHbQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d/Ta6fdbpBWGmiBOleHvGlmdPQT2rpzU2egviyr3dfEwVk3pK2EyvKylrx6jJTVPI
	 sLj3vnj0alIgKWEuB30RjmYlrvL/LmzTW/3PX5bP12+PI6OIiT527mb25BWHGjNSyK
	 ffQugylZqOgXG/T3TOJIexF2clD/xR+dyapk+tbA3bErKLyijTi9HYdRub+eiz97sk
	 TT9qz7orv/YfIUZdrjzna3sTpltnHNs/LYbqASpi6nNxGpUWSqwrHCrx3vSTBW3tkK
	 yvKjoYfKTZBm83MI59jsSTPNW7QMlX2dbfX3XxaiWMozSdtXr0uIWcw77sjgZG+0lT
	 jgtxGYxPbSnug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720082479; x=1720342979; i=anthony.perard@vates.tech;
	bh=7O573AZm1Kh9wV2KaCajqtMZbo71gXpjVbYEO+3OHbQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1TC5xpw/sQAv0X6kezGT63GaT/Ix+YGSc2vws+JGTYAejTq2rQisPQjmwNiOaD/rl
	 3DDDXUdMuzErPOW0mXHSm8fneg8WbwTtlyZWGWWVT+iieYwVFVGPQ12hbmTFxDh7E9
	 6D89kIVpOw4YCxXq8xP0olbtIVZKSnP3LFdvsexq8AEz3AkCdAZIshXP8yThNNj+xF
	 HC+Q7zJclpN97+MQ2QQdBtNkewxFHgUMR1JIjSeLGIeuWmuCNkLkEYroJFSb9Fe11k
	 VW+TLdILHfCW90/JlawfzoAFSI4rc/noGtQcUXZHRuyjXKAh5iadero4F81hZHzkGl
	 gI8O85yzI23bQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20build/mkheader:=20Remove=20C-isms=20from=20the=20code?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720082477913
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZoZgLXXqzpDt+iML@l14>
References: <20240703225525.1759907-1-andrew.cooper3@citrix.com> <20240703225525.1759907-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240703225525.1759907-2-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d0001d61f498441db65f8dfc174bbf2c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240704:md
Date: Thu, 04 Jul 2024 08:41:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 03, 2024 at 11:55:24PM +0100, Andrew Cooper wrote:
> This was clearly written by a C programmer, rather than a python programmer.
> Drop all the useless semi-colons.
> 
> The very final line of the script simply references f.close, rather than
> calling the function.  Switch to using a with: statement, as python does care
> about unclosed files if you enable enough warnings.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

