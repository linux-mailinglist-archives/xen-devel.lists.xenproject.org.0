Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D496FA5FB7E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912797.1318995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslMV-0002hs-JH; Thu, 13 Mar 2025 16:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912797.1318995; Thu, 13 Mar 2025 16:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslMV-0002fo-GJ; Thu, 13 Mar 2025 16:24:47 +0000
Received: by outflank-mailman (input) for mailman id 912797;
 Thu, 13 Mar 2025 16:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslMU-0002fi-8z
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:24:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb55a4e-0027-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:24:45 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso8168495e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:24:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5ccasm58020825e9.26.2025.03.13.09.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:24:42 -0700 (PDT)
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
X-Inumbo-ID: acb55a4e-0027-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741883084; x=1742487884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FTl2z2xXiEHA2WkDT3d9BmqXlUNB/n2Ei5q8BNARymE=;
        b=tKhCLfbqnNOp1SBvC2oo4mqONVCqrx6kquJe1zEmKJv7f1RTEdvT+CDFC8xYXbYfyT
         FgCLQvKpRfweFpDemf1LtKl8sYIb79Jq2+ePzbwpSxyT63NhQRrqFHu7iDKUaPzIXBAQ
         t3v5RgqaGnGMKpSzwpEUpK0P4SHKDehIeWbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883084; x=1742487884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTl2z2xXiEHA2WkDT3d9BmqXlUNB/n2Ei5q8BNARymE=;
        b=k+qHPPsPIMR9f9nMhkJ9oTSnP9X0oMJibHvpRuHOvFEDAGtEyNFG8zCOvRi659abzO
         QKrbvH5bAwH/RQt6cW9KoSvqfaYDMLrqKJz+KVnihSy2rnBAEB1h6Zig44wKgrj7KRxt
         rT7FLMgrd3bTpuzbUWfzac6qNiSdj8DKO/etaLP8UXu3NIdmwCzzud8NyhYydPuq9Lwe
         QR+qJWIhbgucbQdaca+segnT43U2IUaMoRvJPksJnL+JGZA/6aSV1Lu6RGZBJB3KGc8r
         p8+b7snNEeyMDaxpX/8bM3d+nOXjwarYkdVuSr5lxQI2p0HIKewgISbEmfLJcYVbzn1A
         5rWQ==
X-Gm-Message-State: AOJu0YzyJhL8iJyAHz8fIhZ6oEw6m96UPwy5htdsGWY0hC9JtvqON+EU
	3dXRDPaaN5revqEbRwCEB8+nKvvs1HQLolv7cX6XB1SxrUUd7le6FWKohvoeJD0=
X-Gm-Gg: ASbGncssY8ktUTFBbVgxA5UsYhnXFic5H2YaxngHBlcyCGI7s3gNCiOr/DDu1V84+KL
	4OGyRF0hmkHyEyNCQJJFYvjP6F3i605IUnbQH52azWRBqZs/kEWQhnPmbG+odbWjdT9je1LnTVT
	S2rlIEedT58QtuLqeCOYB9oGtuyaOafxnyTtSjfAplCDma7AkaWx/8Htc7OEaVn6P4/dYhaLfz7
	rEozrdBzL+YizF/ZnF0ASjcStO4aHUjU8MgVP7KcblYHpI+eS0JK0pEdRkKDD3WSLu90MYnbXLz
	QRMF2avjZFx6J4LmsbZ+847CZp8x7UDvXNCtqPPO6jv1Yr2hwjDSMK167E81EzPNBTikZTr4/w6
	UL+bjBxPS7sgvtOdjCpk=
X-Google-Smtp-Source: AGHT+IGdHxO/bEQlqXbQlNQJUhVFwmjkFyYTXQhevsVUgRpdP962/qSvcwOch7t74FCk4mHHRPI0/Q==
X-Received: by 2002:a05:600c:4fc2:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43d1d8e3fccmr2530915e9.19.1741883083037;
        Thu, 13 Mar 2025 09:24:43 -0700 (PDT)
Message-ID: <818b6a3c-bf65-489b-a551-d8539f52b452@citrix.com>
Date: Thu, 13 Mar 2025 16:24:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
 <Z9L-HPlfZhvIh8yn@macbook.local>
 <d3378c73-7185-4f9f-8e61-be12171dfc21@citrix.com>
 <5cb338cb-3e5d-4c3d-8ee6-6c0c7c76348e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5cb338cb-3e5d-4c3d-8ee6-6c0c7c76348e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 4:07 pm, Jan Beulich wrote:
> On 13.03.2025 17:02, Andrew Cooper wrote:
>> On 13/03/2025 3:47 pm, Roger Pau Monné wrote:
>>> On Thu, Mar 13, 2025 at 11:30:28AM -0400, Jason Andryuk wrote:
>>>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>>>> all that has been tested.
>>>>> DYK why it fails to enable 32?
>>>> In Linux msi_capability_init()
>>>>
>>>>         /* Reject multi-MSI early on irq domain enabled architectures */
>>>>         if (nvec > 1 && !pci_msi_domain_supports(dev,
>>>> MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
>>>>                 return 1;
>>>>
>>>> MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt remapping,
>>>> and Xen PVH and HVM don't have either of those.  They are using "VECTOR", so
>>>> this check fails.
>>> Oh, interesting.  So classic PV MSI domain supports
>>> MSI_FLAG_MULTI_PCI_MSI, even when no IOMMU is exposed there either.
>>>
>>> Thanks, so it's nothing specific to Xen, just how Linux works.
>> This is something which TGLX and I have discussed in the past.  It is a
>> mistake for any x86 system to do MSI multi-message without an IOMMU.
> Well, with PVH there always will be an IOMMU, just that Linux can't see
> it. Even with PV it should be the hypervisor to determine whether multi-
> message MSI is possible. Hence how the classic (non-pvops) kernel had
> worked in this regard.

Xen should hide (and instruct Qemu to hide) multi-message on non-IOMMU
hardware.  The result of "supporting" them on non-IOMMU hardware is
worse than making the driver run in single MSI mode.

While in theory Xen could expose "I've got an IOMMU so you can do multi
message" to guests, this isn't trivial for the guest to cope with.  Even
if the guest knows multi-message is safe, it still cant express this to
Xen via a multi-message shaped interface.

With Teddy's PV-IOMMU, this problem ought to go away because now the
guest can see the IOMMU.

~Andrew

