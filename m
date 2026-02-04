Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3IGrEa33gmmTfwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:39:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA5E2C12
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220103.1528819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXTj-0003M6-7N; Wed, 04 Feb 2026 07:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220103.1528819; Wed, 04 Feb 2026 07:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXTj-0003Kf-4N; Wed, 04 Feb 2026 07:39:11 +0000
Received: by outflank-mailman (input) for mailman id 1220103;
 Wed, 04 Feb 2026 07:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXTh-0003KZ-5h
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:39:09 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95b5af33-019c-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 08:39:06 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso3087275e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 23:39:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805fbc5sm3922049f8f.34.2026.02.03.23.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 23:39:05 -0800 (PST)
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
X-Inumbo-ID: 95b5af33-019c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770190746; x=1770795546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u7n09poC9sEkHAzeFVq6gh+t84b2YKvHiFYaKG6k+ng=;
        b=VfpkgnqeGLen2mqlJhXwZTyJEaQRjqfjUIYsEspyfeLXW8q5aTnyNLs6ZKCzTHjywo
         BDtuTwZC4eqFDGecPCj+eVCRe7tKkdRcQOcCNW1ziiknz0vRUwdEiRBGBIzOfNpy3wHU
         2plp/buhpthFMN/gv0vzzQ81eJmfvNnSpDqfH7WLyeTsMfHKn9WNM08z5aAs/Y7glps4
         a8ukD04E84BCVRo9IPoHVnCmZqQsROQGw0Jo8SQfMgyaFAYd5NzJvTQX5uAFuWlGo79w
         aljgQHPezSD7+Vo7qKybCONPW9vkIVkjTXvyh426KsS2zbBEoxxQxK+Vwlgh0Z+JhetK
         hH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770190746; x=1770795546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7n09poC9sEkHAzeFVq6gh+t84b2YKvHiFYaKG6k+ng=;
        b=jJ8exS6dx6LPA7ISOHDTHFkdEn9lKW0DsoN+Z6Q39ig5iUIKjAbBlzUw2bg1vW/Ab4
         OQGXlavSAnv3e+TqtS5OpoNMB8E5K6edY5zFb0uRQEjsKWw03ejPlFCWaB5uKSflJ/92
         23/S7Qz/FsZkOahz/RyewKAoWMZqndj+VwLmvUh6MCjbk3//X/naHHKpxcm0j4kk0UUA
         SDVbCei97qLHd5q5I4A+EFK+m/fC0tMquZvh0YfjMoYtf9sG6B6jR7Vwb/fgJz6Mw/P6
         bmdEOHi/1yCui/5bBKe6WZbyiJjUqPp2KqZlJPfmrtklWCAHhCJS4ihAz1EH+/cvRAKl
         HguA==
X-Forwarded-Encrypted: i=1; AJvYcCUOV2fgrUAl/TekdFSfAASwcS4Egr57G1/Zd4EUtEUX4xTWCxm4zvfvdb3vMdqrfL/e7yYL4stOZxM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZFNZmdWEI6Xx/E2hmGcY9GFdm68ggv6MM67UxANhWSfpf2s3X
	yel776uPIwCGgMcS0dE3Qx8Fv052wRZXUSx9GNvVs0L43NxptN6bAwOWhQcH/jLbCAszgAVjieC
	4QtA=
X-Gm-Gg: AZuq6aJxxY5/dB0eqnaTbizfkgG6oUJuDIxlsVhP8j9GqaIVwHBnGs9IKagvo7rwMud
	MgDwC0C7WEcapxKXRvrfTfkQJcCU38N/S47ZVFGyuOeUojTm6e1N29qZdbCTfkf5jhOZYT7VOLd
	4oQxhOnygrDzr/QR0dYcdknG3ATj3Xsy2s+jebVPALre97yfVY0DogT4bvWtCAiVb3OvgSSw17v
	wE1+P6g/P/eQWTCYb7jz+WF8Roju0S/y+FdCcw9DzH40GjRa9I+oMzmf6D5R5bdfFTkOqXztC9/
	wUr16mRZdmLV+XIISN38YKwOGUwDd6S2HViWINO0+GuPuqOcx3KOwgBxGJyAk5NQWuFMiyQVQwb
	27Yd5WPOHF70zYERpaY0OdvutekOlyzFOTFzcbf1Qe+yhVsGvgI2GrXLehVG3mboQYKQxv48zoJ
	mPYInLkK7rFpM5gM3Jv5PiJJZMT2iNbLM2ePtb15gD/3eGr+5SrKvM8ajuYLdZ4SSTOHJFBlLuj
	Og6Q7shHBqfnA==
X-Received: by 2002:a05:600c:3b83:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-4830e97356emr31635535e9.27.1770190745987;
        Tue, 03 Feb 2026 23:39:05 -0800 (PST)
Message-ID: <0a68463b-90e7-456f-9ec4-08d74b3714d2@suse.com>
Date: Wed, 4 Feb 2026 08:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
 <20260203230757.3224547-2-stefano.stabellini@amd.com>
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
In-Reply-To: <20260203230757.3224547-2-stefano.stabellini@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
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
X-Rspamd-Queue-Id: 9FDA5E2C12
X-Rspamd-Action: no action

On 04.02.2026 00:07, Stefano Stabellini wrote:
> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
> global to VIRQ_DOMAIN to allow other domains to bind to it.
> 
> Note that Linux silently falls back to polling when binding fails, which
> masks the issue.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/common/event_channel.c | 1 +
>  xen/drivers/char/console.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

The public header also needs updating then, to not leave the comment there
stale. I also wonder whether "emergency" there is then still appropriate.

Jan

