Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA5690BA7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492522.762097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7rV-0001mc-Tk; Thu, 09 Feb 2023 14:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492522.762097; Thu, 09 Feb 2023 14:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7rV-0001kV-R3; Thu, 09 Feb 2023 14:25:21 +0000
Received: by outflank-mailman (input) for mailman id 492522;
 Thu, 09 Feb 2023 14:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ7rU-0001kE-Ac
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:25:20 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 946a7ec9-a885-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 15:25:19 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id x40so3323344lfu.12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 06:25:19 -0800 (PST)
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
X-Inumbo-ID: 946a7ec9-a885-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nmbUHYaFb20s3IDUop8Y1ksEqgfrq5NYyk493kgF8DQ=;
        b=Xkjbjlig6xdp3EekhpNd5CFjKTIA93kdWZPou0FhGAApJx1GH6ocCv11UTKPCbPlqp
         PrRq6P6hzUwgYRAh4dsxF3FOFqcfQK7PcHlkxz6EUP8W+8Pa6KgN4nW7EY5uZKYy3f73
         OJ+n23jzbeY5u9rB0n+r76tvb6JSvsrheBzt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmbUHYaFb20s3IDUop8Y1ksEqgfrq5NYyk493kgF8DQ=;
        b=A2ONJ/zMyPlPqeXHp/gEuY7WCuVqN/PXHDmXH1eXeJt4djQJ46Xpb2aow3LVitFCBt
         Z/BzOQq2D97ad0EV1SNh5SubzWkbIYx3txNKcj0VhF+HU4++bUpCgdwGjSDPwXSqb8Qd
         MOZdkTIAVSEDM4k9orz/6e4o6faFxUdMEgIw2qZG6UaXL60m6xu372+0/XlxkmWZufqk
         fVOfk34H/nXD4A0zSYt1iIRleO2fBzP8okMMfMrZ8tUbDvDNZ/ob+cqRl+XgZaVohGUE
         scMY+atoBULkVVRR3wCeI16EX0MK93gdhRAnTrBeoLizLvJ2Wu0Kti9IIS05xmFkoi+w
         Rw8Q==
X-Gm-Message-State: AO0yUKXqBZu0FTOFsbIqYHLAPapbeICl1XFsD3P6G05BqAnLD3IKen9l
	Heq6XkeQMQJ7ugzXLw/K/RuJQ55b8a+FatuYK5rciQ==
X-Google-Smtp-Source: AK7set/kOpnSj3uD891pkNboMFNiBg8SwpeTAAbthaiYJIzLjG0zIfhgDYpk/xx1523tPk82gd2KGcQBApKPw1vBjDI=
X-Received: by 2002:ac2:4830:0:b0:4d3:f1f7:9632 with SMTP id
 16-20020ac24830000000b004d3f1f79632mr2256643lft.51.1675952718918; Thu, 09 Feb
 2023 06:25:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com> <8c476ad1d36919f31c3d37edc813182e8f1489e8.1675889602.git.demi@invisiblethingslab.com>
In-Reply-To: <8c476ad1d36919f31c3d37edc813182e8f1489e8.1675889602.git.demi@invisiblethingslab.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 14:25:07 +0000
Message-ID: <CA+zSX=Z+Vg0xBb9Ww-iSSUQGp+oyoGFuY_cKMfQs_9epsRFUkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Miscellaneous and documentation: Only use
 TLS-protected transports
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, 
	David Scott <dave@recoil.org>, Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="00000000000078cade05f4452658"

--00000000000078cade05f4452658
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>
> This patch changes miscellaneous links that are not used by any
> automated tool.  Some of these links are dead anyway.
>

As I said in response to patch 4, I appreciate the goal and the effort
here.  But I'd rather not replace a working link with a broken link, or a
broken link with another broken link.

If we want to make this change, I think we're going to have to be creative
with how the link replacement is done, as well as in how it's demonstrated
to reviewers that the new URLs are valid.

One option, for instance, could be writing a small script that would check
the link validity first and only make the change if the link was valid; and
then including that script in the commit message.  The reviewer could then
convince themselves that the script was correct, and give an Ack or R-b on
that basis.  There are probably other ideas as well.

Any thoughts?

 -George

--00000000000078cade05f4452658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 8:59 PM Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">demi@invisi=
blethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Obtaining code over an insecure transport is a terrible ide=
a for<br>
blatently obvious reasons.=C2=A0 Even for non-executable data, insecure<br>
transports are considered deprecated.<br>
<br>
This patch changes miscellaneous links that are not used by any<br>
automated tool.=C2=A0 Some of these links are dead anyway.<br></blockquote>=
<div><br></div><div>As I said in response to patch 4, I appreciate the goal=
 and the effort here.=C2=A0 But I&#39;d rather not replace a working link w=
ith a broken link, or a broken link with another broken link.</div><div><br=
></div><div>If we want to make this change, I think we&#39;re going to have=
 to be creative with how the link replacement is done, as well as in how it=
&#39;s demonstrated to reviewers that the new URLs are valid.</div><div><br=
></div><div>One option, for instance, could be writing a small script that =
would check the link validity first and only make the change if the link wa=
s valid; and then including that script in the commit message.=C2=A0 The re=
viewer could then convince themselves that the script was correct, and give=
 an Ack or R-b on that basis.=C2=A0 There are probably other ideas as well.=
=C2=A0=C2=A0<br></div><div><br></div><div>Any thoughts?</div><div><br></div=
><div>=C2=A0-George</div></div></div>

--00000000000078cade05f4452658--

