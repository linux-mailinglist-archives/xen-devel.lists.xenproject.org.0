Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D873862627
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 18:25:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkWOX-0003lF-TA; Mon, 08 Jul 2019 16:21:37 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.42])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <gmarr@redhat.com>) id 1hkWOX-0003lA-2e
 for xen-devel@lists.xensource.com; Mon, 08 Jul 2019 16:21:37 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 74/58-11177-09D632D5;
 Mon, 08 Jul 2019 16:21:36 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-4.tower-264.messagelabs.com: domain of redhat.com designates 
 209.85.221.169 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRWlGSWpSXmKPExsVyMfTuSt3+XOV
 Yg8MTlCzuTXnP7sDosb1vF3sAYxRrZl5SfkUCa8bXtWcYC176Vhy9+IO5gfGrYxcjF4eQwAxG
 iZ8T3rGDOBICc1glJl1oAnI4gZwqicY5LVB2kcSpWydZIexSic/TpjOB2LwCghInZz5hgZh0h
 kliy5bZYAlOAX+J3wc3gjWzCahJHJ22hBnEZhFQkfh09zgjRHOARF/HKzYQW1jAUeLG9o9gcR
 GBcImHL56DLWMW2Mgs8fGTO4TtI3FqxWmWCYz8s5DsnoUkBWFrSrRu/80OYWtILLizjxHC1pZ
 YtvA18wJG1lWM5klFmekZJbmJmTm6hgYGuoaGRrqGlsa6FsZ6iVW6iXqppbrlqcUluoZ6ieXF
 esWVuck5KXp5qSWbGIGBnVJwMHgH471Zb/QOMUpyMCmJ8sZFKccK8SXlp1RmJBZnxBeV5qQWH
 2KU4eBQkuDtzgbKCRalpqdWpGXmAKMMJi3BwaMkwrsBJM1bXJCYW5yZDpE6xejNsWTjvEXMHJ
 evg8iOX4uAZPOJxUDy46olQPI7iBRiycvPS5US590LMkIAZERGaR7cAliyuMQoKyXMy8jAwCD
 EU5BalJtZgir/ilGcg1FJmLc9B2gKT2ZeCdwdr4BOZAI6sS5SCeTEkkSElFQDU/Lu3Es/zQVK
 LxvMDLFndcx6aNUS5OPmbXbtutGSg+rhnY6c5zM5l+zdUslhuaCxUE50/uEdM+r9Fvx8P/G8Q
 fyPLEWeJREXc3vO+pjumbtK+Ktpc+atFyafVp2T23H/pmBNac0n0Z702lsV8YKVOhf2abL2JU
 7eFv3tBdsPZlO+MqdUw+QpK18fNb32WL321DfL3bKlfSzck0V/6HidufX4nG8Jh4onr+OHB50
 qgv/Kb2Tn7jJyn1k52y3Ps0hiYu2BCw5tc9x37hCwWfiT5+pXp1Uf+M6vNBHPb2Xb9bNDRFfi
 oCbXUqviyle7ln/P5NzSt3ChxsI7PLO3+p+XD3icKLlw79u5G5kYZYSslViKMxINtZiLihMBV
 D3M25EDAAA=
X-Env-Sender: gmarr@redhat.com
X-Msg-Ref: server-4.tower-264.messagelabs.com!1562602894!888084!1
X-Originating-IP: [209.85.221.169]
X-SpamReason: No, hits=0.1 required=7.0 tests=newsletters: ,HTML_30_40,
 HTML_MESSAGE
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30602 invoked from network); 8 Jul 2019 16:21:35 -0000
Received: from mail-vk1-f169.google.com (HELO mail-vk1-f169.google.com)
 (209.85.221.169)
 by server-4.tower-264.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 8 Jul 2019 16:21:35 -0000
