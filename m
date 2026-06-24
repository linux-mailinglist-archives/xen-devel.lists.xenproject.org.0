Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1HWiIoewO2p/bQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:25:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FB6BD51F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:25:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=a33kOerQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344743.1603777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKme-0008Uu-EX; Wed, 24 Jun 2026 10:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344743.1603777; Wed, 24 Jun 2026 10:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKme-0008SZ-Bx; Wed, 24 Jun 2026 10:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1344743;
 Wed, 24 Jun 2026 10:24:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcKmc-0008ST-Vd
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcKmc-00A9vq-8d
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:24:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb058-e002-0a2a0a5209dd-0a2a450ac7de-24
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:24:38 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb065-93a5-0a2a450a0019-d1558035c878-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:24:37 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49261a64cf4so2358255e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:24:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff8a9e3sm477426835e9.14.2026.06.24.03.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:24:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1782296677; x=1782901477; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ja8EJuT5dddOpzh43korIk28eBQzrvbn1QNlQbKGL90=;
        b=a33kOerQTocOifrREBur+V4XVH4vfLo+jXBva1Acoi9adcbaQWB2uU7Q1ZhPGG5Frb
         8s/PjO3YMqjATb+PBYMuTnOA8qIvUcW5D7AIrtT3m5S1nncw4TsP6/3Nk6suIwZHfnOm
         gTH8ZU7nqAfxYjXS2FlbEHSNA+5xI9JGLnRVqVEFLPkWbR7IcuTC6lucGYjFqI5CB7VL
         ePXnoVFyEAPjEYaufncrMi8zN9LxEOYCFcoqhUJQ0xb19x62b8X0AgfjFKbyA8nDM+jn
         bxQSUK9+v4Z5L1E3olLozb+S4iqElIFPtPwTwAKw3qKsA+304zPnvCP0PxItpxrgTR/0
         hzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782296677; x=1782901477;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ja8EJuT5dddOpzh43korIk28eBQzrvbn1QNlQbKGL90=;
        b=PCKaqA/+2+JJWec2ae11qW1PmK+Tg1rj6mfcyuAAStN5AnoV92CDcP+RDbay6YDYbx
         UzI0pCGHcpWgBuRRd6gh3LCxCWREL5Kjk/Sx74qApUxoMN0kRyIRGWheYsVlpBA9Kgjr
         wLvT5jWrEfimbI2xY0NXbwF2K0Yw19ciOeATBDwBrdx2ZVAW399gtuUUQDDUrVWFIpO5
         0AswYKTI6D2aWQGEsKmbfofny7SuAk/kB+LMRKRwVknWUu9OxpTithk9RTiIHUQs0fDC
         Si5W/HfD7Ed1E+6aAlbrmN8xsJ4/ml7XzO+j2ZW+v6Q047IUJM8TyIR0F22dey9K2V84
         jaJw==
X-Gm-Message-State: AOJu0YwNYnxlRMj0WDnH/N7HZmpi464hHvdnnmxhmLSAHDYI1rPlL0gc
	1z4xmmn5O7l9Gigv+SiP4t3YDEzwjlrdAsktOg7h6OGXtPiex9mAZH1jYC9baxEEKlVtx+QUGHC
	q+hA2dQ==
X-Gm-Gg: AfdE7ckp9B0UI+fqo8RW9RsT7m1fgT8Z99s6ZAkKcQEqN1ny3tRcmIfVMWLFfm5+Mfj
	aNytz4+FrrWH8ipLCtPsryzpy+XRB7F6yh7xM9ccsllg6VldJhtxafvOoHpa15gCWvzhsYJoHoM
	eGYsxuBfGPllafdb23JOnI48HNjQw6aIdVVYSvpO0TLqm4bcgZVfE3d6kjNCakMUiWd6htsrR02
	5pItw/69zng4+dHTGxq35o5SWXHMVoNDv0v/kO3Pvle/u2oFhosUlS6wcCpROVpip5r1kdC8RiR
	2cJqGSzxHxCtC9Lf2x8dLYUdYaTgOMjSM8M4vTKE8GYSNgS3ve+A+TCL+pJ40bwtKHyEgToCp9v
	+i4H1mQMCteB9NCUkisZwcj6nbKrQ3fsVaJ9V/9vDFtsD9fFC4FpKaswQT150O2NPu2VzNW/yTX
	UAf0gT5TYwCMufYZg1PBBkHeO2UGgMal4kA19ybCGTLbO8bOajQswtmolWYxi0LibiOuejp44A2
	w6P/BdAN0yOXXM=
X-Received: by 2002:a05:600c:190b:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-4926086e4eamr39095235e9.19.1782296677472;
        Wed, 24 Jun 2026 03:24:37 -0700 (PDT)
Message-ID: <7fbe73a9-08b1-46ff-81fe-ddd6ed52deb6@suse.com>
Date: Wed, 24 Jun 2026 12:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22] x86/boot: don't blindly mark VGA in graphics mode on
 MB2 path
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
X-purgate-ID: tlsNG-4011c0/1782296678-2FBE3DB8-5B6A4503/0/0
X-purgate-type: clean
X-purgate-size: 940
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D55FB6BD51F

Setting ->orig_video_isVGA to the specific marker should be done only when
the VBE tag is present and the FRAMEBUFFER is either absent or indicates
RGB type. Since the "video" variable now starts out non-NULL, this
property was broken when in particular neither of the tags are present. To
move back to at least close to original behavior, add a 2nd check to said
conditional.

Fixes: d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable directly from C code")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -339,7 +339,7 @@ static multiboot_info_t *mbi2_reloc(uint
  end:
 
 #ifdef CONFIG_VIDEO
-    if ( video )
+    if ( video && video->lfb_size )
         video->orig_video_isVGA = 0x23;
 #endif
 

