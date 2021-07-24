Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037B3D49F0
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jul 2021 22:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160513.295117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7OUJ-0001hW-BO; Sat, 24 Jul 2021 20:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160513.295117; Sat, 24 Jul 2021 20:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7OUJ-0001f4-7w; Sat, 24 Jul 2021 20:43:11 +0000
Received: by outflank-mailman (input) for mailman id 160513;
 Sat, 24 Jul 2021 20:43:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYYX=MQ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m7OUH-0001ey-NF
 for xen-devel@lists.xenproject.org; Sat, 24 Jul 2021 20:43:09 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cd413da-57ad-4839-a4bb-227d738d4800;
 Sat, 24 Jul 2021 20:43:08 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1627159385387949.1730538102499;
 Sat, 24 Jul 2021 13:43:05 -0700 (PDT)
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
X-Inumbo-ID: 2cd413da-57ad-4839-a4bb-227d738d4800
ARC-Seal: i=1; a=rsa-sha256; t=1627159386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sn3MFxVvSMGzV40V3JczanAvqsAaYMpBM/Mm0SWAIfEc99rOMHew5Y2698SZD25SmzpxlDXpehDA8NuDoYukTJ/GktpkxVIzFAkyLED4e9FCVGVvMD6ktbfVJ6om3rS88WgyzILvRJy+mK8JdTRcYZilomyFFyFiyuO3KUvuy84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627159386; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=l0HQ0dv2xeoNzvlSu1aIz5cr2FnCBz+hT2qxMfZWAmE=; 
	b=E6A114aSfHPZBZXxGEyt/UOR5km4iEHpMVse+gRSLW4YHRcByfx5kRJu0LF/K9f2GOq2yjwW8LbcO0/VOMQ4dmQC7Cduk8uS+tYMJxmMS8jObSJuirWlrkimmZoKdr9plqwSOJfXOyxEFe+bzqC097bnNEqbMcmagt7O95A9+fQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627159386;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l0HQ0dv2xeoNzvlSu1aIz5cr2FnCBz+hT2qxMfZWAmE=;
	b=RNNWdv3tq+Xv0a5WHk4Ga7t0oVJRHDEpZvac08+yv2wZQ6ZHa3lYWZdSEZZzOIyS
	UGhUG20aslzHii9IeB6mpg2R2m0h1Ts00JAymqu8+l7K470ohpBF18klxVLSKTzSM2p
	89oFaX+sIlW/M0xomf1MlLewj0vL/fuXL1NmnW8E=
Subject: Re: [PATCH v2 09/10] xsm: expand the function related macros in
 dummy.h
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-10-dpsmith@apertussolutions.com>
 <34c71bc9-18e8-08cd-d55f-9f5f97bde91e@suse.com>
 <0c944d5f-cc79-4df9-9531-cb918aef8fe8@apertussolutions.com>
Message-ID: <723a963e-0188-290b-17dc-9e277808a7b0@apertussolutions.com>
Date: Sat, 24 Jul 2021 16:43:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0c944d5f-cc79-4df9-9531-cb918aef8fe8@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/24/21 4:07 PM, Daniel P. Smith wrote:
> On 7/16/21 3:34 AM, Jan Beulich wrote:
>> On 12.07.2021 22:32, Daniel P. Smith wrote:
>>> With the elimination of switching how dummy.h gets included, the function
>>> declaration macros are no longer necessary. This commit expands them out to the
>>> only value for which they will ever be set. This results in function
>>> declaration lengths changing and since some definitions did not even follow the
>>> 80 column wrapping style, all function definitions were aligned with the
>>> predominate style found in core hypervisor code.
>>
>> I'm afraid this last half sentence is quite far from true:
> 
> I would disagree since I know I went through the frustration of trying
> to find a discernible consistency in the files in common/ in the end I
> settled on following common/memory.c since it seemed to have the most
> uniform, it had only a couple of anomalies, as opposed to other files
> where indentation was varied throughout.
> 

Going back into the patch I found what happened. I am not sure how, but
every parameter line I wrapped had 7 additional spaces. This has been
corrected.

v/r
dps


