Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F17CA620
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617458.960048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLGs-0007B2-30; Mon, 16 Oct 2023 10:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617458.960048; Mon, 16 Oct 2023 10:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLGs-000792-0K; Mon, 16 Oct 2023 10:56:26 +0000
Received: by outflank-mailman (input) for mailman id 617458;
 Mon, 16 Oct 2023 10:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGmD=F6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qsLGr-0005Hj-9r
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:56:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a56fc2c1-6c12-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 12:56:23 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9bf0ac97fdeso250095266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 03:56:23 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 rp21-20020a170906d97500b0099315454e76sm3757622ejb.211.2023.10.16.03.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:56:22 -0700 (PDT)
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
X-Inumbo-ID: a56fc2c1-6c12-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697453783; x=1698058583; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxnWmjCdNtVhldW78ptIags+rtx35fkAKite8BkN9C8=;
        b=jxvPgLrbdcdGRjiUOfeT5SQoK9yykr6U5HNV3/1i++frTj0Zqf0pCWCiGRE4kTfvQT
         73dUwqjjUdevOnVGAg4tmXVWLMWQCnn2hElaCNDjRtpjO88N0DC50VDYgTxPT6ZM1vjb
         T/qzU4T6yA9PtvxAUAjaVdO2hltmQbkpb9BKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453783; x=1698058583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxnWmjCdNtVhldW78ptIags+rtx35fkAKite8BkN9C8=;
        b=QSL7iTweL0nod4XGmfEUJOy4a/9Hl/PQLZQucqx66Cp+BeWc1BHBpcrAokEWLgWDhE
         CstQVToezgXEYyN1U1JuobArAItgajEmsp74S/h8P9EqH6l5gEpTYqp1+ZHFtaF9YQyo
         uf8JOV0XL0ry4apYbJ0F5+RDCayRlUFC3jPvXkPz8adaBjfcVFWnO87rboNuFRyN5Vpv
         6MgAOFcOGNhkRwTQV2dM/V9bdACnebLInJ5yxsRz2F0dOnYIWmMYjYW/I/ruGK+wtEBj
         9f/8dYBSao09BKme8zCGgMRcPQMg7v41bQPTZDDo/GgCrz9VeELM7a0qhAW4QgSQ0aC1
         1AuQ==
X-Gm-Message-State: AOJu0YwlFJzF3gCHdK/e9b43oXlGu4nUS6atVERruSnyaJxSU+mPynFs
	LeEpPHWvqC9jLLHfMMBBjnFqUg==
X-Google-Smtp-Source: AGHT+IGuPToY1eDv2ytZhdWE1BQMyzpmeZWdYmS9cRX/bhrsFBS/c0M0vyg+UMOWdnZbyx8PidxlYg==
X-Received: by 2002:a17:906:3194:b0:9a1:c370:1af2 with SMTP id 20-20020a170906319400b009a1c3701af2mr26288134ejy.3.1697453783211;
        Mon, 16 Oct 2023 03:56:23 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:56:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH for-4.18 4/5] xenalyze: Fix interrupt EIP reporting
Message-ID: <45e93a2a-df35-40e0-91fd-86e5787e7556@perard>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
 <20231009125137.1329146-5-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009125137.1329146-5-george.dunlap@cloud.com>

On Mon, Oct 09, 2023 at 01:51:36PM +0100, George Dunlap wrote:
> EIP lists are generalized across several use cases.  For many of them,
> it make sense to have a cycle per sample; but not really for interrupt
> EIP lists.  For this reason, it normally just passes 0 as for the tsc
> value, which will in turn down at the bottom of update_cycles(),
> update only the summary.event_count, but nothing else.
> 
> The dump_eip() function attempted to handle this by calling the generic
> cycle print handler if the summary contained *any* cycles, and by collecting
> and printing its own stats, based solely on counts, if not.
> 
> Unfortunately, it used the wrong element for this: it collected the
> total from samples.count rather samples.event_count; in the case that
> there are no cycles, this will always be zero.  It then divided by
> this zero value.  This results in output that looked like this:
> 
> ```
>   ffff89d29656                                             :        0  -nan%
>   ffff89d298b6                                             :        0  -nan%
>   ffff89d298c0                                             :        0  -nan%
> ```
> 
> It's better than nothing, but a lot less informative than one would
> like.
> 
> Use event_count rather than count for collecting the total, and the
> reporting when there are no cycles in the summary information.  This results
> in output that looks like this:
> 
> ```
>    ffff89d29656                                             :        2  1.21%
>    ffff89d298b6                                             :        1  0.61%
>    ffff89d298c0                                             :        1  0.61%
> ```
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

