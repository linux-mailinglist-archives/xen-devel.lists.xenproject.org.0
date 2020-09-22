Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBFA274859
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnCC-00025Q-6l; Tue, 22 Sep 2020 18:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKnCA-00025L-8B
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:39:18 +0000
X-Inumbo-ID: 487869cd-4a90-42b8-8305-f404ec22abc8
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 487869cd-4a90-42b8-8305-f404ec22abc8;
 Tue, 22 Sep 2020 18:39:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z17so19115915lfi.12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=g6ZJFflUYspZJyNm+y1ruhkkKk/bXIg8OQF1tuKHhq8=;
 b=FJAI0O2If/Hfop8v33LdHofxMuJDBec1pkU+6ejulEXMqu7J/KEui8b9Zx8q2kx+H6
 6iNGkdYwB7dT7rsdJI8MLhhWdOYJM8WUaZkZw5IRrioQKTUx4SvURyX/0PyMw3OJYcUh
 N5Ld7f/M4CZnnzEJUwik0cTwV+lFZOdJmQ6EUcRc2zHvX/aoP/5cl3/vW9po5EDoF3KC
 +GhG3Ax4wyI9IMI8UI6iDslkGc7D1FTV6ftA0Ea2/z/k0ORUvsrks5UiVa7NLcrVqTh6
 Sq3d66c5mZ7OFztG0DKh++FvAGhvk03UjaRJhynviC5D+Af8IGgr9TMtRO9/iqBhfpjP
 4oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g6ZJFflUYspZJyNm+y1ruhkkKk/bXIg8OQF1tuKHhq8=;
 b=jA4+U87f/v9zqum2yIFx2z2jiN5L5snfNqfZ6SK8uwAWrFA2xEkz0noHyob3645YzQ
 3rsPTueB8RDq0JJzAAKSoSoeshBjAikVZDbnpeCNFVMaM2F/+QrxrnwDXeQIYBnOp0Si
 ljwS6Do/1iLMKHBuBUotPwxr78jZbSAD+KbkuCRDSrDhx0JKV7AfEp/b9Nl8rTP9v7cT
 v9NmiJRzW7LsYXC06UrXvokSTfT2kXOTUjN52OlBKLe16v/vfpZvkBMpvJzdRhRIcptw
 NDBeJBvQSzBG5Hp490gFf9HIpJZ0pTGulHIR7VRbkine9T1UyA3xkwMjj8meWEDidbNv
 aY3Q==
X-Gm-Message-State: AOAM53191mEZHdSHvAhpUYtDGaiAR93yLC2/mBQGTeLFZWxDxJob34m2
 kfDu86YE+2uyaqdfaRG+wYA=
X-Google-Smtp-Source: ABdhPJz946myM25OVPzpzdCfzlIYsJPyAe5C53Fv/oh3rcMrY/SoNXlaqtZ75xqx5L+a/C74wFM5YA==
X-Received: by 2002:a19:9141:: with SMTP id y1mr1991628lfj.554.1600799956276; 
 Tue, 22 Sep 2020 11:39:16 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l10sm3749770lfg.142.2020.09.22.11.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 11:39:15 -0700 (PDT)
Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
To: paul@xen.org, 'Julien Grall' <julien@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
 <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
 <002801d68c01$44756ad0$cd604070$@xen.org>
 <63e51f84-c3ee-a894-5ea2-40cd3b6e26dc@xen.org>
 <002901d68c05$6e7e89c0$4b7b9d40$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <93d6c0dc-11ac-fff4-4eda-396a8b8f8e9d@gmail.com>
Date: Tue, 22 Sep 2020 21:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002901d68c05$6e7e89c0$4b7b9d40$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 16.09.20 11:43, Paul Durrant wrote:

Hi all.

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 16 September 2020 09:39
>> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' <olekstysh@gmail.com>
>> Cc: xen-devel@lists.xenproject.org; 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Stefano
>> Stabellini' <sstabellini@kernel.org>; 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>; 'Andrew
>> Cooper' <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger Pau Monné' <roger.pau@citrix.com>;
>> 'Julien Grall' <julien.grall@arm.com>
>> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce hvm_domain_has_ioreq_server()
>>
>>
>>
>> On 16/09/2020 09:13, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 16 September 2020 09:05
>>>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant <paul@xen.org>
>>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>;
>> Roger
>>>> Pau Monné <roger.pau@citrix.com>; Julien Grall <julien.grall@arm.com>
>>>> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce hvm_domain_has_ioreq_server()
>>>>
>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> This patch introduces a helper the main purpose of which is to check
>>>>> if a domain is using IOREQ server(s).
>>>>>
>>>>> On Arm the benefit is to avoid calling handle_hvm_io_completion()
>>>>> (which implies iterating over all possible IOREQ servers anyway)
>>>>> on every return in leave_hypervisor_to_guest() if there is no active
>>>>> servers for the particular domain.
>>>>>
>>> Is this really worth it? The limit on the number of ioreq serves is small... just 8.
>> When I suggested this, I failed to realize there was only 8 IOREQ
>> servers available. However, I would not be surprised if this increase
>> long term as we want to use
> If that happens then we'll probably want to move (back to) a list rather than an array...
>
>>> I doubt you'd be able measure the difference.
>> Bear in mind that entry/exit to the hypervisor is pretty "cheap" on Arm
>> compare to x86. So we want to avoid doing extra work if it is not necessary.
>>
> ... which will seamlessly deal with this issue.


Please note that in addition to benefit for the exit part on Arm we 
could also use this helper to check if domain is using IOREQ here [1]
to avoid an extra action (send_invalidate_req() call).

[1] https://patchwork.kernel.org/patch/11769143/


-- 
Regards,

Oleksandr Tyshchenko


