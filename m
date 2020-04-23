Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A41B620F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 19:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRfm3-0007Az-Gm; Thu, 23 Apr 2020 17:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRfm1-0007At-Vo
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 17:36:30 +0000
X-Inumbo-ID: f6973e02-8588-11ea-b58d-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6973e02-8588-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 17:36:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n6so7064140ljg.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=txrokkw3h+LyHqizXSi9SF+rKElJZ0O1ZuJ3YLvcGg4=;
 b=kX27mxiH3nzFfLzAQZcB5ccSqR78tFBRkTWKE7LXTXQafGMgccqD6bIr5a52cK6jVP
 V1iG3iB9Y5UV15vuS09mImGJCpRd9EvgM6Y7ZrXySlRsFfea3XS4biNDkglwLsRzLFNe
 A4/3Hb/RKLVRWtbfPl0Oa5Cb+ULDIqDu+ZiIgMFSvFUXkcKvoJ+8lJ1HZNbZakC6mZbK
 hyRh9hF+1pGDlT71bXlb1t5+L5s2lLg2E6n9Yjvqbky6MS1OLsCuPYK2HVVZLB5e/BtZ
 07pCpvs+5JjcpOUCBfA6hnSiSUTJh0m0TWro/AVnsIMRQhUuMX6nTHSSF4+h9trDN7Wj
 m3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=txrokkw3h+LyHqizXSi9SF+rKElJZ0O1ZuJ3YLvcGg4=;
 b=kZkXObWuGrWP8LPg2unKCYuR6rKaeNfxmptu9N4Fkl5levVTqOnJ+NC4oNaq2e2PZ4
 9yRgoYEFYvW1ZiExqPCWQJ8+KWXIS5ghwzJ0Vnm41J5LhZLFUT2VS/lliOpho2k4+aCe
 R1CJAoeTXADSSHFdKvT7XuV31MVaJamMjpR2Vrl0iLeOk2QzeWgArAgt0MseCNwPOTqe
 Msq/g6scNaNB+fooeNisV9NiNqSySnRs7h/UBQw2XFurBCQuBzAbg8kEA1LCGLKTeM4L
 8tn+7gyKaXYj2nTnBpBxUSBgsCdD9t7n/IAN6Jkcfds9cW3jqcqEGTdHYP8sZm+U3dU3
 F4ug==
X-Gm-Message-State: AGi0Pubh8OTdK7ktYjsCiwRhUQqCBhViz25QoeGeWZg9MNV3PPtBXb1F
 eXMSfOn4qEC75i6Q/zVxZoWigdQ9uPmECBWbEys=
X-Google-Smtp-Source: APiQypL6hcTs8h/vQvmoYpK9thpWsxk9QuiUjxmQP/OJSalslrj0esN2fvolzEr7s1QzkhydsRz1mCQ11VzXTAVIujM=
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr3038418lji.279.1587663388262; 
 Thu, 23 Apr 2020 10:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
 <CAFLBxZaKiuqpmVvP2ww9YbuTkCm9wdBKGdMJOrT=sTaJSaycqg@mail.gmail.com>
 <CAEBZRSfG053_DYA6BCZUjg6c4oa3AHDsK5Puc4ipy=py8C6Mgw@mail.gmail.com>
 <E0E74128-3E4E-44C7-976D-098CBADF4C5D@citrix.com>
In-Reply-To: <E0E74128-3E4E-44C7-976D-098CBADF4C5D@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 23 Apr 2020 13:36:16 -0400
Message-ID: <CAEBZRSfX5DUECxgRqXzPk4=t-MoGRSrCJ_sXTc=ffG1aoGhNUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> The underscore thing though =E2=80=94 I think it=E2=80=99s a bad idea to =
mix `-` and `_`; =E2=80=94enable-golang_tools just isn=E2=80=99t a good ide=
a IMHO. :-)
>
> Do you need _tools?  Could it just be =E2=80=94enable-golang?

I agree, I don't like mixing the '-' and '_'. From what I could tell,
that was how the other options were named in tools/configure.ac and
Tools.mk.in (unless I missed a way to tell the --enable flag to just
use '-'), so I went with that. I can just do --enable-golang, but I
was trying to make it a bit more descriptive if possible.

-NR

