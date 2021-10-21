Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E074364F2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 17:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214500.373062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZZB-0000JH-HK; Thu, 21 Oct 2021 15:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214500.373062; Thu, 21 Oct 2021 15:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZZB-0000GR-Dj; Thu, 21 Oct 2021 15:01:13 +0000
Received: by outflank-mailman (input) for mailman id 214500;
 Thu, 21 Oct 2021 15:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cxSi=PJ=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1mdZZ9-0000GG-7H
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 15:01:11 +0000
Received: from mail-oi1-x236.google.com (unknown [2607:f8b0:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dbb49ae-4826-4ba6-89e4-527b0ed5c747;
 Thu, 21 Oct 2021 15:01:09 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q129so1252250oib.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Oct 2021 08:01:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:380:783a:c43c:af64:c142:4db7:63ac])
 by smtp.gmail.com with ESMTPSA id w18sm1173833ott.29.2021.10.21.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:01:08 -0700 (PDT)
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
X-Inumbo-ID: 4dbb49ae-4826-4ba6-89e4-527b0ed5c747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=6jnVZbBkLbnw6pFZpxUldRg4FuFfEZElhVVQao3Uy20=;
        b=ZGFMo833ta2HUfgqVLXUNHJV5pTUNb23BosrQDRrArzz1VYW1rZvujqd1q9AvwL/2L
         I3qasTS/LaOX+rTG38fA1WkYeozE1AIG6Y1LWW3KJy++pLKzaue+ysn5BR5qqBazSL3X
         IVR4Fjt0Mg/h6j4Zo8LPwJHvk9rRXi+EODiN4CZjW0a3nWKAwsxdaWUyN0Iinpv2NO0m
         dB+Q+OGRW5ZAtyv3ynB4fi22vLxF+kmJ+bRRxyM9NM8BrnQaDlNccb6EwaqBPSB/5dXE
         w0UzuwJbGrVM1iqd9niPDqAPfBdtIGPYSTrtcyZITTG5mzlvKTmg+/w7FrEp4Vj/y3G+
         Cdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=6jnVZbBkLbnw6pFZpxUldRg4FuFfEZElhVVQao3Uy20=;
        b=ziWhwHY6RFI3mREjYJlD/yHMyArCbVWSihnrfDrlu4OwTN4wkXOXTHFr6r4cZFGm2g
         FMIl3zsNqGowJW3WNIXq3dJZf5RrbipZOlVWSAeY1ijMFRv7/i5CtcSPZ9h/xvCe9VrZ
         78kYTRFAf+BDAdCIU+5TMpOH0QgNTQ7glcUcj1hWJpGVpVTdKUisxAd9tg85BASgD+Kq
         2tGtEyFIHWYeLaO8BaFQ/OTeQVdpGIR1BvgRscr4n/rRA5dDt7NK847TXbrlhtfHKTh7
         TZjPOFNbSEIB9fZ4e8jVTk83JsEqW1slBnQ8+goH2yRBoY1pOo4XjwRFO1mzO1RBsWYz
         1o9w==
X-Gm-Message-State: AOAM533G1pWQm582Ab4umB5a0ok+f8LQ5xIkGBQT/v7Fyh1dKBJvhTsL
	wHiKe6i51dl92HfitvFg9FsGKw==
X-Google-Smtp-Source: ABdhPJxcqYzZpw8hjWvx8wtyMAFaG+Ip962yojdp/B4kEz2Pn9lx52Qn4eX8lgw7zW26Sgpyf8s+nQ==
X-Received: by 2002:a05:6808:3c9:: with SMTP id o9mr4905862oie.20.1634828468846;
        Thu, 21 Oct 2021 08:01:08 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: thehajime@gmail.com, zhuyifei1999@gmail.com, haris.iqbal@ionos.com, johannes.berg@intel.com, roger.pau@citrix.com, miquel.raynal@bootlin.com, jdike@addtoit.com, anton.ivanov@cambridgegreys.com, geert@linux-m68k.org, krisman@collabora.com, vigneshr@ti.com, richard@nod.at, hare@suse.de, jinpu.wang@ionos.com, jgross@suse.com, sstabellini@kernel.org, ulf.hansson@linaro.org, agk@redhat.com, linux-mtd@lists.infradead.org, Luis Chamberlain <mcgrof@kernel.org>, tj@kernel.org, colyli@suse.de, jejb@linux.ibm.com, chris.obbard@collabora.com, snitzer@redhat.com, boris.ostrovsky@oracle.com, kent.overstreet@gmail.com, martin.petersen@oracle.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-scsi@vger.kernel.org
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 0/9] block: reviewed add_disk() error handling set
Message-Id: <163482846658.50565.12530170761457767964.b4-ty@kernel.dk>
Date: Thu, 21 Oct 2021 09:01:06 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Oct 2021 16:30:19 -0700, Luis Chamberlain wrote:
> Jens,
> 
> I had last split up patches into 7 groups, but at this point now
> most changes are merged except a few more drivers. Instead of creating
> a new patch set for each of the 7 groups I'm creating 3 new groups of
> patches now:
> 
> [...]

Applied, thanks!

[3/9] dm: add add_disk() error handling
      commit: e7089f65dd51afeda5eb760506b5950d95f9ec29
[4/9] bcache: add error handling support for add_disk()
      commit: 2961c3bbcaec0ed7fb7b9a465b3796f37f2294e5
[5/9] xen-blkfront: add error handling support for add_disk()
      commit: 293a7c528803321479593d42d0898bb5a9769db1
[6/9] m68k/emu/nfblock: add error handling support for add_disk()
      commit: 21fd880d3da7564bab68979417cab7408e4f9642
[7/9] um/drivers/ubd_kern: add error handling support for add_disk()
      commit: 66638f163a2b5c5b462ca38525129b14a20117eb
[8/9] rnbd: add error handling support for add_disk()
      commit: 2e9e31bea01997450397d64da43b6675e0adb9e3
[9/9] mtd: add add_disk() error handling
      commit: 83b863f4a3f0de4ece7802d9121fed0c3e64145f

Best regards,
-- 
Jens Axboe



