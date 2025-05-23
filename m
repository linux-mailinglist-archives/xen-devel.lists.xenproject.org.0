Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F94AC233A
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 14:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995735.1377966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRy8-0001TZ-Dr; Fri, 23 May 2025 12:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995735.1377966; Fri, 23 May 2025 12:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRy8-0001S2-BD; Fri, 23 May 2025 12:57:48 +0000
Received: by outflank-mailman (input) for mailman id 995735;
 Fri, 23 May 2025 12:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ep+V=YH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uIRy7-0001Rw-6o
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 12:57:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 853625ce-37d5-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 14:57:45 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so76011615e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 05:57:45 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a366e08747sm23449171f8f.95.2025.05.23.05.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 05:57:44 -0700 (PDT)
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
X-Inumbo-ID: 853625ce-37d5-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748005065; x=1748609865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MZPfaqjK/oRJFHgil/CdCmK1hYNGccxbjdeNMoweZXc=;
        b=q76dSIg7ho924eJ1X1dpHwMjxYyOtIzrESoLVZBNHhWWnogai+3J8+6XirlrDu/i7B
         QLAEwwg2QJWBFYQxyVHodSjN6A+TcrDmMTz+jjZoBcF4WSL13wULToGLVZbaZMjC9omP
         w4WGdDDc//p5ehKvokk8POCiGD98eIlj8gOCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005065; x=1748609865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZPfaqjK/oRJFHgil/CdCmK1hYNGccxbjdeNMoweZXc=;
        b=s0A673m3+3Ylkq/dzlYoeQwsldsEgW6JZZGu27rZoZCZBegFuXWoXEqGkik5/WJeUH
         If/JDBpGM2EOR3NPZCd81XjAxLlF/1+hliP3N6sUWGcy/EDAl8287+kIPOErw2y1SzxI
         dSg3l8gWLlzCuv/7QCc+HIBLEnCJVvlb2Bf7IGCesBw7MKOXvDP4P0z6RXOQvrWON6qH
         64RxIRtZzEt2xbiyi5GrPuCsr2LE2S28OIL2hQLLF264IBKdfU2WOuBx+ohniLExW0kO
         sFNmEFIQhFeOWBfgPMpxd/qerrpOrdGCs2iOSZhYcNP9lh46LVpnctPIsxJhMy5Jn9Pn
         nB/w==
X-Forwarded-Encrypted: i=1; AJvYcCX1odDFHRb+cPUOtZSfIDOJtd8KtkEq0iMLkW6hUjZ2pb7SVJ7gryzeXOBydYi8mTkyTWUkXrQ8KS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJYxLJuCislhjcEqDcW0PBjcxo1ku0W1Ybsd4YOAEvGui1Shka
	AaG91lCBmSywRCLMQSN4Zmxsc7e5bGQl5OWBO3Fa+MCNrPMWjWS+hoPWokywO/SsMXE=
X-Gm-Gg: ASbGnctcqD9ERtDSTKii43yA7J3oPaSKJ+BlYJlrKXGdSMleLQMYi3xyMu2Q9u46Xzu
	hconii0lEBStg5xjLi9MsdnDb6LvcR/TCoqHa6aJjvgF1f6lgsUAN7uY9vslHyV40pS1rzCLuic
	Zi89L0dNb2N/yrPHcGqmsQyqz7kJxznDBxuSE2OmJUEycVyvaA1pNVBaKnavqWa/LXmDaNll3uL
	+PDwTqT7O0QzNkbHdsoHZ99F8AmXanVNEdYezhhAhaBL1QISwLz3vUJ3Y6Q4HGFlM3EwsFXcziU
	V8W6bf8KUDtdTH3SkKUjsLvcE9y3aEtmKwWcKB1Bx4Qe4OgsFllqWFFk/E3korcUVLBl306o6RG
	QavoB+EkKXvZRrA4B
X-Google-Smtp-Source: AGHT+IGgKAYE0eZYEoknWGJOxGCeBHfXSZcNpNTOt8IjWdFk3nb93TDIQ6MCtWyOpNkDI9XmjZn58w==
X-Received: by 2002:a5d:5f91:0:b0:3a4:bafb:add2 with SMTP id ffacd0b85a97d-3a4bafbb48bmr6093623f8f.0.1748005064661;
        Fri, 23 May 2025 05:57:44 -0700 (PDT)
Message-ID: <7486eb78-50e8-4959-b494-5bd58e123af4@citrix.com>
Date: Fri, 23 May 2025 13:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] eclair: allow and document use of GCC extension for
 label addresses
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <d9dbce35d6857f79a21b68e4edd45f0febe3d3c9.1747984747.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d9dbce35d6857f79a21b68e4edd45f0febe3d3c9.1747984747.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2025 8:20 am, Nicola Vetrini wrote:
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Ah, very nice and easy.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Is this dependent on the updated Eclair, or can it go in now?

~Andrew

