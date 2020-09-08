Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6607026162C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 19:05:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFh1v-0004o9-Te; Tue, 08 Sep 2020 17:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VVs3=CR=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kFh1u-0004o4-7N
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 17:03:38 +0000
X-Inumbo-ID: b9da822b-da11-4fd1-bfd3-1aefe386afb1
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9da822b-da11-4fd1-bfd3-1aefe386afb1;
 Tue, 08 Sep 2020 17:03:37 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z2so12438515qtv.12
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pphaEnV7aPWksaOmtDg3iARkstkO+32OTn6w1il2Ma4=;
 b=KVMNQ0xDyIBeDox4vZ/L2/KmWWBf5zxgz5QqPxBAQZfHq6LxKquMW3N+l9991rRYpb
 fB9j/X6d53vOSv2xRC/34gVlZLjc1dtaW3U2TBclt1+rfFlJSrZXgHOMFYLXSqnAQANs
 Kf2T+4Zjkg9UVU1Aisa2YBDkfH26wRGDrDr9+7RdIaf8gY5CHfY5U8pohPkMVRevs93E
 Bw5qByEZxPE/w2ww313+G8h1gqGfgEgbFaurFL+BudCT5ANjnSBnOYryUinmx37QiG5w
 zyDShld3f110OxYqAUIae638tg3vU7JARQ9SwJIOgPUgJQHKlViQgIgPYRdhFZVBtEdd
 lyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pphaEnV7aPWksaOmtDg3iARkstkO+32OTn6w1il2Ma4=;
 b=ZTmc37E38KGkYcaO3FHsr8JWEk9PVgDAxGdebqMhpD8UdHF+b+SwJMfFhu7UMa1n+2
 GQW4Qqp/W0v430ur8Q1BwFOt4Gr9v0T0waWM11nqZ4eybaOVQsR7eIQQWl0kA/Dduqpi
 K/axkTN6ztnZpz+rBQmozUFbuEaFve9sTiuufRiwNHMr2MU1GJcE/wD5r3bfRlHHGneZ
 fNVs0t2+yvVPzQXhhjTbYQdh6iMGJxShAt1UrUChB5wYFHlFyZ3lgz9Mfhk2D/xBBOoL
 PFNCuadlLNWteMsyBWJk+EwBQbAc4NUHdbF7KXWzHgJxfm0uQmrBjaJEkHqqmfkJLTIV
 h1Ig==
X-Gm-Message-State: AOAM5329TV7Kd85giOQAR01oouHnA2zOc/BDFnABoi886v2q4XA+TYE2
 iv/wU63dVyWnDp3YEF7lgvU=
X-Google-Smtp-Source: ABdhPJzNdzx7Wv4ebi0fkWkW8cwCD1N2fU7GICEGrKCUDRH5JyQiGzHYIzenbW14A4Qu4wWtlQSc/g==
X-Received: by 2002:ac8:5d04:: with SMTP id f4mr1069575qtx.290.1599584617050; 
 Tue, 08 Sep 2020 10:03:37 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id f13sm14635581qko.122.2020.09.08.10.03.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 10:03:35 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:03:32 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] golang/xenlight: Move to an entirely external repo
Message-ID: <20200908170332.GA12322@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20200904164000.602618-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904164000.602618-1-george.dunlap@citrix.com>
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

On Fri, Sep 04, 2020 at 05:40:00PM +0100, George Dunlap wrote:
> Remove all go files and generation targets.
> 
> Add a convenience macro to build the package from staging.  This isn't
> really meant to be called directly; rather, it's meant to be called
> from a corresponding build target inside the external xenlight package
> repo.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Does this make our move to gitlab.com/xen-project/go-xen official? I
wasn't expecting this to be so soon. But, if you're satisifed with what
you've learned from working on the experimental repo/module, I guess I'm
not opposed. I would like to know the rest of the details though.

Thanks,
-NR

