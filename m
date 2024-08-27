Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CF960DAC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784122.1193519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixFV-0007pJ-C2; Tue, 27 Aug 2024 14:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784122.1193519; Tue, 27 Aug 2024 14:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixFV-0007nn-8O; Tue, 27 Aug 2024 14:32:45 +0000
Received: by outflank-mailman (input) for mailman id 784122;
 Tue, 27 Aug 2024 14:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sixFT-0007nh-Ba
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 14:32:43 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 372ca944-6481-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 16:32:41 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86859e2fc0so692647366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 07:32:41 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e594e815sm116071666b.197.2024.08.27.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 07:32:39 -0700 (PDT)
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
X-Inumbo-ID: 372ca944-6481-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724769161; x=1725373961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bX3yhpUS8Udc/Fy86+W8abe82JJZNRwGknibPZYS9ZM=;
        b=LvhbalI8/mute3KW2RfZispzJxNrRgJiRJ3JYKKXdoMI2M+Yi6BRD/4MJpyGdANUfc
         9I3wHfYN4Io8jAQbOLZoNYa+YC6dvaDc1rGpIfpD6LIcHR/sLYrifMD1vy6D20VQ8T2d
         pE/3KLIPMInHVjrsRTRV/CkHUvZQmGCsV5O/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724769161; x=1725373961;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX3yhpUS8Udc/Fy86+W8abe82JJZNRwGknibPZYS9ZM=;
        b=oE5CSdmzm96RvT4P7p0VY/cF0PYLX7Ys/i/ivIF5IaL8HdL02UPMsee/DCWzt9RxK2
         /EqtkUA5g1p2yFdbDYdhzxrx5Dk/3dZT8YMivboZhkAMWbaSAQBB4gDRM84/Y29WmPtR
         iew/eyLcGj70Sb0jVZ8+UWKD2wUlaakBgf07i2mogand8/Hja6TE6JlGfVi5VzkLDqy9
         ZaH7oQWpxefy3jvh66JkVHHjdBhtEJ+AbQm2G00nLVUlG+3fdLPyBGmeNlTlPBH0d6M5
         0ys0kqfmm2sRwnu98Pok+kWobplJeH2v75vuDZWkijlfrDJ54Tc0AH9lfz5iMkFhrZqT
         XGMw==
X-Forwarded-Encrypted: i=1; AJvYcCXYHReyfMlHtgt5c47KKsoDAKN9J/x9zwuqTQB6P3xWv1xhIGo2jreIO8AGYQAcuCaA6KaZMVmeyDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcMjKKQr46lXvTTvnmktEnbtlPj3jZxNE1nNUOm7Q6R+Pn10Qf
	HDuGxVGyHNODfTlK683iE1ugm/ajPA5FEwJwG18axsinpNBDi+Jhtcirmr3b7Lk=
X-Google-Smtp-Source: AGHT+IFzjnQ51A8bA7YNUS0a9rbS5W7qBsYr2TXf3NM7pT6g7gpdVYlQoaMygPBlDN/RJSTobPo6MA==
X-Received: by 2002:a17:906:6a23:b0:a7a:8e98:890d with SMTP id a640c23a62f3a-a86e39c9e11mr261384566b.16.1724769160253;
        Tue, 27 Aug 2024 07:32:40 -0700 (PDT)
Message-ID: <d63df810-3f95-4c99-90fd-e509c26fc4fe@citrix.com>
Date: Tue, 27 Aug 2024 15:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of
 hweightl()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-8-andrew.cooper3@citrix.com>
 <11da1350-095f-49c8-bdf0-f5c83e9f0d39@suse.com>
 <70047ef7-ca22-4eeb-9510-09ccdf0871c0@citrix.com>
 <73309650-3912-418b-b2e6-a60676519911@suse.com>
 <c54f7015-abe1-4834-83e3-29a2cc854d85@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c54f7015-abe1-4834-83e3-29a2cc854d85@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 2:25 pm, Andrew Cooper wrote:
> On 27/08/2024 2:00 pm, Jan Beulich wrote:
>> On 27.08.2024 13:50, Andrew Cooper wrote:
>>> On 26/08/2024 12:55 pm, Jan Beulich wrote:
>>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> Again, this is modelled after f[fl]s64() which have the same
>>> expectations about the BITS_PER_LONG != 64 case.
>> Both of them are fine afaict. fls64() has an explicit intermediate
>> variable of type uint32_t, and ffs64() has a (uint32_t)x as part
>> of the conditional expression achieving the intended effect.
>>
>> Anyway, why not use hweight32() instead of hweightl() here? That'll
>> make things very explicit.
> hweight32() doesn't exist until the next patch in the series.
>
> Although looking at the end result, I can't figure out why I thought it
> was necessary to transform hweight64 first.
>
> I'll swap this patch and the next one, and then use hweight32().

I've found out why.

The hweight32() patch is the one that deletes generic_hweight32(), but
generic_hweight64() uses it.

I can work around this, but it means keeping generic_hweight32() around
and deleting it in the hweight64() patch.

~Andrew

