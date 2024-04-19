Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF898AAA8E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 10:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708861.1108020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjhT-0006QP-Fa; Fri, 19 Apr 2024 08:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708861.1108020; Fri, 19 Apr 2024 08:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjhT-0006O2-Cv; Fri, 19 Apr 2024 08:34:27 +0000
Received: by outflank-mailman (input) for mailman id 708861;
 Fri, 19 Apr 2024 08:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCgy=LY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rxjhR-0006Nw-HW
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 08:34:25 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff31d6e-fe27-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 10:34:23 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d858501412so23818251fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 01:34:23 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b00418f308091csm3859349wmo.48.2024.04.19.01.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 01:34:22 -0700 (PDT)
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
X-Inumbo-ID: 9ff31d6e-fe27-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713515663; x=1714120463; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF1bA4giQLsR8FYVFo7LP00zuv09qtWiOc+EpYY3zrs=;
        b=eXzgdsNWsdmcksxpibjWWt8Ug3YUwYCaY+DkMY2rJEcwSpHthgXkcBgKEq1des9SFv
         NJxGk+RojTqsCYV2W6FBkGQ1OlZXM1v8lJzj27nhhl4oCQ9sCXjJJj+o/McXFX+rXYmv
         U/6PPhuYp2YTpviY7CWJuW84dF9G2LtdoHxjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713515663; x=1714120463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF1bA4giQLsR8FYVFo7LP00zuv09qtWiOc+EpYY3zrs=;
        b=gB5cdXadAmlpUp+fIVgxoxW19SBAzCC7nVcsg+UaexQJtS94/JrYXfzCeC8uo/C5FO
         l8xEl3O411s0wQGTaiIh3DsiXunUiSdNtAQCBh3QCegqmb0cDAzbOCw0XdzBf8tnRNwL
         fY9qtxbo9KDwyLEwIworgXxpJ33KDB4LAekswiPqWdH/wotXk2/tCAl1uD+y+5gT6An1
         QL96250z7HMiSdZbDZLHf+drXijWqwJmT3NGsRU6ri8wKFYhh3NY0xeNq/KH2OSdi4ls
         Sfg1i9NpD8XHnl8Hdwmao8K3s8HJvDcZDyxmiURbMX8DOnTFZlRN+SfXQQsIW29rEw6h
         2dyQ==
X-Gm-Message-State: AOJu0YyPUd1ECdi0NHhbnC2QY6ZjOG+FmzTNF1aQl/6wVuFqJaSqfOfE
	g7TSSMNgNxtMRgCZGhcqlWpdo6QV+Hr62nL3/J003ao/cdxeI0PLnU6TCQDsuVohwMJOHzpnLmk
	A
X-Google-Smtp-Source: AGHT+IEI4kX6K0q4n9fMHbvbIOUAudr9qYo1MvV7Ec89N8NaOQDtPrh8E9I/PW5yEWhEqEWqroQPpg==
X-Received: by 2002:a2e:7c0a:0:b0:2db:8625:3f09 with SMTP id x10-20020a2e7c0a000000b002db86253f09mr829403ljc.3.1713515662910;
        Fri, 19 Apr 2024 01:34:22 -0700 (PDT)
Date: Fri, 19 Apr 2024 09:34:21 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <a8789951-4693-4ffe-9942-cd18f214e029@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>
 <f178e1fb-0b6f-4312-a483-b85f413db025@perard>
 <0f89a920-c834-4a51-9b53-8e94ba7e3664@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f89a920-c834-4a51-9b53-8e94ba7e3664@perard>

On Mon, Apr 08, 2024 at 10:29:08AM +0100, Anthony PERARD wrote:
> On Fri, Apr 05, 2024 at 04:54:30PM +0100, Anthony PERARD wrote:
> > On Thu, Mar 28, 2024 at 05:54:04PM +0000, Anthony PERARD wrote:
> > > On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:
> > 
> > I've now pushed
> > "production-config: Set Bookworm's debian-installer version"
> > 
> > and these two:
> > 
> > > >   Switch to Debian Bookworm as default suite
> > > >   make-hosts-flight: default to bookworm
> > 
> > osstest should start to use Debian Bookworm soon.
> 
> osstest failed it's own push gate, I didn't notice that the Arm* builds
> was still using an old kernel (from our linux-arm-xen branch) instead of
> 6.1. So I've rewind this push and pushed an other fix instead:
> https://lore.kernel.org/xen-devel/20240408092542.36711-1-anthony.perard@citrix.com/

I've pushed the switch to Debian Bookworm again, and this time it when
through.

osstest have started to use Bookworm for testing.

Cheers,

-- 
Anthony PERARD

