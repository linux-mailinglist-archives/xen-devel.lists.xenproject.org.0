Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E903186107D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 12:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684809.1064934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTqW-0001rH-1q; Fri, 23 Feb 2024 11:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684809.1064934; Fri, 23 Feb 2024 11:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTqV-0001o8-Ux; Fri, 23 Feb 2024 11:36:03 +0000
Received: by outflank-mailman (input) for mailman id 684809;
 Fri, 23 Feb 2024 11:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BhOy=KA=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rdTqT-0001o0-Ml
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 11:36:01 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b4c1a3-d23f-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 12:36:00 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso37876266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 03:36:00 -0800 (PST)
Received: from smtpclient.apple ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 vk7-20020a170907cbc700b00a3f29591dcdsm2679381ejc.95.2024.02.23.03.35.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Feb 2024 03:35:59 -0800 (PST)
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
X-Inumbo-ID: b7b4c1a3-d23f-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708688160; x=1709292960; darn=lists.xenproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JyQ6xbFYJAJFa0prrCGrknfBke4TIhg5l9pGph2tG5s=;
        b=Pnx4UxO2XpTXPwA6i2zNhnyP2fwEvQTe6RwrRQ0HJShPqWL0rFQWabDJIC+78gjgzI
         yLV062Pfl6ovPTT2sDwHRFVlfWocpzPt+decQ91ti8ovEiOi20cfbG+3UXsprpDF8VfP
         RA5zZ3eAX7hzGiE6xS6qwzSJ/Z3xBbRm/HCLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708688160; x=1709292960;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyQ6xbFYJAJFa0prrCGrknfBke4TIhg5l9pGph2tG5s=;
        b=AiE2puRd4jQA6WttTqfguJkK5r+6hxddTydEtqQCNyOzMkDugz7hKDL8aVwujMZb7P
         ia2atehpexgBpwnrAY40yvH83F3i8qGQh3nmm2IHur2bzGPx+edJuBTMxMxRJnwNyt14
         aj4ufOJ9DVuoveNY0g9qFtcIqj1/ahxIXEDJuHDk+5EzrhmbBwV75knKrzqB8O3wjAz9
         I9XkiMUeUjIg4VXPim2jO9nAS8389/4vUAndcq7GEoNocXSsfU5VlLU46wNxs9YdOf7D
         n/iKKJzgeSGKN597lGRd5qkVTeI1YgUiSF/1DDsyJSDn+ED4By4e51Jf9Uq9EJupzCVG
         V8sA==
X-Gm-Message-State: AOJu0YysdgYbdZRH9qtN2H+R2O1L1aeRlafc+/e9lATErQAwdK69rVQC
	LJ+rlh7HLlG33obboKLiQU2svL7P/n/cVjRtFhvV+4GFERbhr3Gf2TalOe5FaK4=
X-Google-Smtp-Source: AGHT+IESfYKAQD1tPOcq9XL6vnw7Y2EnMg7oFDUe40QIQR5Lr+u5T9Ai//+Uel3YngrKBtLdVvC8Qw==
X-Received: by 2002:a17:906:f24e:b0:a3e:fce7:9393 with SMTP id gy14-20020a170906f24e00b00a3efce79393mr1063956ejb.10.1708688159760;
        Fri, 23 Feb 2024 03:35:59 -0800 (PST)
From: Edwin Torok <edwin.torok@cloud.com>
Message-Id: <9301CE74-1D0D-4264-9987-D52AA21F525B@cloud.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1105AA12-93D6-4804-BE20-A928B5937E54"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v1 2/2] oxenstored: make Quota.t pure
Date: Fri, 23 Feb 2024 11:35:48 +0000
In-Reply-To: <400C98F1-A3C6-4E14-90DE-91E314C48697@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
To: Christian Lindig <christian.lindig@cloud.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
 <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
 <5879EE8F-6FAB-4026-BEDB-1AEEA7BF23DB@cloud.com>
 <400C98F1-A3C6-4E14-90DE-91E314C48697@cloud.com>
X-Mailer: Apple Mail (2.3774.400.31)


--Apple-Mail=_1105AA12-93D6-4804-BE20-A928B5937E54
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 Jan 2024, at 16:27, Edwin Torok <edwin.torok@cloud.com> wrote:
>=20
>=20
>=20
>> On 31 Jan 2024, at 11:17, Christian Lindig =
<christian.lindig@cloud.com> wrote:
>>=20
>>=20
>>=20
>>> On 31 Jan 2024, at 10:52, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>>>=20
>>> Now that we no longer have a hashtable inside we can make Quota.t =
pure,
>>> and push the mutable update to its callers.
>>> Store.t already had a mutable Quota.t field.
>>>=20
>>> No functional change.
>>=20
>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>>=20
>> This is shifting copying working to GC work, at least potentially. I =
would agree that this is a good trade-off and the code looks correct to =
me. But I think we should see more testing and benchmarking before =
merging this unless we are fine merging speculative improvements.
>>=20
>> =E2=80=94 C
>>=20
>>=20
>=20
>=20
> I=E2=80=99ve written this [1] microbenchmark which creates ~300_000 =
entries in xenstore, assigns quota to 1000 domains and then measure how =
long it takes to list xenstore
> (It doesn=E2=80=99t matter whether these domains exist or not).
> It shows a measurable improvement with this patch, once I=E2=80=99ve =
run a more realistic test on the original machine with 1000 real VMs =
I=E2=80=99ll post those results too:

