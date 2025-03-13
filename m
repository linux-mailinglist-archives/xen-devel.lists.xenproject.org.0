Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1BA5FA63
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912664.1318886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskmf-0001fm-GP; Thu, 13 Mar 2025 15:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912664.1318886; Thu, 13 Mar 2025 15:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskmf-0001de-Cz; Thu, 13 Mar 2025 15:47:45 +0000
Received: by outflank-mailman (input) for mailman id 912664;
 Thu, 13 Mar 2025 15:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskme-0001dY-3A
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:47:44 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80133168-0022-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:47:42 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e61da95244so1966895a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:47:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816afdfb9sm870294a12.71.2025.03.13.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:47:41 -0700 (PDT)
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
X-Inumbo-ID: 80133168-0022-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741880862; x=1742485662; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAAVo/9bYIN1+gkBG4NXrYwLlmm5eHWvKvwzb17Rw9Y=;
        b=r1PrqlKEcI+vokj5QMxzqaG7HniWboNi3LYyepK94ckRromV8mwA5syAkinE2IQgLW
         swzjwUpQbEk/dz2wvM4fw/6MWGpBJHaQeKN/FgPEAtqBUOLoEn/KIhuLDzdmhyhvXWH3
         aWCPKdFn9lS5Jy8gIce+XVTHfT7q38aeekTd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880862; x=1742485662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAAVo/9bYIN1+gkBG4NXrYwLlmm5eHWvKvwzb17Rw9Y=;
        b=u9lU2Uhl8OLKXSkM09IQhuc6Txq1eswaGGxU0OTnHSYDrfA46Se/Q7LdzfTXMVt0tY
         IlEKZzGJW3wycDfArSGIgHEDUJb2UDBTcAI3TVCaeBm6jXYPdmHDC037jfLYMyJHv5U0
         XdrIdwCwNdQL54kdjvBOL51M4ADziQMjUq7b3TYXeTMT2h+lBKETRnyvLlRVHDDyC65q
         IWbzVzu7Boi3C+GnzhZWLFL8Rz90//MvhLCjThG1gTySYaV2Xwpt7VoQFGF1nIPhXxJP
         XJqoUEg6KIyYl7dIGt7tIm2ZAZGTFWKZ6Hn3LRJ7fMUQgZ5umvrKUiDeTuhYbH+OuPYy
         OdmQ==
X-Gm-Message-State: AOJu0Yzi5EH5BjbChwSnzFwt5cqgCSTqF+yrE5a6NbJZsLlSlweHqFOc
	rEESw8/ulI3ZRjDjgQrbQssmJj4ZccaltKkpdG/DN61QwNaQJ42VHUq8mtRxWbU=
X-Gm-Gg: ASbGncvWT023opeqMT5PTUXhMG3WlZeQCAJrpa/Udfzu+Cou5yvVsDZx5nEQg4t19+4
	kLBAjq/7X6y/R2b83bzTtlGNex6ZleKvAqc4ZZOITNIDmE0VoLWhVYtfT+DB4x1kNRvCOi/EKqL
	w7NYCeaaTtEDaoMORUa93PdVRVrQEaHp1jE94BDYhrRyqh6oQiclkWZMvgRV5t4OKoHk+oSK1Lv
	EQnHHrGnLyyMRowTZKktKVk9ZqAAg7k3ovqT1BQEvCvLIQPplUmXL/nYhxNEWr/bM+MweEKFRUX
	KKZkXRxh0IQLcCtlRTxluuv5QWXA/jHtxBWMrLtpy3jRX2d0qw==
X-Google-Smtp-Source: AGHT+IHHMEdBQ1rfGSH/EX/Gydmrru8VZncge7O2xD/oCr09zZu+wCggI5+ZwjsMuvDC/3e8hEIuqg==
X-Received: by 2002:a05:6402:2747:b0:5e0:2e70:c2af with SMTP id 4fb4d7f45d1cf-5e5e24909a2mr30757046a12.26.1741880861965;
        Thu, 13 Mar 2025 08:47:41 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:47:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
Message-ID: <Z9L-HPlfZhvIh8yn@macbook.local>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>

On Thu, Mar 13, 2025 at 11:30:28AM -0400, Jason Andryuk wrote:
> On 2025-02-27 05:23, Roger Pau Monné wrote:
> > On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
> > > 
> > > The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
> > > dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
> > > all that has been tested.
> > 
> > DYK why it fails to enable 32?
> 
> In Linux msi_capability_init()
> 
>         /* Reject multi-MSI early on irq domain enabled architectures */
>         if (nvec > 1 && !pci_msi_domain_supports(dev,
> MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
>                 return 1;
> 
> MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt remapping,
> and Xen PVH and HVM don't have either of those.  They are using "VECTOR", so
> this check fails.

Oh, interesting.  So classic PV MSI domain supports
MSI_FLAG_MULTI_PCI_MSI, even when no IOMMU is exposed there either.

Thanks, so it's nothing specific to Xen, just how Linux works.

Roger.

