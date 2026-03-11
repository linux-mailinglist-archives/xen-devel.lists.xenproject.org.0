Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNJTEdqBsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4B265CBA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251236.1548461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KvO-0006ZL-0I; Wed, 11 Mar 2026 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251236.1548461; Wed, 11 Mar 2026 14:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KvN-0006Wc-Tr; Wed, 11 Mar 2026 14:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1251236;
 Wed, 11 Mar 2026 14:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0KvM-0006WG-Ni
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:52:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01e6085-1d59-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 15:52:34 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so55466315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 07:52:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f821d095sm7684845f8f.32.2026.03.11.07.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:52:33 -0700 (PDT)
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
X-Inumbo-ID: f01e6085-1d59-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773240754; x=1773845554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z3ddnBTQh3monl3uUxBvm4jJ2tkt4UDLSJQeB/4uVs=;
        b=LOceYgvFQJLNXFSkU4nYVNZlQ+BYIjChb4MjtkT3ozeEb+RLY62FtSfthFB0Kf4d9t
         qjAIgOOsmAmD5oVW1sWthLzgcXQRVFQioRwKGZHB2JFgwL4OD5j5dv7az1lS9MwXXhV+
         Fd8lo+I2y7PRxz5lLVqikGDB4EixX2cD0U0dcfZuq66zSBFfDpG6vTcQI9AIdvm15Xiz
         JUctNbuCjQuTfo4nJEOmQFKNq2oyDJ9hme+4Da6MhXUvD2t0jjBqqBicP9H+LRIhEmVx
         +HQJZwAbsLqCwE5mhrdxY6NTyzhba1AO6HdpXjeYxAYM+aF1/agln6K5u3r5ekYycORw
         mkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240754; x=1773845554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z3ddnBTQh3monl3uUxBvm4jJ2tkt4UDLSJQeB/4uVs=;
        b=I/m9Fj8oqCqGyVRGd/6BEal6/ttECXZDp/NN2NY0owLaZvktCQsCCU3yb4mwY85ThW
         WAqBMVHGUdUSFmvG8UwlFIE15wEDYAzvzQmT8I1MoZacyjXH+Gw4Z0GNOGdYht9i7fOU
         6c96uasDSGxEZM0knBbQ39Qdy7trzVnMZ5zn7bt5BFHI0R4YwkiYyS3MmY0tG0v19Dr/
         +sJurKylEPzyyvcJjpcsQ1OnCu0LDZQUqzO68sEDKaTMUm6cKuZJmX0j88QriCOpt8N1
         z0JuFXGJuw/zrNGyQB1T2JBDuJQ8JpsyN5QiDKFYvjwBwjuReGNptH+qvMbMrJreAnbX
         fI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn9bBk4lloLr0CkfrNRC/+oa/h0QRUpVHLR0gUZIRSS1guh+OTmwMF2SvgH6c39JoJxnsDNI4ZvlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+y6vMcXo0CXa0Lpt7V5XAu294PWZJrLuLn+kBj+HwfO4d80aK
	IoUoW7T4kdjCjsHkT0+Bkn51f80M6GQVq7OdLp8Owg6N2kFSpDo0iJbWWUoID8AzeQ==
X-Gm-Gg: ATEYQzwFFd0caRmWWAp+yLK3JxrLxlCyMQaRINpWr+A0lwxbU0zr0rTmktFlctIn88w
	hs1zw+3YBFKOkR9lsywul77u5gbVKgzVCOUEHqbDCf5AOb0QprRiONbQMo/uThICjkOkzE8KUoZ
	zvJH1OGxaMLnbiWmCVj6IfDRT/+R/EhKEJElpDHfGJ+49IH+oUoB7ya8Tg//uuLzWV2RTN8UVGx
	EiVU9pvzJ3Rvjto5ZCNCvgvKhV0VegwsGAKINRmNUYeotDr5QXyz4/ZWMRXc7nJkoRAl9v+namf
	Qy4u2MbghdFzZ4e1WKExpTHZOj4gADBS0hoR/QiUnt/qCobmOSwKYwTUmb0wsh/A/Hh56DcqAfF
	TaqYgh6ATIxLlWrVAcHx8962WDFi1wrafr5ou/NZzfPP/d+QkmuF14zaAgWAsUo7VEK6GW7u2Qo
	4ECJgInlgCtthQX2Ls1qpnemDelLwL/Y88tcG+NSJBQGYp82fDYxZ5fe4zoXP1nvko+Q9bMCYau
	s3XoKKXfnuRbPI=
X-Received: by 2002:a05:600c:c163:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-4854b145656mr44551755e9.25.1773240753795;
        Wed, 11 Mar 2026 07:52:33 -0700 (PDT)
Message-ID: <ffeb30e4-ccb0-43ff-905a-e9273dff79b7@suse.com>
Date: Wed, 11 Mar 2026 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86: Reject CPU policies with vendors other than
 the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260311142711.16754-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EBD4B265CBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11.03.2026 15:27, Alejandro Vallejo wrote:
> While in principle it's possible to have a vendor virtualising another,
> this is fairly tricky in practice and comes with the world's supply of
> security issues.
> 
> Reject any CPU policy with vendors not matching the host's.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


