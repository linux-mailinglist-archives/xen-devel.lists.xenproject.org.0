Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DF1377D8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 21:21:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq0jP-0006pV-FC; Fri, 10 Jan 2020 20:18:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ROV9=27=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1iq0jN-0006oy-5H
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 20:18:05 +0000
X-Inumbo-ID: 4e40d72a-33e6-11ea-b89f-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e40d72a-33e6-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 20:18:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so3013681wrq.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2020 12:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Qtjt/NhCsGYkrLGpy50uZzbnlh7WQcz8E/+0UPXUtl4=;
 b=WZfnURxkkglpl4UgN7IJ6E4lXYs99UOMXLHl8KY0boiV3q2xsNCyvXtNWDyAEFyIB7
 qSpRBm8Dm9ou13KHD9VGBylQvKRlMqnoTVRC6ZLC5Oydfh9moK15upVbsEazTzeVkF2H
 R872/DNq/6kwNDSUbjj7FyunbDrOcVv5six1pXw2ObrSa5SgBk0Z/O5zO5ADV7Xqm2RW
 o2akQ0mXMrGCGZukMB96nQdoTqyJzSoyNFOTsOZpMcvIQqpQ2KwZhnwxywOlYQ/jlZXH
 kkkoY0CWv6Gm54iCzaqn9LDUS1BsC+EOJ14BM1R/JSpXJwhcGNLJai4lxoro5p5K5N8c
 fsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Qtjt/NhCsGYkrLGpy50uZzbnlh7WQcz8E/+0UPXUtl4=;
 b=VI0UFQw7qBBP65JjT8pVpNSYHIektej53egQ4KTV4hPMiPBI5kcjuvypTDLEsQ6sPo
 Tg1vnx/QanfgvODuFpVDCtW2OEneOi5F3LQBdVDnNlsB1XOigHcIdl0JpiM1XvnmJWXQ
 tZlKNfuCrRYWh5AMEimHO6JCGgR21pdFVxIYk1GzDzfSQIZt57pGI9rYc/aLsrGQhR73
 OFuxopAgCE7oZsB7VI5XnYenbdH8QsDbt7+XwHphZutikNiCbXxEOGqVMmGLxyOV2JHf
 qPAwHqXQdY7uC+22bEUp2WzgJYZPeOke1az0jydQ88ZfKS3pDrvHqVVA+KmBRbfZoK3Z
 hpmg==
X-Gm-Message-State: APjAAAXwDskhZCHTzvqPKuBPns+sCPPlMp26xqWvi9H5Wgp6Zd3IOaM5
 2Rf5P1zA+oa/AP0tgJOzH88=
X-Google-Smtp-Source: APXvYqyNp96yebhjsqdKWXFWD7XQXt26bvAB/fQAfiCvD2+2WEE+MUU542cNmRxEeVfXCdqrXuC4PA==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr5233260wrn.50.1578687482863; 
 Fri, 10 Jan 2020 12:18:02 -0800 (PST)
Received: from ?IPv6:2a02:c7f:ac73:9500:bc0a:7758:470e:db30?
 ([2a02:c7f:ac73:9500:bc0a:7758:470e:db30])
 by smtp.gmail.com with ESMTPSA id q3sm3305816wmj.38.2020.01.10.12.18.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 12:18:02 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <CC483690-ACCF-4AF7-B84C-7A98E6CD489E@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Fri, 10 Jan 2020 20:18:01 +0000
In-Reply-To: <d2182056-4695-8f7f-2142-db6717e06d52@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200110091238.845-1-pdurrant@amazon.com>
 <d2182056-4695-8f7f-2142-db6717e06d52@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH] Introduce CHANGELOG.md
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2837409652382602439=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2837409652382602439==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3E1DDC38-E22C-452E-8BF8-5B8DBCEE74D0"


