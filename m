Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE89FC29C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 22:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863156.1274620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQCuN-0002lD-8U; Tue, 24 Dec 2024 21:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863156.1274620; Tue, 24 Dec 2024 21:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQCuN-0002jX-5o; Tue, 24 Dec 2024 21:57:43 +0000
Received: by outflank-mailman (input) for mailman id 863156;
 Tue, 24 Dec 2024 21:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPPe=TR=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tQCuL-0002j6-GS
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 21:57:41 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16cbc9be-c242-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 22:57:38 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54024aa9febso5894262e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Dec 2024 13:57:38 -0800 (PST)
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
X-Inumbo-ID: 16cbc9be-c242-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735077457; x=1735682257; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbPCqk/DVvB78zsAYK9srunz1WN+hN0RoJRdIyLYCY4=;
        b=DeU5It0IkR+KLhfxzOW+hkYJOqrG1GZoeFOWoaQGqAsUBQ5BtUsDUfI/V5rDkdam5C
         04FIUMsrEBE3B4Kmn9deEJJl7Ql8xGVIfHMKFAFiUwcnwvyMnLqs6YMzuJOmGm+w/L2h
         TH3dgRNIFh9tiTF1hPGfjDnHKNn0FbgONVZ55ZVqBVOpfq7W5PhvjZtcuJGGlTKz+hOb
         vv9us9ULOrK2fhr5ymQdO2A3dduGf+xcsaPGa1QRjiHH7J4ctM4mgAkyc/lV+gjfuuFc
         ntHerLiYIg1H+2Z5Fj1qvWGgTU+4HE/pUJIfsFrqwsnOEmBHnv+kqrDQQ3X3eqd3LJAl
         pHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735077457; x=1735682257;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbPCqk/DVvB78zsAYK9srunz1WN+hN0RoJRdIyLYCY4=;
        b=CKUzoJXI+4s5jxvkQOG1wBWh1RfkQiHQ7hMEPpi9S4rP89nPonTyndNe7RnMQfDb7t
         OdA6Ptr14hTEnFphRAdHPrNS+J9scR7auLXZ2izINIJK98oyeBaP/b/U0/s+VgvBOYrc
         x2SXCD/VqLrJprEZ7QTvD9hhn0+caoNxNoEwT7hXlBkoKgehiuyesi925TfgibKGYRST
         xK8SKdkoZYJsTxWBZ6MheOPfTIBy+Wimr68N0DByGP5ztfZ+BMnpzsHTg0MI1rZF6Njr
         PrTApyoAXfSq+i8RBr/vhFWXiXIQwxN2qoV2XH/uHG8nz71tBy402wsn9bCAQkTT7Amz
         aeIw==
X-Forwarded-Encrypted: i=1; AJvYcCUPrTbWsqAeFFbOnqqPmnGoO4a/2Ap7G2sOkdFF1dTnJiaNiK6LWrHc4npR27Qty26H7AaMZ2wqjLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnL/LNYcLcUEGUkkmBKBCFOZRtv+BdBjXhxoW7lfRBuOUqbiPp
	/d+pQkdp1taWCCU9Byvy1c7RN8M7VEm41b5IXFg7dE14dWVkqvC0ekMfKJi9MJIB6w3Yc68nYbR
	nv1cQHTCl81UMM4njqWj04JZr2yc=
X-Gm-Gg: ASbGncu6oCawDDazo/stoKRl/mKU665OChzrKGiooq+NDU6RNqIZU84+fAu9TvFP22y
	P4zx/9FHMMj1hpBUEZ8lfm7BAEnoz246dfvRJB6D+NNdpXOsk/2eGjoLNW1HYfSvuMdLh
X-Google-Smtp-Source: AGHT+IFT13jLt/GfmU5pUvX0TVKGlwS3vaT5BtXg5VR9Mbaj2a1D6QRod7r0jNvqujpQ46FL6AiFIkdpu/wczpbqkIg=
X-Received: by 2002:a05:6512:b19:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-5422e0963efmr4469706e87.10.1735077456979; Tue, 24 Dec 2024
 13:57:36 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
 <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com> <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
 <CA+icZUUnbY7eRZtN-pMNn0jhYKLLEWEDNmJjhGQ3auPuS9_+MQ@mail.gmail.com>
In-Reply-To: <CA+icZUUnbY7eRZtN-pMNn0jhYKLLEWEDNmJjhGQ3auPuS9_+MQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 24 Dec 2024 22:56:59 +0100
Message-ID: <CA+icZUXVxE+tXvHk25iiMSY1K27JGhds_j+sp0Lr+_Zs6x1Utw@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>, 1091360@bugs.debian.org
Content-Type: multipart/mixed; boundary="0000000000007b4e3e062a0b33ad"

--0000000000007b4e3e062a0b33ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 5:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Sun, Dec 22, 2024 at 11:37=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
> >
> > On Sat, Dec 21, 2024 at 10:31=E2=80=AFPM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> > >
> > > On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> > > > With...
> > > >
> > > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> > > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../
> > >
> > > That's completely bizzare.   There's nothing interestingly different
> > > with those two tests vs the others.
> > >
> > > I take it the crash is repeatable when using either of these?
> > >
> > > ~Andrew
> >
> > This time I stopped SDDM and thus KDE-6/Wayland session.
> >
> > Tested with Debian's officially 6.12.6-amd64 kernel in VT-3.
> >
> > test-hvm32pae-xsa-consoleio-write SUCCESS <--- 1st time I tried, never
> > said this is not OK
> >
> > test-hvm64-xsa-454 leads to FROZEN system and DATA LOSS (here: ext4).
> > Reproducibly as told many times.- in Debian and selfmade kernels versio=
n 6.12.6.
> >
> > Stolen from the picture I took with my smartphone:
> >
> > sudo ./xft-runner test-hvm64-xsa-454
> >
> > Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
> > Executing 'xl console test-hvm64-xsa-454'
> > Executing 'xl unpause test-hvm64-xsa-454'
> >
> > ^^ System does NOT react!
> >
> > I can send you the picture on request.
> >
> > -Sedat-
>
> [ CC 1091360@bugs.debian.org ]
>
> I upgraded to Xen version 4.19.1 in Debian/unstable AMD64.
>
> # xl info | egrep 'release|version|commandline|caps'
> release                : 6.12.6-amd64
> version                : #1 SMP PREEMPT_DYNAMIC Debian 6.12.6-1 (2024-12-=
21)
> hw_caps                :
> bfebfbff:17bae3bf:28100800:00000001:00000001:00000000:00000000:00000100
> virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
> xen_version            : 4.19.1
> xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
> hvm-3.0-x86_64
> xen_commandline        : placeholder
>
> dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --host test-hvm64-xsa-454
> Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
> Executing 'xl console test-hvm64-xsa-454'
> Executing 'xl unpause test-hvm64-xsa-454'
> --- Xen Test Framework ---
> Environment: HVM 64bit (Long mode 4 levels)
> XSA-454 PoC
> Success: Not vulnerable to XSA-454
> Test result: SUCCESS
>
> Combined test results:
> test-hvm64-xsa-454                       SUCCESS
>
> root@iniza:~# LC_ALL=3DC ll /var/log/xen/*xsa-454*.log
> -rw-r--r-- 1 root adm 232 Dec 24 17:11
> /var/log/xen/qemu-dm-test-hvm64-xsa-454.log
> -rw-r--r-- 1 root adm 232 Dec 24 17:11 /var/log/xen/xl-test-hvm64-xsa-454=
.log
>
> root@iniza:~# cat /var/log/xen/qemu-dm-test-hvm64-xsa-454.log
> VNC server running on 127.0.0.1:5900
> xen-qemu-system-i386: failed to create 'console' device '0': declining
> to handle console type 'xenconsoled'
> xen-qemu-system-i386: terminating on signal 1 from pid 6302
> (/usr/lib/xen-4.19/bin/xl)
>
> root@iniza:~# cat /var/log/xen/xl-test-hvm64-xsa-454.log
> Waiting for domain test-hvm64-xsa-454 (domid 144) to die [pid 6302]
> Domain 144 has shut down, reason code 0 0x0
> Action for shutdown reason code 0 is destroy
> Domain 144 needs to be cleaned up: destroying the domain
> Done. Exiting now
>
> Due to Debian-Bug #1091360 ("qemu-system-xen: Build against libxen-dev
> version 4.19.1-1") I am not able to do the full XFT tests.
>
> -Sedat-
>
> Link: https://bugs.debian.org/1091360

With NEW qemu-system-xen/unstable (1:9.2.0+ds-3) both 6.12.6 kernel -
Debian and selfmade run with SUCCESS.

Nothing scary in dmesg-log.

Happy XMAS,
-Sedat-

--0000000000007b4e3e062a0b33ad
Content-Type: text/plain; charset="US-ASCII"; name="results_xen-4-19-1_dileks-6-12-6.txt"
Content-Disposition: attachment; 
	filename="results_xen-4-19-1_dileks-6-12-6.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m5309lk00>
