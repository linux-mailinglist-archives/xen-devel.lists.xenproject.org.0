Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SkYjKPsAMWo4aQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:53:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F185C68CF8A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VJB9kcIg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338767.1599823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZObT-0002eo-Gt; Tue, 16 Jun 2026 07:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338767.1599823; Tue, 16 Jun 2026 07:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZObT-0002cK-Dd; Tue, 16 Jun 2026 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1338767;
 Tue, 16 Jun 2026 07:52:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZObR-0002cC-OQ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:52:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZObQ-0093Qw-F3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:52:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3100d3-e002-0a2a0a5209dd-0a2a4503c91e-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:52:56 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3100d8-672d-0a2a45030019-d1558031e9db-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:52:56 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so19375405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a9b45bsm32118775e9.15.2026.06.16.00.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:52:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1781596376; x=1782201176; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jH6gKjlHKXvmMdLN2fFkunY4PM8p0ZuL4r/03YA3qA=;
        b=VJB9kcIgSAHhV4GFcmmHdoDGPi1K938R7ag1LYeKC6G/Koc2/i63TJi4FPFr0XnwBE
         UliM1t1TQNReT2Oc5fsziv6cOqPNJ6cMk3v+PR4dCH5VShtzam/kIAXBgQUZGqE6HTdg
         qg5Lb7/mU87ymfN1VyZ7S8kfpi63KE54GZb4eWOSgwo4LM46cSayJ/Tl7UqOnSWw0k4E
         ZE0EA6Bo7PyMKcVk12woUg2oooTBR/478e6egzdm3Ak3WOwyboIHdkRDxm+3fzevMNy4
         Jr09cY2OAhdij7d6R/p7U4ukAUTDENXrPiH9uD4pWdUzq9WR5HVd3pnFrjEb2vXAzYMI
         D9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596376; x=1782201176;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jH6gKjlHKXvmMdLN2fFkunY4PM8p0ZuL4r/03YA3qA=;
        b=lIq7R6BbUZ53GSzE/7ZXjXtZB/qqMD9/nKsAecA5f9QxQyJXzwQaTq0BvbCjNfY8lj
         oiN/ia2G95qCSf40T1eNDjOVInaLw9qbKoAt/2Q2Ne73XZnOnS4H2re7DqIDqNnJ0MyK
         mjvwASGImGNw1QggVpQ/Vq0GZV9YxubDsfVI1s6cW4ZUzEZho3GQ55upyxDYsGlRB9Fs
         +KNz0Hvgyf+YcaP/t7TSmAxlpS3jv65j5i0clGPEz2zjHXiY3AfKECBJN1wB4UKDp5GL
         DLLiauZW5hgz570ltV65lF4bQVPNj9E87x0UKF7LCOKjMdoVQCgnRWM1EfMpqD/CAZjN
         UnlQ==
X-Gm-Message-State: AOJu0YyORQeWXVb2NeYDacK8TeVKmhN4RRFpT3i4Ji025ma0rPIlurfN
	dKhKJmTz2zYkKGFtG7CUexKfK25GqF03r7q1QeQjRiZas1x6H+uFyovcIt3+KAl9ycGJPLiLy9m
	OFXM=
X-Gm-Gg: Acq92OFwOeJCRdIvvQw4iKuESjXR1IlhNDtLkMoGQrZzkGA0a3f+qa16s6lEVNI7GYV
	W2vOJXstTmCt0oyluZRD8vngYuTBROhgfGy8JtfDo9Zs2+vp6mQQ662RwZYIXUfdeCQndpTNe3w
	rJtCCz9YToCiyQXIhrkHkJAO1qN5xAXTZBBcQEI2pzpsED9qGShEmw1Ig+Ik7H/Faslo03MqWq9
	duov1tfewZ/bHqZhsSK3y138+vi4VruIfSqBeP6s5iXk9fuiqgFigZmrzVGXQjePvOt0Mdcrhl5
	cDRPGlTmHL88CvL36ZgiYiuEEuPqDUQVZ9UJA2p/Q11w0Rp7nCpJsKIYWCY1oprD4uXnYUINFw0
	8kXd8i9JHaCrA4d0oAH34O9hvs7WE1408GJ2HEvTiB3rrADApPQHdcE6A+4ADbLl3JdSGty/dlA
	DRx/oE8aGzmScWOgzx2ZfKCqiZ8jjlhUfEVz4+aA6PPZIH0ZefBfqjMYTRmpScvug75NvjdkEbe
	IhWW93TJtG+gO0=
X-Received: by 2002:a05:600c:8b31:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-4922ffc89eamr37295625e9.34.1781596375829;
        Tue, 16 Jun 2026 00:52:55 -0700 (PDT)
Message-ID: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Date: Tue, 16 Jun 2026 09:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] non-x86: sync tidying logic at end of linking
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781596376-41D91938-B1770C5A/0/0
X-purgate-type: clean
X-purgate-size: 1357
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,wdc.com,gmail.com,raptorengineering.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F185C68CF8A

Mirror what 761bb575ce97 ("x86: fix build race when generating temporary
object files") did there to other ports: These ..*.cmd files aren't useful
to have/keep.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -117,7 +117,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-	rm -f $(@D)/.$(@F).[0-9]*
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 
 .PHONY: include
 include:
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -32,7 +32,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-	rm -f $(@D)/.$(@F).[0-9]*
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -52,7 +52,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-	rm -f $(@D)/.$(@F).[0-9]*
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)

