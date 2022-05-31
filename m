Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95623538F24
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 12:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339426.564279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzIG-0007Mj-BD; Tue, 31 May 2022 10:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339426.564279; Tue, 31 May 2022 10:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzIG-0007J2-8K; Tue, 31 May 2022 10:40:08 +0000
Received: by outflank-mailman (input) for mailman id 339426;
 Tue, 31 May 2022 10:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvzIE-0007C2-NE
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:40:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0701e400-e0ce-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 12:40:04 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653993601174192.65366825164335;
 Tue, 31 May 2022 03:40:01 -0700 (PDT)
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
X-Inumbo-ID: 0701e400-e0ce-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653993602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WdDk0I9HfLtwu0zz8dawgMVtoRrKcbqrWZ561ocB2rvCfViaSYAUEE2K2uvtKLozZRbVG29Rn59vW4tE8IVnmpgeIcklsQ5QXn4uiu4DslRWzTvYlqVcI+o8yBo8EP0BnVhzDsW10xht2Uv9BcpkpbJjlDRp9sdAThmZqN1xCxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653993602; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=I2QvtA0PYsYVOZIvSOMYE6WUfmymfnA0ryQYhzCsR3Y=; 
	b=fYVp4Wv/m75Jya56irOrbkTXp51uItxXWlDLg8xI4rR5yJB39froN+aXYAKvDIQDJW5K6ToTr8TubJv2ic+cSuTpt4B+IaKXAef2Lb0oT9h21hK/GCvAyJK9SvclOLnS+RjnSMDI78OaB3eYvsmk/J5M10nj3xtoiHmArtNFcug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653993602;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=I2QvtA0PYsYVOZIvSOMYE6WUfmymfnA0ryQYhzCsR3Y=;
	b=JoPSoo7jrfcOQoKgXyGhDMnKZbQAx0EYaVEFh+WmV6InHvqLpk+l+aqDg81FMvTI
	apt4Rxg1bxKJep6A8cYBrRfUdcAyfQvKwVVf3o+Y7P6127hKUcL4539+FdqbcDI9rj+
	aQtvzbhLv88aduZagvTTAjitfjYmF0xRKnh0GhEg=
Message-ID: <e90d6896-5a23-c9e8-c166-63593c7a67f1@apertussolutions.com>
Date: Tue, 31 May 2022 06:38:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v2 0/3] xsm: refactor and optimize policy loading
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 xen-devel@lists.xenproject.org
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
 <b1340b4d-88dc-b146-d159-a54f662a2791@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b1340b4d-88dc-b146-d159-a54f662a2791@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/31/22 04:25, Jan Beulich wrote:
> On 31.05.2022 04:39, Daniel P. Smith wrote:
>> This series was born out of some cleanup work done while crafting the
>> hyperlaunch boot modules patch series. The primary purpose of this series was
>> to stop walking all boot modules when it was not necessary, but the scope
>> creeped during review.
>>
>> Changes in v2:
>> * changed init_policy to policy_file_required
>> * split the patch into a series
>> * corrected casting of policy buffer
>> * use IS_ENABLED() instead of #ifdef sequence
>> * moved #ifdef inside of braces for xsm_dt_policy_init()
>> * addressed lack of error handling of xsm{mb,dt}_init()
>>
>> Daniel P. Smith (3):
>>   xsm: only search for a policy file when needed
>>   xsm: consolidate loading the policy buffer
>>   xsm: properly handle error from XSM init
> 
> The thread consists of 5 follow-ups, including two different 1/3 and two
> different 2/3. This wants sorting and then perhaps (properly) resending.

Yep, looks like I had stray copies from an internal review spin. My
apologies. Will resend clean version.

v/r,
dps


