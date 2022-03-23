Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6F4E5429
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 15:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293915.499489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1r7-0005bv-QO; Wed, 23 Mar 2022 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293915.499489; Wed, 23 Mar 2022 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1r7-0005ZM-NJ; Wed, 23 Mar 2022 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 293915;
 Wed, 23 Mar 2022 14:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uas=UC=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nX1r5-0005ZG-V1
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 14:20:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734c4e5e-aab4-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 15:20:54 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id r13so2345413wrr.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 07:20:55 -0700 (PDT)
Received: from [192.168.8.99] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b00389e8184edcsm4146646wmq.35.2022.03.23.07.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:20:54 -0700 (PDT)
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
X-Inumbo-ID: 734c4e5e-aab4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=oDEg5bIYWXgwBpILzlm6D24oSE2mDL1vSCp3Tswk0wc=;
        b=Fut3qjCByb8e6FazRpMF9vVqYuGzPVXpcO+fgeYFlkUzc7a6urH6CwVpviuwDhm1/C
         qdRHRMgK0EaP8UL0F5fuvNNebtDCsFIc284V6TiAP3PQ4pRipJaG7MaImb21r3xQMIO9
         iXBK/2nRGqiZMmAYkc/1W/u6zGAaQ1oA5gamGhsmKb/+8itcZM2Z0+GphcteAz6p8HaM
         fk2sOMg+00dQGUQMMIzfOv8oWNRaYQzgRTVAwdVkGZA1J0DFiqBK9siYBnpHd+67TckS
         HkiC3WOL37j4uLDDDYrQ/SbbgqoAggg0pf9IHXLhFh1/FizHJBhZlG4gEGjtM1CphVs+
         z25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oDEg5bIYWXgwBpILzlm6D24oSE2mDL1vSCp3Tswk0wc=;
        b=miDoVBJKotD3nTTPP4HjQcd+zH6YigBmbYP6wn54aFFE02yS4BKasbncz9C0aqjbWf
         bAMPMeObj941r8wsbIhZI9ZMkBcTD4oTivCNNF6S4RVs2Jv2Ky4ZS3XYPNu0rKk4637g
         Xubf5aDG4zuOFYasjFTTRzuccYFIenvEn8d+o+9vfAUSjPFrKMfCy/o77uyVLsqfH4uX
         r5rN/DEyQ0/0Z15lbVhu4X6W3QrYzJ6U/pLny5aOPdTX1OxvfVpFjQEXawcWk4HxfYdN
         /+AXDA63ZbmBNNjnipW7SkuPEm/Amp97ct2l/Ed8qrn7pkHaPn5zKOqgUkp6Klv0jmlF
         W7Xw==
X-Gm-Message-State: AOAM530ccSQbf+P91xwFll5+6bia9kn68IauQ+qclK3M7m8CgnTJteNH
	+6WM/i52E+fWzMCLa7oqQMo=
X-Google-Smtp-Source: ABdhPJwe5fiapR25zCoqfBY1ngq0IpzPNlujoq4pRws7xuvH7ujjBLCz+l3Ev7QcZ87VHFCX9Wd8IA==
X-Received: by 2002:adf:a482:0:b0:1e3:3e5f:496c with SMTP id g2-20020adfa482000000b001e33e5f496cmr35027wrb.606.1648045254456;
        Wed, 23 Mar 2022 07:20:54 -0700 (PDT)
Message-ID: <b1aea785-1631-2afc-2d8c-c21067903978@gmail.com>
Date: Wed, 23 Mar 2022 14:20:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] kexec-xen: Allow xen_kexec_exec() to return in case of
 Live Update
To: Simon Horman <horms@verge.net.au>
Cc: kexec@lists.infradead.org, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Raphael Ning <raphning@amazon.com>
References: <20220314092115.48309-1-raphning@gmail.com>
 <Yjsp5zsc1lseY2M9@vergenet.net>
From: Raphael Ning <raphning@gmail.com>
In-Reply-To: <Yjsp5zsc1lseY2M9@vergenet.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 23/03/2022 14:08, Simon Horman wrote:
> Hi Raphael,
> thanks for your patch. Overall I think this is good.
>
> Unfortunately I am seeing a build failure with this patch applied.
>
>  ../../kexec/kexec-xen.c:292:6: error: conflicting types for ‘xen_kexec_exec’
>   292 | void xen_kexec_exec(uint64_t kexec_flags)
>       |      ^~~~~~~~~~~~~~
> In file included from ../../kexec/kexec-xen.c:6:
> ../../kexec/kexec.h:327:5: note: previous declaration of ‘xen_kexec_exec’ was here
>   327 | int xen_kexec_exec(uint64_t kexec_flags);
>       |     ^~~~~~~~~~~~~~
> make[1]: *** [Makefile:124: kexec/kexec-xen.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>
> See: https://github.com/horms/kexec-tools/runs/5661629877?check_suite_focus=true


Hi Simon,


Thanks for the review.  The conflicting declaration is for the --without-xen build, which I didn't test.  Let me fix that and post a new revision.


Raphael


