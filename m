Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290E489AA73
	for <lists+xen-devel@lfdr.de>; Sat,  6 Apr 2024 12:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701472.1095907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3kO-00051K-PR; Sat, 06 Apr 2024 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701472.1095907; Sat, 06 Apr 2024 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3kO-0004zm-MR; Sat, 06 Apr 2024 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 701472;
 Sat, 06 Apr 2024 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnvA=LL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rt3kM-0004zf-VH
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2024 10:58:06 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0cb7f4-f404-11ee-a1ef-f123f15fe8a2;
 Sat, 06 Apr 2024 12:58:04 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso1670675f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2024 03:58:04 -0700 (PDT)
Received: from ?IPV6:2a00:23c7:df82:3001:2982:11d0:133d:ad80?
 ([2a00:23c7:df82:3001:2982:11d0:133d:ad80])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056000136d00b00343e3023fbasm3947358wrz.34.2024.04.06.03.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Apr 2024 03:58:03 -0700 (PDT)
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
X-Inumbo-ID: 8b0cb7f4-f404-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712401084; x=1713005884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YlXHqLaoVrNy3ounRRsAuneHu1Iwc/5dL8h81UCpCfQ=;
        b=TxZ6vvB6uP3pIX7yXvFDzk2JzRYvTUL/QybM0llUXead6g6GWpWD6ak5I2wjy3Bpkk
         CQZ09elh9NfTLIYChupLtvH+9kuyzrmsF8kR1W7F5K7PzwX93T58jLdh20q5eGpyFGED
         kzmU3yjRItm9C7sbwRu+zoRxe6h+n5s9Onea6XRrfQbhEXf6OqI2ZsyE3Cwb5KK6S8ty
         NaPaTnDPH1syVkkm+tuD12ZlIqWjrgK8Cif5sOac4USqzsVcsguONYF1F6bQXpegVXjn
         mwNA4oFuq8JZvGSggF49diERUpVe1HIxOr6BrRLEPZdJbBNr/Qn991q3sJd+zvlbijLv
         NDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712401084; x=1713005884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlXHqLaoVrNy3ounRRsAuneHu1Iwc/5dL8h81UCpCfQ=;
        b=OHHvYlrj3bF6uJKa88WSlAD1ZepcDVRIdfuo6m0HbPGykk3Mcb01uyqKl0iBm5ovOv
         tFke8Gajl7jeTmR5OwyOkHFT9ZgjktlHPKYuMgCVD9op12s50APkHOzd+aRbKmMDMF7C
         9AOysq9ptT3b4rrZA6GOHY9zmozG9eoSXUB3w6C0mDP1Zz52aRX1HzG++Rsfu2h73rCC
         Ea7x14rwn8keEBEI4vkjZV/BIhD/0xpPuKzPWQkZSjdSDTy+EIa6brlNSbnvI4yKs0+K
         fcKi3JqnEBIHkSA7M5NzikfC0hKR2iBHSIFI/XvUI0U+W5kOcObI84SFNfOcuMSMeVac
         KAjg==
X-Gm-Message-State: AOJu0YwSRG0H5MnUaV3xRh+bc7fWqnIcNGfl+KPlC+Jiw/2E8X//Q08+
	+F8HaJ1IYP2I0Oht4LBqfNpVxSA9FHWGrVhddJXdXPtpioymE8yL
X-Google-Smtp-Source: AGHT+IEeI+13HH/wqUs0OoOPW8rciLlYfdxc9/JnvD5dOjAifTJGvFuJZptctNLF+G7A+kXYe2p2MA==
X-Received: by 2002:a05:6000:ac2:b0:33e:710a:b699 with SMTP id di2-20020a0560000ac200b0033e710ab699mr3701156wrb.9.1712401083825;
        Sat, 06 Apr 2024 03:58:03 -0700 (PDT)
Message-ID: <6fad8151-4bde-4a02-96fb-27b99d93757f@gmail.com>
Date: Sat, 6 Apr 2024 11:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2024 15:08, Ross Lagerwall wrote:
> A malicious or buggy guest may generated buffered ioreqs faster than
> QEMU can process them in handle_buffered_iopage(). The result is a
> livelock - QEMU continuously processes ioreqs on the main thread without
> iterating through the main loop which prevents handling other events,
> processing timers, etc. Without QEMU handling other events, it often
> results in the guest becoming unsable and makes it difficult to stop the
> source of buffered ioreqs.
> 
> To avoid this, if we process a full page of buffered ioreqs, stop and
> reschedule an immediate timer to continue processing them. This lets
> QEMU go back to the main loop and catch up.
> 

Do PV backends potentially cause the same scheduling issue (if not using 
io threads)?

> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>   hw/xen/xen-hvm-common.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


