Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mPZOEpR7Qmoi8QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:05:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8426DBB76
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:05:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=E6OtmM+q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347551.1605387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCb7-0005Qr-9c; Mon, 29 Jun 2026 14:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347551.1605387; Mon, 29 Jun 2026 14:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCb7-0005ON-64; Mon, 29 Jun 2026 14:04:29 +0000
Received: by outflank-mailman (input) for mailman id 1347551;
 Mon, 29 Jun 2026 14:04:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weCb5-0005OH-Fj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:04:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCb4-00Eh4E-Fb
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:04:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427b65-bab6-0a2a0a5309dd-0a2a4507ecfe-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:04:26 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427b6a-9c8e-0a2a45070019-d155802bd47f-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:04:26 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so3284125e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:04:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee018e8sm56339591f8f.11.2026.06.29.07.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:04:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1782741866; x=1783346666; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4G2OwLSHE6n45kGiXVWp6J7Yjg7l1Wx7bQT/tnmiD8=;
        b=E6OtmM+q7Ka22/QGHDxNxLp/Hh1K17Ay/5+GmMnC8c0X28loL4cLJ6gpdJSQCBOsc7
         z3OBO+D88QCjMr8oEdaRz8tW8QpjhxdeJBhZE5yq06KM5rghwaYGz0cNTmtwoBZNtmWl
         exMPTYUTgvL2HVb5iwvgbw/T+NWA2sHy3x4KfTqxqz3iEYuJFXljbvbfZ9b9z2rB+52d
         3RxhMisdrq3JIDOk0AWwIdCy10kOKzVW3dB692zmxIS+QxBXUrf0AuIpWkdvAYdjrjUi
         3OaPEb9hk05/f6ogUn1QruAIIR0udy4UbU/yscb3iWg7R9B6nEmdev0yQVDF8g6VioqE
         zhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741866; x=1783346666;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4G2OwLSHE6n45kGiXVWp6J7Yjg7l1Wx7bQT/tnmiD8=;
        b=RN995Qmv5o2OIs/rc2tG48vCFCNiQIjruyCuXLJQyP9GfyR0V8sRwOlSRIecapZ8fp
         h/B2KqSLfI2JiIWJtc4onmF/Bb8jMX+PvixPYhFsCNxoIgnZbNTCh5EUR+Sb6m5enG9I
         PJOPpydgp+4O8c2FduSTsxrYj1Aili7OjyVijPmGs0+ZBFAXr//z/xrP+L7yHLfUmWGq
         Ppk+/mnznICpfD+n2epeADS8cpeGUa4MEoZs8rCBRjkn4heivvapnAEhK77VBxmeZFsL
         n/q+fMPLiu8wG9DnghRuSicxL2jrc8eezZScoaL7NofC5P1/VpZoiiVsZq5BydnRxaNq
         Hsqw==
X-Gm-Message-State: AOJu0YycTRjaiQcOaL08cpfxuCcISbKD9sycvROYLcgd89FdEu/J6rLL
	HxI4OhxTZzMGD6WsIq7O/l+QdvefRcFspEqE+Z6OueNEY3BMBIgDFZfbnmd3BOOeL+7xajEwSfZ
	EEcb/IA==
X-Gm-Gg: AfdE7ck+aMFS4ggQASjE8+tHJA8FB8WGLPH3wPucnU7aghVzcVJOdtvq62gIhDPb9rY
	mPgV/YUHC/WjJV1581ad+3wdLJKCVgOWCo+VedKAu6p+P23J8wYfmYmMbbCiqKox0JF2QxE+QrL
	F3lPK5LxoIsuMRT9Y99yZa2iPFlQWSPJ7pk285MRwotXCN4XnVhj7wuVk5sxU7507UZ5in2jSbT
	Ri5dXjVVV7cpKTPAksaNFPQD9Izg8yd0ILf6jfTFZXjhRnPI5/HZdvId8R+/XoAsPtl014If1g8
	99A4MNSfY6vb9qzh/CAPgCa04zsQNAqcoKh8U+ghnzCxnwkbj+5rgzdf6HO2U6XrhFgWK/DW2G3
	jT6eiOG0p3m9RDuajrDazifoFOtRGOS8lu6gSn/4oZY41/pN6OQiNZQ/34VlqreIIMFLsxXIeAx
	q5sGzUeIOOJGOz5cwvge6Y/jYRpNGUy3+Fk7hNEKZCAiOBru9AD0cQHeaVgkz3a/QDIJwl0HXJg
	CiR
X-Received: by 2002:a05:600c:8b53:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-49266864977mr252118535e9.14.1782741865687;
        Mon, 29 Jun 2026 07:04:25 -0700 (PDT)
Message-ID: <30e8d5e1-9b06-4327-8cf5-6eee2d234896@suse.com>
Date: Mon, 29 Jun 2026 16:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] console+serial: don't open-code IRQ-safe locking primitives
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
X-purgate-ID: tlsNG-ef75cf/1782741866-7FF3525E-4458C0A0/0/0
X-purgate-type: clean
X-purgate-size: 2006
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E8426DBB76

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1010,8 +1010,7 @@ vprintk_common(const char *fmt, va_list
     unsigned long flags;
 
     /* console_lock can be acquired recursively from __printk_ratelimit(). */
-    local_irq_save(flags);
-    rspin_lock(&console_lock);
+    flags = rspin_lock_irqsave(&console_lock);
     state = &this_cpu(state);
 
     (void)vsnprintf(buf, sizeof(buf), fmt, args);
@@ -1047,8 +1046,7 @@ vprintk_common(const char *fmt, va_list
         state->continued = 1;
     }
 
-    rspin_unlock(&console_lock);
-    local_irq_restore(flags);
+    rspin_unlock_irqrestore(&console_lock, flags);
 }
 
 void vprintk(const char *fmt, va_list args)
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -76,17 +76,15 @@ void serial_tx_interrupt(struct serial_p
     int i, n;
     unsigned long flags;
 
-    local_irq_save(flags);
-
     /*
      * Avoid spinning for a long time: if there is a long-term lock holder
      * then we know that they'll be stuffing bytes into the transmitter which
      * will therefore not be empty for long.
      */
-    while ( !spin_trylock(&port->tx_lock) )
+    while ( !spin_trylock_irqsave(&port->tx_lock, flags) )
     {
         if ( port->driver->tx_ready(port) <= 0 )
-            goto out;
+            return;
         cpu_relax();
     }
 
@@ -94,7 +92,6 @@ void serial_tx_interrupt(struct serial_p
     {
         /* Disable TX. nothing to send */
         serial_stop_tx(port);
-        spin_unlock(&port->tx_lock);
         goto out;
     }
     else
@@ -112,10 +109,8 @@ void serial_tx_interrupt(struct serial_p
     if ( i && port->driver->flush )
         port->driver->flush(port);
 
-    spin_unlock(&port->tx_lock);
-
  out:
-    local_irq_restore(flags);
+    spin_unlock_irqrestore(&port->tx_lock, flags);
 }
 
 static void __serial_putc(struct serial_port *port, char c)

