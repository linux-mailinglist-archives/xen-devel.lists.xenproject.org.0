Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPdABuwld2kUcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:29:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7E8574D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:29:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213358.1523836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkHxg-0007KU-0O; Mon, 26 Jan 2026 08:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213358.1523836; Mon, 26 Jan 2026 08:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkHxf-0007IA-TQ; Mon, 26 Jan 2026 08:28:39 +0000
Received: by outflank-mailman (input) for mailman id 1213358;
 Mon, 26 Jan 2026 08:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkHxe-0007I2-K8
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 08:28:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe9e0721-fa90-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 09:28:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so34112925e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 00:28:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d627871sm97298755e9.6.2026.01.26.00.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:28:29 -0800 (PST)
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
X-Inumbo-ID: fe9e0721-fa90-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769416110; x=1770020910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V15wYNdZD5B29GtwMU1U9MjH4gIvLmDGg6uEHIdYqRU=;
        b=Sf6k6kXhCOskssoR1yJEzWESi0273+mXfOSoVMFi99EWSxsinaSo398DRcf4F4ruvL
         XLaduhsbWJLQovWuxTv8F1N+ZL1JMXqlLukGyNJrAn1VVrCIH3H05qzQcU8oBcFuz982
         Ua1dUtE1a5xLP42jvqJeMWAd31RqjBw1Pdja8ePehtwKoy5G5kNATLaHNp38jetA8Hw1
         75c/NO9kA1/IWCnm5kTtJJBNIXj6aSAC9vduPQJMVT/xO+WnCx1kXYZbZha0cJBcCxu+
         3UvlWw+YbA896Pst7QbTNcMyl6M3R3nf3n9ykITlEOYNnSnMnvvvIhjL0BclEdllJ66/
         aAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416110; x=1770020910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V15wYNdZD5B29GtwMU1U9MjH4gIvLmDGg6uEHIdYqRU=;
        b=ga8XepU9k6YA25xU9Qz2fMua2ru0wFt2U7PIUbVBXFfx1jw1npmSunmrN1mxOMJvpS
         wByqE9ww5H00zHf27uHczw2V83G0EcYSw6Xy0jRgz1nUXeWcr79yBfJo90GKXGRbDS9P
         Qi5paEBGMMBu41M1CgpVfItVTsqEgmhnSG+g7vnaLoWd4uabNmYA+EmFYg2iVliYGd0u
         1KUku8CA14UzoYRw4+QxV2CGprpglCcNcqDJpOwwW9kY0oraZAS3WYVKHi3W/9YziH5L
         eML8UFRChryM4zJcE0br8PZ1c1D1aaE6Ibf8YzW/E7PZR3roo7fqgCmpUs1NLQJ6FCLj
         eUZw==
X-Forwarded-Encrypted: i=1; AJvYcCX9gE8CynKBmjeHNXyjAdFI6pDPSDI52me1zaPGbcdGRiRrMG3AXH75zH+1OCA5NMhGyLUZNSK8Uu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAeneby21Dhs9xshQZE5PYCNWgiTz9uV4t0D8kz5iYbGYrjKkq
	xWTbF9AqUaiw5dlXG19icY3NyiyoEyOYsO0b2siQHAYD+UXIPWmejkdMmb4APnB9WQ==
X-Gm-Gg: AZuq6aIxJQ/6o5x7LS6ILphNACo2k20knPQWUPGhCJn7dwNXk4LmmZyOuV/VahWtaSf
	2xq5rop0NBO8bznIAGEIk6jMKswCtcGQ3LeRGNHtlxgRVcUKrt/oIEpsJjQ8z0JJ2XJulPXwkrc
	ImMUXN2EBk6cBWg3KHeK14fumUntx9A+Ef/tVSY6N54ioBjptw0aPRr/usdfGV7WDvyeSm86aNp
	fWEXXlpE6y2WmTnxTmWpDydolAMbVOcwOuzk4inUScdCrh1yb/oJ/oEsBWsFDyP1mvpDXW/o2di
	uS/WcDrzp40CUEfK62FBjF3j+bIA4hfDBcynaHmmYXCZShqJ3KnQD1QaoJgtjrqsDCK/ns7ECKl
	L/V64//oqwCS7ByRc+VDW52Pye55nGJa+gn/HaiAWXq87PoIEVauAWmdTCxzTx1KOIrtsm8nlr5
	auyrm8pL+ql+AZ2o0SCyGYGECw3fc8WeFycCpeHntEG9VmGu52JPVsmbnZHcbTzzBAGiizj0btV
	Sg=
X-Received: by 2002:a05:600c:6291:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-48060a1398cmr29229695e9.34.1769416109764;
        Mon, 26 Jan 2026 00:28:29 -0800 (PST)
Message-ID: <ab909a2d-1e7b-4ed5-a6ee-8d4ad3001fb2@suse.com>
Date: Mon, 26 Jan 2026 09:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] scripts/config: add -y|-n flags
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260116043458.730728-1-dmukhin@ford.com>
 <20260116043458.730728-4-dmukhin@ford.com>
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
In-Reply-To: <20260116043458.730728-4-dmukhin@ford.com>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B0C7E8574D
X-Rspamd-Action: no action

On 16.01.2026 05:34, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add alias -y ("yes") to --enable and -n ("no") to --disable a Kconfig
> option for better scripting experience.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Seeing this has been ack-ed as-is, I'd like to put on record that I don't
think we should be adding extensions like this. If such is wanted and
deemed generally useful, it can surely go to the Linux original first.

Jan

