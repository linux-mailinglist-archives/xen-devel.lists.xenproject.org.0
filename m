Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F22CEE9D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 14:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44741.80178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klAo4-0007ez-3v; Fri, 04 Dec 2020 13:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44741.80178; Fri, 04 Dec 2020 13:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klAo4-0007ea-0d; Fri, 04 Dec 2020 13:07:28 +0000
Received: by outflank-mailman (input) for mailman id 44741;
 Fri, 04 Dec 2020 13:07:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=320I=FI=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1klAo2-0007eV-4X
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 13:07:26 +0000
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f814601-9550-400a-ac8f-3f31a960ff25;
 Fri, 04 Dec 2020 13:07:25 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id h20so5272912qkk.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 05:07:25 -0800 (PST)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id 68sm4814263qkf.97.2020.12.04.05.07.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Dec 2020 05:07:24 -0800 (PST)
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
X-Inumbo-ID: 9f814601-9550-400a-ac8f-3f31a960ff25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Om5PIIN3PNPeYoKgw0/0KDEjx2f5tEo3ReCnrcbyAKc=;
        b=WnlJ97K749Fk0/7lD8trjUx2W55WV2ZmtHT0C8NdDKs2TPvwC+Q35caOkmb4XVrEwA
         DOP8WCk9EX6c5GAunriGst0xhQgyVHuLMaa/G1POxyTFRT4sU6ncZ/C+3Axvp49vbCa/
         n2H5EYzM4sHbhB+fLKGYsUr+FQ+8NVveKVOukE40Zp8MdzB5UjVk4WRVYdSE8OG5AKSb
         Y5FP/qdPGLlCjJZoJYLQWWCKvJvhVVV+kVOhy6Pdf+Ryqo4Akg0y0Q8SUmfwSiwCUc1J
         BBNu9+jMuJGgLwtJSsgqdxEMd7EPunBhqnQ3ezPfNS8cE7J9k+fIkB5cpGHXczK1aJPs
         JVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Om5PIIN3PNPeYoKgw0/0KDEjx2f5tEo3ReCnrcbyAKc=;
        b=Y6AKZu3oWVWrIkjUx+UoaLvqaW5TdlMCuyxxseb8asdQ/6PPsDeylZ0O2FWdFld4Qu
         hRTIAhom+PLMh8+v5fCyu+UdKZmRC8fs3yuTehSItiA9TBy4KminhQjnprfL21nEyz6m
         LUpxclZ1Ub6ZiFcbrdDt+PZba5WAT2PPfuVCG2g+14tn+F8kCxwiT5M/QMM2VfAEfh8a
         hF6UxR7AwvasSa2e9Kq9cjnrKN0NYvfiXGGfeTEofC3FIBzyWkX25zANOu7/Akma6K3k
         76jf225JLojCmrl9c9PsfM8TKSPS+oCf1RKHN+sHR+ScLTBYodUYyxuAGURmv5g0yrzK
         cnNw==
X-Gm-Message-State: AOAM530j95uvUQaOpYrm8cGfrmZD1+RbeKuGTzdm2ispus/29TgB3ob0
	6e2uDwTIoQHet0/tIcX2FnQ=
X-Google-Smtp-Source: ABdhPJzQvTAaOOFNkDmort9Z2pDUXBD56w8kvmeq2lzK4mB5PvUpaA50RN6hA5AybwVHyG2PruDhRg==
X-Received: by 2002:a37:655:: with SMTP id 82mr8744916qkg.374.1607087244978;
        Fri, 04 Dec 2020 05:07:24 -0800 (PST)
Date: Fri, 4 Dec 2020 08:07:20 -0500
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 17/23] libxl: introduce 'libxl_pci_bdf' in the idl...
Message-ID: <20201204130720.GA20110@six>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-18-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-18-paul@xen.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Dec 03, 2020 at 02:25:28PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and use in 'libxl_device_pci'
> 
> This patch is preparatory work for restricting the type passed to functions
> that only require BDF information, rather than passing a 'libxl_device_pci'
> structure which is only partially filled. In this patch only the minimal
> mechanical changes necessary to deal with the structural changes are made.
> Subsequent patches will adjust the code to make better use of the new type.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

The Go binding re-generation looks fine to me.

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

