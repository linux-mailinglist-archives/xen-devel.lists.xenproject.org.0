Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272189AEA04
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825419.1239649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zWC-0008MZ-Ae; Thu, 24 Oct 2024 15:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825419.1239649; Thu, 24 Oct 2024 15:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zWC-0008Ke-7H; Thu, 24 Oct 2024 15:12:56 +0000
Received: by outflank-mailman (input) for mailman id 825419;
 Thu, 24 Oct 2024 15:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3zWA-0008KQ-LQ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:12:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70583a29-921a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:12:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729782768129726.9905603692962;
 Thu, 24 Oct 2024 08:12:48 -0700 (PDT)
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
X-Inumbo-ID: 70583a29-921a-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729782768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JcP9BZQp8Mo7jy7hfc6kFIA3vH0T5mqXh0llJ3P0GlgVM4RtxxXwixxQwjAmNzX7K01fnXfIjnnDdVd9e3i00RFC+mFsethxISS4hyBd8Brjnpp5SNtaT/hq8c+3bczxDf4VgxT6EA5dEtmJuAJni0GLl/ZcYIUVhb/b9YiaAvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729782768; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vJd5uLLnrl8e9OMld2Ym+yz694J+b9nwIxowrs6Pbjk=; 
	b=WTu4TF1THfXA6o8W1uUadoW3rUWVZ63Vcg2xJCQWn9b3sWYgd3Nhn7a5edCogeyHuTIGzVWI6LNBqLC5tCQAuqAX+z6H3fUNF3hvLlmMEILgZHrH2Y5Ae1ViJGk8ZPL6x9MLyUkz8ldiyb9cf1JeiNSnp1ymw7DTwQ+CYuHcYSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729782768;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vJd5uLLnrl8e9OMld2Ym+yz694J+b9nwIxowrs6Pbjk=;
	b=fkZxrtHXXAWrzfIgIXxV/rWxda0500V5V/kD117Q0V9swRbX2+Sb2Zy2RtxOwpNp
	NrBXdzSvYBDRCQQvvEgUVVscZ9PYUVDljzMX66MqLAELpF8lVVjcM7ZjB3t041sw7pe
	cKUVsO3GjcuQ0E1uKYIqLmjmEtUn5b9IDXYnujQE=
Message-ID: <ed4758ba-f0ef-493d-9838-7483b2b5aaf5@apertussolutions.com>
Date: Thu, 24 Oct 2024 11:12:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/boot: Convert mod[] to bi->mods[] in
 __start_xen()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
 <20241024142654.989980-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024142654.989980-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 10:26, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> The former is about to disappear.
> 
> In some cases, introduce a local struct boot_module pointer.  Judgement on
> where to do this, and on constness, is based on what creates least churn
> overall.
> 
> No functional change.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

