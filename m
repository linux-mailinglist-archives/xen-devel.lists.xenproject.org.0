Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IewKZZQn2k7aAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72A19CD35
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241060.1542309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKlr-0005uo-CA; Wed, 25 Feb 2026 19:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241060.1542309; Wed, 25 Feb 2026 19:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKlr-0005s5-8E; Wed, 25 Feb 2026 19:42:07 +0000
Received: by outflank-mailman (input) for mailman id 1241060;
 Wed, 25 Feb 2026 19:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gY1=A5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vvKlp-0005rR-TM
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 19:42:05 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eee4598-1282-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 20:42:04 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2aad1bb5058so126645ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 11:42:03 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6b9b32sm113825ad.66.2026.02.25.11.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 11:42:02 -0800 (PST)
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
X-Inumbo-ID: 0eee4598-1282-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772048522; x=1772653322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfFiKuEp3QRfnNSdj65WKiUbN7nQtTN8Xk1/EYaTfYA=;
        b=MAfwAD/8IAgoF4A79UNR1/6qIHQg8PBA6cFxN1cZaGE8MRSjgyDrh25zmx5/PnMwp2
         wYA3JxMZSKWD3WysTDqyPL9iM22w7Odk4Ui2i1emCujkGMyGi+26eCyJOvdrQSW+oCTX
         6y6iePR0dwt98o0KzhWWTzc+IX4h1FIblxHrxAh33c3H7trE1XS5UFLdEEC15ZovplyH
         Ixi1/0j0+nXHJ7b4ZSIoXWmNSX2eC7jAAqkNqO81BrCL0pViTury0e/9P2GOVPtnfYc9
         lkLJy1OePcWa/kmRCKQ5dkhB6vIKLO4v0TMC4UbPQMzYicjYi8D9A/LeWzuCvFC+pFQ5
         ZpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048522; x=1772653322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfFiKuEp3QRfnNSdj65WKiUbN7nQtTN8Xk1/EYaTfYA=;
        b=hy/fGJggF2jlvKnC+JfjdPWFlg0Nhb5TOgf7G6+NhF5oJ4rsfCDDHnqv7QSzmaDNou
         Yi78TpTdsDt+6Nb/oXJF92YHjRkSuQpuwTnj8aTs0tbulAM7MONHIXAVA1m4MYKEnLMw
         aYcrM86EJCQhmQS62IlccKRRSTnSy/cnqFJbz1LZpBgJZuW9MZq3uIyvV9C08edi60Qs
         ljVnFerSLzPPMzd1s7SZCFIpyRzF3Y01bLfvqWYhnTUUOBApF6K5IytClRLQz1q4PVvV
         Wlsl4jVXKcqgID+XItPMlLgrAP27Avptn2x6Z4tFYnClqsNB8VU3vKsli0n5pEbGcx7m
         bTVA==
X-Forwarded-Encrypted: i=1; AJvYcCVI85Cgas9Ks6IMLYl//xdiIAYfh4tWpHR/DnK4cbMT2U86yyaSeJylH2OObyP8BtPacluR9aEy1ws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfWOu4FdpKOWemdIVovbGQUmxFq7KVr4BpIB/QIysPIu23uyW/
	NMzZbmzyUxq/oPxtIxywSUF12LVi3cUbdYinKH1obgCFMUu6gwj4EyUDMKQ4QAsEFuI=
X-Gm-Gg: ATEYQzwKN+YM9vbWlpdB4zGz/nEwRdwOyKpBjmfSZDZwaI+byiEuCgHRUTVaXfVSdMY
	aK5X1sGLzP2gGkGSZlecFlZ9nPipK+baFyiBeVL6OSePxaWlXGTDKxLlj0d0bTxjaA8n9OfBWiO
	V9bziil1OtpEiRXcoeM9zmI7BZBY5yzXWbEYfiPiNR3Vc7LGMKHL7mUbMYAJ5/znWIXGHyACpPp
	vX5vxtBt5wt5DvPwda/od8hJDV8MwrFkxqJmeKFRE6zyHmcZuoWyk37t6iKAcDGriPI50J25UPn
	7X8B/vLrDhvbw+diEfIVQ3OmNy2VEV8Lt69VJgE5U8MifcUucmszuOQz+kYE/nbUPb8MMA1N2sz
	yaScxsOnpoRcNhfkiPLpZy04bQkyfj3nM4Cch3UlAXwHqqX9/i9xPr2l9WrWcCXEYF9Z8Bx36tl
	3UDwy9v7TJnpzzVTljzYEGr+UskQZn5yRWR4kTmYbh/W6V2yj5yRh+a1vElpwYrCYQC9bW
X-Received: by 2002:a17:903:8c8:b0:2ad:9edf:7fe5 with SMTP id d9443c01a7336-2ad9edf8239mr83081225ad.42.1772048522443;
        Wed, 25 Feb 2026 11:42:02 -0800 (PST)
Message-ID: <90864356-6abb-4cbf-a2bb-abda2ed82c93@linaro.org>
Date: Wed, 25 Feb 2026 11:42:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] accel/xen: Build without target-specific knowledge
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260225051303.91614-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,lists.xenproject.org,kernel.org,xenproject.org,xen.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.970];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A72A19CD35
X-Rspamd-Action: no action

On 2/24/26 9:13 PM, Philippe Mathieu-Daudé wrote:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is
> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/xen/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