Received: by mail-vk1-f169.google.com with SMTP id g124so2573201vkd.1
 for <xen-devel@lists.xensource.com>; Mon, 08 Jul 2019 09:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgqeWjzacfQhbe0a43eKScdvkCpxqOv3DnBbVv6vqd4=;
 b=qM0o3DGEDII9JPwgvckPfq2Zg1wTYySyAo1dh+GSwWj+2WalgmFnAklekenDC2i8wX
 kI0smo98PihVyp/d8P2SEii9d8gEZmcI+1pCjkK0sVX15YE6LwyawQcHc+V+Dm7AgP9g
 6WB6mMr1576JDGzAQQmGSn4QAl2bPkHwlgSXyhhJcrKpTkGmA2ZOXODL7Vvhc0V08K6B
 8jifwy3v+Vojvz5L0YwoZl36GTFpiwNpJBU2Rdw9zZLlP/VVbdfe9viRLdiuHvtqTIeL
 xsSpYae6BdfXMrqJ2k6ldScvM6sIIWyCuLWe8AIDcvACJopwpOgPoluWc2LYj+MfCpdB
 IeiQ==
X-Gm-Message-State: APjAAAXgABDAgDN0Ca/PYQKMNbzVLJXVUwlI/yQGNX8DrMwkeRhI6YyI
 MCI2LQFYXIZn0L5U5aDq9FwTkl2KGmdg5P8M2uJxwA==
X-Google-Smtp-Source: APXvYqwcHWq4Oc0mp+VyUXj61UE1mVc6vX6fWVwpKVirUtBNBQ1mZS/ssfBkz2V+qfi4bIgF/HRKFQUHmgcE2z6a58M=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr1857997vkc.84.1562602894119; 
 Mon, 08 Jul 2019 09:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
In-Reply-To: <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
From: Geoffrey Marr <gmarr@redhat.com>
Date: Mon, 8 Jul 2019 10:21:23 -0600
Message-ID: <CAO9z1z-x=7E3MfcMFmso1MJqDRr44djYiE=g0kXG5JY_O8dEeQ@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============7410215164396552991=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7410215164396552991==
Content-Type: multipart/alternative; boundary="0000000000006df5db058d2dd6b3"

--0000000000006df5db058d2dd6b3
Content-Type: text/plain; charset="UTF-8"

I am in favor of removing the Xen blocking criteria as it has not received
the testing it needs and has been a source of conflict for several releases
in the past.

Geoff Marr
IRC: coremodule


On Mon, Jul 8, 2019 at 10:12 AM Adam Williamson <adamwill@fedoraproject.org>
wrote:

