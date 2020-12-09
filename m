Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E72D3B35
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 07:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47970.84866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmsLo-0003t1-5G; Wed, 09 Dec 2020 05:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47970.84866; Wed, 09 Dec 2020 05:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmsLo-0003sc-1h; Wed, 09 Dec 2020 05:49:20 +0000
Received: by outflank-mailman (input) for mailman id 47970;
 Wed, 09 Dec 2020 05:41:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSLj=FN=gmail.com=frowand.list@srs-us1.protection.inumbo.net>)
 id 1kmsEb-0003jH-TR
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 05:41:53 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4b796b8-d4c3-470c-b206-834b3a7425f3;
 Wed, 09 Dec 2020 05:41:52 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id b9so220850qtr.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 21:41:52 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id h9sm522190qkk.33.2020.12.08.21.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 21:41:52 -0800 (PST)
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
X-Inumbo-ID: b4b796b8-d4c3-470c-b206-834b3a7425f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i8ZJuoDJybHp2tzVONMGuofWcZ7p2pBjclZqoID/hEc=;
        b=UOXSCoJxmnpVjuMvUpp9guycLEE9pkjcVxY9md2+onQ1/ecp1Hi+vcYRfU3bgQSiTH
         FziOD9AYxPqW2NiWirjt0PlziMyMbmRpP+pbqFB99E5rYU777pTYACGKI0RpCF2c9BRo
         NIJYT6J1DaJD+i1uxYNzqd5IK4o7lp3SjuAu41rH0pEihjr5k4oVSIyeZmSuI48S6a/4
         lf7Eg9l27J5ARK9y0vhVPx5QvCOtxV4iNf6PO4ClZ10PXsQFpszITQcubScGmUNUUZZl
         IlGCHvHktRn31X5o8iDr8mhWI0yZv9RpHMLkiGWr0vh8QMQ7JO5k+mYqw7z4f14+oXW7
         vGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i8ZJuoDJybHp2tzVONMGuofWcZ7p2pBjclZqoID/hEc=;
        b=lv3ipFIQLPTVjhrH8hzZLm82PBclkYXaY6FdTSAy9O1hQp5v5CfZoyMFXN+H1DspJP
         yob/iG3YgzJ1aenVbHw0/TbXMcmgsy/L2JHp3W+Z0kQcCaYgz/y8qqBqtnEwwIYnS2rY
         2h57wPV9y5c7SFM53hnUBCZ7OAUC3pJoHz1BH9yqAXBxCaEZS8bJrw5QP9diqPcE3PnD
         Ia5gE6HyCcIoF1qJXaMBdueiq5hZQFQD7jePY2ZwwoYVTy66khNOBPd6XB+6GIfitTAW
         8CsSA6ME6wxXO7Ycx7jrFR1CbCuMI5Lgbfap4d1rboz5D+V/giMXJwDylXI7G/4B/ZOl
         9TQA==
X-Gm-Message-State: AOAM533pVXlIM4ucxExEXAT/jNkD1vzVwpCNFI6mLQI43gnlwsKBfE9R
	RXR7Ok7mUc04n2YLgMiOILI=
X-Google-Smtp-Source: ABdhPJzZUuf2XsInUB3Fx8zqDdvZHWKQUIW5Gw5sT1OV3zktLeXI8yB9W4KtQpq/Gp48DlAV7nptBw==
X-Received: by 2002:ac8:4648:: with SMTP id f8mr1305258qto.5.1607492512637;
        Tue, 08 Dec 2020 21:41:52 -0800 (PST)
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Paul Menzel <pmenzel@molgen.mpg.de>, Wim Vervoorn <wvervoorn@eltan.com>,
 The development of GNU GRUB <grub-devel@gnu.org>,
 Daniel Kiper <daniel.kiper@oracle.com>
Cc: coreboot@coreboot.org, LKML <linux-kernel@vger.kernel.org>,
 systemd-devel@lists.freedesktop.org, trenchboot-devel@googlegroups.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, x86@kernel.org,
 xen-devel@lists.xenproject.org, alecb@umass.edu,
 alexander.burmashev@oracle.com, allen.cryptic@gmail.com,
 andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org,
 "btrotter@gmail.com" <btrotter@gmail.com>, dpsmith@apertussolutions.com,
 eric.devolder@oracle.com, eric.snowberg@oracle.com, hpa@zytor.com,
 hun@n-dimensional.de, javierm@redhat.com, joao.m.martins@oracle.com,
 kanth.ghatraju@oracle.com, konrad.wilk@oracle.com, krystian.hebel@3mdeb.com,
 leif@nuviainc.com, lukasz.hawrylko@intel.com, luto@amacapital.net,
 michal.zygowski@3mdeb.com, Matthew Garrett <mjg59@google.com>,
 mtottenh@akamai.com, Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>,
 piotr.krol@3mdeb.com, pjones@redhat.com, roger.pau@citrix.com,
 ross.philipson@oracle.com, tyhicks@linux.microsoft.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
 <CAODwPW9dxvMfXY=92pJNGazgYqcynAk72EkzOcmF7JZXhHTwSQ@mail.gmail.com>
 <6c1e79be210549949c30253a6cfcafc1@Eltsrv03.Eltan.local>
 <9b614471-0395-88a5-1347-66417797e39d@molgen.mpg.de>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <a173867b-49db-8147-de55-8d601f033036@gmail.com>
Date: Tue, 8 Dec 2020 23:41:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b614471-0395-88a5-1347-66417797e39d@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/4/20 7:23 AM, Paul Menzel wrote:
> Dear Wim, dear Daniel,
> 
> 
> First, thank you for including all parties in the discussion.
> Am 04.12.20 um 13:52 schrieb Wim Vervoorn:
> 
>> I agree with you. Using an existing standard is better than inventing
>> a new one in this case. I think using the coreboot logging is a good
>> idea as there is indeed a lot of support already available and it is
>> lightweight and simple.
> In my opinion coreboot’s format is lacking, that it does not record the timestamp, and the log level is not stored as metadata, but (in coreboot) only used to decide if to print the message or not.
> 
> I agree with you, that an existing standard should be used, and in my opinion it’s Linux message format. That is most widely supported, and existing tools could then also work with pre-Linux messages.
> 
> Sean Hudson from Mentor Graphics presented that idea at Embedded Linux Conference Europe 2016 [1]. No idea, if anything came out of that effort. (Unfortunately, I couldn’t find an email. Does somebody have contacts at Mentor to find out, how to reach him?)

I forwarded this to Sean.

-Frank

> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: http://events17.linuxfoundation.org/sites/events/files/slides/2016-10-12%20-%20ELCE%20-%20Shared%20Logging%20-%20Part%20Deux.pdf


