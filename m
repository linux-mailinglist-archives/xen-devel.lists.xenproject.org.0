Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJVzCn0eemlS2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:34:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456FA2D5B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215728.1525845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6cc-0007or-4p; Wed, 28 Jan 2026 14:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215728.1525845; Wed, 28 Jan 2026 14:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6cc-0007nQ-20; Wed, 28 Jan 2026 14:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1215728;
 Wed, 28 Jan 2026 14:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl6ca-0007nI-AL
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:34:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b09e602-fc56-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 15:34:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so52314275e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 06:34:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce56068sm62756515e9.13.2026.01.28.06.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 06:34:13 -0800 (PST)
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
X-Inumbo-ID: 6b09e602-fc56-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769610854; x=1770215654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJtFY15q/E6HHORO3vH6tPMr9mWbNmRTiMhrsT2h7m8=;
        b=KjdA2zD1MxVa/B0uSEcEQgmj+dM5ytiu29RYkzTp/V0EEwoNEs9mAlj1RASgX78z17
         nRL3mhoscHoD8JeAC3ZXDM8T9ypjBweWgQxnyJ32/6IsjBL/WmKWZdI2mQaqXVgXrRvP
         cFKHxbAOkiQfZgdYBIW01CbrOlxapCbL7oS2+fNCzD4iylRqvnvg018WETAzwFAQPB+R
         UpDdiVWAZLBYBljAYRWXKi3cQe3MExhMi4ZmDDxRG79Na1EDtjkGJgrdECgkXBTwXF+S
         MJyq9X8eOTdkcz5IO4Uv2b7WOoxkIL1VDjpm4ny44PL0Emi/OaxttBdhRvD376FtZb07
         +low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769610854; x=1770215654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJtFY15q/E6HHORO3vH6tPMr9mWbNmRTiMhrsT2h7m8=;
        b=Dmv12Qx8BU0KgHKcuOAkTPpvjmSq9LTHeSCW+OqsC3D295b+e/4zz6pupUAc9NoeHG
         KYGksWTAKYtIZEnf4P/rtrGrhnC19fF5iFQeHN05Gh54FVp87w5JleTsAeXfr+sImeoM
         axGbVdqClgCwcv3GPapogdwT/wP4BYDGuqi6EMgG2UxpoLeAJWdvTlCAaK4fdue7Nu3k
         iTZYGgpM0y7PjTdSe3GWKBnyFred5U/cEGCg5FgDldKIGWIKUkrK4hlcUArbLG2EPkaz
         hLS+iul+feEXlHdh39Zh+Bo8OFLfaKd0AaEkApZgLO0fjOf4MCJTmm6fqNZdDM7DBB0V
         rOdw==
X-Gm-Message-State: AOJu0YyX4XcB5D4Krg9AAyucJ1iwp/FEUZ/8/6O7e8uSof+WQmvot4kz
	fTdSd3ueIZusRICeRJZh/Dm6tgBy8rzo9Dl8WspVoFMJeFonIk63+vEce8KwrwEwCg==
X-Gm-Gg: AZuq6aJZwQSaVCQsALFBPlYckh5XGHLWP3ZWR0L3LY4pJXTCfMA7ShuMKgnc+SJcv74
	nA14mt1qRaSohrK57x26kqG6vIzv5RZZKZWId3lZtBpuma6TqWfKFT50TQ3g8XQS4th2DU8ZiFF
	4JUUdFWtlguio/5N/+6bhr7Sj6epBtDzkEGsD2lltB/ik/3nGZEGkyPU82f45pc1M23d302KYSO
	uyfyFRG2Ic5ZA+SgXRqVpXVAy2BPWrvDZrHGo8SCTltF8rIKpAR3UDdXgNChtqxyCNmWlKYXwiR
	WF8MGaaTnPRI5QeRTJwBetXE7A2sCN2U3G1iPxmRkN2SBeRXMXdUIBtUzlHLcMhrwnQ8JV9hAub
	5bEhqao3Y77UbGEAYvyd4XZrrStYSaiMOz+QdLrKE0mssWzn5CVrcVVTLSzbGr8AlqMZNm2D75+
	HVIRbPgcbM7Acjb+LjGKSw+gF65gdlDmFIuPbNYAO8ojelNX1TPiqxFJm/9kVu3sLZbLfkI3vkc
	xs=
X-Received: by 2002:a05:600c:1e0d:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-48069c86e2amr81416625e9.35.1769610853855;
        Wed, 28 Jan 2026 06:34:13 -0800 (PST)
Message-ID: <163e1fed-8a06-4078-aaff-8f0ad0ce6601@suse.com>
Date: Wed, 28 Jan 2026 15:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <baee2f62-786b-4ed3-9ff4-cde3a06c4eb9@citrix.com> <aXoQHCRoakqtJrlc@Mac.lan>
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
In-Reply-To: <aXoQHCRoakqtJrlc@Mac.lan>
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7456FA2D5B
X-Rspamd-Action: no action

On 28.01.2026 14:33, Roger Pau Monné wrote:
> On Wed, Jan 28, 2026 at 12:44:26PM +0000, Andrew Cooper wrote:
>> In principle we could assert that it's already NULL in _domain_destroy()
>> which might help catch an error if it gets set early but the domain
>> destroyed before getting into the domlist, but that seems like a rather
>> slim case.
> 
> Given my understanding of the logic in the XENMEM_ hypercalls, I think
> toolstack can still target domains in the process of being destroyed,
> at which point we need to keep a final cleanup instance
> _domain_destroy(), or otherwise adjust XENMEM_populate_physmap
> hypercall (and others?) so they can't target dying domains.

Considering that these requests will fail for dying domains because of the
check in assign_pages(), it may indeed make sense to have another earlier
check for the purposes here. Otoh doing this early may not buy us very
much, as the domain may become "dying" immediately after the check. Whereas
switching stash_allocation()'s if() to

    if ( d->pending_scrub || d->is_dying )

looks like it might do.

Jan

