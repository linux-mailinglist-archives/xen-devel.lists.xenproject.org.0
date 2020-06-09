Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40E1F3A0B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicgk-0007TE-5t; Tue, 09 Jun 2020 11:45:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jicgj-0007T9-DH
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:45:05 +0000
X-Inumbo-ID: a8757ab2-aa46-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8757ab2-aa46-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 11:45:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j10so20934189wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=t0l++NQysrwgMC8g2kOgfNjJNkMP5TFOkmTk0rF8x1c=;
 b=exsB9kfWCCWPysLpCyX/uz24o96gkcZzlimsCrlf1fkJ4pO0QwF7obUx+UetvmlSbb
 HW4J/DvORuWmTY+05vwtrGY6heKd65smuh3Cwf22eUUJbHvm8p/V6NeQGUsXTm+Du2O+
 fnMrnEJdGtIwyS/G6a95xoVzlf/YobOZG3vTUSm6mnWpiI1U0BIk/duG2CxFClWRZAEw
 TDdcY8L0YOWVfPu4ke3AUtIhj5BFrCSx/hN1E2gsZjoLMwPQVkKa4hlNcnFNxzG0Bddc
 odjt/v7s6yb1DsRLsnL4FeyjrlvwzvX0NArJllTq3uCoJj/5mKnUQVNO2twzLFWebRIO
 HU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=t0l++NQysrwgMC8g2kOgfNjJNkMP5TFOkmTk0rF8x1c=;
 b=el8xOwYArMICJFiz2gry1UKcvdMisa5P5+al0tWdQTRBiZXYdsYA5Zlpx1++GQjjy3
 JI8g57QehMJiTcKKIDwr8e70ObsiksyBNkcpeJ7gKkgvONlQ5KRGz4lFxR8/MAyWEBI5
 JtP1zg7TY4pukFP/QWzV1gAUqESa/9bQnNYlHJaHbUe7ZmzfSoygR44MqTefYU0+tpEB
 CryLwszAlNTai6yUrQK9i/pv+TB3jzVpCV4twdKKti1Lo0r9nZddwzWMtC2bhdnHUttL
 0FjBOkoeFaPYQyS7E1ZoJcJac9AjfOTci0ej2trJRicL+rS4r7DwgqTsMJEoPCwrQhva
 ItWQ==
X-Gm-Message-State: AOAM530YODdeLrrvXq4/hHHKlJgo0UYDCGQPuX6qA8Y9P49Exq2wheJH
 IFm6by2i5W/Rr0yW5mKb9D4=
X-Google-Smtp-Source: ABdhPJyVsUivLxzZquvC4LvnEk7IcSJrRNjVfVaFIoe1eYfScekSa/VdZgNEawYOoCjXaTgpBMjVjw==
X-Received: by 2002:adf:e90b:: with SMTP id f11mr3943346wrm.248.1591703103573; 
 Tue, 09 Jun 2020 04:45:03 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id s132sm2807729wmf.12.2020.06.09.04.45.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:45:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>, <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <Andrew.Cooper3@citrix.com>,
 "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
 <24287.29623.551154.322547@mariner.uk.xensource.com>
In-Reply-To: <24287.29623.551154.322547@mariner.uk.xensource.com>
Subject: RE: [XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for
 copying with pandoc versions
Date: Tue, 9 Jun 2020 12:45:01 +0100
Message-ID: <007f01d63e53$69983a00$3cc8ae00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFPMD46xN1NN75ENWA5oEEghpKwNAG13mqLqdCXQNA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 09 June 2020 12:34
> To: xen-devel@lists.xenproject.org; Andrew Cooper <Andrew.Cooper3@citrix.com>; Paul Durrant
> <xadimgnik@gmail.com>
> Subject: Re: [XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for copying with pandoc versions
> 
> Ian Jackson writes ("[XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for copying with pandoc
> versions"):
> > Different pandoc versions generate, and expect, a different toplevel
> > structure for their json output and inpout.  Newer pandoc's toplevel
> > is a hash.  We are going to want to support this.  We can tell what
> > kind of output we should produce by looking at the input we got (which
> > itself came from pandoc).  So:
> 
> Having just sent this I see the typo `copying' in the title...
> I have fixed that in my tree.
> 

With the typo fixed...

Release-acked-by: Paul Durrant <paul@xen.org>


