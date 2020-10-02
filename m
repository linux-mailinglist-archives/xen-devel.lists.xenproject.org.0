Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2AF281E8B
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 00:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2369.7042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOTkn-0004ZL-Cd; Fri, 02 Oct 2020 22:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2369.7042; Fri, 02 Oct 2020 22:42:17 +0000
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
	id 1kOTkn-0004Yw-9Q; Fri, 02 Oct 2020 22:42:17 +0000
Received: by outflank-mailman (input) for mailman id 2369;
 Fri, 02 Oct 2020 22:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOTkm-0004Yj-8n
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:42:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a2c0ea9-08ed-4947-ad80-98eb5d9181a7;
 Fri, 02 Oct 2020 22:42:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOTkm-0004Yj-8n
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:42:16 +0000
X-Inumbo-ID: 6a2c0ea9-08ed-4947-ad80-98eb5d9181a7
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6a2c0ea9-08ed-4947-ad80-98eb5d9181a7;
	Fri, 02 Oct 2020 22:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601678534;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7qdzCzvub0sfIC/kGzx1XCmdSUtuH2Dz3eRm6Ac/eI8=;
  b=iadlyHLUTjhLor9hSbY3gNzI+n0mvZh71/d9vDBACCg0qzdptkauSt94
   2CkMYvxbWn+vn/aPwErJ8P/dGw6XF8QAxuUf6qIKsiaeh1Vekr8Ci6ZZT
   SGRShMmonnJe+byzldc23dfycNldOGJUMosKUpSjxu7lE8eHUQQUgnnoI
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jun3fDn2iHrWZekaRBipIyETex6SvD9y1OcfN6yVgpkOGKJxKc3/dGewUmReEcP7Zbq2LtrlBB
 IHPbf3scN/TBrRcRrao0vmCsRReuc0E0OPE6D0fQ+L0rzj9SpKMGrbx0enUajrLGXbcjwS+1lm
 hs6S0+jNQrcntUR9MEhN3Z7969ujg363lMrLUA0YEmXLX2NnwNS8foFIlC5dFcLyiGC2eyjuWN
 3BLHIoOwLWqO7e0pqb+8cD31NljfjWHz664BVSGGN5HBNuI/8dJ4+VDjG/BXFo+G1X2Hczxojh
 Ptw=
X-SBRS: None
X-MesageID: 28285138
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="28285138"
Subject: Re: [PATCH v9 4/8] docs/specs: add missing definitions to
 libxc-migration-stream
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-5-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fda9ae6f-e55f-2e62-44a9-acf4e6e2d09e@citrix.com>
Date: Fri, 2 Oct 2020 23:42:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-5-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> The STATIC_DATA_END, X86_CPUID_POLICY and X86_MSR_POLICY record types have
> sections explaining what they are but their values are not defined. Indeed
> their values are defined as "Reserved for future mandatory records."
>
> Also, the spec revision is adjusted to match the migration stream version
> and an END record is added to the description of a 'typical save record for
> and x86 HVM guest.'
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Fixes: 6f71b5b1506 ("docs/migration Specify migration v3 and STATIC_DATA_END")
> Fixes: ddd273d8863 ("docs/migration: Specify X86_{CPUID,MSR}_POLICY records")

Oops sorry.  I swear I had these at one point.  I can only presume it
got swallowed by a rebase at some point.

~Andrew

