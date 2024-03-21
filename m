Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC65885605
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 09:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696248.1086982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnE51-0000YU-6b; Thu, 21 Mar 2024 08:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696248.1086982; Thu, 21 Mar 2024 08:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnE51-0000Vx-45; Thu, 21 Mar 2024 08:47:19 +0000
Received: by outflank-mailman (input) for mailman id 696248;
 Thu, 21 Mar 2024 08:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbdV=K3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rnE4y-0000Vr-Ra
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 08:47:16 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d558028-e75f-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 09:47:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso421732f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 01:47:14 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d50c6000000b0033e891d97d6sm16586668wrt.107.2024.03.21.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 01:47:13 -0700 (PDT)
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
X-Inumbo-ID: 9d558028-e75f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711010834; x=1711615634; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uMIPc+f6qWf6tFxu6Y08l44Ec9duM17QHH0kOb8tPo0=;
        b=jbWFo3dy+IlthVOomKuB+kz3zS9B1TrZ1ApRqq3+pqOb6ejV6ysywUjKqgevu5MkkU
         xnCAhxbahE/q/4YS0srPCU7qUrGiC1VY+eUe0c+R25QifiHbn5HcmwhBBHZ/rtmf/VJy
         FKSBUOfBZ+qg83WwKjndVjndbCv2Da5gs7XSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711010834; x=1711615634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMIPc+f6qWf6tFxu6Y08l44Ec9duM17QHH0kOb8tPo0=;
        b=s/7Y8RKfmozjVX3UafF0GiJGNOS5kTKqR590ASt7rl33P2ggRnzx/xy840yRLyhDST
         fTn/lbj2DruZMTd32VAXWgIfJlx5UkDgfYPNYQwiiLUf6uuWq1UJVwacrSoj32mmOVIK
         Hvj+eYsggIKi2MIDypBnEael9Eh+HUPvd/Pc+464xDEnqtQDH9T7cchmj2XYXVlrLYm5
         m640bcdLmXis+mbmsoEhIU6GaApngjsDCMh+DINmOm1H9cKxGOAmKw1Yrx2qqG3hD6LG
         rrYaUekYHH1b62oA0To1acKr43LVSLABfp6aV15ChqngW4KN6cU4kcFB8gQl3vKb9xCY
         B6XQ==
X-Gm-Message-State: AOJu0YzW9VokHROD2y22ZWGu+itubNqDKlNMtvm+5G4PQ+bkXSxq0Vfa
	56TR9cYubm7YXr9Umx5LS2/GrfGoVWPVlWWQiHUhalCiZDjbkE4WPI5JnFkMflA=
X-Google-Smtp-Source: AGHT+IEiWVGkCHwvR1kIM8qdaevEWdpAhdoYWkhx1355sDghoPJ/lZjjseztygtXpX5AZ7/rhAQ15w==
X-Received: by 2002:a05:6000:e4d:b0:33e:ce08:79b5 with SMTP id dy13-20020a0560000e4d00b0033ece0879b5mr1646686wrb.9.1711010833659;
        Thu, 21 Mar 2024 01:47:13 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:47:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
Message-ID: <Zfv0EOXgJww611ZZ@macbook>
References: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
 <Zfq-mNNfG6I7diJw@macbook>
 <c9f31608-3ff9-45d1-83e9-60541a8ec0f9@suse.com>
 <ZfrtXXgqkeom3uVV@macbook>
 <fef02fa7-3f13-4c51-8971-da59c8b85563@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fef02fa7-3f13-4c51-8971-da59c8b85563@suse.com>

On Wed, Mar 20, 2024 at 03:51:55PM +0100, Jan Beulich wrote:
> On 20.03.2024 15:06, Roger Pau Monné wrote:
> > On Wed, Mar 20, 2024 at 11:58:50AM +0100, Jan Beulich wrote:
> >> On 20.03.2024 11:46, Roger Pau Monné wrote:
> >>> On Tue, Mar 19, 2024 at 02:28:12PM +0100, Jan Beulich wrote:
> >>>> With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
> >>>> functions") having removed the sole place where d->g_iommu would be set
> >>>> to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
> >>>> latest from its 2nd if(). With it dropped, all other stuff in the file
> >>>> is unused, too. Delete iommu_guest.c altogether.
> >>>>
> >>>> Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
> >>>> struct mmio_reg for being unused with the unused g_iommu also dropped
> >>>> from struct arch_iommu.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >>>> ---
> >>>> I wasn't sure how far to further go with removing the body of
> >>>> parse_ppr_log_entry(), or perhaps even the entire function, and then
> >>>> further up to all PPR logging code. Hence why for now I've merely
> >>>> commented out the function call into the file being deleted (which of
> >>>> course Misra isn't going to like). Thoughts / suggestions?
> >>>>
> >>>> I further wonder whether set_iommu_guest_translation_control() should
> >>>> have been invoked independent of guest-IOMMU actually being enabled. IOW
> >>>> that may want purging, too. Along these lines iommuv2_enabled may also
> >>>> want dropping, for not having any consumer left. Much like has_viommu()
> >>>> and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
> >>>> public interface.
> > 
> > I would drop it all.  The public interface part is not stable anyway,
> > as it's a domctl, but I would be fine if you want to keep the X86_EMU_IOMMU.
> 
> By "all" you also mean the PPR logging code? That's where I felt I might
> be going too far ...

It's up to you.  I've taken a look, and the PPR logging code seems to
be tied to guest IOMMU also?

Since PPR could be used for other purposes it's likely fine to leave
it in, albeit I won't oppose if you want to remove it (maybe there's
some purpose I'm missing).

Thanks, Roger.

