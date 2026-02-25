Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCC+Kf7fnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:41:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCED196BBC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240598.1541917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDGk-0001dT-NU; Wed, 25 Feb 2026 11:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240598.1541917; Wed, 25 Feb 2026 11:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDGk-0001c0-K7; Wed, 25 Feb 2026 11:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1240598;
 Wed, 25 Feb 2026 11:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDGj-0001bu-Dt
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:41:29 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb2d419e-123e-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 12:41:26 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4833115090dso64171775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:41:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7030b9sm55059005e9.4.2026.02.25.03.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:41:26 -0800 (PST)
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
X-Inumbo-ID: eb2d419e-123e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019686; x=1772624486; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XqCsgi2yLqzLjArOpKQCn/A2rA2gjVAZ03jZZxLoBaU=;
        b=duGp5qDpFulqgLH2RJtcOVodXo/fM1nXq5U0YQ1AXEVRUmaWZcOihYZ+o0SkTBAzID
         Ka+5Eb/+TljDTuaS0cPaSeTmMcDCYHePTUDqS+tf7qGq5ccwk70hWy6Xudp5t9GGq6h9
         MSb6houRhGOMnX6BcZSOJx0El37SzWJey6LJ1qH8ATtslUncgRutpiXLGuJXCmdA+Dsg
         /33MMvbNI3HBE5Fonh4yRGgaTjyOyIUap8vXAwHWqReB5deVGu5D5lLVd7Zqca3tHJjN
         z7oOsrf7cntBN/hRtnVXQQ7lF/tKh7j7xMbCf6cJMtsUcC+zDxvGgI5F63W0kPi3yXuz
         qTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019686; x=1772624486;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqCsgi2yLqzLjArOpKQCn/A2rA2gjVAZ03jZZxLoBaU=;
        b=JOM4k/14eiUhaFuGcj9l2dVXt+wUwYeQgbV7M3pGpN/3uV9ZWUy8cd4VQAXGOwsSpO
         XDnI2vYAP4oitw5kIzZ2DbYjt67aQM7fBgZVHZLMGWzhGal80rVYYQI/3hp6EIn5abMl
         Ne2Qwbl3edMbH/AYn5n4itMDDUCuLxc7mMiDzDLwrME4fR87ylgHYxU70P3aOvGEGGoO
         1exxiS4RBGC2rAIdMUJ/JlK3bY9+2FWHeM7T712L+DlDyF3bI3SBCHYyfnwzsoBXvrI1
         3JVXOIagp6nclkyE6uSW1Ca8fd/3ojh1Oy4uqZt0DtMaCqmk96AC+FyauVmapWnaafy4
         7D1g==
X-Gm-Message-State: AOJu0YzxjTuv3Q0aQ/TkUIXgqi/l8rSaPvnqBlgkUyp9iQftIkogq2JV
	4DOiMzbGTIcfi0VuwZvQSL5toVS0DcxsI3bULsBb5ckSIpTOnQovKU9zM8IwjyUbA1bLK9wEO0B
	yJNk=
X-Gm-Gg: ATEYQzyLg0Y7UW+kOLk5ptO9O/uvs3arf+HeGBhYFlOtmPeNZaKUoN1rw0kzF1acnhr
	JnmnMNbY5ISZJyetN+NbAcbGkuEsBhFHs9OGaBg9WrVA1qqyBeVH/yZggMelqau7kSX1QSGiWlM
	K4i0ng3Z5MvtvVdrS7KEsKhBFnpDEX5RfGxcq4SBpv5I8iZyMAR012NWzrEAgT+HzdObm+mv+Pz
	yiJxwbX1q+YTFN/xNxYDKUg+eTzrGwHsW7e/2KEmxz2g3qo6U6miqraWaYOh85ZnpoclemA95ze
	x0WiK017fqibyLuSMy4y7fdWNPCjOoDrfRWcKwq8dDucK6XASeaXgpKtCmByw3dBc/fLvT8+aIL
	maUhcKUIJaLlHiOfhQ9auwntIt9yKuhWSJZSRVtk0mOwXG3WjtLR6JYTq4G/jCRLwp16gxNlzdx
	wB0VBEdcaEua/Tigf1w07DI7pQcNh55s8bbdY6xNf5PpZIry7x17TevE/qXIyevGpCSH3PUENy+
	Ex3dRMR1Q4z2bQ=
X-Received: by 2002:a05:600c:8a0a:20b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-483aaa168b0mr188345295e9.20.1772019686324;
        Wed, 25 Feb 2026 03:41:26 -0800 (PST)
Message-ID: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
Date: Wed, 25 Feb 2026 12:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/5] vPCI: extended capability handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Language: en-US
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5DCED196BBC
X-Rspamd-Action: no action

This is a follow-on to 'vPCI: avoid bogus "overlap in extended cap list"
warnings', addressing further issues noted there.

v5: One new patch and some other re-work. See individual patches.

1: introduce private header
2: move vpci_init_capabilities() to a separate file
3: move capability-list init
4: ReBAR: improve cleanup
5: re-init extended-capabilities when MMCFG availability changed

Jan

