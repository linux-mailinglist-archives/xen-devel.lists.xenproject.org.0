Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A1254445
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:27:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG42-0003iZ-Mk; Thu, 27 Aug 2020 11:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBG41-0003iP-J7
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:27:29 +0000
X-Inumbo-ID: ef7db1ce-1c6c-46a6-8348-7a3e45f491e2
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef7db1ce-1c6c-46a6-8348-7a3e45f491e2;
 Thu, 27 Aug 2020 11:27:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so2621888wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dqWR2TUrH8iKQ+pmUwC6eHI5iaFRwEVSjVu0zC9Ha/U=;
 b=sA1IloasYzBDQwNYHmnFi9Oejd/q21dLv2QLwJ/AwWF/A2fB6Ltq4xDyDntZNsCAob
 YCU54P66WUbCgPnOBeVbrT0CpbH5E34Kj8IvSiTWqJ8Hm3t14R77SZU4wQ0/e7GQbNmy
 UX9lr3bd5o8XkqcjME55EMLIqsmDDZLqe+Ort5E5h0JNYHSjRvW6byL7HO4XauBice+j
 LXau89BVC/A2H1nZOwkBR0+9MPDr5ondXDX+ELMBXLf70fWZ6p6woicAiflr25o6N46w
 MJZNXtvue+D1KAYB+cO8inM2PsYm1Fr7604TNuol/FkLqhK4oj/fBP1y/wzGls5vmhvd
 +VRw==
X-Gm-Message-State: AOAM532vxpzDOdd50qa+jNqCk6jTJu9TsirP70fE8JLoyxqzn4xyiS+I
 9gwQ/HYCq+E9zDToPTCCmJI=
X-Google-Smtp-Source: ABdhPJyQyLImpcYMJMpSZ9sPtoIMgWNJnF3oLltPDBggOiheTEhn0JHgP2doU9Eo6qm+wUK4islvww==
X-Received: by 2002:a1c:2854:: with SMTP id o81mr10829798wmo.61.1598527648088; 
 Thu, 27 Aug 2020 04:27:28 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 22sm4359704wmk.10.2020.08.27.04.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:27:27 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:27:26 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 25/38] tools/xenpaging: remove libxc internals
Message-ID: <20200827112726.7gm7byftf7nua4rt@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-26-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-26-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:06AM +0200, Juergen Gross wrote:
> xenpaging is using libxc internals. Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

