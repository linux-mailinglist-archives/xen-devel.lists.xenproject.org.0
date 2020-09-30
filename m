Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D227EAF8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767.2568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNd9Y-0001yz-Tr; Wed, 30 Sep 2020 14:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767.2568; Wed, 30 Sep 2020 14:32:20 +0000
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
	id 1kNd9Y-0001yV-Q7; Wed, 30 Sep 2020 14:32:20 +0000
Received: by outflank-mailman (input) for mailman id 767;
 Wed, 30 Sep 2020 14:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNd9X-0001yO-Fs
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:32:19 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831600d4-5ad0-4850-9a8a-91184edb4d33;
 Wed, 30 Sep 2020 14:32:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k15so2056228wrn.10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:32:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f1sm3079222wrx.75.2020.09.30.07.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:32:16 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNd9X-0001yO-Fs
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:32:19 +0000
X-Inumbo-ID: 831600d4-5ad0-4850-9a8a-91184edb4d33
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 831600d4-5ad0-4850-9a8a-91184edb4d33;
	Wed, 30 Sep 2020 14:32:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k15so2056228wrn.10
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nyjznvDstwwfBlcKovmoRugQbm6VrPwbNtnGOtYb/aY=;
        b=tDguhWtuZmMTrY6N7JlvEq2iDaNcfDLWPhq6wmPtWKpoA6HHy5hO+2CgiMrR8VgFdd
         MOJwNAL0IIRS3KKEA0C36EulTzPiFM3pG0jCzwtUY0jU3IS5APB1663Vz0f4+lIv0D8c
         bBsuKBZx6HYpkYuYwgkdSYdS83RF8Rpv9RKxbcix115Y1kM465RxWBEGs2cUtg5cUhsu
         4T1+OIa+DezxuYX3j/0iWYx5e9HVDfsHCUFL6JkWVdc8AE10kc3RM4bxO2/YEZaVXNo6
         Yf2SqhVNj8oxIs6vQdKtpsOK0Pb5AOQIdxHBUcVfe8d6mZu17hHEQSBGsqoLGShjb5Zp
         ewcQ==
X-Gm-Message-State: AOAM530djxrhe+gXIfi0zYkSqCN5WKtsS/hzmFe+NqyDGL3Uwo0UbIXt
	ooFJtxh5r2QtchZ4ap5fDt8=
X-Google-Smtp-Source: ABdhPJzH1oGnp6qwb3mAhQYM3Si0n2J5liIrXe72+NLyYZX7ttg4c+hyQeOGD/PlcNRQJo5XxcfeBA==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr3577862wrn.109.1601476337618;
        Wed, 30 Sep 2020 07:32:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id f1sm3079222wrx.75.2020.09.30.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:32:16 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:32:14 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v9 3/8] tools/misc: add xen-domctx to present domain
 context
Message-ID: <20200930143214.yumm5skdyriqa5bv@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-4-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-4-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:25PM +0100, Paul Durrant wrote:
> This tool is analogous to 'xen-hvmctx' which presents HVM context.
> Subsequent patches will add 'dump' functions when new records are
> introduced.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Wei Liu <wl@xen.org>

