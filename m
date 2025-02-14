Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD81A359E4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 10:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888643.1297983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirkH-0001sY-SV; Fri, 14 Feb 2025 09:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888643.1297983; Fri, 14 Feb 2025 09:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirkH-0001qB-PG; Fri, 14 Feb 2025 09:12:25 +0000
Received: by outflank-mailman (input) for mailman id 888643;
 Fri, 14 Feb 2025 09:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tirkG-0001q5-7N
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 09:12:24 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbca1e81-eab3-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 10:12:22 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220c8cf98bbso35818145ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 01:12:21 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242761676sm2758614b3a.142.2025.02.14.01.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 01:12:19 -0800 (PST)
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
X-Inumbo-ID: cbca1e81-eab3-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739524340; x=1740129140; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6ksSrydvEaxG1KGifv1V0DSDUMcUVG0wu6HavrEL3E=;
        b=DPpsb6sEKQphilGrqv///oKSa45GlOrLjCDt4NPxDXrplYcqWjMTpYq3OMNPWNsLhK
         CQi9QO0aRjmCBgimgFsTcWfuPoz4jo2XTUvXHXqceuAReKbTI3xY6DKQEdyjjxFiprSo
         Bkfs5KnClW4iuZBifWC+JHqXeoHv2F9aYO2pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524340; x=1740129140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6ksSrydvEaxG1KGifv1V0DSDUMcUVG0wu6HavrEL3E=;
        b=BKHgInT4RITSf85h9YonvVrATKzOnxj8nLo5XUa+ObI5AAcIuq9kExbW4xPwOZkFR/
         VRaiHoXc6U01A1ei6qEWgGViyPKHt6WMUwZujhOTUQ6+R4MIjEE7tTc+zCVREyWtCJHh
         vgV8TFeqCCYLcGfqBpWwfd0qH3QT53T+i3nIRQhe0ta6oa49tJDFu3BD3WORvVxvj0BB
         lH2b6ZRkzL+ZxzwFqT9P9G33Rug6fe3mjsRClYJ+xc3fm10/QtYbmHjK9jRYbE1EYHcE
         +7leF83c0RHxEJ6nLQHXkFJ0emVgYGQYAdtyWqm3SSoixwqNnr1zWT0FnILLyWiiw8p2
         nhog==
X-Forwarded-Encrypted: i=1; AJvYcCUefAo2SWTT7g7eQ4KxX0rXdbzN8DyAH7gBPxvMr+F2BVqsyoZIl1aZwm/7omlb1PdUR6g9yxwcAjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCvWqMwXbmEkyT/EM7BNv1nwAwFrggZgMaekWL4FjMlyZIBhDp
	Qru0mpwCDzTNEsfV9ThGPPmrdYWXuSuyeUJ9CSk8utf0CL6Xcd3Vptc69suafaPxY6P8u3MloGE
	t
X-Gm-Gg: ASbGncsEKFtwIOu5uz/02Ry/uQ59pPLWTJT4i4R6+1wqJ1xW+lpLYP1SoubJgQi/OP4
	fHgNaAxHqrvek5jMAtbXxLkV8b3toXskcavw1LeN5N5xHSuh0y6X02Is+g1ZNmZkU0rSi43GXzj
	VW6OZwUf55fkTEq+NLVxortCPe5/f5xyyXtXh/1fOleWjtDoqoOMYKQPrJUM6MlckJKjcWBXITw
	3P7+8eQYWlNH0mIDtuuQ0MVCVZHa8PA5HNFbZhb+i3owkyzPbdvu+AaJNFcCXhK/o7Z2vMNIxFB
	Ukot3x1VpD3UuavvQclagdkINQ==
X-Google-Smtp-Source: AGHT+IF3E8rHfyUazGAJX/bD6Ub62MwhM6Y9W+dc3DxU1ZelACongodaUe1sHBbgdXkykrwupuZzNQ==
X-Received: by 2002:aa7:88d3:0:b0:731:43ca:5cc6 with SMTP id d2e1a72fcca58-7322c3f4e07mr15529504b3a.15.1739524340486;
        Fri, 14 Feb 2025 01:12:20 -0800 (PST)
Date: Fri, 14 Feb 2025 10:12:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Message-ID: <Z68I7hHo_uj1PPwJ@macbook.local>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
 <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
 <BL1PR12MB5849BDEC2A23731E9281A26FE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z68BPHUxW42KdJPs@macbook.local>
 <BL1PR12MB5849D418700CAF462753D58BE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849D418700CAF462753D58BE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Feb 14, 2025 at 09:01:12AM +0000, Chen, Jiqian wrote:
> On 2025/2/14 16:39, Roger Pau Monné wrote:
> > On Fri, Feb 14, 2025 at 08:22:39AM +0000, Chen, Jiqian wrote:
> >> On 2025/2/14 16:18, Oleksii Kurochko wrote:
> >>>
> >>> On 2/14/25 8:35 AM, Jan Beulich wrote:
> >>>> On 14.02.2025 04:32, Chen, Jiqian wrote:
> >>>>> On 2025/2/11 17:21, Roger Pau Monné wrote:
> >>>>>> On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
> >>>>>>> Some devices, like AMDGPU, support resizable bar capability,
> >>>>>>> but vpci of Xen doesn't support this feature, so they fail
> >>>>>>> to resize bars and then cause probing failure.
> >>>>>>>
> >>>>>>> According to PCIe spec, each bar that supports resizing has
> >>>>>>> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> >>>>>>> handlers to support resizing the size of BARs.
> >>>>>>>
> >>>>>>> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
> >>>>>>> is read-only register and the hardware domain already gets
> >>>>>>> access to it without needing any setup.
> >>>>>>>
> >>>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>> Thank you!
> >>>>> May I know whether this can be merged in Xen version 4.20?
> >>>
> >>> It would be better to merge it after the Xen 4.20 release.
> >>> (It will happen in the next 2 weeks).
> >> Got it. Thank you for reply.
> > 
> > Could you also add an entry to the CHANGELOG.md file to note that
> > ReBAR is now supported on PVH dom0?
> Sure, I will add it in next version. And I think I need to wait until there is a 4.21.0 entry.

Yes, I don't recall if the entry for 4.21 is created as part of the
4.20 release process, or the first commit to introduce a new feature
also adds the boilerplate 4.21 section.

> In SUPPORT.md, do I need to change the sentence " * PCI SR-IOV and Resizable BARs." to " * PCI SR-IOV. "?

Oh, indeed, I forgot about that one.  Yes please, also update
SUPPORT.md.

Thanks, Roger.

