Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC842D32C4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 20:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47752.84504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmitY-0002u9-5K; Tue, 08 Dec 2020 19:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47752.84504; Tue, 08 Dec 2020 19:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmitY-0002tk-1e; Tue, 08 Dec 2020 19:43:32 +0000
Received: by outflank-mailman (input) for mailman id 47752;
 Tue, 08 Dec 2020 19:43:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pB08=FM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmitW-0002tf-Ns
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 19:43:30 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05900a23-a7e0-424e-81aa-5cfb51db949d;
 Tue, 08 Dec 2020 19:43:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m5so7836002wrx.9
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 11:43:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id p19sm24373470wrg.18.2020.12.08.11.43.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:43:28 -0800 (PST)
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
X-Inumbo-ID: 05900a23-a7e0-424e-81aa-5cfb51db949d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=qjzyXx2IMmVT+nf19cGpA6lxPWA9L/XuyXLsL1yFufU=;
        b=iCn/gZYgc2fznrPCMOwpRCI+GASERyIrvi8q+udmWKhJtmQuAEu/8N6D+nYztBwX7U
         bfz/edOkmJWlivUfEVNVof/jv/04qwlYrt8TfkDPMWLufPwyrnSR+ukzAVjN5bMpNprH
         v6nYqYjrucm5h3nwITkul4C1JmGGK3q2i6eZIqTvOgJNyxQmcFO1r8gwnAuB+x6Vcqcp
         2ccXo3Qbt1XYQ/U+5uOS/hoFkiNA1EamSNiMwmQ07PeeAlRFM3jL/741gMeHIthg1Qug
         KK9HfWErhDcw7xooth3C+iOxE+XziVRkT47CZ83n8bzvU0vJ18Ldlv0SmJ5tjeWElVZd
         UhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=qjzyXx2IMmVT+nf19cGpA6lxPWA9L/XuyXLsL1yFufU=;
        b=ZIfMskYlZRkH3cKvOh4QlJp+PeljgM2t2FmmkW+zK3rzl0JKUKidincoom+ViLFrO1
         CRpBCxFNcQ4Vpi5E1eecJjwEguJ3dkRHSZMh9PEgCsc7d5Tms5BahDlrXPwSnwMFiXV2
         WI89gliXC4RBz3KqlhXHfsyUw9KR/z8sw2ivPau2dfesGJonSAWdWeV2/2rLBwUCVvzM
         SL7XhOt4njeKg+Tp//nx3LOC+bvIiHeDOMRREOAEzH8B2NAl/fCgJEUeiZIy1cyE5PwE
         7XjhDJrehMp4xo9wO5euRikahxLod89WVso+BE8WnPPSIFuZJgYLXfUn9AqDix21DbRF
         mWCw==
X-Gm-Message-State: AOAM533O0DjxRv15qIfFxVmFdXYOVFTfK+wletR8USQn5PHpI6ClzlgD
	vpyXns8iq7kbrMgLIP+BxKU=
X-Google-Smtp-Source: ABdhPJzKC5lPnW7jqWcSMU2/3bfO1AxUZIm1lvwHhjhewQ8WO1X3gNKYfN2AYs8KyMx/SvP3k8lQEw==
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr27141971wrv.25.1607456608657;
        Tue, 08 Dec 2020 11:43:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-18-git-send-email-olekstysh@gmail.com> <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com> <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com> <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com>
In-Reply-To: <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com>
Subject: RE: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Tue, 8 Dec 2020 19:43:26 -0000
Message-ID: <0d6c01d6cd9a$666326c0$33297440$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKk0D4Qme59XF0a0h96d36zIOxDhQIE/k2jAQvf44kCfV5qfQHp2KBNqBXTFAA=

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 08 December 2020 16:57
> To: Paul Durrant <paul@xen.org>
> Cc: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Julien Grall
> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
> 
> 
> Hi Paul.
> 
> 
> On 08.12.20 17:33, Oleksandr wrote:
> >
> > On 08.12.20 17:11, Jan Beulich wrote:
> >
> > Hi Jan
> >
> >> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> >>> --- a/xen/include/xen/ioreq.h
> >>> +++ b/xen/include/xen/ioreq.h
> >>> @@ -55,6 +55,20 @@ struct ioreq_server {
> >>>       uint8_t                bufioreq_handling;
> >>>   };
> >>>   +/*
> >>> + * This should only be used when d == current->domain and it's not
> >>> paused,
> >> Is the "not paused" part really relevant here? Besides it being rare
> >> that the current domain would be paused (if so, it's in the process
> >> of having all its vCPU-s scheduled out), does this matter at all?do
> >> any extra actionsdo any extra actions
> >
> > No, it isn't relevant, I will drop it.
> >
> >
> >>
> >> Apart from this the patch looks okay to me, but I'm not sure it
> >> addresses Paul's concerns. Iirc he had suggested to switch back to
> >> a list if doing a swipe over the entire array is too expensive in
> >> this specific case.
> > We would like to avoid to do any extra actions in
> > leave_hypervisor_to_guest() if possible.
> > But not only there, the logic whether we check/set
> > mapcache_invalidation variable could be avoided if a domain doesn't
> > use IOREQ server...
> 
> 
> Are you OK with this patch (common part of it)?

How much of a performance benefit is this? The array is small to simply counting the non-NULL entries should be pretty quick.

  Paul

> 
> 
> --
> Regards,
> 
> Oleksandr Tyshchenko



