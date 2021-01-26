Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F03030EE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 01:15:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74569.134045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4C09-0007ON-SW; Tue, 26 Jan 2021 00:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74569.134045; Tue, 26 Jan 2021 00:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4C09-0007Ny-PM; Tue, 26 Jan 2021 00:14:33 +0000
Received: by outflank-mailman (input) for mailman id 74569;
 Tue, 26 Jan 2021 00:14:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htE0=G5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4C07-0007Nq-DD
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 00:14:31 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 083d6066-1643-463f-a486-3e8447d6a1f4;
 Tue, 26 Jan 2021 00:14:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a12so12276308lfb.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 16:14:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i16sm643816lfo.111.2021.01.25.16.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 16:14:28 -0800 (PST)
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
X-Inumbo-ID: 083d6066-1643-463f-a486-3e8447d6a1f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7e3SMHULvdWv0TO1Xp1TASlEPlMXBH0juEQL5Rc8ciQ=;
        b=FT9bwMV9mlrCCaZRMms36r9W6DM6xJwPYFUULgmQah79tlYHZ7o3Fyflo3jP6H6g1Q
         qxS3MHebe9zwSaJ0dkHNG7xx+Qb+lBFYqU1pvhh5+3D3XCLTPEV5lUytqrB4+CJt0Wa4
         pIqetjcxCPSgGrTFZyaWcaeEo8WI97QHendWdHwocBdFyeul9W7OS+6DZrtU7foxZicK
         50v6BnHfraTUR9lteU23Cvv9Irwuky+XzNJNG+utAZN86zhNc51vXaNMNjSVrDFuaJYv
         BjQSy0PcI3GSPMjJzBJomV1GJaV5QbgZPpATKx/3H1aVL7MCveSghO99IVhkC6OJUv6O
         yXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7e3SMHULvdWv0TO1Xp1TASlEPlMXBH0juEQL5Rc8ciQ=;
        b=OYz6y62hG/YSy2EdhMawWPK8LkEM3ZLV5QhRavnwc4rhp7MpNuex2dWYeR9fIIxKF+
         XlEqHohIVUrjbbnrpfXi++AZSoAf9SIetnLXHM5z7AjmyXWHG/+w3AJ1NFU+4cS2IGvU
         SApKeqzYtOyIqIe53dGwjNvph9q8KMyo/a3y2BJVBLtmu4PJb8UsBaBoeGwzmh5b8v4E
         9BqQAQUqewPQlFY84t1/4F1oZDJj6m8QjvtBjCku+YF/VslRRHcYCahXfjm3CIAzKG/K
         MBh05P1/tfmuLKL/1qAD0VYHGIjIo8dV+vHoqeh/yRj/VFS4b9JmqjbW+ExeK+TsdNuO
         097Q==
X-Gm-Message-State: AOAM530ZimOnDvhVzdMial9Ki5PSQhaImtJWmI16pKDl1FD6ip0Lg1C4
	mCMuC6Quil28rKtUH5QFdpw=
X-Google-Smtp-Source: ABdhPJwbxmaPYU7yiK3pjoKu0kFRCDNoYi3e/3JOxJes1289rHVWTORWea0HsCEpgtSFBgymM9xgIQ==
X-Received: by 2002:ac2:5f75:: with SMTP id c21mr1284937lfc.213.1611620068943;
        Mon, 25 Jan 2021 16:14:28 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, famzheng@amazon.com,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <161160798888.13183.15031685460985886988@c667a6b167f6>
 <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a277d66a-0bb4-22ea-badb-c3f415a5d09f@gmail.com>
Date: Tue, 26 Jan 2021 02:14:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 26.01.21 01:20, Julien Grall wrote:

Hi Julien, Stefano

> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> Julien,
> Hi,
>
>> This seems to be an arm randconfig failure:
>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
> Thanks! The error is:
>
> #'target_mem_ref' not supported by expression#'memory.c: In function
> 'do_memory_op':
> memory.c:1210:18: error:  may be used uninitialized in this function
> [-Werror=maybe-uninitialized]
>   1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1211 |                                        _mfn(mfn_list[i]));
>        |                                        ~~~~~~~~~~~~~~~~~~
>
> I found a few references online of the error message, but it is not
> clear what it means. From a quick look at Oleksandr's branch, I also
> can't spot anything unitialized. Any ideas?
It seems that error happens if *both* CONFIG_GRANT_TABLE and 
CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is 
initialized either in acquire_grant_table() or in acquire_ioreq_server().
If these options disabled then corresponding helpers are just stubs, so 
indeed that mfn_list gets uninitialized. But, I am not sure why gcc 
complains about it as set_foreign_p2m_entry() is *not* going to be 
called in that case???



-- 
Regards,

Oleksandr Tyshchenko


