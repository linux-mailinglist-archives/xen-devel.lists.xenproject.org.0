Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBC6471C5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 15:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457200.715072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Hrm-0004io-69; Thu, 08 Dec 2022 14:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457200.715072; Thu, 08 Dec 2022 14:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Hrm-0004fc-3G; Thu, 08 Dec 2022 14:27:14 +0000
Received: by outflank-mailman (input) for mailman id 457200;
 Thu, 08 Dec 2022 14:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3Hrk-0004fW-NP
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 14:27:12 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6733b703-7704-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 15:27:11 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id r26so2007166edc.10
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 06:27:11 -0800 (PST)
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
X-Inumbo-ID: 6733b703-7704-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NjdFN+VBR9jPMCrxotZkJn5+bTmRIOswW5BKec2o8+0=;
        b=EKd5etTwaek9y6yvl6PVUs5u+kEl3FcxyG4+/0T/CJdfP/g4cuvx8MKw7p044PEbI2
         +DwgZ3DOIdIHHUv4WHr0pEQYEokHJFOXKdlUW0uev6Q+Kj19m67tiUELKFMovip+FyDh
         iP7t+ahD5TtJqNGboonUEMny8Xj4CxHcKN7Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjdFN+VBR9jPMCrxotZkJn5+bTmRIOswW5BKec2o8+0=;
        b=ISdnIk76EIg9UMsBwGvXpA8FezuOTC/3wts6TuVxYQjOTdwtCpGxdjEXxzW6YbWisx
         rr70uTAf1JRHYh1R23kFLb13gMTGTucgd+MIC+dvODGotrxKaWpmbZfXTV2o7qDIAaZC
         x4f2T7mSBpynTTZUGx3/Go3AAu/Q07TFeBgBq5yMPsU9+77giFXOGQSnyVZmaMTXfp31
         jn/fO6J5sPcFhODr7+QBe3vZnpOWBv9OwZX69jsBRecmuf7qOOnd05N0cNx/z5TFIK22
         ci8/XnYr9VyDZC+GcLRC6yqryTgJS8LZ1YkZmD9+53YM++Cc/JOds+CSRzFTFteK1kCG
         xflw==
X-Gm-Message-State: ANoB5pmQCc5xA4r6AufwDqPEODqcIDUf8nxCUUVrN8tGfqh3mxtKtyl/
	U1hqdgzmEE4bjoAtqu1JKTFBhO76qyW5iTYrHkKPQA==
X-Google-Smtp-Source: AA0mqf4ADxuyb+YyfEBI6Vk68JjxrLgLGtjyzUjtpO1RdBuM+ztKy89eLELV4gHPuar2OBJPYaoWgng4GJrMK2as95Y=
X-Received: by 2002:a05:6402:3789:b0:467:7664:c7f4 with SMTP id
 et9-20020a056402378900b004677664c7f4mr4290831edb.99.1670509630865; Thu, 08
 Dec 2022 06:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20221208104924.76637-1-george.dunlap@cloud.com> <9b8cace3-1593-8400-0633-da04f12b9849@xen.org>
In-Reply-To: <9b8cace3-1593-8400-0633-da04f12b9849@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Dec 2022 14:26:59 +0000
Message-ID: <CA+zSX=Z=fX+BPHqxNVTiNipkBWdWPf+g0H6vetHoSy3vtN0shQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000002461a705ef51d559"

--0000000000002461a705ef51d559
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 1:58 PM Julien Grall <julien@xen.org> wrote:

> Hi George,
>
> On 08/12/2022 10:49, George Dunlap wrote:
> > From: George Dunlap <george.dunlap@citrix.com>
> >
> > There was a question raised recently about the requriements for
>
> Typo: s/requriements/requirements/

...

> Typo: s/non-maintiners/maintainers/
>

Thanks, I've changed these locally.


> Acked-by: Julien Grall <jgrall@amazon.com>
>

Great, thanks.


>
> Somewhat unrelated. I see you switched to you @cloud.com e-mails. Are
> the @citrix.com to work in the future? If not, then you (and other from
> citrix) may want to send an e-mail to update MAINTAINERS accordingly.


Yes, I think all the XenServer people will do that at some point, once some
things have settled down.

 -George

--0000000000002461a705ef51d559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 1:58 PM Julien=
 Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi George,<br>
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
 thanks.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Somewhat unrelated. I see you switched to you @<a href=3D"http://cloud.com"=
 rel=3D"noreferrer" target=3D"_blank">cloud.com</a> e-mails. Are <br>
the @<a href=3D"http://citrix.com" rel=3D"noreferrer" target=3D"_blank">cit=
rix.com</a> to work in the future? If not, then you (and other from <br>
citrix) may want to send an e-mail to update MAINTAINERS accordingly.</bloc=
kquote><div><br></div><div>Yes, I think all the XenServer people will do th=
at at some point, once some things have settled down.</div><div><br></div><=
div>=C2=A0-George=C2=A0</div></div></div>

--0000000000002461a705ef51d559--

