Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN9mAa8Mi2lXPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:47:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CB119CA6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226218.1532749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplGb-0002gn-KM; Tue, 10 Feb 2026 10:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226218.1532749; Tue, 10 Feb 2026 10:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplGb-0002eQ-HC; Tue, 10 Feb 2026 10:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1226218;
 Tue, 10 Feb 2026 10:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vplGa-0002eK-Jj
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:46:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb867c2d-066d-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 11:46:46 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso6986025e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:46:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e74e5sm49625335e9.12.2026.02.10.02.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:46:45 -0800 (PST)
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
X-Inumbo-ID: cb867c2d-066d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770720406; x=1771325206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XCGHS72CcA29OIJgn9KfwThbhpDXmEUfQlfG3Z0owk4=;
        b=RdGcUvsU17ubNj5lDq/wi4UA7f89xwyRwcf9IGOB921h2J2EApMoAmtJ08ScxXcH8+
         DmJ9FjrdXhQQ5Ky0OZCC3cN19aw0YMkmSMQuJ5lJzRISZRUhkennDVRh7wfFj/HB/Cjb
         5vL7ib72AGCAjnIYabfBLa83FtJl+X8S7QBa8Eb53Fw45jXKciWPpmtij8fs4fuX3N8y
         clTYyLHAmsTs81UMHrX0peKUtBoIShBfFNqoAsWsgpCjjJXEHtEgROQ/ble59fFqgiPb
         6N5zhLihL/KxiSQDST0cfcB81DTaqy62Lrp5yU36E1LdGfggKSa7U+fcITdY6BECowmo
         GLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720406; x=1771325206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCGHS72CcA29OIJgn9KfwThbhpDXmEUfQlfG3Z0owk4=;
        b=w8uWebHY//SxDVr5EmuG1iDVmsFi6fG26iJa3owUMxMjNBRr8ca6Emj+lSdFW7Wkzg
         FOZnxHw7fV/M7FgyWxWU4OheZIrdxvLdqn6fI/TqwcSh6IS9uqRpLlqtEmRD80FGvEOb
         7jThBD5Bu7NeQxfTSzEz2X9VJJk0VyHn89vNtjdBwJyqsNwC+mW2ybCRoBquMt2mt54f
         /vICqbkZDoDJRKnuNSjyt8jeZH1a5DcgsuPU+gSKb6yCPzRfpRshpPpm93U5zV+Bb7tK
         8XNTB5XJ1Z8AeJA3ObWWxnhKTDDsESyEZre6iDeRDQoosmczmFANXQzv7YjffIzfOJKo
         kfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTbfqFXyKCr/2z2pPL5suMUCgEJo6KCFAtpIzHK1iN09bF91zl/Ww7wPgxLkrVt+GTgpaIdg6SG3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAPMub0Bj7TLOfhdJ8w/l8qJl2xEDxi1GO7d438uJNunNGDSmL
	JizZpAe+PGkY6PtPHaq1yHGEPbtOazk1mXh1LjgU4f3pdy/olBagvVWRwKtFV3ZQ8g==
X-Gm-Gg: AZuq6aJ590BhpIn6rpR7KvfcNg9EKaASlKN1JMK16TXwnBhFWYufnh1SMCUMmBynbMd
	mXSWL1KJOOnCc7L2D7q4MmlTeWpJXKOgqniWKoMudEEwz3Du4jcPo5w34I8eFnD4JIs3Ua+rPw8
	rT1faO9DVLunUoF9bY+EoDXtVk2xPA+yNb/TV+zIfvwo9cL44RCgxfKxIAPfozupyzv4BteMPj3
	XLpGoRIOQLTb3TjRzlOfHyLC0Y6TPOkdALMekzfP9F2GH2UYNopKDCAfNZBas7juPQHroeqrGX5
	wsBxhYAYPDlAfARdgVCQ9oXlMxXj5cQCNpS8HKIOW9miXFMnlQ8QwZBhgXZfAzcbXBHnoqysk9X
	OGSWdIBSokGvrv7Ji7c+EpI23Lp7UGm+Bqswu+DHqzyIkKLCf6qU79jKmSMTc0dy7H8ysZpYlw2
	fZnhhfZRPdl+TfyJutpqZc0rSNWXcJiDyRgZ0mFYP7kdrAETLxTnRKuT3W5imb0R2SyiKvYYwXf
	2egVauvXVNjvlA=
X-Received: by 2002:a05:600c:348a:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48337ae7016mr112745205e9.3.1770720405531;
        Tue, 10 Feb 2026 02:46:45 -0800 (PST)
Message-ID: <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com>
Date: Tue, 10 Feb 2026 11:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Add Darwin.mk
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
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
In-Reply-To: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5E3CB119CA6
X-Rspamd-Action: no action

On 09.02.2026 11:46, Bertrand Marquis wrote:
> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,6 @@
> +# Use GNU tool definitions as the tools we are using are either GNU compatible
> +# or we only use features which are supported on Mac OS.
> +include $(XEN_ROOT)/config/StdGNU.mk
> +
> +# Cross compile on Mac OS, only hypervisor build has been tested, no tools
> +XEN_COMPILE_ARCH = unknow

While editing in the ABI aspect, it occurred to me to check what Apple has
to say regarding their ABI. For both aarch64 and x86-64 they say they use
the standard ABI with some modifications. We may want to evaluate whether
those modifications are actually compatible with what we need.

Talking of x86-64: Has building on an x86 Mac been tested as well?
Especially if that doesn't work, it may want mentioning.

Jan

