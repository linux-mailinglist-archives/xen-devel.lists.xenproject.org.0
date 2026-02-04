Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QANLF6r1gmn6fgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:30:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4BE2B52
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220078.1528800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXLN-0001ry-7K; Wed, 04 Feb 2026 07:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220078.1528800; Wed, 04 Feb 2026 07:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXLN-0001oy-4B; Wed, 04 Feb 2026 07:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1220078;
 Wed, 04 Feb 2026 07:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXLL-0001os-6s
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:30:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614ad363-019b-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 08:30:29 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48069a48629so66711705e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 23:30:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310919211sm34663975e9.11.2026.02.03.23.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 23:30:27 -0800 (PST)
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
X-Inumbo-ID: 614ad363-019b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770190228; x=1770795028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R+SI8jM9ndPj689djaL180Fqt2pJJuviBfyWzysj/Sk=;
        b=YURA88qpSIV4mFng1sMWcR/WfYKbqs5p0tzhMSpg9wvaym5dsmtLyTB4m7SkS8Ws1q
         ZrCNpkpxTk6SHX+0jfK2+LMA6uyJjfwXo2f493fs0yz9bMd7EI84fjSTINRFLnoM1Kcl
         vf925U19sbpERvw5sA8Vy+JCcdCEaJiXftsd/DECHuBN5kki3JtY7kCNr9QMWPethrep
         GR0SaSH9cQ5tzzbqpZ9G8/kK/dq1fFbp2NFL2TZhkZqTRJPFbRGizWA7mS0A6he29F7l
         wPBUoluSeyCKaMeO/oFB5EMeoy5k88g1raizTi5YiebSnV5TjXEd/4Jyy+yIQFc7aLfJ
         wXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770190228; x=1770795028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+SI8jM9ndPj689djaL180Fqt2pJJuviBfyWzysj/Sk=;
        b=O7Edmtk8D37X/ISKnfsYlcOAsxQ8cW3gOR/ALNtgYoT65H0MaKwnzO07JQH1HAC0zu
         Flroj+iZCg62a5Cj+X4g9XCgcjvNw/a1HxsWjX7Y9SuA4ZkjPVYxeSG8Jxsnz2OBPwQ/
         xm96aOosZKvGBm2zdAW6t2PFlf7kDfwejZMAzkWzWJach9A/krQ/7hXg/VeO7F5Bd8Se
         NsUZoSjdCvF0plqMqNdvxxupoznKi1hrqyDC/RGpIF1wU6JjE5b9tlsWzlHP4KXbyl82
         dy6SWhKmJIirxLn53J3PM54wxAj7LtdnEicGIWRH0mUmWku5TBt5ZgGj3oZ1mE9lXbJa
         Q6eg==
X-Forwarded-Encrypted: i=1; AJvYcCWHolvj4TBcYce6UE1M7AdoECkftuhgSgzz6WZgZIbvVChOqr64HrSDRbTJ5zzZuNzQtuVXa2YR+d8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF7n3uaIMfJjV/qBOwAk5029JS93TfTv7P8XAzH1mDbWMU1sVq
	LSV/ms7KvRY17IGrxLtA+hH8Zk/nJX5As/+3DYd1LwN8BbdyKyMqhbfe8Ar8RkEAfg==
X-Gm-Gg: AZuq6aJ6KcQEsPvkRjwRexm1LZ0T4ye6/UUz2LaLGdYcRqka6OwJSDk8WIojbsHM3hz
	Je87CKl7RY3xeQ9WVVxMWnvTKfV3+UJD/iMgHbfXluoaZlSxFT05Xq0kLofW6R8yXEcm1TTCAL6
	0ESGhQ5SyBX86gm+YfZwDAEYL0WTQFFsOHLlrwDbVsRDCz41JTQ1rU90zQ9A+lqf4zUupwsbfcR
	w66cIsDFDzokMSmw3Nj7ntE/ErN1W4wVxMnA04C/sf7rN/Kcmpgu57tCxck29uthM3rYemmjnQj
	dMdTXESzo0iUPJX7dcXY7C7KEVxZZ8PlSJ48zsxabJeIrO7fV1FpMOUMAQH5fb0r8ryY/cWHwl8
	OtIMhD4hUW1apXKZsTO6vmJ9X4IpWpstcAqJaS1BNGUqbZ8h80CcNyjrbAWmp7iX8kLB6NOZMen
	OriwQZBmseURznHcoId32aq7qA281nxr+k7lx3Bdm6ruDs/piodR9bOgHgGuRvSFl3Za6p82IUk
	fI=
X-Received: by 2002:a05:600c:8b38:b0:47e:d943:ec08 with SMTP id 5b1f17b1804b1-4830e98aa59mr22619115e9.28.1770190228511;
        Tue, 03 Feb 2026 23:30:28 -0800 (PST)
Message-ID: <a6f0a079-dcb0-4fae-b8c1-e33c0df8c0c5@suse.com>
Date: Wed, 4 Feb 2026 08:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/console: use ACCESS_ONCE for console_rx
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
 <20260203230757.3224547-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260203230757.3224547-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0FD4BE2B52
X-Rspamd-Action: no action

On 04.02.2026 00:07, Stefano Stabellini wrote:
> There can be concurrent reads and writes to the console_rx variable so
> it is prudent to use ACCESS_ONCE.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


