Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97699D7E0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 22:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818889.1232181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0RKR-0002Ee-Cn; Mon, 14 Oct 2024 20:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818889.1232181; Mon, 14 Oct 2024 20:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0RKR-0002Cv-9S; Mon, 14 Oct 2024 20:06:07 +0000
Received: by outflank-mailman (input) for mailman id 818889;
 Mon, 14 Oct 2024 20:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8R=RK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t0RKP-0002Cp-Ky
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 20:06:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb7847ca-8a67-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 22:06:00 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so2161316f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 13:06:00 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430d70b444csm164748525e9.33.2024.10.14.13.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 13:05:59 -0700 (PDT)
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
X-Inumbo-ID: bb7847ca-8a67-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728936360; x=1729541160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=We3nv6qTe5WU/pLKfIuGBL0H+WZavctLAtubwy4suCo=;
        b=X1Vucseh1cJNN3akmhODWfG6GFbtv1ES4YoVxGZsCNj/NQJIuocmHP+62dgUsrAHbf
         x8/xpYUNGfF9j9LsCindPyqZLHx/aPbeGVLUcVjF9FVDnOoao62LplBjov2zoZwrpwQG
         gW5l8FF/pczrYGjvaDPssTMllx5wNRS7IA4iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728936360; x=1729541160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We3nv6qTe5WU/pLKfIuGBL0H+WZavctLAtubwy4suCo=;
        b=qzj8kpDVAKmFIRBorQRZQ4ErqxpEn6ohL0/HVeLxIAA7eWxgMHL5Py47Im7ne3tOjh
         05/Axc6mkkfArY8VZRIZcKNYnq+MQ8ZUnUwFa8ZERk9CKkuSiB9rEKg48W66CRck63zf
         07VuA4iMErVlTj1xzIWaCFIwR91oVwU8pfFg5u9eopkwwUlPkEt9iWHMVlmQjs9fhdS1
         ptVPyrd60rjOT2gdjjwmIGj+oQEMLv8AKYZU53V/hVw1AEHfGrkAo010Fl+urhHvDO1c
         /qGJpkBTzts/DMTDhhXKAWzlHkbaXBPVjcQqZ17LP5BC08vpmIEuzQG/dm5RYzFx6UFF
         Ui6A==
X-Forwarded-Encrypted: i=1; AJvYcCWSBAANqxwhMv4bw8h2OfmmmDnN8ZmZQE4L0eIQPZPXsvfHtlZEUPOZl+RLeM9omMNX6Kc2WDxtXLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTsMv8i5xbFBkGgQQDFWMl8qeLZxbfQMTyRFdiwhiaMzwD2qxD
	WrJSsh/3wcyQ42MqeRzS5eonDr8h/DR7JPVt+StBsK7v9ccS2ldWDylHao5wnM+VI6cC3bfqBpM
	+HcH+Sw==
X-Google-Smtp-Source: AGHT+IGk0iZhliZHyiTz9ABDsoGjPH/jqVhvc8Z2hNC77V10JFJmheRD94+UkDRzWwpfoIt6cro7kw==
X-Received: by 2002:a05:6000:12cc:b0:37d:41df:136b with SMTP id ffacd0b85a97d-37d551ca167mr7292976f8f.13.1728936359799;
        Mon, 14 Oct 2024 13:05:59 -0700 (PDT)
Message-ID: <dc7a4441-b082-459d-a954-78f43d7d35bd@citrix.com>
Date: Mon, 14 Oct 2024 21:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen PAT settings vs Linux PAT settings
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <Zw1iSuLD7473m07N@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zw1iSuLD7473m07N@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/10/2024 7:26 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> It looks like we've identified the second buggy driver that somewhere
> assumes PAT is configured as Linux normally do natively - nvidia binary
> one this time[3]. The first one affected was i915, but it turned out to be
> a bug in Linux mm. It was eventually fixed[1], but it was quite painful
> debugging. This time a proper fix is not known yet. Since the previous
> issue, Qubes OS carried a patch[2] that changes Xen to use same PAT as
> Linux. We recently dropped this patch, since the Linux fix reached all
> supported by us branches, but apparently it wasn't all...
>
> Anyway, would it be useful (and acceptable) for upstream Xen to have
> a kconfig option (behind UNSUPPORTED or so) to switch this behavior?

Not UNSUPPORTED - it's bogus and I still want it purged.

But, behind EXPERT, with a suitable description (e.g. "This breaks
various ABIs including migration, and is presented here for debugging PV
driver issues in a single system.  If turning it on fixes a bug, please
contact upstream Xen"), then I think we need to take it.

The fact that I've had to recommend it once already this week for
debugging purposes, and it wasn't even this Nvidia bug, demonstrates how
pervasive the problems are.

> Technically, it's a PV ABI violation, and it does break few things
> (definitely PV domU with passthrough are affected - Xen considers them
> L1TF vulnerable then; PV live migration is most likely broken too).

Do you have more information on this?  The PAT bits shouldn't form any
part of L1TF considerations.

~Andrew

