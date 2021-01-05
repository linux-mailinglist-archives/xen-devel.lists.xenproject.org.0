Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9D2EA969
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 12:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61803.108888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk8p-0002fy-RP; Tue, 05 Jan 2021 11:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61803.108888; Tue, 05 Jan 2021 11:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk8p-0002fZ-NY; Tue, 05 Jan 2021 11:04:43 +0000
Received: by outflank-mailman (input) for mailman id 61803;
 Tue, 05 Jan 2021 11:04:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U980=GI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwk8o-0002fT-Sm
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:04:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97f2221b-d354-4ffa-8aeb-8ff694da31ea;
 Tue, 05 Jan 2021 11:04:41 +0000 (UTC)
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
X-Inumbo-ID: 97f2221b-d354-4ffa-8aeb-8ff694da31ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609844681;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=k6KEjhoU0RvNtsoVlARmdjECRmZE3/5janlP0BMQ6XM=;
  b=DGdTwQt20XNiYGNVaTpinNvvTbGzUYPT4Fmk9xOZ68yuyRg06RgOc4MW
   g9P1dYsiiWyegS6OWgw19kqD8MNQ1PTaB9w+o15v9ueHYZcUrd+/xYaBp
   FI378s7DrUSXKJun26TgltaJdYbvQ43mK3IMlmUqJgFyZzd4wrrjzhFmy
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6uAqFmoxa6lVZ2buUQwSRk5tGAdh7a3JUDknrC1MBGqixgm3YyWog4ReZGYr/Mna4DZxAuhQnJ
 KhJLyNuG9JNzblhOjNuyIhqoJ0lKMfYhLPOoJb5aoodqFbyqcE1FTbkA+RAydSVZ6chYrCfwGn
 LVb4RhaZB8j44z0S3KzBeuy/ZGbX9E+rNrWMOYn+oqhoBSq9zKCdhZEF0ImsIo3u5C5oBL2g5o
 6eM9L/Ruy45Tr5LMsHFnofxG7aiU+rQdZ0WjsT3Dj2cmU4f/OFDP72CXJ7sZeWRLqkns06ZU0u
 9lM=
X-SBRS: 5.2
X-MesageID: 34632887
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,476,1599537600"; 
   d="scan'208";a="34632887"
Subject: Re: [PATCH 1/2] x86/mem_sharing: copy cpuid during vm forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7cfa7763-e905-58a0-d4c6-2cca0a54b1ad@citrix.com>
Date: Tue, 5 Jan 2021 11:04:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 04/01/2021 17:41, Tamas K Lengyel wrote:
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index c428fd16ce..4a02c7d6f2 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1764,6 +1764,7 @@ static int fork(struct domain *cd, struct domain *d)
>  
>          domain_pause(d);
>          cd->max_pages = d->max_pages;
> +        memcpy(cd->arch.cpuid, d->arch.cpuid, sizeof(*d->arch.cpuid));
>          cd->parent = d;
>      }
>  

You need to extend this to d->arch.msr and v->arch.msrs or someone is
going to have a very subtle bug to debug in the future.

~Andrew

