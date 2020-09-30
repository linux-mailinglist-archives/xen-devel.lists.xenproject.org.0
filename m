Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746527EC2F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809.2731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdrg-0006zd-3X; Wed, 30 Sep 2020 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809.2731; Wed, 30 Sep 2020 15:17:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdrg-0006zE-0E; Wed, 30 Sep 2020 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 809;
 Wed, 30 Sep 2020 15:17:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdre-0006z9-4Z
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:17:54 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79fef07b-da1f-4e9d-87f3-0ad8944efe9f;
 Wed, 30 Sep 2020 15:17:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so2258022wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:17:53 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i3sm3440168wrs.4.2020.09.30.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:17:51 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdre-0006z9-4Z
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:17:54 +0000
X-Inumbo-ID: 79fef07b-da1f-4e9d-87f3-0ad8944efe9f
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 79fef07b-da1f-4e9d-87f3-0ad8944efe9f;
	Wed, 30 Sep 2020 15:17:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so2258022wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RQv7xm76WaRAMRk5l2RRLdbNzp2nbPPOHcCvJyMFLj4=;
        b=NlTX7qjyO6lkfzuqQd9O+PbFszmhX3nnKEA5O1CJ/trJG/muYXIjdwZIY3AzuhUw/8
         One2soxRtujCdIqD1vo765+32GXKir4EeET7Mmuz0ia5svn+uzIRuaTfLzLBXQXxl8AS
         g9JgoA48AUpcwn2HsSqj6VwSXy7u+6gYUFPdV8MbPk87d9MbzVPqnGbh5xMIakz70ckB
         FEe371AtWqZldKVxrM8SDi4zqZFPHPP4jcTPYgR2q+lDLLfFIMBBqWY9W0Io5I9JToF9
         ZWv7BXoDCNZ6gc8YhfFKHunAb3Ie1DnN59/8sTQ+fmXpY48iHrldcA+dY58Qj2XCioSn
         63Hw==
X-Gm-Message-State: AOAM532tDGaGudk/SfxSAkKZa40q6F3Whmi+SfLlSG9ZXY+OwNzeuXSq
	Zd9GIfEeYNRwrARdJ030pPk=
X-Google-Smtp-Source: ABdhPJxfiiRP6plR7rmeaGAiHWJboBM1aX/0Mtv/db4+Mx4eT5fEtL+l2icPmWDERBdtZ53DSVTsyQ==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr3702965wrp.384.1601479072526;
        Wed, 30 Sep 2020 08:17:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id i3sm3440168wrs.4.2020.09.30.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:17:51 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:17:49 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/cpuid: Plumb nested_virt down into
 xc_cpuid_apply_policy()
Message-ID: <20200930151749.3qpyzwg2sfsncf4u@liuwe-devbox-debian-v2>
References: <20200929134852.9235-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929134852.9235-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Tue, Sep 29, 2020 at 02:48:52PM +0100, Andrew Cooper wrote:
> Nested Virt is the final special case in legacy CPUID handling.  Pass the
> (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
> the semantic dependency on HVM_PARAM_NESTEDHVM.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

