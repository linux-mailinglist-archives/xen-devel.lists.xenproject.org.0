Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHW/Ng+W4GlMkAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:55:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D0440B3B5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283035.1565345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHZj-0001tm-UC; Thu, 16 Apr 2026 07:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283035.1565345; Thu, 16 Apr 2026 07:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHZj-0001rH-R3; Thu, 16 Apr 2026 07:55:47 +0000
Received: by outflank-mailman (input) for mailman id 1283035;
 Thu, 16 Apr 2026 07:55:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHZi-0001rB-Bp
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 07:55:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHZh-004uAU-KK
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:55:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e095ff-2eae-0a2a0a5409dd-0a2a4501a7ac-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:55:45 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09601-c1f2-0a2a45010019-d1558029c1b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:55:45 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso71976625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 00:55:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0eaffaasm38296185e9.23.2026.04.16.00.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 00:55:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776326145; x=1776930945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4QyDIOCsbMq+hB5YoKzP5G/4oefbQcwjMhuS5duvxx4=;
        b=CjA2iqdIyZCLvSR6ECqoPL/5kdzzTw+oDy7HVH5NYp0+QljO4bdIhePM5Vj8Bxbutr
         RjwDg3Nart9nJ4zfMb6jJzOY02wNfMFx0hV8eEBkUtNx+PWNpS7PQVG+9BDJZ7VLFk/I
         KLeorhegcz0jweYn/K3Gsb+MtBEktQY22yGLC3nC3Jcc5BuXvMBD+tGMOAFVr6JOJQnC
         UdRFxs2JZSkdpAKxX2tTZe0PoxDUfVshxcS0JatOUXV8XOt/adKoF3kcly/2Q1ixfnt4
         xkBOQQ9U2gj9G5J99udhuhXJVUKqMWQu08t1IAJIqckkC34xURtBEw1WEo0JtRQVMwrD
         DtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776326145; x=1776930945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QyDIOCsbMq+hB5YoKzP5G/4oefbQcwjMhuS5duvxx4=;
        b=khL9SW8GAkkbPR6L7e6hdNP2pD0O/dPDGQkH9uHTtFJ+WNacEKS58XhyeChtqxQ+yS
         Hpmja196qSkn5N2EW2eI0+0WBhwH5bcc7tooRG1qIdjMEu2qyPkeGZuB1UtEBquVQQoy
         EYUU3pxIlXjAxqFxLn809d8seI+ToUfJPptsPV6L0nOr3RDMp6bAO0chzp21R6kluYnm
         B9qbGI9R1dgFYKnh8QFHMAl++/BWqs17ST/j1AmwuNWcwsyiCfk6lzdmigraQgZTproa
         Mp3CvUHWWT+mn/KegSQKzTmAy+fPA+7kU6kCjmgfZ6nbbkmyYPhfFyZB7At9e3R8Y5hs
         irvg==
X-Forwarded-Encrypted: i=1; AFNElJ/vgRa4GHjMS5GpFlNe/tUx8rBmpHB3cE7FCSfNEl5N7yo6wom2Ubr4y1U2wDqICnrSJOEZAaoRLW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgTAN3PgEk9TRU5TvcM2IuGdd4aDsXtNJTuIbkSgmOEqVb8fQ2
	xy0ik5CedtF9wsP3ozGe28Www/HWCAN4mjGpBLgY+J7B2Kcw5cASwv8ox3Qk13ygpQ==
X-Gm-Gg: AeBDievQRJFf4ffaVI2FnozTwkMMvY/i229QJ/cg7s3q7x/IEU91yv/3fpEptf0SsaI
	fFpyKS3uEXdHUQjOw+LMG8DmB7AnCAx7xYZST7T0ofB4AxZQ285cUlYmUAZGa0YDL6oNW6U4BtZ
	dWc/rXVMcxWch64I0hohT5MNV7sFs+P9kLiGc2WDSGnv03iwmGyu21gYbPA7iy5iQycn/a9ifgC
	BrcOmZCwcu5p4U3UsXufp2yFcsJGZcwkaceS7AeEiPtKXQcfe2hbTXcSOERcXkJyI4ocv61SdJ4
	3cv2ZovhP47pwm2Eqe6/iboVkXWD/lAVnSSNMqjgeBa1D8kmuIZVYBEqEfkc0EKNsV14p3tUBDK
	z8dA+6qUeQ1E5jorRTuFbPOlhIjhj/yWxLYeqE5WZ4aRyHhfpkXAmoqIP9h7TcriajjqZDfe9nk
	NOq4IPGpaOdIZMilpyqolken8/khs4i3i/eQyVOJRGKf5POjoLub0C3VfEoxu6duHZCxVFiGGDL
	ZZ2sqCUiUMOjkAhlfSl61x86A==
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr331917165e9.5.1776326144980;
        Thu, 16 Apr 2026 00:55:44 -0700 (PDT)
Message-ID: <636b5d74-6383-475f-af4c-c4964bb40bde@suse.com>
Date: Thu, 16 Apr 2026 09:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/cpu: round up cpu_khz calculations
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-3-roger.pau@citrix.com>
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
In-Reply-To: <20260414103327.7420-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776326145-B6265FF4-04142350/0/0
X-purgate-type: clean
X-purgate-size: 730
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,wdc.com,gmail.com,citrix.com,vates.tech,lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 70D0440B3B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 12:33, Roger Pau Monne wrote:
> All arches truncate the cpu_khz without taking into account the less
> significant digits.  Instead use DIV_ROUND_UP() when scaling from Hz to kHz
> to get as more accurate kHz value.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> While the possibly more accurate value is nice, I'm not sure it's actually
> fixing any functional bug, and hence the lack of "Fixes:" tag.

With, as suggested by Tu, DIV_ROUND() used instead (which then statistically
indeed is an improvement in accuracy)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

As it's only statistically, nevertheless there is a risk of (perceived)
regressions, just to mention it.

Jan

