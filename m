Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1257B1EC1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609809.949002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrHo-0005sn-UC; Thu, 28 Sep 2023 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609809.949002; Thu, 28 Sep 2023 13:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrHo-0005r6-Qr; Thu, 28 Sep 2023 13:42:36 +0000
Received: by outflank-mailman (input) for mailman id 609809;
 Thu, 28 Sep 2023 13:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iMsa=FM=gmail.com=icegambit91@srs-se1.protection.inumbo.net>)
 id 1qlrCN-0003Yn-TI
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:36:59 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17bb6941-5e04-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 15:36:57 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-274b3d48e15so9083693a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 06:36:57 -0700 (PDT)
Received: from valdaarhun.localnet ([2401:4900:1c42:8fff::2e:ebb7])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a637243000000b005742092c211sm12673566pgn.64.2023.09.28.06.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 06:36:55 -0700 (PDT)
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
X-Inumbo-ID: 17bb6941-5e04-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695908216; x=1696513016; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUdU7BGqF/nk4/vKNdMRuoOiP4xEs6VLIiAHMkfMm4Y=;
        b=gRGAB9g+y7gtYzBfId5ls6oOYBaBXo/ZJZIR9fvIsR9hrvV9Cfchmkd/Q/9uKlWEa0
         Vad6MAkayAnlAFR6/p6Ylfj7it7dBYmKkbZrobz/g8dNimhi6h5jF3TIBZCtySgOrOZt
         z421IJqcMV7ctlptKbr9Dzh4fST0ZOhobaSUpX0VlVfOZJU2RzcvA76Jyl+kvsfkIpNr
         1VIdbQV5r2L2W64Wzxqr61K9yI8q8cSmQlM+nwhQr46apeEGhUL3zH+CnUCRyhy4Sb9L
         h9x/okWt9h3EC61uDNSzc//kmtcz8FeSaHgsb3lT4Ax2lGq2Sd03TWzTx82wwINgaRkg
         FVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695908216; x=1696513016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUdU7BGqF/nk4/vKNdMRuoOiP4xEs6VLIiAHMkfMm4Y=;
        b=E66vP5I6Y+D5X5q8c4JtX86/M44roaG9EzqXvY4vTYqOifZdDC+UYlht1/JiRBXIEx
         8/3XPq3zu+uNxUSrkq8AcJuCQc6W50hTw6CH+PrrgeEG/JFxiMDnn5Un+BSbwineZDIx
         d6+unTbTZ8eGAjcSOOpJkEbz4Bct43pUsiYg7tgXbRLORw1RBdco0H5FyTfeZaqU+Iq7
         +udxSFw+BSlpzMiHtG+vEi0CpfOmny8hb09aJw3M7rzyy73BQke/0vTaXtI+nDFlkIOj
         HZKxcWSWhGYrHPMj0seM2biYz1kWknqNj2DahwEQT0xHx3m/KPyjLpXyzKymLM477wrB
         gUtQ==
X-Gm-Message-State: AOJu0YxId+nSRLAa63jmHwRloxHq+LHFwEhx8Gy4EiFbkSwQk9JhDDLA
	6zYwVDwPvn9bhTnesCFpwQPumyl+7FU=
X-Google-Smtp-Source: AGHT+IEnWREIIqcQsh4vg/PAgL20KUG4vk3pWeKRbf4AqDNv+wSYxJ6eTWZvV1ZHz8ZWzfw8x2QxuQ==
X-Received: by 2002:a17:90a:ce92:b0:26d:4ab3:fe11 with SMTP id g18-20020a17090ace9200b0026d4ab3fe11mr1002946pju.24.1695908216137;
        Thu, 28 Sep 2023 06:36:56 -0700 (PDT)
From: Sahil <icegambit91@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com
Subject: Beginner looking to contribute to project in archived list
Date: Thu, 28 Sep 2023 19:06:52 +0530
Message-ID: <3269277.aeNJFYEL58@valdaarhun>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I have never contributed to the Xen Project before. I am interested in virtualization,
firmware and low-level systems programming. I would like to start contributing to
Xen and learn more about these fields while working on the job.

I was going through the archived project listings [1] in the wiki and I came across the
project - "CPU/RAM/PCI diagram tool" [2]. The project was suggested in 2014 but I could
not find any updates on the status of the project.

Is this project still open for development? If so, I would like to work on it. If not, is there
an open project/task that I could work on or contribute to? I am comfortable with C and
Python. I am also currently working on my Rust skills.

I look forward to hearing from you.

[1] https://wiki.xenproject.org/wiki/Archived/GSoC_2015
[2] https://wiki.xenproject.org/wiki/Archived/GSoC_2015#CPU.2FRAM.2FPCI_diagram_tool

Thanks,
Sahil



