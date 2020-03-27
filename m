Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F787195BC6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 18:01:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHsKC-0005xX-10; Fri, 27 Mar 2020 16:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1/Y8=5M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jHsK9-0005xP-Q0
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 16:59:13 +0000
X-Inumbo-ID: 488544f4-704c-11ea-92cf-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 488544f4-704c-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 16:59:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m11so6369570wrx.10
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=z939UPcVDFIKytZ63KNdnFj5/xQzyEUR8nF6tS8mM9U=;
 b=IiIof1WhMyskgXsIGxPs8nZycnV2mRuy61gKiuqAv97F5AxqrsjtxBQXfWXi8PeMtl
 eN0bIYLRGJ9cCnDmD0Nx61H+Ds2rv3ghMK4eUjYc4DIV23AvEzPabQA3u9kBURy3S2+s
 484xMXUVWV+Lc3WBPK7/TI00CqMLDWoXm0KJ0WoxP+I9DwVelTUeOnb7p6fWrmmJVdf4
 wX/9dbEP9wjd6WzTSj5ZdZ8eUJvSdW1s+U44Q2XhA6SbdPDnTY2RPYDIhZhnVEuHWavI
 SDpo0M5TTI9EDiWjJea4Aae5/2tlT8HULWTjzlXT5zvO0Twl32IZUJ8h3jFl3wwyJQqI
 2qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=z939UPcVDFIKytZ63KNdnFj5/xQzyEUR8nF6tS8mM9U=;
 b=MII3/MbYc8buh3aw//IjPVS1QC7K1ugaEiZu97ZTbx5rM2gMbkP0C0WB3DT3Wp0Xrh
 YPE1zIOtij3EeA4M6AY6dYTu+TwyekZUMwiOAJ3WeeKYnTYc5mUkZbcXRD4MslX3skHB
 6hZCjCr0zzkJ+4DiYNgA0Vw68Zx7vAGbVpgi6HGfxqtNF6ldKxEW/fE/qw68RlqtP0ZE
 2P9dQWAL4s/lwA958d27+ZK69Lm0bH4/AWmXwSkykSy53DicEKcqG67n74K6EH+gVnN3
 c8cfz2gJPISsX/a2rEJK8SGt3j96ccKbZbTUjIUnKbVpSLzfumnPBBBpSm1p/pqVo99g
 +BIg==
X-Gm-Message-State: ANhLgQ33UigdhLjXCgBx38utZTT5L+za/OH/SFE+1zkWd3T0CxUfiP8a
 e2cfL8TLR1E/4sa751JBWqs=
X-Google-Smtp-Source: ADFU+vsVRMxOzTDkLv9B+ZrC0R6k12SI4hv68g65Op0AuXSKacGbYJTS1t+DJn71nv2k9lA16mYEjw==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr386314wrm.26.1585328352106;
 Fri, 27 Mar 2020 09:59:12 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id p3sm9117293wrj.91.2020.03.27.09.59.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Mar 2020 09:59:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327134610.23387-1-paul@xen.org>
 <20200327134610.23387-3-paul@xen.org>
 <c19b5f08-4afc-547f-b589-0401395a4a6a@xen.org>
In-Reply-To: <c19b5f08-4afc-547f-b589-0401395a4a6a@xen.org>
Date: Fri, 27 Mar 2020 16:59:09 -0000
Message-ID: <002201d60459$09b67040$1d2350c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI5b516M+LdGC31+PSxetVEvBfDxwHCtKodAvWiRLuncA//QA==
Subject: Re: [Xen-devel] [PATCH v8 2/2] docs/designs: Add a design document
 for migration of xenstore data
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 27 March 2020 16:58
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <George.Dunlap@eu.citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v8 2/2] docs/designs: Add a design document for migration of xenstore data
> 
> 
> 
> On 27/03/2020 13:46, Paul Durrant wrote:
> > +The semantics of this are similar to the domain issuing
> > +TRANSACTION_START and receiving the specified <transid> as the response.
> > +The main difference is that the transaction will be immediately marked as
> > +'conflicting' such that when the domain isses TRANSACTION_END T|, it will
> 
> NIT: s/isses/issues/

Oh yes.

> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> I can fix the typo while committing the patch series.
> 

Thanks,

  Paul

> Cheers,
> 
> --
> Julien Grall


