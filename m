Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /i1hCSDGQ2rKhQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:35:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8716E4E83
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:35:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Iu339+yS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348896.1606689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYcO-00032k-Rg; Tue, 30 Jun 2026 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348896.1606689; Tue, 30 Jun 2026 13:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYcO-00030V-Nl; Tue, 30 Jun 2026 13:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1348896;
 Tue, 30 Jun 2026 13:35:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYcN-00030N-VJ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:35:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYcN-00GnMJ-7d
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:35:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c60d-2eae-0a2a0a5409dd-0a2a4502da1c-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:35:14 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c611-5a27-0a2a45020019-d155dd35b09c-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:35:13 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-472326ca506so1511125f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:35:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be10f669sm493375e9.1.2026.06.30.06.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:35:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1782826513; x=1783431313; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e08w0DuOUMUIX9feLYWpJ3u++g6ZMj/+ji8+sBiiDDA=;
        b=Iu339+yS4tlskhtthD5aRLZrw8eSsSPAmSdkAPhWQCD6pPOPMPcP8j/8gVFnnpAROr
         hca19bd9qVN2mL/TUpoIsC75et3z4hDCsuL1nibhnMYj+FW933Leyj3MiB1yvi4pMwIv
         ol/ueXDDTgZbTex83p7umo9N/lq+OEceGkCIX6SsudySR6ee0kcbqinAZvr+5ZRHnw3B
         eVqMH7DH/7aa4wGPz/r0OHYh8aI5H71GNJnAIh82BNuF2NBWsom8yQF/M1Pq67i4VB94
         SzXBFW3GBVG7Nq4IIEKZUzcTUzoncBQWrlUeYJcaJPMhPdEgKCr7FmPAgbs+sZcydb76
         /Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826513; x=1783431313;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e08w0DuOUMUIX9feLYWpJ3u++g6ZMj/+ji8+sBiiDDA=;
        b=ocvwpJsQt8unvYRBzINA76ZsW+nEPhjd8T4wdB+kKcr89jZuaDdT9nRoLaXX2dLDvZ
         BSbjP1d2c5jAMvTtlsBcF5SS/n2uKUkZ71x/g0yQlxxqbCSLnPn36citNez4WQxFWsbh
         Jc7mevH27RI0hImsMPkXDCHf1EY0qFLCwu461kwS3vNGUxnunp/Tssqkr70+cWcq8wkx
         YGQ18CPd0P0YMW80VR1RWfPRgMjoVDMeAGxDA+Uun8qHjTCOVy8pjoBFr89tyR906ZEX
         HRRBDO9eJhImiN2H6SShHcjpllwMniTVmDDPB8mJ8OX1R4tX55NOVivTJmlKSOP2XNaC
         iEjw==
X-Gm-Message-State: AOJu0Yzuj1tQeRNujQ5adXe7bX4skJc0mzDMwEhachBV09Rx3iYsPyi0
	Cnjc828NH480bghU7iBzb06lYyLTk0m7StTDqx7PaTtxhzA+mS3d3PIqUx/uaqSSF7shkUD6qrR
	vMdU/RA==
X-Gm-Gg: AfdE7ckwC7QpwaFmoZs7ppdNRVtczxUoHchllxQxSPwOF71mS18phnU/2ksbBsKW7V9
	dpR1wmoFcARhQGEgik5f5BULzXiEEopXQINRGVCEBgGwsBom+sGPNAs6K69NkjECwAbVGx4SLlK
	B84/me7tJOmXIBQIMrhNFEZ7c/W+D4bYgYrOdirOy00oCUf8sHwkC7hni1VLFtr0I4ZDwLF48r8
	dXMHQcKAt0RURANF814MhSXGPvAcCgDBW0rB4OPR/u25tcJ8SCGlHzQ1nAYjgnh469CCGnLuGCX
	WJzZPU9g/YAp6oqm2059hWDSIHYlwsxvq71qKZS2errqkdtGc5EzPb8ZRGYKcDk9+5MjCpYW3eQ
	JNA9hsUScm6Wy9qisboTkhuO/YUdI1I10eJCXCdmqwGioOcSd1MQMuPrQWJdib2nBLw8ZXz65ow
	ex2PDAP6qCu0aZhRDJBpacVpw33J8Al9yj5SaDNQfnqX+G/GxtVQ/xcvmURcWPIKbfSKy7p/gtQ
	GOM
X-Received: by 2002:a05:600c:46c9:b0:493:b24e:649b with SMTP id 5b1f17b1804b1-493b827c8ccmr59329855e9.6.1782826512940;
        Tue, 30 Jun 2026 06:35:12 -0700 (PDT)
Message-ID: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
Date: Tue, 30 Jun 2026 15:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: kexec is PV-only
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
X-purgate-ID: tlsNG-720697/1782826513-4D70D7C5-C99EBDE3/0/0
X-purgate-type: clean
X-purgate-size: 533
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: 7A8716E4E83

Kexec is of no use without its hypercall, and that hypercall is wired up
only for PV. Allowing that code to be built when !PV therefore results in
a lot of unreachable code, violating Misra C:2012 rule 2.1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -22,7 +22,7 @@ config X86
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
-	select HAS_KEXEC
+	select HAS_KEXEC if PV
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI

