Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373ECB5AEF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183959.1506532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTf5q-0000Uh-6J; Thu, 11 Dec 2025 11:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183959.1506532; Thu, 11 Dec 2025 11:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTf5q-0000Rz-3i; Thu, 11 Dec 2025 11:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1183959;
 Thu, 11 Dec 2025 11:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTf5o-0000Rr-LM
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:44:20 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9f7205e-d686-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 12:44:18 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5958232f806so834191e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 03:44:18 -0800 (PST)
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
X-Inumbo-ID: b9f7205e-d686-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453458; x=1766058258; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FbTkM9mI2GZAHrTJwctBAcXLDUNlEFZufu05iAXx5D0=;
        b=CjkKyB8zvs3HTuTEBtxw6ALqlkXgARTIJMrsA+KJ34Rguow4NimZVopTquTyB3yl71
         nCL5IFJ1Up05ymV0jWz8tTFrkZQqByxHe/OK0A2V/tzLv709kQrMxD7Kz2Fs0WoUSXtP
         lUOZjyegJfV0RgJFwKVO0/Gn+4Ok7nTXqqYyxoB23+kFs3z6SlX9zeYz9EoJ3zx0FAPE
         yBNkYaoagxEDbvGooN/S2rCya0XhZu2FkDFr3HKxn4WkUnJJxhapV+T5KxYXjAijHUVB
         kIQNq3IrVau2APdtsTU+WK9hTWxYNu6VRJCwbUSvt+rSftDDvXteSkyqkhTZE+6YRUtQ
         Y3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453458; x=1766058258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbTkM9mI2GZAHrTJwctBAcXLDUNlEFZufu05iAXx5D0=;
        b=MsVq4/sYjK/r5svXUBzNB0TCcZ7Of46nYLhweHbR7CckixBKWtpG10rLBvRaY/PQyb
         SM7tpxf3le78xzeKLAwGrQKqLyyPvICOrcf49ImWPEdRUTcTNZLvlcPCGl8fvJUH19wK
         +vfIyKY5vBN3OsScMdkaOdHvCV1icxncR5mY6qvttpdC/yQn2Vu7wmVWphPpwO1aKOEe
         0i2eNWdfWjo4tYkNyvEnKKIA3b/54JEVQSwSBCuN1CEZPsec7qWbLS4NEjHc3lea2Bbm
         x2IOro2IJcyTyKnSQsiu4bvsJAjvJpwBPdEsIDKXVuSAcMsbsqG5b2/wHBaLWDvuzUo0
         N79A==
X-Gm-Message-State: AOJu0Ywu8lxYZXeiFt+FXbcyN+yveBTH8n1e1JRnZajbrdWbNSAx9ne3
	cg2R7Irb3xA5BFpGdTAy2iO4k1YSIpdwBKGf/fyP7rIX45iKH9PBOZJOF61kzRWdpgpJp3g3UsZ
	tyz5EgOPU6DkTDsnwwDkIhh6TNyxTQdE=
X-Gm-Gg: AY/fxX6Oeh+mqFuS29y06OuD6mxhPEUHPphR/tooHBvRGfWxgfMEtKbeNYtT4ckdRET
	4xSDFSpowJDs3TcekE4o4pN2k2F/oNpHJ6KJ9JWl48hLRm/EIA1IvMsOrzsfNbB1/GAUXGnxFdu
	uaYzOkOxcVdHAMeQ2mg1i5rH/j5NkAZgzaF7jnCjelCHqVdpRi96g2CEHrOFNuZl6aErYALyppt
	YriHa/ATtaviHT8CH7Kx5UjCF1PQLYFZ72MFExoMW0VyrahK9VMfJe+tzcu6KaXXHuEE0x4IL0+
	HDQGqA==
X-Google-Smtp-Source: AGHT+IEiMPvbHSJYCTU1c1g3W5XcayPjy7AXjWuAKntKvCfN+gDu5E1K8kB9Ao+ajitX+FKKM+6/8sKRMEhDnw4WuaU=
X-Received: by 2002:a05:6512:23a6:b0:594:3340:1b63 with SMTP id
 2adb3069b0e04-598ee50ce23mr2695723e87.49.1765453457412; Thu, 11 Dec 2025
 03:44:17 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
