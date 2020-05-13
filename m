Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D975D1D1EC4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 21:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYwoz-0002jZ-Ev; Wed, 13 May 2020 19:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJAX=63=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jYwoy-0002jU-AX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 19:13:36 +0000
X-Inumbo-ID: d78abb4a-954d-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d78abb4a-954d-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 19:13:35 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g20so458634qvb.9
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6iZF1caH6VOddxvTW47XGR3M7B27p0oqCJdQgf7rTY=;
 b=geID/LW/yYgYejhFNX9qNwxv58iVYiSm0XWfBcxlFDpWZToQwPCHdH3rO6LlLNjDnR
 JPjpyCNDaH0OsBeaFfJSd1G96JifU3x1BoBVRAEIGmNby39IFvkRPj7PbOnBd64BBBZZ
 ipqRTtNY5PORkT+tYsSKbc1MQeRfEcXu+LiJ2I0n4qOtRXcWVA9k1/UEJBMzDRMVJyva
 sv5jl/J6EDNAMhoSOT1UcIlrx+h8nYZZUSZVkD4LmvaxaTbo4g16vDiECzpvYIX68oFk
 O05Tc1hXnG7GlT+Ye/ca3jOH2tGJFLrY1p/+U5WaUmWLqfeBIjc/NNBfzYa+FLoGhoMf
 Amkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6iZF1caH6VOddxvTW47XGR3M7B27p0oqCJdQgf7rTY=;
 b=fh+cM4JDhNHIu8ENNS3krI1SupGaJGfzAVQbEhnDL2nLg7/r1QV88sfOLZ8Qn83G3C
 bBIwGAgB/gZz/Yf1WRBAUVNd9RRBDzOW/KI9E2eO6eVVMaLZKZkadQ5ZWZtlb/vFXbDQ
 Pmn5b/iHalMl6ge8kabDn0if5YV42T3k/+PNaOQBLMjyZc0ZP1EZgimNVasFwLIXBFXD
 eWvOgMsyqqfg11Bu2klK+OtYcuf5DMdEDq/3h7sVGI1jcVBTbBytp3ke1pvDQ8rexk5q
 4rCwHbVYzAH2tZdDrHQC3591gExpWmJkanq/HcgjDLRI8kcq18Y8qxTxbDndHRBtsIkX
 aAsw==
X-Gm-Message-State: AOAM530udSZdYwnwVGtzeEGc+pRN5oRguFLoVUiNZpFq/woEnVCgh8Xb
 lwAkKZrQ2LkEbVGzr9Oy7K2odC9Xs9brpxi7SSOLXA==
X-Google-Smtp-Source: ABdhPJzz3LQYQzR9E9bZ5ZDZm3xzxXEZz2mzhS6Pjz7x7ThKCMFXj1/z7HriqNzRllKWONBHtLR60yOMPWDDc7zUt/c=
X-Received: by 2002:ad4:452d:: with SMTP id l13mr1172279qvu.19.1589397214563; 
 Wed, 13 May 2020 12:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
