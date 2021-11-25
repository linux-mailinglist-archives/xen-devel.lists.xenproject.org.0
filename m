Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24D45E326
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 00:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232079.402064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNis-0005yR-0W; Thu, 25 Nov 2021 23:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232079.402064; Thu, 25 Nov 2021 23:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNir-0005vm-TZ; Thu, 25 Nov 2021 23:00:09 +0000
Received: by outflank-mailman (input) for mailman id 232079;
 Thu, 25 Nov 2021 23:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDhx=QM=linaro.org=mathieu.poirier@srs-se1.protection.inumbo.net>)
 id 1mqNiq-0005rV-6A
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 23:00:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e26023e-4e43-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 00:00:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id l25so30932135eda.11
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 15:00:06 -0800 (PST)
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
X-Inumbo-ID: 6e26023e-4e43-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ip9h7eLKlFuUCCExriwPQk+7kkbzJPXXKQycuHzhOqM=;
        b=nTUCy8NDTOlb7ly3IG6zlSFNBswSns6gOcVdY16KT2l1LLOa7IfWQKmvk/SLrV2faz
         X+rxAATEdYj5ji7YvfC3NJhzainZE25V+ZkHdwf38agUDa/Uk6H70eenBRX1LgPj9w1Q
         6pqDBljnB1ucvmbfNagfJHp1kANFCzbcaZDN53FbsL8TjvKfr9wXH6PvbXOjkmKNha1C
         4oFnIzcA0ckGcDWLnXsQp4Gdrg9nGWXP2g1nGwgFl//yGZkUXBccc99rxJdbgn+G19kC
         3LzRMrVGzCByNwMotU7P3f2QvSs+16fuRTNMfsJdwgUdMKPCVJ52fWEV4WGTvHZgm97B
         PXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ip9h7eLKlFuUCCExriwPQk+7kkbzJPXXKQycuHzhOqM=;
        b=5cNZvfUKseckobVydygBbSy5RxuHDlF/uItA2d3/4/Dh8ryhXSNGn3ffvTx9wbjEW9
         PYMROBDWMr1h8WF9i3WDphgulf1wa3N9HpE6612X4TNH4QmHAgu6yG/m7XGdXVKbNNjd
         XAJP6QpjfNRR+lU9KPh0FtBKr/rkedOh2g63ZEmGKA/iHmkd14AUzx9mpSXSABf1HTS3
         X4nAfHInQxf7XhQESk+y8DqSpzemAvOy5bkGDMikyCvIdOQZvtWCGKnxNkl8sjXpdhOc
         KrN4ctvbQRktVa3uamqoxEejFo9XkWluC7xTX0UGt+oAAjYN+Z1+OwDV/Zx4gWgnEAbL
         d0mQ==
X-Gm-Message-State: AOAM5311OUfI6uPeDvmuRYfTNiXeNAG19efL1ckiyD86KI9h65M3gUyR
	appnXjzyCwHtUwqNBMrk6sCPqHy78nhTpO7R4aC+p/mJo+JSYg==
X-Google-Smtp-Source: ABdhPJxdMl5+l6O6GE5OXmxc7TbLPtZM0DWq+37iQawOfqPyaRDDDQo5niRq+sK2ilSywOhOSY3v5yqT7LLYqgel+rg=
X-Received: by 2002:a17:907:9056:: with SMTP id az22mr34324001ejc.107.1637881205117;
 Thu, 25 Nov 2021 15:00:05 -0800 (PST)
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 25 Nov 2021 15:59:54 -0700
Message-ID: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
Subject: Aarch64 stand-alone application for Xen
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Good day,

I am in the process of adding support for aarch64 to the xen-sys
crate[1].  The crate currently supports x86_64 and includes a
stand-alone "oxerun" application that can be used to validate
hypercalls.  My goal is to provide the same functionality on arm64.  I
am looking for a stand-alone aarch64 example, something like an "hello
world" to help me with the assembler startup code.

Many thanks for the consideration,
Mathieu

[1]. https://crates.io/crates/xen-sys

