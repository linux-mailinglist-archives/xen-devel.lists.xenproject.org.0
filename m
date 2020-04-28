Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9991BC6E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 19:38:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTUAj-00027c-BK; Tue, 28 Apr 2020 17:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FM82=6M=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jTUAh-00027U-6J
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 17:37:27 +0000
X-Inumbo-ID: ec830c9c-8976-11ea-9887-bc764e2007e4
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec830c9c-8976-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 17:37:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id l11so17626457lfc.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rWGQpfmnmwquRYh9uVw0uaulvFXrkfI1cdoNKjCi8X8=;
 b=H/Q4D4lsqj/iLKcvJf6EYGYH3vVgdCnlUmI1FtjBRVfnDgH6n0kbB8yMBy8GYxYYw5
 MGCDEbhyzzs5kcr8aMZvpYFTBVYC2XmbVTHjDE9aToQavlc4+DItyysjhCmDrH+tx4QI
 BsyaC2xgfWqSwc8t1M+77Pt8tu9BqG1IjEaPgb53c94LIeVZG6ZAHn/WIzJuD3MlfY+s
 nkTtUaD1PgBIx+Xm6fbfSEuV2+AChildm5juiRro11Z2WOzT3QC8qiYT0mXkfqSUT5oM
 CgjDhgbmQB9I9HaS2wLO7pS8rc8/BRbSAnekw12m82qRttYkIJZ7MgGkTfvG7CZFiDQ1
 SWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rWGQpfmnmwquRYh9uVw0uaulvFXrkfI1cdoNKjCi8X8=;
 b=jlZE5HnIl98pF5WslE3tkpPhnRLX0c7y6g5OvKRi+xAO7KBG2tqPdTVLuX9lJkMMu9
 AIxQcP223401+A2wWimO2A1FEXV3CR4kY7WwkXw2OjBRY2+i7kCKGqQAswFpF0bKR56A
 VZT/f44TXCLCjccc2szamywMwifj4JSCIsUBBNQ6672q9rrmbQ/2WoQhryTQnXyT8twm
 ZTbn4CL7686gwM2b6g/8XIyJjkjf9oKbKTIKGvlMZA/MhKr9qJXAJZszuh0Uv5TAwUCh
 oBqBIZaDOxDE7G57X/jJiiFkfW/AKAN2pfOZ6CjVrg06070YKGL5G8IauYpK5FW6Wbok
 wuAg==
X-Gm-Message-State: AGi0PuYHYVDirbEjAqxwBNcX2ciM5QRxxZp/3wZnkSMYpta76+OZeD/9
 94xqLO/XAPRMV99iQIh/FaztjtV1iDpIZtFwKBI=
X-Google-Smtp-Source: APiQypJa4QmBjZkGkyoxCWf61IrkuYYmhRnxUxUw/kU8pBeT4Sa9ntAqVwnptI9+yRsfyZyN9hlclii/EGwVRpZG340=
X-Received: by 2002:a05:6512:406:: with SMTP id
 u6mr20105978lfk.150.1588095444980; 
 Tue, 28 Apr 2020 10:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
 <24225.31669.536258.56822@mariner.uk.xensource.com>
 <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
 <C10E07AB-FDE8-4588-95E7-6109F0FDB5E2@citrix.com>
 <CAEBZRSfUysyGhnsXDEAJiVDBeX-Kb836V-uT6Qrtomte1LKgsA@mail.gmail.com>
 <E0DEA134-CB69-4992-B949-7233BFF3A1E4@citrix.com>
In-Reply-To: <E0DEA134-CB69-4992-B949-7233BFF3A1E4@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 28 Apr 2020 13:37:12 -0400
Message-ID: <CAEBZRSfbjsSeh7ukKA8-PeuGRap986UzY1C8thB=ECryOUGFnA@mail.gmail.com>
Subject: Re: Golang Xen packages and the golang packaging system
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> BTW the separate repo isn=E2=80=99t off the table.  But there were some t=
hings other Ian pointed out:

After trying (and failing) to get a go module with a remote import
path like `golang.xenproject.org/xenlight` defined in xen.git, I would
like to circle back to the separate repo.

In theory, modules are not supposed to be tightly coupled with vcs,
but in practice they are. It seems like you cannot define a module
with a remote import path without pointing to the repo *root*. I tried
many ways, but every attempt resulted in `go get enr0n.net/xenlight`
downloading the root of xen.git as the "module", while the actual
module in tools/golang/xenlight was excluded since it was seen as a
nested go module. If you want to get around these issues, I think you
would need to define your own module proxy. Or, we would need to just
give up on the "vanity" URL and use
`xenbits.xen.org/git-http/xen.git/tools/golang/xenlight` as the import
path.

For reference, I did get a test module `enr0n.net/xenlight` that
points to github.com/enr0n/xenlight working. That part is trivial if
you are able to point to the repo root.

Overall, between fighting with Go modules, tagging versions, and
making sure code is re-generated on IDL changes, it seems to me that
there are more negatives with putting the module in xen.git than there
are with putting the module in its own repo.

> 1. The GPL requires that you provide the =E2=80=9Cpreferred form for modi=
fication=E2=80=9D to all the code.  I=E2=80=99m not sure this has been adju=
dicated in court, but there=E2=80=99s a strong argument that *generated* co=
de doesn=E2=80=99t match that criteria: that to satisfy the GPL you=E2=80=
=99d need to include libxl_types.idl, idl.py, gengotypes.py, and a Makefile=
 suitable for tying them all together.  (Not that the generation needs to b=
e run with `go build`, but that ideally the infrastructure would be there s=
o that it *could* be run.)

Is there anything involved in solving this issue besides making sure
those files are copied to the repo in addition to the generated go
files? Or is there some concern in doing so?

> 2. Ian was concerned with how someone using the bindings would submit a p=
atch upstream.  Suppose someone cloned our =E2=80=9Cbindings=E2=80=9D repo,=
 made some changes so that it worked for them, then wanted to submit the pa=
tch upstream.  How would they do that?

I think we could mostly solve this with a good README explaining what
to do. It's not uncommon to see (a) generated Go code with // DO NOT
EDIT at the top, and (b) repos (mirrors) on github that do not accept
PRs. Or am I oversimplifying?

Thanks,
-NR

