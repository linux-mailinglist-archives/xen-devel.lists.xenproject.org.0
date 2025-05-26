Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F694AC4398
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997690.1378509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcDB-0001dN-2u; Mon, 26 May 2025 18:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997690.1378509; Mon, 26 May 2025 18:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcDA-0001bK-Vp; Mon, 26 May 2025 18:06:08 +0000
Received: by outflank-mailman (input) for mailman id 997690;
 Mon, 26 May 2025 18:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJcD9-0001bE-90
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:06:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17b862e6-3a5c-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 20:06:06 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a375888297so1654495f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 11:06:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cd0cf5ccsm7901774f8f.8.2025.05.26.11.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 11:06:04 -0700 (PDT)
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
X-Inumbo-ID: 17b862e6-3a5c-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748282765; x=1748887565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mdhKoeHJE9uLImQ64Dk2jdJxQNc9M0ZS4u4S5vrAKOs=;
        b=s8IcLGcG+s9oNyMgPZBN/fTVz0g8kkd2Z9LOq2hPU4vpaPXzkKZg0+Li9kMqHOZuG/
         zThJUJ4wNtAKBl0PlBR31BMhZMd0Qqcsfl8BCMBtvBCeVxYPyriLWGk2WcT5Y3y+Ha5/
         WNVyN6RZPmH5XIftROg3c9BQsM6HCnzJP5b1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748282765; x=1748887565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdhKoeHJE9uLImQ64Dk2jdJxQNc9M0ZS4u4S5vrAKOs=;
        b=LzGfbsgYF2CTlhYE3EAEZkJ/QnBuOQFNlqJL7S8io36PLRvKx9oBYTY2UAUwEr4rjc
         M7zxN4M6lEU9wEDbwVAwelbe1ODkzweP1p43AO6WyXeVcUptLrG9nUWk5ITUFLiX+KE5
         2kbEC+24NlQwT8cqehmGY0E9PWLdBRABBdoElEeo7EkYUNolS/tJOFgHtCDuY+noI+Ru
         DuILoxiP/iUrhVulDexLBMTaHHtGEDv7tONY9Io7vEvwZh5jQUGDcOefXBW8gCtte19A
         tQqhBe0OBm2QBknMxyXpqh32XSOy3mSwDuCqLWGYghn2tJkxDDfcW9mnfSq6LOEmqS3X
         k6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA0JEsGofMP19ltne6YouwUBcy9GsWvf0ETGbX/gMLYhgxPJ3u9GqM2zmid5ScTn/lI4R/SOhQZiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw64B6g+cGmw0arVbcZrf1woU+N3VRS693A+vNmO6LYDfsDjHdF
	wr1LKnx58ni67AcNUxFnH/xs1aw6DttiZgabj0hyLPQsmYZIsThsZd0m3/TJk39qQP/Xw3tigWx
	JgWPv
X-Gm-Gg: ASbGncuYXkw3SUIj/yD/tnaZmyQPhPXpw24Ex+yeOtTCW2uWTPkMpmYBk3PB3JJfzsy
	nkrVZEJnRqtuwXF05X8H5S18QCnGDgk6uGDjgbVKe/cQkvgWVyHZ2Mmuy5t2PNFQnGIv2OhTpva
	PUeJ5kZensLWmfvwLnbL/F/8O9kzm5rp7bgX2TukIvctdowZh7mL/S+Ho7WWPX3OiBjoqVeFm5/
	I+qhYy2jphxwHEsnAaOKCrUPUUahtm0QxYDK/adQRrPo3CB71Q/Ld0Cx/GnLW6O7s/WbBJfPMKl
	XUHjTZcX/jPPoZrkJnrDpUn20yjQzvh4rMZyXa5hjkmHMGN7BEEGcpVCgXG/ttsBJpVN9Mk3Dn7
	agmMlSpVMVaRM33KZ
X-Google-Smtp-Source: AGHT+IG8nCUeoWZn9mIuscIv/K9zpDAj3VImeG6zjJ9wtH5/KEhu99d++bIEnBvyBmikE5wEct55bQ==
X-Received: by 2002:a05:6000:2083:b0:3a3:76d8:67a7 with SMTP id ffacd0b85a97d-3a4ca544fc7mr9107017f8f.20.1748282765278;
        Mon, 26 May 2025 11:06:05 -0700 (PDT)
Message-ID: <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
Date: Mon, 26 May 2025 19:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18.5 PV dbregs fail
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 6:59 pm, Manuel Bouyer wrote:
> Hello,
> since I updated to Xen 4.18.5 (from 4.18.4), NetBSD's dbregs-related tests
> are failing. Only for PV; PVH and HVM guests are fine. They are
> failing for both 32bits and 64bits guests.
>
> I tracked it down to dr6 being 0xffff0ff0 after the trace trap, when at
> last one of the lower bits should be 1 (I think it's bit 0, from the code).
>
> I looked at the commit log between 4.18.4 and 4.18.5 but didn't see
> anything obvious.
>
> Any idea ?
>

Have you got a link to the test in question?

We've had a couple of bugfixes in this area, although debug handling
isn't helped by the fact that both the SDM and APM are factually
incorrect on how to write a #DB handler (and the vendors are moving at a
glacial pace to correct them).

~Andrew

