Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6856C5B8
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 03:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363696.594386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9zDC-0007L4-CZ; Sat, 09 Jul 2022 01:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363696.594386; Sat, 09 Jul 2022 01:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9zDC-0007Hb-9N; Sat, 09 Jul 2022 01:24:46 +0000
Received: by outflank-mailman (input) for mailman id 363696;
 Sat, 09 Jul 2022 01:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NA6z=XO=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o9zDA-0007HV-5x
 for xen-devel@lists.xen.org; Sat, 09 Jul 2022 01:24:44 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e78c2f5e-ff25-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 03:24:40 +0200 (CEST)
Received: by mail-ed1-f53.google.com with SMTP id x91so429899ede.1
 for <xen-devel@lists.xen.org>; Fri, 08 Jul 2022 18:24:40 -0700 (PDT)
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
X-Inumbo-ID: e78c2f5e-ff25-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsipBRfP8SBn/LlTsOcbdFBOW8KdxMFiLxrDlyfGQdY=;
        b=FrCn/VfnBZ+mvC0MXh2/KB17kkPFuYt5GXFZymqd5Lnp3SmC0eTaTPG4Xtqzzq8ndw
         VTuKBHMftA0w3kOAEKtCWG/Nu1FN6wOxOBo+LTgmFtulu5yDkoZodvgO8SPiu/3qFige
         avXJn1ngv8y8n/U9SfaSW4WpNpEPl/ve41dCm4+Z7kA3slEjX5jIyCw8fHCGyoXuPMY/
         S2rTx7IFRysGdpaMZrgdTA7J4/00yJA4Cn+tUDMx9+H+W9xya2lkI9CiH54y9JF9Gchb
         W+LrZty7I9bN5Xmjld3mjrI3rdFqgbf5y7+tmqcH/lsKRloJiE+Ua8w2gUiUaEB5eB1h
         P3Iw==
X-Gm-Message-State: AJIora/0Qfbc9+30lBmLh6z7TSXW9pPjlM5c27ueed7FbfDVkm1NZSQa
	30/64IEr6Tp5pMluolLDZ2Q5A6mXLZH8oCjXczE=
X-Google-Smtp-Source: AGRyM1u4Hn32apIYcOeJS6ad+9IbLK2PJjV3SwFsIfNOQmX8hoxbww6lrUpixKyrP6vHP60u/pyb+V1eDM67gyKN5FM=
X-Received: by 2002:a05:6402:42cb:b0:43a:5df2:bb5d with SMTP id
 i11-20020a05640242cb00b0043a5df2bb5dmr8518752edc.36.1657329880090; Fri, 08
 Jul 2022 18:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local> <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com> <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com> <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
 <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com> <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
 <93c7b016-06f9-e3d2-5a7f-97a5f15c1a86@suse.com> <CAKhsbWYDFeu9ZdgGX-cVhZ3eW7bm6emQqLeb6zbSFJ0Se=0g5A@mail.gmail.com>
In-Reply-To: <CAKhsbWYDFeu9ZdgGX-cVhZ3eW7bm6emQqLeb6zbSFJ0Se=0g5A@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sat, 9 Jul 2022 09:24:27 +0800
Message-ID: <CAKhsbWbdt4UNhDvi0RQDxtgstzXsr=-GFTf4=WUBX7zfv=MRfw@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: multipart/mixed; boundary="000000000000c770d405e3552e0d"

