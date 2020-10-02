Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA42810B1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1866.5661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIXg-0006XR-AC; Fri, 02 Oct 2020 10:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1866.5661; Fri, 02 Oct 2020 10:44:00 +0000
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
	id 1kOIXg-0006X1-7A; Fri, 02 Oct 2020 10:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1866;
 Fri, 02 Oct 2020 10:43:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOIXf-0006WE-38
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:43:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a;
 Fri, 02 Oct 2020 10:43:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOIXf-0006WE-38
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:43:59 +0000
X-Inumbo-ID: f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a;
	Fri, 02 Oct 2020 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601635437;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=KqxlULH5hG1JKBjKDC1ojwnlQxBw52oERRltytFhc0w=;
  b=cZ+IidvkILjnzjbtbOXDFAfzQAWr745S+hWl17Ica2ex5S9Lanlyt/M0
   Ja1xJWlgWQY/LK/5fCdBZh/TIH7wzMd8gYC/VhsZ5YTKlI3BdxKccsmUo
   80HA0NqGEKuhSFbYE28QcN8vyCpM0KT1dYJpDRUSubptUoPZqtHI5cREI
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lgv4ndG40uZ/fXaj7Ly6CF9/N5VJANF0YAmH0/mx2p4CYHYkXwi4Nh3KVau2ff4/GckrzQJzHR
 Gam4lOKUdntJvonYryqpXwzQ2k9QhHw8e5/j7WCmR/o7+ELrE0FgqYLIavUIXPswSMafJmMANt
 +0Dze8Lh4kRLSOCtKK/MUFqrNdFz4+PzbCc9Ahp64FCKJbnIaYaOSBSUJIVh0F8sXbSymANaGB
 WYS2VM13a3Ut8HxZi9vddyvvZgcZNvgAi1sR4uuNNpBdD6nCDddCpTpgsUp8oMdUkOCZeG13bf
 AQg=
X-SBRS: None
X-MesageID: 28418869
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28418869"
Subject: Re: [PATCH 1/3] x86/vLAPIC: don't leak regs page from vlapic_init()
 upon error
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <b437de21-f108-c30e-4e0c-1137ad7d99fe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <71e0720c-5a50-6844-5631-e1802dfb0b94@citrix.com>
Date: Fri, 2 Oct 2020 11:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b437de21-f108-c30e-4e0c-1137ad7d99fe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 11:30, Jan Beulich wrote:
> Fixes: 8a981e0bf25e ("Make map_domain_page_global fail")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

