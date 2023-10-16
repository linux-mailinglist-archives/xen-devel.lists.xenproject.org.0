Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891367CA616
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617447.960017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLFi-0005NF-AD; Mon, 16 Oct 2023 10:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617447.960017; Mon, 16 Oct 2023 10:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLFi-0005KZ-7h; Mon, 16 Oct 2023 10:55:14 +0000
Received: by outflank-mailman (input) for mailman id 617447;
 Mon, 16 Oct 2023 10:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGmD=F6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qsLFg-0005Hj-I7
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:55:12 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a3a732-6c12-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 12:55:08 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so3960285f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 03:55:08 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 az42-20020a05600c602a00b004063ea92492sm6798343wmb.22.2023.10.16.03.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:55:07 -0700 (PDT)
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
X-Inumbo-ID: 78a3a732-6c12-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697453708; x=1698058508; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G56FaGrBt6sEjzBaqQjaDnRDusqhuybJqy4mp0AnWgo=;
        b=kp+vXtBMMvn+d3JenZC5+f6P4P7XsdFGSut6bv9FN+CiItYB/aTuMphOZInLE8osDj
         5S5kp5aEU0uVBrXwxaNC1VTx9b623tPHZPpmcSFgND3Sev3NNAhgYUlNlNitgB01BBWm
         QTPjAqvEITRntw5b2gs8dvFvQgjQdh3M86kQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453708; x=1698058508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G56FaGrBt6sEjzBaqQjaDnRDusqhuybJqy4mp0AnWgo=;
        b=TYn3FDDISuaeKtKO+GblIqZkizl80stUArGwFvIbNLOlEFwI1XHeodJq1MbwDEJXyG
         uR6kSzYFLgploNldeAyDopdzdIcAeWs55HASC623KHkTjft7kLn4Yb6tgWiFpdpEPJOu
         mY7NRqK2aegOTuClGBrPa7RLmFSAViX5Mn74uvUviNSbzwuay9QsucULEUY3sgYrFWK/
         loe0NhlVmgdBuMCk2jH/Ru4pKd+9UZn23ylzuABQPrYb4bDcLunXt2J+RuGKeeficOsc
         9RRqqyHV63vCYOYQ2CgUa99HJYQ4U+pj/bhwcQkDMVbR3ba+E7TM1pOdlG/AHHzPF/rW
         GzVw==
X-Gm-Message-State: AOJu0Yx+boWq6J2KItQVvuMTSlex7Qc3gnKMcSjWoyUNTqwkttnSoXYa
	vzuOboP/K3YNdvlb7f3hW35B9Q==
X-Google-Smtp-Source: AGHT+IG6EpMe5yuCesxYer9ff2fxXPCSh5pMJNlzecDqB9sZyuGA63lk5wyDuaGji15oFCcW8RmOWg==
X-Received: by 2002:a5d:6809:0:b0:32d:ba78:2b31 with SMTP id w9-20020a5d6809000000b0032dba782b31mr907899wru.55.1697453708043;
        Mon, 16 Oct 2023 03:55:08 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:55:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH for-4.18 1/5] xenalyze: Only accumulate data from one
 vmexit without a handler
Message-ID: <996cf0fb-d19f-48b4-ac4a-c50221890e0f@perard>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
 <20231009125137.1329146-2-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009125137.1329146-2-george.dunlap@cloud.com>

On Mon, Oct 09, 2023 at 01:51:33PM +0100, George Dunlap wrote:
> If a vmentry/exit arc unexpectedly doesn't have a handler, we throw an
> error, and then log the information under HVM event 0; thus those
> particular traces within the vmexit reason will have stats gathered,
> and will show up with "(no handler)".  This is useful in the event
> that there are unusual paths through the hypervisor which don't have
> trace points.
> 
> However, if there are more than one of these, then although we detect and warn
> that this is happening, we subsequently continue to stuff data about all exits
> into that one exit, even though we only show it in one place.
> 
> Instead, refator things to only allow a single exit reason to be
> accumulated into any given event.
> 
> Also put a comment explaining what's going on, and how to fix it.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

