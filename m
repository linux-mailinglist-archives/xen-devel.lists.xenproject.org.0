Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367639877FA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805796.1217027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stroG-0006Gc-FO; Thu, 26 Sep 2024 16:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805796.1217027; Thu, 26 Sep 2024 16:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stroG-0006Dt-Ca; Thu, 26 Sep 2024 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 805796;
 Thu, 26 Sep 2024 16:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1strlq-0001SU-Ax
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:55:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17f95047-7c28-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:55:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727369705031839.5978858011581;
 Thu, 26 Sep 2024 09:55:05 -0700 (PDT)
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
X-Inumbo-ID: 17f95047-7c28-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1727369706; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gO0Tkv9cjbPD+U6MmGd7nHKDrf0ZIdyHBCj4DHuggMLEMRwwOP3yS479oIavzs8pwNWXhKzdQlhI6hHhFwcgawsUY7dW99FwIZr2l7aDLoPJqH6LXJTKhIIfNKwrryAKHsfI2IWAstA62GygS0+iaE0prAvdNFwhVRs1DzHoqNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727369706; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7E8w9pZUwxfioCpPwkzlZRNZLXgEIQJhNg2k5qAmQmI=; 
	b=OrscVVZ1HmcbJt/ebvefaCqgouwdY8IqYwLLUjo5xhjJ33odX4AXIAzJi/Dg40gd2TFbyDQrpePfXM1Y5zyvmnV6Ne6OrUwQ644jhXP7gfl8oWnjgdnTmOgq5Z6euN0ML4noVhJMRxI4cajdQF8UyEPdPhIGjljCnUeum8zwdMU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727369706;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7E8w9pZUwxfioCpPwkzlZRNZLXgEIQJhNg2k5qAmQmI=;
	b=Y49M3SNzV0PuIvcXbAPqqNQun4AZUwFNaANRXf9p0nUqvubXunnP43pO7RFvRXjK
	0LXJS03npMDgbHd9M6wyhbpUf+8RGDeVypY6qrKucEnSNTB4Ujuk943nNC270sbxes3
	8rR1Tm1d0mz5B8vfhX3b/+zkR6MyXZLA7iKwNRZU=
Message-ID: <1a9ccd2e-0862-4797-8b7d-5f4942b83fa2@apertussolutions.com>
Date: Thu, 26 Sep 2024 12:55:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/44] x86/boot: convert setup.c mod refs to early_mod
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-9-dpsmith@apertussolutions.com>
 <789911fc-eb37-427e-9d3e-b82f93a61099@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <789911fc-eb37-427e-9d3e-b82f93a61099@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/4/24 02:47, Jan Beulich wrote:
> On 30.08.2024 23:46, Daniel P. Smith wrote:
>> To allow a slow conversion of x86 over to struct boot_module, start with
>> replacing all references to struct mod to the early_mod element of struct
>> boot_module. These serves twofold, first to allow the incremental transition
>> from struct mod fields to struct boot_module fields.  The second is to allow
>> the conversion of function definitions from taking struct mod parameters to
>> accepting struct boot_module as needed when a transitioned field will be
>> accessed.
> 
> Yet earlier it was mentioned that early_mod is a transitory name. Will all of
> this then need touching a 2nd time?

Correct, but a lot of these references are parameters to functions who 
then call other functions that are passed the reference, turtles all the 
way down. To ease from having to wholesale convert every function down 
when switching to struct boot_module, a methodical approach was taken. 
To ensure there isn't an mix of using both the mods[] array and 
bm->early_mod, I did a wholesale switch which allows the immediate drop 
of the mods[] array. This way, as the last usage of early_mod is 
removed, then it is known that it can be dropped from struct boot_module.

The need for early_mod is that starting with __start_xen(), a commit can 
be done for each function with the conversion to accepting struct 
boot_module. The function is changed such that any accesses to address 
and size at that level to use struct boot_module directly. Any function 
calls within the function being converted that take an instance of 
module_t, would be handed bm->early_mod. The next commit would then 
descend into the next level, doing the same conversion.

The only other approach is to have a commit for the conversion of each 
function call in __start_xen() that accepts module_t along with the 
entire call chain under that function. That gets ugly very quickly.

v/r,
dps

