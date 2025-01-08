Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927EA04FE8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 02:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866859.1278217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLGe-0004sh-6a; Wed, 08 Jan 2025 01:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866859.1278217; Wed, 08 Jan 2025 01:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLGe-0004qO-3v; Wed, 08 Jan 2025 01:53:56 +0000
Received: by outflank-mailman (input) for mailman id 866859;
 Wed, 08 Jan 2025 01:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X11H=UA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tVLGc-0004qI-Bs
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 01:53:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6912fa6e-cd63-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 02:53:53 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736301225745550.1266495760739;
 Tue, 7 Jan 2025 17:53:45 -0800 (PST)
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
X-Inumbo-ID: 6912fa6e-cd63-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736301227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NXZtcB9dXuJnmHVSp3YIlSfIiiohANikwjmhch3tt2OcdaKzZlfsZBLOXdYm1Juh5+8EA3jWM8icS311sEOO4KNoMDSyJVhAeVz8XhSwfZdHAQF/bBW2o7eNYqr39+mDLZNguAIF08L8nU3IvKCJD63qiqE5ivns6gG/X7kWRbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736301227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f5rAzbD51Gu5Ski3hdUO3bS9t3PSh+Y0Ojx3QKI5X00=; 
	b=JncDwuo/qwDvxzEtsZ6TnUS/RM3l0HyeDnjAntMu3ft4LUKucgMxtdG8aLql6MTgqJcqgPLBbOHGcVxFsW84kTADIfpwkzE3o14DUOxm15+H3QvCHuqiiLDhGwSVNv+VMWSCPmbiz8k1DNBnB8BKCNhYHUxQmTO01H6g5vRD6q0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736301227;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f5rAzbD51Gu5Ski3hdUO3bS9t3PSh+Y0Ojx3QKI5X00=;
	b=i2PDaaOoC+rfDsBi8s1O+8I6Y0t/6E1UpKp0f3YERhXm6Hnzz2ZBs5ztdgWBgT0L
	J2V6zGIBUlJ7n3oPYnxeqfkw7zL0dVxGQgASt/WWF/8UX+yyTsztHY2BDw9STGgFsN/
	1fbALEfrHIo7f/a1+DAXDGOyHCDKTvYfKmG6Zxlc=
Message-ID: <d1c16342-2c79-49ac-8856-e428a5503d2c@apertussolutions.com>
Date: Tue, 7 Jan 2025 20:53:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 2/3] xen/flask: Wire up XEN_DOMCTL_dt_overlay
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, oleksii.kurochko@gmail.com
References: <20250107092719.26401-1-michal.orzel@amd.com>
 <20250107092719.26401-3-michal.orzel@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20250107092719.26401-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/7/25 04:27, Michal Orzel wrote:
> Addition of FLASK permission for this hypercall was overlooked in the
> original patch. Fix it. The only dt overlay operation is attaching that can
> happen only after the domain is created. Dom0 can attach overlay to itself
> as well.
> 
> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

