Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7378BF8085
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 20:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147540.1479834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBGvd-000237-BN; Tue, 21 Oct 2025 18:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147540.1479834; Tue, 21 Oct 2025 18:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBGvd-00020i-8X; Tue, 21 Oct 2025 18:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1147540;
 Tue, 21 Oct 2025 18:17:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH+j=46=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBGvb-00020c-Tj
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 18:17:47 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a73c755-aeaa-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 20:17:39 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso3306349f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 11:17:39 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494aa0336sm23611425e9.1.2025.10.21.11.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 11:17:38 -0700 (PDT)
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
X-Inumbo-ID: 3a73c755-aeaa-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761070659; x=1761675459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3By8Kfq8PqUAkjy9XCGQQ4sbeJUGg88Lrj9uzfNivJA=;
        b=DjRnGPJui2t9aOuhBWbcnot9EYjbPUlcuR8SczrQGHL/q4suklJh98B3VUvFH/JMc8
         okgdWAHIBYA000JG8KW0zo9k8KxCvbbt1ZwEJ7pucGEPduwlqwmnl+XXhgOx4DTQC8hU
         JF5NzNrf1bc5Pxtc9oF6LhlRl6kLxyWuXuy84zbDKg090RT5YNP/yWfPxr8fcvgWnxYn
         IfxI1rNaCiUqEQNR0aF90iMopzuQifEx7/wN7b7l/QxyKAyvZTTjxPjVecbERztcN1LQ
         E+KIcxYqonN0tTSCdJVGOKrjnpLhRkDmq4BZH0c/Lw+HrexnaWPSoW9LJuKh+o0pTGLK
         szLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070659; x=1761675459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3By8Kfq8PqUAkjy9XCGQQ4sbeJUGg88Lrj9uzfNivJA=;
        b=uIxYs1BL9qs1ihSkG9UBOXHTyrumSjnipc2meROmcUTow0vfC5mc2x76vTZDWYo6vf
         C4LrWlLyhVmIMaG5mNhCFlTZRt6a5wX2SAV8pD5wsqSKiTqZPJfZibEs4hYWlRdvniZo
         fDikfyvpmJegtaKtBInTL+KoNvA7izpp1Y0QnfnGqEvCCaP8zAb7VBN9jlJzsrKGR6vh
         bHIbko8RYIl3LpKandvcozP+35yT5kHG1bK+RqaTmQ9uJ8KmBDKFIakDWtH7SxRXM3Xc
         v2UtgAH2VLBNFYjKCsVGYmgChtwXWGJv1YCsFlPfy3+65tb+RsyNVKmyR1ugW+CitQjR
         Dptg==
X-Forwarded-Encrypted: i=1; AJvYcCWZfB3nzJoCeSugMLVvNGHzv8jZy/w7nn37mQ2vR/vyGD/zrB8CNf6ce80MU8NXuQdPNTmE7iW+tLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIlhx1WQ7A1OoymrVZkHzxVC2eoTkPRxCNaxXOr60GplngDzpc
	G2Vh+mxdFmJP+u5gq4UVe9FVaWy8lp/jvDXeJh53P5xfCu38VLGBA+GUesJMVAX0E0k=
X-Gm-Gg: ASbGncud1X52EtFRYW2wpVslCyiZWiMunYshevtjJTSB8TroNtE7AbT3A6tHMQqR3Qt
	w6SZwjVAmUDhrwu76r3YsOWU0fnVp1K4ADL9eBIhVXX8/zxaKG/9U4540V2aM5FL8gvryR6cG+L
	HQyk7Vwr1rAdzk/YJtEkK/sLRs41tLlr2uw4xxPGVN+ER/2Y9+LouJ8gfTxos+DS+hb/7htz23+
	Tom1UESlzEpItCWT/7GgN6qkUGfS1Cf/W1hLGh8qeyuXVcYP/BMJre5pmLYB8Z6hNn59apYEAbb
	wJlPNbTU+s/5TJ/C5lMfVXci0Sl+Bu6uZmUXEud0MNPtBYK+bAfd+va2JvmWCTCcTP3W+o77kvx
	W3IiW9ybRbeB6CllhNQVpAwdXWyAstW0qi/RBIrz999LoXJCXnGaCIWWCVf2MiirY9eJ4mUuDIh
	wIEU6iA+e9cqe3MVhUTf+vpNJTGfnsosef89h/hiz1qkE=
X-Google-Smtp-Source: AGHT+IFYvono0+s4yexjoDgBI8G1uVs124bbeyNjyszamDItzmgYjRHhATdxny95FDdp2D2tr30L9Q==
X-Received: by 2002:a05:6000:2404:b0:427:5e5:a09c with SMTP id ffacd0b85a97d-42705e5a09fmr10995058f8f.37.1761070659110;
        Tue, 21 Oct 2025 11:17:39 -0700 (PDT)
Message-ID: <d4bb9b02-5cdc-4da5-926b-7bb17f78bcfc@linaro.org>
Date: Tue, 21 Oct 2025 20:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen: pass PCI domain to xc_physdev_map_pirq_msi()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20251017155136.16540-1-roger.pau@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251017155136.16540-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/10/25 17:51, Roger Pau Monne wrote:
> It's currently impossible for passthrough devices on segment different than
> 0 to work correctly, as the PCI domain is not provided to
> xc_physdev_map_pirq_msi(), and hence it's unconditionally assumed that all
> devices are on segment 0.
> 
> Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in the
> high 16bits of the bus parameter.  On versions of Xen where this is not
> supported the passed segment will be ignored and assume to be 0, no worse
> than the current state.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>   hw/xen/xen_pt_msi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index e9ba17317aba..df15ccf0d030 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -138,6 +138,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
>           rc = xc_physdev_map_pirq_msi(xen_xc, xen_domid, XEN_PT_AUTO_ASSIGN,
>                                        ppirq, PCI_DEVFN(s->real_device.dev,
>                                                         s->real_device.func),
> +                                     ((uint32_t)s->real_device.domain << 16) |
>                                        s->real_device.bus,

Alternatively:

   deposit32(s->real_device.bus, 16, 16, s->real_device.domain)

>                                        msix_entry, table_base);
>           if (rc) {
Patch queued, thanks!


