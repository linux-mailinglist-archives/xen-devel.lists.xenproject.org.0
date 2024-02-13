Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC2852FB7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679864.1057611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrAI-0000gu-1u; Tue, 13 Feb 2024 11:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679864.1057611; Tue, 13 Feb 2024 11:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrAH-0000fO-VK; Tue, 13 Feb 2024 11:41:29 +0000
Received: by outflank-mailman (input) for mailman id 679864;
 Tue, 13 Feb 2024 11:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZrAG-0000fG-5w
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:41:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2726e06-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:41:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso566658f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:41:27 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a15-20020adffacf000000b0033b39cba5e4sm9296098wrs.116.2024.02.13.03.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:41:26 -0800 (PST)
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
X-Inumbo-ID: d2726e06-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707824487; x=1708429287; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQhla5REKvPeHXu4c0wBu7qVePgmPWZor8lCzIG6MU0=;
        b=IUtfs6zDiet98ej2bk51AYrgiGwX1IYoBJ5iBveCDpqeF0tFxnHgPxqeR4/OVE8noo
         +g/66vr71ziPDMrL+F58qIJIf+iLpDEuCJmv5f4Zu3iKRpddmuQsMOekyIsP5mhudc1i
         z5SKYtbc5RL6qAdH5grpVbKRpuwJjjY87Xwlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824487; x=1708429287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQhla5REKvPeHXu4c0wBu7qVePgmPWZor8lCzIG6MU0=;
        b=JM/doAnlrSREhyYf0YNwxJkd6fODR2Vbllwvh0C5f/qsnRzL6iIfLyRJ84kumwGclD
         L5K9H9GHB44ErR6ZpYOVdzwmMHtbye81hDPeiWP1USLWpSeLQTCd7idZdRh0iQdOI/kf
         ETvWhtayLVwfpWxMM19PkWbIZAtwsKmSAY5iiMwAUj2J0FHWaImfpvis60AI04XyfNho
         fCkqgjASqvbB1TyZhBoVs3Xv9LWQ3YLRTQ8bk9KQDsJfYKNhU5xUxIM1vFv82FWLWR9b
         1U/zBbRZuzG1VyBQp/2mPQ/cwwPSCkTwmIVwxSMJViGlHnDnnhlibQIjmoOBRIXh5lht
         PE0g==
X-Gm-Message-State: AOJu0YyRnoeh053gxMP37X4KR7Pt/f84IaTS5Lwvy6FTlIX/KQFvxYgm
	wZa44cTwSGf2U8koN1hnNa9yftQ7iEr0fVYGFEzXz7L3QE2CkIdzG7wCsBnbxXMEA7ZOP70irxk
	2
X-Google-Smtp-Source: AGHT+IGV3cIEfwQqvQVIastam2kN3OinMwDNNobqiijwCBlNaF3PoRMck2XUEJ/9Jwo6KwMn7/p6HA==
X-Received: by 2002:a5d:4b52:0:b0:33a:eec4:c0c6 with SMTP id w18-20020a5d4b52000000b0033aeec4c0c6mr5924287wrs.12.1707824486783;
        Tue, 13 Feb 2024 03:41:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3P/PvkkIUB75s0vD3f6OIrkC2jNbDYJf/cqYWZcadXCjyq4gNKdViNo7/zIqaqE8JTjYz8xXXLwZ3G1j7b102BAuvBG0AZi1FoShqH9+cFkoT4DcODIC0Chx+96K3lSzzZ233vnIo6MFLGaiBts394JhEePLCOHGv1OhYItIpjunIkf5OPnkNVf8rMYFuoEwnAqlw2FOKd/T7xWJjZr4EB+bJum6t3YYUI+jLgfZZaRv0nnd+HC2rvvy2he38UlvflNqwH183TUSi4ae18wagSsMi58RSq+Q8FKoc
Date: Tue, 13 Feb 2024 11:41:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/3] libxl: Stubdom cd-rom changing support
Message-ID: <e5df0cde-3855-45c3-9000-cf34baf28616@perard>
References: <20240201214004.238858-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201214004.238858-1-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 04:40:01PM -0500, Jason Andryuk wrote:
> Linux locks the cd-rom by default?  That means the QMP eject commands
> fail, but then Linux unlocks.  Re-running a second time works.  Windows
> doesn't do that.

Yes, looks like it. It would be possible to have libxl retry
automatically since Linux eject and unlock the cd-rom tray, then QEMU
does send an event via QMP about this, so libxl could retry after
receiving the event. Waiting for events is just not implemented in
libxl, but that something that could be done.

The event is, for example:
    'event': 'DEVICE_TRAY_MOVED', 'data': {'device': 'ide-5632', 'tray-open': True, 'id': 'ide-5632'}

Cheers,

-- 
Anthony PERARD

