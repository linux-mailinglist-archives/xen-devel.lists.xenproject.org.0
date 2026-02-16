Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDYiEn3bkmn3zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:55:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD192141B8E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233773.1537125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruNo-0004EB-Ga; Mon, 16 Feb 2026 08:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233773.1537125; Mon, 16 Feb 2026 08:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruNo-0004Be-DY; Mon, 16 Feb 2026 08:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1233773;
 Mon, 16 Feb 2026 08:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vruNm-0004BY-RT
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:55:06 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ff5f1da-0b15-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 09:55:05 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso45516595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 00:55:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837f4c46b3sm74913275e9.4.2026.02.16.00.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 00:55:04 -0800 (PST)
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
X-Inumbo-ID: 2ff5f1da-0b15-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771232105; x=1771836905; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUV1kn70x+tFSRvqsn/WF+CnPXJjpZikV7jL0GkLVDg=;
        b=fCkNc6V6Gpt9QRVAgMS+sTcrDV25AYFUsLbmdm1ZF/yAED0Xhok7umRQ9Yl16qwmAn
         RhTtb5yy/gprL5OD7y9Nfol+7X89xFyFjoZRb2lT+9VUhoRc5s2C+Vou45bE6PwzkHwt
         s8sPIzSB6eCA8CFg58arxaJslKk0OJo7k62H1JExFYjpjcdGDIe0XiUPeUY2PgH27VXZ
         8pdrcdbJ6hCU2VXpQLlcwNDi6QQbe4oWHNIaZXw7CNfGwxpfdBNmn6+5ApcfEtf0FRWQ
         V0zpL9qA6TVY2+4IVP9TeCXR6cAvvINR1Uhf5cKiffrJ7iNueNaLLuK7ti64qmUya4sj
         jQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232105; x=1771836905;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUV1kn70x+tFSRvqsn/WF+CnPXJjpZikV7jL0GkLVDg=;
        b=iTqkGjfHMifyLzid6WZnJ7H9Z9XcYClH9k9JYKG5B9P61D12fXudezT+kJNZ5PdX2U
         +gtY4DVVxenDn+BUDT19RSlJM/L5IPedCriK5fAuhRWcAdksQZ4uXFP3Sx2j3+BxXYzk
         Bi5yyoiY3HyGfvc5Z3gdYLXA1XdVkyZVFo5iGuRbs+l2PpGQQSXN1bVReo8od5iH/kCM
         TtaJpMNxXxVkDZNU/ijL4FCGXHGEckPRw0+6MDw1DxbMn4j95zBUti00nTv6wyKGNYqN
         XfK2tdGOuXh9+tsnXJVsEFbOhyNVJpe/kCT5lo8QRH4Sk4aoJqLqt75e7GC8+JOS57Jc
         BLfw==
X-Gm-Message-State: AOJu0YwVc9ZceFvQ0KmwlK6lrRK0eld1FRPM04Ow+dCtoxlcarOpJiz3
	jMrPM9/G+X1xHAz5KR9C3XJrLcMgPiOAGsbH74ixOepQA0yWvWSsiW/rpJsbvLUSkx3L0JaJCWV
	x5hk=
X-Gm-Gg: AZuq6aI4r4VhHPJkDPkI6WWkhFv5me0CKwCJ8Y9bS8mD+mp4iWYbnjmhRffML5/9hFV
	cv4mbbv+QOO8Cfip5XPWy4k9sFLhcULdMzloteiV+azzFtJmzn8AqWxwqVUXmogimXbvce6oCuU
	d02mPUSKU5V2rKEduqV8r9IWL3S8WSIAC52bGcWec7ENAdQViLJIJhzAUX7+gq6vovOF4NG8Cff
	zjvI6b6hN/FbBZXVPsgFV6BrfhsOIUYX7L9tRhI5pmm12cSu+Qa7penI8TGOW8LoyXRxBPC+2HB
	aH9qod67tz5KGlJJeBZL1x2rWrGEEcXklO/LvolRhyywok/tt6oLmqLxa4l2d+LBAdjZH7Bk118
	TkKwdrNpUwRheh9R/JveJGtn4sS1zmcMeQxZhYFTwV2IJK4E5NvnlalKXKUHcBBZzrAByZDk7FS
	IPYPa9yxrnD0sy4jsHP+2K/AAK4AiY9tPqNu0yxckaKu9g7S90iX/fYoeHulxg4gfwnTgy3q+eZ
	fWEZezJIS8yyD0=
