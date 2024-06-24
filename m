Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637B914DED
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 15:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746610.1153716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjQW-0000zn-6R; Mon, 24 Jun 2024 13:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746610.1153716; Mon, 24 Jun 2024 13:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjQW-0000yI-3j; Mon, 24 Jun 2024 13:08:08 +0000
Received: by outflank-mailman (input) for mailman id 746610;
 Mon, 24 Jun 2024 13:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfmV=N2=gmail.com=sherrellbc@srs-se1.protection.inumbo.net>)
 id 1sLjQU-0000yC-J3
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 13:08:06 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad0cbd6-322a-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 15:08:04 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso2090124e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 06:08:04 -0700 (PDT)
Received: from smtpclient.apple (ool-44c00bfa.dyn.optonline.net.
 [68.192.11.250]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd7079478sm975700e87.153.2024.06.24.06.08.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:08:03 -0700 (PDT)
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
X-Inumbo-ID: cad0cbd6-322a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719234484; x=1719839284; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaImPSD+fr5dNaDJYiyxLTEg3pmGswuvprA97nXdlgM=;
        b=M4Ionv4/aSqLb8M/j6uubIsxxDMTXiHeJ9n7bk04OwO8aCcYrBAacAMRLG3FDrvAJk
         Knxxq4P2ltaC7f2etqZzyoCduZ1pXT3uWVgLmcbR0A3YuJNhtnbDK36q6gcJS7JAbbKA
         OIFBw2JxCzYI/TrQy/EuUNn2Sv5+VhLw/VnGmdWzWXMwErPCUKwZe9PiMRUmOst1X5Sv
         EU3ov2QWZOpvpnEFrynbHkrSGD3Mwpw1LX2JzyWByOAkUk0WeoRlInpSz8AzOrTjk/XL
         gWnpVn4H3kSm+DgkPeqZvSTG89OgZrsYQyHHx2+WyJbSvOcfYDbXDg/UX6fMlg5rziH3
         CmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234484; x=1719839284;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaImPSD+fr5dNaDJYiyxLTEg3pmGswuvprA97nXdlgM=;
        b=q1OX7x/B0Ra0ztcYh8hOVzFOqkaquTvO8NpmUITKUr3Rv/1jRDJlxrGOpJYzKrF07P
         eTDmYoWisSTubxSqDS9qFGw5i4e/Gmr4/gSAd/6nOIS3mcCabB5DKWnCEJQMd4bO5QKI
         +Czcay7em6Dgldr90Kh8DDHa8L15U/xzSoX5V2PSIF0QocOfO0ledjZBBh8+jsvgBCYs
         mLihgKeHyY8YP+2gVXcWC6PMlIGBFFVoRz9dSA/uEMXoRYDzNGdm35VYk+Z/xWZDhqwZ
         aBEa6T7/vnf9PjSltrNkEgVa2APpjvuIsSu5rgDtHUf1SdtdknA+Iz1ni+calXGzRF5+
         OQjA==
X-Forwarded-Encrypted: i=1; AJvYcCWUwcChr/8/BtyEGYo1RuHlukMX27XCxRU/xfVpD13LKyZtHdtwbkNc1Z1Ua9FW4JonhGPZnt9Xu3KPum+uSPCBbh6YieNr/0itsKbEQIY=
X-Gm-Message-State: AOJu0YxxQaS5adyMq93Jmq2UBjQ4HmudxK5lNGA0j9rjyzwEd0OKiwFy
	Va9Qd7HQaI4VM3X3jYvceQVhOckHFW+XAFTw1sE3jD56KiHOrBel
X-Google-Smtp-Source: AGHT+IGWsosdnzZIQKcgPioiBpaOZTG0ngxrR1dqJjGzQOBpuARYuraiwqYhJpdYU2BILaHAWZAdzw==
X-Received: by 2002:ac2:4a9e:0:b0:52c:a070:944 with SMTP id 2adb3069b0e04-52cdf15afc9mr1599880e87.23.1719234483674;
        Mon, 24 Jun 2024 06:08:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: E820 memory allocation issue on Threadripper platforms
From: Branden Sherrell <sherrellbc@gmail.com>
In-Reply-To: <36d581a0-f144-4756-b345-8b74ccc25c74@suse.com>
Date: Mon, 24 Jun 2024 09:07:50 -0400
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <70B65B5D-C075-4D8E-8D2B-08A1930EE68B@gmail.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com> <ZafOGEwms01OFaVJ@macbook>
 <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
 <36d581a0-f144-4756-b345-8b74ccc25c74@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3731.700.6)

