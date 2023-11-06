Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A87E2FCC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 23:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628500.980037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r080h-0004Qj-0h; Mon, 06 Nov 2023 22:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628500.980037; Mon, 06 Nov 2023 22:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r080g-0004MS-TX; Mon, 06 Nov 2023 22:23:54 +0000
Received: by outflank-mailman (input) for mailman id 628500;
 Mon, 06 Nov 2023 22:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4Jo=GT=gmail.com=pryorm09@srs-se1.protection.inumbo.net>)
 id 1r080f-0004G8-BY
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 22:23:53 +0000
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [2607:f8b0:4864:20::92d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27844d10-7cf3-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 23:23:48 +0100 (CET)
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7ba9bd62fdfso1525400241.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 14:23:48 -0800 (PST)
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
X-Inumbo-ID: 27844d10-7cf3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699309427; x=1699914227; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRdEQYvZRcyr4WyJBrVAX+Hn0AlmUYFSmXj4llZD6Dc=;
        b=dWqZU8gJCwGs2+JBnFlcXhs70xXiudcYV+LyYo0k6cCT54YLAVwP29/F2y9EYv7MlV
         9lKifMEhdlixxszSWLLf6+15PATkPtmPvn+vq4e5lt/0HuBozdP005/8rYrPinizTjYl
         gtMdpQFjj452kZ8zLsmOF8n5L1/iM2QgVq06GK3QPHxgZjUQByVEX7cv1GxYIu5ZrFsX
         NW9mVHfDh9VmDYy6TZi3TK3YABDn6zEMQ1+jRCNQoed69ufBL5HyPqSQcFv6+lGDoGpb
         s54fUk1ugWZChWExDPRTCmaXXRc9Ne7q76pJekWeYH+1eDw8sUzMEcHPE6feMMH1azLn
         fwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699309427; x=1699914227;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRdEQYvZRcyr4WyJBrVAX+Hn0AlmUYFSmXj4llZD6Dc=;
        b=py2xoh9c2sFWGJsqeP6ijx6wgdH6E08FZdplLq1g1ZcSe5FmX+fsLE3V53jPTB+F7S
         cWOWHY1FXsJAkAbe9MIMFnW4m+kpXqqMAHANCiU7GPAL+6Caf43Y9IpdYIUObGW/uArc
         O3uh6S4SzAik3DZ0+/ODW5kLoKG4DSkddBLbMO2OTXkq4oXK54UEVstrg29dBSx+JpR0
         NzzRaSr9QjtviC2hPrm1wjWPpoUNNXFWgbQX89GKSqPA3mKrTCesP+olIvPRaLIuD7B9
         lzY0U+fhoLYR6GhJ5FzY8L540I0/82E1+Dhhhu6tnh0kXF7A+NEIHVWc3jVXX/lMu2UY
         /l2g==
X-Gm-Message-State: AOJu0YymcBj9JEtLUy2D9ZQJGJdsTPs/STGHVOEvbM6Xye9zzYAa1PlZ
	zIrytqGOKA496v+bW+krY69d4842PZEaqM3zlaDTpeIuvCg=
X-Google-Smtp-Source: AGHT+IHrGuzyvwAmitmNt+67Ih31C9hE7X1JR8e6zsWK35/s/hVBxTImCpLWOJ3hB3F8mx7EjeOxsNPEMUb/qwmvHBE=
X-Received: by 2002:a67:c113:0:b0:45f:274:8c32 with SMTP id
 d19-20020a67c113000000b0045f02748c32mr5213104vsj.32.1699309427112; Mon, 06
 Nov 2023 14:23:47 -0800 (PST)
MIME-Version: 1.0
References: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
 <CAHnBbQ_-6gX+spYteE205jprab4pqVjBSwyK=b_JtYd3tF_53w@mail.gmail.com>
In-Reply-To: <CAHnBbQ_-6gX+spYteE205jprab4pqVjBSwyK=b_JtYd3tF_53w@mail.gmail.com>
From: Pry Mar <pryorm09@gmail.com>
Date: Mon, 6 Nov 2023 14:23:35 -0800
Message-ID: <CAHnBbQ8RnfsdQPmFaf_L-Y_3Fv4ZP-70cG-WCma=BdDRLXRS8w@mail.gmail.com>
Subject: Re: [kernel-6.5-bug] with xen-4.18~rc4 on ub-24.04 noble, booting xen
 domU shows UBSAN errors in blkback & netback drivers
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000c443370609834eca"

--000000000000c443370609834eca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 looking at a bookworm domU, tried linux-image-6.5.0-0.deb12.1-amd64 from
bookworm-backports in the ub-24.04 dom0, no such UBSAN errors.

Going to request a build of kernel-6.5 in Noble with
 # CONFIG_UBSAN is not set

their kernel config has:
CONFIG_UBSAN=3Dy
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS_STRICT=3Dy
CONFIG_UBSAN_BOUNDS=3Dy
CONFIG_UBSAN_BOUNDS_STRICT=3Dy
CONFIG_UBSAN_SHIFT=3Dy
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_BOOL=3Dy
CONFIG_UBSAN_ENUM=3Dy
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=3Dy
# CONFIG_TEST_UBSAN is not set

On Mon, Nov 6, 2023 at 1:15=E2=80=AFPM Pry Mar <pryorm09@gmail.com> wrote:

> Similar trouble in domU, independent of the dom0 kernel:
>
> [    0.605954] UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkfront.c:1544:3
> [    0.605962] index 1 is out of range for type 'blkif_sring_entry [1]'
> [    0.605968] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.5.0-9-generic
> #9-Ubuntu
>
> [    4.021091] UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:413:4
> [    4.021100] index 1 is out of range for type 'xen_netif_tx_sring_entry
> [1]'
> [    4.021114] CPU: 3 PID: 1 Comm: systemd Not tainted 6.5.0-9-generic
> #9-Ubuntu
>
> [ 1288.106524] UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:807:4
> [ 1288.106533] index 137 is out of range for type
> 'xen_netif_tx_sring_entry [1]'
> [ 1288.106540] CPU: 0 PID: 320 Comm: sshd Not tainted 6.5.0-9-generic
> #9-Ubuntu
>
> domU is giving far more trace output.
> On Mon, Nov 6, 2023 at 11:20=E2=80=AFAM Pry Mar <pryorm09@gmail.com> wrot=
e:
>
>> Hello,
>>
>> These 2 errors show in dmesg late in boot process when xen domU launch:
>> 1)  blkback
>> UBSAN: array-index-out-of-bounds in
>> /build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227=
:4
>>
>> 2) netback
>> [   55.209063] UBSAN: array-index-out-of-bounds in
>> /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netback/netback.c:289:3
>> [   55.209268] index 3 is out of range for type 'xen_netif_tx_sring_entr=
y
>> [1]'
>> [   55.209401] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.5.0-9-generic
>> #9-Ubuntu
>>
>> The xen sources don't seem to generate these UBSAN errors and I included
>> the patch from staging-4.18. It seems only the xen related kernel driver=
s
>> are
>> doing UBSAN errors.
>>
>> BTW the dom0 works fine. The xen-4.18~rc4 debian delta was a forward por=
t
>> from Jammy.
>>
>> cheers,
>> PryMar56
>> ##xen-packaging on OFTC
>>
>>

