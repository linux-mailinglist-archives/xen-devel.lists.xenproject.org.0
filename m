Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A3806902
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648960.1013096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmlg-0003Zg-Tu; Wed, 06 Dec 2023 07:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648960.1013096; Wed, 06 Dec 2023 07:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmlg-0003Y1-Qw; Wed, 06 Dec 2023 07:56:28 +0000
Received: by outflank-mailman (input) for mailman id 648960;
 Wed, 06 Dec 2023 07:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAmle-0003Xv-KF
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:56:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f400995a-940c-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:56:25 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c09d0b045so38285625e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 23:56:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fa10-20020a05600c518a00b00405442edc69sm24703805wmb.14.2023.12.05.23.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 23:56:24 -0800 (PST)
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
X-Inumbo-ID: f400995a-940c-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701849384; x=1702454184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kyuw8brHPJ/CmwaMrv3470peWD0ArRmT0dmqvz485T0=;
        b=P6yszEHV057v1a9QSn02/gKuxURQTTBiKXb4ooUatphsQZbNMKy3+QLjIbIynHSajl
         vIrdNARCC2HNEwEDJMB8WP6hVOU2i9BJL5M2QErycppuKHPt77VdW1NCI8WuqZUKBOZo
         qAy5vQA5gPmZFa8v/2I2CYD07KttY4iOFZ29wLMjYgSFzd0Ml4VsbQpfxVlsu0xQxzl3
         m0ho6ya7LQqCsbz/xRkmejJ8QoIUb4BR171+nF2mY6uo2o2BDicFOTznjTG3LHo2vuCu
         kjB822NM8q/tOipsECHcR6yoVsnQxYfNeI4LtzLIEHuohwOILXrE8odUBgamZmF9nXFL
         l1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701849384; x=1702454184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kyuw8brHPJ/CmwaMrv3470peWD0ArRmT0dmqvz485T0=;
        b=QZggdWOxkczm4Z5NsP/Arq9xAzAzzRSl+yQ6tdCHJ2UV6WjnF19BnbZej56Mi8ggka
         Wh1ChX+zs3+WRlzqaQFeW4IMK8fvb9f2zIndLl1YHh6tCJDA7DmNxHGTYhvy2bufq8S5
         GJJaYgdb818qe1lbVmkiNi5isvOz+lADnDArT1IpA8n8q+UNBYUP2YADCD5DvmOyoCjZ
         jZkhFhN83gUEdUD7LT3dalxeGMH59+cGJvm+lE6M5CnMWVlIoTPxgzm/wx769ZuVy4bB
         iPleZJaMbPjqH6nrXQycuiKt+Yz38N9KbD5buxWncqLZ0t210FMSVaGZJSDQgxhkrvzt
         HoLg==
X-Gm-Message-State: AOJu0YwQpLzeR6xvwiJRJ8UB66QtFSaXd+prLMdwEFyRDlmuMU6cPjUv
	W0xj24w6s6uIqtEtr0k6ZcMR
X-Google-Smtp-Source: AGHT+IFeGL0YNaz12yK47SQ3d2kx79eNnp9ghqmx9WBqdQmbVUEY2qMwhH3UEhXIPpZlpyoWfifHHQ==
X-Received: by 2002:a05:600c:1d13:b0:40b:5e21:c5db with SMTP id l19-20020a05600c1d1300b0040b5e21c5dbmr247363wms.169.1701849384546;
        Tue, 05 Dec 2023 23:56:24 -0800 (PST)
Message-ID: <f9320124-dc35-4c87-bbfb-46c3523d4556@suse.com>
Date: Wed, 6 Dec 2023 08:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
 <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
 <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
 <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>
 <4f6445b2-f871-415a-aa72-7c08a2c357e0@suse.com>
 <RWTcalGTi6AWz6y3kGdVeeviN3FSE96OVVCyH-DL9qySYjv0jImv0avp2uCDGGTtUm830cGTQeffygUZXECli4JChABgzUyUjsv2zFJiTVU=@proton.me>
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
In-Reply-To: <RWTcalGTi6AWz6y3kGdVeeviN3FSE96OVVCyH-DL9qySYjv0jImv0avp2uCDGGTtUm830cGTQeffygUZXECli4JChABgzUyUjsv2zFJiTVU=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 18:24, René Winther Højgaard wrote:
> You are right about sched-gran=core being the issue.
> 
> I don't know if this is relevant, but my CPU shouldn't be able to use sched-gran=core it's asymmetric.
> 
> smt=on with sched-gran=core gives me a warning that it's falling back to sched-gran=cpu, I tested smt=off with sched-gran=cpu and it works.
> 
> This warning is missing with sched-gran=core and smt=off 
> 
> (XEN) ***************************************************
> (XEN) Asymmetric cpu configuration.
> (XEN) Falling back to sched-gran=cpu.
> (XEN) ***************************************************

And (presumably) rightly so, because at the core level (presumably) there is
no asymmetry.

Jan