The machine that can run this test is offline now due to a lab move, but =
I managed to get this data before it went away, and I think this patch =
series is ready to be committed.

Flamegraph without my changes, where Hashtbl.copy takes up a significant =
amount of oxenstored time: =
https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/ori=
ginal.svg?x=3D153.0&y=3D1269
Flamegraph with this patch series, where Hashtbl.copy does not show up =
at all: =
https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/oxe=
nstored_no_hashtbl_copy.svg?x=3D294.3&y=3D1301
(There are of course still hashtbl in the flame graph, due to the =
well-known inefficient poll_select implementation, and we see hashtbl =
iteration as a parent caller, which is fine)

IMHO this means the patch series is a worthwhile improvement: it removes =
a codepath that was previously a hotspot completely from oxenstored.

The timings on the test also show improvements with this patch:

Booting 575 VMs:
* without this patch series: 1099s
* with this patch series: 604s

Booting 626 VMs:
* without this patch series: 4027s
* with this patch series: 2115s

Booting 627 VMs:
* without this patch series: 4038s
* with this patch series: 4120s

This shows that *with* the patch series the system scales better until =
it hits a breaking point around 627 VMs where everything is ~equally =
slow

Not everything is ideal, there is also a slowdown around the 789 booted =
VM mark:
* without this patch series: 168s
* with this patch series: 394s
I wouldn=E2=80=99t worry about this result, because by this point some =
VMs have already crashed, and I=E2=80=99d consider the test to have =
failed by this point. What results you get at this point depends on how =
much CPU oxenstored gets compared to the qemus ioreq handler that is =
spinning handling the crash on the serial port.
To actually reach 1000 VMs it will require more fixes outsides of =
oxenstored (e.g. wrt to using correct groups with tapdisk, qemu, etc., =
or making qemu better cope with flooding on serial port from the guest), =
and probably some fixes to the poll_select in oxenstored that I may =
address in a future patch series.



Best regards,
=E2=80=94Edwin

>=20
> On an Intel Xeon Gold 6354 @ 3.0 Ghz:
> * without my patch: 12.756 +- 0.152 seconds time elapsed  ( +-  1.19% =
)
> * with my patch: 5.6051 +- 0.0467 seconds time elapsed  ( +-  0.83% )
>=20
> [1]
> # cat >create.py <<EOF
> #!/usr/bin/env python3
> from xen.lowlevel.xs import xs
>=20
> xenstore =3D xs()
>=20
> for i in range(1,1000):
>   txn =3D xenstore.transaction_start()
>   for j in range(1,10):
>     for k in range(1,30):
>         path=3Df"/quotatest/{i}/{j}/{k}/x"
>         xenstore.write(txn, path, "val")
>         # assign quota to domid i
>         xenstore.set_permissions(txn, path, [{"dom": i}])
>   xenstore.transaction_end(txn)
> EOF
> # python3 create.py
> # perf stat -r 10 sh -c 'xenstore-ls $(for i in $(seq 1 100); do echo =
"/quotatest/$i"; done) >/dev/null=E2=80=99
>=20
> Best regards,
> =E2=80=94Edwin


--Apple-Mail=_1105AA12-93D6-4804-BE20-A928B5937E54
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 31 Jan 2024, at 16:27, Edwin Torok =
&lt;edwin.torok@cloud.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta http-equiv=3D"content-type"=
 content=3D"text/html; charset=3Dutf-8"><div style=3D"overflow-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 31 Jan 2024, at 11:17, Christian Lindig =
