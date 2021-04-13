Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673235E19E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109913.209796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWK6Y-0001wQ-4J; Tue, 13 Apr 2021 14:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109913.209796; Tue, 13 Apr 2021 14:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWK6Y-0001w1-0Z; Tue, 13 Apr 2021 14:33:26 +0000
Received: by outflank-mailman (input) for mailman id 109913;
 Tue, 13 Apr 2021 14:29:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8mK=JK=edu.unito.it=giuseppe.eletto@srs-us1.protection.inumbo.net>)
 id 1lWK2W-0001BM-Ct
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:29:16 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f95248a4-3d69-458c-9ba7-e110332bf310;
 Tue, 13 Apr 2021 14:29:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b4so27663587lfi.6
 for <xen-devel@lists.xenproject.org>; Tue, 13 Apr 2021 07:29:13 -0700 (PDT)
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
X-Inumbo-ID: f95248a4-3d69-458c-9ba7-e110332bf310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edu.unito.it; s=edugoogle;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+bH+jJMHvBtlSNFwyFrwdlffGh9P8q79opdB9jmfbZI=;
        b=cnUOk6juTbg28SsNd7RWukYGTwudOJLufvh6nEbxYExbCZmWvgVXWDZB3skk6g5vAu
         xqukbH4s/evxiOI7hdxC1+7dIkK4wj80oPMM+fUQN+gottjkDtJ1mlNO7OGwcmQtLB+y
         Bw2wbP6W8Ye1zp9NPXfuZNR+LegKOsFBf8EXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+bH+jJMHvBtlSNFwyFrwdlffGh9P8q79opdB9jmfbZI=;
        b=JVHScE/fdfaFL/AGuyLNNDC2aUnE6+uhtZSXICi1OAm8BKZ+qgg6FnlL4JdVRlaHpQ
         NjLQ2EONor8ficIlhEjbgNeyUEeEp5zh3HFVDuj6z0w36tOBq//Z8SaOwnm5LGwbVICI
         CxrL0URm/Nrh8v57MltHpJ4AYmWwZHCdAQog1AsU5yVIfizrF+N4tCRvIil8UaJfLhIU
         88VQiZVHD/JGTBPkDu8PhFa6C+RBAX0/K0OnjNpDBE5BJmgD1mTySbCoQbkeYp4bV646
         43hXaMuLO6Df0CPxEfx0M4YrPg3RzOan8OFq6lEDv6sNSl3UttOUNkkYSnTCtyk6OfPC
         ozEQ==
X-Gm-Message-State: AOAM530dqJCO6PAnvZNI9jyYcZfEU7dOligoQLcWckDc+I+OIzLsSjhU
	7UHHIdjgoqF/mDnQA/UQKlVyOxOIPfMUvkCVaJ3qkhWpUaSKMF24BCgpvpkCPTN3xRiMd8z+1Ad
	0k3UEEM5BmpaDeGCncK4Ed5CVOgwQ2Qwqf2gH
X-Google-Smtp-Source: ABdhPJxF1NNfPcCtW+UbtaU9uKYYR1jdlCW68sMOR5FUQw+Z7jEjT1CkWUshPASg+njaA2sR8x81MV6WQqyiXlkXn9Q=
X-Received: by 2002:a05:6512:11e9:: with SMTP id p9mr6488422lfs.20.1618324152441;
 Tue, 13 Apr 2021 07:29:12 -0700 (PDT)
MIME-Version: 1.0
From: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>
Date: Tue, 13 Apr 2021 16:28:36 +0200
Message-ID: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
Subject: =?UTF-8?Q?A_KernelShark_plugin_for_Xen_traces_analysis_=E2=80=8B?=
To: linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I want to share with you a new plugin developed by me, under the
supervision of Dario Faggioli, which allows the new version of KernelShark
(the v2-beta) to open and view the Xen traces created using the "xentrace" =
tool.

In fact, KernelShark is a well known tool for graphical visualization
Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway thanks
to its modular architecture, it is now possible to implement plugins which
open and display traces with arbitrary format, for example, as in in
this case, traces of the Xen hypervisor.

For more information on how to build the plugin and/or
to view the source code I leave the repository below:
https://github.com/giuseppe998e/kernelshark-xentrace-plugin


In short:

$ sudo apt install git build-essential libjson-c-dev
$ git clone --recurse-submodules
https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
$ cd kernelshark-xentrace-plugin/
$ make

$ export XEN_CPUHZ=3D3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
$ kernelshark -p out/ks-xentrace.so trace.xen


You will need the development version of KernelShark, available here:
https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git

A screenshot of the plugin in action is available here:
https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.git=
hub/img/ks-xentrace.png

I'm happy to receive whatever feedback you may have about it,
and to answer any question.

Kind regards,
Giuseppe Eletto.

--=20
------------------------



Indirizzo istituzionale di posta elettronica=20
degli studenti e dei laureati dell'Universit=C3=A0 degli Studi di TorinoOff=
icial=C2=A0
University of Turin=C2=A0email address=C2=A0for students and graduates=C2=
=A0

