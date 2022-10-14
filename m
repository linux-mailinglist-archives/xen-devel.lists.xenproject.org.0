Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC85FEFC2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 16:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422896.669248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLKv-0000Nk-TW; Fri, 14 Oct 2022 14:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422896.669248; Fri, 14 Oct 2022 14:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLKv-0000Lm-QR; Fri, 14 Oct 2022 14:06:53 +0000
Received: by outflank-mailman (input) for mailman id 422896;
 Fri, 14 Oct 2022 14:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdXR=2P=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ojLKu-0000Le-04
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 14:06:52 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7269a247-4bc9-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 16:06:50 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id b2so10744131eja.6
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 07:06:49 -0700 (PDT)
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
X-Inumbo-ID: 7269a247-4bc9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szfsHn58qlHosBTktmeFDMRXO20yhh1xMRQGpNfQKLo=;
        b=LK8FVPQZa2uAs5x5SMA3Bsep+SoyM+1HEybKOxCssY6T6er7ovHem6Aom+dHFNxN5Q
         l3eRuq4RN9iagGtuGYMR+1VIWqKNT3Gu6+c++aFARVJjwZ+4JeoN8Ax/7/IFqOzyAXxK
         28dOWRuVfp32sc/qKW2a1OA4SYG57v7u+TIMd14Sl3WU+dMxN2EdXbNYPUOmYKypsLvz
         y9LDoKPn/2nS4r/ytQ0EtxrC9Yk+pcTZ7Aj5aAlw40AYVGpvOUWyD6MCj/AdCs/35a9D
         RZEHsyq4/59F1BMwdCKYIu+bRLjaWS6z7h5HCU3BxWWEkQVvgfA26t3Zde0qeLDLPalX
         Y5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szfsHn58qlHosBTktmeFDMRXO20yhh1xMRQGpNfQKLo=;
        b=E5rRgBwmrle2JRMlmNEim/31/DRaW81n+3EmVEPzKa9U+KQ1G4kDR4VUwKq/yyDm+a
         d1LWJTsi+HFMaX3fL+KxtTA07sTtLrBA+KziA+FuBSum1AzxBpggoBCf82+rVfk2wu4p
         PfzDb3TOEBU904BlVxxXfyIN7aqGqnmJwSu+7m985Yngq3zOtl67E8m0XL51tJGCqExH
         csr8lk/A5sh7bTYlnxRf7fQOpDFuOLUjU+4oKSkV+oGyh++EXG2lfnzRvDvDvYdbCfxN
         hJSiUepnp5eEzZAP8wNApRzrAMeJk9uT2l8QRlc+mN3zqZ7bp6AYvZ6aA2mT5y34MOKq
         ilBQ==
X-Gm-Message-State: ACrzQf2RfGWwGndTezchhPYoWbJRmMYxl0EvF/xxpv5QYhQYRlCq9paF
	xhkShaPX2Klvjak/kOoJpyy8T3eFPmUo9nzO5g4=
X-Google-Smtp-Source: AMsMyM7nm5Em1bmOKPfIllS/6qEfOZiuU3e/o7/7xeXZY65Xddt8E9V4IsEMAxssFT2ZX+B5tRnvERCRvRhiyJAX4/E=
X-Received: by 2002:a17:907:d03:b0:78e:16da:e4ae with SMTP id
 gn3-20020a1709070d0300b0078e16dae4aemr3804854ejc.202.1665756409410; Fri, 14
 Oct 2022 07:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221014140221.31966-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221014140221.31966-1-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 14 Oct 2022 10:06:37 -0400
Message-ID: <CAKf6xpuh5sdnNvrY_J+=7pYR6i6SgEf2QHPx0_LHJBMi+m_urA@mail.gmail.com>
Subject: Re: [PATCH] argo: Fixes to argo_dprintk()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 10:02 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Rewrite argo_dprintk() so printk() format typechecking can always be
> performed.  This also fixes the evaluation of parameters.  Emit the messages
> at XENLOG_DEBUG.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

