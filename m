Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F2C39AC7
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 09:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156595.1485634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvlk-0006Nl-El; Thu, 06 Nov 2025 08:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156595.1485634; Thu, 06 Nov 2025 08:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvlk-0006Ku-Bv; Thu, 06 Nov 2025 08:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1156595;
 Thu, 06 Nov 2025 08:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGvlj-0006Ko-QU
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 08:54:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45f2b773-baee-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 09:54:58 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6407e617ad4so1395434a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 00:54:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862cbesm1277730a12.31.2025.11.06.00.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 00:54:57 -0800 (PST)
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
X-Inumbo-ID: 45f2b773-baee-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762419298; x=1763024098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8GB7Q3yPYBYZFTUqXIfa1+h7W5RwdViYfMyYybWfRd4=;
        b=BACcCh3PCYy67U+LjHCf+rNJjiLy7xVGqA6CVmzUh4M24iFhaCMsjbI3RyKlfmVQMp
         NA1D2Ls89WBPkR+mkYHeOJ6egyG4zxOqY51b5jR3R5i7b8wFs1PTuhD2PPmeURvRfPF1
         QWVbz13D7Sqhh7Kaq5TssJfQSoGMudIuOFcRvgwQtSgEnKunITUOkseI7HybmpVnysod
         P9RyZs7P2mmV5NxKx2rtk+4JVRsK4GLfKifY6GjAb6+QjC2g39UI3p6fDSAFHbxSP9vF
         w9XTakQHn3imvUuq1Idrdltq5UuTa1OeLvt/sXri0dTaGWoWAtIsgtLhN4yxr6qSgFd9
         n6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762419298; x=1763024098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GB7Q3yPYBYZFTUqXIfa1+h7W5RwdViYfMyYybWfRd4=;
        b=Ztptw9HIVUIANjQJprDTNUNOKEJYC0dJ5lbAfkXaEX5prZ50ZQ69sz5v/MDusf7Wi0
         hJgkNAsoiZPMk170DB3zX1VzHQB7ZqI5+YwUbPKctjn5dpzPbXX/odb3jlLNeXbvGp8P
         jErq2C7dDK0HBm3OyxZQGwklzqZK4RLPN+Gx9MrldqtRH4yhQBTG8872cTlI+nnbFPu6
         YPjrnWM89rW8UW6k4VacNjN+hnuaW1lUw16ulzkQlKZQuou6zd1Viq4tH8qIzwgpnPmc
         sQK7+KZ+YD1Lbt+DpxdVx305S3paAvYB2s2Y8RjShrugmqv4d+0j6/GTEGraejdN2Ppx
         mnkA==
X-Gm-Message-State: AOJu0YwDe95WTxBWd1y8f5nwey+ykJgj+R3NHZVjvpN/We5LeYMAn8cA
	bBC9Wxmcj0Ov4W0BxRsxlp6vUB7Z1ypBSJIT6VlEpohO1nIHesMHKf2XPwIBjxnyoQ==
X-Gm-Gg: ASbGncszb2E01YZMcIY+eG45UIRik354/bDdcjIHdg5eMVQZIiBNF/riHSqEiPpHBiX
	DmOC7f8dgKYjjW1TW7CZO2ubMb/HC5PTYq55kARDzDEH8cd9k1KGCFbXKMujI8QP8IqbqELUZKx
	IbvYKgcdyCTyDUxYHXX6m2puxUg7ezcLmZKMwJgOEJ7mWdikp2zH6wjWvUM2WT462oeH7tQzup/
	A8dyxvGfXi4zTZ1vxXplAZkzQJVPWt5jNjxLljOJ2VZVeADppneqxKGsord0oLrTM938mMQWzZx
	kdI+H6NFVSzqhJa0iZxjGLucLNNVhngFhK/8gLyNgfMRgVWl7n1o+JuAX6VuxdBKKTpvm5/Yv2Q
	DPDqeF8ijtG+8siarWOHRrsu46osUzYAH+uTLySi3lPaD/99TDGdhR3i80daytlG0JfTAatcvHs
	1sMDwcuoIkPIDYPNl0m5a8oLEn5b+yewKJTYqSotegwoCSa0t+R0wKmT/0TG31
X-Google-Smtp-Source: AGHT+IF8kBWgWUmL98zK3sMCtIUQSoSR4izxDZe24fmbEWdmopFOWlkpurW/4S2r0YhEofCUQRqfYw==
X-Received: by 2002:aa7:d1c9:0:b0:640:abb1:5eff with SMTP id 4fb4d7f45d1cf-6411d179a7amr1738469a12.8.1762419298122;
        Thu, 06 Nov 2025 00:54:58 -0800 (PST)
Message-ID: <b9fedf98-a091-40e8-8b54-271f3172d7de@suse.com>
Date: Thu, 6 Nov 2025 09:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan> <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan> <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
 <aQSoE8ugCKdNWy9C@Mac.lan> <8c7881d9-5959-41b5-865d-d61199ac7a44@suse.com>
 <aQS2arOWxEiHq1sj@Mac.lan>
Content-Language: en-US
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
In-Reply-To: <aQS2arOWxEiHq1sj@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 14:15, Roger Pau Monné wrote:
> Not putting rdseed in the max policy completely blocks the upgrade
> path, even when a toolstack is possibly making the right informed
> decisions.

Why would that be? To evacuate guests, one would force-enable RDSEED on
an affected host. After updating of the original host (incl fixed ucode),
migrating back will be fine. The admin will thus be fully aware of where
guests run unsafely, while no un-safety is going to be introduced behind
the back of the admin and/or any guest.

Jan

