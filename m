Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4653E4C5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342546.567587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCrJ-0000Vc-TS; Mon, 06 Jun 2022 13:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342546.567587; Mon, 06 Jun 2022 13:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCrJ-0000SD-QU; Mon, 06 Jun 2022 13:33:29 +0000
Received: by outflank-mailman (input) for mailman id 342546;
 Mon, 06 Jun 2022 13:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BfO3=WN=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nyCrI-0000S7-4I
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:33:28 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e85017d-e59d-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:33:27 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id q11so4354155oih.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jun 2022 06:33:27 -0700 (PDT)
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
X-Inumbo-ID: 3e85017d-e59d-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIcUftR+4nv81E/2CqeXj/bd28eck61W6b3k9iCB2bE=;
        b=BBHpY2AjnLz6HdZWei/zL3xZAXI8vOwEey2CpW9uG6+994RZPcQI2fJ5qDsPMTnSjs
         gFgdup5OcVsFTAjRBgmtfMVcpFauLZOlJosLs6A8RqCzvGawWpmRJ7pLawASh9PzE4pm
         XzScHdRLWuVtzaMLE4WzZMBh9nwb8quzQ43zzuhd35+P/3WtFKDMCK8OtXo4hYX7fkpw
         2khlTDOOG2dvQH2HteIUvATcL7CsmMywIJ+QuE8Jhj9KR5YrEwTpYwcjCunVvlObIQSR
         R/8aK8hqdUrvbYY2mzCMTAVQlpP3dVzKAlJ97588QVDy+bKMZVEWe5WoCQRDjCCjZk/Z
         0vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIcUftR+4nv81E/2CqeXj/bd28eck61W6b3k9iCB2bE=;
        b=Bu7dkSQze/+CqlTNdagERDVrL1LqB6wNvnEkqVo6mUTurrdubbJSwieoiySIBL62dK
         axep1md+RjkWRmz5XSmpg+F85lTHK6MEy6p0oiq8QaDcvaycTreiDcEqZFEgYMS9zfdH
         aPkQupR8zxQVyZPhabH7fvJKVDKNjUp9kc7CNcTaWjxIdFO2exxNjc48Nd9uNdyzY8t+
         YAPWZcZkzLAISS3C9p+YQEZGLs+J3hRB7/ssw7eXIYFkQ+Uf0BT4LViu38+uB4hot7bW
         16sHOm5mgkw7RD50MmNYkJG5tCVuQQ9P5du4Bf9yryUjwkqB8p56E8v81nc0wMQ/cTZ6
         4keQ==
X-Gm-Message-State: AOAM533tYqlN0yU+wOwoAu6OQ549zalAzT6qoL+R/CO15tVJHujint/H
	qi3gCf4vuh5Gvn5LvY7b1wtwXdhcNxeqIRYJlL8=
X-Google-Smtp-Source: ABdhPJz4/TxLIUR6urV41GuW3LPuzBHBcBkJZ3rL+s55taAfZaj3UpH8FcPsV6rgyKDn4eWxtKvXQWRII4i93+REU8A=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr30387637oib.128.1654522405852; Mon, 06
 Jun 2022 06:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 6 Jun 2022 09:32:52 -0400
Message-ID: <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> +/* Supported xHC PCI configurations */
> +#define XUE_XHC_CLASSC 0xC0330ULL
> +#define XUE_XHC_VEN_INTEL 0x8086ULL
> +#define XUE_XHC_DEV_Z370 0xA2AFULL
> +#define XUE_XHC_DEV_Z390 0xA36DULL
> +#define XUE_XHC_DEV_WILDCAT_POINT 0x9CB1ULL
> +#define XUE_XHC_DEV_SUNRISE_POINT 0x9D2FULL
> +#define XUE_XHC_DEV_CANNON_POINT 0x9DEDULL

I had to add an extra device ID here to get it working on my NUC,
would be nice if we could add that to the list of supported configs so
I don't need to custom patch:

#define XUE_XHC_DEV_COMET_LAKE 0x02EDULL

The patch is here:
https://github.com/tklengyel/xen/commit/dd0423aba6caa4ef41dff65470598a1c0c1105ae

Thanks,
Tamas

