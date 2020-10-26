Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502E298A98
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 11:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12208.31971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWzyC-00073e-BK; Mon, 26 Oct 2020 10:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12208.31971; Mon, 26 Oct 2020 10:43:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWzyC-00073H-7I; Mon, 26 Oct 2020 10:43:20 +0000
Received: by outflank-mailman (input) for mailman id 12208;
 Mon, 26 Oct 2020 10:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0AxF=EB=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1kWzy9-00073C-Uz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 10:43:18 +0000
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 812f991b-620c-43dc-bbc8-4f0b037e5333;
 Mon, 26 Oct 2020 10:43:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t20so8693990edr.11
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 03:43:16 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0AxF=EB=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
	id 1kWzy9-00073C-Uz
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 10:43:18 +0000
X-Inumbo-ID: 812f991b-620c-43dc-bbc8-4f0b037e5333
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 812f991b-620c-43dc-bbc8-4f0b037e5333;
	Mon, 26 Oct 2020 10:43:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t20so8693990edr.11
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GcXznKRACrGiaPsHMISkyH4VxsBYAdOZpQikx+ceUek=;
        b=Pwy0BP9osbbaeoprrRW3gjZE/Z2I3hXZ5nRJ3hCzCyOhQnwj7KfaFUHKOjHgs0HcMW
         xb+w6NNW8QDlAjOlVlT1AOclqe8dy4BvmH3jvxMln9PNSsbqi32pewQjACAtK3nsKxFO
         W1YMPxoo58Q5UXcCwAXvyiJCKcQC+vezk73eYQvzCvx2AvIKDNEoqpkB9muZeKWG1GkW
         bQmo38K5m11UwTV21xUFWZi3k76PbrJ67EeyPGDWPXlDO3Z7UHcmYD3dA4oe+joAfolF
         haupZsDw5Yg17X+qesV/yKhXIzipWnxiT2lMbFGspRLDxR+5y31/+dIIJUA5wwRIKazN
         oOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GcXznKRACrGiaPsHMISkyH4VxsBYAdOZpQikx+ceUek=;
        b=OQR3qsDsn5Ty76LsYof0HEElmSgJ0fqq0TnlNck1Sr/p3+7b0aIuCDZL9TVpJltMOl
         Rx8uBJRo0IfTnKVLrba1nQ+OkfV9i804lg/5xjyQMfXAmyogWc9UORFkFeBpoCt1zkKl
         1oimNE+MxqqPfY8S/nAn8FXaufiy88RS9RfJHvMPCU+W6R3aGQakJ+0UTCwK7Mt3ci2e
         LMgis1EUwHfhiaXQ57OkKKKo6WapdMzWbfyiBP9URquslx2E3QI2qi7xvAduZ0cKGP27
         mCcbHPI8ZJJCyU5AzQ7TOYIyKifDuoUDFhapUDdE6b+MrA6MB3Ite5NlJ2vbHBWzjsob
         tznA==
X-Gm-Message-State: AOAM530I1W/bkfNOkABYoZgCoNWc2lKeCl+wbhH0LcnABn1xBIOwniZR
	VxmKuYMbntrErgshLfMUDTrJoxou8YG6COze6UY=
X-Google-Smtp-Source: ABdhPJxKx1FFgSO/qBC+JY1UHW/GhXxKoGrdoN/L4YFYVS6ASeReHimJLQay6YoAZIAWgkXTF8vFFb4ZE2+ujQhXrrg=
X-Received: by 2002:a50:8125:: with SMTP id 34mr15683908edc.39.1603708996142;
 Mon, 26 Oct 2020 03:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <158524252335.30595.3422322089286433323.stgit@Palanthas>
In-Reply-To: <158524252335.30595.3422322089286433323.stgit@Palanthas>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 26 Oct 2020 10:43:04 +0000
Message-ID: <CAFLBxZaPNsxoazbB=e1sN7A=gzvr2rpAj7qdA73TtcRpPqUkLw@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH] xen: credit2: document that min_rqd is valid
 and ok to use
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbkdyb8Of?= <jgross@suse.com>, 
	Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000009ce5705b290995f"

