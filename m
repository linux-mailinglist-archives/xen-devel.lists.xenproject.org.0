Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00B690DC9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 17:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492701.762427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9NJ-0005Qc-6z; Thu, 09 Feb 2023 16:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492701.762427; Thu, 09 Feb 2023 16:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9NJ-0005OC-34; Thu, 09 Feb 2023 16:02:17 +0000
Received: by outflank-mailman (input) for mailman id 492701;
 Thu, 09 Feb 2023 16:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ9NH-0005Nq-Gm
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:02:15 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e8f100b-a893-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 17:02:14 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id x40so3733463lfu.12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 08:02:14 -0800 (PST)
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
X-Inumbo-ID: 1e8f100b-a893-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IooKS56JceovXpfIA9G2QdG2hZ0P9K7lg7umfAPb5L4=;
        b=bhdI8zS8ZyDA26V7r45EqJMt0m8aERJ4U4R20i4iohU1fPcDXd5HJkHx7RaMJM73dq
         l7twYaummB9h75xKyfbEVUxQlx3AY4qwLZwGtrjEo1kUPmEyrrQidUfe7P+IWRl9Uc1S
         AOHQrySbGq1ZAd4TfAIj3CV69ZvYgf8lTLf9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IooKS56JceovXpfIA9G2QdG2hZ0P9K7lg7umfAPb5L4=;
        b=ktoqAguyxEj4+GlSeoDn7geTksz6hC5Jtlb4DpdCCPxMLgbibDX/lruWVcqTasyGwc
         NLrGGdHTm0pzprmT7QwuOnya8qxMCtBPoqlJGXGrE/73dnbPt2R78hdVQBPBLgsr4C9+
         vmkrTJi8Of/ZJ3jZryLW8qbq0Jx5pgM9r9b3tZCvUHlkn6desICGwTz/y35dGnCVGtsL
         wXHL7+BomXXgqylwQTWpPeTGlE+WkbWBFNJKEPk+mdR8ycr+5YGd6YAy7hY+6PTL+xLK
         elVBlYHEqnRopk54+BA4nCImx0j9PAlBvR7iGf9lTHJu7uYG5egCm3bH/NfuXzBlVUfI
         Fy2g==
X-Gm-Message-State: AO0yUKVdyhMOwiyhJrRXURmvCbmxvpF4R49rcl6BK7C0sqOuLlEdXdE3
	h/hDhH2KYcjT2YaKDwRZWixZsQbl+ODImUnAkrhkSg==
X-Google-Smtp-Source: AK7set8KshKSNp7AMaPgSBh6iafFedONWlcQz/JvRp4WV3V1SBVmZbC8al1NXb6ZdqQ2T+4BQaM/ZwHunrukaTNOnEM=
X-Received: by 2002:ac2:418c:0:b0:4da:fddc:da02 with SMTP id
 z12-20020ac2418c000000b004dafddcda02mr1889842lfh.116.1675958533955; Thu, 09
 Feb 2023 08:02:13 -0800 (PST)
MIME-Version: 1.0
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
 <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com> <b899223d-6e13-af64-2359-76d0c30ec46e@suse.com>
In-Reply-To: <b899223d-6e13-af64-2359-76d0c30ec46e@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 16:02:03 +0000
Message-ID: <CA+zSX=Z+y5CkSR-xBpgeLx_gouuGbbNd3c2z12OKeSODsKimDA@mail.gmail.com>
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build system
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000133eab05f44681aa"

--000000000000133eab05f44681aa
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 1:43 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 02.02.2023 16:51, Andrew Cooper wrote:
> > On 12/01/2023 4:52 pm, Jan Beulich wrote:
>
> Anyway, I have a prototype for the two CET controls mostly ready now, so
> I guess we'll continue the discussion there once I've submitted that one.
>

One thing that it occured to me will be important: `make randconfig` must
continue to work somehow.  I'm not sure how Anthony's patch to deal with
`checkpolicy` deals with that.

 -George

--000000000000133eab05f44681aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 1:43 PM Jan Be=
ulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 02.02.20=
23 16:51, Andrew Cooper wrote:<br>
&gt; On 12/01/2023 4:52 pm, Jan Beulich wrote:<br><br>
Anyway, I have a prototype for the two CET controls mostly ready now, so<br=
>
I guess we&#39;ll continue the discussion there once I&#39;ve submitted tha=
t one.<br></blockquote><div><br></div><div>One thing that it occured to me =
will be important: `make randconfig` must continue to work somehow.=C2=A0 I=
&#39;m not sure how Anthony&#39;s patch to deal with `checkpolicy` deals wi=
th that.</div><div><br></div><div>=C2=A0-George=C2=A0</div></div></div>

--000000000000133eab05f44681aa--

