Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763052FE876
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 12:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72007.129391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XuJ-0003WV-80; Thu, 21 Jan 2021 11:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72007.129391; Thu, 21 Jan 2021 11:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XuJ-0003W6-4U; Thu, 21 Jan 2021 11:13:43 +0000
Received: by outflank-mailman (input) for mailman id 72007;
 Thu, 21 Jan 2021 11:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2XuH-0003W1-1y
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 11:13:41 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e49d076f-af15-486f-966f-ffbd630dac3c;
 Thu, 21 Jan 2021 11:13:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id v67so1989734lfa.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 03:13:40 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n13sm539583ljj.70.2021.01.21.03.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:13:36 -0800 (PST)
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
X-Inumbo-ID: e49d076f-af15-486f-966f-ffbd630dac3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yd+jxwtgXAOrWcJ7l/4fkyQe22m6DudleYEINdkDtkA=;
        b=jbzIUeXrVLp49GcsbD7gY2fdkCx2Dll1XkvANInmhF/ebJZfcrM80DysguQsjpCz3N
         v83jjUVDLltDU7gK6q6i63xwdUhZsyYu2G4Li+t60AwjyiVqXbNrx89y60NRh77GFbBZ
         dfJhn1WFeVov5zTqs88zMz7WzXTGewZqwkQ13bssuvl6PXItj/JK9oqkA5ekkuDjQK5d
         jNOxSSQcOG7qbM3fbQT0SKfDpmBYiVVEIp9OimCUrsgS/JYA5ns2ezNGP9PMKMjlmUiR
         79KO+hZsO9oZn/IVgqLNPr0nfP1LBDbmIhpf1KdO4M4lhrEnjqZx1fNJR5ThKB10L6gk
         40zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yd+jxwtgXAOrWcJ7l/4fkyQe22m6DudleYEINdkDtkA=;
        b=iflOMI+MBP/X0rRvx9CU4IsMafryZxAnmtfs0I/fBVllyVwSAA9gFRc2IFxSzm9Np9
         yp7n5C6ucltDCBQ2xaqKkFtk5SkZd3dKcj2weahhcrXxEsCdYk0bH3TUdpEHeQA4Z162
         t2MUC74GNZwF4h8xR3G7IBiXKFDxeA5j5aUqPyF8S6Sdd8tlgjHMQIe1VXN7m3U6183r
         CcssAH4eAyYGsiKfO8NG8Y3K5tRZRQQTpkY4DCCe8MDJWdFdWMACJuZvzsnQgrzlsBrJ
         0SjxwASba7puJy1yAYW7niSFQR2QS1MY1bmQERx3eu8Wd6jpOfB7+9YlM59bIMV2ACqQ
         mZAg==
X-Gm-Message-State: AOAM531uNNI9/OMcgo+j1tyAt9sr9fgziomVOBv4YIL+Y9BdEGkX/AwW
	yow5EdbFqiX2cJgwWLurXyuBrZhEvScNdg==
X-Google-Smtp-Source: ABdhPJxgG95YHomEqovbZLxFvB3Xai648hCzudltxMwK7A3afLrYZrZjB366nxv43bigisJfea3/fw==
X-Received: by 2002:ac2:420a:: with SMTP id y10mr6151492lfh.377.1611227618847;
        Thu, 21 Jan 2021 03:13:38 -0800 (PST)
Subject: Re: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
 <016657f8-371f-eba6-60ce-29741f0823b7@suse.com>
 <832cbb2f-a3dd-c97d-b35a-951fed63ad2b@gmail.com>
 <ed01dc68-2b55-4525-6f79-f9a7f0945699@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b83d3171-15f4-ba1a-fa8b-d55f03b2bf27@gmail.com>
Date: Thu, 21 Jan 2021 13:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed01dc68-2b55-4525-6f79-f9a7f0945699@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 21.01.21 12:27, Jan Beulich wrote:

Hi Jan

> On 21.01.2021 11:23, Oleksandr wrote:
>> I would like to clarify regarding do_dm_op() which is identical for both
>> arches and could *probably* be moved to the common code (we can return
>> common dm.c back to put it there) and make dm_op() global.
>> Would you/Paul be happy with that change? Or there are some reasons
>> (which we are not aware of yet) for not doing it this way?
> Probably reasonable to do; the only reason not to that I
> could see is that then dm_op() has to become non-static.
Thank you for the clarification. So I will make this change for V5 if no 
objections during these days.
I am going to leave your ack, please let me know if you think otherwise.


-- 
Regards,

Oleksandr Tyshchenko


