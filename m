Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707A81EEA0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Dec 2023 12:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660117.1029701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rISKC-0004al-V1; Wed, 27 Dec 2023 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660117.1029701; Wed, 27 Dec 2023 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rISKC-0004YQ-RQ; Wed, 27 Dec 2023 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 660117;
 Wed, 27 Dec 2023 11:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lso=IG=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rISKB-0004YK-Bp
 for xen-devel@lists.xenproject.org; Wed, 27 Dec 2023 11:43:47 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30fbdeef-a4ad-11ee-98ed-6d05b1d4d9a1;
 Wed, 27 Dec 2023 12:43:46 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3bb53e20a43so4107489b6e.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Dec 2023 03:43:46 -0800 (PST)
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
X-Inumbo-ID: 30fbdeef-a4ad-11ee-98ed-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703677425; x=1704282225; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oOhXN8s7Nt0H5YOY9yNjrhmjSW2zugmbbzNMOfcr8TM=;
        b=Qgl+QbfXGj2dfLWSLsxh4P3/FZdykvkbFwpVa768fjK7HtDqx5BLN2AetxMKB6+Vz7
         JK6twFD8gw3RXQRcZo1cGRZfWvVLQhpFXBwuomwOQA7h7MEext9Kb/xrMfyDk5KsMSTf
         Nke/BZ5nWknr7lOaHBgpnME77F0BBRXGIc0WOerLUMqB8/DqIFg1vmWDPkd23lsdhsrH
         3kEi2dOTTBZM8amrKxGRM0PY3NgUxuNJqQxdfouVakDlSdz8fMeowLf5jTo/mhf4GKX9
         +TSJ78Y6HyPn0aOuVtcaXnAe2kkrWzqFSmm8S2LuVPIUPcxziLCb8D9wIYhFqQH1WJC4
         JtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703677425; x=1704282225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOhXN8s7Nt0H5YOY9yNjrhmjSW2zugmbbzNMOfcr8TM=;
        b=tqhhGNjIXL/l9QkPOwBTQVVb7fdYtu5tx8+hcXBk5Z4Wa3TDKmHCqQ3cQqGwlB8MbQ
         NeUIFgxA5j8BMtK1ejGhMjbGg/vb4hO1hBPYcHehjoumZxguRt1PZoeNW2P8MoU6wthx
         U+kif8w3H5CEMgL5+hg8mGJlwOKBDIy7OU6qBWPHpxwwllHi6KRFx43ridPbKc7e9kfh
         8Nr3wxXbkKet7uOxOoi6RpBmhOdFnn8I0dJjL2EOzBEBxW5vRieGcurZXvbpiY+5PnFd
         LcAwHMGVZHCuSeBwVCmM2NGPlKmZpOlB9b7jIbyv5P+qIc0Vs1FptRfBTtYA7IAqmX6b
         gY3Q==
X-Gm-Message-State: AOJu0YwdOlYNxkv4dEtCdnWQODgPPsOcSNGheiO4KhSdMbwJyDnWQ0Jb
	XVGKUCpPB9NHi2DNipGvn2F9XnU13uujmiq74cI=
X-Google-Smtp-Source: AGHT+IGwLIogvffU57U/DOoZoW7+BjXt4EbdIs4ZnVmqsutZYJR3hq4JAl5cenEVoilh1/Vc0+t82iGZVPrcJHSWqbo=
X-Received: by 2002:a05:6808:180e:b0:3b9:e80b:708e with SMTP id
 bh14-20020a056808180e00b003b9e80b708emr10496396oib.82.1703677424703; Wed, 27
 Dec 2023 03:43:44 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com> <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com> <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com> <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com> <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
In-Reply-To: <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 27 Dec 2023 12:43:33 +0100
Message-ID: <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000b61bfd060d7c4f51"

--000000000000b61bfd060d7c4f51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 22 d=C3=A9c. 2023 =C3=A0 15:37, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

> By request of the laptop vendor (Framework) I'm going to open the bug
> @fedora for them to jump in.
>
>
>> > I noticed that on baremetal :
>> >
>> >   53:          0          0          0          0          0       126=
8
>> >      0          0          0          0          0          0         =
 0
