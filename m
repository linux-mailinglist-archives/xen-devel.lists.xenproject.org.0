Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6991FA039
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 21:29:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkumZ-0004LZ-S8; Mon, 15 Jun 2020 19:28:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9aT8=74=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jkumY-0004LU-2N
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 19:28:34 +0000
X-Inumbo-ID: 66374566-af3e-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66374566-af3e-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 19:28:33 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id p20so18662102ejd.13
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LStajdU5A97rbmxSqmjdia4JbDB3BVApLrPOJJzsEJ4=;
 b=v7Fwr4DxgQenRnlVbcXFIcivtrjqEgCljBqBdQ0lzIV3iGU9Z/7hec54kJu6qq4uU0
 WEqn5yVnDx3d3/YUNTOsVD72kil5oO5TjfXbE6QL6J5tDoHiXZ7wEWvMBMsDc3zWT83Y
 n8nMPuGLR61bAzXdfTsuJUHlGiPR2MOHZaIAMfg5jkXECDvR5ySw+qV967z9sb0vY9lu
 i2Y2mucHNLGOVWTkQUSDGTyRwMfuZZnPVLU/Go3PtkzMaeddheQTxB6QwDELVy5uDpgy
 sCcP/gFBVlR1ld9QoHFIgvU52GKv/+rZ0P2XmAXqc2rZ/DOj5JbNNgsG0plXteeA2ktZ
 BLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LStajdU5A97rbmxSqmjdia4JbDB3BVApLrPOJJzsEJ4=;
 b=fyCPnnLqmeYHQBfGDvCT7K5XDbSZtAj3xPIaENJ6quMnlR4uhcI4nLZ+QJPJsuHjjI
 5fgnbapem4KxVsCWqUo9Nz3AWrYuYD/pI3JT/KKIHDNPBz4J8/wom0e785wKH7qPLmv1
 vTmFyzRmtHv0qSz4ct+jjUI3i3C7SC1r/AuuFITIrQP9b1lo3MNF440YtQcalwNJFYbo
 Cgn5xfFLXVk7grbFdemkmDrSzkWOncnUIRo75toxVfO9twW1+G76p+VxGbcWMKTV19Ds
 513iXHcGWynC2M98wdN/EGdR9V1aKwC9z0bYRxcV081MLIWcyBYXk2TpsiLBQ8vlkmM+
 wzqw==
X-Gm-Message-State: AOAM533e6VmHs9JF8XYlJ+fHmdCZOzsfi11YBXTjJ6Cfo4RnJOfWsDhk
 Va1oDYHVoyt+HnG88VDHXNABcziG/yE=
X-Google-Smtp-Source: ABdhPJyiukRpCUdQmWi6CqZlbmW+OTsG11swd4UJu/ApUCzDRImEpGiE3Y34PDbqZiTQDimChKVEFQ==
X-Received: by 2002:a17:906:f53:: with SMTP id
 h19mr12403945ejj.491.1592249311477; 
 Mon, 15 Jun 2020 12:28:31 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id dm1sm9558735ejc.99.2020.06.15.12.28.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:28:30 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id g10so679573wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 12:28:29 -0700 (PDT)
X-Received: by 2002:a1c:964d:: with SMTP id y74mr897479wmd.154.1592249309494; 
 Mon, 15 Jun 2020 12:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
 <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
 <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
 <002401d638b0$a5460f80$efd22e80$@xen.org>
 <d3df7cbf-843a-9253-292c-b6bb48ff9c94@suse.com>
In-Reply-To: <d3df7cbf-843a-9253-292c-b6bb48ff9c94@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Jun 2020 13:27:54 -0600
X-Gmail-Original-Message-ID: <CABfawhmMgNCBwoTZ6Fm300q3CVUu0sQNLOU3_jW_iCr_OMTWLg@mail.gmail.com>
Message-ID: <CABfawhmMgNCBwoTZ6Fm300q3CVUu0sQNLOU3_jW_iCr_OMTWLg@mail.gmail.com>
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 3:39 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 02.06.2020 09:37, Paul Durrant wrote:
> > Maintainers/committers, can we please get those patches in a.s.a.p.?
>
> The sole reason I didn't put in at least the 1st patch on Friday
> (perhaps also the 2nd, as it is suitably ack-ed) was that it's
> still missing a VMX maintainer ack, and Kevin had provided
> comments on v2 of the smaller (2-patch) series.

Can we get the first patches from this series merged now with Kevin's
Reviewed-by he sent last week
(https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00732.html)?

Thanks,
Tamas

