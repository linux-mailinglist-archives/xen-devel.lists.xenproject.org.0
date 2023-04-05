Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B833E6D7941
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518377.804851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk01w-0008Gq-EB; Wed, 05 Apr 2023 10:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518377.804851; Wed, 05 Apr 2023 10:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk01w-0008Dl-BS; Wed, 05 Apr 2023 10:06:16 +0000
Received: by outflank-mailman (input) for mailman id 518377;
 Wed, 05 Apr 2023 10:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E6P8=74=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pk01u-0008Dd-Qa
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 10:06:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc9ce65-d399-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:06:12 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-psKlu5H3NgSykp4d88qt7g-1; Wed, 05 Apr 2023 06:06:09 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so49642067edf.16
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 03:06:09 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 k15-20020a170906158f00b00948cb15c642sm3154354ejd.42.2023.04.05.03.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:06:07 -0700 (PDT)
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
X-Inumbo-ID: 7dc9ce65-d399-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680689171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7tqdHp0z7SrsceuGaqk3f4Dn2eBRCUCgxJHv4nhpXM=;
	b=M+8Y6JcufEf29RyWksXclCE/eIAMBOVfEv75cOKN5hZT4TCCohraVYKKtgw6V6okr/xCia
	4OQQ138nMHjwltpcRq2cXsRcHce4wR7rSzrrbL9IFneEIfDGH3WaZ3Q7iP/BmSkQ/QMMtr
	AVg4vP/6pYP2Qcch+9+L1vrmUZzqy5s=
X-MC-Unique: psKlu5H3NgSykp4d88qt7g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7tqdHp0z7SrsceuGaqk3f4Dn2eBRCUCgxJHv4nhpXM=;
        b=V4XSh60QqpVgWLj8Us8kDizNrW2iRvuofYSfbjirvgsS2nv80OGbKm0UO/kplnpG3C
         5qaNlMPSlqvBoBW7rbw+3U5BAX8GasBczfJVl98K5V2eI99pX1t2lUkK0X7mRQFehuWp
         4kqlSLTcE35HmeLuDjeqHfQTYtHeG3ERF2psyoxiPAwck1nC7G3C2LRVGGm5TbskfJvR
         +H0YIUmeFjRt7Q7gm0SFcLvkeIAOoTHBxxkAe13QSQvHvliiTojjjoyszecsal1a3nm1
         aOhKFPt2lFt7IdcHSwMzw5ojhY2j29sIgVp/hZ+FvN7lj4elRF/7haEAWKoIoJDxRKB4
         OlVQ==
X-Gm-Message-State: AAQBX9c7qUP49SLF0NKEKbJD1/xtcg0Z8v0BrSRizPQov05OMENzhwe1
	tuHUd6GWeuB6wjCdE4yUV0x/MDTEm3YlgZ3+tdCFHLFtsphrID+S7ah6j6E6v7hG1L+mPggOTVw
	LCitVesFXLv5irx8//w==
X-Received: by 2002:a17:906:a254:b0:933:37f4:2fe0 with SMTP id bi20-20020a170906a25400b0093337f42fe0mr2333565ejb.46.1680689168547;
        Wed, 05 Apr 2023 03:06:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yf1A5XZK4oo80SHWAZ2GiHPkSEf5Qh7hmicDEC8A80aMGY6813loQHdU4+ZIZl0KypQH0u+A==
X-Received: by 2002:a17:906:a254:b0:933:37f4:2fe0 with SMTP id bi20-20020a170906a25400b0093337f42fe0mr2333546ejb.46.1680689168281;
        Wed, 05 Apr 2023 03:06:08 -0700 (PDT)
Date: Wed, 5 Apr 2023 06:06:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping
 quirks
Message-ID: <20230405060340-mutt-send-email-mst@kernel.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
 <87h6tulkae.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87h6tulkae.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Bennée wrote:
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> 
> > On 09-03-23, 14:20, Viresh Kumar wrote:
> >> Hello,
> >> 
> >> This patchset tries to update the vhost-user protocol to make it support special
> >> memory mapping required in case of Xen hypervisor.
> >> 
> >> The first patch is mostly cleanup and second one introduces a new xen specific
> >> feature.
> >
> > Can we apply this now ? I have developed code for rust-vmm crates
> > based on this and we need to get this merged/finalized first before
> > merging those changes.
> 
> 
> I've queued into my virtio/vhost-user-device series so I'll get merged
> with that series unless mst wants to take it now.

Well the patches are tagged and I was going to take these after the release.
Probably easier not to work on this in two trees.
Still if there's something in your tree being blocked
by these patches then
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Let me know.


> >
> > Thanks.
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro


