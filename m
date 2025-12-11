Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A625CB66B6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184339.1506817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjBH-0008Oa-4G; Thu, 11 Dec 2025 16:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184339.1506817; Thu, 11 Dec 2025 16:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjBH-0008NM-05; Thu, 11 Dec 2025 16:06:15 +0000
Received: by outflank-mailman (input) for mailman id 1184339;
 Thu, 11 Dec 2025 16:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTjBF-0008NF-0b
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:06:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee626e3-d6ab-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 17:06:10 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-37ce27af365so2618501fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 08:06:10 -0800 (PST)
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
X-Inumbo-ID: 4ee626e3-d6ab-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765469169; x=1766073969; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw6Q0WtKGN+v4sotq/Wa9bg3qt5VJBTZHaZo2s/DpCo=;
        b=SpGi5c7E9pHVmr50q2RhRqf/6FJQggb0QKOTXbDS65c2oaSGKrdoU6z7zA+MXq8TXu
         70vHgu2LF5W0qh0cJqLUWw5KN2U6b25Xll0uOqDwTRu7xMIG+kZ+/5BB4LBv9ZvH5o+r
         ybjp0AuBRNsRFnKlUogaztNvW/Bo8JCCOLtWyO35bKI2MrRal6WOKwtiIGVp06AzyoiH
         SX1RL5T1sLVgBy0WoYTrwagwmNHjLXlBdYtqb5YNvhnbot1/qk5CymZm4WRDf5C8YFmg
         oneXGk0hT68UjzASo+FQqnLLAhQsWaDlurLx4Xlhn/8d4ErxGK/6HHXNF+Mw8hWcI/WV
         rnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765469169; x=1766073969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw6Q0WtKGN+v4sotq/Wa9bg3qt5VJBTZHaZo2s/DpCo=;
        b=NJg86lyNjgW/kD5nNMS68kzfh42oumKeghuGiqLCtc6rPtoCVB0SRp7AyhMw1VaFML
         sW6/V5U6Iw5SlOAaCAHyo17i7qlSW4+FWBUg2gydoTAagPtWS3eB4r0D2CcCDP8oodaf
         j3FmX3LKRh1kuMVcjUBaS1621uBHhPNCzxzE/FoUdI6OFxa5bUVhjMo7m8JNbWKb0AiF
         JtrvY6bzeeK4npHcSEiJs65xh/7RKem370+ChSGSPavxb1bk5H/C2VGD5J1IhXjV/p35
         g5AWs4WPOiX13DYlOc3kwaFn9/YLeNOZWO7s8FQlfT69hI9iW9wDCIKHELNARbOX8T7W
         H7ZA==
X-Gm-Message-State: AOJu0YwRXwTfxDRgZoAcwOl3yrHSbQIf8jfe2nMr1PxLPnSR7dupe0P0
	kJMe6lXzzjfsmQENdLIH9Whw+65M7/HPIYjVKZuZoRCxX04S14ErlfJMzZwAa6OwH0cFeEnHKgV
	QttRLYT0x8B2vnxeefufLY1V4csDJNNPNfPrqJso=
X-Gm-Gg: AY/fxX4XLEFY6Vg8benTe3NX3qOrFbBVrBtMbYzZmgeeuMBjY7W3+ZayX8zHxNkPPWB
	M8eAmFNBELaTPFf4hbVqrxJ5AaERBkYf4zIx3tOQmDk3zn3GOgukRCltsP/zyT1/UqKFAC8dx8r
	jBKAqTAdJ/L6lnuEl4x05nlRc5q9XhA1eQmYeufFTChDGGluTpOyCpPY8lkoTthus+i8uSiZ0KO
	M0mhQwsGmqNb8UmLKTJtNIBlYqoVRHAULtfSqQbKdA/rG2KWE00q67KU49l87wvrI6uxyo=
