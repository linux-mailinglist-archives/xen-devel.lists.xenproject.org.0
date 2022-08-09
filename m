Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18458D89E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 14:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382917.617982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLO2Z-0007IS-Bc; Tue, 09 Aug 2022 12:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382917.617982; Tue, 09 Aug 2022 12:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLO2Z-0007Ei-8Z; Tue, 09 Aug 2022 12:08:55 +0000
Received: by outflank-mailman (input) for mailman id 382917;
 Tue, 09 Aug 2022 12:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcHH=YN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLO2X-0007Ec-Ew
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 12:08:53 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a30b00-17dc-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 14:08:52 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id d14so16654838lfl.13
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 05:08:52 -0700 (PDT)
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
X-Inumbo-ID: 08a30b00-17dc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XAhIwILs5jhkJz5Pi6j4TfceLVtBPcU5siLExAVPCSg=;
        b=W2P6KsgWhLb2dAI4UwFxA+5jryMO8rpm17vJ6A40lJvNs7VRYETAZE8nPXAU7c84mH
         9Zy4x+GHnw5V1eLX0ZfzPBbFedfehijaerGjtrUDfW0U3G3A1r8wsv8F9Csi0Pqy7YCH
         Af7X1lWqMV/n1SpNbeP/Bo/nnHUs/IWKEsT8ioKGE9KLKZ4DcJ3Yndje72Jf9L99a4Bf
         sgAFKUS8WWrYjdkfXbF+VWSkIEI875IakPTAy91U/vmvlKoYF2Hs6xRx/Gz1wa6LLYGP
         UIc9MyINe6AV/NBO4MLrNnAYkgiYNb2bWI50Y573kg1p5IKSFoGMeJYd+X1epidwAYqP
         AFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XAhIwILs5jhkJz5Pi6j4TfceLVtBPcU5siLExAVPCSg=;
        b=07bQMW4CQ54HpryC1cFMpRUWVp0WqrOyo0aK3wT+N40L55ybMWYY7yosvjpCmt22CK
         1/N1Ce67lfNLPcxJ08UO0NIwSetlFN2l7yKhdbKghqHeYjOtDPwCpztBOBtF8mLpaLfN
         DEcrJDbqir5m4JYSLld9gH2mHnv/gW1SupHdllDAj4lcvcFnHsHaiIP9VzHGKDV1Ebbq
         /hSCT51PeHYUwhVTPq8LGFP9Q+EOY//gvm7ElOXL/Spv11sa6/oOGBnzEghuLCXCoudt
         kB/79YsieS0iMLKL+6OQd9ZawTOTHoEp2NwYt0RqFlMuwD5j+UfJuGiWwUc4EdS7Z9N4
         ddOQ==
X-Gm-Message-State: ACgBeo3SwzYGePVrwwyBbx3cNfzFDIOXkHigpF+2rSKwiOqBTfOm2vw0
	7LL7ybQ07GlTWGvNQ5gly5uqkIRk65e5SKvnajI=
X-Google-Smtp-Source: AA6agR5B3XL0HZFOFJVYuBgMAB1lW1jxXU1Xh16mkz8/MPiHb3lQmVE/xXFUWSiTPbGl8CYYv1K/Zf82nq2WHLHWXoo=
X-Received: by 2002:a05:6512:c13:b0:48b:3b30:637d with SMTP id
 z19-20020a0565120c1300b0048b3b30637dmr6798269lfu.447.1660046931950; Tue, 09
 Aug 2022 05:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220808110545.62886-1-anthony.perard@citrix.com> <20220808110545.62886-2-anthony.perard@citrix.com>
In-Reply-To: <20220808110545.62886-2-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Aug 2022 08:08:40 -0400
Message-ID: <CAKf6xpsHhqE5xOO+0eWcu8yqw2eVNy7CnxcW=Uwm8doggXoOMw@mail.gmail.com>
Subject: Re: [XEN PATCH 1/2] tools/libxl: Replace deprecated -sdl option on
 QEMU command line
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 7:06 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> "-sdl" is deprecated upstream since 6695e4c0fd9e ("softmmu/vl:
> Deprecate the -sdl and -curses option"), QEMU v6.2, and the option is
> removed by 707d93d4abc6 ("ui: Remove deprecated options "-sdl" and
> "-curses""), in upcoming QEMU v7.1.
>
> Instead, use "-display sdl", available since 1472a95bab1e ("Introduce
> -display argument"), before QEMU v1.0.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

