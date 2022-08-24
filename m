Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890559FD16
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392738.631281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrE7-0005Tb-R1; Wed, 24 Aug 2022 14:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392738.631281; Wed, 24 Aug 2022 14:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrE7-0005Q6-MP; Wed, 24 Aug 2022 14:19:27 +0000
Received: by outflank-mailman (input) for mailman id 392738;
 Wed, 24 Aug 2022 14:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLoP=Y4=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oQrBo-0005Mq-H1
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:17:04 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e3e00e4-23b7-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 16:16:38 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id gb36so33778467ejc.10
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 07:17:03 -0700 (PDT)
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
X-Inumbo-ID: 5e3e00e4-23b7-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=7QHuSojGFQRvWl2p78e2Ua+ZUBeqHobkB6L/jbtO/AU=;
        b=kgLOVa2NrvMvbgip0JZOHUgtXOpxzfrGo0VX8djfrfIeCJiatszPPt8USdglbGoLde
         lnLTKw+QtUexotyKbYGSLyUb+PBJNMTnAdOgXRD5Xrg6Xv2c25cJ943t4b4HnIZudX8/
         jIBsM7x0D3gG7qGcylzfOfdXIv3JWUkXsVOJtH+WuKEHnwc/+8ZCx/yG0pIGrwFKM1nV
         RmjSJybZjbL+eKUDaEU72VZWqhiQKWfUjUU2lJkMUeN7M8m+7sn6KPMfI27ECOyO/S7i
         F/LG94jBCk1fBli7gW+VbeTnCSYH7bzd2z43n4VtwMQfBTu8GUIHmnaEvTXxD99SGh2k
         +oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=7QHuSojGFQRvWl2p78e2Ua+ZUBeqHobkB6L/jbtO/AU=;
        b=rMD/FRKyesRBK8P39HVhD64Asmcs2PF9Tlb93ufxNHmxXX7PCOAc4+/tvhrCA5bL7O
         NrJ+a0gcITNJEi6YT8ii9Z2AtDOiEpBvhpTrTLCciTWs1fK2y6KJIBfedXS3h9SA432+
         IAZhQmEUfXcEhQ1UXmaCqFeju449tS0TQesCnEzrduIMdegPiPTrn4vd5MmeaPsYylEg
         hmkBfhrzLYpa1ahodPVl3kZTQp6y8VywujSVyNgm0t+ESp1fN373aE/1pGUUfhuVAySK
         d18geaWaWX+TX3J94fZD1o2HHVdKO9qIErxIWj0kwo4oFFH0cZskwzua4Bo8x5Qcsq9q
         K0/Q==
X-Gm-Message-State: ACgBeo3lkS3ZMF+3H0Qk2PdtcMh4NRsBDM5+YL0jxQo9x76ZGd15AhQ1
	h30Pt6YgoMPpleb+WNzJxYsDHFc95OotIvtOkkOHOHncZ39LyQ==
X-Google-Smtp-Source: AA6agR6uHrlibcygtAfyfid9cXZ7bd8Z5jmly6ygn7BznzG7WY0OWhbmbL9KwXIkMM+yqS1mSCVsWb+6K/j+8yNiDLM=
X-Received: by 2002:a17:907:2d23:b0:730:acf0:4907 with SMTP id
 gs35-20020a1709072d2300b00730acf04907mr3126627ejc.700.1661350622388; Wed, 24
 Aug 2022 07:17:02 -0700 (PDT)
MIME-Version: 1.0
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Wed, 24 Aug 2022 19:46:50 +0530
Message-ID: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
Subject: Porting xen on rpi4
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org
Content-Type: multipart/alternative; boundary="000000000000b1e5de05e6fd556e"

--000000000000b1e5de05e6fd556e
Content-Type: text/plain; charset="UTF-8"

Hi,

I am porting xen hypervisor on rpi4 with yocto kirkstone sources. Followed
the basic steps to build xen-image-minimal & xen-guest-image-minimal. I
could flash sd card with xen minimal image & could see dom0 up. I copied
"Image", "xen-guest-image-minimal" .ext3 file & guest.cfg to "/home/root".
After that created a bridge with below step:

killall -SIGUSR2 udhcpc
brctl addbr xenbr0
brctl addif xenbr0 eth0
killall udhcpc
udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0

Could see the xenbr0 interface up.
After that while mounting the guest file system it shows no such file or
directory but the file is already there.


