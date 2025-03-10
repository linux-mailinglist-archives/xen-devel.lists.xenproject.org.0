Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F76A599EE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906658.1314062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trf0a-00057x-7t; Mon, 10 Mar 2025 15:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906658.1314062; Mon, 10 Mar 2025 15:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trf0a-00055K-3h; Mon, 10 Mar 2025 15:25:36 +0000
Received: by outflank-mailman (input) for mailman id 906658;
 Mon, 10 Mar 2025 15:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trf0X-00055B-SZ
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:25:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8368e74-fdc3-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 16:25:32 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so808770566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 08:25:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac2b68b53a0sm24814366b.62.2025.03.10.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:25:32 -0700 (PDT)
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
X-Inumbo-ID: e8368e74-fdc3-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741620332; x=1742225132; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vHLt/k8UafD//JOBgmMroG9drHMiJW1DW8qYAU21W4I=;
        b=UBl2DAa6QtNHmaUSSClxydqpgWfHj+pVb9ZvAtZxBFiNrSBarCI0O+dw7HTCiA53nM
         jK9qcUdVhITPsQocJtnX5RioVurNYstM33RdPuxPvJnkf9Qm8rCH/WAUJMCSthcccRsW
         sHDwopcBoE3xS3Q6CJeSBcYzVXhEQ0j95blfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741620332; x=1742225132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHLt/k8UafD//JOBgmMroG9drHMiJW1DW8qYAU21W4I=;
        b=fbXRbXCYdlIinLksQZI3A5+1WIA6rqE1A4KBUZsW5FLINudndLh0qkI4pdpvT8PswW
         yQE1Mfp+j8TyPD3XfrPaL9QcWlvhAJzKiKoEvSNwIfHocBlbRaXhoKTcfMzWJ91xuBcC
         eO6ql8UwjSOqB5jE/BSw7fILCgO5RYa0cjI31m8zTn3yq0Z0/7mdlTZT08Nkl7953dT7
         tR5XE0zEZvYc40+5gE6sVDua59xKer46K6WIQIBBYAT4/67kxN99DNrB0COwJYmICxRk
         nbkeIJSlr+TWOB9568ofCqXP3qWgmBG34wlU34AVXbAj+ls7QxP5BFJLOaI4B0/3zny2
         iRXA==
X-Gm-Message-State: AOJu0YzGLNE9jowytRKm2+rZ3UNOCdlPE1JOKv6Fcz8cUWleqikdQgGO
	MXEBGO23+dJIBCg9fhAvfZ/IVsgue0ly8PMRaFN8nmIF1XKfroPHn1OoOqbb9I0=
X-Gm-Gg: ASbGnctNhn7DKusIQW0R35vpCKE70F/wAZCy4utYnA/KiH+XYcC7N9GpadxDDEkC/Ye
	VQZ65gpoqCOBUT7yS0x7ZBAwv4k6VQK4/tMuEZsyKHjv7o42g72tEQQMnPZ1az5tXcVbe03VYHI
	IVlBH0HgBhexyySV+o5Egcwbhn/vELAQEHVeEwSisOnNBvef9E57dPZRW0IqYDJT9PVKia7WOFO
	Km2JHB/kaUyhf5GmYMHrwSDAzdFz7/0/oyXos9f3LXgCDl4sSmKkBD3r2/UPwmSaKqDAv3RWSu7
	vNNC9oUay6xR0ggpasrDkUMxPmBPrLiqQ6omTCfKACjFtEh8BlK7IGd6R1Lysq2w0Q==
X-Google-Smtp-Source: AGHT+IEtUkH7mco0QSFN8CjJ/zP6tyhITpmWFPP6aFVDazreZrwZWUY69Y5KRiCMBlgWnS9XKlut6g==
X-Received: by 2002:a17:907:97d5:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ac252ba28efmr1951653366b.37.1741620332370;
        Mon, 10 Mar 2025 08:25:32 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:25:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/P2M: don't include MMIO_DM in p2m_is_valid()
Message-ID: <Z88Ea1Qvork6ytkw@macbook.local>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <2c9885d4-4a9f-4998-b0fa-15c17115fa1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9885d4-4a9f-4998-b0fa-15c17115fa1e@suse.com>

On Wed, Feb 26, 2025 at 12:53:14PM +0100, Jan Beulich wrote:
> MMIO_DM specifically marks pages which aren't valid, much like INVALID
> does. Dropping the type from the predicate
> - (conceptually) corrects _sh_propagate(), where the comment says that
>   "something valid" is needed (the only call path not passing in RAM_RW
>   would pass in INVALID_GFN along with MMIO_DM),
> - is benign to the use in sh_page_fault(), where the subsequent
>   mfn_valid() check would otherwise cause the same bail-out code path to
>   be taken,
> - is benign to all three uses in p2m_pt_get_entry(), as MMIO_DM entries
>   will only ever yield non-present entries, which are being checked for
>   earlier,
> - is benign to sh_unshadow_for_p2m_change(), for the same reason,
> - is benign to gnttab_transfer() with EPT not in use, again because
>   MMIO_DM entries will only ever yield non-present entries, and
>   INVALID_MFN is returned for those anyway by p2m_pt_get_entry().
> - for gnttab_transfer() with EPT in use (conceptually) corrects the
>   corner case of a page first being subject to XEN_DMOP_set_mem_type
>   converting a RAM type to MMIO_DM (which retains the MFN in the entry),
>   and then being subject to GNTTABOP_transfer, except that steal_page()
>   would later make the operation fail unconditionally anyway.
> 
> While there also drop the unused (and otherwise now redundant)
> p2m_has_emt().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It's tightening an existing check (making it more restrictive), so as
long as current users can deal with it.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

