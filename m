Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F85591DA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 07:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355257.582815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4bvL-0000Nb-Mi; Fri, 24 Jun 2022 05:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355257.582815; Fri, 24 Jun 2022 05:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4bvL-0000L8-II; Fri, 24 Jun 2022 05:32:07 +0000
Received: by outflank-mailman (input) for mailman id 355257;
 Fri, 24 Jun 2022 05:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zubf=W7=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1o4bvJ-0000Kw-Hq
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 05:32:05 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa64ed7b-f37e-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 07:32:04 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id t21so1643774pfq.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 22:32:04 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902e8c300b001616e19537esm763283plg.213.2022.06.23.22.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 22:32:02 -0700 (PDT)
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
X-Inumbo-ID: fa64ed7b-f37e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S81W0gB6I+uxS9SB34gDgN1dG87Qew55lSLDRL6fcsk=;
        b=qwbyBADGvJGNSBS/IkB1gTZ6z2tCos26AnXhQmdB9IvZB06Xfgy3Zke432+yeFaoDT
         qcmv14C9wTbKNCNc0VRS1RPnopEtZ6UjKXvBIOa2aa3Wgf/ImNKetuzHYg8ca7c4pNop
         rrobLqkMo16mHb1LoM7BO+lTzRejbWXQq7BIt+fRCPyWRbBZon+KtYQASSriVuXZNU0P
         ejgYGdgUyUyR5ID3Yos+ZAiwkGu/WV+qNsGV4TfrFs0CCz85T/t37DMS6Mi1/VTqTay/
         2+DasTQN1ndvnH7pEHiF54K/ITBany/SONazbr9DqyXNNWXtg3CL7aI2ocH35AZMj9Kk
         uosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S81W0gB6I+uxS9SB34gDgN1dG87Qew55lSLDRL6fcsk=;
        b=sZ++yfllCTekx9yiwrrPtVcSlm42EABYwe7DSIgoZoJwESXELKGYNMygGbqS8WiJGT
         kENX9BJrdFUIdXXwC3zvZeS8+jEDIAgeetIba6EetM7T/sF77Z5VVCtORxkSWI5FPnf6
         Ws+LfrgI0CJmaR743reEd5hOesH69QsRLbgoFRnAmOjbAE/orvQgAdHMzdazU4pOfGKP
         mPLVvYK2X+5j9nsSWQrOfAqo2dso8XxTozvMEeUjYjj3Y0JB46bbqkCjpHT/b8jsarfL
         j7EhM/+jou6RS61ke8T4nKJtEWVGRMjZ2Yn3c5tTdSb87Pk7PRnMizvy4ul88/X7TSdR
         hQow==
X-Gm-Message-State: AJIora+SIIKj2ptuHRTkleAFBFkzf6F0Qy1+/lsf5lDlJ1SltHdeFCt5
	Bk4NDUASGw+EeZohiiJMj+elCg==
X-Google-Smtp-Source: AGRyM1uO6xR8FEXNanwcQhwkSsk8h4le+5+n8pD+5b1U2JH8SHLk/lYzY6wYgtkdjvH5/n2HxjHb2w==
X-Received: by 2002:a65:53c8:0:b0:40d:77fc:5f05 with SMTP id z8-20020a6553c8000000b0040d77fc5f05mr2722358pgr.263.1656048722678;
        Thu, 23 Jun 2022 22:32:02 -0700 (PDT)
Date: Fri, 24 Jun 2022 11:02:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220624053200.iwvwvesnu7o52tp7@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220622114950.lpidph5ugvozhbu5@vireshk-i7>
 <CAPD2p-kFeC8FygFcbpEbH3CzrAM7Td+G68t9ebOFR4V0w1dpEQ@mail.gmail.com>
 <20220623054819.do25phfuumnexw73@vireshk-i7>
 <CAPD2p-=OMDMqdV27E2jTTcE0gx1eiT+9TqLeOVH2u6YfwT_8pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-=OMDMqdV27E2jTTcE0gx1eiT+9TqLeOVH2u6YfwT_8pg@mail.gmail.com>

On 23-06-22, 15:47, Oleksandr Tyshchenko wrote:
> Below is my understanding, which might be wrong.
> 
> I am not sure about x86, there are some moments with its modes, for example
> PV guests should always use grants for virtio, but on Arm (which guest type
> is HVM):
> 1. If you run backend(s) in dom0 which is trusted by default, you don't
> necessarily need to use grants for the virtio so you will be able to map
> what you need in advance using foreign mappings.
> 2. If you run backend(s) in another domain *which you trust* and you don't
> want to use grants for the virtio, I think, you also will be able to map in
> advance using foreign mappings, but for that you will need a security
> policy to allow your backend's domain to map arbitrary guest pages.
> 3. If you run backend(s) in non-trusted domain, you will have to use grants
> for the virtio, so there is no way to map in advance, only to map at the
> runtime what was previously granted by the guest and umap right after using
> it.
> 
> These is another method how to restrict backend without modifying guest
> which is CONFIG_DMA_RESTRICTED_POOL in Linux, but this includes memcpy in
> the guest and requires some support in toolstack to make it work, but I
> wouldn't
> suggest it as the usage of grants for the virtio is better (and already in
> upsteam).

Yeah, above looks okay.

> Regarding your previous attempt to map 512MB by using grants, what I
> understand from the error message is that Xen complains that the passed
> grant ref is bigger than the current number of grant table entries.
> Now I am wondering where do these 0x40000 - 0x5ffff grant refs (which
> backend tries to map in a single call) come from, are they really were
> previously granted by the guest and passed to the backend in a
> single request?

I just tried to map everything in one go, just like map in advance.
Yeah, the whole idea is faulty :)

The guest never agreed to it.

> If the answer is yes, then what does gnttab_usage_print_all() say (key 'g'
> in Xen console)? I expect there should be a lot of Xen messages like
> "common/grant_table.c:1882:d2v3 Expanding d2 grant table from 28 to 29
> frames. Do you see them?

I am not sure if there were other messages, but anyway this doesn't
bother me now as the whole thing was wrong to begin with. :)

-- 
viresh

