Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383DF673994
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481024.745691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUfn-0006lo-Jk; Thu, 19 Jan 2023 13:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481024.745691; Thu, 19 Jan 2023 13:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUfn-0006jC-Gq; Thu, 19 Jan 2023 13:09:43 +0000
Received: by outflank-mailman (input) for mailman id 481024;
 Thu, 19 Jan 2023 13:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iv86=5Q=gmail.com=tushar.goel.dav@srs-se1.protection.inumbo.net>)
 id 1pIUfm-0006j6-8a
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:09:42 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 877d4c7d-97fa-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 14:09:39 +0100 (CET)
Received: by mail-yb1-xb2a.google.com with SMTP id 66so2402063yba.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 05:09:40 -0800 (PST)
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
X-Inumbo-ID: 877d4c7d-97fa-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNsUyEPWjP8sROmTom8UUlPpz85zG7Z3FuXAFMvgRjg=;
        b=VKnmmxPSEUbLhPGh35iPRdcjWl6CWOtDr1QaxxFRJIJ82wzjlIohlA1ovfYGccNVpc
         DuvhY/4hCHfbV7qM0w37Rl0ywp5gaIO0yM1njmYWeP/l2Cj4cJDRdVoyMsrC43SH2CGv
         BEatzmcI3ZxLi2QzIk88D2oZJbFFaAZ822RlG+tuZ/tQw12XGWBqBZDVypZ02p1QisTb
         YOFXpPlgRAwFyfpNN2FdP7S0yyf2E9A/Cthcto+ooOUlpFKcfTq7cc6JblWEBUhPQPbn
         FH9JuZjs2kL2ENoz7OTMoWy5SKrlYmKnyPuSWh2TSTHt3MaAAJtq0+DMnTPWTvNOz00U
         AX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNsUyEPWjP8sROmTom8UUlPpz85zG7Z3FuXAFMvgRjg=;
        b=EpO60S4GI0WTwf0ROmhSAL4qNjKKps8wMtZc1loNiFSYW9lfdjqF2F1cnuIEBWDSsf
         jvsWhVW6/LjKSrL/fuKcaSG3jqnz4PMn8Dd9Bm8DaordrmG4K9ltbVwpe9Wze6OmTEqY
         f1TEGC/HC1bgXxQcwf1f2E/p19MluUTIZrR6ixEZek+iPvovPB4ZAWhK3zjHORfJG65w
         0GE6lxUk+sauKKcknYMZ6ns1vd9etZBao6wv/3U9MhLYA3JuriNIVEycHdF7J7vmLnRa
         3OXTijmSm1bWbHvZezKbRwB3zND0tRQqVxwWM2tV7F7W7VscTN+7quTR5bl1tAiwej+i
         XUaQ==
X-Gm-Message-State: AFqh2kqNZ8mkkPM79dy9YH1HThieVndbICcOv4tNlr2iy5nYGgBVNRgi
	2hJhsGsZlMdsFXthkPzmKRKr7D8fjp7kh1YiTDI=
X-Google-Smtp-Source: AMrXdXs9mzeA6v9Ts5rzhVohQJhozjRQz9nvgeKqqfEwyTm80VGtAtSkEEotYkO+bJUKOhK72Q6qFnGgi9swZohYXPg=
X-Received: by 2002:a25:ed01:0:b0:7ec:b507:1255 with SMTP id
 k1-20020a25ed01000000b007ecb5071255mr1548339ybh.111.1674133778908; Thu, 19
 Jan 2023 05:09:38 -0800 (PST)
MIME-Version: 1.0
References: <CAFD1rPdT5Tod+qdit50EWBN6WyRuK2ybb2G2HmOAayAV7uyBuA@mail.gmail.com>
 <7ddac120-29c5-d4fa-2bc7-9da6b1cf2dd9@citrix.com>
In-Reply-To: <7ddac120-29c5-d4fa-2bc7-9da6b1cf2dd9@citrix.com>
From: Tushar Goel <tushar.goel.dav@gmail.com>
Date: Thu, 19 Jan 2023 18:39:28 +0530
Message-ID: <CAFD1rPfv1jCNkcPP1KBLDr1e+_aa7+aCphVTjZG-xAnbkcnNGQ@mail.gmail.com>
Subject: Re: Usage of Xen Security Data in VulnerableCode
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Xen Security <security@xen.org>, 
	Philippe Ombredanne <pombredanne@nexb.com>, jmhoran@nexb.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

> Maybe we want to make it CC-BY-4 to require people to reference back to
> the canonical upstream ?
Thanks for your response, can we have a more declarative statement on
the license from your end
and also can you please provide your acknowledgement over the usage of
Xen security data in vulnerablecode.

Regards,

On Tue, Jan 10, 2023 at 7:15 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 10/01/2023 1:33 pm, Tushar Goel wrote:
> > Hey,
> >
> > We would like to integrate the xen security data[1][2] data
> > in vulnerablecode[3] which is a FOSS db of FOSS vulnerability data.
> > We were not able to know under which license this security data comes.
> > We would be grateful to have your acknowledgement over
> > usage of the xen security data in vulnerablecode and
> > have some kind of licensing declaration from your side.
> >
> > [1] - https://xenbits.xen.org/xsa/xsa.json
> > [2] - https://github.com/nexB/vulnerablecode/pull/1044
> > [3] - https://github.com/nexB/vulnerablecode
>
> Hmm, good question...
>
> In practice, it is public domain, not least because we publish it to
> Mitre and various public mailing lists, but I'm not aware of having
> explicitly tried to choose a license.
>
> Maybe we want to make it CC-BY-4 to require people to reference back to
> the canonical upstream ?
>
> ~Andrew

