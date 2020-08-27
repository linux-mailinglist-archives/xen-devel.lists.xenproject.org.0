Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF113254456
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG9z-0004en-Qu; Thu, 27 Aug 2020 11:33:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBG9z-0004eg-4n
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:33:39 +0000
X-Inumbo-ID: cd9380f4-a70b-4917-bc30-0aac3a3611fc
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd9380f4-a70b-4917-bc30-0aac3a3611fc;
 Thu, 27 Aug 2020 11:33:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d10so4113111wrw.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h7Oj+UnFyAnhFc+ikzn0C0sR/oHfcjE55VCY/3/LK/w=;
 b=tYK72m5ZvHtpN8u+fp0Ei3hoSRi+gNrF44fsIOhB4VwPW8awvQyYJ+OaUY8Nr6ZDLk
 CM0cby2n9CMgDoop5/BXphJhomyekf77OcdbzLVubFwOAHVO7c4MEVJYeGUAcIWPiDMz
 zZqlZ1dJirOquFNe/Z0NIWD8p2iBUYGFnEATD+yy1hCP9I2S/mny6iHvsxEbqLqLcJES
 ekaY95ZJ18v4uBTr01qT8czOKxSZYiriobXo0YqgzkU5d0Dk73x6ZR+fJZ6Igs4sJD1Z
 oU/WQBvoYrYkFxrJZQtDgftP67kJyovl1x/MUuuP7EFFiq9HHlspz/1WRg2qdU9XeBYs
 hhGw==
X-Gm-Message-State: AOAM5311JHnAXi7h3pyx6xjuCyg48IONqd7N127qf+3NClYZH7EMfNY/
 2uFDDTUnwuxYFQRbXxRLmsQ=
X-Google-Smtp-Source: ABdhPJxVlSHfjGFlSNcFn7rgXtEM1pYfQoNipQsioSrhk1Tv0rwFD5n4PYhFtsDhzVqUGlbsQNQxYg==
X-Received: by 2002:adf:94a1:: with SMTP id 30mr19052790wrr.37.1598528017358; 
 Thu, 27 Aug 2020 04:33:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o66sm4965707wmb.27.2020.08.27.04.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:33:36 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:33:35 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v3 27/38] tools/libxc: move libxenguest to tools/libs/guest
Message-ID: <20200827113335.d3ipem6nvrbwahli@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-28-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-28-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:08AM +0200, Juergen Gross wrote:
> tools/libxc now contains libxenguest only. Move it to tools/libs/guest.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

