Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FED22991A3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12402.32299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4v4-0003if-Rt; Mon, 26 Oct 2020 16:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12402.32299; Mon, 26 Oct 2020 16:00:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4v4-0003iG-OV; Mon, 26 Oct 2020 16:00:26 +0000
Received: by outflank-mailman (input) for mailman id 12402;
 Mon, 26 Oct 2020 16:00:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kX4v3-0003i9-B5
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:00:25 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 715b8c0e-c71d-45b7-ad28-33a4f958c1d6;
 Mon, 26 Oct 2020 16:00:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x7so13270900wrl.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 09:00:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l11sm22384427wro.89.2020.10.26.09.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 09:00:17 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kX4v3-0003i9-B5
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:00:25 +0000
X-Inumbo-ID: 715b8c0e-c71d-45b7-ad28-33a4f958c1d6
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 715b8c0e-c71d-45b7-ad28-33a4f958c1d6;
	Mon, 26 Oct 2020 16:00:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x7so13270900wrl.3
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 09:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ouk3eT1qAU6Yio8PImrLhRW689YzO30DOS3jAJ6J78c=;
        b=gnIBRmrXnlufffhvfwb7QiWkzD9wuXoUuGHm5uhROYB19mafSQNYXTqW2LzLFYTlnP
         GGcHpSo3e4uWoJ5+iSLE2MnK1qSV2sNcE+U4ML5T3HQpxv7TvlNjALZHyBUhAjySH1cQ
         RJ3XI42kwUJi7YJGJ+t9xI3pebcF+RY7lMN3AXKTx3lZpiVqCsj1v/ek3x3gK5cyomFC
         0W1G6/5pCrLDZEiF5hAhJXC1pMaRub31YJDrpOPh75I8zZyLHPSw/pt2dHBThSCPu/tG
         lU/gCKK+o1VNFZYIs/Atx+ywSe9jI6dmZo8oyXFyDCgRv4clow6WNqaeVW2dEdbhX7hf
         syEw==
X-Gm-Message-State: AOAM532betHmNFfFOM5vOmG01/qS2OaaHOq4WazUo07f5Hy3chdKcXHz
	Ht0Q687OfWdf5Olj74vDehU=
X-Google-Smtp-Source: ABdhPJzh/kueoRKN97FQmG7HEQuJjEWtR6wCmayPYYvQV5nOME9V93Vd9kcyRrkZr3K1RHR5OioI4g==
X-Received: by 2002:a05:6000:18d:: with SMTP id p13mr18511512wrx.248.1603728018071;
        Mon, 26 Oct 2020 09:00:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id l11sm22384427wro.89.2020.10.26.09.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 09:00:17 -0700 (PDT)
Date: Mon, 26 Oct 2020 16:00:16 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH] x86: don't open-code l<N>e_to_mfn()
Message-ID: <20201026160016.o5ovilcqvsku5s2d@liuwe-devbox-debian-v2>
References: <2c72239a-46e9-4822-fa4b-5a0155c5c5e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c72239a-46e9-4822-fa4b-5a0155c5c5e5@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Oct 26, 2020 at 04:47:43PM +0100, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Wei Liu <wl@xen.org>

