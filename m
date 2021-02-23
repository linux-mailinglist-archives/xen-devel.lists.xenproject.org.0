Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0E32302F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89048.167477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc2N-0001rN-T1; Tue, 23 Feb 2021 18:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89048.167477; Tue, 23 Feb 2021 18:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc2N-0001qt-Oo; Tue, 23 Feb 2021 18:03:55 +0000
Received: by outflank-mailman (input) for mailman id 89048;
 Tue, 23 Feb 2021 18:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pXyS=HZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lEc2M-0001qb-IJ
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:03:54 +0000
Received: from mail-pj1-x1032.google.com (unknown [2607:f8b0:4864:20::1032])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af6da4fb-1eae-4e2d-97b6-7c724af0887c;
 Tue, 23 Feb 2021 18:03:53 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id o22so1946556pjs.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Feb 2021 10:03:53 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id c6sm7830377pfc.94.2021.02.23.10.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:03:51 -0800 (PST)
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
X-Inumbo-ID: af6da4fb-1eae-4e2d-97b6-7c724af0887c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ge4IIFdlQFH1Xek33XcsWVlIeV6+yCVvViifgE9+p+s=;
        b=gILul5JaCqaLqKRU5o6y/z57kUxYVVmiTpx4ZHYx+UxfDhPbPuCVtLByCLstm7ikb9
         8bxFAL3e5Mj0bp/DGJNAPzOFzbnZzzDyhA1xGT45EMtXDF4rjc6mPDKGVf0dbjmoANRC
         7+A6eq3yJDMv/3MsGBsbI6w4b7z0jsiq4eML45T57TTpwi4rssI7XMwjNvGFi+vSq2qt
         kzBpvCh9gOmGgzl8uNw0NYEGXM8AlFtQxTjwewDiGwhvdBeUy2Xxdlu/uMVkBLAxcs7u
         /7Oj54FMxycbOmZBilDRb9boPSQtNaewCBc7wmF0kiDe3F0MNGXgNU4CKrxk0WnaikjF
         Sohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ge4IIFdlQFH1Xek33XcsWVlIeV6+yCVvViifgE9+p+s=;
        b=qcHJ+zDUjb8vZ9kczqGATMdprTAQvkeMpQBxBhC2I79AVUxmdMiPq0JwsGDqbbnzL4
         rwi/4x0+CORVJ9gJ0oteBtn6iZcu1e5SH01QGHvaq0WMYa9FOFTCUiAkYxBQraqVEODJ
         NjR3/yDj7EOsDwX8lfH5QB9cxy2ggi8a5ZkBPHmOMCU2yr2SI6dtGWiLZSjPVBt7Zf2A
         mZ6lwPls+ExQzWpdsPz9h38xppNcVTuqoAGiVtUFZz/6b5PCAS8Q+SE/x/GZeRd5iiKA
         wUaC5S7CxTpPMcdIO1ePhUfz0nQ+WmgMyuZBn2deh6X3FujiE/CnD2Jaie0UQU5an+kM
         lCpg==
X-Gm-Message-State: AOAM531RMGHqhzxILL6y8zV/qGGnanPJWMrA8eBqPnHrR7197XPbRiPc
	F37F7WYKoXaFW4vwUCSKOTtsIdlYnzoWp4Nj
X-Google-Smtp-Source: ABdhPJyDQIw1Yye2kqr+UbCidXk5v7BCIMn0tQE+kmYc7qrn/SuSeQbinuw/+DYujMy6mw+Bhjkd3w==
X-Received: by 2002:a17:90a:f493:: with SMTP id bx19mr17266282pjb.213.1614103432627;
        Tue, 23 Feb 2021 10:03:52 -0800 (PST)
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Olivier Lambert <olivier.lambert@vates.fr>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <9a58bdf7-3a34-1b81-aec9-b14da463d75e@gmail.com>
 <f24e9e8d-9d55-f301-9a33-4398b463013d@suse.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <bb7dd7ee-9df1-47d2-c4ae-08e051ea16b1@gmail.com>
Date: Tue, 23 Feb 2021 10:00:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <f24e9e8d-9d55-f301-9a33-4398b463013d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/22/21 11:16 PM, Jan Beulich wrote:
> It is on my list of things to look at. While probably not a good excuse,
> my looking at previous versions of this makes we somewhat hesitant to
> open any of these patch mails ... But I mean to get to it.
> 
> Jan
> 

Thanks for this response.  I did comb through your v2 feedback
point-by-point and incorporate it into the code, so I do hope
that ends up helping.


Best,
Bob

