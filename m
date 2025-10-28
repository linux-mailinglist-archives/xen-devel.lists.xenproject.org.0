Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F318C15333
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 15:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152191.1482695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDktP-0000Wj-SS; Tue, 28 Oct 2025 14:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152191.1482695; Tue, 28 Oct 2025 14:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDktP-0000Up-Op; Tue, 28 Oct 2025 14:41:47 +0000
Received: by outflank-mailman (input) for mailman id 1152191;
 Tue, 28 Oct 2025 14:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDktN-0000Uj-Rl
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 14:41:45 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 394fec71-b40c-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 15:41:44 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3943301f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 07:41:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b6fsm20811380f8f.1.2025.10.28.07.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:41:43 -0700 (PDT)
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
X-Inumbo-ID: 394fec71-b40c-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761662504; x=1762267304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chagK8Cr654Gz3A3PNxJctL9KDzwjtJsfmzXx8hGFT8=;
        b=W49g0V8PJwCmE4NDYvmZ5022Rf2WQEPrn/Z5SlTsFBSVPQOrygTu3LGlr1wMhE5TZG
         /CaOotmQjxJPC/Zpj3PlF7w3iFWZuWj+wJ+tXlbd4Zfq8xPFkJy+yu2BEds+Fk4V32Ov
         WzmneKl/WqrkmJ13lDWzDSziebtA24E5IKYZ2wgmBYvX8mluO6I7gOHLiUWHj7aU7ivv
         GV6wVHqf+Qui/GnGHSp2ziHWH7LzmUI6w8L4L+yiLnEUrEHKlelzqErDDRyWJSIG/2Qy
         wx1UmnLItXMrf/fb1Cq43Ad3wi2PW/n8M23ruolWD6q+XsFJvnlTWqxT9e1yFQmxs7Ge
         ow/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662504; x=1762267304;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chagK8Cr654Gz3A3PNxJctL9KDzwjtJsfmzXx8hGFT8=;
        b=ScgwsE20T0CvOb8omZ6gQKpt7IgJ9H/jxZq4Ke9VyKKHa/o+2GO9jHvklzBgG25L3O
         IXGEZSPvmqNiFJGDa7WMAPYJg5yG+mbCo2/2xJ1f49p1tw10PAgKSgW8ZYm0N62S/1P2
         nSwItQQyNLCSHDZIZba1xTl69KiQX7Oygx4v5RjEjiRz1LfR4xjN7gAj9LDp5N1VPW/o
         8fIM5p+DBBTj1sr5XbmLCqkof5k8k+GWQA9jXf3k4+MfUDx9M9K60Ej+rw+HtflpzuGC
         gono65V5/xeW8P8hIOadGSKAPHdtN8iw1bKXOnBX1KA5mfpdbaSaf8AmXh9xDOFAFQMc
         fF4w==
X-Gm-Message-State: AOJu0YzANe+CEj/go5rtDRhjw27o3bhrx04tSe/w9rLuRhRsXGWgSyen
	P+hD0RkWIvd1SGMoRGR2/Y/qGgOnK6C1SccjmdurPnBi5ZScnYUE/HihQHM5PjgfVm9YN55ZfcX
	nkn0=
X-Gm-Gg: ASbGncvCJVtiIViMGqWobA33UGqap3zvK82McS3iMZ9Y1EEhOUTJbAJUhJzmQvIiXoC
	K3QvCv/00oESS199xA4+F9zjcWrivi93rpSuiigU+9IhGYVNYIIf9s/1Mfl3CrFQfZ4Yq0AT7+L
	JgIDbo5F2Hfwj8VdWhrVLxxeALzmC/iudabT1hEAeg74NzbEEn13wxy3/jR4cuqVcaACgQhd4vp
	+ATzGowQu6/EUb2MFqJlWDxk1pdGAbVNwxEuwvhTYlQnhmFb+WR4nlde9srqyu+GZvNVyeXy0d9
	duwLZAaoLb9GIwx6Xoyunm4fg2eCBYZW7SYi2lOpupyxojQomLqUYA/QTn5/nx7nRTS9LXrvG5w
	OH1K5CSqnLJ/n7PuY3pmSccdnu1xNmWKfH+eKxoSGWvqHHRco3gX1GHi3n00i2A/HWA5Gx8XYs6
	3KIXP64Z9ibmkc8paM0EQfBdBLzfBTMgFOj4ipTRw68rY4J6JtfNnuHIo0+BkT
X-Google-Smtp-Source: AGHT+IFdFIYsUq4NXALNBSRmohcL/uaXWjcc+4UtgiqrMIgN2GZb++y6i/03YBstwOK2zsE2lwZfzA==
X-Received: by 2002:a05:6000:2c0f:b0:427:84a:6dc9 with SMTP id ffacd0b85a97d-429a7e93530mr3521664f8f.59.1761662503761;
        Tue, 28 Oct 2025 07:41:43 -0700 (PDT)
Message-ID: <4750e9e6-7688-47d2-ad5b-79015de4fb37@suse.com>
Date: Tue, 28 Oct 2025 15:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/AMD: disable RDSEED on Fam17 model 47 stepping 0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3dd4cddd-2dd7-4337-be89-b775a4b04824@suse.com>
Content-Language: en-US
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
In-Reply-To: <3dd4cddd-2dd7-4337-be89-b775a4b04824@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 14:56, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1220,6 +1220,24 @@ static void cf_check init_amd(struct cpu
>  		}
>  		break;
>  
> +	case 0x17:
> +		/*
> +		 * Fam17 model 47 stepping 0 has an error that causes RDSEED to
> +		 * always return 0xffffffff (while RDRAND works correctly).
> +		 */
> +		if (c == &boot_cpu_data &&
> +		    c->family == 0x47 && c->stepping == 0 &&

Of course this means to be c->model.

Jan

