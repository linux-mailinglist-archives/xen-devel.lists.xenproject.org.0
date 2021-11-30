Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4349462D34
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 07:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234855.407546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrx4J-0007db-MC; Tue, 30 Nov 2021 06:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234855.407546; Tue, 30 Nov 2021 06:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrx4J-0007br-Ge; Tue, 30 Nov 2021 06:56:47 +0000
Received: by outflank-mailman (input) for mailman id 234855;
 Tue, 30 Nov 2021 06:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MWZz=QR=cimware.in=skiran@srs-se1.protection.inumbo.net>)
 id 1mrwyI-0007Wf-J0
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 06:50:34 +0000
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee59690-51a9-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 07:50:31 +0100 (CET)
Received: by mail-io1-xd2e.google.com with SMTP id p23so24746569iod.7
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 22:50:31 -0800 (PST)
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
X-Inumbo-ID: cee59690-51a9-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cimware-in.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=VL2FUFBXugsy0WcPMaDIfQxWV6VDcsAR7KBynFdDLK0=;
        b=f3JiwL0HIhsFcEvegwqBBfMfsME6D2I737UopNAv2kAlOFXHgbyNQggK5mv7RDZWGJ
         uE3UxuMVuIDRhSHfmgja1+tGbO+/XEozdkOdi2+TU8UuCYZtH3xErPI3znT1LX0Vju6e
         o4hVRW7hFCRIOu3d4JQf/crBhHg8yIddtEJ2JthgaSux/9GyTFvQ1HF6fKBdY9xnAPu+
         n3vTA1IwVl7BtMtuJBerFCDfEZ1JfyoXgvZqPeBXkHdVqsNSt3etGxbvoOnYGFPRzeoo
         dTrRRpf+Jbnh+QIqkUnq9amalkuyHxfwqFo7YLpki+gnaM6zhDS+zzVGq81HNnPU9Mib
         ZWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VL2FUFBXugsy0WcPMaDIfQxWV6VDcsAR7KBynFdDLK0=;
        b=V/cbghxWXwRsT/R7zUKqXZ5msI1Xv3HD2pSKfzvblDgw+a6v2du2zOYnB2P0YlzzhL
         2OLUZ+NxiPZWY+I3Xd+KEWljSwPxombsI3z8uYhXiTBnble0Q3KZUmXtsTdpPKQ+JGgW
         J4dIQfVwUdVQ2jUGz9K3JgMVz39WThV3o/IbSbFGN3uxTW7tplCc38LptVP/6z3lYHUx
         sOEK7GEHaW/HPN5zgB7BFFXV5apVLd+SHEQLbR9u2Q2khGiH6IAwzKb+JzVmxwstHNgB
         iscCHrbFxg8mZ3HfTyo/WV7VFYzcu1MSJw1urr9d2F+tbeynccnj+UrXoOBo2SZR6b9w
         8Ttw==
X-Gm-Message-State: AOAM531Eyg/GsPltVI6gzBLeuUmaE5t2JW+fTOht6X+GVHH3LIINHxNi
	2Uf+8q9bxWpkN8aSWfAqzyPM3ux3Is5wMfzw4eGRVsJ5Rw==
X-Google-Smtp-Source: ABdhPJxK6uPrYMesVmCff/Ap1xPa8ggHQj5X9HAkkoKcia/IPzLmDfybdrQEQCMCoUuks91YbIV9CzxRSvvxqZy3Z2E=
X-Received: by 2002:a05:6602:2d04:: with SMTP id c4mr57711331iow.146.1638255029828;
 Mon, 29 Nov 2021 22:50:29 -0800 (PST)
MIME-Version: 1.0
From: Sai Kiran Kumar Reddy <skiran@cimware.in>
Date: Tue, 30 Nov 2021 12:20:19 +0530
Message-ID: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
Subject: Xen on LFS
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001ad21d05d1fbf9c0"

--0000000000001ad21d05d1fbf9c0
Content-Type: text/plain; charset="UTF-8"

Hi,

I am Sai Kiran. I am currently working on installing xen on Linux From
Scratch(LFS) system. One of the dependencies of xen is "xorg" package. This
package is present in Beyond
<https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html> Linux From
Scratch(BLFS) <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>
manual. But, there are a lot of packages to be installed. I am not sure if
all these packages are required for Xen. Also, is xorg a must, to build and
install xen?

Kindly help me out here. Thanks in advance, for the support.

Regards,
Sai Kiran.

--0000000000001ad21d05d1fbf9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am Sai Kiran. I am currently work=
ing on installing xen on Linux From Scratch(LFS) system. One of the depende=
ncies of xen is &quot;xorg&quot; package. This package is present=C2=A0in <=
a href=3D"https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html">Beyo=
nd</a><a href=3D"https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.htm=
l"> Linux From Scratch(BLFS)</a> manual. But, there are a lot of packages t=
o be installed. I am not sure if all these packages are required for Xen. A=
lso, is xorg a must, to build and install xen?=C2=A0</div><div><br></div><d=
iv>Kindly help me out here. Thanks in advance, for the support.</div><div><=
br></div><div>Regards,</div><div>Sai Kiran.</div></div>

--0000000000001ad21d05d1fbf9c0--

