Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD415F6BC2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 18:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417170.661799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogTiW-0001Bu-Vz; Thu, 06 Oct 2022 16:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417170.661799; Thu, 06 Oct 2022 16:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogTiW-0001A0-TC; Thu, 06 Oct 2022 16:27:24 +0000
Received: by outflank-mailman (input) for mailman id 417170;
 Thu, 06 Oct 2022 16:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1sz=2H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ogTiW-00019u-3t
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 16:27:24 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1917dbd-4593-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 18:27:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id z23so5678575ejw.12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 09:27:22 -0700 (PDT)
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
X-Inumbo-ID: c1917dbd-4593-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1kXYRJVvVuB6/yCg+mLXa+n2OpJV2ALpI5+bxh3cOos=;
        b=CyGVdpIRf0cbkRRlaQmlIM4GbYrItWETO4moUB0zABjHGn+1Bb5HHwCCrwYBQSdG1z
         YC0Mo0XlKB75VeUZ/tJLkKEazynqHAdt2RXqbZQ7RFv78GUf5L3UQVLsOU6zdZEwiZac
         SBrkH5q2D8PZcWVlYrSSPu5iu5DNoO+XHQPihtd1TbNlapY8sRyKQqe9zKr/w/PEqZHR
         x0rPhaaRYuIGeVx/OGinB2GIMhzjl+TxEqwMsa/r4HYIyXFoF3EMA4Tvj4SsNs8OmWK5
         eD4wxZUqXbkkCQdkaKwPpGze4+jRMB4c54N9Tg/zx6n75XD1KXS/NRKR8cw9YpZv9dVv
         sDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1kXYRJVvVuB6/yCg+mLXa+n2OpJV2ALpI5+bxh3cOos=;
        b=O7CHlJlBFbQGlFa7XEu/KQNE+FiQRc1qXgAfhCKb9E13zYs6rwf0yehNBE/zAfcmsr
         KSK+NehqiyiJbrwTlVd9Fw2UOEuvJS/G6KPHw9KC7eoCtZPCuonGIPGucxnBPjg9B865
         iolPu832L8t6uk7XAzL+SV0EIOTP1DwAmg6f7e0EbgfgcOTWN9HCwfQhVFM00R8b84Gm
         1i1+pjBgkuhZvtUrl9EsF6Yv7fDbJp9Drof++PcNnPjTdBtSuMqElEV5hHy3tj/gO1bk
         0Can9wOny3stvL9Jw7ew9pQ3C9bfYnxx4j2kTvLNC42Yx372ZDfymEkPrGIWHZ8QfGyf
         sKHQ==
X-Gm-Message-State: ACrzQf0g95tWp48PwBavLA57K9oEogUhlCdJnuOxC3vWPCDdxwKONwRH
	y887XIpw5wn9hQucR25K+eXhhrRDBLvZLWpIBoo=
X-Google-Smtp-Source: AMsMyM6gC7LkWalsDjJCsF+lKGjCe9nrQw7x15pqRpmn46ydjr2W6YgI0uNqMQX0BN+RkIlpHUqujS6nxpuUk5qDvvg=
X-Received: by 2002:a17:907:6087:b0:78d:2d1c:c050 with SMTP id
 ht7-20020a170907608700b0078d2d1cc050mr538377ejc.481.1665073642415; Thu, 06
 Oct 2022 09:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221006153440.18049-1-jgross@suse.com>
In-Reply-To: <20221006153440.18049-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 6 Oct 2022 12:27:09 -0400
Message-ID: <CAKf6xpvUat2HP_WO=LSxLC46=KN2exSmqn+DWHTN74HK6H2HLQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/pcifront: move xenstore config scanning into sub-function
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 11:35 AM Juergen Gross <jgross@suse.com> wrote:
>
> pcifront_try_connect() and pcifront_attach_devices() share a large
> chunk of duplicated code for reading the config information from
> Xenstore, which only differs regarding calling pcifront_rescan_root()
> or pcifront_scan_root().
>
> Put that code into a new sub-function. It is fine to always call
> pcifront_rescan_root() from that common function, as it will fallback
> to pcifront_scan_root() if the domain/bus combination isn't known
> yet (and pcifront_scan_root() should never be called for an already
> kneon domain/bus combination anyway). In order to avoid duplicate

known

> messages for the fallback case move the check for domain/bus not knwon

known

> to the beginning of pcifront_rescan_root().
>
> While at it fix the error reporting in case the root-xx node had the
> wrong format.
>
> As the return value of pcifront_try_connect() and
> pcifront_attach_devices() are not used anywhere make those functions
> return void. As an additional bonus this removes the dubious return
> of -EFAULT in case of an unexpected driver state.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

