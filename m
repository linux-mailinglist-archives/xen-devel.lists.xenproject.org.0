Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261FD662B4D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473871.734705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEv5R-0000uF-Pt; Mon, 09 Jan 2023 16:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473871.734705; Mon, 09 Jan 2023 16:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEv5R-0000rQ-Mj; Mon, 09 Jan 2023 16:33:25 +0000
Received: by outflank-mailman (input) for mailman id 473871;
 Mon, 09 Jan 2023 16:33:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0yl/=5G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pEv5P-0000rI-OO
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:33:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a76ad2-903b-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 17:33:21 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id s5so13318235edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 08:33:21 -0800 (PST)
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
X-Inumbo-ID: 54a76ad2-903b-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpopwb8KrQWBXzBjPf9ZHOHK5nNkCWT6pVvIG4FyUoE=;
        b=H8Pl71SJ5f7aqxRvGqq/bFEXF26SjbnF6m0XUI83tTieEDfb2mVzv82XW7Jwq2VU1T
         AdZPo7+FlMGmXWouyOEkYlD3xoq9Hd/9G/UANGMK8KrqQSdk0UyCBCdPR7KoVJasdVgk
         VoR3myf1srd7KCnIiLrTn41YPcEpPB9qWLEBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zpopwb8KrQWBXzBjPf9ZHOHK5nNkCWT6pVvIG4FyUoE=;
        b=bbWcy3aUMC2a3xmsD4AZ0G17j6EyCZsN/lTYBSH8mbkEM62xFonJZZKiXlXyvq0ciH
         asIlIbJAoqTHLnQqICMuDf1yo/FFAtDexJt21t6MnvLeWQ5Qe59tHtzq6YMIhYQsNs35
         9KPtqLawerZrDGzKi2rNkeVS2sbPT7ctZ6Zwbd9ZdUf0IYJfNIL5UwI+g+Zci8kz60Fp
         izisgsF9Jj1TcT3BgH5QE0vP9f4x3lZMAoMOhgyG3lL40Yie1NESgUr6UHsQ8u1IHP1q
         esgaEv8dQ0tZLzLMEGwfJq+IX5JWcDVUp+TSflUpkZm2A1H1w6Gwst1s4tDSnl+/yyp2
         cZdw==
X-Gm-Message-State: AFqh2kp/Fl4La6flcsnAivaRH4Uzbukw8l6GzikPAKL7mj6lf8RMVpdq
	2f28+cypffcZPOyRMACZJqcdyNWURts4Hu6ARuIu1g==
X-Google-Smtp-Source: AMrXdXvC+aTYlGOLRuOjXHLpOfr0ey/W1GaCHKISSZRkiLP8yi/g2FsVydgIYKsenZ88MxmOw+CGpf+WKp1Muj6PfPw=
X-Received: by 2002:a05:6402:78f:b0:499:9dfa:4388 with SMTP id
 d15-20020a056402078f00b004999dfa4388mr656297edy.106.1673282001371; Mon, 09
 Jan 2023 08:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20221208104924.76637-1-george.dunlap@cloud.com>
 <9b8cace3-1593-8400-0633-da04f12b9849@xen.org> <CA+zSX=Z=fX+BPHqxNVTiNipkBWdWPf+g0H6vetHoSy3vtN0shQ@mail.gmail.com>
In-Reply-To: <CA+zSX=Z=fX+BPHqxNVTiNipkBWdWPf+g0H6vetHoSy3vtN0shQ@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 9 Jan 2023 16:33:10 +0000
Message-ID: <CA+zSX=aeqLkS-dXj+eQMiO931MqwDO5vwdpvX9cumHoLrEsqEw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000004d14cc05f1d75381"

--0000000000004d14cc05f1d75381
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 2:26 PM George Dunlap <george.dunlap@cloud.com>
wrote:

>
>
> On Thu, Dec 8, 2022 at 1:58 PM Julien Grall <julien@xen.org> wrote:
>
>> Hi George,
>>
>> On 08/12/2022 10:49, George Dunlap wrote:
>> > From: George Dunlap <george.dunlap@citrix.com>
>> >
>> > There was a question raised recently about the requriements for
>>
>> Typo: s/requriements/requirements/
>
> ...
>
>> Typo: s/non-maintiners/maintainers/
>>
>
> Thanks, I've changed these locally.
>
>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>
> Great, thanks.
>

This has now been checked in.

 -George

--0000000000004d14cc05f1d75381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 2:26 PM George=
 Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 1:58 PM Jul=
ien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xe=
n.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi George,<br>
<br>
On 08/12/2022 10:49, George Dunlap wrote:<br>
&gt; From: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com" ta=
rget=3D"_blank">george.dunlap@citrix.com</a>&gt;<br>
&gt; <br>
&gt; There was a question raised recently about the requriements for<br>
<br>
Typo: s/requriements/requirements/</blockquote><div>...=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Typo: s/non-maintiners/maintainers/<br></blockquote><div><br></div><div>Tha=
nks, I&#39;ve changed these locally.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Acked-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=3D"_=
blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>Great,=
 thanks.</div></div></div></blockquote><div><br></div><div>This has now bee=
n checked in.</div><div><br></div><div>=C2=A0-George</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>

--0000000000004d14cc05f1d75381--

