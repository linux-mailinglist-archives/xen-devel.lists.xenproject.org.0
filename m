Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C20904DAE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738920.1145789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJ36-0001A0-Va; Wed, 12 Jun 2024 08:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738920.1145789; Wed, 12 Jun 2024 08:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJ36-00017S-Rb; Wed, 12 Jun 2024 08:09:40 +0000
Received: by outflank-mailman (input) for mailman id 738920;
 Wed, 12 Jun 2024 08:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHJ35-00017M-Ep
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:09:39 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c266f0d-2893-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:09:37 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7955841fddaso68316685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:09:37 -0700 (PDT)
Received: from localhost ([46.222.2.38]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7956b8d6038sm286669185a.11.2024.06.12.01.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:09:35 -0700 (PDT)
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
X-Inumbo-ID: 1c266f0d-2893-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718179776; x=1718784576; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7ywAhhvLAK4IhY6eRe1keaABENQyDZEJGYffq9r5Og=;
        b=l4zUhnVTZNX1PNxO29VCC6F8XSmpA5KoRhJ5ryZdnhWhBOnPBvw+inHVImZBffWwHo
         Qay1eyTOiQJoPRvvNEOs/5ooV3BfblaSCJQnY8s00OrolhYdl8fi1sI2oWSjp9tsl06m
         VBGnYGtDjQAeV8HGrrISXXhq+R/IW9yS421Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179776; x=1718784576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7ywAhhvLAK4IhY6eRe1keaABENQyDZEJGYffq9r5Og=;
        b=r+TeBe3lL91/vUemPp4Iobf4jmUL15TecZVBSsXo0oOuyx6JroFEF13njKZtED9s0L
         eHLYoIT9/x+HnZa64bV3wlsgwleqMKh0O1Sq8XbDP1boFAxLlrBACW7JWwq19G/M4gDl
         7JqUgemn8VQElvGiS1wZYbDs+LjpfUe20J0V2sy8010L8iXwPMlrytX1XdnhcPETfMoO
         HEKWmlQ+HuDwtMXSO0NALTgzWn2cXchcdMqYqWdmVfec0hCTJgCX3D8aHdFBDJG5g8sQ
         B4aDcA+3qrOPBoMGv/jxd39K+70qYEb8kSbckTZUOScuojD7UJ0aQEqNkQZ6gBs/L7Qp
         QPhA==
X-Forwarded-Encrypted: i=1; AJvYcCWGAyrT08BH4NhN68vDnEeMW+npgkSfsRsHWfBXITy2wFcqx/itG3MKLX+CdO3qfV97/IgjK6pklxWIBd4qDtERZzAw46/Dn39NTRWnxZ8=
X-Gm-Message-State: AOJu0YwJgjcP3JXtECyiKBuW0wnByqbaEvtfkfkw9QJRqOO98GA2Pppr
	aQ2IzMrri/72i0kM1ozmYx8n2abeLLnVNTi8TA4Qf9qJTg8U9+LMUpoWDS+Z2bw=
X-Google-Smtp-Source: AGHT+IEO6VEeG1fc1ZRiL+XsLLigphmueKuTA95tN9EfbEeI69e4qNpY+O5pq08Qm6vBE12oTaTsTA==
X-Received: by 2002:a05:620a:43a7:b0:795:4997:38e2 with SMTP id af79cd13be357-797c32ad662mr620809185a.33.1718179776300;
        Wed, 12 Jun 2024 01:09:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:09:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/7] x86/smp: do not use shorthand IPI destinations in
 CPU hot{,un}plug contexts
Message-ID: <ZmlXve3rV2Vx9bH7@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-2-roger.pau@citrix.com>
 <615582c8-c153-424d-bce4-eb0c903d28ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <615582c8-c153-424d-bce4-eb0c903d28ad@suse.com>

On Tue, Jun 11, 2024 at 09:42:39AM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> > a cpu_hotplug_{begin,done}() region the function will still return success,
> > because a CPU taking the rwlock in read mode after having taken it in write
> > mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
> 
> I'm not happy to see you still have this claim here. The behavior may (appear
> to) defeat the purpose here, but as expressed previously I don't view that as
> being a general pattern.

Right.  What about replacing the paragraph with:

"Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
a cpu_hotplug_{begin,done}() region the function will still return success,
because a CPU taking the rwlock in read mode after having taken it in write
mode is allowed.  Such corner case makes using get_cpu_maps() alone
not enough to prevent using the shorthand in CPU hotplug regions."

I think the rest is of the commit message is not controversial.

> > as it should always return false when called with a CPU hot{,un}plug operation
> > is in progress.  Otherwise the logic in send_IPI_mask() is wrong, as it could
> > decide to use the shorthand even when a CPU operation is in progress.
> > 
> > Introduce a new helper to detect whether the current caller is between a
> > cpu_hotplug_{begin,done}() region and use it in send_IPI_mask() to restrict
> > shorthand usage.
> > 
> > Fixes: 5500d265a2a8 ('x86/smp: use APIC ALLBUT destination shorthand when possible')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Modify send_IPI_mask() to detect CPU hotplug context.
> > ---
> >  xen/arch/x86/smp.c       |  2 +-
> >  xen/common/cpu.c         |  5 +++++
> >  xen/include/xen/cpu.h    | 10 ++++++++++
> >  xen/include/xen/rwlock.h |  2 ++
> >  4 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> > index 7443ad20335e..04c6a0572319 100644
> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -88,7 +88,7 @@ void send_IPI_mask(const cpumask_t *mask, int vector)
> >       * the system have been accounted for.
> >       */
> >      if ( system_state > SYS_STATE_smp_boot &&
> > -         !unaccounted_cpus && !disabled_cpus &&
> > +         !unaccounted_cpus && !disabled_cpus && !cpu_in_hotplug_context() &&
> >           /* NB: get_cpu_maps lock requires enabled interrupts. */
> >           local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) &&
> >           (park_offline_cpus ||
> 
> Along with changing the condition you also want to update the comment to
> reflect the code adjustment.

I've assumed the wording in the commet that says: "no CPU hotplug or
unplug operations are taking place" would already cover the addition
of the !cpu_in_hotplug_context() check.

Thanks, Roger.