In-Reply-To: <d940d405-5706-c749-f546-c0c60528394d@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 13 May 2020 12:13:23 -0700
Message-ID: <CAMmSBy9+LnHcMJfgWRsiToz+pG2X_tRtxLnDAT-W+_9f--_x6g@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Julien Grall <julien@xen.org>
Content-Type: multipart/mixed; boundary="00000000000062113c05a58c60fd"
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
Cc: Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "minyard@acm.org" <minyard@acm.org>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000062113c05a58c60fd
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020 at 11:20 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 13/05/2020 16:11, Stefano Stabellini wrote:
> > On Wed, 13 May 2020, Julien Grall wrote:
> >> Hi,
> >>
> >> On 13/05/2020 01:33, Stefano Stabellini wrote:
> >>> I worked with Roman to do several more tests and here is an update on
> >>> the situation. We don't know why my patch didn't work when Boris' patch
> >>> [1] worked.  Both of them should have worked the same way.
> >>>
> >>> Anyway, we continued with Boris patch to debug the new mmc error which
> >>> looks like this:
> >>>
> >>> [    3.084464] mmc0: unrecognised SCR structure version 15
> >>> [    3.089176] mmc0: error -22 whilst initialising SD card
> >>>
> >>> I asked to add a lot of trancing, see attached diff.
> >>
> >> Please avoid attachment on mailing list and use pastebin for diff.
> >>
> >>> We discovered a bug
> >>> in xen_swiotlb_init: if io_tlb_start != 0 at the beginning of
> >>> xen_swiotlb_init, start_dma_addr is not set correctly. This oneline
> >>> patch fixes it:
> >>>
> >>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> >>> index 0a40ac332a4c..b75c43356eba 100644
> >>> --- a/drivers/xen/swiotlb-xen.c
> >>> +++ b/drivers/xen/swiotlb-xen.c
> >>> @@ -191,6 +191,7 @@ int __ref xen_swiotlb_init(int verbose, bool early)
> >>>            * IO TLB memory already allocated. Just use it.
> >>>            */
> >>>           if (io_tlb_start != 0) {
> >>> +               start_dma_addr = io_tlb_start;
> >>>                   xen_io_tlb_start = phys_to_virt(io_tlb_start);
> >>>                   goto end;
> >>>           }
> >>>
> >>> Unfortunately it doesn't solve the mmc0 error.
> >>>
> >>>
> >>> As you might notice from the logs, none of the other interesting printks
> >>> printed anything, which seems to mean that the memory allocated by
> >>> xen_swiotlb_alloc_coherent and mapped by xen_swiotlb_map_page should be
> >>> just fine.
> >>>
> >>> I am starting to be out of ideas. Do you guys have any suggestions on
> >>> what could be the issue or what could be done to discover it?
> >>
> >> Sorry if my suggestions are going to be obvious, but I can't confirm whether
> >> this was already done:
> >>      1) Does the kernel boot on baremetal (i.e without Xen)? This should help
> >> to confirm whether the bug is Xen is related.
> >
> > Yes it boots
> >
> >>      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did you try
> >> to disable it? This should help to confirm whether swiotlb is the problem or
> >> not.
> >
> > It boots disabling swiotlb-xen
>
> Thank you for the answer! swiotlb-xen should basically be a NOP for
> dom0. So this suggests swiotlb is doing some transformation on the DMA
> address.
>
> I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to
> assume the DMA address space and CPU address space is the same. Is RPI
> using the same address space?
>
> As an aside, I can't find the 1=== and === from the log in your diff. So
> I am not entirely which path is used. Can you provide the associated log
> with your diff?

These are just extra printks to understand the code path better. A full complete
patch is attached so we're all on the same page.

Thanks,
Roman.

