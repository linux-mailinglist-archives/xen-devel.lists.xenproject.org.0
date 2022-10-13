Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EB5FD1E9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 02:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421532.666931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimWC-0006Fw-5f; Thu, 13 Oct 2022 00:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421532.666931; Thu, 13 Oct 2022 00:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimWC-0006Dk-1V; Thu, 13 Oct 2022 00:56:12 +0000
Received: by outflank-mailman (input) for mailman id 421532;
 Thu, 13 Oct 2022 00:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8Z/=2O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oimWA-0006Dd-Ou
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 00:56:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d23b32da-4a91-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 02:56:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E61D4B819F4;
 Thu, 13 Oct 2022 00:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1FCC433C1;
 Thu, 13 Oct 2022 00:56:04 +0000 (UTC)
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
X-Inumbo-ID: d23b32da-4a91-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665622565;
	bh=66MHEqgacifMYHlGPJDL6vHpddMit9yKPTRA+6tWWlg=;
	h=Date:From:To:cc:Subject:From;
	b=mPeES/ipOSrGeLo5on6U+JluMoIB8+JWyejBIehMQBz38Vjh68GeegXJ2oE9xC4jE
	 2Qc4DcoK3+7udQyB+kGKd6SN4PiIZX/WWve/z0wK7QWb9qgrwlJ973GHnnJSlbcoVo
	 knSpAf1dCQkgl61G/bg9mMsByCOJkIefHOTQQW4ckp5U385t6XZIIGKRTWL0pJP5yV
	 YYghS8V8iv7FndQoy+y+vA12Goy7zhquAKnIRowt9hv1QyaRQB3PECDaDWqMXucp6C
	 15B1r5yK8rgAqvH+01fqten7OHpnVW/5hIg9wvqNb7nUAtbJsdqBZfRe6SaEXw7J+5
	 hRAKusCgcOuTA==
Date: Wed, 12 Oct 2022 17:56:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, jbeulich@suse.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: [PATCH v4 0/4] introduce SPDX
Message-ID: <alpine.DEB.2.22.394.2210121752580.3690179@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small series introduces SPDX tags to Xen:

1) add a mention to SPDX in CODING_STYLE
2) add a LICENSES directory with licenses and SPDX tags
3) adds the SPDX single-line comment to arch/arm/*.c

Note that arch/arm/*.c is just a start. Also, to make the changes as
mechanical as possible I restricted myself to:
- adding the single-line comment at the top of the file
- removing the copyright lines (when present) from the top of the file
  header

I purposedly restrained myself to do other cleanups to the headers: this
series already touches many files and I prefer to keep these changes as
mechanical as possible. Further improvements (style improvement,
removing what's left of the header, removing copyright lines, etc.) can
be done with subsequent patches more easily.

License changes are not intentional.

Cheers,

Stefano

