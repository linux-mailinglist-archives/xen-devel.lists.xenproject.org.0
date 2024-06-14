Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAAE909018
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 18:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740822.1147923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9iM-00007u-Ps; Fri, 14 Jun 2024 16:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740822.1147923; Fri, 14 Jun 2024 16:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9iM-00005u-Mj; Fri, 14 Jun 2024 16:23:46 +0000
Received: by outflank-mailman (input) for mailman id 740822;
 Fri, 14 Jun 2024 16:23:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tF+V=NQ=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1sI9iL-00005o-6b
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 16:23:45 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 778ff5f8-2a6a-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 18:23:44 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2c4b8d8b8e0so399739a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 09:23:44 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4c46701absm4112038a91.40.2024.06.14.09.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:23:42 -0700 (PDT)
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
X-Inumbo-ID: 778ff5f8-2a6a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718382222; x=1718987022; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOsdq+Rd2jD/oYTlQL4Vcr47c5ELyE1/1jwJx8ny+zc=;
        b=QRHyidpvoYHPYzOT5jaop4RQQPIbozT0KvgMXZXJ+C557BnVBX0uSfbNhp5FI+J7C1
         bI7/8umNBaqDdK7VhY/gyyKdCgn5jHIevphVR+CpF0TvL+VjTGAYNiPWEipiD9nFu4ql
         WHFIuYj+xg4wJKdzbQjJdGresTFoWva/TApleyhTBhZlSt1PAVgTx5B7DaTu/SkrBpUh
         f96ZKbmUuS/egB/oGCoSfu0koF2F2N4XwlO1fngmxM5a3bCr4WTP6kCT1UwxxeGTUyJ5
         7QpNOkseoABV+asQNSqmLOi6WWwzrHwdigrKYPteQKLUV1C3zp7fkXQ9lcQ1ym489ApZ
         oLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382222; x=1718987022;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOsdq+Rd2jD/oYTlQL4Vcr47c5ELyE1/1jwJx8ny+zc=;
        b=wUS+RtlTZ2OPQZia/ih2wbSpXKrgqq53xnoXhHmZd/W8MapG9ijwNbfjEsAJXHcdZv
         cyhM9T5iwIiiovVl2V1KvdNX/qi49iztFyZfZvXquUxHO4sBnSmRIfvtsK09NNwTN3og
         CzOqCKMLFK+wtahke39yn+JSf/sXcuruQc72XTEKz88tj7aAPVbcVcWtBFtausaKn5PZ
         4X26+g0nDxrO4g37WsTW2MeU/EN/nvN0t81IkQk6ecWxoAaB5BAF59bOjK3hoY1gnjGv
         njN2cqvLzWo7fdyS9ap3oGFMcFLFZejL7gqI8nznSBD+fnSqUHVfnbC0rbYXXu4KcwzH
         tatw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEYPS58DAab3ZQafE8yHhEtE7k33Et/bnPTnUUd11SXpIK0N/vuh/Z6F+Wlj+ZtWswQ4CQKD25FXvKrGExOI4WeXauZcvahIOhGmQrtw=
X-Gm-Message-State: AOJu0YxwdSf5kpyftrtoHdQR2KXPS5s4lc78mly3ZmFAiTqdtDmLf5HZ
	qCyBAMI7/Xmh8XVciN/N2BPqpD2gyVQmIp82nF45NniFbncu9jqQno88TMUrvg8=
X-Google-Smtp-Source: AGHT+IFzZlkOeh7ub8gHV6v3rJ7EdBnks7HtbNFvAppAM0NMs6uCGvh3Ey3eFD0Th7n1FGRILE+Uqw==
X-Received: by 2002:a17:90a:d313:b0:2c4:da09:e29 with SMTP id 98e67ed59e1d1-2c4dbd431cbmr3209949a91.3.1718382222558;
        Fri, 14 Jun 2024 09:23:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
Subject: Re: convert the SCSI ULDs to the atomic queue limits API v2
Message-Id: <171838222101.240089.17677804682941719694.b4-ty@kernel.dk>
Date: Fri, 14 Jun 2024 10:23:41 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0-rc0


On Fri, 31 May 2024 09:47:55 +0200, Christoph Hellwig wrote:
> this series converts the SCSI upper level drivers to the atomic queue
> limits API.
> 
> The first patch is a bug fix for ubd that later patches depend on and
> might be worth picking up for 6.10.
> 
> The second patch changes the max_sectors calculation to take the optimal
> I/O size into account so that sd, nbd and rbd don't have to mess with
> the user max_sector value.  I'd love to see a careful review from the
> nbd and rbd maintainers for this one!
> 
> [...]

Applied, thanks!

[01/14] ubd: refactor the interrupt handler
        commit: 5db755fbb1a0de4a4cfd5d5edfaa19853b9c56e6
[02/14] ubd: untagle discard vs write zeroes not support handling
        commit: 31ade7d4fdcf382beb8cb229a1f5d77e0f239672
[03/14] rbd: increase io_opt again
        commit: a00d4bfce7c6d7fa4712b8133ec195c9bd142ae6
[04/14] block: take io_opt and io_min into account for max_sectors
        commit: a23634644afc2f7c1bac98776440a1f3b161819e
[05/14] sd: simplify the ZBC case in provisioning_mode_store
        commit: b3491b0db165c0cbe25874da66d97652c03db654
[06/14] sd: add a sd_disable_discard helper
        commit: b0dadb86a90bd5a7b723f9d3a6cf69da9b596496
[07/14] sd: add a sd_disable_write_same helper
        commit: 9972b8ce0d4ba373901bdd1e15e4de58fcd7f662
[08/14] sd: simplify the disable case in sd_config_discard
        commit: d15b9bd42cd3b2077812d4bf32f532a9bd5c4914
[09/14] sd: factor out a sd_discard_mode helper
        commit: f1e8185fc12c699c3abf4f39b1ff5d7793da3a95
[10/14] sd: cleanup zoned queue limits initialization
        commit: 9c1d339a1bf45f4d3a2e77bbf24b0ec51f02551c
[11/14] sd: convert to the atomic queue limits API
        commit: 804e498e0496d889090f32f812b5ce1a4f2aa63e
[12/14] sr: convert to the atomic queue limits API
        commit: 969f17e10f5b732c05186ee0126c8a08166d0cda
[13/14] block: remove unused queue limits API
        commit: 1652b0bafeaa8281ca9a805d81e13d7647bd2f44
[14/14] block: add special APIs for run-time disabling of discard and friends
        commit: 73e3715ed14844067c5c598e72777641004a7f60

Best regards,
-- 
Jens Axboe




