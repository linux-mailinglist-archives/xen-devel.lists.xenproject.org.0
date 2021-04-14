Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3D35F0D9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 11:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110415.210746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbpF-00029Q-Rz; Wed, 14 Apr 2021 09:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110415.210746; Wed, 14 Apr 2021 09:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbpF-000291-Od; Wed, 14 Apr 2021 09:28:45 +0000
Received: by outflank-mailman (input) for mailman id 110415;
 Wed, 14 Apr 2021 09:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1bzM=JL=gmail.com=y.karadz@srs-us1.protection.inumbo.net>)
 id 1lWbme-00027M-LB
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 09:26:04 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e469b932-b144-412b-9f90-1f5a542d1e8c;
 Wed, 14 Apr 2021 09:26:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a4so19174467wrr.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Apr 2021 02:26:00 -0700 (PDT)
Received: from [192.168.0.109] ([95.87.199.115])
 by smtp.gmail.com with ESMTPSA id n2sm5743675wmb.32.2021.04.14.02.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 02:25:58 -0700 (PDT)
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
X-Inumbo-ID: e469b932-b144-412b-9f90-1f5a542d1e8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X8q3FgByrSYOUKQf7zOaaQGPFDPjXNgMRbp5mslJlTI=;
        b=Zf2nMU+As937UO+s2oZvogr/m8q7qVZZNdMAzRhwnLX/uNuCCLNH/uIDhU8ccpBucc
         2Z/FV4rYQlBMSe986tmKDVVE/6rnFmPGgx3MAGpyt3hoZnSVQQXHuScyK5kVEWxMhrMm
         VXQrUE+PorrIA8vnSEJ0fwzUVdGx086TPxe7/1lVBOJRtR34ERCDXVi2O7/Uud00vQfe
         N3dV+nIddzRSpDm++SZXRCnPj2jazZo+HDM34a7coKP6lcqhtCu9V7epH5rg5G4X5sBA
         Yt5uaiOwBsVG1onlZjsg4kAYyqZMfulS3CP0lMWfevJwZ7gkJ0N8VMj2865owpWhXmmU
         iJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X8q3FgByrSYOUKQf7zOaaQGPFDPjXNgMRbp5mslJlTI=;
        b=gWdA9Me2YUZlg3k4dmaxl6M9CMfJhAmNRfq0HDOCNMs09fxMd1y53I6WIQZM/jbZjs
         VYPsdh+D6eoNU7SmiRkKeqtQVVFSiemcA+OZIc+T8OyRMWUAcq68N2B+hpFflicH7GXa
         ZLzYsDHcB4XGg4MC0MgYkpe/Yqjce8OhYWBFmeMljls79s1tOiMohPlSoe6X/djYYB8R
         7LpWArbQFNIoJsz5xXsJ5YL7xMWrF6oo6W3dNKXnYXM1sTk4Bybw3opIYaw0/FlpnAcM
         vXJCF4X6P2+UBJpwdOa8bfGYlhlTIsAqnACcuxGYKiKTr95+APsyUd8YdElsR2AojB50
         amtQ==
X-Gm-Message-State: AOAM533amsfMeWMBH/8DO1ttaJowrR8NZxh+F61aewJvpNyXJEMyIijV
	6iBTDXQmIzkRNrajw+aMfTE=
X-Google-Smtp-Source: ABdhPJxtAHP+Bj4eAj+RP55I3r/5fkmKFZUWLkb1RgkSaI4Qa0KurGlBD3h/byGfoeOLOE/PwqPutA==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr5221153wrm.235.1618392359416;
        Wed, 14 Apr 2021 02:25:59 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_A_KernelShark_plugin_for_Xen_traces_analysis_?=
 =?UTF-8?B?4oCL?=
To: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>,
 linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
From: "Yordan Karadzhov (VMware)" <y.karadz@gmail.com>
Message-ID: <8b43ae47-9d7e-a95c-4573-852d09f99662@gmail.com>
Date: Wed, 14 Apr 2021 12:25:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Giuseppe,

It is great to see such progress in the development of the Xen plugin.

Can you share with us what are your plans for continuing this work. Is 
this a first prototype of the plugin, or it is an almost final version?

I was also thinking that maybe you can prepare a short tutorial on 
writing KernelShark plugins for data inputs. You have the best 
experience for this task, since you are the first to develop an external 
plugin. Ideally, this can even turn into a talk that you can give at 
some open source event.
What do you think?

Best,
Yordan


On 13.04.21 г. 17:28, Giuseppe Eletto wrote:
> Hello,
> I want to share with you a new plugin developed by me, under the
> supervision of Dario Faggioli, which allows the new version of KernelShark
> (the v2-beta) to open and view the Xen traces created using the "xentrace" tool.
> 
> In fact, KernelShark is a well known tool for graphical visualization
> Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway thanks
> to its modular architecture, it is now possible to implement plugins which
> open and display traces with arbitrary format, for example, as in in
> this case, traces of the Xen hypervisor.
> 
> For more information on how to build the plugin and/or
> to view the source code I leave the repository below:
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin
> 
> 
> In short:
> 
> $ sudo apt install git build-essential libjson-c-dev
> $ git clone --recurse-submodules
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
> $ cd kernelshark-xentrace-plugin/
> $ make
> 
> $ export XEN_CPUHZ=3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
> $ kernelshark -p out/ks-xentrace.so trace.xen
> 
> 
> You will need the development version of KernelShark, available here:
> https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> 
> A screenshot of the plugin in action is available here:
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.github/img/ks-xentrace.png
> 
> I'm happy to receive whatever feedback you may have about it,
> and to answer any question.
> 
> Kind regards,
> Giuseppe Eletto.
> 

