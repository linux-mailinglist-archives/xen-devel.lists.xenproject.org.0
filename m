Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC37A67B67
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919732.1324109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub8V-0007wf-RU; Tue, 18 Mar 2025 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919732.1324109; Tue, 18 Mar 2025 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub8V-0007ui-Nj; Tue, 18 Mar 2025 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 919732;
 Tue, 18 Mar 2025 17:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tub8U-0007uc-Uy
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:53:54 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d77fe8-0421-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:53:53 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso5164942f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:53:53 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df402esm18471441f8f.1.2025.03.18.10.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 10:53:52 -0700 (PDT)
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
X-Inumbo-ID: f4d77fe8-0421-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742320433; x=1742925233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NH7SrMNrma10VbQJdSpvzoRp+AR8UrXCgsGTGsIG4J8=;
        b=guFAJeHn9uqDJ3Ayy1qy7P2lCwxtnD+M7l9zcYkjIhXb8tY8DsH5C6dSPNNbWGj4kq
         MeQVon/pq9WqvkQF1F1b89IalK8dA5+XAwoOIPI/Uxqmg3PhRv8jgwHXZ+OPZuhWCvt7
         ch+2+DwZf8WYoaFaIZ4iJrk01F4gqVZGH+TdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320433; x=1742925233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH7SrMNrma10VbQJdSpvzoRp+AR8UrXCgsGTGsIG4J8=;
        b=XMNdlKvCBQbvVGw2HVZTx1aGRIIeNPWvV3PtCIf9r0pwn7DQjQUPo4VIf3Y4xOIxtr
         P+hhC2Nwpi4XH6SBxIg588NetFqxW1TChY2uENxDosZNXEBJJtaj9ky/FmJHuwlNV/fS
         Dmp+mCkOmIEe/gk0RtwD7nBrYxREE4PRksQ+EMDYu0YTBUTAy84KnWVb+KGjkUFS1oZC
         xjprksk8k1fK1jnHryumPWxLuHfB6apst+6TZiQo5rRXWIBgzEDjJQXITq3y1BUTLtGK
         GPB6zHFYEJ4ub5X6fBVinZG2Pxztd54Hqj/rvSF3ulQB11ydWY3NzfvfmS5leXtRj077
         NhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwjW7un1nXBRK61oS53O2b5tDk6Dioj5RuAzy8jplgl3Cb3DLvz2UTayAL5xR1QJrMSXz+O0HHFXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7GYpQhkUGziIJro+O0mHE48HIBHLVXKBgX05y1KYjV8+muIEw
	GbYQimBgSO46Zh0KtGkTsoWixCPx13keWa5+KvYjFnL4L8lzvHkTa9X0oB4muQw=
X-Gm-Gg: ASbGncsCVdzA8lnUK3fS/Lg1s6v4/xOrzH8pY5HTRxX4gXQgoM3LtykpCNeiOiVJATS
	ezUz3PfOE50wrR62km/vEJfUhCLrOENz75Hnnd3tonSfTlT/VjpSHJNxoF4uyoCw8sQ2yhZ+9Pr
	kskSaWU/SIyqTeXTgU9+/YDbD4Af1T/2Hc22I5FltA4PpaGp2M+iImSSWNiaAKQnco+7mgMyXPC
	wK/hpl/MJKyD/hDAxthh/od7qh/g5KoKEKa+815hpu6wpS/sR9MrRQ01Fmj/PFiBcOC5ozNM2Et
	+bzvYQzK3vrFGwwup+57p3VmQJAQd0tFx4eOEIGmVtDCrF6yh4s9T9AdSoImyNQrEuY9tl+SvYH
	GKPFMlbdR
X-Google-Smtp-Source: AGHT+IGCM4igRf+IcUPC1pUHbBvXqKYMhqiSvnD+Oad2zNOR/Ccffv3IHOo5u24ROnsP1Ne7DHZrpA==
X-Received: by 2002:a05:6000:184e:b0:391:4c0c:c807 with SMTP id ffacd0b85a97d-3996b4a1f7cmr4677082f8f.53.1742320433273;
        Tue, 18 Mar 2025 10:53:53 -0700 (PDT)
Message-ID: <e894fbce-96d2-4aa8-871b-0b8ec24becc3@citrix.com>
Date: Tue, 18 Mar 2025 17:53:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen: remove -N from the linker command line
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318173547.59475-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> It's unclear why -N is being used in the first place.  It was added by
> commit 40828c657dd0c back in 2004 without any justification.
>
> When building a PE image it's actually detrimental to forcefully set the
> .text section as writable.  The GNU LD man page contains the following
> warning regarding the -N option:
>
>> Note: Although a writable text section is allowed for PE-COFF targets, it
>> does not conform to the format specification published by Microsoft.
> Remove the usage of -N uniformly on all architectures, assuming that the
> addition was simply done as a copy and paste of the original x86 linking
> rune.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

-N has been stripped out of other parts of x86 too (hvmloader, notably),
and clearly isn't intended to be used in combination with a linker script.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


