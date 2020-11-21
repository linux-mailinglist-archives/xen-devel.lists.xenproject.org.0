Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602012BBE8B
	for <lists+xen-devel@lfdr.de>; Sat, 21 Nov 2020 11:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32843.63968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgQWj-00041o-KO; Sat, 21 Nov 2020 10:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32843.63968; Sat, 21 Nov 2020 10:53:57 +0000
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
	id 1kgQWj-00041P-HD; Sat, 21 Nov 2020 10:53:57 +0000
Received: by outflank-mailman (input) for mailman id 32843;
 Sat, 21 Nov 2020 10:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lwRl=E3=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1kgQWh-00041K-W5
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 10:53:56 +0000
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2d037d6-8ec1-4c5e-a593-88bb9b58bd09;
 Sat, 21 Nov 2020 10:53:54 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id h6so10909600ilj.8
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2020 02:53:54 -0800 (PST)
Received: from [100.64.72.31] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id c16sm3871734ilj.71.2020.11.21.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 02:53:52 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lwRl=E3=gmail.com=persaur@srs-us1.protection.inumbo.net>)
	id 1kgQWh-00041K-W5
	for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 10:53:56 +0000
X-Inumbo-ID: f2d037d6-8ec1-4c5e-a593-88bb9b58bd09
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f2d037d6-8ec1-4c5e-a593-88bb9b58bd09;
	Sat, 21 Nov 2020 10:53:54 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id h6so10909600ilj.8
        for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2020 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:message-id:date
         :to:cc;
        bh=GJlmF9AKA/yoVwceev69lVTOpx+OM8K+hMVriKdWdws=;
        b=PVf+jWydh8M6TK099qKH6DFcAkK4p8sXpyLzSl8Vaz5mXIXOZKOoewmPtzDndjArFv
         xLyYMvKZ85NbAWmgWWxOPVsfaWlUwmhfrus3znMnHY+MH6Nqci7AECpe/EyK3nrT+h1i
         2mUATLBkw5AqIclRp4U+2WE/eyQf+gTe7KEYKRwXKPBK4ETq3amRKn7SrGJH4YX5uMgx
         oAoRmJGptAN22HMnHGBmRSrsJPV7YTyoMJYgcT7CVKl1rZWflY+flER1NGAd3q3MxYB3
         WjISPySNgitw/t/2vlwIPVPcPNSpI2phezi6vhK1eozWCOakdRzb/huv7e8i1xHxZgsk
         pIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:message-id:date:to:cc;
        bh=GJlmF9AKA/yoVwceev69lVTOpx+OM8K+hMVriKdWdws=;
        b=UjjFgDaha5kS4mGhuQkn4RqzBJr14Z4ptSs9xaFK57MEfHHfuSi1r+zdXsY5PJV7Bs
         /BXR4ojX7+w+YKjv8PPSLzpPte+jFZ9D0qKes/T424jjinc84dCC4otcO0Ao2szcGjpX
         nXEnxJfHWPn+ekNyP2MoHnEo9qs9K9Vh98LLC6F9TR/mU6+vsLXMVem/Cy/GLz+IqVHt
         iIPfMTHFbm+jwHELY2FAlNxnFEHBri9zlIuA+Ybe2Wrw/DABaZF+9mcK40gQTT/FTfDD
         +sT0EFsmQBeQgdKFLXAlhK+sL1feOZRVOWFt2X74eDLa5mzEvwbETxCEcZR4J/+4UVdv
         CiLw==
X-Gm-Message-State: AOAM532hUpexuXnUh113+ESsv017x2qfipYFakmKc4WSd7Kvy1TToVgC
	usR7xm6cGXeDX84VdXqDsfqk8K2ymWXWUA==
X-Google-Smtp-Source: ABdhPJz7fhptF9TsGDp0E1iNwhZB4JzKpw8hAlw+PN3AkTNy9iQzL4a4y+KJ/vL4Zv9ctUcJMal+OA==
X-Received: by 2002:a92:6410:: with SMTP id y16mr28036175ilb.126.1605956033405;
        Sat, 21 Nov 2020 02:53:53 -0800 (PST)
Received: from [100.64.72.31] ([173.245.215.240])
        by smtp.gmail.com with ESMTPSA id c16sm3871734ilj.71.2020.11.21.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2020 02:53:52 -0800 (PST)
Content-Type: multipart/alternative; boundary=Apple-Mail-D9968B9E-C459-45BF-8459-7167284D8E63
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Message-Id: <868F968F-83B1-4AB7-A48F-FB4E7D3D5E41@gmail.com>
Date: Sat, 21 Nov 2020 05:53:50 -0500
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 xen-devel@lists.xenproject.org,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
X-Mailer: iPad Mail (18B92)


