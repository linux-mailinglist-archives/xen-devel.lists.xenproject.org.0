Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3C73336D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 16:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550264.859247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAALX-0001WP-92; Fri, 16 Jun 2023 14:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550264.859247; Fri, 16 Jun 2023 14:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAALX-0001Tn-5u; Fri, 16 Jun 2023 14:22:39 +0000
Received: by outflank-mailman (input) for mailman id 550264;
 Fri, 16 Jun 2023 14:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEDJ=CE=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qAALV-0001Tf-Br
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 14:22:37 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d8ccd8a-0c51-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 16:22:36 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so1017499e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jun 2023 07:22:36 -0700 (PDT)
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
X-Inumbo-ID: 3d8ccd8a-0c51-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686925355; x=1689517355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=USKmhBP01O0nkmgv6gp1nWZdy8qcHw3nrgJUzZjV8Rc=;
        b=IJFS3CCK0evYgf9TkAO82YuinPq71mYyJwAPei+txshxFf/VFphrj3qF/yEO68rVzR
         dnOiNEloKLbpE5C0p3jf9kyiMdv0MuAj81VKAmdghrp3ZMI50AZ0xXC5tvdDJZnLpbXZ
         t6c11mN25pxQa5g6IvXSnMT9k8J/4s/8DgXa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686925355; x=1689517355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USKmhBP01O0nkmgv6gp1nWZdy8qcHw3nrgJUzZjV8Rc=;
        b=Bv3cUMq31ZHanbBbeeepRfjG1bblBwLkNMscQZQHwxTos9Vo1+nZK2ivvjegW2jhPq
         XM04uiid/Caq/B+rRgpCb671bVS9T0M2bkbNVT4kFrMoUUe7Lak5Q9RYxphCoba9AquY
         ewbrpBaV2ZPqJHlhy0eSXweg6HZ2Bds4yUbCCFzuiEWAYZIXGs2nH85cDJoixFhgOPu8
         V4ZHBZp9SGBcIaBgLUdUcOEtPoEgDsExpxIE1u/5qE6OByTYAbWwFUz1lCFP9bfTEJ94
         WlK3LapTiS39TJjKKJXBw1WvM2rxGn7CA52IbqIA4a6+g16DIrAv5ttMfMC1WeaHdcSN
         PdIg==
X-Gm-Message-State: AC+VfDxiLzTFo80EVK38BSljK2fN/9EwZYWOOTjWew0c45FED8qaIj11
	y0yu+4teO00XXr+FB2+ttwpLA9bw8g2KnJT+PAei/w==
X-Google-Smtp-Source: ACHHUZ50N7ORlj6u1QajENTjRJs8iksofxh2Hq9tBjyMCsmnoKQcAHFKCOp8J2RVtL9i7cvccXYEAaf1vkQNb2uWb44=
X-Received: by 2002:a19:d61a:0:b0:4f7:6630:8373 with SMTP id
 n26-20020a19d61a000000b004f766308373mr1412169lfg.19.1686925355429; Fri, 16
 Jun 2023 07:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530095859.60a3e4ea.olaf@aepfle.de> <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de> <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
 <20230616134708.6b3c6964.olaf@aepfle.de> <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
In-Reply-To: <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 16 Jun 2023 15:22:24 +0100
Message-ID: <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
Subject: Re: xentrace buffer size, maxcpus and online cpus
To: Jan Beulich <jbeulich@suse.com>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000092d1db05fe3fea7e"

--00000000000092d1db05fe3fea7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 12:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 16.06.2023 13:47, Olaf Hering wrote:
> > Wed, 31 May 2023 11:05:52 +0200 Jan Beulich <jbeulich@suse.com>:
> >
> >> As said before, num_online_cpus() will under-report for the purpose
> >> here, as CPUs may have been brought offline, and may be brought online
> >> again later (independent of the use of "maxcpus=3D").
> >
> > It turned out, commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39 broke
> > the expected behavior. But to me it is unclear what bug was fixed by
> > this commit.
>
> Hmm, I find title and description quite clear there.
>
[SNIP]

