Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793437F0EF0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 10:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636509.992067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50Vm-0001Sc-Uj; Mon, 20 Nov 2023 09:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636509.992067; Mon, 20 Nov 2023 09:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50Vm-0001Ql-Rw; Mon, 20 Nov 2023 09:24:10 +0000
Received: by outflank-mailman (input) for mailman id 636509;
 Mon, 20 Nov 2023 09:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r50Vk-0001QZ-NL
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 09:24:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d858c94-8786-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 10:24:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32df66c691dso2600218f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 01:24:06 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b003316be2df7fsm9542799wrx.17.2023.11.20.01.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 01:24:05 -0800 (PST)
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
X-Inumbo-ID: 8d858c94-8786-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700472246; x=1701077046; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXMXqISN0kxnxQ5R+YAi/MKlVT3efrlNOG0/pIOUKqU=;
        b=uzYQfukV4D9AHKB6PO9FL6+MS5ukAZAjCBxD4WoWgb02YwwPjgrJGFKR4HeLdvmgZp
         kYMAF5N1HM/HfkAF3odnfKgqZDGxniflielcO2jd9nskVcYHu7wC7X887gcjv7dl2uxl
         dmJuiHzPpB4SD7UZO7r8NXlvLTXK6N+X2diT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700472246; x=1701077046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXMXqISN0kxnxQ5R+YAi/MKlVT3efrlNOG0/pIOUKqU=;
        b=JJoJaRArmB2/3HYmMKpSw23No6/V6BdZQtDkTCCkzJ69JSYF4h5MxPMxyTwSux7yL8
         g5+Zh3ynpp+CrbKevlJFnLSZGa2cZpuatWmz9CcOhgFB0bYPRrgUQLrcI3h9egKfvwuH
         EI654trZPPcjjTTHPDClgWu/Tz0DJNgnRH6U670HSij5LOUTuCKHoLzzy5rjhMHXt9xa
         JP3VNjqwodn1AAj408SWmxK9SGupS5u/08zPrD4je657RIJg/eqxW5zc8/lTB3wb2oPL
         WlHauIIZY+YoVTdV0M7h4SGWOGB5tQVVggWfPZVusP1/XG2uxxZE5e6GFGfdPmTtjKJg
         PKLw==
X-Gm-Message-State: AOJu0YzWRHmcV9VjgLkBPq4dtmZx6MGHo8AuCiQE2SkHvXBdkgu9LQS0
	NbBX3dUsSDzQmThuNb5ORVwR/A==
X-Google-Smtp-Source: AGHT+IHLHqz8yGnYTeV2Xbh/NcwSgO4TG1tt7fprmAAMi8G4j9+WggCfPy8U3A7TCDc2bTWXVaGhEQ==
X-Received: by 2002:a5d:448c:0:b0:331:6961:6cc7 with SMTP id j12-20020a5d448c000000b0033169616cc7mr4238824wrq.25.1700472246115;
        Mon, 20 Nov 2023 01:24:06 -0800 (PST)
Date: Mon, 20 Nov 2023 10:24:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVsltWxNzrlGZNV0@macbook.local>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
 <2bd9028d-bd3d-435f-8788-38f3460ea188@suse.com>
 <ZVsYeB7DG/F2EdM7@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVsYeB7DG/F2EdM7@dingwall.me.uk>

On Mon, Nov 20, 2023 at 08:27:36AM +0000, James Dingwall wrote:
> On Fri, Nov 17, 2023 at 10:56:30AM +0100, Jan Beulich wrote:
> > On 17.11.2023 10:18, James Dingwall wrote:
> > > On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
> > >> On 16/11/2023 4:15 pm, James Dingwall wrote:
> > >>> Hi,
> > >>>
> > >>> Per the msr_relaxed documentation:
> > >>>
> > >>>    "If using this option is necessary to fix an issue, please report a bug."
> > >>>
> > >>> After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> > >>> started experiencing a BSOD at boot with one of our Windows guests.  We found
> > >>> that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> > >>> problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> > >>> the following messages were caught as the BSOD happened:
> > >>>
> > >>> (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> > >>> (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> > >>> (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
> > >>>
> > >>> I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> > >>> series from last month:
> > >>>
> > >>> https://patchwork.kernel.org/project/xen-devel/list/?series=796550
> > >>>
> > >>> Picking out just a small part of that fixes the problem for us. Although the
> > >>> the patch is against 4.15.5 I think it would be relevant to more recent
> > >>> releases too.
> > >>
> > >> Which version of Windows, and what hardware?
> > >>
> > >> The Viridian Crash isn't about the RDMSR itself - it's presumably
> > >> collateral damage shortly thereafter.
> > >>
> > >> Does filling in 0 for that MSR also resolve the issue?  It's model
> > >> specific and we absolutely cannot pass it through from real hardware
> > >> like that.
> > >>
> > > 
> > > Hi Andrew,
> > > 
> > > Thanks for your response.  The guest is running Windows 10 and the crash
> > > happens in a proprietary hardware driver.  A little bit of knowledge as
> > > they say was enough to stop the crash but I don't understand the impact
> > > of what I've actually done...
> > > 
> > > To rework the patch I'd need a bit of guidance, if I understand your
> > > suggestion I set the MSR to 0 with this change in emul-priv-op.c:
> > 
> > For the purpose of the experiment suggested by Andrew ...
> > 
> > > diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> > > index ed97b1d6fcc..66f5e417df6 100644
> > > --- a/xen/arch/x86/pv/emul-priv-op.c
> > > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > > @@ -976,6 +976,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
> > >          *val = 0;
> > >          return X86EMUL_OKAY;
> > >  
> > > +    case MSR_TEMPERATURE_TARGET:
> > > +        *val = 0;
> > > +        return X86EMUL_OKAY;
> > > +
> > >      case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
> > >      case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
> > >      case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
> > 
> > ... you wouldn't need this (affects PV domains only), and ...
> > 
> > > and this in vmx.c:
> > > 
> > > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > > index 54023a92587..bbf37b7f272 100644
> > > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > > @@ -3259,6 +3259,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> > >          if ( !nvmx_msr_read_intercept(msr, msr_content) )
> > >              goto gp_fault;
> > >          break;
> > > +
> > > +    case MSR_TEMPERATURE_TARGET:
> > > +        *msr_content = 0;
> > > +        break;

I think the preference now is to add such handling directly in
guest_rdmsr()?  Protected with a:

if ( !(cp->x86_vendor & (X86_VENDOR_INTEL)) )
    goto gp_fault;

Thanks, Roger.