--Apple-Mail=_3E1DDC38-E22C-452E-8BF8-5B8DBCEE74D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 10 Jan 2020, at 17:54, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 10/01/2020 09:12, Paul Durrant wrote:
>> As agreed during the 2020-01 community call [1] this patch introduces =
a
>> changelog, based on the principles explained at keepachangelog.com =
[2].
>> A new MAINTAINERS entry is also added, with myself as (currently =
sole)
>> maintainer.
>>=20
>> [1] See C.2 at =
https://cryptpad.fr/pad/#/2/pad/edit/ERZtMYD5j6k0sv-NG6Htl-AJ/
>> [2] https://keepachangelog.com/en/1.0.0/
>>=20
>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: George Dunlap <George.Dunlap@eu.citrix.com>
>> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Wei Liu <wl@xen.org>
>> Cc: Lars Kurth <lars.kurth@citrix.com>
>>=20
>> Should there be other maintainers apart from myself (with my RM hat =
on)?
>> Perhaps Lars should also be added as a designated reviewer?
>=20
> Ultimately, the committers are last line of judgement on "whether this
> change should be in the changelog".  Practically, that includes "The
> Rest", but there was an objection to that on the call IIRC.

Am happy to be added

Lars


--Apple-Mail=_3E1DDC38-E22C-452E-8BF8-5B8DBCEE74D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 10 Jan 2020, at 17:54, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 10/01/2020 =
09:12, Paul Durrant wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">As agreed during the 2020-01 =
community call [1] this patch introduces a<br class=3D"">changelog, =
based on the principles explained at <a href=3D"http://keepachangelog.com"=
 class=3D"">keepachangelog.com</a> [2].<br class=3D"">A new MAINTAINERS =
entry is also added, with myself as (currently sole)<br =
class=3D"">maintainer.<br class=3D""><br class=3D"">[1] See C.2 at <a =
href=3D"https://cryptpad.fr/pad/#/2/pad/edit/ERZtMYD5j6k0sv-NG6Htl-AJ/" =
class=3D"">https://cryptpad.fr/pad/#/2/pad/edit/ERZtMYD5j6k0sv-NG6Htl-AJ/<=
/a><br class=3D"">[2] <a href=3D"https://keepachangelog.com/en/1.0.0/" =
class=3D"">https://keepachangelog.com/en/1.0.0/</a><br class=3D""><br =
class=3D"">Signed-off-by: Paul Durrant &lt;<a =
href=3D"mailto:pdurrant@amazon.com" =
class=3D"">pdurrant@amazon.com</a>&gt;<br class=3D"">---<br class=3D"">Cc:=
 Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt;<br class=3D"">Cc: George =
Dunlap &lt;<a href=3D"mailto:George.Dunlap@eu.citrix.com" =
class=3D"">George.Dunlap@eu.citrix.com</a>&gt;<br class=3D"">Cc: Ian =
Jackson &lt;<a href=3D"mailto:ian.jackson@eu.citrix.com" =
class=3D"">ian.jackson@eu.citrix.com</a>&gt;<br class=3D"">Cc: Jan =
Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" =
class=3D"">jbeulich@suse.com</a>&gt;<br class=3D"">Cc: Julien Grall =
&lt;<a href=3D"mailto:julien@xen.org" class=3D"">julien@xen.org</a>&gt;<br=
 class=3D"">Cc: Konrad Rzeszutek Wilk &lt;<a =
href=3D"mailto:konrad.wilk@oracle.com" =
class=3D"">konrad.wilk@oracle.com</a>&gt;<br class=3D"">Cc: Stefano =
Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt;<br class=3D"">Cc: Wei Liu =
&lt;<a href=3D"mailto:wl@xen.org" class=3D"">wl@xen.org</a>&gt;<br =
class=3D"">Cc: Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.com" =
class=3D"">lars.kurth@citrix.com</a>&gt;<br class=3D""><br =
class=3D"">Should there be other maintainers apart from myself (with my =
RM hat on)?<br class=3D"">Perhaps Lars should also be added as a =
designated reviewer?<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Ultimately, the committers are last line of judgement on =
"whether this</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">change should =
be in the changelog".&nbsp; Practically, that includes "The</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Rest", but =
there was an objection to that on the call IIRC.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Am happy =
to be added</div><div><br class=3D""></div><div>Lars</div><br =
class=3D""></body></html>=

--Apple-Mail=_3E1DDC38-E22C-452E-8BF8-5B8DBCEE74D0--


--===============2837409652382602439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2837409652382602439==--

