Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E073E7E2CC4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 20:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628257.979498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r059c-0000r7-Lp; Mon, 06 Nov 2023 19:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628257.979498; Mon, 06 Nov 2023 19:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r059c-0000pH-JA; Mon, 06 Nov 2023 19:20:56 +0000
Received: by outflank-mailman (input) for mailman id 628257;
 Mon, 06 Nov 2023 19:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4Jo=GT=gmail.com=pryorm09@srs-se1.protection.inumbo.net>)
 id 1r059b-0000pB-K9
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:20:55 +0000
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [2607:f8b0:4864:20::a2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99dc4153-7cd9-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:20:53 +0100 (CET)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4ac0d137835so1095043e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 11:20:53 -0800 (PST)
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
X-Inumbo-ID: 99dc4153-7cd9-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699298452; x=1699903252; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IhUgSwMNdcZHFfcMC0yDUBum+5v3yqsB458IxpUAuKs=;
        b=F/r1fdqUYYj+kK7MJmbZFg1dIRzYRzJVy9CqHarP8/fK1yQgUDT35Ltpef9+vkZRC5
         f5TP5iC0SSfQJN8JySUdBhJBxAv2Yhr/VuLs3S+D/OoXJEadU3BqRg0Yaw0GiC1HcIin
         MQEGHIy5+1QMaQBk+VeEV8FciNox8eiArF/k3qP0jo2TkrXqePdGEDYT+7WCbBHZfxbM
         OcHMcIU1sFydnu3IcTM8OHl00lcDnUx+KvGzuea2MP1WycGGm9lZ+AotqLt5esqaEbIE
         tMlGlmC0qP2mtLGFq3rI9u8I+6NezMomYV1/6EfksbcpUj6cRqvi5Gg9qLjk2RVcl3jk
         +A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699298452; x=1699903252;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhUgSwMNdcZHFfcMC0yDUBum+5v3yqsB458IxpUAuKs=;
        b=W0LdLwsy6vWUru7lslWrIbK1m2ao1yInyB9es2TQdOWlO2dQ+1mYw9aH1x95dUeXEL
         qF6zUwQe0+MX+ENdogz2TF83Z8C8S1JigPtvy+6HhsKeq6NNX0pil4aQmx/LQOM5pveO
         XHOc1VyVsFpt6EyDNAAfr+6CYZMf/HE8XXlc96ASV3TmaBNrYqv/hmC1HadP+owNCYk0
         sKctvEzbY58xhmsU1ZMjIzlkde3Bp8enZXvlsq8R3qYqthYKqR8//P4/8OTj1OvTXW5k
         W/UpovgLwIpy7/fZkZ089DfYLh/n748De/Tk/bMDp2TDaQorQ/uh+uYRlNzkB9AgjLpu
         1yfQ==
X-Gm-Message-State: AOJu0YzRUphGb2jt0YmyrUi29y1c+hDTWVRWPZ4fHummNZOtWFk+kevd
	78alVG5FumW37oiEy9pEHL7p6Iiyvx4SttMTpHoMmI8m6vo=
X-Google-Smtp-Source: AGHT+IESMY3ya3Ey42BjQaUcH79crMcso4lBRt6hBuqxe/07IvzWXpTCCHqEQZm7FULYhACQtGcJwdAl+U33Qq+zEGY=
X-Received: by 2002:a1f:ad52:0:b0:49a:9146:ec02 with SMTP id
 w79-20020a1fad52000000b0049a9146ec02mr26464312vke.1.1699298451953; Mon, 06
 Nov 2023 11:20:51 -0800 (PST)
MIME-Version: 1.0
From: Pry Mar <pryorm09@gmail.com>
Date: Mon, 6 Nov 2023 11:20:40 -0800
Message-ID: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
Subject: [kernel-6.5-bug] with xen-4.18~rc4 on ub-24.04 noble, booting xen
 domU shows UBSAN errors in blkback & netback drivers
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000098a24d060980c062"

--00000000000098a24d060980c062
Content-Type: text/plain; charset="UTF-8"

Hello,

These 2 errors show in dmesg late in boot process when xen domU launch:
1)  blkback
UBSAN: array-index-out-of-bounds in
/build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227:4

2) netback
[   55.209063] UBSAN: array-index-out-of-bounds in
/build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netback/netback.c:289:3
[   55.209268] index 3 is out of range for type 'xen_netif_tx_sring_entry
[1]'
[   55.209401] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.5.0-9-generic
#9-Ubuntu

The xen sources don't seem to generate these UBSAN errors and I included
the patch from staging-4.18. It seems only the xen related kernel drivers
are
doing UBSAN errors.

BTW the dom0 works fine. The xen-4.18~rc4 debian delta was a forward port
from Jammy.

cheers,
PryMar56
##xen-packaging on OFTC

--00000000000098a24d060980c062
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>These 2 errors show i=
n dmesg late in boot process when xen domU launch:<br></div><div>1)=C2=A0 b=
lkback<br></div><div>UBSAN: array-index-out-of-bounds in /build/linux-D15vQ=
j/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227:4</div><div><br></di=
v><div>2) netback<br></div><div>[ =C2=A0 55.209063] UBSAN: array-index-out-=
of-bounds in /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netback/netbac=
k.c:289:3<br>[ =C2=A0 55.209268] index 3 is out of range for type &#39;xen_=
netif_tx_sring_entry [1]&#39;<br>[ =C2=A0 55.209401] CPU: 3 PID: 0 Comm: sw=
apper/3 Not tainted 6.5.0-9-generic #9-Ubuntu</div><div><br></div><div>The =
xen sources don&#39;t seem to generate these UBSAN errors and I included th=
e patch from staging-4.18. It seems only the xen related kernel drivers are=
</div><div>doing UBSAN errors.</div><div><br></div><div>BTW the dom0 works =
fine. The xen-4.18~rc4 debian delta was a forward port from Jammy.</div><di=
v><br></div><div>cheers,</div><div>PryMar56</div><div>##xen-packaging on OF=
TC<br></div><div><br></div></div>

--00000000000098a24d060980c062--

