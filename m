Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B28A4A22
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 10:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705909.1102830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHVM-0002Kp-4q; Mon, 15 Apr 2024 08:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705909.1102830; Mon, 15 Apr 2024 08:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHVM-0002HR-20; Mon, 15 Apr 2024 08:15:56 +0000
Received: by outflank-mailman (input) for mailman id 705909;
 Mon, 15 Apr 2024 08:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRdI=LU=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rwHVK-0002HL-Rz
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 08:15:54 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60460891-fb00-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 10:15:53 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a4715991c32so367455866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 01:15:53 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a6-20020a1709064a4600b00a51f2b5b1fcsm5181468ejv.75.2024.04.15.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:15:52 -0700 (PDT)
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
X-Inumbo-ID: 60460891-fb00-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713168952; x=1713773752; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jabxJURdYFLANyOOPYHWbd3EQcws76nazsE9ptOCHH4=;
        b=Ofqt52GwwCmiYmpeSGRMUg1y5c79l1h9a8sHTMI/7wPhripdZcSC0vAaUSgOC3PVI1
         yrRBFTPiVvDIXciN1UVyfkuLgqWo+sTzoKzmjz9cEIbwGcZX4vw/igOL22Ag0+tiBtw8
         idMVYrfGEsq8GMW3Oe8R5RvN44GfmpZbTQdMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713168952; x=1713773752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jabxJURdYFLANyOOPYHWbd3EQcws76nazsE9ptOCHH4=;
        b=tfSGzR2EVp3HQrvYIOw8BVoLINoAJBm4IXftpBCXFzxRfSaX+Nv/Qby2U47AxLkGG7
         7mBIR3SlVZtJ6HNgj3eCIL/0qyWCr0cUGG7xgNxEi5ugbv232Vvaf1cG60ZxR5DVuee8
         WtfuCY614hOja0Yq3Bt3lYIyCpyvI+QHDduz2rURdTC2lOQBPxVjgbASvNrBsRNm5zST
         lP0EYgndijBYfcJpisQsQj4pxfAgoNYLc8QybjJKsB6MqwJRPdTzHs/PlgAlwRet1Xpa
         UKnfb3dICAIAhs9v6RZDOaiMpJfPt6kegP6PEo97c7kKigpQFlsgW4RkgrkyWpBDjvSf
         FS9w==
X-Gm-Message-State: AOJu0YwnjFtuainNlSGQ5Xgg3Dbs9vLyrtTQzQuNdmUDaqrtahm8LlyN
	Y033HacKUqYJP7q7eK3n+LtVORo/yiVMsHUduKcX49KDVQO0rL3nzbvoU5NdXiptE0VBbsTk4zB
	u
X-Google-Smtp-Source: AGHT+IGE9GT2Ol5TU0EVRGgSh08mjdQ5cWzVDEHfvGwjxO1kb4NQIpjMM79wN6vdZl5R9rOWqv2BSA==
X-Received: by 2002:a17:906:5948:b0:a52:10c8:c4e2 with SMTP id g8-20020a170906594800b00a5210c8c4e2mr5627147ejr.66.1713168952362;
        Mon, 15 Apr 2024 01:15:52 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:15:51 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: increase boot timeout for Debian PV guests
Message-ID: <2f7689f1-ac3c-47b7-8ba6-b6b9b9e82749@perard>
References: <20240412141121.79280-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412141121.79280-1-roger.pau@citrix.com>

On Fri, Apr 12, 2024 at 04:11:21PM +0200, Roger Pau Monne wrote:
> The current timeout of 40s seems to be too low for AMD boxes (pinots and
> rimavas) in the lab after XSA-455, see:

There's something else we can tweak if only some machine need extra
time, it is an host property "TimeoutFactor", which can increase all
timeout for a single machine. (It's use on the cubietruck for example.)

Or is it better to just increase boot time for all (or at least those)
pv guest?

Cheers,

-- 
Anthony PERARD