X-Received: by 2002:a05:600c:8711:b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-48378d9d17cmr130752195e9.10.1771232104735;
        Mon, 16 Feb 2026 00:55:04 -0800 (PST)
Message-ID: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
Date: Mon, 16 Feb 2026 09:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
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
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:oleksandr_andrushchenko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AD192141B8E
X-Rspamd-Action: no action

Both decrease-reservation and populate-physmap can succeed partially. For
the former this may be pretty unlikely, but clearly the latter can hit
both out-of-memory conditions in the hypervisor or denial because of the
allocation exceeding the domain's allowance (there's no interaction with
the balloon driver here either).

In gnttab_dma_free_pages() we simply can't give back to the system what
hasn't been re-filled with backing memory. For gnttab_dma_alloc_pages()
both parts of the overall region need dealing with differently.

While no present caller of gnttab_dma_free_pages() checks its return
value, also don't use -EFAULT there: It really is an out-of-memory
condition. (In gnttab_dma_alloc_pages() -EFAULT doesn't look quite right
either, but I couldn't think of a clearly better error code there.)

Fixes: 9bdc7304f536 ("xen/grant-table: Allow allocating buffers suitable for DMA")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm likely screwing things up, as I can't understand how this is intended
to work: args->dev_bus_addr shouldn't really be in pseudo-physical address
space, or else the address isn't suitable for handing to a device in order
to DMA to/from it. Hence using __phys_to_pfn() on it to then hand the
result to pfn_to_page() feels bogus. Was all of this perhaps only ever
intended for (tested with) translated domains? With the uses of
xenmem_reservation_va_mapping_*() only being masquerade?

Furthermore the allocated buffer ought to have been contiguous in
machine / DMA space. Yet the way it's re-populated upon freeing of the
area doesn't guarantee that at all.

All of what is done assumes dma_free_{coherent,wc,attr}() is capable of
freeing piecemeal. I only checked dma_release_from_dev_coherent() to
fulfill this requirement. If this can't be relied upon, please consider
this submission as merely a bug report (for someone else to fix).

--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1095,6 +1095,28 @@ int gnttab_dma_alloc_pages(struct gnttab
 	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to decrease reservation for DMA buffer\n");
+		if (ret >= 0) {
+			/* Free the part where decrease didn't work. */
+			size_t done = ret << PAGE_SHIFT;
+
+			xenmem_reservation_va_mapping_update(args->nr_pages - ret,
+							     &args->pages[ret],
+							     &args->frames[ret]);
+
+			if (args->coherent)
+				dma_free_coherent(args->dev, size - done,
+						  args->vaddr + done,
+						  args->dev_bus_addr + done);
+			else
+				dma_free_wc(args->dev, size - done,
+					    args->vaddr + done,
+					    args->dev_bus_addr + done);
+
+			if (!ret) /* Nothing else to do? */
+				return -EFAULT;
+
+			args->nr_pages = ret;
+		}
 		ret = -EFAULT;
 		goto fail;
 	}
@@ -1128,7 +1150,12 @@ int gnttab_dma_free_pages(struct gnttab_
 	ret = xenmem_reservation_increase(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to increase reservation for DMA buffer\n");
-		ret = -EFAULT;
+		/* Can only free what has been re-filled. */
+		if (!ret)
+			return -ENOMEM;
+		if (ret > 0)
+			args->nr_pages = ret;
+		ret = -ENOMEM;
 	} else {
 		ret = 0;
 	}

