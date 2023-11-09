Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9487E6848
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 11:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629606.981917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r12Og-0001bR-CL; Thu, 09 Nov 2023 10:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629606.981917; Thu, 09 Nov 2023 10:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r12Og-0001Z1-9j; Thu, 09 Nov 2023 10:36:26 +0000
Received: by outflank-mailman (input) for mailman id 629606;
 Thu, 09 Nov 2023 10:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VIs+=GW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r12Of-0001Yv-5l
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 10:36:25 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a542db-7eeb-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 11:36:23 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-408002b5b9fso4719715e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 02:36:23 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f9-20020a0560001b0900b0032db430fb9bsm7067103wrz.68.2023.11.09.02.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 02:36:22 -0800 (PST)
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
X-Inumbo-ID: d3a542db-7eeb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1699526182; x=1700130982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRSyFsRCol+NXRW2UodTFCvElpOsk3hovrVK4jKLsh8=;
        b=UqOIAVEM5q6FiTIOTdOz3G7BzmCvB322qOFSbFiMWcDQzo6Aps/kQBRVHDe5rq3D48
         IXvfcy4DFTkmpDBI+F948+WaxjQTHT+2dUwO4I7HsrGinpxom/Nuf/jOxruTPjt/vb9m
         HTK4C1ZNd/YEhOqfR7i/1OqVsuSF51/saoQ933LRZumDNhsw+B52lYiZB3HaOS3km72p
         Ge4kAMoNjp+/ji9QhGeFpQbbJz+ajhkdx7h9psS39SKBl1WuIX6AGUgWehdtOpBMRITm
         fudMRdB8W5Qtoi/yMLoPus2aJR2se9x0cznH2HmOrWfPmh5ExVPV356PVPaNTP8sJiXO
         LeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526182; x=1700130982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRSyFsRCol+NXRW2UodTFCvElpOsk3hovrVK4jKLsh8=;
        b=kTxus6IdGwrm1UIhQ5ne+cy2nuUvwHlsJGpn/CoMTvyBt87cBzBv2JHkpQJSzYq49n
         e5MQIgTjjKQRO+acfNVBRlqnGl54eZJcN7W/Wr52wU0EGzbOMcKic7eN0pPuiDzif+BZ
         zxcpaIJwNubc+qkMGde10wsb1E2HcExwFqCt2oV5U1iZOmTI+8PopSihSy7jMeWqArNO
         W/eRL0ygXWMPw6ADSDj5WXoKG4ChhlsApwcWiNwJJ/ZJ9OyrrMZBbVX+wgq/b1An+Vw2
         +u+rEy2Ujqwbof3P19mQkNTpmB0nH/t372lRHdkve6PeE2AB0LeWrwparv44YfIlAZNN
         ZupA==
X-Gm-Message-State: AOJu0YzGP64zkoBTJBwgExtOZGzVZ5UmIpfYsLphjHvp9MalC7tDOrFw
	q9W+5Edr6okhMoxY7kXSFAMevg==
X-Google-Smtp-Source: AGHT+IHjjx1JhOZ+D6nOBOVLzsrfm7XNyzfvThDs/79vQo5/yHYEi2nBPqss9zU0UnOYTGdhFl73Aw==
X-Received: by 2002:a05:600c:45c9:b0:409:7900:f3ef with SMTP id s9-20020a05600c45c900b004097900f3efmr4013170wmo.38.1699526182270;
        Thu, 09 Nov 2023 02:36:22 -0800 (PST)
Message-ID: <cc2e0788-fd03-4c54-b84a-a9bdc2851ef4@tibco.com>
Date: Thu, 9 Nov 2023 10:36:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support situation for nestedhvm
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
 <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>
 <654cab6f.050a0220.86158.519b@mx.google.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <654cab6f.050a0220.86158.519b@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/11/2023 9:50 am, Alejandro Vallejo wrote:
> Hi,
>
> On Tue, Nov 07, 2023 at 08:15:32PM +0000, Andrew Cooper wrote:
>> On 07/11/2023 7:53 pm, Elliott Mitchell wrote:
>>> I ran into the nestedhvm via the following path.  I was considering the
>>> feasibility of shedding tasks from a desktop onto a server running Xen.
>>> I was looking at `man xl.cfg` and noticed "nestedhvm".
>>>
>>> Since one of the tasks the computer handled was running other OSes in
>>> fully simulated environments, this seemed to be something I was looking
>>> for.  No where did I ever see anything hinting "This configuration option
>>> is completely unsupported and risky to use".
>> This one is explicitly covered in SUPPORT.md, and has had XSAs out
>> against it in the past for being unexpectedly active when it oughtn't to
>> have been.
>>
>>> Things simply started exploding without any warnings.
>> Things also explode if you try to create a VM with 10x more RAM than you
>> have, or if you try `./xenwatchdogd --help`, or `xl debug-keys c`, or
>> many other things. 
>>
>> The xl manpage probably ought to state explicitly that the option is
>> experimental, but that the extent of what I'd consider reasonable here.
>>
>> You can't solve educational matters with technical measures.
>>
>> ~Andrew
>>
> No, but we can prevent users unexpectedly shooting themselves in the foot.

... and break OSSTest and XenRT while you're at it.

Like it or not, this knob is behaved in this way for 15 years.  You will
be doing harm for no benefit by trying to change it.

And if you need a cautionary tail on why this is a bad idea generally,
as well as a background on why I will firmly object to technical
countermeasures like this, read up on Xen's allow_unsafe command line
parameter.

~Andrew

