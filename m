Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B2784FB58
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 18:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678772.1056267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV7o-0004HO-6r; Fri, 09 Feb 2024 17:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678772.1056267; Fri, 09 Feb 2024 17:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV7o-0004Fs-3X; Fri, 09 Feb 2024 17:57:20 +0000
Received: by outflank-mailman (input) for mailman id 678772;
 Fri, 09 Feb 2024 17:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYV7m-0004Fm-Eb
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 17:57:18 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a976fcce-c774-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 18:57:17 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so1803494a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 09:57:17 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 fi11-20020a056402550b00b0056104738371sm951350edb.65.2024.02.09.09.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 09:57:15 -0800 (PST)
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
X-Inumbo-ID: a976fcce-c774-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501436; x=1708106236; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Jlz1d+vTDoRNkUP9lFNds5ZN+DZ59WWMyV4kqtOIRE=;
        b=CvdekzTGSGAA9DjFnsmkD35iPMNvL+y30UR7ZsJVfKmbjb7zpG/KqmW0YsGwWHMWy9
         xWOYeklaR0cJyI8UdGBsl23+jMHbrdnsv72KXp8eu5UpVNRVgVrBbErGId1SAIN0PrE1
         r/GKJ30XPWEn7WMpbBanvDLG0Emhd7VuQElBdlKX7QV39WEk3u1WQcoSo9vIQ7EUwDhp
         l925IOd/MjxsNEa0vttSjh17W97pO+1PmSpp05DCyRxYOYWC53xqifosqRDeEMvvcA9Y
         19ZRasmpuQiZlMhW5N4CsVKQD8T1vVp2JRBFADohCzhYouUB8ue/S2r8ZmeWIMgobzfh
         +e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501436; x=1708106236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Jlz1d+vTDoRNkUP9lFNds5ZN+DZ59WWMyV4kqtOIRE=;
        b=I84yx5XK4TgC+FOr3IpCDZ/vb6ZY3f7nCXCCetmr8uFWoTokTCUfIIxV5T1p9sUNNf
         ZmQ4AFmBy50emIpu/1gZd8fbxgYrDVyRgttcaWWDn/2PpyRdcpa40Gf2wn+ICa6iIQ51
         HRBN+LZWgCnFEfNy9joQxMdfVSy+BRd9zN23CJn3j5viyiSRdYNP+VX7OPhDUn5N4RKX
         cjWjQaNutAuqedEiasW+eAFBpllH754CwCyDKjErK/lDTMRcaZ/HKZ7lcLM7ufDzFjq7
         mc48MlrRzu2pG5khJ5kdqFGourmH3IWvVgVPVnFW2WIxWz+1S8TFMWrvPjzz8+fSnvVk
         0hLA==
X-Forwarded-Encrypted: i=1; AJvYcCX3dmWeF5K04cv8pwg3kbxbjmogTJT0s43aGcAlsTr3rPXO7zW05O6uMbgFSKkA6cgQb2FSb1YZ2rE/CGSpDWACXqUPkFJ8xCZhf4HFB3A=
X-Gm-Message-State: AOJu0YyMERpL3UVbt8WWBD8Se/D24SXgoJkXmX1/7Kx1XtjKnuUWioiH
	Uu02caegnk/iFu3RC64an4AvEmHoBWP1w4GcIkU6+iMY8UStJB/TqPNlwFfh
X-Google-Smtp-Source: AGHT+IHVjzmNsUoeIO9O/oSNeaqHZOR6tal36ZgZZ4RHHYDXpHVwaGM79oAVWFPNC5diqcqWTRiQng==
X-Received: by 2002:aa7:c35a:0:b0:561:2711:68cd with SMTP id j26-20020aa7c35a000000b00561271168cdmr1966085edr.3.1707501436108;
        Fri, 09 Feb 2024 09:57:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULGPQtV3ONfFXgBrfTjNZlITToognPUNgvyOzVb/BsGnZA4YW2AyOwZ5mKptSgQZEq7O0hok+OdcX/PI+gcbSs3cO5mFplgLTg4K3Z4Q+CNNLTYh75LrMz7SN2uRCkE2aUAaOS+CfOarIzHcQQycTfKDEzpUk58HblbO+ZGlY2HsTQRfXlEg==
Message-ID: <189af0b744223de054d06962e3a86d3c0955f084.camel@gmail.com>
Subject: Re: Xen 4.19 release status tracking list
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 09 Feb 2024 18:57:14 +0100
In-Reply-To: <7799755f-fad2-4f73-a2c1-de97bcce95fa@suse.com>
References: 
	<CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
	 <7799755f-fad2-4f73-a2c1-de97bcce95fa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-06 at 10:24 +0100, Jan Beulich wrote:
