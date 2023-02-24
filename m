Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF86A1886
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 10:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500852.772375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVU6f-00066p-Dl; Fri, 24 Feb 2023 09:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500852.772375; Fri, 24 Feb 2023 09:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVU6f-00064W-B7; Fri, 24 Feb 2023 09:11:09 +0000
Received: by outflank-mailman (input) for mailman id 500852;
 Fri, 24 Feb 2023 09:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQyz=6U=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1pVU6e-00064O-4T
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 09:11:08 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29bc39db-b423-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 10:11:04 +0100 (CET)
Received: by mail-vs1-xe2b.google.com with SMTP id f23so20227112vsa.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 01:11:04 -0800 (PST)
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
X-Inumbo-ID: 29bc39db-b423-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rH5vIrBQHI4RgvWFqIqkDsp0H0oj/0r54SXQXd/4MmA=;
        b=VM4BVi9Pw1OU7zo8S6YCrQYRgUjRPj2PdWnZV1uiVRvHj46T8fTdYtcQ5flkD4rlGa
         HnYol5oPZ1h2zLT98yHzx7F7VEeWpXS2tiXbbmIzwdNufxQ4czFcxr8EWK/K9LjVWxvD
         fbpsAmWcYsgKLpCQ9J1OcKKlN6PaczVbK5CH/Mw2SMxulTPfqlvl8iQpsR8okP5nFijd
         MDnznpT+iHkN3DblZWXXraV0p5Vr2C3COLbifjfXZPfiUF04n/tKw2SNMt3xHQ5BfC/u
         GJWXqrpxJy0VofjtYeOOpa/U0eD7+Z1I1A6UbOesidyDMnhSYaEBgk76MCcoLgGpMNou
         n1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rH5vIrBQHI4RgvWFqIqkDsp0H0oj/0r54SXQXd/4MmA=;
        b=0uBbUl1kK6ZVaxtjbuvUSL+9CFM1ynG4eZyJbiuCkESoJrC98neGs7CAmjTHfy8MNt
         /9AGnh2W0k/FOvu5hGjZ614tMcwsMw1kgEGvST5KcjiRBuPTchFTWSFCIz5WMELxxUw7
         h6IeGO3qoqDemTVGiOpSHzOx5ostYOhEkRO5AYjMkm+H1SB13lU4w5Vo2IYzm6n2nECg
         puWoeXtJdwX4d7pax6q2qKHYxiXJsSjLzZpUybJS23fU9EJZdqjug9AN1IS6teT2czzv
         cv1fCqdk2mZUjCum/Z/7AulmHff9IKXabtOZsyiIHN72gU4owOJWkHN2GWiN7LChqQOy
         3pTA==
X-Gm-Message-State: AO0yUKU2vN89t3Ku10CByxzc5CGoCY0vXq/3bHrVL+1wn0Ef2dm/nDPo
	i96Mxaa3YJQIuhm4LCA9/e8NhldZPChLxIZMAnTyhtUIJcAR3A==
X-Google-Smtp-Source: AK7set8YTxoSrfXULbCdG2TIrNYOvgvGB5lqVmuRR0Tllj4i5Mw6KddbvndeassZKcN+iMZsgK+Gz6rSo/enohIdVyw=
X-Received: by 2002:a9f:305c:0:b0:68e:33d7:7e6b with SMTP id
 i28-20020a9f305c000000b0068e33d77e6bmr3955289uab.1.1677229862767; Fri, 24 Feb
 2023 01:11:02 -0800 (PST)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Fri, 24 Feb 2023 14:40:51 +0530
Message-ID: <CABg_PyJx2-npkys862L59WTTuF8tbtTXvGiPhnyKRWC401LSog@mail.gmail.com>
Subject: DomU Ubuntu install fails with uefi firmware option
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000002d515c05f56e8250"

--0000000000002d515c05f56e8250
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Ubuntu host, I installed xen with apt-get, and also able to install DomU
Ubuntu with default seabios. But when I tried to use uefi (firmware="uefi"
) in domu config, domu ubuntu installation fails.  I also installed the
ovmf package with apt-get, still not able to install Ubuntu DomU.

Can someone help me what could be missing here.

Here are the commands i used:

#sudo apt update
#sudo apt-get install vim ssh git gcc g++ meson libelf-dev bison flex
libselinux1-dev libxml2-dev ninja-build pkg-config libomxil-bellagio-dev
liblz-dev zlib1g-dev python2 expat libexpat1-dev cmake g++ freeglut3-dev
libvdpau-dev libxvmc-dev libva-dev libxrandr-dev libpciaccess-dev python3
python3-pip libdrm-dev libxdamage-dev libxcb-glx0-dev libx11-xcb-dev
libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev
libxxf86vm-dev build-essential bcc bin86 gawk bridge-utils iproute2
libcurl4 libcurl4-openssl-dev bzip2 kmod transfig tgif pkg-config texinfo
texlive-latex-base texlive-latex-recommended texlive-fonts-extra
texlive-fonts-recommended libpci-dev mercurial make gcc libc6-dev
zlib1g-dev python2 python2-dev python3-twisted libncurses5-dev patch
libvncserver-dev  libjpeg-dev python3-dev libglib2.0-dev libnl-3-dev
libnl-cli-3-dev libnl-genl-3-dev libnl-route-3-dev libnl-idiag-3-dev
libnl-xfrm-3-dev iasl libbz2-dev e2fslibs-dev git-core uuid-dev ocaml
ocaml-findlib ocamlbuild libx11-dev  bison flex xz-utils libyajl-dev
gettext libpixman-1-dev libaio-dev markdown pandoc iasl cmake figlet
libc6-dev-i386 lzma lzma-dev liblzma-dev libsystemd-dev libzstd-dev
ninja-build libepoxy-dev libgbm-dev libepoxy-dev libxen-dev libgtk-3-dev
libusb-1.0-0-dev binutils gzip xzip bzip2 lzop lz4 lzma zstd
xen-hypervisor-common libssl-dev nasm libegl-mesa0 libvulkan-dev
libpulse-dev dh-make -y

