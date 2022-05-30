Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3B537B4C
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 15:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338566.563352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfKr-00023u-P4; Mon, 30 May 2022 13:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338566.563352; Mon, 30 May 2022 13:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfKr-000212-MJ; Mon, 30 May 2022 13:21:29 +0000
Received: by outflank-mailman (input) for mailman id 338566;
 Mon, 30 May 2022 13:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgKm=WG=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nvfKq-00020w-1Y
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 13:21:28 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67112b59-e01b-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 15:21:24 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id b135so10547583pfb.12
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 06:21:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056a001a9200b00518285976cdsm8844811pfv.9.2022.05.30.06.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:21:23 -0700 (PDT)
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
X-Inumbo-ID: 67112b59-e01b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1F0uftzI5Q6LjBGSRzse993wSF+4FV1A0f7dXUsc6dA=;
        b=ShOoUc1jH0YJ887llkMIp4r9G1OQvZuKunf0d5J3ssj2GQG/U4lf6aVa5p4ASdHMH3
         kMEIp+qfwQErdBazMQvTDqE6WRJmGdki+olpjhpeQc2uSyZ92rVFRTCxpMlWq6ZATZzo
         gHmnhJpIrW73tLyg0/dFVn4ygQpi2XN1e6ImKsSQPfDELRLvJjxEOxlZLHgUgvJSVNU4
         kvDtu9iljGmE5MIRzPo54dVtHoJpHUqZJD9BK2/9twwA/h80NQaC0i1sHDEhMLkpDbql
         odYVrnyc604PVVdJS+J1Ja1R2/xttV1060PcRUc28lFV86vH/70JJMrgMEdTr8dY3fdM
         F31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1F0uftzI5Q6LjBGSRzse993wSF+4FV1A0f7dXUsc6dA=;
        b=pjzmoX7FOrRU2cJyNvFp0N1/ZvksRUW0IrphWTA8MYSplor/5u/asUwjIhTUWdciW2
         1rKBcSmngVnhw28labwf1UG130+IOZ3wrfo8dsFcapM1ZvzAWcgw/vWLUAaftQN9ukI1
         PKYBtRNaMPt+h9N+kyDi9wqYcBlqzLvL3tqCdo5l+lrbYAF7H0pdxEI566ltmulrfITz
         wyFT8Vp7ptKonm3MWkJGw3bY5RAQV9940wfQZ3Ic5DLbW2EmAvrJ8Rx2RjaUkk7FbyhM
         xSaMcqsVXobNX/7m59OSyw/rOCRL3HQsvLehJgMIFHznqlPN8LsCOsGyO2TVcO56zw/P
         XgEA==
X-Gm-Message-State: AOAM530cxnErHYmWEGkFXHXouMaUP/Ow2ebHWdjEfksG8BzZqhdJMXfz
	pBBHPyNIiRzpzb+UydoQzLw=
X-Google-Smtp-Source: ABdhPJzD14XGB55/LWH/814vK4zGjVOozs3YEEt8P1fchX5CeSvAYxeGEaHIki53bJ0Uxse4XUBVfA==
X-Received: by 2002:a62:be14:0:b0:505:a43b:cf6e with SMTP id l20-20020a62be14000000b00505a43bcf6emr57067489pff.33.1653916884057;
        Mon, 30 May 2022 06:21:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <5220940a-8b7a-6f09-6270-a138f7281c6d@amsat.org>
Date: Mon, 30 May 2022 15:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] include/hw/ide: Unexport
 pci_piix3_xen_ide_unplug()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul@xen.org, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220513180957.90514-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/5/22 20:09, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
>   hw/ide/piix.c              | 46 ------------------------------------
>   include/hw/ide.h           |  3 ---
>   3 files changed, 47 insertions(+), 50 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

