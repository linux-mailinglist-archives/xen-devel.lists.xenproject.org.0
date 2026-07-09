Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QreCL/FuT2qJggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:50:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8D72F228
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:50:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L74In4kt;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357800.1612142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlOr-0008P3-JQ; Thu, 09 Jul 2026 09:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357800.1612142; Thu, 09 Jul 2026 09:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlOr-0008MX-GR; Thu, 09 Jul 2026 09:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1357800;
 Thu, 09 Jul 2026 09:50:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whlOq-0008MP-9P
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:50:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlOp-00340W-Ll
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:50:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f6ee7-e002-0a2a0a5209dd-0a2a4508ddb8-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:50:31 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f6ee3-edec-0a2a45080019-d1558035b4b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:50:27 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso7128205e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:50:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff432sm46473905e9.4.2026.07.09.02.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 02:50:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1783590627; x=1784195427; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uzUco4gjMZybX3tSPTLUbmKPa7/F0OEncPgI7+2eps=;
        b=L74In4ktGYzyw2427c8Jw2dX0qoqXBJoa9GDWgyigOdjzrRWJCzm1F/bFOmqgGFBLc
         TgR7vyTO43FudvRGXFHo/g5RJKQFnzcSyALPXriA7B4ei5x1X/MhsazItxz08CZgacW+
         LIWAfajPyh2M/cwIw06b/SG7ZvRYPig1rArgKsgQV8bRhQyJpfPWo1xp1gZRQjeYUVI7
         hegIpi3qAV6FWj5Mar6gyH/sW1YF0wG4c9FFGbg/8Ei+TDokyVMzK0jOoHfTiX+DZvQS
         8k4hYXUccj0QVp4Ll60pkEvu2oi3nRv1fzM0nqO/EqnkGOOSVb/aM2VladJyEMH1U1Om
         ag6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590627; x=1784195427;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uzUco4gjMZybX3tSPTLUbmKPa7/F0OEncPgI7+2eps=;
        b=MTAO+hszZbzke0pjQ0YC+SrVVaFvdapOrXfzq0C7DODUz8UMGNtUHd/cGltH3WtG7w
         LBmiWsimck0R1zcCd6C4LJdRk+K4qmD0PUrgcXRmLtMakQ8fUHS9MaqVrTQzS2BvQGou
         gndBA4/OzVZDkkA4HMSSc8lGpn1k9xVR6MSl/FSWD8RqcZYBSdg6JcNwLjhPA/WN3Wt2
         IChId+DZb+ebi2fKvyNUt+919/eis3NlWcABnhqiN4yQgX/mQQ6mMZx7W1OefyDkg7LN
         tuaPxmgkZCCjSjy3OXDHLOPQUsR9kcwUy1eEc9XqV7Px49djiiCjXyTzDIelzXu9VmTE
         mW3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpe2ryC+DGDz5kznQEZQD0JQsdyxGs9Vyu1DRiFUHjwVlMLsmxUsh5CMQ+2CSSlFRkLHqBDiXmj1j0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcwB5YJ8xHfkyYErnTjiRgj+DsmKX2Lmw4KscA2gIdpegImQWq
	CrbQNF1wNqHSUiNYZJ+wQD7bxGd3MrGxzsQZKsCmRYyBIJs0/PqvLiTa3YjzEohrkQ==
X-Gm-Gg: AfdE7cmS0Cwy/O7pwY/Hk/fV3vpuWTMGEcK6A29Ad76MNnR2f6wj99eaz3IR7QKkW6z
	Ja0jaoFLaxalRF0kgM/1W6HSF3QP5lppNYmpDCnm9AGUBXoiEM1cacQEpwp+nPWqkEyapUfYmEY
	VADyXNI41TtSA7fNlBYP3GkT1tWCK/aYuTaLm6ZQn1iLp7dWUCOWxr+z/I4zzHbh5ntxnxtqalY
	rFbW+qQ9JSLOxWCju+hI5Vv90aJM2KQuSaJfzun2TGIwWiNz54adg0qKzvjNG+6aUrLH0J/wGm6
	Mg2Cq4lkbMyDbQFvKwRbYpwtf3CGrcnUtosxbKMU1n+pIGtrnPdULOlBW9039nZq9lzxZfup8bU
	jl/Ag+RgFctYxUJxNrgoTJrLvWeGWUIi/yfWfpT+ytMl7doyOD2fNYlt5KQD2lnNUtEwH8hfuvr
	MGISa/7IuqsTTyrgSxRxyG1+Fy/sH9O/QGD9bMLuCR6qn+lVZfd5BMpqlhZaOt3rfXdKyEmwZoX
	pHB
X-Received: by 2002:a05:600c:198c:b0:493:af56:8e64 with SMTP id 5b1f17b1804b1-493e871daa3mr40963315e9.32.1783590626849;
        Thu, 09 Jul 2026 02:50:26 -0700 (PDT)
Message-ID: <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
Date: Thu, 9 Jul 2026 11:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1783590627-4052F3FC-C23E85A6/0/0
X-purgate-type: clean
X-purgate-size: 2139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid,epam.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29D8D72F228

On 09.07.2026 11:44, Dmytro Prokopchuk1 wrote:
> A malformed partial DTB specifying both '#address-cells = <0>' and
> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
> evaluate to 0. This sum is subsequently used as a divisor when
> calculating the number of regions in the 'xen,reg' property inside
> handle_passthrough_prop():
> 
>     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                         sizeof(uint32_t));
> 
> This leads to a division by zero exception in the Xen hypervisor during
> boot, causing a hypervisor panic/crash.
> 
> Fix this by validating that both 'address_cells' and 'size_cells'
> are within the valid range of [1, 2] at the read side in scan_pfdt_node()
> immediately after they are parsed. Any invalid cell size combination is
> safely rejected early with an error message and return -EINVAL.
> 
> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v3:
>  - use Michal's idea for placing that check into other place
>  - reword commit message
> ---
>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..179a2b88aa 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>      size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>                                       DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>  
> +    if ( address_cells < 1 || address_cells > 2 ||
> +         size_cells < 1 || size_cells > 2 )
> +    {
> +        dprintk(XENLOG_ERR "Invalid address/size cells combination\n");

Perhaps just for my own education: Is it really "invalid", or merely
"unsupported" / "unrecognized"? (I can see 0 being possibly invalid, but
it looks less clear for values above 2.)

Jan

