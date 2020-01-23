Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D051474F6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 00:46:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ium8t-0002v9-DE; Thu, 23 Jan 2020 23:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x6SD=3M=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ium8r-0002ux-To
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 23:44:05 +0000
X-Inumbo-ID: 3d78b558-3e3a-11ea-8e9a-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d78b558-3e3a-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 23:44:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so5312495wrr.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=/osCR5xbrhQrSYpSdCZdyHs6kMLrW6pl/I8p3x162Bk=;
 b=IBQE0/tAt8tUOZmYr6rJlvLKej3T/hYPU/nrogdFSd7SxYFpwjBJJnO0CRVaLVPVoE
 3B0aAf8ct8hqeKXzyEVR4iO0I+GME2KpQpwgupMNJ6WRQlxKp9fx2rrQBNmpEGRrB9B3
 DbmCi+1ww+L/fMRtSJqr4lMdbAgzMAl6NOFl39BQi9sNctSqw3neFm8yocOOiZt+AYDr
 m62tAPl2mRLT3M/dzWxvjwViVgn/0/ty4PIU+zSqaa+wRH+VaTWI2RwELmJ87tsveJUi
 rZDkmWaaL0V8BXh8bTC5uDfAtsN36NnsNsoSb6r8Mwt224UvUWdtJnC9bxoOEdVaxMnc
 /5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=/osCR5xbrhQrSYpSdCZdyHs6kMLrW6pl/I8p3x162Bk=;
 b=lWdi7zv/BzoDD2p1fszIFu5W6SOKFT+UWwyEOy038QGMkkSR170uIceZKWRTb97wdD
 YWwJs3f1Nz63hp/zfO3vcj55hRqc4EdpvWxxiMMbFvxp5JtL5SmE29ohahKpRJpp0iIB
 j+V9w7hP3YGQ5p7C5GDDs/7yhw0NnEY5AXd7nCrL7E8GIgx8IA+hhkm2Kz1S5FUFs4Ml
 hrYgXK8bnF9AaBXHB8WagzPxEebrvAI3DnvhmLXhEHCVh2/YTyFP7cEu+nPExH5pEbQ7
 XiEiDkB0SYd+NTEIJPuUpV8yjjewRX9rw2PauaQpKlk9ddnP6aMPfsuexG00wggRdyGj
 Q5Jg==
X-Gm-Message-State: APjAAAWG7GNlrzwfkfW3FtPkDM7KFCd8aIkeYxj4J6DmHHRuuX6idvgp
 lWDCn4iGkLcmQZD9svZopYk=
X-Google-Smtp-Source: APXvYqxQgHd3mwP8QNeeuM0JTIaGHJuoQthfi6OJThYgbZD7XV32l3vzy7hHEPRCC3xCAFtBDmJoMw==
X-Received: by 2002:adf:f605:: with SMTP id t5mr570122wrp.282.1579823044011;
 Thu, 23 Jan 2020 15:44:04 -0800 (PST)
Received: from ?IPv6:2a02:c7f:ac73:9500:11b9:2588:8cfb:7b97?
 ([2a02:c7f:ac73:9500:11b9:2588:8cfb:7b97])
 by smtp.gmail.com with ESMTPSA id e6sm5376371wru.44.2020.01.23.15.44.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 15:44:03 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <Lars.Kurth.Xen@gmail.com>
Message-Id: <C265D0DF-EFAD-4415-9578-1B992A2CC473@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Date: Thu, 23 Jan 2020 23:44:02 +0000
In-Reply-To: <20200123053136.GC6612@bobbye-pc>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
 <052081D4-2F9F-401A-A6F6-8A9CDC1069AC@xenproject.org>
 <20200123053136.GC6612@bobbye-pc>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1462324643767753584=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1462324643767753584==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1EB1AD2D-F300-4ADC-BA26-237B13F27D83"


--Apple-Mail=_1EB1AD2D-F300-4ADC-BA26-237B13F27D83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 23 Jan 2020, at 05:31, Bobby Eshleman <bobbyeshleman@gmail.com> =
wrote:
>=20
> On Wed, Jan 22, 2020 at 04:27:39PM +0000, Lars Kurth wrote:
>>=20
>> You should also leverage the developer summit: see =
https://events.linuxfoundation.org/xen-summit/program/cfp/ =
<https://events.linuxfoundation.org/xen-summit/program/cfp/>
>> CfP closes March 6th. Design sessions can be submitted afterwards
>>=20
>> Community calls may also be a good option to deal with specific =
issues / questions, e.g. around compile support in the CI, etc.
>>=20
>> Lars
>>=20
>=20
> That's a really good idea.  I'll submit as I do think I can get there =
if accepted.  Thanks for the tip on
> community calls, I did not realize Xen did those!
>=20
> -Bobby

If you add your name/email address to =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/ =
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/> I will =
CC you on the next invite
They are usually the 1st Thursday of each month=20
Past minutes can be found at =
https://cryptpad.fr/drive/#/2/drive/edit/uZ1UjYxICjse+XlJrXrIwZXN/
Lars=

--Apple-Mail=_1EB1AD2D-F300-4ADC-BA26-237B13F27D83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 23 Jan 2020, at 05:31, Bobby Eshleman &lt;<a =
href=3D"mailto:bobbyeshleman@gmail.com" =
class=3D"">bobbyeshleman@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Wed, Jan 22, 2020 at 04:27:39PM +0000, Lars Kurth wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">You =
should also leverage the developer summit: see <a =
href=3D"https://events.linuxfoundation.org/xen-summit/program/cfp/" =
class=3D"">https://events.linuxfoundation.org/xen-summit/program/cfp/</a> =
&lt;<a href=3D"https://events.linuxfoundation.org/xen-summit/program/cfp/"=
 =
class=3D"">https://events.linuxfoundation.org/xen-summit/program/cfp/</a>&=
gt;<br class=3D"">CfP closes March 6th. Design sessions can be submitted =
afterwards<br class=3D""><br class=3D"">Community calls may also be a =
good option to deal with specific issues / questions, e.g. around =
compile support in the CI, etc.<br class=3D""><br class=3D"">Lars<br =
class=3D""><br class=3D""></blockquote><br class=3D"">That's a really =
good idea. &nbsp;I'll submit as I do think I can get there if accepted. =
&nbsp;Thanks for the tip on<br class=3D"">community calls, I did not =
realize Xen did those!<br class=3D""><br class=3D"">-Bobby<br =
class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D"">If you add your name/email address to&nbsp;<a =
href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" =
class=3D"">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/<=
/a>&nbsp;I will CC you on the next invite</div><div class=3D"">They are =
usually the 1st Thursday of each month&nbsp;</div><div class=3D"">Past =
minutes can be found at&nbsp;<a =
href=3D"https://cryptpad.fr/drive/#/2/drive/edit/uZ1UjYxICjse+XlJrXrIwZXN/=
" =
class=3D"">https://cryptpad.fr/drive/#/2/drive/edit/uZ1UjYxICjse+XlJrXrIwZ=
XN/</a></div><div class=3D"">Lars</div></body></html>=

--Apple-Mail=_1EB1AD2D-F300-4ADC-BA26-237B13F27D83--


--===============1462324643767753584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1462324643767753584==--

