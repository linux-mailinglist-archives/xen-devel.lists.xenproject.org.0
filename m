Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF5D565C26
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 18:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360488.589902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OzH-0008TY-Un; Mon, 04 Jul 2022 16:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360488.589902; Mon, 04 Jul 2022 16:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OzH-0008Qx-Rj; Mon, 04 Jul 2022 16:31:51 +0000
Received: by outflank-mailman (input) for mailman id 360488;
 Mon, 04 Jul 2022 16:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbiE=XJ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8OzG-0008Qr-MJ
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 16:31:50 +0000
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6aa565-fbb6-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 18:31:49 +0200 (CEST)
Received: by mail-ed1-f49.google.com with SMTP id r6so921976edd.7
 for <xen-devel@lists.xen.org>; Mon, 04 Jul 2022 09:31:49 -0700 (PDT)
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
X-Inumbo-ID: cd6aa565-fbb6-11ec-a8e4-439420d8e422
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8gcOlr7F5gkANMo3hwqi1J4omoYV5m36IRd0Gb6D9GE=;
        b=byOJenu/3v8kHR06qMaLzXe4emoFfRIk8Jp9abpL0AxbER/o3+V05K/HE8j48avcFT
         ekIUa3qD2P+LMv9VNazkifHWElWVG9fKz6JqIY6NUpK34r5/XMDeeScnszuyPJdJckAY
         b5uSHlD7jmryA5812QTGdKk5mR0WWoJu/Z75JzJ/BRTMKp537JSpQK87s2joVlStZQyf
         QEFOjiQhw/9qYmqpq0aWebSG23Ol3ixdMeBPMiqcjLFUD38/RTE5sqWpbvsMmzeNMwZe
         XArcxYdqC9kzXv+4L98TQCiUFLmuj4q8c+vEgF8VG71YHMv7swjXcei/Z3xZKpY40nRH
         cerA==
X-Gm-Message-State: AJIora8ZeBAIk9p7j7xSdd2yUsq5Sd3xVc97Ap5TYwD0KdrvvSMyIvyT
	d/YlktDOQUmpQ7tnsnAQxv8/2nOpjtKChkPfwRI=
X-Google-Smtp-Source: AGRyM1u06T0mHrqRNeznQffYrSvE2RibYUWxW/u25v3845hnOLfDpAaiJHlJpC/VmN05vBh2G+sSleqeAyt1SYr+qNA=
X-Received: by 2002:a05:6402:2552:b0:435:9e1c:ca49 with SMTP id
 l18-20020a056402255200b004359e1cca49mr40164489edb.126.1656952308786; Mon, 04
 Jul 2022 09:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com> <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
In-Reply-To: <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Tue, 5 Jul 2022 00:31:36 +0800
Message-ID: <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="000000000000c67d0a05e2fd45a3"

--000000000000c67d0a05e2fd45a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2022 at 12:21 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Mon, Jul 04, 2022 at 11:37:13PM +0800, G.R. wrote:
> > On Mon, Jul 4, 2022 at 11:15 PM G.R. <firemeteor@users.sourceforge.net>=
 wrote:
> > >
> > > On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.ne=
t> wrote:
> > > >
> > > > On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
> > > > > Can you paste the lspci -vvv output for any other device you are =
also
> > > > > passing through to this guest?
> > > > >
> > >
> > > As reminded by this request, I tried to assign this nvme device to
> > > another FreeBSD12 domU.
> > Just to clarify, this time this NVME SSD is the only device I passed to=
 this VM.
> >
> > > This time it does not fail at the VM setup stage, but the device is
> > > still not usable at the domU.
> > > The nvmecontrol command is not able to talk to the device at all:
> > > nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:0000000=
0
> > > nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
> > > nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:0000000=
0
> > > nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
> > >
> > > The QEMU log says the following:
> > > 00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00=
)
> > > [00:05.0] If the device doesn't work, try enabling permissive mode
> > > [00:05.0] (unsafe) and if it helps report the problem to xen-devel
> > > [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30=
, entry 0)
> >
> > I retried with the following:
> > pci=3D['05:00.0,permissive=3D1,msitranslate=3D1']
> > Those extra options suppressed some error logging, but still didn't
> > make the device usable to the domU.
> > The nvmecontrol command still get ABORTED result from the kernel...
> >
> > The only thing remained in the QEMU file is this one:
> > [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, =
entry 0)
>
> Hm it seems like Xen doesn't find the position of the MSI-X table
> correctly, given there's only one error path from msi.c returning
> -ENODATA (61).
>
> Are there errors from pciback when this happens?  I would expect the
> call to pci_prepare_msix() from pciback to fail and thus also report
> some error?
>
> I think it's likely I will have to provide an additional debug patch
> to Xen, maybe Jan has an idea of what could be going on.
>
pciback reports the same MSI-x related error.
But even with DEBUG enabled, I didn't see more context reported.
Please find details from the attachment.

