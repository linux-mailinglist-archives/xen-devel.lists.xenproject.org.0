Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9D968AAB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788100.1197536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8fi-0002cd-N9; Mon, 02 Sep 2024 15:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788100.1197536; Mon, 02 Sep 2024 15:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8fi-0002ah-K9; Mon, 02 Sep 2024 15:08:50 +0000
Received: by outflank-mailman (input) for mailman id 788100;
 Mon, 02 Sep 2024 15:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sl8fh-0002ab-2X
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:08:49 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 413db1d2-693d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:08:48 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so4198934a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:08:48 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24372d393sm3260672a12.23.2024.09.02.08.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:08:46 -0700 (PDT)
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
X-Inumbo-ID: 413db1d2-693d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725289727; x=1725894527; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRnYn3FHUp24+krwoIfPD0gry4Z+7Bez6xvbuMaTqvc=;
        b=TtLXXJ4nhTjdatX9KAdYIwj5SoIed7cQVcNmL8xMAF7OUBIL9tJusHQ7XJ6uRnsX7e
         okLppPJXuBUF4Bp4Tfx1Vw5/BWgnrr1bJgt9ALJrOHgiQYpB1AZRRdwZzkrtCrTYJ3C+
         O/wInQItw8nqnWwEmKACOZV3SoPvCkSPM0Yl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289727; x=1725894527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRnYn3FHUp24+krwoIfPD0gry4Z+7Bez6xvbuMaTqvc=;
        b=NhK3+vKtzkGo8w79+rrTGXX4V1j7B3t/zIVEv/V3LKRXT9GGoYSwnib18aBFAZq7lS
         sUluF6AZKnZXdIOUPpkkdfKsTwYCAp2PHbKj2rPfbEqc4XsLybthu3BbZGi9cwVVg5Yq
         3kgBjdLX8374bXd7c8fHVTb4a0pqLg2sTtrEk7Gna2I4hDD8jhDh3UOJw+49ixQQ2f4g
         9yVn0qjkzYxlHGubESCEnup0X5uAPIdU2cKFtt9hegi9eNUtkDv5BniAnUFXQ3Gdh/Dp
         WRgKrceBJBVkJT9k9MZnMsWauOkDg5V/0zM+ALAveBr7KQqEq1tK4SbzTs3wUotVb6Ib
         guVQ==
X-Gm-Message-State: AOJu0YylNQNtCK2wGrhb/iU1Cdntc4CXMY8y9ECV352hZPAytOTODhUw
	TYU6Lz9Ccp+LpPXrBytTUgZV+5MZi9WCmC3l5GE4jIexwpR+nVADPgDUflJl85M=
X-Google-Smtp-Source: AGHT+IF0rZvq3xSwha+R+OdbkD3ME4vqmMJZtUyDWFDJ5VcMpZihrNChwYXHWDo8W2wOFAZPibnbGw==
X-Received: by 2002:a05:6402:84f:b0:5bf:1bd:adb3 with SMTP id 4fb4d7f45d1cf-5c21ed3f46bmr11995291a12.14.1725289727342;
        Mon, 02 Sep 2024 08:08:47 -0700 (PDT)
Date: Mon, 2 Sep 2024 16:08:45 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/3] libxl: Update the documentation of
 libxl_xen_console_read_line()
Message-ID: <svv6pe35pdajgkhd2zzp2hziawqu74by7pniduvyg4v6kdfi44@q6ll7qdqyf7m>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
 <D3VPWEPD5J31.W6GFDD7ESFYW@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D3VPWEPD5J31.W6GFDD7ESFYW@cloud.com>

On Mon, Sep 02, 2024 at 11:14:11AM GMT, Alejandro Vallejo wrote:
> On Fri Aug 23, 2024 at 6:05 PM BST, Javi Merino wrote:
> > Despite its name, libxl_xen_console_read_line() does not read a line,
> > it fills the buffer with as many characters as fit.  Update the
> > documentation to reflect the real behaviour of the function.  Rename
> > line_r to avoid confusion since it is a pointer to an array of
> > characters.
> >
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  tools/libs/light/libxl_console.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> > index f42f6a51ee6f..652897e4ef6d 100644
> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -789,17 +789,19 @@ libxl_xen_console_reader *
> >      return cr;
> >  }
> >  
> > -/* return values:                                          *line_r
> > - *   1          success, whole line obtained from buffer    non-0
> > - *   0          no more lines available right now           0
> > - *   negative   error code ERROR_*                          0
> > - * On success *line_r is updated to point to a nul-terminated
> > +/* Copy part of the console ring into a buffer
> > + *
> > + * Return values:
> > + *   1: Success, the buffer obtained from the console ring an
> 
> Seems like this line in the comment is incomplete?

Indeed.  Fixed to say:

    1: Success, *buff points to the string

Thanks,
Javi

