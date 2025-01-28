Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB8A20C35
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 15:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878537.1288718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmqD-0001Jw-03; Tue, 28 Jan 2025 14:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878537.1288718; Tue, 28 Jan 2025 14:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmqC-0001IT-ST; Tue, 28 Jan 2025 14:45:24 +0000
Received: by outflank-mailman (input) for mailman id 878537;
 Tue, 28 Jan 2025 14:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcmqB-0001II-DB
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 14:45:23 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 808f7b57-dd86-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 15:45:22 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so7554707a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 06:45:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e1251dsm797345366b.23.2025.01.28.06.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 06:45:21 -0800 (PST)
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
X-Inumbo-ID: 808f7b57-dd86-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738075522; x=1738680322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bAZAoWoHUizWksXgxL/xbbj4bxyh7pa6NvIG5oI9n7k=;
        b=Lp57WfiE3+e5rdJcSO68wY73DEEecAzKgBkgwGjwXAGCkElVmBhUSrZB27Mx0NffqP
         x3vb1CjwMt5Q9Ln6JXPzlK8Ieakb2XU245l7Q3Dg8CPM0boNFQlTBeq0jDpbNeZJmVOS
         EpoRPYlaN6lLnfT+Ho3YiASDRUxjo+A8r4k8+1sir1yk7pCrWF/5ZYCVMeTI+cYIV5oz
         C22A59pr5IBJ6ElKS7cG1bRq/taQtQfmJCQnRAylFyYlCdUeryhVMDB1Y116hM40Ufvt
         PHPqDFKhASLd/QVnbCMG6Ii8mVrL8piwem1PdPch9ev998zhN6/AVj+PrtiRs/HoezVJ
         Ia/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075522; x=1738680322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAZAoWoHUizWksXgxL/xbbj4bxyh7pa6NvIG5oI9n7k=;
        b=Bw59lNrTn78gqZn1tveZ+ElNaSTZXSGXyShdt7ONcNwaQ1jhAMV+QECEaiNJDUD5cf
         Djuk9pIC5Rfe2L7KF4aou3GQ0bXIx92VujVlqospJXgNUXP1uq41Bl0fseE/6+bvdkrf
         AFhjvgZkirpZpV4YD0ie8ScbyScw2fZW/EAGF0OqLKx/+ekQGJce8yJyuxyoDd7IZH0M
         Vn56YRlfAhzmpOf6GEPnpSiB9Q4k8eQIa1uf3oYsacyzHT6bCKLtp9luiQ4hb0j9PRLc
         nRZbgChj0eb6VxnmFKAsrnAZiQW0gCNBb264unN/jgF90MZMKXLPnSTRx/ZifIqfOVsP
         Uq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvleDmO9FBX7FE3oFi0fNnedH7HWLvEpZKD1Lxq4JRppa5j/SmFnYceRRCRMCzA48HUAlFMrg5maE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/a0IV7c85BtaWnQH1yNQ7cy1xDxKRdHs0mwEvtF4mwkECyFSG
	+p4zMEB6K01rRI/kiXT+QiDgEp5265UYaplQyh+o7qKtU7Zg/ux0GIJqFIWy1w==
X-Gm-Gg: ASbGncuMqeOvxSl/w/v9FoNhOvsvJbKja+79FrkwaIWQPFynBkL3iRrBMEu8wmu9ile
	P7q05utxZA+7xaOvY83/1f/NYPnER3a+0Vhwho5RSn1Ub0ivgS8I+3HzCl/HGBl/n+XfhDdvBEd
	Pm1xQflGmanxAk/AK6AamwXLsTWrsfNUeEV6jjBEmcg+YWVGHA5EjJ4y8zPzUc7CqiMu+E8nVoB
	za1NJJFoYei/4zUfoS+IBBo0Eze9k5a75Dthv9UZf72r3eq47gkxZ4piedC7HHLiVgiyj+qIy/S
	uqT2lfyI9kImtGAdhopVIItBAzUdBGXt/ZSe4I6DzIsef2xtnoOoZK7odaJhqND15iNyLY3QxHc
	B
X-Google-Smtp-Source: AGHT+IGyH7WQMyjPEDrinSrqIlbC2IvcL+H2+vHfHiWY16s6ot2Vry4cR0ZzyBDQdZohUQRwYwNhEA==
X-Received: by 2002:a17:906:ef05:b0:ab3:4b0c:ea44 with SMTP id a640c23a62f3a-ab38b0b7ef3mr4302166866b.9.1738075521957;
        Tue, 28 Jan 2025 06:45:21 -0800 (PST)
Message-ID: <89074dee-7e54-417f-a164-8b53e0bfead9@suse.com>
Date: Tue, 28 Jan 2025 15:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/24] xen/console: rename console_rx to console_owner
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-9-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-9-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Update the symbol name to prepare for the follow on semantic change of console
> owner identifier.

Again the rename may be okay, but I'm afraid you can't defer to future changes
when it comes to addressing the why aspect(s).

Jan

