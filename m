Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368087F96A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 09:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695260.1084879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUj4-0000uY-GG; Tue, 19 Mar 2024 08:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695260.1084879; Tue, 19 Mar 2024 08:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUj4-0000sN-Di; Tue, 19 Mar 2024 08:21:38 +0000
Received: by outflank-mailman (input) for mailman id 695260;
 Tue, 19 Mar 2024 08:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmUj2-0000sC-OP
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 08:21:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3017166-e5c9-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 09:21:35 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513e6777af4so3536171e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 01:21:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a1709064a1100b00a466e772597sm5874386eju.177.2024.03.19.01.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:21:34 -0700 (PDT)
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
X-Inumbo-ID: b3017166-e5c9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710836494; x=1711441294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUNrfdDIFs5xZBUKg7hTXblIk+RJr0DcGTEEHlMEjXE=;
        b=PcNBgh/XW/fUI+48Cb9vOwdhdmc8hx0onVIPFDustsWdW4pGFTsKsOB3xOLg596Ggf
         WwjxfBkBA1RxGaUEU0Ikq+WsPPNhxaxubbvyXgPdNHmCHgVpB2hpb9tSihM5Sn//cLpz
         7nGVuvlTSZpWNXji65CRs1FBaC3YTpHExsfydiB1h9zaeJJgV1mrVwFz3tpLzFXOipdx
         y87S0GE8MYYRnvz+F/UFCWt4+5F/QjDcyX0p2hsStgA49hkhUHQdOE74IiBWG925P4d/
         S6TVWtt71WYKZAwWS3r+5G0F1V3OjjAN4+UmWnyPHzv0EDJpoeuV6oDoRQ+GRlTx5VxS
         lrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710836494; x=1711441294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUNrfdDIFs5xZBUKg7hTXblIk+RJr0DcGTEEHlMEjXE=;
        b=bz7Pk/90yIW+QaEbBS/rKFQ/1StZnBZmsRrEZQqWspnSHSmMlCf6/iepQhTBnAl/2C
         K4cy5T+x3XYxaRH0XVumacCywfzta2UhWYiJ8fbkBhemTtCRMqysHWebbbmJQtVcCy/d
         exKkuGiVAovsFy/ycMR680Vsz4FySRVY1JrO8iPm+Fhee4t9xpmzHeQxWPiHZj1rosSU
         fOeMvLMT5GZ/Orb7Z6lvoKf0gAv3oJuj9pRhyghGWz1bjMPqIblPnUzQx70q3nFrdi7v
         73ggUWSE40OZZ6NTQ8tuOvvG3u0w/lewVJElIuMvrsUwT+EtG4aBawlJyw0nqCKMH8Ng
         8Lwg==
X-Forwarded-Encrypted: i=1; AJvYcCVRvvuzJdODe3rLI4vXKcwKL8oFUoKWKzyqbXTmYWBIhku8TjKeBW5tWbTQdIqfg3mHDE3yhlNIbWpPI73gdCBjr8beszaxBbbvbvCBmNM=
X-Gm-Message-State: AOJu0Yz/3NVn1akHxwpywSLcenN9K3gGYBe1epWdnJyYHAyxzUI7rhH5
	vGm21l2VAR3MjD237I13R2Q/jLce19qYwM+yRHQC4dxfaaB9WT7XSeeAvEa9WFBewYZrTuvST28
	=
X-Google-Smtp-Source: AGHT+IFuvO+oPkVx4lkHnjBmwGwTd9ycuADoM3MKMOpIRRj/dfFCiwSBW60b5P8nl2kAmUZNY9cgDA==
X-Received: by 2002:a05:6512:3e1b:b0:513:e7a0:5aa5 with SMTP id i27-20020a0565123e1b00b00513e7a05aa5mr6594847lfv.51.1710836494412;
        Tue, 19 Mar 2024 01:21:34 -0700 (PDT)
Message-ID: <591646e8-56e8-4262-8061-cb320c359cd7@suse.com>
Date: Tue, 19 Mar 2024 09:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/14] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-11-stewart.hildebrand@amd.com>
 <180cac00-e7c4-4bea-bd13-c5983da707d7@suse.com>
 <242f4ec0-c634-4044-833e-7df3c720abc5@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <242f4ec0-c634-4044-833e-7df3c720abc5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 22:03, Stewart Hildebrand wrote:
> On 2/14/24 10:41, Jan Beulich wrote:
>> On 02.02.2024 22:33, Stewart Hildebrand wrote:
>>> @@ -836,9 +870,20 @@ static int cf_check init_header(struct pci_dev *pdev)
>>>      if ( pdev->ignore_bars )
>>>          return 0;
>>>  
>>> -    /* Disable memory decoding before sizing. */
>>>      cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>>> -    if ( cmd & PCI_COMMAND_MEMORY )
>>> +
>>> +    /*
>>> +     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
>>> +     * always start with memory decoding disabled and to ensure that we will not
>>> +     * call modify_bars() at the end of this function.
>>
>> To achieve this, fiddling with PCI_COMMAND_IO isn't necessary. Which isn't
>> to say its clearing should go away; quite the other way around: Why would
>> we leave e.g. PCI_COMMAND_MASTER enabled? In fact wasn't it in an earlier
>> version of the series that the guest view simply started out as zero? The
>> patch description still says so.
> 
> Yep, clearing PCI_COMMAND_MASTER too for domUs makes sense to me, I'll
> make this change in v14. I'll also try to improve the comment.
> 
> Roger suggested at [1] that we should reflect the state of the hardware
> in the command register. I'll update the patch description accordingly.

Roger's request can be carried out in several ways. But first of all state
reflected should be that of whatever is consistent in the virtualized view.
Any bits the guest may control ought to start out as zero, imo (which may
mean bringing hardware in sync with the guest view, not necessarily the
other way around). For bits the guest cannot control what the guest ought
to see depends.

Jan