In-Reply-To: <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 13:44:05 +0200
X-Gm-Features: AQt7F2qW2chFP4nyou5IXiVJh-6G32_l4ufLKZcivGbh8-z1e9J49Seg91667cs
Message-ID: <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="0000000000003274910645abaa9d"

--0000000000003274910645abaa9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 1:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 11:29, Mykola Kvach wrote:
> > While working on an arm64 s2ram series for Xen I have hit what looks
> > like very strange behaviour in symbols_lookup() as exercised by test-sy=
mbols.
> >
> > The series is in the branch referenced at [1]. All patches there except
> > the last one build and pass CI; adding only the last patch makes the CI
> > job referenced at [2] start failing.
> >
> > Note that the tests in that job are built without CONFIG_SYSTEM_SUSPEND
> > enabled, so most of the code introduced by the s2ram branch is not
> > compiled at all for that configuration. That is why I initially did not
> > expect my series to affect this job.
> >
> > To investigate, I tried to reproduce the issue locally. I downloaded th=
e
> > xen-config artifact from the failing job [3] and used it to build Xen
> > with my local aarch64 cross compiler. With this local toolchain
> > I could not reproduce the failure, and the resulting .config changed sl=
ightly
> > compared to the job's config. The relevant part of the diff looks like =
this:
> >
> >     diff --git a/xen/.config b/xen-config
> >     index 057553f510..44dcf6bacc 100644
> >     --- a/xen/.config
> >     +++ b/xen-config
> >     @@ -3,11 +3,11 @@
> >      # Xen/arm 4.22-unstable Configuration
> >      #
> >      CONFIG_CC_IS_GCC=3Dy
> >     -CONFIG_GCC_VERSION=3D130300
> >     +CONFIG_GCC_VERSION=3D120201
> >      CONFIG_CLANG_VERSION=3D0
> >      CONFIG_LD_IS_GNU=3Dy
> >      CONFIG_CC_HAS_ASM_INLINE=3Dy
> >     -CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
> >     +CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=3Dy
> >      CONFIG_FUNCTION_ALIGNMENT_4B=3Dy
> >      CONFIG_FUNCTION_ALIGNMENT=3D4
> >      CONFIG_ARM_64=3Dy
> >
> > So there is at least a difference in GCC version and asm-goto related
> > Kconfig options between the CI environment and my local one.
> >
> > After that I tried rebuilding inside the same Docker image that GitLab
> > CI uses:
> >
> >     registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8
> >
> > When I build Xen in that container, using the same branch, the problem
> > reproduces in the same way as in the CI job.
> >
> > Even more confusingly, adding extra prints in test_symbols just before
> > the calls to test_lookup() makes the problem disappear. This made me
> > suspect some undefined behaviour or logic issue that is very sensitive
> > to optimisation or layout changes.
>
> All symptoms described make me suspect you're hitting a problem we're
> already in the process of hunting down. Can you please take [1], make
> the small adjustment necessary to Arm's linking rule, and see whether
> you get a build failure in the case where right now you get a boot time
> crash? Of course no other changes to code or data layout should be done,
> or else you may observe false negatives.

I tested the issue with the provided patch, and it is still reproducible.

This is my working branch:

e8d5baab50 (HEAD -> reg) symbols: check table sizes don't change
between linking passes 2 and 3
e53439fdfc (xen_gitlab/reg) xen/arm: Add support for system suspend
triggered by hardware domain
eaa461f3b5 xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
4236fff9a4 xen/arm: Save/restore context on suspend/resume
a150f3d4bb xen/arm: Resume memory management on Xen resume

You can find the following line in the attached Xen boot log:

(XEN) [ 0.010785] Latest ChangeSet: Tue Dec 9 11:11:40 2025 +0100 git:e8d5b=
aab50

>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2025-12/msg00390.html

Best regards,
Mykola

--0000000000003274910645abaa9d
Content-Type: text/x-log; charset="US-ASCII"; name="boot.log"
Content-Disposition: attachment; filename="boot.log"
Content-Transfer-Encoding: base64
Content-ID: <f_mj1ddshw0>
X-Attachment-Id: f_mj1ddshw0

