Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3561E8547
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 19:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeizn-00062d-JN; Fri, 29 May 2020 17:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2UY=7L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jeizl-00061j-Vr
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 17:40:38 +0000
X-Inumbo-ID: 81679c96-a1d3-11ea-8993-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81679c96-a1d3-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 17:40:37 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id k11so2854084ejr.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7HK8mOY3BV+ku81uwlyallfkjvbwlZmNX57RqeAJgfE=;
 b=Y/CF7+JFBOAU3Cer6Y6reC7djOCMUs0Iag2bhU978XqlKJ6F0z29VBrkeE/LtHnx1w
 mvG/MucZxWK7ktgdOEDPVyfKfICl9ufTuH7vtc74lZIaL+nT1Mn7Yv+VMHJlxgUpa9fa
 cn0N8GkIcLUTORIQVB/jJi/IjT0FnK0i3KES5uXqqYnB2rRWSAUahX6BLkpsDreyUgnR
 KcKSSptK0AEwva5+o+af0WgR2YyURAvdKtDwNb36LxbJ933ThXXl75pz6XQf1yOAwv8U
 Lhgk/VUcxvq4IeeesaGmOX7SQwz0xjtGyYurxv2uh3NdLVugdbT2bGIhUqQBFvMeSQ4y
 qu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HK8mOY3BV+ku81uwlyallfkjvbwlZmNX57RqeAJgfE=;
 b=h4GMFOP5fxJCPWUDIekyr3XnRl2xHwmC6tEvC7xQYF46BIV3MtKp5OIUjCH6dfOiC5
 A2PsZUYOzEShwBUIiU0q/UNtz87KUF8N+qOISAki+Lc7FNiRbSw5aXFW5UqVqJkkBriK
 keRmljsxBc6HQchPI2bGx3kbhY7yrNxNavCrZTpuHbRjdkSvdcobJLvCrf/gpvB1Sn8U
 R2Kb9bDR4RTQmKj5K4l+UX0+9zbabccEdJ7R8sFaImRHCIVAZvqwe5ahmF8TaiKIS0Lq
 eUpapnfbQ9jawRQqJmaQR8xLKP9pCOxsU1ZNebne48vCrp4haHYn06GsjSwh6HZIf8nX
 BOQA==
X-Gm-Message-State: AOAM5306XyyEjZ5UfRkZ+asHTcWcH+fr6BdsZxoxPBMtjXRGSwJDd+ca
 AKgZFMP/DEJFhzqdWFUM00QP75Rmwoc=
X-Google-Smtp-Source: ABdhPJx1fM/0VSQwF3JWyKgY34j4nwomCbWk5GlXiEWHYJTWgcWyh3wFksZqpcM84kw5/Et3CAkDOQ==
X-Received: by 2002:a17:907:217a:: with SMTP id
 rl26mr8473721ejb.209.1590774036440; 
 Fri, 29 May 2020 10:40:36 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id h8sm7510406edk.72.2020.05.29.10.40.35
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 10:40:35 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id r15so4565448wmh.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 10:40:35 -0700 (PDT)
X-Received: by 2002:a1c:1b13:: with SMTP id b19mr8783754wmb.84.1590774035183; 
 Fri, 29 May 2020 10:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200529162234.16824-1-tamas@tklengyel.com>
 <00da0381-e132-03e1-3717-02f4e968ec32@citrix.com>
 <24273.14616.523593.758476@mariner.uk.xensource.com>
In-Reply-To: <24273.14616.523593.758476@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 29 May 2020 11:39:59 -0600
X-Gmail-Original-Message-ID: <CABfawhnf7jMDFZxzmEi65d13Wqttuju5=Bm2C5vi0Us7wKSaEQ@mail.gmail.com>
Message-ID: <CABfawhnf7jMDFZxzmEi65d13Wqttuju5=Bm2C5vi0Us7wKSaEQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14] tools/libxl: fix setting altp2m param broken
 by 1e9bc407cf0
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 10:32 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Andrew Cooper writes ("Re: [PATCH v2 for-4.14] tools/libxl: fix setting altp2m param broken by 1e9bc407cf0"):
> > On 29/05/2020 17:22, Tamas K Lengyel wrote:
> > > The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
> > > boolean. This is incorrect and breaks external-only usecases of altp2m that
> > > is set with a value of 2.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> > Sorry for breaking it to begin with.
>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>
> and pushed.

Thanks for the fast turn around.

Tamas

