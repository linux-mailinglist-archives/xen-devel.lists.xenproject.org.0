Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115E49D695
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 01:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261128.451797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCsNQ-0006PE-OR; Thu, 27 Jan 2022 00:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261128.451797; Thu, 27 Jan 2022 00:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCsNQ-0006Mw-KA; Thu, 27 Jan 2022 00:11:00 +0000
Received: by outflank-mailman (input) for mailman id 261128;
 Thu, 27 Jan 2022 00:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3iz=SL=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1nCsNO-0006Mq-T7
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 00:10:59 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 992dfc3f-7f05-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 01:10:57 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id m14so1486675wrg.12
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jan 2022 16:10:56 -0800 (PST)
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
X-Inumbo-ID: 992dfc3f-7f05-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vcSDCFPWamzyk0RDlatb76L3ISdO2FxUY09zc8w6UKw=;
        b=TgWCpk89f6uIxfMYGcvFZnE13JzHgyzflAuMwZl/HRrk+2nANBtbL4DkLn49RHQ+gx
         mjgQisuKTCDCuba1qi8ajyAhDyHz7B1ncyKuO/2oPjlcsw1ouRtH9DKnmx78j3Iy5Weu
         mxaUeD9B7HxPSYOn4SBgjKqdT4gADjxzCOPmWMO9UBIg4o4Up8keh0R41ppAsWVoW3wB
         C44kQ4wmq2LZD0gWnv92NN48otMhQJYCXiWbYY2JLIPkyhmokj0mG/edb+r+hl3dOouR
         RwQ6c5tkiG31ylWo30sBuVVFCgcLKPBdQqjUrEzqJEVskqPx3NQc8wvCq+pkE7vZekqk
         If8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vcSDCFPWamzyk0RDlatb76L3ISdO2FxUY09zc8w6UKw=;
        b=HA7MQlypiOfRd2rEtSA4j3yPSe7CDWCEEQbfmqZwGFE3zHAp5vUyFdG48CBqyD/zd0
         lR/DvMXXRTEaOLze+RSQvo+45AfcFz1UhBe90icDrBgnittfJJRspdBVbpy02/BeZsF8
         VlXcZby0rMQky5v5Mm0YDQhwZg1b5r+SABectqjWjXiUYxuYtf1sU+U8zxi3SCPAvn18
         R0ifT/H4D5aeCxr7iec/f7j4hNbMQDw7k7oGVWSFqJg+K69aka6q1/Mx9+c+5DmMVlNM
         SO3+D0Wo4eVGYz1KfVD12faB6uygZuzOPx2o3jDn+w0F+uBW8sPLQJD12/HlLmJzv9SJ
         vfeg==
X-Gm-Message-State: AOAM533diFH/jK7zaqW3nQpXhQy6iyZLVxxSlZ0+kb7oHwxLjGMGBZyt
	UAUPz7KP5yfvVq1cbf9ARRR5cKymsRjnVrHEiWs=
X-Google-Smtp-Source: ABdhPJwlkYS8PaofP3a79dvdROZYdrJwHnhYZjSVq5W7rYkWDa0v6uL8e06rX3p+oWk2VEuNm8vAtS41QZXuEiSf/w8=
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr854219wrx.230.1643242255842;
 Wed, 26 Jan 2022 16:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
In-Reply-To: <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 27 Jan 2022 00:10:42 +0000
Message-ID: <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000f07fe905d6852608"

--000000000000f07fe905d6852608
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder, <ayan.kumar.halder@xilinx.com>
wrote:

> Hi Julien,
> On 26/01/2022 17:22, Julien Grall wrote:
>
> Hi,
>
> On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder, <
> ayan.kumar.halder@xilinx.com> wrote:
>
>> Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding for an
>> exception
>> from a Data Abort" :-
>> ISV - ISS[23:14] holds a valid instruction syndrome
>>
>> When the ISV is 0, the instruction could not be decoded by the hardware
>> (ie ISS
>> is invalid). One should immediately return an error to the caller with an
>> appropriate error message.
>
>
> That's going to be very spammy because we have use-case where it could
> trap without a valid ISV (e.g. when break-before-make happens). So please
> don't had a message.
>
> There is already a logging statement in traps.c :-
>
> inject_abt:
>     gdprintk(XENLOG_DEBUG,
>              "HSR=%#"PRIregister" pc=%#"PRIregister" gva=%#"PRIvaddr"
> gpa=%#"PRIpaddr"\n",
>              hsr.bits, regs->pc, gva, gpa);
>
> The reason for the error is to give the user some hint that an IO abort is
> triggered by Xen.
>
The main difference here is inject_dabt should only be reached when we
exhausted all the possibility in I/O handling.

