Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4F9A6CE4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823622.1237641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tkn-0005ij-KA; Mon, 21 Oct 2024 14:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823622.1237641; Mon, 21 Oct 2024 14:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tkn-0005h5-Gv; Mon, 21 Oct 2024 14:51:29 +0000
Received: by outflank-mailman (input) for mailman id 823622;
 Mon, 21 Oct 2024 14:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tkm-0005gz-46
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:51:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2eae451-8fbb-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 16:51:27 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso470946a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:51:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b7d5sm2031801a12.75.2024.10.21.07.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 07:51:25 -0700 (PDT)
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
X-Inumbo-ID: f2eae451-8fbb-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729522286; x=1730127086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9qW0fa8xJC8nQtELc0+zoCH5xJqyCANSk0j8fzTp3w=;
        b=mMA+Q4h7RBr8i2lbW7Yj88uhgq+m8EIkqLxaQY8Dwl0sRCe/if215oKZlq1eFJmbou
         gufXd3cqGCtBHvGA8wvLvRT6Ri2oKSKAw8smMrpo2SWxve93ZslmIvYK0IhoXA6jcwhi
         KdVTeKhONzllIcdPxnr6hWDq770iSmXvGUb2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522286; x=1730127086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9qW0fa8xJC8nQtELc0+zoCH5xJqyCANSk0j8fzTp3w=;
        b=D9M9AoKzebpbpPVyfiqk2EmlBCZsbVMstjUw+bH6CIliQCymZykpqwLE6dkTrH8Zp8
         eHrxTUyosDEizycUsmeN0lKEsxG0Ff7Djr7ZYYB0gW/NW0kywz4YTLso/3rFUBji9sAt
         GnMHddd0PcJpiK2eKd1UsbbxYAKSmu2BEQfknp77E4AnbVMEYLPIYwcuC41fIKjac68D
         5BkDxVmWRoW2dar7no3q2t3K5jvWEDvPi+5nIdd44b4x93IzBIdRviamNN96lZNqZuJJ
         3rpfRTR5hwyAX9ZPId/sBMQASxSV+v9eAtDo6M2Akz7mUeT25sM7RVCUgpu/TZ6qtJ1/
         yLdg==
X-Gm-Message-State: AOJu0YwT5Td6XpuHsClo8qHkeU+Kb6OMRaUvKRWJK9H7zVDO0WBSWv/i
	YSTpFRDCUuEFyJe7rzh+TdOB/d8WayBYhtONAnh06789JDtG8GMkkNsKiGBQehc=
X-Google-Smtp-Source: AGHT+IGjh11KyGqEExxH5H8zKnXh3vJR190BND/LkoF9MkpkfmxbjcGVinuP/K3YUGPWNV2M+Swiig==
X-Received: by 2002:a05:6402:1e95:b0:5cb:674f:b0a2 with SMTP id 4fb4d7f45d1cf-5cb674fb0admr5334931a12.36.1729522286428;
        Mon, 21 Oct 2024 07:51:26 -0700 (PDT)
Message-ID: <5970c852-8800-414a-83f9-66392bdbe016@citrix.com>
Date: Mon, 21 Oct 2024 15:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Willi Junga <xenproject@ymy.be>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>
 <ZxZf4nHFhhfyMF12@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZxZf4nHFhhfyMF12@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 3:06 pm, Roger Pau Monné wrote:
> On Mon, Oct 21, 2024 at 12:34:37PM +0100, David Woodhouse wrote:
>> On Fri, 2024-10-18 at 10:08 +0200, Roger Pau Monne wrote:
>>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>>> repurposed to contain part of the offset into the remapping table.  Previous to
>>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>>> table would match the vector.  Such logic was mandatory for end of interrupt to
>>> work, since the vector field (even when not containing a vector) is used by the
>>> IO-APIC to find for which pin the EOI must be performed.
>>>
>>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>>> that the IO-APIC driver can translate pins into EOI handlers without having to
>>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>>> unconditionally when interrupt remapping is enabled, even if strictly it would
>>> only be required for AMD-Vi.
>>>
>>> Reported-by: Willi Junga <xenproject@ymy.be>
>>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Hm, couldn't we just have used the pin#?
> Yes, but that would require a much bigger change that what's currently
> presented here, and for backport purposes I think it's better done
> this way for fixing this specific bug.
>
> Changing to use pin# as the IR offset is worthwhile, but IMO needs to
> be done separated from the bugfix here.
>
>> The AMD IOMMU has per-device IRTE, so you *know* you can just use IRTE
>> indices 0-23 for the I/O APIC pins.
> Aren't there IO-APICs with more than 24 pins?

Recent Intel SoCs have a single IO-APIC with 120 pins.

~Andrew

