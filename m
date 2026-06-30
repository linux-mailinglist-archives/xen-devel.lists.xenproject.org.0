Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZauJBKrkQ2qWlAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:45:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F326E6130
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=G02tmclg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349149.1607026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaeO-0003eb-8t; Tue, 30 Jun 2026 15:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349149.1607026; Tue, 30 Jun 2026 15:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaeO-0003cM-5k; Tue, 30 Jun 2026 15:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1349149;
 Tue, 30 Jun 2026 15:45:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weaeM-0003cA-N8
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:45:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaeL-00HD6G-RH
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:45:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43e488-e002-0a2a0a5209dd-0a2a4508a67c-20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:45:21 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43e491-edec-0a2a45080019-d155802ce088-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:45:21 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so40326645e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:45:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4db18dsm1862365e9.0.2026.06.30.08.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 08:45:20 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782834321; x=1783439121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv7brKRGbgzJR9Ff0nrkCGDekUe9jDUZO9wYBYgTQXM=;
        b=G02tmclg5mHKYAA9UHF/I0O6HlfLTk6AVJn+CXlHzJU4iVS7NRvzFjQUEB9e693Xfh
         bBXoY3TWoWEqkBRznPaR6YRChBf9oSUk5ZWmGgSVH9SRKZgaQOJyYCjG5GhNLKNdP5m9
         +l1No4w5fSCVLDPidIDj+kJvH/hafxWQ7UoXlm+6gCMD6+f0FUOVW0pPCPYKvAJTvzZL
         Y9d0JjqT9hiLedJqarkXLOF/nelIMcBySCKRTBgvjtvsb7coW8rXFG8vhQ3QyiDj/8Rd
         rb4mvNCb/rho9ob1LjGiq6d6zHx5e+NudhpW1KvvYy3jSZ+Yp3+GDvpaNhv7qU6v4tKu
         aOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834321; x=1783439121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv7brKRGbgzJR9Ff0nrkCGDekUe9jDUZO9wYBYgTQXM=;
        b=iuG0fsuGXxKn6IrqbQ26BYIOt6uFz7dJntu8IGw6kyr4b/5PXHrQqti9AS3UHyyiK+
         E/AyvkAX+VWqM1IzU/ys+eEMlryJEaxPyPpZ3fCGT3au8U0jHsdzFbqBwoMduze8FkQ5
         oT8mIEgGGJQqQJ6lWw1XK0Ap5AhCrIdKPW4ZZMKVh3wYJWTac0KS8qq8QXuuTZXkNiF/
         x+nwUMjMSUL2w3PpWN255CY6D/+LLGLbPZCgCzZy//gVMPNtFjhstyJWQ62l8i29FU4f
         aDuxsvluOFejBCCB8Wozdn6Eebi3dfxS4EIcFu6/3UMLEwIvJJz11nx8WfHturfOQWTI
         vqjw==
X-Forwarded-Encrypted: i=1; AFNElJ8RJq14mb0cvNudp03IVBs5D5F2tOM28fcNOrWGnAhIv6gwkrvWqVSxTyIY9LVaiCksEgC5TsRDgiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9yDQltEvPByXK+vWncfY3YN1lSobDhdLfliJ9kzQHTZ+jzEx1
	Jm9PMEdlRDn2fX0iMhlIQBna3r8s01GpEY24IB4t388jPIvR1X1U6fBSlTGJk79QSA==
X-Gm-Gg: AfdE7clsSRGbfKgTVRqVmdx6LG+hsbxFdVHSlfY2Pfm+d8MjGL+u2+82fmES8YD+71T
	+5piPmBhryxdgEFg2EqrdyZSSNmPcdO5rQoY7/UZ6EJdxe/hlX2K/1B5w2EOp/PzItwHesTqVdp
	qsXHWxH0w6w5uk431wV5p+642TnpNcjTpeNmSuJWkPrdA8kYN9VWo6NnpIuMMKaUEAkhwZk7Z43
	MA+tuUOQxXVLqtQ6Uq6XEX/a5yMfXjXLiSdkfVMx8Ni8S28bR3h3oDRsypa20/LqzRuxyKxqeOq
	cP7R/FQ+J7Vu7NTsFWVXjx2JN6hRH3r/7RN60OaBI9Wcb5os7C0r34u78N7OedfYXWPpAs7grYL
	HwT+2u37l97kpkAYaoANIBpB6sxlO6jQXsQjGr4N9C6cW0W3Z3W3eVbRzVGB43efBBYK8ws/Sk2
	SI1eSl4FcgWfS25sDGl7z+ocY/EXmasa4LO9+tW3ATXEIx3GOGCZemnchR4z+zWvoT6lD8Zo/6e
	dfj
