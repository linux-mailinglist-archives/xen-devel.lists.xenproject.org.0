Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD999256A1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 11:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752847.1161095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwCl-0007zS-MC; Wed, 03 Jul 2024 09:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752847.1161095; Wed, 03 Jul 2024 09:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwCl-0007wR-Je; Wed, 03 Jul 2024 09:23:11 +0000
Received: by outflank-mailman (input) for mailman id 752847;
 Wed, 03 Jul 2024 09:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOwCk-0007QS-1G
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 09:23:10 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc36b51f-391d-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 11:23:08 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e98087e32so498312e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 02:23:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42577a0d108sm98628925e9.0.2024.07.03.02.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 02:23:07 -0700 (PDT)
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
X-Inumbo-ID: dc36b51f-391d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719998588; x=1720603388; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQkPuqWcqS+mGrFDKfkCK3gbYauNjQZNcgpdAfZlNjI=;
        b=EWNB0mg35PsD+i3tTR5fUmCV0rvViSWPb69ulHwNkVdaRkmeXWwmDA6TivAz8TAgQU
         N1/HMsWKVtig/bNTB1MtMv0CRfHxuDKN4+6e+brd76NMDB7lyPM//II7ruE9aKwhKuom
         lUIRtkBBc/cHf5poqn+7TAhUNS7k0z6LuHKAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719998588; x=1720603388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQkPuqWcqS+mGrFDKfkCK3gbYauNjQZNcgpdAfZlNjI=;
        b=A+Ord5uCiZ7n+J6I43JW9vOURPrECtaSaIpO2gkxftrF9hiUwR623cEld6mSbDCPZF
         7gkz9dpEP1dMeayVM990jaQPKSkrYxobLQB+Vwf4s9QrBOSKnU0pO99WW5xfxWthOskK
         RBX1lFeaytrUQB8ocNMjZdVBMmyHK5GFGSbp/AjjumjPZqKbKzzvz3zKHyj550otszAV
         tdfqrQujJlsjIg0+z/HVnC5BAL2fbTRf9uf6A9yON4wgnwDPk+w4CeFyBvU1H5jz4Pb5
         tZhAXQPR3Dt2J0funla8rVoSykgyRVBak8zXP7StdfbsElx6VetMyRTSAHMgN6jQpqsV
         fOcw==
X-Gm-Message-State: AOJu0Yym+anF3FvtpDqTXP5wsp67zb26bhgvbfIUGvGQU6g1FGN3UD+x
	Ceub9ujZyuLwrSHlq7/6xjnY7m2KbRlg0duGlyAP2JGu0MajMhRB52+Frn/WBwk=
X-Google-Smtp-Source: AGHT+IHw5aYhrzOVfBPOW91zy+SthZP3ew1+Tn14XYrgQ3epd/iyuyB1+lvEa7R7EoVZv/LzjMzZzQ==
X-Received: by 2002:a05:6512:10ce:b0:52e:93d1:57a6 with SMTP id 2adb3069b0e04-52e93d15965mr1642572e87.6.1719998587626;
        Wed, 03 Jul 2024 02:23:07 -0700 (PDT)
Date: Wed, 3 Jul 2024 11:23:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v5 for-4.19? 2/2] cmdline: "extra_guest_irqs" is
 inapplicable to PVH
Message-ID: <ZoUYej0joXn2-8r3@macbook.local>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
 <de22beee-bd51-4169-b84d-88f4b452473a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de22beee-bd51-4169-b84d-88f4b452473a@suse.com>

On Wed, Jul 03, 2024 at 10:45:41AM +0200, Jan Beulich wrote:
> PVH in particular has no (externally visible) notion of pIRQ-s. Mention
> that in the description of the respective command line option and have
> arch_hwdom_irqs() also reflect this (thus suppressing the log message
> there as well, as being pretty meaningless in this case anyway).
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

