Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FF5A8B83
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 04:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396167.636203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTa30-0003zw-Rb; Thu, 01 Sep 2022 02:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396167.636203; Thu, 01 Sep 2022 02:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTa30-0003xy-Nw; Thu, 01 Sep 2022 02:35:14 +0000
Received: by outflank-mailman (input) for mailman id 396167;
 Thu, 01 Sep 2022 02:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5LR=ZE=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1oTa2z-0003xs-0o
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 02:35:13 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1f74a81-299e-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 04:35:09 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id f14so12309764qkm.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 19:35:09 -0700 (PDT)
Received: from smtpclient.apple ([87.249.134.31])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05620a143100b006bb83e2e65fsm10502390qkj.42.2022.08.31.19.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 19:35:07 -0700 (PDT)
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
X-Inumbo-ID: b1f74a81-299e-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc;
        bh=HvAnqh6oLQZyoeHCbOzg6Bi01dtZi6A0ssMqdIvSvXw=;
        b=MNEBo+Zsxwbetrquwiayil07AvrTnYMSCBrvmU38nzsham4ud4J34GIxLB4AjenhSC
         Ma2cGOmU6aWBguXvPY+e12cpy/e87kfuTb16KBtDJ+Yd1HxdDfObYhSKYmrB3dp7f1O4
         DrGn5t9GIykC+JrHFu9bYJj5LtY0VW3LFe2G8c4gI3joQnR/PRft8687VHVSNyA0sTU7
         RzEzuhuolx2LnhbHDg7QfJ8faMDn1x0erS3MSWTHHt85y8VAGTFbAg/5W9fBFGGuygbZ
         n+udgfyQjwInwZhukqZn52WGg042RJqwZ+cjh1YQfyv/MolyeY37Ns/z/adUB4lKtseD
         YoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc;
        bh=HvAnqh6oLQZyoeHCbOzg6Bi01dtZi6A0ssMqdIvSvXw=;
        b=OoWcpDMeSwW95WZoMl8AHxD+hiNFJWvMrsWhBBV2fYxy8Q7/GDxl8g7ZZT0TnGmGde
         9KFRandjXjT2n5usc1bXAmLEHleko9uZCSDA96F7Lbt0quDv3gOflLSoek1An7W1xoqM
         JXM99Gug7Y73ErT7Lywz6WLcCuNxHAzAEenaGhmn8HOkB7fgjQTknV0Emp8hyDY0DdbG
         MQULqX4SsAf/YCYHVa6Z+zTuhzBqEMhH60Hqj49FMvWCU4wg2zWU4JNjE1s6ALeL0AsX
         xu1Yi3xVXFhRYYXMWw32ftvT/D5wifvsK81zDgnmKrFO0kiuw6wfv6ckXEv2YrI+IeyE
         Cpjg==
X-Gm-Message-State: ACgBeo1hF0hSvzbc8h/3TSpb1PE2RJ8/Xr+juQSKQD7uc0+XYqj1Hjfl
	1CvFH50wn4ZYFj60bCsCbMQ=
X-Google-Smtp-Source: AA6agR6KXYuUK62Dl1PGX+4IdTEpnv41poGFatJelFOad0HJkABM+PVXqMsd/jk/2Udq60jOOoRkNQ==
X-Received: by 2002:a37:a84e:0:b0:6bb:bf0a:5be7 with SMTP id r75-20020a37a84e000000b006bbbf0a5be7mr17080767qke.213.1661999708126;
        Wed, 31 Aug 2022 19:35:08 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] xen-pcifront: Handle missed Connected state
Date: Wed, 31 Aug 2022 22:35:06 -0400
Message-Id: <31F127F6-A096-4991-9D4C-1B2E032689A1@gmail.com>
References: <20220829151536.8578-1-jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220829151536.8578-1-jandryuk@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>
X-Mailer: iPad Mail (19G82)

On Aug 29, 2022, at 11:16 AM, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> =EF=BB=BFAn HVM guest with linux stubdom and 2 PCI devices failed to start=
 as
> libxl timed out waiting for the PCI devices to be added.  It happens
> intermittently but with some regularity.  libxl wrote the two xenstore
> entries for the devices, but then timed out waiting for backend state 4
> (Connected) - the state stayed at 7 (Reconfiguring).  (PCI passthrough
> to an HVM with stubdomain is PV passthrough to the stubdomain and then
> HVM passthrough with the QEMU inside the stubdomain.)
>=20
> The stubdom kernel never printed "pcifront pci-0: Installing PCI
> frontend", so it seems to have missed state 4 which would have
> called pcifront_try_connect -> pcifront_connect_and_init_dma

Is there a state machine doc/flowchart for LibXL and Xen PCI device passthro=
ugh to Linux? This would be a valuable addition to Xen's developer docs, eve=
n as a whiteboard photo in this thread.

Rich=

