Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EFB2AE001
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 20:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23911.50890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZZS-0000uc-F2; Tue, 10 Nov 2020 19:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23911.50890; Tue, 10 Nov 2020 19:44:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZZS-0000uD-BX; Tue, 10 Nov 2020 19:44:50 +0000
Received: by outflank-mailman (input) for mailman id 23911;
 Tue, 10 Nov 2020 19:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcZZP-0000u8-V6
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:44:48 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d402c991-56f3-4249-882a-27b27dcd0b60;
 Tue, 10 Nov 2020 19:44:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so9439933ljj.6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:44:46 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a1sm2199762lfg.282.2020.11.10.11.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 11:44:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcZZP-0000u8-V6
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:44:48 +0000
X-Inumbo-ID: d402c991-56f3-4249-882a-27b27dcd0b60
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d402c991-56f3-4249-882a-27b27dcd0b60;
	Tue, 10 Nov 2020 19:44:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so9439933ljj.6
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ijt0C6F19hg6tRiJ0CIaXs4iO2mhbcftXqOZOihG6X4=;
        b=Ou3d8sk7kgCk4cWeFoZO2+Nd72Qw0VXLPPuGQ8Pg2WjRzJwaFf9yXYZiBp6xUFJHiw
         FTDlHPmMnJ6+QVBYxv6Pf+vfFc1rm8UchkZ4WweOusXxs7En8GB1qNSl+FDMLuiBTde5
         AZhW6+8VLKtX+ks3xF/lu5e0RLE+CNbmatGGbuHwsIzoZR5RGmH6NltDRQM710zDTP33
         padiT1EQscePqN8Yc/bIQ81FF9WEnpESJnSp1gmlOHlM4Rg8KD+VQYCSJugbOJYY3oXP
         3hsGPtwkUTU28Z8HJepRlwxSzjCgW4YKUrgLp7iQt9G2IZJTxdPmHa71lkGdja0j+rTz
         rIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ijt0C6F19hg6tRiJ0CIaXs4iO2mhbcftXqOZOihG6X4=;
        b=MKRcAL/Un1Twf/2e9TGdvhVISqCBdwybTqnkGeoC5SUEh5LCb1kxLxoxGk8y5cu6js
         Se1M2UNyJgjsodVnPaS1QIFJDw1QJZfum38JkP8laNO/PgnZnjUii8tbWy2LRea46zsB
         JwjjB3mYP621zFaAJcCcbARDNizYb+zf3+LqgvOE1Qz9O1sNjpYQU4rpRDL68r2E5chV
         7+zLrQ1Plwm8B6FxiPuxWA/lDE0AuJDFR+6dSaGIeyjjiYN7ljXG64MXGRZ5aXN6aVNg
         i4kGCp+JPiy79LhjODQZW3EIi6tryDZZWrvgCWmWvClSeU2VLPYNxVmc/Jj9AwFTVZb7
         xRWQ==
X-Gm-Message-State: AOAM530SUIVw3wBBo/KvsQ8BgI3vp0257vewprX5Ge3UAtppkXuRyY2/
	vWjevhjRB+OXCrfLyP+4/nw=
X-Google-Smtp-Source: ABdhPJyFb67nL+yYu4yKth8EwwTZ3tLUl4+VzTos7cV+FXWjm573Pdkd/GIQ40QKk+nXTEOzLZstEw==
X-Received: by 2002:a2e:8e7b:: with SMTP id t27mr7352667ljk.129.1605037485820;
        Tue, 10 Nov 2020 11:44:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id a1sm2199762lfg.282.2020.11.10.11.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 11:44:45 -0800 (PST)
Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
 <004701d6a6c1$6c09f860$441de920$@xen.org>
 <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
 <004a01d6a6cd$1f4684b0$5dd38e10$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fab8e4b0-e3b2-fb74-76d4-42753ac88367@gmail.com>
Date: Tue, 10 Nov 2020 21:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004a01d6a6cd$1f4684b0$5dd38e10$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 13:38, Paul Durrant wrote:

Hi Jan, Paul

Sorry for the late response.

>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 20 October 2020 11:05
>> To: paul@xen.org
>> Cc: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>; xen-devel@lists.xenproject.org; 'Oleksandr
>> Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Roger Pau
>> Monné' <roger.pau@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Julien Grall' <julien@xen.org>; 'Stefano
>> Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien.grall@arm.com>
>> Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
>>
>> On 20.10.2020 11:14, Paul Durrant wrote:
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>>>> Sent: 15 October 2020 17:44
>>>>
>>>> --- a/xen/include/asm-x86/hvm/ioreq.h
>>>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>>>> @@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct domain *d)
>>>>   #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>>>   #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>>>
>>>> +#define ioreq_complete_mmio   handle_mmio
>>>> +
>>> A #define? Really? Can we not have a static inline?
>> I guess this would require further shuffling: handle_mmio() is
>> an inline function in hvm/emulate.h, and hvm/ioreq.h has no
>> need to include the former (and imo it also shouldn't have).
>>
> I see. I think we need an x86 ioreq.c anyway, to deal with the legacy use of magic pages, so it could be dealt with there instead.
I am afraid I don't entirely understand the required changes. Could you 
please clarify where the "inline(?)" ioreq_complete_mmio() should
live? I included hvm/emulate.h here not for the "handle_mmio()" reason 
only, but for "struct hvm_emulate_ctxt" also (see arch_io_completion()).


But, if we return x86 ioreq.c back I can move arch_io_completion() to it 
as well as "non-online" ioreq_complete_mmio().
This will avoid including hvm/emulate.h here. Or I missed something?

-- 
Regards,

Oleksandr Tyshchenko


