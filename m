Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E01AC026
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 13:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP320-0000Nm-58; Thu, 16 Apr 2020 11:50:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FuWY=6A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jP31z-0000G0-0q
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 11:50:07 +0000
X-Inumbo-ID: 6a732658-7fd8-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a732658-7fd8-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rnZu8jPWUQl/Vf5EjZVZqzR8pVvKBUltUctAIRVe6Aw=; b=KdXk8SFEX3bZgarjgMedOWnTum
 kaEu+YquL+Xaps8eY3JxK6CB2oJ2zuB4vro6Z7KZzRHy/WP75FJCa5fwqPMh55gS3iBvTwn9QNGCm
 4H12AfgPqwpYH3ibGr5yZi743ezNlqskifc740fO7VYfO84PdTrxNvE4KwbKtPglqpW0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP31w-0003AC-MV; Thu, 16 Apr 2020 11:50:04 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP31w-0004ky-Fr; Thu, 16 Apr 2020 11:50:04 +0000
Subject: Re: [PATCH 01/17] xen/x86: Introduce helpers to generate/convert the
 CR3 from/to a MFN/GFN
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-2-julien@xen.org>
 <4896eacc-10ce-5db9-3990-d74fb05e2ef0@suse.com>
 <6d544a04-72a2-0407-64da-789f9a82b0e0@xen.org>
 <dfa94f76-8e6e-4e17-9173-bb210e60eadd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9bcfb1f0-a7d6-7187-9161-b17cd7e17bf6@xen.org>
Date: Thu, 16 Apr 2020 12:50:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <dfa94f76-8e6e-4e17-9173-bb210e60eadd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 30/03/2020 08:38, Jan Beulich wrote:
> Maybe some variation thereof:
> 
>   - hvm_cr3_to_gfn()/hvm_gfn_to_cr3(): Handle the CR3 for HVM guest
>   - {pv,compat}_mfn_to_cr3()/{pv,compat}_cr3_to_mfn(): Handle the CR3 for PV guest
>   - cr3_to_mfn()/mfn_to_cr3(): To handle the host cr3
> 
> ? This is because I'd prefer to avoid host_ prefixes (albeit I'm
> not entirely opposed to such), and I'd also prefer to use xen_
> prefixes as they're generally ambiguous as to what aspect of "Xen"
> they actually mean.

I am happy with your suggested naming. I will have a look to see how 
they fit in the tree and respin the series.

Cheers,

-- 
Julien Grall