> > To me it looks like commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39
> > could be reverted.
>
> I don't think so. I'll add George to Cc as well, as he's the maintainer
> of this stuff.
>

I agree; the clear implication is that with smt=3D0, you might have
num_online_cpus() return 4, but cpuids that look like {1, 3, 5, 7}; so you
need the trace buffer array to be of size 8.


> > If I read alloc_trace_bufs correctly, it already operates on online
> > cpus. And __trace_var will do nothing if called on a cpu which was
> > not online, t_bufs will likely be NULL.
>
> Yielding an incomplete overall trace, at best.
>

Historically we've avoided the thorny problems of synchronization wrt the
trace buffers by saying that you get one chance to set them up the way you
want, and that's what you get until you reboot the host.  If someone felt
like sorting all that out I wouldn't oppose it.  But in the meantime, the
current "policy" is that it's OK if *tracing* breaks when changing the
number of cpus, as long as it doesn't cause the *hypervisor* to break.

The proposed change to calculate_tbuf_size() wouldn't work as-is, because
it looks like at the moment alloc_trace_bufs() leaves a gap in the mfn list
for "offline" CPUs.  But it looks like maybe the "interface" would allow
those "holes" to be compacted?

 -George

--00000000000092d1db05fe3fea7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 16, 2023 at 12:52=E2=80=
=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 16.06.2023 13:47, Olaf Hering wrote:<br>
&gt; Wed, 31 May 2023 11:05:52 +0200 Jan Beulich &lt;<a href=3D"mailto:jbeu=
lich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt;:<br>
&gt; <br>
&gt;&gt; As said before, num_online_cpus() will under-report for the purpos=
e<br>
&gt;&gt; here, as CPUs may have been brought offline, and may be brought on=
line<br>
&gt;&gt; again later (independent of the use of &quot;maxcpus=3D&quot;).<br=
>
&gt; <br>
&gt; It turned out, commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39 broke<b=
r>
&gt; the expected behavior. But to me it is unclear what bug was fixed by<b=
r>
&gt; this commit.<br>
<br>
Hmm, I find title and description quite clear there.<br></blockquote><div>[=
SNIP]=C2=A0<br></div><div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>&gt; To me it looks like commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39<b=
r>&gt; could be reverted.<br><br>I don&#39;t think so. I&#39;ll add George =
to Cc as well, as he&#39;s the maintainer<br>of this stuff.<br></blockquote=
><div><br></div></div><div>I agree; the clear implication is that with smt=
=3D0, you might have num_online_cpus() return 4, but cpuids that look like =
{1, 3, 5, 7}; so you need the trace buffer array to be of size=C2=A08.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; If I read alloc_trace_bufs correctly, it already operates on online<br=
>
&gt; cpus. And __trace_var will do nothing if called on a cpu which was<br>
&gt; not online, t_bufs will likely be NULL.<br>
<br>
Yielding an incomplete overall trace, at best.<br></blockquote><div><br></d=
iv><div>Historically we&#39;ve avoided the thorny problems of synchronizati=
on=C2=A0wrt the trace buffers by saying that you get one chance to set them=
 up the way you want, and that&#39;s what you get until you reboot the host=
.=C2=A0 If someone felt like sorting all that out I wouldn&#39;t oppose it.=
=C2=A0 But in the meantime, the current &quot;policy&quot; is that it&#39;s=
 OK if *tracing* breaks when changing the number of cpus, as long as it doe=
sn&#39;t cause the *hypervisor* to break.</div><div><br></div><div>The prop=
osed change to calculate_tbuf_size() wouldn&#39;t work as-is, because it lo=
oks like at the moment alloc_trace_bufs() leaves a gap in the mfn list for =
&quot;offline&quot; CPUs.=C2=A0 But it looks like maybe the &quot;interface=
&quot; would allow those &quot;holes&quot; to be compacted?</div><div><br><=
/div><div>=C2=A0-George</div></div></div>

--00000000000092d1db05fe3fea7e--