X-Attachment-Id: f_m5309lk00

IyBjYXQgL3Byb2MvdmVyc2lvbiAKTGludXggdmVyc2lvbiA2LjEyLjYtMS1hbWQ2NC1jbGFuZzE5
LWtjZmkgKHNlZGF0LmRpbGVrQGdtYWlsLmNvbUBpbml6YSkgKENsYW5nQnVpbHRMaW51eCBjbGFu
ZyB2ZXJzaW9uIDE5LjEuNiAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0Lmdp
dCBlMjFkYzRiZDU0NzRkMDRiOGU2MmQ3MzMxMzYyZWRjYzU2NDhkN2U1KSwgQ2xhbmdCdWlsdExp
bnV4IExMRCAxOS4xLjYgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC5naXQg
ZTIxZGM0YmQ1NDc0ZDA0YjhlNjJkNzMzMTM2MmVkY2M1NjQ4ZDdlNSkpICMxfnRyaXhpZStkaWxl
a3MgU01QIFBSRUVNUFRfRFlOQU1JQyAyMDI0LTEyLTE5CgojIExDX0FMTD1DIGRtZXNnIC1UIHwg
Z3JlcCBrQ0ZJCltUdWUgRGVjIDI0IDIyOjM0OjUxIDIwMjRdIFNNUCBhbHRlcm5hdGl2ZXM6IFVz
aW5nIGtDRkkKCiMgeGwgaW5mbyB8IGVncmVwICdyZWxlYXNlfHZlcnNpb258Y29tbWFuZGxpbmV8
Y2FwcycKcmVsZWFzZSAgICAgICAgICAgICAgICA6IDYuMTIuNi0xLWFtZDY0LWNsYW5nMTkta2Nm
aQp2ZXJzaW9uICAgICAgICAgICAgICAgIDogIzF+dHJpeGllK2RpbGVrcyBTTVAgUFJFRU1QVF9E
WU5BTUlDIDIwMjQtMTItMTkKaHdfY2FwcyAgICAgICAgICAgICAgICA6IGJmZWJmYmZmOjE3YmFl
M2JmOjI4MTAwODAwOjAwMDAwMDAxOjAwMDAwMDAxOjAwMDAwMDAwOjAwMDAwMDAwOjAwMDAwMTAw
CnZpcnRfY2FwcyAgICAgICAgICAgICAgOiBwdiBodm0gaGFwIHNoYWRvdyBnbnR0YWItdjEgZ250
dGFiLXYyCnhlbl92ZXJzaW9uICAgICAgICAgICAgOiA0LjE5LjEKeGVuX2NhcHMgICAgICAgICAg
ICAgICA6IHhlbi0zLjAteDg2XzY0IGh2bS0zLjAteDg2XzMyIGh2bS0zLjAteDg2XzMycCBodm0t
My4wLXg4Nl82NCAKeGVuX2NvbW1hbmRsaW5lICAgICAgICA6IHBsYWNlaG9sZGVyCgojIGRwa2cg
LWwgfCBlZ3JlcCAncWVtdS1zeXN0ZW0teGVufGxpYnhlbm1pc2MnIHwgYXdrICcvXihpaXxoaXxy
Y3xwaSkvIHtwcmludCAkMSAiICIgJDIgIiAiICQzfScgfCBjb2x1bW4gLXQKaWkgIGxpYnhlbm1p
c2M0LjE5OmFtZDY0ICA0LjE5LjEtMQppaSAgcWVtdS1zeXN0ZW0teGVuICAgICAgIDE6OS4yLjAr
ZHMtMwoKZGlsZWtzQGluaXphOn4vc3JjL3h0Zi9naXQkIHN1ZG8gLi94dGYtcnVubmVyIC1hIC0t
aG9zdAoKLi4uCkV4ZWN1dGluZyAneGwgY3JlYXRlIC1wIHRlc3RzL3hzYS00NTQvdGVzdC1odm02
NC14c2EtNDU0LmNmZycKRXhlY3V0aW5nICd4bCBjb25zb2xlIHRlc3QtaHZtNjQteHNhLTQ1NCcK
RXhlY3V0aW5nICd4bCB1bnBhdXNlIHRlc3QtaHZtNjQteHNhLTQ1NCcKLS0tIFhlbiBUZXN0IEZy
YW1ld29yayAtLS0KRW52aXJvbm1lbnQ6IEhWTSA2NGJpdCAoTG9uZyBtb2RlIDQgbGV2ZWxzKQpY
U0EtNDU0IFBvQwpTdWNjZXNzOiBOb3QgdnVsbmVyYWJsZSB0byBYU0EtNDU0ClRlc3QgcmVzdWx0
OiBTVUNDRVNTCgpFeGVjdXRpbmcgJ3hsIGNyZWF0ZSAtcCB0ZXN0cy94c2EtY29uc29sZWlvLXdy
aXRlL3Rlc3QtaHZtMzJwYWUteHNhLWNvbnNvbGVpby13cml0ZS5jZmcnCkV4ZWN1dGluZyAneGwg
Y29uc29sZSB0ZXN0LWh2bTMycGFlLXhzYS1jb25zb2xlaW8td3JpdGUnCkV4ZWN1dGluZyAneGwg
dW5wYXVzZSB0ZXN0LWh2bTMycGFlLXhzYS1jb25zb2xlaW8td3JpdGUnCi0tLSBYZW4gVGVzdCBG
cmFtZXdvcmsgLS0tCkVudmlyb25tZW50OiBIVk0gMzJiaXQgKFBBRSAzIGxldmVscykKQ09OU09M
RUlPX3dyaXRlIHN0YWNrIG92ZXJmbG93IFBvQwpTdWNjZXNzOiBOb3QgdnVsbmVyYWJsZSB0byBD
T05TT0xFSU9fd3JpdGUgc3RhY2sgb3ZlcmZsb3cKVGVzdCByZXN1bHQ6IFNVQ0NFU1MKCkNvbWJp
bmVkIHRlc3QgcmVzdWx0czoKdGVzdC1odm0zMi1jcHVpZC1mYXVsdGluZyAgICAgICAgICAgICAg
ICBTS0lQCnRlc3QtaHZtMzJwYWUtY3B1aWQtZmF1bHRpbmcgICAgICAgICAgICAgU0tJUAp0ZXN0
LWh2bTMycHNlLWNwdWlkLWZhdWx0aW5nICAgICAgICAgICAgIFNLSVAKdGVzdC1odm02NC1jcHVp
ZC1mYXVsdGluZyAgICAgICAgICAgICAgICBTS0lQCnRlc3QtcHY2NC1jcHVpZC1mYXVsdGluZyAg
ICAgICAgICAgICAgICAgU0tJUAp0ZXN0LWh2bTY0LWZwdS1leGNlcHRpb24tZW11bGF0aW9uICAg
ICAgIFNLSVAKdGVzdC1odm0zMi1pbnZscGd+aGFwICAgICAgICAgICAgICAgICAgICBTVUNDRVNT
CnRlc3QtaHZtMzItaW52bHBnfnNoYWRvdyAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2
bTMycGFlLWludmxwZ35oYXAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm0zMnBhZS1p
bnZscGd+c2hhZG93ICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtNjQtaW52bHBnfmhhcCAg
ICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTY0LWludmxwZ35zaGFkb3cgICAgICAg
ICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm02NC1sYnItdHN4LXZtZW50cnkgICAgICAgICAgICAg
ICBTVUNDRVNTCnRlc3QtaHZtMzItbGl2ZXBhdGNoLXByaXYtY2hlY2sgICAgICAgICAgU1VDQ0VT
Uwp0ZXN0LWh2bTY0LWxpdmVwYXRjaC1wcml2LWNoZWNrICAgICAgICAgIFNVQ0NFU1MKdGVzdC1w
djY0LWxpdmVwYXRjaC1wcml2LWNoZWNrICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtMzItbG0t
dHMgICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTY0LWxtLXRzICAgICAg
ICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm0zMnBhZS1tZW1vcC1zZWcgICAgICAg
ICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtNjQtbWVtb3Atc2VnICAgICAgICAgICAgICAgICAg
ICAgU1VDQ0VTUwp0ZXN0LXB2NjQtbWVtb3Atc2VnICAgICAgICAgICAgICAgICAgICAgIFNVQ0NF
U1MKdGVzdC1odm0zMnBhZS1ubWktdGFza3N3aXRjaC1wcml2ICAgICAgICBTVUNDRVNTCnRlc3Qt
cHY2NC1wdi1mc2dzYmFzZSAgICAgICAgICAgICAgICAgICAgU0tJUAp0ZXN0LXB2NjQtcHYtaW9w
bH5oeXBlcmNhbGwgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0LXB2LWlvcGx+dm1hc3Np
c3QgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtMzItc3dpbnQtZW11bGF0aW9uICAgICAg
ICAgICAgICAgU0tJUAp0ZXN0LWh2bTMycGFlLXN3aW50LWVtdWxhdGlvbiAgICAgICAgICAgIFNL
SVAKdGVzdC1odm0zMnBzZS1zd2ludC1lbXVsYXRpb24gICAgICAgICAgICBTS0lQCnRlc3QtaHZt
NjQtc3dpbnQtZW11bGF0aW9uICAgICAgICAgICAgICAgU0tJUAp0ZXN0LWh2bTMyLXVtaXAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFNLSVAKdGVzdC1odm02NC11bWlwICAgICAgICAgICAgICAg
ICAgICAgICAgICBTS0lQCnRlc3QtaHZtMzIteHNhLTEyMiAgICAgICAgICAgICAgICAgICAgICAg
U1VDQ0VTUwp0ZXN0LWh2bTMycGFlLXhzYS0xMjIgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MK
dGVzdC1odm0zMnBzZS14c2EtMTIyICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZt
NjQteHNhLTEyMiAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTEy
MiAgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm0zMi14c2EtMTIzICAgICAg
ICAgICAgICAgICAgICAgICBTS0lQCnRlc3QtcHY2NC14c2EtMTY3ICAgICAgICAgICAgICAgICAg
ICAgICAgU0tJUAp0ZXN0LWh2bTY0LXhzYS0xNjh+c2hhZG93ICAgICAgICAgICAgICAgIFNVQ0NF
U1MKdGVzdC1odm02NC14c2EtMTcwICAgICAgICAgICAgICAgICAgICAgICBTS0lQCnRlc3QtaHZt
NjQteHNhLTE3M35zaGFkb3cgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTE4
MiAgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm0zMi14c2EtMTg2ICAgICAg
ICAgICAgICAgICAgICAgICBTS0lQCnRlc3QtaHZtNjQteHNhLTE4NiAgICAgICAgICAgICAgICAg
ICAgICAgU0tJUAp0ZXN0LWh2bTMyLXhzYS0xODggICAgICAgICAgICAgICAgICAgICAgIFNVQ0NF
U1MKdGVzdC1odm0zMnBhZS14c2EtMTg4ICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3Qt
aHZtMzJwc2UteHNhLTE4OCAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTY0LXhz
YS0xODggICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0xODggICAg
ICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtMzIteHNhLTE5MSAgICAgICAgICAg
ICAgICAgICAgICAgU0tJUAp0ZXN0LWh2bTMyLXhzYS0xOTIgICAgICAgICAgICAgICAgICAgICAg
IFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0xOTMgICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNT
CnRlc3QtaHZtNjQteHNhLTE5NSAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2
bTY0LXhzYS0xOTYgICAgICAgICAgICAgICAgICAgICAgIFNLSVAKdGVzdC1odm0zMi14c2EtMjAw
ICAgICAgICAgICAgICAgICAgICAgICBTS0lQCnRlc3QtaHZtMzIteHNhLTIwMyAgICAgICAgICAg
ICAgICAgICAgICAgU0tJUAp0ZXN0LWh2bTY0LXhzYS0yMDQgICAgICAgICAgICAgICAgICAgICAg
IFNLSVAKdGVzdC1wdjY0LXhzYS0yMTIgICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRl
c3QtcHY2NC14c2EtMjEzICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTY0
LXhzYS0yMjEgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0yMjEg
ICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtcHY2NC14c2EtMjI0ICAgICAgICAg
ICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTIyNyAgICAgICAgICAgICAgICAg
ICAgICAgIFNVQ0NFU1MKdGVzdC1odm02NC14c2EtMjMxICAgICAgICAgICAgICAgICAgICAgICBT
VUNDRVNTCnRlc3QtcHY2NC14c2EtMjMxICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0
ZXN0LWh2bTY0LXhzYS0yMzIgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0
LXhzYS0yMzIgICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtcHY2NC14c2EtMjM0
ICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTMyLXhzYS0yMzkgICAgICAg
ICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0yNTUgICAgICAgICAgICAgICAg
ICAgICAgICBTVUNDRVNTCnRlc3QtcHY2NC14c2EtMjU5ICAgICAgICAgICAgICAgICAgICAgICAg
U1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTI2MCAgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MK
dGVzdC1odm02NC14c2EtMjYxICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtcHY2
NC14c2EtMjY1ICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LWh2bTY0LXhzYS0y
NjkgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm02NC14c2EtMjc3ICAgICAg
ICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtNjQteHNhLTI3OCAgICAgICAgICAgICAg
ICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTI3OSAgICAgICAgICAgICAgICAgICAgICAg
IFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0yODYgICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNT
CnRlc3QtcHY2NC14c2EtMjk2ICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2
NjQteHNhLTI5OCAgICAgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm02NC14c2Et
MzA0ICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtNjQteHNhLTMwOCAgICAg
ICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTMxNiAgICAgICAgICAgICAg
ICAgICAgICAgIFNVQ0NFU1MKdGVzdC1odm0zMi14c2EtMzE3ICAgICAgICAgICAgICAgICAgICAg
ICBTVUNDRVNTCnRlc3QtaHZtMzJwYWUteHNhLTMxNyAgICAgICAgICAgICAgICAgICAgU1VDQ0VT
Uwp0ZXN0LWh2bTMycHNlLXhzYS0zMTcgICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1o
dm02NC14c2EtMzE3ICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtcHY2NC14c2Et
MzE3ICAgICAgICAgICAgICAgICAgICAgICAgU1VDQ0VTUwp0ZXN0LXB2NjQteHNhLTMzMyAgICAg
ICAgICAgICAgICAgICAgICAgIFNVQ0NFU1MKdGVzdC1wdjY0LXhzYS0zMzkgICAgICAgICAgICAg
ICAgICAgICAgICBTVUNDRVNTCnRlc3QtcHY2NC14c2EtNDQ0ICAgICAgICAgICAgICAgICAgICAg
ICAgU0tJUAp0ZXN0LWh2bTY0LXhzYS00NTEgICAgICAgICAgICAgICAgICAgICAgIFNLSVAKdGVz
dC1odm02NC14c2EtNDU0ICAgICAgICAgICAgICAgICAgICAgICBTVUNDRVNTCnRlc3QtaHZtMzJw
YWUteHNhLWNvbnNvbGVpby13cml0ZSAgICAgICAgU1VDQ0VTUwoKCi1kaWxla3MgLy8gMjQtRGVj
LTIwMjQK
--0000000000007b4e3e062a0b33ad
Content-Type: text/x-log; charset="US-ASCII"; name="qemu-dm-test-hvm64-xsa-454.log"
Content-Disposition: attachment; filename="qemu-dm-test-hvm64-xsa-454.log"
Content-Transfer-Encoding: base64
Content-ID: <f_m5309ptw1>
X-Attachment-Id: f_m5309ptw1

