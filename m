Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54D20CDAA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqIa-0003Yd-KP; Mon, 29 Jun 2020 09:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMiv=AK=yubico.com=trevor@srs-us1.protection.inumbo.net>)
 id 1jpqIZ-0003YU-B9
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:41:59 +0000
X-Inumbo-ID: c6704582-b9ec-11ea-8496-bc764e2007e4
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6704582-b9ec-11ea-8496-bc764e2007e4;
 Mon, 29 Jun 2020 09:41:58 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 9so17254031ljc.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yubico.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wNrpK7hVjJqj+NTq27Ygcyi06KkXeW4tOpFnlf1BjXs=;
 b=fRCmhhWjVYKIqVJj4tazme91amg+JXim7J6Ifsn0BhWyEstV9tof79cBxTd99xpDdi
 qR2ZzXzMPEtc0b3fS+1dnyIGt1fqF0bUZp0idfCSxZTxXmkbSAFTFkUkgBS1tKTmdFOK
 ZcF3yUo3+0El33BsYXkPMZuBv1CHFPB9VbO+FCgMUYTabqTH4vpGOaAdKSPjQ1z/1a1S
 5zKrhk/vIQo+cvvDYtvNqw3vg3x7LUEycoMsXY2iwqOtpPPs7HDkqzAmodUYxppplF9r
 lr0UUfrCetwMg6QcpqFaFftLN8ZKy0sIKAJZEtZf73c6CANEfzrTnEUjL/AQV6Y2DvJb
 nbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wNrpK7hVjJqj+NTq27Ygcyi06KkXeW4tOpFnlf1BjXs=;
 b=ljVENrfmgD9VXz/yMC4HuDOuXeJ6ubpqyv5C56Cd0mXYcNK7PRczbr10DVylzVzERb
 lNMhSca/i3IWab/AHmkOzV/CtoohxFB/Uq/OwFJVAinsrW6ogW2zA7bEKBXsHa3c2Jbt
 P1FO4dOGuNxH9mkTrnpl7ViW+5mFbzMwPt0Mn0BydV72tee8ZSP6AFB7uygSbE3misXT
 cG9eCUHiaC4eBN1hcbvyXr2EG/KNaf5i5SjrQPTfkCLgFjtWgXqaPjWqRkITukoNaT5C
 OStWLyPqhCS6zUa7lFPxrzJDoLSPRTx2Q2/I83LRmyEVfzglQVXf4E4vWIEKG/MomK2W
 wVFA==
X-Gm-Message-State: AOAM5333h6+UesTrxXlGV+YqGOp23YVUo56rY7eYCh5Sk2uQgJTOanMx
 Ycu3FzEQD4l0aZDeuQvL2gKLAVFOCmai/H4eBYHdUt4n047cy9VFsnEZ+p5vDlHOpS11TlsJVuj
 c2ClVAFnjN4P3tG9LhkN1vu8b8nWhCgPyxoS7AoNQAhUvP3uTVZ+7rleo2ChJE8AE7WyRjTSZJg
 ==
X-Google-Smtp-Source: ABdhPJyrdtYXJJJKT2H9qdGWiFqoh3E3gg1jZhN4dSa76Qcsxk8GtHTY7YXV9Fm9Q8g1akTYByblPw==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr7740949ljj.166.1593423717266; 
 Mon, 29 Jun 2020 02:41:57 -0700 (PDT)
Received: from apple-IIe.local (c188-151-193-98.bredband.comhem.se.
 [188.151.193.98])
 by smtp.gmail.com with ESMTPSA id 132sm9007023lfl.37.2020.06.29.02.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:41:56 -0700 (PDT)
Subject: Re: Suspend/hibernate not working on Dell XPS 15 9500 laptop
To: Jan Beulich <jbeulich@suse.com>
References: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
 <3d49bf4a-d82d-36d3-863c-e954d751b959@suse.com>
From: Trevor Bentley <trevor@yubico.com>
Message-ID: <145d7f2e-cc62-740e-7f90-cd759c2aa76b@yubico.com>
Date: Mon, 29 Jun 2020 11:41:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:75.0)
 Gecko/20100101 Thunderbird/75.0
MIME-Version: 1.0
In-Reply-To: <3d49bf4a-d82d-36d3-863c-e954d751b959@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> I don't suppose you have a serial port on this laptop? I ask because
> the serial log (and the possibility to issue debug keys) are about
> the only thing debugging-wise that may help here, short of someone
> noticing the underlying problem by code inspection.

Afraid not, it's hyper-modern; just 3 USB-C ports.

It looks like identical hardware in the Dell Precision 5550 model, in 
case anybody gets access to either and wants to test.

> Do you have any indication of the laptop at least partly waking up
> again, e.g. from some LED or other indicator activity?

None at all, no.  Could be missing the keyboard events entirely, or 
getting them and failing to wake.  I've tried built-in keyboard, 
external keyboard, and closing/opening the lid.

When using the /sys/power/pm_test commands, does that actually do 
anything in a Xen environment, or is that being consumed by dom0 and not 
triggering the real VMM low-power paths?  Is there any similar debug 
mechanism for the hypervisor?

Let me know if there is any useful information I can extract.  I'm happy 
to build patched kernels if it will help.

Thanks,

-Trevor

