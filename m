Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E840B29AFD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085480.1443802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuWE-0004dL-EG; Mon, 18 Aug 2025 07:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085480.1443802; Mon, 18 Aug 2025 07:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuWE-0004ax-B0; Mon, 18 Aug 2025 07:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1085480;
 Mon, 18 Aug 2025 07:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unuWC-0004BI-L7
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:43:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6a17376-7c06-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 09:42:59 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afca3e71009so723144666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:42:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccd8esm759349666b.65.2025.08.18.00.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:42:58 -0700 (PDT)
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
X-Inumbo-ID: f6a17376-7c06-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755502979; x=1756107779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qrzJWwBLEUVUnt82XwUlToFnEvElvx7yFJrOrM7Iy8E=;
        b=TIxReLxR7gS/yFxFcPMaBEZan/gpDq1a1pqeQ+h81Xjd6qD8YDpuoCBUkcKx+T1mH3
         qgprEBEmvEZ5ufDN8P9OYmTPy+SGcjjbVMyiBs8eckhJ0a9xfJLLduxKH0nuVI/5eVDI
         GQhUTuwXWtQMblqBGa/1gtwEKCnKR7G8XZVwiktchbt1OOOHK/Fdv8Q221g+HFZF3nGC
         wqhgivRSir50hoo3JZB4AXYQNvePKHl15DEULDU1xwy37X+YD5U9ftbOABpy1CNSdFZa
         W+TwZNxlQ582pZkP0J+nOe33xBBxKS+5IOigiXJ/4lRT/Uk6qn3Uw9gQ1TEXJkqEcIbH
         /P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755502979; x=1756107779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrzJWwBLEUVUnt82XwUlToFnEvElvx7yFJrOrM7Iy8E=;
        b=RClhOVedZ8PqAQXREtTLXZMPutJN2HaaUcaeaGZUogqtARiOjiDxbmPk6IOuAb9ioc
         gjPGZjF3/27Mn+pts676e2fvKd6qlW5k0jo/Fez8vDnHm/QR897E5SfdEME23ITtrkBX
         xalqZqbAoe1zAdTtIDkXGQeKhNNDLhaJIFpOswsqnHpI0EzqBvaPTvGynZygx4vDjVR+
         7aqSZnMDX40cKspJHsQ8FrM0Q+YybfIpBhOsz1ByV/GypgP+TC0rW0GV61ALf+tGZGHv
         2cGx5Mjhrd21MYX3FusJ2PyK0rqJb6ZWlOPSEK8ZlA1SYwFcJKXlWprDWfksQID5Bter
         WZQA==
X-Forwarded-Encrypted: i=1; AJvYcCVOSktUPc6NVVfF11RULZyCJe7jkVk47A8yQ8peR+e/GCkPlppBhKg3tSrmFaOhMVWLdWbANzACWtY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVm3b1fJP2QHJOxRlNyfe3j2bTwg4dkF5pHWGaYl2raCVrL4TN
	LsmPbZ2PYCHJCi+451QO8Nod9tsn8qTWtUmPYwZDmeELT/0bBoTrvnlRnjBqPNQDHg==
X-Gm-Gg: ASbGncs1qSgYL5V/O15KZHXJcmB4L4RY7r/9I/XNS4mJ3VK6mBPMRgcJyjbMGT+tOQX
	8jYM01DCSOEu0A6K9BwQ/LXQQO/6kmNHtnSaXJZrJjCdW96ACotGMq1+nJWKW58eXtKpY1anHY8
	X+nmJY6fbjhr/xrU27oFMk1mlVT9fPFB9p39Dd/mqAc3XKqf3ueq1tzzQ9Nn4aSiraimLwH8QLJ
	NBwaH+gsvGR7iz6PIHUPUY3vtEUa6hw+LJ0kYsZmTfUMg3ygR5dNg4TuAgV6Bozo4FDAff+9FJ+
	YzBMS+hbu4m0WLHfytDwDtwld1qA3T0ofojir2NfY8lptd0uRAXMdhebc/abo7w5ImHDjC+rSs8
	7Mav5kmlHcEB+FsF+Q0sfsyjwkOFQ9veMEb3WTIQ3gfYWIZ/z8u0qWXWPZP7OvXIQk4LjeRH8Ls
	wQuAngIJ0mY4pyKdHdnQ==
