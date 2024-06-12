Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A919056BA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739443.1146476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPoa-0003Ew-Rs; Wed, 12 Jun 2024 15:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739443.1146476; Wed, 12 Jun 2024 15:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPoa-0003DE-PJ; Wed, 12 Jun 2024 15:23:08 +0000
Received: by outflank-mailman (input) for mailman id 739443;
 Wed, 12 Jun 2024 15:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHPoZ-0003D8-RP
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:23:07 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2b368f-28cf-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:23:05 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43fb094da40so9496641cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:23:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b07e89f6c9sm31326466d6.79.2024.06.12.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:23:04 -0700 (PDT)
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
X-Inumbo-ID: aa2b368f-28cf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718205784; x=1718810584; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DebMbvDX/E4xNEF8xci3NeCxNb/W5oNFpq3ktstEZy8=;
        b=pBcY9JzunQow3YbntIiVZF+1CL+AxI7D5M5cmDnEtjfsDbC3Spc3uaAE/fUT4XDlAy
         9bP2NERVv2xo6iShT/yoTvygxhP7mR2tOFJxU6hnL/GlQ8phBz81ISc9yY6PzHCUNsta
         k51REf7oG4SRbHF3dAbW9WaGwGlxYM61kVJe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205784; x=1718810584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DebMbvDX/E4xNEF8xci3NeCxNb/W5oNFpq3ktstEZy8=;
        b=L8fJYgR4xaE5h3Qajo30NXav/niDPTK1iQckK79ZcvllQPxI1gICZHmCHEcMpw3t5e
         UIhBdSDhjdy6n6u1r3FocNKl2DYQsqqMgzzUAodfGhEpfXjeK2Zb3YqcoZ7tc6I5avOB
         6H8j6vIpzZXU4Vhu9ivJHO6mhl2lucwN7FazKIVPuMerIy9NjmC6fHP/+NGR3hzgs0yz
         DvbglbCMtk/ZvG9wDbtQSNCf5fyvlyeG6g7MRMGViLSIU75KeKAJ5tkRO9bCicoXxy8j
         W1sn3UVyKEpE6GoduBcZuOkZGoaPjPj39QEVZ5RsYJgDNzkt4Lb9MXiWNKz2HGqY0Z4Z
         I6SA==
X-Gm-Message-State: AOJu0YwHsCYfOzkJs5iAQtInRHpIsxKoNsuS1LHrZI08ZEjMjwIa2pen
	QBU2UTT8o/HMHyTrH5ievQrmo5jn0GxTaoJNpvrCheIEzoVerhlQ4K9AWl/ibig=
X-Google-Smtp-Source: AGHT+IFvNbeEKRw0Fmq2Ul6UDaZQA/n9PO0xmH2Vl9AjyG30J/fnxGzVKyhbVPoDq6gpCBamzEf4AA==
X-Received: by 2002:ad4:5f4e:0:b0:6af:4fcd:3065 with SMTP id 6a1803df08f44-6b089f46738mr116597326d6.19.1718205784473;
        Wed, 12 Jun 2024 08:23:04 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:23:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 2/3] x86/EPT: avoid marking non-present
 entries for re-configuring
Message-ID: <Zmm9VuMjsOMhQCMQ@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>
 <Zmmy_-JqqWRuwvCj@macbook>
 <e944583a-2459-435f-90fb-04bcca18197f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e944583a-2459-435f-90fb-04bcca18197f@suse.com>

On Wed, Jun 12, 2024 at 04:53:14PM +0200, Jan Beulich wrote:
> On 12.06.2024 16:38, Roger Pau Monné wrote:
> > On Wed, Jun 12, 2024 at 03:16:59PM +0200, Jan Beulich wrote:
> >> For non-present entries EMT, like most other fields, is meaningless to
> >> hardware. Make the logic in ept_set_entry() setting the field (and iPAT)
> >> conditional upon dealing with a present entry, leaving the value at 0
> >> otherwise. This has two effects for epte_get_entry_emt() which we'll
> >> want to leverage subsequently:
> >> 1) The call moved here now won't be issued with INVALID_MFN anymore (a
> >>    respective BUG_ON() is being added).
> >> 2) Neither of the other two calls could now be issued with a truncated
> >>    form of INVALID_MFN anymore (as long as there's no bug anywhere
> >>    marking an entry present when that was populated using INVALID_MFN).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> v2: New.
> >>
> >> --- a/xen/arch/x86/mm/p2m-ept.c
> >> +++ b/xen/arch/x86/mm/p2m-ept.c
> >> @@ -650,6 +650,8 @@ static int cf_check resolve_misconfig(st
> >>              if ( e.emt != MTRR_NUM_TYPES )
> >>                  break;
> >>  
> >> +            ASSERT(is_epte_present(&e));
> > 
> > If this is added here, then there's a condition further below:
> > 
> > if ( !is_epte_valid(&e) || !is_epte_present(&e) )
> > 
> > That needs adjusting AFAICT.
> 
> I don't think so, because e was re-fetched in between.

Oh, I see, we take the opportunity to do the recalculation for all the
EPT entries that share the same page table.

> > However, in ept_set_entry() we seem to unconditionally call
> > resolve_misconfig() against the new entry to be populated, won't this
> > possibly cause resolve_misconfig() to be called against non-present
> > EPT entries?  I think this is fine because such non-present entries
> > will have emt == 0, and hence will take the break just ahead of the
> > added ASSERT().
> 
> Right, hence how I placed this assertion.

OK, just wanted to double check.

> >> @@ -941,6 +932,22 @@ ept_set_entry(struct p2m_domain *p2m, gf
> >>              need_modify_vtd_table = 0;
> >>  
> >>          ept_p2m_type_to_flags(p2m, &new_entry);
> >> +
> >> +        if ( is_epte_present(&new_entry) )
> >> +        {
> >> +            bool ipat;
> >> +            int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
> >> +                                         i * EPT_TABLE_ORDER, &ipat,
> >> +                                         p2mt);
> >> +
> >> +            BUG_ON(mfn_eq(mfn, INVALID_MFN));
> >> +
> >> +            if ( emt >= 0 )
> >> +                new_entry.emt = emt;
> >> +            else /* ept_handle_misconfig() will need to take care of this. */
> >> +                new_entry.emt = MTRR_NUM_TYPES;
> >> +            new_entry.ipat = ipat;
> >> +        }
> > 
> > Should we assert that if new_entry.emt == MTRR_NUM_TYPES the entry
> > must have the present bit set before the atomic_write_ept_entry()
> > call?
> 
> This would feel excessive to me. All writing to new_entry is close together,
> immediately ahead of that atomic_write_ept_entry(). And we're (now) writing
> MTRR_NUM_TYPES only when is_epte_present() is true (note that it's not "the
> present bit").

Fair enough.

Thanks, Roger.

