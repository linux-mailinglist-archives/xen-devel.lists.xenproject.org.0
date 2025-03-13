Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE11A5F333
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911965.1318336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsh53-0006PM-SJ; Thu, 13 Mar 2025 11:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911965.1318336; Thu, 13 Mar 2025 11:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsh53-0006NL-PJ; Thu, 13 Mar 2025 11:50:29 +0000
Received: by outflank-mailman (input) for mailman id 911965;
 Thu, 13 Mar 2025 11:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsh52-0006NF-EE
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:50:28 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b13900a-0001-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 12:50:27 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so682671f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 04:50:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a12sm1862639f8f.75.2025.03.13.04.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 04:50:26 -0700 (PDT)
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
X-Inumbo-ID: 5b13900a-0001-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741866627; x=1742471427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwD2InZFQbMmnKmgNnnxw0QuykR8zp9a4UFZ37MyqrY=;
        b=ZzLl/55ubyeX8V9tVw72haCv8UTrzYGV8/k9ur5tgZxeDk6WfEHfj6CsjFJFrRXbkb
         hdlBhDU88YpKaMlzN9kozx712b1hZqknW7tJuUAlbNwNw03lNoMXLxX1yN45jw8GVC27
         xUFOSxC4UvYSX+OgxAZH+mLT5mWCuckGDk3/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866627; x=1742471427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwD2InZFQbMmnKmgNnnxw0QuykR8zp9a4UFZ37MyqrY=;
        b=xJMUS6ptixqZiqPWxHBe+ZlT73UJXy9IAgYU2eirlZb3zw6pAoY+WQhpuXHpAyifvi
         Q9/fOyS02xcdyHztlyf9IG3DtXT9M0MUCgPD59tNewTWE/Yh10BYJqurjNrWBnAUxYND
         fNapLwrMx6Z06HWZ7Nxpvo0XLCK4BoYlvcAhSh1MF666bXBi9sm/an3ZMrczD3X5oXDv
         xDaZW8JW5kWtOIpdfdApA1ZTXzPVu2CH9juMB+erheb1cXMceYtBHxoJDjyutvYieDXC
         LPCRiD8u8YqUfaDrIfV0g4VXl/RMVVDQf7Z/tjlLNysBbNuQ+M7kNwRhgNK00pcb2Xbx
         m99g==
X-Forwarded-Encrypted: i=1; AJvYcCUAmk15VxCzVV3nlUfFNkNBulzMl2Tar59nK1gu+qcoA5Wp0MKmn25ieqiiL1u8T1Rh6zLi5FbPeoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSsi74kFe1ODGuSIaIl3EXIwr5fiLOcrd0lSvIMiGmRWZRhaxs
	ISVQiWakThgfV5p2q13q5LdV3I7ebqyTtA++9u5GBPf8FZ23Jv7XFlsO96IEYPc=
X-Gm-Gg: ASbGnctJNyx94HE4clzZVHcKth/P62hO6WAfL9Nxa9R+hAaYr+hV/kdWtZFrdtIhmjj
	KUXsZUyhcbO1n6LAQY0scyUarkqi05Zzk+kRp7/zc2CvKjtl8q6UBUJiEuADSsSNNVzBtLwgaGb
	HgcG4qOaH5xhd78JDaw4xE8a4ouPnZm1LtC9E6bpejvWgp4YDEtelzJXlU3fAT5yaFeq2ZynHrw
	fVZ9XnSFz4ZZFET28v425+azWgEVuK+B/FTiDDxguMvcHeN46Eg9s7CRsNN9pTqHdS+zOrQpBz8
	QWUEhKwDL/CV9Ne0prmJC94iOMd0+uZFUDR1x74D0ZzSRO+IWEVHuOwpQRmAoe6YVzbH6CKbQs1
	I2mzVhGY3
X-Google-Smtp-Source: AGHT+IH0njngF816MrTtIZXSTDaGJDf+DIm+qbChlmUNNc5jL8vq2dYxUX+8iYEiPftn9kj2lJeJqw==
X-Received: by 2002:a5d:64c3:0:b0:391:2932:e67b with SMTP id ffacd0b85a97d-39132dacfdbmr25419003f8f.35.1741866626689;
        Thu, 13 Mar 2025 04:50:26 -0700 (PDT)
Message-ID: <d58143e7-22f0-40f0-a391-1c0308796d30@citrix.com>
Date: Thu, 13 Mar 2025 11:50:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] xen/mm: Exclude flushtlb.h from mm.h for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-10-andrew.cooper3@citrix.com>
 <cd4e4e69-9b54-40bf-a9e2-88191481487d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cd4e4e69-9b54-40bf-a9e2-88191481487d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 9:13 am, Jan Beulich wrote:
> On 12.03.2025 18:45, Andrew Cooper wrote:
>> alternative.c and livepatch.c pick up flushtlb.h transitively through mm.h.
>>
>> Fix these, and finally resolve the TODO in microcode/amd.c
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
>

Thanks.  Randconfig thus far has found that
xen/arch/x86/guest/hyperv/tlb.c needs an extra include too, which I've
fixed up locally.

~Andrew

