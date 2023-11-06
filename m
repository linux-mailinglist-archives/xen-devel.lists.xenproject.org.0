Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BB7E2EC7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 22:16:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628491.980027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r06wY-0001kA-3R; Mon, 06 Nov 2023 21:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628491.980027; Mon, 06 Nov 2023 21:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r06wX-0001i7-Ve; Mon, 06 Nov 2023 21:15:33 +0000
Received: by outflank-mailman (input) for mailman id 628491;
 Mon, 06 Nov 2023 21:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4Jo=GT=gmail.com=pryorm09@srs-se1.protection.inumbo.net>)
 id 1r06wX-0001i1-0O
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 21:15:33 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c8a04fa-7ce9-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 22:15:29 +0100 (CET)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7bae8dd095cso1008492241.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 13:15:29 -0800 (PST)
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
X-Inumbo-ID: 9c8a04fa-7ce9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699305328; x=1699910128; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P34TTyG1M6l3tTyWmHV4nVwibIUSQI3i7n59PsrG2tQ=;
        b=EalRm/Y+SC6+QYOWoL7iUhvGJoiSNCL38y3gl9kLDWTw1V15ysOkCyxFU3pFoq6qur
         jt+j0GuYTPt7M+THp3WBnsrE9s0Hptx53/LkJckGKbvRot7eyFvPLcX4Z1eSqmPwyIVK
         d+t4yiq+QwQED3H5IIaP7Xqj9sc0kD8uDcGrcRHxuuiWK3Eo6T+66czWWU5WA87G27/a
         YrzeXDS0WFKjr2DomT14aWEaUOIXCIUGBz1+p7fTQi+59Zvbx1UBcpuwKa9Ab78Lg8JI
         v4ofLLk0fAYdgT/Peu5gLjd2AUapmuIRsK5uZughzilsAJcm4Ti0mvJnsVKf3en7s5AQ
         up7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699305328; x=1699910128;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P34TTyG1M6l3tTyWmHV4nVwibIUSQI3i7n59PsrG2tQ=;
        b=LRJpxGp/0VyGiWeTWDJHO0Mq0xWudHVkTACf2Ep8erPE+iHqQDcpCaFZGtdiQa/cY3
         tQ8KXWJklYBDcOmeLlsyZg9DveCOLf/zUGsjtPJlF8xCVQdw3ThH61HiNF2OHU1lY64J
         bEykSgTKdGe0iMNetoUJL4sR1AOg0kVIUBxdCbVIbXTxUAzV3FqOcuZ+nRbW1MGq7MKw
         sCUWpguqV87JymXio7fAUgjUjdK4PVK6/uAq2blq1zR8kY/B4bH2ACCO7BoZDB6CF6GI
         mKrRYKLJLYE6aXxzW1X65WLTTMCiexEQslZjGGkxS8tLqLGP+FUHcW3WR2wFZ67OFO8D
         Qtfg==
X-Gm-Message-State: AOJu0YwdubNr3EKtvtuJGbs7UM+mt8O2+f3KMuk1dKexMbbSl/bq31Mi
	kOk9/1xezBQc9CSJJTt6MYEat6/odcwIQCf3PcYwF5aDQ6E=
X-Google-Smtp-Source: AGHT+IEDWfR3DE6qVGL6TQBxQ8PgHrVVJcabDibZy1C64eImfQqzlgeXAKR97YdczEe0piRBJ9NmcmGIowUdejGYFuY=
X-Received: by 2002:a67:c181:0:b0:45d:b9fa:48e9 with SMTP id
 h1-20020a67c181000000b0045db9fa48e9mr6494684vsj.31.1699305328392; Mon, 06 Nov
 2023 13:15:28 -0800 (PST)
MIME-Version: 1.0
References: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
In-Reply-To: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
From: Pry Mar <pryorm09@gmail.com>
Date: Mon, 6 Nov 2023 13:15:16 -0800
Message-ID: <CAHnBbQ_-6gX+spYteE205jprab4pqVjBSwyK=b_JtYd3tF_53w@mail.gmail.com>
Subject: Re: [kernel-6.5-bug] with xen-4.18~rc4 on ub-24.04 noble, booting xen
 domU shows UBSAN errors in blkback & netback drivers
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000076c4780609825a09"

--00000000000076c4780609825a09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Similar trouble in domU, independent of the dom0 kernel:

[    0.605954] UBSAN: array-index-out-of-bounds in
/build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkfront.c:1544:3
[    0.605962] index 1 is out of range for type 'blkif_sring_entry [1]'
[    0.605968] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.5.0-9-generic
#9-Ubuntu

