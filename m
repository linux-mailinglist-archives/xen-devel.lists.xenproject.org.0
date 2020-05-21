Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F81DCDC6
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 15:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbkzs-0007uT-HJ; Thu, 21 May 2020 13:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UciX=7D=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jbkzq-0007uO-Ct
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 13:12:26 +0000
X-Inumbo-ID: b69f7e4e-9b64-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b69f7e4e-9b64-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 13:12:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w15so4389819lfe.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P3mZBUQpW9ml01kQtWZRohcsMSbianysuRNW4ZgL8rw=;
 b=r1J0vSCtjvnOSsObiMR4yhXTzW8YAdp/9N/rg20vyD/2Qt2TK06AvhDdR6C/coiqbg
 pCWO3syb3xWCOWhPQrlTbpQd4+b+216IwCRWkPOLFjCSbItOL5OpsYGj+MPLvCjqnWyh
 W2zODg42CAaDUHWlEViBpxsRiGi13ZjMCpKrjx1BqkEP3RPrbxpBDBgu9tbfAxCp/mUz
 nxwdWiVuXe9DnFJNbsdMqTdM3q9ygNoY89WujkvXPwKunDY1ypN+fdGAIu5NgClMAuZi
 C9o/WHyORkhWAw+hAz60/xgkO1eJIaG9VdRT2oulFA3UPv3KaRO00FML2bBH5Y4ZWNbK
 XB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P3mZBUQpW9ml01kQtWZRohcsMSbianysuRNW4ZgL8rw=;
 b=tSp21UDWZKfu+cBDexH1FJAj1Q8CNA73vhXDd25rvjkWcq64UYkieUwZVyGqXA0k5m
 RmEoefgSXT3HuP1KjiLIPvRb9sMUN2SbwKeB8ATYFEHVfVTNFvsFSERVigEBR1pUN1Md
 sDXTAf2kBKsYkPr23q8qvQ1FCUZrNzJyoq8I5Iaanb/GZ5eDFsHeaHNJgHi6wBTekln1
 WiROhXVQEicDitinMgz7ocmyQOovM9XodbZIiC6EEquWCXmvewsDRODSDVi/wKqzromW
 cNhqUeiAxUaah7xKjxLmB3dx6O7rGPxS21bETk+8in8vEmhCuN0WmwsdDPCCDNOIRKQ6
 wORw==
X-Gm-Message-State: AOAM533ByXq4V8ahKtJH9gA8r/g1N9FzL75qI2/ZjfrhqyFiO81poZaP
 jpI3wlQWBWLYkq1EDdFjJsZtv9H3lLgutRO2Otk=
X-Google-Smtp-Source: ABdhPJw6wLCaDryHW0BocoBND2AJYJTh3uguwGqAXBhrdsfM0koGcl0bqAShD3GDp3zVKKotmjC++qQKw4iRRYbRr8s=
X-Received: by 2002:a19:f813:: with SMTP id a19mr4955560lff.212.1590066744538; 
 Thu, 21 May 2020 06:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-13-jandryuk@gmail.com>
 <edb28eba-622e-e9e6-5d22-0d5e86b503bd@citrix.com>
In-Reply-To: <edb28eba-622e-e9e6-5d22-0d5e86b503bd@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 21 May 2020 09:12:13 -0400
Message-ID: <CAKf6xpuGDHrWFrj_f+bZU9xVK878YKPR=u86MpzDw-0xbFvZVg@mail.gmail.com>
Subject: Re: [PATCH v7 12/19] tools: add simple vchan-socket-proxy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 7:09 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 19/05/2020 02:54, Jason Andryuk wrote:
> > +static int connect_socket(const char *path_or_fd) {
> > +    int fd;
> > +    char *endptr;
> > +    struct sockaddr_un addr;
> > +
> > +    fd = strtoll(path_or_fd, &endptr, 0);
> > +    if (*endptr == '\0') {
> > +        set_nonblocking(fd, 1);
> > +        return fd;
> > +    }
> > +
> > +    fd = socket(AF_UNIX, SOCK_STREAM, 0);
> > +    if (fd == -1)
> > +        return -1;
> > +
> > +    addr.sun_family = AF_UNIX;
> > +    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
>
> Coverity has identified issues, some perhaps more concerning than others.

Thanks.  I'll take a look.

-Jason

