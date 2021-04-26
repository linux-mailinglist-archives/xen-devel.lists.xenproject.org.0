Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22036ACB9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 09:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117458.223392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lavQ0-0003G7-1N; Mon, 26 Apr 2021 07:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117458.223392; Mon, 26 Apr 2021 07:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lavPz-0003Fh-TA; Mon, 26 Apr 2021 07:12:31 +0000
Received: by outflank-mailman (input) for mailman id 117458;
 Mon, 26 Apr 2021 07:12:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ADy=JX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lavPy-0003Fc-7b
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 07:12:30 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07782790-0018-4b62-a835-50fc3efa1caf;
 Mon, 26 Apr 2021 07:12:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so42593519wrm.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 00:12:29 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id y19sm19010159wmj.28.2021.04.26.00.12.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 00:12:27 -0700 (PDT)
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
X-Inumbo-ID: 07782790-0018-4b62-a835-50fc3efa1caf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s8szxA9dFUURpU5en1n24UwJUZgqcgS6Nfs5tFCES68=;
        b=fyNqDknePLC4+sBCVGj2WeWtGJgzvtzprH3opL3k7AyZZQkMI4faZqdUZ2Uavm7t73
         tBqcyUOVcJ68NrLaPuUnVp/QTHThuCyzddbVqFZFrxRGbtT1CCOvAzjz1y/oqSRoRbgq
         W/tZ7+VMS0ZHaO+a/qEJ4HBBP8rjHVY5Dn9hlD4hAknVk8Aj79ztIybhZGy+2DO7F8zr
         J1dz8MzqCHvksvRpDwD3Mi7o8con4wvLFOitT2bwVF73RIu/6n6X4RYqobPUV4yASeAx
         PGRNiTVnDAKt4i4QkPhbgtv02Wlk1TbmbdIRz9MtH+iocVO/wlsZYmpaAxC28VK0prgL
         UPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s8szxA9dFUURpU5en1n24UwJUZgqcgS6Nfs5tFCES68=;
        b=trnT60ERkBUfqzf4mC2EzZsxuFdGy6Y7t3uZxp0auULWjgpoMEaaTHp3vZaGahHHnW
         5hw6eJJrfFYQeSaPB8MbzawJ4jwb4Ko293dIrNzSDSpdchb9yh+1oqBdM46nSrOZgmJn
         +KRiaH7gETX0p9+YcSDBWJXB/S41nQ/s9RNoN4VJRWJKaAg6rZi2J2pRxu5yyJo84jrV
         u5BFIWb1yxXKfdalStWad4+Ta4CzQJG0d5QwttNveIkZrBFP9Inuc+UfQGnuWUl/ZaBo
         N+12xPHWTmu+qgGTcI250LKxBkvhFmZ1PRPLNRicx2/GzRecJjd3EHyj5Zb0ryRi7q3E
         wX5w==
X-Gm-Message-State: AOAM53261OdJ8HRGnZD+3IbbyWEK+qdUPCWgTr6dx9GPMHKH9w2OMzYC
	DlJ6vyrAVHl8kfSxBejbmEHDRai/rlo=
X-Google-Smtp-Source: ABdhPJxkVvzKIbfRUpCXRCun+Y24dK4Z6JqTpvyL4srfmvuFbOtQVcy0IHPn+Qv4p7bN+eKO52xQLw==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr21450736wrq.161.1619421148354;
        Mon, 26 Apr 2021 00:12:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 19/22] x86emul: support TILELOADD{,T1} and TILESTORE
To: xen-devel@lists.xenproject.org
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <fc272d90-9a3c-98e9-d811-ea9b70f89e22@suse.com>
 <6b604011-a618-871a-2a3e-9118dd1b702b@suse.com>
 <c63e6988-196d-ab7c-5971-611eba99a7d6@suse.com>
Message-ID: <3c1d6f14-b091-6244-0ef0-3925601c770d@xen.org>
Date: Mon, 26 Apr 2021 08:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c63e6988-196d-ab7c-5971-611eba99a7d6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/04/2021 16:11, Jan Beulich wrote:
> On 22.04.2021 17:06, Jan Beulich wrote:
>> On 22.04.2021 16:55, Jan Beulich wrote:
>>> +        do {
>>> +            /* Limit rows to just as many to cover the next one to access. */
>>> +            cfg->start_row = i;
>>> +            cfg->rows[modrm_reg] = i + 1;
>>> +            write_tilecfg(cfg);
>>> +
>>> +            if ( vex.pfx != vex_f3 )
>>> +                rc = ops->read(ea.mem.seg,
>>> +                               truncate_ea(ea.mem.off + i * ea.val),
>>> +                               row, cfg->colsb[modrm_reg], ctxt);
>>> +
>>> +            invoke_stub("", "", "=m" (dummy) : "a" (row));
>>> +
>>> +            if ( vex.pfx == vex_f3 )
>>> +                rc = ops->write(ea.mem.seg,
>>> +                                truncate_ea(ea.mem.off + i * ea.val),
>>> +                                row, cfg->colsb[modrm_reg], ctxt);
>>> +        } while ( rc == X86EMUL_OKAY && ++i < n );
>>
>> in principle tiles could have rows larger than 64 bytes without any
>> separate CPUID feature flag qualifying this. struct hvm_mmio_cache,
>> otoh, is having a fixed-size 64-byte buffer right now. Therefore I'm
>> wondering whether we'd want to switch to dynamically allocating that
>> to the minimum of 64 bytes and the size of a tile row, just as a
>> precautionary measure.
> 
> Actually, as it occurred to me only after sending, enlarging tile size
> would under almost all circumstances require a new XSTATE component,
> which we'd need to enable first. I consider it less likely that they'd
> permit a wider range of layouts without increasing tile size. But we
> might still want to play safe.
> 

I guess on-demand reallocation to a larger size would be fine. Certainly 
we want to be sure we don't overflow.

   Paul

> Jan
> 


