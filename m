Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C676333971F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 20:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97297.184801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKn7S-0006CU-0m; Fri, 12 Mar 2021 19:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97297.184801; Fri, 12 Mar 2021 19:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKn7R-0006C9-Tq; Fri, 12 Mar 2021 19:06:41 +0000
Received: by outflank-mailman (input) for mailman id 97297;
 Fri, 12 Mar 2021 19:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqlt=IK=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lKn7P-0006C4-Jo
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 19:06:39 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e9c3918-45ee-4b77-8605-bb526c767846;
 Fri, 12 Mar 2021 19:06:38 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso11514748pjb.4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 11:06:38 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id 8sm6397303pfp.171.2021.03.12.11.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 11:06:37 -0800 (PST)
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
X-Inumbo-ID: 2e9c3918-45ee-4b77-8605-bb526c767846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SZP31BWDO2a2GEspHnC+nw+SlsUo6GIIo5Al+G3ya/E=;
        b=TDd4L3K62tJKYjK5rQ6ta9doz5QXpYcSXNI/5ZRNJuwzezOFl08AvR4IUXuPHAqxAm
         qn1F+A+wddpxIoZFLsJcrNDFkG7Isj6lIrF5FKH77ulsQ78qWmsE3Hy+2QwA93J9GmUb
         ep+nPLbGIShnSF37QBdOhAg/OVAddECZCwOWAWNxJAODvUVfxmr41lZ6D+BsT0yS0iDv
         3ug9avDS/PUQU9cGKSZX0L3dzxmnCBsrjg06EkvPalURkspqD8+1vywkwyX4yCLm6s7E
         T0vJXIOuiq8F0exI5wZEWm7vbui1B6C+VzGkbOTDta1u9gkuRWu5vR7DdbzIOhRczIFa
         Kz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SZP31BWDO2a2GEspHnC+nw+SlsUo6GIIo5Al+G3ya/E=;
        b=S/XCVwg6LQlbTTSxRZXg9bkHOWb1gxQz1JU5CKHO7gu/Fu9EgAICO/ffVZudOnDWS3
         3jk8mguv1i9mLoESI/DncG1kfWatOSHtAdOV/3qMNxT4c774IzvRrtGRUnR9Wwd2sgTh
         jXYnxAu+gng/8CC4O8IrW5m/sJzSXwJXmTus+gH0EjkZ6oJF2TtCGmKCSGcG5kCsOHGX
         CLvmMWXiho4jQ68+Wjg946vFunR0KuJD6nLpx8OViUL6HeQucdpi/21f//NjBZpQt6Ar
         hDpC6XpmQTSwuoUDSMlSIHp5kK6zzB+UFX8U1THJ0SpsnTJCMwLqd9zsCUc2D43CJFVd
         B5Og==
X-Gm-Message-State: AOAM530eCx2b6e/FVd+EOelgC18ShKmNTxhkaRk8tjH9xqKxfmxE6DR/
	92a1UuWNIZDRfcbkWzk5zhQ=
X-Google-Smtp-Source: ABdhPJzY1TFKZ8P4Y+acYcIBrj0MeGMjKO26JNJ7qrs2W5M11qHhHguw02d4MGdaNFN5NldvSJy+NA==
X-Received: by 2002:a17:90a:ad87:: with SMTP id s7mr16041442pjq.20.1615575997970;
        Fri, 12 Mar 2021 11:06:37 -0800 (PST)
Subject: Re: Working Group for Secure Boot
From: Bob Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
 Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson
 <hudson@trmm.net>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Organization: Vates SAS
Message-ID: <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
Date: Fri, 12 Mar 2021 11:06:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Awesome, it's great to see this interest.

I'll wait until early next week to give more
people a chance to pitch in, then start
bugging everybody about availability to
schedule a meeting.  I'll put together a
small agenda then to get the ball rolling.

Thanks all.

