Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxv6M26MO2qFZggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363566BC575
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VmioH8Ie;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344611.1603670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcINR-0000pl-W4; Wed, 24 Jun 2026 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344611.1603670; Wed, 24 Jun 2026 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcINR-0000nC-Sw; Wed, 24 Jun 2026 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1344611;
 Wed, 24 Jun 2026 07:50:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcINQ-0000n5-65
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 07:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcINN-00EZER-Rd
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:50:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b8c40-bab6-0a2a0a5309dd-0a2a45048ffc-8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:50:25 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b8c41-5f9f-0a2a45040019-d155802fc46a-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:50:25 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso3538075e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 00:50:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fc47720sm761526755e9.0.2026.06.24.00.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 00:50:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1782287425; x=1782892225; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA8un9h+jkY6n7gmtcG4XWfupBVQ0yzKQ/x4j+dAz54=;
        b=VmioH8IeuirW5Xv2Xag81t/VCXwqwqU9hSBwu9BwMjL5xSdebSTm6+ho3M5zsunfLW
         RLD8cSf4GI6lOeVB/Hx9dtwTvSL6TQSHxwjdOVIwYL1NtyNPLc9sn+3AP2q+Ma5IGzl3
         BHekpOkeDtrDcFzgJKWbAGwTiu06y7ik7hqwH5fHd4e1YdrLK65uRYnT95LKuNqTJft/
         92tR8Rh0wpFz9Uj9i1EoOouhKZjPJj/8oYOnMEAq5E1zc72fjXhQn8tOgVT97pW4C661
         fvL38UCObOV+hM5IFjAKzxbS4U0GJ3RqFT6okJsaV32dMa6IGWvQetXfxlz7NQUPbh5V
         a6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287425; x=1782892225;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KA8un9h+jkY6n7gmtcG4XWfupBVQ0yzKQ/x4j+dAz54=;
        b=DpCFjKPARERtL7n7vYFLLDOSvNNL0yxmNFM/+c3l0pwD0lHyxHluj0/B16IP6y3RsU
         +JeYevJ+D61Q8SEeDgHH+LceGVCpE1Y6DlXScR9J4nIBXAVV0TG5qv8dGV5xetc9LkWX
         FAn1O3l3JPfyYfp0Sth7td1DeVW374rK2N53MmxRDYorNsGdeRrozuY14c5ZaujzvzGo
         zU95hzMU/UatqJChdXtmbZ1bxAK3SsxaUIUqu135YVMwBr1vCPtrqHXuGENdVKo2DTSL
         W6ST8RPnzmCgqj8o6XVgwMD3LGTVPWj63hBBObtTryPZ+Vd//vdQfA8lIfWZfh1/Sisb
         0Nww==
X-Gm-Message-State: AOJu0YyMv5lRKmQLTLE7/5Bknv9xNZyV2+PT6EfC9FZ2YAzfafmXVJv7
	Kv4LQ1Qy4oFPPMtcDfxgb2spVCNXCfn7SZDOYSVxo6HyT9CKlZCDDkdWC3LOckcDe/tgDevs/5x
	gEr0vyw==
X-Gm-Gg: AfdE7ckgiszcacUltvYRdRZp7pauXkMmRyVX4QyW0Rtj8HRw6LXl5UQS2yiCaHPod3g
	O4kTWuTVZmUaq9JTZ+ue7U1BcO8TG6kAMSVbtEgQX3F76eRG6faJxEolM9mz+dqN5U+yNZya3fI
	cgLHP4xL7Q5WNg2SbQi1Jl8QEaTGTx+uQ81j/J1I028TgkWRNqRuZgO4A3D6TpwCGjaMCsXbcHN
	VvEte3Umja9ZHGJGrGq8dU24f5SNT1H+I3JuITKxMTrnvg6hSFhTTS196Bh0icBnGQieM4ylWMc
	+L8QHzjnXTyNtDaExeHx+fkwbCHFYlHl2Tl5eaqD9U74bPTrSMvJUK5r7/6/s+e/ljQdJdkUKgQ
	pUnZPHM8peVSLyx2Y+WjU05sdgXw9EkmryGn1Yv+ejswGiceS92O4AaHEi/dlTPHptbpgUrFEco
	/+13LnXX9ul3utCdHOWMLzqa1BqTJtWkKUR3/DiFWEM7ZlIpeiCMKB2ExZnpvOey85nPCTPxmFX
	78LGEwp2ZMhTyY=
X-Received: by 2002:a05:600d:8499:10b0:492:5551:19c6 with SMTP id 5b1f17b1804b1-49260840b4amr20863895e9.7.1782287425183;
        Wed, 24 Jun 2026 00:50:25 -0700 (PDT)
Message-ID: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
Date: Wed, 24 Jun 2026 09:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: sort obj-<...> list of main Makefile
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
X-purgate-ID: tlsNG-ebf023/1782287425-46BD7141-816D53AD/0/0
X-purgate-type: clean
X-purgate-size: 1980
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 363566BC575

It is mostly sorted, but there are anomalies. Eliminating them gives
people fewer excuses to (blindly) add to the end of the list.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course sorting with underscores or dashes in filenames is always going
to be ambiguous: Some may prefer C locale sorting, some may prefer sorting
as if non-alphanumeric characters simply weren't there, and some may
prefer yet different criteria. But those corner cases probably aren't even
worth formally settling on a particular model.

x86_emulate.o coming rather late in the list may want considering to make
an exception for: It takes comparably long to build, and hence it may be
best if it got scheduled as early as possible in a parallel make.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -33,21 +33,22 @@ obj-y += emul-i8254.o
 obj-y += extable.o
 obj-y += flushtlb.o
 obj-$(CONFIG_GDBSX) += gdbsx.o
+obj-y += hpet.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
-obj-y += io_apic.o
-obj-$(CONFIG_LIVEPATCH) += livepatch.o
-obj-y += msi.o
-obj-y += msr.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
 obj-$(CONFIG_RETURN_THUNK) += indirect-thunk.o
 obj-$(CONFIG_PV) += ioport_emulate.o
+obj-y += io_apic.o
 obj-y += irq.o
+obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mpparse.o
+obj-y += msi.o
+obj-y += msr.o
 obj-y += nmi.o
 obj-y += numa.o
 obj-y += pci.o
@@ -62,14 +63,13 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
+obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
-obj-y += x86_emulate.o
-obj-$(CONFIG_TBOOT) += tboot.o
-obj-y += hpet.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
+obj-y += x86_emulate.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)

