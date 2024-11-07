Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A039BFAF3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831470.1246783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qm3-00086r-O6; Thu, 07 Nov 2024 00:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831470.1246783; Thu, 07 Nov 2024 00:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qm3-000848-LV; Thu, 07 Nov 2024 00:53:23 +0000
Received: by outflank-mailman (input) for mailman id 831470;
 Thu, 07 Nov 2024 00:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qm2-000842-Sy
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:53:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf38dc6-9ca2-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:53:20 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730940792087829.3952704129282;
 Wed, 6 Nov 2024 16:53:12 -0800 (PST)
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
X-Inumbo-ID: adf38dc6-9ca2-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkZjM4ZGM2LTljYTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQwODAwLjU3NzY1Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730940794; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWKNtchBckgOx7BAm8uKOLDnSJW2z5rP25lh36Y1MKqVw3lIrDjVBlX0Wu4Vvt4qTwSzlKTDY6mjBLnu+xfj5TGPDBs3H36KyTgdcHg04RDRtPQWVJUqvrOzjvVP+f8HIpuT+XreTrMd0uRJMgUAjfM7pnret4IApypxVOsxaLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730940794; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gXj605fb2qJxJkSSsI51z3LTA+5SFLl+zzEGmQSq5ag=; 
	b=dGnFU7bmNo2TB+VUEeoBv/suBzrXU9+hpAuBzFHUfiYOWGIaxO4Of2uE/Em9hTLXXhE4cC2fMEy9wGYXF+ugUSXDmJFxv52Jc24oYCaggi1o5zlo6XmILBQOftz98mrBkg89BmV/g0er1apt9ZCHjusQCbRLrMd4kz/Kwk8S0So=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730940794;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gXj605fb2qJxJkSSsI51z3LTA+5SFLl+zzEGmQSq5ag=;
	b=q0eCUjZ/xiGUeQIdiTPmcOsp1QWmPnxFMcfYB8W8uc6q4EYwnuP+1D0jQUgTcCrl
	M3g7Fvc+IFDrKdtfMEqZKgabEtyqCUiyJXrNTFeup0RhDV98CcfShPc+MncGMnktfI1
	8x4H8Ouq5Xl5TSFHOrJOvbQL4DuAeFFL/ubfS8G8=
Message-ID: <21393fc6-b9d4-4a09-a127-f8e3be2d988b@apertussolutions.com>
Date: Wed, 6 Nov 2024 19:53:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] x86/boot: relocate kextra into boot info
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-7-dpsmith@apertussolutions.com>
 <a924211f-4a2e-44c1-9e06-efde05c189c8@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a924211f-4a2e-44c1-9e06-efde05c189c8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/6/24 18:04, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> Move kextra into struct boot_info, thus no longer needed to be passed as a
>> parameter to create_dom0.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Technically "..., so it can be removed as a distinct parameter to
> create_dom0()".

Ack.

> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thank you.

v/r,
dps

