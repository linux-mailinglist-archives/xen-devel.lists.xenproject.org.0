Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BC653A51
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 02:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468165.727234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8AO6-0002Ud-38; Thu, 22 Dec 2022 01:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468165.727234; Thu, 22 Dec 2022 01:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8AO6-0002SQ-0H; Thu, 22 Dec 2022 01:28:46 +0000
Received: by outflank-mailman (input) for mailman id 468165;
 Thu, 22 Dec 2022 01:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8AO4-0002SK-Im
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 01:28:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f882c2b0-8197-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 02:28:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50ADF61991;
 Thu, 22 Dec 2022 01:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C90C433D2;
 Thu, 22 Dec 2022 01:28:40 +0000 (UTC)
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
X-Inumbo-ID: f882c2b0-8197-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671672521;
	bh=pcq4noVN44qXKSPwsK1LM45nUl5SHRgV7vAjL/k+aj4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kADvqb7tzIZt3f2N4GDqR8Y0bRoeVi1A/4TqImj0mrddOL/mSviErk5oa5pNpi8+J
	 dXn1Bm/OGbWVVylyjhR8ABmIFsqaKlM3OtKT36kNZUJvL1KtAS/HDfW2bs7YcqFmck
	 cXmWsbTtrf9/UJ0DZ5ukGJ918u7p6uT5STTbDffhJNahAfJE+vEvcnDSykvhZQr4eu
	 CiBS6p/YP/+ufGwNmBCSCFzmBpdwKZOn+zf7uaVIZ3ozN18ABMMT8MqWQtfH1Rzqkk
	 zT3XTOHvo2LcWy1GvFFuGlJ7HYHvWnsrBi/1/KSrdWPwUy36NNPNsDAQ15vzEEnuwM
	 IoVG6iq5DDqFQ==
Date: Wed, 21 Dec 2022 17:28:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [RFC 0/7] Proposal to make x86 IOMMU driver support
 configurable
In-Reply-To: <15c3c5bd-6229-d070-ebe0-ce4c6d827f1b@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2212211726410.4079@ubuntu-linux-20-04-desktop>
References: <20221219063456.2017996-1-burzalodowa@gmail.com> <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com> <15c3c5bd-6229-d070-ebe0-ce4c6d827f1b@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1732106374-1671672521=:4079"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1732106374-1671672521=:4079
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Dec 2022, Xenia Ragiadakou wrote:
> > We need to decide whether it is sensible to allow users to turn off
> > IOMMU support.  It probably is, because you could trivially do this by
> > selecting CONFIG_INTEL only, and booting the result on an AMD system.
> > 
> 
> I cannot understand. I guess that if the code for the target system is
> disabled, Xen won't boot ... hopefully :).
> 
> If users are not allowed to turn off the IOMMU support, it can be always
> enabled unconditionally via Kconfig select based on the virtualization
> technology or other.

Just wanted to say that it should be fine either way. If we don't want
to provide an option to disable the IOMMU, then it could be handled at
the kconfig level.
--8323329-1732106374-1671672521=:4079--