&lt;christian.lindig@cloud.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div><br><br><blockquote =
type=3D"cite">On 31 Jan 2024, at 10:52, Edwin T=C3=B6r=C3=B6k =
&lt;edwin.torok@cloud.com&gt; wrote:<br><br>Now that we no longer have a =
hashtable inside we can make Quota.t pure,<br>and push the mutable =
update to its callers.<br>Store.t already had a mutable Quota.t =
field.<br><br>No functional change.<br></blockquote><br>Acked-by: =
Christian Lindig &lt;christian.lindig@cloud.com&gt;<br><br>This is =
shifting copying working to GC work, at least potentially. I would agree =
that this is a good trade-off and the code looks correct to me. But I =
think we should see more testing and benchmarking before merging this =
unless we are fine merging speculative improvements.<br><br>=E2=80=94 =
C<br><br><br></div></div></blockquote></div><br><div><br></div><div>I=E2=80=
=99ve written this [1] microbenchmark which creates ~300_000 entries in =
xenstore, assigns quota to 1000 domains and then measure how long it =
takes to list xenstore</div><div>(It doesn=E2=80=99t matter whether =
these domains exist or not).</div><div>It shows a measurable improvement =
with this patch, once I=E2=80=99ve run a more realistic test on the =
original machine with 1000 real VMs I=E2=80=99ll post those results =
too:</div></div></div></blockquote><div><br></div><div>The machine that =
can run this test is offline now due to a lab move, but I managed to get =
this data before it went away, and I think this patch series is ready to =
be committed.</div><div><br></div><div>Flamegraph without my changes, =
where Hashtbl.copy takes up a significant amount of oxenstored =
time:&nbsp;<a =
href=3D"https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/=
docs/original.svg?x=3D153.0&amp;y=3D1269">https://cdn.jsdelivr.net/gh/edwi=
ntorok/xen@oxenstored-coverletter/docs/original.svg?x=3D153.0&amp;y=3D1269=
</a></div><div>Flamegraph with this patch series, where Hashtbl.copy =
does not show up at all:&nbsp;<a =
href=3D"https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/=
docs/oxenstored_no_hashtbl_copy.svg?x=3D294.3&amp;y=3D1301">https://cdn.js=
delivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/oxenstored_no_has=
htbl_copy.svg?x=3D294.3&amp;y=3D1301</a></div><div>(There are of course =
still hashtbl in the flame graph, due to the well-known inefficient =
poll_select implementation, and we see hashtbl iteration as a parent =
caller, which is fine)</div><div><br></div><div>IMHO this means the =
patch series is a worthwhile improvement: it removes a codepath that was =
previously a hotspot completely from =
oxenstored.</div><div><br></div><div>The timings on the test also show =
improvements with this patch:</div><div><br></div><div>Booting 575 =
VMs:</div><div>* without this patch series: 1099s</div><div>* with this =
patch series: 604s</div><div><br></div><div>Booting 626 VMs:</div><div>* =
without this patch series:&nbsp;<span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);">4027s</span></div><div>* with this patch =
series: 2115s</div><div><br></div><div>Booting 627 VMs:</div><div>* =
without this patch series: 4038s</div><div>* with this patch series: =
4120s</div><div><br></div><div>This shows that *with* the patch series =
the system scales better until it hits a breaking point around 627 VMs =
where everything is ~equally slow</div><div><br></div><div>Not =
everything is ideal, there is also a slowdown around the 789 booted VM =
mark:</div><div>* without this patch series: 168s</div><div>* with this =
patch series: 394s</div><div>I wouldn=E2=80=99t worry about this result, =
because by this point some VMs have already crashed, and I=E2=80=99d =
consider the test to have failed by this point. What results you get at =
this point depends on how much CPU oxenstored gets compared to the qemus =
ioreq handler that is spinning handling the crash on the serial =
port.</div><div>To actually reach 1000 VMs it will require more fixes =
outsides of oxenstored (e.g. wrt to using correct groups with tapdisk, =
qemu, etc., or making qemu better cope with flooding on serial port from =
the guest), and probably some fixes to the poll_select in oxenstored =
that I may address in a future patch =
series.</div><div><br></div><div><br></div><div><br></div><div>Best =
regards,</div><div>=E2=80=94Edwin</div><br><blockquote =
type=3D"cite"><div><div style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><div><br></div><div>On an Intel Xeon Gold 6354 @ 3.0 =
Ghz:</div><div>* without my patch:&nbsp;12.756 +- 0.152 seconds time =
elapsed &nbsp;( +- &nbsp;1.19% )</div><div>* with my patch:&nbsp;5.6051 =
+- 0.0467 seconds time elapsed &nbsp;( +- &nbsp;0.83% =
)</div><div><br></div><div>[1]</div><div># cat &gt;create.py =
&lt;&lt;EOF</div><div><div>#!/usr/bin/env python3</div><div>from =
xen.lowlevel.xs import xs</div><div><br></div><div>xenstore =3D =
xs()</div><div><br></div><div>for i in range(1,1000):</div><div>&nbsp; =
txn =3D xenstore.transaction_start()</div><div>&nbsp; for j in =
range(1,10):</div><div>&nbsp; &nbsp; for k in =
range(1,30):</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
path=3Df"/quotatest/{i}/{j}/{k}/x"</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
xenstore.write(txn, path, "val")</div><div>&nbsp; &nbsp; &nbsp; &nbsp; # =
assign quota to domid i</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
xenstore.set_permissions(txn, path, [{"dom": i}])</div><div>&nbsp; =
xenstore.transaction_end(txn)</div></div><div>EOF</div><div># python3 =
create.py</div><div>#&nbsp;<span style=3D"caret-color: rgb(0, 0, =
0);">perf stat -r 10 sh -c 'xenstore-ls $(for i in $(seq 1 100); do echo =
"/quotatest/$i"; done) &gt;/dev/null</span><font><span =
style=3D"caret-color: rgb(0, 0, 0);">=E2=80=99</span></font></div><div><sp=
an style=3D"caret-color: rgb(0, 0, 0);"><br></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0);">Best =
regards,</span></div><div><font><span style=3D"caret-color: rgb(0, 0, =
0);">=E2=80=94Edwin</span></font></div></div></div></blockquote></div><br>=
</body></html>=

--Apple-Mail=_1105AA12-93D6-4804-BE20-A928B5937E54--

