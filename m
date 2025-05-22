Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D85AC0F20
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994160.1377198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7O8-0002S9-4u; Thu, 22 May 2025 14:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994160.1377198; Thu, 22 May 2025 14:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7O8-0002PS-1R; Thu, 22 May 2025 14:59:16 +0000
Received: by outflank-mailman (input) for mailman id 994160;
 Thu, 22 May 2025 14:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI7O6-0002PM-7f
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:59:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52435690-371d-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 16:59:12 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so10730404a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:59:12 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f5fe5sm10612020a12.7.2025.05.22.07.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:59:11 -0700 (PDT)
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
X-Inumbo-ID: 52435690-371d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747925952; x=1748530752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pM2cuzmldAVHXAvYRXC5A6v9k3tta05rC2y/rRN+iEk=;
        b=cnbj3VHRo3UrsAINFd18GKg4MKPsmy+i54ye5lWL22RVq44JDt3nxhRI2UDHj66oy2
         jQtwzPfY8XnXQitAbNIaWZwig8pFCDWtBgaFRK2om0XOEeK0KWYKDK/xoYdfdOXUe7IY
         9C7ol/F+RHoku5H7wm8KdqwYDhf3r8UDZSSxxPVmlv3sFD+0/z5go0HudIOH52qi9uwl
         39aLmcaP93Mr7NCd27VR6QdoaXbSoGeOVXjQ2rnbi2QzQmRzxxqMNOW+D4W3+ozeddpr
         tzeflF3cVMVfI/f3Lwypky1RC1njVUp37jfaAUhgAzx7OGX2vQbyt0tnetAu1nX9ighp
         Ablw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925952; x=1748530752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pM2cuzmldAVHXAvYRXC5A6v9k3tta05rC2y/rRN+iEk=;
        b=oySsl2RquUgbjs2GaJNF+hWmRCFmKIn6H0BLMPoWf1KQRaBmJjtTka3ZeMAE/JsVUC
         FpQlI3bPg2/5t/U/zM+YOoytCkE/KiBtH9dsFMiFpcEGfao+la6eN2Wim+u5Jrdns5XQ
         xZrpedsE95Lap68+Nha7PmaOmPxDTLkeBwuioswst5Ea1oFRU5pPv0QGe7VaXSPetiSx
         ulI/BT1xaG555ZcCEDR1wOlAQHmG8p7OvA6aIL0oVTM8YkzQVSBEevT2GcrCqCo51qZU
         knBG2OEsuovIBjbUYPoquhrt9CGWAd0Z1kdcLFQ5hndVyL7Q2AfUp+A76bvnFi8OR3AP
         T/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3UPOIvrhxXge5gZWZ+Tbqb4j/WlnQdvfutifcN6mqQD/aMoJ9mK40noejUUTeod3GiE5ntSg9sVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+xgSgGjuxiRcEsiHV0vcVCcSb/WaN6g9n7jHrfvaB7hk8kNKD
	iskgIJJL90Yhr9XQblKG/+Ye/7YosvhwlYLZQdzwkIPhNH4JbAc4VbDUVPs90dJAKg==
X-Gm-Gg: ASbGnctiDSYtUaeJRgsKDTDt6jSQAiBjn+n59hTW1UMtDS171uTwW8bdI/nwC4yUGbz
	+KTn1mqINo1NndjsN6rSIPvkMetyKrEN4+j2kcZbaZ8pH01HzSe9PuJrr8rE+/RymY6Ra+55HsB
	Af/i/Fm+30RRVaHdeqjnODqVQJ4gHfBD22Es+mzLLCgZAx6rlAptLNMYRKsSRaQIw5G5lKK18lp
	2Ie8X7LMALhQSY21OOeCT4N0QIRmkS5ipmBAwpX1fUxZSo3epSX2FL1Dvxptzpmstz2/ue2AInT
	Ybc78lmekuuFS0QGbnHaOA8DT8ZCkQ==
X-Google-Smtp-Source: AGHT+IHFNg77pH5AaRO6DiDTSLdXnu7sDoV6wxxiYB+cOjO+uenCJXJoFaLAR1E9q5BniHoNb7dF2A==
X-Received: by 2002:a05:6402:2816:b0:5ff:83db:96cd with SMTP id 4fb4d7f45d1cf-600900f5268mr22868424a12.18.1747925951654;
        Thu, 22 May 2025 07:59:11 -0700 (PDT)
Message-ID: <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
Date: Thu, 22 May 2025 16:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250522140356.5653-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 16:03, Roger Pau Monne wrote:
> A BAR at position 0 is not initialized (not positioned).  While Xen could
> attempt to map it into the p2m, marking it as mapped will prevent dom0 to
> change the position of the BAR,

With memory decoding enabled, that is?

> as the vPCI code has a shortcomming of not
> allowing to write to BAR registers while the BAR is mapped on the p2m.

Again only under that extra condition, aiui.

> Workaround this limitation by returning false from pci_check_bar() if the
> BAR address is 0, thus causing the bar->enabled field to also be set to
> false and allowing bar_write() to change the BAR position.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/pci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 26bb7f6a3c3a..39fd5a16a4aa 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>  {
> +    /*
> +     * Refuse to map BARs at position 0, those are not initialized.  This might
> +     * be required by Linux, that can reposition BARs with memory decoding
> +     * enabled.  By returning false here bar->enabled will be set to false, and
> +     * bar_write() will work as expected.
> +     */
> +    if ( mfn_eq(start, _mfn(0)) )
> +        return false;

Is this really x86-specific?

Jan

