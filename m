Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE281914AB2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746562.1153656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLj1o-0002pl-0c; Mon, 24 Jun 2024 12:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746562.1153656; Mon, 24 Jun 2024 12:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLj1n-0002nx-Tw; Mon, 24 Jun 2024 12:42:35 +0000
Received: by outflank-mailman (input) for mailman id 746562;
 Mon, 24 Jun 2024 12:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfmV=N2=gmail.com=sherrellbc@srs-se1.protection.inumbo.net>)
 id 1sLj0R-0002m5-Vw
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:41:12 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07defd4a-3227-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:41:09 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-796df041d73so290771685a.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:41:09 -0700 (PDT)
Received: from smtpclient.apple (ool-44c00bfa.dyn.optonline.net.
 [68.192.11.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce8b4b38sm310240685a.45.2024.06.24.05.41.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2024 05:41:07 -0700 (PDT)
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
X-Inumbo-ID: 07defd4a-3227-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719232868; x=1719837668; darn=lists.xenproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwRbpV2rQzCgu1iVPcIDYgw25xymsgeZ9bLZT5Ai6js=;
        b=W4lYnq5wH5ZF2R2dtUyO08I4N7I16/+ME2BY62M3ZQro6FraWJmlZygmVhozVCvMTs
         ZlfQSWid78JZLbYq0orY2MnlN8FCK5PtgepRC6dFamcsVJn1TJTZ/0VE8UyCZtabSgfD
         /o0lgmnKqg2YUd2OlxF3cumwFTmUvSRg/HWWnVS/SIkbbto9eOuVgfZhyCfsZy/9ugnv
         l4KqN233jhJzVT/SHKf4IM5LfFz4AIBKl3Sc2u+9LAQycVydYBXmyJ8RdhzTwdvCPIAs
         knhqR3Ng0WcBZA8l+U9SZHseOUsODwx4SKUthOhT9mztOjBi0m/f0TVL07gGiyQmigz1
         gmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232868; x=1719837668;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwRbpV2rQzCgu1iVPcIDYgw25xymsgeZ9bLZT5Ai6js=;
        b=e5/e7tYka9Z3kaTFKY02i0Q1Vupp0BmffPJkJTNozVa7RAGXTFfgEGCyIg/RBRAxE/
         SprKTr7kzCsSLJH49Ik/6Ob9cjBQRm3vcemdQN5aiFtnNnqiEs0tvLRMVYs/UCfZj/wd
         Z9rORAAPNrQPWD1/lBj7kHCc28L9S5a/YjZ5zWUO42B7y0lBF1a+H2TSkEO26jkI7j1S
         EoDyHKK5UUUifz71da2dMqBLus+8Khvad72JgOrV8+aq8IyYGslLydEtqPYIebE3SGzU
         dajLxDROnGNAHOkn28pmgrevF0gHanR6q2oRq2BlOfYIKKNZMmWiuwWZB0/Oj9IQnV6S
         8Luw==
X-Forwarded-Encrypted: i=1; AJvYcCWANqkSeewZkzsg8wU3QU+XLaNUOHjLOnaXtsjhCgsCTXKst2Sw9Lhzpx8uTHawFolR6e5NQa2WzAcQ20XYd+nw/1dXB/WxLgCRmL/AutA=
X-Gm-Message-State: AOJu0Yzlx6RC1tFtJ0shUL0N8D0x2RrYCBktzZeVBskGgrtb3wjRiTDO
	1dAbA6Y7b4ju7gESdTMzk5UAp9meTnebjA4t/XteZJuCZsZQ3vxw
X-Google-Smtp-Source: AGHT+IGimLktMge4+kQ9LtViHT5gUtbraY4xfRhGiRB+Rmzm9EmmOj+8GOt3JUtYhlh6fn9bJdtoXA==
X-Received: by 2002:a05:620a:4708:b0:795:5efe:e85 with SMTP id af79cd13be357-79be44963d8mr563050985a.0.1719232868059;
        Mon, 24 Jun 2024 05:41:08 -0700 (PDT)
From: Branden Sherrell <sherrellbc@gmail.com>
Message-Id: <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E4286BFD-732C-486E-9381-1DBCB2C9C036"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: E820 memory allocation issue on Threadripper platforms
Date: Mon, 24 Jun 2024 08:40:56 -0400
In-Reply-To: <ZafOGEwms01OFaVJ@macbook>
Cc: Jan Beulich <jbeulich@suse.com>,
 Patrick Plenefisch <simonpatp@gmail.com>,
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com> <ZafOGEwms01OFaVJ@macbook>
X-Mailer: Apple Mail (2.3731.700.6)


--Apple-Mail=_E4286BFD-732C-486E-9381-1DBCB2C9C036
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi all,

I recently found this mailing list thread when searching for information =
on a related issue regarding conflicting E820 on a Threadripper =
platform. For those interested in additional data points, I am using the =
ASUS WRX80E-SAGE SE Wifi II motherboard that presents the following E820 =
to Xen:

(XEN) EFI RAM map:
(XEN)  [0000000000000000, 0000000000000fff] (reserved)
(XEN)  [0000000000001000, 000000000008ffff] (usable)
(XEN)  [0000000000090000, 0000000000090fff] (reserved)
(XEN)  [0000000000091000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 0000000003ffffff] (usable)
(XEN)  [0000000004000000, 0000000004020fff] (ACPI NVS)
(XEN)  [0000000004021000, 0000000009df1fff] (usable)
(XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
(XEN)  [000000000a000000, 00000000b5b04fff] (usable)
(XEN)  [00000000b5b05000, 00000000b8cd3fff] (reserved)
(XEN)  [00000000b8cd4000, 00000000b9064fff] (ACPI data)
(XEN)  [00000000b9065000, 00000000b942afff] (ACPI NVS)
(XEN)  [00000000b942b000, 00000000bb1fefff] (reserved)
(XEN)  [00000000bb1ff000, 00000000bbffffff] (usable)
(XEN)  [00000000bc000000, 00000000bfffffff] (reserved)
(XEN)  [00000000c1100000, 00000000c1100fff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000f1280000, 00000000f1280fff] (reserved)
(XEN)  [00000000f2200000, 00000000f22fffff] (reserved)
(XEN)  [00000000f2380000, 00000000f2380fff] (reserved)
(XEN)  [00000000f2400000, 00000000f24fffff] (reserved)
(XEN)  [00000000f3680000, 00000000f3680fff] (reserved)
(XEN)  [00000000fea00000, 00000000feafffff] (reserved)
(XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
(XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
(XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
(XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
(XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
(XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
(XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
(XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000703f0fffff] (usable)
(XEN)  [000000703f100000, 000000703fffffff] (reserved)

And of course the default physical link address of the x86_64 kernel is =
16MiB which clearly conflicts with the EfiACPIMemoryNVS memory starting =
at 0x4000000. On latest Debian (12.5.0, bookworm) the decompressed =
kernel is more than 60MiB, so it obviously overflows into the adjacent =
region. I can also confirm that loading the Debian kernel at 2MiB also =
works as expected. Debian is also built with CONFIG_RELOCATABLE=3Dy, so =
it should be capable of being loaded with this new feature in Xen.=20

I see the link at this ticket was implemented and committed (dfc9fab0) =
on April 8, 2024 but it appears to not have made its way into the latest =
(4.18) Xen release. Though there seem to be more recent commits cherry =
picked into that branch. When is this fix expected to make it into a =
release?

Branden.

> On Jan 17, 2024, at 7:54 AM, Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com> wrote:
>=20
> On Wed, Jan 17, 2024 at 11:40:20AM +0100, Jan Beulich wrote:
>> On 17.01.2024 11:13, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Jan 17, 2024 at 09:46:27AM +0100, Jan Beulich wrote:
>>>> Whereas I assume the native kernel can deal with that as long as
>>>> it's built with CONFIG_RELOCATABLE=3Dy. I don't think we want to
>>>> get into the business of interpreting the kernel's internal
>>>> representation of the relocations needed, so it's not really
>>>> clear to me what we might do in such a case. Perhaps the only way
>>>> is to signal to the kernel that it needs to apply relocations
>>>> itself (which in turn would require the kernel to signal to us
>>>> that it's capable of doing so). Cc-ing Roger in case he has any
>>>> neat idea.
>>>=20
>>> Hm, no, not really.
>>>=20
>>> We could do like multiboot2: the kernel provides us with some
>>> placement data (min/max addresses, alignment), and Xen let's the
>>> kernel deal with relocations itself.
>>=20
>> Requiring the kernel's entry point to take a sufficiently different
>> flow then compared to how it's today, I expect.
>=20
> Indeed, I would expect that.
>=20
>>> Additionally we could support the kernel providing a section with =
the
>>> relocations and apply them from Xen, but that's likely hm, =
complicated
>>> at best, as I don't even know which kinds of relocations we would =
have
>>> to support.
>>=20
>> If the kernel was properly linked to a PIE, there'd generally be only
>> one kind of relocation (per arch) that ought to need dealing with -
>> for x86-64 that's R_X86_64_RELATIVE iirc. Hence why (I suppose) they
>> don't use ELF relocation structures (for being wastefully large), but
>> rather a more compact custom representation. Even without building =
PIE
>> (presumably in part not possible because of how per-CPU data needs
>> dealing with), they get away with handling just very few relocs (and
>> from looking at the reloc processing code I'm getting the impression
>> they mistreat R_X86_64_32 as being the same as R_X86_64_32S, when it
>> isn't; needing to get such quirks right is one more aspect of why I
>> think we should leave relocation handling to the kernel).
>=20
> Would have to look into more detail, but I think leaving any relocs
> for the OS to perform would be my initial approach.
>=20
>>> I'm not sure how Linux deals with this in the bare metal case, are
>>> relocations done after decompressing and before jumping into the =
entry
>>> point?
>>=20
>> That's how it was last time I looked, yes.
>=20
> I've created a gitlab ticket for it:
>=20
> https://gitlab.com/xen-project/xen/-/issues/180
>=20
> So that we don't forget, as I don't have time to work into this right
> now, but I think it's important enough that we don't forget.
>=20
> For PV it's a bit more unclear how we want to deal with it, as it's
> IMO a specific Linux behavior that makes it fail to boot.
>=20
> Roger.
>=20
>=20


--Apple-Mail=_E4286BFD-732C-486E-9381-1DBCB2C9C036
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
all,<div><br></div><div><div>I recently found this mailing list thread =
when searching for information on a related issue regarding conflicting =
E820 on a Threadripper platform. For those interested in additional data =
points, I am using the ASUS WRX80E-SAGE SE Wifi II motherboard that =
presents the following E820 to Xen:</div><div><br></div><div><div><font =
face=3D"Courier New">(XEN) EFI RAM map:</font></div><div><font =
face=3D"Courier New">(XEN) &nbsp;[0000000000000000, 0000000000000fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000000001000, 000000000008ffff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000000090000, 0000000000090fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000000091000, 000000000009ffff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000000a0000, 00000000000fffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000000100000, 0000000003ffffff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000004000000, 0000000004020fff] (ACPI =
NVS)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000004021000, 0000000009df1fff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000009df2000, 0000000009ffffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[000000000a000000, 00000000b5b04fff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000b5b05000, 00000000b8cd3fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000b8cd4000, 00000000b9064fff] (ACPI =
data)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000b9065000, 00000000b942afff] (ACPI =
NVS)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000b942b000, 00000000bb1fefff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000bb1ff000, 00000000bbffffff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000bc000000, 00000000bfffffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000c1100000, 00000000c1100fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000e0000000, 00000000efffffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000f1280000, 00000000f1280fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000f2200000, 00000000f22fffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000f2380000, 00000000f2380fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000f2400000, 00000000f24fffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000f3680000, 00000000f3680fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fea00000, 00000000feafffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fec00000, 00000000fec00fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fec10000, 00000000fec10fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fed00000, 00000000fed00fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fed40000, 00000000fed44fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fed80000, 00000000fed8ffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fedc2000, 00000000fedcffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000fedd4000, 00000000fedd5fff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[00000000ff000000, 00000000ffffffff] =
(reserved)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[0000000100000000, 000000703f0fffff] =
(usable)</font></div><div><font face=3D"Courier New">(XEN) =
&nbsp;[000000703f100000, 000000703fffffff] =
(reserved)</font></div></div><div><br></div><div>And of course the =
default physical link address of the x86_64 kernel is 16MiB which =
clearly conflicts with the EfiACPIMemoryNVS memory starting at =
0x4000000. On latest Debian (12.5.0, bookworm) the decompressed kernel =
is more than 60MiB, so it obviously overflows into the adjacent region. =
I can also confirm that loading the Debian kernel at 2MiB also works as =
expected. Debian is also built with CONFIG_RELOCATABLE=3Dy, so it should =
be capable of being loaded with this new feature in =
Xen.&nbsp;</div><div><br></div><div>I see the link at this ticket was =
implemented and committed (dfc9fab0) on April 8, 2024 but it appears to =
not have made its way into the latest (4.18) Xen release. Though there =
seem to be more recent commits cherry picked into that branch. When is =
this fix expected to make it into a =
release?</div><div><br></div><div>Branden.</div><div><br></div><div><block=
quote type=3D"cite"><div>On Jan 17, 2024, at 7:54 AM, Roger Pau Monn=C3=A9=
 &lt;roger.pau@citrix.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>On Wed, Jan 17, 2024 at =
11:40:20AM +0100, Jan Beulich wrote:<br><blockquote type=3D"cite">On =
17.01.2024 11:13, Roger Pau Monn=C3=A9 wrote:<br><blockquote =
type=3D"cite">On Wed, Jan 17, 2024 at 09:46:27AM +0100, Jan Beulich =
wrote:<br><blockquote type=3D"cite">Whereas I assume the native kernel =
can deal with that as long as<br>it's built with CONFIG_RELOCATABLE=3Dy. =
I don't think we want to<br>get into the business of interpreting the =
kernel's internal<br>representation of the relocations needed, so it's =
not really<br>clear to me what we might do in such a case. Perhaps the =
only way<br>is to signal to the kernel that it needs to apply =
relocations<br>itself (which in turn would require the kernel to signal =
to us<br>that it's capable of doing so). Cc-ing Roger in case he has =
any<br>neat idea.<br></blockquote><br>Hm, no, not really.<br><br>We =
could do like multiboot2: the kernel provides us with some<br>placement =
data (min/max addresses, alignment), and Xen let's the<br>kernel deal =
with relocations itself.<br></blockquote><br>Requiring the kernel's =
entry point to take a sufficiently different<br>flow then compared to =
how it's today, I expect.<br></blockquote><br>Indeed, I would expect =
that.<br><br><blockquote type=3D"cite"><blockquote =
type=3D"cite">Additionally we could support the kernel providing a =
section with the<br>relocations and apply them from Xen, but that's =
likely hm, complicated<br>at best, as I don't even know which kinds of =
relocations we would have<br>to support.<br></blockquote><br>If the =
kernel was properly linked to a PIE, there'd generally be only<br>one =
kind of relocation (per arch) that ought to need dealing with -<br>for =
x86-64 that's R_X86_64_RELATIVE iirc. Hence why (I suppose) =
they<br>don't use ELF relocation structures (for being wastefully =
large), but<br>rather a more compact custom representation. Even without =
building PIE<br>(presumably in part not possible because of how per-CPU =
data needs<br>dealing with), they get away with handling just very few =
relocs (and<br>from looking at the reloc processing code I'm getting the =
impression<br>they mistreat R_X86_64_32 as being the same as =
R_X86_64_32S, when it<br>isn't; needing to get such quirks right is one =
more aspect of why I<br>think we should leave relocation handling to the =
kernel).<br></blockquote><br>Would have to look into more detail, but I =
think leaving any relocs<br>for the OS to perform would be my initial =
approach.<br><br><blockquote type=3D"cite"><blockquote type=3D"cite">I'm =
not sure how Linux deals with this in the bare metal case, =
are<br>relocations done after decompressing and before jumping into the =
entry<br>point?<br></blockquote><br>That's how it was last time I =
looked, yes.<br></blockquote><br>I've created a gitlab ticket for =
it:<br><br>https://gitlab.com/xen-project/xen/-/issues/180<br><br>So =
that we don't forget, as I don't have time to work into this =
right<br>now, but I think it's important enough that we don't =
forget.<br><br>For PV it's a bit more unclear how we want to deal with =
it, as it's<br>IMO a specific Linux behavior that makes it fail to =
boot.<br><br>Roger.<br><br><br></div></div></blockquote></div><br></div></=
body></html>=

--Apple-Mail=_E4286BFD-732C-486E-9381-1DBCB2C9C036--

