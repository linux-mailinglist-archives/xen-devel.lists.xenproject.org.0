Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C5A04FE6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 02:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866843.1278196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLCz-0003gz-Ez; Wed, 08 Jan 2025 01:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866843.1278196; Wed, 08 Jan 2025 01:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLCz-0003f5-9U; Wed, 08 Jan 2025 01:50:09 +0000
Received: by outflank-mailman (input) for mailman id 866843;
 Wed, 08 Jan 2025 01:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X11H=UA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tVLCx-0003ez-NX
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 01:50:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e110e1ad-cd62-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 02:50:05 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736300994381761.1501356937698;
 Tue, 7 Jan 2025 17:49:54 -0800 (PST)
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
X-Inumbo-ID: e110e1ad-cd62-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736300996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lOv9UsmBmv7zxEyv+vmPDxBwrrQzoy1A7jRz19NNR1CTve4QdbiQNTK7l0gCVV/354RTu7ONES9N596F0lnEjCwqgWTCTChVaJ2meG17AFDgPdvkZF7I/P03IbFhfkIRAnV5i8WuJhFrlytNAPOBhRVEsT3SwMyPZqer8HsfiuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736300996; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hIgidbHmUnJODbaXHkDMjlG5IKIvy0h27UD0lVOMdgw=; 
	b=dqxKywk3LUr4fgHjNHeNKiQ28jiOJvIvJywLBMnf0tW/gbJ2FyT5euNc1lQMEqbGR+HHzbml1skh5r3TAI1yGhAD4NyPSCRlKl4xDQtjQxqNceEPvXn/ixUuAPWy4rr2gKzsNhwEYUNfGDjRC81bVL6o3Ihs0BPei/KeHNP6is4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736300996;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hIgidbHmUnJODbaXHkDMjlG5IKIvy0h27UD0lVOMdgw=;
	b=OtejgH7f/rR+BIMja+ankEmI2T8qnABmC2pcTWW1jteuNhEtTb/VyPZlrJbBvv0b
	aGVe0/g36P0HW8RJoJuMvo08P8dBsUsbCpemAo0c53L//kp9uaUUwKhzhZlEq2idt1i
	U1PBh5WKOsKPu/9JaBeO5QPfziyZEWBTHEzvsg+c=
Message-ID: <0b451cc7-c6b7-4246-bc6e-16c409cba882@apertussolutions.com>
Date: Tue, 7 Jan 2025 20:49:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 1/3] xen/flask: Wire up XEN_DOMCTL_vuart_op
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, oleksii.kurochko@gmail.com
References: <20250107092719.26401-1-michal.orzel@amd.com>
 <20250107092719.26401-2-michal.orzel@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20250107092719.26401-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/7/25 04:27, Michal Orzel wrote:
> Addition of FLASK permission for this hypercall was overlooked in the
> original patch. Fix it. The only VUART operation is initialization that
> can occur only during domain creation.
> 
> Fixes: 86039f2e8c20 ("xen/arm: vpl011: Add a new domctl API to initialize vpl011")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


