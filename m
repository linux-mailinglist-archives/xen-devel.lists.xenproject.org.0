Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJNKA9fvsmnAQwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:54:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33ED276054
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252735.1549301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jI7-0007YS-RS; Thu, 12 Mar 2026 16:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252735.1549301; Thu, 12 Mar 2026 16:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jI7-0007Wj-OG; Thu, 12 Mar 2026 16:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1252735;
 Thu, 12 Mar 2026 16:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jI6-0007Wd-1E
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:53:42 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0560d3e6-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:53:40 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso976835f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:53:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe23afc5sm10757053f8f.39.2026.03.12.09.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:53:35 -0700 (PDT)
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
X-Inumbo-ID: 0560d3e6-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334420; x=1773939220; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BpLIOLtb7nPeXHrmlJGGriAAXn/4R/2jNjQ2xEcAaw=;
        b=D4vqlhmAPk4WWfXgzHFN4CxLRqNxjJRe76Zr7mQzrckxTL81sw62NOv0zy4TNTo6Zj
         h1opYfyDr+vzPdf58ThtrlditvDSpLiLY9XTDZ6V8oZBkYYVyJlnBv3wpW8mDMLLNjPG
         nCPoi5CrBOAMWwnUBdw2ZuGs7YkiWiAUrIb6f+0BI9a9Em2rXWtOaMfOjioZddul4luN
         pXE9/PyP0j9XdCokn57l+MiLpcJu8g69OnG9nC6sk8LKExqmbsN7F6wUgBSioxvqTNjB
         vkQWB2Lkg/fbBd1w9pIOyzUAEQZkEvdl2vNf5kUYJVXW1mi9dSxkqalfrVR0Y4WSmqU5
         LpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334420; x=1773939220;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BpLIOLtb7nPeXHrmlJGGriAAXn/4R/2jNjQ2xEcAaw=;
        b=TpnBKu5Om4olfmNXoridjVRMmOA50FTzTgG56fc3+44O5pK/WcVlORkZy3BMAOtSnR
         NaSTtw69W0wSz+23r7hUuGLmUHf56Vg3sWWQKXrpshJjl4i/OzUPS23+eaj+y8ThHOrR
         7n5j86bxtSqNb6oujKkDcgV5NeZgOPcJSPa+8HzecXA+0xZasiA2UJWYVUIzkLsaG7IX
         w5amY8McL+2J70hYo3thlCCbZ+9EJbOSPqDPAd2fhXiTCL/C4Wa38wGivd8bzvm/KBdp
         JTHITEuRrgRgsRGuXOoga/9XnC47OIyccfyxEHvCj9NExrBu6XNcHVr4pNGc+QeR3NPa
         EKaQ==
X-Gm-Message-State: AOJu0YzNR7/eS79vzH0UhyoKkJVIbWG3k9d0tIWofZQns/KaeASpfhdM
	XQTOWlDwJ7xu7jv3S7xNVI1L+dxp2FqKll9IFYLfg7eUSFZitJ9LUl0atj/FK2XMeY8eaweRNOr
	hzp0=
X-Gm-Gg: ATEYQzz6YaIM0QRIr8dM60ncyNnxODoAiCJu+uReUiNSGT9ZkF8vEp7IwdIto51Uht3
	0F08G+HVhgWOOvO6FFU9tL2XGWBQndeWCA0a/W6Pyn3OHsV7qY4PzTX7TqpWj3Ly4ayjLR8O7Ls
	O/z3aB4bQZrxN8dBY2ACDB0izpA9z7RgAbWqON8RHorMxdbBQXzaN0G2/rtHZ3PcFR0R2Gx1wlM
	TYFUaE15VzIqa1v+XC7cRiz0l8FeDb22pp/OIrgDFCKCMbDiAhXL+RF1QgnIS28kv5V7pZ6NzIl
	bi4GdJ6+aqt+30iw3S4aOZn2qXbjgWKy6Nl2bxXG0GOpQYpo1hh5+6g/XioQysvyVeAjG2V5cpF
	ostcCWv0d2mO0TeKExaLerkak1SDbjTSXxcc2hbP6HZPUjkVkJegqMiCUU0xBqbNuQWOMNoaqGX
	sFDw8kNF8qjOdS2m16WRiyJOWp4Dj98xQjdV2JO1iMKDQ4faOpLsdn6zIVJfObp+MVKDnLs6z/s
	uoJL5xoCH69VJQ=
X-Received: by 2002:a05:6000:26d3:b0:439:c550:d933 with SMTP id ffacd0b85a97d-43a04dc3108mr697922f8f.41.1773334419609;
        Thu, 12 Mar 2026 09:53:39 -0700 (PDT)
Message-ID: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Date: Thu, 12 Mar 2026 17:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] x86/mwait-idle: sync up with Linux 7.0-rc
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A33ED276054
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Includes a few custom changes, too.

1: arrange for BSP MSR adjustments during S3 resume
2: clean up BYT/CHT auto demotion disable
3: latch struct idle_cpu contents
4: move pre-initialized struct idle_cpu instances
5: Remove unused driver version constant
6: Remove the 'preferred_cstates' parameter
7: drop const from struct cpuidle_state arrays
8: Add cmdline option to adjust C-states table
9: Add C-states validation

Jan

