Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA76CA4C067
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 13:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900222.1308137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp4xk-0007wu-R6; Mon, 03 Mar 2025 12:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900222.1308137; Mon, 03 Mar 2025 12:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp4xk-0007ud-OV; Mon, 03 Mar 2025 12:32:00 +0000
Received: by outflank-mailman (input) for mailman id 900222;
 Mon, 03 Mar 2025 12:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp4xj-0007uV-G1
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 12:31:59 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf86eba-f82b-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 13:31:54 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2235908a30aso58521515ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 04:31:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-aee7dec415asm8148550a12.54.2025.03.03.04.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:31:52 -0800 (PST)
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
X-Inumbo-ID: 7cf86eba-f82b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741005113; x=1741609913; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Daj0dE4NslwzhQHXW+A3kG0p9KFFQL0eVUho/vVGfHA=;
        b=FUO2aCK6Ykcqzn6f+FyN0atFwxDRRhIndnr0nPt+ZiwBTiA6PBQJhyB4iX05lHUvKJ
         NZeC83f7U9l0HIRy54lz4KFR/Xc8Hirvgb91QLcsbX+Tk3iq2KFjanM6HES6o3Q8xVI6
         s9YTPJK1Fglp7eXAkgY8fmrOfTqUnMuh7VzhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741005113; x=1741609913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Daj0dE4NslwzhQHXW+A3kG0p9KFFQL0eVUho/vVGfHA=;
        b=JBT602jqQ1Psx99PrJAFYEMrEu36UfXPc7PhrAl3DK/YM61Hy1mvtwNGAVvZ3EyC36
         94wpT+aDClpl6ooLqbnMjjeU8oH4e0RH8HcfWY5zpP0DmkB/jubwrQgs8IUXUWkI8fpj
         Nhx9YTbDLDO8p3qIXQEsMdOHzQV2B2ajZ3Q4QJOGg5le/RFya6dySJJs63o4WoJ5Sqzi
         ac1VutGcVMZUw3s53UgeTbUfMgSl0BSwKjV60RGgOgM5xLCbjZSe5/rTjaOGVgnEiW4S
         UARLSObwm6W8HLeb/XF1ORs2iWYd4GWvG2F4a9Ppldxstn5MPFbnd39Bdep7gMateUS7
         8ypw==
X-Gm-Message-State: AOJu0YzSaWSYqQsu/DyZkA3ze13G8cPB1Hf9jUhoeP7EI8PkZCCkL1ct
	2kpINmXg7w8H7QtyCplQfjVq9k/+YnwmQY2PYxUvexrcxsjkdP6KLguKwUEuNR8=
X-Gm-Gg: ASbGnctGXcqmmpFOFzDcJHSMmgnOOSjcfYW7KlmluieVroc8xcfeee/X8KQzE2T4T91
	aXPVeox7s9Gc+NjVUusnYfz+PiFGEbFAZyKInh2L3hfbUd7UfeGoVDnwJuv8PvPmK3+W1Uud/dM
	PlA9gYqBxbNl5BqJhgpZ8SzTakaNOhZgCyg7t61tKmj9RlsZXq25JXXXYeM/c4Zs4w7e/TOyPbT
	qAoQR5W3hDsmvU+cclagwwhjZI7fwnNqyztPNU6UaYIVnf5dKKD5ZNEUsOZ881Inzrk1FamN3H/
	IXHvM6sYAsXj3qUSBuNyXfYJxPP38FtKunLa26b1Uwu4R8bBjiePXW4=
X-Google-Smtp-Source: AGHT+IEcDwdH8vLK85pi9ZEl5PBH6IkPicfEJNCxQeanV3aq8D1maFiGqIvOdJUFTwjsjKFiTFXqeQ==
X-Received: by 2002:a05:6a20:72a1:b0:1f0:ea9e:bd6b with SMTP id adf61e73a8af0-1f2f4d222c5mr19065566637.20.1741005112964;
        Mon, 03 Mar 2025 04:31:52 -0800 (PST)
Date: Mon, 3 Mar 2025 13:31:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/asm: Remove semicolon from LOCK prefix
Message-ID: <Z8WhMupc003sQI69@macbook.local>
References: <20250228221213.2033895-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228221213.2033895-1-andrew.cooper3@citrix.com>

On Fri, Feb 28, 2025 at 10:12:13PM +0000, Andrew Cooper wrote:
> Most of Xen's LOCK prefixes are already without semicolon, but we have a few
> still remaining in the tree.
> 
> As noted in the Linux patch, this adversly affects size/inlining decisions,
> and prevents the assembler from diagnosing some classes of error.
> 
> No functional change.
> 
> Link: https://lore.kernel.org/lkml/20250228085149.2478245-1-ubizjak@gmail.com/
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

