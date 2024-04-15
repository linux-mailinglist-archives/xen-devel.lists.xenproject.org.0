Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A68A4AFC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 10:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705939.1102889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwI9F-0004GZ-9L; Mon, 15 Apr 2024 08:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705939.1102889; Mon, 15 Apr 2024 08:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwI9F-0004Es-6o; Mon, 15 Apr 2024 08:57:09 +0000
Received: by outflank-mailman (input) for mailman id 705939;
 Mon, 15 Apr 2024 08:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRdI=LU=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rwI9E-0004Em-6L
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 08:57:08 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214754e9-fb06-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 10:57:05 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso2294523f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 01:57:05 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 df12-20020a5d5b8c000000b00343a3e62997sm11405428wrb.50.2024.04.15.01.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:57:03 -0700 (PDT)
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
X-Inumbo-ID: 214754e9-fb06-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713171424; x=1713776224; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9SEF9N03H7pTUAyRlXJzL+16LhGKabvpj44u3+jv5k=;
        b=D8eedOa6pfcJP9Xb77gwVHrqmry3THcDJehjfBf3s2/Tl9ZBrgDoEUxrQMn0N6+a+D
         KSyFZxX7WOEnaUHB8mEO1ggdZcre4igOV0TTw/YB6K9ttBw7V0z04mZLxjexCvY/Dcns
         gbJ7rdd4aEdXmvORgUGVjPp63zAnjMd6IqDGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713171424; x=1713776224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9SEF9N03H7pTUAyRlXJzL+16LhGKabvpj44u3+jv5k=;
        b=QWnycUvKCVm8EdY7BEMYHIOWuqojymoB8/y47dfUzQ/oT41BcKORhLckz7gxR9wuMS
         1gz1EtXQLF6iQqBO79wnoWonltL6ftFy+wKtwztKxkf9z35nDkge3xja60mHv1g+DH2d
         jMdqFjuoMD/aCY9IxZkfGC3KKPTKkS7WNDADBuMU0MYNuwwIjfnOxezW06RrPabVhtLG
         LC4j3lZIFxnnYG4EdNgwDlKKx/bGXPGcjedm1N2CvyT/UW8dkrUQOSZq/F7E2O3V+71b
         10B2NlzKoz8VCQGVaohPZwSwcVp3QZ2ttTV2VoTL0Mf9glFXdovtyw6OjLxwFSgega4Z
         pkmA==
X-Gm-Message-State: AOJu0YyPrO7Joct+8MQOq4u0gGq+b1OkYJPsSxxf72ImlcGHGSzJXfUk
	CVws8pEjGIzOvjBV6ptEd2/KxKEMoX0EfJilxmoqKuvKTMAQjC24v9EpjGcRsONECv6LAqCjpUk
	N
X-Google-Smtp-Source: AGHT+IGUNRUexaAtzqzDqPKp1qIgG1Lrplo3jLiOfpEYG9ebes8/bc0P4GeqiV8G0tNcmEe1KvY1Xg==
X-Received: by 2002:adf:f64a:0:b0:346:bbd8:d512 with SMTP id x10-20020adff64a000000b00346bbd8d512mr6053721wrp.9.1713171423666;
        Mon, 15 Apr 2024 01:57:03 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:57:02 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: increase boot timeout for Debian PV guests
Message-ID: <e9bc461b-2cb8-4ac9-a437-394892deaee6@perard>
References: <20240412141121.79280-1-roger.pau@citrix.com>
 <2f7689f1-ac3c-47b7-8ba6-b6b9b9e82749@perard>
 <ZhzmTwP9_90GOnpw@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZhzmTwP9_90GOnpw@macbook>

On Mon, Apr 15, 2024 at 10:33:19AM +0200, Roger Pau Monné wrote:
> On Mon, Apr 15, 2024 at 09:15:51AM +0100, Anthony PERARD wrote:
> > On Fri, Apr 12, 2024 at 04:11:21PM +0200, Roger Pau Monne wrote:
> > > The current timeout of 40s seems to be too low for AMD boxes (pinots and
> > > rimavas) in the lab after XSA-455, see:
> > 
> > There's something else we can tweak if only some machine need extra
> > time, it is an host property "TimeoutFactor", which can increase all
> > timeout for a single machine. (It's use on the cubietruck for example.)
> > 
> > Or is it better to just increase boot time for all (or at least those)
> > pv guest?
> 
> I did consider that, but given the timeout is just limited to PV guest
> startup I considered the "TimeoutFactor" too broad.  I think
> increasing the Debian PV boot timeout from 40s to 60s is a minor
> adjustment, and shouldn't affect other tests.
> 
> Let me know if you still prefer to use "TimeoutFactor" and I will look
> into it.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

