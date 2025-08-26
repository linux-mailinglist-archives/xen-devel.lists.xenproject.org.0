Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95116B372E3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094969.1450128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqz5t-0004Lp-J1; Tue, 26 Aug 2025 19:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094969.1450128; Tue, 26 Aug 2025 19:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqz5t-0004JI-GI; Tue, 26 Aug 2025 19:12:33 +0000
Received: by outflank-mailman (input) for mailman id 1094969;
 Tue, 26 Aug 2025 19:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xnf3=3G=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uqz5s-0004JC-7K
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:12:32 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bc10260-82b0-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 21:12:29 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c7ba0f6983so131362f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 12:12:28 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6c4e9078sm5397995e9.9.2025.08.26.12.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 12:12:27 -0700 (PDT)
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
X-Inumbo-ID: 9bc10260-82b0-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756235548; x=1756840348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=34Eal4dX6AMRvLG2+vt1TA4usx6f7FZtYJdKjHzuQ5g=;
        b=HPu+pFYzfMLnm4rfJw+kIT5FmpanxgWuQZYwldwmq7/OPAqeUuz18bwRK4ccJOwiNX
         MOwAUbLztqBFFmmzkmS/4Tk1NbdevOWutTAa1CNeypqCqfrasi1EwC98NBEW7O3nCCh3
         dCVcGlNUuAoyydYGmwOg8R1Klddl06n0X58Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756235548; x=1756840348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Eal4dX6AMRvLG2+vt1TA4usx6f7FZtYJdKjHzuQ5g=;
        b=C3MaEZDsO4YMEKa2qu17d/fk/CdV3XB+2093YtHeEwExZLGBP8qDz6ULI4R7+yuAlW
         9FzGOlP2hIqlcZyYwgqf3Qrf6FXPKie4+BA1D0xv7EdYafM4F9Id7sio0MhJoqCW2XTK
         q1pjmclaRi5/zsQsuKPKZjHtKwGbA5I2nZx9jywdmzv2BEkrK8ctLEbPlPEOw9yyHMxN
         q6UjH2svYuHVJmS4z5rCzDSxSUSompHkRhdwJyeapUc2SGUUt99ZPT5PhdfpvjeGsEX/
         dUsXUlK7G4rpq/FEypoheBF4R4sndzzkKJUfsq8uOK1gvcCyPspVk5MtZDAZcYRK475+
         bKRg==
X-Forwarded-Encrypted: i=1; AJvYcCWQN7fCHLW5z944/NFmlzhHoqYBRpQpTKeSNVcXWQEK4roJ90WrnGRZKL9J0u6d2tnMK2nwV6GjrJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD9hvcZKLho/j6eqjGYf0TzE0FMIGpc2k5zrSYCHW7bRnKv4wh
	zA00xaR1bGD3Alyi+6li2u7TI/jdjr5S0vA5LY0muTwTPW1vEgioI/JIE6G3NBhRsgotBoUOJWW
	gbnNp
X-Gm-Gg: ASbGnctQbpPb7aIoZfKtF9izV+wHdGOxYaYE619X3L0LSERJMZWd0eh88VQSN9CpxQo
	WxNSTKNEtOoHVfcNPmUaFFobHXPLVPPaIaXUpaaTTZF4FifhQeUa+5rpJsKq+AOzP5ekuvw8pHz
	7xeyUQr9scixCOO4vra5+TkZ/mQDm4L1t/14+YJ3gMcto0sJ3PFh97xBP4e9cn9E6WTU0U81g4+
	sjyvxpWiUhP7QD4Oq3OkDG+mI2rHwM7dfJu5WDWLWLssezUmvZUUGZs3ee81YhdBksML7LvQ7NF
	NLhjsZct9wQy0oZ6W39wVBNqhUjPHfF7jCJG7RhPk8SNtl61Y2KFQQroahq+gF0hx/UrOMLEBdc
	vgFP8h0AbRJX7nmYEgO1BHxNy8M4N4s8NABMWj5YqM6XSWZkO1g4zAjjO6kiQrv3zBNu6E21I32
	Qdeg8=
X-Google-Smtp-Source: AGHT+IGX6xgKzfwqKz/dB20PKAAZhhlZHriXXTJkK1MAstOI1E01sfvmJT3Fz/vPmfWHG8vBTaBSaQ==
X-Received: by 2002:a05:6000:188b:b0:3c4:9c59:52e2 with SMTP id ffacd0b85a97d-3cbb15ca24emr1911641f8f.7.1756235548127;
        Tue, 26 Aug 2025 12:12:28 -0700 (PDT)
Message-ID: <e31bcf2b-50f9-42ca-ad17-e746652c1dd2@citrix.com>
Date: Tue, 26 Aug 2025 20:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/08/2025 4:50 pm, Oleksii Kurochko wrote:
> Hello community,
>
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
>
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)

For FRED, That's all that's out on the list.

I've got an update to 4 almost ready to post, this time getting to dev
complete.

Unfortunately, I've still not managed to get any time on real hardware
yet, so FRED will still be experimental in my series.  (The timelines
were originally compatible with Xen 4.21, but access to hardware has not
been as forthcoming as hoped.)

When I can test on real hardware, there may be bugfixes, and I may be
able to upgrade the status if we're not too far into the RCs.

~Andrew

