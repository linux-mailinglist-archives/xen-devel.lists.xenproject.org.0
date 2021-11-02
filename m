Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A34424C9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 01:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219627.380486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhhjk-0002RG-TS; Tue, 02 Nov 2021 00:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219627.380486; Tue, 02 Nov 2021 00:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhhjk-0002Om-QH; Tue, 02 Nov 2021 00:33:12 +0000
Received: by outflank-mailman (input) for mailman id 219627;
 Tue, 02 Nov 2021 00:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6do=PV=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1mhhjj-0002Og-WC
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 00:33:12 +0000
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13b40cad-366e-450e-815b-a5390e411a91;
 Tue, 02 Nov 2021 00:33:11 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t11so13283721plq.11
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 17:33:11 -0700 (PDT)
Received: from piano ([2601:1c2:4c02:4c00::4])
 by smtp.gmail.com with ESMTPSA id e8sm17634626pfn.45.2021.11.01.17.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 17:33:09 -0700 (PDT)
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
X-Inumbo-ID: 13b40cad-366e-450e-815b-a5390e411a91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yCAVZmUWoVvp4yqkTge2abWtyRUneTUVixm2cYcl5Ls=;
        b=gemdhomL9L5hgpOijArx06DyAw5+MVCjS+GFFma6y3n0shTtpq6TgzRcM3IKiRG2QU
         Bp8tkx9PirfY1VSv+SP3solCVJP78rXtIn7SAPQcBDkswY7XSQPu55qq00/CB6Cb6Sux
         aUIh0AFrRIPWY66prv+pXtbX9i+3cCOvqxqPKHk8k5+s1FEPLXyOwDHhH7ASYXtS0gD7
         UBqRxd2KK1zHgDKr7XEpu/9JEvtsSfn9nqlBMCuokhhVJpT8aynpLrsqyie2ledoXhtl
         efhS9etSocHfp98BrTOtEnZmcUaVzWvf6zK7UvfMe+UKVTLrm8zbDQIqzN/SabnzY2Kl
         At7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yCAVZmUWoVvp4yqkTge2abWtyRUneTUVixm2cYcl5Ls=;
        b=iWH4mW/Z+2omDrf76yxYYFHgigsX+yuFp0n0MU6LeFiN+NziXjjhrPUxRvOxd3b2eW
         vJ0weUif7aaOWrRs0JXMdPsEEQ1P5VlEKYwuZwmQqhnjjKCwQRHvMnQAJKV/azjXEQqc
         l4hZj58SF9ZC0OZ/Y7GNfTyWxYY1QsiA3hl6q/xk3vPmbyUInITDR1ixTAww5MkX0PKj
         J/84+dqNSocVhCS/6nAWUebtFUt8yVBv46fPRprec17SZiJ3skWHxDmoB+lrjXPGQRgs
         r8RKCyX9fZPcLXTq5Hrxt/swuw4Qso4rbf77RmguNlPPIc7pN/QjElwCPG7DpjZVq42S
         L4pg==
X-Gm-Message-State: AOAM530a9OzVC+ZANT8wEGcpHvzHej8Zid/1Nl579+HQ68ecxqeSBSJl
	ASPtCUIeMZVTPZNAOUIMz5I=
X-Google-Smtp-Source: ABdhPJxoOh2Sr2JNc7n/pvhUkXcW6C5vHcWoSl/Z2YCGAKL6DTY4d01xRuKpKi8iksQ5DUPBJ3ReTA==
X-Received: by 2002:a17:902:7804:b0:13e:d4c6:e701 with SMTP id p4-20020a170902780400b0013ed4c6e701mr28119926pll.66.1635813190312;
        Mon, 01 Nov 2021 17:33:10 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:33:07 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jane Malalane <jane.malalane@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: Arch-neutral name for hardware interrupt support
Message-ID: <YYCHQ5Z6yCxQf6JO@piano>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>

On Mon, Nov 01, 2021 at 10:47:26AM +0000, Andrew Cooper wrote:
> Hello,
> 
> On ARM, the GIC is a hard prerequisite for VMs.
> 
> I can't remember what the state of RISCV is, but IIRC there is still
> some debate over how interrupts are expected to work under virt.
> 

Yes sir, that addition to the spec is not yet released (publically) AFAICT.

