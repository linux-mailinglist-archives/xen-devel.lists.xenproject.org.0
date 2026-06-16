Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cwf+F32IMWqAlwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:31:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4CA693382
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=RjCtsuHA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.1339539.1600759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXdM-0008UO-8w; Tue, 16 Jun 2026 17:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339539.1600759; Tue, 16 Jun 2026 17:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXdM-0008Sm-5q; Tue, 16 Jun 2026 17:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1339539;
 Tue, 16 Jun 2026 17:31:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1wZXdK-0008Sa-Cn
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXdJ-006bOT-Ph
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:31:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a318857-5cb7-0a2a0a5109dd-0a2a4501b2b0-38
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:31:29 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mst@redhat.com>)
 id 6a318870-c1f2-0a2a45010019-aa0a817c9759-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:31:29 +0200
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-w7l57zGDNGGApvl0l7CbGg-1; Tue, 16 Jun 2026 13:31:26 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b8adf8b8so45282405e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:31:26 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923343cb75sm3583875e9.0.2026.06.16.10.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:31:24 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781631088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWc8XpFSVDFqkdh9JRMAyyd+HTlraBz0TXBtpxzGEaY=;
	b=RjCtsuHAMqzKrlzaO4Amt3BhMQRDJH4P2dFt+nB1nNgSwhQuUkjDjhsccTFZ0KTRE/5ac6
	RmW1Z3TwNj/nLdyTolrQjbDARZns+CZ2QmDmSos8MXvR0zIqioepUjG6VZMSiwwWNpaP5G
	Bu2ZE3ZFn88Zd9Iqsz0ze6DEvhUwIf8=
X-MC-Unique: w7l57zGDNGGApvl0l7CbGg-1
X-Mimecast-MFC-AGG-ID: w7l57zGDNGGApvl0l7CbGg_1781631086
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631085; x=1782235885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWc8XpFSVDFqkdh9JRMAyyd+HTlraBz0TXBtpxzGEaY=;
        b=SFmtZsnC5UW5Bi2M15KcdxCNlPsn3AUKvzEr9NWc2YNNnrFtlHcYN1BycwvpVpX/ai
         XU/HdYYCU2nuh1RWg9Yc/VvfuWZ63d8u10Hs9CY4CzauYdpnRNnqLiEFUo01Ha9I1BZ+
         7Fp1F4cNW43dvQonkADaOjTiak0HSbb3AUQHS7rIenlRuCtHjAOVmp5M99NsAGknxJKy
         go6xaE6NkUSbqfos7WvkR+JsgcemVqaW3sIXxgiO5ZtMqqjlbI+FITphxzD/oBFe4Xwe
         BkKIXj5y4jLXuLxOHRwM4v2/5NWrA3YOkndMoBDk8V23DHaNGRGlxMKNKG4GUPnQPErw
         NTKA==
X-Forwarded-Encrypted: i=1; AFNElJ/c0jNOllju0+Z9KaRoVrtO/EaFjOWdcmSuJMh15cjtC5/BzyhDu4Kmbns5g90G5l3/JFl/FTPTIEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK22uXMIm/Doji0/owZ5pBgROIt6QskGP9ykVPqTGKKBkWLGId
	4Q516TZAMVU/Z25AW4ftIS7B0yWGjNEespUr9aAmQqe7EH4qsgSEn0uu02Is6JrJCcD6IKLixHc
	wJg6wMsMfrYJMQv/jPrZjX1fIpALVYE12688AnbZd4z4bRBWbfOY49FdYhSpgpD13/bgi
X-Gm-Gg: Acq92OHjz5X7K3zuGXR1ucNyYt3vfvo5assbV7Bd/eF0AqRqAxJeKoFbCXrwaQA/p6H
	GaWc/JsOecbTuJTgIE//NSv1zjgoM0D1sxkgTsb5jeC49w6VcozesUPtR7ri5GqU+GEIEQOeHIB
	NqYJSgCGW/EF1gkwybGV2bPmYO7SrPrBgmqCEdxes8mViubOQ7zawOzYINdUAxLZaobl2swDSsg
	3EBgfe7V741vBMoKnJeHlKwsOft/vG8iZSkp+PV61PaWgCT9SN2jng4AxB+7j1rXQS3D4XFM8Az
	zVpxm47PAPOigVKgbstIytBMmMYKdP+Jb5n4yspaBykRJG/6OMInKDNQAU1oT9o3uS3YzCtO0kK
	tYSMdk2ZS4aS/Vjpc2uGxQYXHhiNa0Xa6i9J3BZ5Ubrk=
X-Received: by 2002:a05:600d:8496:20b0:490:e913:656a with SMTP id 5b1f17b1804b1-492333d8ae7mr6321255e9.27.1781631085390;
        Tue, 16 Jun 2026 10:31:25 -0700 (PDT)
X-Received: by 2002:a05:600d:8496:20b0:490:e913:656a with SMTP id 5b1f17b1804b1-492333d8ae7mr6320565e9.27.1781631084806;
        Tue, 16 Jun 2026 10:31:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:31:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thierry Escande <thierry.escande@vates.tech>, qemu-devel@nongnu.org,
	Alexey Gerasimenko <x1917x@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [PATCH 3/4] q35: Fix incorrect values for PCIEXBAR masks
Message-ID: <20260616133032-mutt-send-email-mst@kernel.org>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
 <20260313164649.794591-4-thierry.escande@vates.tech>
 <46238511-ed5d-4f2d-881d-87120e4a408d@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <46238511-ed5d-4f2d-881d-87120e4a408d@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pmlMyhYbFd-A7gZHn-mSpbfV4VSK05n6t9-aHMb3j5k_1781631086
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-d62444/1781631089-ACE52FF4-22EAFE7F/0/0
X-purgate-type: clean
X-purgate-size: 876
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vates.tech,nongnu.org,gmail.com,redhat.com,linaro.org,habkost.net,xenproject.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mjt@tls.msk.ru,m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:x1917x@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:qemu-stable@nongnu.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B4CA693382

On Tue, Jun 16, 2026 at 07:25:52PM +0300, Michael Tokarev wrote:
> On 13.03.2026 19:47, Thierry Escande wrote:
> > From: Alexey Gerasimenko <x1917x@gmail.com>
> > 
> > There are two small issues in PCIEXBAR address mask handling:
> > - wrong bit positions for address mask bits (see PCIEXBAR description
> >    in Q35 datasheet)
> > - incorrect usage of 64ADR_MASK
> > 
> > Due to this, attempting to write a valid PCIEXBAR address may cause it
> > to shift to another address, causing memory layout corruption where
> > emulated MMIO regions may overlap real (passed through) MMIO ranges. Fix
> > this by providing correct values.
> 
> I'm not sure about the implication of this issue, - is it qemu-stable
> material?
> 
> Thanks,
> 
> /mjt

I think yes generally, but it worries me this has a high risk for
breaking migration if I missed something.