--000000000000c443370609834eca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0looking at a bookworm domU, tried linux-image-6=
.5.0-0.deb12.1-amd64 from bookworm-backports in the ub-24.04 dom0, no such =
UBSAN errors.</div><div><br></div><div>Going to request a build of kernel-6=
.5 in Noble with</div><div>=C2=A0# CONFIG_UBSAN is not set</div><div><br></=
div><div>their kernel config has:</div><div>CONFIG_UBSAN=3Dy<br># CONFIG_UB=
SAN_TRAP is not set<br>CONFIG_CC_HAS_UBSAN_BOUNDS_STRICT=3Dy<br>CONFIG_UBSA=
N_BOUNDS=3Dy<br>CONFIG_UBSAN_BOUNDS_STRICT=3Dy<br>CONFIG_UBSAN_SHIFT=3Dy<br=
># CONFIG_UBSAN_DIV_ZERO is not set<br>CONFIG_UBSAN_BOOL=3Dy<br>CONFIG_UBSA=
N_ENUM=3Dy<br># CONFIG_UBSAN_ALIGNMENT is not set<br>CONFIG_UBSAN_SANITIZE_=
ALL=3Dy<br># CONFIG_TEST_UBSAN is not set<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2023 at 1=
:15=E2=80=AFPM Pry Mar &lt;<a href=3D"mailto:pryorm09@gmail.com">pryorm09@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Similar trouble in domU, ind=
ependent of the dom0 kernel:</div><div><br></div><div>[ =C2=A0 =C2=A00.6059=
54] UBSAN: array-index-out-of-bounds in /build/linux-D15vQj/linux-6.5.0/dri=
vers/block/xen-blkfront.c:1544:3<br>[ =C2=A0 =C2=A00.605962] index 1 is out=
 of range for type &#39;blkif_sring_entry [1]&#39;<br>[ =C2=A0 =C2=A00.6059=
68] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.5.0-9-generic #9-Ubuntu<br>=
</div><div><br></div><div>[ =C2=A0 =C2=A04.021091] UBSAN: array-index-out-o=
f-bounds in /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netfront.c:413:=
4<br>[ =C2=A0 =C2=A04.021100] index 1 is out of range for type &#39;xen_net=
if_tx_sring_entry [1]&#39;<br>[ =C2=A0 =C2=A04.021114] CPU: 3 PID: 1 Comm: =
systemd Not tainted 6.5.0-9-generic #9-Ubuntu</div><div><br></div><div>[ 12=
88.106524] UBSAN: array-index-out-of-bounds in /build/linux-D15vQj/linux-6.=
5.0/drivers/net/xen-netfront.c:807:4<br>[ 1288.106533] index 137 is out of =
range for type &#39;xen_netif_tx_sring_entry [1]&#39;<br>[ 1288.106540] CPU=
: 0 PID: 320 Comm: sshd Not tainted 6.5.0-9-generic #9-Ubuntu<br></div></di=
v><div><br></div><div>domU is giving far more trace output.<br></div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2=
023 at 11:20=E2=80=AFAM Pry Mar &lt;<a href=3D"mailto:pryorm09@gmail.com" t=
arget=3D"_blank">pryorm09@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><=
br></div><div>These 2 errors show in dmesg late in boot process when xen do=
mU launch:<br></div><div>1)=C2=A0 blkback<br></div><div>UBSAN: array-index-=
out-of-bounds in /build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/=
blkback.c:1227:4</div><div><br></div><div>2) netback<br></div><div>[ =C2=A0=
 55.209063] UBSAN: array-index-out-of-bounds in /build/linux-D15vQj/linux-6=
.5.0/drivers/net/xen-netback/netback.c:289:3<br>[ =C2=A0 55.209268] index 3=
 is out of range for type &#39;xen_netif_tx_sring_entry [1]&#39;<br>[ =C2=
=A0 55.209401] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.5.0-9-generic #9=
-Ubuntu</div><div><br></div><div>The xen sources don&#39;t seem to generate=
 these UBSAN errors and I included the patch from staging-4.18. It seems on=
ly the xen related kernel drivers are</div><div>doing UBSAN errors.</div><d=
iv><br></div><div>BTW the dom0 works fine. The xen-4.18~rc4 debian delta wa=
s a forward port from Jammy.</div><div><br></div><div>cheers,</div><div>Pry=
Mar56</div><div>##xen-packaging on OFTC<br></div><div><br></div></div>
</blockquote></div></div>
</blockquote></div>

--000000000000c443370609834eca--

