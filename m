Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124CABF896
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992028.1375809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkwG-0006Km-1q; Wed, 21 May 2025 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992028.1375809; Wed, 21 May 2025 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkwF-0006IA-VJ; Wed, 21 May 2025 15:00:59 +0000
Received: by outflank-mailman (input) for mailman id 992028;
 Wed, 21 May 2025 15:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHkwF-0006I2-B2
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:00:59 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6703fe76-3654-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:00:58 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-601a6e2e93cso544909a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:00:58 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502bc1sm8871019a12.30.2025.05.21.08.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:00:56 -0700 (PDT)
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
X-Inumbo-ID: 6703fe76-3654-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747839657; x=1748444457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhhOmd5Q29gsD/BIB4B6W/kIzNcyrxLA5sa4eK4oIaU=;
        b=ahUEQ5SfiRhMNov8plpbmOpNKWacf8rgYbEtgQciCOcrOUl0Pk3u4MZkI9dJi9FXgs
         cucDaIYqKSCru4d3KeIl3+9hOoAItEbeuFfzXaXIk+IWE9yoNK2Ag6Uszz8rEFUeVEAJ
         7k+SYkEma6sq5EUqceJ2SXb+OeTFfhG/EdY4sZIzHAFztJPJiXHM6MZiWhIO3f/rnzAs
         NB2xR7QI02uah7zTSV3Repr5OOO8zZKxbhBex7QSAnYwRsRI4kYjBmNk4U/vfM4tKaRa
         fvnnK1WVIyZS4kDedUUjcIUF4je2+nLsbd2s+RZv/pxA9LXdBncPfGKG+mQTOY8w83m1
         orKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839657; x=1748444457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhhOmd5Q29gsD/BIB4B6W/kIzNcyrxLA5sa4eK4oIaU=;
        b=ZSurt6hKydmj1GIs6CZdjVjcdHosqbWeDdrsBPfgWfT1zn2+vo4Y8NSbIzQ4NWWHys
         7O8N7eh8QA3wJD3jWXQxwbz7gRegZx1MDrqro3HFu6afBoEC6CF96aSiznXknNFLa4Mv
         rVK4/ouE8i/SGeTaL33j07NmsT/SiaKm22eB2PCwGgQhNBEKMmJkSFA62VblelyylSFw
         jlvLH91Svqs+Gw7dwukFOvkNjMnoGDXo2Ij2DXOfFt300WRL3TuGQ9OrAtTV1SFcaqpL
         u2lnNpCuSObZr+F2p810YkDUmaO8cdanGUvJpdINorjLunTZfJaJA9yn+1TBVtQR49ST
         W0+g==
X-Forwarded-Encrypted: i=1; AJvYcCX98QIDHJqqLi7aJ+RyMf3O+I9S0EyhfeDLKsg28V9ZDUnK2fjN7RE8mGbccAvVmnRe6R6tLVtm8J0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvr6Pq8NqhNC+cvp7nyXxNrr4Ciha3z/x/tQ8roiykhPEGUon3
	PYmyByPuisxVLTSslydTf0McbJczOrctEfuWfKF/NVudKq33JyHrFOBr1gzFG9CP+Q==
X-Gm-Gg: ASbGncsWXkgxLCBVcqSp0bORITfJtf8hdlascrD5kJjNBglvRdoJAyoXDv5HOiSpzYe
	Uf+fT/+Eqz3RJ5tAteUCOkI+Vo6VtJS0uT+amlEL4RHCUfRn5AFBdGTo4+WY5GyeAp3rDK7E6Nz
	5wKVoPFxUvb2J57/vatd6EnKlBtV6n6H/MjXL1w6ChdOmEjR+IjUfSpHm3KZ51yRniqbiY5IeQR
	pzmvXLU9Tr3h6Oamtupl4hzR8t/MSTR6kTMhdqjJs6vlPZIRkjhUUuHpg+2/SCVFKPHxD/aMCK8
	rnh+0hUzx8wmuGPHEhTlfPPo+LkPEXxZFulgnbD3XdYxzPT9pD3SwA8a/lDjv91EaoeyVZHY
X-Google-Smtp-Source: AGHT+IF01aUVRDdsW+bmXtWVdgVofUfX+YsmMp35eTAN1O4Gvccy7cqyKlBIzEWd5VPCpA2Y8Z5s7Q==
X-Received: by 2002:a05:6402:4401:b0:5f4:8c80:77d with SMTP id 4fb4d7f45d1cf-6008a5a115emr18605583a12.6.1747839657565;
        Wed, 21 May 2025 08:00:57 -0700 (PDT)
Message-ID: <6f821e28-b182-4d27-b2db-e3be80910c12@suse.com>
Date: Wed, 21 May 2025 17:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/12] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-4-agarciav@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250429123629.20839-4-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 14:36, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add the ability to detect both a formal hyperlaunch device tree or a dom0less
> device tree. If the hyperlaunch device tree is found, then count the number of
> domain entries, reporting an error if more than one is found.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

First: With your code re-use proposal sent earlier today I wonder how
meaningful it is to further review this series. Much of it would change
if that proposal was followed, I expect?

Then: When you say "hyperlaunch or dom0less" - is it entirely benign
which of the two is found, as to further parsing? I ask because I can't
spot anywhere that you would record which of the two (if any) was found.

> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -13,6 +13,36 @@
>  
>  #include "fdt.h"
>  
> +static int __init find_hyperlaunch_node(const void *fdt)
> +{
> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> +
> +    if ( hv_node >= 0 )
> +    {
> +        /* Anything other than zero indicates no match */
> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
> +            return -ENODATA;
> +
> +        return hv_node;
> +    }
> +    else

Please can such unnecessary (and potentially misleading) "else" be omitted?
As ...

> +    {
> +        /* Look for dom0less config */
> +        int node, chosen_node = fdt_path_offset(fdt, "/chosen");

... these will need to move to function scope then, one of the two may want
folding with "hv_node" above.

Jan

