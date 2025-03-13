Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071AA5FAAE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912698.1318915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl1Z-0000FS-8u; Thu, 13 Mar 2025 16:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912698.1318915; Thu, 13 Mar 2025 16:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl1Z-0000Bx-67; Thu, 13 Mar 2025 16:03:09 +0000
Received: by outflank-mailman (input) for mailman id 912698;
 Thu, 13 Mar 2025 16:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsl1X-0000AX-U2
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:03:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fd27ad3-0024-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:02:55 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43948021a45so10221865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:02:55 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df339asm2531944f8f.3.2025.03.13.09.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:02:53 -0700 (PDT)
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
X-Inumbo-ID: 9fd27ad3-0024-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741881774; x=1742486574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yzFVRz4IZSOD2U2A55u08ze08q0scqSfKn70VP4b9YM=;
        b=TZUp1D/S7z8pfZ4VYNBsyMjk5bN1gByhFKaMdk1IqJbgMKrDB7uXs+dviKeBtBZL/W
         Ek/5t0y/0OwMEyr12vrTqdI4oDj4hyX5ZxUTj4wOxjfFarFTECk/IvG/XjvNO5us2iCT
         XVTvoDFqUZDIk1l1B994Q8tXbPeKrBPo8cX8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881774; x=1742486574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzFVRz4IZSOD2U2A55u08ze08q0scqSfKn70VP4b9YM=;
        b=l8MHrsHmdtk065JMsuGmpT6KUfwUw+OjwIyYcYCPoHdUKo0PUEZ50qDWnAAQ5qKhzO
         rhWIT1xa6jWh/fIxa8lCI397s/anxbo6RkwCaS+sB6Zuh3HYdJCEuF+kOb49uTQifS7x
         Lskhv8cDfT4hH+rn0uYJ1gYbPbrd7Pc2Q0glSoZU/v7Js+yUO85/OwzBpdquY516ttYG
         wn/dk9tED2/9Gv1XslqPTlYFKJavSi2BQ1BY26fQVS6b1KlVJ6n6C1+LuoYhS0KWYuQV
         jtajcJp1flv2UgnwG0TAlBRNgyo0LXZlyS1l6F5w/SicR6YIzQDwPQN9cFAICjQ0jzR9
         IGJQ==
X-Gm-Message-State: AOJu0YxVNw7mgpsRmojqQdkZHjCv7pRBiQvGeQRQWyUTcy2RZF6Obzgg
	SDVtsMNgpHEghM1yqwivIgIdXFSgSwD60BtO2PL8T/J9jv/I1IFehcPGiufd4i8=
X-Gm-Gg: ASbGncsh3+eWh4MN3/fIAtc7OlAiX//oqiYgTdF5ZS6buRIoB15QstNo7fgX4UUatHt
	/JMWJnIqniMxFnxMFZ8jkDB97FSc1rE+hbxocgddN3W5U+asrZMff6nWsX6oJiZBmgXiHKg66SD
	9RgQsFwhi0sjQtnxVmXZTgoWrbJ/lwnf53EuYuAKDexFovNOQyZPOLKAJwXr7Jmc0gncOZ9gSad
	7lGeMEjfaw423udfFz1tcJQki8FxTtA6W3ZYNDhDxwgGkg/Axe7xIkaoFPauvEqS9S+e6vREuwY
	pqqrgCHCewDjdNDh38ivXsXAJj/ckW2zwROdTXKuM1mRlJnAj3pH6PGYPSH45rn/zAyibxnmnoZ
	2wn/8mujw
X-Google-Smtp-Source: AGHT+IHD0e2VkLc035ynRxFebvzKVnxgPA1dGGQsWPN4fB82Fp5aT9Wb5duozriX0CVTVlQmcoeKrg==
X-Received: by 2002:a05:6000:154b:b0:391:412b:e22b with SMTP id ffacd0b85a97d-396c200fc00mr83394f8f.18.1741881773809;
        Thu, 13 Mar 2025 09:02:53 -0700 (PDT)
Message-ID: <d3378c73-7185-4f9f-8e61-be12171dfc21@citrix.com>
Date: Thu, 13 Mar 2025 16:02:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
 <Z9L-HPlfZhvIh8yn@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9L-HPlfZhvIh8yn@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:47 pm, Roger Pau Monné wrote:
> On Thu, Mar 13, 2025 at 11:30:28AM -0400, Jason Andryuk wrote:
>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>> all that has been tested.
>>> DYK why it fails to enable 32?
>> In Linux msi_capability_init()
>>
>>         /* Reject multi-MSI early on irq domain enabled architectures */
>>         if (nvec > 1 && !pci_msi_domain_supports(dev,
>> MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
>>                 return 1;
>>
>> MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt remapping,
>> and Xen PVH and HVM don't have either of those.  They are using "VECTOR", so
>> this check fails.
> Oh, interesting.  So classic PV MSI domain supports
> MSI_FLAG_MULTI_PCI_MSI, even when no IOMMU is exposed there either.
>
> Thanks, so it's nothing specific to Xen, just how Linux works.

This is something which TGLX and I have discussed in the past.  It is a
mistake for any x86 system to do MSI multi-message without an IOMMU.

MSI multi-message gets you a power-of-2, aligned, block of vectors, up
to a maximum of 32, which must always target the same CPU.

The LAPIC prioritisation is on groups of 16, aligned, vectors.

If MSI has 16 or fewer vectors, then any interrupt causes all others to
be blocked owing to LAPIC behaviour.

With 32 vectors, you can get two vectors (one from the first 16, one
from the second 16) where the higher vector can interrupt the lower
one.  And you pay 32 vectors for this.

With the IOMMU, every message gets a controllable CPU and controllable
priority, because they come from the IRTE, not the device.

Removing Multi-MSI support makes vector allocation much easier because
you you never need to allocate/move blocks.

~Andrew

