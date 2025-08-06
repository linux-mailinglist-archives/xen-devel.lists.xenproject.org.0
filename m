Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30FB1C1D0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071326.1434799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZBs-0005sI-Ey; Wed, 06 Aug 2025 08:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071326.1434799; Wed, 06 Aug 2025 08:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZBs-0005qr-Bv; Wed, 06 Aug 2025 08:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1071326;
 Wed, 06 Aug 2025 08:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujZBr-0005ql-MN
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:08:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a0c7b4-729c-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 10:08:01 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso24974685e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:08:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abeb2sm22109845f8f.11.2025.08.06.01.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 01:08:00 -0700 (PDT)
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
X-Inumbo-ID: 78a0c7b4-729c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754467681; x=1755072481; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9SUiH/pHxyo+DUUrU1j7l7IscwNtbDN0Et7nFRn40D4=;
        b=chIUd/vJth+x7NGfB9NNiu+yDXzj1gsntk/uucwTBM2/YARJ/GVHk7gmQKSR4DSTrL
         BWW1uThe3Kg1upawfEaWzvqvpnAX9eCEfd8L3/PXmyJeVDb+3dUxCSNTgPEzeFXrvONC
         i69RW1aeYVGiJddF18/4iWxSuqh2lGVf3LfRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467681; x=1755072481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SUiH/pHxyo+DUUrU1j7l7IscwNtbDN0Et7nFRn40D4=;
        b=M3hQcectyaX58j2Hglyr+nZmCBas7s4DUtMLJKmouSwBD43V0xZsdCWwdnBSMZ74cZ
         g9V37MVc5VGVlvrUJq37RBwgvUUmJnDs+ZJoHEM+bpMr8UoJZ2D8qIHVKfZiOAWBUvHM
         R9wbLPsor0kbo+aoqHAeEn/x/ZLrC8r5GSVcp4tyEOIdOtvTXLNiuIV6DkMbmB438aJO
         nFIzlaarVgEf7lv8jvtZtJ3J6ZrrHdBxd49mbocpvr+41MSew2gSrJpP6CjJUiMaZuch
         VfCNhpxjexD90gQevq5zG/WE1vlMspkpRZP3ZLN0LX2MVwstjJiXKjh48+VNr5oZPl93
         eRtg==
X-Forwarded-Encrypted: i=1; AJvYcCXwhAcRUIKiyle9psLjVvibdqqDYRUxOJ0Jbnt0oIBhWDR+5TcX6v7iGveeqE2N59IltiZt4/4a17s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNhGJNHIHJokjvUalyBt6GJ6/2yCeSIDR3m5SRG0zDKadfpwm7
	ifkLeLVXMJRk08nzXRS1AnmMOpqGYuQFbEGtAGMfDyYzGCQAWwOlpeVXP3NVKH9MdRM=
X-Gm-Gg: ASbGncs3IkNl1jYpXlr9bIO+GhAzFBiHZW1nXJf5G0fgT0ZS20Fm46iMWUcDExZm1IW
	nVWKWHmCHCIFKpjWDrpkGU3fvL+aPhI4GrThgQpMNhEbDxWhUaowz8FZ9Qrp2RjEjK2cvyJNn+j
	kVRQhY2LfejGFVma8xbHuuU0N27s5nKuiMb8+IKk95AnAdHhaoNkOglVzsmdYEPmW6Q/G9HE3uX
	EIL/qrnkBIvv+18b1uAs2k2LSxDjjxpKvoHJ1YVK1ZJ00x6QRJHkx1IJ6i4zyCty6Jr0kao19nq
	Aju1QFYhPDvPS3NlgTFA6UlTjpQqGzIigC1QJMx7IBqnBJtZ9qITyhndDqYhn0pTERP4rSWWQ7y
	25Yg1JM16XH5Nj1ZeM/jNa4MSv7/J4Hlz28VhmMPMnjEN/PQrb6rFCqpa5wmilLUByw==
X-Google-Smtp-Source: AGHT+IGBlppivrw9V+ULsnJsS546Rg39u8wCRch26v0wMP7D3qPaqvd2JO3zQOGtvfHq4q9iKgeIfQ==
X-Received: by 2002:a05:600c:19d1:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-459e744f690mr12512285e9.8.1754467680750;
        Wed, 06 Aug 2025 01:08:00 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:07:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aJMNX2RRum-w0_Mu@macbook.local>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <889e32d2-b50f-4d61-b04b-6c73472abf23@suse.com>
 <BL1PR12MB5849F389E5CC38582EE9DBD9E722A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0c8458ea-9977-4ba9-8668-b09a65cf9172@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c8458ea-9977-4ba9-8668-b09a65cf9172@suse.com>

On Tue, Aug 05, 2025 at 10:40:00AM +0200, Jan Beulich wrote:
> On 05.08.2025 10:27, Chen, Jiqian wrote:
> > On 2025/8/5 16:10, Jan Beulich wrote:
> >> On 05.08.2025 05:49, Jiqian Chen wrote:
> >>> When MSI-X initialization fails vPCI will hide the capability, but
> >>> remove of handlers and data won't be performed until the device is
> >>> deassigned.  Introduce a MSI-X cleanup hook that will be called when
> >>> initialization fails to cleanup MSI-X related hooks and free it's
> >>> associated data.
> >>>
> >>> As all supported capabilities have been switched to use the cleanup
> >>> hooks call those from vpci_deassign_device() instead of open-code the
> >>> capability specific cleanup in there.
> >>>
> >>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>> ---
> >>> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >>> ---
> >>> v9->v10 changes:
> >>> * Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().
> >>
> >> Isn't this rather an omission in an earlier change, and hence may want to
> >> come separately and with a Fixes: tag?
> > This is not really an omission, after all, all the cleanup hooks were implemented at the end of this series.
> > And judging from the commit message(which was written by Roger in v8), Roger also agreed to add them in this patch.
> 
> I disagree. Of the two xfree()-s you remove here from vpci_deassign_device(),
> one should have been removed by patch 3 already. Which would require the
> part of the patch here to be put in place earlier on.

I don't think a Fixes tag is strictly required - the previous
functionality will not lead to malfunction, albeit it's best to use
the cleanup hooks introduced here.  Up until the hooks are executed as
part of vpci_deassign_device() the xfree() calls need to remain in
place.

Conceptually it would have been better to add the calls to the
->cleanup() hooks in vpci_deassign_device() in the same patch that
added the vpci_init_capabilities() ->init() and ->cleanup() logic.

It was my bad for noting this only when reviewing patch 8, and then
not asking for it to be placed in the right patch.

Thanks, Roger.

