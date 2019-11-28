Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC9A10CE7C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 19:24:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaOPV-0003it-Ee; Thu, 28 Nov 2019 18:21:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWZv=ZU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iaOPT-0003im-VT
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 18:21:00 +0000
X-Inumbo-ID: d3c0cb14-120b-11ea-a55d-bc764e2007e4
Received: from mail-il1-x12a.google.com (unknown [2607:f8b0:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3c0cb14-120b-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 18:20:59 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id y16so17383866iln.0;
 Thu, 28 Nov 2019 10:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=0xiLckWEvZYaYgs12VkwyEzfWMBUsfYaTUG8oheFVjg=;
 b=GHL1+E5WHHKFmEUnhuHehEiHaxat2j53zQgYxHnKgx3nm6M5qp8Aett7k3YjDipnoC
 efvVpptHCcHjhzyp4PF8K0L4W4BS4VSfJ/NDaxEoqMsxhZjY08Zhv0SwwO0jHkedRurv
 Z65A2dqo/PJBH96loho49CpzwO9c25sdwcV9HG1P0sHdjyIfGrQZ5BFxA9aWcqNnnalX
 V0xT26Om1V2Sx+Tj0VC1RoaF9NOHSkBtwq7m+e+QZGHxhwMJuyuA+HO+aNr7vR5qWUu0
 0rhyzLv37oQLO85LBx9uNsbUMGCiWC3M7DEI3rGEG1JQVrnS6hDbOOfyZ6PZ5INeEeUb
 rBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=0xiLckWEvZYaYgs12VkwyEzfWMBUsfYaTUG8oheFVjg=;
 b=Nk7OXu5MQwTVVBK+WZgefSAuFsUUkOLZDqrl9N/OOj+S/wFQ9y49wXX6KVIN3QtKah
 Jyz0SKm0vdpr6+43jim2B9QvTn3P0K8NAGEq3WJEQJitwXk5z+6x6eLhQnzSTXceBW2C
 i7E/eNdPZQqkT3EWUtNyMc737+qIajWWxrTQPvcWPeFUiIBatV7+UdXh9M1+fofNmaeo
 2mz/Lvc69BApq/XID+1AJi07iydFnwD0vwPe2dQ87R1j91uU+vRtAU+M4gpdk8GFOqGY
 zbofI0bHyW79fJtxwo4BF+2hrcf5bA8Cry9QdJP7TS4Z4bGPPTyzBtdM+Pin8kD2EIMz
 59XQ==
X-Gm-Message-State: APjAAAW+MgnoyoeVmdzQWUWRCQ3zZwYuzVSJXCWesCDwELQsyn8pdUGN
 XyqCIn1eYltyD1UUz13HXFeVyQAw
X-Google-Smtp-Source: APXvYqxkIphacg14IGKuEq0t+X4WySWUVREcKzIiQtQM/2C6hv9ADij512RHfKUaW7LPtc45DtFLbw==
X-Received: by 2002:a92:d351:: with SMTP id a17mr51858856ilh.231.1574965258996; 
 Thu, 28 Nov 2019 10:20:58 -0800 (PST)
Received: from [100.64.73.55] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id t88sm1925675ill.51.2019.11.28.10.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 10:20:58 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 28 Nov 2019 13:20:57 -0500
Message-Id: <6DC58DC2-5F2F-4496-A0F5-A91F11FD931B@gmail.com>
References: <BE78F496-8B9C-490F-A500-204E3305C950@citrix.com>
In-Reply-To: <BE78F496-8B9C-490F-A500-204E3305C950@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
X-Mailer: iPhone Mail (17B111)
Subject: Re: [Xen-devel] [MirageOS-devel] [PATCH v2 4/6] Add Code Review
 Guide
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2699561490558165841=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2699561490558165841==
Content-Type: multipart/alternative; boundary=Apple-Mail-6DF36A48-D61F-4E31-B9CE-03DC73CAF014
Content-Transfer-Encoding: 7bit


--Apple-Mail-6DF36A48-D61F-4E31-B9CE-03DC73CAF014
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Nov 28, 2019, at 09:05, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> =EF=BB=BFOn 28/11/2019, 07:37, "Jan Beulich" <jbeulich@suse.com> wrote:
>=20
>>    On 28.11.2019 14:06, Lars Kurth wrote:
>> I can certainly add something on the timing , along the lines of
>> * For complex series, consider the time it takes to do reviews (maybe wit=
h a guide of LOC per hour) and give reviewers enough time to
>> * For series with design issues or large questions, try and highlight the=
 key open issues in cover letters clearly and solicit feedback from key main=
tainers who can comment on the open issue. The idea is to save both the cont=
ributor and the reviewers time by focussing on what needs to be resolved=20
>> * Don=E2=80=99t repost a series, unless all review comments are addressed=

>> or the reviewers asked you to do so. The problem with this is that
>> this is somewhat in conflict with the "let's focus on the core
>> issues and not get distracted by details early on in a review cycle".
>> In other words, this can only work, if reviewers focus on major
>> issues in early reviews only and do not focus on style, coding
>> standards, etc.
>=20
>    But this doesn't make much sense either, because then full re-reviews
>    need to happen anyway on later versions, to also deal with the minor
>    issues. For RFC kind of series omitting style and alike feedback
>    certainly makes sense, but as soon as a patch is non-RFC, it should
>    be considered good to go in by the submitter.
>=20
> OK, I think we have a disconnect between ideal and reality.=20
>=20
> I see two issues today
> * Key maintainers don't always review RFC series [they end up at the botto=
m of the priority list, even though spending time on RFCs will save time els=
ewhere later]. So the effect is that then the contributor assumes there are n=
o major issues and ends it as a proper series
> * In practice what has happened often in the past is that design, architec=
ture, assumption flaws are found in early versions of a series.
>   - This usually happens because of an oversight or because there was no d=
esign discussion prior to the series being posted and agreed
>   - Common sense would dictate that the biggest benefit for both the revie=
wer, the contributor and the community as a whole would be to try and focus o=
n such flaws and leave everything aside
>   - Of course there may be value in doing a detailed reviews of such a ser=
ies as there may be bits that are unaffected by such a flaw
>   - But there will likely be parts which are not: doing a detailed review o=
f such portions wastes everyone's time
>=20
> So coming back to your point. Ideally, it would be nice if we had the capa=
bility to call out parts of a series as "problematic" and treating such part=
s differently.

We may be able to reuse some "Shift Left" terminology, including citations o=
f previous Xen code reviews to illustrate categories of design issues that c=
an be shifted left:

  https://devopedia.org/shift-left

Rich


--Apple-Mail-6DF36A48-D61F-4E31-B9CE-03DC73CAF014
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Nov 28, 2019, at 09:05,=
 Lars Kurth &lt;lars.kurth@citrix.com&gt; wrote:</div><div dir=3D"ltr"><bloc=
kquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div d=
ir=3D"ltr"><span>=EF=BB=BFOn 28/11/2019, 07:37, "Jan Beulich" &lt;jbeulich@s=
use.com&gt; wrote:</span><br><span></span><br><span> &nbsp;&nbsp;&nbsp;On 28=
.11.2019 14:06, Lars Kurth wrote:</span><br><blockquote type=3D"cite"><span>=
I can certainly add something on the timing , along the lines of</span><br><=
/blockquote><blockquote type=3D"cite"><span>* For complex series, consider t=
he time it takes to do reviews (maybe with a guide of LOC per hour) and give=
 reviewers enough time to</span><br></blockquote><blockquote type=3D"cite"><=
span>* For series with design issues or large questions, try and highlight t=
he key open issues in cover letters clearly and solicit feedback from key ma=
intainers who can comment on the open issue. The idea is to save both the co=
ntributor and the reviewers time by focussing on what needs to be resolved <=
/span><br></blockquote><blockquote type=3D"cite"><span>* Don=E2=80=99t repos=
t a series, unless all review comments are addressed</span><br></blockquote>=
<blockquote type=3D"cite"><span>or the reviewers asked you to do so. The pro=
blem with this is that</span><br></blockquote><blockquote type=3D"cite"><spa=
n>this is somewhat in conflict with the "let's focus on the core</span><br><=
/blockquote><blockquote type=3D"cite"><span>issues and not get distracted by=
 details early on in a review cycle".</span><br></blockquote><blockquote typ=
e=3D"cite"><span>In other words, this can only work, if reviewers focus on m=
ajor</span><br></blockquote><blockquote type=3D"cite"><span>issues in early r=
eviews only and do not focus on style, coding</span><br></blockquote><blockq=
uote type=3D"cite"><span>standards, etc.</span><br></blockquote><span></span=
><br><span> &nbsp;&nbsp;&nbsp;But this doesn't make much sense either, becau=
se then full re-reviews</span><br><span> &nbsp;&nbsp;&nbsp;need to happen an=
yway on later versions, to also deal with the minor</span><br><span> &nbsp;&=
nbsp;&nbsp;issues. For RFC kind of series omitting style and alike feedback<=
/span><br><span> &nbsp;&nbsp;&nbsp;certainly makes sense, but as soon as a p=
atch is non-RFC, it should</span><br><span> &nbsp;&nbsp;&nbsp;be considered g=
ood to go in by the submitter.</span><br><span></span><br><span>OK, I think w=
e have a disconnect between ideal and reality. </span><br><span></span><br><=
span>I see two issues today</span><br><span>* Key maintainers don't always r=
eview RFC series [they end up at the bottom of the priority list, even thoug=
h spending time on RFCs will save time elsewhere later]. So the effect is th=
at then the contributor assumes there are no major issues and ends it as a p=
roper series</span><br><span>* In practice what has happened often in the pa=
st is that design, architecture, assumption flaws are found in early version=
s of a series.</span><br><span> &nbsp;&nbsp;- This usually happens because o=
f an oversight or because there was no design discussion prior to the series=
 being posted and agreed</span><br><span> &nbsp;&nbsp;- Common sense would d=
ictate that the biggest benefit for both the reviewer, the contributor and t=
he community as a whole would be to try and focus on such flaws and leave ev=
erything aside</span><br><span> &nbsp;&nbsp;- Of course there may be value i=
n doing a detailed reviews of such a series as there may be bits that are un=
affected by such a flaw</span><br><span> &nbsp;&nbsp;- But there will likely=
 be parts which are not: doing a detailed review of such portions wastes eve=
ryone's time</span><br><span></span><br><span>So coming back to your point. I=
deally, it would be nice if we had the capability to call out parts of a ser=
ies as "problematic" and treating such parts differently.</span><br></div></=
blockquote><div><br></div><div>We may be able to reuse some "Shift Left" ter=
minology, including citations of previous Xen code reviews to illustrate cat=
egories of design issues that can be shifted left:</div><div><br></div><div>=
&nbsp;&nbsp;<a href=3D"https://devopedia.org/shift-left">https://devopedia.o=
rg/shift-left</a></div><div><br></div><div>Rich</div><div><br></div></body><=
/html>=

--Apple-Mail-6DF36A48-D61F-4E31-B9CE-03DC73CAF014--


--===============2699561490558165841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2699561490558165841==--

