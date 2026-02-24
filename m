Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLiQAydxnWk9QAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:36:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DBD184B4C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239629.1541027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoqE-0002iH-05; Tue, 24 Feb 2026 09:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239629.1541027; Tue, 24 Feb 2026 09:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoqD-0002ga-Ss; Tue, 24 Feb 2026 09:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1239629;
 Tue, 24 Feb 2026 09:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuoqC-0002gU-Hd
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:36:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a7818de-1164-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:36:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480706554beso63574155e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:36:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9cb3f31sm248163885e9.13.2026.02.24.01.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:36:25 -0800 (PST)
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
X-Inumbo-ID: 4a7818de-1164-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771925786; x=1772530586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iwktHN5AoA1M/Ga3pp7tujNkE83JC+yBQ1WUTOWAhGQ=;
        b=V8pyYIP4CIHwzJaZRGugNdhZ/5eEka6AveGVfBUAj3nwnn7vJvYUgSAySBWybCxcqH
         HbsEDfC87PXr6TrJ3apmdAmSZ/EExvj1RGWX9FTwDiUJfLmIBhXbaWNYEAC5hhPiX5cB
         uJWpZo1oNu9BvI9LnbaJ23j+T2/v1kuyWTitcH4GcvAZcZ/0pwA4RpU79YlERmnlLoVI
         bhYATvLlJR310waoj1a2HyZ3TBh/lHEnRd4s/rJzEN9TGy8oNaDSX36siBAqpjZEt2fo
         X4w/0i7WZvAZow1e3XpPGAQzVhWw+ssnSYwiZhYaLoFHovTS2JT3WdC9j3YpLD6PPQB4
         0cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925786; x=1772530586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwktHN5AoA1M/Ga3pp7tujNkE83JC+yBQ1WUTOWAhGQ=;
        b=T3sbGiUg8Um1jrD7C8dxVXxXCENdXGNUX4a/FKEx1MtynHy/OQHQ1opwaEq7HyjFoQ
         GnsUi48J5c9BlB0MVBbuvRbTdYyTjksWD7zRp6UyswBe50Lwb8ETt2K+ts1uuXic7A1a
         W1bfCM+q6Je6JXcmOfa2ocn0oaXp7t7zxQSava5wgpfSZiaoVKnclzToftzU1c2AtmaK
         2TxyIQ1PgrFe0Jd7T47LjYWNOOQY7kKxun7HNtmPJj16oXFb/faDqrAoDOXqg9XO4Lav
         l6L9RnYn20MeceiWREW4hD8gQcnWXwwV5SQrCWkSZg+K74fqmqpIfqXVWUFPbREoW/fW
         DFYg==
X-Forwarded-Encrypted: i=1; AJvYcCWFv5h66NRKuNiUW43QsjbGv9fR5sS7P5uIJZQvkNowUl6NlKY6ruR30oMyoQqQomLDo/uck/3/4sY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgq/KsgP6AXUnBGJGb1Hu3CvGEkkj5Cyd8NQy5Gs12ZnTdUUJT
	NRyBFJeeJJw3m2ah62k8O4UZNqSiMyGSZO1V1ggsbnjv2p+HqP+Avg+e2X35tnBpWg==
X-Gm-Gg: AZuq6aJ2XPN6F2tm6oPBtEWMOmNq9M7cwXsBOjJPw01M7aFc7NoOG39UJX6EnjyqJtK
	1MlChff+JOmH4KQpwG6OOUvGM0d50MoXfXTBUGO1IEGXX0PrTWqDszS0Ve2VuI9u/vZ7EtrZg9R
	y+QK1LJQnJ9VIgKiAuk6ds6qYkiDj86eO4SDVUvG1xTHpo8nkhEIMdsoIL0QZ6Oxz/nWm19qXq/
	FAVKl0zvF+bGmw0apwm3reNCDXhNEYWPVku4I11TFmm6jkZvm8v0qYeDqRYqQIQB92O7ghPEUUR
	WwjwGu1CHciJl3yMV93zIZEah8Njq0NExWd1qrHp3OoqeAtOIaGIQQy79T0Fmdu++pbOnmTw7cg
	yFc+Ph/7nCP8aCkDYbMxwoUocL7yq3w4kfHzKk21bC9+ssR/RH6oSGeXA1Nc+M4eYuc+18Jmbs1
	UD/ixxnFHMUlEsK0BpdDwXC2bna7fQn9/StsgAYzlyGxkLt2CV9578XsQZAaZfjdEWPL1G7d9Hm
	hyHsjSJPZT4C8s=
X-Received: by 2002:a05:600c:a44:b0:483:badb:618e with SMTP id 5b1f17b1804b1-483badb62cemr10190695e9.8.1771925786513;
        Tue, 24 Feb 2026 01:36:26 -0800 (PST)
Message-ID: <3aa8280b-8168-4e27-973f-f55dd7a11dd9@suse.com>
Date: Tue, 24 Feb 2026 10:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] libxc: Report consistent errors in xc_resource_op
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech>
 <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
 <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
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
In-Reply-To: <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 71DBD184B4C
X-Rspamd-Action: no action

On 24.02.2026 10:28, Teddy Astie wrote:
> Le 23/02/2026 à 17:15, Jan Beulich a écrit :
>> On 23.02.2026 17:06, Teddy Astie wrote:
>>> xc_report_op returns -1 in some error conditions.
>>> Make sure it returns -ENOMEM in out of memory errors and -EINVAL
>>> in invalid usages errors.
>>
>> Isn't this a move in the wrong direction? -1 as a return value is quite okay.
>> errno wants setting to indicate the cause of the error (if called functions
>> don't already set it properly).
> 
> To me, passing error through errno here feels more like a workaround 
> rather than a proper error handling. It doesn't feel consistent in libxc 
> overall (some functions returns a negative value corresponding to a 
> error number while some others -1; in some cases we update errno).
> 
> What are the error handling rules for xenctrl ?

Question goes mainly to Anthony. My take is that library functions should
behave properly, and where that isn't the case it wants adjusting.

Jan

