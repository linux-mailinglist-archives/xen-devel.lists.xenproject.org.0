Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwYKQgQwWk7QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:03:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978B2EF9E8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259171.1552483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c8L-0001h4-J7; Mon, 23 Mar 2026 10:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259171.1552483; Mon, 23 Mar 2026 10:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c8L-0001e0-GK; Mon, 23 Mar 2026 10:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1259171;
 Mon, 23 Mar 2026 10:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4c8J-0001dq-LL
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 10:03:39 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90249def-269f-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 11:03:38 +0100 (CET)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so24711935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 03:03:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe68ec05sm400250825e9.0.2026.03.23.03.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 03:03:37 -0700 (PDT)
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
X-Inumbo-ID: 90249def-269f-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774260218; x=1774865018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5XNJylV3xR7MrhB7xAWn4j6maGHBcDHY0dDp2+DrRp4=;
        b=WTbf4f/Izs8LRu7idZaFkelpq9QnXDea0pecz08Yh84T2FsT4RWqJ1HO+6No8H5kal
         Iow2/KWY3cv6ftnQrfUndOA3qwW3GE/YuMYUJAqBmHuONOjdgb5TmC4zjFjXfzLgS9I6
         tlSSH02RXhlAbXkD0rbnItC7OjFWyCCFGVdyiVEr2X9RvFe+ZV/C9CVpFn0cOPMpT4p4
         lXPuo9KrpmoZ2Jcs0bmpEzj1QJ21vsuzbJ8ukfurI61r65Spp6AFmajnMfz+8u4XlHkn
         FcdQ0aS+FfStv9JLjsn81TMsRcrKmqFt4m0D77tmA0XEsgfsAlBibGR1i124k91r1Wn3
         UpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260218; x=1774865018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XNJylV3xR7MrhB7xAWn4j6maGHBcDHY0dDp2+DrRp4=;
        b=pHjrrmPEIQ537ghzp6uAAn+cb+L9SIyBUfKugkpyIaqLrfhqy+LxKLFDLkxe5YCJ6Q
         Yk7WotAdHEX2hUf66dZzKIJceE6j06G8ra9Z8rnnfMk6DkGnzgZMBkuK9ili+wlq8Itc
         3YPGPDM5ybHaT1pb4wPhKlMinMidEMzM8XHqxqVp/onf+7+LFYqTh+ux6qXEq0tyfd1/
         pauN1eYlWb4Xb3wNhxQaWS7EBWYRsfrzRz8V0337UHukGINYOhiSX7+lHKLDBWLuuGcV
         81A2vgVb2idc5wAHPa+640qRbpAMQ9kyTXthMA8G+wv5wfNkrp0ISnTNKV6BxV8YdOaJ
         xKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqpMRlWtwV1+r70t/Lz5mxW4GChcT6JY2zlOn6fiLwunGDmuTasEkmIn2sicH5GsKOjRpMX9UDR98=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqbUhtlomzw843YgbkNzY8bJNH53wcFr6+132P/GTe5ZWFuEvj
	aLd4rYktVEvuUTAfmXKWPQOpt72CtSD5GcNi6Oe+bfvdSLhORCwy9kapJS4Ug2QrfQ==
X-Gm-Gg: ATEYQzwsvqegx3PU04GsFygfMKLaCFhoHHD6ZJ4JHLu8f8XNUkO7kxVnVyCawA7pma6
	ZT8rRJAnHhLs9YkbqiYsJ9W3wntydFkp5tTnkO7nLBXEV0iFH1HIuiJGpbk6IZgbWj33wfAxZ+n
	E706CwF0bKQnBIEnf31KZcShK4eiFPB/YK2oRGZqUVrpskal918b1jFPNcsEp4Z98FCOZ4xKWKB
	8+aNpKLQ9tH4kyomBYvqmU2aeOG2gVnh6pmBxJOfEpACQnUyjQt4Gn65tVz5JP4znKrJJaNBFf8
	iOpqiq7Ux0Ars3GSpbjUlWwJ4UPhGUYZuyIcY8XxfgI3O1QtB+NSJl6MRZ7QDzYINqsVr8b2dZa
	Kst2TMFA+FFwNs4XrQ6D18n5a1DwLx0eDuvyy+eF71eE8DozpsaEHuGZDyRNP4XEbTQQLohkyia
	NujF0QTDG8MwXxKEA15ehMBOWNStR3y8pT/Tg+vlE2+972IFIvZmXbV+LK0Ysu34DdwaHZoxo34
	ZWj8ud/fdZLmSI=
X-Received: by 2002:a05:600c:3546:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-486fee292b5mr164314585e9.28.1774260217987;
        Mon, 23 Mar 2026 03:03:37 -0700 (PDT)
Message-ID: <69a0bd54-1f2f-4fc1-ab91-3ef57145b3b9@suse.com>
Date: Mon, 23 Mar 2026 11:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 7/7] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-8-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5978B2EF9E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


