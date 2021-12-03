Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B93467524
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237288.411522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5s1-0001ZF-U6; Fri, 03 Dec 2021 10:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237288.411522; Fri, 03 Dec 2021 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5s1-0001WX-R3; Fri, 03 Dec 2021 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 237288;
 Fri, 03 Dec 2021 10:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5e4h=QU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mt5s0-0001WR-Az
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:32:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a0e6c18-5424-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:32:46 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1638527558682794.7941430149524;
 Fri, 3 Dec 2021 02:32:38 -0800 (PST)
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
X-Inumbo-ID: 5a0e6c18-5424-11ec-b1df-f38ee3fbfdf7
ARC-Seal: i=1; a=rsa-sha256; t=1638527561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JkIDVH9Wb5ZqmknRJlkR+8Zg8NnpOByef3lHBO2BGy0eqSo56/n/iz3BQcYVLKRbC24uFwmqs5i/lGFRPXA9hHuTPvTlI+K3pYq/BngWxNnMp2jhMN7wTVsU24Ss1sv2CBcTehhUZFuQ3lOyyfvzMnriyGeD7Ix6ssXqZG4Q9gQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1638527561; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=IzlS3kgJSrMonzIiyfZ3uL8xyz5tf3DhYMDDDegUafc=; 
	b=WG3rCzIG0xVLE8NFBJDznm8Cei07od5chXBKQvsgJCx8Fpu1WOP9YoNNFm3/m6cByANtiibv2He+p2x3y9w3eHWKOKwdl7L0hTnG9M8cghpcwHIrP+jdhzUe7DGk8CWP+HhEfXeV+rXTWQlJbpqscsVy0Ld58FJ8AcFCcTg4I0s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1638527561;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IzlS3kgJSrMonzIiyfZ3uL8xyz5tf3DhYMDDDegUafc=;
	b=n2LnPWEGyshLVRS+n8Vamedg21C/bviiQ8v6wdgoEv/A9DyFpIeNNDJUy6X0RaYM
	naSpEKrLDlpl1MhRg7zMZEDdwWHKDSeqDqoQN/QrtDmPn7YR01LFIatjiUAXcPglPJ5
	JHdxt/d/Fo9IW4JWel5vgvS7LSedvN/8lxrhoNJc=
Subject: Re: [PATCH 3/4] xen/xsm: Use __init_data_cf_clobber for xsm_ops
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-4-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <17592382-02e2-7ba8-1d25-57d6451c3f5a@apertussolutions.com>
Date: Fri, 3 Dec 2021 05:32:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211126212258.7550-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/21 4:22 PM, Andrew Cooper wrote:
> All calls through xsm_ops are fully altcall'd.  Harden all fnptr targets.
> 
> This yields:
> 
>    (XEN) altcall: Optimised away 197 endbr64 instructions
> 
> of 1655 on an everything-enabled build of Xen, which is ~12%.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

