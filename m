Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OEjJ9j2iWmuFAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:01:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1561D11167E
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225568.1532099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSlG-0003P8-Uz; Mon, 09 Feb 2026 15:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225568.1532099; Mon, 09 Feb 2026 15:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSlG-0003Mx-R9; Mon, 09 Feb 2026 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1225568;
 Mon, 09 Feb 2026 15:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSlF-0003Mr-HL
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:01:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c718577-05c8-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:01:12 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-480142406b3so35224855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:01:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2d43sm26781845f8f.8.2026.02.09.07.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 07:01:05 -0800 (PST)
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
X-Inumbo-ID: 2c718577-05c8-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770649272; x=1771254072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=05IflmT3MvSCLWPWes/pi3jZH36fKu39C42fJw6xJbc=;
        b=GrCFVxOaxEcsBx8pEwCg5zijab2cmTIOaNyyYqFLe31FtyFoEdbSUijvSSZ0cP4Kux
         R95zZQU2tUBQ0E6t9RJweDeIh+NyxC6k8b2M0kO+1ML4SxlIoxEI05Kqh+xyGEgqAkAM
         tKyTXbPEkXJxXjBkw49VV6/uSI1ViMEPQ7zIzbo9k0w8Xj/45VCeP5j1hnhaTfnBafyj
         Fixsd587b9F8BIRFWFK5aP55rs3xMmlx5izUcRl3CfRmo3G4ntPIcJ2qqzOrKO1kcfhl
         MKYEr1AKKlvV3s2tqTroNvAdS7eXpN8L6KY9gCmc+DH0Onmn4Kd63jIy3uKW1XHZl9UT
         DY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649272; x=1771254072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05IflmT3MvSCLWPWes/pi3jZH36fKu39C42fJw6xJbc=;
        b=eEVLAFqW9H/kdo8w3AcRYSfxxamiNoxSbqqbm22SU2iuroN5YdqW3RAiVijhitEKuP
         M5BaToye2o5m+a84lIreSpcKF2nbqwf/23XDFVz5HhaYdzjVPsVI5xhZ7y88wf2bjUFo
         Uo8BhT+u8RADCLoSztu3GiiB651PaPYnrYo+QjCZtrfDzVSVKVnW49s9Dt4eghnIAgBh
         CxSN0LDiCarkhmrG1FASxCkJH1juCogGl0WndKEcGN9GqnM/axSBTBYoF6fUNxZy8oiU
         NPRKqDGDWOchsVyw+yLMwPU3y2rk06RPUeF0V3d65qutTqw1meGvGCML3Sfq4Fj1Qjfq
         akCw==
X-Forwarded-Encrypted: i=1; AJvYcCWIZ3hWsIwT2sMPwRPnsU1gjMGRo6A96s9iTBq72JEbe90FbpFfp43Gg87+VYZc3ei5p3UFIKdAJqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6bEbr7ppa11l0lyG1kVP+n33pTk4R7B/BIzl64cvBPpowTBWT
	bbdHNQ7uULEWOzbVW2EsR04YieV+OMbRvXj2EADjSbk65EJ5FbrJM2/obUpS/V6AGg==
X-Gm-Gg: AZuq6aKMYrUJeL4OKt5CKCHFVKfgnLj0/WfPx/HW6doFSI7UlCMmlo1iYL9UrsIWSt8
	jBAxxiwfqCdEmAzIpyR5eZ9C5jE3+JZ3L3UfbAR56xfc4u+JgenbKtHfPpcJOfY7k2FYbmtjfl8
	WZW2ma2SBwa46sPDy5tZt/VjBURyN/RwvRVjpBitxgQCXJBGRE2nVD9paXdgULfSqxnRrBw4YGo
	arH753wsRNBZCf8ppSlJrW4Ch3JI+z8KZxUsRd+v2J16G8yPchSnP9EJMqAWaO68VEYpcqOmW/p
	1B1A31v52GF+uEgHgyXgQc4moCs0wThSreJaAsNVwOTWT4zCStUYQiRPYUiwpHdGR7+/hnIM+US
	a5DJEZK0VFL3fgz1yGJMG4MAWFtK39cYDNUJhK0CrGKjn9fpjXGh6DKjnSUy3WJJtaYXuyZ4J36
	dX0GBdJ6EtN0xDnEILPKAZmDOYQyAGpYie6k3SS+qBvy/3G7wo8Q2QyZTn2gCoyQdKmQsWAvj7A
	B7JmMBViVxQMg==
X-Received: by 2002:a05:600c:a08:b0:480:4d37:e742 with SMTP id 5b1f17b1804b1-483201dd276mr154677845e9.10.1770649266316;
        Mon, 09 Feb 2026 07:01:06 -0800 (PST)
Message-ID: <13880b1a-fc99-4bc3-8c52-9e4d59354caf@suse.com>
Date: Mon, 9 Feb 2026 16:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: roger.pau@citrix.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
 xen-devel@lists.xenproject.org
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
 <DGAIO51BV4RA.1Y3G3VGPB3M1M@amd.com>
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
In-Reply-To: <DGAIO51BV4RA.1Y3G3VGPB3M1M@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:stefano.stabellini@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1561D11167E
X-Rspamd-Action: no action

On 09.02.2026 15:55, Alejandro Vallejo wrote:
> On Fri Feb 6, 2026 at 10:05 PM CET, Stefano Stabellini wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
>> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
>> @@ -26,6 +26,13 @@
>>  #define nsvm_efer_svm_enabled(v) \
>>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> 
> This should be IS_ENABLED(CONFIG_NESTED_VIRT) && (!!((v)->arch.hvm.guest_efer & EFER_SVME))

And then, btw, the !! also dropped and the wrapping opening parenthesis moved.

Jan