Vk5DIHNlcnZlciBydW5uaW5nIG9uIDEyNy4wLjAuMTo1OTAwCnhlbi1xZW11LXN5c3RlbS1pMzg2
OiBmYWlsZWQgdG8gY3JlYXRlICdjb25zb2xlJyBkZXZpY2UgJzAnOiBkZWNsaW5pbmcgdG8gaGFu
ZGxlIGNvbnNvbGUgdHlwZSAneGVuY29uc29sZWQnCnhlbi1xZW11LXN5c3RlbS1pMzg2OiB0ZXJt
aW5hdGluZyBvbiBzaWduYWwgMSBmcm9tIHBpZCA0ODQ1ICgvdXNyL2xpYi94ZW4tNC4xOS9iaW4v
eGwpCg==
--0000000000007b4e3e062a0b33ad
Content-Type: text/x-log; charset="US-ASCII"; name="xl-test-hvm64-xsa-454.log"
Content-Disposition: attachment; filename="xl-test-hvm64-xsa-454.log"
Content-Transfer-Encoding: base64
Content-ID: <f_m5309ss22>
X-Attachment-Id: f_m5309ss22

V2FpdGluZyBmb3IgZG9tYWluIHRlc3QtaHZtNjQteHNhLTQ1NCAoZG9taWQgOTQpIHRvIGRpZSBb
cGlkIDQ4NDVdCkRvbWFpbiA5NCBoYXMgc2h1dCBkb3duLCByZWFzb24gY29kZSAwIDB4MApBY3Rp
b24gZm9yIHNodXRkb3duIHJlYXNvbiBjb2RlIDAgaXMgZGVzdHJveQpEb21haW4gOTQgbmVlZHMg
dG8gYmUgY2xlYW5lZCB1cDogZGVzdHJveWluZyB0aGUgZG9tYWluCkRvbmUuIEV4aXRpbmcgbm93
Cg==
--0000000000007b4e3e062a0b33ad--

