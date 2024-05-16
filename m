Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B08C6F9E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722720.1126975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P8n-0006Iy-Ru; Thu, 16 May 2024 00:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722720.1126975; Thu, 16 May 2024 00:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P8n-0006G7-Oe; Thu, 16 May 2024 00:38:37 +0000
Received: by outflank-mailman (input) for mailman id 722720;
 Thu, 16 May 2024 00:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P8m-0005qV-Mg
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:38:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0ed0ad9-131c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:38:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C716A615F7;
 Thu, 16 May 2024 00:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A100C116B1;
 Thu, 16 May 2024 00:38:33 +0000 (UTC)
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
X-Inumbo-ID: a0ed0ad9-131c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819914;
	bh=UHDD/UovjdkBTkxgFuBNpZd8jvAC/eLri3nFPg2FeUQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WB3aDR13KNoeXE840XddpR9vOZXDcJre3yiOHwGt2gGAHN9Va1LsSnEkCApSa2wrO
	 06OACOJYmeHT0TsDcc4/6iDsQUMOaTd4iwVeMJhl1O7VnjwU/BHS9rlSYTE8TacB7n
	 8z8ssDzt66jR08ytVRrGAhQ6Oh82RdihzRBBydZrfoeUrG46omxc5+mgOSRwZQhvLH
	 9YkbyM0nVAq5LZpXfXe5kMUNpI2iyhYnyX06fDgT5xK3lrsDxG4IIpvaH07ujJQSdi
	 CYuyFjPWd+2H5CWmruD0omV2z7uf5kaqfytKI+DBagtKbTR/KqjfYxnxnGEqFb547+
	 2Hl3iZ6v5z9Ug==
Date: Wed, 15 May 2024 17:38:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
In-Reply-To: <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151738130.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> As we now have SVM/VMX config options for enabling/disabling these features
> completely in the build, it may be feasible to add build-time checks to
> cpu_has_{svm,vmx} macros. These are used extensively thoughout HVM code, so
> we won't have to add extra #ifdef-s to check whether svm/vmx has been enabled,
> while DCE cleans up calls to vmx/svm functions, if their code not being built.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