#sudo apt-get install xen-hypervisor-amd64 xen-utils xen-tools
xen-utils-common xenstore-utils;
#sudo apt install ovmf

with "xl create vm1.cfg",  the domu qemu window gets closed and pops up
again continuously.

vm1.cfg file
-------------
type = "hvm"
name = "VM1"
memory = 4096
vcpus = 8
xen_platform_pci=1
vif = [ 'type=vif,bridge=xenbr0,model=virtio-net' ]
usb = 1
usbdevice=['tablet']
disk = [
'tap:qcow2:/home/amd/u2204.qcow2,xvda,w','file:/home/amd/ubuntu-22.04.1-desktop-amd64.iso,hdc,cdrom,r'
]
#disk = [ 'tap:qcow2:/home/amd/u2204.qcow2,xvda,w' ]
sdl = 1
vnc=1
firmware="uefi"

Thanks
Sudheer

--0000000000002d515c05f56e8250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>On Ubuntu host, I installed xen with apt-ge=
t, and also able to install DomU Ubuntu with default seabios. But when I tr=
ied to use uefi (firmware=3D&quot;uefi&quot; ) in domu config, domu ubuntu =
installation fails.=C2=A0 I also installed the ovmf package with apt-get, s=
till not able to install Ubuntu DomU.=C2=A0<div><br></div><div>Can someone =
help me what could be missing here.<br><br>Here are the commands i used:<di=
v><br>#sudo apt update<br>#sudo apt-get install vim ssh git gcc g++ meson l=
ibelf-dev bison flex libselinux1-dev libxml2-dev ninja-build pkg-config lib=
omxil-bellagio-dev liblz-dev zlib1g-dev python2 expat libexpat1-dev cmake g=
++ freeglut3-dev libvdpau-dev libxvmc-dev libva-dev libxrandr-dev libpciacc=
ess-dev python3 python3-pip libdrm-dev libxdamage-dev libxcb-glx0-dev libx1=
1-xcb-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence=
-dev libxxf86vm-dev build-essential bcc bin86 gawk bridge-utils iproute2 li=
bcurl4 libcurl4-openssl-dev bzip2 kmod transfig tgif pkg-config texinfo tex=
live-latex-base texlive-latex-recommended texlive-fonts-extra texlive-fonts=
-recommended libpci-dev mercurial make gcc libc6-dev zlib1g-dev python2 pyt=
hon2-dev python3-twisted libncurses5-dev patch libvncserver-dev =C2=A0libjp=
eg-dev python3-dev libglib2.0-dev libnl-3-dev libnl-cli-3-dev libnl-genl-3-=
dev libnl-route-3-dev libnl-idiag-3-dev libnl-xfrm-3-dev iasl libbz2-dev e2=
fslibs-dev git-core uuid-dev ocaml ocaml-findlib ocamlbuild libx11-dev =C2=
=A0bison flex xz-utils libyajl-dev gettext libpixman-1-dev libaio-dev markd=
own pandoc iasl cmake figlet libc6-dev-i386 lzma lzma-dev liblzma-dev libsy=
stemd-dev libzstd-dev ninja-build libepoxy-dev libgbm-dev libepoxy-dev libx=
en-dev libgtk-3-dev libusb-1.0-0-dev binutils gzip xzip bzip2 lzop lz4 lzma=
 zstd xen-hypervisor-common libssl-dev nasm libegl-mesa0 libvulkan-dev libp=
ulse-dev dh-make -y<br><br>#sudo apt-get install xen-hypervisor-amd64 xen-u=
tils xen-tools xen-utils-common xenstore-utils;<br>#sudo apt install ovmf<b=
r><br>with &quot;xl create vm1.cfg&quot;, =C2=A0the domu qemu window gets c=
losed and pops up again continuously.<br><br>vm1.cfg file<br>-------------<=
br>type =3D &quot;hvm&quot;<br>name =3D &quot;VM1&quot;<br>memory =3D 4096<=
br>vcpus =3D 8<br>xen_platform_pci=3D1<br>vif =3D [ &#39;type=3Dvif,bridge=
=3Dxenbr0,model=3Dvirtio-net&#39; ]<br>usb =3D 1<br>usbdevice=3D[&#39;table=
t&#39;]<br>disk =3D [ &#39;tap:qcow2:/home/amd/u2204.qcow2,xvda,w&#39;,&#39=
;file:/home/amd/ubuntu-22.04.1-desktop-amd64.iso,hdc,cdrom,r&#39; ]<br>#dis=
k =3D [ &#39;tap:qcow2:/home/amd/u2204.qcow2,xvda,w&#39; ]<br>sdl =3D 1<br>=
vnc=3D1<br>firmware=3D&quot;uefi&quot;<br><br></div></div><div>Thanks</div>=
<div>Sudheer</div><div><br></div></div>

--0000000000002d515c05f56e8250--

