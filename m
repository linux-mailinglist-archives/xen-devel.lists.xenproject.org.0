Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248853952F
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 19:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339898.564814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5HU-0007Qp-BT; Tue, 31 May 2022 17:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339898.564814; Tue, 31 May 2022 17:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw5HU-0007NU-76; Tue, 31 May 2022 17:03:44 +0000
Received: by outflank-mailman (input) for mailman id 339898;
 Tue, 31 May 2022 17:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw5HS-0007NO-3P
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 17:03:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc21c47-e103-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 19:03:40 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654016615660296.8406884390141;
 Tue, 31 May 2022 10:03:35 -0700 (PDT)
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
X-Inumbo-ID: 9dc21c47-e103-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654016617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aYv0es7mKYVjwZB2c485H9L/8xXYP5xBh8Q9P1pEtHHhx0gDHGpwckKA2B8OpjdzMHSRmlV6d9W1KOd+fB2bBLspxrw20Sw7mOIveO579dTQUBWOwtfynqIQ05DvNov9MX/jv3sdIjsbH3cftlms0/R1jTADhnjvYrpVQGZ+OBU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654016617; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tcGpwATKnB8tjbSMB7ke1FkWwTgORrNPTiS1SBigrjo=; 
	b=T1u+IDvK6IDvzrkb05shI7LY9OqUMQBr2Hd0H8bd+YA+DTlssrshO4rTndE/hpKDNUU3mEh8FzAfq2DCLnvRqKgeSo+2L9FZXDvF7P54kkWd+9Mkuv70eUGbz0iCRJp4E9ml9xdGX1zFDGPBtqWfoTKtDI/P+xkUDv8L5rozMC8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654016617;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tcGpwATKnB8tjbSMB7ke1FkWwTgORrNPTiS1SBigrjo=;
	b=PbnHfDTQV5e/tYQkbXEZNEndIVE5LTw6meRYgpKeWD0a6FdsLnZv9R/j3OuOHEm3
	E25dM9cm6zqI/k77+0A5xc1Uu2Mlc40RoRVR2iku0xRfo813cC3VpVoUtNtFrjOoBwB
	M1opRPmA4WwNtMJWbDgT30BPltWWLc/VXrMyPDKU=
Message-ID: <0c9a0874-6afb-0ac0-fc6d-26d14081efe3@apertussolutions.com>
Date: Tue, 31 May 2022 13:02:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-3-dpsmith@apertussolutions.com>
 <53a64002-5369-26b9-cd30-119983518cc6@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 2/3] xsm: consolidate loading the policy buffer
In-Reply-To: <53a64002-5369-26b9-cd30-119983518cc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/31/22 12:05, Jan Beulich wrote:
> On 31.05.2022 17:08, Daniel P. Smith wrote:
>> Previously, initializing the policy buffer was split between two functions,
>> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
>> the policy from boot modules and the former for falling back to built-in policy.
>>
>> This patch moves all policy buffer initialization logic under the
>> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
>> message is printed for every error condition that may occur in the functions.
>> With all policy buffer init contained and only called when the policy buffer
>> must be populated, the respective xsm_{mb,dt}_init() functions will panic if an
>> error occurs attempting to populate the policy buffer.
> 
> "flask=late" is also a mode where, afaict, no policy is required. I can't,
> however, see how you're taking care of that (but maybe I'm overlooking
> something); inspecting flask_bootparam in generic XSM code would actually
> be a layering violation.

Good point, flask=late is meant to be enforcing with a late loading of a
policy file. I will address it.

>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -775,7 +775,7 @@ int xsm_multiboot_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi);
>>  int xsm_multiboot_policy_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi,
>> -    void **policy_buffer, size_t *policy_size);
>> +    const unsigned char *policy_buffer[], size_t *policy_size);
> 
> I don't think we're dealing with an array here, so const unsigned char **
> would seem the more correct representation to me.
> 
> Also - what about the DT counterpart function?

Ack.

v/r
dps

