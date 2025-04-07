Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD0A7DBEE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939709.1339702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kO9-0000P8-4A; Mon, 07 Apr 2025 11:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939709.1339702; Mon, 07 Apr 2025 11:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kO9-0000NE-1U; Mon, 07 Apr 2025 11:11:37 +0000
Received: by outflank-mailman (input) for mailman id 939709;
 Mon, 07 Apr 2025 11:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1kO8-0000MG-2E
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:11:36 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e9bef9-13a1-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 13:11:34 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso3129618f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 04:11:34 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020da22sm11979682f8f.68.2025.04.07.04.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 04:11:33 -0700 (PDT)
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
X-Inumbo-ID: 10e9bef9-13a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744024294; x=1744629094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QsK/IA6gKu3oErTJ5LcnbxvjCNQKvD5QanOOkMufwis=;
        b=m9haI3RLpewr0gK5s/OgSm86bC5BpeIBqENOn8KhetLSeCpDfnnYJBUCnQjn93jQ1H
         qTovprox38uyB36CUz0o5ucxkRn5UOuidRqVl2GjfTf9c3hzlqQYWZMzrksnHYORofjG
         KRWpFRdhG8j6Vcvo0cI6KvEEQCHrXYiDtag7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024294; x=1744629094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsK/IA6gKu3oErTJ5LcnbxvjCNQKvD5QanOOkMufwis=;
        b=kY9hlPrvPZkJlLbHjTgUQzdG1AOcLYVVeOAl0XVvkZHZX7/DtKYW4yrPlAFDxZ9fqF
         H657M+c9dPTINdxuJHHLedCp4DRPvByVjTOzVfTMXoeZNnlkbjRXHtC6v/nPBAv27eIP
         jG/uFbfOB4hV4FO3c6f3qJ4Hl8vSvwGlMR9c3PUgW5n9ueXQldUWbEy39MdJ+D07EEFK
         9BszF9jSmpou4jDHqOEJAAChxhHo2leoPxKIzff6IL4bR8mzivTFEbPUPxoHxoXmWMzH
         cHfvS+PZgJA6eahZdpbzx2jn6pIA91aNBOBRglBVQhE53lb8SiyPJlNlvIYwZ05OaLMg
         p4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX5oALRrYM881IiY4MSWiY/zK2k9MSpXBeU8t7HPkkwuWpVjgjJc49mgHTiah2Dyw7HqKA7EkQHwhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPEGKHlpTQCaxHoDVR/qziWHXhya4dEg52/bL4y/Io7eGN+pJV
	6URbZe/OFx3I6n39pW3FAfP2IUOp9WiIquTjZj0nhOQb3ialJ4RcKFw2uMPM7A0=
X-Gm-Gg: ASbGnctP3a2+XxiNOUZiauJU6vTFup00ie0n/jcFy+Wj6WrKjiTCdgQzTXLWNJEvGQI
	mpVDXbMfoV8dJb79KXrAHlLM0NHroeBywFmDsjwdlzcU6Xc/LzI7bTei20Ydztx66j2O3XCQmN1
	XkK084ERVKNbAXTrFKJQVxl2mRG7RoHkl1bYDh3F8eUnB49jytuUpqolriw+uCkYUomrjOkGNrT
	9DZ2Z0ezTc7aBmAIKKcfjvlNZz8wgE4M2/cdr0lrIURs3NMxwf+XzlHtuIkrJe8MyyFUVt24mxh
	WobIt3wBOIEID04rmofrDkIonVcxR4WbSq9TwFC3mzUn2UpQROs3bX9umsB3sN6Z26vhtc/FpCT
	u4ApCCqaC7g==
X-Google-Smtp-Source: AGHT+IHAIYzfXbc4ATaFMbOee+opL3LPuHsEkFoyV8LoycoF1102OMaQzIUDPenTXCRFxGstUzzoIw==
X-Received: by 2002:a05:6000:4310:b0:391:3bba:7f18 with SMTP id ffacd0b85a97d-39d6fc01096mr6715031f8f.12.1744024293825;
        Mon, 07 Apr 2025 04:11:33 -0700 (PDT)
Message-ID: <8cf7cdea-3675-4e82-8972-223949c26b6f@citrix.com>
Date: Mon, 7 Apr 2025 12:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: do not use `-c -E` compiler options together
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20250407110938.68174-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250407110938.68174-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 12:09 pm, Roger Pau Monne wrote:
> It makes no sense to request for preprocessor only output and also request
> object file generation.  Fix the _libxl.api-for-check target to only use
> -E (preprocessor output).
>
> Also Clang 20.0 reports an error if both options are used.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 2862bf5b6c81 ('libxl: enforce prohibitions of internal callers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

As this is impacting GitlabCI, it wants backporting (ideally everywhere,
although I'm still accumulating other CI fixes on 4.18 and earlier).

~Andrew

