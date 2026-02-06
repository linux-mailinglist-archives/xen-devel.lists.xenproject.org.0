Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Aj+DPmIhWn3DAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 07:23:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D143FA9CB
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 07:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222805.1530496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voFEu-0006uw-0M; Fri, 06 Feb 2026 06:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222805.1530496; Fri, 06 Feb 2026 06:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voFEt-0006sx-Tk; Fri, 06 Feb 2026 06:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1222805;
 Fri, 06 Feb 2026 06:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1voFEs-0006sp-N3
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 06:22:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa768d0-0324-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 07:22:44 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43622089851so1271374f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 22:22:44 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a68:95b1:80b8:e2ec:fafe?
 (p200300cab70c6a6895b180b8e2ecfafe.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a68:95b1:80b8:e2ec:fafe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd4desm3710626f8f.18.2026.02.05.22.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 22:22:43 -0800 (PST)
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
X-Inumbo-ID: 3fa768d0-0324-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770358964; x=1770963764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OL70kP6yGavXgSQW1KtWli/IeEhjXcq7DRjMjwt40Hk=;
        b=Qf1d6A/qiCBL72QijOQECgJnCWSeXEGQttv7cHtJXHsaZyg7yNgdiOPutdHAWWjwV/
         veZ4ouW61MUaaN5+uiEJlqr6YK7Bt5YFiVwT5LP4hPqyJfViL+WF/wqelN82pZigPGla
         Z02hyCeEBZzCnNNyElvIiZco0xNi2ME3DdtHcOEBEzIWjgc608pstHaxO9bYCIz9CL8j
         P9tENKQFupSfyTCLVWA6vfJntjXf3kgn5kOS+We943bE5pzVjh6DlP+8V/1hICbW16NI
         mH0dtXG6XTuLpGE7kC1O4ZtSjsinu8A7YVer493pYslKGTEbklqba3hQ+NdW739GGKTg
         JxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770358964; x=1770963764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL70kP6yGavXgSQW1KtWli/IeEhjXcq7DRjMjwt40Hk=;
        b=Ghp+K0yNWUUUN6swsJH/1+U59D4jI6MI2Yo+zWRYnPNRhnmWHQg9khcC4CLccTblS2
         KZas1dOaPXe+O+Af1yB464S1ZGv9R10x5TtRa+2UytccJsCD1YfJNykwYCVAaxy34fOH
         7mAYKF+Bj4rhpPQRTr2v6qNefPxUIysDZftvuu9drBw8bPBMZZIRV/BXjMpChRiuP3Vf
         5Owb7Rgnqei6+AOy4qwoUXFxdycTLtrhZx/X3QgLGLq9MRCcJaSJP+IxQ5REakBLVhLj
         dOxo8FiAIDLwu9v6kf6YNtnNjFN39gNpnVfPQqr5FLNYnwOIWd4YlarOYkdGt4DwUZdA
         GotQ==
X-Gm-Message-State: AOJu0Yz+yF8HAkmmuFb+DrDKuAqHBFG6l0a9Rf/7VGsquyG9BdYeJAVo
	LOTt9Xdswq5Fyfo332r0k2Hl1plIbPN1o0iiQfNKsnHqgcMTpa688uURqZQVqKK8Pg==
X-Gm-Gg: AZuq6aK591jgs72OyL2Bkg+OSY5rOoHRDT6UQ+Mmr/RrWuKcWwoo6BDl97EpAeI9aDr
	57jSJ4D2VZ8QttkennF1YxLXgbzAx6UBfWtHw6m05IBZz/sC57ilaOhWfWglNspVal+tm9UZenI
	u54Y6u3YbBxQ31qOcTM15+EEnjKA/OsknjR/P8KEqeGfSC0le0mYMtTvUApM08EfS4ZridmCJtk
	UAP4qImhi8FbgabVBQj6GH0gk2DDBZnt2FwRcJDF7bUQ2GdTfH7X4JFqSDGX8JMYVD4V9e8K4LJ
	HsUzEBzIWuYsCZfKq9B2KIT2jh2utQTdx52xVPgGGbfBLtzD3AKeL7w9jnthVsFP9OV95xdusCL
	46PTibujHctyQM2xWFnwVJNAzktulF3s6M6VCtpZuSAZC4rGr1IzJSUzvO6mHYUYBGGgWghDq3a
	crG/HcTqnTPcEieTe9m4LL8QDK0t2u7S+RpdYH4yKJ2SGjw74vZ3EGkDmMMTvyZPgtK1oQhKcRr
	AWrQV+HkasgoZwzOrYodyAnO/CeS1raVoeKRC366TpFYU81
X-Received: by 2002:a05:6000:184f:b0:435:e57a:9082 with SMTP id ffacd0b85a97d-4362938b122mr2753129f8f.46.1770358964233;
        Thu, 05 Feb 2026 22:22:44 -0800 (PST)
Message-ID: <eeccafa8-8474-485d-afd5-85d9eecdb241@suse.com>
Date: Fri, 6 Feb 2026 07:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <aYTONBslOYwyrFqM@Mac.lan>
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
In-Reply-To: <aYTONBslOYwyrFqM@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D143FA9CB
X-Rspamd-Action: no action

On 05.02.2026 18:07, Roger Pau Monné wrote:
> On Thu, Feb 05, 2026 at 12:33:54PM +0100, Bertrand Marquis wrote:
>> +## Limitations
>> +
>> +- **Hypervisor only**: This only builds the Xen hypervisor, not the tools
>> +- **Cross-compilation only**: Native builds are not supported
> 
> Probably a more philosophical question, but is it really a cross
> compilation if I'm building an arm64 Xen on Apple arm64 silicon?
> 
> Sure, it might use a different toolchain from native, but it's still a
> "native" build from an architectural perspective?

"Cross" aiui covers both OS (i.e. ABI) and hardware. Building x86 Linux
binaries on e.g. Windows is "cross", too. (Strictly speaking it's the
target triplet that is commonly used in at least GNU - if any part
differs, it's "cross". It just so happens that Xen uses Linux'es ABI,
and hence its building is native on identical-arch Linux.)

Jan

