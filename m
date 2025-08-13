Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33EB2499F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079854.1440544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAmy-0004vI-D1; Wed, 13 Aug 2025 12:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079854.1440544; Wed, 13 Aug 2025 12:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAmy-0004tq-9m; Wed, 13 Aug 2025 12:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1079854;
 Wed, 13 Aug 2025 12:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zV9=2Z=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umAmx-0004tk-7G
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:41:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6881f19-7842-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 14:41:04 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a12b3f4b3so13797735e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 05:41:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1a5961a0sm780195e9.27.2025.08.13.05.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 05:41:03 -0700 (PDT)
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
X-Inumbo-ID: c6881f19-7842-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755088864; x=1755693664; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moBFo76hgs7I4C2mJOuSPtrqOboCJxWUAQ/iGAXO+dU=;
        b=E+RsYtIFdJJgVGfgF7h6fbanpSH8KIi1UoKpKOYVcNNVPCNYq1HFoQGhtYnP6U4uNO
         XNlUDl/lutOsmOmfth3STEG0XiPmO9BcO5bLyD6pd8cg/dwEXRQUwX+8MCVv8Ww1YfBn
         +foYUpTsoVxQJNHxZZpX0JghgPGYOFWKwGI4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088864; x=1755693664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moBFo76hgs7I4C2mJOuSPtrqOboCJxWUAQ/iGAXO+dU=;
        b=e9sFlzFi6vmrxyA8dlWE7VMBskQlqayJVjjsmNJ+aLdYNyCM4IbW5DD2s+3nIVbW1f
         sivgGebhcE+N2flz7Uljv+hW709FcMn9/b7ijk15aHNO9Y8wOmcBdbm0qw0kztZlYvRb
         sqtX9cFyFqbRerx88G5YY30SjJRIAlqz2aEKE98+AkIfQUqGWZpjzjVMaU+67EOAVnFv
         q0gqm31BJUtBgoqJoDY4ThX9JZlhCV4r8fnLPk4+XpDp0sxAdzgA53ZnIuvxnrYwZByk
         pUJzsjusFFnsQCOIZCZoTgKG+gHoZIlR273JI4Sk+YzBBEPWMQHZEAfkFiiqxRKOoyTL
         kdsg==
X-Gm-Message-State: AOJu0YxJqWKkPYVvw68n0DRvwfXCsLOZ00lPKdtulTe5aDtfkMlL38D3
	cFRuKQ5tKgJ046WLx7JtACPJbD7MJzX6xZBpdJO5ar46hjylrZGD9Hvihd6ECKxDMyA=
X-Gm-Gg: ASbGncsbhXs1oODxY20J6IRK83tS9wazTlFZmUKo9MBFZm/PJVXnwWSXbQBEhAFD5xm
	BZHpOjSKwyZN78F2YiD/zDMHvdch40x3FPOaygErbZDf/031+0SFGQgEmobbg9kZ/jxkgx4Tp4y
	m/cTCWPlnqWxWJukT83GX9qoPdAIU39Fw4TIedANz5JjP9KMZa3PZPzufqNZJ/vdN34iiasWdUh
	IPNmOKN5U080xlUB7/CgwjMn9pvRCPDszgA3J9otG/g2gAjNaGqG2cZMs06Pu2rjjVY56gGEi4U
	ImljF1ycVOaneeRzY4d91qKUXvfoHo+XsmjNxN7ZcZahk1DLLIjOyaGEWY+PVYmLPwQleAz5Cpw
	lhvkTKy6ogvCPYvYhyl7lsrom8aVljLWJkKYXItgYspcA6+d0HviBdnlz5ENZgxRA4Q==
X-Google-Smtp-Source: AGHT+IEoJXQn77oyj6sb5Lk2cPX15dsKiyL5dhNQryUDihDKjaFRkCHtAOhrIsmaaOBjPzmgNon1qg==
X-Received: by 2002:a05:600c:5247:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-45a1664bf03mr25574795e9.27.1755088863635;
        Wed, 13 Aug 2025 05:41:03 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:41:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Coverity complaint] Re: [PATCH v5] pdx: introduce a new
 compression algorithm based on region offsets
Message-ID: <aJyH3kb93k3HpF-A@macbook.local>
References: <20250812150624.64898-1-roger.pau@citrix.com>
 <f3e57860-d4db-43c5-8cb2-29eac2163c1d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3e57860-d4db-43c5-8cb2-29eac2163c1d@citrix.com>

On Wed, Aug 13, 2025 at 12:47:37PM +0100, Andrew Cooper wrote:
> On 12/08/2025 4:06 pm, Roger Pau Monne wrote:
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Not this patch, but this is probably the best place to report it.
> 
> https://scan5.scan.coverity.com/#/project-view/30554/10426?selectedIssue=1662707
> 
> Something you did in the series made enough changes in
> pfn_pdx_compression_setup() for Coverity to start reporting an issue in
> some decade-old code.
> 
> The complaint is on line:
> 
> 277    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
> CID 1662707: (#1 of 1): Bad bit shift operation (BAD_SHIFT)
> 
> 34. large_shift: In expression 0x1000 << bottom_shift, left shifting by more than 31 bits
> has undefined behavior. The shift amount, bottom_shift, is as much as 63.
> 
> 
> The relevant part of earlier analysis seems to be the "i >=
> BITS_PER_LONG" check in the order loop, causing Coverity to think that i
> can be up to 63.

Yes, I've also got the email.  This is existing code, so the issue
wasn't introduced by the previous patches, it's probably result of
the code movement that Coverity picked it up.

I will send a patch to fix this.

Thanks, Roger.

