Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FC42A863
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207448.363287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJr2-0002eN-2e; Tue, 12 Oct 2021 15:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207448.363287; Tue, 12 Oct 2021 15:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJr1-0002bX-Vf; Tue, 12 Oct 2021 15:38:11 +0000
Received: by outflank-mailman (input) for mailman id 207448;
 Tue, 12 Oct 2021 15:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maJr0-0002bR-Cs
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:38:10 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9e6fa80-10d9-441d-b0c4-b20dca6c7eef;
 Tue, 12 Oct 2021 15:38:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r19so86537971lfe.10
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 08:38:09 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b4sm1064444lfq.9.2021.10.12.08.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:38:03 -0700 (PDT)
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
X-Inumbo-ID: e9e6fa80-10d9-441d-b0c4-b20dca6c7eef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=40b+ybH6DaWJ8M613inAfoCx0ss8Nsb4+kp6QadTkRY=;
        b=egXkhfaGjJ73+JxvmsExKIDoFJv23OXpMhHBnBa7yxjrHMO9wAuOBu+dxqjlnFPKQW
         pFYX2iZLcBidFDjE64uVsNYeuaFIJj0cDPcXtHcWDvlRhQ33PzMT5Y0jBeSNmSN+eb9U
         ezV04tXEMCu4C8Xl2GkTN5PVmSVpve3tHcmL72XogEroWcuC3uvolCS1hIc+WzBnLROT
         19zzfDE7KdESr7iBNxt5ycwT9Ppzq/kMbeL2yNv0rwzIMRoIgvPEG5fF3+uzKrJmpnbL
         3ETb4S08SOLRdaoQkzPdfnt4E8Yg9JJEYk2elBU3xCbYJH3Jf3vOFLhRh8t3ZnrmExzk
         O4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=40b+ybH6DaWJ8M613inAfoCx0ss8Nsb4+kp6QadTkRY=;
        b=RbYw4LowhQsiVwGYPMUfOY3Hjl69J+o/127ZcNVY4vRNfo2MaJgmMmkr0PP5OTlAfo
         66Le29cekqkrbQLD0hr6Ks13JOIATR48fV1TOqJ9TiiLhPi+HCyeL3NjLjRkB1P2rxqJ
         MFuncsF6TJ2ECty65aNW2QRvaS3nsOSIi8ifvUU47ucOCzaZ9wkgGC/kUv0tML2CymqJ
         udqGvJw1m8O/sLXGJ9JKoaV9HhJg9qIXvv0t3BjLr4f8l1LdrR2NI9F8+O2PTdltaVJt
         D/W8uhiaL/jOvZiENeKnvRrEPYLEuHb+mZmJaZMCf4j8lsADum5+IgXnBJ2fcsCqnxBf
         rJOw==
X-Gm-Message-State: AOAM533i52kZ+iO9blKrG9cEizX1ZemZyMVzviaYPf3PQRRAzLyoV1FK
	FhW/qvenjMq10kqLXSCM4io=
X-Google-Smtp-Source: ABdhPJwUqGfGIoEr9TXr0dWqO5V4ZUfg7MWsvm5upuxsKe6PODjNlEARWFySPyKbA1TzRCEDyLK7Ww==
X-Received: by 2002:a2e:b05a:: with SMTP id d26mr10761695ljl.77.1634053084193;
        Tue, 12 Oct 2021 08:38:04 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <37b38f3c-ffc6-b808-13a3-525dcac07d4e@gmail.com>
 <24933.43638.23413.704241@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <33145812-b0a4-b2d8-4f1a-f7c32c29c7fc@gmail.com>
Date: Tue, 12 Oct 2021 18:38:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24933.43638.23413.704241@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.10.21 18:32, Ian Jackson wrote:

Hi Ian

> Oleksandr writes ("Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for DomU"):
>> On 11.10.21 20:48, Oleksandr Tyshchenko wrote:
>> Hi Ian, Stefano
>>> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"\n",
>> If this appears to be the last version, may I please ask to remove
>> unneeded "\n" in the message above while committing? Thank you.
> I think Stefano will be committing this but: personally I don't like
> the "edit on commit" workflow.  Committers are already a bottleneck
> and it is easy to make uncontrolled mistakes.  I find the most
> convenient workflow to be to acquire a git branch from somewhere and
> commit that, so if you provide a git branch with the acks folded in
> and this kind of minor fix included, that would be ideal.  Ie,
> git-request-merge format or something like it.

Yes, I will provide a git branch later on today.


>
> Thanks,
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


