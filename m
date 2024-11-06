Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B209BE5CA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830773.1245849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ePD-00075v-83; Wed, 06 Nov 2024 11:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830773.1245849; Wed, 06 Nov 2024 11:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ePD-00072l-5E; Wed, 06 Nov 2024 11:40:59 +0000
Received: by outflank-mailman (input) for mailman id 830773;
 Wed, 06 Nov 2024 11:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8ePB-00072d-UN
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:40:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb7a1190-9c33-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:40:54 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9eaaab29bcso451413066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:40:54 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb1813123sm265338366b.174.2024.11.06.03.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:40:53 -0800 (PST)
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
X-Inumbo-ID: fb7a1190-9c33-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiN2ExMTkwLTljMzMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkzMjU0Ljk3MzA4Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730893254; x=1731498054; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oji2e5eMKDC/XCwL3Ctgx9D3iv+s85S/x+qgXSdfdyk=;
        b=OobGcLI0Gk1AnneajHIXT0pC4PYfeZsfsJQh3t9Cs156Uz5SYkmaAW2rNtjJJsS49d
         RnKT3dQ1O+FBiqUQZrnBokBlmvLG5kG/42AHCa+8h6P9RUR4tylppuZ+o6nuREk/4AHi
         J1wALOu4zY5ugI7ltUH00Qz7IGzSHDFnstJLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893254; x=1731498054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oji2e5eMKDC/XCwL3Ctgx9D3iv+s85S/x+qgXSdfdyk=;
        b=BLi+ADedEQ/1c8f05E1tJYmULITbo58xPL5gWS4lyTQ4TylrTrh8LdqIbUYQbBiUiM
         BCm5KQNuuUbhbWbvz695MN9lmQRgf9KarnSoMPGUCGU8nxARPaiMiOjRJXb7pAISqsGU
         O3er+sm7+ebArZB4KAVq1c0dzqw2hUYPERlkZ8bf8470CM6FYs9qzY2B13mWLgOe3A1P
         9w93SS/iLA7np10WtGu5g5CqiY3Bf8Qvv/+Yeomrs0QnN+OyUp8baWQ3+mGc+5DZLDyJ
         Pkd6fkJHi8q9P+hNAyH9a+DY2YZo70mMEgNRxtFIgPC4Zcu+a/P4PmfucI+EirMEwoKN
         A5Sg==
X-Gm-Message-State: AOJu0Ywe0CfYkpmg1/z65A3FBxmPavE44O0t6OQBds+91a63wip+EkyV
	8Qtqz4N4++9HVpEudGqjehK1JlBoe3Qt1GX7HHGTYd3oIqROmm9VSlzTCdMbeLM=
X-Google-Smtp-Source: AGHT+IGtCSivtNDiJ08ILrGcru9E7Ojt/ZadgdK5W0UEK8/TaiItlxd4A0vy5I7jC7MyKS7Ymi2/4A==
X-Received: by 2002:a17:906:7f0e:b0:a9e:b093:2422 with SMTP id a640c23a62f3a-a9eb093307emr517514166b.48.1730893254341;
        Wed, 06 Nov 2024 03:40:54 -0800 (PST)
Date: Wed, 6 Nov 2024 12:40:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Fix package installation for Coverity run
Message-ID: <ZytVxKOtQfR7DWeX@macbook>
References: <20241105204603.3412857-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105204603.3412857-1-andrew.cooper3@citrix.com>

On Tue, Nov 05, 2024 at 08:46:03PM +0000, Andrew Cooper wrote:
> Something has changed recently in the Github Actions environment and the
> golang metapacakge resolves to something that no longer exists:
> 
>   https://github.com/xen-project/xen/actions/runs/11539340171/job/32120834909
> 
> Update metadata before installing, which fixes things.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Seems like the current Ubuntu image has a stale apt cache?  It's good
practice to update before we install anyway.

Thanks, Roger.

