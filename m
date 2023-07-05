Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05D74891C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559418.874378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5F4-0001eg-DF; Wed, 05 Jul 2023 16:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559418.874378; Wed, 05 Jul 2023 16:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5F4-0001c9-A3; Wed, 05 Jul 2023 16:20:34 +0000
Received: by outflank-mailman (input) for mailman id 559418;
 Wed, 05 Jul 2023 16:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j+zt=CX=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1qH5F2-0001c3-GT
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:20:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbadb072-1b4f-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 18:20:29 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-314319c0d3eso4580687f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 09:20:29 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 b7-20020a5d45c7000000b003141a3c4353sm16771546wrs.30.2023.07.05.09.20.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 09:20:28 -0700 (PDT)
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
X-Inumbo-ID: dbadb072-1b4f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1688574029; x=1691166029;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd4i6GUUWzkaWI2I6bKoQby3/uL88g/Mw2tctfykYVw=;
        b=O4/uPLeCiWqIHF0VcAesp4tlOvsBwmXccPeOVP4JOAdfQ/KXn6MWLLh/xIUwNWUQBN
         yQ2Z7SqNqC0klPovJZBeXw1xo3FOyb0BntNF32wduhUhH/3MHSkxB0C+JQ3MJ1/VoeF4
         w6OkmVE/JI/JZ7ytdAZiX4AOXPTn68GMLbbfJ9GCcqkZIj5bcv1ulbNUUanJN6XNHbOZ
         Fo/Qeh5dyp+tvjBsDby48rqSTIwjKH9lAGBdXU8fGCpcmRhbr+gSkyKR/cdhrSVgRcxS
         9pqiUYndTQXP5kHrHH5O/gq0h+06cpul1toqF+eUdpxMVZdLqIAOvKnvcyyuRd7iqHPp
         eagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688574029; x=1691166029;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vd4i6GUUWzkaWI2I6bKoQby3/uL88g/Mw2tctfykYVw=;
        b=aSYQFcn6h56QtFuohKaT8R5oAY902IM36wo7ycQoGBhoOPqFgKWq8fvudzro/Zh1Jz
         6d1Ra4mEbipquR6nAKqIrPXP9+eBIt2cXIKOj+hW7nqRElKUpZRxZp1zIUD46Gs5mQ+Z
         FC8qZFfAlzQpHQNPztMyNCtgPEFhWN+sAQSl6BlLWkb1bH2l0NrkJORJ7pV+6u+vHEZ0
         NnZilsDBm/y12M0obxg6rs30ccgDpS7SdjwaFkh96K8PJPgFmZBxVNd7DbGq1pO0hqKt
         vYm9XaQJmx6L27hFqYRV04LObLdCWg8vYIy205XPV6rLVcMuUciO7R8oi/ocYTpzaVGI
         /szg==
X-Gm-Message-State: ABy/qLboZxm4iWzu6XjbnMTlSvllux893ms0e7PjfzJ44bh2ASQDK6zp
	Vuqe8m2g4ZQPhuImY0WcE7qxOy918zrgscitlt0=
X-Google-Smtp-Source: APBJJlHm4SZb8p+/IS7vEBor1JWImZTOAoeaHOGi4govHlWtAG19wye+FVFQWDCthm918+G8UL3yiA==
X-Received: by 2002:adf:fc08:0:b0:314:824:378c with SMTP id i8-20020adffc08000000b003140824378cmr14058993wrr.20.1688574028779;
        Wed, 05 Jul 2023 09:20:28 -0700 (PDT)
Message-ID: <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
Date: Wed, 5 Jul 2023 18:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
From: zithro <slack@rabbit.lu>
In-Reply-To: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05 Jul 2023 17:51, George Dunlap wrote:
> Hey all,
> 
> The following systemd issue was brought to my attention:
> 
> https://github.com/systemd/systemd/issues/28113
> 
> I think basically, they want `systemd-detect-virt` return the following
> values:
> 
> Xen on hardware, from a dom0:  `none`
> Xen on hardware, from a domU: `xen`
> Xen in a VM, from a dom0: (ideally the virtualization type, or `vm-other`
> if not)
> Xen in a VM, from a domU: `xen`
> 
> Is there a reliable set of tests which would work across all dom0 guest
> types / architectures?  If not, can we expose the information somehow?
> 
>   -George
> 

Small follow-up, I did some more tests (AMD platforms).
systemd-detect-virt (sdv) is using "/sys/class/dmi/id/sys_vendor".

On both "baremetal" dom0s, sdv is reporting the platform manufacturer 
("MSI" or "Micro-Star International Co., Ltd." on my systems).

On a nested dom0, sdv is reporting "xen" :
   root@xen-nested:~# SYSTEMD_LOG_LEVEL=debug systemd-detect-virt
   Found cgroup2 on /sys/fs/cgroup/, full unified hierarchy
   Found container virtualization none.
   Virtualization Xen found in DMI (/sys/class/dmi/id/sys_vendor)
   Found VM virtualization xen
   xen

PS: my host "xen-nested" is not masking CPUID leaves in cfg file.

So I'm wondering, isn't that path enough for correct detection ?
I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any 
other known hypervisor), it's nested, otherwise it's on hardware ?

Is that really mandatory to use CPUID leaves ?

