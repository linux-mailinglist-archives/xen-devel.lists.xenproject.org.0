Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31BE2810CD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1886.5718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIiP-0007qG-4k; Fri, 02 Oct 2020 10:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1886.5718; Fri, 02 Oct 2020 10:55:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIiP-0007pr-15; Fri, 02 Oct 2020 10:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1886;
 Fri, 02 Oct 2020 10:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkBu=DJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kOIiN-0007pk-Es
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:55:03 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d26940dc-e28b-4a65-8e5a-1ad379f9ba60;
 Fri, 02 Oct 2020 10:55:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z4so1311135wrr.4
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 03:55:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m3sm1295808wrs.83.2020.10.02.03.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 03:55:00 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MkBu=DJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kOIiN-0007pk-Es
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:55:03 +0000
X-Inumbo-ID: d26940dc-e28b-4a65-8e5a-1ad379f9ba60
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d26940dc-e28b-4a65-8e5a-1ad379f9ba60;
	Fri, 02 Oct 2020 10:55:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z4so1311135wrr.4
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 03:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N6VpQiXKj+GORzzS9h7PJ+smoR5FAKDuenaJpH2axqk=;
        b=bCmecWwnOngQlMm4j0KeBCYnhZKb0IZFd8wxIa1hg4r++yDFlvXqLN4hjfnKTuXQ2o
         MCXrSvpW1KoQqs2G6HjGc6zdbfYyNQQLpO2PgZbKdGzFTMCZHX9y5iyjv8XY86vn2tka
         qUxrBzkhkI9c7GvTFyn0+bru35TCaNBXFwpdSrWBKWDG00GioCGKR9XM4TkVe5J6Aq6Z
         CiFWvgrJde2CAVJWR/Hc8vwfvoUNgya2eOknS+lrWbiwTOi1EHLwYwOPoCcCE3zCrLCu
         LT+duL1tbDQ7laE80Fn+uvcLHP+NpBIq2far8tzTcbzt+OSgVfREawN7CgOpvIZmEOiM
         2baQ==
X-Gm-Message-State: AOAM532CcbsBKLksZB4l2IjEiRuTj2SxA5+OLtWjVALACnnq5VEIw5oP
	jLSs97yN8SSt9TdjDMvIhXg=
X-Google-Smtp-Source: ABdhPJwRIvygLgHC0qIPX84xXNJKjN74tbZ7gVzKVem/rriQ3ZIsiFcaw52T2n/VDF5msL9sPcuGQg==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr2350397wrs.304.1601636101244;
        Fri, 02 Oct 2020 03:55:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id m3sm1295808wrs.83.2020.10.02.03.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 03:55:00 -0700 (PDT)
Date: Fri, 2 Oct 2020 10:54:59 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
Message-ID: <20201002105459.ka366qj7bxaz5tea@liuwe-devbox-debian-v2>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-2-roger.pau@citrix.com>
 <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
 <59e20dff55464b7fbee9737348fae751@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59e20dff55464b7fbee9737348fae751@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 09:24:57AM +0000, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 02 October 2020 09:48
> > To: Roger Pau Monne <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; Durrant, Paul
> > <pdurrant@amazon.co.uk>
> > Subject: RE: [EXTERNAL] [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
> > 
> > CAUTION: This email originated from outside of the organization. Do not click links or open
> > attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On 30.09.2020 12:40, Roger Pau Monne wrote:
> > > --- a/xen/arch/x86/hvm/vlapic.c
> > > +++ b/xen/arch/x86/hvm/vlapic.c
> > > @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
> > >
> > >  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> > >  {
> > > -    struct vcpu *v = vlapic_vcpu(vlapic);
> > > -    struct domain *d = v->domain;
> > > -
> > >      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> > > -        vioapic_update_EOI(d, vector);
> > > +        vioapic_update_EOI(vector);
> > >
> > > -    hvm_dpci_msi_eoi(d, vector);
> > > +    hvm_dpci_msi_eoi(vector);
> > >  }
> > 
> > What about viridian_synic_wrmsr() -> vlapic_EOI_set() ->
> > vlapic_handle_EOI()? You'd probably have noticed this if you
> > had tried to (consistently) drop the respective parameters from
> > the intermediate functions as well.
> > 
> > Question of course is in how far viridian_synic_wrmsr() for
> > HV_X64_MSR_EOI makes much sense when v != current. Paul, Wei?
> > 
> 
> I don't think it makes any sense. I think it would be fine to only do it if v == current.

Yes, I agree.

Wei.