X-Google-Smtp-Source: AGHT+IGIcsO5/h043hViqLO9GzYt6zedoLnR7mhFsmtH4zMYTkU7hPVNF9PEnjbl5jLQQz6yeQL+zO8VNOQHy76lsS4=
X-Received: by 2002:a2e:bc20:0:b0:37a:8acb:a052 with SMTP id
 38308e7fff4ca-37fb2078d7dmr20016071fa.10.1765469169295; Thu, 11 Dec 2025
 08:06:09 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com> <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
In-Reply-To: <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 18:05:57 +0200
X-Gm-Features: AQt7F2pvOG2XUuWqudx8wK9ykn141dSgwjxIcpqSP6R5cXK4lmvaN8igMm1w1FU
Message-ID: <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="000000000000b2c9980645af5202"

--000000000000b2c9980645af5202
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 5:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 16:57, Mykola Kvach wrote:
> > On Thu, Dec 11, 2025 at 5:31=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 11.12.2025 13:06, Mykola Kvach wrote:
> >>> On Thu, Dec 11, 2025 at 1:44=E2=80=AFPM Mykola Kvach <xakep.amatop@gm=
ail.com> wrote:
> >>>> I tested the issue with the provided patch, and it is still reproduc=
ible.
> >>>
> >>> I also triggered a pipeline with the patch you provided on top of my
> >>> changes [1],
> >>> and it failed there as well. In fact, it exposed additional problems
> >>> in other jobs.
> >>>
> >>> [1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipeline=
s/2209153728
> >>
> >> These are the failures we're trying to hunt down.
> >>
> >> Looking at one of the Arm build logs, I can't see any indication that =
you actually
> >> extended the patch to Arm's linking rule. Hence my conclusion in the o=
ther reply
> >> may be wrong - we simply still don't know what the situation is there.
> >
> > You're right, I missed the necessary changes. Would this diff be suffic=
ient?
>
> Yes, this looks to be what is needed.

Unfortunately, with this diff applied the issue is still reproducible
on my side.
Please see the attached logs for details.


Mykola

>
> Jan
>
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -100,6 +100,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> >                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort=
 \
> >                 > $(dot-target).2.S
> >         $(MAKE) $(build)=3D$(@D) $(dot-target).2.o
> > +       $(call compare-symbol-tables,$(dot-target).1.o,$(dot-target).2.=
o)
> >         $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> >             $(dot-target).2.o -o $@
> >         $(NM) -pa --format=3Dsysv $@ \
> >
> >
> >>
> >> Jan
> >
> > Best regards,
> > Mykola
>

--000000000000b2c9980645af5202
Content-Type: text/x-log; charset="US-ASCII"; name="boot.log"
Content-Disposition: attachment; filename="boot.log"
Content-Transfer-Encoding: base64
Content-ID: <f_mj1mmzle1>
X-Attachment-Id: f_mj1mmzle1

WGVuIDQuMjItdW5zdGFibGUKKFhFTikgWyAgICAwLjAwOTY4MV0gWGVuIHZlcnNpb24gNC4yMi11
bnN0YWJsZSAocm9vdEApIChnY2MgKEFscGluZSAxMi4yLjFfZ2l0MjAyMjA5MjQtcjEwKSAxMi4y
LjEgMjAyMjA5MjQpIGRlYnVnPXkgVGh1IERlYyAxMSAxNTo1NToyOCBVVEMgMjAyNQooWEVOKSBb
ICAgIDAuMDEwNzgzXSBMYXRlc3QgQ2hhbmdlU2V0OiBUaHUgRGVjIDExIDE3OjU0OjI4IDIwMjUg
KzAyMDAgZ2l0OjhkMDc1ZmQ2NmYKKFhFTikgWyAgICAwLjAxMTQyOV0gYnVpbGQtaWQ6IGJkNTU5
OTMzNzI3NDAwM2I1ODMyMjZkZTVjN2FlNjc2MWNiNTE0NTcKKFhFTikgWyAgICAwLjAxMTk3Nl0g
Q29uc29sZSBvdXRwdXQgaXMgc3luY2hyb25vdXMuCihYRU4pIFsgICAgMC4wMTIzNzRdIFByb2Nl
c3NvcjogMDAwMDAwMDA0MTJmZDA1MDogIkFSTSBMaW1pdGVkIiwgdmFyaWFudDogMHgyLCBwYXJ0
IDB4ZDA1LHJldiAweDAKKFhFTikgWyAgICAwLjAxMzExNl0gNjQtYml0IEV4ZWN1dGlvbjoKKFhF
TikgWyAgICAwLjAxMzQxNl0gICBQcm9jZXNzb3IgRmVhdHVyZXM6IDAwMDAwMDAwMTExMTIyMjIg
MDAwMDAwMDAwMDAwMDAxMAooWEVOKSBbICAgIDAuMDE0MDAxXSAgICAgRXhjZXB0aW9uIExldmVs
czogRUwzOjY0KzMyIEVMMjo2NCszMiBFTDE6NjQrMzIgRUwwOjY0KzMyCihYRU4pIFsgICAgMC4w
MTQ2MzFdICAgICBFeHRlbnNpb25zOiBGbG9hdGluZ1BvaW50IEFkdmFuY2VkU0lNRCBHSUN2My1T
eXNSZWcKKFhFTikgWyAgICAwLjAxNTIxNl0gICBEZWJ1ZyBGZWF0dXJlczogMDAwMDAwMDAxMDMw
NTQwOCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsgICAgMC4wMTU3NzFdICAgQXV4aWxpYXJ5IEZl
YXR1cmVzOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgICAwLjAx
NjM1Nl0gICBNZW1vcnkgTW9kZWwgRmVhdHVyZXM6IDAwMDAwMDAwMDAxMDExMjIgMDAwMDAwMDAx
MDIxMjEyMgooWEVOKSBbICAgIDAuMDE2OTY0XSAgIElTQSBGZWF0dXJlczogIDAwMDAxMDAwMTAy
MTExMjAgMDAwMDAwMDAwMDEwMDAwMQooWEVOKSBbICAgIDAuMDE3NTExXSAzMi1iaXQgRXhlY3V0
aW9uOgooWEVOKSBbICAgIDAuMDE3ODExXSAgIFByb2Nlc3NvciBGZWF0dXJlczogMDAwMDAwMDAx
MDAwMDEzMTowMDAwMDAwMDEwMDExMDExCihYRU4pIFsgICAgMC4wMTgzOTZdICAgICBJbnN0cnVj
dGlvbiBTZXRzOiBBQXJjaDMyIEEzMiBUaHVtYiBUaHVtYi0yIEphemVsbGUKKFhFTikgWyAgICAw
LjAxODk4MV0gICAgIEV4dGVuc2lvbnM6IEdlbmVyaWNUaW1lciBTZWN1cml0eQooWEVOKSBbICAg
IDAuMDE5NDMxXSAgIERlYnVnIEZlYXR1cmVzOiAwMDAwMDAwMDA0MDEwMDg4CihYRU4pIFsgICAg
MC4wMTk4NTldICAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsg
ICAgMC4wMjAzMTZdICAgTWVtb3J5IE1vZGVsIEZlYXR1cmVzOiAwMDAwMDAwMDEwMjAxMTA1IDAw
MDAwMDAwNDAwMDAwMDAKKFhFTikgWyAgICAwLjAyMDkyNF0gICAgICAgICAgICAgICAgICAgICAg
ICAgIDAwMDAwMDAwMDEyNjAwMDAgMDAwMDAwMDAwMjEyMjIxMQooWEVOKSBbICAgIDAuMDIxNTMx
XSAgIElTQSBGZWF0dXJlczogMDAwMDAwMDAwMjEwMTExMCAwMDAwMDAwMDEzMTEyMTExIDAwMDAw
MDAwMjEyMzIwNDIKKFhFTikgWyAgICAwLjAyMjE5OV0gICAgICAgICAgICAgICAgIDAwMDAwMDAw
MDExMTIxMzEgMDAwMDAwMDAwMDAxMTE0MiAwMDAwMDAwMDAxMDExMTIxCihYRU4pIFsgICAgMC4w
MjI4NzFdIFVzaW5nIFNNQyBDYWxsaW5nIENvbnZlbnRpb24gdjEuNQooWEVOKSBbICAgIDAuMDIz
MjkxXSBVc2luZyBQU0NJIHYxLjEKKFhFTikgWyAgICAwLjAyMzU3Nl0gU01QOiBBbGxvd2luZyAy
IENQVXMKKFhFTikgWyAgICAwLjAyMzg5OV0gZW5hYmxlZCB3b3JrYXJvdW5kIGZvcjogQVJNIGVy
cmF0dW0gMTUzMDkyMwooWEVOKSBbICAgIDAuMDI0NDEzXSBHZW5lcmljIFRpbWVyIElSUTogcGh5
cz0zMCBoeXA9MjYgdmlydD0yNyBGcmVxOiAyNDAwMCBLSHoKKFhFTikgWyAgICAwLjAyNTE0N10g
R0lDdjMgaW5pdGlhbGl6YXRpb246CihYRU4pIFsgICAgMC4wMjU0NzddICAgICAgIGdpY19kaXN0
X2FkZHI9MHgwMDAwMDBmZTYwMDAwMAooWEVOKSBbICAgIDAuMDI1OTIwXSAgICAgICBnaWNfbWFp
bnRlbmFuY2VfaXJxPTI1CihYRU4pIFsgICAgMC4wMjYzMDNdICAgICAgIGdpY19yZGlzdF9zdHJp
ZGU9MAooWEVOKSBbICAgIDAuMDI2NjU1XSAgICAgICBnaWNfcmRpc3RfcmVnaW9ucz0xCihYRU4p
IFsgICAgMC4wMjcwMTVdICAgICAgIHJlZGlzdHJpYnV0b3IgcmVnaW9uczoKKFhFTikgWyAgICAw
LjAyNzM5N10gICAgICAgICAtIHJlZ2lvbiAwOiAweDAwMDAwMGZlNjgwMDAwIC0gMHgwMDAwMDBm
ZTc4MDAwMAooWEVOKSBbICAgIDAuMDI3OTgyXSBHSUN2MzogNTEyIGxpbmVzLCAoSUlEIDAyMDE3
NDNiKS4KKFhFTikgWyAgICAwLjAyODQzMl0gR0lDdjM6IENQVTA6IEZvdW5kIHJlZGlzdHJpYnV0
b3IgaW4gcmVnaW9uIDAgQDAwMDAwYTAwNDAwMWMwMDAKKFhFTikgWyAgICAwLjAyOTA3MF0gWFNN
IEZyYW1ld29yayB2MS4wLjEgaW5pdGlhbGl6ZWQKKFhFTikgWyAgICAwLjAyOTQ4Ml0geHNtOiBQ
b2xpY3kgbGVuID0gMHgwMDAwMDAwMDAwMDEwMDAwIHN0YXJ0IGF0IDB4MDAwMDAwMDAwNjAwMDAw
MAooWEVOKSBbICAgIDAuMDMwODAxXSBVc2luZyBzY2hlZHVsZXI6IFNNUCBDcmVkaXQgU2NoZWR1
bGVyIHJldjIgKGNyZWRpdDIpCihYRU4pIFsgICAgMC4wMzEzNjJdIEluaXRpYWxpemluZyBDcmVk
aXQyIHNjaGVkdWxlcgooWEVOKSBbICAgIDAuMDMxNzYwXSAgbG9hZF9wcmVjaXNpb25fc2hpZnQ6
IDE4CihYRU4pIFsgICAgMC4wMzIxMjBdICBsb2FkX3dpbmRvd19zaGlmdDogMzAKKFhFTikgWyAg
ICAwLjAzMjQ1OF0gIHVuZGVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogMAooWEVOKSBbICAgIDAu
MDMyODYzXSAgb3ZlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IC0zCihYRU4pIFsgICAgMC4wMzMy
NjhdICBydW5xdWV1ZXMgYXJyYW5nZW1lbnQ6IHNvY2tldAooWEVOKSBbICAgIDAuMDMzNjY1XSAg
Y2FwIGVuZm9yY2VtZW50IGdyYW51bGFyaXR5OiAxMG1zCihYRU4pIFsgICAgMC4wMzQwOTJdIGxv
YWQgdHJhY2tpbmcgd2luZG93IGxlbmd0aCAxMDczNzQxODI0IG5zCihYRU4pIFsgICAgMC4wMzQ3
MDNdIEFsbG9jYXRlZCBjb25zb2xlIHJpbmcgb2YgMTYgS2lCLgooWEVOKSBbICAgIDAuMDM1MTI0
XSBDUFUwOiBHdWVzdCBhdG9taWNzIHdpbGwgdHJ5IDQgdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhl
IGRvbWFpbgooWEVOKSBbICAgIDAuMDM1ODEzXSBCcmluZ2luZyB1cCBDUFUxCihYRU4pIFsgICAg
MC4wMzYyMDJdIEdJQ3YzOiBDUFUxOiBGb3VuZCByZWRpc3RyaWJ1dG9yIGluIHJlZ2lvbiAwIEAw
MDAwMGEwMDQwMDNjMDAwCihYRU4pIFsgICAgMC4wMzY4MzhdIENQVTE6IEd1ZXN0IGF0b21pY3Mg
d2lsbCB0cnkgNyB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIFsgICAgMC4w
Mzc0NzZdIEJyb3VnaHQgdXAgMiBDUFVzCihYRU4pIFsgICAgMC4wMzc3NzZdIENQVSAxIGJvb3Rl
ZC4KKFhFTikgWyAgICAwLjAzODE1MF0gSS9PIHZpcnR1YWxpc2F0aW9uIGRpc2FibGVkCihYRU4p
IFsgICAgMC4wMzg1MjRdIFAyTTogNDAtYml0IElQQSB3aXRoIDQwLWJpdCBQQSBhbmQgMTYtYml0
IFZNSUQKKFhFTikgWyAgICAwLjAzOTA0MV0gUDJNOiAzIGxldmVscyB3aXRoIG9yZGVyLTEgcm9v
dCwgVlRDUiAweDAwMDAwMDAwODAwYTM1NTgKKFhFTikgWyAgICAwLjAzOTY4M10gU2NoZWR1bGlu
ZyBncmFudWxhcml0eTogY3B1LCAxIENQVSBwZXIgc2NoZWQtcmVzb3VyY2UKKFhFTikgWyAgICAw
LjA0MDI1NF0gSW5pdGlhbGl6aW5nIENyZWRpdDIgc2NoZWR1bGVyCihYRU4pIFsgICAgMC4wNDA2
NTJdICBsb2FkX3ByZWNpc2lvbl9zaGlmdDogMTgKKFhFTikgWyAgICAwLjA0MTAxMl0gIGxvYWRf
d2luZG93X3NoaWZ0OiAzMAooWEVOKSBbICAgIDAuMDQxMzQ5XSAgdW5kZXJsb2FkX2JhbGFuY2Vf
dG9sZXJhbmNlOiAwCihYRU4pIFsgICAgMC4wNDE3NTRdICBvdmVybG9hZF9iYWxhbmNlX3RvbGVy
YW5jZTogLTMKKFhFTikgWyAgICAwLjA0MjE1OV0gIHJ1bnF1ZXVlcyBhcnJhbmdlbWVudDogc29j
a2V0CihYRU4pIFsgICAgMC4wNDI1NTddICBjYXAgZW5mb3JjZW1lbnQgZ3JhbnVsYXJpdHk6IDEw
bXMKKFhFTikgWyAgICAwLjA0Mjk4NF0gbG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3RoIDEwNzM3
NDE4MjQgbnMKKFhFTikgWyAgICAwLjA0MzQ2N10gQWRkaW5nIGNwdSAwIHRvIHJ1bnF1ZXVlIDAK
KFhFTikgWyAgICAwLjA0MzgzNF0gIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0aXZhdGluZwoo
WEVOKSBbICAgIDAuMDQ0MjY4XSBBZGRpbmcgY3B1IDEgdG8gcnVucXVldWUgMAooWEVOKSBbICAg
IDAuMDQ0NjQ0XSBVc2luZyBTQ01JIHdpdGggU01DIElEOiAweDgyMDAwMDEwCihYRU4pIFsgICAg
MC4wNDU0NTVdIGFsdGVybmF0aXZlczogUGF0Y2hpbmcgd2l0aCBhbHQgdGFibGUgMDAwMDBhMDAw
MDJlZWFkMCAtPiAwMDAwMGEwMDAwMmYwMDAwCihYRU4pIFsgICAgMC4wNDY1MTldIFNDTUk6IGQw
IGluaXQKKFhFTikgWyAgICAwLjA0NjkxMV0gKioqIExPQURJTkcgRE9NQUlOIDAgKioqCihYRU4p
IFsgICAgMC4wNDcyNjRdIExvYWRpbmcgZDAga2VybmVsIGZyb20gYm9vdCBtb2R1bGUgQCAwMDAw
MDAwMDAyMDAwMDAwCihYRU4pIFsgICAgMC4wNDc4MzNdIExvYWRpbmcgcmFtZGlzayBmcm9tIGJv
b3QgbW9kdWxlIEAgMDAwMDAwMDBlMjBmMjAwMAooWEVOKSBbICAgIDAuMDQ4Mzk1XSBHcmFudCB0
YWJsZSByYW5nZTogMHgwMDAwMDA0OTAwMDAwMC0weDAwMDAwMDQ5MDQwMDAwCihYRU4pIFsgICAg
MC4wNDg5NTddIEFsbG9jYXRpbmcgMToxIG1hcHBpbmdzIHRvdGFsbGluZyAyMDQ4TUIgZm9yIGRv
bTA6CihYRU4pIFsgICAgMC41MjExMjldIEJBTktbMF0gMHgwMDAwMDA2MDAwMDAwMC0weDAwMDAw
MGUwMDAwMDAwICgyMDQ4TUIpCihYRU4pIFsgICAgMC41MzQ2NTVdIEFsbG9jYXRpbmcgUFBJIDE2
IGZvciBldmVudCBjaGFubmVsIGludGVycnVwdAooWEVOKSBbICAgIDAuNTM1MzE1XSBkMDogZXh0
ZW5kZWQgcmVnaW9uIDA6IDB4MjAwMDAwLT4weDQ5MDAwMDAwCihYRU4pIFsgICAgMC41MzU4MTBd
IGQwOiBleHRlbmRlZCByZWdpb24gMTogMHg0OTIwMDAwMC0+MHg2MDAwMDAwMAooWEVOKSBbICAg
IDAuNTM2MzIwXSBkMDogZXh0ZW5kZWQgcmVnaW9uIDI6IDB4MTAwMDAwMDAwLT4weDNmYzAwMDAw
MAooWEVOKSBbICAgIDAuNTM3OTk0XSBMb2FkaW5nIHpJbWFnZSBmcm9tIDAwMDAwMDAwMDIwMDAw
MDAgdG8gMDAwMDAwMDA2MDAwMDAwMC0wMDAwMDAwMDY0MDAwMDAwCihYRU4pIFsgICAgMS4xNzUz
OTVdIExvYWRpbmcgZDAgaW5pdHJkIGZyb20gMDAwMDAwMDBlMjBmMjAwMCB0byAweDAwMDAwMDAw
NjgyMDAwMDAtMHgwMDAwMDAwMDcyZmQ5OWUzCihYRU4pIFsgICAgMi44OTc5MDRdIExvYWRpbmcg
ZDAgRFRCIHRvIDB4MDAwMDAwMDA2ODAwMDAwMC0weDAwMDAwMDAwNjgwMDViYTYKKFhFTikgWyAg
ICAyLjg5OTY1Nl0gSW5pdGlhbCBsb3cgbWVtb3J5IHZpcnEgdGhyZXNob2xkIHNldCBhdCAweDQw
MDAgcGFnZXMuCihYRU4pIFsgICAgMi45MDA1MjJdIAooWEVOKSBbICAgIDIuOTAwNjk1XSAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFsgICAgMi45MDExNjdd
IFBhbmljIG9uIENQVSAwOgooWEVOKSBbICAgIDIuOTAxNDUyXSB0ZXN0X3N5bWJvbHM6IG5vbi16
ZXJvIG9mZnNldCAoMHgyNCkgdW5leHBlY3RlZAooWEVOKSBbICAgIDIuOTAxOTc3XSAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFsgICAgMi45MDI0NTBdIAoo
WEVOKSBbICAgIDIuOTAyNjIzXSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uCgo=
--000000000000b2c9980645af5202
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-arm-makefile-modifications.patch"
Content-Disposition: attachment; 
	filename="0001-arm-makefile-modifications.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mj1mmzl40>
X-Attachment-Id: f_mj1mmzl40

RnJvbSA4ZDA3NWZkNjZmZWZkNDY1ODA0NDVhNzNhZTRkZTM3ZGY5NzAxMjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBlcGFtLmNvbT4K
RGF0ZTogVGh1LCAxMSBEZWMgMjAyNSAxNzo1NDoyOCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGFy
bSBtYWtlZmlsZSBtb2RpZmljYXRpb25zCgotLS0KIHhlbi9hcmNoL2FybS9NYWtlZmlsZSB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL01ha2VmaWxlIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlCmluZGV4IDRhNTQ5YTFhYzAuLjgy
ODNmMTNhZWUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQorKysgYi94ZW4vYXJj
aC9hcm0vTWFrZWZpbGUKQEAgLTEwMCw2ICsxMDAsNyBAQCAkKFRBUkdFVCktc3ltczogJChvYmp0
cmVlKS9wcmVsaW5rLm8gJChvYmopL3hlbi5sZHMKIAkJfCAkKG9ianRyZWUpL3Rvb2xzL3N5bWJv
bHMgJChhbGxfc3ltYm9scykgLS1zeXN2IC0tc29ydCBcCiAJCT4gJChkb3QtdGFyZ2V0KS4yLlMK
IAkkKE1BS0UpICQoYnVpbGQpPSQoQEQpICQoZG90LXRhcmdldCkuMi5vCisJJChjYWxsIGNvbXBh
cmUtc3ltYm9sLXRhYmxlcywgJChkb3QtdGFyZ2V0KS4xLm8sICQoZG90LXRhcmdldCkuMi5vKQog
CSQoTEQpICQoWEVOX0xERkxBR1MpIC1UICQob2JqKS94ZW4ubGRzICQ8ICQoYnVpbGRfaWRfbGlu
a2VyKSBcCiAJICAgICQoZG90LXRhcmdldCkuMi5vIC1vICRACiAJJChOTSkgLXBhIC0tZm9ybWF0
PXN5c3YgJEAgXAotLSAKMi40My4wCgo=
--000000000000b2c9980645af5202--