> On Tue, 2019-05-21 at 11:14 -0700, Adam Williamson wrote:
> > > > > > "The release must boot successfully as Xen DomU with releases
> providing
> > > > > > a functional, supported Xen Dom0 and widely used cloud providers
> > > > > > utilizing Xen."
> > > > > >
> > > > > > and change the 'milestone' for the test case -
> > > > > >
> https://fedoraproject.org/wiki/QA:Testcase_Boot_Methods_Xen_Para_Virt -
> > > > > > from Final to Optional.
> > > > > >
> > > > > > Thoughts? Comments? Thanks!
> > > > >
> > > > > I would prefer for it to remain as it is.
> > > >
> > > > This is only practical if it's going to be tested, and tested
> regularly
> > > > - not *only* on the final release candidate, right before we sign off
> > > > on the release. It needs to be tested regularly throughout the
> release
> > > > cycle, on the composes that are "nominated for testing".
> > >
> > > Would the proposal above work for you? I think it satisfies what you
> are
> > > looking for. We would also have someone who monitors these test results
> > > pro-actively.
> >
> > In theory, yeah, but given the history here I'm somewhat sceptical. I'd
> > also say we still haven't really got a convincing case for why we
> > should continue to block the release (at least in theory) on Fedora
> > working in Xen when we don't block on any other virt stack apart from
> > our 'official' one, and we don't block on all sorts of other stuff we'd
> > "like to have working" either. Regardless of the testing issues, I'd
> > like to see that too if we're going to keep blocking on Xen...
>
> So, this died here. As things stand: I proposed removing the Xen
> criterion, Lars opposed, we discussed the testing situation a bit, and
> I said overall I'm still inclined to remove the criterion because
> there's no clear justification for it for Fedora any more. Xen working
> (or rather, Fedora working on Xen) is just not a key requirement for
> Fedora at present, AFAICS.
>
> It's worth noting that at least part of the justification for the
> criterion in the first place was that Amazon was using Xen for EC2, but
> that is no longer the case, most if not all EC2 instance types no
> longer use Xen. Another consideration is that there was a time when KVM
> was still pretty new stuff and VirtualBox was not as popular as it is
> now, and Xen was still widely used for general hobbyist virtualization
> purposes; I don't believe that's really the case any more.
>
> So...with thanks to Lars / Xen Project for their input, I'm afraid I'm
> still in favor of this proposal, and still think we should drop the Xen
> criterion for F31. This wouldn't mean Xen is out of Fedora and we don't
> care about it any more, or anything like that; it would still be a part
> of Fedora and we still would like Xen to work on Fedora and Fedora to
> work on Xen, just like any other non-release-blocking package. It just
> means we would no longer block releases if it does not work.
>
> Anyone have further thoughts on this? Xen folks, do you object to this
> really strenuously? If so I guess we could take this to a higher/wider
> level for more input.
> --
> Adam Williamson
> Fedora QA Community Monkey
> IRC: adamw | Twitter: AdamW_Fedora | XMPP: adamw AT happyassassin . net
> http://www.happyassassin.net
> _______________________________________________
> test mailing list -- test@lists.fedoraproject.org
> To unsubscribe send an email to test-leave@lists.fedoraproject.org
> Fedora Code of Conduct:
> https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> List Archives:
> https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org
>

--0000000000006df5db058d2dd6b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am in favor of removing the Xen blocking criteria a=
s it has not received the testing it needs and has been a source of conflic=
t for several releases in the past.</div><div><br></div><div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Geoff Marr</div><div></div>IRC: coremodule<br></div></div>=
</div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 8, 2019 at 10:12 AM Adam Williamson &lt;<a href=
=3D"mailto:adamwill@fedoraproject.org">adamwill@fedoraproject.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 20=
19-05-21 at 11:14 -0700, Adam Williamson wrote:<br>
&gt; &gt; &gt; &gt; &gt; &quot;The release must boot successfully as Xen Do=
mU with releases providing<br>
&gt; &gt; &gt; &gt; &gt; a functional, supported Xen Dom0 and widely used c=
loud providers<br>
&gt; &gt; &gt; &gt; &gt; utilizing Xen.&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; and change the &#39;milestone&#39; for the test ca=
se -<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://fedoraproject.org/wiki/QA:Testc=
ase_Boot_Methods_Xen_Para_Virt" rel=3D"noreferrer" target=3D"_blank">https:=
//fedoraproject.org/wiki/QA:Testcase_Boot_Methods_Xen_Para_Virt</a> -<br>
&gt; &gt; &gt; &gt; &gt; from Final to Optional.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thoughts? Comments? Thanks!<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I would prefer for it to remain as it is.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This is only practical if it&#39;s going to be tested, and t=
ested regularly<br>
&gt; &gt; &gt; - not *only* on the final release candidate, right before we=
 sign off<br>
