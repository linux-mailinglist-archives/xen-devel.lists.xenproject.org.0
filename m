Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A88812EC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695938.1086283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwaM-00044L-Lf; Wed, 20 Mar 2024 14:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695938.1086283; Wed, 20 Mar 2024 14:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwaM-00042X-Ix; Wed, 20 Mar 2024 14:06:30 +0000
Received: by outflank-mailman (input) for mailman id 695938;
 Wed, 20 Mar 2024 14:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmwaK-00042D-UR
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:06:28 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0972849e-e6c3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:06:25 +0100 (CET)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6918781a913so32374326d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:06:25 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 r9-20020a056214124900b00690bee954fasm7837027qvv.98.2024.03.20.07.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 07:06:23 -0700 (PDT)
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
X-Inumbo-ID: 0972849e-e6c3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710943584; x=1711548384; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+QDRk+amPbBKzZEemO6HkI/eqkqSQhCB2bFOtRbCSI=;
        b=CwMXKzd3A7vk7e70z1tTAd9/0NSHCGm1gSHCNJQU2f+eziKSu2G57nceXlaNC8XNzn
         C5n6Of9LQXMW9ZAbqPCRILBHoYIVa2edQv1e3Hc54oBfhro18TH6iG1ZKzelZhLLvXHG
         wSPbKNUX39/RBU/8TmbbIGQ8+lZvbPrSbCFEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943584; x=1711548384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+QDRk+amPbBKzZEemO6HkI/eqkqSQhCB2bFOtRbCSI=;
        b=Ia3YkepD3pluj357SCU9UcBsbZHa+ynI7rzvkx1vkxi4JFB/QgbHnbNlvM8NKumVa3
         R3a1+pRtT1+Ap6BJWL0+JZ8NuanKCle60dTXXDHU/2Gv1FjEMl4UnMo+q/vIrwqWaB8U
         n5HhD9dUa7JTj4Hu6vk5wfydRVBsmeE4Mc4CNigZydpH04tXZNfubeKMZVwZOGkhD9hT
         viWL0cdOIhY4+XNXfL/Aiq62mni5zvlqbSdpNaf1wCo+4UkFP5KtIrogGzMV0ugQXZf8
         QmIhig5cRppgu0ep1DNG2hxGQAqIkCluB7mou6RNGKSdlzg+Kt0+m+AdDxAiynaznfGf
         laFw==
X-Gm-Message-State: AOJu0YzYcDtrFEhi+0d3LkN3oUVP88fwlyvWYuIBv1kRJqePL7PRsqM7
	DX36J4nbaR+inIj7DNyqBvdISAYxoy9sXZZKlQxe98dT6JcnHtJ9n/90CnIf3U4=
X-Google-Smtp-Source: AGHT+IHLlhNYXE/6kGIuOV8RyQJkz94+F4ngG91XstEjeLrP2GB6zVYg8utY4QOPO06XiJPBcAjhWQ==
X-Received: by 2002:a05:6214:12c7:b0:690:c13f:ebc5 with SMTP id s7-20020a05621412c700b00690c13febc5mr17218960qvv.63.1710943584066;
        Wed, 20 Mar 2024 07:06:24 -0700 (PDT)
Date: Wed, 20 Mar 2024 15:06:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
Message-ID: <ZfrtXXgqkeom3uVV@macbook>
References: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
 <Zfq-mNNfG6I7diJw@macbook>
 <c9f31608-3ff9-45d1-83e9-60541a8ec0f9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9f31608-3ff9-45d1-83e9-60541a8ec0f9@suse.com>

On Wed, Mar 20, 2024 at 11:58:50AM +0100, Jan Beulich wrote:
> On 20.03.2024 11:46, Roger Pau Monné wrote:
> > On Tue, Mar 19, 2024 at 02:28:12PM +0100, Jan Beulich wrote:
> >> With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
> >> functions") having removed the sole place where d->g_iommu would be set
> >> to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
> >> latest from its 2nd if(). With it dropped, all other stuff in the file
> >> is unused, too. Delete iommu_guest.c altogether.
> >>
> >> Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
> >> struct mmio_reg for being unused with the unused g_iommu also dropped
> >> from struct arch_iommu.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> I wasn't sure how far to further go with removing the body of
> >> parse_ppr_log_entry(), or perhaps even the entire function, and then
> >> further up to all PPR logging code. Hence why for now I've merely
> >> commented out the function call into the file being deleted (which of
> >> course Misra isn't going to like). Thoughts / suggestions?
> >>
> >> I further wonder whether set_iommu_guest_translation_control() should
> >> have been invoked independent of guest-IOMMU actually being enabled. IOW
> >> that may want purging, too. Along these lines iommuv2_enabled may also
> >> want dropping, for not having any consumer left. Much like has_viommu()
> >> and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
> >> public interface.

I would drop it all.  The public interface part is not stable anyway,
as it's a domctl, but I would be fine if you want to keep the X86_EMU_IOMMU.

Thanks, Roger.

