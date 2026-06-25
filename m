Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uqS3KagjPWq0xggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 14:48:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D86C5B7A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 14:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FIXReWoG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345585.1604410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjV3-0003Qk-TX; Thu, 25 Jun 2026 12:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345585.1604410; Thu, 25 Jun 2026 12:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjV3-0003Nz-Qo; Thu, 25 Jun 2026 12:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1345585;
 Thu, 25 Jun 2026 12:48:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcjV2-0003Ml-1u
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 12:48:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcjUz-008s3l-LD
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 14:48:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2380-bab6-0a2a0a5309dd-0a2a450990d4-32
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 14:48:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2385-97e6-0a2a45090019-d1558035d487-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 14:48:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49249072f03so12603075e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 05:48:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1eef84d7sm17029247f8f.16.2026.06.25.05.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 05:48:04 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782391685; x=1782996485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F6s7KQweRtxfVNBQzgv/IxFoTXoEaHz5+xNzZ7eaob8=;
        b=FIXReWoGWqxgESwoh9l3Yp/yQW6GTTfbOtZQ/EUoZGpXIA5EzWaajKZWx8qnR7e4o5
         rfEtN0hb3BKq0Svi/mjVsfBTQT3EW/oihSTIBto6icu1/QDg8UMfmTtE/txRg6XQ9Ok0
         WxUw/ZY3SjKk0ORnDbP/jH/lmNMPZ5ogm1Z5FBQSRTOLb+jhh7oMNqSvlSU5p0/py2wI
         zfC0gvW1eNYB1wfc4gegj9MdWtk8raWyrZZghq+59vouAW1JPqjmqHw9E2Mp5QmfDZ3v
         XqwRZeS1M+0Wy5UMdOaN4lhxVhlFuOajhLa6YThSpWQnzZ8tS0ioBmmNKjAmCBgzcLSV
         LeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782391685; x=1782996485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6s7KQweRtxfVNBQzgv/IxFoTXoEaHz5+xNzZ7eaob8=;
        b=J8pqsoMeu7rbx7eqqUORaELE7zcZLxAYp5ioHteAZpDmjaz8TPr9Tz5dztv0M5uCZs
         cXtQIpP5JEYcXEMrLrMP/LE1krG9+h0HJCgcHEyq1d65tyH4qzRTtBw2GcjPXPVBhD93
         rOw312kJiJjWTVXydYFQK56qjXCvd7ChxoAOicE3Juv4msY8eKumEmv258pxwPi7jFrE
         UmNWpNNR7DLdCbI7Uuj8dmo4FLh7Mc6iCPc5FyPT5unXweVsDaz5MUxRdf5KbFCKP7vI
         bk2tReFskD1xMIXIUAHCNoaUmra7KnDIGnoUrpQqS2YGiN+yg89GuHJvwZkDXn9/0UwR
         SrNA==
X-Forwarded-Encrypted: i=1; AFNElJ80WvRyes/D18R5u7iC+IxY0HvNeufHrT0TS7oOXOx/PNZ+N/conHHoAD+5tu436eaHEAmVxlQc8XQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYM0VocqZph4wm7xAr+TVUoq5DCcO4Qp7RcPvZRGkNIwFt2iDv
	7PCSR987uUlmEUfp+jJBojnQdL0P4QalYHWXlRKoTY89QhFYRG5ufsiYp7qZzrn3Hg==
X-Gm-Gg: AfdE7cnbOImH/VVwI7ubLcOdlsRb/bg49M18db4JWRfDg2Hxp04YaoJbuzzarLk+Buj
	UCdRMEzm3+9CWIsIAzo+mjsfFVx92wzIS3wCWFgaRDWuR0aGVvYX/0SXxzjCGKYaR2r60iUpJtf
	3LzFAxDVhGbv/IygiwH8n6UlCVvuZ/toyZq+1mHz7miDmFH8skqCqCplQ3BfKIQ5/3WPu+tGl/p
	9qtHXo/C47zteH+xwdo5qKsYDuOJQcJPKoA6RoJEayyzZj1638aqyx0cYFVbYlOuLu0FF+3ZlQx
	ffBBcAtoKOhKupPWmruA1d4gV5nnhSIsPwbnhaPXzLDSnL9G/UDnPESmT5FpTkM1t5Z4aNBkRqq
	+sL9GdS05QN1jLE4TAEO501QqLA+sNtyyub0629wg2Hi6+iBjZCIwfmLSkDzRMwDMA8WwZkunmj
	ZcjIY8kiUeC8Qw6mKu0fHgMDKLqXpNMe5Fq4264cfg08S3cscCRy+wTBLsJIOmqkLHvRL02iDwh
	yz3
X-Received: by 2002:a05:600c:8b72:b0:492:46c2:f5b9 with SMTP id 5b1f17b1804b1-4926684a6f7mr32624465e9.3.1782391684699;
        Thu, 25 Jun 2026 05:48:04 -0700 (PDT)
