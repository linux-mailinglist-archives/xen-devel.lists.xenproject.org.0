Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF433DE6B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 21:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98461.186798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMFyD-0007ts-1y; Tue, 16 Mar 2021 20:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98461.186798; Tue, 16 Mar 2021 20:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMFyC-0007tT-Uc; Tue, 16 Mar 2021 20:07:12 +0000
Received: by outflank-mailman (input) for mailman id 98461;
 Tue, 16 Mar 2021 20:07:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2g6=IO=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lMFyB-0007tO-RC
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 20:07:11 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a6739ac-60b8-4418-aa67-4831c3109de1;
 Tue, 16 Mar 2021 20:07:10 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id b130so36603546qkc.10
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 13:07:10 -0700 (PDT)
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
X-Inumbo-ID: 2a6739ac-60b8-4418-aa67-4831c3109de1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FlvTazR6HIYPQzlRgPOdqYHYhD/aC4QCFeHEiJLQpnU=;
        b=gJp4g8fv8NXPHJRMc2RRG4wctAhpKRFgONibcqSvRhLhGiMbVgLEsAnDtjUoEJ0TYP
         8WfcyR5EEm0cIvbbV17WZnqVh6F61D9CydIb3BbDlxGf/+LJ2ULwGQesIEkz7WZtnYsn
         EVSXHvg1sNPnH5ltOpYGUFWgmRnkRCedVvL31zvAJF1FrV9J42t3HsfA5WI/UsBmlJml
         9ioxW+XgVRLyUoXw2YUcjMESj1tcLh2yliFIFNQLVbYmDB0KnBU1ZdNT62IZCD87NwTk
         jIPDlZWbWYhPIKfCXIlOksn14TB504zfVf3lO5tnYtL1cVVGUKdMDHZrJ4AYwENk/fSY
         ZMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FlvTazR6HIYPQzlRgPOdqYHYhD/aC4QCFeHEiJLQpnU=;
        b=F74P8pXPfnvJGY1R9QkYnAtmJgt5ONq6AJOd0a6a8m8VL9vfPq6VMTyiwTdtoGq7tW
         b8R85orvhoZx4MD9Q7faYXm2SUQAlUB0P8PdExGeLfXLZXojE1/stzsqGX8qjbnuozKn
         n+fn+ds5fYcEkFT0OQP08qv+dDXWS7tfxPOXfej+JGseQnQrPYP+/hIb/huqSDfFKnso
         aT/HYJfw87L2//J38iHtQKSc1srmfvPjZrx8Hrg10sIVzSMG56I1zR6xcQZPSXBba1hc
         GBv//2NgHZ/VTNQxx2gQyTvOisJGMnnXZc9k7sIUBK8oqmR1yAi54WwuCANYKI7pXD4I
         lZZA==
X-Gm-Message-State: AOAM531nyBuzdsjJ/sPwgPVVk/hsBF9WJxvI71jo13fxuQ6gbH5/iInT
	iS7zNqIU47ytSRj0GwhwuoYgCM9NcFTd/KvWueEZ3w==
X-Google-Smtp-Source: ABdhPJwaveTsccwlJQOCT9RBWSIt4lF3ocAV+x6v7mTyJ5Y5cV5Ex/L+XOpj4fCTAVqhUdil2d4WXWsnFqwX05jGeoA=
X-Received: by 2002:ae9:c30e:: with SMTP id n14mr794574qkg.291.1615925230495;
 Tue, 16 Mar 2021 13:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com> <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
In-Reply-To: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 16 Mar 2021 13:07:03 -0700
Message-ID: <CAMmSBy9DFuSE_74=rKkKOsxscgg-oF1Dc8bPQF=PbZUAHLnH3A@mail.gmail.com>
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson <hudson@trmm.net>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

WFIW: all 3 time slots work for me.

Looking forward to this!

Thanks,
Roman.

On Tue, Mar 16, 2021 at 12:42 PM Bob Eshleman <bobbyeshleman@gmail.com> wrote:
>
> Hey everyone,
>
> I think most who are interested have acked the thread at
> this point and I've CC'd everyone (please add anyone if
> I've missed them).
>
> I'd like to suggest we have a first group call to
> set out an agenda, define scope, and start identifying
> the direction the project would like to go for secure
> boot.
>
> I'll prepare the call similar to how
> community calls are handled, with a public cryptpad
> for agenda items and such.
>
> Which of these dates work best for you? Which absolutely
> do not work?
>
>   Mon. March 29th, 16:00 UTC
>   Wed. March 31st, 16:00 UTC
>   Mon. April  5th, 16:00 UTC
>
> Given the Xen community call is at 16:00 UTC, I figure
> that probably best captures our geographic spread.  Feel
> free to suggest alternative dates/times if none of the
> above work.
>
> We can host the meeting on Jitsi which works quite well
> from any web browser.  I'll send out a invite link when
> we've decided on a suitable date and time.
>
> Thanks.
>
> --
> Bobby Eshleman
> SE at Vates SAS

