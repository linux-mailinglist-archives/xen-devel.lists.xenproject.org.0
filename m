Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIOGHnOInWnBQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:16:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37718600D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239862.1541274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqON-0002M7-Uq; Tue, 24 Feb 2026 11:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239862.1541274; Tue, 24 Feb 2026 11:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqON-0002Jk-Rw; Tue, 24 Feb 2026 11:15:51 +0000
Received: by outflank-mailman (input) for mailman id 1239862;
 Tue, 24 Feb 2026 11:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqOM-0002IT-OO
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:15:50 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c989ee9-1172-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 12:15:49 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so32561665e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:15:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b88ead80sm36093175e9.2.2026.02.24.03.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:15:48 -0800 (PST)
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
X-Inumbo-ID: 2c989ee9-1172-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771931749; x=1772536549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fqVBlO9o3V3gYkcMvM77zg0OJJHO3QE05ftI6Ud65Uw=;
        b=Z2wWUYuDvtk7IIrqNrH0AKTQrWQpB/cgDW9A4/bjqKAm+rx3tJrn428Yak1zp0avb+
         Jmn4iYICFM1ISb0OyMHomsvnuj8rRbDmSXeivZsP+H2tcGOtIMN2uBK61iNsmZIeirbo
         axKKtWrT4qpw0UgS7oHCndaAS/xI7aURnRfg1Z9lmqnnVHF3Dl/TTTHcSpmeCQZ5iF5Y
         uxbX+o3XkJA2x1Qd6mLZCdjpt9VolWTqooXfA06LFu6+AajxgNhI4lGYSgVTgmy5P8E9
         Mx/Gyrs/evlwk8u44E0N41aJ4gKw3JhAc4X4T5clvEnTR8nQTfkpDp2BRY369qJiGmXq
         Fvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771931749; x=1772536549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqVBlO9o3V3gYkcMvM77zg0OJJHO3QE05ftI6Ud65Uw=;
        b=Sw1tyP57Dcv0ZJVVXkJkuAo/dccnu/CCjNUFeVBTEDxRnv2VrSqZb/OwDv5kSBd53Q
         QW1v4BIfcataFFUwP/grB///GIXwtoG8qe6Ag1gwfZScixlvd9nynl4gXbcNoxuqcrfz
         w40cmRDZcin99YF3x5fXZ5m7Z8OfTtxu6EwRjCsDobJaX0k8AILlg1n/3Qka+82dPeiq
         3PasgC6/dhGbqx7NyKFTHcBPl7m1RExqW8SQjjRrNZvWX2MHTVPmbhLrklUgSwI//iGT
         yhGF0cuLofI8E9eOKcTFDbvNTlzW0O+SrU1gyWiRZ9On6qVw4zkIdnOJ5pB/OOfy9S8e
         hgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8rhzTn5TnXtUdMfOOx+O+Vmk9I/JsNPfe7ACOwNYCBf6HXgyAYy0eGWvBFhoYPE+ynZFA1+fjY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzrpLMTnhbEUtV2kuMPYzAH7lpXfh4Wn2RyKsoPTmBJNuWH0G+
	J6Ipi0ALFaZuaPTQH35qnYNy6iWOb5G6zA40hGNYAUl/rrkJkPS0s1712rBl5CyQmw==
X-Gm-Gg: AZuq6aJaT42LqmE2ofboQrB07YXEJXHk+5w6+9Mm1JVJc06256CkkTyQZa72ktnNzJV
	FHbVKNCK8alsqiMyq46SAMG09bHqXQOvZHoxFjh7l3h4uYmWkNHOn8+VZ67oEvoZMFDySfstgkQ
	PlXeK7sXyQzi4s53ZIWmDQAmDYrDJGSonCbbcWjWxz/KS7hWpcZeShdDgenBiqG2DSkUJOYs9W2
	lIjwb/fcDVjgrVO58qdh/X/wVpmrZKXesZYUOl/hd9+TjT2hYW7mSU6pr/Sco64kV+7Uni9emXo
	z4rYnEyqnerlATzwjjKfXNzqgd5xFCUStp5yt9aXi7ga0Xm7vl7XMk2W0gVwZaGjGtGrA73uSJk
	bp3mbiPyBlRYuwnkbc6oUivBtuLfPN0kLhfcjLQQknEg26GLfTt6MckRwjFQ6uOLYX2Ho5dU6Cc
	9LszkZybmWYAQffmqMFRe9fcWgHIVYkt80aKgVaofxmQRD/XpiwYaQAAq6p2M3EhaKwTfTxXSgl
	6NYPOugGq7X0tE=
