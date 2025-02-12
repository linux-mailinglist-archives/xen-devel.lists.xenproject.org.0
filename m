Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A3A321DA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 10:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886218.1295894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8p9-0000ke-IP; Wed, 12 Feb 2025 09:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886218.1295894; Wed, 12 Feb 2025 09:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8p9-0000ih-Fm; Wed, 12 Feb 2025 09:14:27 +0000
Received: by outflank-mailman (input) for mailman id 886218;
 Wed, 12 Feb 2025 09:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uxJh=VD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ti8p8-0000ib-EN
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 09:14:26 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea66bca-e921-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 10:14:21 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso1058039866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 01:14:21 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7f84ba3aesm59493366b.149.2025.02.12.01.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 01:14:20 -0800 (PST)
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
X-Inumbo-ID: bea66bca-e921-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739351661; x=1739956461; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLS5qRqb4X9zfevcXEqYwTY40A5UFluxix5UViz/Ots=;
        b=uMYVAk810sDPDW558e3txPVADf7SXxTdFzzukzo3TxuYebZum1KiVsGENa2NNdCl4A
         Vt6Jkmnf2q2QDBzSUUduUVgVKScJ/Dbl4NizvV+knQuRBsSflSAe0q78+HEcXmpbJkGf
         pV7Tap/fpqeUdo4GQOcXXXXaxX8ZqNEqoUn8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351661; x=1739956461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLS5qRqb4X9zfevcXEqYwTY40A5UFluxix5UViz/Ots=;
        b=ulbkieYkRMiV7QBYR9QhPu1HPXIMiw2QMlOr25NMPk5ASrBpaRvNGVH6Pj+6aB7YBy
         zOEtDd+IV//j+bt7uezICfCblqlle3Rh0SCHytpxcHNpDV0cxWGsxOIFDPmOSDrNBq9Q
         waKgCgMm+Dt6lJ6O/22YFonhDRQdPbgQpqWZFGOag/kN45iq9ba/wUhbkIoByhxI7v6C
         Npk2DxvKOMn0Rv5t+w01Exub8q779ismYGKsTU8aekhc6xFVOSY//2N0iYdNEWU9eEZy
         URjYTOwkRgvhnT0IJMzkQZ6Btn3/lhxNTH7hqIoA9mwULqf8rs5aCAvFgBZcsDUk8SYs
         uG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVleLmcpynHUrs5pcF7iXaknHNlk1zKyNPzhn3FdmcwIx8pYATGKyf4dBooXl1RE/xtIjevq3BTkFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVv4hGID2EuZ/eBcw3x8BgMWity6mWIqMP0JedgYnzyAt2EqHW
	y8jDbQedb+WJQ/DWPDoy6/ABzOi0n3g6U+0xDfLJDdZGxMCwGeer951tF+jFmopMa4Ag894vViL
	9
X-Gm-Gg: ASbGncvAadgzBefGZQKO7EFXCK2E+ZKuUNBgmHxm8wx8vRru8OY6DCDoFTg1xPNZfOe
	SQ6DspNZJTeCND57n8CAYIrhXxIf4rAOXCiEVwvTdPI8FyeFRFIl+SKvPaAKzg9xnzedLRSsnus
	tI2lFXKk23mEZdwc7tBisGoKWJ6tCff9jrwOBlZrhqMMFQnPgvdoIFhqlW/J4odAktAqZTvA7Nk
	xz7mhNCaFj5qN1f8etUZWMjcpJWFt7PkYpF0Wg7o2XKMbh/LjZPlwxeiZpRPPVvlKtwwamPr2ff
	xTOWnrxtp7VOUZ/bJuU+
X-Google-Smtp-Source: AGHT+IFpoqlAETPJy4Je17wH95cF5B3v7VRh0CJSaSXvGlePsfAwxY4Pqen2+xGZ0v4968xBIf1wKw==
X-Received: by 2002:a17:907:9490:b0:ab7:63fa:e48f with SMTP id a640c23a62f3a-ab7f33d2311mr180969366b.26.1739351660903;
        Wed, 12 Feb 2025 01:14:20 -0800 (PST)
Date: Wed, 12 Feb 2025 10:14:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6xma27ZxfeHK6Y0@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>

On Tue, Feb 11, 2025 at 02:33:08PM -0800, Stefano Stabellini wrote:
> Hi Oleksandr,
> 
> This morning, we had a discussion among maintainers, and the suggested
> approach moving forward is as follows:
> 
> - First, it would be helpful to see a sample of the proposed changes
>   applied to a single source file as an example. If you could provide
>   such a patch, it would help advance the discussion.
> 
> - If the changes are acceptable, we need to properly document the new
>   coding style in xen.git. If not, we will need to iterate again. We may
>   also need to add a "xen" template to clang-format.
> 
> - Once finalized, we will proceed by making changes to the Xen source
>   code piece by piece, as you suggested, rather than applying a single
>   large patch.

No objections, just wandering myself whether it was considered to
initially only apply the new style to new chunks of code?  Using
`git-clang-format` or similar as suggested by Anthony.

Is the adjusted style expected to be too different from the current
one as such approach would lead to hard to read code due to the mixed
styles?

Thanks, Roger.

