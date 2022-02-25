Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDB4C46E3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 14:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279108.476660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaz6-0002EW-NZ; Fri, 25 Feb 2022 13:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279108.476660; Fri, 25 Feb 2022 13:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaz6-0002CO-KP; Fri, 25 Feb 2022 13:50:12 +0000
Received: by outflank-mailman (input) for mailman id 279108;
 Fri, 25 Feb 2022 13:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXke=TI=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nNaz5-0002CI-Cc
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 13:50:11 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8dd2a43-9641-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 14:50:10 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 l21-20020a056830239500b005afd2a7eaa2so796785ots.9
 for <xen-devel@lists.xenproject.org>; Fri, 25 Feb 2022 05:50:10 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 g35-20020a9d2da6000000b005af5fb99326sm1103832otb.63.2022.02.25.05.50.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:50:08 -0800 (PST)
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
X-Inumbo-ID: d8dd2a43-9641-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=q/Ah4dHPOKbUhA6A/cbpacuPbQDLPxgHP9W7TYvNxO4=;
        b=I+YwrSCUubK6TwfuqKTMOyXzna72jSIMa5qCeF23OM1AWO8Jqo2nEFI0pDc5WPmQVQ
         /WpQ04q5YHZ9lkaDgEkhvmqqYtZT1zcD45DUvkR/vduI7jp0CvG6wnIQhyNoyoT0Kxk/
         piu0Rzl+ejAbByDeIAH4yhvqHosuI/xIG7ZW6HynUU63+TTNoVA3fYhmYudrW9vUUlkz
         LfgKCqFRzeA30z2H0P7Pj1RlawozhTW2lOj9oHPwNNKXJUIwFN+MaSZmN1wvXqIzbpep
         rQAzTG96WwsjnJBDoeAOvuJeJwShxmvopJj3cYZZzVy1UvSkE64ga+4lktpZ2GDfwzOq
         gysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=q/Ah4dHPOKbUhA6A/cbpacuPbQDLPxgHP9W7TYvNxO4=;
        b=MVSn8EB0tdRWfhvKAYoywdVY27Jg3zlXN5Y0PpqdPpDZPzTMZmL5ZMpgsWzRDB+D3h
         ONQNyGWRtm53uezvpUhxCobD4DNL8HNHqgV4F33njlHr3351COOPB/0kEc5WjvUTYU/q
         DoAoVsOLXI47wmWoz40kwIvy6Y3XOOW94sdJ1CTZV0IIgIsas9/F/eGIX9jmW8H+q7mD
         5g8mzqqiObBqVa9ZxAfiINcd53MT00Neor9/h6TcJhGFJuS5zg33kwPeLGOtwYzCqJrZ
         rM9gRyH7Bd2q0b3AUwybSCU3X66aF1H7PlAx17GEQTx5teM8jxvZ+xjOxm2eLwHj6NcO
         Df7Q==
X-Gm-Message-State: AOAM5324TpSw39Oav6nqxZX+kxe2wPs7ai2c62BxiPJ/zTHFTRbK74y6
	BVMSgs+P+xRkjkoRwyWe9SS7CBktZX/DAg==
X-Google-Smtp-Source: ABdhPJxwvx5YPsbGzRHZeNUtMai/YHLGSHM9VRr6/EhRvbQEU/VgAYGNsR/IUOO0o7Gpxx7FAAr3Tw==
X-Received: by 2002:a05:6830:b92:b0:5af:44c9:f115 with SMTP id a18-20020a0568300b9200b005af44c9f115mr2792357otv.24.1645797008966;
        Fri, 25 Feb 2022 05:50:08 -0800 (PST)
Message-ID: <c33d1731b054a488974f96b8171b7b1b5aa61b4a.camel@gmail.com>
Subject: PVH dom0 and MSIX memory mapping issue
From: Alex Olson <this.is.a0lson@gmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 25 Feb 2022 07:50:06 -0600
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I realize PVH for dom0 is still experimental, but was trying to see how well it
works in the state of "master".

I found one issue with MSI-X interrupts in dom0 -- a fatal page fault occurs
when the MSI-X PBA is accessed from dom0.  It looks like dom0 doesn't have an
identity mapping for the PBA of a PCI device --  intentionally caused by
vpci_make_msix_hole() ?   

I was also wondering, what is the impact of "existing mapping (...) at 0
clobbers MSIX MMIO area".

Is the purpose of vpci_make_msix_hole() to make MSIX table/PBA accesses trap to
the hypervisor?  Seems like the page-based granularity is too coarse since the
PBA can be much smaller than a page as well as not aligned... 

I was able to get something potentially usable by adding a "ioremap" call in
 msix_read() and msix_write to deal with the access of the PBA.  Wasn't sure if
this was a proper way of handling things...  Was also wondering if it would make
sense to do the same for the "clobbers MSIX MMIO area" cases too.

Thanks

-Alex




