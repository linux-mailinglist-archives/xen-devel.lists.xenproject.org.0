Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597ED69DF21
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498817.769738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR2R-0002Uj-Fo; Tue, 21 Feb 2023 11:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498817.769738; Tue, 21 Feb 2023 11:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR2R-0002SM-Cw; Tue, 21 Feb 2023 11:42:27 +0000
Received: by outflank-mailman (input) for mailman id 498817;
 Tue, 21 Feb 2023 11:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUos=6R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUR2P-0002SG-V1
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:42:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8867161-b1dc-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 12:41:46 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id f13so15419243edz.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 03:42:23 -0800 (PST)
Received: from [192.168.1.93] ([188.73.238.161])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a50c211000000b004ad7bfad182sm3368396edf.6.2023.02.21.03.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:42:22 -0800 (PST)
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
X-Inumbo-ID: b8867161-b1dc-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XL5bp8r8QAaNoeNfuHR79AjlEEXjEq2YSKIfFs/T1NI=;
        b=QVgOaqfnQmwnobbi+g1kuSYA0pAHQ7F7mVldjEiKNE/C93OIZa16gvyHw1Y7oOoh/h
         rrLj1R9nrAJAgIkvmi7+wxDteNEJHOX90WmZhELby3qpdj6ICAhLtes4ZLDXxSyDFl71
         Gcwr0a8O4/zD0cMqyqowy+cwO1kNFxVsc8Zv28CgQFHJnae2IeBYlP74wb4fzZ4cFlEZ
         UE8oUnYtswDMJbvNYNCmSp2LCR+o9Of+CN4mf71I/YoQIZ4Lb6pymTXiYvjeB5lV1sAY
         tUw/lC1gt9hgcoExH9TXKFa8M6A4zeGpVp7usasJBfEB4cDWyBDxBtAvidLC+Qe/s29f
         PHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XL5bp8r8QAaNoeNfuHR79AjlEEXjEq2YSKIfFs/T1NI=;
        b=6mesfGNWYuGpMOKF1Ci/wVnPIQrLYL53b1BTclVtJcKNKSM3OPqKQ9xRkpnwDIaUvF
         y7DMO1MBsC5iu3NRQ2lUMxHaJ7oiDvqHFdGUa3vXUckEmW+5LXaZlLYY/oo5c2uyl9Zx
         IrKg4pySWonSxTsft/bcXHe2mSTIzJ4IUjPEJPyW6AgXImzYmlfgCBRRUNUrkZ9XYI/e
         +wC/lVEr1CQpoKfK1SI9Uz+0DALJ8fve6dhkDGdjQH4HSlwJdEJhjbjDd7F6+zbPIoTp
         lG75eUD8stfcXSpUwwWn3RfRDDrbwkCHDScxICttOxhoq3PqfHcll0fzJpsV89L4Mq8m
         Mg2g==
X-Gm-Message-State: AO0yUKXHIk6rNIrEn0kAFOIoRFguqZOxc0iom2j+3Gbv17HXMSbdBpWj
	DgjfouIKHJ8xn5IWzPDw84k=
X-Google-Smtp-Source: AK7set802DIil1PYJVd9i1w8kd95YG9BpQW7x+YgIaymIDEEsyn5YBlQit6Bp3Bgi9vgGEje3nMt5g==
X-Received: by 2002:a05:6402:4d:b0:4ac:b32e:b6f with SMTP id f13-20020a056402004d00b004acb32e0b6fmr5758765edu.23.1676979743114;
        Tue, 21 Feb 2023 03:42:23 -0800 (PST)
Message-ID: <712f3022-3760-717d-7683-b320fb8dad3e@gmail.com>
Date: Tue, 21 Feb 2023 13:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] x86/svm: cleanup svm.c
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-2-burzalodowa@gmail.com>
 <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
 <936cd14b-70b8-0c28-3aa8-85e5b3f2a8c9@gmail.com>
 <12c71fff-a27c-36ca-992e-1b1d1c075c4b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <12c71fff-a27c-36ca-992e-1b1d1c075c4b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/21/23 13:12, Jan Beulich wrote:
> On 21.02.2023 08:45, Xenia Ragiadakou wrote:
>> Hi Andrew,
>>
>> On 2/21/23 00:12, Andrew Cooper wrote:
>>> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>>>> Do not include the headers:
>>>>     xen/irq.h
>>>>     asm/hvm/svm/intr.h
>>>>     asm/io.h
>>>>     asm/mem_sharing.h
>>>>     asm/regs.h
>>>
>>> Out of interest, how are you calculating these?  They're accurate as far
>>> as I can tell.
>>
>> I do not use a script (at least not a decent one), if that 's the
>> question :) . I verify that none of the symbols defined or declared in
>> the header is used in the file including the header.
>>
>>>
>>> Looking at asm/hvm/svm/*, intr.h itself can be straight deleted,
>>> svmdebug.h can be merged into vmcb.h, and all the others can move into
>>> xen/arch/x86/hvm/svm/ as local headers.  None of them have any business
>>> being included elsewhere in Xen.
>>
>> I can send another patch for that.
>>
>>>
>>>> because none of the declarations and macro definitions in them is used.
>>>> Sort alphabetically the rest of the headers.
>>>
>>> Minor grammar point. "Sort the rest of the headers alphabetically" would
>>> be a more normal way of phrasing this.
>>
>> I will fix it in v2.
> 
> I guess this can be adjusted while committing, seeing that ...
> 
>>>> Remove the forward declaration of svm_function_table and place start_svm()
>>>> after the svm_function_table's definition.
>>>>
>>>> Replace double new lines with one.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> ... it's otherwise ready to be committed.

Great, thx.

> 
> Jan

-- 
Xenia

