Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2C72D061
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 22:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547463.854868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8o2p-0002jY-JA; Mon, 12 Jun 2023 20:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547463.854868; Mon, 12 Jun 2023 20:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8o2p-0002gJ-GQ; Mon, 12 Jun 2023 20:21:43 +0000
Received: by outflank-mailman (input) for mailman id 547463;
 Mon, 12 Jun 2023 20:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXst=CA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q8o2o-0002gB-8j
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 20:21:42 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc7831ea-095e-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 22:21:40 +0200 (CEST)
Received: from [10.10.1.82] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1686601295496237.13262427886923;
 Mon, 12 Jun 2023 13:21:35 -0700 (PDT)
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
X-Inumbo-ID: bc7831ea-095e-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1686601297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MsIaz2rxeL6pZdJ45Ryom0GwgIcoXVbSfH5DCljDKmKwP0mlReLbeT8YxQQMBHSOBamA/swHFYuanVika2Iuxj1EsQHhRdAHGligbB/x6mbLTa651N6RdfN+Ipz3w/9lkZHO5B2q8li+0D9rNFGU2CuojXC3R3pt4fAhwl5riKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1686601297; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DRLMWcPGvZ49P5QA0gEudmVxH7CjUhROX7mSUjvmDoI=; 
	b=KDBVoNWri6nkT9crzxfBXwREtwPmbogboDecWTp8ygmTQwOoOE0K70qAQ7HOLTm576ouAnm0LgQlEu+hGSJd6XRmMSmxV5ym2oTYyDMk/nPMCIPAyRwIh3o9pnTS+iBt3KRJOOaWRRK6eZE9dTCONt/+/hXjgdfC6JgPMspXnb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686601297;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DRLMWcPGvZ49P5QA0gEudmVxH7CjUhROX7mSUjvmDoI=;
	b=bsQTOPVJIn22Hk39NTEzxobe80lasPZ2cDXoyYVh2hCjxcAl+fBXtVzVSbr4Kaw/
	vL9Ci9sY7cV/9oKPOVOt0zGqsg+DOTrQKT4zzZQ5tms6ucVz4WaAGONeZOCmj+z1K6Q
	WvxgJlaYCccGorQU0yF+T+4pkFjFtHOT38d0ZXEs=
Message-ID: <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
Date: Mon, 12 Jun 2023 16:21:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
 <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
In-Reply-To: <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 6/12/23 15:44, Daniel P. Smith wrote:
> On 6/12/23 07:46, Jan Beulich wrote:
>> The variable needs to be properly set only on the error paths.
>>
>> Coverity ID: 1532311
>> Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID 
>> down to libxl")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>
> 
>> ---
>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>> if the 1st yielded ENOSYS?
> 
> Would you be okay with the calls staying if instead on the first 
> invocation of any libxl_flask_* method, flask status was checked and 
> stored in a variable that would then be checked by any subsequent calls 
> and immediately returned if flask was not enabled?
> 
> v/r,
> dps

Looking closer I realized there is a slight flaw in the logic here. The 
first call is accomplished via an xsm_op call and then assumes that 
FLASK is the only XSM that has implemented the xsm hook, xsm_op, and 
that the result will be an ENOSYS. If someone decides to implement an 
xsm_op hook for any of the existing XSM modules or introduces a new XSM 
module that has an xsm_op hook, the return likely would not be ENOSYS. I 
have often debated if there should be a way to query which XSM module 
was loaded for instances just like this. The question is what mechanism 
would be best to do so.

v/r,
dps

