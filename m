Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19584A0FF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 18:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676467.1052602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2uo-0006dC-Hq; Mon, 05 Feb 2024 17:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676467.1052602; Mon, 05 Feb 2024 17:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2uo-0006ai-Dw; Mon, 05 Feb 2024 17:37:54 +0000
Received: by outflank-mailman (input) for mailman id 676467;
 Mon, 05 Feb 2024 17:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Hmw=JO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rX2un-0006ac-SM
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 17:37:53 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 493ca140-c44d-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 18:37:51 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5608f7fd83cso603052a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 09:37:51 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o19-20020a170906359300b00a376d1a18adsm62496ejb.98.2024.02.05.09.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:37:50 -0800 (PST)
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
X-Inumbo-ID: 493ca140-c44d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707154671; x=1707759471; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kFsiMNkbE9GmL1Qe11snaulIwa7azZb2uW2FDnu9gZ8=;
        b=QuY8JwUzIGJ7S8SCetAyMIAQHLHb29qNXem6ZGFMEOboJqqi5C8rdYCWGxcQzdlcwq
         2Mi01yG/Ta835Pn45JLAKNefhJgEw/8WO6ZNSd0XP/6m9qwuc5RNuwTVMtuOB/qoAres
         DzGHCWiRW0UbuoQlRt0PM3jG+tX6WIP/0jW0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154671; x=1707759471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFsiMNkbE9GmL1Qe11snaulIwa7azZb2uW2FDnu9gZ8=;
        b=Ph/wwR4C1+XsoTeZAadt3U+yo07JWN30sMLLNhDqJEyeQr6Nak9IcHkMOzEjw2137h
         mCbj9p9C18eZEDDVZxFsR6/14xjcfoLwokZ2JY495uBijtjRm6QBCTpHvJzeNZWG2bS2
         MUqzV7Uwfg6K5lcBwfijZD2y/bUA5SnuO6SqrDsbtmpB7r8G/HOz+f9tNsyqdFMzcLfo
         6KEQnc8mUh64o0vSfLhp7mRlUqVUJGgVeBrmdkUnFwxhn2hP8bQzW5JatW2UVnUyMK2x
         91NSA8uAXkDEw4nBD8ypk5iQCAC9knPQYRkjIW+r83dgiHwKyN+obXfgWQGAUqjUAdKU
         huAg==
X-Gm-Message-State: AOJu0YxTMUZO5ik9V+Yn7XOWaBaHbAr9xwRhJ0VDNgQXGXNrwxPvPQas
	P/6tfkTYeOGNemIt2eeMh8Wu7x/vHYBHLI0M5F7N+gqsB79PivdNSBl9nsENXlw=
X-Google-Smtp-Source: AGHT+IFQkATHx3wU3GO6x6I7cYW+bTHTWRzQNg5JAhZQ+qf7hfiGYVnvg+NVpT1sGDWVHQaEjIbmMQ==
X-Received: by 2002:a17:906:b2d1:b0:a37:249d:2799 with SMTP id cf17-20020a170906b2d100b00a37249d2799mr84762ejb.62.1707154671168;
        Mon, 05 Feb 2024 09:37:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWr3vZw/xu3JImqFdXsrh5AwoaA55HU9lgkMTJAi02T9ntBeN4YLSEJJ5rQ6cze1ouJc5hShOTXYslN
Date: Mon, 5 Feb 2024 17:37:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: zithro / Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xentop: fix sorting bug for some columns
Message-ID: <e8e56c7f-4181-4ad0-8eab-8369dccf9f28@perard>
References: <1bb93dbf9d09091fa36a3966ad8ffbccdb742166.1707041980.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bb93dbf9d09091fa36a3966ad8ffbccdb742166.1707041980.git.slack@rabbit.lu>

On Sun, Feb 04, 2024 at 11:19:40AM +0100, zithro / Cyril Rébert wrote:
> From: Cyril Rébert <slack@rabbit.lu>
> 
> Sort doesn't work on columns VBD_OO, VBD_RD, VBD_WR and VBD_RSECT.
> Fix by adjusting variables names in compare functions.
> Bug fix only. No functional change.
> 
> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>

Looks like this wants:
Fixes: 91c3e3dc91d6 ("tools/xentop: Display '-' when stats are not available.")

Otherwise, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

