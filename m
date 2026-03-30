Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIeLJHUsymkA6AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:55:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A8356BBD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267270.1556805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Sz-0008DE-Gs; Mon, 30 Mar 2026 07:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267270.1556805; Mon, 30 Mar 2026 07:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Sz-0008B5-ED; Mon, 30 Mar 2026 07:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1267270;
 Mon, 30 Mar 2026 07:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w77Sy-0008Az-Ba
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 07:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77Sx-00A2em-Nt
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:55:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2c5d-bab6-0a2a0a5309dd-0a2a450adcbe-28
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:55:19 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2c67-1772-0a2a450a0019-d1558030c50e-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:55:19 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso36351445e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 00:55:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487386b005asm29210625e9.12.2026.03.30.00.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 00:55:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774857318; x=1775462118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NAGOEhf3CF+pHz0pCD7Od2vAPDHCDxzURBNlexotl5U=;
        b=BqDdomYppQOPn/Z8dKS0WWpNVMqQwDJ/MvP87iI/icthfvpuU7B1Fz5fzsSc31krwE
         CShUPyr6WF40n7U+jZWGGfI43+MOYUnX1kPkbERsH0ZxoG45bgv36+bfpSp3fb5skrXR
         LHxpXG+xkavddq1n+fttEY6kirmWUPBLS9cCkw3vBZbZElFPqy2hH8xpQVBs0MrtAt7q
         v0M7YB2mT0KhYl/f/iX8lV8LA04iPXvsTtoHjLLDTlKvKAqGEMN+I1k9AU/286i7xqE/
         JxaHARFoQoAtC5WGZGXFzKx7snFI0Jo5hHmohfTnL33xupVMMxT1yJUFK8JdYdupHnDs
         4pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857318; x=1775462118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAGOEhf3CF+pHz0pCD7Od2vAPDHCDxzURBNlexotl5U=;
        b=FdFSza/tGxh0reiDFuH1JmvH2ilDQFpu+7k0O8KRHROnzODrl5GcF7/l1ZiA3IJlnY
         Car7bDvhJA4p52nCFExfHUcsqvT7GFce3IXnInQ3fYh+6Ewu6F2ysB9D2hAvNjvZjw9e
         KknHgwfVM4faqzdaaPbRsqA0OgvbBbzGeALculy9BS2iGziZZ42jVGgwoBA5Q5I5Qt8+
         99GSB2h83UJqnsFc0t9JvsyM1bSxo76VE5Ry0/8C/EY5Y/7Hzcf4gLrI0jTttfH7K3FK
         MhDk3YPKXC/+04kfOThsvzo5kamXaQaZnbXMsnqY3r9u+ywMvh+E69QJJwdwN8e86fAA
         O88A==
X-Forwarded-Encrypted: i=1; AJvYcCUvoqifmutf3MygWJs9x4Ulq5MD/tXhGl1ZGv2W42LO8QYCaIndcBkYR/+KW0tS6QzTOMl3h7SFPaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTeKouHFj3pYZMWtN34sbVLhEeyJ21QSK0nntipf23ddY36H5h
	SmHwkMln7BN0+gltsxZPjnvWzE8EBFPnv4+6yKNIr7D4uTJWvOBGNY/cFIRKVBJFEQ==
X-Gm-Gg: ATEYQzxtYA2sHCPRhqDLt63P2d52Y2I7ozzi3pKi3XjVxDkOgAWJpYxkZh1cpAJFLJh
	mEpjnR7BWfm6Tzia6vvaPl9fn66qj/xxiMhpcqLnAKRZ7kTiZrN6liQO65+Rr4Ho/0g/vgqHHWP
	ZO8f4eNuoMdzS4Dw5aO0/UsqmweqhNpYGa9ig9MrvVjGRzOyDnrBhzqamI6UqzSXVJ8QYCSVYl1
	xXJSQHhJB0tS+ez9wuVgQ+yrFcr6vPwipyJy/BJCL6MbypFdTpjaEeKrXM6OttNOfxO1DKYBhfp
	GnbeqLthQxW9u2oRJm/1NsbetL8IOK9gIxau7WeFTmq6Bkw46pTAfVa3kYeSQmFfslyvEyfJcKs
	dOzhZjE+RN22RiJc03UTiWk2P6a+TAq23RZ9Gu+IUsXiNt8BQaR0GSLuyKzu+UzbVv63av+CbZP
	bqt4AF1i2lhor0b6oYy3exikmvLw1crENcEtElebzU0Rlj8NCxMm7rR45RC4IJYCoDxn7LLWbrv
	gSvh7HwSR92tyU=
X-Received: by 2002:a05:600c:45c7:b0:486:fc94:d8f2 with SMTP id 5b1f17b1804b1-48727d8b80bmr181913825e9.14.1774857318539;
        Mon, 30 Mar 2026 00:55:18 -0700 (PDT)
Message-ID: <becb1850-e068-4063-ab7c-d2edb21471cd@suse.com>
Date: Mon, 30 Mar 2026 09:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/uart: uniformly set ->ps_bdf_enable for all
 PCI serial devices
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260327135420.7246-1-roger.pau@citrix.com>
 <20260327135420.7246-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260327135420.7246-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774857319-BFE9D900-D1A89583/0/0
X-purgate-type: clean
X-purgate-size: 1213
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DE1A8356BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 14:54, Roger Pau Monne wrote:
> Auto-discovered serial PCI devices when using device=amt|pci won't get
> ->ps_bdf_enable, and as such some of the logic (like making sure the
> respective BARs are enabled) won't be applied to them.
> 
> Fix by unconditionally setting ->ps_bdf_enable for all PCI serial devices,
> and removing the special case that was done in some places by checking
> whether the ->bar was set.  This also allows simplifying the logic in
> pci_serial_early_init().
> 
> Fixes: 9738db88f68f ("xen: Automatically find serial port on PCI/PCIe and AMT devices.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one suggestion:

> @@ -1335,6 +1335,7 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
>                  if ( param->fifo_size )
>                      uart->fifo_size = param->fifo_size;
>  
> +                uart->ps_bdf_enable = true;
>                  uart->ps_bdf[0] = b;
>                  uart->ps_bdf[1] = d;
>                  uart->ps_bdf[2] = f;

Largely for the look of it, perhaps set the boolean only after having set
the covered fields?

Jan

