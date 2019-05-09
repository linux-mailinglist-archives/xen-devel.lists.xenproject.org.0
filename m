Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E21C18A77
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOiuU-0003Ln-TA; Thu, 09 May 2019 13:16:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BjuZ=TJ=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hOiuT-0003Lf-44
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:16:29 +0000
X-Inumbo-ID: a725833c-725c-11e9-8980-bc764e045a96
Received: from mail-vs1-xe34.google.com (unknown [2607:f8b0:4864:20::e34])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a725833c-725c-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:16:28 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id d128so1356281vsc.10
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=EweQujW1AeaYfKptwIpVQmi/OKlwLhO1IGlEEK2gVCg=;
 b=ADJpCme1egLhwdMud15IlteNB3xAhrUVhcDvXw1SoW+RS7AFDQj6JDg+4jpcyw98Xo
 9+XE6y4xgJSST5WbSrROPxrysUMmHsKNvE1cdsrLN6yyACwqToqLFq6YeQaY++Dnvp/e
 b93oIvhPBdrvEMd89lxtLUGyvyAjqrpiq9xU2+nTLL5F+ankIJ7RQtitS3pVYPjY7RN/
 UHS/XkQKuthgEyhPhyDjcK+vQ2urMG1ymQsO/bRm1zs4H4SHSUBuC9cbvF4ULsmbrjBJ
 vEkn9k5e0Z+HWfiYqAtkzAFsjUkOmdJio9ke6o64/4Syqwij69bUFPPcTemCUy7DYOMm
 +Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=EweQujW1AeaYfKptwIpVQmi/OKlwLhO1IGlEEK2gVCg=;
 b=VJpp8k0tvIp9qnvEGXUDFhI19jmyXFu0ujANP9AP4tJuWDdk7zKACefdbY2n9u0TN0
 0WSSQDJE9rJzIGvXf8OVf4dJTRBBdOVExSz4kMK46ZDNMxUGQPsUibw5cNgtTqrKqkcm
 Gf7nLh0W+A3vLR576gDB9ZOLr3GwLVYqaUb1w8BlwFntAQvVFsBHw65g2T7OBIwLkyWP
 qV6ew3QBjxtyI5CSy828OANmbCPZFlL9LcTdfKA6lK4QZGUx1g7UW5to6mTkFcpekQkC
 atS90zmzNv/BXPZOgPw95qkthm+RGn7Acuo7Rqqkl2q3NQemISnjVDv5NFtynFHwqXij
 A2Cw==
X-Gm-Message-State: APjAAAVfzgujikhHR4iEUrbO1A7HDjE/MXeg03M+2o2+nIEeFQ0nOs1n
 LUeq+RaNRzImpCoVobU7PTI=
X-Google-Smtp-Source: APXvYqw+opq+03TDVO7H+nnHLnrKSFiTypMBPjQJrVp+dV6m9IfBseA2rpxTF9LwaV2YGKaCS2rltA==
X-Received: by 2002:a05:6102:119:: with SMTP id
 z25mr2251339vsq.145.1557407786944; 
 Thu, 09 May 2019 06:16:26 -0700 (PDT)
Received: from [192.168.0.100] (ip133-193-64-186.ct.co.cr. [186.64.193.133])
 by smtp.gmail.com with ESMTPSA id a65sm783905vsd.27.2019.05.09.06.16.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 06:16:25 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <C8D81918-6E6C-4F96-8A6A-AFA48EB77E78@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Thu, 9 May 2019 07:16:14 -0600
In-Reply-To: <8927E5C8-E0F5-449C-A9E3-8E5602B431C1@gmail.com>
To: "Woods, Brian" <Brian.Woods@amd.com>
References: <3BB17B7E-8CC6-4CEE-9A6C-1AA68EB503F3@xenproject.org>
 <20190506151138.GA27876@amd.com>
 <8927E5C8-E0F5-449C-A9E3-8E5602B431C1@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen Project Community Call May 9th
 @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "Natarajan,
 Janakarajan" <Janakarajan.Natarajan@amd.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Rich Persaud <persaur@gmail.com>, "Ji, John" <john.ji@intel.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1799270314185285433=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1799270314185285433==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5821D389-D0FF-4B5B-A78A-E6AE6900B472"


