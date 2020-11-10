Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7092AE13F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 21:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23961.50975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcajz-0007x6-IM; Tue, 10 Nov 2020 20:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23961.50975; Tue, 10 Nov 2020 20:59:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcajz-0007wh-F4; Tue, 10 Nov 2020 20:59:47 +0000
Received: by outflank-mailman (input) for mailman id 23961;
 Tue, 10 Nov 2020 20:59:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcajy-0007wc-9A
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:59:46 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68fa3c18-1121-4a52-9232-4f59f4fd4986;
 Tue, 10 Nov 2020 20:59:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 11so16376779ljf.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:59:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w10sm2708051ljo.130.2020.11.10.12.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 12:59:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcajy-0007wc-9A
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:59:46 +0000
X-Inumbo-ID: 68fa3c18-1121-4a52-9232-4f59f4fd4986
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 68fa3c18-1121-4a52-9232-4f59f4fd4986;
	Tue, 10 Nov 2020 20:59:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 11so16376779ljf.2
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WCEMbK6VpTWfnhbVRjPF5UIFvs6FkjhGHnAeW326f3g=;
        b=iMpcgfzuICrq0q3iPYKyyIXfq5f3majc74oak7l+oqjHYFf17I3Ozia8LBmmHbN1/r
         w2qNdUJexnEdGwpFBvSbBW7lu4ZVPJ5I/Kl9Qv4YNKXPAYZ8LEYASJbBbV6l0ISkHzHZ
         nmqH56DC9asEKFNyl/mitq/QP8cxo6PhpBRvTrwDUcCpGfuqOLNoaskPZBazaHaHV6B4
         C6/8d3QV4YzDbCB6rLYuN6/6AFv5KQAqM1uvKsi8ACspb+oABuubO/V4Qv+wcDUiCkg6
         F1Zgx7Fh3aL+lOfY0IHZSusJpI0fUqrXWV4EdcpRzUQC1T6063rYNOYZGoGhKJJERlKj
         qkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WCEMbK6VpTWfnhbVRjPF5UIFvs6FkjhGHnAeW326f3g=;
        b=kZ6LNBmpOLvt3u6hK5FRI5Tzo9GS5ilUgu0kdcVC2hw/cLsLAWrUEB74Kp7jcE+BsN
         gKWQ7Zx0ry5aimahxdZdVd1te0oJ+sJV7JBFqVaCIy0Bcbv7o+5qYfC/DGAOEhsKoev6
         JSeHKHnBl+ZVZ+U5gWq1n96ILXN7Zil2vKw4H4AjhNCQV1mhjKu7QnhjJU2svm96ECjv
         HcNnntQa+m8B8dghK9Kh4+1iVW8aW4hsfSvGTpYs75q0atBD6kjTzVFfOKq02+2hbO2r
         nt49pBNt9tSGc1sk0R1aLjlaUrXgZVCQevRhXd15AB6EbwZZ0PtWlO+MdoiDsv7gJUj9
         tyrg==
X-Gm-Message-State: AOAM530mG76vM9G9fyQKsXWuHTnNwNwRmxQ6pqhLbrybfcf5903aRQ4c
	6F2I1ggDToxFO1btbAkS7vE=
X-Google-Smtp-Source: ABdhPJx0FoQ+N0R4gfe08ybC6gVKP0QNYk6QszL75pnmu1zu1JpGal/VPT307fMrZF3epemW2PT3kQ==
X-Received: by 2002:a2e:93cf:: with SMTP id p15mr9850563ljh.141.1605041984083;
        Tue, 10 Nov 2020 12:59:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id w10sm2708051ljo.130.2020.11.10.12.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 12:59:43 -0800 (PST)
Subject: Re: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
 <004f01d6a6cf$79d0daa0$6d728fe0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <51b7fe12-46a2-bd0e-da10-f753ecb0453c@gmail.com>
Date: Tue, 10 Nov 2020 22:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004f01d6a6cf$79d0daa0$6d728fe0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 13:55, Paul Durrant wrote:

Hi Paul.

Sorry for the late response.

>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 15 October 2020 17:44
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant <paul@xen.org>; Jan Beulich
>> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun
>> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; Julien Grall
>> <julien.grall@arm.com>
>> Subject: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and these fields will be used
>> on Arm as is. Move them to common struct vcpu as a part of new
>> struct vcpu_io. Also move enum hvm_io_completion to xen/sched.h
>> and remove "hvm" prefixes.
>>
>> This patch completely removes layering violation in the common code.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> I was thinking that it may be better to place these two fields
>> into struct vcpu directly (without intermediate "io" struct).
>> I think, this way the code which operates with these fields
>> would become cleaner. Another possible option would be either
>> to rename "io" struct (I failed to think of a better name) or
>> to drop(replace?) duplicating "io" prefixes from these fields.
> Just drop the 'io_' prefix from the field names.

Will drop. This would look like indeed better.


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


