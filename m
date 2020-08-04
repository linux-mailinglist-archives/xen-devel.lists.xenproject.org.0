Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44923BD26
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2ymV-0001qh-P6; Tue, 04 Aug 2020 15:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e3JV=BO=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k2ymU-0001qc-0l
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:23:10 +0000
X-Inumbo-ID: 7cd5a37a-9832-4763-ad9f-575c619145a4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cd5a37a-9832-4763-ad9f-575c619145a4;
 Tue, 04 Aug 2020 15:23:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w25so8588413ljo.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30N5ObjJG57l4nH4ZLUzGYro785BrKf9hzlM1FImspk=;
 b=aLUIht1Y27iWOfNH0+ZuslP5EITbZil/6eb3hhIxKlJ3sNXYh2NZ3LJ6ILF1j3SstB
 cJexR2bmSb0a1t1EHriMMZ63h7+WpJs40bXG7nRmfUxzHdzdqqov8SgeTLDor+vXU5CL
 fUd2enFo4sHa0mi6BeCqx+BDrL7aQYErkUKfNEG2BaCCKiPfWWfgXH3Vgz/40AgmTpZV
 HNdLIk3fneVtTIffLlQ8ww6Wuhx7fsXcUZlGnSzg6HOb+kPQCPG4OMhVIQ88a4G6aiaN
 oKWrJMLiyNvRvtidy1dyaBJ1m5TwzfEt4aagkBF6hZ3KEp1eEPbAr4YH0BIWc4Vrjg42
 V76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30N5ObjJG57l4nH4ZLUzGYro785BrKf9hzlM1FImspk=;
 b=M8/UgXkCsLQClCzG7O3F3SKKWdOYDwWnnhMb70qzWVOpXTSb2l4Ut2RXBVDW8QlAVg
 t/vtWwUCbIKPCicYNd8I3poEx1vzKXygSu808GQGrsrM3J+WGJgoaIGM8HQao/ieQpR8
 WebndTGjDxx48srj/jqGrpbZASoxMH4QzfD0lR9nEELlWYBE/f3wDh8kz1voSJro9//A
 d6Wr2r1OlNwXFCxSENab8kZDb+AAbm9GDtz34cF9kj0qhyL8X0laEMHLApiDEsKlde6t
 3wIhrjPDPoodN4YocYIGEAwDoFlkrsTCTgHcasjnocxfBJ+l5V79WVaJdCMWvr2gFS8L
 aj5A==
X-Gm-Message-State: AOAM533Xvh2n4VQQugPoyHoj6F3CzMRpp7hzeDqykdGonseTxp21tKpy
 o0jqMgad+txZF0fJctiUIMSNTyrmAtkNv8abXEY=
X-Google-Smtp-Source: ABdhPJwNIGpZXpDiGsloe0h9d1QKrJuFcdXD8xikVuvEtSJbEeo3a0UrSU3HUBHP5x6yRPr63BdBBsPyquKyg9HoBWE=
X-Received: by 2002:a05:651c:2044:: with SMTP id
 t4mr4725732ljo.420.1596554587907; 
 Tue, 04 Aug 2020 08:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
In-Reply-To: <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 4 Aug 2020 11:22:56 -0400
Message-ID: <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: Wei Liu <wl@xen.org>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
>
> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> > While this doesn't address the real problem I've run into (attempting to
> > update r/o source files), not recursing into tools/golang/xenlight/ is
> > enough to fix the build for me for the moment. I don't currently see why
> > 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> > it necessary to invoke this build step unconditionally.
> >
>
> Perhaps an oversight?

This is intentional, and I think the commit message in 60db5da62ac0
("libxl: Generate golang bindings in libxl Makefile") explains the
reasoning well. But, to summarize, CONFIG_GOLANG is only used to
control the bindings actually being compiled (i.e. with `go build`).
However, we always want the code generation script
(tools/golang/xenlight/gengotypes.py) to run if e.g.
tools/libxl/libxl_types.idl is modified.

I hope this helps.

-NR

