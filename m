Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ48MArXcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:51:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1D62AA7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210432.1522101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipTI-0004KH-Al; Thu, 22 Jan 2026 07:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210432.1522101; Thu, 22 Jan 2026 07:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipTI-0004He-7O; Thu, 22 Jan 2026 07:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1210432;
 Thu, 22 Jan 2026 07:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vipTG-0004HY-LH
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:51:14 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f6b7512-f767-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 08:51:13 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso5397245e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:51:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm48570075e9.3.2026.01.21.23.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:51:12 -0800 (PST)
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
X-Inumbo-ID: 1f6b7512-f767-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769068272; x=1769673072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SyJeTi7i/D3MREEF/w/xuHxWikcUo5WC7W0cCWWhhxI=;
        b=FVvvwnNGTL9XOYdptjJW5PcyLVJV1XXABXBLeSEjKMidYa+yOeQUEL4Lf7k9c9OnBZ
         euPjUSt3U6OLDqEY6iqumjqxB1A3BEYXdhwnegjXJBtexkM9xrZYDjIsX4dbTNOWW7Kj
         dj+cm57l5f3n25uAtOVUYP6lfPsu6SPSp5LIOdWkZ36xLh/qx4H8YXDw01FEriAinydQ
         zf1wSlRq3XraDgNZkLngl5p+dmAm018zBcOkYjNTsrDqaqzWUn6x4h5VWCT+UFH2UdaQ
         L9fN9vZFWqGWzbibBKK5Ddqy/H7OjXq/MLDViPKDGfBqBi+8n5e+dBlcxvjs68RuBNQv
         ZcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769068272; x=1769673072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyJeTi7i/D3MREEF/w/xuHxWikcUo5WC7W0cCWWhhxI=;
        b=syhSmbQbH2/0G1bNZK94+aKpPlws4WAadaFCxKCjiuvMY+BzdvdRzOu8apNli6AtqT
         Kxps65csrE3Dc/18I8KUpIoz/eYN54Ggq6naYQ6s5BzrkLG95Vlr6axwOfEmJo557e/A
         M13+CKoG/5ZrwpdX/dO0/sGA0Op2yiipOZxeMpY4IuTyqhjPrDSL5Mn0miH/ee5kAhvT
         onpSA1/AF4TNCUAJ0NsRlZw7WL0xhbpsJwa4Xgipot7YtX60bibNGGpCW9PrHHe9U4jL
         Oj/HM3IoFPSW+ZfZioetsY3JbksRbyeaBLFp6XaxEniJCI9hguIduiE4NYf0o0DvHCGl
         YqlA==
X-Forwarded-Encrypted: i=1; AJvYcCUX8vgEmJ4PyjH8+uD3eyZ4CMjiJcaUS1wjdAIOZh1ZDS8nLSYs7xBXlE/30ig42opFfmq9RjAgBaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2U7ljkWwGPJMT2BsbI6NlmwR+C6qUBGcPOXwyLiSwS/VQ3jeh
	e4cME8A87/MjHG3NHUFbY44DzdSFH1BbevJldNsAjxX/Zqqu+eKLY6FSfiNqyvSVJg==
X-Gm-Gg: AZuq6aLyQKmrlFhyuW3mDtXI1Yi5zIXgXbZ8vULF0iDjbugP+npZVZXj/WycyfgWgaP
	40qnvpFyyVHGW7rsJGHGLXMJRwGabv8F3Zk1hL+tvKbvUcji6LJoxIS0KO14Q1tCymqkpAgd4dD
	X+fZ3LMyGHZpZ00JsYC0BpZqnL/iq1VmjQE4/F8OLSn8cYf85tLhCLEAZPufjqCqvqJprWQIdNV
	4a2sVi6O+0WBAreK3wLRqsGJ32d5wfR4L6hvIIkLeV407iC0wxp+ghhxAd87mgomo7gupSi/M6A
	K84NdxBMd8BAbsdTSDNoCbviPLeX7e7uJ6rJrRsp4O9Y7aBSNcpPBkLD1Z2wAbuReJKoRR1bmrA
	y/9AIs2sTrgnyj+MCp6n+5EptaUx2Yo7+WHeX9CJvfFYYjHZeC8lPCpuZuAusjF+l0nMOahMDeH
	CobTfZ5xwitdag1rPYGtG2Fsv+Epz4sIecnWlrrsTVw9a72SqOO6589vckB71WnVZRs8G1puVqA
	DgUMagBhWtpzg==
X-Received: by 2002:a05:600c:1387:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4801e30ba55mr320222835e9.15.1769068272498;
        Wed, 21 Jan 2026 23:51:12 -0800 (PST)
Message-ID: <114d2326-112b-41ea-8c32-12b785f8e7a0@suse.com>
Date: Thu, 22 Jan 2026 08:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
 <8482f823e945060d1a36469f14f94aa6251e3f71.1769020872.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <8482f823e945060d1a36469f14f94aa6251e3f71.1769020872.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 36E1D62AA7
X-Rspamd-Action: no action

On 21.01.2026 19:43, Oleksii Moisieiev wrote:
> --- a/xen/arch/arm/firmware/sci.c
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -126,6 +126,41 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      return 0;
>  }
>  
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    struct dt_device_node *dev;
> +    int ret = 0;
> +
> +    switch ( domctl->cmd )
> +    {
> +    case XEN_DOMCTL_assign_device:
> +        ret = -ENXIO;
> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> +            break;
> +
> +        if ( !cur_mediator )
> +            break;
> +
> +        if ( !cur_mediator->assign_dt_device )
> +            break;
> +
> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> +                                    domctl->u.assign_device.u.dt.size, &dev);
> +        if ( ret )
> +            return ret;
> +
> +        ret = sci_assign_dt_device(d, dev);
> +
> +        break;
> +    default:

Nit: Blank line above here please.

> @@ -274,7 +277,7 @@ static bool is_stable_domctl(uint32_t cmd)
>  
>  long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  {
> -    long ret = 0;
> +    long ret = 0, ret1 = 0;

This initializer isn't really needed, with ...

> @@ -833,7 +836,28 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        /*
> +         * Chain SCI DT handling ahead of the IOMMU path so an SCI mediator
> +         * can authorise access-controlled DT devices. Unhandled cases report
> +         * -ENXIO, which is ignored.
> +         */
> +        ret1 = -ENXIO;

... this, is it? In fact, why not use -ENXIO as initializer?

> +    #if IS_ENABLED(CONFIG_ARM_SCI)
> +        ret1 = sci_do_domctl(op, d, u_domctl);
> +    #endif

Why the indentation of the pre-processor directives? At the very least the #-es
want to be in the first column, but I see no reason for the indentation at all.

>          ret = iommu_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 )
> +            return ret;

You can't simply return here, as we may be holding an RCU lock on the domain.

> +        /*
> +         * If IOMMU processing was successful, check for SCI processing return
> +         * code and if it failed then overwrite the return code to propagate
> +         * SCI failure back to caller.
> +         */
> +        if ( ret1 != -ENXIO && ret1 < 0 )
> +            ret = ret1;

So if IOMMU processing was successful and because of SCI you return an error
here, why would the IOMMU part not need undoing? Or to ask differently, if
SCI said "no", why even try the IOMMU operation?

Jan