X-Google-Smtp-Source: AGHT+IH1HwrWBuZG6lmtDLBKROUuEdAX7XZt7LLgrJowOv6D6ZospaeblEHOEWRM2NCmXG9Nstpgow==
X-Received: by 2002:a17:907:1c1d:b0:af9:3f99:1422 with SMTP id a640c23a62f3a-afcbd5cbd9fmr1451036766b.5.1755502979174;
        Mon, 18 Aug 2025 00:42:59 -0700 (PDT)
Message-ID: <6330d03a-b228-4946-bb5e-c0142d0df6c8@suse.com>
Date: Mon, 18 Aug 2025 09:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20250815143236.27641-1-jgross@suse.com>
 <115eca26-32a3-403f-9bf6-553c6b20940c@suse.com>
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
In-Reply-To: <115eca26-32a3-403f-9bf6-553c6b20940c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 16:35, Juergen Gross wrote:
> + Release Manager

While this surely doesn't hurt, my understanding is that bug fixes don't
require release-acks just yet.

Jan

> On 15.08.25 16:32, Juergen Gross wrote:
>> In order to be able to use "xl info" before Xenstore has been started
>> or after it has crashed, hide obtaining the available Xenstore features
>> behind the new option "-x".
>>
>> Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to xl info output")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   docs/man/xl.1.pod.in     |  4 ++++
>>   docs/man/xl.cfg.5.pod.in |  2 +-
>>   tools/xl/xl_info.c       | 14 ++++++++++----
>>   3 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
>> index fe38724b2b..88ccf7ad82 100644
>> --- a/docs/man/xl.1.pod.in
>> +++ b/docs/man/xl.1.pod.in
>> @@ -996,6 +996,10 @@ B<OPTIONS>
>>   
>>   List host NUMA topology information
>>   
>> +=item B<-x>, B<--xenstore>
>> +
>> +Show Xenstore features available.
>> +
>>   =back
>>   
>>   =item B<top>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index f0c920b39d..acff45d308 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -743,7 +743,7 @@ condition.
>>   =back
>>   
>>   The features supported by the running Xenstore instance can be retrieved
>> -via the B<xl info> command in dom0.
>> +via the B<xl info -x> command in dom0.
>>   
>>   The default value is B<0xffffffff>, meaning that all possible Xenstore
>>   features are visible by the guest.
>> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
>> index eb019e3ee9..d3583cbf8f 100644
>> --- a/tools/xl/xl_info.c
>> +++ b/tools/xl/xl_info.c
>> @@ -353,7 +353,7 @@ static void output_xenstore_info(void)
>>       xs_close(xsh);
>>   }
>>   
>> -static void print_info(int numa)
>> +static void print_info(int numa, bool xs)
>>   {
>>       output_nodeinfo();
>>   
>> @@ -365,7 +365,8 @@ static void print_info(int numa)
>>       }
>>       output_xeninfo();
>>   
>> -    output_xenstore_info();
>> +    if (xs)
>> +        output_xenstore_info();
>>   
>>       maybe_printf("xend_config_format     : 4\n");
>>   
>> @@ -631,14 +632,19 @@ int main_info(int argc, char **argv)
>>       int opt;
>>       static struct option opts[] = {
>>           {"numa", 0, 0, 'n'},
>> +        {"xenstore", 0, 0, 'x'},
>>           COMMON_LONG_OPTS
>>       };
>>       int numa = 0;
>> +    bool xs = false;
>>   
>> -    SWITCH_FOREACH_OPT(opt, "n", opts, "info", 0) {
>> +    SWITCH_FOREACH_OPT(opt, "nx", opts, "info", 0) {
>>       case 'n':
>>           numa = 1;
>>           break;
>> +    case 'x':
>> +        xs = true;
>> +        break;
>>       }
>>   
>>       /*
>> @@ -648,7 +654,7 @@ int main_info(int argc, char **argv)
>>       if (numa == 0 && argc > optind)
>>           info_name = argv[optind];
>>   
>> -    print_info(numa);
>> +    print_info(numa, xs);
>>       return 0;
>>   }
>>   
> 


