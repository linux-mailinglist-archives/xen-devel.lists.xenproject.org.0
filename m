Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94F298FCF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 15:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12369.32207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX3nS-0004HJ-Mt; Mon, 26 Oct 2020 14:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12369.32207; Mon, 26 Oct 2020 14:48:30 +0000
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
	id 1kX3nS-0004Gw-JT; Mon, 26 Oct 2020 14:48:30 +0000
Received: by outflank-mailman (input) for mailman id 12369;
 Mon, 26 Oct 2020 14:48:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kX3nQ-0004Gr-Kf
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:48:28 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ea70aac-8eef-4277-9185-7b9e47d3cd1e;
 Mon, 26 Oct 2020 14:48:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e2so12777175wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 07:48:27 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o3sm24827771wru.15.2020.10.26.07.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:48:26 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kX3nQ-0004Gr-Kf
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:48:28 +0000
X-Inumbo-ID: 1ea70aac-8eef-4277-9185-7b9e47d3cd1e
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1ea70aac-8eef-4277-9185-7b9e47d3cd1e;
	Mon, 26 Oct 2020 14:48:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e2so12777175wme.1
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 07:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+P4MMbjykqdf+A1BMUNnxsawJgGT9/QAIBzSHXc/WtQ=;
        b=P5947ODpcnIKsxw5ykIiONCipdkaa0kgiZ6Xiv5AKb1pTKivRmghJjLffYiw8Y4p2Y
         aOyYR0kq+W3UosP3wBniooM0mSG/3+aNY+ZBOiIo8IdFDX3KYbmnF/LdEFJekhDJs3j6
         mSHxFWjb0ue2q2FFAD61yk774n2F5FL+sYr2CF/N7yTpeIT0TElQa6DOnqFOnOMqmhVj
         glHfB3oO7dKAE9zU1I6r0v5aLo8OUyiCNJDLtovXxSHXTfzWVu2CmMgoeHohyFjxjtAg
         hcwl7OC+O+46/gZ/dS2pxY/xVnsVxf1peVZ9BEstWhIV38pFUONxaolT48iLHlmUjW4u
         NHag==
X-Gm-Message-State: AOAM531kQJm7f618mCAnplazSsi3CEBYcR8TWVyLifxyBB5ifX5Xbvdz
	/mQBnv8IJb/JUDRuON2thmzGAIJFfbo=
X-Google-Smtp-Source: ABdhPJzKlOpQX/+yh4CZgPEaIdhjcXqYtpmUtM1yHLTsNV9G08H74+UKHxtBuT57URwg9ZevaesxaQ==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr17471023wmb.129.1603723707113;
        Mon, 26 Oct 2020 07:48:27 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o3sm24827771wru.15.2020.10.26.07.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:48:26 -0700 (PDT)
Date: Mon, 26 Oct 2020 14:48:24 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs: let build depend on official headers
Message-ID: <20201026144824.6dglorqqhabishpt@liuwe-devbox-debian-v2>
References: <20201025101129.19685-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201025101129.19685-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Sun, Oct 25, 2020 at 11:11:29AM +0100, Juergen Gross wrote:
> The build target of a library should depend on the official headers
> of that library, too, as those might be required for building other
> tools.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