> On 05.02.2024 20:23, Oleksii Kurochko wrote:
> > Hello everyone,
> >=20
> > I would like to share with you a list for status tracking based on
> > Xen ML:
> >=20
> > Arm:
> > =C2=A0 * [PATCH v5 00/13] Arm cache coloring [
> > https://lore.kernel.org/xen-devel/20240102095138.17933-1-carlo.nonato@m=
inervasys.tech/
> > ]
> > =C2=A0 * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code
> > (idmap)
> > so it is self-contained [
> > https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org=
/
> > ]
> > =C2=A0 * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
> > https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hild=
ebrand@amd.com/
> > ]
> >=20
> > PPC:
> > =C2=A0 *=C2=A0 [PATCH v2 0/7] Early Boot Allocation on Power [
> > https://lore.kernel.org/xen-devel/cover.1702607884.git.sanastasio@rapto=
rengineering.com/
> > ]
> >=20
> > RISC-V:
> > =C2=A0 *=C2=A0 [PATCH v4 00/30]=C2=A0 Enable build of full Xen for RISC=
-V [
> > https://lore.kernel.org/xen-devel/cover.1707146506.git.oleksii.kurochko=
@gmail.com/
> > ]
> >=20
> > x86:
> > =C2=A0 * [PATCH 0/4] iommu/x86: fixes/improvements for unity range
> > checks [
> > https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citr=
ix.com/
> > ]
> > =C2=A0 * [PATCH 0/8] x86: support AVX10.1 [
> > https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@=
suse.com/
> > ]
> > =C2=A0 * [PATCH v13 00/35] x86: enable FRED for x86-64 [
> > https://lore.kernel.org/xen-devel/20231205105030.8698-1-xin3.li@intel.c=
om/
> > ]
>=20
> This is a kernel series. I don't expect FRED support is in scope for
> 4.19.
Thanks, overlooked that. I will drop it in the next status tracking
mail.

>=20
> > =C2=A0 * [PATCH v4 0/8] x86emul: misc additions
> > https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@=
suse.com/
> > =C2=A0 * [PATCH 0/7] VT-d: SATC handling and ATS tidying [
> > https://lore.kernel.org/xen-devel/25506838-b818-4686-8c16-3a198338af44@=
suse.com/
> > ]
> > =C2=A0 * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
> > https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3=
mdeb.com/
> > ]
> > =C2=A0 * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors
> > plus
> > fallout [
> > https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@=
suse.com/
> > ]
> >=20
> > common:
> > =C2=A0 * annotate entry points with type and size" series [
> > https://lore.kernel.org/xen-devel/5e74a501-2824-42af-804b-47b515aa9bcf@=
suse.com/
> > ]
>=20
> The bulk of this has gone in, but there'll want to be follow-ups.
>=20
> > =C2=A0 * [PATCH v2 0/8] limit passing around of cpu_user_regs [
> > https://lore.kernel.org/xen-devel/33db57a2-b569-4fa8-b0b0-36ea92528d7b@=
suse.com/
> > ]
> > =C2=A0 * [PATCH v2 (resend) 00/27] Remove the directmap [
> > https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazo=
n.com/
> > ]
> > =C2=A0 * [PATCH v4 00/32] tools: enable xenstore-stubdom to use 9pfs [
> > https://lore.kernel.org/xen-devel/20240205105001.24171-1-jgross@suse.co=
m/
> > ]
> > =C2=A0 * [PATCH v7 0/7] Introduce generic headers [
> > https://lore.kernel.org/xen-devel/cover.1706281994.git.oleksii.kurochko=
@gmail.com/
> > ]
> > =C2=A0 * [PATCH] move __read_mostly to xen/cache.h
> > [
> > https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@=
suse.com
> > /]
> > =C2=A0 * [PATCH v2] NUMA: no need for asm/numa.h when !NUMA [
> > https://lore.kernel.org/xen-devel/94cffa48-5e31-4557-827d-c6dec6031d05@=
suse.com/
> > ]
>=20
> This went in already.
I just pulled staging today, so missed that it was merged.

>=20
> > =C2=A0 * [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() =
[
> > https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340d=
c84.1706259490.git.federico.serafini@bugseng.com/
> > ]
> > =C2=A0 * [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
> > ASSERT_UNREACHABLE() to xen/bug.h [
> > https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f039642596519814=
03b.1706897023.git.oleksii.kurochko@gmail.com/
> > ]
> > =C2=A0 * [PATCH] xen/lib: introduce generic find next bit operations [
> > https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda2014=
47b.1706266854.git.oleksii.kurochko@gmail.com/
> > ]
> >=20
> > Please reply with items you would like to see in 4.19 so that
> > people
> > know what is happening and prioritize accordingly.
>=20
> Beyond (on x86) AVX10 I'd like to see whether we can also make some
> progress towards supporting APX. That'll be quite a bit of work,
> though,
> including quite a bit of reviews that are likely to end up on the
> backburner (as has been commonly happening for, especially, more
> involved emulator changes).
>=20
> Jan


