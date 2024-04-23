Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D898AF4BE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710937.1110513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzJTq-0004iP-I6; Tue, 23 Apr 2024 16:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710937.1110513; Tue, 23 Apr 2024 16:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzJTq-0004fD-EW; Tue, 23 Apr 2024 16:58:54 +0000
Received: by outflank-mailman (input) for mailman id 710937;
 Tue, 23 Apr 2024 16:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09RI=L4=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rzJTp-0004f7-Bu
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:58:53 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33598a9-0192-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 18:58:52 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso7463273a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:58:52 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d17-20020a1709063ed100b00a52222f2b21sm7239299ejj.66.2024.04.23.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 09:58:51 -0700 (PDT)
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
X-Inumbo-ID: c33598a9-0192-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713891532; x=1714496332; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiQPt+nn1pqowc9qM2NtyZtdawidGiRo3oxEXY6u3q0=;
        b=f/G3VJE7HDTQtwgHjEh8a4xgVnOocv6NfsznxOwrwQSbuQsiaynJdI5JBwDa7sPXYQ
         rdCV9AdZTRhDXLUfgUdBDdyNPLTJV9qQRS2eWoUaM9OSA3nMTPn7hPMCsBds4TMB1Hpd
         VkJ54GqMH3eeePTZl2WSdd82vaWEPC6IZOLoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891532; x=1714496332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiQPt+nn1pqowc9qM2NtyZtdawidGiRo3oxEXY6u3q0=;
        b=rbEyvP1kc0A7/lGUbPorIJtrersJB/vhshAL97IiL2/1U+K7xC+IG3JjiJyI2/Z/9K
         65eALf1N7eVigCyOs+mwUZxHfZc0XXzQbOrEF+zHuru3wJR1bRhOLiHfyCVDtw8XqJio
         dAPoI+aEhBvebkMEyO1LGCEL1BRX2FZ3QyLAB1wz1dPfnUAvivbp5Guu93VV4lsVhVv1
         LScr8rgekalTzei3lagpNfo7UypOXmThKMs71K6JMg5OnazNRMB4aGMazTaV3VotTDzu
         a8l9+8WzOUDrE9zzM4YwqXNcJWSih35uJfqhV4BbW9/Td0XZV9RyTD1BBW2g6oU0O886
         4sCw==
X-Gm-Message-State: AOJu0YwknYAWr6EoFj4DDSXqrP2LYc7MgboQpGqhO62q3fapFHSVzNE4
	lgigQPJ0jbtGcA15J7k0vmEqdY/L6q34TWWAGH7t3o+Puc1pRHI9In190XwJLRg=
X-Google-Smtp-Source: AGHT+IHSMql8VM5Yf4uRDxSCrGb3oGuT/umx/173bTRzn9aiRgaanzJ1lxZgTwjSSzuZUxr8VqeZcA==
X-Received: by 2002:a17:907:6094:b0:a52:2486:299f with SMTP id ht20-20020a170907609400b00a522486299fmr12465298ejc.71.1713891531923;
        Tue, 23 Apr 2024 09:58:51 -0700 (PDT)
Date: Tue, 23 Apr 2024 17:58:50 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Add --force option to xen-ucode to override
 microcode version check
Message-ID: <4871be67-8b89-4324-a711-02bfccae3a6f@perard>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-6-fouad.hilly@cloud.com>
 <35e382d7-0f65-4dbe-bc80-ddbf9d649e24@perard>
 <CAJKAvHZ0abytPgKxVMhVRhTyoV0LMTE46+W+ox0MaFagRXbMGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJKAvHZ0abytPgKxVMhVRhTyoV0LMTE46+W+ox0MaFagRXbMGw@mail.gmail.com>

On Tue, Apr 23, 2024 at 04:26:53PM +0100, Fouad Hilly wrote:
> On Mon, Apr 22, 2024 at 6:57 PM Anthony PERARD <anthony.perard@cloud.com> wrote:
> > On Tue, Apr 16, 2024 at 10:15:46AM +0100, Fouad Hilly wrote:
> > > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > > index e3c1943e3633..4178fd2221ea 100644
> > > --- a/tools/misc/xen-ucode.c
> > > +++ b/tools/misc/xen-ucode.c
> > > @@ -24,7 +26,8 @@ static void usage(const char *name)
> > >             "Usage: %s [microcode file] [options]\n"
> >
> > Now, that usage line is wrong. The options needs to go before the file.
> I am not sure what you mean "wrong"? from parsing perspective, both
> scenarios can be successfully executed:
> xen-ucode firmware-file --force
> xen-ucode --force firmware-file
> it becomes wrong if there is an argument expects the file as an input.

Oh, sorry, I didn't know that getopt() would look for options on all
arguments, even when separated by nonoptions. I'm used to CLI programs
that takes options first, then files, even if that might work with a
different order.

Cheers,

-- 
Anthony PERARD

