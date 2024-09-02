Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A9968BD8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788239.1197713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9j5-0003lA-5L; Mon, 02 Sep 2024 16:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788239.1197713; Mon, 02 Sep 2024 16:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9j5-0003jF-1B; Mon, 02 Sep 2024 16:16:23 +0000
Received: by outflank-mailman (input) for mailman id 788239;
 Mon, 02 Sep 2024 16:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sl9j3-0003iz-Gf
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:16:21 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af8fcffc-6946-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:16:18 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so2314215a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:16:18 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c262cc7cc8sm784892a12.91.2024.09.02.09.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:16:17 -0700 (PDT)
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
X-Inumbo-ID: af8fcffc-6946-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725293778; x=1725898578; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9LoIUdibI+ph0ToBVQAoVZSK5QN0ibhziIOtAjZQwxU=;
        b=N6ZGLWuvW3VhdCIqv3SFo1Bi8AEHt+EIwMAXQFBOVwX3p6x2WZ5d2LWLBXMGON2Bn0
         7fQuLYme14l8mpg+m9OlO6cR5uF8QEcSk6bOFHdX4KaJnX+rfBLEmC6xSLYSpeeKGAhn
         No2sGO0erq9mfE8kiL5/VDPtorp+p8v2StO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293778; x=1725898578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LoIUdibI+ph0ToBVQAoVZSK5QN0ibhziIOtAjZQwxU=;
        b=IEbT3BPG9j4Ymh/LzQk531sMceIFxjlhrzZOvcVNB5e8ASbbuCcoYwYr2dlF4GL7h8
         xo7MLCQllECyFFvrW0Ap4jHPk95Yt7SAmeDgrB82UuT67NmPfap1T3TCx6mrRVTMNGbN
         2HDcT3nTKVvqI+wfiwKLeHMJ51ovIL+jCiWKTwkcCparyDWC+KNnOk5w9U4vhnnvj2rT
         WVHJvDm7Y/Dw3jUMMNMPdZnL9BenOEuCxcxhe0AqWDMnT6gGojItxCRLEEPx/lS2ezb1
         tqcUuqFtZdrvHjOGbuB3YykO1K84vxvEPRRL67xwF5WwSEN5hWs3SFvMa2Jtvs7WKcbb
         sOag==
X-Gm-Message-State: AOJu0Yyr5Q1LjQEDKnXP4w4MOW6MJ/R6RyeZ3wNrYa9kTWxM9U5hr54r
	mRv4JwTi/x0eUTW7V577GMu6EHUQN4J3K/GUz1E7y+F4LHiRNNF6RPH1ceBlzshzW7kd3Q6/LaO
	+idU=
X-Google-Smtp-Source: AGHT+IEg7tUnhVoMtlOaGBYfgcXinPq9GGrf7+TTRA4BOdLMIlhhq0jkX2tnJSXv6Mrn3xw7dZmmYg==
X-Received: by 2002:a05:6402:2743:b0:5be:ecd9:c73e with SMTP id 4fb4d7f45d1cf-5c22f7b0eedmr12035236a12.2.1725293777979;
        Mon, 02 Sep 2024 09:16:17 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:16:16 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/3] libxl: Update the documentation of
 libxl_xen_console_read_line()
Message-ID: <pjf7bmpqb6ewj6ls742mtswy6uguarcmcwxqibtge6iuwls7tk@5xps3eevg5cx>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
 <d27fa081-50fa-423f-a292-ee8083b47c51@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d27fa081-50fa-423f-a292-ee8083b47c51@citrix.com>

On Fri, Aug 23, 2024 at 06:31:50PM GMT, Andrew Cooper wrote:
> On 23/08/2024 6:05 pm, Javi Merino wrote:
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
> > + *   0: No more lines available right now
> > + *   -ERROR_* on error
> > + *
> > + * On success, *line_r is updated to point to a nul-terminated
> 
> *buff.

Indeed.

> Also this really wants to say somewhere "despite the function name,
> there can be multiple lines in the returned buffer" or something to this
> effect.

Sure.  I had only written it in the commit message.  I have added it
to the documentation now.

> >   * string which is valid until the next call on the same console
> > - * reader.  The libxl caller may overwrite parts of the string
> > - * if it wishes. */
> > + * reader. */
> 
> While I don't want to derail this patch further, what happens if there
> happens to be an embedded \0 in Xen's console?  The hypercall is works
> by a count of chars, and AFACIT, in this function we're assuming that
> there's no \0 earlier in the string.

True.  This would have truncated the buffer before, and it still does
now.  libxl_xen_console_read_line() is the only one that knows the
size of the buffer and can't pass this information down to the caller,
so one way to fix this would be to scan the buffer for '\0' and
replace it with another character.

I'd rather do this in another patch by itself once this series is merged.


Cheers,
Javi

