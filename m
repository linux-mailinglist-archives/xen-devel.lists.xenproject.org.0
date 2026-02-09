Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDc4LfSuiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:55:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB7210DD42
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225098.1531560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNyl-0002cD-8r; Mon, 09 Feb 2026 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225098.1531560; Mon, 09 Feb 2026 09:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNyl-0002a9-6A; Mon, 09 Feb 2026 09:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1225098;
 Mon, 09 Feb 2026 09:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNyj-0002a3-Tw
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:54:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea97129-059d-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 10:54:48 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso696292f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:54:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bcdfcsm26675623f8f.10.2026.02.09.01.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:54:47 -0800 (PST)
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
X-Inumbo-ID: 5ea97129-059d-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770630888; x=1771235688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kyk4UMo77LHGu/CGUnrmNu78TqeUvmgqXiBER9ISS2w=;
        b=V6f5fmN7aY18DsnFKqoHf7n66ukSLRUp4BxLnGHc7QIxNvzRPdHF5hCHZYEJAjtm/S
         08zIqSi4S6/nU7/4aoRLBMj+KV6QPAapnhsZWJPYJgF8HOfF6NMGmhqfs8v4milYvr9W
         FPRVYu9MVx3F6K7pYmH1tfvwdqRo+aUn0l6TC7Bnjn7GkleD9hx9jEpyghG/nMJ54ZNT
         BUY++yhZmhjj8RsQJ71fGk54Kb5fri91IicecbUGqSgZyPL1XEIbSauUe+fOgKLdz5ZS
         QAJ3a83vitFR4GBd1qo+8MO9IbhDHQxC1AizZB8nMvXMsBw+PmvuPoutvr0NKwjPWd5S
         EnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630888; x=1771235688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyk4UMo77LHGu/CGUnrmNu78TqeUvmgqXiBER9ISS2w=;
        b=eDE9OCaeflP52w6mqrGZ6Fez2o/CrFBilQXKB7iEEKo3aILBNXqVIu0GvJmRhdCNZx
         ejLdnK6Ji7V4dQiI97cvB8HQpmgUNrIhPsr6ssluEogA1Ccxuc8GnDz6vwCQTDAJQ+ck
         MhlfvLABLanjx5y5b1JWSguSqs+7OXt6f4zmzmC+C99vF2q4mxskhjbC7c7uKZQtXXrg
         1nMfv+pSF75l+0jiq12loevpm4cuRP0Y/LEb2ywWKCSjR6YGfrlU6k1UamMvOXvCmWo9
         SKAisFnw3pJ+FoSjVsLVDBaDEt/aC3l5enek9Rl4F9/VYwJPezSOqszHKd1z4CAkS1VS
         F72Q==
X-Forwarded-Encrypted: i=1; AJvYcCVH+3MIygAeX9FIXoCS0DkM5gW7zQL06ae83IuSWJuC2Ax9QrlZmjVOgbd+M75LiYgzCADa2uV/Kv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyO/4U1Mkcyl0vf9JB+S2PnIWRDPnQMoFpZLcY4JCjpdIb2ZPTY
	l/37QaaNMIcaDwDEyMn3JE2jyq6DSxyW2h00TG+9xTUFKkv0x3k+0SPdyC2A5jD4HsB+KXZgrJQ
	T/uA=
X-Gm-Gg: AZuq6aK0Ue72ZmiqZvOrb+Ruz93xQVtXRDRhhP0kxdoczJ6iV16jAKrlEhuKsjVNLp6
	xJAYRZiF6e31ISTGVNbYJ9VrLcwANtd/fL6WNpOsEArFxv4iUFA311AXVtoLBDWAUQLyGpe5o23
	bn+kN0SGRgZeTcDqpEMEENv6ow+dCWqjYAqkw3uU1FuaO8JYIOlNh+uH2eRV+zpEdKt3zDKIdtt
	oyH50S3Pn6pV7d2qC32JloQ3yeJcstNYyuIbNR5OmQMcDO8sCS2AAtmf0fHatnACu/ZWULliIbz
	+8l6v7us8Dp9m32jpkK+T+3DEsviT9wPZIm6NVvbkiQZmHQddCpeehsG4XHBA/XRPUpS51of1tS
	Ui8pZ+PIgnyrCMabtQX9WstPuSMFqxKvf9bTIrSpZggCPi+D+FT5B0jO+GBw6kLHFtsK6f+hE3d
	nPLibAlpKv7Pgi79mMZNdZamyAOvBBzxxNnZ9nTUF7vVTnbQm9hTAq9Agw99oHW49UN8VC27VMb
	VA=
X-Received: by 2002:a05:6000:2306:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-437664c4204mr7464356f8f.47.1770630887694;
        Mon, 09 Feb 2026 01:54:47 -0800 (PST)
Message-ID: <63031607-4b36-403b-8135-c5b271332b3a@suse.com>
Date: Mon, 9 Feb 2026 10:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
 <20260206131305.2675905-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260206131305.2675905-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6CB7210DD42
X-Rspamd-Action: no action

On 06.02.2026 14:13, Andrew Cooper wrote:
> ... prior to making changes.
> 
> mtrr/main.c absolutely does not need to include asm/uaccess.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