*[23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l**[23:40:15]
<Guest9046> -rw-r--r--    1 root     root      24652288 Mar  9 12:36 Image*















*[23:40:15] <Guest9046> -rw-r--r--    1 root     root           247 Mar  9
12:37 guest1.cfg[23:40:15] <Guest9046> -rw-r--r--    1 root     root
868220928 Mar  9 12:39
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# chmod 0777
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# ls -l[23:40:15] <Guest9046> -rw-r--r--    1 root
  root      24652288 Mar  9 12:36 Image[23:40:15] <Guest9046> -rw-r--r--
 1 root     root           247 Mar  9 12:37 guest1.cfg[23:40:15]
<Guest9046> -rwxrwxrwx    1 root     root     868220928 Mar  9 12:39
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# losetup /dev/loop0
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046> losetup:
xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory[23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15]
<Guest9046> losetup:
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory[23:40:15] <Guest9046> root@raspberrypi4-64:~#[23:40:15]
<Guest9046> root@raspberrypi4-64:~#[23:40:15] <Guest9046>
root@raspberrypi4-64:~#[23:40:15] <Guest9046> root@raspberrypi4-64:~#
losetup /dev/loop0
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15]
<Guest9046> losetup:
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory*

*Any input on this issue will be really helpful, expecting your response.*

Thanks & Regards,
Vipul Kumar

--000000000000b1e5de05e6fd556e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am porting xen hypervisor on rpi4=
 with yocto=20
kirkstone sources. Followed the basic steps to build xen-image-minimal=20
&amp; xen-guest-image-minimal. I could flash sd card with xen minimal=20
image &amp; could see dom0 up. I copied &quot;Image&quot;,=20
&quot;xen-guest-image-minimal&quot; .ext3 file &amp; guest.cfg to &quot;/ho=
me/root&quot;.=20
After that created a bridge with below step:</div><div><br></div>killall -S=
IGUSR2 udhcpc<br>brctl addbr xenbr0<br>brctl addif xenbr0 eth0<br>killall u=
dhcpc<br><div>udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0=C2=A0</d=
iv><div><br></div><div>Could see the xenbr0 interface up.</div><div>After t=
hat while mounting the guest file system it shows no such file or directory=
 but the file is already there.</div><div><b><br></b></div><div><b>[23:40:1=
5] &lt;Guest9046&gt; root@raspberrypi4-64:~# ls -l<br></b><b>[23:40:15] &lt=
;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=
=A0 =C2=A024652288 Mar =C2=A09 12:36 Image</b><b><br></b></div><div><b>[23:=
40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 247 Mar =C2=A09 12:37 guest1.cfg<br>[23:=
40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =
=C2=A0 =C2=A0 868220928 Mar =C2=A09 12:39 xen-guest-image-minimal-raspberry=
pi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# chmod 0=
777 xen-guest-image-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest904=
6&gt; root@raspberrypi4-64:~# ls -l<br>[23:40:15] &lt;Guest9046&gt; -rw-r--=
r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A024652288 Mar=
 =C2=A09 12:36 Image<br>[23:40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=
=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 247 Mar =C2=
=A09 12:37 guest1.cfg<br>[23:40:15] &lt;Guest9046&gt; -rwxrwxrwx =C2=A0 =C2=
=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 868220928 Mar =C2=A09 12:39 xen-=
guest-image-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; ro=
ot@raspberrypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberryp=
i4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; losetup: xen-guest-image-minimal=
-raspberrypi4-64.ext3: No such file or directory<br>[23:40:15] &lt;Guest904=
6&gt; root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image=
-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; losetup: /hom=
e/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or direct=
ory<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~#<br>[23:40:15] &=
lt;Guest9046&gt; root@raspberrypi4-64:~#<br>[23:40:15] &lt;Guest9046&gt; ro=
ot@raspberrypi4-64:~#<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:=
~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ex=
t3<br>[23:40:15] &lt;Guest9046&gt; losetup: /home/root/xen-guest-image-mini=
mal-raspberrypi4-64.ext3: No such file or directory</b><br></div><div><b><b=
r></b></div><div><b>Any input on this issue will be really helpful, expecti=
ng your response.</b></div><div><b><br></b></div><div>Thanks &amp; Regards,=
</div><div>Vipul Kumar</div></div>

--000000000000b1e5de05e6fd556e--

