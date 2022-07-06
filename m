Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11421567E51
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361778.591457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yU4-0008M7-S5; Wed, 06 Jul 2022 06:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361778.591457; Wed, 06 Jul 2022 06:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yU4-0008JG-Ow; Wed, 06 Jul 2022 06:26:00 +0000
Received: by outflank-mailman (input) for mailman id 361778;
 Wed, 06 Jul 2022 06:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmMc=XL=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8yU3-0008JA-MX
 for xen-devel@lists.xen.org; Wed, 06 Jul 2022 06:25:59 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f74a1a2-fcf4-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 08:25:58 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id o25so25308560ejm.3
 for <xen-devel@lists.xen.org>; Tue, 05 Jul 2022 23:25:58 -0700 (PDT)
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
X-Inumbo-ID: 7f74a1a2-fcf4-11ec-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApREgiVEE79ZDkwD87JBYKvEQ4vbDLIk4pwSxFtkSrI=;
        b=sukODfX1QQ3Qk2FkDWFF+tjIYw0g84YC5BON9Ha1aryEnnU4XDGJcMm/E8M52gFaJp
         5cqziA1ksHFZoOIfS7zaPuBv3/WMODfGiblYxFE/EdnklpnlSkUqgf2jtI3U0VtzO2/P
         uEixRw0cAEN7ffkIeUv5p3AIkAa6RjeNSYG5RokI0ULG+XC4INRX2yIG6F7pfCiI05qH
         xA7qfIren4QbnTp6HKIQ0dPdCxTfi8Xmh9t0JnRcx32sUxGgHl82xg8r8Dr15MRvo1BZ
         yHK0CgfBVthx1Vn8B9B92qFT01Asf84iwlQ1DAOx8oBdiDfpSkf1Wa9YTaNlOgfHj1PM
         uvDA==
X-Gm-Message-State: AJIora/hpScCoJGR4v07YBFwmrTB5MlCLn5drwKGX7Zx3DgkuH8seShQ
	dIEYJtqgf3YwyJB9vC8R3zUAFoyEk0GnT0YOZNU=
X-Google-Smtp-Source: AGRyM1t6nRCorcUOSkvT29hZ+U1BVBFFK6mxCF6hkHDrgCcKl/DdUxNGQ02Up5NJYS87lKKxyobM5XgaOFyE+leu+cE=
X-Received: by 2002:a17:907:7f8b:b0:721:9c02:37f1 with SMTP id
 qk11-20020a1709077f8b00b007219c0237f1mr37109927ejc.211.1657088757869; Tue, 05
 Jul 2022 23:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local> <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com> <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
In-Reply-To: <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Wed, 6 Jul 2022 14:25:45 +0800
Message-ID: <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="000000000000c6489d05e31d0a37"

--000000000000c6489d05e31d0a37
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 5, 2022 at 7:59 PM Jan Beulich <jbeulich@suse.com> wrote:
> Nothing useful in there. Yet independent of that I guess we need to
> separate the issues you're seeing. Otherwise it'll be impossible to
> know what piece of data belongs where.
Yep, I think I'm seeing several different issues here:
1. The FLR related DPC / AER message seen on the 1st attempt only when
pciback tries to seize and release the SN570
    - Later-on pciback operations appear just fine.
2. MSI-X preparation failure message that shows up each time the SN570
is seized by pciback or when it's passed to domU.
3. XEN tries to map BAR from two devices to the same page
4. The "write-back to unknown field" message in QEMU log that goes
away with permissive=1 passthrough config.
5. The "irq 16: nobody cared" message shows up *sometimes* in a
pattern that I haven't figured out  (See attached)
6. The FreeBSD domU sees the device but fails to use it because low
level commands sent to it are aborted.
7. The device does not return to the pci-assignable-list when the domU
it was assigned shuts-down. (See attached)

#3 appears to be a known issue that could be worked around with
patches from the list.
I suspect #1 may have something to do with the device itself. It's
still not clear if it's deadly or just annoying.
I was able to update the firmware to the latest version and confirmed
that the new firmware didn't make any noticeable difference.

I suspect issue #2, #4, #5, #6, #7 may be related, and the
pass-through was not completely successful...
Should I expect a debug build of XEN hypervisor to give better
diagnose messages, without the debug patch that Roger mentioned?

Thanks,
Rui

--000000000000c6489d05e31d0a37
Content-Type: text/x-log; charset="US-ASCII"; name="dom0_dmsg_for_domu_shutdown.log"
Content-Disposition: attachment; filename="dom0_dmsg_for_domu_shutdown.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l597jxz00>
X-Attachment-Id: f_l597jxz00

