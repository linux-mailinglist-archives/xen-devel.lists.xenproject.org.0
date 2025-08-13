Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5FB24763
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 12:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079715.1440441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8pQ-00021w-QH; Wed, 13 Aug 2025 10:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079715.1440441; Wed, 13 Aug 2025 10:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8pQ-0001zS-NW; Wed, 13 Aug 2025 10:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1079715;
 Wed, 13 Aug 2025 10:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um8pP-0001zJ-1p
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 10:35:31 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 395b6243-7831-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 12:35:26 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so58428795e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 03:35:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16de7665sm25028425e9.16.2025.08.13.03.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 03:35:25 -0700 (PDT)
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
X-Inumbo-ID: 395b6243-7831-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755081325; x=1755686125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ece5JrrLOidUkSR6vq4emLTrQMDHU8C4Z3a6nPTuk/s=;
        b=YFoRBP4mXhG4R1h94lyWa0YD6RaNrWI9pqb2bmiFODnPvO8stAyK6Etg6xcFrR3loh
         tJahWFQAnhz5HMA+NFJvE3FbeBsOnFCU7qFb37H1ZPPiAstH6waPKNjJOBDUJTgtntRl
         iAzQMpQtWojj+3h6rN+32hYCBlSTwBNQW0FAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081325; x=1755686125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ece5JrrLOidUkSR6vq4emLTrQMDHU8C4Z3a6nPTuk/s=;
        b=jcb4/psv1Dd/t7kq5FhdNk07PvS6QDqn2yNUCm5O4WcGmNXOVgLcYxcrpMdTv/tdFJ
         t/L7eon99jpA1m9wM9lso+Bd/XES6AGAwb0PQKjtSvenBKEOh5P3D4BoBD8Mw6/yAgW9
         IDLWmL4uFws2aHCRbAqkT0aHLYaBfH27fBHa5FWdsJ2Al/OiUxav2mIE5J2sHCaUEBAT
         O00/RWdDP/L3h51S9BKAWpDuiBZS/DBhFJX4JfhBkKDPFRrr01iYuLFn5ZS7+v7bHv+g
         g0pfil+LEWLjGLcwO+u/mHgX7GnD6IHUqE3xwoUCVmTaXSNau2du96YLfdTavdtrioen
         9gCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgQmE6tz78OEnbv+R5+j9bYCrYKDP3jeN12ky+6oUX+6p41JIA5PVGN2OdIt7UUqT2F3SXdpdVoWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZDHFQ/5b/TxyVtS8ewaW85+P7a+4PhD35tf9ACy6PK7iuQHvz
	8+itNtubIs4MU5mD2woyJImVG2nqsoLR8telgVvGUnPJg6SOwKhtLczveP2ltGA9cfo=
X-Gm-Gg: ASbGnctw3bVrwWGXYDVJ7vSx6/ImeF+hkPZ4/O5+nRiMods2fP5JN7LsZny7uRd3DUn
	QHLjU2w3nmaowOy+GjxfRZmlVRCfmfdBI2j/U7sYO4C97+CWdyf6lsns6i8yvbe+RAPW6bw04XB
	OOZ347Ty7xPxaXsT8q9Bpw2mGToM2X3E1lZhUM+lzeA8wtvwLEfpxRCunYvm0CYVtnmOyIjIOub
	Ayazl8Ag3Dho2ZSB9zUO3GNJZwTKjz075JU+D9ncWXfrlM5gjXGI5aM2ak7tdwFRAWTcRv8JKt2
	csUeiNG14DaXmneJ1QoLE4lZV39ZZLbU0Fs9pz4MKyJogI8E8+AM/1weTdxmOzd2OiU3E390XXd
	uiiXo7fdnfPurjbLP0DD7Xhe70Gnv4aPnguZPvZIDFFArdOVWT6+gyGOBtN4Pr4PuAjvx
X-Google-Smtp-Source: AGHT+IGJqlktXG1jgG7cc2YsLZHTKoViemFa7MYQqD4aHHKCWGLNnr2w9R2pG0jeeYZxHjPoUCFYKQ==
X-Received: by 2002:a05:600c:4753:b0:458:bfb1:1fb6 with SMTP id 5b1f17b1804b1-45a16599f53mr22319655e9.2.1755081325421;
        Wed, 13 Aug 2025 03:35:25 -0700 (PDT)
Message-ID: <b97b30a3-0b26-43f2-95b4-41b79c416615@citrix.com>
Date: Wed, 13 Aug 2025 11:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/22] x86/spec-ctrl: Rework init_shadow_spec_ctrl_state()
 to take an info pointer
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-8-andrew.cooper3@citrix.com>
 <fa34bc4a-64d9-499c-bc07-787d2cdb36ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fa34bc4a-64d9-499c-bc07-787d2cdb36ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 9:27 am, Jan Beulich wrote:
> On 08.08.2025 22:22, Andrew Cooper wrote:
>> We're going to want to reuse it for a remote stack shortly.
> Are we? From the titles of subsequent patches I can't judge where that would
> be, so it's hard to peek ahead. And iirc earlier on it was a concious decision
> to only ever run this locally.

I don't recall that.  I recall bugs which occurred because there were
several variables and we failed to sync one of them.

Either way, it's very clearly the right course of action to take now.

>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Nevertheless, trusting that you have a good reason:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

