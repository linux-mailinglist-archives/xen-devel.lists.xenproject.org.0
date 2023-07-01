Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C87445E8
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 03:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557721.871333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFPbX-0003U0-LA; Sat, 01 Jul 2023 01:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557721.871333; Sat, 01 Jul 2023 01:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFPbX-0003QY-CH; Sat, 01 Jul 2023 01:40:51 +0000
Received: by outflank-mailman (input) for mailman id 557721;
 Sat, 01 Jul 2023 01:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaHD=CT=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1qFPbV-0003QN-Nd
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 01:40:49 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae2aa5c-17b0-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 03:40:44 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5774098f16eso16007677b3.0; 
 Fri, 30 Jun 2023 18:40:43 -0700 (PDT)
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
X-Inumbo-ID: 4ae2aa5c-17b0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688175643; x=1690767643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SEcfA2Ww7HR2irnIpklXq/A9PNh1FXgpCio5YDgpl0U=;
        b=jmoC5J1PtFdizaR2gL+x54Pc91iCLqZ8hdq5oR6a0BMD4YBcqOaNGA6NpJDERb5ALb
         Rb9Inb1FabtHuAfAHQMZCVS8JbCo5Mbnq6OLVDB2oR470AN+BptAfa3jHkqE50ZDMUBm
         /f+hsTRgyfViphjjlmFOk04ZKWva+RhzsINsZpjXoTJUQSRQJZPbPCuealJJXgekH/Pu
         exiTwvUYAcSl7gVWl86WtSSgI+gbXOZhBocUYeEQ+vJJCDoO9roChlWvC/k4bUpWgIhq
         zIhUmGZutYzVTHFaXWDB6NWRm9CaG73UC8OgTeCpOKtdR6p/6Qq+l+uuXKekgEI7bR0N
         uYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688175643; x=1690767643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEcfA2Ww7HR2irnIpklXq/A9PNh1FXgpCio5YDgpl0U=;
        b=ieL6Hiy/IeClq+oG2pspXDZGS7ADAhNSa1bxB5wiJbZMeto2olcZX1SlarfrVAyaaX
         lER0qw5CkDg/ZfSQS/l+6nkBGvySYrjrNMrTzuNy5o6mwo4gqqKow9iWkTZ8qC8kD9gv
         XQe2o5Qf8LZjqfHfhEjSMV3VVcsp9F1W0no8uQWILB87w6P7RpuoiXBasblOWCoj3781
         fxiPjZ2I5H1Bx+Ax0x7Li+yOHEPVYZd8lfUW1DqvcYj1w8zMNmii+IQEwnTguCD83vxs
         CXj4pPLq7SPOMRJ6yJv/LThxzbUADOw0vShefBXUY8VYKWpAa8ZG8TWBzAntoxeOuODm
         Upxg==
X-Gm-Message-State: ABy/qLaklvtHl131WEiQyk6LqIP4WypE334KBLVsxDZothD+VIUtYgRr
	LV+3AnsAqdPkwQMdpufvDIycMUBDGz9drYRXonjb1bX7064=
X-Google-Smtp-Source: APBJJlHzZgRATzxdC7kGqhsaCy5jV5epnWTg0LUyCnbY/zCR2Fu7oouXEkzjgP2oVPJ5y25cl/JXVVnsrdtd2ycU4mM=
X-Received: by 2002:a81:6646:0:b0:56d:8241:e067 with SMTP id
 a67-20020a816646000000b0056d8241e067mr3848423ywc.49.1688175642818; Fri, 30
 Jun 2023 18:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org> <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org> <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
 <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
 <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
 <e3f54279-db7a-973c-e792-712dc2b19eb7@xen.org> <CALqm=dfE=Ni0gzs8F692DmXzBs-EbqCs7sXenBt0qOGV=iyj0g@mail.gmail.com>
 <ebdfe8a6-7aee-a553-907e-e788c3b3df33@xen.org> <CALqm=ddPaaF8PG=ycb0u0iGHR+=35SV9taSo7Q-0FqH9QeMiEA@mail.gmail.com>
 <1ef5a5a6-01ea-4f3f-c05f-7dfd204a1861@xen.org> <CALqm=dd494P-BWCiemXJYgE4QbZ09MfE_bmae75LqGQcV=PiXA@mail.gmail.com>
 <8bf66b4a-7f3b-22e0-6c09-c003ac972fe5@xen.org>
In-Reply-To: <8bf66b4a-7f3b-22e0-6c09-c003ac972fe5@xen.org>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Sat, 1 Jul 2023 09:40:31 +0800
Message-ID: <CALqm=dfwCiFnCd6ypm3y3FtiiPeQjUE9m+w+J8vwNv6t47f0Yg@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="000000000000823df005ff6305e9"

--000000000000823df005ff6305e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

   Thank you for your answer. Do you have any advice on how to debug the
issue?
I have very little experience with xen so I think I still need
debugging even if I can
get MBI-gen's tech doc...

Best regards,
Jiatong Shen

On Fri, Jun 30, 2023 at 5:42=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:

> On 24/06/2023 15:54, Jiatong Shen wrote:
> > Hello Julien,
>
> Hi,
>
> >     Thank you very much for your reply. Can you teach me how to find th=
e
> > relationship between MBI-gen and devices?
> > I am not sure how to find out the mbi-gen backed devices..
>
> I am afraid I don't have any experience with the MBI-gen. I have also
> looked at one Hisilicon Device-Tree but I don't know whether this is the
> one for your board.
>
> My recommendation would be to check if there is any technical
> documentation for your HW.
>
> Cheers,
>
> --
> Julien Grall
>


--=20

Best Regards,

Jiatong Shen

--000000000000823df005ff6305e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div>=C2=A0 =C2=A0Thank you=
 for your answer. Do you have any advice on how to debug the issue?<br><div=
>I have very little experience=C2=A0with xen so I think I still need debugg=
ing=C2=A0even if I can</div><div>get MBI-gen&#39;s tech doc...</div><div><b=
r></div><div>Best=C2=A0regards,</div><div>Jiatong Shen</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 30,=
 2023 at 5:42=E2=80=AFAM Julien Grall &lt;<a href=3D"mailto:julien@xen.org"=
>julien@xen.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 24/06/2023 15:54, Jiatong Shen wrote:<br>
&gt; Hello Julien,<br>
<br>
Hi,<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you very much for your reply. Can you teach m=
e how to find the<br>
&gt; relationship between MBI-gen and devices?<br>
&gt; I am not sure how to find out the mbi-gen backed devices..<br>
<br>
I am afraid I don&#39;t have any experience with the MBI-gen. I have also <=
br>
looked at one Hisilicon Device-Tree but I don&#39;t know whether this is th=
e <br>
one for your board.<br>
<br>
My recommendation would be to check if there is any technical <br>
documentation for your HW.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>

--000000000000823df005ff6305e9--

