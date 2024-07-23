Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29393A8BA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 23:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763564.1173832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWN5c-00012M-0Y; Tue, 23 Jul 2024 21:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763564.1173832; Tue, 23 Jul 2024 21:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWN5b-00010f-UI; Tue, 23 Jul 2024 21:30:31 +0000
Received: by outflank-mailman (input) for mailman id 763564;
 Tue, 23 Jul 2024 21:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWN5a-00010Z-Qt
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 21:30:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83153fd-493a-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 23:30:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4FBCE60CEC;
 Tue, 23 Jul 2024 21:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357FBC4AF09;
 Tue, 23 Jul 2024 21:30:27 +0000 (UTC)
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
X-Inumbo-ID: c83153fd-493a-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770228;
	bh=WxEcs3fY1ITnMkf3dbLUx0s0dm5RYLdu/pNisLk1NIU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X8IJTUrEeCTmx+A4lqIVTuILQFoKAEZ4rhd+MbZtm2W+Y2+kD7x/Z/fVIkwkSCqVF
	 d3kBRmwjU24wzQgzOsfM/S7NIdEZ+ilRGpLrOXinHD3FX5i17crVb5D3rIPXLuC02p
	 2tkjWDiL3t3Wamq/A6xTlJ2B5w5iFOXbcaZVcT4LnSy+nwQVxD8/3NZpkdjHKbzimk
	 4RE4GB+Qfeljs3sEu6BOZHE6IdR2AhXzLMFGkset1mbvTBLf1knOa5jYZO01ghqgsu
	 o5Vs2AhegohxUzvIZivHv2eTylBCnbfgCV2lJy+XsRf/vQcB13eHPPmjmG7zg/Dqc4
	 TOeBofHKqlmmA==
Date: Tue, 23 Jul 2024 14:30:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/printk: Avoid the use of L as a length modifier
In-Reply-To: <20240723174129.67911-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407231426180.4857@ubuntu-linux-20-04-desktop>
References: <20240723174129.67911-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Andrew Cooper wrote:
> Coverity complains about it being invalid.  It turns out that it is a GCC-ism
> to treat ll and L equivalently.  C99 only permits L to mean long double.
> 
> Convert all uses of L in to alternatives, either l, ll or PRI.64 depending on
> the operand type.  This in turn removes some unnecessary casts which look to
> predate us having correct PRI* constants.
> 
> No functional change.
> 
> Coverity-IDs: 1464224, 1464228, 1464248, 1464261, 1464272, 1464281, 1464287, 1464290, 1494437
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


