Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B604C1769
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277443.473941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtoM-0006Ux-Kz; Wed, 23 Feb 2022 15:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277443.473941; Wed, 23 Feb 2022 15:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtoM-0006T2-Hd; Wed, 23 Feb 2022 15:44:14 +0000
Received: by outflank-mailman (input) for mailman id 277443;
 Wed, 23 Feb 2022 15:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qKPW=TG=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nMtoL-0006Sw-Gm
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:44:13 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71fb25f3-94bf-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:44:12 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id c7so4676218qka.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 07:44:12 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254])
 by smtp.gmail.com with ESMTPSA id w4sm1967338qko.123.2022.02.23.07.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 07:44:10 -0800 (PST)
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
X-Inumbo-ID: 71fb25f3-94bf-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qPOo47PyG8X2d4eUbL3FNOFSsot7fkINAnAp6Uq4U1A=;
        b=PviQguxOcYzUm+3Mvg2QHe2aHw7ClrLL/dIOj0XHD4eTl43eHIicNUew2wMhy6pttQ
         clvUgWz8U43gKZuI+ky6cMOPge6RNIpUoVyK0JYyGzK7KTFmK65v99TfbBwnEJr29aPt
         1Li8dtxR9xqqGcN/FHzGYY7cCnL7+B8/vxLR8ZFXK0ExXtPuM5fJXSTIL4cnMPlhxVhu
         9qTXfJs7EzmEERlSf/otFjAO4gR4/sO6fTShsLH6CK6aOm/PQqTH3fNgxYJyZ3+TVZzf
         B7aSJ/fus01fOzcTGvfVDmOlRcukwbv7qALchWHFnXoRVw+UFTX9iXQEPS7ktAt9Sag1
         SNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qPOo47PyG8X2d4eUbL3FNOFSsot7fkINAnAp6Uq4U1A=;
        b=gZ7P/gDaAUPwSrFR8K3b3f4qErnfsiDUEZMfIYgeu4uDcjdt36AmVNvf6wkjY8yMDf
         PMhUEt+YMhgvO768YRhW5555H2DyhsWIwb56XIHpHPCCCADxJKz+5GIUYb0Ft5W4DYgq
         IAnZ6Dl7vCGMyBY0JDIyKKbRePveSYlFinELJF4wa1YdqgibgGFIQrPaE7la2TU5ZkL3
         CxgSHAc1330gysTUqVvkby0hOAyIhgDXFq9CM+wW7BWS2XMNr2QY+WUQQsV9evgObFBi
         QAOV9x8CxDXV+QAIWDu4pIIGb83dxEFn7Lc5y5mkKjiMikKygqeQ2BtHxsHxnmWRgK7M
         rkAQ==
X-Gm-Message-State: AOAM533ibm/iq5mebtGridRV9nOomUDdZYGKnX1iEQPnU3S4/4tgDBWh
	lq2kY1nvM/X3sEJSOs+QFst4UuCIHELrgQ==
X-Google-Smtp-Source: ABdhPJydNPy9+Juy42iIpE056BYTtL2Wd+D6Ef3AkK1Ye5BwT1EQFmZnR59VD4wxrselnJWjC+beGA==
X-Received: by 2002:a37:bd81:0:b0:47d:7533:1578 with SMTP id n123-20020a37bd81000000b0047d75331578mr150092qkf.732.1645631050901;
        Wed, 23 Feb 2022 07:44:10 -0800 (PST)
Message-ID: <c33c785601ad03e3fd02b3cb792f2333d46441c9.camel@gmail.com>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
From: Alex Olson <this.is.a0lson@gmail.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Date: Wed, 23 Feb 2022 09:44:09 -0600
In-Reply-To: <YgYeHSm1RO03yy/t@Air-de-Roger>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
	 <YgYeHSm1RO03yy/t@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Roger,

See my other reply which is more detailed.  While enabling reads of
"MSR_IA32_ENERGY_PERF_BIAS" did not cause any effect in my case, it is one of a
handful of exceptions in which MSRs are writeable but not readable. I believe
this may result in potentially unexpected behavior in  read-check/modify-write
cases.

As such, I now see that my original patch of making these MSRs globally readable
is too lenient and the conditions should likely be restricted to the same as
those in which writes are allowed.

In my particular case, it looks like all my troubles resulted from the BIOS
setting MSR_IA32_THERM_CONTROL to an invalid value and the recent code change
prevented dom0 from seeing (and correcting) it...

Regards,

-Alex


On Fri, 2022-02-11 at 09:28 +0100, Roger Pau Monné wrote:
> On Thu, Feb 10, 2022 at 11:27:15AM -0600, Alex Olson wrote:
> > I'm seeing strange performance issues under Xen on a Supermicro server with
> > a Xeon D-1541 CPU caused by an MSR-related commit.
> > 
> > Commit 322ec7c89f6640ee2a99d1040b6f786cf04872cf 'x86/pv: disallow access to
> > unknown MSRs'
> > surprisingly introduces a severe performance penality where dom0 has about
> > 1/8th
> > the normal CPU performance. Even even when 'xenpm' is used to select the
> > performance governor and operate the CPU at maximum frequency, actual CPU
> > performance is still 1/2 of normal (as well as using
> > "cpufreq=xen,performance").
> > 
> > The patch below fixes it but I don't fully understand why.
> > 
> > Basically, when *reads* of MSR_IA32_THERM_CONTROL are blocked, dom0 and
> > guests (pinned to other CPUs) see the performance issues.
> 
> You only mention MSR_IA32_THERM_CONTROL here...
> 
> > For benchmarking purposes, I built a small C program that runs a "for
> > loop" 
> > 4Billion iterations and timed its execution. In dom0, the
> > performance issues
> > also cause HVM guest startup time to go from 9-10
> > seconds to almost 80 seconds.
> > 
> > I assumed Xen was managing CPU frequency and thus blocking related MSR
> > access by dom0 (or any other domain). However,  clearly something else
> > is happening and I don't understand why.
> > 
> > I initially attempted to copy the same logic as the write MSR case. This
> > was effective at fixing the dom0 performance issue, but still left other
> > domains running at 1/2 speed. Hence, the change below has no access control.
> > 
> > 
> > If anyone has any insight as to what is really happening, I would be all
> > ears
> > as I am unsure if the change below is a proper solution.
> > 
> > Thanks
> > 
> > -Alex
> > 
> > ---
> > ---
> >  xen/arch/x86/pv/emul-priv-op.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> > index 7f4279a051..f254479bda 100644
> > --- a/xen/arch/x86/pv/emul-priv-op.c
> > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > @@ -970,6 +970,18 @@ static int read_msr(unsigned int reg, uint64_t *val,
> >          *val = 0;
> >          return X86EMUL_OKAY;
> >  
> > +    /* being unable to read MSR_IA32_THERM_CONTROL seems to significantly
> > affect
> > +     * dom0 and thus HVM guest startup performance, as well as PVH VMs.
> > +     */
> > +    case MSR_IA32_THERM_CONTROL:
> > +    case MSR_IA32_ENERGY_PERF_BIAS:
> 
> ...yet in the patch you also allow access to
> MSR_IA32_ENERGY_PERF_BIAS, which makes me wonder whether
> MSR_IA32_THERM_CONTROL is the only required one.
> 
> It could help to post full logs Xen + Linux dmesgs.
> 
> Is this reproducible with different Linux versions?
> 
> Thanks, Roger.


