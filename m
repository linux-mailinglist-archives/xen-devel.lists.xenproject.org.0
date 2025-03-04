Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39644A4D949
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 10:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900868.1308830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpOwS-0004Y4-5m; Tue, 04 Mar 2025 09:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900868.1308830; Tue, 04 Mar 2025 09:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpOwS-0004W0-2N; Tue, 04 Mar 2025 09:52:00 +0000
Received: by outflank-mailman (input) for mailman id 900868;
 Tue, 04 Mar 2025 09:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpOwQ-0004Vu-Pr
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 09:51:58 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f3fa59e-f8de-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 10:51:57 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2235189adaeso87601455ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 01:51:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-223504dc4a4sm91399565ad.169.2025.03.04.01.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 01:51:55 -0800 (PST)
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
X-Inumbo-ID: 4f3fa59e-f8de-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741081916; x=1741686716; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTMGfbrSrCedw7npcl9P915wIbBLSeNbLZzgVIZrRHQ=;
        b=jMJgtcag6TxgOExRLuPAlJ82j+x5KRsLpKdy0Jno7DxWobXmuNrBh0e4lK6PNNnoZz
         xes7dGG6Gr/D8lj3QBcLZmSD3TqPr/GbTg3R69KMxJZeqRTCRwc2pi/jhsI6mT+587X6
         rdp1bWiVBh1O3qbPdPyju5Zf0sHGIfhKTWdQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741081916; x=1741686716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTMGfbrSrCedw7npcl9P915wIbBLSeNbLZzgVIZrRHQ=;
        b=IEyQT+HwqzS6yMBH80rwFrKvUAqIdJF/smRt4kn8kO2bL8RS2oREU5xtfsH4Ut7khl
         DMwd2KGlQhPiSO+D45u9dxrsrMB00sChu+8c1UCzxE7qAF4XCe4qrMrZzIVnFzDiDQ82
         lkuTpSNRZA7ptIRMVwzwRQHt8M9MT+JoYI+X1bky26RuGzqBs5PSm2WNKj6gVJIk+uSO
         ItDmViG18Cfz28trxk+5qtAUzzN0RZt5vCoxabUIt1XNOYIi9lRI6o9vvGfdQl30pr8n
         w9sQNi8s5hwo1aXmraL63AZP56auNg8DmTTJMEpAzpcxmup99idxkHhVJpew0NxeCJFV
         p50w==
X-Gm-Message-State: AOJu0Yye9ssD3xdMWg/rg6pO1uXYFdEWMMjMWXkAmXPzbGJebcZrjc1S
	SHMtOO+UVotCH8zw48Z50Q5hRpKc29Brr1XqdLBHC/jpilbj/J1Vyv/nM/uPmBY=
X-Gm-Gg: ASbGnctvp0IKNlpcqqUUhfZcbzP25P+rrGcsAI2jolVeV9CNryoQ3TdwpEu0k0/KJ8k
	Yn7y7nAc4Q6DWGaGHK4salRrFSQffT3jDR1aJGYbLgBzhuCEDM8vR9YdsFMyoiDsQG/p11nqqAV
	AyNpdhYgt47biCTvWYvkwpQD5AkdJPaIojITpvIfEG1eXs2Mq4QLwj687lLrzMyA9Q/qgOotvvK
	O9oloaRFow85XgFpqfb6iHfn/Ni+CyVB0f7zmkr1Iczclh+679pj2+0Yc7ZSoziu02EiGeYCleQ
	VbiyuuQ0tndmOJTPt7w3tUZ7Fmdgz5wE/Tus/QjEp4E9K63Kkw==
X-Google-Smtp-Source: AGHT+IEUMouIBwbOVTY0puVb64fwFgiHcpd7dyyP7kpb7g9tBHS+/YErcyaBM+rLwhSAcL/YXcFUaA==
X-Received: by 2002:a17:902:d4c3:b0:21f:40de:ae4e with SMTP id d9443c01a7336-223d91380e4mr38243065ad.9.1741081916165;
        Tue, 04 Mar 2025 01:51:56 -0800 (PST)
Date: Tue, 4 Mar 2025 10:51:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] IOMMU/VT-d: Fix comment
Message-ID: <Z8bNNgoqgQt3ytrm@macbook.local>
References: <20250303221438.2495688-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303221438.2495688-1-andrew.cooper3@citrix.com>

On Mon, Mar 03, 2025 at 10:14:38PM +0000, Andrew Cooper wrote:
> "find upstream bridge" is surprisingly jarring in context, considering that's
> the name of the function who's return value we're testing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

