Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B249AEC6E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 18:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825507.1239739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40v5-0001k8-Gx; Thu, 24 Oct 2024 16:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825507.1239739; Thu, 24 Oct 2024 16:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40v5-0001hn-D5; Thu, 24 Oct 2024 16:42:43 +0000
Received: by outflank-mailman (input) for mailman id 825507;
 Thu, 24 Oct 2024 16:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t40v3-0001hh-IC
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 16:42:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fadf7ecd-9226-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 18:42:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729788153638363.1295203280963;
 Thu, 24 Oct 2024 09:42:33 -0700 (PDT)
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
X-Inumbo-ID: fadf7ecd-9226-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729788154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W/bLTcUwFh7F83ztvf7NyyesSa0xzdByH6ErcUj9cKuOzWXt5yrhCmD0rtCWn74/8YyZMzFpnlYzUYHuZCqz4o8KM5/B61Dqvcx8gMuAjA0dSFJ4HaNVxALuMtK8SOcasMoT2094MAgHI4dkg8T5xN3uJboCd5qwehN22wTdgSE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729788154; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x4/TnSsW7+E4msXP5ig1Bx7CXFMPKNACg6DP3jRDBzQ=; 
	b=emoyXk+oh/n+bl27CMVS92p3f0/yJGMGdT4BIsB1gR7mE+jVrzcehcycXSavb3BLCv/0vVRaKa2ZsBizLZk0Xoit0W68DYCHQLzKsoQlNCYb4Pp5koslzg5P7FT5cWPSzW72k3Q/d2O010FpL1PyRThCeITMBlQowMPlpNvxml0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729788154;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=x4/TnSsW7+E4msXP5ig1Bx7CXFMPKNACg6DP3jRDBzQ=;
	b=tsL6ZdmKQgxfwJ4ODu2JlpoLh9512kw6OpieYhMyQcA1hOVFx2bjP7tbVCihSIm8
	xdR1O/V6mDaxnq4q6s4C+Ylbo+DQ4oWKhOaDRTjunciemIOnJej4i//QcU6q4ytT91n
	6ubr6s9punSg7L4PuZr3esmXWc6ad9QXrsHVtAw8=
Message-ID: <b4cfd5b2-eaaa-49d2-acc6-8729c752709f@apertussolutions.com>
Date: Thu, 24 Oct 2024 12:42:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Explain how discard_initial_images() works
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024160340.1012474-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024160340.1012474-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 12:03, Andrew Cooper wrote:
> discard_initial_images() only works because init_domheap_pages() with ps==pe
> is a no-op.
> 
> In dom0_construct(), explaining the significance of setting the initrd length
> to 0, and put an explicit check in discard_initial_images().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

