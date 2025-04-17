Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527CDA91E96
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 15:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957740.1350784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PZy-0001Pw-1T; Thu, 17 Apr 2025 13:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957740.1350784; Thu, 17 Apr 2025 13:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PZx-0001OT-Uz; Thu, 17 Apr 2025 13:46:57 +0000
Received: by outflank-mailman (input) for mailman id 957740;
 Thu, 17 Apr 2025 13:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5PZw-0001ON-36
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 13:46:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b775c06-1b92-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 15:46:53 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so138676766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 06:46:53 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb3d35b896sm296504366b.177.2025.04.17.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 06:46:52 -0700 (PDT)
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
X-Inumbo-ID: 6b775c06-1b92-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744897613; x=1745502413; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrRpFaBO72ob9ayFaxMlP8SrHHAZOx4p8j1El+R8G1o=;
        b=e7QpINDDsOwcGuVsmeit7AdXprA/iFRoB6fBjfxshyrH4X8K7oxMd4SjZuP4q1FwOm
         IVZioTYpHXIVMvqfAVZJT6LLn1egr/OGOZJpftXUjsPgXu7uTLexP79OgNx+JBxZwjXb
         6+kEQXBbYKJ7gUPs6g43QwfTRYGIOwHSZ5S88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897613; x=1745502413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrRpFaBO72ob9ayFaxMlP8SrHHAZOx4p8j1El+R8G1o=;
        b=K934a8GAmJEv2AC0uGx/qw1wIj9Vf2MFGiqxcKb5s26NbxZAwt0JguevzI+e2HY2uy
         w/Tr581dZrXUjovMNfDZcxlxenwjY+aU+F8C8HT8PgdzAfOwewexZiU8yxwkVQ6TRIbO
         LYgueA9xFFbK6lY7hekHt1lnS26Wtt5ZLle6X0tf1Yua/FueMEjIulq1JY2styAFRnQz
         IbsToiXIYMCBe1bzmZ0o6i1UjTRanQD1GEmsqLBft11w6FTHzGe6ytcxE1ynDyZcnNPI
         cKU6BNmFmpOK9W18aNaPmbnsEOyRcADZVhmBXZAitai64laHi1SxPEHuZAMxWNhP/vG8
         znmQ==
X-Gm-Message-State: AOJu0Ywp4FJ5KVWvivHmpxRVFMtLGXxJxtG/o0iy8mtAvsHv4uUU5uNn
	G8M7LZM35n2wOvPujrNNPX1715XJPmrcg7sNKuEDO3D6PjYOoV2ZS9mIite8UetB8aDslSNYLvZ
	2
X-Gm-Gg: ASbGncuLCBoAd6YxpbQi9XBpT7zWEqoj24DAeIQe7ko9JryjqFOxOkL2tsINjtOWguB
	Z3YffZ6AzLcEBtfS2T6eOcAFUYKiX8UxH4ivWq3mNMbl+r20J6ARGUzBVr8qUybJ2Rvy5SE44Y0
	6CUeUWs74CO/O2Q9kkiPvVTDKjDlj88Gf6y94zrZrvuzTamMSbFNU5RI+W0erR0uWnJXHY/Z3Fy
	qwOSBU9XumemUxhtqozpg0hWlksSuqSqJ/zKLkTx1EHal5OJY0SW8Xf4cLeQInBBjq+yND9+TQD
	LbVH3hfxg1fqzlvMV48pLr5uGOuxCbRhuFlzrRExeI6YSw==
X-Google-Smtp-Source: AGHT+IE6hoZMK3+e3prRN7LX/h3ebgZp4I4DWuYhx5CvzhTH/wdjuPTYoQSQ9I70VBtShacf2q0D9Q==
X-Received: by 2002:a17:906:6a07:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acb5a0a032dmr307579166b.10.1744897612561;
        Thu, 17 Apr 2025 06:46:52 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:46:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/msix: use host msix table address
Message-ID: <aAEGS_u_tWmuaVi4@macbook.lan>
References: <20250415180200.436578-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415180200.436578-1-stewart.hildebrand@amd.com>

On Tue, Apr 15, 2025 at 02:01:56PM -0400, Stewart Hildebrand wrote:
> Introduce vmsix_table_host_{addr,base} returning the host physical MSI-X
> table address and base. Use them in update_entry() and get_table().
> 
> Remove stale comment.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> I considered adding this tag:
> Fixes: 52ebde3cfae2 ("vpci/header: program p2m with guest BAR view")
> but I left it out since upstream currently only supports identity-mapped
> vPCI.

Hm, not sure.  As you say non-identity mapped vPCI usage is not
supported, so I wouldn't insist in backporting the patch.

Thanks, Roger.

