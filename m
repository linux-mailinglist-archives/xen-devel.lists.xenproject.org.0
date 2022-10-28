Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E822611601
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 17:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432147.684903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooROM-0007F8-BU; Fri, 28 Oct 2022 15:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432147.684903; Fri, 28 Oct 2022 15:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooROM-0007D9-8X; Fri, 28 Oct 2022 15:35:30 +0000
Received: by outflank-mailman (input) for mailman id 432147;
 Fri, 28 Oct 2022 15:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GD3O=25=gmail.com=bruce.ashfield@srs-se1.protection.inumbo.net>)
 id 1ooRMz-0006uW-3d
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 15:34:05 +0000
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f392cd94-56d5-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 17:34:04 +0200 (CEST)
Received: by mail-io1-xd36.google.com with SMTP id l127so4834071iof.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Oct 2022 08:34:04 -0700 (PDT)
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
X-Inumbo-ID: f392cd94-56d5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X68HLcAn+xMj99CT688cZ5YUmRAJyCzuJNU9oDEpHYo=;
        b=nx1kt/i5wIhiGCTgDEeTwQSWq3lw28Rhr6cpdTqez9uIFIpjd6wWmPDtTp8b/GvVB+
         cc+fzBFYtY5MWudcQzVXQBgxeNaMtfkh1+wwJfzPCw6IeIed5JK+8IvpsvkZ7QobA9w/
         E9t0lBOEojgbHDHDu5uoWW7d3syjJXqk80J6nD0UEB592BJZ8Sa0h7EQxxFNjUmjFovi
         +cwsn6EJi9PkNLt3Y/0JUsY2FKlSpMobZbx/qKwNaiWHKJANKOYJO3Bh4tYol8tF8Tp3
         pqZFr9GwNMkDyba8NHBx/sdMv/MQhb2uiXtCMSgimGo2l+azGdgrMAyuKniBN3VQmtCF
         QuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X68HLcAn+xMj99CT688cZ5YUmRAJyCzuJNU9oDEpHYo=;
        b=YuQ3svQWhg9tVk5v/AXypAoxacOGlG/jeDBU7kIxo7huC50u0+5ie22jkOLPurAFVN
         p+kOtDP/vMS0Mlud/3G6pabF69s5R+fi5C7CVt+YJH5l6BuN+o+LXThpKS22Zatkz0Lz
         U2PLaTsd3v648OucY1Mq6blmr1YfpleC+cU0GZeK/jLXefaH2uqJzIriVQdmDQwQQBP2
         zPtNuTHJy+QTKJ6y9by78o948n0CeoWCdjSPjj/CwesYjM0e1viMPzxhZPX479tDk3qG
         FmoLC8QPI0wEXHFiLZIag0qOxJtLsE2wpxhoWe+MEf8JO6kSjpnlOYlkG7yWXCgOrvl3
         PMJw==
X-Gm-Message-State: ACrzQf1y1osv4OWoXBNMTlNTAG6LwsOIWoGJNS8/6B5jh+472yWOvAIR
	/Ln6SEceireJzK7DadhNf1/v3l4+4mAyNNkSzI8=
X-Google-Smtp-Source: AMsMyM6G8fw+ZgdzvFMm4SXobj4CIDcGdMgd5QQ//LKzEIgRBU6WZk6E3mnwyVSnxtxOUhQWFJVOw3Pz6B+AST6XulM=
X-Received: by 2002:a05:6638:35a2:b0:364:451:9969 with SMTP id
 v34-20020a05663835a200b0036404519969mr960jal.245.1666971242731; Fri, 28 Oct
 2022 08:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <CACMJ4GYr_R-yKCxUVGjcZgcCFmHNQa9Ts=_F-pdN-rgvsrCVWA@mail.gmail.com>
In-Reply-To: <CACMJ4GYr_R-yKCxUVGjcZgcCFmHNQa9Ts=_F-pdN-rgvsrCVWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 28 Oct 2022 11:33:51 -0400
Message-ID: <CADkTA4MM31cAT9Mw87fHhByD54x1Qk0Ua68-FnLupLebXr7-vw@mail.gmail.com>
Subject: Re: Feedback for postponing the 4.17 release to a week later
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Wei Liu <wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>
Content-Type: multipart/alternative; boundary="000000000000c620d205ec19fc49"

--000000000000c620d205ec19fc49
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 2:43 AM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Thu, Oct 27, 2022 at 9:44 PM Henry Wang <Henry.Wang@arm.com> wrote:
>
>> Hi all,
>>
>> Since there will be a batch of XSAs released on Nov. 1 [1] and the
>> original date for
>> the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the
>> 4.17
>> release to a week later (Nov. 11) to give a little bit longer time so
>> that:
>>
>> - The security team won't do anything in rush.
>> - We can have more feedback after merging these XSAs.
>> - Include more release-relevant bugfixes.
>>
>> May I please have some feedback on this proposal? Thanks very much!
>>
>
> I think you have presented an appropriate rationale for the date
> adjustment, so I am supportive of it.
>
> As for effect on downstreams: I don't think that this change of date will
> negatively affect OpenEmbedded and Yocto (+CC Bruce for visibility).
>
>
Thanks for the heads up.

We have time in our cycle, so no problems on this end.

Bruce



> Christopher
>
>
>>
>> [1] https://xenbits.xen.org/xsa/
>>
>> Kind regards,
>> Henry
>>
>>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c620d205ec19fc49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 2:43 AM Christopher Clark &=
lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 27, 2022 at 9:44 PM Hen=
ry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=3D"_blank">Henry.W=
ang@arm.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
Since there will be a batch of XSAs released on Nov. 1 [1] and the original=
 date for<br>
the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the 4=
.17<br>
release to a week later (Nov. 11) to give a little bit longer time so that:=
<br>
<br>
- The security team won&#39;t do anything in rush.<br>
- We can have more feedback after merging these XSAs.<br>
- Include more release-relevant bugfixes.<br>
<br>
May I please have some feedback on this proposal? Thanks very much!<br></bl=
ockquote><div><br></div><div>I think you have presented an appropriate rati=
onale for the date adjustment, so I am supportive of it.</div><div><br></di=
v><div>As for effect on downstreams: I don&#39;t=C2=A0think that this chang=
e of date will negatively affect OpenEmbedded and Yocto (+CC Bruce for visi=
bility).</div><div><br></div></div></div></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Thanks for the heads =
up.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">We have time in our c=
ycle, so no problems on this end.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></=
div><div>Christopher</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
[1] <a href=3D"https://xenbits.xen.org/xsa/" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/xsa/</a><br>
<br>
Kind regards,<br>
Henry<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c620d205ec19fc49--

