Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGFoFNuLe2mlFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:33:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB2B23C3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216851.1526771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUx4-0006Ox-V8; Thu, 29 Jan 2026 16:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216851.1526771; Thu, 29 Jan 2026 16:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUx4-0006M1-RV; Thu, 29 Jan 2026 16:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1216851;
 Thu, 29 Jan 2026 16:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUx2-0006Lv-QE
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:33:00 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c72f93f-fd30-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 17:32:59 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so14557985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:32:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066be7404sm230124885e9.1.2026.01.29.08.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:32:58 -0800 (PST)
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
X-Inumbo-ID: 2c72f93f-fd30-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769704379; x=1770309179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6TpI3bZAq+Y1dFXT0IhJwAFFD7kNt+f5P4wPO/TMEdE=;
        b=SQ4kniflwqIDbME1eiM6VBNzUudxEteI1SgnW4jL0bYwnUXa+hfvtIjqtAyZcOIQa8
         KVM4Jm5inoLi1hOlVQmO3AoOmm/vU37o9z03wGqcA5mE2vFGmW09w1k84SONeh8Eh8+W
         H2zf/TwzP/2iAufbs2Ns7j9b2KrPljSnK7Wm3CDgf2mPOEXSTnQvy2sOXYqwtxLLFcip
         qxJZUeuUwvimNACFS56oF7miUvM1g/A1Q7uQ2biQhAsvLLYG5BVVwxOWUaxhG351lCVo
         5cyjvwB5/25KjoaXIpIVHhFCWb6PQV0Fsx0z7CC3UkM4FJwZdMIVNtNY8eT+OXc/bHze
         PbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704379; x=1770309179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TpI3bZAq+Y1dFXT0IhJwAFFD7kNt+f5P4wPO/TMEdE=;
        b=K+ROzwi9jJ2hDdT6nobMReodclPmkMQ2aaarAv6TSoj+dCGnuQSaPze+GNZmIuFnKH
         mzd3jxOxVVldWdxYJiF5dJhFiWySD2OffTLHoyMioM8oZxoI3ipVMXJOhpNxJj20SDaa
         MKzdW9Yf71B2gXP/Q0x+23DP8XroU9DmBgRUYOXUiYSW9Y8Xos9UC4KEA9x9gmJK66RP
         EjEXEc0imqrTS3WdXnVNsXD5sSFU8Pyv40PhwAm+5LYRWwqvePF5J+SwJA8s/HumQL1n
         8O5g2k6rGUXFt1XUcHzjs1ozL4GtxXtuSfV39V6udMPUhcqZ52lP2Dj7gGtzjI06CB94
         eYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUl59u2F616CveMMWWtnDUdh2jCtUHjbx07fXhN5ra1z6ZbjTFnbBCR0US+aSgEPvhSBx/5H3s6dA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywl65w5Nrr48DqvOEpZQnOSDWMFIQBoQCyBoFzJjN/ZkIhfz+l/
	JcsL9PQDJ0OMkHFG/q01GKZkFsWbC4C+c2yqcoUqxS9PpKzvsKCDGSjWdLsLMHYRrw==
X-Gm-Gg: AZuq6aKRrPcg8jrHno3SCpsFcCEHeM5AJ/M0/T/7EappyVz0G71Pgo/6CQZsG+u9lel
	cwv3mbHcP6T73QIpp1JQTDPc0qQMMnm4sDPt7rRuN8xMrE4HLWm1h3WGGUWimXLxwZ2kCI4tUGo
	1Jq3yd26ExphsjwY0BB1CC75x8Zr4ZZsa7dru/wXHftjSE4XduCo6ZmS+SOhjB+UHDFDqdbPfVK
	ElkMfZA/j9Mmu8ATUhmftrjnIk386Z7JyMq87FeJ9C9lXVDa/PhYceXnfQ3AF+ajlo+XdSQiI98
	L4DcfFY2Iw4PO79hz0UPt8KbVe6SzMkf/EMjUAbdoBK2mY0eE/5uyWX9pCUxzoIbOypaeft5jIW
	L7yBzXEQMGqLhDFGzcd4DYsWSua/U3k2NSIkiz/mC8jXhPjhGq/vxJb07L4m4MDTIRfcG2gvkyy
	NjWKVISbipl3+kDBQezAoyFRDDDElbCQ3qicTL9zO5DV2aREslFoVL+2ZVmF87Y7RCQYzJQW7/V
	9w=
X-Received: by 2002:a05:600c:58c1:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-48082ab60e8mr29348615e9.14.1769704378973;
        Thu, 29 Jan 2026 08:32:58 -0800 (PST)
Message-ID: <d250f11a-9fdf-489c-a533-bc767441a103@suse.com>
Date: Thu, 29 Jan 2026 17:32:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] xen/riscv: add temporary stub for
 smp_send_event_check_mask()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <062dbab8751bd0c27b913ce78de3a3eeb0ffe22f.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <062dbab8751bd0c27b913ce78de3a3eeb0ffe22f.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BACB2B23C3
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> RISC-V SMP support is not yet implemented, but smp_send_event_check_mask()
> is required by common code and vcpu_kick(), which is introduced later.
> Provide a temporary stub implementation that asserts the mask only targets
> CPU0.
> 
> cpumask_subset() is used instead of cpumask_equal() because some callers
> (e.g. cpumask_raise_softirq() or cpu_raise_softirq_batch_finish()) may
> legitimately pass an empty mask, which would otherwise cause false
> failures.
> 
> The BUG_ON() ensures that attempts to use this function with multiple CPUs
> are caught early once SMP support is introduced.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Looks like this is independent of earlier patches in the series, and hence
could go in right away? Please confirm.

Jan

