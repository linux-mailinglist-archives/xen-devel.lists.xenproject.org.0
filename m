Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0EB153B8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 21:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063002.1428762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugqCX-0007BS-1L; Tue, 29 Jul 2025 19:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063002.1428762; Tue, 29 Jul 2025 19:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugqCW-0007A0-Un; Tue, 29 Jul 2025 19:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1063002;
 Tue, 29 Jul 2025 19:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugqCV-00079u-LC
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 19:41:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04137bd3-6cb4-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 21:41:26 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so76560f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 12:41:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705377cesm208110155e9.5.2025.07.29.12.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 12:41:25 -0700 (PDT)
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
X-Inumbo-ID: 04137bd3-6cb4-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753818086; x=1754422886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lv+a0YD7jFMm0U1gQJ2LejRAvelg8yDLgF0508z+eBA=;
        b=UhDP2qrhbDmn3MNb/hsMm2HHTjvVycg7JzNdwKj7ZPJQB6tFsCcRIYInb/gMEIh/Qu
         W0SmbuAejYmzMdgV7m5Bh+MjKNKqpCJGBIiitYg+W/CngwZUkIwKW3CjRncGCxlrWWQ9
         YkeCQItoo0+hU0Zw5aSXr7I3vf6YdqYQnNGwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753818086; x=1754422886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lv+a0YD7jFMm0U1gQJ2LejRAvelg8yDLgF0508z+eBA=;
        b=sYVJ1Z7bKbsV2nCuhjrG2+n5R9IxQWGwYV7hI6Tv+EKemB8ys9O/fr2T0CoXCZY4UQ
         4hsS4irueVHYxWLBMgTDfyecbPywxtrnBuAc/j7B39c74xSHYL2UtLSF3/WtrWU+Vu+z
         QZXq16+2kUrfIGK+hqapLeWs/6QyhtV8fatWjm1QLVdOmcrGP1Qr5U/N3PH9bkaYpHEa
         iqxJ2XHE2jos6n96YK+FTbPdMiRY7ZvQLNqlr18OBSzF1Cqrmw2GTw+YFN//n1gRc1VU
         6s34YKyiNxT6E7bhB2fVHbxiVEJU6YbK+jH+65lfTdlo7MKj+WJuNqHQ7umu4T9NZMjk
         +rUA==
X-Forwarded-Encrypted: i=1; AJvYcCVCNlqpxlXmcrEUsksigmcTC5O836Bm+b3rErbSLUUEmlnCeLXTyjgLGJGUNfErOtnX2dwzM/nMcNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS/RRYf/iNp6NSNqpaqtEYgUb8AqAXkFMyVo9rsjf6eksybb7O
	sHd0egkw9y3zmLx8C7VrasnA1B8SaYSE0LQ1ObGGFGUQH3OK3p+3GxsCTPKqLiTXZGc=
X-Gm-Gg: ASbGnctWJZLenzqeU6SC689Bztm+yAhFxaJkByNDJpG6Ix/dkdjDf7FpuTPHu7tgboe
	7sGAznMo9V/gdxlJsKdG1OlLO2e606c8/Q2tRKjYkaIhes9kuOiihbGkZhCejfcLBpkYeHPlk8w
	ptwobbdYm82Q2eYDJWGAUBKRFZ56V/IeLEgSUNwFISPghS2Zmi5/GHmlNiH0V/tNcf/I+E9lbHS
	CcPdnncYuFv2mEhtJGT0rHqpFuIrrCasbNa1WGOjfEc5IQj1rODVUQ3R0MLAMB9ODW7LrIIIwL6
	95d9Z9RXWbWlAZDpuVZ3YRqBAkpslADK8sfqV+k+Iuezu/4k9vdfULdSjKYhR3jg7j2I553632i
	nVAUT2dZ9I+qELJ4WXDAxKijn1bWCkq9dZOiemxho7vRv0q46fCL6SWjYbmUOeXtfRlF7VpRk6B
	AtR6s=
X-Google-Smtp-Source: AGHT+IFoVLSX7C2+pTxBv+RxHBTlYe+nvg1dKLsHyZmbpx0UOMnIZaHpZcBbnPp8scOzXFnc4gSdSA==
X-Received: by 2002:a05:6000:40de:b0:3b7:61cb:3cc0 with SMTP id ffacd0b85a97d-3b794ff7875mr673443f8f.25.1753818086093;
        Tue, 29 Jul 2025 12:41:26 -0700 (PDT)
Message-ID: <98501ff7-0ca3-4aa2-a1d0-aa846e8fbf33@citrix.com>
Date: Tue, 29 Jul 2025 20:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Reduce variable scope to void compiler warning
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250721083707.7964-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250721083707.7964-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/07/2025 9:37 am, Frediano Ziglio wrote:
> This change removes some pieve of code working around with
> some compiler warnings.
> No functional change.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

"Piece", although peeve would almost work in context.  Can be fixed on
commit.

~Andrew