--Apple-Mail-D9968B9E-C459-45BF-8459-7167284D8E63
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
=EF=BB=BFOn Nov 20, 2020, at 05:09, Jan Beulich <jbeulich@suse.com> wrote:
> =EF=BB=BFOn 19.11.2020 22:40, Stefano Stabellini wrote:
>> On Thu, 19 Nov 2020, Jan Beulich wrote:
>>> On 18.11.2020 22:00, Stefano Stabellini wrote:
>>>> On Wed, 18 Nov 2020, Jan Beulich wrote:
>>>>> On 18.11.2020 01:50, Stefano Stabellini wrote:
>>>>>> 1) It is not obvious that "Configure standard Xen features (expert
>>>>>> users)" is actually the famous EXPERT we keep talking about on xen-de=
vel
>>>>> Which can be addressed by simply changing the one prompt line.
>>>>>> 2) It is not obvious when we need to enable EXPERT to get a specific
>>>>>> feature
>>>>>> In particular if you want to enable ACPI support so that you can boot=

>>>>>> Xen on an ACPI platform, you have to enable EXPERT first. But searchi=
ng
>>>>>> through the kconfig menu it is really not clear (type '/' and "ACPI")=
:
>>>>>> nothing in the description tells you that you need to enable EXPERT t=
o
>>>>>> get the option.
>>>>> And what causes this to be different once you switch to UNSUPPORTED?
>>>> Two things: firstly, it doesn't and shouldn't take an expert to enable
>>>> ACPI support, even if ACPI support is experimental. So calling it
>>>> UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconf=
ig
>>>> options changed by this patch. Secondly, this patch is adding
>>>> "(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
>>>> it with the option you need to enable.
>>> There's redundancy here then, which I think is in almost all cases
>>> better to avoid. That's first and foremost because the two places
>>> can go out of sync. Therefore, if the primary thing is to help
>>> "make menuconfig" (which I admit I don't normally use, as it's
>>> nothing that gets invoked implicitly by the build process afaict,
>>> i.e. one has to actively invoke it), perhaps we should enhance
>>> kconfig to attach at least a pre-determined subset of labels to
>>> the prompts automatically?
>>> And second, also in reply to what you've been saying further down,
>>> perhaps we would better go with a hierarchy of controls here, e.g.
>>> EXPERT -> EXPERIMENTAL -> UNSUPPORTED?
>>=20
>> Both these are good ideas worth discussing; somebody else made a similar
>> suggestion some time back. I was already thinking this could be a great
>> candidate for one of the first "working groups" as defined by George
>> during the last community call because the topic is not purely
>> technical: a working group could help getting alignment and make
>> progress faster. We can propose it to George when he is back.
>>=20
>> However, I don't think we need the working group to make progress on
>> this limited patch that only addresses the lowest hanging fruit.
>>=20
>> I'd like to suggest to make progress on this patch in its current form,
>> and in parallel start a longer term discussion on how to do something
>> like you suggested above.
>=20
> Okay, I guess I can accept this. So FAOD I'm not objecting to the
> change (with some suitable adjustments, as discussed), but I'm
> then also not going to be the one to ack it. Nevertheless I'd like
> to point out that doing such a partial solution may end up adding
> confusion rather than reducing it.

Seconded.

> Much depends on how exactly consumers interpret what we hand to them.

How have Xen consumers changed during the last 15 years?  The UX (user exper=
ience) community uses a technique called "user stories" [0][1][2].  It may b=
e worth writing a few sentences about the users (distro packagers? Xen deriv=
atives? hypervisor developers? hosting companies? malware developers?) whose=
 needs are addressed by proposed changes.  One could then reason about UX of=
 Xen feature selection, before and after proposed changes.

Rich

[0] https://uxdict.io/design-thinking-methods-user-stories-3b9467313a04
[1] https://uxdesign.cc/fostering-ux-on-a-devops-culture-bb92716e3f43
[2] https://about.gitlab.com/blog/2020/03/27/how-we-utilize-user-stories-as-=
a-collaborative-design-tool/


--Apple-Mail-D9968B9E-C459-45BF-8459-7167284D8E63
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><div dir=3D"ltr">=EF=BB=BF=
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><di=
v dir=3D"ltr">=EF=BB=BFOn Nov 20, 2020, at 05:09, Jan Beulich &lt;jbeulich@s=
use.com&gt; wrote:<div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquot=
e></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 19.11.2=
020 22:40, Stefano Stabellini wrote:</span><br><blockquote type=3D"cite"><sp=
an>On Thu, 19 Nov 2020, Jan Beulich wrote:</span><br></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>On 18.11.2020 22:00, Stefano=
 Stabellini wrote:</span><br></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Wed, 18 No=
v 2020, Jan Beulich wrote:</span><br></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>On 18.11.2020 01:50, Stefano Stabellini wr=
ote:</span><br></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>1) It is not obvious that=
 "Configure standard Xen features (expert</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>users)" is actually the famous EXPERT we keep talki=
