Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B13ACEE4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144786.266448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGOQ-0000ry-V4; Fri, 18 Jun 2021 15:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144786.266448; Fri, 18 Jun 2021 15:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGOQ-0000pz-Rq; Fri, 18 Jun 2021 15:26:50 +0000
Received: by outflank-mailman (input) for mailman id 144786;
 Fri, 18 Jun 2021 15:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyHv=LM=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1luGOP-0000pp-72
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:26:49 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b6b1a6a-e4da-426a-8cef-243edaadeef9;
 Fri, 18 Jun 2021 15:26:48 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id j62so11819974qke.10
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 08:26:48 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id l127sm4119008qkc.64.2021.06.18.08.26.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:26:48 -0700 (PDT)
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
X-Inumbo-ID: 3b6b1a6a-e4da-426a-8cef-243edaadeef9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SxFqflzAcIyPl7uL6HXezQivITkX16R0fc13SxV+fMI=;
        b=a7dZwfbWrrSQakyNMhkJ+rQkRxgwdUitHI99Knyjqq+uHumJO6CgiPkZX8bBhQO+7D
         NaFV7S481DnlcSxhDAmCGXk3ssMFRHU5DzYU9BOZhJimfse18cwXmCbI50vz4DCYBk9j
         RVGgTdstStVHSQqzCnH+p//wVl+NtjrVSewDyNkgDaRzu6eHAq/jj+4HTuMgWfKZk+p2
         LuUBiRJv8I6svpdXF1h42gemXT2/NIUx+aZ57b7Saibrfo0F52qy0c8+7Nk84V70BXq2
         NR42JtffbUbilad5dI1EJt61ZKfaep2TBPSd3yY2E7E7OabOisBub+JDBmdNflW3LaDX
         gmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SxFqflzAcIyPl7uL6HXezQivITkX16R0fc13SxV+fMI=;
        b=nLhESRx2Qb35oj0lkT7wqzkcELcOeRHewojOnifjQ6Ujiu15NHcHcC2vg7WkhU18Va
         +G8B+MObE9+gmV+4G+ZduAYkgjIwgEXf+mkFvUvrp0AiH3oChLzpmm+jxefPG0SYp9P2
         YQ2eeTGum/icC1jcpGTnYGTcPbsX6ax6FpAoUG30kocJmzzARqF7IYbUC8lDMK4/JnHH
         /5xOEmVb1SKM0wrYeWSmSxAe/9fPvt/CT+djW2qbVlGARLr5Grj/5swUAq0M7OePb2tC
         LaGKsFyxvzPkeMTWKt4NGYaoh7vaXxZgQMgpsm/MUdVEd3cLJGsBUBqlQtMRMFpUTDEf
         R0ww==
X-Gm-Message-State: AOAM5303h9EwxIA1qUVM6ntkcb6fB/bhxETpSaRN+wIJowaNwVly+M3F
	iy6looPfky0xhAGDwZWP5UM=
X-Google-Smtp-Source: ABdhPJxITNsBPPE63e+W4wGhX1iAeeHLhOJDxz94jlSlhKk+55Hfn36hjW4yWKbIzRdpZ+Zh5FAm4A==
X-Received: by 2002:a37:7cb:: with SMTP id 194mr1513234qkh.455.1624030008316;
        Fri, 18 Jun 2021 08:26:48 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:26:45 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Message-ID: <YMy7NVTpaIlT+KWJ@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
 <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
 <E74C0DF9-3EA4-4B79-8CE4-02F00EC9875C@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E74C0DF9-3EA4-4B79-8CE4-02F00EC9875C@citrix.com>

On Fri, Jun 18, 2021 at 01:21:40PM +0000, George Dunlap wrote:
> 
> 
> > On Jun 18, 2021, at 2:17 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
> > 
> > 
> > 
> >> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >> 
> >> Add some logging methods to Context to provide easy use of the
> >> Contenxt's xentoollog_logger. These are not exported, but the LogLevel
> >> type is so that a later commit can allow the Context's log level to be
> >> configurable.
> >> 
> >> Becuase cgo does not support calling C functions with variable
> >> arguments, e.g. xtl_log, add an xtl_log_wrap function to the cgo preamble
> >> that accepts an already formatted string, and handle the formatting in
> >> Go.
> >> 
> >> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > 
> > Looks good.  One comment:
> 
> Er, sorry, turns out I had rather more than one comment.  Here’s one more:
> 
> Is there any particular reason not to export the Ctx.Log[X]() functions?
> 
No reason other than I tend to only export functions when I know they
need to be exported. My motivation for adding these at the time was to
help debug development. Would you prefer to export them then?

Thanks,
NR

