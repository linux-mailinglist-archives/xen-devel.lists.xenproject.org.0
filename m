Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13799BA183
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829532.1244506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HJN-000637-NW; Sat, 02 Nov 2024 16:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829532.1244506; Sat, 02 Nov 2024 16:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HJN-000618-Kv; Sat, 02 Nov 2024 16:49:17 +0000
Received: by outflank-mailman (input) for mailman id 829532;
 Sat, 02 Nov 2024 16:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HJM-000612-BG
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:49:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62db50d4-993a-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 17:49:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730566147898571.2782656192873;
 Sat, 2 Nov 2024 09:49:07 -0700 (PDT)
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
X-Inumbo-ID: 62db50d4-993a-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYyZGI1MGQ0LTk5M2EtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY2MTUzLjgxMTAyLCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730566148; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N/MCIear0WfUWPVNx1z8tgxkBdGYNHxGASnoDU4iWjAETHDmOua8ARIrzHfwcNC5VQUHsG34AsUpgLi1oIcB9m+KG5fPXwpWIflL2W/S3KidxKzN30eNWpADQ50o6/L5lZXMaoJZkyr+cnTO+lcjJ1rowKB0Td5rI8agt2s+xjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730566148; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aejNDPzweKfKj+uKqKlhuimy4h5lVIEJw5FIk8qjYAQ=; 
	b=bQKcXJGiK1ko09eJ2gS9mgUBjEvJGntbH2D7nxzN1Ds8va+h+bhS0p31ExvtDbIVo2wnzY/ij7py+PkKcsOY2cKH1DHYQ03Hquk0QpT/2jz5v2zZM4d5Pt49U76ixQbkvbaHo06XyR3iCyXAwydUxy3X7brxyQlJKjtxqeA8F9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730566148;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aejNDPzweKfKj+uKqKlhuimy4h5lVIEJw5FIk8qjYAQ=;
	b=lBKLKDUV27ifUrF4yztVYXgiGxnXhCZdpFKFtPZUsBOZK6+7eIOsZU5JGNpvOIn3
	zrfMoT3h087OsSPYxIPJ7Pe7gGNKwyoeryEnWwPlLDbYXIDC/gDmqVNSB3N+q4wkYzG
	pmMPF4oyaRyo6vwATmqDB2cmqFmC4uL1znPDlFSk=
Message-ID: <a57677e6-429f-4b54-91bf-3933581d1150@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:49:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] x86/ucode: Move the CPIO path string into
 microcode_ops
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-8-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> We've got a perfectly good vendor abstraction already for microcode.  No need
> for a second ad-hoc one in microcode_scan_module().
> 
> This is in preparation to use ucode_ops.cpio_path in multiple places.
> 
> These paths are only used during __init, so take the opportunity to move them
> into __initconst.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

