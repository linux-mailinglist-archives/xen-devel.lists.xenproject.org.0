Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A090268AFA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:30:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHncJ-0000eK-OH; Mon, 14 Sep 2020 12:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePln=CX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kHncI-0000eF-3B
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:29:54 +0000
X-Inumbo-ID: 72eecc39-6c8c-4b51-aae4-dd1e9440886a
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72eecc39-6c8c-4b51-aae4-dd1e9440886a;
 Mon, 14 Sep 2020 12:29:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x14so18480791wrl.12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=uUYawoMUHSVgae1RII5+2vgp2RXyLcWjKBeSEqRFShM=;
 b=Xl1w9PTDvkpDdtvIwgVT0dGtl2Zyi6zbdpJm4xUYB41Rm8G1dFYT/ut2cU3yA+XtwC
 loLtkoiOu/jNBwkmrqAVIIYoYXpY7uYR+midpuQFDqBnTeE1qzN4m6C4qAiu+s+rdoqE
 iBoorTwY3Y3zdseYKYvwpDCreMXFXxS04GAgEGdwxNprQRiITIZXuHrNw+fnQkastknI
 w2ZfYrBS3jnXS9ArFZ+8/1JVdUG9BZZEbq6wL9KYJPFIo5koULMxDIVgRPTVh+0JJc3m
 74XDU7iHzT0AmPB+5bjHu+UfvmwYs8fzKqeGEV3y/AilDvedkpkQkww4+Fk+X1VvI5DC
 m0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=uUYawoMUHSVgae1RII5+2vgp2RXyLcWjKBeSEqRFShM=;
 b=ViBPG2sAO7GixqB2kivErszHgeC6gVJRZ+ad7R7jCBYpaJ4tbOKpBUnhaPe/pXUGsl
 f+Bj+RjPfQO3WHnLonPCZfX0T7P5tSKgrweH5hnOFCdnpTEKVJc8CJer9otb1JyG0iSo
 3W4HKrW3ORXp/zphpJFjnvXUQvYl0sn6UPe2Kalp+blp+Yi3IIFNWjkZtrMPqt4r8mWI
 E2S/sr/8F1dqAMgUWCw9jVzfT99W5/1+uqiN373JKULeAZtgaRIojMGnObmD9TGcq1ea
 wcLpVvlSUsdEfhZjJlpsIg3VqNQ7uhirN6qUkFA2kjiow3JTnmXUjPGwnNfLTbtavu62
 Hpww==
X-Gm-Message-State: AOAM530yhO3069/1FwLNf0SVzDduVsxr5CBdGHs8Zi5rhh3D4iSGi1MY
 ovHy79FFfne6UOZ/pgBOpkQ=
X-Google-Smtp-Source: ABdhPJwl1dnfCnxu+/tnQiV7q3QfJ+Bg7DdvO5Si8FyicRKUrGb6wNkxp3qiWrqBSxEmPcRbreGDSA==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr15119493wrn.145.1600086592295; 
 Mon, 14 Sep 2020 05:29:52 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id k8sm20622179wrl.42.2020.09.14.05.29.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 05:29:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200911082032.1466-1-paul@xen.org>
 <20200911082032.1466-6-paul@xen.org>
 <bfc234e7-b822-71e1-f305-b0643998f00a@xen.org>
In-Reply-To: <bfc234e7-b822-71e1-f305-b0643998f00a@xen.org>
Subject: RE: [PATCH v8 5/8] remove remaining uses of iommu_legacy_map/unmap
Date: Mon, 14 Sep 2020 13:29:50 +0100
Message-ID: <000201d68a92$be5db980$3b192c80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHe4hxWn7/x4kFdjMn9V+tIGpFtaQIVkMvxAZZ2qYipOgB6QA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 14 September 2020 11:47
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin =
Tian <kevin.tian@intel.com>
> Subject: Re: [PATCH v8 5/8] remove remaining uses of =
iommu_legacy_map/unmap
>=20
> Hi Paul,
>=20
> I am sorry for jumping very late in the discussion.
>=20
> On 11/09/2020 09:20, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The 'legacy' functions do implicit flushing so amend the callers to =
do the
> > appropriate flushing.
> >
> > Unfortunately, because of the structure of the P2M code, we cannot =
remove
> > the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
> > facilitates. It is now checked directly iommu_iotlb_flush(). This is =
safe
> > because callers of iommu_iotlb_flush() on another CPU will not be =
affected,
> > and hence a flush will be done. Also, 'iommu_dont_flush_iotlb' is =
now declared
> > as bool (rather than bool_t) and setting/clearing it are no longer =
pointlessly
> > gated on is_iommu_enabled() returning true. (Arguably it is also =
pointless to
> > gate the call to iommu_iotlb_flush() on that condition - since it is =
a no-op
> > in that case - but the if clause allows the scope of a stack =
variable to be
> > restricted).
>=20
> Unfortunately, this change will re-open a potential security hole =
closed
> by commit 671878779741:
>=20
>      xen/arm: p2m: Free the p2m entry after flushing the IOMMU TLBs
>=20
>      When freeing a p2m entry, all the sub-tree behind it will also be
> freed.
>      This may include intermediate page-tables or any l3 entry =
requiring to
>      drop a reference (e.g for foreign pages). As soon as pages are =
freed,
>      they may be re-used by Xen or another domain. Therefore it is =
necessary
>      to flush *all* the TLBs beforehand.
>=20
>      While CPU TLBs will be flushed before freeing the pages, this is =
not
>      the case for IOMMU TLBs. This can be solved by moving the IOMMU =
TLBs
>      flush earlier in the code.
>=20
>      This wasn't considered as a security issue as device passthrough =
on Arm
>      is not security supported.
>=20
>      Signed-off-by: Julien Grall <julien.grall@arm.com>
>      Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>      Release-acked-by: Juergen Gross <jgross@suse.com>
>=20
> One possibility would be to treat iommu_dont_flush_iotlb as x86 only.
>=20

Yes, it could be checked in the calling (and hence arch specific) code =
to deal with this.

  Paul

> Cheers,
>=20
> --
> Julien Grall


