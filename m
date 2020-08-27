Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88778254440
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG0L-0003RM-LH; Thu, 27 Aug 2020 11:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBG0K-0003RH-2m
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:23:40 +0000
X-Inumbo-ID: 9f27fcd3-23ce-46a4-9d71-b8a99cb1cdca
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f27fcd3-23ce-46a4-9d71-b8a99cb1cdca;
 Thu, 27 Aug 2020 11:23:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h15so4987939wrt.12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vPH/clHkxjQ+UrmepdumFDGo8tLZjdW07HW/F4Qy34I=;
 b=eRU6UR7/UzPNdvUeqMQRm6+MqjMGGBpNKIcKIkG6ocPtOSniyfsMyzk840lm/z0sKl
 CAlGbjnS0rFt6PKwR9ajp9byZ8fDYNAXNj9+/XV89+iEpYyVvZ/c7/JloubP4ZtjvcfC
 KEJFMQW3OLhCwPFFftguMPkVeZkFuz9xNExN3dP+WOpDUuVEC9vVbkLBqFE0XCQcYLuZ
 Zr6dxtqqsW39EboId15JOklsv82Acm/EMEo9EjwIq8nk5gQjZLVOfOaLXjVFnZ9UXouI
 ONaPV9Ls7JfcDLlHzdBgdWA+rj8cIvhlt3cd5uXr53gtGSyL+G4epQMDgucV2Q000+AU
 TRcg==
X-Gm-Message-State: AOAM531YV1WhRNFzO9CbFPwN9W29XsBaLjEDrZb8tPRPA+LLzvh7sjLg
 3gvU5gAntzHq2MeZrQVrkrA=
X-Google-Smtp-Source: ABdhPJzez+vvMRoxXSdJciH1KaQhK5EfPWbfvCdum1Mope+eS3yRX/GA6IN+zNMmwBGyp4wJnJN6sg==
X-Received: by 2002:adf:fb01:: with SMTP id c1mr18996780wrr.119.1598527418638; 
 Thu, 27 Aug 2020 04:23:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w7sm4468456wrm.92.2020.08.27.04.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:23:38 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:23:36 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 23/38] tools/libxc: untangle libxenctrl from libxenguest
Message-ID: <20200827112336.4t26w7ehdyjhpiil@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-24-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-24-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:04AM +0200, Juergen Gross wrote:
> Sources of libxenctrl and libxenguest are completely entangled. In
> practice libxenguest is a user of libxenctrl, so don't let any source
> libxenctrl include xg_private.h.
> 
> This can be achieved by moving all definitions used by libxenctrl from
> xg_private.h to xc_private.h.
> 
> Export xenctrl_dom.h as it will now be included by other public
> headers.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

