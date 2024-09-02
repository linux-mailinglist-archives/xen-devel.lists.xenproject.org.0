Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14869685E5
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 13:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787795.1197260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl4zD-0008Ao-Dr; Mon, 02 Sep 2024 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787795.1197260; Mon, 02 Sep 2024 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl4zD-00088s-9c; Mon, 02 Sep 2024 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 787795;
 Mon, 02 Sep 2024 11:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+pf=QA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sl4zB-00088m-US
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 11:12:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e3d587-691c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 13:12:39 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1725275551864295.6306678137096;
 Mon, 2 Sep 2024 04:12:31 -0700 (PDT)
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
X-Inumbo-ID: 42e3d587-691c-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725275553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNiSGKxiGQtpbth64eSl2TwxP/ZIYcuS4woHjzeHtjQp39bVXu7oM1XCa5kLHpTSn9q3cA2GHyQi/DXZ7pHo2gFfzFt7FvnBc0WXQ+1o6Az3Qv1DcQ9JChxzaHzJzly/at/TQmxbWyrEl7CA2pybaFKOpDRUV5aFejk6hDqSMLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725275553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XzbRLQO62GfHWqUyNAjWdVTfLnu/+hNrn0FRLBcHH5k=; 
	b=eLiq+hzBoyouPa89sZl11bWeU9XJgi4MxCpUjTv8q01KLFXPr1VKCRWmsMRUERB02MMGs6TzrnCJ7cVQeyAD+fSmKiCEOdsQpo82AY8q1823kJntWx36okWvXuJNqTxw6T56DzmRA0RjLIAP+a2N+cIZT7zZKMaNFdP04kdXrUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725275553;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XzbRLQO62GfHWqUyNAjWdVTfLnu/+hNrn0FRLBcHH5k=;
	b=N6l8z4rnTtVI+6PdvwUed3lmLVD36brFNF4q1D3xegb8NyswYUr70hu67EQ62q+O
	KCNQL+HheWUQ2tg8mrhCoWTMFLQjgOQmgZ80XQ76IfDdp6+rCc3zZuCu7o6PJhqvlVt
	lVD++0xJ5v9WV4u3GyLYJQO4L6OEG7w9gtLJRoL4=
Message-ID: <8ebe4f07-c4ff-469b-9d71-7663e65de9e6@apertussolutions.com>
Date: Mon, 2 Sep 2024 07:12:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/44] Boot modules for Hyperlaunch
To: xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/30/24 17:46, Daniel P. Smith wrote:
> The Boot Modules for Hyperlaunch series is an effort to split out preliminary
> changes necessary for the introduction of the Hyperlaunch domain builder
> logic. These preliminary changes revolve around introducing the struct
> boot_module and struct boot_domain structures. This includes converting the
> dom0 construction path to use these structures. These abstractions lay the
> groundwork to transform and extend the dom0 construction logic into a limited,
> but general domain builder.
> 
> The splitting of Hyperlaunch into a pair of series was twofold, to reduce the
> effort in reviewing a much larger series, and to reduce the effort in handling
> the knock-on effects to the construction logic from requested review changes.
> 
> A note on v4:
> 
> For v4, two significant direction changes occurred. First, the series was
> pulled back from attempting to be in common and instead focused on being
> purely an x86 capability. Second, the changes were broken down into much
> smaller change sets and ordered to provide a more ordered evolution of the
> code. To the most extent possible, it was attempted to ensure all v3 comments
> were transcribed accordingly with the scope change.

As an FYI, after posting I realized I was not on the tip of staging, I 
have a v5 ready, which is at the tip of staging and corrects a small 
type issue with initrdidx in start_xen() and is 100% on CI. I'm holding 
off on posting back-to-back revisions of a large series, which would 
only results in a few code gyrations with no logical impact that would 
not result in different review than would have occurred on v4.

V/r,
DPS