>> >        0          0          0  amd_gpio    5  FRMW0005:00
>> >   54:          0          0          0          0          0          =
1
>> >      0          0          0          0          0          0         =
 0
>> >        0          0          0  amd_gpio   84  FRMW0004:00
>> >   55:          0          0          0          0          0       140=
3
>> >      0          0          0          0          0          0         =
 0
>> >        0          0          0  amd_gpio    8  PIXA3854:00
>> >
>> > with xen with IRQ7 setup only once there's only (the touchpad is
>> > PIXA3854:00)
>> >
>> >  176:          0          0          0          0          0          =
0
>> >      1          0          0          0          0          0         =
 0
>> >        0          0          0  amd_gpio    8
>> >
>>
> > Interestingly when IRQ7 is setup twice (normal xen)
>> >  176:          0          0          0          0          0          =
0
>> >      1          0          0          0          0          0         =
 0
>> >        0          0          0  amd_gpio    8  PIXA3854:00
>>
>> That's odd, as with IRQ7 (wrongly) setup as edge, it should also be mark=
ed
>> as non-sharable. Otoh with the "i2c-PIXA3854:00:" error above it's no
>> surprise no interrupt is set up there.
>>
>
> forget this one, I made a mistake when skipping IRQ7.
>
> The "amd_gpio    8  PIXA3854:00"for  IRQ176 is identical with or without
> IRQ7 double initialization
>

 output of gpioinfo

kernel alone :

        line   5: unnamed         input active-low consumer=3Dinterrupt
        line  84: unnamed         input active-low consumer=3Dinterrupt

xen:

        line   5: unnamed         input active-low
        line  84: unnamed         input active-low

xen with skipping IRQ7 double init :

        line   5: unnamed         input active-low consumer=3Dinterrupt
        line  84: unnamed         input active-low


So definitely progressing.

