Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FC6D7640
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518301.804681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjy8w-0000vJ-IV; Wed, 05 Apr 2023 08:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518301.804681; Wed, 05 Apr 2023 08:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjy8w-0000sa-FA; Wed, 05 Apr 2023 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 518301;
 Wed, 05 Apr 2023 08:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enMU=74=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjy8v-0000sP-Fq
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 08:05:21 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9986dc51-d388-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:05:17 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id n14so17852232plc.8
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 01:05:17 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa78d01000000b0062e032b61a8sm6873761pfe.63.2023.04.05.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:05:14 -0700 (PDT)
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
X-Inumbo-ID: 9986dc51-d388-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680681915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gG5PZXaUKhRxajyfEHYthrg54Lo1xoJ4el5+xnkywpQ=;
        b=bXqXlLJ6We8DJ5x6EsboXOQFZKE3WQBpg4pzsW643gYyFnwHIpw8eOykr4dOTCFtM9
         ECwx22xqOqDAJ0QOAfosmP3QeiPjyEvwnk10Q7cLZjJ6jsFjJCiRbvHO1TuZH8TD0iNP
         squLEepCF/T9uWNR2qwrlN7CAdHUc2X5DMmOC+tKyrQtoUafUJurBwHqvQF23gLPhsnN
         ks8bK3PeF2O7JpuZQ2C4EPZMJUfhFPu+cWnP22BTFdKwWM0mteoYEzFdXaPsnkzJldPD
         Ff160jxoHNRWKLdNRh8ABM+ocVKwrtsr8rIVSOHveAAWMHimyC7LRtXMPEwfcfvQ4dPa
         0Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG5PZXaUKhRxajyfEHYthrg54Lo1xoJ4el5+xnkywpQ=;
        b=0sZfdAoAztFhwx4JhLqW6TIQ3NiJ1LBqthzR1zCzeYXbI36Jqesz6q1RK+wKqno2yA
         VpTqF2q1r+OowOmcywYBJLx9vdhixiU0ZAjBPoAjO0zAVahpD53S+AKyTAk48WwVsW7e
         LAruPGgnHOCzNIF06B20rCFdooBoDFN+sMHdgmkB0WUgC4jzJQ4rudbjZidkIcrBO/k1
         xC1/9H9DO6aPzEz/bk6ixMbY6Gf4RYjpLTEtTkCCWrY8/ed8KPMZvFYZtB7hyo5MCE5N
         rC2m4gc+RiCRtgBF2Wl8AFxDhPmLmL0zV1hzicI+n0NoCzgAEHoenulqx+1nObgwfiWd
         85Dw==
X-Gm-Message-State: AAQBX9dmXR3tL6GimPanFuHJYPxcUHZXmtwe7c4keIBKZkl09Z+afPHx
	CCcVyKR2usR6kDZzHDfNG0YwxQ==
X-Google-Smtp-Source: AKy350ZJ1bbwKNRCdYkOTrVTQ+pN4bqMvXPSEwXvqfgJHgfHdmB+v/yBFWMjTYFvTH5cPlfe9/Nq/w==
X-Received: by 2002:a05:6a20:2d96:b0:dd:bf6a:4609 with SMTP id bf22-20020a056a202d9600b000ddbf6a4609mr3559565pzb.49.1680681915648;
        Wed, 05 Apr 2023 01:05:15 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:35:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping
 quirks
Message-ID: <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>

On 09-03-23, 14:20, Viresh Kumar wrote:
> Hello,
> 
> This patchset tries to update the vhost-user protocol to make it support special
> memory mapping required in case of Xen hypervisor.
> 
> The first patch is mostly cleanup and second one introduces a new xen specific
> feature.

Can we apply this now ? I have developed code for rust-vmm crates
based on this and we need to get this merged/finalized first before
merging those changes.

Thanks.

-- 
viresh

