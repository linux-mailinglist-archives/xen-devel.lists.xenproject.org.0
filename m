Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD557A04FEB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 02:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866866.1278226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLJE-0005Pv-IW; Wed, 08 Jan 2025 01:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866866.1278226; Wed, 08 Jan 2025 01:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLJE-0005Nl-Fw; Wed, 08 Jan 2025 01:56:36 +0000
Received: by outflank-mailman (input) for mailman id 866866;
 Wed, 08 Jan 2025 01:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X11H=UA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tVLJC-0005Nf-SI
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 01:56:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7e42aa1-cd63-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 02:56:32 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173630138292524.407803060130504;
 Tue, 7 Jan 2025 17:56:22 -0800 (PST)
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
X-Inumbo-ID: c7e42aa1-cd63-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736301385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WtRzUXswvK4w1dp/5iy0T2Trt4Tl4ndbOjmJ1py/4CcUYzd1HW84hOSNGHQFm4+LI/oYH+6PgybidTM5s/vSEdHSRjeE1aB+OCE2QeubIxkVusP2xhhKJcxo5sqt/7dZHazWisr8c5OGVp7qE9iR7pdJ0Fot0slEOTSXHfyJ70k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736301385; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j/UHAXabWRNv8tS5eRWY1L4PwWCsosIyiixLhG9TivA=; 
	b=dvT9lMB/Wg/LfHMrZWcHjrzahHFfOP1Pdh3GOhkWkX6h5OgwNOkzfdnHMDTKRJOektywEVYfT/H03AtyzUkcJibvlPZOYMO0T+DgTHbFz0riFqA2oO3N4ZUfCmEk3ImHfK/uBW/n/2mjzvkiqCBSl9O1N/X1s1GmPp7gn0GCP+I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736301385;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j/UHAXabWRNv8tS5eRWY1L4PwWCsosIyiixLhG9TivA=;
	b=SBtgm2ydtXRPXPlsMokLjEF6rI1WoNjF4obms6eYpSNGqiEtYsw8GoBErrfh32Od
	ardFI48ddEa8wWOZBdAsNkwL5c4pvLU1iQOxQQMBNik1FbGBhuezUADRT/Z0H3GqRnU
	R7x6QkeRTHgxAWANZE33iqAbjOhNDkuRwCt7QAHc=
Message-ID: <c9b81316-c804-4bf7-9923-ecc5cf26097e@apertussolutions.com>
Date: Tue, 7 Jan 2025 20:56:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 3/3] xen/flask: Wire up
 XEN_DOMCTL_set_llc_colors
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, oleksii.kurochko@gmail.com
References: <20250107092719.26401-1-michal.orzel@amd.com>
 <20250107092719.26401-4-michal.orzel@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20250107092719.26401-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/7/25 04:27, Michal Orzel wrote:
> Addition of FLASK permission for this hypercall was overlooked in the
> original patch. Fix it. Setting LLC colors is only possible during domain
> creation.
> 
> Fixes: 6985aa5e0c3c ("xen: extend domctl interface for cache coloring")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

