Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AD8AA25D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 20:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708557.1107560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxWyf-0007XM-4Z; Thu, 18 Apr 2024 18:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708557.1107560; Thu, 18 Apr 2024 18:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxWyf-0007Vb-11; Thu, 18 Apr 2024 18:59:21 +0000
Received: by outflank-mailman (input) for mailman id 708557;
 Thu, 18 Apr 2024 18:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DNVj=LX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rxWyd-0007VV-EP
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 18:59:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f27d00-fdb5-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 20:59:18 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a526d0b2349so141731866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:59:18 -0700 (PDT)
Received: from [192.168.0.107] ([91.123.150.5])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a1709060a5000b00a5575c9d5b4sm944870ejf.63.2024.04.18.11.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 11:59:16 -0700 (PDT)
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
X-Inumbo-ID: c1f27d00-fdb5-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713466757; x=1714071557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfZGFScoM/c3mBjw8pj4N1ymTLuxEYYQasyhDqctCCI=;
        b=KKlDl952DZmgd68mhdChUtgSmseD2SqR1MfpBgj0uaBV5JklcsTnC97CadbfQ2skWE
         N61MQQnxuiSsULSQH8jF6nhMTAgM59foAuxBkF8CjJohuAdLJMn2Io/rGClLPhHd3KBk
         t0k1cekJf608KUTStHAjzOxRpfJoZk6XW/ACS6kw/6fGZGgByk7a1IWvVkUgmUsNKGwb
         aIK1FstTKJ8uwi4e9mmxqngxSl/iI9LZOMltt7PniCEsQN++6+e2OX+CGWnw/AdjNLMe
         UYXqrEO/6JsuQWiRdSivycI427DiGl2l6LvqiykdfedsAGbEkDK3Z84ARzT4j0yTo2nu
         bZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713466757; x=1714071557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfZGFScoM/c3mBjw8pj4N1ymTLuxEYYQasyhDqctCCI=;
        b=NmUHSvwj5pHE4mLr+nHe3f6oANcFjKvGOAbhXwZu/bp54jEKrg2vGcQ790AUwZcaJa
         UwTvJ+xVn/L6VqJPjP1j+IsHlqBuxnScW26Tic071Oj2u09WHHNmq9mUA6zX1X8I/9vW
         pDRK0gexFK7nn513/iK08MUkITVlsIvPgvI+6bDSZJ3IilyPHPQIVhJVJS84x5xWBYnt
         BIm/+B5RSzbbe4F5B0eCA0ljFfSiWr+KAGtvWk5PpW47svjLPt94MqjX0nI/esFKB9oQ
         lmvSMDAmrymH0nRb8WT/wp9GFZ1pewLiomjokq8Pz1A9sja41NorrwYmtYcfsENavCCD
         QtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr/wmTu0/dIx7PtiHlMPG+9cLOTJeGdnB34c9I5VouQBetbFKkbk1TfWhcuv4OE0ty+d5OkfkA34qCRKD919M8pL735qC3JIva6Fk2d2U=
X-Gm-Message-State: AOJu0YzZuyXt4xewEA+h9ipdEqGTZfiFqcXOClKoIhNXsVhYUdjH9tjJ
	xOTRLdg9TEk3Yr0cCpedhFgEcHsB7oxagaaQf4vJhOW5rlgeT2sr
X-Google-Smtp-Source: AGHT+IEaUMU/N/guC4J5mMlLDr26LjlRjRwfmXeIrSCnVgeumUQz+FX9P1ZjBX5gOWl7YdPNqyiZ4g==
X-Received: by 2002:a17:906:3196:b0:a52:6e3b:fcf1 with SMTP id 22-20020a170906319600b00a526e3bfcf1mr20694ejy.17.1713466757393;
        Thu, 18 Apr 2024 11:59:17 -0700 (PDT)
Message-ID: <140a0491-b035-4173-918f-f4524cbebf33@gmail.com>
Date: Thu, 18 Apr 2024 21:59:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Add i.MX UART driver
To: Peng Fan <peng.fan@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
 <20240402120557.1822253-3-olekstysh@gmail.com>
 <DU0PR04MB94177A1E6DF1689353FD447C88012@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <DU0PR04MB94177A1E6DF1689353FD447C88012@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.04.24 05:43, Peng Fan wrote:
> Hi Oleksandr,

Hello Peng

> 
>> Subject: [PATCH 2/2] xen/arm: Add i.MX UART driver
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The i.MX UART Documentation:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
>> nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8MMRM&data=05%7
>> C02%7Cpeng.fan%40nxp.com%7C6ada06c4133849667f3608dc530d5471%7
>> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6384765639197564
>> 70%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz
>> IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=RmXgAMb7
>> wFZ7epZgYgHJo4LH35rzQhD05yTXSkttXbc%3D&reserved=0
>> Chapter 16.2 Universal Asynchronous Receiver/Transmitter (UART)
>>
>> Tested on i.MX 8M Mini only, but I guess, it should be suitable for other
>> i.MX8M* SoCs (those UART device tree nodes contain "fsl,imx6q-uart"
>> compatible string).
> 
> Good to see people are interested in XEN on 8M.
> I had an implementation back in 2015, you could take a look.

Thanks.


When I was googling for what was publicly available on Xen exactly for 
i.MX 8M Mini (before start writing this driver), I didn't find that 
implementation.

Interesting to compare


[snip]