--Apple-Mail=_5821D389-D0FF-4B5B-A78A-E6AE6900B472
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I added these to the agenda =
https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVEnnySHJw_=
7Jk8k/edit# =
<https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVEnnySHJw=
_7Jk8k/edit#>
Feel free to add to it
Lars

> On 6 May 2019, at 09:23, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>=20
>=20
>=20
>> On 6 May 2019, at 09:11, Woods, Brian <Brian.Woods@amd.com =
<mailto:Brian.Woods@amd.com>> wrote:
>>=20
>> On Mon, May 06, 2019 at 07:51:17AM -0600, Lars Kurth wrote:
>>> [CAUTION: External Email]
>>>=20
>>> Hi all,
>>>=20
>>> Please propose topics by either editing the running agenda document =
at =
https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVEnnySHJw_=
7Jk8k/edit# =
<https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVEnnySHJw=
_7Jk8k/edit#> or by replying to the mail. Ideally by Wednesday!
>>>=20
>>> Best Regards
>>> Lars
>>>=20
>>=20
>> I'd like to add the AMD mwait V2 patch set to the list of topics.  =
I'd
>> like to come to some sort of conclusion about that set.
>>=20
>=20
> I would like to add an item related to "[Xen-devel] Criteria / =
validation proposal: drop Xen" which raises some questions about =
testing. More details to follow
>=20
> Lars


--Apple-Mail=_5821D389-D0FF-4B5B-A78A-E6AE6900B472
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">I =
added these to the agenda&nbsp;<a =
href=3D"https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVE=
nnySHJw_7Jk8k/edit#" =
class=3D"">https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12=
lVEnnySHJw_7Jk8k/edit#</a><div class=3D"">Feel free to add to =
it</div><div class=3D"">Lars<br class=3D""><div><br class=3D""><blockquote=
 type=3D"cite" class=3D""><div class=3D"">On 6 May 2019, at 09:23, Lars =
Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"Apple-interchange-newline"><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 6 May 2019, at 09:11, Woods, =
Brian &lt;<a href=3D"mailto:Brian.Woods@amd.com" =
class=3D"">Brian.Woods@amd.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Mon, May 06, 2019 at 07:51:17AM -0600, Lars Kurth wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">[CAUTION: External =
Email]<br class=3D""><br class=3D"">Hi all,<br class=3D""><br =
class=3D"">Please propose topics by either editing the running agenda =
document at<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVE=
nnySHJw_7Jk8k/edit#" =
class=3D"">https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12=
lVEnnySHJw_7Jk8k/edit#</a><span =
class=3D"Apple-converted-space">&nbsp;</span>or by replying to the mail. =
Ideally by Wednesday!<br class=3D""><br class=3D"">Best Regards<br =
class=3D"">Lars<br class=3D""><br class=3D""></blockquote><br =
class=3D"">I'd like to add the AMD mwait V2 patch set to the list of =
topics. &nbsp;I'd<br class=3D"">like to come to some sort of conclusion =
about that set.<br class=3D""><br class=3D""></div></div></blockquote><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">I would like to add an item related to "<font =
color=3D"#454545" face=3D"Helvetica Neue" class=3D"">[Xen-devel] =
Criteria / validation proposal: drop Xen" which raises some questions =
about testing. More&nbsp;<span class=3D"" style=3D"caret-color: rgb(69, =
69, 69);">details</span>&nbsp;to follow</font></div><div =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><font =
color=3D"#454545" face=3D"Helvetica Neue" class=3D""><br =
class=3D""></font></div><div style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><font color=3D"#454545" =
face=3D"Helvetica Neue" =
class=3D"">Lars</font></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_5821D389-D0FF-4B5B-A78A-E6AE6900B472--


--===============1799270314185285433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1799270314185285433==--

