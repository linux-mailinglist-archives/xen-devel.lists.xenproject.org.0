Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D626A230D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 21:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501549.773353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeMq-0006ww-Sf; Fri, 24 Feb 2023 20:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501549.773353; Fri, 24 Feb 2023 20:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeMq-0006ud-P7; Fri, 24 Feb 2023 20:08:32 +0000
Received: by outflank-mailman (input) for mailman id 501549;
 Fri, 24 Feb 2023 20:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVeMp-0006uV-96
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 20:08:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e55015-b47f-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 21:08:30 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id f13so1816622edz.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 12:08:30 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.185])
 by smtp.gmail.com with ESMTPSA id
 gc20-20020a1709072b1400b008d85435f914sm6197031ejc.98.2023.02.24.12.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 12:08:29 -0800 (PST)
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
X-Inumbo-ID: 01e55015-b47f-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEPyyov4+/6ertWA3DKmR9y7axROyN9YMZttew1AM9E=;
        b=od7ioC7pP+UhpJyxqInOwLAUX1N4+LRekgYRDK2XChtZFQ7vNGVWq2sssehPwtsJbV
         MogOWkg3Br5pSiZsX9eDnumWsQ3o1HTM1GZiVfV2DyfN0W1sG1uOiXJSpr5i1QoR56JY
         Tz53lwwZansMHsJflAH+JcLXJV/IAqWCTMXamea4V949qImMz4U38yX13LyyY2wTLJr0
         LEzDwpzvvwG4JBXe7+bfwZS+jaoeRzEXDf4BvTolprvtvVao1wpR4IS01iP9rgZOPI3z
         fk414hyWdCsPawKraxLEAatDvMk2rHqTfiLx6OeBvrfrlxYQnv+ZFl1ePnyQ/uSg/pfe
         BsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEPyyov4+/6ertWA3DKmR9y7axROyN9YMZttew1AM9E=;
        b=qd9P1Z3k35oteFyVxf7PqYFVnGL8qc8EBkvn7yC3A0SgI4Iu3cOOeKtE1m2UQQEzjm
         GO7Kz4AelFBLVRISsxGCwkJ5G1BOcT5o4rB+YpJbI1NBJ6+29vphNvp0NGupTVWyVFGf
         u5PgvINfi/EO1RGczEN+pPXDdCqby2mz6OsjGZggItDjOKofV/70stm5j5c25gwRR+cI
         cQm+yH+1ima+nbTqLPA/mhuYd36je1I7wemM7X/XGbhs8pcTMjNAwBO6mzQMuPEF7w3J
         Z/o5M+2w7w6qffpLVQClva7cVlFpFI3LG7uroe0GRil7uJpgn+MHgIEKTxMau9nwsgsp
         Sy6w==
X-Gm-Message-State: AO0yUKWyYrpyIbo7kCV+3K1ATtebxifxehppKD6sDU5WV2XjWE/pOnlz
	R+GETG0TwFg4NwEARHTE0DQ=
X-Google-Smtp-Source: AK7set+wjnX8Dsj2cRpQGTKgKkmZpJJFezDzsmCitsibqzu0ZI6NrPY1QaN3RFysLBrM+m4RmW+NWQ==
X-Received: by 2002:aa7:cb57:0:b0:4aa:a51a:7380 with SMTP id w23-20020aa7cb57000000b004aaa51a7380mr15637995edt.0.1677269309999;
        Fri, 24 Feb 2023 12:08:29 -0800 (PST)
Message-ID: <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
Date: Fri, 24 Feb 2023 22:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/24/23 21:29, Andrew Cooper wrote:
> On 24/02/2023 6:49 pm, Xenia Ragiadakou wrote:
>> There are more detailed per-patch changesets.
>>
>> Xenia Ragiadakou (14):
>>    x86/svm: move declarations used only by svm code from svm.h to private
>>      header
>>    x86/svm: make asid.h private
>>    x86/svm: delete header asm/hvm/svm/intr.h
> 
> Thankyou for this work.  I've acked and committed patches 1 and 3.
> 
> Note that you had one hunk in patch 5 (whitespace correction in
> svm_invlpga) that obviously should have been in patch 1, so I've moved it.

Thanks, I missed that  ...

> 
> Looking at asid.h, I still can't bare to keep it even in that state, so
> I've constructed an alternative which I'll email out in a moment.

I 'm also in favor of less headers.

> 
> ~Andrew

-- 
Xenia

