Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D019C8EBF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 16:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836599.1252498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBc8u-0002g9-Ex; Thu, 14 Nov 2024 15:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836599.1252498; Thu, 14 Nov 2024 15:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBc8u-0002eL-CR; Thu, 14 Nov 2024 15:52:24 +0000
Received: by outflank-mailman (input) for mailman id 836599;
 Thu, 14 Nov 2024 15:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBc8t-0002eF-8M
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 15:52:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e3a7dfa-a2a0-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 16:52:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so1228913a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 07:52:20 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df56b31sm76736566b.72.2024.11.14.07.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:52:19 -0800 (PST)
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
X-Inumbo-ID: 6e3a7dfa-a2a0-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZlM2E3ZGZhLWEyYTAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTk5NTQwLjExNTg2Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731599539; x=1732204339; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxBLUxl+174iJ9f2SFbtnZCadTkEjvNoBFgtFSSUkMw=;
        b=wSgqoE3ZQAfx98RAboDy5SmQcPV6VUxetf6KO/owCItW1B8aHEfE1S4Q/GykTwwWHB
         ePAjpa5tXD83X+WJb3cXolDBcyWkeU+TcscGTqcg7P4URAr3wN61Y7h+2U6nV2QTdTjU
         N5zWEk5ti/URaK9wDCivQ0UdH/NrKuPIyBgY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731599539; x=1732204339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxBLUxl+174iJ9f2SFbtnZCadTkEjvNoBFgtFSSUkMw=;
        b=KVxfUSni2+0qIPuLLEXQdnV6lJS/vHyPs5dEgWed3JsSQsfikyaNVrwuLQ1i7BdkuB
         41Gwx3lU5uJG1P/3CjcmOKQKFOnk3Foxe6wyiliQTJI3rXBtPP2irlUBqUcv0QLEJWkA
         RREuwlT9tw4zyRnl3edepn6QmhRWU3pmxBq7amZHIx8gew++hB/E3ElZ2SGNOwepTfIB
         TwLzb4IeBb2RhS2Lqf2aZXrirDlfncXwAAmT9TghJ/6ax8wFSL/6a5qwKIz2nyFWeWNR
         TXYrUOuO2gSg8T2b7ye4TZLO8sjwYCcy7z4aSwgTvfKyCet9wgbqwmSmwMDdtEsN8R7d
         dtnA==
X-Gm-Message-State: AOJu0Ywp6KY2vAWs5vvDX8aYsscI6dtA/3xVtR8SI6J0Zs4eN45nCvas
	B7+5inTTldFrHp/JYlTx7IFhzbFWb5QRmsJPTOrmP5p4V8j8knlc4HQDoYMtNx8=
X-Google-Smtp-Source: AGHT+IHtgRAJI/GIP0V/Fl3JKbprGzeKUnoT1v5X9vxsmERRm5QW+ImneZ1OkUBN+0mHWZvvMyhsSg==
X-Received: by 2002:a17:906:478f:b0:a9e:c263:29a7 with SMTP id a640c23a62f3a-aa20cd12f11mr241170566b.23.1731599539450;
        Thu, 14 Nov 2024 07:52:19 -0800 (PST)
Date: Thu, 14 Nov 2024 16:52:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzYcskZ-GZ8HsXfU@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> On 2024/11/13 18:30, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>> and then cause probing failure.
> >>>>
> >>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>> corresponding handler into vpci.
> >>>>
> >>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>
> >>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>> setting the new size.
> >>>
> >>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>> time ago I've made a patch to add support for it, but due to lack of
> >>> hardware on my side to test it I've never submitted it.
> >>>
> >>> My approach would be to detect the presence of the
> >>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>> capability is present force the sizing of BARs each time they are
> >>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>> the capability itself, as resizing can only happen when memory
> >>> decoding is not enabled for the device.  It's enough to fetch the size
> >>> of the BARs ahead of each enabling of memory decoding.
> >>>
> >>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>> is already an expensive operation, the extra sizing is unlikely to
> >>> make much of a difference performance wise.
> >>>
> >>> I've found the following on my git tree and rebased on top of staging:
> >> OK.
> >> Do you need me to validate your patch in my environment?
> > 
> > Yes please, I have no way to test it.  Let's see what others think
> > about the different approaches.
> There are some errors with your method.
> I attached the dmesg and xl dmesg logs.
> From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1

Do you have the output of lspci with the BAR sizes/positions before
and after the resizing?

> 
> I think there is a place that needs to be modified regarding your method,
> although this modification does not help with the above-mentioned errors,
> it is that whether to support resizing is specific to which bar, rather than just determining whether there is a Rebar capability.

Do we really need such fine-grained information?  It should be
harmless (even if not strictly necessary) to size all BARs on the
device before enabling memory decoding, even if some of them do not
support resizing.

I might have to provide a patch with additional messages to see what's
going on.

Thanks, Roger.

