Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFrHKzq8DWpT2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:50:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890758F141
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313978.1583993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhJL-0001TC-C5; Wed, 20 May 2026 13:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313978.1583993; Wed, 20 May 2026 13:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhJL-0001Qr-9L; Wed, 20 May 2026 13:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1313978;
 Wed, 20 May 2026 13:50:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPhJJ-0001Ql-Md
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:50:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPhJI-00AUIF-Jz
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:50:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dbc0f-2eae-0a2a0a5409dd-0a2a45089730-2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:50:08 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dbc10-63b5-0a2a45080019-d1558032a409-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:50:08 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so36200935e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 06:50:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf8305dsm194507585e9.9.2026.05.20.06.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 06:50:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285008; x=1779889808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZ9lCyVH1EXRNroQFJ1fse/T5OyZlgaGaj8jm+Tv6j4=;
        b=HUJldVWrmQa/QzA20m6P8azDebr9GOPPx+i52/ChECImRj1c8bVXnMYuelFXOgdYbx
         bR7lgpFbc0hp0OXw8e2tPXy1QSQLjM6KOGxZGXlW1Fn7vhuPjFwIa0WB1P4+tWtn07BK
         izeXR20BuAHaEhQKBJo/ZfAj9nt5cWvTrU0Thr9ClaalZyzr7wn9BZaeolN8OEmfAk+0
         IAGsYszNVxImnhS170lPssTRMBATbaY2i/5ey+XB/3v3rMfdXboEv2acAKtSA+voozE/
         gNLepQ0AtyBPNQBToeKE0wqpwDB89YvrpsW7c0skYPaXDR+JNyjBawkeTz1Z7oSwAiYe
         2DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285008; x=1779889808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ9lCyVH1EXRNroQFJ1fse/T5OyZlgaGaj8jm+Tv6j4=;
        b=p+SIdRTNXI0PF7SEV46PxulkoDfswf9E2vIpJIibK+O1xvUGH7/f2ck6Ch9V5lceid
         MRAXok7fdtIR0VR86C6SJZc+fd8d2ofAzfyL/1yzx7vYeY6Mt/W9XITwu+aIk+Tu+V7k
         Rz1aXWt1RgNU2i/hSgkpglZZmIINl2opqCg1rRE4OG/EAlQa+gWkb6GpZsyndpts/RLZ
         SzGDR7d5++lPWagkBz4dNHnJbQ+GpWW0DRhfA1tp9nTk5PFEN59saq3IHPXDa4C+ly+V
         ZqE+0djJGdvFoslu99kIbZLHWrQxu9x3uAnrd9oNupLirLjXL2onbQZ7w3dIZb36uwMJ
         c92Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aW/IifiTh2gzEGIkIUr+hMU40DLo7Em1gk8MVKU0eoECeNEpruR0zw8SoFvDZ3TE2thYFNMCoApw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyLnxFMoPYCmDfgRGSJjF4Z1otUqnV/WgrvGaxair6MbxHdyB6
	55P22ofyACD8HrWGb/uFTXl4/0OqslejYuO1bEPmDTx55raL6OnHpMVsaWySow==
X-Gm-Gg: Acq92OHAZfdGZjA3u6b3dl1QCXYjeY0A7PnEn0c5Pywcnxor1s6P35fVpSlkm47E/Mi
	1sVg7tJYMYEL9wCGQPF+Yj/JK0ESLhOXPSeyQ4s8RmI6Gl5yNcppFOEgdXGxpwr+hjP0UPthhjD
	NK2H0Lf7GHml7JtGoIzfLgc7HZHyt0JxCTdmdMpKjWHMnBO+hTM+cbgG6joQkr0BCmzu0ztLn6e
	PyyntAjR1OpRdzzJAT8YBGp7ZbbtaEHTQMjg1QwG/K8fmNCtdsCLijQ5RX05GDdaMv7vqeZW/zW
	BbAl484iNifbd7+XcdIfmp7BfTRbAbCQh4FkCSsQ03SFjljv1Ff8MPNHSaKqwm4Ofb96q3yOizy
	DXFFhEZpsWGQT2cZGPVL3qVZtwU/N102aVcLplaEiexWBeutkwaySeXtWADXl3GkT4mbCaz1k7o
	kFzI6H6i5pw0hvvl0mm9h35XxMREowpqCmcaP0KKYz72ZEjm2S8bpALXEu+JyayT8IG9hU3tiGJ
	OU=
