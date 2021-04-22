Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B036808B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115385.220096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYXm-0006ix-N4; Thu, 22 Apr 2021 12:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115385.220096; Thu, 22 Apr 2021 12:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYXm-0006iU-JT; Thu, 22 Apr 2021 12:34:54 +0000
Received: by outflank-mailman (input) for mailman id 115385;
 Thu, 22 Apr 2021 12:34:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bnX=JT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lZYXk-0006iP-OW
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:34:52 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a193514f-67be-4540-aca0-cb1a575cf820;
 Thu, 22 Apr 2021 12:34:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso3034500wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 05:34:51 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id m67sm6887745wme.27.2021.04.22.05.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 05:34:50 -0700 (PDT)
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
X-Inumbo-ID: a193514f-67be-4540-aca0-cb1a575cf820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AmBH9C2DvdJD1Qbut0x7AsSjfa7QJN90/FQP5z35c8A=;
        b=NPef0TvdctJ6AOx+vkiORmHfXywolN99axDxNevrsgU7MIZ3y+V+QdiYN/sY9G74jN
         YE6DsRpi/bllNRzo7LFZJkH/LWn8uUsUyr6H7jwB8iDWx94//6ELDi6RGqSAyoEx4i6N
         WyNPY0eTIn9NO3ggrmk86350tHMPrxiCqAkqVXG9Ya5adHyi9AxRi16HFYgkkcA/OS6z
         ZqEtZWRyocVEHBmT+mww7OS+g8h/DT9Y5a0VPfa0GJEY1isJ3iy1EubgYmEwUWpPluJA
         +Dkb3vh9f72XR6Wkdt+yCwii4axEcgRVR8UDbz2s2lEp+3ghts3y3Pzsj9pXZ+OowGjQ
         DK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AmBH9C2DvdJD1Qbut0x7AsSjfa7QJN90/FQP5z35c8A=;
        b=ake36ziT41AjB00zgh58k6lj8yUb+hoWQsmP9z5Bdi1KzR/bm/29U7BVD5yDOcZqdZ
         owuvQwEEDU1pwNgSlLizmdv2nDkSqg1O7OfgQ7TqEKEDlbtS8tAjWxZqlrK3gEby55Gt
         lMY8BMH/fZEZ3U2Q2jPL2OTgeWdOM/0tcAhjhlg5R2zWC8cAl51YhykwbYgWAafHN2y5
         tS8svAgiGrkmWPwplms/r70BWKvrbCGhVNlQlEuAFDAYtvc/2Sjkfi8bkXg6MTUXk8M9
         ZLph5c8Ji1JQPJ/S3DtnqpSrEyiXPLeJAJXSk60GoeId9AyQwsKRf7dawpdnF40WzOWf
         QRIg==
X-Gm-Message-State: AOAM530Tpxq/olWvFnl5WdHaeoJcsmCrtgjLN/rpPHe19OEZ8ifTV63w
	iIhdlZlN9Bl1iWG1IdQ1L+jFmxOWEj4=
X-Google-Smtp-Source: ABdhPJyqr349qli+0LIui+wStN/YEwJH7ZDXsAL5ap8ocdupdEx0SImz6TW39P2NK0d2S2EdGLg3gQ==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr3599214wmm.110.1619094891228;
        Thu, 22 Apr 2021 05:34:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <9a2058cc-d6af-d01a-8630-ab897a75ccbc@suse.com>
Message-ID: <215292c9-79f6-4532-c051-0b7a0c53c138@xen.org>
Date: Thu, 22 Apr 2021 13:34:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9a2058cc-d6af-d01a-8630-ab897a75ccbc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/04/2021 12:38, Jan Beulich wrote:
> On 16.04.2021 15:16, Jan Beulich wrote:
>> Zapping leaf data for out of range leaves is just one half of it: To
>> avoid guests (bogusly or worse) inferring information from mere leaf
>> presence, also shrink maximum indicators such that the respective
>> trailing entry is not all blank (unless of course it's the initial
>> subleaf of a leaf that's not the final one).
>>
>> This is also in preparation of bumping the maximum basic leaf we
>> support, to ensure guests not getting exposed related features won't
>> observe a change in behavior.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> First of all - I'm sorry Paul, I forgot to Cc you on the original
> submission.
> 

Ok. I did notice some discussion but wasn't really paying attention.

> May I ask for an ack or otherwise for the Viridian part of this?
> Please be sure, however, that you have seen the earlier discussion,
> also on v2, as Roger is questioning whether the Viridian change
> here wouldn't better be dropped.
> 

I confess that I'm not a fan of the recursive calls and I do agree with 
Roger that limiting the leaves simply because they have zero values is 
probably not the right thing to do and it could lead to issues with 
Windows. I think, to be on the safe side, it's best to leave the 
viridian code as-is.

   Paul