&gt; &gt; &gt; on the release. It needs to be tested regularly throughout t=
he release<br>
&gt; &gt; &gt; cycle, on the composes that are &quot;nominated for testing&=
quot;.<br>
&gt; &gt; <br>
&gt; &gt; Would the proposal above work for you? I think it satisfies what =
you are<br>
&gt; &gt; looking for. We would also have someone who monitors these test r=
esults<br>
&gt; &gt; pro-actively.<br>
&gt; <br>
&gt; In theory, yeah, but given the history here I&#39;m somewhat sceptical=
. I&#39;d<br>
&gt; also say we still haven&#39;t really got a convincing case for why we<=
br>
&gt; should continue to block the release (at least in theory) on Fedora<br=
>
&gt; working in Xen when we don&#39;t block on any other virt stack apart f=
rom<br>
&gt; our &#39;official&#39; one, and we don&#39;t block on all sorts of oth=
er stuff we&#39;d<br>
&gt; &quot;like to have working&quot; either. Regardless of the testing iss=
ues, I&#39;d<br>
&gt; like to see that too if we&#39;re going to keep blocking on Xen...<br>
<br>
So, this died here. As things stand: I proposed removing the Xen<br>
criterion, Lars opposed, we discussed the testing situation a bit, and<br>
I said overall I&#39;m still inclined to remove the criterion because<br>
there&#39;s no clear justification for it for Fedora any more. Xen working<=
br>
(or rather, Fedora working on Xen) is just not a key requirement for<br>
Fedora at present, AFAICS.<br>
<br>
It&#39;s worth noting that at least part of the justification for the<br>
criterion in the first place was that Amazon was using Xen for EC2, but<br>
that is no longer the case, most if not all EC2 instance types no<br>
longer use Xen. Another consideration is that there was a time when KVM<br>
was still pretty new stuff and VirtualBox was not as popular as it is<br>
now, and Xen was still widely used for general hobbyist virtualization<br>
purposes; I don&#39;t believe that&#39;s really the case any more.<br>
<br>
So...with thanks to Lars / Xen Project for their input, I&#39;m afraid I&#3=
9;m<br>
still in favor of this proposal, and still think we should drop the Xen<br>
criterion for F31. This wouldn&#39;t mean Xen is out of Fedora and we don&#=
39;t<br>
care about it any more, or anything like that; it would still be a part<br>
of Fedora and we still would like Xen to work on Fedora and Fedora to<br>
work on Xen, just like any other non-release-blocking package. It just<br>
means we would no longer block releases if it does not work.<br>
<br>
Anyone have further thoughts on this? Xen folks, do you object to this<br>
really strenuously? If so I guess we could take this to a higher/wider<br>
level for more input.<br>
-- <br>
Adam Williamson<br>
Fedora QA Community Monkey<br>
IRC: adamw | Twitter: AdamW_Fedora | XMPP: adamw AT happyassassin . net<br>
<a href=3D"http://www.happyassassin.net" rel=3D"noreferrer" target=3D"_blan=
k">http://www.happyassassin.net</a><br>
_______________________________________________<br>
test mailing list -- <a href=3D"mailto:test@lists.fedoraproject.org" target=
=3D"_blank">test@lists.fedoraproject.org</a><br>
To unsubscribe send an email to <a href=3D"mailto:test-leave@lists.fedorapr=
oject.org" target=3D"_blank">test-leave@lists.fedoraproject.org</a><br>
Fedora Code of Conduct: <a href=3D"https://docs.fedoraproject.org/en-US/pro=
ject/code-of-conduct/" rel=3D"noreferrer" target=3D"_blank">https://docs.fe=
doraproject.org/en-US/project/code-of-conduct/</a><br>
List Guidelines: <a href=3D"https://fedoraproject.org/wiki/Mailing_list_gui=
delines" rel=3D"noreferrer" target=3D"_blank">https://fedoraproject.org/wik=
i/Mailing_list_guidelines</a><br>
List Archives: <a href=3D"https://lists.fedoraproject.org/archives/list/tes=
t@lists.fedoraproject.org" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.fedoraproject.org/archives/list/test@lists.fedoraproject.org</a><br>
</blockquote></div>

--0000000000006df5db058d2dd6b3--


--===============7410215164396552991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7410215164396552991==--

