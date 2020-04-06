Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AB19F39D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLP5Z-0006Ef-5S; Mon, 06 Apr 2020 10:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLP5X-0006Dv-AL
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:34:43 +0000
X-Inumbo-ID: 399892c2-77f2-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399892c2-77f2-11ea-83d8-bc764e2007e4;
 Mon, 06 Apr 2020 10:34:42 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i7so18627622edq.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/tizzWJs5e6Ab/lVHKm8KWTHNiolqrfaHVSwx1YqY78=;
 b=PerD7SJHPtbxcXK8LDRB8CZlLnE+R5QKHmkFzmPkuTSQLt5UetVuMcY3hZ5baVeur7
 UxWvnkcXVIhDDTN5CKuMLzO2lvOk2NjULOUsQRXSdHF8+1Pc276CN8nTjWHxYg/U6XVe
 bEcCuH2SU6jXlSxrS4P3cX9WM2glS+gtEouebv6C94Lsf46hk89b35HliAIRGHJakwWc
 t3+z4GYeBtmsmMZwU11twmxL5dB6sjy8YjMmpoA10dn4/7VLBY4+FM1oo5IxEUqYq5Nv
 MR0UQ42upDFTx+vtU/oUwQ1xE4YM65XK/Lc3U9XcL5EgowGp8fqI/6Lm6UqPIRAs9Juy
 SXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/tizzWJs5e6Ab/lVHKm8KWTHNiolqrfaHVSwx1YqY78=;
 b=son75/4KdMKNSuSHxeCiJIDRbHTMHoCrZjmfK7f9sVzgY015pxvpCkSJ8CqHIT4Rgh
 aVA5LzLz1Bx2EFV6E+smZgAoPpKSuHwsiU5TjIuwHLejKvuVpOH1ADIbzmy5aIbj/oN2
 3vmY3iXLxq33LdIrSlCH4Se4p6EKHhMzuhcgJ5cATAYZodzv4yV9GrpUrqelqJGrBPNw
 fFHbuvz963VgGcAvaFTyOQ+uu6McgFS3hE1KWoF0eRQ/8bejGyI9qyv5c/aQ/o0wI/yo
 h9GhajQ2z2fdYcE11aEo/gKXwunYJ//lQ8ECmitn0VLEZFx7Azx38nnDCjgeRX8uB/yV
 jtpA==
X-Gm-Message-State: AGi0PubFemGvJR4Z81KqPrFVUvRpjM0P5KmJ4ID78X7BFyzLgzUbJpCJ
 516Qok3goHTpOg1EiewDjLQ=
X-Google-Smtp-Source: APiQypJRf3BpcrOFrGc7Q/vQcdvtByznoLWA09BWyLVbOChPFKT2tLytGFwGqQGkBsOur/3WSQDgxA==
X-Received: by 2002:a05:6402:17fb:: with SMTP id
 t27mr19253041edy.305.1586169281637; 
 Mon, 06 Apr 2020 03:34:41 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id b2sm2884607ejv.61.2020.04.06.03.34.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 03:34:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
 <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
 <001701d60bed$25606f80$70214e80$@xen.org>
 <e2e25069-36e5-b965-8f66-59a460369e88@xen.org>
 <002701d60bf4$4b640460$e22c0d20$@xen.org>
 <ac273b12-36f4-ca5c-c18b-7a59d2b84e2e@xen.org>
In-Reply-To: <ac273b12-36f4-ca5c-c18b-7a59d2b84e2e@xen.org>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Mon, 6 Apr 2020 11:34:39 +0100
Message-ID: <002801d60bfe$fab5de70$f0219b50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAt7KY/0Cn78SegKGUxSNAT1JVvEC2KVtyQKYWtbpAi2RjHuoHMJVgA==
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
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
[snip]
> >>     * The name of the hypercall does not say anything about "PV". So a
> >> contributor could think it would be fine to save/restore new HVM state
> >> in the new generic hypercall. Is it going to be an issue? If so, how do
> >> we prevent it?
> >
> > The commit message says:
> >
> > "Domain context is state held in the hypervisor that does not come under
> > the category of 'HVM state' but is instead 'PV state' that is common
> > between PV guests and enlightened HVM guests (i.e. those that have PV
> > drivers) such as event channel state, grant entry state, etc."
> 
> This does not seem to cover all the cases. For instance, where would you
> save IOREQ servers information?
> 

Ok, I agree that is ambiguous. I'd still call it PV state but of course it does only relate to HVM guests.

> >
> > Do you think this should also appear in a comment? Do we really care? Nothing fundamentally prevents
> the mechanism being used for HVM state, but that may introduce an ordering dependency.
> 
> I don't particularly like the idea to let the contributor decide where
> "HVM context" or as part of the "Domain context".
> 
> This is  going to result to unwanted dependency and possibly
> bikeshedding on where they should be saved.
> 
> My preference would be to mark the existing framework as deprecated and
> force all the new states to be saved as part of the new "Domain Context".
> 

I'm ok with that. Any others have any opinion to the contrary?

> >
> >>     * Are we going to deprecate the existing framework?
> >>
> >
> > There is no intention as yet.
> >
> >> I am not suggesting we should not go with two frameworks, but the
> >> reasons and implications are not clear to me. Hence, why I think the
> >> commit message should be expanded with some rationale.
> >>
> >
> > Ok, I can add a paragraph to try to explain a little more.
> 
> That would be appreciated. Thank you!
> 

I'll mention the deprecation of the HVM context interface there too.

  Paul


