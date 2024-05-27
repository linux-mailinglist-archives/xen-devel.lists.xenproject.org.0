Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D538CFAF1
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730619.1135748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVMz-0004T9-Eg; Mon, 27 May 2024 08:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730619.1135748; Mon, 27 May 2024 08:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVMz-0004Qw-Bp; Mon, 27 May 2024 08:06:13 +0000
Received: by outflank-mailman (input) for mailman id 730619;
 Mon, 27 May 2024 08:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0flO=M6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBVMx-0004Qq-VO
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:06:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa00ddb7-1bff-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 10:06:09 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-420180b58c5so44361875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:06:09 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089ae976sm99890605e9.38.2024.05.27.01.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 01:06:08 -0700 (PDT)
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
X-Inumbo-ID: fa00ddb7-1bff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716797169; x=1717401969; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UCNZOPVcSv6vgS5x24ELfr5/tjnkICUuAG3SIv/QHNM=;
        b=jKPTSqY1z5tltO2mMhTbgWP9yK5rJCNCRkJIIqQgmjqziTCy1CWrXvHrdPjcsb99RJ
         kyqZ3fRCIK6aACXP0lZ1dBYZiqKvScKnLTlUbNraKfTz3uowe5a57F+ELSqWAK8jdmzh
         01K79P2sqsYryD0PdbsCVJUMbNpEStAHQvtyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797169; x=1717401969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCNZOPVcSv6vgS5x24ELfr5/tjnkICUuAG3SIv/QHNM=;
        b=C8BFC7EMVtUqnD6eZ64/NesYYHJv+uCNFwzC7xXpNjnpj1APPsN5gV1UXFPfZFi7H6
         g6i9gOFqN3h8lU69TpumkqpMIOw5yZVmiL4mGDb1+8AYDpua14bJmr3L4jpYGNf4fuLX
         bJ67kXeUhCIOTdD7xsXCISRQFE5Ab9ah43qtDi0+LfRKX0s9iU5XPwbSPWxYOyGmIEZ4
         ViLL4/bq1JMMCrAhxZuvototW9Q3QWEaOW1oS2tS7kui9bJVhrMGZxktAgWM7DqET6bV
         VeSbQPT29CSuGmcz9CQPRTDNcB6Kzml1cZ3oItq5VOY92rnqxh1Ria4GPodIjk6yRNe0
         wHgg==
X-Gm-Message-State: AOJu0YzZeUTetQMcipeodcE4nRyup+YDcImo+C1MwUP9/OPOLp49SY35
	elJeA29Cqa6xRgW22uljri46/j9QHCzn0fOLCWfCfBYWth5Dz2gfCs44rJV3vBY=
X-Google-Smtp-Source: AGHT+IHSJSvQdnZzenFvFruvxK3Dm5P//mmkDbY65D90oaTnglYrgIB45e5seH+GnEjPJPf3jixtNw==
X-Received: by 2002:a05:600c:4592:b0:41a:bdaf:8c78 with SMTP id 5b1f17b1804b1-421089b2201mr73713255e9.8.1716797169111;
        Mon, 27 May 2024 01:06:09 -0700 (PDT)
Date: Mon, 27 May 2024 10:06:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 7/8] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
Message-ID: <ZlQ-7w0Kmzlmvfb1@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <87a2a4589e330472b7260ff6ab513744596a4488.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlBSPYCpEAosNVzo@macbook>
 <1e16ffa9-3f6c-43ed-b36c-55fe132c8145@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e16ffa9-3f6c-43ed-b36c-55fe132c8145@cloud.com>

On Fri, May 24, 2024 at 06:03:22PM +0100, Alejandro Vallejo wrote:
> On 24/05/2024 09:39, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:26PM +0100, Alejandro Vallejo wrote:
> > 
> > Also you could initialize x2apic_id at definition:
> > 
> > const struct test *t = &tests[j];
> > struct cpu_policy policy = { .x86_vendor = vendors[i] };
> > int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);
> > uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);
> 
> Seeing this snippet I just realized there's a bug. The second loop
> should use j rather than i. Ugh.

Well, you shadow the outer variable with the inner one, which makes it
still fine.  Yet I don't like that shadowing much.  I was going to
comment, but for the requested change you need to not shadow the outer
loop variable (in the example chunk I've used 'j' to signal the outer
loop index).

> >> +}
> >> +
> >>  uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
> >>  {
> >> +    uint32_t shift = 0, x2apic_id = 0;
> >> +
> >> +    /* In the absence of topology leaves, fallback to traditional mapping */
> >> +    if ( !p->topo.subleaf[0].type )
> >> +        return id * 2;
> >> +
> >>      /*
> >> -     * TODO: Derive x2APIC ID from the topology information inside `p`
> >> -     *       rather than from vCPU ID. This bodge is a temporary measure
> >> -     *       until all infra is in place to retrieve or derive the initial
> >> -     *       x2APIC ID from migrated domains.
> > 
> > I'm a bit confused with this, the policy is domain wide, so we will
> > always need to pass the vCPU ID into x86_x2apic_id_from_vcpu_id()?
> > IOW: the x2APIC ID will always be derived from the vCPU ID.
> > 
> > Thanks, Roger.
> 
> The x2APIC ID is derived (after the series) from the vCPU ID _and_ the
> topology information. The vCPU alone will work out in all cases because
> it'll be cached in the vlapic hvm structure.
> 
> I guess the comment could be rewritten as "... rather than from the vCPU
> ID alone..."

Yup, that's clearer :).

Thanks, Roger.

