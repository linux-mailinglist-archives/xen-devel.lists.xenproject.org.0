Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A218BAD39
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716413.1118516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sgU-0008Cq-K8; Fri, 03 May 2024 13:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716413.1118516; Fri, 03 May 2024 13:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sgU-0008AN-Gf; Fri, 03 May 2024 13:10:42 +0000
Received: by outflank-mailman (input) for mailman id 716413;
 Fri, 03 May 2024 13:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLhg=MG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s2sgS-0008AH-KN
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:10:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c68a1f-094e-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 15:10:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41dc9c83e57so11618245e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 06:10:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0041674bf7d4csm9232860wmi.48.2024.05.03.06.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:10:38 -0700 (PDT)
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
X-Inumbo-ID: 89c68a1f-094e-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714741838; x=1715346638; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdAyjxljkTuPZLMR/LrbpYRYi58+ssgwbp2Exp/5Dnk=;
        b=b3UH7ZD7C5HpLurXW4zZe18u/WdoVVkfzS+JY7qn4UnIrCo/PNNAvacUOdPDl1hsRC
         nL3Hucc1ap2SaobRyyHTkBvPi8XJD44qRCw4GSDYzZt5URQptvwHFA8gk6CEO3z2jKG5
         lnkTFLUqsAu/tuqCiEtcflXMO0okpfjfwy590=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741838; x=1715346638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdAyjxljkTuPZLMR/LrbpYRYi58+ssgwbp2Exp/5Dnk=;
        b=ULRXaC8YPz7caaUuZ4mEMy248GL7MQYOn/gevjARpF8fAY3Qzs5lMvDeot/B2VAeVz
         b5tGE/YLnpIJH2kfnND7pZgfnsFdGfr01aaefm/Ot0NQ8hk0GLxyAB7YahazUTwB2Qi0
         Ewrk4nbwf4BDi/OiBYJmRa2E9+2pFyF8UV3gYx6ld6Fi9OeTYKpMmVEn5VuTXgua2/Su
         1mKnauEdxzSseg9HXOOkzE9m8sxAPkpxzIJsyNH8vYA2ZadeGBMFlU42ok8oM3mcSthP
         OvdBsK6IPOu4ohyF5AXC+BD24kz/1EvfBeWLhyHP1oLXDzhBHSNt4+3ZlyVyOj/kbuwN
         G1KQ==
X-Gm-Message-State: AOJu0YwQQo/MEr37fbC+WIp/VXGkSrlzh5C44c+StTNjhsLWY9sYAXAJ
	dHb7Zewb3Jr9MDMMuTqTRF63bPd4yyzBY75LJUQZctfPebt8p2EIocdqM3yVM/xne/ZKbaueSgX
	o
X-Google-Smtp-Source: AGHT+IGxalY00lVB22PNmZRhd/SFzBdfSMjXYxLNh57K5lBTAFZODUMQ5q4dR9usGMOtVmObMJDWaQ==
X-Received: by 2002:a05:600c:1f81:b0:418:9d4a:1ba5 with SMTP id je1-20020a05600c1f8100b004189d4a1ba5mr5458255wmb.6.1714741838364;
        Fri, 03 May 2024 06:10:38 -0700 (PDT)
Date: Fri, 3 May 2024 15:10:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.19? 0/2] xen/x86: support foreign mappings for HVM
Message-ID: <ZjTiTYGzEHYXpncq@macbook>
References: <20240430165845.81696-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430165845.81696-1-roger.pau@citrix.com>

On Tue, Apr 30, 2024 at 06:58:43PM +0200, Roger Pau Monne wrote:
> Hello,
> 
> The following series attempts to solve a shortcoming of HVM/PVH guests
> with the lack of support for foreign mappings.  Such lack of support
> prevents using PVH based guests as stubdomains for example.
> 
> Add support in a way similar to how it was done on Arm, by iterating
> over the p2m based on the maximum gfn.
> 
> Mostly untested, sending early in case it could be considered for 4.19.

I've now tested this using the following dummy XTF test:

void test_main(void)
{
    unsigned long idxs = 0;
    xen_pfn_t gpfns = 0;
    int errs = 0, error;
    struct xen_add_to_physmap_batch add = {
        .domid = DOMID_SELF,
        .space = XENMAPSPACE_gmfn_foreign,
        .u.foreign_domid = 0,
        .size = 1,
        .idxs.p = &idxs,
        .gpfns.p = &gpfns,
        .errs.p = &errs,
    };

    error = hypercall_memory_op(XENMEM_add_to_physmap_batch, &add);
    if ( error || errs )
        xtf_error("add_to_physmap_batch failed: %d (errs: %d)\n", error, errs);

    while ( 1 );

    xtf_success(NULL);
}

And avoiding some of the permissions checks in Xen so that an
arbitrary domU could map dom0 gfn 0.  I see count_info increasing by 1
until the XTF guest is killed, at which point the count_info goes back
to the value previous to the map.

Regards, Roger.

