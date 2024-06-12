Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783C90561C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739412.1146437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPTA-0005jl-GJ; Wed, 12 Jun 2024 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739412.1146437; Wed, 12 Jun 2024 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPTA-0005gY-D1; Wed, 12 Jun 2024 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 739412;
 Wed, 12 Jun 2024 15:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHPT8-0005ZN-Jd
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:00:58 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ee1b19-28cc-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:00:56 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-44055ca3103so23964531cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:00:56 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-440bf2d4468sm29640381cf.9.2024.06.12.08.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:00:55 -0700 (PDT)
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
X-Inumbo-ID: 91ee1b19-28cc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718204456; x=1718809256; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxZP0hKUEW2kZeY+yafFRnwUKUsUxP+QHgSC1avzSHc=;
        b=EsRcOH0iqpQrE95+URHef3QdljAaGD+GmN4+nulsZPFzwRbR5eRAYZmsv2prnHkTiq
         1Hz+dhEGrS1bqfov2G+CNeiH3K22M40APN1oqb1nnz22mqa7nKqobJBCBsQ7OLuc9r1A
         duzO0Pa8nEjk6frri5TJNW5s2r8V6B6Ack/ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204456; x=1718809256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxZP0hKUEW2kZeY+yafFRnwUKUsUxP+QHgSC1avzSHc=;
        b=I9Rvb2IqGN859Iyfupr13UCKTfZWhZI85yKEhg2eopfSkGVjmPL6ZuOGEZw1X5yo9Z
         GbsKK8JiKGcn5oqTLRLE1T59O9lTLwlHcYYe8ABoOHBjJZzd95t7a0Ock1E4zqvRWYY0
         Z9xqkmIyP6voiBJKgWFdRZV7tVUAjqjQKc+jOyQKxJaWMtdY9Ro4aC8pVYJgDqtQQII0
         DIvL2nRvPBLhH7/38gFSNMEcu+IL2K7y9F4mvDaK+bCI9xUXO6fWR+4lZ0GZy7/7Gx9/
         OKJ9iJtbwmahdl8rjKnoFk7bNuHPk/09q9N7hjcUDkx7bPxzd4/kAyoXrp6TOjOsebNO
         KFJA==
X-Gm-Message-State: AOJu0YwTvC+InmlYObc5fdKln/1vaAi31i4rcDYA9HFk5Y/3rRKQNKNo
	7I0IOQdFJMa8+JdTTXxccjF8hp5I9bZNPDiHsRsOUm+qzSQPKL3fT10IeJUDpCs=
X-Google-Smtp-Source: AGHT+IGPyL4Km+M0jYWUgVXQvWNL/m6sF3b1HMSqHI63rPS86O4XF6l7h+EeJmLqOgJRplBMznZKPg==
X-Received: by 2002:ac8:7d0c:0:b0:441:5994:fd48 with SMTP id d75a77b69052e-4415ac7354fmr14283441cf.63.1718204455763;
        Wed, 12 Jun 2024 08:00:55 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:00:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 3/3] x86/EPT: drop questionable mfn_valid()
 from epte_get_entry_emt()
Message-ID: <Zmm4JdaLL0oRALL_@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com>

On Wed, Jun 12, 2024 at 03:17:38PM +0200, Jan Beulich wrote:
> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
> access to actual MMIO space should not generally be restricted to UC
> only; especially video frame buffer accesses are unduly affected by such
> a restriction.
> 
> Since, as of ???????????? ("x86/EPT: avoid marking non-present entries
> for re-configuring"), the function won't be called with INVALID_MFN or,
> worse, truncated forms thereof anymore, we call fully drop that check.
> 
> Fixes: 81fd0d3ca4b2 ("x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I do think this is the way to go (removing quirks from
epte_get_entry_emt()), however it's a risky change to make at this
point in the release.

If this turns out to cause some unexpected damage, it would only
affect HVM guests with PCI passthrough and PVH dom0, which I consider
not great, but tolerable.

I would be more comfortable with making the change just not so close
to the release, but that's where we are.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder if you should explicitly mention that if adding the
mfn_valid() check was done to ensure all mappings to MMIO are created
with effective UC caching attribute it won't be fully correct either.
Xen could map those using a different effective caching attribute by
virtue of host MTRRs being in effect plus Xen chosen PAT attributes.

Thanks, Roger.

