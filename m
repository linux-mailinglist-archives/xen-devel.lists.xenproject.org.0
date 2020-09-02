Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099325B4D7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 21:56:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDYqs-0006q1-Lx; Wed, 02 Sep 2020 19:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OLUi=CL=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kDYqr-0006pl-F6
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 19:55:25 +0000
X-Inumbo-ID: d8ef8fd1-2be4-41e4-a343-1ab286539c74
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8ef8fd1-2be4-41e4-a343-1ab286539c74;
 Wed, 02 Sep 2020 19:55:24 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id n10so163269qtv.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2020 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fgPZcNvT9XisUEbS+1Ao8QDv+2ALILbug++l9nLUnEc=;
 b=eDmdY0vjzVfcFNl+EMsQE7ZqH4oRZejSxSYWEoWWA0LEdXjBPBIYZ6CIsMOWOxGjre
 aBQ48+3bOVD8NsPa5zTC0V3LvdY7JTigVAGlNWdDDhyLOSLDRHqvX6bHJcCqOAD2JjBt
 Id0FOFZeYHGG1YX7QJRMv2hT3NNRju9/l+AAjpD3G9ARYo2LX9epD472g4knNpz9tXRY
 QIv8rjCWzc/9YstUFPMY/iJgPN6OkAs4plT5GpUmNOLHooN2SAnE4b94q7LW91GUs0/9
 1g5J0HWNcf1NiBHzYqIMtHP287gAFviB3+0k1iay05db9SxaajuERUn5e4bpDNGaxeZg
 avuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fgPZcNvT9XisUEbS+1Ao8QDv+2ALILbug++l9nLUnEc=;
 b=Y+sAMWoP5H3fZxiCsMYCIlv0CV+pvKHQ9f9s7M513fDuhPgFz0Hg8KQE7QLN+I0xtZ
 tIXa4+8oGNRmewLsWr36X+YRWKpHe7SQv/Num/bdPVHpWmSz24p7EOjwOI0Cs7OZY9KG
 vZggMYtXaUiz3dW7tveDSVmJWqafFvZJ7mvjocS2VmL8ZDa5ssX6bbtZyYFMtLdgqi3R
 VJnufgNzx3eYON2zk+H1XX5huvFyrpQsw4kYxsOH24dv7xgpxNvaP5J6Z20k+5bQIXOO
 4UBSc8Zpyt0ATmtuN3xOyNd4dQE4cA30PaNGoiATw6DKShN33vDOd/HGmPshdm5Tc/f+
 0W5g==
X-Gm-Message-State: AOAM5330XMN2WeQmXJOiU7hNBukfEF5El0pOJBS/Lmke3usSTXW0TcTc
 X6HOoEVEmkax/IuiriU1ZRqCdPZv7gzyIyImdIc8PA==
X-Google-Smtp-Source: ABdhPJxH9r1RSltOF8T2/Z4xLh8CcWvsQpot7UP0gaqiZUBPftNT/cydeaBKOK6TZ0ETBxF8utLKbo/eFODKcZlSras=
X-Received: by 2002:ac8:76cb:: with SMTP id q11mr2050699qtr.63.1599076524368; 
 Wed, 02 Sep 2020 12:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
 <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
 <1093525083.1169948.1598979998646@mail.yahoo.com>
 <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
In-Reply-To: <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 2 Sep 2020 12:55:13 -0700
Message-ID: <CAMmSBy8vor1GBqNUSRjj=gNRBwDjzRWFcxuAU0EYkRDgwQ4K+g@mail.gmail.com>
Subject: Re: Various problems for the Xen for XenGT code and guide.
To: "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Cc: Jason Long <hack3rcon@yahoo.com>, Mario Marietto <marietto2008@gmail.com>, 
 "igvt-g@lists.01.org" <igvt-g@lists.01.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Li,
 Susie" <susie.li@intel.com>, 
 "Tian, Kevin" <kevin.tian@intel.com>, "Li, Weinan Z" <weinan.z.li@intel.com>, 
 "Downs, Mike" <mike.downs@intel.com>, "Xu, Terrence" <terrence.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 2, 2020 at 5:48 AM Lv, Zhiyuan <zhiyuan.lv@intel.com> wrote:
>
> Hi,
>
> It is mainly due to the business priority change. XenGT project was origi=
nally created for data center usages with XEON E3 servers which have integr=
ated processor graphics. After SkyLake E3, there are no new servers capable=
 of running GVT-g, and Intel future graphics for data center will have diff=
erent approaches for GPU sharing. Another reason is the XenGT upstream diff=
iculty. Different from KVMGT which has been fully merged to upstream, Xen p=
art of GVT-g still has technical opens that are hard to close quickly.

This is extremely useful -- thanks for sharing. Any chance you can
elaborate on the later part "and Intel future graphics for data center
will have different approaches for GPU sharing"?

IOW, is there anything that Intel is cooking up that may help Xen in
that department?

Thanks,
Roman.

