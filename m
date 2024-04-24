Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200C8B0E5A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 17:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711519.1111521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzeZK-0000s4-31; Wed, 24 Apr 2024 15:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711519.1111521; Wed, 24 Apr 2024 15:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzeZK-0000pM-0E; Wed, 24 Apr 2024 15:29:58 +0000
Received: by outflank-mailman (input) for mailman id 711519;
 Wed, 24 Apr 2024 15:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jw4=L5=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rzeZJ-0000pE-7u
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 15:29:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 806460a1-024f-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 17:29:55 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so6571924a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 08:29:55 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 be12-20020a0564021a2c00b0056bf7f92346sm7975386edb.50.2024.04.24.08.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 08:29:54 -0700 (PDT)
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
X-Inumbo-ID: 806460a1-024f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713972595; x=1714577395; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWRQWjxyOeMb8ROrg+DPcu5pJ+mVAusmtOHZ/A8jQfY=;
        b=etyp7KXolUGHx2/QHDNbqsE0bBH4SfyunSoWzYtVsdR9/2JXOTWoFevT/cOkOueLc1
         4CC0navi+gBl4qnropyOcosvgozNCWb5CCU0baU9OBaYy774pMDPZM1LULUz3LqlIA/8
         k1ICtOpc6EpmSPdqEAg8WTsZTy9YuZIRMe9WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972595; x=1714577395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWRQWjxyOeMb8ROrg+DPcu5pJ+mVAusmtOHZ/A8jQfY=;
        b=OoZutslFKRBJ9itgaoH1Y7TMyYUsppYeE8E6wt1ZCGA+0WOoYezB4Z/5RFTWR+BDm3
         6EyjkdI4lwQ8oGEymoxCJPeOOxWTWKxM899EirxFnLUuAoym7Cia4dHz4QIxeSQ3C63e
         QdZJx10hPL+oIrq113BtGF1PLLNltWIbk/2bunQYlwk6Ck9WDFHlh3REbVcxqWznIRgv
         yv9GQYvPEoLzdwZL/YldNqRabEX8t9UaJU3VOLCRWcat70JhWmeSypamIvfYoP0jPWV2
         Jh+riOv8MDx4ro7Ycf/xc8kds//joobICWpOX/m+j/QS5Lc0YdFT4kX2fCqDJgySid6g
         d2+g==
X-Gm-Message-State: AOJu0YwSMD4ALyiLPGxvIWNVSnbJ3KYYogNYQ+Vm53pIM+gy4WMq1FZO
	IMc9Sdz40WU0yzOXS99fRL3z8Vegq9+ESG5BAR03dGKJr67ZngK/4Odj3/H1BXc=
X-Google-Smtp-Source: AGHT+IFazTlCEx8Xhsyv07aN0Qn2xmKWO/UEFKUqSlIOpPXmIKSFCYY1EPGXw0Y/NAI7hgIXrLzwOg==
X-Received: by 2002:a50:9e06:0:b0:570:5e7d:95ec with SMTP id z6-20020a509e06000000b005705e7d95ecmr2187104ede.6.1713972594751;
        Wed, 24 Apr 2024 08:29:54 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:29:53 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v4 1/4] xen-livepatch: fix parameter name parsing
Message-ID: <a72678d3-3aab-49b6-b0d7-6f00328b7e7f@perard>
References: <20240424081957.34326-1-roger.pau@citrix.com>
 <20240424081957.34326-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424081957.34326-2-roger.pau@citrix.com>

On Wed, Apr 24, 2024 at 10:19:54AM +0200, Roger Pau Monne wrote:
> It's incorrect to restrict strncmp to the length of the command line input
> parameter, as then a user passing a rune like:
> 
> % xen-livepatch up foo.livepatch
> 
> Would match against the "upload" command, because the string comparison has
> been truncated to the length of the input argument.  Use strcmp instead which
> doesn't truncate.  Otherwise in order to keep using strncmp we would need to
> also check strings are of the same length before doing the comparison.
> 
> Fixes: 05bb8afedede ('xen-xsplice: Tool to manipulate xsplice payloads')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

