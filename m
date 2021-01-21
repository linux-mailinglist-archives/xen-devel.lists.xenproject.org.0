Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A68A2FE778
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 11:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71983.129328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2X7j-0006aK-UO; Thu, 21 Jan 2021 10:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71983.129328; Thu, 21 Jan 2021 10:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2X7j-0006Zv-R3; Thu, 21 Jan 2021 10:23:31 +0000
Received: by outflank-mailman (input) for mailman id 71983;
 Thu, 21 Jan 2021 10:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2X7i-0006Zo-Eh
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 10:23:30 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a87d5982-8ddb-4da0-8a9b-ee330c0c4fdb;
 Thu, 21 Jan 2021 10:23:29 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id v67so1801227lfa.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 02:23:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 79sm118258ljj.3.2021.01.21.02.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 02:23:27 -0800 (PST)
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
X-Inumbo-ID: a87d5982-8ddb-4da0-8a9b-ee330c0c4fdb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NBxTk/eGcGc1zrULjs4c57BzW1nE3CvQLEFjbj2OQIU=;
        b=OuSL8i+PL6I/J/t/QFeLWPZVSDPcFFN8MZLDKayCXKvBFJKomCKR2e+tsG0EwhyOM9
         3aJH17aFYhbrgL1N/xgyZRbcIsY+RLT4jxv/VB3OUj9m/Aeufq6i/y3PlCGaEQYSZBfu
         rKDE6jSp5fc2W5C6gQuusIEKukeoEnBFAFd4Fq4FGGCNRNVsDyIGORksJtqu5DcXFfY4
         DLuDpDfjvMsKfNla+2ccJ4DHHcikOLalNG0zYgdY27JousFtxCc7cHiiQ5dySoiSpqE4
         8JfY5sNbVUCY1DkgjEOIYhKqIKLg7nCbKZR1HGgcR6I88Ksm3OZa9TcaqMd3kpSvTOO7
         MCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NBxTk/eGcGc1zrULjs4c57BzW1nE3CvQLEFjbj2OQIU=;
        b=UzNNj+cz6MTtrOz6HOIce6h1s7kAuOTFaGn7tRlfV1PxQo9uT3ImbH5webJk+xE71+
         YacowBsQi69ohFifc3fKuo6CUr72XSgIq0ex2DZRAyBPwU9oQdsa59wEfpzYlJL1Edji
         ZNLOtk3+V84vN3pTnandfU+bD8HTZJkn5u6AhQklci3YVNz776HiQ/zFXAmOa8sNobXR
         yKjsT+7zYnkslO4ETME0VmFGR9GI8cBrLtKh+pmUMEr4s3Uj948HUxWKdshX+k9NhcDa
         K2ikRqWM5swpAMJeA9dIZ+K/5Hp+/rpK7HWFTunJF8Zh7zEPTgsfObGVGi/KscVpHykp
         vAwA==
X-Gm-Message-State: AOAM531I2LqOsmtpjlxZCYm/aSnVYJly+GJ1y2+WKBCMwO7AS6zJDpe9
	TkcLY1ZoAhwUw4u4WOg1Ccy8/c+NN9fqDA==
X-Google-Smtp-Source: ABdhPJxewp+iYQMU0t/WMDAP8FRCn1RkcknUTUNLpZpIxvypt2nd+ZbuSBZ4CoktHw8dSVz2ncQLgg==
X-Received: by 2002:a19:c1c9:: with SMTP id r192mr5410041lff.578.1611224608040;
        Thu, 21 Jan 2021 02:23:28 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <832cbb2f-a3dd-c97d-b35a-951fed63ad2b@gmail.com>
Date: Thu, 21 Jan 2021 12:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <016657f8-371f-eba6-60ce-29741f0823b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 20.01.21 18:21, Jan Beulich wrote:

Hi Jan

> On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> moves the IOREQ related dm-op handling to the common code.
>>
>> The idea is to have the top level dm-op handling arch-specific
>> and call into ioreq_server_dm_op() for otherwise unhandled ops.
>> Pros:
>> - More natural than doing it other way around (top level dm-op
>> handling common).
>> - Leave compat_dm_op() in x86 code.
>> Cons:
>> - Code duplication. Both arches have to duplicate do_dm_op(), etc.
>>
>> Also update XSM code a bit to let dm-op be used on Arm.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
> Assuming the moved code is indeed just being moved (which is
> quite hard to ascertain by just looking at the diff),

I have checked and will double-check again.


> applicable parts
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I would like to clarify regarding do_dm_op() which is identical for both 
arches and could *probably* be moved to the common code (we can return 
common dm.c back to put it there) and make dm_op() global.
Would you/Paul be happy with that change? Or there are some reasons 
(which we are not aware of yet) for not doing it this way?

Initial discussion happened in [1] (which, let say, suffers from the 
duplication) and more precise in [2].


[1] 
https://lore.kernel.org/xen-devel/1610488352-18494-15-git-send-email-olekstysh@gmail.com/
[2] 
https://lore.kernel.org/xen-devel/alpine.DEB.2.21.2101191620050.14528@sstabellini-ThinkPad-T480s/

-- 
Regards,

Oleksandr Tyshchenko