--00000000000009ce5705b290995f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 5:09 PM Dario Faggioli <dfaggioli@suse.com> wrote:
>
> Code is a bit involved, and it is not easy to tell that min_rqd, inside
> csched2_res_pick() is actually pointing to a runqueue, when it is
> dereferenced.
>
> Add a comment and an ASSERT() for that.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> ---
>  xen/common/sched/credit2.c |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index c7241944a8..9da51e624b 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -2387,6 +2387,13 @@ csched2_res_pick(const struct scheduler *ops,
const struct sched_unit *unit)
>          goto out_up;
>      }
>
> +    /*
> +     * If we're here, min_rqd must be valid. In fact, either we picked a
> +     * runqueue in the "list_for_each" (as min_avgload is initialized to
> +     * MAX_LOAD) or we just did that (in the "else" branch) above.
> +     */


Sorry it's taken so long to get back to you on this.

The problem with this is that there are actually *three* alternate clauses
above:

1. (has_soft && min_s_rqd)
2. min_rqd
3. <none of the above>

It's obvious that if we hit #2 or #3, that min_rqd will be set.  But it's
not immediately obvious why the condition in #1 guarantees that min_rqd
will be set.

Is it because if we get to the point in the above loop where min_s_rqd is
set, then min_rqd will always be set if it hasn't been set already?  Or to
put it a different way -- the only way for min_rqd *not* to be set is if it
always bailed before min_s_rqd was set?

 -George

--00000000000009ce5705b290995f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br><br>On Thu, Mar 26, 2020 at 5:09 PM Dario Faggiol=
i &lt;<a href=3D"mailto:dfaggioli@suse.com">dfaggioli@suse.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; Code is a bit involved, and it is not easy to tell that =
min_rqd, inside<br>&gt; csched2_res_pick() is actually pointing to a runque=
ue, when it is<br>&gt; dereferenced.<br>&gt;<br>&gt; Add a comment and an A=
SSERT() for that.<br>&gt;<br>&gt; Suggested-by: Jan Beulich &lt;<a href=3D"=
mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt;<br>&gt; Signed-off-by: =
Dario Faggioli &lt;<a href=3D"mailto:dfaggioli@suse.com">dfaggioli@suse.com=
</a>&gt;<br>&gt; ---<br>&gt; Cc: J=C3=BCrgen Gro=C3=9F &lt;<a href=3D"mailt=
o:jgross@suse.com">jgross@suse.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0xen/co=
mmon/sched/credit2.c | =C2=A0 =C2=A07 +++++++<br>&gt; =C2=A01 file changed,=
 7 insertions(+)<br>&gt;<br>&gt; diff --git a/xen/common/sched/credit2.c b/=
xen/common/sched/credit2.c<br>&gt; index c7241944a8..9da51e624b 100644<br>&=
gt; --- a/xen/common/sched/credit2.c<br>&gt; +++ b/xen/common/sched/credit2=
.c<br>&gt; @@ -2387,6 +2387,13 @@ csched2_res_pick(const struct scheduler *=
ops, const struct sched_unit *unit)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto out_up;<br>&gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt;<br>&gt; + =C2=A0 =C2=
=A0/*<br>&gt; + =C2=A0 =C2=A0 * If we&#39;re here, min_rqd must be valid. I=
n fact, either we picked a<br>&gt; + =C2=A0 =C2=A0 * runqueue in the &quot;=
list_for_each&quot; (as min_avgload is initialized to<br>&gt; + =C2=A0 =C2=
=A0 * MAX_LOAD) or we just did that (in the &quot;else&quot; branch) above.=
<br>&gt; + =C2=A0 =C2=A0 */<br><br><br><div>Sorry it&#39;s taken so long to=
 get back to you on this.</div><div><br></div><div>The problem with this is=
 that there are actually *three* alternate clauses above:</div><div><br></d=
iv><div>1. (has_soft &amp;&amp; min_s_rqd)</div><div>2. min_rqd</div><div>3=
. &lt;none of the above&gt;</div><div><br></div><div>It&#39;s obvious that =
if we hit #2 or #3, that min_rqd will be set.=C2=A0 But it&#39;s not immedi=
ately obvious why the condition in #1 guarantees that min_rqd will be set.<=
/div><div><br></div><div>Is it because if we get to the point in the above =
loop where min_s_rqd is set, then min_rqd will always be set if it hasn&#39=
;t been set already?=C2=A0 Or to put it a different way -- the only way for=
 min_rqd *not* to be set is if it always bailed before min_s_rqd was set?<b=
r></div><br></div><div>=C2=A0-George</div></div>

--00000000000009ce5705b290995f--

