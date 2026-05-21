Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFyEB4/0DmriDgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:03:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE65A474D
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315117.1584982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ27E-00016y-Pk; Thu, 21 May 2026 12:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315117.1584982; Thu, 21 May 2026 12:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ27E-00014W-Mw; Thu, 21 May 2026 12:03:04 +0000
Received: by outflank-mailman (input) for mailman id 1315117;
 Thu, 21 May 2026 12:03:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ27D-00014O-N4
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:03:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ27B-007SJu-JU
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:03:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef46d-e002-0a2a0a5209dd-0a2a4507c598-40
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:03:01 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef475-229c-0a2a45070019-d155dd32d13d-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:03:01 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-45297094718so4827273f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 05:03:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7d0bf6sm2549105f8f.7.2026.05.21.05.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 05:03:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779364981; x=1779969781; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Hcux5EJ0H8BCspM7wwo1iUVLe9PilmfYB+sfRulwPE=;
        b=cYphvhvLzDjwEKYsGqkf+m7I3H7Q46rVriHwDMbB2ZIvTa65otiEsRLiMNQ+lVgbvG
         QcnYQnSRK9gvGiKvjFckZL/h8xYhGjYGOqRb4PBIpYyjqbAEqz6xuVa5cq9caAgzf52E
         75taPjM4w5DZuY3jNnr/rJHUBN1a6DJnQK14pa52xT5BmlUe90Tv27ox7x7K0D6FW4CS
         XKtkLb1RzmWJ2NYQ5qb1eW8Z1JDRIGwQNiUHEhEFmitfyNM9I7mP7nVmcm0JM8sxKOtX
         PcJi1A4JLzX138ZD8gHHCfFgnUZsUFNU5ChPzHsjq3afxaF9gUP4K2mfosBMm9V2Pwp/
         6tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364981; x=1779969781;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hcux5EJ0H8BCspM7wwo1iUVLe9PilmfYB+sfRulwPE=;
        b=sPqM+CfTY1g5hGRwoJWklOG2PFe8ESprCi63rmOnRooyKOSHoznoGW1JVfgYA5XvAD
         SJgSrweilENx46KMXY+gVNCLd0Vram1lp8s6UTc8ckn8Z4NjS8BN8bMr7liqtErH3bb/
         PvAmh3CCIoNkTntGT0jQXcBX2msJFrLTsEe9n+1zg7e1CAVYkSLGxqdZGHz9Dn4/aTqv
         Ri6gdeH15FH5sWCruneilQKB16qWu1nRoM4DAK+lUVxIrGVMYCT+WwsQ5jf/bK7I/rcP
         /v7A9UQRcnGHejKc0gOeOx11GzoI4Qo59OMCqXnhN6EAYNUfFhphTP/iEz9juc+S1WPw
         46Qw==
X-Gm-Message-State: AOJu0YxuLV9AaAVjX1RNJHTbxjWsWV7xEEy8VQnwxSs6CFf3XVMJXoov
	d+6e/vvwo6oYi4wz1JAjxwQbhD/GrAfRtHC2oE+Ck7m8mTPcIscMlXcYWTDmyJcsuryXj5aK+20
	jjyA=
X-Gm-Gg: Acq92OFOYe8QSllhZDO75EPcJ/ZNej9V5XKfkzKsRm1tCcmeF1Qrdbxk88+xlDrhaZf
	ame8As0p2WYgij54HKgJQfiZvntiBISfGcvvhwmtVHlEpoylDGSUmplJ4KAfaauyaNQpTfz9x/p
	+bksgTQwSpRvRjQosM2CxXsk+mMsE2HbzAOCbJnfe8DayzwUNiZWgOr7eFyyhwHyaB5UmL9KIfv
	D/7XJk3dZnVuARj0JpgX2qxbTfBzX8YquuXMrUsQWgMt1xq9vwxbmXUd6OX6VPHtj1cGOJInBQQ
	Da4CYIrf9zNc4YhOSaqm2cglxnXnllrxPx8R2yDLgz9HAX0Rt109MrtqK4B4FwzsMdFxQhcdEEH
	q8FLvq5B6IuzURmQ4l+aVHyy6flWQG7D9/obwjvdldTV2I2XaMnbg6nAy0Gt4OLWZzIe3gb9WPL
	hiF1CZHGh0SeHT5X1Dnoa3fyg9mO3/veueikLsKOJ0bgUR8pS8Ns78UhZSm3X3xTNVBBS6+TK/0
	fUa7aLZBxq3quY=
X-Received: by 2002:a05:6000:4310:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-45ea38d958fmr4652712f8f.28.1779364980671;
        Thu, 21 May 2026 05:03:00 -0700 (PDT)
Message-ID: <59fc2b14-073b-42a6-8f30-503ad789fbab@suse.com>
Date: Thu, 21 May 2026 14:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm: do a 4th linking pass if necessary
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779364981-2976AC48-A194ADD0/0/0
X-purgate-type: clean
X-purgate-size: 3186
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 39AE65A474D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The .rodata growth between 1st and 2nd linking passes may affect the
number of stubs the linker wants to insert, which in turn affects the
number of symbols. If symbol table sizes change after the 2nd linking
pass, insert another one before the final one. (As a comment in Linux puts
it, "In theory it's possible this results in even more stubs, but
unlikely.")

To use the $(compare-symbol-tables) macro in a shell "if", it needs
slightly adjusting (and then wrapping to be run in a sub-shell).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's imo no good Fixes: tag, since (aiui) stubs (veneers) may also be
inserted for reasons other than errata workarounds.

For context: The Cortex A53 erratum 843419 workaround in GNU ld comes in
two flavors: In the general case a stub is inserted, but if the problem
ADRP can be replaced by ADR (i.e. the target symbol is within ±1Mb), then
that's preferred and no stub is needed. The addition of the symbol table
data is what then results in the stub-less form to no longer be usable in
affected configurations. A possible countermeasure could be to move
.rodata ahead of .text. (Also, from looking at generated code, it may well
be that newer gcc simply avoids producing problematic insn sequences.)

Linux simply compares object file sizes, but I consider that fragile: A
change in size of one of the symbol table constituents may not necessarily
change the object file size, due to padding which may be in use.

Once we generalize linking, we may want to introduce an equivalent of
Linux'es KALLSYMS_EXTRA_PASS as well. I don't think doing this right here
would make overly much sense, though.
---
v2: Add "set -e".

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -99,9 +99,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
+	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
+	then \
+		set -e; \
+		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+		    $(dot-target).2.o -o $(dot-target).2; \
+		$(NM) -pa --format=sysv $(dot-target).2 \
+			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+			> $(dot-target).3.S; \
+		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
+		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
+	else \
+		ln -sf $(dot-target).2.o $(dot-target).3.o; \
+	fi
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).2.o -o $@
+	    $(dot-target).3.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -65,7 +65,7 @@ define compare-symbol-tables
     $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
     ln -f $(2) $(@D)/.cst.$$$$; \
     $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
-    rm -f $(@D)/.cst.$$$$
+    rm -f $(@D)/.cst.$$$$; \
     diff -u $(1).sym $(2).sym
 endef
 

