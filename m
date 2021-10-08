Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947984272E9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 23:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204870.360056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYxAf-00062Z-Jj; Fri, 08 Oct 2021 21:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204870.360056; Fri, 08 Oct 2021 21:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYxAf-00060Q-Gi; Fri, 08 Oct 2021 21:12:49 +0000
Received: by outflank-mailman (input) for mailman id 204870;
 Fri, 08 Oct 2021 21:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stSb=O4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mYxAd-00060K-HV
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 21:12:47 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e291b7e-baef-4c2f-9b26-31db77b2e074;
 Fri, 08 Oct 2021 21:12:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y12so27968972eda.4
 for <xen-devel@lists.xenproject.org>; Fri, 08 Oct 2021 14:12:45 -0700 (PDT)
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
X-Inumbo-ID: 7e291b7e-baef-4c2f-9b26-31db77b2e074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTYNtFHdXJVhmhKUk/jw25iIHy9fcbY70CNpzjFaV7c=;
        b=UaGFMcGjxhStFn+jCjRUjtwz3U1TW7/gpM1u+gaZdtkdhNMUPAlL3YJIWcwprsKTjV
         cxJjJa5HHB/YY2aqxsnxqmm0kjypgd4M50/WLv6qjaPteELHDNx123fYef1b/2INCUqJ
         qPB8UyIwvrhX7CvAzWPpfV6pucBXGnig7eRXQs0w5ZIWq+bABovHnNKESm7Sg0Dl8pZo
         RqRHDdUT6wXxN/u+j3e5QUbL+YQeDxaUVRhAgYn45T7CAgS+DD5c9Tr00zg76fpQelVJ
         sp4N7TO8qeYngJ0KyWXW3k8OaSayb5ai2R2pojY65F2sEdwEOogpwlzC1cMw6vPTyg/W
         gYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTYNtFHdXJVhmhKUk/jw25iIHy9fcbY70CNpzjFaV7c=;
        b=YgIEXYqrKQ1v+Uu27ocVLVWVIOSmngMyXVPWN0kise1lwKhDYARvhd/xVon0a9XrSh
         TsItWO4oXueEHDqs+/2crt/oxRzzmIdmDtn5+nQOySd9+ZGFyhuak3EV//mfLahIG7Dt
         Uz5IQvUSvKvY8nsNXrAccn79I6+i/ysfgA8yjnfuZZ9XgAM7aJt3+gpHXlfD/nJ0vv/j
         2+27PQjkH/G7lHe6J7sqEuNl+bsQNZlp+hXAk8H0hkfDI07X539xAMD/5S/fC2dXREaT
         ZGPDYhLqENc4elhfh9GxoT7/r6c3LfVKRLzooC9T0c4bd37+ns2M/r948WI//J+cF6NP
         7nmw==
X-Gm-Message-State: AOAM531Mxbf1TNp+lsb/MwnCNAl5uDjRFxRj3iMsTZlfYRJPGEmIV8Hg
	LWeltksI0sYl7TWTuJWMFdnj3lvHuhwgpCnn+Oo=
X-Google-Smtp-Source: ABdhPJz9Gv+TZ61UBcOFlEYcDMEyEVb2VkXRVFiqlSLnJnYoREkFQFqpAExBtfs/czyco2TTURem1tO+B5/M6ByiiHE=
X-Received: by 2002:a17:906:2cc9:: with SMTP id r9mr7333075ejr.138.1633727565101;
 Fri, 08 Oct 2021 14:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
In-Reply-To: <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 8 Oct 2021 23:12:34 +0200
Message-ID: <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000002d7dc405cdddd707"

--0000000000002d7dc405cdddd707
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:

> On 06/10/2021 18:40, Rahul Singh wrote:
> > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> > Reject the use of this new flag for x86 as VPCI is not supported for
> > DOMU guests for x86.
> >
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Acked-by: Christian Lindig <christian.lindig@citrix.com>
>
> I'm afraid this logic is broken.
>
> There's no matching feature to indicate to the toolstack whether
> XEN_DOMCTL_CDF_vpci will be accepted or not.  The usual way of doing
> this is with a physinfo_cap field.
>

I am slightly puzzled by this. I am assuming you are referring to
XENVER_get_features which AFAICT is a stable interface. So why should we
use it to describe the presence of an unstable interface?


> This flag needs using in Patch 10 to reject attempts to create a VM with
> devices when passthrough support is unavailable.
>

May I ask why we can't rely on the hypervisor to reject the flag when
suitable?


> Ian, for the 4.16 release, this series either needs completing with the
> additional flag implemented, or this patch needs reverting to avoid us
> shipping a broken interface.


I fail to see how the interface would be broken... Would you mind to
describe a bit more what could go wrong with this interface?

Cheers,


> ~Andrew
>
>

--0000000000002d7dc405cdddd707
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Andrew,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 8 Oct 2021, 20:07 Andrew Cooper, &lt=
;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank" rel=3D"nore=
ferrer">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 06/10/2021 18:40, Rahul Singh wrote:<br>
&gt; Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.<br>
&gt; Reject the use of this new flag for x86 as VPCI is not supported for<b=
r>
&gt; DOMU guests for x86.<br>
&gt;<br>
&gt; Signed-off-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" =
rel=3D"noreferrer noreferrer" target=3D"_blank">rahul.singh@arm.com</a>&gt;=
<br>
&gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" rel=3D"noreferrer noreferrer" target=3D"_blank">sstabellini@kernel.=
org</a>&gt;<br>
&gt; Acked-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citr=
ix.com" rel=3D"noreferrer noreferrer" target=3D"_blank">christian.lindig@ci=
trix.com</a>&gt;<br>
<br>
I&#39;m afraid this logic is broken.<br>
<br>
There&#39;s no matching feature to indicate to the toolstack whether<br>
XEN_DOMCTL_CDF_vpci will be accepted or not.=C2=A0 The usual way of doing<b=
r>
this is with a physinfo_cap field.<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I am slightly puzzled by this. I am assum=
ing you are referring to XENVER_get_features which AFAICT is a stable inter=
face. So why should we use it to describe the presence of an unstable inter=
face?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
This flag needs using in Patch 10 to reject attempts to create a VM with<br=
>
devices when passthrough support is unavailable.<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">May I ask why we can&#39;t =
rely on the hypervisor to reject the flag when suitable?</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
Ian, for the 4.16 release, this series either needs completing with the<br>
additional flag implemented, or this patch needs reverting to avoid us<br>
shipping a broken interface.</blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I fail to see how the interface would be broken... =
Would you mind to describe a bit more what could go wrong with this interfa=
ce?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div di=
r=3D"auto"></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div d=
ir=3D"auto"></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
~Andrew<br>
<br>
</blockquote></div></div></div>

--0000000000002d7dc405cdddd707--

