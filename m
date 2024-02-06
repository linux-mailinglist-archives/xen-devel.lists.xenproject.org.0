Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24B84B3D3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676826.1053121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJtK-0000dm-5C; Tue, 06 Feb 2024 11:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676826.1053121; Tue, 06 Feb 2024 11:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJtK-0000b9-29; Tue, 06 Feb 2024 11:45:30 +0000
Received: by outflank-mailman (input) for mailman id 676826;
 Tue, 06 Feb 2024 11:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRx7=JP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXJtI-0000b3-RL
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:45:28 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380f825f-c4e5-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 12:45:26 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33934567777so559587f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:45:26 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y8-20020adff148000000b0033b40a3f92asm1922876wro.25.2024.02.06.03.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 03:45:25 -0800 (PST)
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
X-Inumbo-ID: 380f825f-c4e5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707219926; x=1707824726; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tka5qtyLrYE27vOZvMawkfiBkGIW5D3nt1DAHLzndpU=;
        b=Vi46zJC/LO3B3Orj1M8bKwqpQTspwdX/MCrKmH3QlZV5oZeDgVOvJtJfDA2XQq5hZv
         VB8GEd3ybbrOoFXwx16gLT7WFizNSKiCFBZ7H2whhg3vZouMv06yvS8nSVEZmvE5Ekbl
         ZCD32TWGkn8PHbOz9dRU7a0U7pmRUTWsIwySM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707219926; x=1707824726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tka5qtyLrYE27vOZvMawkfiBkGIW5D3nt1DAHLzndpU=;
        b=T9UpbcCeus1BlGmf793kfRxlFo3Zdhp/2bq7hYVqn+ufk2L7ZzVhSZ4wNXQBC4rG2d
         K9Kj0SZaEFGP7mJ0x86Zq2g5JiyBeA9XqVJB0RDIIBvhmmH4Ei78Kg/IUbBtTr71lcHG
         /7ndG3RQQ0vBRKoAgVShNFunhAHpIZ7KFpIvhaOqZzyBx76WfFUVAGOCgZtzXmLZhDdU
         E4RKSCkEhMl/839k4ZVcH7T8f8wSzV0SZjau6sFz54zWlg8j2+gkk71PxFeUBtvS0Vbx
         XUOcm+yW5D73kDYDRz3UiE0kWpcld4SMFyxZFJkuKwX7E46qhqiMAQxdeiXFMKRMnI87
         diWw==
X-Gm-Message-State: AOJu0YzrGJ5v+fQwAzbzO/stgJp/8j8th8xVHXa1O+yQJCaIXgzJ+6KJ
	5R2xmtPljAfVzZCNmBNNfAt4wnP++zLI40zZwxtQ8oZcSZzjILDwQy1KlLLNDqo=
X-Google-Smtp-Source: AGHT+IFKvVsfnNXDXHhgHwWadUcH1NTA60yZQO+vuApHBTFW3qvVaiNBBIo8N57FuQo+ftuit0uCDQ==
X-Received: by 2002:a5d:4c8f:0:b0:33b:4649:9943 with SMTP id z15-20020a5d4c8f000000b0033b46499943mr1248257wrs.52.1707219926226;
        Tue, 06 Feb 2024 03:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCViLwz0+EKonMwihsmyiI1usf71NwAnC05iY5C+w3hyTs3np5UcY0JleRRLVc8hzo/hHcWhMtK4/NaL
Date: Tue, 6 Feb 2024 11:45:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/4] block-common: Fix same_vm for no targets
Message-ID: <cd9e0194-5814-4735-bca4-df2577102c19@perard>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201183024.145424-2-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 01:30:21PM -0500, Jason Andryuk wrote:
> same_vm is broken when the two main domains do not have targets.  otvm
> and targetvm are both missing, which means they get set to -1 and then
> converted to empty strings:
> 
> ++10697+ local targetvm=-1
> ++10697+ local otvm=-1
> ++10697+ otvm=
> ++10697+ othervm=/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
> ++10697+ targetvm=
> ++10697+ local frontend_uuid=/vm/844dea4e-44f8-4e3e-8145-325132a31ca5
> 
> The final comparison returns true since the two empty strings match:
> 
> ++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o '' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = '' -o '' = '' ']'
> 
> Replace -1 with distinct strings indicating the lack of a value and
> remove the collescing to empty stings.  The strings themselves will no
> longer match, and that is correct.
> 
> ++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = 'No other target' -o 'No target' = 'No other target' ']'
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

