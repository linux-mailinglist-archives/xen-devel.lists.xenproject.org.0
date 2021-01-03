Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B62E8C3B
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jan 2021 14:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60940.106895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw347-0000we-Di; Sun, 03 Jan 2021 13:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60940.106895; Sun, 03 Jan 2021 13:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw347-0000wH-AH; Sun, 03 Jan 2021 13:04:59 +0000
Received: by outflank-mailman (input) for mailman id 60940;
 Sun, 03 Jan 2021 13:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=McAd=GG=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kw346-0000wC-BW
 for xen-devel@lists.xenproject.org; Sun, 03 Jan 2021 13:04:58 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8daa8b9-c1c6-49a3-bc6e-528a65e89c7c;
 Sun, 03 Jan 2021 13:04:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w5so28169853wrm.11
 for <xen-devel@lists.xenproject.org>; Sun, 03 Jan 2021 05:04:56 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id x25sm27360980wmc.3.2021.01.03.05.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:04:55 -0800 (PST)
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
X-Inumbo-ID: a8daa8b9-c1c6-49a3-bc6e-528a65e89c7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YU1+4NwadEE3N+OESJxPKN86R8fGB0+GBAw3oHs9kEI=;
        b=nWcr//BQWeoemUa4ecrXAtoyxBmKMNh0s3zHxxDkurcPdR7fvmZiql0va6e471Igx1
         vJJaTssz/FA+KlD5CWYMW38RHAZrkVkPGJmaLC/7ezzlJKLtr+DCBqqFHTZcZmUwCFGr
         F66L1f0dKLabVLHGQw0fWDGdHaV+tuzgR2gTodoaak9s2UQmss1IebBRdlWmJvHg7AjX
         tiSZqnYvJHf1WUH/nRLqsxCF6i7SxZNFSc6MmCg6BoW8+O1s5mEtJ/NtF+EX98A5oWSq
         y1yI9bSmgeVfvbC9jBT2KucHRuW83I+WQ4SpP94Yq7NqdPZujeTvb+dYvXMFEEJkYsNZ
         4seA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YU1+4NwadEE3N+OESJxPKN86R8fGB0+GBAw3oHs9kEI=;
        b=qrubaePoayULQWEcxBK3anPpSmXdNwetHpChX2BTmoepZczlE+SkbBd4jtwLk/QiGk
         R7eQ2cS2ffNfabpyPLd5yQE7nlQp1KeC/o0ZCxeuorKr7WkznEjo8tDXHRR7TcRxMeip
         +4N/UotsgYta/rWkWmdzsfXMfYXaWF6fpeyDS9thcgx6uCP7CQrZ2s/UzhRJ0ScsdfQ6
         En3Gi6B5z0YEJA2zBJ8iPxNo6FY+/cTkTszt07QTTZODRF5zFbbuSTj4a5m3YWvNLjUu
         1HyyF93Od8AednhJpFdCFYe1s4qYTiOUpkpKGPB8mxolfkAcMyjXCUQZKzHNBIt9yNN0
         gF4Q==
X-Gm-Message-State: AOAM533LRDHmkBVj2ekzG60kE2RRiRsqwDJJjrN2d96adGvmIUGqy/PP
	IU7+dd5BQvjSMmBdvJ+Xs5g=
X-Google-Smtp-Source: ABdhPJynJccwG9STFPGTdIrwHAvK7bKQV0SRmf36YPSMtmYFUisMuWulGJ0B9N5hF7jqbfMQTHD1BA==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr76076750wrq.309.1609679096144;
        Sun, 03 Jan 2021 05:04:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
Date: Sun, 3 Jan 2021 14:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/12/20 2:45 PM, Philippe Mathieu-Daudé wrote:
> Trivial patches using the generic PCI macros from "hw/pci/pci.h".
> 
> Philippe Mathieu-Daudé (5):
>   hw/pci-host/bonito: Make PCI_ADDR() macro more readable
>   hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
>   hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
>   hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
>   hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'

As this series are trivial and Acked, I'm going to queue
it via the mips-tree, as other reviewed patches depend
on it.

Thanks,

Phil.

