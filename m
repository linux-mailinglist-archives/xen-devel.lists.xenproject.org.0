Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8D511457
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314662.532834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeAe-0006m4-J9; Wed, 27 Apr 2022 09:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314662.532834; Wed, 27 Apr 2022 09:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeAe-0006kF-G6; Wed, 27 Apr 2022 09:41:16 +0000
Received: by outflank-mailman (input) for mailman id 314662;
 Wed, 27 Apr 2022 09:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTkK=VF=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1njeAd-0006k0-7E
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:41:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d6e079e-c60e-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:41:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id x18so1718865wrc.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 02:41:14 -0700 (PDT)
Received: from [10.7.236.33] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm1191730wmp.5.2022.04.27.02.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:41:12 -0700 (PDT)
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
X-Inumbo-ID: 2d6e079e-c60e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=e7D4L2zo/iScrOJGIxSEH4U+pJJP3ttdUouBNECk0Lo=;
        b=FNKTrzCsXUIXMkkxusaBodeKzZqcmZ/E7YQwJ4AYQMEQQQSePnkdE3tY+NI8bL3v/H
         hyCGrxU/mLWFfh857MFzQUceLsBKguJvFwv4MfiDO5dxfSgUpssbpRODEPwKd/CpUVDJ
         UGhQydEkQxcKimaqszf6lt3j7K2qN5Od6k5qeymcZmWN21jxvhDGSQ+tjHw3dZbJk0ki
         hcnduSmNuxQdcMbbLgTAYZziXbrOrSXX+Mkc4LzJRRw+tt4aljj2T4g6MChJNGCRMo8u
         Vh2GbYgFXaeJGVwD8+giTN8yC8QwEzw1aQaVUbOvkfMNSLPsQM0hykAuXWg+hMnoQ8Nj
         dOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e7D4L2zo/iScrOJGIxSEH4U+pJJP3ttdUouBNECk0Lo=;
        b=5y0BhjcFEjf7ULddHKWF4yWZ6uBTQj2pqXS9Dz5WGbYdT/5qYlPcYDy/mmrrTCR5+E
         FtqnrPBpiB5tHIU1blqQV0pPqldJmINUqqG+wfU3OzQzKIGuPm3D/+hKBxguPWueSclv
         1tBz5NI44xVZE9dTBlde1bdPtIMVqqd7ofwFAG2WLiKADn04LWQeM4NJoQDd2zB7FsFH
         y0XsBGaIpa7uHb9sXEZ9tLaBMhzcEm6hfnZBtfiQ5iQ8Ead1iIVXGIKATOlkekg5JoKf
         jY6HIXTEAaW5TLkeuRgXlPsfZgF6OXs9ZnXkDAYNbHyLgK4/VYg32JwrN6Bo72xLE0WC
         42qA==
X-Gm-Message-State: AOAM530jZ91IlgrtWOVGm/2BTsDqa47Nzkjcehyu/5nL0hlZXOrNrbpO
	KiDYtMK3ISOjVm+hwRfzl+M=
X-Google-Smtp-Source: ABdhPJwx5CjEeRRMUXX2U0g05MwOiB8wp6r5svuIZveDRqXg4jEOaQ63WFamQAA5Kzrcz3wU6pfEEg==
X-Received: by 2002:a05:6000:49:b0:20a:da03:951f with SMTP id k9-20020a056000004900b0020ada03951fmr11779927wrx.519.1651052473187;
        Wed, 27 Apr 2022 02:41:13 -0700 (PDT)
Message-ID: <18c1113e-cba2-1f99-324e-d146a3ff5cdd@gmail.com>
Date: Wed, 27 Apr 2022 10:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [cxenstored] Potential bug in special watch event firing
To: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>
References: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>
 <13c29d5b-a9e4-9690-7988-767caf0c44b5@suse.com>
From: Raphael Ning <raphning@gmail.com>
In-Reply-To: <13c29d5b-a9e4-9690-7988-767caf0c44b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/04/2022 08:30, Juergen Gross wrote:
> [...]
>> The xenstore documentation is not clear about whether @<wspecial> should be considered children of /. But I find it counterintuitive that clients may be notified about a special event without explicitly subscribing to it. Is it a bug?
>
> I agree this is a bug.


Thanks for confirming that. I can send a patch to fix it, but it probably won't happen until later next week. If anyone else can get it done sooner, please feel free to do so.

Raphael


