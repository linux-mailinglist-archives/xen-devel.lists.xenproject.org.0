Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1B610AA0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 08:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431410.684296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJ5d-0004I9-7D; Fri, 28 Oct 2022 06:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431410.684296; Fri, 28 Oct 2022 06:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJ5d-0004FC-4F; Fri, 28 Oct 2022 06:43:37 +0000
Received: by outflank-mailman (input) for mailman id 431410;
 Fri, 28 Oct 2022 06:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lonw=25=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1ooJ5b-0004F6-0Q
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 06:43:35 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d75050e9-568b-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 08:43:33 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13ae8117023so5321615fac.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 23:43:33 -0700 (PDT)
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
X-Inumbo-ID: d75050e9-568b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i6p1KV4ytSklt9xMenkyq+EiW3duis9GchqXYiC9M78=;
        b=LPwCloR3CsEWelubuXseWVRC7KelKlbC8Ur6BRz9MOijLZXlkgjOW2PYGf2yZQyV3N
         VBpMQdAuTM2ZRFz7nDlXPzmM6CG7NYMWEi5e0SjXuO1mdWKWipNj6dT3VjsOtuLzhmHw
         l7EtrIvXAPWdZy1S3sPLD5LC+2jjbkEMxZOP0mrVgkcOHaAlKEkoP2JQ9kSsjFGfwSiH
         gl7NPxq0FbOkt/SbNfzXqzPGbO0tBP6M89RrP3VpAccHPRojVjeVWUst9f9lB6L376VG
         Oih967UMOINLMO0RTKFl0K8BXVPcPB1Pi2uWJpapPGmhKmTZZDYlTFFUIxtr3ZVSKsw3
         8KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6p1KV4ytSklt9xMenkyq+EiW3duis9GchqXYiC9M78=;
        b=RJ2oOhDfqqFcrZgZQoyZIH7ii+zzYGs4lI1HDMpqPwGWSujYYnHY5RSHjFFm8+aT5Q
         CeuIh6Q1c8erl+Gi7LFIRjF7J12Jqt1ZC3XOEqtnEqRTxv64uHFMIEgDwgS2HbfwakQE
         KSKKabG7ut45+XG9kgrvO4V3qUzaIL7Vrox4UbwcRt4bz41rIluKJ9oABHnabJrO637G
         pOGZfnfOEVcltkwuE5esw3/H0vRZrkyviQQIohRr66e48Ff0Ipi9X2Ma0tZaV4jFjfn1
         FW2rmQ/qAriAPXqe66EYoYxtKXAAO4cOKoePs8rtHwS0lYIe2YXDUitoP+Drr/XyrCDE
         1Glg==
X-Gm-Message-State: ACrzQf1LeHJYU+SKEdJXBV3WsAr173OnSctiv9yUVnEbCNc/CsJJuk4U
	PYO9xrVBA12WnsSMRzzLJZghceBZyIiO2ShpFD4=
X-Google-Smtp-Source: AMsMyM5NuL6YUV50dCVUqfeeEmBHTyarOguI/BO8Q8n4OZkIP/q+oY8SZW+q2+2obUwwvQeqJjwm4ZhkjQZkFwpktQ0=
X-Received: by 2002:a05:6870:6394:b0:13c:7d1c:8604 with SMTP id
 t20-20020a056870639400b0013c7d1c8604mr1009277oap.184.1666939412597; Thu, 27
 Oct 2022 23:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 27 Oct 2022 23:43:21 -0700
Message-ID: <CACMJ4GYr_R-yKCxUVGjcZgcCFmHNQa9Ts=_F-pdN-rgvsrCVWA@mail.gmail.com>
Subject: Re: Feedback for postponing the 4.17 release to a week later
To: Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Wei Liu <wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008cd11505ec129316"

--0000000000008cd11505ec129316
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 9:44 PM Henry Wang <Henry.Wang@arm.com> wrote:

> Hi all,
>
> Since there will be a batch of XSAs released on Nov. 1 [1] and the
> original date for
> the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the
> 4.17
> release to a week later (Nov. 11) to give a little bit longer time so that:
>
> - The security team won't do anything in rush.
> - We can have more feedback after merging these XSAs.
> - Include more release-relevant bugfixes.
>
> May I please have some feedback on this proposal? Thanks very much!
>

I think you have presented an appropriate rationale for the date
adjustment, so I am supportive of it.

As for effect on downstreams: I don't think that this change of date will
negatively affect OpenEmbedded and Yocto (+CC Bruce for visibility).

Christopher


>
> [1] https://xenbits.xen.org/xsa/
>
> Kind regards,
> Henry
>
>

--0000000000008cd11505ec129316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 27, 2022 at 9:44 PM Henry Wan=
g &lt;<a href=3D"mailto:Henry.Wang@arm.com">Henry.Wang@arm.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi all,<br>
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
bility).</div><div><br></div><div>Christopher</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://xenbits.xen.org/xsa/" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/xsa/</a><br>
<br>
Kind regards,<br>
Henry<br>
<br>
</blockquote></div></div>

--0000000000008cd11505ec129316--

