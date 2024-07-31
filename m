Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA39429A8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768370.1179141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ53l-0005aJ-9N; Wed, 31 Jul 2024 08:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768370.1179141; Wed, 31 Jul 2024 08:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ53l-0005YM-6V; Wed, 31 Jul 2024 08:51:49 +0000
Received: by outflank-mailman (input) for mailman id 768370;
 Wed, 31 Jul 2024 08:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ53j-0005YG-8n
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:51:47 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2fbe92-4f1a-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 10:51:45 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7a1dac7f0b7so344730385a.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 01:51:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fae79d9sm71507006d6.125.2024.07.31.01.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 01:51:43 -0700 (PDT)
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
X-Inumbo-ID: 1d2fbe92-4f1a-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722415904; x=1723020704; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ulR44O/BCkVle3MfM+faGf1y99Kxlb/+j+KMixW829E=;
        b=R0ym/hPpOJ9pnTsPyqQkWPW5ZsxS4sb2ICHVMHiItDLKiXIQ72x9b7A1jrtfforwSO
         ljZDBwN1Rqs9dXdve4EhrciDsG22jWaBpSDnJ6sVKqSVr+moeR3BMxAjZhwC516lZ3bv
         GEvWBL6R6X9CpVRKRcZfBploVXNcSFdiHxCHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415904; x=1723020704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR44O/BCkVle3MfM+faGf1y99Kxlb/+j+KMixW829E=;
        b=m1HX7g4ZDLixrzBcyr4PqvesZaWKgEzmMH+WDsRmbcZEnsEnl7PSD8DKgrR+hC1xqa
         uuzghAZ8V9W8PT8X9zYwyWf6Cb+atanfkBQTcnzCecOs+qzaOyl+OzcVfS6qV8VF77hN
         nA0iJXn8NKGVMA/HUX7XqnhpMBQht9JnagLYn5C22zaGwmA3Jhjmojh+tSfWmc1BTP2Y
         Jb808jD1845zLPs1JkEHzzeLJ+MTp/xRqJ5qqnJLpZJWuOaHdqUV7lcXbYGjvezSs0Hg
         dkJzb5oUQlKoO6/zof7FIR952Xsigq07P9kFrav54oR/mYkOIlW/9teVbTXmaANQa4YA
         3EQA==
X-Gm-Message-State: AOJu0Yzf2Blz0SCWV7spUFDOtQ0ZAZP3o2khxH2ptYao+9PYB3ssGp3t
	3qsq69FKZH1F1IR48QR5g7lGUcrdAVSEJGVkWCPKTpXbq+A0ty7NMCGzv4jvM1A=
X-Google-Smtp-Source: AGHT+IHqTs+HZr+9lMFE++xp4jEh7IfsXIBE0B79UQ/33TBM3jrqOeWfUf23B3GfrDH5t0YSjp7EoQ==
X-Received: by 2002:a05:6214:29ce:b0:6b7:aeb2:e796 with SMTP id 6a1803df08f44-6bb55a1367amr181312226d6.33.1722415904263;
        Wed, 31 Jul 2024 01:51:44 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:51:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <Zqn7HEuooChgRCuf@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
 <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>

On Wed, Jul 31, 2024 at 10:40:46AM +0200, Jan Beulich wrote:
> On 31.07.2024 10:24, Roger Pau Monné wrote:
> > On Wed, Jul 31, 2024 at 09:58:28AM +0200, Jan Beulich wrote:
> >> On 31.07.2024 09:50, Roger Pau Monné wrote:
> >>> On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
> >>>> --- a/xen/arch/x86/physdev.c
> >>>> +++ b/xen/arch/x86/physdev.c
> >>>> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>          if ( !d )
> >>>>              break;
> >>>>  
> >>>> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
> >>>> +        /* Only mapping when the subject domain has a notion of PIRQ */
> >>>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
> >>>
> >>> I'm afraid this is not true.  It's fine to map interrupts to HVM
> >>> domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
> >>> allow HVM domains to route interrupts from devices (either emulated or
> >>> passed through) over event channels.
> >>>
> >>> It might have worked in the past (when using a version of Xen < 4.19)
> >>> because XENFEAT_hvm_pirqs was enabled by default for HVM guests.
> >>>
> >>> physdev_map_pirq() will work fine when used against domains that don't
> >>> have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.
> >>>
> >>> I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
> >>> keep the code in do_physdev_op() as-is.  You will have to check
> >>> whether the current paths in do_physdev_op() are not making
> >>> assumptions about XENFEAT_hvm_pirqs being enabled when the calling
> >>> domain is of HVM type.  I don't think that's the case, but better
> >>> check.
> >>
> >> Yet the goal is to disallow mapping into PVH domains. The use of
> >> has_pirq() was aiming at that. If that predicate can't be used (anymore)
> >> for this purpose, which one is appropriate now?
> > 
> > Why do you want to add such restriction now, when it's not currently
> > present?
> > 
> > It was already the case that a PV dom0 could issue
> > PHYSDEVOP_{,un}map_pirq operations against a PVH domU, whatever the
> > result of such operation be.
> 
> Because (a) that was wrong and (b) we'd suddenly permit a PVH DomU to
> issue such for itself.

Regarding (b) a PVH domU issuing such operations would fail at the
xsm_map_domain_pirq() check in physdev_map_pirq().

I agree with (a), but I don't think enabling PVH dom0 usage of the
hypercalls should be gated on this.  As said a PV dom0 is already
capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
domU.

Thanks, Roger.

