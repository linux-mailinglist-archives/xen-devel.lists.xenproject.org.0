Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD43196548
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 12:02:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI9BK-0005Rg-00; Sat, 28 Mar 2020 10:59:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8l4x=5N=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jI9BI-0005RZ-UM
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:59:12 +0000
X-Inumbo-ID: 17ff83cb-70e3-11ea-8b30-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17ff83cb-70e3-11ea-8b30-12813bfff9fa;
 Sat, 28 Mar 2020 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VGg5s7LEJBJSjdd7dc6tJwEHIukPmsXF3AhFSl6pAIw=; b=Gjw41TjCHal50+3D9RqSoYCaEl
 1uW/tgD+7sAd3PBUwpmzTA3ORQu/UljqcJ3CiseKN47oGyO7MkWWnZcn1Ygvbzgffqzi9j4hmC+5f
 lt/Ck90SR26YmPVcVxmIAJqGdgjWByvYIGAJk9cisZn7Zp28vQANXY8d+ueD/oE/exo0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9Ao-0007xm-Ca; Sat, 28 Mar 2020 10:58:42 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9Ao-0006uB-2Z; Sat, 28 Mar 2020 10:58:42 +0000
Date: Sat, 28 Mar 2020 10:58:39 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200328105839.rf3igs2h7o7ujj7s@debian>
References: <20200328053834.GA12753@simran-Inspiron-5558>
 <20200328101840.GN28601@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200328101840.GN28601@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Simran Singhal <singhalsimran0@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Mar 28, 2020 at 11:18:40AM +0100, Roger Pau Monné wrote:
> Thanks!
> 
> On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index f049920196..a53d3ca2a4 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
> >  u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content = (u64 *) vvmcs;
> > +    u64 *content = vvmcs;
> >      int offset;
> >      u64 res;
> >  
> > @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
> >  void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content = (u64 *) vvmcs;
> > +    u64 *content = vvmcs;
> 
> While there, would you mind changing u64 to uint64_t? (here and
> above)
> 

To add some context to this comment: new code has been using uintX
variants. We want to migrate existing code gradually. Since you're
touching these lines anyway, it is a good chance to do the migration.

When you do this in your next version, please add a line in the commit
message saying something along the line that "Take the chance to change
some u64 to uint64_t".

Wei.

