Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0EAE9FF3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026497.1401685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnIU-0002zz-Or; Thu, 26 Jun 2025 14:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026497.1401685; Thu, 26 Jun 2025 14:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnIU-0002xU-LZ; Thu, 26 Jun 2025 14:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1026497;
 Thu, 26 Jun 2025 14:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAb7=ZJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUnIS-0002x5-SK
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:09:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34a368f2-5297-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:09:42 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-453647147c6so11559925e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:09:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810617bsm7551014f8f.75.2025.06.26.07.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:09:39 -0700 (PDT)
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
X-Inumbo-ID: 34a368f2-5297-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750946982; x=1751551782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tE1a4NOYjLD3i/3qY8e3f+0xzk2jNBxfIW/7EnTcPKc=;
        b=DGpFlmwoklBsNEigjojTLYdMtUf8I3Yh9juIovkEPLT/a1fFzNEc6NzjvTw27LauzM
         1+zWdTP7rT8Q+naj5Otzq6f4NIIqYujlSE4n9WXohcMvnBh13f/C3l9IaC2PJFQ7l0DD
         m7u0vSStezYxsiBVBzQh98fSAT0VJfvUUsu9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946982; x=1751551782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE1a4NOYjLD3i/3qY8e3f+0xzk2jNBxfIW/7EnTcPKc=;
        b=LyCSPSiRD4t4EB6Xpi3+5L/6KeCsWqIOexrhxGfyEMiLxEMMjI+1lSlSFCScIKbp6E
         ozvI4oweYNxHKnBtlb2JOWciodNTgPICO+pqtmPZQg6vnq3TIS8xo+W7KAgRHVY54biV
         95kNRDxK316CG7EvYf7oDyVZx6vU2870RfMid9acbzt9akfeLD4ccKI0pgyu9uEK6Jmc
         8BNFvNLT/dWu8IL1xfZvni343h7xAQSqyjL34vcTcS4XysTmRww3ujsEGX/2qYt4TOm0
         iliiofh/bvv5/mIw5Z52a+1sN1C5ZM2p336NehMtgoheHCBh8I6qHBclUxqsMhzO/Gor
         XfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXogembNSt5CRvVsCnfkKdcxuUtAH1xbYfqWxceNBIRGaCwn3jd438WEJ/70xq2uIypBBxJjByZuIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAVj8XSNTWbpX+zcqLvsTO76Ye81Q1iLvfUMnW3HwlofgIBuIW
	TuUDMSusgkaRWy8sZgBN/YN0PrFnWHejpCn8vpHOwAkjQSqrywKwFjgihda3j0Vfk/c=
X-Gm-Gg: ASbGncuAP3VTfA7iWo42EfLZx0supMp4b4u/3iHfGiGNrRxvR5KkhtHOOhlgTUGVVMS
	Bv1M9LqLfiDvAqie3MV/q7FtdpqJ3m91sadZ+0nnDUU4j1vPXD/aGq1xY0RaS1h/cAgSzKjnzdr
	mqPThutgs1MpGIhZyPC0G+GCCy/JB04SEaLM/hxXDhbI012vukEzbYsMb8p+U8Ix/uawB1OpWgm
	g4a2gmJ4su4cZYsynr0rW7uEfbO+luinLQI14jlkJB9HbyLy77udwB/yrJuBIqZ74+fnGB1H1WI
	nCiamQbGFgE2JSEFM2XtkkdUrzKzhmohwtXxGvRt4DegtZZC62svPouaY0RpYmz/elvqxFO+wSM
	P924CEQMtz/isN6YpioAXE213Sws=
X-Google-Smtp-Source: AGHT+IEXBdH7hOKCYchLvLuyRxWERSggcVeU0ucQiOEho39r1QroFT39P8ZPoOlum4WPte4UN4GaYg==
X-Received: by 2002:a05:600c:3495:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4538c404805mr22605405e9.15.1750946979761;
        Thu, 26 Jun 2025 07:09:39 -0700 (PDT)
Message-ID: <c65aa0e1-aeb3-4af4-accb-037880f23166@citrix.com>
Date: Thu, 26 Jun 2025 15:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.20.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <24bc698d-4e60-4f34-9b8b-8b1f315655f1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <24bc698d-4e60-4f34-9b8b-8b1f315655f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2025 7:41 am, Jan Beulich wrote:
> All,
>
> the release is due in about a week or two. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant.

de6a05a8a0d5 and 1ff7f87e8f4f?  They're the tools side of the px/cx changes.

4c3ce492ede1 is another one although I guess you've excluded that one on
the grounds of being an ABI change (albeit minor)?

~Andrew

