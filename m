Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CFA31531
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 20:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885901.1295699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvu5-0004w8-16; Tue, 11 Feb 2025 19:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885901.1295699; Tue, 11 Feb 2025 19:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvu4-0004to-UU; Tue, 11 Feb 2025 19:26:40 +0000
Received: by outflank-mailman (input) for mailman id 885901;
 Tue, 11 Feb 2025 19:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MtP9=VC=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1thvu3-0004ti-Hm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 19:26:39 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d13cea8-e8ae-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 20:26:38 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38dcc6bfbccso2591486f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 11:26:38 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch.
 [82.192.244.13]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcd0fac67sm12549012f8f.54.2025.02.11.11.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 11:26:36 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 1230DBE2EE7; Tue, 11 Feb 2025 20:26:36 +0100 (CET)
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
X-Inumbo-ID: 1d13cea8-e8ae-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739301998; x=1739906798; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHUiGt2p3SNBSvSE4F77dmu0tTDl367av9kzRSudXp4=;
        b=c9eQ7tSu9HVOwrqxKZj1qlHUKGB0AOOie0C4KBNFD8ODuW9zOK7BQNFojh65MrNWFf
         +yZqZCPx+nrAqh9TyIdGSaBqibqA4mVePa8sucAUvSIDCl55QoKiFDfT7Dtpm7St8T3f
         0thbBQRerJdwIpoOcKAMwb9vNpwg6ZaV5pE8QIg6nc4qmZIsgEQorNXGVHV2U4nAmvCu
         ouu+AlOTo1oJpQLCYlN+BtWApVHa5KYXK5SN2/rK0Tz5HUgNhNGlGShVKU13WZum1lJP
         b8NF9P+OaoozlWfA4mJPYFDRt3lizF/fkZuDtwlbNb7WxK+8u/gtsJJy+qooFeltABSQ
         +yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739301998; x=1739906798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHUiGt2p3SNBSvSE4F77dmu0tTDl367av9kzRSudXp4=;
        b=c9Q4RlfU7RyPiOAJRJP0SY570r/O7DHUPwl8yIlc5rsU6wQvaXTWqDpoIE80CmVn/D
         z84Sy4+VyXNhVfiEvZJFccxBA5XSJgDvrKFxNrDbJZET9JSgnhELvWKByBwUDTVcVkfW
         ATN+JIh2QzQkPZ+AlwCdojzhYHzOPb/3q35I0Xd3Jpg5LuyJXjtNw1SU+nnktqP2w0tN
         jV/wMIXV55LbhknCDmeVHAxm7RJYnGz8bgmpAycGRi4E2ACShiSq0om2dY86EDYKb/Nf
         sPlbrcyGmmHY9EqY8FBI7rWgwoWpYjonVvg6lcfzrolNWUiFSh8jdjoutLOV1DHGCWs7
         ve6w==
X-Forwarded-Encrypted: i=1; AJvYcCUavRDMl3bPRbOEUPloyfOXU1KglrG5zhv8H0OmSxahic9LoC6zamP1ukmbYWYe9b4nS5rv+tUXAnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwD9CGwoE95LVoWeryQ4Q3Vu0Om5V3LPvdoUSK+7m8QdyhTqzdw
	b2krIzxOfJpehFSNLaEdxbpY6LiJVUZlFhEIcwkDPWRNmwE/+mQ8
X-Gm-Gg: ASbGncvk4jo3TAqvaLtxqbs3A89y7/am7SIWg5/itBfanQtIJwVnUfrTrAt1Psf+bQN
	NNmQsQMuhmDSsWNZbSYf3faw3uEz+rE0CLVzTipwNpG151UeHKkL/VxM9K0lUT0RmEyYIe6u5O+
	vHVV43vPzSIIxB75n7lprC8USorayoaiguJsxT3YznqqDpgIBARof5bMku8zVssB60Cl5JCRlpG
	nluoybNa7crdSaeFHQ8nCfa+dICMTrSzO4tzApEKMuIl1pLH6yQLkvDJ3LHD0samBrqAUZ3lTDs
	DVBUd0MZnL7EwH/5sAknuupAY63lyqD7gSAscqHrlJnPB3vG
X-Google-Smtp-Source: AGHT+IGyH6u7C+JHOMK24CSqsOZoQFhGFN1iCccM/JmeDZM3j0hw0pWZnQFg6iEPrhN9OMVzP5k3xA==
X-Received: by 2002:adf:cd87:0:b0:38d:cd8f:db00 with SMTP id ffacd0b85a97d-38dea28e259mr153109f8f.32.1739301997477;
        Tue, 11 Feb 2025 11:26:37 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Tue, 11 Feb 2025 20:26:36 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Radoslav =?iso-8859-1?Q?Bod=F3?= <radoslav.bodo@igalileo.cz>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add
 alignment check for dma buffers") when booting with Xen and mpt3sas_cm0
 _scsih_probe failures
Message-ID: <Z6ukbNnyQVdw4kh0@eldamar.lan>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>

Hi Harshit,

On Sun, Feb 09, 2025 at 01:45:38AM +0530, Harshit Mogalapalli wrote:
> Hi Salvatore,
> 
> On 08/02/25 21:26, Salvatore Bonaccorso wrote:
> > Hi Juergen, hi all,
> > 
> > Radoslav Bodó reported in Debian an issue after updating our kernel
> > from 6.1.112 to 6.1.115. His report in full is at:
> > 
> > https://bugs.debian.org/1088159
> > 
> 
> Note:
> We have seen this on 5.4.y kernel: More details here:
> https://lore.kernel.org/all/9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com/

Thanks for the pointer, so looking at that thread I suspect the three
referenced bugs in Debian are in the end all releated. We have one as
well relating to the megasas_sas driver, this one for the mpt3sas
driver and one for the i40e driver).

AFAICS, there is not yet a patch which has landed upstream which I can
redirect to a affected user to test?

Regards,
Salvatore

