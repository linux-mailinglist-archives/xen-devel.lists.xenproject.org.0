Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AB88A5F2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697778.1088877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolzE-0002WX-A0; Mon, 25 Mar 2024 15:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697778.1088877; Mon, 25 Mar 2024 15:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolzE-0002V0-7P; Mon, 25 Mar 2024 15:11:44 +0000
Received: by outflank-mailman (input) for mailman id 697778;
 Mon, 25 Mar 2024 15:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMIF=K7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rolzD-0002Uu-Gr
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:11:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc07fdf8-eab9-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 16:11:41 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4148c04396dso2944675e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:11:41 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bf12-20020a0560001ccc00b0033e745b8bcfsm9742542wrb.88.2024.03.25.08.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 08:11:40 -0700 (PDT)
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
X-Inumbo-ID: fc07fdf8-eab9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711379501; x=1711984301; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LR1gIfisqV2Ai3B2/p8+IhtMSDuKYubozQErFrhg05A=;
        b=HIEPXOCUZ9d/DQMiEBcSOYU4eTpnIVoybqi2tkXBUWogbipLJI8PehvTv0mvy3r48p
         1KM+REDvX9KgRx/4albTqqoU0Gcw7yRRWduVMAQXa96QQTORGD+VpbwNy3K7YrtCt1Cc
         DJJE2x8SFJ2cOYsEmOnw7K1Pt+x4yIFU7H4BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711379501; x=1711984301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR1gIfisqV2Ai3B2/p8+IhtMSDuKYubozQErFrhg05A=;
        b=eEN8uxIq4eMNM/bNBmISMwyRvQxlfYT8ViLBwrly+zovdXdUqpcmV0YFzVm0h1H79Q
         f4xkrQ5uq38jY/IB1N6X1zIW+a+LiB0zkGmz4/uSPWc1qojuWT+eCnPoiN/BBa9vVNOn
         CsOqLDVKbQtNfHXXHLEqHXOtM5dmUewPDAEp0yV/MPsDtCPo+B3ufJHcj8SQO4hMZ34l
         N/THPpLpHXH4Nl+Y2cDbQWAmsLrUwVof4oTWyFRAoxftrZZY8SWFcP/JjMYKlZHZodtN
         VIbkm0fpWd7RyRPfmHT/7h787opKCtfMiHe/CeVAAqzP9E3gHaJzIkQ5jRReMeC5jQvP
         pvwQ==
X-Gm-Message-State: AOJu0YzC0YG4b8ng1GXej6i28sTELZEPfQSKLATg1sP72/fqX1jtChSN
	3bMYN65ZfC30bewlS272epQ/bQ2kJoRApAUY8mOIsCOtGRsEDcGKREq1TPxipIE=
X-Google-Smtp-Source: AGHT+IHILC5kHaXsTbpE5RfJZWb7Yjx1c8xOuVTdAsvya6sIvr5JZSj5PNIiyirtFdSvM4ecQLBt3A==
X-Received: by 2002:a05:600c:198c:b0:414:48f:a7ab with SMTP id t12-20020a05600c198c00b00414048fa7abmr4945999wmq.30.1711379500813;
        Mon, 25 Mar 2024 08:11:40 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:11:39 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: =?iso-8859-1?Q?Rafa=EBl?= Kooi <rafael_andreas@hotmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable
Message-ID: <9b762ce5-ddd4-4213-af34-6364cd1fa74e@perard>
References: <cover.1710920673.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700AA0337B5E6598E23EE0AE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <a7055af9-fae4-46d1-bf10-5d6ccf0747c3@perard>
 <DU0P192MB1700FAE0D0CC005546F5363EE3362@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU0P192MB1700FAE0D0CC005546F5363EE3362@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>

On Mon, Mar 25, 2024 at 12:09:40PM +0100, Rafaël Kooi wrote:
> Makes sense. To be honest I don't even know what arguments one would pass
> to xenconsoled other than setting the log level to begin with. I would
> assume this to be a niche enough use case where very few users would be
> affected if we do decided to remove the variable. Maybe we could opt to
> advertise it as something that we will be removing in a later release?

I think it's fine to leave the variable where it is. On a systemd service
file, it's kind of nice to be able to add new arguments without
overwriting the whole command, as it means that we get the command line
on an update if it changed.

Cheers,

-- 
Anthony PERARD