--000000000000b61bfd060d7c4f51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkxlwqB2ZW4uIDIy
IGTDqWMuIDIwMjMgw6DCoDE1OjM3LCBTw6liYXN0aWVuIENoYXVtYXQgJmx0OzxhIGhyZWY9Im1h
aWx0bzpldWlkemVyb0BnbWFpbC5jb20iPmV1aWR6ZXJvQGdtYWlsLmNvbTwvYT4mZ3Q7IGEgw6lj
cml0wqA6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2PkJ5IHJlcXVlc3Qgb2Yg
dGhlIGxhcHRvcCB2ZW5kb3IgKEZyYW1ld29yaykgSSYjMzk7bSBnb2luZyB0byBvcGVuIHRoZSBi
dWcgQGZlZG9yYSBmb3IgdGhlbSB0byBqdW1wIGluLjwvZGl2PjxzcGFuPjxkaXY+wqA8L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+Jmd0OyBJIG5vdGljZWQgdGhhdCBvbiBiYXJlbWV0YWwgOjxicj4NCiZndDsgPGJyPg0K
Jmd0O8KgIMKgNTM6wqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDC
oCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoDEyNjg8YnI+DQom
Z3Q7wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAg
wqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMDxicj4N
CiZndDvCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCBhbWRf
Z3Bpb8KgIMKgIDXCoCBGUk1XMDAwNTowMDxicj4NCiZndDvCoCDCoDU0OsKgIMKgIMKgIMKgIMKg
IDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDC
oCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMTxicj4NCiZndDvCoCDCoCDCoCAwwqAgwqAgwqAgwqAg
wqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKg
IMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIDDCoCDCoCDC
oCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIGFtZF9ncGlvwqAgwqA4NMKgIEZSTVcwMDA0OjAw
PGJyPg0KJmd0O8KgIMKgNTU6wqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDC
oCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoDE0MDM8
YnI+DQomZ3Q7wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAg
wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAg
MDxicj4NCiZndDvCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDC
oCBhbWRfZ3Bpb8KgIMKgIDjCoCBQSVhBMzg1NDowMDxicj4NCiZndDsgPGJyPg0KJmd0OyB3aXRo
IHhlbiB3aXRoIElSUTcgc2V0dXAgb25seSBvbmNlIHRoZXJlJiMzOTtzIG9ubHkgKHRoZSB0b3Vj
aHBhZCBpczxicj4NCiZndDsgUElYQTM4NTQ6MDApPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgMTc2
OsKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKg
IMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMDxicj4NCiZndDvCoCDCoCDC
oCAxwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAg
wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIGFtZF9ncGlvwqAgwqAg
ODxicj4NCiZndDvCoCA8YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDsgSW50ZXJlc3Rpbmds
eSB3aGVuIElSUTcgaXMgc2V0dXAgdHdpY2UgKG5vcm1hbCB4ZW4pPGJyPg0KJmd0O8KgIDE3NjrC
oCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDC
oCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDA8YnI+DQomZ3Q7wqAgwqAgwqAg
McKgIMKgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKg
IMKgIMKgIDDCoCDCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgMDxicj4NCiZndDvCoCDCoCDC
oCDCoCAwwqAgwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIDDCoCBhbWRfZ3Bpb8KgIMKgIDjC
oCBQSVhBMzg1NDowMDxicj4NCjxicj4NClRoYXQmIzM5O3Mgb2RkLCBhcyB3aXRoIElSUTcgKHdy
b25nbHkpIHNldHVwIGFzIGVkZ2UsIGl0IHNob3VsZCBhbHNvIGJlIG1hcmtlZDxicj4NCmFzIG5v
bi1zaGFyYWJsZS4gT3RvaCB3aXRoIHRoZSAmcXVvdDtpMmMtUElYQTM4NTQ6MDA6JnF1b3Q7IGVy
cm9yIGFib3ZlIGl0JiMzOTtzIG5vPGJyPg0Kc3VycHJpc2Ugbm8gaW50ZXJydXB0IGlzIHNldCB1
cCB0aGVyZS48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pjwvc3Bhbj48ZGl2PmZvcmdl
dCB0aGlzIG9uZSwgSSBtYWRlIGEgbWlzdGFrZSB3aGVuIHNraXBwaW5nIElSUTcuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5UaGUgJnF1b3Q7YW1kX2dwaW/CoCDCoCA4wqAgUElYQTM4NTQ6MDAm
cXVvdDtmb3LCoCBJUlExNzYgaXMgaWRlbnRpY2FsIHdpdGggb3Igd2l0aG91dCBJUlE3IGRvdWJs
ZSBpbml0aWFsaXphdGlvbjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48
ZGl2PsKgb3V0cHV0IG9mIGdwaW9pbmZvPGJyPjxicj5rZXJuZWwgYWxvbmUgOjxicj48YnI+wqAg
wqAgwqAgwqAgbGluZSDCoCA1Ogl1bm5hbWVkIMKgIMKgIMKgIMKgIAlpbnB1dCBhY3RpdmUtbG93
IGNvbnN1bWVyPWludGVycnVwdDxicj7CoMKgwqDCoMKgwqDCoCBsaW5lIMKgODQ6CXVubmFtZWQg
wqAgwqAgwqAgwqAgCWlucHV0IGFjdGl2ZS1sb3cgY29uc3VtZXI9aW50ZXJydXB0PGJyPjxicj54
ZW46PGJyPjxicj7CoMKgwqDCoMKgwqDCoCBsaW5lIMKgIDU6CXVubmFtZWQgwqAgwqAgwqAgwqAg
CWlucHV0IGFjdGl2ZS1sb3c8YnI+wqDCoMKgwqDCoMKgwqAgbGluZSDCoDg0Ogl1bm5hbWVkIMKg
IMKgIMKgIMKgIAlpbnB1dCBhY3RpdmUtbG93PGJyPjxicj54ZW4gd2l0aCBza2lwcGluZyBJUlE3
IGRvdWJsZSBpbml0IDo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIGxpbmUg
wqAgNToJdW5uYW1lZCDCoCDCoCDCoCDCoCAJaW5wdXQgYWN0aXZlLWxvdyBjb25zdW1lcj1pbnRl
cnJ1cHQ8YnI+wqDCoMKgwqDCoMKgwqAgbGluZSDCoDg0Ogl1bm5hbWVkIMKgIMKgIMKgIMKgIAlp
bnB1dCBhY3RpdmUtbG93PGJyPjxicj48YnI+U28gZGVmaW5pdGVseSBwcm9ncmVzc2luZy48L2Rp
dj48L2Rpdj48L2Rpdj4NCg==
--000000000000b61bfd060d7c4f51--

