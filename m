Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIwNGOHJgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:59:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DDCE8AF
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218739.1527588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwKU-00037s-DQ; Mon, 02 Feb 2026 15:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218739.1527588; Mon, 02 Feb 2026 15:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwKU-00035G-Ad; Mon, 02 Feb 2026 15:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1218739;
 Mon, 02 Feb 2026 15:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmwKS-00035A-Sv
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:59:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1abefc31-0050-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 16:59:07 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso21806845e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 07:59:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482da91a227sm121641405e9.2.2026.02.02.07.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 07:59:06 -0800 (PST)
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
X-Inumbo-ID: 1abefc31-0050-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770047947; x=1770652747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YKIilOtjFoTlX1gJVgT0Lqe3kijL1qEl5p++PzOoug8=;
        b=W9AlmkGBzcII+QXuSNcOoTeTUOrmdymYoJoMhwitONYX/edF+SRq73zoF2AIDybtAb
         kC4Iug0U0hqSiAT8aG1iE+WLSDtduw6+cM7tIWiDbVG87SMCXcCaYgxz28mnEvQQdLnT
         aEE3E1moS3jG5S5Uxq5izymuMqRTCDlF/fqnxkhrPywHd8oQyLYeoZdcVWRbDesYMNvs
         jwUxnAzKigTG21FEAGtz36a0eD+/JuSWQsXtWxhT1qQxr1V3yHamPUq9kqxPSMJ6Wjvd
         h4I4CpxVo0mNAIiF9jnZeh1ktND9ndGOnnkWjgWleV1dXMRJ3alUW2MkyIaw39cWduPN
         9miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047947; x=1770652747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKIilOtjFoTlX1gJVgT0Lqe3kijL1qEl5p++PzOoug8=;
        b=bJkuXGo+M9XxkKPGZVk62Vnx8lbTPtOrKPcLFS6wuCPeamCuaUWd1WKUfZx+KEITHr
         CAUI6BDNJQOWwmobeL6ayg1s9ZZwb/31IH1gzEVbyTL0BZCkqKG6Ya6JZo/7Sly7EkbZ
         ZilJTvD1AoFdkuNKO8hUjbhuA722a5XGdBWv0m4k3wViLZ82dVy7QOQz3+3tUOYOfxbf
         lkqWHRQfjlQZUfuD4BN9Gm6saJnb2g6Xt8DxJYnGzQMNlPYvuEphgmSt4XWsKJvLDCAK
         qVGh8Onqf03YHSBin7tSBC8dGgO95cxuUCNkqnisyNfi+paoAfJaCOXIkyfOHQQH9pz5
         UThg==
X-Gm-Message-State: AOJu0YzeL04hcj6NQX5wLlZDZZXYj9jrMgVcsk+AvO1aRY/EHk/4u+hj
	n4p/dbmDL9jLWC23LrVf05ILG9UwxYeZMq+zK9chY7GRE03oYPRPcSz9fHptViqFxA==
X-Gm-Gg: AZuq6aIBmfG26LPd7fJ9MGZcTTtWAyTIVnQeJkzi5VR63YYZiqCKICE6YNx1u78VF7N
	4B39zaRs5qjMg0nvC9Bl/dsgq/88VhDfsogXGzXzZuL5J8ocYxbm6qlZvf3o31zU/pyao0qE5u/
	NbxuKoOAacuuYhTwLw5MKhra1tIBMJgZBjpatQWazFwlesq4QOd2XQyHPuiKpfN7PERQWNEN5i7
	JdLwlz6pA6TM+9b5Pt3PqsZxaOQX/hAZli8vVTqnBaI/4neadAXRZOIAHdGc4jQyPZ+vI9fKJUC
	hamkOcMqAK76lx93UjrhdralVQTUsetc+Pi0Cl3KTmnHtTdVqanNKJ9cCsAdoEXSqyhbQHoCSb/
	Inr2FI/3D53JWodtfb+K8MWXxAOuKvsKed2wPW45GwLeJRkV/Sjp6qvD6oBD3jYc+GkzF1DwX7F
	UyraRxyw20b8Sqakw7Myj2/38exxcqihrnDCZtivMl4VVtLFNXhWQUh6YKY5h6KB+ysDw2FVHfp
	rk=
X-Received: by 2002:a05:600c:c162:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-482db4ac5bamr150292805e9.15.1770047946600;
        Mon, 02 Feb 2026 07:59:06 -0800 (PST)
Message-ID: <7eed3c7e-b3e8-4a0c-bd6d-c4ba22bb1c10@suse.com>
Date: Mon, 2 Feb 2026 16:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CPU: abstract read-mostly-ness for per-CPU cpumask_var_t
 variables
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <fe35f075-ff44-4942-bcd1-dcd917179867@suse.com>
 <aYDHyutbi9EQcOe4@Mac.lan>
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
In-Reply-To: <aYDHyutbi9EQcOe4@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C69DDCE8AF
X-Rspamd-Action: no action

On 02.02.2026 16:50, Roger Pau Monné wrote:
> On Wed, Nov 12, 2025 at 04:53:27PM +0100, Jan Beulich wrote:
>> cpumask_var_t can resolve to a pointer or to an array. While the pointer
>> typically is allocated once for a CPU and then only read (i.e. wants to be
>> marked read-mostly), the same isn't necessarily true for the array case.
>> There things depend on how the variable is actually used. cpu_core_mask
>> and cpu_sibling_mask (which all architectures have inherited from x86,
>> which in turn is possibly wrong) are altered only as CPUs are brought up
>> or down, so may remain uniformly read-mostly. Other (x86-only) instances
>> want to change, to avoid disturbing adjacent read-mostly data.
>>
>> While doing the x86 adjustment, also do one in the opposite direction,
>> i.e. where there was no read-mostly annotation when it is applicable in
>> the "pointer" case.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Really in the pointer case it would be nice if the allocations could then
>> also come from "read-mostly" space.
> 
> Hm, I guess for some of them yes, it would make sense to come from
> __read_mostly space, but would require passing an extra parameter to
> the DEFINE_ helper? Or introduce another variant.

Whether this could be sorted purely at the macro wrapper layer I'm not
sure. It's the actual allocation (which alloc_cpumask_var() et al do)
which would need to be more sophisticated than a simple _x[mz]alloc().

Jan

