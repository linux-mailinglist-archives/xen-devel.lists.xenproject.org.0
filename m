Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA386A53C6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503035.775157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuXV-0000gB-4V; Tue, 28 Feb 2023 07:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503035.775157; Tue, 28 Feb 2023 07:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuXV-0000dg-1d; Tue, 28 Feb 2023 07:36:45 +0000
Received: by outflank-mailman (input) for mailman id 503035;
 Tue, 28 Feb 2023 07:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWuXT-0000dH-LP
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:36:43 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a56fe6fa-b73a-11ed-9692-2f268f93b82a;
 Tue, 28 Feb 2023 08:36:43 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id ee7so36144953edb.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:36:42 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.246])
 by smtp.gmail.com with ESMTPSA id
 mr23-20020a170907829700b008e4584e7235sm4159032ejc.47.2023.02.27.23.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:36:41 -0800 (PST)
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
X-Inumbo-ID: a56fe6fa-b73a-11ed-9692-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k57jYmzHS9xrNAcC+LLAL6tesNF0rYli3x3ytjqn3A8=;
        b=PtbVrLLvAGFbGG8X3RUsHExwXCbtcqwFHTS4BYLGaBxgpS5kQARza5aPsqw5wKw8pd
         G45yCd0dx8a1pSrDZO7POe2Fmb2WdYaB9shCw07ViNZulki3qeTLNyIz+kItTtSfcSU4
         u7UNdxsE70DFJnQEycXiqc+pCxWXTtfES8/4+qs4bg1KYh4YPeKVGxFh8/utekoMQmHb
         97XmvWAGqF1ZO+9ikOs0K9yZA0YR8cZy7Hcae4Hd5VxL0EBn053T55VpMYxebt/xtiCJ
         CIS4dvlNcXnU5pkJbgkHA7laF9C+fKnGph0HMZMaWY4mhaWl8kjFR3cQtm4ouLy9hjCu
         JEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k57jYmzHS9xrNAcC+LLAL6tesNF0rYli3x3ytjqn3A8=;
        b=uMTPEfVjn0JER7xmdrf4LSu0a2ONEYc7QqfbjLjPk/Hq6Se3eUUTrw/SYPmSB79wCe
         t4gb8IeOggNuLuxLuC+Ri3IAc2/7T4wlUd5ST4kWTQ5mw+YkX0v2BiH6fB41Pfr5Rh0c
         SPx5SjGo0VquACLSuW36nTaccp7VovpSHhfFonOpmXfQLl9L3hTfRZxxARCqPoCOl4f1
         6Uidytd0D/PiuLHyzjEWCoBDPL9SzfyhOYJLY+gz1t1WRtJF5M9roDbui61ZCJfp5cw7
         CqAKb+b2ItLBpPIx3BGv3zmahqm63hUZWjPON4YHxNJtJNhV9JyR2Berkbj0qxnRmxOX
         idZA==
X-Gm-Message-State: AO0yUKVrtINmJGP1UVbZ7rpyuqq95AnFc3fgdiggwqYeDMFRQrm4ikvN
	25R47HBLaN8jyg5FbrCKUGpQwlNfftM=
X-Google-Smtp-Source: AK7set84DJVOUlEQml6OWW3Pq7/CIDIR6glGhXOPn/9bwwDV6a1sqqMPUm+BVzhub1Ol8Yk0kEOHaw==
X-Received: by 2002:a17:906:c206:b0:877:a3c4:807b with SMTP id d6-20020a170906c20600b00877a3c4807bmr1362570ejz.68.1677569802188;
        Mon, 27 Feb 2023 23:36:42 -0800 (PST)
Message-ID: <a8d67495-534f-db75-0019-41ca1e328bef@gmail.com>
Date: Tue, 28 Feb 2023 09:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
 <c864c3a9-be96-a304-12e9-2015c2f2360b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <c864c3a9-be96-a304-12e9-2015c2f2360b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/27/23 17:25, Jan Beulich wrote:
> On 24.02.2023 19:50, Xenia Ragiadakou wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/vmx/pi.h
>> @@ -0,0 +1,78 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * pi.h: VMX Posted Interrupts
>> + *
>> + * Copyright (c) 2004, Intel Corporation.
>> + */
>> +
>> +#ifndef __X86_HVM_VMX_PI_PRIV_H__
>> +#define __X86_HVM_VMX_PI_PRIV_H__
> 
> I can see that you need something to disambiguate the two vmx.h. But
> here you don't need the PRIV infix, do you? Even in the private vmx.h
> I'd like to ask to consider e.g. __VMX_H__ as the guard (and then
> __PI_H__ here), rather than one which doesn't really match the
> filename.

I do agree that adding _PRIV_ is off target.
For the purpose of disambiguation, the header guards need to conform to 
a well specified pattern guaranteed not to be used for anything else.
For that reason I would suggest the guard to include the path, not just 
the file name.
In any case, the pattern that is used to generate the header guards 
should be mentioned in the coding style doc.

> 
> Jan

-- 
Xenia

