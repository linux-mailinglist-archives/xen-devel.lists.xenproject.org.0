Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14804942919
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768327.1179091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4dq-0006IY-6w; Wed, 31 Jul 2024 08:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768327.1179091; Wed, 31 Jul 2024 08:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4dq-0006GE-43; Wed, 31 Jul 2024 08:25:02 +0000
Received: by outflank-mailman (input) for mailman id 768327;
 Wed, 31 Jul 2024 08:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ4dp-0006G8-4Y
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:25:01 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fa057b2-4f16-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 10:24:59 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7a1dac7f0b7so343344485a.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 01:24:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73b46b4sm710216885a.53.2024.07.31.01.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 01:24:57 -0700 (PDT)
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
X-Inumbo-ID: 5fa057b2-4f16-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722414298; x=1723019098; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFmD+9qFxifgdMS/MAeVrQLxD634+tJpYhYKO71zBAA=;
        b=F2aWzszYOlEcTvTfPTZmlYIjrs5jc57kLZ4K0T2FBsDcPc5fnJIHkwJeEYHiKdXSGX
         SIqnuiAbbRVuQbS7fL+xYUOTvJVBRCzDpx18v1ez4FB1ZIsw/j7ICdpP7OPDcBtm0CwP
         bgrBIEQ6wyfGYeHpArJce+2AxImU8Lcin2VZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414298; x=1723019098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFmD+9qFxifgdMS/MAeVrQLxD634+tJpYhYKO71zBAA=;
        b=RdXtk9QgVoJFEBUMf7XR9yJqoFJluKtJ7J/gvTDFAhNDBIuoc7mViBQ4L8sINojZaL
         8Z1iiAFL+GgRd4jZ2aez6iT1LVBn1Qe4vZnZESVOk8nYCkTWXX93z6t/Kt5hcvs0JGmS
         S2EP+NvUnUncm53WeGz3kvee0if/n7iksf31+s0L/Z3K8qNRypFHp8lmC+P1dN3UCTq9
         l//2neg4NO4IWZizgd6fpdyNhgMKXhzeDD11Tj21aVt3bJ0TrPjLkv6NZDFaWVjzuyPZ
         EWvs3KQtSMOsIv0w/yf4WNfFRHHTN86R8Qy8IJjjXGdRaL9s0HGa7y12aZLmhHwmZc7X
         Fgzw==
X-Gm-Message-State: AOJu0Yw3Okf2vnM4lsTgL9OvQ6qWcgajjOJ5KOhjKk5si7wHVwLZFone
	J1rem/p0XABg/0IkkAGrEgegsAD9npDCPGgyVMAIii06n8oauls/esvGL+ME5ds=
X-Google-Smtp-Source: AGHT+IF7Az4aWmSYGyC+LG9P+ilEz7w9jTlEfvOkDzBw+M8OiKEtY3/WWHmRr/75+mCexVevy/NQ1g==
X-Received: by 2002:a05:620a:4488:b0:79d:7a40:1bea with SMTP id af79cd13be357-7a1e522a3c6mr1718557285a.7.1722414297669;
        Wed, 31 Jul 2024 01:24:57 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:24:55 +0200
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
Message-ID: <Zqn014wCEfWhyo1-@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>

On Wed, Jul 31, 2024 at 09:58:28AM +0200, Jan Beulich wrote:
> On 31.07.2024 09:50, Roger Pau Monné wrote:
> > On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
> >> --- a/xen/arch/x86/physdev.c
> >> +++ b/xen/arch/x86/physdev.c
> >> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>          if ( !d )
> >>              break;
> >>  
> >> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
> >> +        /* Only mapping when the subject domain has a notion of PIRQ */
> >> +        if ( !is_hvm_domain(d) || has_pirq(d) )
> > 
> > I'm afraid this is not true.  It's fine to map interrupts to HVM
> > domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
> > allow HVM domains to route interrupts from devices (either emulated or
> > passed through) over event channels.
> > 
> > It might have worked in the past (when using a version of Xen < 4.19)
> > because XENFEAT_hvm_pirqs was enabled by default for HVM guests.
> > 
> > physdev_map_pirq() will work fine when used against domains that don't
> > have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.
> > 
> > I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
> > keep the code in do_physdev_op() as-is.  You will have to check
> > whether the current paths in do_physdev_op() are not making
> > assumptions about XENFEAT_hvm_pirqs being enabled when the calling
> > domain is of HVM type.  I don't think that's the case, but better
> > check.
> 
> Yet the goal is to disallow mapping into PVH domains. The use of
> has_pirq() was aiming at that. If that predicate can't be used (anymore)
> for this purpose, which one is appropriate now?

Why do you want to add such restriction now, when it's not currently
present?

It was already the case that a PV dom0 could issue
PHYSDEVOP_{,un}map_pirq operations against a PVH domU, whatever the
result of such operation be.

Thanks, Roger.

