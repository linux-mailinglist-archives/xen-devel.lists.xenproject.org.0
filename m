Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80893559DB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106128.202944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp3V-0005sc-3J; Tue, 06 Apr 2021 16:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106128.202944; Tue, 06 Apr 2021 16:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp3U-0005sD-W6; Tue, 06 Apr 2021 16:59:56 +0000
Received: by outflank-mailman (input) for mailman id 106128;
 Tue, 06 Apr 2021 16:59:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JduZ=JD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lTp3T-0005s2-GU
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 16:59:55 +0000
Received: from mail-wr1-f43.google.com (unknown [209.85.221.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 002609e3-bdf5-4fad-a514-053830cefb52;
 Tue, 06 Apr 2021 16:59:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b9so7105489wrs.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 09:59:54 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u9sm3567374wmc.38.2021.04.06.09.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:59:53 -0700 (PDT)
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
X-Inumbo-ID: 002609e3-bdf5-4fad-a514-053830cefb52
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=23E2JxVM2Db+lzpj2F19BRqlatm868CCsIQugpAoPNs=;
        b=VLc5bK6WinPUhsun42ziGkJ8UnDUhDkHixVT+QAXmNsjFTiAndUrrdjafc5qCqCtM7
         VBriseGI6Y0w1UjVfcIwNNyhpsIRFh1nIx3/uU4fQtH6bzGg6zVMq8bFpfBtg57a+NO2
         3hcoq9IYxJBtuE1sXhSXiVepExfMnuhgdFFATIDIV1RtD+lC4cGWZPDNULS7Fuz017Vq
         WckfdNBz3eTkTPcftrDOUd9SqQOtSwsAmQ5p26ve69SmhMn0UtWx6NzA61f6ZyhiT1vN
         aI+DbHoK7gzK/udiLPNlkJY3oeWfQ5Bpve1+bQksNmDiniOYJdNhWUA9l/srdgC1tdPj
         VgUg==
X-Gm-Message-State: AOAM5304Y002Aalpt2mC6w/tJfW25PDnU4QaHcoFcuQ+uyynruMdY2tM
	oJNV/hnjH/kVjNUNgjO9p60=
X-Google-Smtp-Source: ABdhPJwfsCFEuJt0HiZL72nSFIe192a6hiTiKdauCl7/4tTB1GlFWsrhg2TSePqXL90tchm3V1l/qg==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr35907371wrv.384.1617728394075;
        Tue, 06 Apr 2021 09:59:54 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:59:52 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86: slim down hypercall handling when !PV32
Message-ID: <20210406165952.lk6qqyb3ert3bsov@liuwe-devbox-debian-v2>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
 <d85736e6-bca9-de3a-328d-d727c327dbda@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d85736e6-bca9-de3a-328d-d727c327dbda@suse.com>

On Tue, Apr 06, 2021 at 04:01:41PM +0200, Jan Beulich wrote:
> In such a build various of the compat handlers aren't needed. Don't
> reference them from the hypercall table, and compile out those which
> aren't needed for HVM. Also compile out switch_compat(), which has no
> purpose in such a build.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

