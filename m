Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C780590F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648073.1012033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXez-0003N6-SI; Tue, 05 Dec 2023 15:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648073.1012033; Tue, 05 Dec 2023 15:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXez-0003Kb-Ox; Tue, 05 Dec 2023 15:48:33 +0000
Received: by outflank-mailman (input) for mailman id 648073;
 Tue, 05 Dec 2023 15:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXey-0003KT-70
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:48:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd20f235-9385-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:48:30 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso34315465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:48:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b004063cd8105csm22722467wmo.22.2023.12.05.07.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:48:30 -0800 (PST)
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
X-Inumbo-ID: bd20f235-9385-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701791310; x=1702396110; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awy9i9tBZl7MV7W0LVS7aosLN97IiP0YvJ30MfOMUdQ=;
        b=ZrktTd2BxxEbngOpM3pQCEWx741u/uXk4QzA23XV1EP00T5pE933j78x57EJQ5gYfg
         KlLGuj6A5v2Ows+QTGeOT2BD8YDGkcQPKLYt98jDxTw82iUayv4aJg8XCKs8VuizBpUB
         xY/DK3Ok6EeZy4F0KyDGambgWnT93LPr4Hlwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791310; x=1702396110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awy9i9tBZl7MV7W0LVS7aosLN97IiP0YvJ30MfOMUdQ=;
        b=peHCAGPZmyFjZkC3n0+iZeMOgFGejeIAnHwfI8v7ijC5WliUZwwccDRBdjP6RBVDxv
         G2/19/BRAFR/d2Yk6Io1RmyfsWgsjXgFuUVAZd/3PMAcbtj6Il2hfXDFYPlZF1sqAv4F
         AGZvZCBK73IbMFdFuoeWQasgmfHwje8qmusWGesIqTYdDOuvWyWyqdr8IRuBjP+xZ9+X
         4TlYkwdKa34T21f4jjmsevAWiXCARYEyIQ6TpHCFDPPrpF8C3HOONS2sZqXUqsuWHTe2
         iLOYvTX8Af8C7gjlf877LqIDhoedkmCZ36hFgjFBgknEvzhtn2KxLrOkQqJpeUyfRULw
         DEZg==
X-Gm-Message-State: AOJu0YwXDOfMuAeq6b9fRl10X0a4pKjB6yZoQQQXUm85Ezzu9Zm7wIuG
	gOXv7B8gc8rRJRiY1LGOvNmYGQ==
X-Google-Smtp-Source: AGHT+IHj+tafJ8m2QEHEf28SQvVPOfVY6dNG0LhTwp8eU9b24znSGWiFw9S7tdBcAjDaXb4NhQM1Hg==
X-Received: by 2002:a05:600c:5487:b0:40b:5e1d:83a9 with SMTP id iv7-20020a05600c548700b0040b5e1d83a9mr657698wmb.61.1701791310495;
        Tue, 05 Dec 2023 07:48:30 -0800 (PST)
Date: Tue, 5 Dec 2023 16:48:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/6] x86/iommu: cleanup unused functions
Message-ID: <ZW9GTeqW4Gsqi5Rg@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-7-roger.pau@citrix.com>
 <37624f9d-a679-44c8-84ab-42fb8e6a28a0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37624f9d-a679-44c8-84ab-42fb8e6a28a0@suse.com>

On Tue, Dec 05, 2023 at 04:29:18PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
> 
> Of the latter you remove only the declaration. Stale patch maybe?

Fixed.

> For the former, am I misremembering that Andrew had asked for the function
> to stay?

https://lore.kernel.org/xen-devel/81534803-9da4-49b7-894e-f3fb5e8fb131@citrix.com

I did read Andrew's response as it being fine to switch the current
function to use a rangeset, but not as a request to duplicate it.

Thanks, Roger.