In your case, if we can't handle as an MMIO then we should fallthrough the
other method (see do_trap_stage2_abort_guest()).

In fact, moving the check early and doing the decoding before find_mmio()
or try_fwd_io() is actually wrong. Sorry I should realized that earlier.

So we want to provide an helper that will do the dabt.vid check and do the
decoding. The helper will be called in 2 places.

With that in place, then I agree the gprintk could be kept in place.

Can we keep the error message ?
>
> Also, I think this is a duplicate check
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=308650b40051825fdea78bb33bfbcc87ef5deaff;hb=HEAD#l79
> , I will remove this in v2 if it makes sense.
>
> - Ayan
>
>
> That makes me think that the same will be valid for your other patch.
>
> There is no use of the MMIO handler. This is the
>> reason why one should check for ISV before attempting to find a MMIO
>> handler.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Suggested by Julien Grall in
>> https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>>
>>  xen/arch/arm/io.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..14d39222f2 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs,
>>
>>      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>
>> +    /* All the instructions used on emulated MMIO region should be valid
>> */
>> +    if ( !dabt.valid )
>> +    {
>> +        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for data
>> abort\n");
>> +        return IO_ABORT;
>> +    }
>> +
>>      handler = find_mmio_handler(v->domain, info.gpa);
>>      if ( !handler )
>>      {
>> @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs,
>>          return rc;
>>      }
>>
>> -    /* All the instructions used on emulated MMIO region should be valid
>> */
>> -    if ( !dabt.valid )
>> -        return IO_ABORT;
>> -
>>      /*
>>       * Erratum 766422: Thumb store translation fault to Hypervisor may
>>       * not have correct HSR Rt value.
>> --
>> 2.17
>>
>

--000000000000f07fe905d6852608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder, &lt;<=
a href=3D"mailto:ayan.kumar.halder@xilinx.com">ayan.kumar.halder@xilinx.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi Julien,</p>
    <div>On 26/01/2022 17:22, Julien Grall
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div>Hi,<br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Wed, 26 Jan 2022, 16:5=
8
              Ayan Kumar Halder, &lt;<a href=3D"mailto:ayan.kumar.halder@xi=
linx.com" target=3D"_blank" rel=3D"noreferrer">ayan.kumar.halder@xilinx.com=
</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Refer to
              Armv8 ARM DDI 0487G.b, Page D13-3219 &quot;ISS encoding for a=
n
              exception<br>
              from a Data Abort&quot; :-<br>
              ISV - ISS[23:14] holds a valid instruction syndrome<br>
              <br>
              When the ISV is 0, the instruction could not be decoded by
              the hardware (ie ISS<br>
              is invalid). One should immediately return an error to the
              caller with an<br>
              appropriate error message. </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">That&#39;s going to be very spammy because we hav=
e
          use-case where it could trap without a valid ISV (e.g. when
          break-before-make happens). So please don&#39;t had a message.</d=
iv>
      </div>
    </blockquote>
    <p>There is already a logging statement in traps.c :-</p>
    <p>inject_abt:<br>
      =C2=A0=C2=A0=C2=A0 gdprintk(XENLOG_DEBUG,<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;HSR=3D%#&quot;PRIregister&quot; pc=3D%#&quot;PRIregister&quot;
      gva=3D%#&quot;PRIvaddr&quot; gpa=3D%#&quot;PRIpaddr&quot;\n&quot;,<br=
>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 hsr.bits, regs-&gt;pc, gva, gpa);<br>
    </p>
    <p>The reason for the error is to give the user some hint that an IO
      abort is triggered by Xen. </p></div></blockquote></div></div><div di=
r=3D"auto">The main difference here is inject_dabt should only be reached w=
hen we exhausted all the possibility in I/O handling.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">In your case, if we can&#39;t handle as an MM=
IO then we should fallthrough the other method (see do_trap_stage2_abort_gu=
est()).</div><div dir=3D"auto"><br></div><div dir=3D"auto">In fact, moving =
the check early and doing the decoding before find_mmio() or try_fwd_io() i=
s actually wrong. Sorry I should realized that earlier.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">So we want to provide an helper that will d=
o the dabt.vid check and do the decoding. The helper will be called in 2 pl=
aces.</div><div dir=3D"auto"><br></div><div dir=3D"auto">With that in place=
, then I agree the gprintk could be kept in place.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div><p>Can we keep the error message ?<br>
    </p>
    <p>Also, I think this is a duplicate check
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/arc=
h/arm/ioreq.c;h=3D308650b40051825fdea78bb33bfbcc87ef5deaff;hb=3DHEAD#l79" t=
arget=3D"_blank" rel=3D"noreferrer">https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dblob;f=3Dxen/arch/arm/ioreq.c;h=3D308650b40051825fdea78bb33bfbcc87=
ef5deaff;hb=3DHEAD#l79</a>
      , I will remove this in v2 if it makes sense.</p>
    <p>- Ayan<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"auto">
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">That makes me think that the same will be valid
          for your other patch.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">There is
              no use of the MMIO handler. This is the<br>
              reason why one should check for ISV before attempting to
              find a MMIO handler.<br>
              <br>
              Signed-off-by: Ayan Kumar Halder &lt;<a href=3D"mailto:ayanku=
ma@xilinx.com" rel=3D"noreferrer noreferrer" target=3D"_blank">ayankuma@xil=
inx.com</a>&gt;<br>
              ---<br>
              <br>
              Suggested by Julien Grall in <a href=3D"https://lists.xenproj=
ect.org/archives/html/xen-devel/2022-01/msg01245.html" rel=3D"noreferrer no=
referrer noreferrer" target=3D"_blank">https://lists.xenproject.org/archive=
s/html/xen-devel/2022-01/msg01245.html</a><br>
              <br>
              =C2=A0xen/arch/arm/io.c | 11 +++++++----<br>
              =C2=A01 file changed, 7 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c<br>
              index 729287e37c..14d39222f2 100644<br>
              --- a/xen/arch/arm/io.c<br>
              +++ b/xen/arch/arm/io.c<br>
              @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct
              cpu_user_regs *regs,<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0ASSERT(<a href=3D"http://hsr.ec" rel=3D"n=
oreferrer
                noreferrer noreferrer" target=3D"_blank">hsr.ec</a>
              =3D=3D HSR_EC_DATA_ABORT_LOWER_EL);<br>
              <br>
              +=C2=A0 =C2=A0 /* All the instructions used on emulated MMIO =
region
              should be valid */<br>
              +=C2=A0 =C2=A0 if ( !dabt.valid )<br>
              +=C2=A0 =C2=A0 {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gprintk(XENLOG_DEBUG, &quot;No v=
alid instruction
              syndrome for data abort\n&quot;);<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
              +=C2=A0 =C2=A0 }<br>
              +<br>
              =C2=A0 =C2=A0 =C2=A0handler =3D find_mmio_handler(v-&gt;domai=
n, info.gpa);<br>
              =C2=A0 =C2=A0 =C2=A0if ( !handler )<br>
              =C2=A0 =C2=A0 =C2=A0{<br>
              @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct
              cpu_user_regs *regs,<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
              =C2=A0 =C2=A0 =C2=A0}<br>
              <br>
              -=C2=A0 =C2=A0 /* All the instructions used on emulated MMIO =
region
              should be valid */<br>
              -=C2=A0 =C2=A0 if ( !dabt.valid )<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
              -<br>
              =C2=A0 =C2=A0 =C2=A0/*<br>
              =C2=A0 =C2=A0 =C2=A0 * Erratum 766422: Thumb store translatio=
n fault to
              Hypervisor may<br>
              =C2=A0 =C2=A0 =C2=A0 * not have correct HSR Rt value.<br>
              -- <br>
              2.17<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div></div>

--000000000000f07fe905d6852608--

