Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D8AE6C60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023946.1400011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6QK-0006i9-Rz; Tue, 24 Jun 2025 16:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023946.1400011; Tue, 24 Jun 2025 16:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6QK-0006fW-P5; Tue, 24 Jun 2025 16:23:04 +0000
Received: by outflank-mailman (input) for mailman id 1023946;
 Tue, 24 Jun 2025 16:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yl0=ZH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1uU6QJ-0006fQ-11
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:23:03 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e46c7ae-5117-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 18:23:00 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-531426c7143so1720706e0c.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:22:59 -0700 (PDT)
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
X-Inumbo-ID: 7e46c7ae-5117-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750782179; x=1751386979; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30GIdBwPje0TxaWLDeGF8emUkBrMEvRfpZXuhgyUSzE=;
        b=bUzUdW+bqwWv6IYMihgfWLKmgWr7kU0QA29mBwaOmihQ1K1jnOgoHgL4CzVb4mdeWP
         1QjMBAyg6yO6cmM/os0182hxTsuaC4ccYYjeQ4I17Eyh77PbA7Cz6skeewPWS26sBppz
         ZSbA7PAuo8EzKYQLZtg8xAf3yzc3zv8vqQcL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782179; x=1751386979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30GIdBwPje0TxaWLDeGF8emUkBrMEvRfpZXuhgyUSzE=;
        b=tZbkKOLGH8ZJrDWTaM33vhhLjj7G5K+MnfJcqXXcb32SA0eseR+9hoZq+enbjmErky
         yO67ChybKeSGMlYtpx7oZSLp90x9O1qE67RgdvW4OGtdyy+BEZL7xC0iGi2ICOzlbcfD
         LIQ2bwoc1AzvY0MXxD5Kb4XYxysYDMombTw3M4cSPdIadx4wvx7kLaFn1neXUChGCv8s
         eHbHFYOTZmGHdS5WaWpT8pg+0LJakr6lDWkPwM46+6p9+2E9M6Gh/CnDRlnePZhclsSs
         p8M9YqzRGcqwrXgg7TsEtgqsi/560W1730bQFTffusDkMG35kds+Hu/yrVtB/3XrUUr4
         YzUA==
X-Forwarded-Encrypted: i=1; AJvYcCUMPSOFE4LcsDF9dDuuMr0+7wPOThptzGK7dK0u5MLr43qkThWc0Cea7IfLMaDdpQGnwSpEF0u4uGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykoZsjyQOh9Lk7y4n2rFTVXbBeogyhIn7yHcVQunUojNJ81vTT
	OFEQtQeACkxDstld70WAwAwOSBThW763BZvkRzpHOV7nxLJ95pp4myWsDcfi7+jZh5MjqdU1Y8f
	ySqplH/p+jjvo/6rjV9spWM590YKDmuOl4MItsJjqrg==
X-Gm-Gg: ASbGncvsAldiZUHzMqb5/0tdfL1mKzJe7vJ/GeNR3VXxMbOv+dzPHJMtgc3Fq3dy6f3
	FPH5p3g+s+7NvyzBCRSrdMOFaxBFV0BiIJ5S/+M0DdFhpXDb7K367M1OHp7JcFcenq+KYiTy5ro
	Lx27cBvJuhW0t5M5gaWB7jrIpHVB+XxdLrUOJHYlostkv/Dw==
X-Google-Smtp-Source: AGHT+IHqcXjNKRQ0wZcRpI0UdrrEr+8Z6+Z8cUqyk9Pvx7khNEjPe7B070IiA25pmW65WKU+wF6ULqZNM/Lk6x/qmuI=
X-Received: by 2002:a05:6122:20ac:b0:520:64ea:c479 with SMTP id
 71dfb90a1353d-531ad612168mr9869463e0c.10.1750782178770; Tue, 24 Jun 2025
 09:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
 <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com> <0b43d8e0-7ba6-43e4-9b0a-58c45d222c4a@gmail.com>
 <66FC0F57-1654-40FD-88A9-37A960D37C1F@cloud.com>
In-Reply-To: <66FC0F57-1654-40FD-88A9-37A960D37C1F@cloud.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Tue, 24 Jun 2025 17:22:47 +0100
X-Gm-Features: AX0GCFuG4uONd59Xd30sSV640vlW-WPYisKk4TA31zGOzPLC-kJHWxpgnBGJICU
Message-ID: <CAEfZLvnv0-koEC8vfR6Zy+Tm9v6fmp_2eQiCE51iPUX2X3aqeg@mail.gmail.com>
Subject: Re: xenstore - Suggestion of batching watch events
To: Christian Lindig <christian.lindig@cloud.com>
Cc: Andriy Sultanov <sultanovandriy@gmail.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	xen-devel@lists.xenproject.org, ngoc-tu.dinh@vates.tech, 
	Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:51=E2=80=AFPM Christian Lindig
<christian.lindig@cloud.com> wrote:
>
>
>
> > On 24 Jun 2025, at 16:43, Andriy Sultanov <sultanovandriy@gmail.com> wr=
ote:
> >
> > But I think this only covers part of the problem. Looking at the concre=
te case of
> > xenopsd and Windows VMs, xenopsd cares about most of the nodes it recei=
ves
> > watch events from, the issue is that it doesn't know when these are gro=
uped
> > together in one way or another.
>
> Is the common case that a client wants to observe the changes rather than=
 just knowing that a change occurred? If so, it seems transmitting changes =
as part of a watch event (rather than forcing the client to traverse the tr=
ee) would be a better protocol. That would suggest to introduce a new kind =
of watch that reports changes at the end of a transaction. The size of the =
event would depend on the size of the change.

Most of the code in xapi_xenops.ml that deals with watch events wants
to compare the new value with the old, to know whether it needs to
send an update to XAPI.
So yes, including as much information as we can in the watch event
would avoid round-trips (and might also avoid some of the O(N^2)
issues because xenopsd would know exactly what key changed to what
value), for xenopsd's use-case.

The situation may be different for PV device backends/frontends, what
might be useful there are wildcards, e.g.
`/path/to/vif/*/state`, etc. which would also trigger when new devices
appear or old devices disappear.
The tree depth limit already proposed in xenstore.txt could also help
with this (so you can watch for a new device to appear without
constantly watching all its keys), and the driver can then setup
watches just on state (and whatever other fields it wants to watch).

Best regards,
--Edwin

>
> =E2=80=94 C
>
>

