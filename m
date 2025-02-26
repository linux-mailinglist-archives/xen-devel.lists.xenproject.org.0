Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06DA45FCB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896509.1305244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGuc-00023T-6h; Wed, 26 Feb 2025 12:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896509.1305244; Wed, 26 Feb 2025 12:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGuc-00021Z-3z; Wed, 26 Feb 2025 12:53:18 +0000
Received: by outflank-mailman (input) for mailman id 896509;
 Wed, 26 Feb 2025 12:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnGua-00021N-Eo
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:53:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d5a315-f440-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 13:53:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390ddf037ffso217638f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:53:15 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba543fecsm20932665e9.30.2025.02.26.04.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:53:14 -0800 (PST)
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
X-Inumbo-ID: a4d5a315-f440-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740574395; x=1741179195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTBSh/2n6GpAUrNY1Dnj/dueOiJM3gjuxziEjov96Xc=;
        b=QsWM6sNl/rq3TabBq1BewNQZ/4SUxvYBdwNRAWS39EbF8Kwr1KEv486nzChXdxpOxx
         zMif87XaB1GBP2UAwHyh6kAKePC4wVOckVRrTVRyfLECwIBrbuu9qMaTU8wGSpwaWy7g
         WxwU7wyBRh23dR3CnEO+4wqyme0RVIcz8kgRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574395; x=1741179195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTBSh/2n6GpAUrNY1Dnj/dueOiJM3gjuxziEjov96Xc=;
        b=CmJEf3SA2CcNXrUS4oDbRQMs7qUQW7uGVDyRaYsU9uWPu1CwsClt0zFe+ch7sqPvE5
         OPsxKOzCVl0V+nePxdrzqd2BKE+Eu/9+oVsA1jH+eqcPadA4ba45QlHvDXnVo9M0XAKG
         WgRdT12CIZPq7n8jHApSj7X3wc0QM1W7kvgSne9i+ziPQCiv89/v9WAvd2TvdXc+GuuD
         +eMYqEHP4GDnne+D8yJWTGWuszsJ3+VD+3vLEczdDjZwr3YxMk1zvPQ6SOa1KqudryD0
         DyRp4JY/8WziAdrVHiY/njRAKUEStkGjEWp5X2lTchB4KX/NhD5xapJ03WM0jLv2+hfM
         a6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYCTjhvHa2SY8xLmjBLRtAm7bffl6ye4lIAeDBS1IrmlreWACQa+MpasQRDArr77KhqrgP79wB77I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzydtMqZgG7tUPA0nb/8P9IIBmAfjb/zyATOVKnxO0QUVvA6wkK
	MnFJzM3MriTXFn8FXxLo3cOBKdB6XAd8qNizPPQoGasIHnoOA+UWuWFnhMs3lc8=
X-Gm-Gg: ASbGncv8i/SdmV6i0ydxau+S/RUr4I7Roaq2J6GFivrWWc4DBu0xlO5D0GqZOa1NTUN
	2mNy0qFsKVjyCWfSw/L1Ukq2bpPdgirtzotxtew0nqcB+KblcT7vIgwee/T/RaVVoL9kspuhVqm
	XnZGYKiGSPmS0FdwtLwHbTkk0oFJSUfKkqMRzoAOxrs5UhQIVn8fjHRzxEFfeGSD1tsEfk2kVWg
	yXD9mZidFSn4vnRj3g4MbNhqAXc0IvGP2bpWfva3LcbSPEMQWToi51jM1+P9IT/pa4XhhONHSBy
	R33XeEhQZr8l2kjf8t4DQUzQk/d2HXNdtVC/tILApxfOmrZjy5DVxjC7jc8GVbqNGA==
X-Google-Smtp-Source: AGHT+IE8AJy0j9E86qQZReb0NMR08jPoc09yCsm+m3hNPVY23nOxdS00cl2yR9BDiH6DR7EIcMwZag==
X-Received: by 2002:adf:f744:0:b0:38f:32ac:7e70 with SMTP id ffacd0b85a97d-390cc638c19mr4569231f8f.49.1740574394758;
        Wed, 26 Feb 2025 04:53:14 -0800 (PST)
Message-ID: <f62fa004-379d-4589-b4ea-ba0f0c5c99e0@citrix.com>
Date: Wed, 26 Feb 2025 12:53:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/IDT: Don't rewrite bsp_idt[] at boot time
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-8-andrew.cooper3@citrix.com>
 <46bc8ff4-f33a-4736-b1c9-00dfdec554b7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <46bc8ff4-f33a-4736-b1c9-00dfdec554b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2025 12:48 pm, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> Now that bsp_idt[] is constructed at build time, we do not need to manually
>> initialise it in init_idt_traps() and trap_init().
>>
>> The only edit needed to the bsp_idt[] is to switch from the early #PF handler
>> to the normal one, and this can be done using _update_gate_addr_lower() as we
>> do on the kexec path for NMI and #MC.
>>
>> This in turn allows us to drop set_{intr,swint}_gate() and the underlying
>> infrastructure.  It also lets us drop autogen_entrypoints[] and that
>> underlying infrastructure.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> The switching around of the #PF handler is of course getting in the way of
> moving bsp_idt[] into .rodata.

{en,dis}able_each_ist() edits it at runtime too.

~Andrew

