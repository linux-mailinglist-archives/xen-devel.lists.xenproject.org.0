Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930520CDAC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqKJ-0003go-0O; Mon, 29 Jun 2020 09:43:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMiv=AK=yubico.com=trevor@srs-us1.protection.inumbo.net>)
 id 1jpqKG-0003gg-Mo
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:43:44 +0000
X-Inumbo-ID: 054af5ea-b9ed-11ea-b7bb-bc764e2007e4
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 054af5ea-b9ed-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 09:43:44 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id c11so8698262lfh.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yubico.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rvG7s+jucVSNCaXdvIkIcodl8tXal4e6UXtqml8xF4c=;
 b=lirGeECQnn9CHcXsCZI+WDUP0yZZ1PM5dHOvZc3tSYXbYvM48Q9PwsGoThIQ+/MjFY
 OVtAu9tIoUU0BPkZGAfoM3dWPda6KXAppMoTMregZCuUvlbInGej62Tl6hH+/xFW3nM3
 DNZfafwyafHg9owiZ1ZJpkd7JBmq6nL+vdXqZ7WYJRgV4rmCQCm24VxrenNsVb3Wk4SX
 EBSw2gzcaLzMpHg+wPQGoDX/FTX+cjFR5dr/XBzzJL1yuYT3fjO3HriZl/4VN7oO095e
 /9gOXKCr7z/r8f/X/5GHIHsfNeexRxE+15wBP0sx2x0TOWttb7EPoA1mChpXBLzNjpU3
 Snng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvG7s+jucVSNCaXdvIkIcodl8tXal4e6UXtqml8xF4c=;
 b=fG9zK7vCLXmGQxPWb9D1GDXor6RNbUBz700g30O4E8NmwIJ5TW0nfNuLMgTknrV1ug
 FIM2L0lK9tZLJ4b5TzNCmapoxu2FonJPTZ1YdbxU6gEMfW3Sb9OEvZ1f7XjhfS9LkT8p
 0Rk4IbufW2znK5yIioAQcpDvRVZE1YQdjQUKu7cWpjiNs1bwtbxcly+9M+qFaHZF2kug
 4qj5+uOO/JIj9vyvf2xPiLrrGq6KOUhLVupoj12RssVTxNqxNM1ALCpNON7Beq7YSCKN
 /eJRy7N9QLYA3fgyTBlHX8TnKyXCze35adU1b8JorJ9slSGWvxa/Ma7c4Hm5Vb9WdzE7
 2u3g==
X-Gm-Message-State: AOAM531grCn9fgErDEwm9YTAyfS1bBiPadcXek635nr8FSkixullz395
 G+2cVOzzwlRcDiWG3YKUuRB1TnkLgi4V5Da4U9g+h46CPxW4TyC1Px6o0z9MCRrTqCB51d3Zbex
 baaDmw8EdzZ7b25R4pSF5Oi0EUGphlAdTPbYV+lLg/+Sl1g0b3q6I1wdQwpxfvKQjEWjqnPCvQQ
 ==
X-Google-Smtp-Source: ABdhPJwYUw+TD24ZDIdLkunOi4TucBqziHpLfZLla8iE4gPbIWui8B1rafwFVfl69cleARz3CX4rEw==
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr8749749lfq.201.1593423822940; 
 Mon, 29 Jun 2020 02:43:42 -0700 (PDT)
Received: from apple-IIe.local (c188-151-193-98.bredband.comhem.se.
 [188.151.193.98])
 by smtp.gmail.com with ESMTPSA id v19sm2688739lfi.65.2020.06.29.02.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:43:42 -0700 (PDT)
Subject: Re: Suspend/hibernate not working on Dell XPS 15 9500 laptop
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
 <20200629093239.GG735@Air-de-Roger>
From: Trevor Bentley <trevor@yubico.com>
Message-ID: <774fff18-55a5-259a-0fbf-fefb2f8969fc@yubico.com>
Date: Mon, 29 Jun 2020 11:43:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:75.0)
 Gecko/20100101 Thunderbird/75.0
MIME-Version: 1.0
In-Reply-To: <20200629093239.GG735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Completely a shot in the dark, but have you tried with legacy boot
> (BIOS) instead of UEFI? To try to rule out what might cause the
> issues.

 From the BIOS: "Legacy Boot mode is not supported on this platform."

This is my punishment for buying a brand new laptop model for Linux...

-Trevor


