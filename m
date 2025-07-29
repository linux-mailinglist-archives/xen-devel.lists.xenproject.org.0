Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3DB14DFC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062639.1428358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjvs-0005sH-QA; Tue, 29 Jul 2025 12:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062639.1428358; Tue, 29 Jul 2025 12:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjvs-0005qp-NG; Tue, 29 Jul 2025 12:59:52 +0000
Received: by outflank-mailman (input) for mailman id 1062639;
 Tue, 29 Jul 2025 12:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xsxe=2K=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ugjvq-0005qj-NV
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:59:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b3e311-6c7b-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 14:59:49 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so1512541f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 05:59:49 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78d45d152sm3585536f8f.3.2025.07.29.05.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 05:59:47 -0700 (PDT)
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
X-Inumbo-ID: e8b3e311-6c7b-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753793988; x=1754398788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cArS9/nRylKOD3Huk40tSuXpNtAKJs4oRFsn3gdCtU=;
        b=ehjbJpc3HkSEp7L8cC5vOnbj11aaSttHXk4QMBHh8MYW1HgkQ6+hPBJAPYqnu2G7bb
         og8EkxzuYdP1GbnRCfhTmONPFIcy97jJFuvA3zhujM9WlPdfoehXMiXKryT2xgvkRz0p
         6d+5yXnu9YGAMzyvGr2z65yMhUv26qYEDN3F43Hr+y7cnIDlKnWscRU/kAjhcTD50aRz
         Qm290i8hpqCfEcdTnKQ4n+Kb9YbaWYhWZV2f4XLSeCOG545bdtGs3GvS3v4y7yaZPna3
         cnASLGoqsgjSk6ORX4xjfMQ43VXEIkzdsHhVNzdYYR0pc++cpagL895mDHDoz5qlJc9k
         vp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753793988; x=1754398788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cArS9/nRylKOD3Huk40tSuXpNtAKJs4oRFsn3gdCtU=;
        b=VWrz6bU9ndbkGjrvuPNtjNLCn/ghflFxIN7eUAF0wGA5fZkkX1z4D2p3UDw6rqJxiC
         C6GMmxv0B5ED07tIMc4broZtwfEfk3Opy8/+HF4JlTkc0nl2OHcw5tkyjEwUwoXhB9m7
         QI2hFVn3RvUO60Znzk6gWxHMlybT258jfofyO4eJrvN2aEw1tdqkaavchNTfw2kPKWav
         pDJF0SiPBCdtfnWO/6m2+soFpX9inBpds7m+/2YoTOXm7fS0HyrzQHrk54X1cY8a3hq6
         BfXrWlDvf2PLtnYIBOFYcWYC1msAaFh1wFFN7GRS19GWpDEMCjmoD6/T5uwRpCB021HN
         o3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiytBX9YC8amTUbzOtyRehvM7pEknIKxP1RR6ubYTULeYIyppZLFYH+QkhaAcpQ0cj/bVersDFALE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLriYKrM9F/DvhWW2xhGhRSxKSvd/bS6KI+HazwRTIV/y1CBJl
	cdGHfR6VvnniakaaU9JPz8YIe6jGW8UMwAmD7PLQ0QXcfvOtumkwDiv/74T2nm8t8Hw=
X-Gm-Gg: ASbGncvt87rrsqSOUN4IArgD+zp0X8YbFYSBHhVP0TXwXPRFq03ohUcrVjlXNgZi3do
	NdBX75MLc3vIumJrkSfOgpxgfDzFzIrGsS/tA1Cx8W8sZZubCvL1asY5LYhIoPR7pfEOcvjTJbU
	3wTFzCAEoY3Oa6CnXFD3zE8yZwgCtlu7PJXrsLAtW/lOqqw8900pBqaG+RwVnk/0uj2nVatQ6Rz
	64N7mn86O2WcK+pgIih09ySc0QLK0pZTMkvKosif6WbSS2tlAytCtO50axNvY/QQ34S1bcHk1T/
	mlH3wAsUC+MT1O3uphxvNataVLN8TgbiVmvXNoPaMPn2hpvw5o+Aj+HCw+jYVumgftJ8TqwcGCg
	9o19Ph4FUkaeFgv+zXux7XL+sxOkhmBdpZI+u0i57IrMPxgBwAPVC6cN+iRXL+aWLKg27MC6zeK
	sz
X-Google-Smtp-Source: AGHT+IEB10v4PlEVCKKxdtNYOiBMcTLcOBbKf1RgZTNhwbScPufdOsX77u3Fjs46TLXC/DBoqvBPLA==
X-Received: by 2002:a5d:64e8:0:b0:3b7:899c:e88b with SMTP id ffacd0b85a97d-3b7899cea54mr5166832f8f.11.1753793988424;
        Tue, 29 Jul 2025 05:59:48 -0700 (PDT)
Message-ID: <15536eea-5a66-4dff-b4bd-8a43fbfa9365@linaro.org>
Date: Tue, 29 Jul 2025 14:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
 <87v7nbdwfx.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87v7nbdwfx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/7/25 14:16, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 29/7/25 13:12, Markus Armbruster wrote:
>>> xenfb_mouse_event() has a switch statement whose controlling
>>> expression move->axis is an enum InputAxis.  The enum values are
>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>> case for both axes.  In addition, it has an unreachable default label.
>>> This convinces Coverity that move->axis can be greater than 1.  It
>>> duly reports a buffer overrun when it is used to subscript an array
>>> with two elements.
>>> Replace the unreachable code by abort().
>>> Resolves: Coverity CID 1613906
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    hw/display/xenfb.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>>> index 22822fecea..5e6c691779 100644
>>> --- a/hw/display/xenfb.c
>>> +++ b/hw/display/xenfb.c
>>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>>>                    scale = surface_height(surface) - 1;
>>>                    break;
>>>                default:
>>> -                scale = 0x8000;
>>> -                break;
>>> +                abort();
>>
>> We prefer GLib g_assert_not_reached() over abort() because it displays
>> the file, line number & function before aborting.
> 
> The purpose of this line is to tell the compiler we can't get there,
> with the least amount of ceremony.
> 
> We have ~600 calls of abort().

And ~1600 of g_assert_not_reached() =)

$ git grep -w 'abort();' | wc -l
      556
$ git grep -w 'g_assert_not_reached();' | wc -l
     1551

> Whoever merges this: feel free to replace by g_assert_not_reached().
> 
>>>                }
>>>                xenfb->axis[move->axis] = move->value * scale / 0x7fff;
>>>            }
> 