ng about on xen-devel</span><br></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
Which can be addressed by simply changing the one prompt line.</span><br></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span></span><br></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>2) It is not obvious w=
hen we need to enable EXPERT to get a specific</span><br></blockquote></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>feature</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>In particular if you want to enable ACPI support so that you can boot</=
span><br></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>Xen on an ACPI pla=
tform, you have to enable EXPERT first. But searching</span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>through the kconfig menu it is really n=
ot clear (type '/' and "ACPI"):</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>nothing in the description tells you that you need to enable EX=
PERT to</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>get the opt=
ion.</span><br></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>And what causes t=
his to be different once you switch to UNSUPPORTED?</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>Two things: firstly, it doesn't and shouldn't tak=
e an expert to enable</span><br></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>ACPI support, even if ACPI support is experimental. So calling it</span><=
br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>UNSUPPORTED helps a lot. T=
his is particularly relevant to the ARM Kconfig</span><br></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>options changed by this patch. Secondly, this p=
atch is adding</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>"(UNS=
UPPORTED)" in the oneline prompt so that it becomes easy to match</span><br>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>it with the option you need t=
o enable.</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>There's redundancy=
 here then, which I think is in almost all cases</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>better to=
 avoid. That's first and foremost because the two places</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>c=
an go out of sync. Therefore, if the primary thing is to help</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>"make menuconfig" (which I admit I don't normally use, as it's</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>nothing that gets invoked implicitly by the build process afaict,</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>i.e. one has to actively invoke it), perhaps we should enha=
nce</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>kconfig to attach at least a pre-determined subset of l=
abels to</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>the prompts automatically?</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>And second, also in reply to what you've been saying further do=
wn,</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>perhaps we would better go with a hierarchy of control=
s here, e.g.</span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>EXPERT -&gt; EXPERIMENTAL -&gt; UNSUPPORTED?<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><blockquote type=3D"cite"><span>Both these are good ideas wo=
rth discussing; somebody else made a similar</span><br></blockquote><blockqu=
ote type=3D"cite"><span>suggestion some time back. I was already thinking th=
is could be a great</span><br></blockquote><blockquote type=3D"cite"><span>c=
andidate for one of the first "working groups" as defined by George</span><b=
r></blockquote><blockquote type=3D"cite"><span>during the last community cal=
l because the topic is not purely</span><br></blockquote><blockquote type=3D=
"cite"><span>technical: a working group could help getting alignment and mak=
e</span><br></blockquote><blockquote type=3D"cite"><span>progress faster. We=
 can propose it to George when he is back.</span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>However, I don't think we need the working group to make progress on</span=
><br></blockquote><blockquote type=3D"cite"><span>this limited patch that on=
ly addresses the lowest hanging fruit.</span><br></blockquote><blockquote ty=
pe=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>I'=
d like to suggest to make progress on this patch in its current form,</span>=
<br></blockquote><blockquote type=3D"cite"><span>and in parallel start a lon=
ger term discussion on how to do something</span><br></blockquote><blockquot=
e type=3D"cite"><span>like you suggested above.</span><br></blockquote><span=
></span><br><span>Okay, I guess I can accept this. So FAOD I'm not objecting=
 to the</span><br><span>change (with some suitable adjustments, as discussed=
), but I'm</span><br><span>then also not going to be the one to ack it. Neve=
rtheless I'd like</span><br><span>to point out that doing such a partial sol=
ution may end up adding</span><br><span>confusion rather than reducing it. <=
/span></div></blockquote><div><br></div>Seconded.<div><br><blockquote type=3D=
"cite"><div dir=3D"ltr"><span>Much depends on how exactly&nbsp;</span><span>=
consumers interpret what we hand to them.</span><br></div></blockquote><br><=
div>How have Xen consumers changed during the last 15 years? &nbsp;The UX (u=
ser experience) community uses a technique called "user stories" [0][1][2]. &=
nbsp;It may be worth writing a few sentences about the users (distro package=
rs? Xen derivatives? hypervisor developers? hosting companies? malware devel=
opers?) whose needs are addressed by proposed changes. &nbsp;One could then r=
eason about UX of Xen feature selection, before and after proposed changes.<=
/div><div><br></div><div>Rich</div><div><br></div><div>[0]&nbsp;<a href=3D"h=
ttps://uxdict.io/design-thinking-methods-user-stories-3b9467313a04">https://=
uxdict.io/design-thinking-methods-user-stories-3b9467313a04</a></div><div>[1=
]&nbsp;<a href=3D"https://uxdesign.cc/fostering-ux-on-a-devops-culture-bb927=
16e3f43">https://uxdesign.cc/fostering-ux-on-a-devops-culture-bb92716e3f43</=
a></div><div>[2]&nbsp;<a href=3D"https://about.gitlab.com/blog/2020/03/27/ho=
w-we-utilize-user-stories-as-a-collaborative-design-tool/">https://about.git=
lab.com/blog/2020/03/27/how-we-utilize-user-stories-as-a-collaborative-desig=
n-tool/</a></div><div><br></div></div></div></div></div></body></html>=

--Apple-Mail-D9968B9E-C459-45BF-8459-7167284D8E63--

