Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157DD937433
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 09:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760913.1170874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUhn3-0003zQ-1u; Fri, 19 Jul 2024 07:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760913.1170874; Fri, 19 Jul 2024 07:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUhn2-0003xu-VN; Fri, 19 Jul 2024 07:12:28 +0000
Received: by outflank-mailman (input) for mailman id 760913;
 Fri, 19 Jul 2024 07:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B1Gh=OT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sUhn2-0003xo-0N
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 07:12:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c3e9ef-459e-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 09:12:26 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so564398f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 00:12:26 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878694a58sm783700f8f.58.2024.07.19.00.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 00:12:25 -0700 (PDT)
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
X-Inumbo-ID: 40c3e9ef-459e-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721373146; x=1721977946; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kE1W8RaJ1HQtlvL6i/+t7H83aLQlSoeznbOsGL4jwMY=;
        b=RK9go39rU+2aL0vVMZZkTtR+zYyfFUvECizMzlz46h7vc0XMOixyQ4Wxm9svKpS8mb
         A0HgxdioTeoZEUdEZvksNFv9Jh0j2/RG+vfbPn0/1+2aiLqMMOZbqDrGOwMLWXcVSBUj
         5wXjmwFzab9M5/fkt7AVFgCIWX+zrskDpHn4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721373146; x=1721977946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE1W8RaJ1HQtlvL6i/+t7H83aLQlSoeznbOsGL4jwMY=;
        b=F6lGMZyz8070173lLvUC4WerzfxcSd9+z/ufH4QAmLyWRAFIaUucsb5LgruEYZbhSm
         hGySeGPp/8271ZXleLl4mTiDmyL3xtVxoBSvrGm2K2K1QgpGtklpMD3EBbspixo2VNFw
         IAkfL4PSgk9zNEd23+aaRMWkXSsppeyhDLqHwbfgAVPd68EK0O+MOee+1TxoSM90X+xR
         EBjPtgmfsQ13euy4WVhF0CWDArO6iIApfbbt355gePdDaegVKFYJSbRtlWuUoJocO7S5
         mIMfuOgThMPpWLMroCwbY9L4Gn+rKz1Kgi0cX//6Ia+wAvijPVifkeNraF3uqhsiDiW2
         yP2g==
X-Forwarded-Encrypted: i=1; AJvYcCUwz4Qx/1c3fRGrPB6lOwrAnuA6Hgwr4ZsckD+YNET2jn7t+B4R0ysZP1LPHh8tyuj48vM2YiIL4ae43HU4+8bZ4iImeMKJkqDawxiZHNQ=
X-Gm-Message-State: AOJu0YzqiXmx28Q7MIK8U+Lf+0rqAKDNtyHQB0NkNWfKqxugA5yjKDA5
	S6H6bvaoMGoSNeKV6ObtqHMbNjkL+C2fz9D27AnpQGLXSCrJ7/e7YssU3Ce7lyo=
X-Google-Smtp-Source: AGHT+IH+6tkbtEqsHAGrJnKM1iLtIhVBXmqWr092XKFbM5DdBiF8E6304zQ0Is38yFJdYC6ckUq1Xg==
X-Received: by 2002:a5d:64aa:0:b0:368:6b56:641b with SMTP id ffacd0b85a97d-3686b5664b4mr2546810f8f.47.1721373145788;
        Fri, 19 Jul 2024 00:12:25 -0700 (PDT)
Date: Fri, 19 Jul 2024 09:12:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: get_pat_flags() is needed only by shadow code
Message-ID: <ZpoR2Hvv7-hqmk53@macbook>
References: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
 <99403a3c-1e4f-4971-a08b-5480e6d1e829@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99403a3c-1e4f-4971-a08b-5480e6d1e829@citrix.com>

On Thu, Jul 18, 2024 at 06:06:54PM +0100, Andrew Cooper wrote:
> On 18/07/2024 11:10 am, Jan Beulich wrote:
> > Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
> > leaving around unreachable/dead code.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -271,6 +271,8 @@ int mtrr_get_type(const struct mtrr_stat
> >     return overlap_mtrr_pos;
> >  }
> >  
> > +#ifdef CONFIG_SHADOW_PAGING
> > +
> >  /*
> >   * return the memory type from PAT.
> >   * NOTE: valid only when paging is enabled.
> > @@ -359,6 +361,8 @@ uint32_t get_pat_flags(struct vcpu *v,
> >      return pat_type_2_pte_flags(pat_entry_value);
> >  }
> >  
> > +#endif /* CONFIG_SHADOW_PAGING */
> > +
> >  static inline bool valid_mtrr_type(uint8_t type)
> >  {
> >      switch ( type )
> 
> While I can see this is true, the fact it is indicates that we have
> bugs/problems elsewhere.
> 
> It is not only the shadow code that has to combine attributes like this,
> so we've either got opencoding elsewhere, or a bad abstraction.
> 
> (This is an observation, rather than a specific objection.)

Won't shadow always need a specific helper, in order to combine both
MTRRs and guest PAT attributes, while HAP only needs to merge MTRR
attributes?

Not that current code couldn't be better structured.

Thanks, Roger.

