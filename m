Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EDB558F2
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122680.1466221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC0z-0004M3-40; Fri, 12 Sep 2025 22:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122680.1466221; Fri, 12 Sep 2025 22:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC0z-0004Ja-0r; Fri, 12 Sep 2025 22:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1122680;
 Fri, 12 Sep 2025 22:13:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Abw/=3X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uxC0x-0004JU-QJ
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:13:07 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54c9722-9025-11f0-9809-7dc792cee155;
 Sat, 13 Sep 2025 00:13:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C34443492;
 Fri, 12 Sep 2025 22:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC43C4CEF1;
 Fri, 12 Sep 2025 22:12:59 +0000 (UTC)
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
X-Inumbo-ID: a54c9722-9025-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757715180;
	bh=Ccd/zGgaIQAigfpa2OWbRTTmobz6C5JGvboSwNSPcuk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=inXVFrwXrbDGrynPktjBgPQSVzTFJ4N/QSTNSb2jAcMMi1G0U2QSGtt1GM2f4Szoa
	 f1j+U/bSQNdFNUqwwVa8QWsNsTnvw33c8k4e5Qo2hUmd0Ca/SuTvAtIEBHIkPBC6HK
	 78PNOmGFxzQfsnWS0styy7Qb2XJsli1njVYQflJc4YY00aTtw9mSdHg0ITFgGM2mqq
	 Ci7XeTMXr2TspF8JO4+PaDZ/jZFzlqIo0qorIUKMtBWWjpx1FLCqOGQJ3VvrsSuM8h
	 XYzFMQri2oEUJatrLGUiTVf4hfjKuVEThWUi0JFp62baZZbq/Z9A8GTztNqLw5lHA8
	 8jvmNHLRTYXCw==
Date: Fri, 12 Sep 2025 15:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Grygorii Strashko <grygorii_strashko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
In-Reply-To: <705d4436-2263-462b-a582-5f0092821959@xen.org>
Message-ID: <alpine.DEB.2.22.394.2509121512450.628111@ubuntu-linux-20-04-desktop>
References: <20250911081213.1323594-1-grygorii_strashko@epam.com> <705d4436-2263-462b-a582-5f0092821959@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Sep 2025, Julien Grall wrote:
> Hi Grygorii,
> 
> On 11/09/2025 09:12, Grygorii Strashko wrote:
> > From: Grygorii Strashko <grygorii_strashko@epam.com>
> > 
> > Restrict cpu_up_send_sgi() function to arm32 code as it's used by arm32
> > platforms only and unreachable on arm64 (Misra rule 2.1).
> > 
> > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> > ---> Logically cpu_up_send_sgi() should be moved in arm32, but source is
> > "GPL-2.0-or-later" while possible destination is "GPL-2.0-only", so put it
> > under ifdef for now.
> 
> :(. I don't know if we will ever solve this license mess... Looking at the
> list of platform using cpu_up_send_sgi(), all the platforms are 10+ years old
> and to be honest except maybe the rcar2 development platforms. I doubt there
> are anyone using them.
> 
> So I would be tempted to get rid of them and mandate PSCI when booting on Xen.
> 
> Bertrand, Michal, Stefano any thoughts?

I am OK with that.


> Meanwhile for this patch:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>