WzU5MjEzLjMxMjg0OV0geGVuYnIwOiBwb3J0IDModmlmMy4wKSBlbnRlcmVkIGRpc2FibGVkIHN0
YXRlICAvL2RvbVUgc2h1dGRvd24gc2VxdWVuY2Ugc3RhcnQgZnJvbSBoZXJlCls1OTIxNS4yNDcz
OTNdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcmVtb3ZpbmcKWzU5MjE1LjI0
NzM5NV0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBmb3VuZCBkZXZpY2UgdG8g
cmVtb3ZlCls1OTIxNS4yNDczOTZdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazog
cGNpc3R1Yl9kZXZpY2VfcmVsZWFzZQpbNTkyMTUuMzUyODkzXSBwY2liYWNrIDAwMDA6MDU6MDAu
MDogeGVuX3BjaWJhY2s6IE1TSS1YIHJlbGVhc2UgZmFpbGVkICgtMTYpCls1OTIxNS4zNTMxOTld
IHhlbl9wY2liYWNrOiByZW1vdmVkIDAwMDA6MDU6MDAuMCBmcm9tIHNlaXplIGxpc3QKWzU5MjE2
LjQ3NDEzOV0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBwcm9iaW5nLi4uCls1
OTcyOC4xNTAwNTNdIHhlbl9wY2liYWNrOiB3YW50cyB0byBzZWl6ZSAwMDAwOjA1OjAwLjAgICAg
ICAvL21hbnVhbCB4bCBwY2ktYXNzaWduYWJsZS1hZGQgMDU6MDAuMApbNTk3MjguMTUwMDc0XSBw
Y2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHByb2JpbmcuLi4KWzU5NzI4LjE1MDA3
NV0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBzZWl6aW5nIGRldmljZQpbNTk3
MjguMTUwMDc2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHBjaXN0dWJfZGV2
aWNlX2FsbG9jCls1OTcyOC4xNTAwNzZdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFj
azogaW5pdGlhbGl6aW5nLi4uCls1OTcyOC4xNTAwNzddIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4
ZW5fcGNpYmFjazogaW5pdGlhbGl6aW5nIGNvbmZpZwpbNTk3MjguMTUwMTY1XSBwY2liYWNrIDAw
MDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IGVuYWJsaW5nIGRldmljZQpbNTk3MjguMTUwMjQ3XSB4
ZW46IHJlZ2lzdGVyaW5nIGdzaSAxNiB0cmlnZ2VyaW5nIDAgcG9sYXJpdHkgMQpbNTk3MjguMTUw
MjUwXSBBbHJlYWR5IHNldHVwIHRoZSBHU0kgOjE2Cls1OTcyOC4xNTAyOTNdIHBjaWJhY2sgMDAw
MDowNTowMC4wOiB4ZW5fcGNpYmFjazogTVNJLVggcHJlcGFyYXRpb24gZmFpbGVkICgtNikKWzU5
NzI4LjE1MDU4Ml0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBzYXZlIHN0YXRl
IG9mIGRldmljZQpbNTk3MjguMTUwNzMxXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJh
Y2s6IHJlc2V0dGluZyAoRkxSLCBEMywgZXRjKSB0aGUgZGV2aWNlCls1OTcyOC4yNTc1NThdIHBj
aWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcmVzZXQgZGV2aWNlCg==
--000000000000c6489d05e31d0a37
Content-Type: text/x-log; charset="US-ASCII"; name="bad_irq.log"
Content-Disposition: attachment; filename="bad_irq.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l597jxzm1>
X-Attachment-Id: f_l597jxzm1

