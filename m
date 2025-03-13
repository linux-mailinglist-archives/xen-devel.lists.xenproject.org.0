Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1EA5FB9C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912817.1319016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslOJ-0003ju-3d; Thu, 13 Mar 2025 16:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912817.1319016; Thu, 13 Mar 2025 16:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslOJ-0003iQ-0q; Thu, 13 Mar 2025 16:26:39 +0000
Received: by outflank-mailman (input) for mailman id 912817;
 Thu, 13 Mar 2025 16:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslOI-0003iK-2A
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:26:38 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7fcaf2-0027-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:26:37 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso1025612f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:26:37 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a4c71esm25051275e9.39.2025.03.13.09.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:26:36 -0700 (PDT)
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
X-Inumbo-ID: ef7fcaf2-0027-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741883196; x=1742487996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qCiWAX2Sc29Mg4EF7Ktbu4VHCvg/LtmDRfobCJqEQ7s=;
        b=uIqNaJfBe4AF9uBWznvgu4s2ksQM6KfL/uDJp54oWheroMsQ5tymu/bdbM34jeqW23
         9Mw74ZKt0l5ZZhVEhS4aNUDn5pdXLHwFHihTGoR/2chtcp/+F/XpwfFyx2Hcg4qKL5vn
         KCjZFZ58dPS1OxIU4CbQVbo3UO3a88WDVCIMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883196; x=1742487996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCiWAX2Sc29Mg4EF7Ktbu4VHCvg/LtmDRfobCJqEQ7s=;
        b=ezhTF8aWI1RvdxYk/tgUYqPThk3EWC6SDg3JXXVbylRM6Wycau5M9ExV3YUO/uA1lh
         g7qt9QVNJsje66LmJ1Efv+ZPNjl8L/MAGt+zj4Ek+Yb2mFOmGS61MHu85IOvYjcwp8y0
         3ER5Rm83QSal09s4gP9V2oJ2JN1H4+aeQFaBIStylbymJspt9Wnn6EP/VTh2lZ80lwYV
         /JsgUk0MqhJPEBh/thRXBEp7cy5nI9615k1pR+2LBJyfpFtK9+Cqb7mUl4WuGArFPVhq
         IECEV6J/JZT9SihLQN8OZDxMdWGZW3FymWzPUeVhc0o+P5+BlrTchN9LCbbm+H5lEJVp
         kz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMtx+n6keuap5egFj9TCHCP1myZTgowW/SUxuQvbmhIMqoANYcqqaqS8WgWqE3R4bT8RfxND8GxfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL5LrQBwwyDhvZxcDlg+lNnm9dLfDqkA1hcnL4XKQD4PiuRjG8
	bIOQilQc33WaRmwW2Sj4E/zZudZU8ZueNfy0/je5baSBPddBcBYXQ/J4C5oHo8U=
X-Gm-Gg: ASbGncuIUyESyiNNXJ2xGRV0HktFpflMcxIzzQuu0xK9z75IYUr2KX0dLhI8I66sFba
	dBi6ZbWOC3i2ibs+TkE7aZDlVs5Fv/sP3g4ybmF8HEjAQqGlJGHHMbw0Ttqh7fSlBn7c1BIRBIH
	A45z7vYmlB+AcmMm9vsvEb0+uP+VSMg3JbxWuhg6kiYJYzs/c4xnzufrqxzwiF8Pz2GatLJv90g
	WAfx8sXvH28W9FmzWwHP+ZGY+dAQyVJYUDKo+d9JQEA6bIUZzoJWd4D+qhlAhHCbHUwSLVCdSaT
	A24xHczQ2tCO2VSIAobTCd+/DcqebBhd7I4qUP0FmNz9+g3+S0vtUAuQxwJVe2HXeF+bo16byei
	QOMSVWjfk
X-Google-Smtp-Source: AGHT+IGsFRw93BgFanEXoW5HSSwA4kmNcpfrM8986dxvBKTag5E0/EgECMxsAl4FtWPN5azSTvdF1Q==
X-Received: by 2002:a5d:648a:0:b0:38d:e3db:9058 with SMTP id ffacd0b85a97d-392641bd61dmr10362628f8f.12.1741883196598;
        Thu, 13 Mar 2025 09:26:36 -0700 (PDT)
Message-ID: <abe8c6ea-61e7-470f-90cb-2821827e493f@citrix.com>
Date: Thu, 13 Mar 2025 16:26:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] symbols: split symbols_num_syms
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <82494869-2565-4a20-b43d-224641919d68@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <82494869-2565-4a20-b43d-224641919d68@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 1:54 pm, Jan Beulich wrote:
> In preparation for inserting address entries into symbols_addresses[] /
> symbols_offsets[] without enlarging symbols_sorted_offsets[], split
> symbols_num_syms into symbols_num_addrs (counting entries in the former
> plus symbols_names[] as well as, less directly, symbols_markers[]) and
> symbols_num_names (counting entries in the latter).
>
> While doing the adjustment move declarations to a new private symbols.h,
> to be used by both symbols.c and symbols-dummy.c. Replace u8/u16 while
> doing so.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

