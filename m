Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B2665E59
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475567.737300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcQk-0001MT-T0; Wed, 11 Jan 2023 14:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475567.737300; Wed, 11 Jan 2023 14:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcQk-0001KR-Q3; Wed, 11 Jan 2023 14:50:18 +0000
Received: by outflank-mailman (input) for mailman id 475567;
 Wed, 11 Jan 2023 14:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwfa=5I=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFcQi-0001KL-VA
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:50:17 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4286b155-91bf-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 15:50:16 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id fy8so37314109ejc.13
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 06:50:16 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.137.tellas.gr.
 [109.242.137.139]) by smtp.gmail.com with ESMTPSA id
 kv18-20020a17090778d200b007c4f8bc322asm6254322ejc.196.2023.01.11.06.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 06:50:15 -0800 (PST)
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
X-Inumbo-ID: 4286b155-91bf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voa25sTfLc4t7NqxP8u43Bb1H3o1VCobc5wW+DSwPKg=;
        b=QHUaVQGEpZ20r2htUX1Vhc3KYWX3qiUGOoeOjVkPz0yHXRDCz6kq4P2kR4GzXRO99l
         QdMpumEQWn7KbnSX52Ynch4DnbXM4SdVJu3hgRtm9C038BC/9m/p+mJuWpOlkv5T0Lq9
         ZJPOG0kz8dkv+6Pva8A6hqfRPqYQigZDjEZ3Jepwwu2OLVLlRbPPC6doIBxvTX91ZzDO
         Vc0Fs7vVqrofhRyDGZyF3kIese++TA9EQEh+d/lv/7XJNMWvuVshqiMHgfa4nMm/49Q7
         i6vq8Di/JZx+Atb70B1H1EyG1ndINNh88uVUC5S+ijECILYA1HM2aoMhvCyaQBI1jJOG
         kwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voa25sTfLc4t7NqxP8u43Bb1H3o1VCobc5wW+DSwPKg=;
        b=5NYVk0IdjBdR3FdlhRkGyezV/jz5/MKRyjoO3h0aBFKK/mLpKrPDYMuA9mPqFyPhIw
         FT/aKHj+our0Nh9C8O5On3fISu+ZCF32Zjf723/D1SEFGSA5XN5Hya1mTCFxVJCPorWC
         +ZpFICVpZoq2lqKrSpOA8RnsyZy85e36eR4oH8K1g+Kv4HYbd7+QCFTNQWo2iAnOjwYt
         8G6iXVhwzAdi7HoQFnuJ6cbcM5aoiBT/c7m+RNJtsl8MYHI4MBR7IvZmH5R6sN11CMXF
         mxuFq5M3Zs4n6HgwUsRb8+phlycSlE+r9v/s2CPVCNK5eSfnGD5BicSmkRe8eSz+jDfT
         Sx2g==
X-Gm-Message-State: AFqh2kr6wG+yzUzQyrcY5Le+cJrqUULsTNbu+SowO9c3u1vr4Z1Nt74h
	LLwac6yUuY2XKq2tq7H4e0w=
X-Google-Smtp-Source: AMrXdXuaexZXnckrt7QwAjlOlFbXAEYnc/a0t4Ny0Or7nmcdQ64+510P8/9hwmgBzgEOjTf/1Dlyjg==
X-Received: by 2002:a17:907:8dcc:b0:84d:21b2:735a with SMTP id tg12-20020a1709078dcc00b0084d21b2735amr17286857ejc.54.1673448615496;
        Wed, 11 Jan 2023 06:50:15 -0800 (PST)
Message-ID: <0b7489e6-3d7b-ddc3-fe8f-8dbea629bedd@gmail.com>
Date: Wed, 11 Jan 2023 16:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
 <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
 <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
 <644334f1-8e1d-3203-e942-0eb3ef5584a9@suse.com>
 <2acf07aa-ec56-99fc-765e-70fb7e753547@gmail.com>
 <72930382-b216-4ec3-6d29-889a3bf0bc6e@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <72930382-b216-4ec3-6d29-889a3bf0bc6e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/11/23 15:17, Jan Beulich wrote:
> On 11.01.2023 13:30, Xenia Ragiadakou wrote:
>> Could you please help me understand also
>> why __signed__ keyword is required when declaring __{u,s}<N>?
>> I mean why __{u,s}<N> cannot be declared using the signed type
>> specifier, just like {u,s}<N>?
> 
> I'm afraid I can't, as this looks to have been (blindly?) imported
> from Linux very, very long ago. Having put time in going through
> our own history, I'm afraid I don't want to go further and see
> whether I could spot the reason for you by going through Linux'es.

Sorry, I was not aiming to drag you (or anyone) into spotting why Linux 
uses __signed__ when declaring __s<N>. AfAIU these types are exported 
and used in userspace and maybe the reason is to support building with 
pre-standard C compilers.
I am just wondering why Xen, that is compiled with std=c99, uses 
__signed__. If there is no reason, I think this difference between the 
declarations of __{u,s}<N> and {u,s}<N> is misleading and confusing (to 
me at least).

-- 
Xenia

