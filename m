Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90E98FDF7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 09:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810062.1222670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcw6-0006Ta-Kf; Fri, 04 Oct 2024 07:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810062.1222670; Fri, 04 Oct 2024 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcw6-0006Rg-Gs; Fri, 04 Oct 2024 07:41:14 +0000
Received: by outflank-mailman (input) for mailman id 810062;
 Fri, 04 Oct 2024 07:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiC3=RA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swcw4-0006RS-Pk
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 07:41:12 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 065fa528-8224-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 09:41:11 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2facf40737eso22082261fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 00:41:11 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ca4f7075sm1540025a12.95.2024.10.04.00.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 00:41:09 -0700 (PDT)
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
X-Inumbo-ID: 065fa528-8224-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728027670; x=1728632470; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVGAfiZgU91loboQtd9S1U3HFMtRge+DORdObXPlNOc=;
        b=AU29ulrP3wrfBaKl40YvgA4yQXZzf3c+cJVDqm1Ic2KTZq1v9sUWO6e3UbzAMws67Z
         WH19u4LuUGCPJDVAWRQF+6eXrSTezLIEf48f3dj+SNMuv8CHj5Biu4C0wML8Bt2CW/l6
         h6aglUClvD+vFthg5RITEzcJJv9/Zec2dL+oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728027670; x=1728632470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVGAfiZgU91loboQtd9S1U3HFMtRge+DORdObXPlNOc=;
        b=UugChz6cjihDF/vC/mKy1mNr0lL0THKVbtLvKZ9AanqJO+eQYerJbg203fr8OPsli5
         MvBeqj01iDZKZE723Y1RKujaueHYybDsiASBccEnV9BU/Iuj8PP0RnmSY9oh5FNnuLUo
         kppfj8vFyq/347t0ErCCO9gdUV20jsfccDFOJQzcjjmBm137p0G0ZHLZHdbjk/bAlpAR
         9dbeX4whozY3+iRxbYfUVLio50SyGnBuk264qdjXWqxdVqhsb+Tx+9ObVetQ0zj0Z5A+
         I8yeOx3pBVJbDkLP89nDSc6q7Ln2bRy9LbDDojtY2KPoJeHAv4vxG6P0okpmIPBGGqVM
         8/hg==
X-Forwarded-Encrypted: i=1; AJvYcCX+QR5ab7Hk00F+zUYwqzSTnpnzJzTJ+ghxHIAv5SBXnOvVOg4QZQKIY4W16MXir+PxfO8PQ7o2SIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykBO/sKilVKFpWs4jbarlIaF6anzeviINZO/9dALmSXFTpLlqx
	OEL7zksufT1kq2HF8iTfP3GuI3Wg4I/QxsJaWiYWO5I85JBvw1lF2VZwgaOv7Jk=
X-Google-Smtp-Source: AGHT+IHdTKwCIO4TcVgNi4XApYWyZ3X3GcrNEkWRGoam3VUbwt/eL/n/rzc1YBh/sxA2b5npZgjRHA==
X-Received: by 2002:a2e:b88e:0:b0:2ef:243b:6dce with SMTP id 38308e7fff4ca-2faf3c505d2mr7539531fa.10.1728027670241;
        Fri, 04 Oct 2024 00:41:10 -0700 (PDT)
Date: Fri, 4 Oct 2024 09:41:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/APIC: Switch flat driver to use phys dst for ext
 ints
Message-ID: <Zv-cFMCfSh6bht0Z@macbook.local>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <8c6d1fee5261169a9bbc62ed1bafd2c32406fb4c.1727880621.git.matthew.barnes@cloud.com>
 <Zv53FGD0ju5XsVjz@macbook.local>
 <ef73f945-1fc0-4f91-a185-0b74e393e89c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef73f945-1fc0-4f91-a185-0b74e393e89c@suse.com>

On Fri, Oct 04, 2024 at 08:48:05AM +0200, Jan Beulich wrote:
> On 03.10.2024 12:51, Roger Pau Monné wrote:
> > On Wed, Oct 02, 2024 at 04:17:24PM +0100, Matthew Barnes wrote:
> > 
> > The commit needs a log, doesn't need to be extremely long, but it's
> > important to note the reasoning behind using physical delivery for
> > external interrupts vs logial mode.
> 
> Furthermore I question that the naming can remain as is - the driver
> is no longer uniformly "flat" then.

Yeah, that's done in a later patch.  I wouldn't mind if it was all
folded into the same patch TBH.

Thanks, Roger.

