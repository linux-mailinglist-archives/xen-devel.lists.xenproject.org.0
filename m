Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E5905632
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739420.1146447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPV4-0006PF-Qe; Wed, 12 Jun 2024 15:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739420.1146447; Wed, 12 Jun 2024 15:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPV4-0006NH-NR; Wed, 12 Jun 2024 15:02:58 +0000
Received: by outflank-mailman (input) for mailman id 739420;
 Wed, 12 Jun 2024 15:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHPV3-0006NB-H8
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:02:57 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d88e52f2-28cc-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:02:55 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7954dcf3158so313902285a.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:02:55 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79689c09e28sm270178385a.121.2024.06.12.08.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:02:53 -0700 (PDT)
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
X-Inumbo-ID: d88e52f2-28cc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718204574; x=1718809374; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ke6anFFy82rvVNho3c9tbKmAMX7YrT9i5uibTvjd4Dk=;
        b=XmBEn2S/R1FhstoXs48uS3TxLWNbjQJF6ow+X4KdYwr1ASMcatDsJ4aNVktRzgX3fK
         vpN6L2jwZ1INTaSBTKIeM9rmn1AdYWy7KXsgpaYrJpMmGJ1TqkzlMZhKQbu1+ip+XFJh
         KqwlcIvA8rT9moY1YCKQvN9GgYSNuduAIcA6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204574; x=1718809374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ke6anFFy82rvVNho3c9tbKmAMX7YrT9i5uibTvjd4Dk=;
        b=dUj7N26eFINdiArv3KjUJbrixrsBE0mVniH4zis4e5oH2kAhxwVGUkVI+iKxS301ku
         uCrv3bKTdZqqF1AyZEr//HSuwhbLuq4luce4TcdBALTIGnk3wx40BD5q2tasLbFrJ00C
         ConfheAfy4PhmwgtWwXF/nBc/LN4DkkjNm4Or9nlj8mhVmxBjTDeYLNvWNbi34dublGR
         0vh86U8m8I5OAKtg0bDn7rFA3dhW511WeKlVMrmf2gtWHexrEg6y7tomNRlVP5+MIiCx
         rIhE7NMIJrEqfARQjk2K4ZYO4h5F8xkQFHC2O6su1K+oTIfU/tDufdk71DpitvGS9ZQa
         Oo7g==
X-Gm-Message-State: AOJu0Ywm1lBnIej/BFUL3vZV4qtPhFA18+ri2IDft0QHiaac5aZRMBBZ
	wA+vSlgZhxE4o0mQzJkJ9GfbI9/qHKWEhRGsbYbGin2RndIcvxsG9F8qQrcxmok=
X-Google-Smtp-Source: AGHT+IHiWCp4URa5VNmtZvDPALCUuObEtqJMiW36OOdyA+LIp9lO8xBCphBTcAp2/7QIXepRAhGoCg==
X-Received: by 2002:a05:620a:410a:b0:795:5828:547b with SMTP id af79cd13be357-797f61d6b1dmr211028685a.61.1718204574145;
        Wed, 12 Jun 2024 08:02:54 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:02:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking
 in epte_get_entry_emt()
Message-ID: <Zmm4nFOw_wN0PKt0@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>
 <ZmmskwdoKvAotRk-@macbook>
 <b2985742-75e4-4974-be9d-be088d728731@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2985742-75e4-4974-be9d-be088d728731@suse.com>

On Wed, Jun 12, 2024 at 04:47:12PM +0200, Jan Beulich wrote:
> On 12.06.2024 16:11, Roger Pau Monné wrote:
> > On Wed, Jun 12, 2024 at 03:16:37PM +0200, Jan Beulich wrote:
> >> mfn_valid() granularity is (currently) 256Mb. Therefore the start of a
> >> 1Gb page passing the test doesn't necessarily mean all parts of such a
> >> range would also pass.
> > 
> > How would such a superpage end up in the EPT?
> > 
> > I would assume this can only happen when adding a superpage MMIO that
> > has part of it return success from mfn_valid()?
> 
> Yes, that's the only way I can think of.
> 
> >> Yet using the result of mfn_to_page() on an MFN
> >> which doesn't pass mfn_valid() checking is liable to result in a crash
> >> (the invocation of mfn_to_page() alone is presumably "just" UB in such a
> >> case).
> >>
> >> Fixes: ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Of course we could leverage mfn_valid() granularity here to do an
> >> increment by more than 1 if mfn_valid() returned false. Yet doing so
> >> likely would want a suitable helper to be introduced first, rather than
> >> open-coding such logic here.
> > 
> > We would still need to call is_special_page() on each 4K chunk,
> 
> Why? Within any block for which mfn_valid() returns false, there can be
> no RAM pages and hence also no special ones. It's only blocks where
> mfn_valid() returns true that we'd need to iterate through page-by-page.

Oh right, I was thinking the other way around (mfn_valid() returning
true), never mind.

> > at
> > which point taking advantage of the mfn_valid() granularity is likely
> > to make the code more complicated to follow IMO.
> 
> Right, this making it more complicated is the main counter argument. Hence
> why I think that if to go such a route at all, it would need some new
> helper(s) such that at the use sites things still would remain reasonably
> clear.

We could also add an extra check to exit the loop early if special
pages have been found but don't match the current loop index, as it's
all special pages or none.

Thanks, Roger.

