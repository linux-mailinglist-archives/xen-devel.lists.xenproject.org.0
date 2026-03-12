Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HxoBuWCsmm6NAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:09:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911426F64C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251851.1548696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0c2J-0007C3-C6; Thu, 12 Mar 2026 09:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251851.1548696; Thu, 12 Mar 2026 09:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0c2J-00078z-9D; Thu, 12 Mar 2026 09:08:55 +0000
Received: by outflank-mailman (input) for mailman id 1251851;
 Thu, 12 Mar 2026 09:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0c2I-00078t-2a
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:08:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 172c1f89-1df3-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:08:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso6552425e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 02:08:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0b906esm56305995e9.4.2026.03.12.02.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 02:08:52 -0700 (PDT)
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
X-Inumbo-ID: 172c1f89-1df3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773306532; x=1773911332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YzdoxAlYV8Tm4mWJQuIbAT6rS2yPVOYFZZrpTVL28WM=;
        b=QGCKGPYATs2XVEIp+6npNzKKPGN/uSt4diQvTa/0gQZeeqnyFrnF40TyFsISn+W1bQ
         ZADkdJpeuTeTju56/6cwQdw7dTPmuyTLRnPy8+MPh6UKaiqCIz7my3QqPGzwvepqxn4E
         4jnl67eO0Y79+VOXE269AewO0XNc9oMCXiB7Ez1ukI9TeR0T0uql86R0zy30SfoAFDP+
         FQWMzLV7uwQ3dI24W6C7Aw6y8W7ktKPQn6ntd2Hyp5Ion5J/+fTdtnIJIgEEGbaMAfwj
         j4Y8/Dy4IOliTUuVGcR3Xvbqv54FwgVCNnLFgzMY5AUut4kHypqX2os8CDK1EsokrucY
         HF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773306532; x=1773911332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzdoxAlYV8Tm4mWJQuIbAT6rS2yPVOYFZZrpTVL28WM=;
        b=tFJtPYiIJRA+Ytdh32BBK5oXd7iEtxaq6MN4O97PSAAe10PGH27QayGqwwtbQDPT25
         RchcqFqmDeMxWy6xOjbK5RhYf3Gnwoee4pMOvAe3gZ5Q48YZSkDX9HK0EeeAer/Jyw7p
         5R17/bkiQxoELZewnPyaIuiVXVjcLQqdHookINvw8VUjIDy9IJpl0yLVYF3W2C8yGce4
         4odmpM629pTmlg+mJCfCdRsKgX3E1ww2SJ8JMw2eZBbrcExEGROKM/j/RZX/LtVS9O3S
         95NSrIyfn2qx/8aOcdvvykk8Pptde8C6HtVXmUXKEU+hyvEJZEaOW5MM7As2Ko05FTxh
         I0vw==
X-Forwarded-Encrypted: i=1; AJvYcCUZEIzD6de6z7QG7alAJosJ/Ywui2CUGfZ4HRKdUS49x1kcm68EWAn2iiNdyEDmc+zwCX6w5FrIUFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFxMEecHTEFJVs8leIlBA3d72aTS+QQhbyJXH5lqOUiw8ei+d3
	qyHIOZWXcm77qpBkwqagBxPyzgQh3HJUro5qNFT/R00pQxYlx6RL7FUO5wd4/yaa0+mSVp4JyGG
	Tabg=
X-Gm-Gg: ATEYQzz/4jfces7j6cLjMqOvoj5vph5UAioeGSIisqzCvi7BGRQEYiilDeTddh56Jym
	LwrIMlTRfSSxJn7fMRrNVpzv0NT3Q7zZ/a5qrCfHEEcFjhE8x30HkAXk0hZj+RYbTsozJ9TFUbg
	d0PheMZmJoTcaxp/1ENKakzt3m5v3Haa1xTWcwJFJl5DGQDVuF3QR7uhhl/40bDqgMFPlJRmIuz
	yE0S0BDvPDge7YISefss2OussGxsseymvc2bVdWvPTw1+UyiYXvfihgZJL95zB3a69ElDy+cqsp
	7Ihs8AX81YePsD9BN0YFOvhjf9w5uGfZXhHOMB86iOADU+b61vGphJe83+JCBOl8HkRXNwQY4xU
	IjJKKF3dTvPTP0ZD3jI/HHJa+mbD+YGbwR7FST5boz/UmtMv9ai88XkWX40aKvSiz/g3vWQuv96
	EiJ/Ay3eGGoYz2Aa2CySGu+HF6yQXKJlzhLK3HUj195YiPAT+34v2JvkFOFwA4EeOmDJLNs4aH8
	/VeMsXWn/n84bY=
X-Received: by 2002:a05:600c:3f0c:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-4854ad770aemr95732335e9.0.1773306532342;
        Thu, 12 Mar 2026 02:08:52 -0700 (PDT)
Message-ID: <3caf8256-971f-42a5-95a8-30c02c64775c@suse.com>
Date: Thu, 12 Mar 2026 10:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/pdx: allow more tests on 32bit build
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260312084638.53360-1-roger.pau@citrix.com>
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
In-Reply-To: <20260312084638.53360-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 9911426F64C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 09:46, Roger Pau Monne wrote:
> The limitation of which tests can be build on 32bit is too strict.  Move
> some tests out of the 64bit explicit region, as they can also be built on
> 32bits.
> 
> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


