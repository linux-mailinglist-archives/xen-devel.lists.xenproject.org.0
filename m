Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B046B4DC436
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291486.494726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnds-0004Nx-LG; Thu, 17 Mar 2022 10:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291486.494726; Thu, 17 Mar 2022 10:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnds-0004LH-HM; Thu, 17 Mar 2022 10:46:04 +0000
Received: by outflank-mailman (input) for mailman id 291486;
 Thu, 17 Mar 2022 10:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuyF=T4=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nUndr-0004LB-KH
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:46:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70735ced-a5df-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 11:46:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso4708108wms.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 03:46:02 -0700 (PDT)
Received: from [192.168.12.253] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 185-20020a1c19c2000000b0038a1d06e862sm7445278wmz.14.2022.03.17.03.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:46:01 -0700 (PDT)
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
X-Inumbo-ID: 70735ced-a5df-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=4/TKFN8OHeQmnPvkT+/Uts6S/jZQtmdF+zJWXSq6Ink=;
        b=I6ghGaEN7ccYWqqyGmxELSwEIfSMU/3FqTyNc5iQAHdUOCTDGEDpk6vGrGAXleBDQ5
         pIj5/GPmtrZ00AU2VHLI16ug76T5tb9tUS6kJ2F7266CSAmyAgczkYbMeozD/4SC1Fts
         Vr2DSCNsn3qdNDBECg2wJbvs0V1wGV++e4Pzay1rYSB+93T8SnofslTiRopJMfaKZFSa
         tqme+h/3vvekuxWhyP0avpGx1S9wEWDh5tbEftvaOkbdLG4/SoCV2eA0bv01CxpuTyHq
         83QzmMAJgiuvTpFLroJAxLOKA8Qio+H1Vhsm5JzTiS4gaBWKZLdMEX+IRk2ljig3Vc6W
         PUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4/TKFN8OHeQmnPvkT+/Uts6S/jZQtmdF+zJWXSq6Ink=;
        b=Nps/9hlH0oSSthqNOQ8vQM6phQkoqYJS0/yHQWq/MQp5/z2DalvVlTCFh7k8Y/4vmC
         xt0yAgdGkMnAfhkaLW+/0w7aqtrFnqc3StN+XEtrjOiFggWkdp3ufpVCozLwW7DBjil3
         +ndLNogv8337pPHsY5WdHluxkCdcqMS+LZpQO95l0dJKnG3AsMHppyDfR22TYnj1ieed
         JDspPYZZxwR4V37zkm3bKrsu30GrHiWkkL1ueaYrQFcJaHNBUYZGADnkz76DnoHN/eX3
         /T5zbVNStFFNb7R5LXoXMknqQibFKt7RSkkkPducWGYMlv8E0UW+GZvL8SpQ/jBNOfBV
         g3nA==
X-Gm-Message-State: AOAM531eZCPk6SfBWWb3qHo5x6VOAYUh4Ni8vU6livjFX6dwHf47X17W
	EJ6sq3CL1SoJPH18A070t9Q=
X-Google-Smtp-Source: ABdhPJyqq9X4YUFvHeb9AKn/gpnt448faKDmIT0keRUFQXPLdCFBgHyMZIvAOK8Ye8ZRspigmgiKCw==
X-Received: by 2002:a05:600c:1d28:b0:389:f5c5:5bc9 with SMTP id l40-20020a05600c1d2800b00389f5c55bc9mr3344751wms.89.1647513961909;
        Thu, 17 Mar 2022 03:46:01 -0700 (PDT)
Message-ID: <fa671802-4e93-d8d7-c0b6-d09770cdccca@gmail.com>
Date: Thu, 17 Mar 2022 10:45:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
 <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
From: Raphael Ning <raphning@gmail.com>
In-Reply-To: <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 16/03/2022 18:58, Andrew Cooper wrote:
> On 16/03/2022 18:38, Raphael Ning wrote:
>> From: Raphael Ning <raphning@amazon.com>
>>
>> Currently, evtchn_fifo_set_pending() will mark the event as PENDING even
>> if it fails to lock the FIFO event queue(s), or if the guest has not
>> initialized the FIFO control block for the target vCPU. A well-behaved
>> guest should never trigger either of these cases.
>>
>> There is no good reason to set the PENDING bit (the guest should not
>> depend on this behaviour anyway) or check for pollers in such corner
>> cases, so skip that. In fact, both the comment above the for loop and
>> the commit message for
>>
>>  41a822c39263 xen/events: rework fifo queue locking
>>
>> suggest that the bit should be set after the FIFO queue(s) are locked.
>>
>> Take the opportunity to rename the was_pending variable (flipping its
>> sense) and switch to the standard bool type.
>>
>> Suggested-by: David Vrabel <dvrabel@amazon.co.uk>
>> Signed-off-by: Raphael Ning <raphning@amazon.com>
>> ---
>>  xen/common/event_fifo.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
>> index ed4d3beb10f3..6c74ccebebb7 100644
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -165,7 +165,7 @@ static void cf_check evtchn_fifo_set_pending(
>>      unsigned int port;
>>      event_word_t *word;
>>      unsigned long flags;
>> -    bool_t was_pending;
>> +    bool_t check_pollers = false;
> Considering your commit message, did you intend to change this to bool?
>
> Can be fixed on commit.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


My mistake, I missed that when rebasing the patch.


>
> ~Andrew
>
> P.S. David - do you want your maintainership back?  None of this code
> has undergone any major changes since you wrote it.

