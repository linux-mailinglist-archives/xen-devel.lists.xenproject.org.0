Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57593A94C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763597.1173873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNxc-00018i-Qa; Tue, 23 Jul 2024 22:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763597.1173873; Tue, 23 Jul 2024 22:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNxc-00015x-NB; Tue, 23 Jul 2024 22:26:20 +0000
Received: by outflank-mailman (input) for mailman id 763597;
 Tue, 23 Jul 2024 22:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWNxb-00015r-QU
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:26:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93d1c1a8-4942-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 00:26:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9443BCE0ACA;
 Tue, 23 Jul 2024 22:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F6AC4AF0A;
 Tue, 23 Jul 2024 22:26:11 +0000 (UTC)
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
X-Inumbo-ID: 93d1c1a8-4942-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721773572;
	bh=+AQm0bQOv2/cpkNn1NvR+q64ZrdF8pL0qIiJv2tyOTQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dDf3O3KhyF55NVTx0q4vKd/39ZMjuLQ9Fxv+c/OA9VMDogqdnjpAhHn2cbLEV1/T1
	 MBA/zkhGKjb/ywAA8c2bNI9mQ0Hnd/zp7XhfGiPlsJXMf8WNjIb9+HwVXYseCNID/I
	 e+XQEUyO52rT54meub7r1Cj0MRApMFWX+QLngYZD7bli9f9fLNLM+4/UksTCaaimUD
	 GERuphh2IGOqPEzDTUf4C/+60lJRxlmcDWnJKN2UzbtuUO6PRUDQred1cBkZpmcBrp
	 i5MznaOUof7SUzVhJ1nrCWBUDcCNgjnUYKFOjyv0SS+JEA+3oDm5/3AzIUmqurgcGP
	 RufImUECRp14g==
Date: Tue, 23 Jul 2024 15:26:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v5 12/17] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <42fbbb9ffb85893d049c80812b547ffb10ccda7e.1721720583.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407231523360.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com> <42fbbb9ffb85893d049c80812b547ffb10ccda7e.1721720583.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Alessandro Zucchelli wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Modify creation rule for asm-offsets.h to conform to
> the new standard and to not generate conflicting guards
> between architectures (which is a violation of the directive).
> Modify generic-y creation rule to generate code without violations
> and to conform to the new standard.
> 
> Mechanical change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



