Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0C2463DF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:59:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bvZ-00077H-GQ; Mon, 17 Aug 2020 09:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5P54=B3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k7bvX-000776-CH
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:59:39 +0000
X-Inumbo-ID: 2ed506dd-9904-43cd-a1b5-2785b0b8c895
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ed506dd-9904-43cd-a1b5-2785b0b8c895;
 Mon, 17 Aug 2020 09:59:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3so14348710wrl.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 02:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CMyKiXX2e8q6hSKTCklA/f0BgK6NoV24oQoQRJfNh+I=;
 b=IL0s6ecu9gqnlyUERcRmI8iOT2pVQdIXzp6Ra6bCENqwteSzT5lXSLE3HM8T6j6F44
 kOIyb03PMlnzwc7P39kTaaX6HhntyUpC6MJIstm431XclTrnur2CdQaPKexDuc/A/aJr
 V/0YYeV0+gJHaBF5nUexDQagsKK87liKeFrsN+n+zWO0kPs9JtNqXPTzOR7MnNw8NqqA
 01TBqNYsnnu/DJ3J/fcRxVQ03AQl/xQxxj6h9LPKdPWYBZPym8tb0CZo95mPP2Ru9LFs
 pYZceFZ5c7YBIl+Uji8381xe7AZ9O/iYokLI6q7VJriijg3C2a44sEEHcGotUVrf66rb
 WeSQ==
X-Gm-Message-State: AOAM533Ymwafx7bn1/Pc7O+UJyhoeSUOrws2cOKPIUg3OonCAUtZWd9Q
 Z7a7Jv7j3VHltkyGxSb5948=
X-Google-Smtp-Source: ABdhPJyABy8T4hAj4Vvf/heSKeunjSTO0VxyrUkCwUNudzvK8Ulab6e8LNTOEIqDP1P/7d5uM1MtGQ==
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr14645850wrj.6.1597658377947; 
 Mon, 17 Aug 2020 02:59:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c15sm28757570wme.23.2020.08.17.02.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:59:37 -0700 (PDT)
Date: Mon, 17 Aug 2020 09:59:35 +0000
From: Wei Liu <wl@xen.org>
To: Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 4/6] tools/ocaml/xenstored: drop select based
Message-ID: <20200817095935.gmroomzcgo5qb6ny@liuwe-devbox-debian-v2>
References: <cover.1597442238.git.edvin.torok@citrix.com>
 <1e3b3f1ecb3b0c44a23f8ec5fe0af4b2249c1c7e.1597442238.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3b3f1ecb3b0c44a23f8ec5fe0af4b2249c1c7e.1597442238.git.edvin.torok@citrix.com>
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

The subject line seems to be cut off half way.

"Drop select based $SOMETHING"?

Wei.

