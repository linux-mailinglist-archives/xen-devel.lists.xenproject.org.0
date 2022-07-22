Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C778257E33F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373315.605450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEu0A-000664-8x; Fri, 22 Jul 2022 14:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373315.605450; Fri, 22 Jul 2022 14:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEu0A-00064J-6G; Fri, 22 Jul 2022 14:51:38 +0000
Received: by outflank-mailman (input) for mailman id 373315;
 Fri, 22 Jul 2022 14:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEu08-00064D-G4
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:51:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c704cd0f-09cd-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 16:51:34 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658501490142284.71513356999617;
 Fri, 22 Jul 2022 07:51:30 -0700 (PDT)
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
X-Inumbo-ID: c704cd0f-09cd-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658501492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mew7OXShvMRwoGDwHlgEjwszSNSttYY7rDNWH1oX4vMshagZkO5NGXIFsbm2xyw/jCuUjWaC2OrsvlxcJHXGMSxaU4yjenc3T/0hVmWvGcpYTTyKIpCWCk6f/i+vDhS5eoTXgD604CBHKIV8hHn3ANZTskiH3LrT4RxRd/nEk08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658501492; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LY6ekQGrWlYm10xecyKNOkpPaSOz1o6GFlDi/DCO8J0=; 
	b=ibjduP59Nmuo/Vf0v6DWuJJaTsKTNOg2cDAAkGU2WVQn8Me83eoFKko2estkXKrXE/dufON6dTadnlOeQVQHA3Iq2ewLTKT+0ZwLmKBDlDRyMP/FpncCsrNx9qx7aKZ30rJExVo1Ez5IaUxO0kjbEFSD3svjLWpY4tITa6Mu1Ro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658501492;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LY6ekQGrWlYm10xecyKNOkpPaSOz1o6GFlDi/DCO8J0=;
	b=iJ7NPvkmsq3PyypagRSl2qhV4Nk+SlP84ad/02cbSVRnyBn12iITKofpDiMivFbc
	FeV1kjcn4GqMkoZqk3vD7aYvlXhAwB7R67H3+7OEDUrxdCvi56qoD7xN88t134CEiCN
	36/0Sh0UPBlXaBB3f4aGDXzteqY49hUDr3kQfUXE=
Message-ID: <961186e0-7da5-da27-a355-4c2554f800c3@apertussolutions.com>
Date: Fri, 22 Jul 2022 10:51:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <BN0P110MB1642FA64F48C31ED7F64AF27CF8F9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 00/18] Hyperlaunch
In-Reply-To: <BN0P110MB1642FA64F48C31ED7F64AF27CF8F9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/19/22 13:06, Smith, Jackson wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: [PATCH v1 00/18] Hyperlaunch
> 
> With the adjustments that I suggested in other messages, this patch builds and boots for me on x86 (including a device tree with a domU). I will continue to poke around and see if I discover any other rough edges.

Thank you so much for reviewing and testing!

> One strange behavior I see is that xen fails to start the Dom0 kernel on a warm reboot. I'm using qemu_system_x86 with the KVM backend to test out the patch. After starting qemu, xen will boot correctly only once. If I attempt to reboot the virtual system (through the 'reboot' command in dom0 or the 'system_reset' qemu monitor command) without exiting/starting a new qemu process on the host machine, xen panics while booting after printing this:
> 
> (XEN) *** Building Dom0 ***
> (XEN) Dom0 has maximum 856 PIRQs
> (XEN) *** Constructing a PV Dom0 ***
> (XEN) ELF: not an ELF binary
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not construct domain 0
> (XEN) ****************************************
> 
> This happens with the BUILDER_FDT config option on and off, and regardless of what dtb (if any) I pass to xen. I don't see this behavior if I switch back to xen's master branch.
> 
> Hopefully that explanation made sense. Let me know if I can provide any further information about my setup.

That is certainly a very strange behavior. I never tested reboot as I
assumed it should just go through the same process as could boot. I will
add this to my tests to run and see if I can track down why it is happening.

V/r,
Daniel P. Smith


