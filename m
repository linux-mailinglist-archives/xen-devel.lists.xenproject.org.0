Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F91EB993
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 12:27:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg47t-0003A2-S6; Tue, 02 Jun 2020 10:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg47s-00039q-Fo
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 10:26:32 +0000
X-Inumbo-ID: 8586aa3e-a4bb-11ea-abc9-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8586aa3e-a4bb-11ea-abc9-12813bfff9fa;
 Tue, 02 Jun 2020 10:26:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l11so2860867wru.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 03:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=D6kJV+3QSzhZxH/1tco0e7UkStmVDCdOoRvJ1GRjAsc=;
 b=E64HxZO5eujMARn9FyebY3wAgZyBoLgREDQZZ3KvwlD0sSLDa0Yr3UkaJr+MLdQ/xL
 A0GsBqZ6cXzB13QhecZxD/zHQsrrX8EwLSEdwdrFW0iuM8s6InAOoHxx06miA0RHc/fz
 4SUX5FfwewtXB75ZGgAIZNW/FUbYKFxGnoTcaOUwcVDuVP3KRxavzOO1jEpe0guuxy7B
 +0q2FURAcTjKFcnWlJx6tUW984RSR93KRKHpVnpQMtGWGrLHij1rha/DaUUvm0MIHb9C
 6+TcgpUhRqJdnmKCGFhndCrFwaHMTZ/t8A5PsoKN8ndsHxmbNJXty2chJqUvkFGeAqb2
 nTsA==
X-Gm-Message-State: AOAM533i+IZKTs+oVTrHa4b0PgUBJSSfxXAofQDoeUCzJMJAVmgTA8no
 iTppcS1egZ6O+v80HQDXpLk=
X-Google-Smtp-Source: ABdhPJwAma/4C2NBcxz+KGhxMFUU5+G0Ggb0pp+e8nXhzEd/JIlGIGBwrmy42kdC4gcxVku21DDevw==
X-Received: by 2002:a5d:6cc1:: with SMTP id c1mr26729975wrc.144.1591093588813; 
 Tue, 02 Jun 2020 03:26:28 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o20sm3220786wra.29.2020.06.02.03.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 03:26:28 -0700 (PDT)
Date: Tue, 2 Jun 2020 10:26:27 +0000
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v19 for-4.14 02/13] tools/libxc: xc_memshr_fork with
 interrupts blocked
Message-ID: <20200602102626.2i3vsnhygqp6f2ne@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <03b382a38c62b5431c63d00f9acffacf43b55c1d.1591017086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03b382a38c62b5431c63d00f9acffacf43b55c1d.1591017086.git.tamas.lengyel@intel.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 01, 2020 at 06:21:36AM -0700, Tamas K Lengyel wrote:
> Toolstack side for creating forks with interrupt injection blocked.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Wei Liu <wl@xen.org>

