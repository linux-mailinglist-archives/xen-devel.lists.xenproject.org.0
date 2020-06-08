Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816E1F1778
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFqM-0001Un-Et; Mon, 08 Jun 2020 11:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiFqK-0001Ui-Gg
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:21:28 +0000
X-Inumbo-ID: 31ad8e14-a97a-11ea-9b55-bc764e2007e4
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31ad8e14-a97a-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 11:21:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id f7so17844828ejq.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ipvRKQ4Fi0WbyIWCm3U4H8VkCZHz7OATbGhtwXc+yaI=;
 b=tFkLSDfcwP0q2+wz6LaEXRyu1R4zcIbE8nbRGLbKgUasMWM7Ay+56ZwTCM3ZIgB7T2
 CYfVvOf/jhKGHokP+yGIgb0cZgIsGG2n4zZ864CrqsmjQ5/g5gwDHJeZc1/zQn6rnLjQ
 nKk0nrHDgzMX3RLFfDHryl5Y4gQdM+l6OEQ9FYCJyMu9AVevmnXZZLGiZDFt324WLoGV
 AXXiquuwrZX8K5AX6evdtcsHVTXgEGMMXJdieRSbQGv94jqI2B6kwuy8fVuo64VIeM6G
 Jmjf8ErKyldD5IH4zuf4g/E3AqpySBhaEdQiyvI+TJAbXbsFob1OAJkGCB3Hk946kL7Z
 ysxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ipvRKQ4Fi0WbyIWCm3U4H8VkCZHz7OATbGhtwXc+yaI=;
 b=IT+TQK+D8xOD5s7YVP2K0Yisqjy+8c72F8FdQQmf640b464Lj70pYdMbvlhN8GMBA/
 CSzTQYi35YCG7pdnrtyWrYuKYn9kLRpfsHZ/1w/90rQkNDAbILL86MSVp5Qfx89qhD9L
 VK94fIp1/6q0aYBBrs9A6oe6XqSRUbYKOxqXycNW5MrPpMseVzUWf0PEdGeuBq7F2vzq
 peJihrAa9vNqvZPnOxfSOCifeBY74vuDqa6yeqqOGA1h0NOMdF5t8aOHnrFtGu3KkpEE
 4V33u6Ipw2HWlWHptq7SyACuSUp0Lil9RmP6n0AM/n1w2gc/+AV5/3DdmQwcsqUSElg6
 aJIg==
X-Gm-Message-State: AOAM532janNNKmXZddVTwUM+qmcKxT81qDK92BBlRIQ49PdkXZDBwngR
 SFkj9b50nxCWzq+ZdqxXIj4=
X-Google-Smtp-Source: ABdhPJxzutSEZMTr01UtXUTNBvI0z59RbeQF3qWaOWFpjb/mjSxiUnNhYeUaHmoSVSdoqGJiqc6TCA==
X-Received: by 2002:a17:906:76c4:: with SMTP id
 q4mr21519622ejn.371.1591615286900; 
 Mon, 08 Jun 2020 04:21:26 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id z26sm9130525edm.1.2020.06.08.04.21.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:21:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200608094619.28336-1-paul@xen.org>
 <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
 <002a01d63d84$9c351430$d49f3c90$@xen.org>
 <f606e364-9ec0-2766-072f-6485afd2baae@suse.com>
In-Reply-To: <f606e364-9ec0-2766-072f-6485afd2baae@suse.com>
Subject: RE: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
Date: Mon, 8 Jun 2020 12:21:25 +0100
Message-ID: <002d01d63d86$f2c35d50$d84a17f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG4RzFDVM83uzCFIZn1YivdDmazZAHQan7RAPjCHYMBYWkEHKjpKGxA
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 08 June 2020 12:10
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Marek Marczykowski-G=C3=B3recki'
> <marmarek@invisiblethingslab.com>
> Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing =
with ioreq server destruction
>=20
> On 08.06.2020 13:04, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 08 June 2020 11:58
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Marek Marczykowski-G=C3=B3recki
> >> <marmarek@invisiblethingslab.com>
> >> Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation =
racing with ioreq server destruction
> >>
> >> On 08.06.2020 11:46, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> When an emulation request is initiated in hvm_send_ioreq() the =
guest vcpu is
> >>> blocked on an event channel until that request is completed. If, =
however,
> >>> the emulator is killed whilst that emulation is pending then the =
ioreq
> >>> server may be destroyed. Thus when the vcpu is awoken the code in
> >>> handle_hvm_io_completion() will find no pending request to wait =
for, but will
> >>> leave the internal vcpu io_req.state set to IOREQ_READY and the =
vcpu shutdown
> >>> deferall flag in place (because hvm_io_assist() will never be =
called). The
> >>> emulation request is then completed anyway. This means that any =
subsequent call
> >>> to hvmemul_do_io() will find an unexpected value in io_req.state =
and will
> >>> return X86EMUL_UNHANDLEABLE, which in some cases will result in =
continuous
> >>> re-tries.
> >>>
> >>> This patch fixes the issue by moving the setting of io_req.state =
and clearing
> >>> of shutdown deferral (as will as MSI-X write completion) out of =
hvm_io_assist()
> >>> and directly into handle_hvm_io_completion().
> >>>
> >>> Reported-by: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> >>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> with a question:
> >>
> >>> --- a/xen/arch/x86/hvm/ioreq.c
> >>> +++ b/xen/arch/x86/hvm/ioreq.c
> >>> @@ -109,15 +109,7 @@ static void hvm_io_assist(struct =
hvm_ioreq_vcpu *sv, uint64_t data)
> >>>      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> >>>
> >>>      if ( hvm_ioreq_needs_completion(ioreq) )
> >>> -    {
> >>> -        ioreq->state =3D STATE_IORESP_READY;
> >>>          ioreq->data =3D data;
> >>> -    }
> >>> -    else
> >>> -        ioreq->state =3D STATE_IOREQ_NONE;
> >>> -
> >>> -    msix_write_completion(v);
> >>> -    vcpu_end_shutdown_deferral(v);
> >>>
> >>>      sv->pending =3D false;
> >>>  }
> >>
> >> With this, is the function worth keeping at all?
> >
> > I did think about that, but it is called in more than one place. So, =
in the interest of trying to
> make back-porting straightforward, I thought it best to keep it =
simple.
> >
> >>
> >> Also I assume the patch has your implied R-a-b?
> >>
> >
> > Since it has your R-b now, yes :-)
>=20
> Thanks. As said in the other thread, I think the change here will mask
> a problem elsewhere (presumably in qemu). I'm therefore unsure whether
> we want to apply it right away, rather than first understanding the
> root cause of Marek's specific problem.
>=20

I think it ought to be applied right away since an emulator could die at =
any time and we don't really want the vcpu constantly bouncing in this =
case. Also, thinking of using emulators other than qemu, it's not =
necessarily a bug if they deregister at an arbitrary time... In fact it =
takes my mind back to PCMCIA cards, when device drivers had to be robust =
to them disappearing during an I/O cycle.

  Paul

> Jan


