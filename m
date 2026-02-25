Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqnLDcXn2n3YwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:37:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E4199C03
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240868.1542117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGwv-0003Hl-CJ; Wed, 25 Feb 2026 15:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240868.1542117; Wed, 25 Feb 2026 15:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGwv-0003G0-96; Wed, 25 Feb 2026 15:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1240868;
 Wed, 25 Feb 2026 15:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvGwu-0003Fu-4G
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 15:37:16 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb11f1b-125f-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 16:37:14 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso15618865e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 07:37:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd732eb1sm77853495e9.12.2026.02.25.07.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:37:13 -0800 (PST)
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
X-Inumbo-ID: dbb11f1b-125f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772033834; x=1772638634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1qaDfXBPKiTNM26B9piz8B6ISKLFBL/GMkt/8xcvKXE=;
        b=GBeVDviaHShRyagDDrlsq0iKSHx+Jo9RRIZsPKe358spW5eATNH44TA0ehJM1fvbnF
         MBbQs5EnHshu0ybZRcah1xV2f4rIEu8lRafzjT1T9lzc/awkjhISb/YNDVwv8cN9xQXe
         +V+XWnvBd4x6rIEtaG4PI7vjMaDyD55uCiKWdpuH2c4EIHqCTPTqwsyWqhvvsPQ7JdoV
         ZtWcFodl61U+El3cDG1t2D+UqfEju/CC3U0XAEK4hnIL8tk67jfoWZJzgPVRg2c3koRY
         AGLw1DYJoroSiKoGNQGvlxH3+QrUw+DnyIwtmqnP2B55/cqhZpYQ+qqPGkA87dJpeAqE
         Vm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772033834; x=1772638634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qaDfXBPKiTNM26B9piz8B6ISKLFBL/GMkt/8xcvKXE=;
        b=p27G6FHKn9RUrlBqgXmu95nkubLIWj/KfKLv9fu97YYArai9Qxw+b7Qt9AlHAlbxj0
         ixGe4N2QsFL2lfSEaOYt/AjDNubi8gyAeGGxTGqKnOGordeCUJhYFJplV895LxvhXEOQ
         iyEI/nR4btdV91cCsXzgfdE473Z10jA+8Ms5eEzO1IkVBR0yklT34cAhY4LyRQujFKl2
         WmFDEa0WfxDwlfcnzTCUv1y52/C7q+X/1iBxN1A3/d3hv7IB98cvx6wuoM5Y+CoRWJ5W
         Qh61Vgo48XEZqadlV/jALtON8JTeoRl3eDAeX+Mu4Fn154LG1Jbydr2+fqbscI18UAzV
         kY7w==
X-Forwarded-Encrypted: i=1; AJvYcCWck1OmeDx7YUVArCpretd3FMTPnx/xTdgpUOWDn6ybKvk8OPmjBZKme6bTJzRQT7RzcBNVT8xDRhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxasF4S4y5sbMcBOaOgp/FF9c5lC/tEBPsxRc5GXOOaXfMDeZ7e
	0PX19ahjJnZGuk4XhfeVlLNodG119xIi1rgDjo/Oh8ltaBg2Hl25/LN5wtIkDRACag==
X-Gm-Gg: ATEYQzwWJ7Mw7J4Xe8/AbTE8pWYKdmxsLevNEmegEbpTiRWd5T4pN0EFTfAwbgU7dZz
	k8pxA1+1VCAxQgn9LGmG4NIJ1sdy74iB3UnfIxPJVraj2w3mO+nMSQF5JseHyMVu9Rm3IsMN/J9
	4qRYqTJ36jkZPPIM7u8ga3HCxhtFToUVM1nI31koH9qTdSXc6W5WlnhgRyYVbx1GBSgKg5aUKeC
	WWZlLb9vxTTsQ4+kpl5I91I6ZSDbSYroKp3dA5oZ23oBf19t+g7nY70FpjIAYZ+NT9nAjvINor+
	QmhmDlnVZVUoj1AyGI94IQuE5PYr6QMhaoTIpOyURomoS7skDDpgYwkDto5hO/EByEg5aX/wkLY
	ZXXzkRJhkyRSzNb7hXQ8aXeCL6uSG4SRFCc6BF9KdQeMIhXfIJ77J3YqyGEh/drZ6G3kh9Gez3F
	g9LDzRpr2IhnSmsYg/xQMSrX+pvayZWuPfVctO92yFYWGum9CSeTgz5TfnJG36obJpbk++xfo6e
	HZAzfC6ybu4A6g=
X-Received: by 2002:a05:600c:3e1b:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483c219b659mr14776875e9.19.1772033833630;
        Wed, 25 Feb 2026 07:37:13 -0800 (PST)
Message-ID: <2aef1aab-f1f4-4063-8c61-d26ae335d06f@suse.com>
Date: Wed, 25 Feb 2026 16:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: zero guest-visible BAR addresses to ensure domU
 asssigns its own
To: Ariadne Conill <ariadne@ariadne.space>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org
References: <20260224231216.6203-1-ariadne@ariadne.space>
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
In-Reply-To: <20260224231216.6203-1-ariadne@ariadne.space>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 538E4199C03
X-Rspamd-Action: no action

On 25.02.2026 00:12, Ariadne Conill wrote:
> From: Steven Noonan <steven@edera.dev>
> 
> If we just use the host's BAR addresses, the domU might not attempt to
> reconfigure the BAR ranges and may never try to map them with the IOMMU.
> Zeroing them ensures the guest kernel knows the BARs are not configured
> and needs to make its own choices about where to map the BARs.

Yet for this, don't we first need to expose a full topology to the guest,
i.e. at least a host bridge, and maybe further bridges?

Jan

