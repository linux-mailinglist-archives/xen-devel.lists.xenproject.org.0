Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51C890A61
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 20:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699175.1091839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpvtY-0001rC-9q; Thu, 28 Mar 2024 19:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699175.1091839; Thu, 28 Mar 2024 19:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpvtY-0001p5-5y; Thu, 28 Mar 2024 19:58:40 +0000
Received: by outflank-mailman (input) for mailman id 699175;
 Thu, 28 Mar 2024 19:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Cl4=LC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpvtW-0001ov-P3
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 19:58:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91107bf7-ed3d-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 20:58:37 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415482307b0so7170415e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 12:58:37 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b0041496734318sm5163928wmb.24.2024.03.28.12.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 12:58:36 -0700 (PDT)
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
X-Inumbo-ID: 91107bf7-ed3d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711655917; x=1712260717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CbSmQlQpQISY33MaUOcZK/Zi3//tWlvqA1u6OjUNI7A=;
        b=m0N7xOt+Cj7AsnoJ1XWpK41GVfI5YOPzwPAKCKYqJ4e2Ff2x2380fW77AuVX/r6EZg
         qjedz5QIhQWL/RiMsPhDd97KBJ6rn1JQLjfnUayx3bUI9mZLyApSSsAieM9eJcKv9HNc
         7wrOUAGCEJCTD+edA6DS2QMd+dL7UOe8lCa4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655917; x=1712260717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbSmQlQpQISY33MaUOcZK/Zi3//tWlvqA1u6OjUNI7A=;
        b=DJ8ESer3rSE6zr9wXy9pCMU/za/2EauE9ltkiwRBp6C3q/QSA9Z2h89APkqsa0jdKj
         bWjMfrQ2n5aSnJN4XNQU9bsgxOEDTgMBtO+QhRSUKenTZ+Qq5yPgQNujwwT7peMUeOXG
         0bhVG9msowj9cWmHI0bouu4rFmci5seKk5vLzqx0yaVCbvQMPRObRGQO72Ae+0CegneS
         tkfm+T6C/eu3HhP0yFCK5RzyF64Wc5GR8EBvd8EUdiPh1usXTZlz8Y963frtMtbQj+6z
         UmEaD3yqUzbTgSQDpJPZ5B3Y03DlPX/s0lJwRF7PmT1Dywy+kVPWlyH0NGIRC1//dU10
         zwGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzDoFRxlCzTgq7VLWGLf5AN2cBhAJjuFDviNNUV+wcLX/XRkIcUXY3A7VuEUlfxWy32v/dg0OURlqiYicEVeoGa4X7fFijaOfMLwzusvo=
X-Gm-Message-State: AOJu0Yzr/0CEgIYPwxEiXM46vrmb3HXGNJPi6sLhc3ABhspdjRcZT26K
	gBcvw3JPNF8T6bIU3XKVa+SM9HzjIOmMyEovmXh4sFYefhIwgykv77b86HjPHL4=
X-Google-Smtp-Source: AGHT+IGojQGFJyCdnoBF3eHGUOHyvBjTmIjjYRw5p1GWr/B44TxyAhGZ/w4YgX5k6QCsXcFRyRCvHg==
X-Received: by 2002:a1c:790c:0:b0:415:4b4b:1e03 with SMTP id l12-20020a1c790c000000b004154b4b1e03mr337375wme.19.1711655917313;
        Thu, 28 Mar 2024 12:58:37 -0700 (PDT)
Message-ID: <9d8af8b5-2a14-44bc-89c6-b616e79cb259@citrix.com>
Date: Thu, 28 Mar 2024 19:58:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240328153523.4155-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2024 3:35 pm, Roger Pau Monne wrote:
> There's no reason to assume VGA text mode 3 to be unconditionally available.
> With the addition of booting Xen itself in PVH mode there's a boot path that
> explicitly short-circuits all the real-mode logic, including the VGA detection.
>
> Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
> not populate boot_vid_info with any default settings.  It will either be
> populated by the real-mode video detection code, or left zeroed in case
> real-mode code is skipped.
>
> Note that only PVH skips the real-mode portion of the boot trampoline,
> otherwise the only way to skip it is to set `no-real-mode` on the command line,
> and the description for the option already notes that VGA would be disabled as
> a result of skipping real-mode bootstrap.

IIRC, Grub defaults to using no-real-mode for xen.efi.  It's definitely
a common option to find used in practice.

>
> This fixes Xen incorrectly reporting:
>
> (XEN) Video information:
> (XEN)  VGA is text mode 80x25, font 8x16
>
> When booted as a PVH guest.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reivewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

