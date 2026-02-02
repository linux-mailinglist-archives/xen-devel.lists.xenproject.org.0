Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFQ9Mp64gGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:45:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25910CD8B7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218659.1527497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvBM-00074w-J0; Mon, 02 Feb 2026 14:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218659.1527497; Mon, 02 Feb 2026 14:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvBM-00073K-GF; Mon, 02 Feb 2026 14:45:40 +0000
Received: by outflank-mailman (input) for mailman id 1218659;
 Mon, 02 Feb 2026 14:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmvBL-00073E-Hj
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:45:39 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d634295d-0045-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 15:45:37 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-481188b7760so29782395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 06:45:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd79c7sm420044665e9.2.2026.02.02.06.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:45:36 -0800 (PST)
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
X-Inumbo-ID: d634295d-0045-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770043537; x=1770648337; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nGr+7R2b2rHqV5T/fNM944XxuEAEmcna2uqJ574g+A=;
        b=EKGgy4B6D+lctw8RKWgKfZRy3NFzKd85MObMXbfhC3bWp7DHR9Mvqj8mHlMMcb7yvn
         1zXNtD0fNVL60taLRXqygQSdMupdgEfCU18F7WxkBNl6cayLf5io47dNytWHoSZFxUpo
         6A5D/AoA6vGN7imQSUvQSCZJzdQ6xHM4PKDVbKGUkxuMrSenn5FF7whbKpQXYNViJznq
         gD+2CWa2n6PKdyGRX216jbtxBSrvBB+cmMowvJK//s2YGTVHsoYRKhX1Xxq6JmJRVJ3G
         zJdpY4yFpK8The62RH4lgl1CTWfY3iU2E4l+Ur3luWpIKztU1/fjTsEHWDp2YUxLurJF
         dPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043537; x=1770648337;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nGr+7R2b2rHqV5T/fNM944XxuEAEmcna2uqJ574g+A=;
        b=Ey10rmelqKuqZ9dad4uqdvTSSL56Y9lyqekbDxM/0iFmUOomxH2iiBSW02d6HmZOxJ
         Qfg0bwoBkq9gGWlAMX1WiWs4ufFabymydhQGHFiCflW9Y5lucFsAKJOkYmWDBKv2Qki5
         RY6uxYpeJlXDvH3R2IXfFCVo7qcocomC8fhMgCPOqIabJs8pWx4Uu8mkOCb++0IeGlA1
         uS5sj6y/drjmOGhor6bPbovzk3SYLhw7TAgrbZ4TDiicl4WgO5Vm4xrGZAMg60h1LlG/
         H83+0QTD55aB3qq/ZtL+LEPt2DgtS4Fn9Ln8C4lgaX0zHw0+bo0NiZS/O1N3hcgoFeKP
         pKpA==
X-Gm-Message-State: AOJu0Ywim+vakrWe11sVZ+qlLc8IUGF8rQdb1IS3exsQZBjgwux4MqXL
	NDueXqFX87c+ZflxCkB2+rAMufnSdzNfrHgUOnwulVO/g4r+/DVtMnjWkLSWMX20/uXALUEmsBE
	gWVnLZA==
X-Gm-Gg: AZuq6aJedB6dL4tmWkL8lfzJbZjssa/SghmUIiVujNEw1nIAl1I7AmuKBMKFhGTqoiW
	jfiDqH1I8wusasdWzZnNrNm+rvu+sO7KYFR57nA51uOxR28cGdlZYVMSGUfPFxpa80Jhd5YRJkv
	bzJWaqMMYhT50tSuxxhWZehCtuZssGOaRfdbvvuwN/fbq9z/bwUCFftBDq0FN5tzPorMj8mSlc/
	UZlorafAwb+CqwXbOFZkVc87U2UIOZ4TIwNrGIhAx/XFOu9pYln4Mjh4YJS+y5/ee+qGBxbMF84
	pUbjOi/AiUpMA4S6Cv3w15Wdn9iZLvafUvC6HSTVqs78H8NWRaiDMOW+3khabcYqvLVoHHPJRwo
	zh4oofUY+jFzaJh1N3oilz9VNxlrxQGicTXBuy5NnBt0RJXIO6+l0pHz4LtHCMHNfzjAuro1UTJ
	wMAr7StTpupPKB8Ck4NfLbMkYx56D2gT7j8v4TktrwjDfWjiZrfYH82hlhg2vDAvx9YQeSSl6yT
	8I=
X-Received: by 2002:a05:600c:1da8:b0:480:3a71:92b2 with SMTP id 5b1f17b1804b1-482db498227mr143291735e9.26.1770043536551;
        Mon, 02 Feb 2026 06:45:36 -0800 (PST)
Message-ID: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
Date: Mon, 2 Feb 2026 15:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,raptorengineering.com,wdc.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 25910CD8B7
X-Rspamd-Action: no action

Extend commit 1df11ccceb1a ("symbols: check table sizes don't change
between linking passes 2 and 3") to other ports as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -99,6 +99,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
+	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -26,6 +26,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
+	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -40,6 +40,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
+	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \

