Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ED08907F4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 19:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699149.1091776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpu84-0004UR-6s; Thu, 28 Mar 2024 18:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699149.1091776; Thu, 28 Mar 2024 18:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpu84-0004Rr-3l; Thu, 28 Mar 2024 18:05:32 +0000
Received: by outflank-mailman (input) for mailman id 699149;
 Thu, 28 Mar 2024 18:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ELB=LC=gmail.com=dmitry.torokhov@srs-se1.protection.inumbo.net>)
 id 1rpu82-0004Rj-8B
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 18:05:30 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a7b677-ed2d-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 19:05:26 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-36898a6f561so4843715ab.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 11:05:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
 by smtp.gmail.com with ESMTPSA id
 a185-20020a6366c2000000b005dc88b232a5sm1593248pgc.26.2024.03.28.11.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 11:05:24 -0700 (PDT)
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
X-Inumbo-ID: c0a7b677-ed2d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711649125; x=1712253925; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/sacnz72CwRH0otyTGzert8z0sn/i0tise2f/EaGiQ=;
        b=C6VWphScCxQrRz6/PuvBn93Rsf674RXp9HVRZ5n1UVYO/N/yk5q6wxt//+pfzztCNA
         H0tU9rBH+oihzcymaHXXZZcE0vP2gDXnpn8IGF6siz7po2Jov0Mpi9OcLahJa3t1hYcj
         D8fA+ovuv4WTa72XFqntDMazCGRnBBvqo+d5G5NS8fL+Ws2VeAVAcmB1YP2lZOGbKdh4
         7ifJBY80uo2CNgpnfsww9v72nSVoeF0kT5VPjfjaE4pIDr127hRxBG5GEywHuRQdXdHZ
         TyweCNTPFQuRw/VDjsRq+NGRUDbSO+xQ4R1cGTxQtjjVOFrbjT6yvRxrW8b3OQBI/1D8
         cZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711649125; x=1712253925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/sacnz72CwRH0otyTGzert8z0sn/i0tise2f/EaGiQ=;
        b=Y1vkf6pS5kEJU6S+IIb+/aRDEYqgGwa+DmE759FZ89nWJxMnEPNHtimAzpCGFDwb7c
         nTxGJvcjsPpI+VoV0o60ok9O3HCHI35uDCDapv/fpDqyBpokZr1sxDgZ6S4oHRrikAVk
         be+MNdC6FHlAg5cj2ZmI0Q8YAvzdJVY42zzuXktdtDSBtO/9au7rxvIG6Axh3MAUMTRs
         MYTWPzF5TqVB2xVP5PgzBB/I3jYaGmoMZbFoSw++M/PfRqr2SQ3GBPQ1TL/y1rSL6MjA
         2P6oR79DJ4JJi7C4gjUnXnnS+DwkGn75T4vAvqez5413AbbqjWRPONnReNPMOpPEt0wj
         xO9A==
X-Forwarded-Encrypted: i=1; AJvYcCULcc2aDzf5E0vxWbeEqyN5DxvdWla4Iy7lNj7WCBJONyHKlAPDrDMjTzipt+MH9zg3DWaRCytzph8a/Czpg/hBwkI1TXm7XAhLAz72lO4=
X-Gm-Message-State: AOJu0YwKJMOEkmpYKOGmLIXbj7uobT5tZcqoOJR03E4v2M+i+VfTwgqh
	uTbxTg2IbopFob2HPddG8Lp/CQr14Vcn5thBUpctjUnbRbHsO4Io
X-Google-Smtp-Source: AGHT+IFxenVy3Vpe40qXySr/FIX8Cmzlhc9MA4Bak20UWKfT1c1La/2Q3sNRmDFpNQjvs7U7sVA40g==
X-Received: by 2002:a92:d486:0:b0:368:a474:4410 with SMTP id p6-20020a92d486000000b00368a4744410mr4494143ilg.2.1711649124902;
        Thu, 28 Mar 2024 11:05:24 -0700 (PDT)
Date: Thu, 28 Mar 2024 11:05:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Phillip Susi <phill@thesusis.net>,
	stable@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	linux-input@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] Input: xen-kbdfront - drop keys to shrink modalias
Message-ID: <ZgWxYvQH4A_Vh1i4@google.com>
References: <20231011193444.81254-1-jandryuk@gmail.com>
 <CAKf6xpuJe6Cza6bow3QxDGf1viu0kish7Y8YRN8haXL1oEF3HA@mail.gmail.com>
 <CAKf6xpv2oDpPB3wWh=Fz_ahDVgmvw2MSj_q3RYqQ8NG6km5Tuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xpv2oDpPB3wWh=Fz_ahDVgmvw2MSj_q3RYqQ8NG6km5Tuw@mail.gmail.com>

Hi Jason,

On Wed, Mar 20, 2024 at 01:42:27PM -0400, Jason Andryuk wrote:
> Hi Dmitry,
> 
> Do you have any feedback, or can you pick up this patch?  It solves a
> real issue affecting udev, which crashes the Debian installer and
> breaks the mouse for Gnome.
> 
> Or would you be okay if this patch went in via the Xen tree?

I'd rather not. Could you please ping me in 2 weeks on this. I promise
we find a solution before the next release.

Thanks.

-- 
Dmitry

