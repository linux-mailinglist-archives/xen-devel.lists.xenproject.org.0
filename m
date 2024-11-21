Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D679D4A3E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 10:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841260.1256748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE3r8-0005Hs-Nl; Thu, 21 Nov 2024 09:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841260.1256748; Thu, 21 Nov 2024 09:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE3r8-0005FV-Ko; Thu, 21 Nov 2024 09:52:10 +0000
Received: by outflank-mailman (input) for mailman id 841260;
 Thu, 21 Nov 2024 09:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE3r7-0005FP-BF
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 09:52:09 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4336f2c8-a7ee-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 10:52:04 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9e71401844so103706366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 01:52:04 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4181361sm60969366b.81.2024.11.21.01.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 01:52:03 -0800 (PST)
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
X-Inumbo-ID: 4336f2c8-a7ee-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQzMzZmMmM4LWE3ZWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTgyNzI0LjUxNDQ0NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732182724; x=1732787524; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLRYiSUO2F5QilBu2mjpt5BGL99+b2+kmRRF5ZFIFQc=;
        b=NZHWOdE2n3gh+dx6xUmyinWVXvhpd2juJRSPTw7puHQr+EwovsZ6Fyl92E5epflGpt
         I/vwPidhrDobXDIAMtF8CngnzJj0mFuLZxtMbComTjtlAPfV5bk3oGTGvPgNda4p7CyO
         d44e04DO7VYO6rzlnWucsSA8GNLxp0NfcsEnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732182724; x=1732787524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLRYiSUO2F5QilBu2mjpt5BGL99+b2+kmRRF5ZFIFQc=;
        b=TEZghy1yqcmhZBadtzD3k2A4MZs5y4wLrRYjDbF2leHylB+1QHyEDtdYute57V8FkS
         K/hbgvmAbyl11DVlIlQsRzNBPUM6GDoUCdAkbI8B6rj/X2Y9srRXzphK0TCOru71y2KC
         9lewmDGk9vnCgES42OBWiAbkaUAJwMdrnfKo3hprIYwjdS7KJQHBdU0k3RqSsSCGq4vw
         dEFi40t2Kr6gSBKKiKBCLMpUQi9VEqPf9eQxj6+C5szypR361d8gG2ZDSWoaUOenJmop
         CxWF2Ihu3GEYBxlgQ7sqkoQWAEjvenTQhRVA7yMpVT0+QRc0mgYh/5K/KiDF9K3GNJUA
         +GPw==
X-Gm-Message-State: AOJu0Yym78oZzrgaFMMrIRiqvCHetDb2kDBWKJeEbtP1eB7H90D3oxUA
	wLr24vSRQTrBV7y2dN4yOwOtUUkdSyn49HNClxmznD4cLZsd8ihQiz5VtxCaJFM=
X-Google-Smtp-Source: AGHT+IGXbWpOB1uSU1pynnjjNcseCZvtuhOeIR2O7lo90R7HoEPEmdLo/rMFR//KwZFlCQoxZUR4XQ==
X-Received: by 2002:a17:907:97c4:b0:a99:e4db:4909 with SMTP id a640c23a62f3a-aa4dd551b37mr600714766b.15.1732182723918;
        Thu, 21 Nov 2024 01:52:03 -0800 (PST)
Date: Thu, 21 Nov 2024 10:52:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Zz8Cwj3KJ1BIBEg_@macbook>
References: <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
 <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Nov 21, 2024 at 03:05:14AM +0000, Chen, Jiqian wrote:
> On 2024/11/20 17:01, Roger Pau Monné wrote:
> > On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
> >> The only difference between our methods is the timing of updating the size.
> >> Yours is later than mine because you updated the size when the driver re-enabled memory decoding, while I updated the size in time when driver resize it.
> > 
> > Indeed, my last guess is the stale cached size is somehow used in my
> > approach, and that leads to the failures.  One last (possibly dummy?)
> > thing to try might be to use your patch to detect writes to the resize
> > control register, but update the BAR sizes in modify_bars(), while
> > keeping the traces of when the operations happen.
> > 
> This can work, combine our method, use my patch to detect and write the size into hardware register, and use your patch to update bar[i].size in modify_bars().
> Attached the combined patch and the xl dmesg.

This is even weirder, so the attached patch works fine?  The only
difference with my proposal is that you trap the CTRL registers, but
the sizing is still done in modify_bars().

What happens if (based on the attached patch) you change
rebar_ctrl_write() to:

static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
                                      unsigned int reg,
                                      uint32_t val,
                                      void *data)
{
    pci_conf_write32(pdev->sbdf, reg, val);
}

And if you don't trap any PCI_REBAR_CTRL at all?

I'm mostly interested in figuring put which part of the code in
rebar.c makes this work (as compared to my original approach).

Thanks, Roger.

