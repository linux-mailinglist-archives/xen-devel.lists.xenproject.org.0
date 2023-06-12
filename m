Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A932372CFCE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 21:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547437.854828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8nSz-0004ra-TJ; Mon, 12 Jun 2023 19:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547437.854828; Mon, 12 Jun 2023 19:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8nSz-0004p3-Q4; Mon, 12 Jun 2023 19:44:41 +0000
Received: by outflank-mailman (input) for mailman id 547437;
 Mon, 12 Jun 2023 19:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXst=CA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q8nSy-0004ox-1q
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 19:44:40 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fb1e6e3-0959-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 21:44:37 +0200 (CEST)
Received: from [10.10.1.82] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 168659907296010.997791154433571;
 Mon, 12 Jun 2023 12:44:32 -0700 (PDT)
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
X-Inumbo-ID: 8fb1e6e3-0959-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1686599074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e3TsX/VqN5IsEGH8feCKgXw2o+bqOReL2QrNFggGGLD081vx+rIFvS64QVjS4oq5f6OrNQCwpeMSQ1+S2nr67J7I4aqK136HB3biKUv0GNuMn+gVgoHb2QHVcD0YLlGtMhd2sNC2YXVYJ17DFN/B9lwKjq41VfbcCO0pDJcYK6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1686599074; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dJqE0sJlYljjw4V/g9QK786r+d/iX2nD8sgbwxfPqmk=; 
	b=grfBLYKmNBAC568xrTsgY559fRZOzTgjzoc6XNO02Mf1Gt9o9a5MbT0Di00dfMaxBXhkl42I930xkFNed08VSQC1KuCnMfDSpp11cgvPAA8/VjVyUhMgaPBBE3HDgmfnFN60vrIUJhMN6dNP2D8nVFeFuG+hfQzvqgGfGQXBn7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686599074;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dJqE0sJlYljjw4V/g9QK786r+d/iX2nD8sgbwxfPqmk=;
	b=bJdmB2XwD5O/6MQPG5a/7bOV74vGBsZ7/iFEwLjmEYPEclqN8xPCeteAKxsHDkx3
	7gXbK7CwugmhTHVky4u+RYt+7lLgtG07GnhcLgESzYvuRXmvHmPzYlKyhXnvfPtvCbG
	4aYh6PBJkev15bUc1qT80/+a2eEqSr0VN2qukTGc=
Message-ID: <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
Date: Mon, 12 Jun 2023 15:44:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/12/23 07:46, Jan Beulich wrote:
> The variable needs to be properly set only on the error paths.
> 
> Coverity ID: 1532311
> Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID down to libxl")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>

> ---
> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
> if the 1st yielded ENOSYS?

Would you be okay with the calls staying if instead on the first 
invocation of any libxl_flask_* method, flask status was checked and 
stored in a variable that would then be checked by any subsequent calls 
and immediately returned if flask was not enabled?

v/r,
dps

