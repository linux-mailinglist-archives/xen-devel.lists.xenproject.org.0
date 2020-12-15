Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E77A2DB160
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54476.94672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDC2-000482-6N; Tue, 15 Dec 2020 16:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54476.94672; Tue, 15 Dec 2020 16:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDC2-00047V-1A; Tue, 15 Dec 2020 16:28:54 +0000
Received: by outflank-mailman (input) for mailman id 54476;
 Tue, 15 Dec 2020 16:28:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpDC0-000475-H1
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:28:52 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37fc0100-5474-4e73-bfe1-b4af6e62d9c9;
 Tue, 15 Dec 2020 16:28:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n16so236732wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:28:51 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s133sm38197648wmf.38.2020.12.15.08.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:28:50 -0800 (PST)
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
X-Inumbo-ID: 37fc0100-5474-4e73-bfe1-b4af6e62d9c9
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KY5wz41Enh2tKod7R02tcFCNNgU7dvd2/e/Rsy9POQ4=;
        b=KtwI6fsRxAWc0dS2Rb2bQKtGLY+DiOocvoj/Jbx8/9uiyP4YGFjfjmzYJcD5XddWDE
         J5Xwl8JgalMa1ixuwObrkjUUj4dqd4rCTkVY5yYAw3KPvNvCohLALSl6W552NPqfY2Vw
         QKYfpt0cOIxB2zxLhryNSsLJ73QbfQgEfRpNMz7DWnz4QdvOwrjveKLLCJ4luNHK0n3h
         d2Jur5ykRSrhOXXbw/1jYDCUDPxqFHGLrfH+14z2BXm0XVktYFh2xJWF0qwXkvNItdak
         Ga2DoXdC9JeaT+wVvF3xaB4/hLGuiNIwBy0yvMN2S5FPQI9lRIYXwYmhKBuYWzB505aZ
         o05Q==
X-Gm-Message-State: AOAM531jMN9JqxiU0CZJewU+fUewVEI9pGKFGsJII9RdqZH/OJXra5X1
	7FFL9JeaKtdjQFGzv+MFIZE=
X-Google-Smtp-Source: ABdhPJyFcS62rGLLZ0EjAwY0p9t8w/nlk+P69zOcR/Ub+6SBHdiRFu9Da86aHG305c8OK9PsWgEuhw==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr14143517wmb.180.1608049731193;
        Tue, 15 Dec 2020 08:28:51 -0800 (PST)
Date: Tue, 15 Dec 2020 16:28:49 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/4] x86: clobber registers in switch_stack_and_jump()
 when !LIVEPATCH
Message-ID: <20201215162849.khcagkpxe3ccnohj@liuwe-devbox-debian-v2>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
 <28db518c-da59-8e56-b8dc-ccc814f91131@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28db518c-da59-8e56-b8dc-ccc814f91131@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 05:12:12PM +0100, Jan Beulich wrote:
> In order to have the same effect on registers as a call to
> check_for_livepatch_work() may have, clobber all call-clobbered
> registers in debug builds.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