X-Received: by 2002:a05:600c:4694:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493b827e9ecmr67639505e9.4.1782834320698;
        Tue, 30 Jun 2026 08:45:20 -0700 (PDT)
Message-ID: <a5bb3ee2-3f14-4732-88e3-0be5c79f1877@suse.com>
Date: Tue, 30 Jun 2026 17:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/18] pci: Introduce parse_pci_sbdf{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753815.8631fc262581453bbf619ec5b2062170.19f14686c7b000701b@vates.tech>
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
In-Reply-To: <1782753815.8631fc262581453bbf619ec5b2062170.19f14686c7b000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782834321-A3D333FC-38657FD5/0/0
X-purgate-type: clean
X-purgate-size: 4531
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53F326E6130

On 29.06.2026 19:21, Teddy Astie wrote:
> In many places, we're parsing a PCI string into individual
> parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
> using PCI_SBDF macro. Rather than converting from parts to pci_sbdf_t
> and vice versa, introduce a new function that parses a PCI string
> into a pci_sbdf_t structure directly.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Having looked at patch 17 (undoing the transient pieces added here), I can't help
the impression that none of the style issues introduced here actually make that
patch any easier / smaller. Therefore I'm having a hard time ack-ing this change,
which otherwise I would now that (among the committers) we've sorted the issue of
transient introduction of unreachable code (permitting it when sorted within a
series).

Jan

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -151,7 +151,7 @@ void pci_intx(const struct pci_dev *pdev, bool enable)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>  }
>  
> -const char *__init parse_pci(const char *s, unsigned int *seg_p,
> +const char *__init parse_pci_split(const char *s, unsigned int *seg_p,
>                               unsigned int *bus_p, unsigned int *dev_p,
>                               unsigned int *func_p)
>  {
> @@ -160,7 +160,7 @@ const char *__init parse_pci(const char *s, unsigned int *seg_p,
>      return parse_pci_seg(s, seg_p, bus_p, dev_p, func_p, &def_seg);
>  }
>  
> -const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
> +const char *__init parse_pci_split_seg(const char *s, unsigned int *seg_p,
>                                   unsigned int *bus_p, unsigned int *dev_p,
>                                   unsigned int *func_p, bool *def_seg)
>  {
> @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>  
>      return s;
>  }
> +
> +const char *__init parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> +
> +const char *__init parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index ed6c95452f..8e2f8a1ab7 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -274,12 +274,28 @@ unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
>  unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
>                                            unsigned int start,
>                                            unsigned int cap);
> -const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
> +const char *parse_pci_split(const char *s, unsigned int *seg_p, unsigned int *bus_p,
>                        unsigned int *dev_p, unsigned int *func_p);
> -const char *parse_pci_seg(const char *s, unsigned int *seg_p,
> +const char *parse_pci_split_seg(const char *s, unsigned int *seg_p,
>                            unsigned int *bus_p, unsigned int *dev_p,
>                            unsigned int *func_p, bool *def_seg);
>  
> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg);
> +
> +#define _parse_pci_split(a, b, c, d, e, ...) parse_pci_split(a, b, c, d, e)
> +#define _parse_pci_split_seg(a, b, c, d, e, f, ...) parse_pci_split_seg(a, b, c, d, e, f)
> +
> +#define parse_pci(a, b, ...)                                            \
> +    (count_args(__VA_ARGS__) > 0                                        \
> +     ? _parse_pci_split(a, (void *)b, ##__VA_ARGS__, NULL, NULL, NULL)  \
> +     :  parse_pci_sbdf(a, (void *)b))
> +
> +#define parse_pci_seg(a, b, c, ...)                                     \
> +    (count_args(__VA_ARGS__) > 0                                        \
> +     ? _parse_pci_split_seg(a, (void *)b, (void *)c, ##__VA_ARGS__, NULL, NULL, NULL, NULL) \
> +     :  parse_pci_sbdf_seg(a, (void *)b, (void *)c))
> +
>  #define PCI_BAR_VF      (1u << 0)
>  #define PCI_BAR_LAST    (1u << 1)
>  #define PCI_BAR_ROM     (1u << 2)


