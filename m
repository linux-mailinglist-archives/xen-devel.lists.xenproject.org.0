Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007C1501F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfT8-0007B4-BE; Mon, 06 May 2019 15:23:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9nwL=TG=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hNfT7-0007Az-Dn
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:23:53 +0000
X-Inumbo-ID: f444c1ae-7012-11e9-843c-bc764e045a96
Received: from mail-ua1-x930.google.com (unknown [2607:f8b0:4864:20::930])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f444c1ae-7012-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:23:52 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id l17so4796113uar.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=ageicZly5tXwffaYQGSaCOVfE7LtgHjx5I4KBOHlSIE=;
 b=NW2+9c1n4EqfiAsQa2f6R9JgjS2mGNWVK5mNT4v4gUU9DzM6KBpA36TM5klDHoJnQh
 tLafdodRWJNjvdtJHj6cknGNLzJCYU6Kgkv2vg6ij6P6zuD/H6izbwKdeRTrTq82esUr
 eI9RmNL87F7NqGxO7X2rNww7O7jKbQhBvpJ6bFwgs4D1gzfvb9sdJzHf+VWLrC/AShWw
 QsB1kA5YdjVQkAYL6hdp4v3syD5vvVzK4n40/qgFiCxhdMcICeNKM2DpuUjFhm4Zxfaf
 srrcNe+s2DwTWhW/4P26SYbOv/sIdc1C3edcenkkCtV9QOCCitqTm8+hN1oO2cgLGY8s
 4TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=ageicZly5tXwffaYQGSaCOVfE7LtgHjx5I4KBOHlSIE=;
 b=n6k3VWpjRyWwLTh00ztq8/q4YL+GbLF6BybcS4qRk5jemoKV9vQauyMvD+niiRYXKM
 8fwcQGRsSMEuea3OeRX9JxbKxXcy7W1432gZlaplb9l3HBYk+KADr5BQd5wNtoocl1GI
 Zgi2F7MrVI+oZgMjPDuk61CNSES42W1nBD2xmesRAFawiJBGr33GavgEn5wmTRpAxKkR
 BUA5PZBLN03sJZEKu+wkHPUpQf/gPQJ9bFOemdAHV3NMSkHUgdVMa2q3zM5qqG/jaijE
 dRMH8zd/RU8faUNDpqnXvusiTCnhDQL4xbcJvhdfZM1kvyEtN1ToUs/xNqpsFGhB6YTC
 DhXg==
X-Gm-Message-State: APjAAAVKXPw7xnxen/pSt8xMdE718hOChHePW0f+YnkROThJu/V8SpsE
 PqeW9STT0FmhkMI37NJfHPY=
X-Google-Smtp-Source: APXvYqzugmKmp5TcRfhjJt+eBclSNP2On+XV/SP2b59tZZ8eAsVx5wHJULiIaUF5NrFTrzr1znz1vA==
X-Received: by 2002:ab0:304c:: with SMTP id x12mr12894967ual.128.1557156231044; 
 Mon, 06 May 2019 08:23:51 -0700 (PDT)
Received: from [10.0.1.38] ([152.231.170.171])
 by smtp.gmail.com with ESMTPSA id 2sm10841618vke.27.2019.05.06.08.23.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 08:23:50 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <8927E5C8-E0F5-449C-A9E3-8E5602B431C1@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 6 May 2019 09:23:44 -0600
In-Reply-To: <20190506151138.GA27876@amd.com>
To: "Woods, Brian" <Brian.Woods@amd.com>
References: <3BB17B7E-8CC6-4CEE-9A6C-1AA68EB503F3@xenproject.org>
 <20190506151138.GA27876@amd.com>
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
Content-Type: multipart/mixed; boundary="===============4016543746764483135=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4016543746764483135==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1A705D9A-D871-4F89-A45D-A2AF4ADAE0A2"


--Apple-Mail=_1A705D9A-D871-4F89-A45D-A2AF4ADAE0A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 6 May 2019, at 09:11, Woods, Brian <Brian.Woods@amd.com> wrote:
>=20
> On Mon, May 06, 2019 at 07:51:17AM -0600, Lars Kurth wrote:
>> [CAUTION: External Email]
>>=20
>> Hi all,
>>=20
>> Please propose topics by either editing the running agenda document =
at =
https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVEnnySHJw_=
7Jk8k/edit# or by replying to the mail. Ideally by Wednesday!
>>=20
>> Best Regards
>> Lars
>>=20
>=20
> I'd like to add the AMD mwait V2 patch set to the list of topics.  I'd
> like to come to some sort of conclusion about that set.
>=20

I would like to add an item related to "[Xen-devel] Criteria / =
validation proposal: drop Xen" which raises some questions about =
testing. More details to follow

Lars


--Apple-Mail=_1A705D9A-D871-4F89-A45D-A2AF4ADAE0A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 6 May 2019, at 09:11, Woods, Brian &lt;<a =
href=3D"mailto:Brian.Woods@amd.com" class=3D"">Brian.Woods@amd.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">On Mon, May 06, 2019 at 07:51:17AM -0600, Lars Kurth =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">[CAUTION: =
External Email]<br class=3D""><br class=3D"">Hi all,<br class=3D""><br =
class=3D"">Please propose topics by either editing the running agenda =
document at <a =
href=3D"https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12lVE=
nnySHJw_7Jk8k/edit#" =
class=3D"">https://docs.google.com/document/d/1ktN-5u8uScEvhf9N8Um5o6poF12=
lVEnnySHJw_7Jk8k/edit#</a> or by replying to the mail. Ideally by =
Wednesday!<br class=3D""><br class=3D"">Best Regards<br class=3D"">Lars<br=
 class=3D""><br class=3D""></blockquote><br class=3D"">I'd like to add =
the AMD mwait V2 patch set to the list of topics. &nbsp;I'd<br =
class=3D"">like to come to some sort of conclusion about that set.<br =
class=3D""><br class=3D""></div></div></blockquote><br =
class=3D""></div><div>I would like to add an item related to "<font =
color=3D"#454545" face=3D"Helvetica Neue" class=3D"">[Xen-devel] =
Criteria / validation proposal: drop Xen" which raises some questions =
about testing. More&nbsp;<span style=3D"caret-color: rgb(69, 69, 69);" =
class=3D"">details</span>&nbsp;to follow</font></div><div><font =
color=3D"#454545" face=3D"Helvetica Neue" class=3D""><br =
class=3D""></font></div><div><font color=3D"#454545" face=3D"Helvetica =
Neue" class=3D"">Lars</font></div><br class=3D""></body></html>=

--Apple-Mail=_1A705D9A-D871-4F89-A45D-A2AF4ADAE0A2--


--===============4016543746764483135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4016543746764483135==--

