Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452492C1851
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35198.66610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKAZ-0007sO-1o; Mon, 23 Nov 2020 22:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35198.66610; Mon, 23 Nov 2020 22:18:47 +0000
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
	id 1khKAY-0007rz-V0; Mon, 23 Nov 2020 22:18:46 +0000
Received: by outflank-mailman (input) for mailman id 35198;
 Mon, 23 Nov 2020 22:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khKAX-0007ru-EB
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:18:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0fc3a25-5a5f-49b5-94e0-2c652fb07d6f;
 Mon, 23 Nov 2020 22:18:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khKAX-0007ru-EB
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:18:45 +0000
X-Inumbo-ID: b0fc3a25-5a5f-49b5-94e0-2c652fb07d6f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b0fc3a25-5a5f-49b5-94e0-2c652fb07d6f;
	Mon, 23 Nov 2020 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606169923;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jAAfu4xO7vv46wl9cxSRuvWJTJrfxpupa07NGhSrHQg=;
  b=gBcbnJLsxTnLXzc04KvkF//hK7GQA1ygOdD6vZNiTxQzbUooOdujMvhF
   3tYUcMclAy2P5JJV3hiuQAueahekI89qdVX95AyAFN6J7UtfMsNjMEEi7
   uUib9sMFQtfmtnQphsGUwaZypJ9BTf+3YeOMzdGL5Y7h1/odSXKmuTY2N
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LXVVTD0u9I9HJrqOHSOBu/Xiunsk07/qHR1sr5L9Iz9Ayxt+DDTwmmwVyokdzbf10czdSLNMR5
 FMWi/ctDrqPN8koI19uUTlSHvSO6E2BndLx+AzDGFCBwzyFdJUuW2U650Yc/MtFVnPOOvrZwrX
 Zy94HTQwj5tLdabrX2BeeV3QQsEATzsFcUcSlv8jW2MoKEZrUuaHCU/8028xksRUzmhU3Cq9aE
 h9uIEF0aRHbuvQeTnlq7Q9EZZNMVCuoRKDt7pCsbz2rccCDM+pgvVJMtBu15iCsDsDbXir9UgX
 3rc=
X-SBRS: None
X-MesageID: 31796836
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,364,1599537600"; 
   d="scan'208";a="31796836"
Subject: Re: [PATCH v3 00/23] xl / libxl: named PCI pass-through devices
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Nick Rosbrook <rosbrookn@ainfosec.com>, Wei
 Liu <wl@xen.org>
References: <20201123174503.6800-1-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <822734cf-a048-2f53-940a-9f5ccf9df40f@citrix.com>
Date: Mon, 23 Nov 2020 22:18:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 23/11/2020 17:44, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Paul Durrant (23):
>   xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
>   libxl: make libxl__device_list() work correctly for
>     LIBXL__DEVICE_KIND_PCI...
>   libxl: Make sure devices added by pci-attach are reflected in the
>     config
>   libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
>   libxl: s/detatched/detached in libxl_pci.c
>   libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
>   libxl: stop using aodev->device_config in libxl__device_pci_add()...
>   libxl: generalise 'driver_path' xenstore access functions in
>     libxl_pci.c
>   libxl: remove unnecessary check from libxl__device_pci_add()
>   libxl: remove get_all_assigned_devices() from libxl_pci.c
>   libxl: make sure callers of libxl_device_pci_list() free the list
>     after use
>   libxl: add libxl_device_pci_assignable_list_free()...
>   libxl: use COMPARE_PCI() macro is_pci_in_array()...
>   docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg
>     manpage...
>   docs/man: improve documentation of PCI_SPEC_STRING...
>   docs/man: fix xl(1) documentation for 'pci' operations
>   libxl: introduce 'libxl_pci_bdf' in the idl...
>   libxlu: introduce xlu_pci_parse_spec_string()
>   libxl: modify
>     libxl_device_pci_assignable_add/remove/list/list_free()...
>   docs/man: modify xl(1) in preparation for naming of assignable devices
>   xl / libxl: support naming of assignable devices
>   docs/man: modify xl-pci-configuration(5) to add 'name' field to
>     PCI_SPEC_STRING
>   xl / libxl: support 'xl pci-attach/detach' by name

We're trying to get the CI loop up and running.  Its not emailing
xen-devel yet, but has found a real error somewhere in this series.

https://gitlab.com/xen-project/patchew/xen/-/pipelines/220153571

~Andrew