--00000000000062113c05a58c60fd
Content-Type: text/plain; charset="US-ASCII"; name="patch.txt"
Content-Disposition: attachment; filename="patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_ka5q1n230>
X-Attachment-Id: f_ka5q1n230

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0veGVuL21tLmMKaW5kZXgg
ZDQwZTllNWZjLi5mYjIxYjU0MmMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCisrKyBi
L2FyY2gvYXJtL3hlbi9tbS5jCkBAIC0yOSwxMyArMjksMTEgQEAgdW5zaWduZWQgbG9uZyB4ZW5f
Z2V0X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIpCiAKIAlmb3JfZWFjaF9t
ZW1ibG9jayhtZW1vcnksIHJlZykgewogCQlpZiAocmVnLT5iYXNlIDwgKHBoeXNfYWRkcl90KTB4
ZmZmZmZmZmYpIHsKLQkJCWlmIChJU19FTkFCTEVEKENPTkZJR19aT05FX0RNQTMyKSkKLQkJCQlm
bGFncyB8PSBfX0dGUF9ETUEzMjsKLQkJCWVsc2UKLQkJCQlmbGFncyB8PSBfX0dGUF9ETUE7CisJ
CQlmbGFncyB8PSBfX0dGUF9ETUE7CiAJCQlicmVhazsKIAkJfQogCX0KKwlwcmludGsoIkRFQlVH
ICVzICVkIGZsYWdzPSV4XG4iLF9fZnVuY19fLF9fTElORV9fLGZsYWdzKTsKIAlyZXR1cm4gX19n
ZXRfZnJlZV9wYWdlcyhmbGFncywgb3JkZXIpOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwppbmRleCBiNmQyNzc2
MmMuLmZmOWQwN2UyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysg
Yi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC0xOTEsNiArMTkxLDcgQEAgaW50IF9fcmVm
IHhlbl9zd2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCiAJICogSU8gVExCIG1l
bW9yeSBhbHJlYWR5IGFsbG9jYXRlZC4gSnVzdCB1c2UgaXQuCiAJICovCiAJaWYgKGlvX3RsYl9z
dGFydCAhPSAwKSB7CisJCXN0YXJ0X2RtYV9hZGRyID0gaW9fdGxiX3N0YXJ0OwogCQl4ZW5faW9f
dGxiX3N0YXJ0ID0gcGh5c190b192aXJ0KGlvX3RsYl9zdGFydCk7CiAJCWdvdG8gZW5kOwogCX0K
QEAgLTIyNCw2ICsyMjUsNyBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9z
ZSwgYm9vbCBlYXJseSkKIAkJbV9yZXQgPSBYRU5fU1dJT1RMQl9FTk9NRU07CiAJCWdvdG8gZXJy
b3I7CiAJfQorcHJpbnRrKCJERUJVRyAlcyAlZCBzdGFydF92aXJ0PSVseCBvcmRlcj0lbHUgcGh5
cz0lbGx4IHZtYWxsb2M/PSVkXG4iLF9fZnVuY19fLF9fTElORV9fLCh1bnNpZ25lZCBsb25nKXhl
bl9pb190bGJfc3RhcnQsIG9yZGVyLCB2aXJ0X3RvX3BoeXMoeGVuX2lvX3RsYl9zdGFydCksIGlz
X3ZtYWxsb2NfYWRkcih4ZW5faW9fdGxiX3N0YXJ0KSk7CQogCS8qCiAJICogQW5kIHJlcGxhY2Ug
dGhhdCBtZW1vcnkgd2l0aCBwYWdlcyB1bmRlciA0R0IuCiAJICovCkBAIC0yNTUsNiArMjU3LDcg
QEAgaW50IF9fcmVmIHhlbl9zd2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCiAJ
aWYgKCFyYykKIAkJc3dpb3RsYl9zZXRfbWF4X3NlZ21lbnQoUEFHRV9TSVpFKTsKIAorcHJpbnRr
KCJERUJVRyAlcyAlZCBzdGFydD0lbGx4IGVuZD0lbGx4IHJjPSVkXG4iLF9fZnVuY19fLF9fTElO
RV9fLHN0YXJ0X2RtYV9hZGRyLHN0YXJ0X2RtYV9hZGRyK2J5dGVzLHJjKTsKIAlyZXR1cm4gcmM7
CiBlcnJvcjoKIAlpZiAocmVwZWF0LS0pIHsKQEAgLTMyNCw2ICszMjcsMTAgQEAgeGVuX3N3aW90
bGJfYWxsb2NfY29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdkZXYsIHNpemVfdCBzaXplLAogCQl9
CiAJCVNldFBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UocmV0KSk7CiAJfQoraWYgKCFkbWFf
Y2FwYWJsZShod2RldiwgKmRtYV9oYW5kbGUsIHNpemUsIHRydWUpKQorICAgIHByaW50aygiREVC
VUcxICVzICVkIHBoeXM9JWxseCBkbWE9JWxseCBkbWFfbWFzaz0lbGx4XG4iLF9fZnVuY19fLF9f
TElORV9fLHBoeXMsKmRtYV9oYW5kbGUsZG1hX21hc2spOworaWYgKGRldl9hZGRyICsgc2l6ZSAt
IDEgPiBkbWFfbWFzaykKKyAgICBwcmludGsoIkRFQlVHMiAlcyAlZCBwaHlzPSVsbHggZG1hPSVs
bHggZG1hX21hc2s9JWxseFxuIixfX2Z1bmNfXyxfX0xJTkVfXyxwaHlzLCpkbWFfaGFuZGxlLGRt
YV9tYXNrKTsKIAltZW1zZXQocmV0LCAwLCBzaXplKTsKIAlyZXR1cm4gcmV0OwogfQpAQCAtMzM1
LDYgKzM0Miw3IEBAIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdk
ZXYsIHNpemVfdCBzaXplLCB2b2lkICp2YWRkciwKIAlpbnQgb3JkZXIgPSBnZXRfb3JkZXIoc2l6
ZSk7CiAJcGh5c19hZGRyX3QgcGh5czsKIAl1NjQgZG1hX21hc2sgPSBETUFfQklUX01BU0soMzIp
OworCXN0cnVjdCBwYWdlICpwZzsKIAogCWlmIChod2RldiAmJiBod2Rldi0+Y29oZXJlbnRfZG1h
X21hc2spCiAJCWRtYV9tYXNrID0gaHdkZXYtPmNvaGVyZW50X2RtYV9tYXNrOwpAQCAtMzQ1LDEy
ICszNTMsMTYgQEAgeGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpod2Rl
diwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRyLAogCiAJLyogQ29udmVydCB0aGUgc2l6ZSB0byBh
Y3R1YWxseSBhbGxvY2F0ZWQuICovCiAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5fUEFHRV9T
SElGVCk7Ci0KK3ByaW50ayhLRVJOX0NSSVQgIj09PTEgYmVmb3JlXG4iKTsKKwlwZyA9IGlzX3Zt
YWxsb2NfYWRkcih2YWRkcikgPyB2bWFsbG9jX3RvX3BhZ2UodmFkZHIpIDogdmlydF90b19wYWdl
KHZhZGRyKTsKK3ByaW50ayhLRVJOX0NSSVQgIj09PT0gbWlkZGxlXG4iKTsJCisJQlVHX09OKCFw
Zyk7CitwcmludGsoS0VSTl9DUklUICI9PT09IGFmdGVyXG4iKTsKIAlpZiAoIVdBUk5fT04oKGRl
dl9hZGRyICsgc2l6ZSAtIDEgPiBkbWFfbWFzaykgfHwKIAkJICAgICByYW5nZV9zdHJhZGRsZXNf
cGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkgJiYKLQkgICAgVGVzdENsZWFyUGFnZVhlblJlbWFw
cGVkKHZpcnRfdG9fcGFnZSh2YWRkcikpKQorCSAgICBUZXN0Q2xlYXJQYWdlWGVuUmVtYXBwZWQo
cGcpKQogCQl4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Ci0KK3By
aW50ayhLRVJOX0NSSVQgIj09PT0gZG9uZVxuIik7CiAJeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMo
aHdkZXYsIHNpemUsIHZhZGRyLCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7CiB9CiAKQEAgLTM5
OCw2ICs0MTAsNyBAQCBzdGF0aWMgZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFnZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAogCSAqIEVuc3VyZSB0aGF0IHRoZSBh
ZGRyZXNzIHJldHVybmVkIGlzIERNQSdibGUKIAkgKi8KIAlpZiAodW5saWtlbHkoIWRtYV9jYXBh
YmxlKGRldiwgZGV2X2FkZHIsIHNpemUsIHRydWUpKSkgeworcHJpbnRrKCJERUJVRzMgJXMgJWQg
cGh5cz0lbGx4IGRtYT0lbGx4XG4iLF9fZnVuY19fLF9fTElORV9fLHBoeXMsZGV2X2FkZHIpOwkJ
CiAJCXN3aW90bGJfdGJsX3VubWFwX3NpbmdsZShkZXYsIG1hcCwgc2l6ZSwgc2l6ZSwgZGlyLAog
CQkJCWF0dHJzIHwgRE1BX0FUVFJfU0tJUF9DUFVfU1lOQyk7CiAJCXJldHVybiBETUFfTUFQUElO
R19FUlJPUjsKZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50LmggYi9p
bmNsdWRlL3hlbi9hcm0vcGFnZS1jb2hlcmVudC5oCmluZGV4IGI5Y2MxMWU4OC4uNTBjN2EyZTk2
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi9hcm0vcGFnZS1jb2hlcmVudC5oCisrKyBiL2luY2x1
ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50LmgKQEAgLTgsMTIgKzgsMTcgQEAKIHN0YXRpYyBpbmxp
bmUgdm9pZCAqeGVuX2FsbG9jX2NvaGVyZW50X3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBz
aXplX3Qgc2l6ZSwKIAkJZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSwgZ2ZwX3QgZmxhZ3MsIHVuc2ln
bmVkIGxvbmcgYXR0cnMpCiB7CisJdm9pZCAqY3B1X2FkZHI7CisgICAgICAgIGlmIChkbWFfYWxs
b2NfZnJvbV9kZXZfY29oZXJlbnQoaHdkZXYsIHNpemUsIGRtYV9oYW5kbGUsICZjcHVfYWRkcikp
CisgICAgICAgICAgICByZXR1cm4gY3B1X2FkZHI7CiAJcmV0dXJuIGRtYV9kaXJlY3RfYWxsb2Mo
aHdkZXYsIHNpemUsIGRtYV9oYW5kbGUsIGZsYWdzLCBhdHRycyk7CiB9CiAKIHN0YXRpYyBpbmxp
bmUgdm9pZCB4ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6
ZV90IHNpemUsCiAJCXZvaWQgKmNwdV9hZGRyLCBkbWFfYWRkcl90IGRtYV9oYW5kbGUsIHVuc2ln
bmVkIGxvbmcgYXR0cnMpCiB7CisJaWYgKGRtYV9yZWxlYXNlX2Zyb21fZGV2X2NvaGVyZW50KGh3
ZGV2LCBnZXRfb3JkZXIoc2l6ZSksIGNwdV9hZGRyKSkKKyAgICAgICAgICAgIHJldHVybjsKIAlk
bWFfZGlyZWN0X2ZyZWUoaHdkZXYsIHNpemUsIGNwdV9hZGRyLCBkbWFfaGFuZGxlLCBhdHRycyk7
CiB9CiAK
--00000000000062113c05a58c60fd--

