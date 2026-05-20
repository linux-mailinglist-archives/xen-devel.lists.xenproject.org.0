Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN1uGd2gDWq10QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 13:54:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32358D037
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 13:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313861.1583886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfUY-0004qA-Rq; Wed, 20 May 2026 11:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313861.1583886; Wed, 20 May 2026 11:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfUY-0004nc-ON; Wed, 20 May 2026 11:53:38 +0000
Received: by outflank-mailman (input) for mailman id 1313861;
 Wed, 20 May 2026 11:53:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPfUX-0004nW-3i
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 11:53:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfUW-0061VL-Fi
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:53:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da0ab-e002-0a2a0a5209dd-0a2a4501a63e-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:53:36 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da0bf-c1f2-0a2a45010019-d155802de11a-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:53:36 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso47210005e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 04:53:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf8305dsm190937145e9.9.2026.05.20.04.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 04:53:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779278015; x=1779882815; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG4KY/LtA+rmaeWfv89MpY7etKVt+G0tiI317PH7v6A=;
        b=atfKcIwbZijwFTx2iegJXDnSMcT1t5imeMxuK0w4le5tnRsU2VsaNgxiDMYTNmEKDV
         7z5BT+1yar6EuwPEG4OA9OBbfTu61K6bHunXv3JiWhlRWTI3pw4R/1K8v+LxCGMYi1l4
         T6holSHYgKlhw1iezcJ1TfI5qMXKrdUfuz3XQLVPvVBrH8UEHTia8IZeSk+W6dM1NKoH
         bPOq4EPKA9DbXO+Ovx4P4f4HofRf6VTw6l+A7OVSwGbL8fNOsxny1Z6sr4JttKbIVtYa
         b7lvxnKfpvEUrGu8XpYjo0WgW6fOtH1irCKRrpvkiwdgGagbKqmgdWZkUnmmM+OS/2RG
         3MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278015; x=1779882815;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cG4KY/LtA+rmaeWfv89MpY7etKVt+G0tiI317PH7v6A=;
        b=UUkXsNDMAcfdYdaNqbEcla1w5qYyxJ+oYGZuiVk0euHp/Zf/CSmgxqdbMOL7xstp2u
         5LJzK91+131NUyRdoEaC/e0OW0UwvN1PhtejtIgR80RX1N9zAdETW0lHDH5ed5OMW2OA
         Z7EeSKiHk7Vyqo8WcZMxMlJNy2xQrRLC3rfp+j6HimaaJ1Pt9jPx+O8MEFDrDStwX66z
         uZ/GWO98zgDpT2RjZbzgHhyd1kdFI6PiyqTtk4lRXpR6c9VD02jNf8v3KlqP7THIUgYE
         2AAdAbOHIMNckvfwGO/MF1hJC+d7bJnlR/h7/Qxqw38IC4qII6z/sOscTR14+YUonutd
         W24g==
X-Gm-Message-State: AOJu0Yz6fFstMkyCkSGKO324kwSScFt4VUgJ4TFPip9bZI82uwISFxTV
	gogXttZTZ0hJjg/I3T9ZTKTsE4ow+aFIVhhdJmHuhY6l7ih3xWKIMWorwuURMoWkiYBOhnBfNqQ
	zVXc=
X-Gm-Gg: Acq92OGo0YGPN67pIfbddvwfW8qtC9Q7mI9OZ55V0IVmB3eZIkuVsIPDu8rLBMal5KY
	p3C7BNgElyUGFfw7iEp03RHP9zU6fAcvDG/R3IerdrYG8jUBZ/GR7zmkHGniLry1eEPvrljaXSV
	e2gVOVn3mERxXcEsNHsrkTvAHlAp9BZIIfp3RZpqsNqKChmpbTJJ42IYQAR8j9LYIe/W4JvswQq
	DnyfwTT1HE6/ms2FZYkgkdTM/ELUaUeNS9hqo7cWk9xlaplBStrpizEj+o96Y+n6vnoH2NYLPkm
	QAWpacRmb9EMsnuE1nFXcJfxWCzZcusfVE0REtyf+Bx5qxTMJQ/Zg9dA/W7er9AWW1+KD8zJknA
	FhYQf6iCkw1hNP8dADcx41RE3tu9prMwYe/iX5YbZbBi7GZ9GbgocpQJCCV8BlaWhwOvHvvyqMq
	yOTjYkC+NSa1wfahQ4ZBdlDidBIz0Wn4qk8UdoiLj2KaVomgJXZShH0mXCPtwkp/uAuDgIct2RJ
	wogqMzx+ZBAMNw=
X-Received: by 2002:a05:600c:858d:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-48fe651c8b1mr250303605e9.27.1779278015521;
        Wed, 20 May 2026 04:53:35 -0700 (PDT)
Message-ID: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
Date: Wed, 20 May 2026 13:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: do a 4th linking pass if necessary
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
X-purgate-ID: tlsNG-d62444/1779278016-B715BFF4-15E5E2A3/0/0
X-purgate-type: clean
X-purgate-size: 3148
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: CD32358D037
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

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -99,9 +99,20 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
+	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
+	then \
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
 