What is the reasoning that this fix be applied only to PVH domains? =
Taking a look at the fix logic it appears to walk the E820 to find a =
suitable range of memory to load the kernel into (assuming it can be =
determined that the kernel is also relocatable). Why can this logic not =
be applied to dom0 kernel load in general?

Branden.

> On Jun 24, 2024, at 8:54 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.06.2024 14:40, Branden Sherrell wrote:
>> I recently found this mailing list thread when searching for =
information on a related issue regarding conflicting E820 on a =
Threadripper platform. For those interested in additional data points, I =
am using the ASUS WRX80E-SAGE SE Wifi II motherboard that presents the =
following E820 to Xen:
>>=20
>> (XEN) EFI RAM map:
>> (XEN)  [0000000000000000, 0000000000000fff] (reserved)
>> (XEN)  [0000000000001000, 000000000008ffff] (usable)
>> (XEN)  [0000000000090000, 0000000000090fff] (reserved)
>> (XEN)  [0000000000091000, 000000000009ffff] (usable)
>> (XEN)  [00000000000a0000, 00000000000fffff] (reserved)
>> (XEN)  [0000000000100000, 0000000003ffffff] (usable)
>> (XEN)  [0000000004000000, 0000000004020fff] (ACPI NVS)
>> (XEN)  [0000000004021000, 0000000009df1fff] (usable)
>> (XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
>> (XEN)  [000000000a000000, 00000000b5b04fff] (usable)
>> (XEN)  [00000000b5b05000, 00000000b8cd3fff] (reserved)
>> (XEN)  [00000000b8cd4000, 00000000b9064fff] (ACPI data)
>> (XEN)  [00000000b9065000, 00000000b942afff] (ACPI NVS)
>> (XEN)  [00000000b942b000, 00000000bb1fefff] (reserved)
>> (XEN)  [00000000bb1ff000, 00000000bbffffff] (usable)
>> (XEN)  [00000000bc000000, 00000000bfffffff] (reserved)
>> (XEN)  [00000000c1100000, 00000000c1100fff] (reserved)
>> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
>> (XEN)  [00000000f1280000, 00000000f1280fff] (reserved)
>> (XEN)  [00000000f2200000, 00000000f22fffff] (reserved)
>> (XEN)  [00000000f2380000, 00000000f2380fff] (reserved)
>> (XEN)  [00000000f2400000, 00000000f24fffff] (reserved)
>> (XEN)  [00000000f3680000, 00000000f3680fff] (reserved)
>> (XEN)  [00000000fea00000, 00000000feafffff] (reserved)
>> (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
>> (XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
>> (XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
>> (XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
>> (XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
>> (XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
>> (XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
>> (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
>> (XEN)  [0000000100000000, 000000703f0fffff] (usable)
>> (XEN)  [000000703f100000, 000000703fffffff] (reserved)
>>=20
>> And of course the default physical link address of the x86_64 kernel =
is 16MiB which clearly conflicts with the EfiACPIMemoryNVS memory =
starting at 0x4000000. On latest Debian (12.5.0, bookworm) the =
decompressed kernel is more than 60MiB, so it obviously overflows into =
the adjacent region. I can also confirm that loading the Debian kernel =
at 2MiB also works as expected. Debian is also built with =
CONFIG_RELOCATABLE=3Dy, so it should be capable of being loaded with =
this new feature in Xen.=20
>>=20
>> I see the link at this ticket was implemented and committed =
(dfc9fab0) on April 8, 2024 but it appears to not have made its way into =
the latest (4.18) Xen release. Though there seem to be more recent =
commits cherry picked into that branch. When is this fix expected to =
make it into a release?
>=20
> It's not tagged as a bugfix, and PVH Dom0 also isn't "supported" in =
4.18.
> Hence it wasn't picked into the set of backports. I also doubt it'll =
help
> you, as I would guess you're still using PV Dom0.
>=20
> Jan


