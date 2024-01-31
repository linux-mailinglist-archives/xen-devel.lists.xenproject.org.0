Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09DC844449
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 17:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674104.1048812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDRP-0002bE-OA; Wed, 31 Jan 2024 16:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674104.1048812; Wed, 31 Jan 2024 16:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDRP-0002Z1-L4; Wed, 31 Jan 2024 16:27:59 +0000
Received: by outflank-mailman (input) for mailman id 674104;
 Wed, 31 Jan 2024 16:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rVDRO-0002Yv-B4
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 16:27:58 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ebf7b3-c055-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 17:27:57 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso730840f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 08:27:56 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d4e8d000000b0033b08b9cd9dsm965539wru.79.2024.01.31.08.27.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jan 2024 08:27:56 -0800 (PST)
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
X-Inumbo-ID: b0ebf7b3-c055-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706718476; x=1707323276; darn=lists.xenproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFU6KAw+hV3dbKXZYJpAAw+sm6jvFtfNbcbn3FNVYvE=;
        b=XAesKMKPrxc/pR8FccQlT2lS6DT++l1IYwGMOzb6W5L9aKCf6lRgdMXsJTVa8NwRsE
         Uz94xsbF7jUOMz5el7/VGAUHuT51NJe4QuTxHQqrGE02EKncjpbGV5lY4OGYvxQTij4C
         OB8YIuwTwFecOglcKoZzO4Fam3Zt+NnBOlWtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706718476; x=1707323276;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFU6KAw+hV3dbKXZYJpAAw+sm6jvFtfNbcbn3FNVYvE=;
        b=WA8IKZ2+imsv3bjoAXNcRHyU/X7uIlP8ki74GLFcvImNbvgiHN01QpRW06U1A2Xihs
         bilj3am6g9NCX3fUHx40EmbL5dI+8ZJTGupaIs4MzS395/u1YSIlXJabZ2w6EgNwG7sd
         /LBI6ZA0vRsaS6k/Jkc3OFxp0WAspUaGcUCgjhtUielwgkeC1DRmOfPWJ9lWLLmzh1/k
         ViPYGMhgLbQRxCNPd+QdrGeoproJcpPOPocM29qrNU6Ii5PaprBGIhsETIksA+GBot/s
         h/oVqVPRLcUQZaaWcylZQXozp3yU/Azy0egYOHXQtnD6nMSg/szFxRlVlHzSiubvT2ra
         tTIA==
X-Gm-Message-State: AOJu0Yx7cXv/gEGwsfQVV0ra91KOrLPWxzVWLcn5dfMVzzqKnG2hk2Ia
	jV5PKnIyuF+Pv3HmQ3zxGiLnpJg5tunF60cNCo7Xu2IxjyJBZi5B9ikeJLMmkNA=
X-Google-Smtp-Source: AGHT+IEi8DL8zOvaPwlZrgbAncnz+UwXRBQIcwDcXFFTBpnZTLifvkgod0DlV/1HTcH4Xztob3WbPQ==
X-Received: by 2002:a5d:484c:0:b0:336:58e8:d444 with SMTP id n12-20020a5d484c000000b0033658e8d444mr4757158wrs.30.1706718476322;
        Wed, 31 Jan 2024 08:27:56 -0800 (PST)
From: Edwin Torok <edwin.torok@cloud.com>
Message-Id: <400C98F1-A3C6-4E14-90DE-91E314C48697@cloud.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_754EC7EE-2916-4CAC-B8D9-6D02BB2A2568"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH v1 2/2] oxenstored: make Quota.t pure
Date: Wed, 31 Jan 2024 16:27:45 +0000
In-Reply-To: <5879EE8F-6FAB-4026-BEDB-1AEEA7BF23DB@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
To: Christian Lindig <christian.lindig@cloud.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
 <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
 <5879EE8F-6FAB-4026-BEDB-1AEEA7BF23DB@cloud.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)


--Apple-Mail=_754EC7EE-2916-4CAC-B8D9-6D02BB2A2568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 Jan 2024, at 11:17, Christian Lindig =
<christian.lindig@cloud.com> wrote:
>=20
>=20
>=20
>> On 31 Jan 2024, at 10:52, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>>=20
>> Now that we no longer have a hashtable inside we can make Quota.t =
pure,
>> and push the mutable update to its callers.
>> Store.t already had a mutable Quota.t field.
>>=20
>> No functional change.
>=20
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>=20
> This is shifting copying working to GC work, at least potentially. I =
would agree that this is a good trade-off and the code looks correct to =
me. But I think we should see more testing and benchmarking before =
merging this unless we are fine merging speculative improvements.
>=20
> =E2=80=94 C
>=20
>=20


I=E2=80=99ve written this [1] microbenchmark which creates ~300_000 =
entries in xenstore, assigns quota to 1000 domains and then measure how =
long it takes to list xenstore
(It doesn=E2=80=99t matter whether these domains exist or not).
It shows a measurable improvement with this patch, once I=E2=80=99ve run =
a more realistic test on the original machine with 1000 real VMs I=E2=80=99=
ll post those results too:

On an Intel Xeon Gold 6354 @ 3.0 Ghz:
* without my patch: 12.756 +- 0.152 seconds time elapsed  ( +-  1.19% )
* with my patch: 5.6051 +- 0.0467 seconds time elapsed  ( +-  0.83% )

[1]
# cat >create.py <<EOF
#!/usr/bin/env python3
from xen.lowlevel.xs import xs

xenstore =3D xs()

for i in range(1,1000):
  txn =3D xenstore.transaction_start()
  for j in range(1,10):
    for k in range(1,30):
        path=3Df"/quotatest/{i}/{j}/{k}/x"
        xenstore.write(txn, path, "val")
        # assign quota to domid i
        xenstore.set_permissions(txn, path, [{"dom": i}])
  xenstore.transaction_end(txn)
EOF
# python3 create.py
# perf stat -r 10 sh -c 'xenstore-ls $(for i in $(seq 1 100); do echo =
"/quotatest/$i"; done) >/dev/null=E2=80=99

Best regards,
=E2=80=94Edwin=

--Apple-Mail=_754EC7EE-2916-4CAC-B8D9-6D02BB2A2568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
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
too:</div><div><br></div><div>On an Intel Xeon Gold 6354 @ 3.0 =
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
create.py</div><div>#&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">perf stat -r 10 sh -c 'xenstore-ls $(for i in =
$(seq 1 100); do echo "/quotatest/$i"; done) &gt;/dev/null</span><font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, =
0);">=E2=80=99</span></font></div><div><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Best =
regards,</span></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, =
0);">=E2=80=94Edwin</span></font></div></body></html>=

--Apple-Mail=_754EC7EE-2916-4CAC-B8D9-6D02BB2A2568--