WyAzNzQyLjQ0MDQ4N10gaXJxIDE2OiBub2JvZHkgY2FyZWQgKHRyeSBib290aW5nIHdpdGggdGhl
ICJpcnFwb2xsIiBvcHRpb24pClsgMzc0Mi40NDA1MTZdIENQVTogMCBQSUQ6IDAgQ29tbTogc3dh
cHBlci8wIE5vdCB0YWludGVkIDUuMTAuMTIwLmdhaWEuNzgueGVucGNpYmFja2RiZyAjNApbIDM3
NDIuNDQwNTE2XSBIYXJkd2FyZSBuYW1lOiBHaWdhYnl0ZSBUZWNobm9sb2d5IENvLiwgTHRkLiBD
MjQ2Ti1XVTIvQzI0Nk4tV1UyLUNGLCBCSU9TIEYxIDEwLzAyLzIwMTkKWyAzNzQyLjQ0MDUxN10g
Q2FsbCBUcmFjZToKWyAzNzQyLjQ0MDUxOF0gIDxJUlE+ClsgMzc0Mi40NDA1MjJdICBkdW1wX3N0
YWNrKzB4NmIvMHg4MwpbIDM3NDIuNDQwNTI0XSAgX19yZXBvcnRfYmFkX2lycSsweDMwLzB4YTIK
WyAzNzQyLjQ0MDUyNV0gIG5vdGVfaW50ZXJydXB0LmNvbGQrMHhiLzB4NjEKWyAzNzQyLjQ0MDUy
N10gIGhhbmRsZV9pcnFfZXZlbnQrMHg5Zi8weGIwClsgMzc0Mi40NDA1MjhdICBoYW5kbGVfZmFz
dGVvaV9pcnErMHg3My8weDFjMApbIDM3NDIuNDQwNTI5XSAgZ2VuZXJpY19oYW5kbGVfaXJxKzB4
NDIvMHg1MApbIDM3NDIuNDQwNTMxXSAgX19ldnRjaG5fZmlmb19oYW5kbGVfZXZlbnRzKzB4MTU1
LzB4MTcwClsgMzc0Mi40NDA1MzNdICBfX3hlbl9ldnRjaG5fZG9fdXBjYWxsKzB4NjEvMHhhMApb
IDM3NDIuNDQwNTM1XSAgX194ZW5fcHZfZXZ0Y2huX2RvX3VwY2FsbCsweDExLzB4MjAKWyAzNzQy
LjQ0MDUzNl0gIGFzbV9jYWxsX2lycV9vbl9zdGFjaysweDEyLzB4MjAKWyAzNzQyLjQ0MDUzN10g
IDwvSVJRPgpbIDM3NDIuNDQwNTM4XSAgeGVuX3B2X2V2dGNobl9kb191cGNhbGwrMHhhMi8weGMw
ClsgMzc0Mi40NDA1MzldICBleGNfeGVuX2h5cGVydmlzb3JfY2FsbGJhY2srMHg4LzB4MTAKWyAz
NzQyLjQ0MDU0MF0gUklQOiBlMDMwOnhlbl9oeXBlcmNhbGxfc2NoZWRfb3ArMHhhLzB4MjAKWyAz
NzQyLjQ0MDU0Ml0gQ29kZTogNTEgNDEgNTMgYjggMWMgMDAgMDAgMDAgMGYgMDUgNDEgNWIgNTkg
YzMgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2Mg
NTEgNDEgNTMgYjggMWQgMDAgMDAgMDAgMGYgMDUgPDQxPiA1YiA1OSBjMyBjYyBjYyBjYyBjYyBj
YyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYwpbIDM3NDIuNDQwNTQyXSBS
U1A6IGUwMmI6ZmZmZmZmZmY4MjQwM2RlMCBFRkxBR1M6IDAwMDAwMjQ2ClsgMzc0Mi40NDA1NDNd
IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiBmZmZmZmZm
ZjgxMDAyM2FhClsgMzc0Mi40NDA1NDRdIFJEWDogMDAwMDAwMDAwMmQxYTMxYSBSU0k6IDAwMDAw
MDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAxClsgMzc0Mi40NDA1NDRdIFJCUDogZmZm
ZmZmZmY4MjQxNTk0MCBSMDg6IDAwMDAwMDY2YTE3M2I1ZmMgUjA5OiAwMDAwMDM2NzZlYmY4NDJm
ClsgMzc0Mi40NDA1NDVdIFIxMDogMDAwMDAwMDAwMDAzNDBlZSBSMTE6IDAwMDAwMDAwMDAwMDAy
NDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwClsgMzc0Mi40NDA1NDVdIFIxMzogMDAwMDAwMDAwMDAw
MDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1OiAwMDAwMDAwMDAwMDAwMDAwClsgMzc0Mi40
NDA1NDZdICA/IHhlbl9oeXBlcmNhbGxfc2NoZWRfb3ArMHhhLzB4MjAKWyAzNzQyLjQ0MDU0OF0g
ID8geGVuX3NhZmVfaGFsdCsweGMvMHgyMApbIDM3NDIuNDQwNTQ5XSAgPyBkZWZhdWx0X2lkbGUr
MHg1LzB4MTAKWyAzNzQyLjQ0MDU1MF0gID8gZGVmYXVsdF9pZGxlX2NhbGwrMHgzMy8weGMwClsg
Mzc0Mi40NDA1NTFdICA/IGRvX2lkbGUrMHgxZTkvMHgyNjAKWyAzNzQyLjQ0MDU1M10gID8gY3B1
X3N0YXJ0dXBfZW50cnkrMHgxNC8weDIwClsgMzc0Mi40NDA1NTVdICA/IHN0YXJ0X2tlcm5lbCsw
eDUwMy8weDUyNgpbIDM3NDIuNDQwNTU2XSAgPyB4ZW5fc3RhcnRfa2VybmVsKzB4NjBmLzB4NjFi
ClsgMzc0Mi40NDA1NTZdICA/IHN0YXJ0dXBfeGVuKzB4M2UvMHgzZQpbIDM3NDIuNDQwNTU3XSBo
YW5kbGVyczoKWyAzNzQyLjQ0MDU3MF0gWzwwMDAwMDAwMDhlMjA5MDhlPl0gaTgwMV9pc3IgW2ky
Y19pODAxXQpbIDM3NDIuNDQwNTg1XSBEaXNhYmxpbmcgSVJRICMxNgoK
--000000000000c6489d05e31d0a37--

