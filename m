Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9F8AD2DE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 18:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710148.1109224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryx0W-0008OS-6V; Mon, 22 Apr 2024 16:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710148.1109224; Mon, 22 Apr 2024 16:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryx0W-0008Mh-3R; Mon, 22 Apr 2024 16:59:08 +0000
Received: by outflank-mailman (input) for mailman id 710148;
 Mon, 22 Apr 2024 16:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryx0U-0008Mb-UD
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:59:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a03e93eb-00c9-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 18:59:05 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so3498742f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:59:05 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe2c9000000b00349a5b8eba6sm12540024wrj.34.2024.04.22.09.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:59:04 -0700 (PDT)
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
X-Inumbo-ID: a03e93eb-00c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713805144; x=1714409944; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZpSYXaymXGU1VgqoPZ57Jvh+oZ6HevGn0RRQgFmERo=;
        b=XNY4B/U0TkSGXWTwlMZdStCiTi02OA1lBQvNFahTm/5+9NnhViJXi9or+xyWzGwxLw
         jH1qQy/qlZkWdvbFk8L1yP6DywejRKrItI56ZgC20gDrGzvkJvP8zg5OwZsMm0FLt4Np
         ljRUl+HjvBlaOjl7vL4vY+Ya86eSzAxVyfbjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805144; x=1714409944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZpSYXaymXGU1VgqoPZ57Jvh+oZ6HevGn0RRQgFmERo=;
        b=DNhxxvCJCeAgERje0lObxdSJYCxCY8qISujXW6UkgYcyD+va9jx1PD/hOMkhy9fy27
         YdaBYSRoQM4nj4eHOZOBkkeljNspUaO2RCH7oLy8yHpfjT5r3XRPYLD7TfhLt+tKNDnV
         p8mSKmAz3w/y1n9360dr3+srKh5EsSv+68gRd8fYva6NEYRtegWkcMp70umWhb2XEe90
         ovPcMHe1QaOW6MhxLPxORwIClM+NC5v30pOPip4I+NgrNerr+gWa5PDA/u3tQNvO5H5o
         CWvMYtdtQebj2yZRGhy7l3xRUpgxUB4FunhFKHS7rJBtrjsoXN90gTeuibpTzzd87I03
         8byw==
X-Gm-Message-State: AOJu0YySXz2MCGxcmDboIY2ksH35W7HJrc0Le9af+SBfYY9LSPVVylTh
	dXO8duSRrwOR/MiEphIXoEYyyU7fGWMTCLWjSK+0UO+diRfdNldoF82GqO2virHh62vJhajs5tM
	Z
X-Google-Smtp-Source: AGHT+IE2xU8tYcqadwoIUI7nweTMyMgseKR/dxEvE6fk4B+RrFLIUVmuDKLslwqLB8DOmDYxjWutjw==
X-Received: by 2002:a5d:598a:0:b0:34b:8bf:6019 with SMTP id n10-20020a5d598a000000b0034b08bf6019mr3114625wri.70.1713805144484;
        Mon, 22 Apr 2024 09:59:04 -0700 (PDT)
Date: Mon, 22 Apr 2024 17:59:03 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v3 1/4] tools/misc: xenwatchdogd: add parse_secs()
Message-ID: <3417060b-d2f6-42b7-912f-6f02f92ab7cf@perard>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
 <20240411182023.56309-2-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411182023.56309-2-leigh@solinno.co.uk>

On Thu, Apr 11, 2024 at 07:20:20PM +0100, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Create a new parse_secs() function to parse the timeout and sleep
> parameters. This ensures that non-numeric parameters are not
> accidentally treated as numbers.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

