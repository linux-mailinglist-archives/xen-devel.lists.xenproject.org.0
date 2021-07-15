Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB93CA3CC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156883.289466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44zP-0000aR-Cq; Thu, 15 Jul 2021 17:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156883.289466; Thu, 15 Jul 2021 17:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44zP-0000Y1-9Z; Thu, 15 Jul 2021 17:17:35 +0000
Received: by outflank-mailman (input) for mailman id 156883;
 Thu, 15 Jul 2021 17:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mdo=MH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m44zN-0000MA-KV
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:17:33 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f790ba9-5c84-4ce6-ac8c-6ee106c366d0;
 Thu, 15 Jul 2021 17:17:31 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626369448562996.1822807387987;
 Thu, 15 Jul 2021 10:17:28 -0700 (PDT)
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
X-Inumbo-ID: 6f790ba9-5c84-4ce6-ac8c-6ee106c366d0
ARC-Seal: i=1; a=rsa-sha256; t=1626369450; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n6nO8Rm4kgRZf/K6JU/RxWJYs/9T4hA5ikkbT7HrkpdKp7t+LsIM4HlbHI8/4I51JOwKFt4L5PpaupPDPIbQAqmkRLJ1cbgEuD/c4vPIXTYeksMl3LkVG7SuzBriRDMZwQ/pvelURrh3fnsnYsk3gEnuVNss090eYX4t2iJ/p5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626369450; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=P00peDQKF1/JWeYwaOiCjhKhOHnaRHQkn2dxMd+fkWI=; 
	b=g3WPRMzY5weDIPsI19rpXkMBVFOW7TS8URed23BpXtsTZOi1oe4kWMeccNVa6njT9ZsaaYDAOhb35VZHXGQMHFsSLjGV6AJHCl560FWH/JP7JsFo4GB05TaetaXCi1E7LUldSXlxnHAIkMSA1tb0OoedWG8gJfg9Z7qoliZN+aI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626369450;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=P00peDQKF1/JWeYwaOiCjhKhOHnaRHQkn2dxMd+fkWI=;
	b=jd5mKMs6eBnHbpw4DUfl4bdCDlhHQG+scOfPazSXiPBgoJhtiwx6j7rlFDor/ZV6
	j9wvjpBlIw2mu5x71z3reRtHZbCWNEk3jW9ifSZ8fdlfKO8ofI2DDZ2UqQSTLNm0i1G
	R+qsyYszf5sbwVoRFv7av5/hgt9yeUzmu3VLmGgo=
Subject: Re: [PATCH v2 03/10] xsm: remove the ability to disable flask
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-4-dpsmith@apertussolutions.com>
 <d7b3baaf-15b2-d991-a380-9524ad37a118@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <9b0167fe-39a7-378b-d080-c14c2da0aaa4@apertussolutions.com>
Date: Thu, 15 Jul 2021 13:17:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d7b3baaf-15b2-d991-a380-9524ad37a118@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/12/21 7:22 PM, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> The flask XSM module provided the ability to switch from flask back to
>> the dummy XSM module during runtime. With this removal the only way to
>> switch between XSM modules is at boot time.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> This patch wants reordering ahead of "xsm: refactor xsm_ops handling"
> which will reduce the churn in that patch.

Ack

> In addition, you want:
> 
> diff --git a/xen/include/public/xsm/flask_op.h
> b/xen/include/public/xsm/flask_op.h
> index 16af7bc22f75..b41dd6dac894 100644
> --- a/xen/include/public/xsm/flask_op.h
> +++ b/xen/include/public/xsm/flask_op.h
> @@ -188,7 +188,7 @@ struct xen_flask_op {
>  #define FLASK_SETBOOL           12
>  #define FLASK_COMMITBOOLS       13
>  #define FLASK_MLS               14
> -#define FLASK_DISABLE           15
> +#define FLASK_DISABLE           15 /* No longer implemented */
>  #define FLASK_GETAVC_THRESHOLD  16
>  #define FLASK_SETAVC_THRESHOLD  17
>  #define FLASK_AVC_HASHSTATS     18
> 
> to match the removal of FLASK_USER in c/s 559f439bfa3bf

Ack