[    4.021091] UBSAN: array-index-out-of-bounds in
/build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:413:4
[    4.021100] index 1 is out of range for type 'xen_netif_tx_sring_entry
[1]'
[    4.021114] CPU: 3 PID: 1 Comm: systemd Not tainted 6.5.0-9-generic
#9-Ubuntu

[ 1288.106524] UBSAN: array-index-out-of-bounds in
/build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:807:4
[ 1288.106533] index 137 is out of range for type 'xen_netif_tx_sring_entry
[1]'
[ 1288.106540] CPU: 0 PID: 320 Comm: sshd Not tainted 6.5.0-9-generic
#9-Ubuntu

domU is giving far more trace output.
On Mon, Nov 6, 2023 at 11:20=E2=80=AFAM Pry Mar <pryorm09@gmail.com> wrote:

> Hello,
>
> These 2 errors show in dmesg late in boot process when xen domU launch:
> 1)  blkback
> UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227:=
4
>
> 2) netback
> [   55.209063] UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netback/netback.c:289:3
> [   55.209268] index 3 is out of range for type 'xen_netif_tx_sring_entry
> [1]'
> [   55.209401] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.5.0-9-generic
> #9-Ubuntu
>
> The xen sources don't seem to generate these UBSAN errors and I included
> the patch from staging-4.18. It seems only the xen related kernel drivers
> are
> doing UBSAN errors.
>
> BTW the dom0 works fine. The xen-4.18~rc4 debian delta was a forward port
> from Jammy.
>
> cheers,
> PryMar56
> ##xen-packaging on OFTC
>
>

--00000000000076c4780609825a09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Similar trouble in domU, independent=
 of the dom0 kernel:</div><div><br></div><div>[ =C2=A0 =C2=A00.605954] UBSA=
N: array-index-out-of-bounds in /build/linux-D15vQj/linux-6.5.0/drivers/blo=
ck/xen-blkfront.c:1544:3<br>[ =C2=A0 =C2=A00.605962] index 1 is out of rang=
e for type &#39;blkif_sring_entry [1]&#39;<br>[ =C2=A0 =C2=A00.605968] CPU:=
 2 PID: 0 Comm: swapper/2 Not tainted 6.5.0-9-generic #9-Ubuntu<br></div><d=
iv><br></div><div>[ =C2=A0 =C2=A04.021091] UBSAN: array-index-out-of-bounds=
 in /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:413:4<br>[ =
=C2=A0 =C2=A04.021100] index 1 is out of range for type &#39;xen_netif_tx_s=
ring_entry [1]&#39;<br>[ =C2=A0 =C2=A04.021114] CPU: 3 PID: 1 Comm: systemd=
 Not tainted 6.5.0-9-generic #9-Ubuntu</div><div><br></div><div>[ 1288.1065=
24] UBSAN: array-index-out-of-bounds in /build/linux-D15vQj/linux-6.5.0/dri=
vers/net/xen-netfront.c:807:4<br>[ 1288.106533] index 137 is out of range f=
or type &#39;xen_netif_tx_sring_entry [1]&#39;<br>[ 1288.106540] CPU: 0 PID=
: 320 Comm: sshd Not tainted 6.5.0-9-generic #9-Ubuntu<br></div></div><div>=
<br></div><div>domU is giving far more trace output.<br></div><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2023 at =
11:20=E2=80=AFAM Pry Mar &lt;<a href=3D"mailto:pryorm09@gmail.com">pryorm09=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>These 2 er=
rors show in dmesg late in boot process when xen domU launch:<br></div><div=
>1)=C2=A0 blkback<br></div><div>UBSAN: array-index-out-of-bounds in /build/=
linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227:4</div><d=
iv><br></div><div>2) netback<br></div><div>[ =C2=A0 55.209063] UBSAN: array=
-index-out-of-bounds in /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-net=
back/netback.c:289:3<br>[ =C2=A0 55.209268] index 3 is out of range for typ=
e &#39;xen_netif_tx_sring_entry [1]&#39;<br>[ =C2=A0 55.209401] CPU: 3 PID:=
 0 Comm: swapper/3 Not tainted 6.5.0-9-generic #9-Ubuntu</div><div><br></di=
v><div>The xen sources don&#39;t seem to generate these UBSAN errors and I =
included the patch from staging-4.18. It seems only the xen related kernel =
drivers are</div><div>doing UBSAN errors.</div><div><br></div><div>BTW the =
dom0 works fine. The xen-4.18~rc4 debian delta was a forward port from Jamm=
y.</div><div><br></div><div>cheers,</div><div>PryMar56</div><div>##xen-pack=
aging on OFTC<br></div><div><br></div></div>
</blockquote></div></div>

--00000000000076c4780609825a09--

