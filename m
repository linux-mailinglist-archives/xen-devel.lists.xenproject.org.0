Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6B3ACF19
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144798.266471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGTd-0002sB-RP; Fri, 18 Jun 2021 15:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144798.266471; Fri, 18 Jun 2021 15:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGTd-0002pD-O6; Fri, 18 Jun 2021 15:32:13 +0000
Received: by outflank-mailman (input) for mailman id 144798;
 Fri, 18 Jun 2021 15:32:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyHv=LM=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1luGTc-0002p5-3p
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:32:12 +0000
Received: from mail-qv1-xf31.google.com (unknown [2607:f8b0:4864:20::f31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cdc3b37-e2b9-4d5c-80e2-3a2cb50d2c5a;
 Fri, 18 Jun 2021 15:32:11 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id 5so3750129qvf.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 08:32:11 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id y16sm5301877qta.72.2021.06.18.08.32.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:32:10 -0700 (PDT)
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
X-Inumbo-ID: 2cdc3b37-e2b9-4d5c-80e2-3a2cb50d2c5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ufURiA5G+QmMKc3cHR4SDlIUzS0QueFElFdTPdxsl6I=;
        b=pLj8K+rg1GqSADyz/MIdH86j7yhTw4X6FEllGnEMoZ/+dthKafKcoLXhypthtRHser
         vLV6/FiEtISL8X/w8Nt+4oeHiw4yZYjfoZI2XZQFIdnXkyMJI53y0y5nIR8EClZ4OOXZ
         NKernvGFD2j+8S92sCk+7p5MHJpoumABzQYeeRl7OVvAgGltEZD5OAv1Rf2B6vx3HlT2
         QR+sptNBIC+JqjToSw9koeGiAbk/oUv6AC6oNyQhTVe/TS0GT4wHo5P5Sm3f2ML1i+HC
         fXGoajQ5D4DM9K3iFrtuWmtGLPC6ZcU/6QEanKrl7jROQomDTSexOy5NDV5o3PhVZXZ7
         Ge4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ufURiA5G+QmMKc3cHR4SDlIUzS0QueFElFdTPdxsl6I=;
        b=RZw5maxCfOoH4H8p1+6oQwgysKvfh1qefhY+iySVMPe7uhV2/mtkbL0VF1jseHIlVr
         bGEDLtqz5zzjGMNmFFQ3iYcVvhjTVU6sPy1okLKTGkY0RUdlsTUnnxBSp8qvqWGnolPj
         PB2chumvpbuZ4EdXY1DrOOv+xgqxSYnfsTN4DUzMddOE96UgdTZgKNI0dGeNq2XM5ahi
         UxkMfC8j8hck/Mn8NH4+3XnuIWgtggbpTGCIPoCCs5Gez5l8AFGCnm6mJoSB/7Tmeyfn
         vkJVzlFGD+/qeoDMkEJATn4cuVYB+PQUqZyIamdJwz4wJSc9RcPbMH99DTXw2l2NAnYG
         Hpzw==
X-Gm-Message-State: AOAM531neZm6LekrDwMBEK/BmLf+o4tKEi88p1R4AT+bfqFvMyiBSFLl
	/1pGOHXpJZtNUE3Lj9hKbrs=
X-Google-Smtp-Source: ABdhPJxSFOWwfFoYtUPbRUcO7GndZn7BdNWsH/2tmWfME2elhdpq+/Y1jtxyj0U95+Gr9zv5kAR+cA==
X-Received: by 2002:a0c:d602:: with SMTP id c2mr6228887qvj.41.1624030331002;
        Fri, 18 Jun 2021 08:32:11 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:32:07 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 11/12] golang/xenlight: do not negate ret when
 converting to Error
Message-ID: <YMy8d29gPIZl1NxB@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <82bc8b720c3dfb178e52d10ddbebfa8dc5880e7b.1621887506.git.rosbrookn@ainfosec.com>
 <2C77D13E-ABB5-47F2-B466-07CD6652AF33@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2C77D13E-ABB5-47F2-B466-07CD6652AF33@citrix.com>

On Fri, Jun 18, 2021 at 03:13:03PM +0000, George Dunlap wrote:
> 
> 
> > On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > There are several locations where the return code from calling into C is
> > negated when being converted to Error. This results in error strings
> > like "libxl error: <x>", rather than the correct message. Fix all
> > occurrances of this by running:
> > 
> >  gofmt -w -r 'Error(-ret) -> Error(ret)' xenlight.go
> > 
> > from tools/golang/xenlight.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> Erk.  I’d be tempted to say something more like:
> 
> "Commit 871e51d2d4 changed the sign on the xenlight error types (making the values negative, same as the C-generated constants), but failed to remove the code changing the sign before casting to Error().  This results in…”
> 
> I can edit this on check-in if you’re OK with it.  Either way:

I would appreciate that. Thanks!

-NR

> 
> Acked-by: George Dunlap <george.dunlap@citrix.com>
> 

