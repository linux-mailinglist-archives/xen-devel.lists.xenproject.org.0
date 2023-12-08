Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DE80978E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650285.1015655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP0b-0003HD-44; Fri, 08 Dec 2023 00:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650285.1015655; Fri, 08 Dec 2023 00:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP0b-0003G7-0m; Fri, 08 Dec 2023 00:46:25 +0000
Received: by outflank-mailman (input) for mailman id 650285;
 Fri, 08 Dec 2023 00:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBP0Z-0003Ej-GK
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:46:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35462b62-9563-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 01:46:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B91CDB82ACB;
 Fri,  8 Dec 2023 00:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D586C433C8;
 Fri,  8 Dec 2023 00:46:20 +0000 (UTC)
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
X-Inumbo-ID: 35462b62-9563-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701996381;
	bh=66yUa1tDw72SCJa2/7shAl04DAdoMpA7Yx3wR3n/a/E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nBMqn/R3Z6HE69a7SR0Fotq5Lsex0/er/wq5cKXlTPki2BtRx3YsEryQs5BjBTUx9
	 3+wLqwwpd1I2Uaz8vPdhORjhHkrVENYVVRxlsPbrSfmoNvp+Y1xPNlg1+FX/pg5N04
	 5ckOrpzn8Aid52LlwAjMrcOnZBeomT14EIjxdLr8gcSaUBcSj4hUkhpI+kkNxtWy5R
	 OIzp1nb2OyLtECuKP7MKLFXWbxef67+b3a1ld9W+bWigjmIZkoBL4B7tE92PBOnmrv
	 lAYCaYmpmkwkUBtdpnIQKGj6iW6NZotvZW0jMBlX1vWcQidlcFUJlHd27WqwMDPdk0
	 hEXbk+MqB+okA==
Date: Thu, 7 Dec 2023 16:46:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 1/3] AMD/IOMMU: address violations of MISRA C:2012 Rule
 14.4
In-Reply-To: <097df7703c372a687206251fe97bfc5df18222b6.1701941924.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071646060.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com> <097df7703c372a687206251fe97bfc5df18222b6.1701941924.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


