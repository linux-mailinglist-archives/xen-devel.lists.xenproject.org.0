Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFGtLP6jsmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:31:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D8270F48
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252135.1548906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eFP-0002dm-Kn; Thu, 12 Mar 2026 11:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252135.1548906; Thu, 12 Mar 2026 11:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eFP-0002cL-Gy; Thu, 12 Mar 2026 11:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1252135;
 Thu, 12 Mar 2026 11:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0eFO-0002cD-5r
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:30:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfa9e506-1e06-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:30:29 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so8308275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:30:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe21b631sm9340256f8f.27.2026.03.12.04.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:30:28 -0700 (PDT)
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
X-Inumbo-ID: dfa9e506-1e06-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773315029; x=1773919829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O36rUnkadiIg6aqkuKyYmmGiuGQxdTDhnVE3HZFlPL4=;
        b=WZtybFTLwa3ZR68ewSEFDM0F3PyuFAIupPsDxtasPO//TTMi/IfBlwUEX3HYzEP6Fu
         4KImWaXACGxcRCC7AK8XNbDRRS9+v+DOpdqeUvVKJfnHAlx3fJczn5JHVBxMUJpFFZy3
         HxOx+eRXw7OKtaEuF3Me3wHbrcujJmeAmG60FjkpV3ttagnsQTdLSi0mJTLw/II1Qfk4
         gUvFgkNGEKM08HQm4REDu+Pz6GiBBw6wpRA6hfBuk4TuT/AckbFQRKhILGX0JARH2v2n
         ir8cp8TzO1I21O0228I4Z7f31SHyjjajm3IfhjIQmDTBggPc9vcx2SWJcQZOuR7VbUyo
         6zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315029; x=1773919829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O36rUnkadiIg6aqkuKyYmmGiuGQxdTDhnVE3HZFlPL4=;
        b=NDYz8yvXhEcs1iOOF32s+8ULfNLl+kpimbLwddkwfFKw5ehAx0eJHC3qdmGdSmya6s
         N8TIqm2himlR5tM90OReTMPgTzrv7IZlVEO/3tNLqOg87FCPrXSSAwXzjhpG73WDqsJd
         CgBlkQ/HfDBOHB3lyZEo5ywBqyjSiH9SHA0GqE6IY3iVvbSB0dKBXcBg8ysk/NEsz35P
         /wykaQhMVWggeMmeVIPHA2SykCAKNI2BmfkerRt9k/T6usRbNU2+Y2KqNZBBsWfvcQ0r
         COc974zqq7apfkhhlSOMtB+R8ExCwbr70nNtBnlxqvlzU/uEEgjl6PMagutYlRo6lOH/
         lBxA==
X-Forwarded-Encrypted: i=1; AJvYcCVqZhDUzcKjasZ3iLdENhJ3ZF3EH7HD1jNGYSGjk+V0lLqDhCGtM6W6nWq3BbYiYvqqx/pnKMvSLnA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn8t4MUtBruFgJBVB6MGd5l6t+41npNp73vOqbWVyk5k6rCCNi
	Z0jAvelSBfWWSoIDkAKcbKbpXpZTPiPQhpsdtjlH8QQSC847VjHMbzULAY2i5YneSg==
X-Gm-Gg: ATEYQzwsNT9Q2x76CPAWw9whYTlQOIZuAHX90mzqxmYWB1bwxWPpeEsbpqzHMiXytX/
	Uuq96ax/JQuSWAr6vtvcwe6aXIhU0L9FAPERNlbxTLve/q52jNGPu4XAJi3/30Jk1XPoS4EASyb
	NNdv1lsODvObG7qmYeQaexvnt/uFxNutdblnGmKMMDNZWq2iVx1c606gNbSUvq4P3ZxguAlDRhm
	NAF0UZa6vY9x3px/4SN0YUgWJ4W5jQiHq4/nrclshwNL8JYYVMjRb84Y6KCv11nVRKYspFSEpc2
	w99AHnB8P0VoEErDgZa1f/PnnSdEvUGKIwn0xYpaCqdGhvUjO6xCRi5CT/aKFKuC+jW6errmx2w
	/giBvrIrB8TC2qJl8JAdhem7UqatB1eciD29tK/rD6HcDgpV1HorBK7wnjBnelS7/ucWWTEL8dE
	X2KIQzHLwistUMyeXHo/v0wEL7oMwrdExELU1nphJ7fyKX6MhaVFOPFdJIewHkq7Mleg6em2V8c
	ScFVyix4xPQ0t8=
X-Received: by 2002:a05:600c:8b02:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-4854b0c74e0mr103504155e9.11.1773315029131;
        Thu, 12 Mar 2026 04:30:29 -0700 (PDT)
Message-ID: <4197491b-a7dd-4402-bc44-eb26368e390e@suse.com>
Date: Thu, 12 Mar 2026 12:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM
 ops
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-5-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-5-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 160D8270F48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 13:31, Julian Vetter wrote:
> Add two DM ops for MSI passthrough IRQs. These new DM ops take the raw
> MSI address and data fields rather than a pre-decoded gflags values. Xen
> decodes the destination ID via msi_addr_to_gflags(), including any
> extended destination bits in address[11:5]. This means the device model
> does not need to understand the extended destination ID encoding, and
> simply forwards the MSI address it observes from the guest.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Since there's no cover letter to reply to, this one will need to do. What
I'm missing in the series is leveraging of the (limited) cleanup potential.
You're obsoleting the PT_IRQ_TYPE_MSI sub-case of
XEN_DOMCTL_{,un}bind_pt_irq. Respective libxc functions could now call the
libdevicemodel ones, rather than invoking those domctl-s. The domctl-s
could then reject attempts to use that sub-case.

Jan

