Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBJLL9F6qWkg8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:45:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F8211F56
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246567.1545698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy84L-0004jt-AS; Thu, 05 Mar 2026 12:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246567.1545698; Thu, 05 Mar 2026 12:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy84L-0004hr-7j; Thu, 05 Mar 2026 12:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1246567;
 Thu, 05 Mar 2026 12:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy84K-0004hl-EN
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 12:44:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14c654f1-1891-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 13:44:42 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso82579515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 04:44:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fafbf9bsm38275965e9.14.2026.03.05.04.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 04:44:41 -0800 (PST)
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
X-Inumbo-ID: 14c654f1-1891-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772714682; x=1773319482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps30MAUb6AEgAzijJvCP0wKyGWFcZbak+cdz0xP/K4g=;
        b=ACkfBDjRwVH2Ry7PD9NRwuz2ONkBuxi4SfyQ3wqg9CIXqnHxMZDZue3aGosHsQz0mS
         TcP5TYjjIlH53io0hWUHbAb1R+yKOyXIA1c23EeP2EX3JZ2C9q/7qiDolQzzJWiIQ80S
         LS8yb7yr9bXrAGXLJDhZbAdbYDsXsX47qrAB24QYeivD6ogLSrMuVCkJodsK3dkk+MwY
         fwjhgN6ciVfkYKxPfWr/RbLKBZFcsfyfDFIWREusTGCBmEi6Q4MEyX9v1+ViqdvgXgNw
         8ZAl4LP2CrAHJRf5K1DBJK3ZvPgGsH4rCko2QFse8QjO2xx3ucT9McsuH/0Bfj0Sm+19
         2s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714682; x=1773319482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps30MAUb6AEgAzijJvCP0wKyGWFcZbak+cdz0xP/K4g=;
        b=t1R/ZLlVoqtwsD9ltfMtWHPfTO9wK0jwCTXjHdazPVC7MBu6uULZrpzL6D8i6yJOTY
         79Ej+5I/bmGonjYS2DuKPVWkfq91Vw7Mf7hREC7tork2Hipz3kjFwuehSyj3/MdDB1/K
         /Rdg2yyVHwgWPTWMIYis6Im3NDV698LNZ3gdjIA6oYZ9YOsNdCrSpWSWjk3xno2fUL6U
         PwlPW5bGSp9iCd4/kBsa7sQaJYVkgLC39ke4H9WwcnFna6g/9oZyyMCDsirVka1zVMK6
         8cZvz23amzlztT0z78or9VEuDFjbAIJyywyryF43/bbsMUVYgBaNpC3rqjf/KzvYcPUH
         OOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgwY08hmhFRmn9TlRETQhXl/f33wULi8W03GxRajdqLO/RiQCsAT+VmEox9UxtvCRYgLpZeBAr7fQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxC7cIuQ8aX54llJC5llwBzIn3aa85W90kRM0atRTGe+0jAT7l
	5kEBH/uAlN1l7VAzeXOIOlJHHobwyjpX4DVC0kjWUR27Y9fv8YpoyHuGrLD26hRYrPPu75T0niF
	ZIpA=
X-Gm-Gg: ATEYQzwSMjcEbgSLybzurdAviaVTHR0wug01GX+hBTNGENtAXtAddNDPJYZK6g7XnZS
	fizU38z/JnWKB7ANAdhuzdcnrmKet3RX2bp019Y+n8KjUWWyBETCS9Z0+vRRxGzegAzCNbG4KCt
	NJU1UEDkiQ4sXDqLq24FYWY+d0poI1WY0AZptB/4NBNr9MW5W6uevXrybWEpVYdJkj5VeVw9/M6
	FUpSVXAXNtCPecf7gnjHr0f8kxjsW1fI6RwP80weYQ8Ab5dCHpmBCTvveYSsnlWrmOUsUeXkeJK
	GQRtvAqxTKFJ7iHCB3ythZ4L9WMKNp9nw3hMk7By8bSlVEI5tFlKhdcYJ00yPY337h4LBJGvIG2
	f7Zu59OhIppkLvDKvrPrr22/770WAD8d68nUxWWUh8pBSBNW4XlE8roJMdz21Lpb2f1IXnJR35U
	Y+PfEtR97C29OGihKlnfaGlX01I4nsKSj5omF29O7NyfTmVp9CYFPkLsn1sMnyouKpvZ2fO+cpn
	VcmJKac3biRGBA=
X-Received: by 2002:a05:600c:3f0d:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-4851ee854b6mr40429935e9.7.1772714681842;
        Thu, 05 Mar 2026 04:44:41 -0800 (PST)
Message-ID: <79b2e448-fdba-46dc-8b94-b0128cf0f492@suse.com>
Date: Thu, 5 Mar 2026 13:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D7F8211F56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 15:29, Bernhard Kaindl wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -868,6 +868,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
>          break;
>  
> +    case XEN_DOMCTL_claim_memory:
> +        /* Use the same XSM hook as XENMEM_claim_pages */
> +        ret = xsm_claim_pages(XSM_PRIV, d);
> +        if ( ret )
> +            break;
> +
> +        ret = claim_memory(d, &op->u.claim_memory);
> +        break;

This needs accompanying by a change to xsm/flask/hooks.c:flask_domctl().

Jan

