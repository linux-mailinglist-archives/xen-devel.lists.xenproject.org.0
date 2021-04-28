Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32E36D446
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 10:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119092.225423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfv1-0006Ae-Tt; Wed, 28 Apr 2021 08:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119092.225423; Wed, 28 Apr 2021 08:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfv1-0006AI-Qc; Wed, 28 Apr 2021 08:51:39 +0000
Received: by outflank-mailman (input) for mailman id 119092;
 Wed, 28 Apr 2021 08:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uJE=JZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lbfv0-0006AD-Qd
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 08:51:38 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b9a893d-c069-4b82-8d03-3150cc6a9883;
 Wed, 28 Apr 2021 08:51:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n2so8987271wrm.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 01:51:37 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id c2sm2968700wmr.22.2021.04.28.01.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 01:51:36 -0700 (PDT)
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
X-Inumbo-ID: 8b9a893d-c069-4b82-8d03-3150cc6a9883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jKXMTjZ0qBJxc7j3aTexvAKgrQx1Wu0ZuRIGlJnZkw8=;
        b=gCmdiqOJvy+pxT9RGyt+YV972ZKPm49MvOfBrpCgab/SHIefJTRFy1iD+EDynLiYyX
         gZYRLuhFtN5tRzXko0J1EeXse8KWS4C95NDk1bLhjci1tY5MeuKkRBJA/UKg+Wadkw2c
         J/UjZdXRakY2EQxgsn9PDdWuAgzb5AEaHB5HK6k6OpqTVcGrBmGW+CzqAHj43j1B6fte
         WN3/j31estmIspRucDpbRDEaJ21cBgSWVGphC275+tBWaPxHm5o3s5wd5Ii4DJH7I83u
         kxx40GJ9tY+xvbRSUtpxwnY9pbIWxBDLIl7/mbUTq9L1ZuJhEvnEuNzKzzZfHUvvyjT5
         Vu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jKXMTjZ0qBJxc7j3aTexvAKgrQx1Wu0ZuRIGlJnZkw8=;
        b=cSqajXyOX/JVGts5D/r9MswYsvXA1KOq1ol1kRIuqJS7kr05mPduQMosZfy6/+oxTR
         nk9+1Avfyh77eWhb093eJikmDvtGsiX6X+mO5/0SpdLENH8wOOCQP8KS3hrQteLMTxl6
         ZZ3pVm/elB/9FbYxnFIvl46DXnfQsrFhNWdlYHakm917AABY0+SisOJdY+KBe86/9CaO
         AfIfmx9whiDZmtsb8XwUnOChVuGxJg8/LJ5xhijMsdJgslPb0vCAhh7gX6nmDfkVox5l
         gw/RfqLkWQ5JLRL+TOJ4GMWdPf576TxX4xfhSAt0Cf9QaNEQ0eX4egI36NYMX6L3m5Qk
         bgbQ==
X-Gm-Message-State: AOAM532cmHBriQN8q8JG/CrDT0skPtXifiLLJ1tn+ChsDvDbKDg8Oebo
	gumpr3oPjCaTTKPGxoAq1/g=
X-Google-Smtp-Source: ABdhPJzLCV6NpYxZvXEVRPsKL2lH0BXGQJWA4TkwPmVSWyjJKWlMmBFngRNsop6PHieRRR6IJzI+TA==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr34480679wre.138.1619599897077;
        Wed, 28 Apr 2021 01:51:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Scott Davis <scottwd@gmail.com>, Scott Davis <scott.davis@starlab.io>
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
 <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
 <b6888c16-92fa-7ece-8882-3775c08f212b@suse.com>
Message-ID: <4108bcab-e3e0-3e20-07d3-48c73c8903ec@xen.org>
Date: Wed, 28 Apr 2021 09:51:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b6888c16-92fa-7ece-8882-3775c08f212b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/04/2021 09:49, Jan Beulich wrote:
> On 28.04.2021 09:19, Paul Durrant wrote:
>> On 28/04/2021 07:15, Jan Beulich wrote:
>>> Following the extension to the command line option I'm putting in place
>>> in "IOMMU: make DMA containment of quarantined devices optional" (which
>>> I still need to get around to address review feedback for and resubmit),
>>> I'd be inclined to suggest "iommu=quarantine=always" or
>>> "iommu=quarantine=on-assign". Unless of course we'd prefer to have the
>>> caller of the assignment operation have full control over the behavior
>>> here anyway (in which case a command line option control simply is not
>>> necessary).
>>>
>>
>> I'm still not entirely sure why not quarantining on is a problem,
> 
> Well, I continue to think that it is a mistake to hide problems (with
> their hardware) from system administrators by default. I guess most
> everyone else put usability in foreground, as my view to workarounds
> (with non-benign [side-]effects) being enabled by default looks to be
> generally different.
> 
>> other
>> than it triggering an as-yet undiagnosed issue in QEMU, but I agree that
>> that the expectation of 'no-quarantine' meaning just that (i.e. the old
>> dom0->domU and domU->dom0 transitions are re-instated) is reasonable.
> 
> I'm afraid I'm not clear what you're talking about here. What "old
> transitions"? The ones prior to the introduction of quarantining?

FAOD, that's what I meant.

   Paul

> If
> so, and if the tool stack is given (some level of) control, I guess
> we'd first need to establish who "rules": The command line option,
> or the tool stack (which imo ought to be acting whichever particular
> way based on admin requests, not to blindly override Xen's defaults).
> 
>> Do we really want yet more command line options?
> 
> If we can avoid them without sacrificing functionality / flexibility ...
> 
> Jan
> 


