Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5B5F0997
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414139.658258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDuN-0003vM-4Y; Fri, 30 Sep 2022 11:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414139.658258; Fri, 30 Sep 2022 11:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDuN-0003sY-1Y; Fri, 30 Sep 2022 11:10:19 +0000
Received: by outflank-mailman (input) for mailman id 414139;
 Fri, 30 Sep 2022 11:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLxN=2B=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1oeDuL-0003sN-E2
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:10:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 765fcefe-40b0-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 13:10:16 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id f11so3645196wrm.6
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 04:10:16 -0700 (PDT)
Received: from horizon ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b003b476cabf1csm2035101wmg.26.2022.09.30.04.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:10:15 -0700 (PDT)
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
X-Inumbo-ID: 765fcefe-40b0-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=lVCtHc1fCKHeC5BSoXyZa1ptlA+WKPf5+big9WGJfI0=;
        b=jJlFUetdRlTeP/0Ko5VUnKadL0jy0TdptdQJf1PmjbZZkvZtW7107l9fPK69O1rRgV
         wLjgSTBU1gf1oPO+AUoVkFf0GvS0E7Ysmd5q+MEqWagfhB4f/EGSvZ+4DppWsNyDC3H1
         Eh9T0zjRISFE7vOwgSXyOLxoBku4kig/p0YCf10CsRKGUQlvn5kXKxnykYUfmBtBv+Uq
         7EX73zdiTSbN6A36rCAanNP2G3RV7gloFKeYdv0FxQwr+r4O3Hj9zLH7ZxaIqDQP5PIN
         vNL5GHm5C5rEszRqqeaVpkFamqf8IewF/PotUWjxIgi3fCJ28BdHcAlIIX3ikSo5gNqM
         qWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lVCtHc1fCKHeC5BSoXyZa1ptlA+WKPf5+big9WGJfI0=;
        b=7Pkv0VGeBT+NyYeBrg80HtaSU0AoJ1KVSd/Gl91B1iK80zDTDsWaEo8+PTWTjE5Sz7
         u5ccIb1mErE2I4uRiB/ymB1OiWkx7l0WKCHRbyFZe+qxE6gv5WIOYtYEvmtynFNoTUwS
         IU3RqshRd8NrIr476cQoVmolpwqxixf/nMOAmyeKrMwbmRTWCyzps3oaKc5J9dkc299d
         XYfyWW6G8cQ5DFD4DV2F7E7op9tb2wRcsaQCCttrdy29WXkJ5NSNEReshk3wVpgW2LJ9
         SuNnT/qvplGr5BSmJ+8LTRYTj22v7WzpIATKV3KpFR1bqDsVykLAT7oXCGRLUt+wGZFr
         qbZg==
X-Gm-Message-State: ACrzQf2TKaC/57nDvH9sV0VhJfvIbIRIBEPI3cWdvFI3mrVXIw3CHbP5
	PLuBYakdd4s9Pd02M6wp8WE=
X-Google-Smtp-Source: AMsMyM4CGNwgviKo/7SRCRqGE2nZLkkYBntwCb8kA16Km+Hfz3CsOCXEsF9zKEFZxFE9iD/SRV/eFA==
X-Received: by 2002:a5d:588f:0:b0:22b:5cc:e1d3 with SMTP id n15-20020a5d588f000000b0022b05cce1d3mr5083143wrf.142.1664536215792;
        Fri, 30 Sep 2022 04:10:15 -0700 (PDT)
Date: Fri, 30 Sep 2022 13:10:13 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v1 0/2] Add a new acquire resource to query vcpu
 statistics
Message-ID: <20220930111013.GA877987@horizon>
References: <cover.1661330065.git.matias.vara@vates.fr>
 <268f8c2c-57ba-e4e3-59ef-45ed3cd794de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <268f8c2c-57ba-e4e3-59ef-45ed3cd794de@suse.com>

On Thu, Sep 29, 2022 at 05:55:50PM +0200, Jan Beulich wrote:
> On 24.08.2022 15:27, Matias Ezequiel Vara Larsen wrote:
> > The purpose of this RFC is to get feedback about a new acquire resource that
> > exposes vcpu statistics for a given domain. The current mechanism to get those
> > statistics is by querying the hypervisor. This mechanism relies on a hypercall
> > and holds the domctl spinlock during its execution. When a pv tool like xcp-rrdd
> > periodically samples these counters, it ends up affecting other paths that share
> > that spinlock. By using acquire resources, the pv tool only requires a few
> > hypercalls to set the shared memory region and samples are got without issuing
> > any other hypercall. The original idea has been suggested by Andrew Cooper to
> > which I have been discussing about how to implement the current PoC. You can
> > find the RFC patch series at [1]. The series is rebased on top of stable-4.15.
> > 
> > I am currently a bit blocked on 1) what to expose and 2) how to expose it. For
> > 1), I decided to expose what xcp-rrdd is querying, e.g., XEN_DOMCTL_getvcpuinfo.
> > More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is a uint64_t
> > counter. However, the time spent in other states may be interesting too.
> > Regarding 2), I am not sure if simply using an array of uint64_t is enough or if
> > a different interface should be exposed. The remaining question is when to get
> > new values. For the moment, I am updating this counter during
> > vcpu_runstate_change().
> > 
> > The current series includes a simple pv tool that shows how this new interface is
> > used. This tool maps the counter and periodically samples it.
> > 
> > Any feedback/help would be appreciated.
> 
> Before looking more closely - was there perhaps kind-of-review feedback
> during the summit, which would make it more reasonable to look through
> this once a v2 has appeared?
> 

Yes, there was. I will submit v2 from feedback during summit. Thanks for point
it.

Matias 

