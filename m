Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB04866CB4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685337.1065885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWao-00015z-Jh; Mon, 26 Feb 2024 08:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685337.1065885; Mon, 26 Feb 2024 08:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWao-00014H-Fq; Mon, 26 Feb 2024 08:44:10 +0000
Received: by outflank-mailman (input) for mailman id 685337;
 Mon, 26 Feb 2024 08:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWam-000144-Ty
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:44:08 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c06fab-d483-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:44:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so1749832a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:44:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g11-20020a056402428b00b00563c63e0a13sm2142158edc.49.2024.02.26.00.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:44:06 -0800 (PST)
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
X-Inumbo-ID: 33c06fab-d483-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708937046; x=1709541846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OP4pR8KqizECVTvElPxzBJT/Os7DU3v48TUawUk6aGc=;
        b=JKckzQ4HuWg+Dj4P6rDLHl5hBK5JP6hsFbagH1umh1quX5GPHLOPuzSJJ4K0rrGVNQ
         UqeblC3XED1OgW5wYTtFUmrdTSATjTRWAg5hTkpxuBZpgjlybEMNKc/EdLi5kSOg/ZIq
         plB5kPJwveIIepuxaTMEi0x29Ta63uYt994157xvUbMCs1o5HFy75lXCRniqDFP5RnmM
         TEu/XJKyCQucoLavjKNEeCkWIXe/fIOcLWt08Tl7fU2w63qKwWo8WcecxJzFprAcFjR7
         /8MPmAHsMGIIPqCNTN4kjFgPEic/H/Q9HWe1XhIEaDBKg7Cv65f5lUQeiwey1/BP9opw
         I9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708937046; x=1709541846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OP4pR8KqizECVTvElPxzBJT/Os7DU3v48TUawUk6aGc=;
        b=rF+h6rTwftTJsEP89qqOEH1ClGiwsc4h9OcV+grqRUuUR9BCqf+exWtzGpgRvj1psz
         QBZrMlX6sccyURW91mVDr+c6gWr5oNTUCyFRmKkmaft5ilknOwgEDq1A1hddFkuKMSXk
         P30S2Lo1fxz1oAPhUrQwBpjvAlMYWYvSxGpr+8ZIPwNXzNefAGhvV4ecAah996/rTkoH
         CiUKheu9c+eUznFislVxZMqov7rB7Uathws+/8SDJtbuEl2giLm+1nBXy8t9zrxCthNs
         zhR+ydPEf+K5qABq1IjQayKdm7bNb5XLrFJDyrYaSCgfj5S1jixaskXlb/qBWXUBwjm/
         a5fA==
X-Forwarded-Encrypted: i=1; AJvYcCV8P8eUFWb0S3BcRmz7SWFo0XLmWWJNmXlghiHKMWMxBnEIr2ln2+y3tRS4R1IPtXkIyqf/cXSwklRKQcD+qEwfS2yyQ7W5BLuIskeZJrA=
X-Gm-Message-State: AOJu0Yx8GTnMg3Z07DeGnm/wr+m8d1cFhlM1XQsFGenlYMW60CLlAC1/
	fLkpmM35ApDB7QD8QasA/Ivu9DThLwObhtHwDm3ep3CXne1UbR7ZtKFm/pOaQA==
X-Google-Smtp-Source: AGHT+IHqs+UyzSnNMpduXmnnZuCpApjmzvij2yXJjO68aOqEbXWcMHYoJJO2Ub2jEES3v6CLIwU7QQ==
X-Received: by 2002:a05:6402:5389:b0:563:c2e5:5289 with SMTP id ew9-20020a056402538900b00563c2e55289mr5010620edb.13.1708937046614;
        Mon, 26 Feb 2024 00:44:06 -0800 (PST)
Message-ID: <707666cc-914e-42da-b823-fdc5a38271be@suse.com>
Date: Mon, 26 Feb 2024 09:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: add symbol exports for xenstore stubdom
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240226083955.19350-1-jgross@suse.com>
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
In-Reply-To: <20240226083955.19350-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 09:39, Juergen Gross wrote:
> Xenstore stubdom needs some more symbols exported.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Any Reported-by: possibly applicable here?

Jan

> --- a/xenbus.c
> +++ b/xenbus.c
> @@ -45,6 +45,7 @@
>  #endif
>  
>  struct xenstore_domain_interface *xenstore_buf;
> +EXPORT_SYMBOL(xenstore_buf);
>  static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
>  DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
>  static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
> @@ -70,6 +71,7 @@ static struct xenbus_req_info req_info[NR_REQS];
>  static char *errmsg(struct xsd_sockmsg *rep);
>  
>  uint32_t xenbus_evtchn;
> +EXPORT_SYMBOL(xenbus_evtchn);
>  
>  #ifdef CONFIG_PARAVIRT
>  void get_xenbus(void *p)