KFhFTikgQ2hlY2tpbmcgZm9yIGluaXRyZCBpbiAvY2hvc2VuCihYRU4pIEluaXRyZCAwMDAwMDAw
MGUyMGY0MDAwLTAwMDAwMDAwZWNlY2Q5ZTIKKFhFTikgUkFNOiAwMDAwMDAwMDAwMjAwMDAwIC0g
MDAwMDAwMDBlZmZmZmZmZgooWEVOKSBSQU06IDAwMDAwMDAxMDAwMDAwMDAgLSAwMDAwMDAwM2Zi
ZmZmZmZmCihYRU4pIFJBTTogMDAwMDAwMDNmYzUwMDAwMCAtIDAwMDAwMDAzZmZlZmZmZmYKKFhF
TikgCihYRU4pIE1PRFVMRVswXTogMDAwMDAwMDA0OTAwMDAwMCAtIDAwMDAwMDAwNDkxNmJmZmYg
WGVuICAgICAgICAgCihYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDBlMjBlYTAwMCAtIDAwMDAwMDAw
ZTIwZjBmZmYgRGV2aWNlIFRyZWUgCihYRU4pIE1PRFVMRVsyXTogMDAwMDAwMDBlMjBmNDAwMCAt
IDAwMDAwMDAwZWNlY2Q5ZTIgUmFtZGlzayAgICAgCihYRU4pIE1PRFVMRVszXTogMDAwMDAwMDAw
MjAwMDAwMCAtIDAwMDAwMDAwMDVmZmZmZmYgS2VybmVsICAgICAgCihYRU4pIE1PRFVMRVs0XTog
MDAwMDAwMDAwNjAwMDAwMCAtIDAwMDAwMDAwMDYwMGZmZmYgWFNNIFBvbGljeSAgCihYRU4pICBS
RVNWRFswXTogMDAwMDAwMDBlMjBmNDAwMCAtIDAwMDAwMDAwZWNlY2Q5ZTIKKFhFTikgCihYRU4p
IAooWEVOKSBDb21tYW5kIGxpbmU6IHhlbi1sbGMtY29sb3JzPTAtLDQsMiBsbGMtY29sb3Jpbmc9
MSBkb20wX21lbT0yMDQ4TSBjb25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMiBkb20wX21heF92
Y3B1cz0yIGJvb3RzY3J1Yj0wIGxvZ2x2bD1hbGwgbWF4Y3B1cz0yIGhtcC11bnNhZmU9dHJ1ZSB4
c209ZHVtbXkgY29uc29sZV90aW1lc3RhbXBzPWJvb3Qgc3luY19jb25zb2xlPXllcyBwY2ktcGFz
c3Rocm91Z2g9eWVzIGlvbW11PW9uCihYRU4pIHBhcmFtZXRlciAieGVuLWxsYy1jb2xvcnMiIHVu
a25vd24hCihYRU4pIHBhcmFtZXRlciAibGxjLWNvbG9yaW5nIiB1bmtub3duIQooWEVOKSBbMDAw
MDAwMDMzZjRlNWQ4NF0gcGFyYW1ldGVyICJwY2ktcGFzc3Rocm91Z2giIHVua25vd24hCihYRU4p
IFswMDAwMDAwMzNmYWMxZDUxXSBEb21haW4gaGVhcCBpbml0aWFsaXNlZAooWEVOKSBbMDAwMDAw
MDMzZmFjMWU0Nl0gQm9vdGluZyB1c2luZyBEZXZpY2UgVHJlZQooWEVOKSBbMDAwMDAwMDMzZmFj
ODI1YV0gUGxhdGZvcm06IEdlbmVyaWMgU3lzdGVtCihYRU4pIFsgICAgMC4wMDAwMTZdIExvb2tp
bmcgZm9yIGR0dWFydCBhdCAic2VyaWFsMiIsIG9wdGlvbnMgIiIKWGVuIDQuMjItdW5zdGFibGUK
KFhFTikgWyAgICAwLjAwOTY4Ml0gWGVuIHZlcnNpb24gNC4yMi11bnN0YWJsZSAocm9vdEApIChn
Y2MgKEFscGluZSAxMi4yLjFfZ2l0MjAyMjA5MjQtcjEwKSAxMi4yLjEgMjAyMjA5MjQpIGRlYnVn
PXkgVGh1IERlYyAxMSAxMTozODo0MyBVVEMgMjAyNQooWEVOKSBbICAgIDAuMDEwNzg1XSBMYXRl
c3QgQ2hhbmdlU2V0OiBUdWUgRGVjIDkgMTE6MTE6NDAgMjAyNSArMDEwMCBnaXQ6ZThkNWJhYWI1
MAooWEVOKSBbICAgIDAuMDExNDIzXSBidWlsZC1pZDogZGNlNmQxODgyYTU3YzM0MGI5ZTRmM2Rk
OTk2YjZkZjgxYjFkNDQ1OQooWEVOKSBbICAgIDAuMDExOTcwXSBDb25zb2xlIG91dHB1dCBpcyBz
eW5jaHJvbm91cy4KKFhFTikgWyAgICAwLjAxMjM2N10gUHJvY2Vzc29yOiAwMDAwMDAwMDQxMmZk
MDUwOiAiQVJNIExpbWl0ZWQiLCB2YXJpYW50OiAweDIsIHBhcnQgMHhkMDUscmV2IDB4MAooWEVO
KSBbICAgIDAuMDEzMTEwXSA2NC1iaXQgRXhlY3V0aW9uOgooWEVOKSBbICAgIDAuMDEzNDEwXSAg
IFByb2Nlc3NvciBGZWF0dXJlczogMDAwMDAwMDAxMTExMjIyMiAwMDAwMDAwMDAwMDAwMDEwCihY
RU4pIFsgICAgMC4wMTM5OTVdICAgICBFeGNlcHRpb24gTGV2ZWxzOiBFTDM6NjQrMzIgRUwyOjY0
KzMyIEVMMTo2NCszMiBFTDA6NjQrMzIKKFhFTikgWyAgICAwLjAxNDYyNV0gICAgIEV4dGVuc2lv
bnM6IEZsb2F0aW5nUG9pbnQgQWR2YW5jZWRTSU1EIEdJQ3YzLVN5c1JlZwooWEVOKSBbICAgIDAu
MDE1MjEwXSAgIERlYnVnIEZlYXR1cmVzOiAwMDAwMDAwMDEwMzA1NDA4IDAwMDAwMDAwMDAwMDAw
MDAKKFhFTikgWyAgICAwLjAxNTc2NV0gICBBdXhpbGlhcnkgRmVhdHVyZXM6IDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSBbICAgIDAuMDE2MzUwXSAgIE1lbW9yeSBNb2Rl
bCBGZWF0dXJlczogMDAwMDAwMDAwMDEwMTEyMiAwMDAwMDAwMDEwMjEyMTIyCihYRU4pIFsgICAg
MC4wMTY5NTddICAgSVNBIEZlYXR1cmVzOiAgMDAwMDEwMDAxMDIxMTEyMCAwMDAwMDAwMDAwMTAw
MDAxCihYRU4pIFsgICAgMC4wMTc1MDVdIDMyLWJpdCBFeGVjdXRpb246CihYRU4pIFsgICAgMC4w
MTc4MDVdICAgUHJvY2Vzc29yIEZlYXR1cmVzOiAwMDAwMDAwMDEwMDAwMTMxOjAwMDAwMDAwMTAw
MTEwMTEKKFhFTikgWyAgICAwLjAxODM5MF0gICAgIEluc3RydWN0aW9uIFNldHM6IEFBcmNoMzIg
QTMyIFRodW1iIFRodW1iLTIgSmF6ZWxsZQooWEVOKSBbICAgIDAuMDE4OTc1XSAgICAgRXh0ZW5z
aW9uczogR2VuZXJpY1RpbWVyIFNlY3VyaXR5CihYRU4pIFsgICAgMC4wMTk0MjVdICAgRGVidWcg
RmVhdHVyZXM6IDAwMDAwMDAwMDQwMTAwODgKKFhFTikgWyAgICAwLjAxOTg1M10gICBBdXhpbGlh
cnkgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgICAwLjAyMDMxMF0gICBNZW1v
cnkgTW9kZWwgRmVhdHVyZXM6IDAwMDAwMDAwMTAyMDExMDUgMDAwMDAwMDA0MDAwMDAwMAooWEVO
KSBbICAgIDAuMDIwOTE3XSAgICAgICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAwMTI2MDAw
MCAwMDAwMDAwMDAyMTIyMjExCihYRU4pIFsgICAgMC4wMjE1MjVdICAgSVNBIEZlYXR1cmVzOiAw
MDAwMDAwMDAyMTAxMTEwIDAwMDAwMDAwMTMxMTIxMTEgMDAwMDAwMDAyMTIzMjA0MgooWEVOKSBb
ICAgIDAuMDIyMTkyXSAgICAgICAgICAgICAgICAgMDAwMDAwMDAwMTExMjEzMSAwMDAwMDAwMDAw
MDExMTQyIDAwMDAwMDAwMDEwMTExMjEKKFhFTikgWyAgICAwLjAyMjg2Nl0gVXNpbmcgU01DIENh
bGxpbmcgQ29udmVudGlvbiB2MS41CihYRU4pIFsgICAgMC4wMjMyODZdIFVzaW5nIFBTQ0kgdjEu
MQooWEVOKSBbICAgIDAuMDIzNTcxXSBTTVA6IEFsbG93aW5nIDIgQ1BVcwooWEVOKSBbICAgIDAu
MDIzODk0XSBlbmFibGVkIHdvcmthcm91bmQgZm9yOiBBUk0gZXJyYXR1bSAxNTMwOTIzCihYRU4p
IFsgICAgMC4wMjQ0MDhdIEdlbmVyaWMgVGltZXIgSVJROiBwaHlzPTMwIGh5cD0yNiB2aXJ0PTI3
IEZyZXE6IDI0MDAwIEtIegooWEVOKSBbICAgIDAuMDI1MTQzXSBHSUN2MyBpbml0aWFsaXphdGlv
bjoKKFhFTikgWyAgICAwLjAyNTQ3M10gICAgICAgZ2ljX2Rpc3RfYWRkcj0weDAwMDAwMGZlNjAw
MDAwCihYRU4pIFsgICAgMC4wMjU5MTZdICAgICAgIGdpY19tYWludGVuYW5jZV9pcnE9MjUKKFhF
TikgWyAgICAwLjAyNjI5OF0gICAgICAgZ2ljX3JkaXN0X3N0cmlkZT0wCihYRU4pIFsgICAgMC4w
MjY2NTBdICAgICAgIGdpY19yZGlzdF9yZWdpb25zPTEKKFhFTikgWyAgICAwLjAyNzAxMF0gICAg
ICAgcmVkaXN0cmlidXRvciByZWdpb25zOgooWEVOKSBbICAgIDAuMDI3MzkzXSAgICAgICAgIC0g
cmVnaW9uIDA6IDB4MDAwMDAwZmU2ODAwMDAgLSAweDAwMDAwMGZlNzgwMDAwCihYRU4pIFsgICAg
MC4wMjc5NzhdIEdJQ3YzOiA1MTIgbGluZXMsIChJSUQgMDIwMTc0M2IpLgooWEVOKSBbICAgIDAu
MDI4NDI3XSBHSUN2MzogQ1BVMDogRm91bmQgcmVkaXN0cmlidXRvciBpbiByZWdpb24gMCBAMDAw
MDBhMDA0MDAxYzAwMAooWEVOKSBbICAgIDAuMDI5MDY2XSBYU00gRnJhbWV3b3JrIHYxLjAuMSBp
bml0aWFsaXplZAooWEVOKSBbICAgIDAuMDI5NDc3XSB4c206IFBvbGljeSBsZW4gPSAweDAwMDAw
MDAwMDAwMTAwMDAgc3RhcnQgYXQgMHgwMDAwMDAwMDA2MDAwMDAwCihYRU4pIFsgICAgMC4wMzA3
OTZdIFVzaW5nIHNjaGVkdWxlcjogU01QIENyZWRpdCBTY2hlZHVsZXIgcmV2MiAoY3JlZGl0MikK
KFhFTikgWyAgICAwLjAzMTM1OF0gSW5pdGlhbGl6aW5nIENyZWRpdDIgc2NoZWR1bGVyCihYRU4p
IFsgICAgMC4wMzE3NTZdICBsb2FkX3ByZWNpc2lvbl9zaGlmdDogMTgKKFhFTikgWyAgICAwLjAz
MjExNV0gIGxvYWRfd2luZG93X3NoaWZ0OiAzMAooWEVOKSBbICAgIDAuMDMyNDUzXSAgdW5kZXJs
b2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAwCihYRU4pIFsgICAgMC4wMzI4NThdICBvdmVybG9hZF9i
YWxhbmNlX3RvbGVyYW5jZTogLTMKKFhFTikgWyAgICAwLjAzMzI2M10gIHJ1bnF1ZXVlcyBhcnJh
bmdlbWVudDogc29ja2V0CihYRU4pIFsgICAgMC4wMzM2NjBdICBjYXAgZW5mb3JjZW1lbnQgZ3Jh
bnVsYXJpdHk6IDEwbXMKKFhFTikgWyAgICAwLjAzNDA4OF0gbG9hZCB0cmFja2luZyB3aW5kb3cg
bGVuZ3RoIDEwNzM3NDE4MjQgbnMKKFhFTikgWyAgICAwLjAzNDY5OF0gQWxsb2NhdGVkIGNvbnNv
bGUgcmluZyBvZiAxNiBLaUIuCihYRU4pIFsgICAgMC4wMzUxMTldIENQVTA6IEd1ZXN0IGF0b21p
Y3Mgd2lsbCB0cnkgMiB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIFsgICAg
MC4wMzU4MDddIEJyaW5naW5nIHVwIENQVTEKKFhFTikgWyAgICAwLjAzNjE5NV0gR0lDdjM6IENQ
VTE6IEZvdW5kIHJlZGlzdHJpYnV0b3IgaW4gcmVnaW9uIDAgQDAwMDAwYTAwNDAwM2MwMDAKKFhF
TikgWyAgICAwLjAzNjgzMV0gQ1BVMTogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSA4IHRpbWVzIGJl
Zm9yZSBwYXVzaW5nIHRoZSBkb21haW4KKFhFTikgWyAgICAwLjAzNzQ2OV0gQnJvdWdodCB1cCAy
IENQVXMKKFhFTikgWyAgICAwLjAzNzc2OV0gQ1BVIDEgYm9vdGVkLgooWEVOKSBbICAgIDAuMDM4
MTY5XSBJL08gdmlydHVhbGlzYXRpb24gZGlzYWJsZWQKKFhFTikgWyAgICAwLjAzODU0M10gUDJN
OiA0MC1iaXQgSVBBIHdpdGggNDAtYml0IFBBIGFuZCAxNi1iaXQgVk1JRAooWEVOKSBbICAgIDAu
MDM5MDYxXSBQMk06IDMgbGV2ZWxzIHdpdGggb3JkZXItMSByb290LCBWVENSIDB4MDAwMDAwMDA4
MDBhMzU1OAooWEVOKSBbICAgIDAuMDM5NzAzXSBTY2hlZHVsaW5nIGdyYW51bGFyaXR5OiBjcHUs
IDEgQ1BVIHBlciBzY2hlZC1yZXNvdXJjZQooWEVOKSBbICAgIDAuMDQwMjc1XSBJbml0aWFsaXpp
bmcgQ3JlZGl0MiBzY2hlZHVsZXIKKFhFTikgWyAgICAwLjA0MDY3Ml0gIGxvYWRfcHJlY2lzaW9u
X3NoaWZ0OiAxOAooWEVOKSBbICAgIDAuMDQxMDMyXSAgbG9hZF93aW5kb3dfc2hpZnQ6IDMwCihY
RU4pIFsgICAgMC4wNDEzNzBdICB1bmRlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IDAKKFhFTikg
WyAgICAwLjA0MTc3NV0gIG92ZXJsb2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAtMwooWEVOKSBbICAg
IDAuMDQyMTc5XSAgcnVucXVldWVzIGFycmFuZ2VtZW50OiBzb2NrZXQKKFhFTikgWyAgICAwLjA0
MjU3OF0gIGNhcCBlbmZvcmNlbWVudCBncmFudWxhcml0eTogMTBtcwooWEVOKSBbICAgIDAuMDQz
MDA1XSBsb2FkIHRyYWNraW5nIHdpbmRvdyBsZW5ndGggMTA3Mzc0MTgyNCBucwooWEVOKSBbICAg
IDAuMDQzNDg4XSBBZGRpbmcgY3B1IDAgdG8gcnVucXVldWUgMAooWEVOKSBbICAgIDAuMDQzODU1
XSAgRmlyc3QgY3B1IG9uIHJ1bnF1ZXVlLCBhY3RpdmF0aW5nCihYRU4pIFsgICAgMC4wNDQyODld
IEFkZGluZyBjcHUgMSB0byBydW5xdWV1ZSAwCihYRU4pIFsgICAgMC4wNDQ2NjZdIFVzaW5nIFND
TUkgd2l0aCBTTUMgSUQ6IDB4ODIwMDAwMTAKKFhFTikgWyAgICAwLjA0NTQ4MV0gYWx0ZXJuYXRp
dmVzOiBQYXRjaGluZyB3aXRoIGFsdCB0YWJsZSAwMDAwMGEwMDAwMmVlYWQwIC0+IDAwMDAwYTAw
MDAyZjAwMDAKKFhFTikgWyAgICAwLjA0NjU0Nl0gU0NNSTogZDAgaW5pdAooWEVOKSBbICAgIDAu
MDQ2OTM4XSAqKiogTE9BRElORyBET01BSU4gMCAqKioKKFhFTikgWyAgICAwLjA0NzI5MV0gTG9h
ZGluZyBkMCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAIDAwMDAwMDAwMDIwMDAwMDAKKFhFTikg
WyAgICAwLjA0Nzg2MF0gTG9hZGluZyByYW1kaXNrIGZyb20gYm9vdCBtb2R1bGUgQCAwMDAwMDAw
MGUyMGY0MDAwCihYRU4pIFsgICAgMC4wNDg0MjJdIEdyYW50IHRhYmxlIHJhbmdlOiAweDAwMDAw
MDQ5MDAwMDAwLTB4MDAwMDAwNDkwNDAwMDAKKFhFTikgWyAgICAwLjA0ODk4NV0gQWxsb2NhdGlu
ZyAxOjEgbWFwcGluZ3MgdG90YWxsaW5nIDIwNDhNQiBmb3IgZG9tMDoKKFhFTikgWyAgICAwLjUy
MzA2NV0gQkFOS1swXSAweDAwMDAwMDYwMDAwMDAwLTB4MDAwMDAwZTAwMDAwMDAgKDIwNDhNQikK
KFhFTikgWyAgICAwLjUzNjU5NV0gQWxsb2NhdGluZyBQUEkgMTYgZm9yIGV2ZW50IGNoYW5uZWwg
aW50ZXJydXB0CihYRU4pIFsgICAgMC41MzcyNTVdIGQwOiBleHRlbmRlZCByZWdpb24gMDogMHgy
MDAwMDAtPjB4NDkwMDAwMDAKKFhFTikgWyAgICAwLjUzNzc1MF0gZDA6IGV4dGVuZGVkIHJlZ2lv
biAxOiAweDQ5MjAwMDAwLT4weDYwMDAwMDAwCihYRU4pIFsgICAgMC41MzgyNTldIGQwOiBleHRl
bmRlZCByZWdpb24gMjogMHgxMDAwMDAwMDAtPjB4M2ZjMDAwMDAwCihYRU4pIFsgICAgMC41Mzk5
MzNdIExvYWRpbmcgekltYWdlIGZyb20gMDAwMDAwMDAwMjAwMDAwMCB0byAwMDAwMDAwMDYwMDAw
MDAwLTAwMDAwMDAwNjQwMDAwMDAKKFhFTikgWyAgICAxLjE4NTAwMV0gTG9hZGluZyBkMCBpbml0
cmQgZnJvbSAwMDAwMDAwMGUyMGY0MDAwIHRvIDB4MDAwMDAwMDA2ODIwMDAwMC0weDAwMDAwMDAw
NzJmZDk5ZTMKKFhFTikgWyAgICAyLjkxMzE2M10gTG9hZGluZyBkMCBEVEIgdG8gMHgwMDAwMDAw
MDY4MDAwMDAwLTB4MDAwMDAwMDA2ODAwNWJhNgooWEVOKSBbICAgIDIuOTE0OTEwXSBJbml0aWFs
IGxvdyBtZW1vcnkgdmlycSB0aHJlc2hvbGQgc2V0IGF0IDB4NDAwMCBwYWdlcy4KKFhFTikgWyAg
ICAyLjkxNTc3OF0gCihYRU4pIFsgICAgMi45MTU5NTBdICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKKFhFTikgWyAgICAyLjkxNjQyM10gUGFuaWMgb24gQ1BVIDA6CihY
RU4pIFsgICAgMi45MTY3MDhdIHRlc3Rfc3ltYm9sczogbm9uLXplcm8gb2Zmc2V0ICgweDI0KSB1
bmV4cGVjdGVkCihYRU4pIFsgICAgMi45MTcyMzNdICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKKFhFTikgWyAgICAyLjkxNzcwNV0gCihYRU4pIFsgICAgMi45MTc4Nzhd
IFJlYm9vdCBpbiBmaXZlIHNlY29uZHMuLi4K
--0000000000003274910645abaa9d--

