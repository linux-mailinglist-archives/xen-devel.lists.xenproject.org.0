Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4155BE332
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 12:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409329.652327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaaVH-00083F-Mp; Tue, 20 Sep 2022 10:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409329.652327; Tue, 20 Sep 2022 10:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaaVH-00081S-K2; Tue, 20 Sep 2022 10:29:23 +0000
Received: by outflank-mailman (input) for mailman id 409329;
 Tue, 20 Sep 2022 10:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkH3=ZX=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oaaVG-00081M-GO
 for xen-devel@lists.xen.org; Tue, 20 Sep 2022 10:29:22 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15a1f140-38cf-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 12:29:21 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id iw17so1953001plb.0
 for <xen-devel@lists.xen.org>; Tue, 20 Sep 2022 03:29:20 -0700 (PDT)
Received: from localhost ([122.171.20.238]) by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b0016f057b88c9sm1077188pln.26.2022.09.20.03.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:29:17 -0700 (PDT)
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
X-Inumbo-ID: 15a1f140-38cf-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=R2F5K+M5lfxWwev5z8FfAb4dF1wQLjukQ42j9gJfkOo=;
        b=HKHtV+gTLbDeJccbaxlaaffkX3FETGuIdbaf5PPJ3/7vKuEDZ1xo6cLZgLysejTNYJ
         CeCRf7QdwmEqR+GTfxVq2KH6rQ1g0rKmPPCHX3WhD5jy/rBbk4LncAuPnMoI3zJO3dMO
         RwseEcuS21oOhWH2W2NyyKWWIPX2xZUlGZb9rHecjzeplFUHzoUA7kYFkcxpgJoXDhYN
         Gle5EJHSN+GsCYfu/FBU6NO3oPw5C6XWxc6smAdSV9Mhe2meCY4GpTEZ0135cLefOQ2M
         12ajyeV+8NUej8HXYGBaxnvC/4TmpLNWLCz42EA1yEb+z1akXqlJP/PU+e1lHDs9vywb
         jqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=R2F5K+M5lfxWwev5z8FfAb4dF1wQLjukQ42j9gJfkOo=;
        b=g9vXNbLFmpw4DOWpAKb8DrxhIfEWluMH+ixcQViDy7/tmXa849B7QfAZr5m9+WqSBO
         JEri8f1xyWLu0wR3mKWzxNk9We5DIyw11Y6OjdWPlwkKTAZCV587Q02d/RsODfNaEQg1
         0Qg297ZURv3STZ0srCvC6GPCtYvCE7Lg7qi0qGW/hv7baslIytsBrEnH8LctUGJMS+/E
         IpG5H4/PabW5LN7qIcTDQ7l0aRx9YHKZXY91yBu1asQJACbyasEXOshFJOqt/aPJ3xYJ
         GCrSio6tuI916gR6kgZYaYZmMpiFX8pfADe3FnXFcwEdjYkYXWTul2y5eiUosCWMQsSz
         fGwA==
X-Gm-Message-State: ACrzQf1Wx59yh7GOky8Ts2lK/G4Vk4gyMHJVb6AZWtF52nK7TTOxezQf
	BeMj/MbydgP1bTQGd7zjIiN2rw==
X-Google-Smtp-Source: AMsMyM7BjhJsu/8Vkx+rsCbT8u2E5hmzwqBdrUPztTbAbrROFs55YbWztCipWKHybEj1SlNDGqrIog==
X-Received: by 2002:a17:90b:3504:b0:202:5d53:86c with SMTP id ls4-20020a17090b350400b002025d53086cmr3102037pjb.182.1663669758459;
        Tue, 20 Sep 2022 03:29:18 -0700 (PDT)
Date: Tue, 20 Sep 2022 15:59:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Message-ID: <20220920102915.p55lt4ee5hbxiun2@vireshk-i7>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
 <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>

On 09-09-22, 16:02, Anthony PERARD wrote:
> On Fri, Sep 09, 2022 at 08:13:28PM +0530, Viresh Kumar wrote:
> > The iommu node will be required for other virtio device types too, not
> > just disk device.
> > 
> > Move the call to make_xen_iommu_node(), out of the disk device specific
> > block and rename "iommu_created" variable to "iommu_needed", and set it
> > to true for virtio disk device.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I don't see these patches being applied yet, do I need to ping someone
for that ?

-- 
viresh

