Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF9E8B4931
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 04:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713492.1114459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0tzp-0007zE-7Z; Sun, 28 Apr 2024 02:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713492.1114459; Sun, 28 Apr 2024 02:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0tzp-0007x6-4U; Sun, 28 Apr 2024 02:10:29 +0000
Received: by outflank-mailman (input) for mailman id 713492;
 Sun, 28 Apr 2024 02:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfFb=MB=gmail.com=dmitry.torokhov@srs-se1.protection.inumbo.net>)
 id 1s0tzo-0007x0-7G
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 02:10:28 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a316060-0504-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 04:10:26 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c74ff209f6so2317840b6e.0
 for <xen-devel@lists.xenproject.org>; Sat, 27 Apr 2024 19:10:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5ae9:912b:8980:d67c])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a056a00235600b006ea7d877191sm16963376pfj.2.2024.04.27.19.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 19:10:24 -0700 (PDT)
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
X-Inumbo-ID: 7a316060-0504-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714270225; x=1714875025; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j25O0uJoaqNnY/ehouxnDjRK54rAQQT8GHfQlfgnn4s=;
        b=lNejjYIuDX/J9Zg7Yu0lFT7nkjusFmAHTp+/ygkVOnK2T0/ZrBVR1PUvXCeiBNTZJe
         sfu8DamPLjjJEs9fE1fGLashjT8eu3qbRlssw79hjTG7Mx3Mh9RXqwzcjtEPrUELj5if
         HJ7wHHcIhTp29pytAerCm9VRQoK2tMGJVLIF8lS/33As0O0O9i1K7+bfQL3BjEwvIvgn
         3PSXTWAQnJ2A1Jcd7+fASu1rEnTR+dT1poeXm4EsAgGdYFx+R8wtYw+hIDLY0e8Z1Mmy
         /1x0AcxxW/e4+w6jWJ+wGDFxW6r9LA7+o6czjaFA/IRhI0f4WIcpe0bkWYqGnMtohCnZ
         8ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714270225; x=1714875025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j25O0uJoaqNnY/ehouxnDjRK54rAQQT8GHfQlfgnn4s=;
        b=nw0uRFnVM4JSR48a3G2qP4Vv4AAnbuzplwlYtTT+DYoLlMbNtUC+YRzYuxZlRoOhPN
         QXksyVOPaJzEdmPWR3YW65TllsCEvdbBcqPnrclWqS9N5ovs9+tNUm5ULP068Oqn+erS
         BMS+X4cSHYqz8uHkmcpxyMxYyilyVzQ80ieSecre+gqiY/RJr8L3AN6f6/+PKzUwADmf
         KazczQAOhDw4m/U9rsUMRl01IQ8u6xadmWJH+xYnhbAu59T7EeVOMWsB6y8zsMSpP1ok
         8X8iisdYacWXCtT9/Cqf6Pnk+W6DRlV8HzQqTNCN1EUDFOG9ROKW/yAUdNF+pNdMtL7D
         jZNA==
X-Forwarded-Encrypted: i=1; AJvYcCXrQYvL0jMAlp6LemuxpjECVJD8jTUiU/z6UNQ4rzZ5Q1VxCQaZi7pDaRSkdMqfeF5/2X/wiki2h8N4MO6lXKs8UwCbjxo7OYR52PE2/xY=
X-Gm-Message-State: AOJu0Yys+jLJSgwdc1Iudlfne9m4X+zwbJ8lYGlnn7HA7GDtQXTEkveO
	dtQgrOfQvA3dh5b0+JC0DLrO8dUmm9O4Rm1K1jZ/Ff54+qfVy0l6
X-Google-Smtp-Source: AGHT+IHtX6yRgJyzoddZByQyAWFPvLNk2129HSIFKQBNavTxch+yNcgxHbPrMp8a0EE9DUC+bfmMSQ==
X-Received: by 2002:a54:4512:0:b0:3c8:2be2:7833 with SMTP id l18-20020a544512000000b003c82be27833mr8183995oil.37.1714270225235;
        Sat, 27 Apr 2024 19:10:25 -0700 (PDT)
Date: Sat, 27 Apr 2024 19:10:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Phillip Susi <phill@thesusis.net>,
	stable@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	linux-input@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] Input: xen-kbdfront - drop keys to shrink modalias
Message-ID: <Zi2wDivw7XBuNnj-@google.com>
References: <20231011193444.81254-1-jandryuk@gmail.com>
 <CAKf6xpuJe6Cza6bow3QxDGf1viu0kish7Y8YRN8haXL1oEF3HA@mail.gmail.com>
 <CAKf6xpv2oDpPB3wWh=Fz_ahDVgmvw2MSj_q3RYqQ8NG6km5Tuw@mail.gmail.com>
 <ZgWxYvQH4A_Vh1i4@google.com>
 <CAKf6xpu+8Uh263NqKm1qFkYG9VzHH-p4UZ=x+Fm+-SHR7J5=wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpu+8Uh263NqKm1qFkYG9VzHH-p4UZ=x+Fm+-SHR7J5=wQ@mail.gmail.com>

Hi Jason,

On Sun, Apr 21, 2024 at 07:57:24PM -0400, Jason Andryuk wrote:
> Hi Dmitry,
> 
> On Thu, Mar 28, 2024 at 2:05 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Jason,
> >
> > On Wed, Mar 20, 2024 at 01:42:27PM -0400, Jason Andryuk wrote:
> > > Hi Dmitry,
> > >
> > > Do you have any feedback, or can you pick up this patch?  It solves a
> > > real issue affecting udev, which crashes the Debian installer and
> > > breaks the mouse for Gnome.
> > >
> > > Or would you be okay if this patch went in via the Xen tree?
> >
> > I'd rather not. Could you please ping me in 2 weeks on this. I promise
> > we find a solution before the next release.
> 
> It's been ~3 weeks.  Any ideas?
> 
> If you think this patch should be pursued in this form, I'd like to
> post a v4 that adds BTN_DPAD_{UP,DOWN,LEFT,RIGHT} on the off chance
> someone wants to use a controller.  I dropped them initially since
> they are not keyboard keys, but button presses are delivered through
> the keyboard.  Hence, they should be included.

I do not think suppressing random keys in the driver is a good idea,
because we may fill up what you currently consider as gaps, and
people will be confused why certain events are not being delivered.

I just posted a patch (you are CCed) that attempts to trim too long 
modalias strings, please take a look and see if that solves your issue.

Thanks.

-- 
Dmitry

