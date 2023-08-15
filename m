Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B7877D62B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 00:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584128.914570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW2aa-0004UM-MY; Tue, 15 Aug 2023 22:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584128.914570; Tue, 15 Aug 2023 22:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW2aa-0004Rg-JX; Tue, 15 Aug 2023 22:32:36 +0000
Received: by outflank-mailman (input) for mailman id 584128;
 Tue, 15 Aug 2023 22:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVlh=EA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qW2aZ-0004Ra-Q2
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 22:32:35 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f0bc530-3bbb-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 00:32:32 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1692138739772690.6358820972288;
 Tue, 15 Aug 2023 15:32:19 -0700 (PDT)
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
X-Inumbo-ID: 9f0bc530-3bbb-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1692138742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jueAxcKrv7wdEua03zqLTvKcsh1cye/MeWF6Ow500sFiDLxSIE56FJJuRd5U8c80li8fzVNQw+1+7+nBM+xLzXFDZBbFA+oQKnEDcgQJIIbCaEjBG9mKuDpmsf9D0vH2lWPMvsg4NXFqYDB4vqrZcevv3shk6O5OcChrDz7LcE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692138742; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GX6tOIvF2bCJ1RYYPrwz+vomp1Lb9M1jZE9uMZjXNSw=; 
	b=YdA+hgKkkj3U6rew+mETffwuDqItrp1I9Da4LOK4o/a8WNmcvUl233LSIzPICIXql8MvmQMz0YM6jsTX/6M1x48vrTIUV9ScvYau9LrvrMzqy5K+nA80AV+cy1Evo6O/3xMpA8SREOSTNaPmJPB3r8GihWQn1kcJxZmoEPER50I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692138742;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GX6tOIvF2bCJ1RYYPrwz+vomp1Lb9M1jZE9uMZjXNSw=;
	b=EtJ54Sny8m18aEWfqx8/uVTsDtgB2F7vOQwZS/w6CD3vFotxWbDXJxVtmxa5U76D
	13zvb72fnqJ2ULrnqHdrQSELKx0Bcf9joqGayMXi1N7oufq0ZjzEMy6rxidS8p9cVjY
	RUpyz+U4PKmmaZQY442rPY7qrLarhnfm0PRMCLwI=
Message-ID: <98ba4015-d27d-afda-1b6a-2e0f5d9091a9@apertussolutions.com>
Date: Tue, 15 Aug 2023 18:32:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Henry Wang <Henry.Wang@arm.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230815210650.2735671-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/15/23 17:06, Andrew Cooper wrote:
> Recently in XenServer, we have encountered problems caused by both
> XENVER_extraversion and XENVER_commandline having fixed bounds.
> 
> More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
> array, and using an unqualified 'char' which has implementation-specific
> signed-ness.
> 
> Provide brand new ops, which are capable of expressing variable length
> strings, and mark the older ops as broken.
> 
> This fixes all issues around XENVER_extraversion being longer than 15 chars.
> Further work beyond just this API is needed to remove other assumptions about
> XENVER_commandline being 1023 chars long.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