> Roger.

--000000000000c67d0a05e2fd45a3
Content-Type: text/x-log; charset="US-ASCII"; name="pciback_dbg_xl-pci_assignable_XXX.log"
Content-Disposition: attachment; 
	filename="pciback_dbg_xl-pci_assignable_XXX.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l56yk3cu0>
X-Attachment-Id: f_l56yk3cu0

cm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLWFkZCAwNTowMC4wCmxpYnhsOiB3YXJuaW5n
OiBsaWJ4bF9wY2kuYzo4MTQ6bGlieGxfX2RldmljZV9wY2lfYXNzaWduYWJsZV9hZGQ6IDAwMDA6
MDU6MDAuMCBub3QgYm91bmQgdG8gYSBkcml2ZXIsIHdpbGwgbm90IGJlIHJlYm91bmQuCgpbICAz
MjMuNDQ4MTE1XSB4ZW5fcGNpYmFjazogd2FudHMgdG8gc2VpemUgMDAwMDowNTowMC4wClsgIDMy
My40NDgxMzZdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcHJvYmluZy4uLgpb
ICAzMjMuNDQ4MTM3XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHNlaXppbmcg
ZGV2aWNlClsgIDMyMy40NDgxNjJdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazog
cGNpc3R1Yl9kZXZpY2VfYWxsb2MKWyAgMzIzLjQ0ODE2Ml0gcGNpYmFjayAwMDAwOjA1OjAwLjA6
IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcuLi4KWyAgMzIzLjQ0ODE2M10gcGNpYmFjayAwMDAw
OjA1OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcgY29uZmlnClsgIDMyMy40NDgzNDRd
IHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZW5hYmxpbmcgZGV2aWNlClsgIDMy
My40NDg0MjVdIHhlbjogcmVnaXN0ZXJpbmcgZ3NpIDE2IHRyaWdnZXJpbmcgMCBwb2xhcml0eSAx
ClsgIDMyMy40NDg0MjhdIEFscmVhZHkgc2V0dXAgdGhlIEdTSSA6MTYKWyAgMzIzLjQ0ODQ5N10g
cGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBzYXZlIHN0YXRlIG9mIGRldmljZQpb
ICAzMjMuNDQ4NjQyXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlc2V0dGlu
ZyAoRkxSLCBEMywgZXRjKSB0aGUgZGV2aWNlClsgIDMyMy40NDg3MDddIHBjaWVwb3J0IDAwMDA6
MDA6MWQuMDogRFBDOiBjb250YWlubWVudCBldmVudCwgc3RhdHVzOjB4MWYxMSBzb3VyY2U6MHgw
MDAwClsgIDMyMy40NDg3MzBdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDogRFBDOiB1bm1hc2tlZCB1
bmNvcnJlY3RhYmxlIGVycm9yIGRldGVjdGVkClsgIDMyMy40NDg3NjBdIHBjaWVwb3J0IDAwMDA6
MDA6MWQuMDogUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PVVuY29ycmVjdGVkIChOb24tRmF0YWwp
LCB0eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVjZWl2ZXIgSUQpClsgIDMyMy40NDg3ODZdIHBj
aWVwb3J0IDAwMDA6MDA6MWQuMDogICBkZXZpY2UgWzgwODY6YTMzMF0gZXJyb3Igc3RhdHVzL21h
c2s9MDAyMDAwMDAvMDAwMTAwMDAKWyAgMzIzLjQ0ODgxM10gcGNpZXBvcnQgMDAwMDowMDoxZC4w
OiAgICBbMjFdIEFDU1Zpb2wgICAgICAgICAgICAgICAgKEZpcnN0KQpbICAzMjQuNjkwOTc5XSBw
Y2liYWNrIDAwMDA6MDU6MDAuMDogbm90IHJlYWR5IDEwMjNtcyBhZnRlciBGTFI7IHdhaXRpbmcK
WyAgMzI1LjczMDcwNl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IG5vdCByZWFkeSAyMDQ3bXMgYWZ0
ZXIgRkxSOyB3YWl0aW5nClsgIDMyNy45OTc2MzhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiBub3Qg
cmVhZHkgNDA5NW1zIGFmdGVyIEZMUjsgd2FpdGluZwpbICAzMzIuMjY0MjUxXSBwY2liYWNrIDAw
MDA6MDU6MDAuMDogbm90IHJlYWR5IDgxOTFtcyBhZnRlciBGTFI7IHdhaXRpbmcKWyAgMzQwLjU4
NDMyMF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IG5vdCByZWFkeSAxNjM4M21zIGFmdGVyIEZMUjsg
d2FpdGluZwpbICAzNTcuMDEwODk2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogbm90IHJlYWR5IDMy
NzY3bXMgYWZ0ZXIgRkxSOyB3YWl0aW5nClsgIDM5MS4xNDM5NTFdIHBjaWJhY2sgMDAwMDowNTow
MC4wOiBub3QgcmVhZHkgNjU1MzVtcyBhZnRlciBGTFI7IGdpdmluZyB1cApbICAzOTIuMjQ5MjUy
XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlc2V0IGRldmljZQpbICAzOTIu
MjQ5MzkyXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHhlbl9wY2lia19lcnJv
cl9kZXRlY3RlZChidXM6NSxkZXZmbjowKQpbICAzOTIuMjQ5MzkzXSBwY2liYWNrIDAwMDA6MDU6
MDAuMDogeGVuX3BjaWJhY2s6IGRldmljZSBpcyBub3QgZm91bmQvYXNzaWduZWQKWyAgMzkyLjM5
NzA3NF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiB4ZW5fcGNpYmtfZXJyb3Jf
cmVzdW1lKGJ1czo1LGRldmZuOjApClsgIDM5Mi4zOTcwODBdIHBjaWJhY2sgMDAwMDowNTowMC4w
OiB4ZW5fcGNpYmFjazogZGV2aWNlIGlzIG5vdCBmb3VuZC9hc3NpZ25lZApbICAzOTIuMzk3Mjg0
XSBwY2llcG9ydCAwMDAwOjAwOjFkLjA6IEFFUjogZGV2aWNlIHJlY292ZXJ5IHN1Y2Nlc3NmdWwK
CmxpYnhsOiBlcnJvcjogbGlieGxfcGNpLmM6ODM1OmxpYnhsX19kZXZpY2VfcGNpX2Fzc2lnbmFi
bGVfYWRkOiBmYWlsZWQgdG8gcXVhcmFudGluZSAwMDAwOjA1OjAwLjAKCnJvb3RAZ2FpYTp+IyB4
bCBwY2ktYXNzaWduYWJsZS1yZW1vdmUgMDU6MDAuMApsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5j
Ojg1MzpsaWJ4bF9fZGV2aWNlX3BjaV9hc3NpZ25hYmxlX3JlbW92ZTogZmFpbGVkIHRvIGRlLXF1
YXJhbnRpbmUgMDAwMDowNTowMC4wCnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1hZGQg
MDU6MDAuMApsaWJ4bDogd2FybmluZzogbGlieGxfcGNpLmM6Nzk0OmxpYnhsX19kZXZpY2VfcGNp
X2Fzc2lnbmFibGVfYWRkOiAwMDAwOjA1OjAwLjAgYWxyZWFkeSBhc3NpZ25lZCB0byBwY2liYWNr
CnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1yZW1vdmUgMDU6MDAuMApbICA2MDMuOTI4
MDM5XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlbW92aW5nClsgIDYwMy45
MjgwNDFdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZm91bmQgZGV2aWNlIHRv
IHJlbW92ZSAKWyAgNjAzLjkyODA0Ml0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBwY2lzdHViX2RldmljZV9yZWxlYXNlClsgIDYwNC4wMzMzNzJdIHBjaWVwb3J0IDAwMDA6MDA6
MWQuMDogRFBDOiBjb250YWlubWVudCBldmVudCwgc3RhdHVzOjB4MWYxMSBzb3VyY2U6MHgwMDAw
ClsgIDYwNC4wMzM1MTJdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDogRFBDOiB1bm1hc2tlZCB1bmNv
cnJlY3RhYmxlIGVycm9yIGRldGVjdGVkClsgIDYwNC4wMzM2MzFdIHBjaWVwb3J0IDAwMDA6MDA6
MWQuMDogUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PVVuY29ycmVjdGVkIChOb24tRmF0YWwpLCB0
eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVxdWVzdGVyIElEKQpbICA2MDQuMDMzNzU4XSBwY2ll
cG9ydCAwMDAwOjAwOjFkLjA6ICAgZGV2aWNlIFs4MDg2OmEzMzBdIGVycm9yIHN0YXR1cy9tYXNr
PTAwMTAwMDAwLzAwMDEwMDAwClsgIDYwNC4wMzM4NTZdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDog
ICAgWzIwXSBVbnN1cFJlcSAgICAgICAgICAgICAgIChGaXJzdCkKWyAgNjA0LjAzMzkzOV0gcGNp
ZXBvcnQgMDAwMDowMDoxZC4wOiBBRVI6ICAgVExQIEhlYWRlcjogMzQwMDAwMDAgMDUwMDAwMTAg
MDAwMDAwMDAgODg0NTg4NDUKWyAgNjA0LjAzNDA1OV0gcGNpIDAwMDA6MDU6MDAuMDogQUVSOiBj
YW4ndCByZWNvdmVyIChubyBlcnJvcl9kZXRlY3RlZCBjYWxsYmFjaykKWyAgNjA0LjAzNDQyMV0g
eGVuX3BjaWJhY2s6IHJlbW92ZWQgMDAwMDowNTowMC4wIGZyb20gc2VpemUgbGlzdApbICA2MDQu
MTgyNTk3XSBwY2llcG9ydCAwMDAwOjAwOjFkLjA6IEFFUjogZGV2aWNlIHJlY292ZXJ5IHN1Y2Nl
c3NmdWwKCnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1hZGQgMDU6MDAuMApsaWJ4bDog
d2FybmluZzogbGlieGxfcGNpLmM6ODE0OmxpYnhsX19kZXZpY2VfcGNpX2Fzc2lnbmFibGVfYWRk
OiAwMDAwOjA1OjAwLjAgbm90IGJvdW5kIHRvIGEgZHJpdmVyLCB3aWxsIG5vdCBiZSByZWJvdW5k
LgpbICA2NjcuNTgyMDUxXSB4ZW5fcGNpYmFjazogd2FudHMgdG8gc2VpemUgMDAwMDowNTowMC4w
ClsgIDY2Ny41ODIxMzBdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcHJvYmlu
Zy4uLgpbICA2NjcuNTgyMTM0XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHNl
aXppbmcgZGV2aWNlClsgIDY2Ny41ODIyMjhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNp
YmFjazogcGNpc3R1Yl9kZXZpY2VfYWxsb2MKWyAgNjY3LjU4MjIzMV0gcGNpYmFjayAwMDAwOjA1
OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcuLi4KWyAgNjY3LjU4MjIzNV0gcGNpYmFj
ayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcgY29uZmlnClsgIDY2Ny41
ODI1NDhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZW5hYmxpbmcgZGV2aWNl
ClsgIDY2Ny41ODI1OTldIHBjaWJhY2sgMDAwMDowNTowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAw
MDAgLT4gMDAwMikKWyAgNjY3LjU4MjkxMl0geGVuOiByZWdpc3RlcmluZyBnc2kgMTYgdHJpZ2dl
cmluZyAwIHBvbGFyaXR5IDEKWyAgNjY3LjU4MjkyM10gQWxyZWFkeSBzZXR1cCB0aGUgR1NJIDox
NgpbICA2NjcuNTgzMDYxXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IE1TSS1Y
IHByZXBhcmF0aW9uIGZhaWxlZCAoLTYpClsgIDY2Ny41ODMxNDhdIHBjaWJhY2sgMDAwMDowNTow
MC4wOiB4ZW5fcGNpYmFjazogc2F2ZSBzdGF0ZSBvZiBkZXZpY2UKWyAgNjY3LjU4MzU2OV0gcGNp
YmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiByZXNldHRpbmcgKEZMUiwgRDMsIGV0Yykg
dGhlIGRldmljZQpbICA2NjcuNjg5NjU2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJh
Y2s6IHJlc2V0IGRldmljZQoKcm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLXJlbW92ZSAw
NTowMC4wClsgIDcyMC45NTc5ODhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazog
cmVtb3ZpbmcKWyAgNzIwLjk1Nzk5Nl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBmb3VuZCBkZXZpY2UgdG8gcmVtb3ZlIApbICA3MjAuOTU3OTk5XSBwY2liYWNrIDAwMDA6MDU6
MDAuMDogeGVuX3BjaWJhY2s6IHBjaXN0dWJfZGV2aWNlX3JlbGVhc2UKWyAgNzIxLjA2NTIyMl0g
cGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBNU0ktWCByZWxlYXNlIGZhaWxlZCAo
LTE2KQpbICA3MjEuMDY1NjY3XSB4ZW5fcGNpYmFjazogcmVtb3ZlZCAwMDAwOjA1OjAwLjAgZnJv
bSBzZWl6ZSBsaXN0Cgpyb290QGdhaWE6fiMgeGwgcGNpLWFzc2lnbmFibGUtYWRkIDA1OjAwLjAK
bGlieGw6IHdhcm5pbmc6IGxpYnhsX3BjaS5jOjgxNDpsaWJ4bF9fZGV2aWNlX3BjaV9hc3NpZ25h
YmxlX2FkZDogMDAwMDowNTowMC4wIG5vdCBib3VuZCB0byBhIGRyaXZlciwgd2lsbCBub3QgYmUg
cmVib3VuZC4KClsgIDc2My44ODg2MzFdIHhlbl9wY2liYWNrOiB3YW50cyB0byBzZWl6ZSAwMDAw
OjA1OjAwLjAKWyAgNzYzLjg4ODY5MF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBwcm9iaW5nLi4uClsgIDc2My44ODg2OTFdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNp
YmFjazogc2VpemluZyBkZXZpY2UKWyAgNzYzLjg4ODcxNl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6
IHhlbl9wY2liYWNrOiBwY2lzdHViX2RldmljZV9hbGxvYwpbICA3NjMuODg4NzE3XSBwY2liYWNr
IDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IGluaXRpYWxpemluZy4uLgpbICA3NjMuODg4NzE3
XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IGluaXRpYWxpemluZyBjb25maWcK
WyAgNzYzLjg4ODgwNF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBlbmFibGlu
ZyBkZXZpY2UKWyAgNzYzLjg4ODg4NV0geGVuOiByZWdpc3RlcmluZyBnc2kgMTYgdHJpZ2dlcmlu
ZyAwIHBvbGFyaXR5IDEKWyAgNzYzLjg4ODg4OV0gQWxyZWFkeSBzZXR1cCB0aGUgR1NJIDoxNgpb
ICA3NjMuODg4OTQ5XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IE1TSS1YIHBy
ZXBhcmF0aW9uIGZhaWxlZCAoLTYpClsgIDc2My44ODg5NzddIHBjaWJhY2sgMDAwMDowNTowMC4w
OiB4ZW5fcGNpYmFjazogc2F2ZSBzdGF0ZSBvZiBkZXZpY2UKWyAgNzYzLjg4OTEyNl0gcGNpYmFj
ayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiByZXNldHRpbmcgKEZMUiwgRDMsIGV0YykgdGhl
IGRldmljZQpbICA3NjMuOTk0MjA2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6
IHJlc2V0IGRldmljZQoKcm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLXJlbW92ZSAwNTow
MC4wClsgIDgxOS40OTEwMDBdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcmVt
b3ZpbmcKWyAgODE5LjQ5MTAwMl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBm
b3VuZCBkZXZpY2UgdG8gcmVtb3ZlIApbICA4MTkuNDkxMDAzXSBwY2liYWNrIDAwMDA6MDU6MDAu
MDogeGVuX3BjaWJhY2s6IHBjaXN0dWJfZGV2aWNlX3JlbGVhc2UKWyAgODE5LjU5NjExM10gcGNp
YmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBNU0ktWCByZWxlYXNlIGZhaWxlZCAoLTE2
KQpbICA4MTkuNTk2NDY2XSB4ZW5fcGNpYmFjazogcmVtb3ZlZCAwMDAwOjA1OjAwLjAgZnJvbSBz
ZWl6ZSBsaXN0Cgo=
--000000000000c67d0a05e2fd45a3--

