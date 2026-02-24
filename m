Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULjDBntynWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:42:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73847184D1D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239670.1541067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuovd-00067p-9D; Tue, 24 Feb 2026 09:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239670.1541067; Tue, 24 Feb 2026 09:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuovd-00065Y-6S; Tue, 24 Feb 2026 09:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1239670;
 Tue, 24 Feb 2026 09:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuovb-00065S-Qj
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:42:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1251a5e0-1165-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:42:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4833115090dso50787215e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:42:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00d0csm25972722f8f.11.2026.02.24.01.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:42:01 -0800 (PST)
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
X-Inumbo-ID: 1251a5e0-1165-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771926122; x=1772530922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vCOEH8lcjCMrOa//j8Zc+oiLeMRNj6DC0apFoxLbGcU=;
        b=NJ41gGg1KxuKK8LKeGAHQw57uOnDBdgDrzxO42TUrR56qXGGxzjIkvJpOQgQ9ruR/m
         iJ4mWNnCFp6CQICw/OvisveTrKIPlDUdkaRbLpd08E5CYTZFvJdbcm9IrWVbhP30fr+C
         NqacIBob+IuYaIw2OxUVSlwu/jjrG/GJVxYEVX9/WDfQW+VdSpd+7HR8esymb5MJXpq2
         HUrl6tlcTXX1WTfOEg4cLaBAacts3U8R+8pMU7I0TQ1SkW2gnuZV5gfCPQSQM5QYQpKe
         r41crPSZUg2eQKQKyz49c5/+C8B0L7zUykSPF4vFVw3tzoxiCokukDKuZy52EXQXm+bX
         PsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926122; x=1772530922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCOEH8lcjCMrOa//j8Zc+oiLeMRNj6DC0apFoxLbGcU=;
        b=mEc8by8idTNE+R34ZsFToCEbubb9FPfBKCDngwBvAixXkdNKnj/kgja49HiyiSc/O0
         7mlNRF524mBlzixaGRf83rYY/G6DOglvmXetjtxMIIY+2zDJHFwfHKrVlaXK9HZ4eVfd
         jajL2gGj6I0x2XH5M+fbIE6RflfcZ9ULnE8crwpJAZq9sJ9TyozUlojFU8WshcL00anu
         MydBIlUys7xppA5i1fQ8d71noy9gb1sszAaBsD29XDsfi18YTbNsCHzXBF3qPamVdQwG
         55WHp/pfr0jhU4/r8GnRc9JoTHC2uPx+2kPsOcgUJYdhPKv0psaGS7tD0sOPIwUKVNko
         ZcJw==
X-Forwarded-Encrypted: i=1; AJvYcCWO2bPpxTFaLMyCK2cCR1vpF20zbkF5q766FpVGPNgrX9JvD2wWrUp5zi2zz96WhXLwFb2SNVMo/Wo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCMwYKgyi4irA7EyeqL2Ii+5O2/GP7iLVTohhHZkEXXPSeaKts
	cvUFyyOXUpCUUnBLc7FaQRoMjxhIFcSW4kxJhk3qApm0wxDPXcrz7DLCZeHzxI6JIQ==
X-Gm-Gg: AZuq6aKFQMmxCMORvDedVFWNy3DCPoN77w56XRewR+YB7y/bA1trz2kadKuwpyu0zme
	oItdMPEP4eYdRA2P+IXEHm/S6Fh1f6tjE8kjHVza1bUWN3MVrDz3bM6WteSs5Gf61fhTOPpk+FN
	zGTdQWm8wBTA+4KsvytK/p5fXslgP64ybQ9sA860swIkZe47OmCdl01xhVWnu7c8FgWtwxLncp/
	I66OoLIoCaRAMYx+/2t9YtCwERS0dR905OPZqfGx3OgK8pP02IIfFnplA1KQm6tPy7kxLzI761F
	tQ5Z59KAkm1QFeeRcLKx9zYlRL61MFLFYJREGTKGYW/iNl8LvgxRWW4eIJ5vba29qeFqyJcmSJX
	JxZqX3Q+Q8BEvEMqMaUOojs4+wNHaNRAhrEmPNp34kCdOe4fimo/BkR8NxfbA3NSgQfV9Ksm0Vy
	ahcoBDEd2zdKrtdn1/n1pLOlW+yRJ3qPFo8b9qhXM+zo/cYMMLzuJBQYprETfZfGjxairraoAmC
	yI/7/5C7M0f/ps=
X-Received: by 2002:a05:600c:37cc:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-483a95bec82mr213481495e9.9.1771926121713;
        Tue, 24 Feb 2026 01:42:01 -0800 (PST)
Message-ID: <e866d080-2c6f-412f-8ac4-f97eb7e874c5@suse.com>
Date: Tue, 24 Feb 2026 10:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules
 into Rules.mk
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
 <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
 <6616BFC6-2ABC-4DEF-A799-BC660BBE31BC@citrix.com>
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
In-Reply-To: <6616BFC6-2ABC-4DEF-A799-BC660BBE31BC@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 73847184D1D
X-Rspamd-Action: no action

First, since this looks to be recurring: Please don't send HTML mails.

On 24.02.2026 10:38, Edwin Torok wrote:
> On 23 Feb 2026, at 16:37, Jan Beulich <jbeulich@suse.com> wrote:
> On 23.02.2026 11:14, Edwin Török wrote:
> Introduce a new tools/tests/Rules.mk that must be included *last* in a
> Makefile, after TARGETS is defined.
> 
> Requiring inclusion after TARGETS is defined is certainly okay. Requiring it to
> be included absolutely last is imo going too far. There surely are going to be
> cases where something wants overriding or adding to.
> 
> 
> I’ll change this so that the Makefile defines XEN_ROOT, CFLAGS, LDFLAGS, TARGETS, and then includes the file.
> 
> 
> --- /dev/null
> +++ b/tools/tests/Rules.mk
> @@ -0,0 +1,48 @@
> +# Usage: include this last in your Makefile.
> +#
> +# For example:
> +#
> +# XEN_ROOT = $(CURDIR)/../../..
> +# include $(XEN_ROOT)/tools/Rules.mk
> +#
> +# TARGETS := ...
> +# ...
> +# include $(XEN_ROOT)/tools/tests/Rules.mk
> +
> +ifndef XEN_ROOT
> +$(error XEN_ROOT is not defined)
> +endif
> +
> +.PHONY: all
> +all: $(TARGETS)
> +.DEFAULT_GOAL: all
> 
> Make 3.80, which ./README still says we support, doesn't look to know this.
> 
> Do you know which (Linux) distribution and version would have Make 3.80 so I can test my changes there?

Not without a lot of digging. Perhaps we simply want to bump the minimum version,
to "sync up" with what we did for binutils, gcc, and clang?

Jan

