Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A0BC1A5C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138879.1474455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68LJ-0000D6-7Z; Tue, 07 Oct 2025 14:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138879.1474455; Tue, 07 Oct 2025 14:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68LJ-0000B2-4M; Tue, 07 Oct 2025 14:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1138879;
 Tue, 07 Oct 2025 14:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v68LH-0000Aw-Ka
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:07:03 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e57b6d49-a386-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 16:07:02 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63994113841so4482094a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:07:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6378811236csm12462269a12.42.2025.10.07.07.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:07:00 -0700 (PDT)
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
X-Inumbo-ID: e57b6d49-a386-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759846021; x=1760450821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y1Ds3gRIjeBvOd/L6KWpUh+yxYMEsiIVQ86nPMRa4z4=;
        b=Aqj7qXO05ebsByH1Hp28ZMpP+N0N/8z39vv7ym1JQ1ctW+D4PdCyLeu4m2fK4ccYC+
         EMcY0B2BWIsMublaLUUcPEdTls5rXuSma1M0+4j08aD+o/q9dEcfDV4QFTnYMNSTOF2R
         ACUuk1KSDvOa5EO5BU6A6msOlstizu2TMfIU0dvZkDz+vDriSegwDKsIGvp9e28DkQtb
         lTYqDffDzYHCCmrX2nL1/akdmgizNKAPe42H2UGs68x4oWCpHWLm6yLLtGKE/JhyDR9v
         5VLoYkmhBZc1tIKP016/jsE6N7Q7naX6FbE1ohOooAC+6gsF+P9aH7BvW+Z6TgCQgcB8
         93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846021; x=1760450821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1Ds3gRIjeBvOd/L6KWpUh+yxYMEsiIVQ86nPMRa4z4=;
        b=Sjc349QBoIcS2Ow527nW+8jlwdUcl+FUBwTjA/OwjlfKcIVD1B8pzX7GGgX1Tfis1a
         YWG0iMWcvIaJl3Y3MUZfuA/reg83udNQGGXU2MGUygeAixrNszjtAJAnFB94jBhQL9oD
         cc33/JhkXVCHcICyAU9FH4kjNVn2zH7pESWLcAHJiIETW/ME+ZWAMscbTn3uZ964/ItX
         QdQr9fN2O/ss5IFAz/RUXnGoJseaGAMSkIqH0iWQ4i4xia45RMPXa3znmjK6Bb0pkbUy
         CznEvYSwNAkXt+DTYEevQI0uu/ZSoYTPXGvbCOgpcZnEvSF7eDaRX5kdaKh/rAiPgHVA
         E8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVEuzlRD9J0lscxri3hCHGuMmVyvHZf6Z35TLHLYb8JiadZ5es/a0QD7aVvb8Qe8e/l+vvJDAssxvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1cxcGXh2SVGI23Z5entTSeE5oq89AxDUHuRhPuAW38jbEEvZM
	+mVzGHimppAfbREZmqEkjVOdmeHSfn6viRMywAQi874LEM+I/3eXO09mp93tHmmLPA==
X-Gm-Gg: ASbGncu1oYNOnYV00Uf3e3kk3+AQ9i2Z1xCmtXFjj97HJol2iFe+n0JCKqI3/m+CELo
	3PwLQEtUemBwKxjZNyy3wgrRgUsOM3d/sXLMQUFFqEQtWPKm5QudzJ9PUcRtaOcM7TZsnJz38d5
	5fR0gzkjU8kt5hgDd2oo4oaw9RMIdn5GrNfSCcYYz7m6NYtJLtWHcwgS6gckbOeMhQXuI4kr9ci
	bBeRxEssvVpj7ogcbfOLspM8/202OnU8F7rk532TQJSEBoGrl8sCW1BzyRISq2zPZtlw27UZ8VU
	jcAV58o3t1pbnn/NbifCQNevOQD4Mq/e1pyVEFOGi4tBx3O+6EuJOJblN8mtGVjxPAgR4sgSML0
	4x3bwQ/+vn/PqkTs4g0jEsoV4fjO/6F87bHnVN1Cddtz/MVS2Gakz9YYD1F+5apvm6PeRMn29Fs
	duNTEWfPdrDoE279rZiinV8SocC4aHaig=
X-Google-Smtp-Source: AGHT+IGUwBNwInoEMOHYuBTFQEQY2lbKNvDFo7NW4rKBMFRQtE93GKFywtqGeVdBdodtefuTbG0Wgg==
X-Received: by 2002:a05:6402:3511:b0:637:dd64:55a with SMTP id 4fb4d7f45d1cf-639348cc425mr18549019a12.3.1759846021430;
        Tue, 07 Oct 2025 07:07:01 -0700 (PDT)
Message-ID: <8661ed8c-a2c1-41ea-bb3f-1ac2c24f5e29@suse.com>
Date: Tue, 7 Oct 2025 16:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
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
In-Reply-To: <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.10.2025 15:05, Andrew Cooper wrote:
> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
>> For xen.gz file we strip all symbols and have an additional
>> xen-syms file version with all symbols.
>> Make xen.efi more coherent stripping all symbols too.
>> xen.efi.elf can be used for debugging.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>> Changes since v1:
>> - avoid leaving target if some command fails
> 
> CC-ing the EFI maintainers, as this is an EFI change.
> 
> At the recent QubesOS hackathon, Michał Żygowski (3mdeb) found that
> stripping Xen was the difference between the system booting and not.
> 
> With debugging symbols, xen.efi was ~32M and is placed above the 4G
> boundary by the EFI loader, hitting Xen's sanity check that it's below 4G.
> 
> Xen does still have a requirement to live below the 4G boundary.  At a
> minimum, idle_pg_table needs to be addressable with a 32bit %cr3, but I
> bet that isn't the only restriction we have.
> 
> So, either we find a way of telling the EFI loader (using PE+ headers
> only) that we require to be below 4G (I have no idea if this is
> possible), or we strip xen.efi by default.

In principle not setting the large-address-aware flag ought to have such
an effect, except that (a) I'm in doubt as to EFI loaders actually
looking at the flag and (b) having this flag clear in an image with an
image base address far beyond the 4Gb boundary is likely at least
contradictory.

Jan

