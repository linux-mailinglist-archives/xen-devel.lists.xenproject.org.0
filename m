Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66998A54F5F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903785.1311743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDLZ-00069L-5b; Thu, 06 Mar 2025 15:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903785.1311743; Thu, 06 Mar 2025 15:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDLZ-00066m-2Y; Thu, 06 Mar 2025 15:41:17 +0000
Received: by outflank-mailman (input) for mailman id 903785;
 Thu, 06 Mar 2025 15:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqDLX-00066g-Rx
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:41:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6edfeb3b-faa1-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 16:41:13 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bd03ed604so7378885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:41:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c6203sm53306225e9.24.2025.03.06.07.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 07:41:11 -0800 (PST)
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
X-Inumbo-ID: 6edfeb3b-faa1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741275672; x=1741880472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DGwaPKtKFaZlPvtxRAUsCkBD4pDgJpIoW4mCfRWiXjk=;
        b=F2MlTCEB5woTw7T1PXcJaNVDjZRBqk6I7IB+eCH2Kj8ZegiNdJGQpTkN5bcP432H9z
         b3Yg4gcqIwxfYLEL4pGZO6SwG7xl7/uKXVZpYxjOhZzpcx4/MmfumRe8vmyTKuf0lBqz
         y1vaI7TIaIPB5f7FUqIaDIS9kIEY9eP8BnzND3N5yAS/0kAaehgbfcGAa/AzE1N2fj+d
         x3FK5JjEyPmVu2Y0SYy2gfbvGNE/tgbus/i21up3A4Vt1SCWUhGeN6c/ICFeLGhCI26l
         VSwRZU1jkyy5eCIDQJpP/+idJqBG0kNkSHG8rKI3BEf0iERAUtnH2P13RRA0CJNXKEff
         cTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275672; x=1741880472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGwaPKtKFaZlPvtxRAUsCkBD4pDgJpIoW4mCfRWiXjk=;
        b=He0lOdr2JRhsgkyoHaKVKpQkx3ncOP2nVrgETtBZaJAq3/uvgUEvfnvwrO8k9xW1Dc
         fHPd3eFBzhgVpGfEED8QH/E09u+2bRN3rYvvP9LqsB7wsPrytcvPF9sGdp1XvPB33hyK
         hhGeRphQ2A7OL/o1yIG3vqWZp8sDHyfy3TJcpPvDFWfIJxkvs8C2WPO7XmV5MVYWDqUV
         zSHW07djb4ZlexDdi9goxKollfz9aM5oo7AlBr0PRKvVgmJkLPf4BcQgEQ9HNLLAGCIi
         zADrb5jobTSP7mwZ9Ilb/I5f+H5AyGO7qtUooAJesYzd/TexcjzUJORGlVbLkuevp7vh
         EPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWG4/gONATmuOrCc9U80gOfv2CYiVL++pIYF2jHAGM3ibxOPAVp/7K2omAOS2sWRiRmSOQj7fiBNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHNLofOTNV7LiCSt5A5GeoPwHA87rMKWghhWj69EAmYXr/2/Iu
	DR1tgKVNQQx6QOiJ6OvoaOOa4+xyoVLqMb6lK0dL7PB/bsQ3xUdnfYwjx48mlQ==
X-Gm-Gg: ASbGncugM4D3jvtPwK6XAb/kTZYSEo0j3OxiVFLbB/YXajrbvGhTReyKjgv5gRcqrdI
	nYaS0icdVNGfJ/0bUat7Wjaf4JfuWmz73A8qwCNjQXzH3mHJTYV2Yg3xhMPj1OlBm0WcgjCucfJ
	/KPZa7V3+SBZG86Ah09qYDV5fzTk6l7K7DNClzflvGOFK2UXolhQVW1NmfBjvf/fjpRyBQOoAUx
	tSa75HmPrWJD1m91kXO3NPtvhH/w7uvzurgYASDAFZOVrT1GDih2F9TGLikEeLGe/qeUjERm2r1
	Yt6Rm1m+3lC3VxlFlzZp9sur9sogMB6ucqCOYF9z93XRvrBB8b+9xY8AP5/OUzZDZqdaxQjPbO0
	BWbpwVFo8R+hgo6p8sGwPJuaVk/9v+w==
X-Google-Smtp-Source: AGHT+IGxqs9b6zF9SZnUxUV+4ms42SgFP3kZfy0nAZnPyTwja2Nls56WLHIi6wEdWlvWIueB/bXnig==
X-Received: by 2002:a05:600c:6a13:b0:43b:b67f:6802 with SMTP id 5b1f17b1804b1-43be06b7a1amr20604045e9.0.1741275672387;
        Thu, 06 Mar 2025 07:41:12 -0800 (PST)
Message-ID: <21bd8eff-1583-42a9-baf4-00a495ab7a5b@suse.com>
Date: Thu, 6 Mar 2025 16:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-4-jgross@suse.com>
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
In-Reply-To: <20250204113407.16839-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 12:34, Juergen Gross wrote:
> @@ -1075,6 +1086,26 @@ static void clear_global_virq_handlers(struct domain *d)
>      }
>  }
>  
> +struct domain *lock_dom_exc_handler(void)
> +{
> +    struct domain *d;
> +
> +    d = get_global_virq_handler(VIRQ_DOM_EXC);

The Arm dom0less crash(es?) found by CI are apparently a result of this possibly
returning NULL (hardware_domain == NULL). Returning NULL from here also in this
case (and not just ...

> +    if ( unlikely(!get_domain(d)) )
> +        return NULL;

... in this one) would at least deal with the use from domain_changed_state(). I
didn't closely check other uses. Thoughts?

Jan