Message-ID: <d5ad16d1-3eec-4fda-9897-146f803d9c7c@suse.com>
Date: Thu, 25 Jun 2026 14:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests: Improve 'make test': Run all build-time runnable
 tests
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <72ab1053a6d04f007f70620dace33c1e675353d5.1779981804.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <72ab1053a6d04f007f70620dace33c1e675353d5.1779981804.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782391685-47B33986-28820B77/0/0
X-purgate-type: clean
X-purgate-size: 4356
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F28D86C5B7A

On 28.05.2026 17:25, Bernhard Kaindl wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -92,6 +92,7 @@ build-docs:
>  .PHONY: test
>  test:
>  	$(MAKE) -C tools/python test
> +	$(MAKE) -C tools/tests test

This means they're run sequentially, when really they could run in parallel.

> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -189,7 +189,7 @@ INSTALL_PYTHON_PROG = \
>  %.opic: %.S
>  	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
>  
> -subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-uninstall: .phony
> +subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-run subdirs-test subdirs-uninstall: .phony
>  	@set -e; for subdir in $(SUBDIRS) $(SUBDIRS-y); do \
>  		$(MAKE) subdir-$(patsubst subdirs-%,%,$@)-$$subdir; \
>  	done
> @@ -200,6 +200,20 @@ subdir-all-% subdir-clean-% subdir-install-% subdir-uninstall-%: .phony
>  subdir-distclean-%: .phony
>  	$(MAKE) -C $* distclean
>  
> +subdir-run-%: .phony
> +	$(MAKE) -C $* run
> +
> +subdir-test-%: .phony
> +	$(MAKE) -C $* test
> +
> +ifeq ($(CC),$(HOSTCC))

I understand you lift this up from uses elsewhere, but I'd suggest thinking
of ways to improve things while generalizing. CC and HOSTCC can very well
be different, and the output can still be run. What wants to be sufficiently
similar is e.g. the output of -dumpmachine (whether the middle part of the
triplet needs to match is not quite clear to me; whether e.g. the last part
differing in a suffix [e.g. -linux vs -linux-gnu] may also want considering
a match I similarly can't quite say; what I can say it that pre-built
compilers on the distro I'm looking at yield x86_64-suse-linux, while my
self-built gcc-s yield x86_64-pc-linux-gnu, yet both obviously target the
same thing).

> +define RUN_TARGETS_IF_CC_IS_HOSTCC
> +set -ex; for test in $? ; do LD_LIBRARY_PATH=$(DISTDIR)/install$(libdir) ./$$test ; done

If LD_LIBRARY_PATH wants fiddling with here, I think you want to prepend to
what may already be there. Since quite a few of the tests don't reference
any of our libraries, I'm not convinced though that this wants/needs doing
here (instead of perhaps per test).

> --- a/tools/tests/cpu-policy/Makefile
> +++ b/tools/tests/cpu-policy/Makefile
> @@ -15,9 +15,9 @@ endif
>  .PHONY: all
>  all: $(TARGETS)
>  
> -.PHONY: run
> -run: $(TARGETS)
> -	./$<
> +.PHONY: run test
> +run test: $(TARGETS)
> +	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)

Try (perhaps with a trivial, independent Makefile containing just

run test:
	@echo $@

) to invoke "make run test". You'll see the rule is executed twice, once for
each target. I think you want

run: test

or the other way around. Generally I'd expect "run" to be the "on build host"
target (based on how we use it right now, with ./$(TARGET) invocations). The
other mode might better run stuff from the install/ directory. However, which
one is "run" and which one is "test" is of course simply a matter of
convention / agreement.

> --- a/tools/tests/mem-claim/Makefile
> +++ b/tools/tests/mem-claim/Makefile
> @@ -11,14 +11,7 @@ all: $(TARGETS)
>  #  Can also be called with "make run-tests-mem-claim" from the toplevel.
>  .PHONY: run
>  run: $(TARGETS)
> -ifeq ($(CC),$(HOSTCC))
> -	set -e;             \
> -	for test in $? ; do \
> -		./$$test ;  \
> -	done
> -else
> -	$(warning HOSTCC != CC, will not run test)
> -endif
> +	$(RUN_TARGETS_IF_CC_IS_HOSTCC)
>  
>  # The tests in this directory need to run in a privileged domain (Dom0)
>  # with libxenctrl and a matching the hypervisor to test running it.

Hmm, this doesn't match present staging, yet you also don't mention any
prereq-s this is to go on top of.

> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -8,11 +8,13 @@ all: $(TARGET)
>  
>  .PHONY: run
>  run: $(TARGET)
> -ifeq ($(CC),$(HOSTCC))
> -	./$(TARGET)
> -else
> -	$(warning HOSTCC != CC, will not run test)
> -endif
> +	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
> +
> +# The tests in this directory need to run in a privileged domain (Dom0)
> +# with libxenctrl and a matching the hypervisor to test running it.
> +# Therefore, they don't run with the native test target for build-time tests.
> +.PHONY: test
> +test:

I don't think this is true here.

Jan