X-Received: by 2002:a05:600c:a03:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-483a95c7116mr194206205e9.10.1771931749204;
        Tue, 24 Feb 2026 03:15:49 -0800 (PST)
Message-ID: <1420bb66-0188-4836-819a-c04f3e98cb2b@suse.com>
Date: Tue, 24 Feb 2026 12:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tools/tests/*/Makefile: factor out build rules
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <57d93b2a6e9f3cdc70e4446c469226dc015a1944.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <57d93b2a6e9f3cdc70e4446c469226dc015a1944.1771840831.git.edwin.torok@citrix.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: BB37718600D
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> Also makes CFLAGS consistent across all tests, e.g. test_vpci would now
> fail to build with an unused variable error if it hadn't been fixed in a
> previous commit.

I can't quite derive why that would happen.

> --- a/tools/tests/Rules.mk
> +++ b/tools/tests/Rules.mk
> @@ -45,4 +45,13 @@ install: all
>  uninstall:
>  	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
>  
> +CFLAGS += -D__XEN_TOOLS__
> +CFLAGS += $(CFLAGS_xeninclude)
> +
> +%.o: Makefile
> +
> +$(TARGET): $(TARGET).o
> +	$(CC) $^ -o $@ $(LDFLAGS) $(APPEND_LDFLAGS)

In the earlier patch you require TARGETS to be surfaced. Why would we limit
things to a single target here then? Imo we want to settle on every subdir
having a single target, or the abstraction allowing for multiple.

>  -include $(DEPS_INCLUDE)
> +

Nit: Stray change?

> --- a/tools/tests/cpu-policy/Makefile
> +++ b/tools/tests/cpu-policy/Makefile
> @@ -3,26 +3,19 @@ include $(XEN_ROOT)/tools/Rules.mk
>  
>  TARGETS :=
>  
> +TARGET := test-cpu-policy
> +
>  # For brevity, these tests make extensive use of designated initialisers in
>  # anonymous unions, but GCCs older than 4.6 can't cope.  Ignore the test in
>  # this case.
>  ifneq ($(gcc)$(call cc-ver,$(CC),lt,0x040600),yy)
> -TARGETS += test-cpu-policy
> +TARGETS += $(TARGET)
>  else
>  $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)))
>  endif
>  
> -CFLAGS += -D__XEN_TOOLS__
> -CFLAGS += $(CFLAGS_xeninclude)
> -CFLAGS += $(APPEND_CFLAGS)
> -
> -LDFLAGS += $(APPEND_LDFLAGS)

You use $(APPEND_LDFLAGS) in the new rule (without adding to LDFLAGS), but where
did $(APPEND_CFLAGS) go?

> --- /dev/null
> +++ b/tools/tests/vpci/.gitignore
> @@ -0,0 +1 @@
> +test_vpci.c
> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> index 597303e31d..41ff867cdd 100644
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -4,10 +4,14 @@ include $(XEN_ROOT)/tools/Rules.mk
>  TARGET := test_vpci
>  TARGETS := $(TARGET)
>  
> -$(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> +$(TARGET).c: main.c
> +	ln -sf $< $@

Can we perhaps try to avoid further symlinking, unless absolutely necessary?
Here it looks to be easy to rename main.c into test_vpci.c (yet better would
be test-vcpi.c).

Jan