X-Received: by 2002:a05:600c:1d09:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48fe537fb44mr314284825e9.11.1779285007760;
        Wed, 20 May 2026 06:50:07 -0700 (PDT)
Message-ID: <cd7c7b48-16db-456b-b38a-5f7e8fdb43c1@gmail.com>
Date: Wed, 20 May 2026 15:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: do a 4th linking pass if necessary
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779285008-BCB64DB1-27313756/10/73395122804
X-purgate-type: spam
X-purgate-size: 4903
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,gitlab.com:url];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2890758F141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 1:53 PM, Jan Beulich wrote:
> The .rodata growth between 1st and 2nd linking passes may affect the
> number of stubs the linker wants to insert, which in turn affects the
> number of symbols. If symbol table sizes change after the 2nd linking
> pass, insert another one before the final one. (As a comment in Linux puts
> it, "In theory it's possible this results in even more stubs, but
> unlikely.")
> 
> To use the $(compare-symbol-tables) macro in a shell "if", it needs
> slightly adjusting (and then wrapping to be run in a sub-shell).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There's imo no good Fixes: tag, since (aiui) stubs (veneers) may also be
> inserted for reasons other than errata workarounds.
> 
> For context: The Cortex A53 erratum 843419 workaround in GNU ld comes in
> two flavors: In the general case a stub is inserted, but if the problem
> ADRP can be replaced by ADR (i.e. the target symbol is within ±1Mb), then
> that's preferred and no stub is needed. The addition of the symbol table
> data is what then results in the stub-less form to no longer be usable in
> affected configurations. A possible countermeasure could be to move
> .rodata ahead of .text. (Also, from looking at generated code, it may well
> be that newer gcc simply avoids producing problematic insn sequences.)
> 
> Linux simply compares object file sizes, but I consider that fragile: A
> change in size of one of the symbol table constituents may not necessarily
> change the object file size, due to padding which may be in use.
> 
> Once we generalize linking, we may want to introduce an equivalent of
> Linux'es KALLSYMS_EXTRA_PASS as well. I don't think doing this right here
> would make overly much sense, though.

Probably we want to have the similar for RISC-V. Not so far time ago in 
downstream we faced the following issue:
https://gitlab.com/xen-project/people/olkur/xen/-/jobs/14389897308

Unfortunately I wasn't able to reproduce it locally and it was only on 
CI but I suggested the similar to this fix and it helped:

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a1124eb5d072..72b9789cfd9c 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -52,9 +52,15 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
  		> $(dot-target).2.S
  	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).2.o -o $@
+	    $(dot-target).2.o -o $(dot-target).2
+	$(NM) -pa --format=sysv $(dot-target).2 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).3.S
+	$(MAKE) $(build)=$(@D) $(dot-target).3.o
+	$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o)
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	    $(dot-target).3.o -o $@
  	$(NM) -pa --format=sysv $@ \
  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
  		> $@.map

The fix wasn't sent as after merging some extra patches on top of it the 
issue just disappear.

> 
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -99,9 +99,20 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).2.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
> -	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
> +	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
> +	then \
> +		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +		    $(dot-target).2.o -o $(dot-target).2; \
> +		$(NM) -pa --format=sysv $(dot-target).2 \
> +			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +			> $(dot-target).3.S; \
> +		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
> +		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
> +	else \
> +		ln -sf $(dot-target).2.o $(dot-target).3.o; \
> +	fi
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(dot-target).2.o -o $@
> +	    $(dot-target).3.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>   		> $@.map
> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -65,7 +65,7 @@ define compare-symbol-tables
>       $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
>       ln -f $(2) $(@D)/.cst.$$$$; \
>       $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
> -    rm -f $(@D)/.cst.$$$$
> +    rm -f $(@D)/.cst.$$$$; \
>       diff -u $(1).sym $(2).sym
>   endef
>   

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