--000000000000c770d405e3552e0d
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 10:28 AM G.R. <firemeteor@users.sourceforge.net> wrote:
>
> On Fri, Jul 8, 2022 at 12:38 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
> > >> [  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
> > >> [  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44
> >
> > That'll need debugging. Cc-ing Anthony for awareness, but I'm sure
> > he'll need more data to actually stand a chance of doing something
> > about it.
> >
> > Is there any chance you could be doing some debugging work yourself,
> > at the very least to figure out where this (apparent) NULL deref is
> > happening?
> Yep, I can collect the call-stack for sure.

The call-stack of the segfault is like this:
0x00007ffff7f0971f in name2bdf () from /usr/lib/libxenlight.so.4.16
(gdb) bt
#0  0x00007ffff7f0971f in name2bdf () from /usr/lib/libxenlight.so.4.16
#1  0x00007ffff7f0a75e in libxl_device_pci_assignable_remove () from
/usr/lib/libxenlight.so.4.16
#2  0x00005555555725bf in main_pciassignable_remove ()
#3  0x00005555555610ab in main ()
It's with a release version of libxenlight. Once I switch it to a
debug version, the segment fault just goes away...
This allows me to move on and test the behavior on 4.16.1 --
unfortunately no change observed at all.
Once I get the SSD assigned to the FreeeBSD 12 domU, the domU still
sees the device but fails to operate.

This time I also built the debug version of 4.16.1 hypervisor.
But unfortunately it shares the same reboot on the first
pci-assignable-add problem.
I cannot follow the suggestion of attaching a serial console yet.
The motherboard does have a serial port connector, but I do not have a
cable at the moment.
Maybe I can grab one, but it takes some time...

What I was able to do is to dump the 'xl dmesg' output from the dom0
boot with a debug hypervisor (see attached).
It does give a few extra lines and hope they could be helpful.

Thanks,
G.R.

--000000000000c770d405e3552e0d
Content-Type: text/x-log; charset="US-ASCII"; name="xldmesg_4.16.1_dbgbuild.log"
Content-Disposition: attachment; filename="xldmesg_4.16.1_dbgbuild.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l5d72evm0>
X-Attachment-Id: f_l5d72evm0

IFhlbiA0LjE2LjEKKFhFTikgWGVuIHZlcnNpb24gNC4xNi4xIChmaXJlbWV0ZW9yQCkgKGdjYyAo
RGViaWFuIDExLjIuMC0xMykgMTEuMi4wKSBkZWJ1Zz15IEZyaSBKdWwgIDggMjE6MDk6NDEgSEtU
IDIwMjIKKFhFTikgTGF0ZXN0IENoYW5nZVNldDogV2VkIEp1bCA2IDE2OjIyOjU1IDIwMjIgKzA4
MDAgZ2l0OjUxNGFiYTk2MjMKKFhFTikgYnVpbGQtaWQ6IDNlMDdiNjIxY2Y1MjAxYTgyYjg2N2E0
NGVmMWFkNThhMjMzZTRlYzgKKFhFTikgQm9vdGxvYWRlcjogR1JVQiAyLjA0LTIwCihYRU4pIENv
bW1hbmQgbGluZTogcGxhY2Vob2xkZXIgZG9tMF9tZW09MkcsbWF4OjNHLG1pbjoxRyBkb20wX21h
eF92Y3B1cz00IGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbCBpb21tdT12ZXJib3NlCihYRU4p
IFhlbiBpbWFnZSBsb2FkIGJhc2UgYWRkcmVzczogMHg4N2EwMDAwMAooWEVOKSBWaWRlbyBpbmZv
cm1hdGlvbjoKKFhFTikgIFZHQSBpcyB0ZXh0IG1vZGUgODB4MjUsIGZvbnQgOHgxNgooWEVOKSAg
VkJFL0REQyBtZXRob2RzOiBWMjsgRURJRCB0cmFuc2ZlciB0aW1lOiAxIHNlY29uZHMKKFhFTikg
RGlzYyBpbmZvcm1hdGlvbjoKKFhFTikgIEZvdW5kIDUgTUJSIHNpZ25hdHVyZXMKKFhFTikgIEZv
dW5kIDUgRUREIGluZm9ybWF0aW9uIHN0cnVjdHVyZXMKKFhFTikgQ1BVIFZlbmRvcjogSW50ZWws
IEZhbWlseSA2ICgweDYpLCBNb2RlbCAxNTggKDB4OWUpLCBTdGVwcGluZyAxMCAocmF3IDAwMDkw
NmVhKQooWEVOKSBYZW4tZTgyMCBSQU0gbWFwOgooWEVOKSAgWzAwMDAwMDAwMDAwMDAwMDAsIDAw
MDAwMDAwMDAwOWQzZmZdICh1c2FibGUpCihYRU4pICBbMDAwMDAwMDAwMDA5ZDQwMCwgMDAwMDAw
MDAwMDA5ZmZmZl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAwMDAwMDAwZTAwMDAsIDAwMDAwMDAw
MDAwZmZmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMDAwMTAwMDAwLCAwMDAwMDAwMDgz
NWJmZmZmXSAodXNhYmxlKQooWEVOKSAgWzAwMDAwMDAwODM1YzAwMDAsIDAwMDAwMDAwODM1YzBm
ZmZdIChBQ1BJIE5WUykKKFhFTikgIFswMDAwMDAwMDgzNWMxMDAwLCAwMDAwMDAwMDgzNWMxZmZm
XSAocmVzZXJ2ZWQpCihYRU4pICBbMDAwMDAwMDA4MzVjMjAwMCwgMDAwMDAwMDA4OGMwYmZmZl0g
KHVzYWJsZSkKKFhFTikgIFswMDAwMDAwMDg4YzBjMDAwLCAwMDAwMDAwMDg5MDdkZmZmXSAocmVz
ZXJ2ZWQpCihYRU4pICBbMDAwMDAwMDA4OTA3ZTAwMCwgMDAwMDAwMDA4OTFmNGZmZl0gKHVzYWJs
ZSkKKFhFTikgIFswMDAwMDAwMDg5MWY1MDAwLCAwMDAwMDAwMDg5NWRjZmZmXSAoQUNQSSBOVlMp
CihYRU4pICBbMDAwMDAwMDA4OTVkZDAwMCwgMDAwMDAwMDA4OWVmZWZmZl0gKHJlc2VydmVkKQoo
WEVOKSAgWzAwMDAwMDAwODllZmYwMDAsIDAwMDAwMDAwODllZmZmZmZdICh1c2FibGUpCihYRU4p
ICBbMDAwMDAwMDA4OWYwMDAwMCwgMDAwMDAwMDA4ZjdmZmZmZl0gKHJlc2VydmVkKQooWEVOKSAg
WzAwMDAwMDAwZTAwMDAwMDAsIDAwMDAwMDAwZWZmZmZmZmZdIChyZXNlcnZlZCkKKFhFTikgIFsw
MDAwMDAwMGZlMDAwMDAwLCAwMDAwMDAwMGZlMDEwZmZmXSAocmVzZXJ2ZWQpCihYRU4pICBbMDAw
MDAwMDBmZWMwMDAwMCwgMDAwMDAwMDBmZWMwMGZmZl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAw
MDAwZmVlMDAwMDAsIDAwMDAwMDAwZmVlMDBmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAw
MGZmMDAwMDAwLCAwMDAwMDAwMGZmZmZmZmZmXSAocmVzZXJ2ZWQpCihYRU4pICBbMDAwMDAwMDEw
MDAwMDAwMCwgMDAwMDAwMDg2YzdmZmZmZl0gKHVzYWJsZSkKKFhFTikgQUNQSTogUlNEUCAwMDBG
MDVCMCwgMDAyNCAocjIgQUxBU0tBKQooWEVOKSBBQ1BJOiBYU0RUIDg5NTEyMEE4LCAwMEQ0IChy
MSBBTEFTS0EgICAgQSBNIEkgIDEwNzIwMDkgQU1JICAgICAxMDAxMykKKFhFTikgQUNQSTogRkFD
UCA4OTU1MDlDMCwgMDExNCAocjYgQUxBU0tBICAgIEEgTSBJICAxMDcyMDA5IEFNSSAgICAgMTAw
MTMpCihYRU4pIEFDUEk6IERTRFQgODk1MTIyMTgsIDNFN0E2IChyMiBBTEFTS0EgICAgQSBNIEkg
IDEwNzIwMDkgSU5UTCAyMDE2MDUyNykKKFhFTikgQUNQSTogRkFDUyA4OTVEQzA4MCwgMDA0MAoo
WEVOKSBBQ1BJOiBBUElDIDg5NTUwQUQ4LCAwMEY0IChyNCBBTEFTS0EgICAgQSBNIEkgIDEwNzIw
MDkgQU1JICAgICAxMDAxMykKKFhFTikgQUNQSTogRlBEVCA4OTU1MEJEMCwgMDA0NCAocjEgQUxB
U0tBICAgIEEgTSBJICAxMDcyMDA5IEFNSSAgICAgMTAwMTMpCihYRU4pIEFDUEk6IEZJRFQgODk1
NTBDMTgsIDAwOUMgKHIxIEFMQVNLQSAgICBBIE0gSSAgMTA3MjAwOSBBTUkgICAgIDEwMDEzKQoo
WEVOKSBBQ1BJOiBNQ0ZHIDg5NTUwQ0I4LCAwMDNDIChyMSBBTEFTS0EgICAgQSBNIEkgIDEwNzIw
MDkgTVNGVCAgICAgICA5NykKKFhFTikgQUNQSTogU1NEVCA4OTU1MENGOCwgMDIwNCAocjEgQUxB
U0tBICAgIEEgTSBJICAgICAxMDAwIElOVEwgMjAxNjA1MjcpCihYRU4pIEFDUEk6IFNTRFQgODk1
NTBGMDAsIDE3RDUgKHIyIEFMQVNLQSAgICBBIE0gSSAgICAgMzAwMCBJTlRMIDIwMTYwNTI3KQoo
WEVOKSBBQ1BJOiBTU0RUIDg5NTUyNkQ4LCA5MzNEIChyMSBBTEFTS0EgICAgQSBNIEkgICAgICAg
IDEgSU5UTCAyMDE2MDUyNykKKFhFTikgQUNQSTogU1NEVCA4OTU1QkExOCwgMzFDNyAocjIgQUxB
U0tBICAgIEEgTSBJICAgICAzMDAwIElOVEwgMjAxNjA1MjcpCihYRU4pIEFDUEk6IFNTRFQgODk1
NUVCRTAsIDIzNTggKHIyIEFMQVNLQSAgICBBIE0gSSAgICAgMTAwMCBJTlRMIDIwMTYwNTI3KQoo
WEVOKSBBQ1BJOiBIUEVUIDg5NTYwRjM4LCAwMDM4IChyMSBBTEFTS0EgICAgQSBNIEkgICAgICAg
IDIgICAgICAgMTAwMDAxMykKKFhFTikgQUNQSTogU1NEVCA4OTU2MEY3MCwgMUJFMSAocjIgQUxB
U0tBICAgIEEgTSBJICAgICAxMDAwIElOVEwgMjAxNjA1MjcpCihYRU4pIEFDUEk6IFNTRFQgODk1
NjJCNTgsIDBGOUUgKHIyIEFMQVNLQSAgICBBIE0gSSAgICAgMTAwMCBJTlRMIDIwMTYwNTI3KQoo
WEVOKSBBQ1BJOiBTU0RUIDg5NTYzQUY4LCAyRDFCIChyMiBBTEFTS0EgICAgQSBNIEkgICAgICAg
IDAgSU5UTCAyMDE2MDUyNykKKFhFTikgQUNQSTogVUVGSSA4OTU2NjgxOCwgMDA0MiAocjEgQUxB
U0tBICAgIEEgTSBJICAgICAgICAyICAgICAgIDEwMDAwMTMpCihYRU4pIEFDUEk6IExQSVQgODk1
NjY4NjAsIDAwNUMgKHIxIEFMQVNLQSAgICBBIE0gSSAgICAgICAgMiAgICAgICAxMDAwMDEzKQoo
WEVOKSBBQ1BJOiBTU0RUIDg5NTY2OEMwLCAyN0RFIChyMiBBTEFTS0EgICAgQSBNIEkgICAgIDEw
MDAgSU5UTCAyMDE2MDUyNykKKFhFTikgQUNQSTogU1NEVCA4OTU2OTBBMCwgMEZGRSAocjIgQUxB
U0tBICAgIEEgTSBJICAgICAgICAwIElOVEwgMjAxNjA1MjcpCihYRU4pIEFDUEk6IERCR1AgODk1
NkEwQTAsIDAwMzQgKHIxIEFMQVNLQSAgICBBIE0gSSAgICAgICAgMiAgICAgICAxMDAwMDEzKQoo
WEVOKSBBQ1BJOiBEQkcyIDg5NTZBMEQ4LCAwMDU0IChyMCBBTEFTS0EgICAgQSBNIEkgICAgICAg
IDIgICAgICAgMTAwMDAxMykKKFhFTikgQUNQSTogRE1BUiA4OTU2QTEzMCwgMDBBOCAocjEgQUxB
U0tBICAgIEEgTSBJICAgICAgICAyICAgICAgIDEwMDAwMTMpCihYRU4pIEFDUEk6IFdTTVQgODk1
NkExRDgsIDAwMjggKHIxIEFMQVNLQSAgICBBIE0gSSAgMTA3MjAwOSBBTUkgICAgIDEwMDEzKQoo
WEVOKSBTeXN0ZW0gUkFNOiAzMjU5N01CICgzMzM3OTQ1MmtCKQooWEVOKSBObyBOVU1BIGNvbmZp
Z3VyYXRpb24gZm91bmQKKFhFTikgRmFraW5nIGEgbm9kZSBhdCAwMDAwMDAwMDAwMDAwMDAwLTAw
MDAwMDA4NmM4MDAwMDAKKFhFTikgRG9tYWluIGhlYXAgaW5pdGlhbGlzZWQKKFhFTikgZm91bmQg
U01QIE1QLXRhYmxlIGF0IDAwMGZjZTMwCihYRU4pIFNNQklPUyAzLjEgcHJlc2VudC4KKFhFTikg
VXNpbmcgQVBJQyBkcml2ZXIgZGVmYXVsdAooWEVOKSBBQ1BJOiBQTS1UaW1lciBJTyBQb3J0OiAw
eDE4MDggKDI0IGJpdHMpCihYRU4pIEFDUEk6IHY1IFNMRUVQIElORk86IGNvbnRyb2xbMToxODA0
XSwgc3RhdHVzWzE6MTgwMF0KKFhFTikgQUNQSTogSW52YWxpZCBzbGVlcCBjb250cm9sL3N0YXR1
cyByZWdpc3RlciBkYXRhOiAwOjB4ODoweDMgMDoweDg6MHgzCihYRU4pIEFDUEk6IFNMRUVQIElO
Rk86IHBtMXhfY250WzE6MTgwNCwxOjBdLCBwbTF4X2V2dFsxOjE4MDAsMTowXQooWEVOKSBBQ1BJ
OiAzMi82NFggRkFDUyBhZGRyZXNzIG1pc21hdGNoIGluIEZBRFQgLSA4OTVkYzA4MC8wMDAwMDAw
MDAwMDAwMDAwLCB1c2luZyAzMgooWEVOKSBBQ1BJOiAgICAgICAgICAgICB3YWtldXBfdmVjWzg5
NWRjMDhjXSwgdmVjX3NpemVbMjBdCihYRU4pIEFDUEk6IExvY2FsIEFQSUMgYWRkcmVzcyAweGZl
ZTAwMDAwCihYRU4pIE92ZXJyaWRpbmcgQVBJQyBkcml2ZXIgd2l0aCBiaWdzbXAKKFhFTikgQUNQ
STogSU9BUElDIChpZFsweDAyXSBhZGRyZXNzWzB4ZmVjMDAwMDBdIGdzaV9iYXNlWzBdKQooWEVO
KSBJT0FQSUNbMF06IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAwMDAwLCBH
U0kgMC0xMTkKKFhFTikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgMCBnbG9iYWxf
aXJxIDIgZGZsIGRmbCkKKFhFTikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBn
bG9iYWxfaXJxIDkgaGlnaCBsZXZlbCkKKFhFTikgQUNQSTogSVJRMCB1c2VkIGJ5IG92ZXJyaWRl
LgooWEVOKSBBQ1BJOiBJUlEyIHVzZWQgYnkgb3ZlcnJpZGUuCihYRU4pIEFDUEk6IElSUTkgdXNl
ZCBieSBvdmVycmlkZS4KKFhFTikgRW5hYmxpbmcgQVBJQyBtb2RlOiAgUGh5cy4gIFVzaW5nIDEg
SS9PIEFQSUNzCihYRU4pIEFDUEk6IEhQRVQgaWQ6IDB4ODA4NmEyMDEgYmFzZTogMHhmZWQwMDAw
MAooWEVOKSBQQ0k6IE1DRkcgY29uZmlndXJhdGlvbiAwOiBiYXNlIGUwMDAwMDAwIHNlZ21lbnQg
MDAwMCBidXNlcyAwMCAtIGZmCihYRU4pIFBDSTogTUNGRyBhcmVhIGF0IGUwMDAwMDAwIHJlc2Vy
dmVkIGluIEU4MjAKKFhFTikgUENJOiBVc2luZyBNQ0ZHIGZvciBzZWdtZW50IDAwMDAgYnVzIDAw
LWZmCihYRU4pIFtWVC1EXUhvc3QgYWRkcmVzcyB3aWR0aCAzOQooWEVOKSBbVlQtRF1mb3VuZCBB
Q1BJX0RNQVJfRFJIRDoKKFhFTikgW1ZULURdICBkbWFydS0+YWRkcmVzcyA9IGZlZDkwMDAwCihY
RU4pIFtWVC1EXWRyaGQtPmFkZHJlc3MgPSBmZWQ5MDAwMCBpb21tdS0+cmVnID0gZmZmZjgyYzAw
MDIxZDAwMAooWEVOKSBbVlQtRF1jYXAgPSAxYzAwMDBjNDA2NjA0NjIgZWNhcCA9IDE5ZTJmZjA1
MDVlCihYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDowMDowMi4wCihYRU4pIFtWVC1EXWZvdW5k
IEFDUElfRE1BUl9EUkhEOgooWEVOKSBbVlQtRF0gIGRtYXJ1LT5hZGRyZXNzID0gZmVkOTEwMDAK
KFhFTikgW1ZULURdZHJoZC0+YWRkcmVzcyA9IGZlZDkxMDAwIGlvbW11LT5yZWcgPSBmZmZmODJj
MDAwMjFmMDAwCihYRU4pIFtWVC1EXWNhcCA9IGQyMDA4YzQwNjYwNDYyIGVjYXAgPSBmMDUwZGEK
KFhFTikgW1ZULURdIElPQVBJQzogMDAwMDowMDoxZS43CihYRU4pIFtWVC1EXSBNU0kgSFBFVDog
MDAwMDowMDoxZS42CihYRU4pIFtWVC1EXSAgZmxhZ3M6IElOQ0xVREVfQUxMCihYRU4pIFtWVC1E
XWZvdW5kIEFDUElfRE1BUl9STVJSOgooWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDA6MTQu
MAooWEVOKSBbVlQtRF1kbWFyLmM6NjE3OiAgUk1SUjogWzg5OWUwMDAwLDg5YzI5ZmZmXQooWEVO
KSBbVlQtRF1mb3VuZCBBQ1BJX0RNQVJfUk1SUjoKKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAw
OjAwOjAyLjAKKFhFTikgW1ZULURdZG1hci5jOjYxNzogIFJNUlI6IFs4YjAwMDAwMCw4ZjdmZmZm
Zl0KKFhFTikgVXNpbmcgQUNQSSAoTUFEVCkgZm9yIFNNUCBjb25maWd1cmF0aW9uIGluZm9ybWF0
aW9uCihYRU4pIFNNUDogQWxsb3dpbmcgMTIgQ1BVcyAoMCBob3RwbHVnIENQVXMpCihYRU4pIElS
USBsaW1pdHM6IDEyMCBHU0ksIDIzNzYgTVNJL01TSS1YCihYRU4pIFtWVC1EXXFpbnZhbC5jOjQy
MTogUUk6IHVzaW5nIDI1Ni1lbnRyeSByaW5nKHMpCihYRU4pIFN3aXRjaGVkIHRvIEFQSUMgZHJp
dmVyIHgyYXBpY19jbHVzdGVyCihYRU4pIENQVTA6IFRTQzogcmF0aW86IDI5MiAvIDIKKFhFTikg
Q1BVMDogYnVzOiAxMDAgTUh6IGJhc2U6IDM1MDAgTUh6IG1heDogNDUwMCBNSHoKKFhFTikgQ1BV
MDogODAwIC4uLiAzNTAwIE1IegooWEVOKSB4c3RhdGU6IHNpemU6IDB4NDQwIGFuZCBzdGF0ZXM6
IDB4MWYKKFhFTikgbWNlX2ludGVsLmM6NzczOiBNQ0EgQ2FwYWJpbGl0eTogZmlyc3RiYW5rIDAs
IGV4dGVuZGVkIE1DRSBNU1IgMCwgQkNBU1QsIENNQ0kKKFhFTikgQ1BVMDogSW50ZWwgbWFjaGlu
ZSBjaGVjayByZXBvcnRpbmcgZW5hYmxlZAooWEVOKSBTcGVjdWxhdGl2ZSBtaXRpZ2F0aW9uIGZh
Y2lsaXRpZXM6CihYRU4pICAgSGFyZHdhcmUgaGludHM6CihYRU4pICAgSGFyZHdhcmUgZmVhdHVy
ZXM6IElCUEIgSUJSUyBTVElCUCBTU0JEIEwxRF9GTFVTSCBNRF9DTEVBUgooWEVOKSAgIENvbXBp
bGVkLWluIHN1cHBvcnQ6IElORElSRUNUX1RIVU5LIFNIQURPV19QQUdJTkcKKFhFTikgICBYZW4g
c2V0dGluZ3M6IEJUSS1UaHVuayBKTVAsIFNQRUNfQ1RSTDogSUJSUysgU1RJQlAtIFNTQkQtLCBP
dGhlcjogSUJQQiBMMURfRkxVU0ggVkVSVyBCUkFOQ0hfSEFSREVOCihYRU4pICAgTDFURjogYmVs
aWV2ZWQgdnVsbmVyYWJsZSwgbWF4cGh5c2FkZHIgTDFEIDQ2LCBDUFVJRCAzOSwgU2FmZSBhZGRy
ZXNzIDgwMDAwMDAwMDAKKFhFTikgICBTdXBwb3J0IGZvciBIVk0gVk1zOiBNU1JfU1BFQ19DVFJM
IFJTQiBFQUdFUl9GUFUgTURfQ0xFQVIKKFhFTikgICBTdXBwb3J0IGZvciBQViBWTXM6IE1TUl9T
UEVDX0NUUkwgRUFHRVJfRlBVIE1EX0NMRUFSCihYRU4pICAgWFBUSSAoNjQtYml0IFBWIG9ubHkp
OiBEb20wIGVuYWJsZWQsIERvbVUgZW5hYmxlZCAod2l0aCBQQ0lEKQooWEVOKSAgIFBWIEwxVEYg
c2hhZG93aW5nOiBEb20wIGRpc2FibGVkLCBEb21VIGVuYWJsZWQKKFhFTikgVXNpbmcgc2NoZWR1
bGVyOiBTTVAgQ3JlZGl0IFNjaGVkdWxlciByZXYyIChjcmVkaXQyKQooWEVOKSBJbml0aWFsaXpp
bmcgQ3JlZGl0MiBzY2hlZHVsZXIKKFhFTikgIGxvYWRfcHJlY2lzaW9uX3NoaWZ0OiAxOAooWEVO
KSAgbG9hZF93aW5kb3dfc2hpZnQ6IDMwCihYRU4pICB1bmRlcmxvYWRfYmFsYW5jZV90b2xlcmFu
Y2U6IDAKKFhFTikgIG92ZXJsb2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAtMwooWEVOKSAgcnVucXVl
dWVzIGFycmFuZ2VtZW50OiBzb2NrZXQKKFhFTikgIGNhcCBlbmZvcmNlbWVudCBncmFudWxhcml0
eTogMTBtcwooWEVOKSBsb2FkIHRyYWNraW5nIHdpbmRvdyBsZW5ndGggMTA3Mzc0MTgyNCBucwoo
WEVOKSBEaXNhYmxpbmcgSFBFVCBmb3IgYmVpbmcgdW5yZWxpYWJsZQooWEVOKSBQbGF0Zm9ybSB0
aW1lciBpcyAzLjU4ME1IeiBBQ1BJIFBNIFRpbWVyCihYRU4pIERldGVjdGVkIDM1MDQuMDEyIE1I
eiBwcm9jZXNzb3IuCihYRU4pIEZyZWVkIDEwMjRrQiB1bnVzZWQgQlNTIG1lbW9yeQooWEVOKSBh
bHQgdGFibGUgZmZmZjgyZDA0MDQ4YjViMCAtPiBmZmZmODJkMDQwNDk3ZDA2CihYRU4pIEludGVs
IFZULWQgaW9tbXUgMCBzdXBwb3J0ZWQgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgooWEVOKSBJ
bnRlbCBWVC1kIGlvbW11IDEgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhF
TikgSW50ZWwgVlQtZCBTbm9vcCBDb250cm9sIG5vdCBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1k
IERvbTAgRE1BIFBhc3N0aHJvdWdoIG5vdCBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIFF1ZXVl
ZCBJbnZhbGlkYXRpb24gZW5hYmxlZC4KKFhFTikgSW50ZWwgVlQtZCBJbnRlcnJ1cHQgUmVtYXBw
aW5nIGVuYWJsZWQuCihYRU4pIEludGVsIFZULWQgUG9zdGVkIEludGVycnVwdCBub3QgZW5hYmxl
ZC4KKFhFTikgSW50ZWwgVlQtZCBTaGFyZWQgRVBUIHRhYmxlcyBlbmFibGVkLgooWEVOKSBJL08g
dmlydHVhbGlzYXRpb24gZW5hYmxlZAooWEVOKSAgLSBEb20wIG1vZGU6IFJlbGF4ZWQKKFhFTikg
SW50ZXJydXB0IHJlbWFwcGluZyBlbmFibGVkCihYRU4pIG5yX3NvY2tldHM6IDEKKFhFTikgRW5h
YmxlZCBkaXJlY3RlZCBFT0kgd2l0aCBpb2FwaWNfYWNrX29sZCBvbiEKKFhFTikgRU5BQkxJTkcg
SU8tQVBJQyBJUlFzCihYRU4pICAtPiBVc2luZyBvbGQgQUNLIG1ldGhvZAooWEVOKSAuLlRJTUVS
OiB2ZWN0b3I9MHhGMCBhcGljMT0wIHBpbjE9MiBhcGljMj0tMSBwaW4yPS0xCihYRU4pIFRTQyBk
ZWFkbGluZSB0aW1lciBlbmFibGVkCihYRU4pIEFsbG9jYXRlZCBjb25zb2xlIHJpbmcgb2YgMTI4
IEtpQi4KKFhFTikgbXdhaXQtaWRsZTogTVdBSVQgc3Vic3RhdGVzOiAweDExMTQyMTIwCihYRU4p
IG13YWl0LWlkbGU6IHYwLjQuMSBtb2RlbCAweDllCihYRU4pIG13YWl0LWlkbGU6IGxhcGljX3Rp
bWVyX3JlbGlhYmxlX3N0YXRlcyAweGZmZmZmZmZmCihYRU4pIFZNWDogU3VwcG9ydGVkIGFkdmFu
Y2VkIGZlYXR1cmVzOgooWEVOKSAgLSBBUElDIE1NSU8gYWNjZXNzIHZpcnR1YWxpc2F0aW9uCihY
RU4pICAtIEFQSUMgVFBSIHNoYWRvdwooWEVOKSAgLSBFeHRlbmRlZCBQYWdlIFRhYmxlcyAoRVBU
KQooWEVOKSAgLSBWaXJ0dWFsLVByb2Nlc3NvciBJZGVudGlmaWVycyAoVlBJRCkKKFhFTikgIC0g
VmlydHVhbCBOTUkKKFhFTikgIC0gTVNSIGRpcmVjdC1hY2Nlc3MgYml0bWFwCihYRU4pICAtIFVu
cmVzdHJpY3RlZCBHdWVzdAooWEVOKSAgLSBWTUNTIHNoYWRvd2luZwooWEVOKSAgLSBWTSBGdW5j
dGlvbnMKKFhFTikgIC0gVmlydHVhbGlzYXRpb24gRXhjZXB0aW9ucwooWEVOKSAgLSBQYWdlIE1v
ZGlmaWNhdGlvbiBMb2dnaW5nCihYRU4pIEhWTTogQVNJRHMgZW5hYmxlZC4KKFhFTikgVk1YOiBE
aXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJwYWdlcyBkdWUgdG8gQ1ZFLTIwMTgtMTIyMDcK
KFhFTikgSFZNOiBWTVggZW5hYmxlZAooWEVOKSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2lu
ZyAoSEFQKSBkZXRlY3RlZAooWEVOKSBIVk06IEhBUCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdC
CihYRU4pIGFsdCB0YWJsZSBmZmZmODJkMDQwNDhiNWIwIC0+IGZmZmY4MmQwNDA0OTdkMDYKKFhF
TikgQnJvdWdodCB1cCAxMiBDUFVzCihYRU4pIFNjaGVkdWxpbmcgZ3JhbnVsYXJpdHk6IGNwdSwg
MSBDUFUgcGVyIHNjaGVkLXJlc291cmNlCihYRU4pIEFkZGluZyBjcHUgMCB0byBydW5xdWV1ZSAw
CihYRU4pICBGaXJzdCBjcHUgb24gcnVucXVldWUsIGFjdGl2YXRpbmcKKFhFTikgQWRkaW5nIGNw
dSAxIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDAKKFhFTikg
QWRkaW5nIGNwdSAzIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA0IHRvIHJ1bnF1ZXVl
IDAKKFhFTikgQWRkaW5nIGNwdSA1IHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA2IHRv
IHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA3IHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5n
IGNwdSA4IHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA5IHRvIHJ1bnF1ZXVlIDAKKFhF
TikgQWRkaW5nIGNwdSAxMCB0byBydW5xdWV1ZSAwCihYRU4pIEFkZGluZyBjcHUgMTEgdG8gcnVu
cXVldWUgMAooWEVOKSBtY2hlY2tfcG9sbDogTWFjaGluZSBjaGVjayBwb2xsaW5nIHRpbWVyIHN0
YXJ0ZWQuCihYRU4pIFJ1bm5pbmcgc3R1YiByZWNvdmVyeSBzZWxmdGVzdHMuLi4KKFhFTikgRml4
dXAgI1VEWzAwMDBdOiBmZmZmODJkMDdmZmZlMDQ0IFtmZmZmODJkMDdmZmZlMDQ0XSAtPiBmZmZm
ODJkMDQwMzg2ODA5CihYRU4pIEZpeHVwICNHUFswMDAwXTogZmZmZjgyZDA3ZmZmZTA0NSBbZmZm
ZjgyZDA3ZmZmZTA0NV0gLT4gZmZmZjgyZDA0MDM4NjgwOQooWEVOKSBGaXh1cCAjU1NbMDAwMF06
IGZmZmY4MmQwN2ZmZmUwNDQgW2ZmZmY4MmQwN2ZmZmUwNDRdIC0+IGZmZmY4MmQwNDAzODY4MDkK
KFhFTikgRml4dXAgI0JQWzAwMDBdOiBmZmZmODJkMDdmZmZlMDQ1IFtmZmZmODJkMDdmZmZlMDQ1
XSAtPiBmZmZmODJkMDQwMzg2ODA5CihYRU4pIE5YIChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rp
b24gYWN0aXZlCihYRU4pIERvbTAgaGFzIG1heGltdW0gOTUyIFBJUlFzCihYRU4pICoqKiBCdWls
ZGluZyBhIFBWIERvbTAgKioqCihYRU4pIEVMRjogcGhkcjogcGFkZHI9MHgxMDAwMDAwIG1lbXN6
PTB4MTM5NWQwOAooWEVOKSBFTEY6IHBoZHI6IHBhZGRyPTB4MjQwMDAwMCBtZW1zej0weDY4NTAw
MAooWEVOKSBFTEY6IHBoZHI6IHBhZGRyPTB4MmE4NTAwMCBtZW1zej0weDMwZDk4CihYRU4pIEVM
RjogcGhkcjogcGFkZHI9MHgyYWI2MDAwIG1lbXN6PTB4Mzc2MDAwCihYRU4pIEVMRjogbWVtb3J5
OiAweDEwMDAwMDAgLT4gMHgyZTJjMDAwCihYRU4pIEVMRjogbm90ZTogR1VFU1RfT1MgPSAibGlu
dXgiCihYRU4pIEVMRjogbm90ZTogR1VFU1RfVkVSU0lPTiA9ICIyLjYiCihYRU4pIEVMRjogbm90
ZTogWEVOX1ZFUlNJT04gPSAieGVuLTMuMCIKKFhFTikgRUxGOiBub3RlOiBWSVJUX0JBU0UgPSAw
eGZmZmZmZmZmODAwMDAwMDAKKFhFTikgRUxGOiBub3RlOiBJTklUX1AyTSA9IDB4ODAwMDAwMDAw
MAooWEVOKSBFTEY6IG5vdGU6IEVOVFJZID0gMHhmZmZmZmZmZjgyYWI2MTYwCihYRU4pIEVMRjog
bm90ZTogSFlQRVJDQUxMX1BBR0UgPSAweGZmZmZmZmZmODEwMDIwMDAKKFhFTikgRUxGOiBub3Rl
OiBGRUFUVVJFUyA9ICIhd3JpdGFibGVfcGFnZV90YWJsZXN8cGFlX3BnZGlyX2Fib3ZlXzRnYiIK
KFhFTikgRUxGOiBub3RlOiBTVVBQT1JURURfRkVBVFVSRVMgPSAweDg4MDEKKFhFTikgRUxGOiBu
b3RlOiBQQUVfTU9ERSA9ICJ5ZXMiCihYRU4pIEVMRjogbm90ZTogTE9BREVSID0gImdlbmVyaWMi
CihYRU4pIEVMRjogbm90ZTogdW5rbm93biAoMHhkKQooWEVOKSBFTEY6IG5vdGU6IFNVU1BFTkRf
Q0FOQ0VMID0gMHgxCihYRU4pIEVMRjogbm90ZTogTU9EX1NUQVJUX1BGTiA9IDB4MQooWEVOKSBF
TEY6IG5vdGU6IEhWX1NUQVJUX0xPVyA9IDB4ZmZmZjgwMDAwMDAwMDAwMAooWEVOKSBFTEY6IG5v
dGU6IFBBRERSX09GRlNFVCA9IDAKKFhFTikgRUxGOiBub3RlOiBQSFlTMzJfRU5UUlkgPSAweDEw
MDA0YjAKKFhFTikgRUxGOiBhZGRyZXNzZXM6CihYRU4pICAgICB2aXJ0X2Jhc2UgICAgICAgID0g
MHhmZmZmZmZmZjgwMDAwMDAwCihYRU4pICAgICBlbGZfcGFkZHJfb2Zmc2V0ID0gMHgwCihYRU4p
ICAgICB2aXJ0X29mZnNldCAgICAgID0gMHhmZmZmZmZmZjgwMDAwMDAwCihYRU4pICAgICB2aXJ0
X2tzdGFydCAgICAgID0gMHhmZmZmZmZmZjgxMDAwMDAwCihYRU4pICAgICB2aXJ0X2tlbmQgICAg
ICAgID0gMHhmZmZmZmZmZjgyZTJjMDAwCihYRU4pICAgICB2aXJ0X2VudHJ5ICAgICAgID0gMHhm
ZmZmZmZmZjgyYWI2MTYwCihYRU4pICAgICBwMm1fYmFzZSAgICAgICAgID0gMHg4MDAwMDAwMDAw
CihYRU4pICBYZW4gIGtlcm5lbDogNjQtYml0LCBsc2IKKFhFTikgIERvbTAga2VybmVsOiA2NC1i
aXQsIFBBRSwgbHNiLCBwYWRkciAweDEwMDAwMDAgLT4gMHgyZTJjMDAwCihYRU4pIFBIWVNJQ0FM
IE1FTU9SWSBBUlJBTkdFTUVOVDoKKFhFTikgIERvbTAgYWxsb2MuOiAgIDAwMDAwMDA4NTAwMDAw
MDAtPjAwMDAwMDA4NTQwMDAwMDAgKDUwNDMxNCBwYWdlcyB0byBiZSBhbGxvY2F0ZWQpCihYRU4p
ICBJbml0LiByYW1kaXNrOiAwMDAwMDAwODZiOWZhMDAwLT4wMDAwMDAwODZjN2ZmM2Y2CihYRU4p
IFZJUlRVQUwgTUVNT1JZIEFSUkFOR0VNRU5UOgooWEVOKSAgTG9hZGVkIGtlcm5lbDogZmZmZmZm
ZmY4MTAwMDAwMC0+ZmZmZmZmZmY4MmUyYzAwMAooWEVOKSAgUGh5cy1NYWNoIG1hcDogMDAwMDAw
ODAwMDAwMDAwMC0+MDAwMDAwODAwMDQwMDAwMAooWEVOKSAgU3RhcnQgaW5mbzogICAgZmZmZmZm
ZmY4MmUyYzAwMC0+ZmZmZmZmZmY4MmUyYzRiOAooWEVOKSAgUGFnZSB0YWJsZXM6ICAgZmZmZmZm
ZmY4MmUyZDAwMC0+ZmZmZmZmZmY4MmU0ODAwMAooWEVOKSAgQm9vdCBzdGFjazogICAgZmZmZmZm
ZmY4MmU0ODAwMC0+ZmZmZmZmZmY4MmU0OTAwMAooWEVOKSAgVE9UQUw6ICAgICAgICAgZmZmZmZm
ZmY4MDAwMDAwMC0+ZmZmZmZmZmY4MzAwMDAwMAooWEVOKSAgRU5UUlkgQUREUkVTUzogZmZmZmZm
ZmY4MmFiNjE2MAooWEVOKSBEb20wIGhhcyBtYXhpbXVtIDQgVkNQVXMKKFhFTikgRUxGOiBwaGRy
IDAgYXQgMHhmZmZmZmZmZjgxMDAwMDAwIC0+IDB4ZmZmZmZmZmY4MjM5NWQwOAooWEVOKSBFTEY6
IHBoZHIgMSBhdCAweGZmZmZmZmZmODI0MDAwMDAgLT4gMHhmZmZmZmZmZjgyYTg1MDAwCihYRU4p
IEVMRjogcGhkciAyIGF0IDB4ZmZmZmZmZmY4MmE4NTAwMCAtPiAweGZmZmZmZmZmODJhYjVkOTgK
KFhFTikgRUxGOiBwaGRyIDMgYXQgMHhmZmZmZmZmZjgyYWI2MDAwIC0+IDB4ZmZmZmZmZmY4MmJl
MDAwMAooWEVOKSBbVlQtRF1pb21tdV9lbmFibGVfdHJhbnNsYXRpb246IGlvbW11LT5yZWcgPSBm
ZmZmODJjMDAwMjFkMDAwCihYRU4pIFtWVC1EXWlvbW11X2VuYWJsZV90cmFuc2xhdGlvbjogaW9t
bXUtPnJlZyA9IGZmZmY4MmMwMDAyMWYwMDAKKFhFTikgSW5pdGlhbCBsb3cgbWVtb3J5IHZpcnEg
dGhyZXNob2xkIHNldCBhdCAweDQwMDAgcGFnZXMuCihYRU4pIFNjcnViYmluZyBGcmVlIFJBTSBp
biBiYWNrZ3JvdW5kCihYRU4pIFN0ZC4gTG9nbGV2ZWw6IEFsbAooWEVOKSBHdWVzdCBMb2dsZXZl
bDogQWxsCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgooWEVOKSBCb290ZWQgb24gTDFURi12dWxuZXJhYmxlIGhhcmR3YXJlIHdpdGggU01U
L0h5cGVydGhyZWFkaW5nCihYRU4pIGVuYWJsZWQuICBQbGVhc2UgYXNzZXNzIHlvdXIgY29uZmln
dXJhdGlvbiBhbmQgY2hvb3NlIGFuCihYRU4pIGV4cGxpY2l0ICdzbXQ9PGJvb2w+JyBzZXR0aW5n
LiAgU2VlIFhTQS0yNzMuCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgooWEVOKSBCb290ZWQgb24gTUxQRFMvTUZCRFMtdnVsbmVyYWJsZSBo
YXJkd2FyZSB3aXRoIFNNVC9IeXBlcnRocmVhZGluZwooWEVOKSBlbmFibGVkLiAgTWl0aWdhdGlv
bnMgd2lsbCBub3QgYmUgZnVsbHkgZWZmZWN0aXZlLiAgUGxlYXNlCihYRU4pIGNob29zZSBhbiBl
eHBsaWNpdCBzbXQ9PGJvb2w+IHNldHRpbmcuICBTZWUgWFNBLTI5Ny4KKFhFTikgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIDMuLi4gMi4u
LiAxLi4uIAooWEVOKSBYZW4gaXMgcmVsaW5xdWlzaGluZyBWR0EgY29uc29sZS4KKFhFTikgKioq
IFNlcmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRj
aCBpbnB1dCkKKFhFTikgRnJlZWQgNjIwa0IgaW5pdCBtZW1vcnkKKFhFTikgZDA6IEZvcmNpbmcg
d3JpdGUgZW11bGF0aW9uIG9uIE1GTnMgZTAwMDAtZWZmZmYKKFhFTikgUENJIGFkZCBkZXZpY2Ug
MDAwMDowMDowMC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MDEuMAooWEVOKSBQQ0kg
YWRkIGRldmljZSAwMDAwOjAwOjAyLjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxMi4w
CihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTQuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAw
MDAwOjAwOjE0LjIKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxNi4wCihYRU4pIFBDSSBh
ZGQgZGV2aWNlIDAwMDA6MDA6MTYuMwooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjE3LjAK
KFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxYi4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAw
MDA6MDA6MWMuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjFjLjUKKFhFTikgUENJIGFk
ZCBkZXZpY2UgMDAwMDowMDoxZC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MWYuMAoo
WEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjFmLjMKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAw
MDowMDoxZi40CihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MWYuNQooWEVOKSBQQ0kgYWRk
IGRldmljZSAwMDAwOjAxOjAwLjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowNDowMC4wCihY
RU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDU6MDAuMAooWEVOKSBlbXVsLXByaXYtb3AuYzoxMDI1
OmQwdjIgUkRNU1IgMHgwMDAwMDYzOSB1bmltcGxlbWVudGVkCihYRU4pIGVtdWwtcHJpdi1vcC5j
OjEwMjU6ZDB2MiBSRE1TUiAweDAwMDAwNjExIHVuaW1wbGVtZW50ZWQKKFhFTikgZW11bC1wcml2
LW9wLmM6MTAyNTpkMHYyIFJETVNSIDB4MDAwMDA2MTkgdW5pbXBsZW1lbnRlZAooWEVOKSBlbXVs
LXByaXYtb3AuYzoxMDI1OmQwdjIgUkRNU1IgMHgwMDAwMDY0MSB1bmltcGxlbWVudGVkCihYRU4p
IGVtdWwtcHJpdi1vcC5jOjEwMjU6ZDB2MiBSRE1TUiAweDAwMDAwNjRkIHVuaW1wbGVtZW50ZWQK
KFhFTikgZW11bC1wcml2LW9wLmM6MTAyNTpkMHYyIFJETVNSIDB4MDAwMDA2MDYgdW5pbXBsZW1l
bnRlZAooWEVOKSBlbXVsLXByaXYtb3AuYzoxMDI1OmQwdjIgUkRNU1IgMHgwMDAwMDY0ZSB1bmlt
cGxlbWVudGVkCihYRU4pIGVtdWwtcHJpdi1vcC5jOjEwMjU6ZDB2MiBSRE1TUiAweDAwMDAwMDM0
IHVuaW1wbGVtZW50ZWQKKFhFTikgZDA6IEZvcmNpbmcgcmVhZC1vbmx5IGFjY2VzcyB0byBNRk4g
ZmVkMDAKKFhFTikgZW11bC1wcml2LW9wLmM6MTAyNTpkMHYzIFJETVNSIDB4YzAwMTEwMjAgdW5p
bXBsZW1lbnRlZAo=
--000000000000c770d405e3552e0d--

