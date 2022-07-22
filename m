Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEE57E21A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373210.605292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsTC-0003Je-S3; Fri, 22 Jul 2022 13:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373210.605292; Fri, 22 Jul 2022 13:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsTC-0003HI-P5; Fri, 22 Jul 2022 13:13:30 +0000
Received: by outflank-mailman (input) for mailman id 373210;
 Fri, 22 Jul 2022 13:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEsTB-0003HC-65
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:13:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1208bc51-09c0-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 15:13:27 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658495597171408.76117411861526;
 Fri, 22 Jul 2022 06:13:17 -0700 (PDT)
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
X-Inumbo-ID: 1208bc51-09c0-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658495598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ib8/LEFNKfyQROkZynvtQ3R4fUHA8k/vdsvgwSMj3qUMcSm4xkVj7AZWmn09Z/BZhhEaw6GUQeXriyG0lkv78BoGLodeeoyxEnDVxDh6Q2JNXA/gCTcq1qfZ9v155p3aheRVXXNE2VOSu0Ggsyh2Jc4l4N0qQ/5I9ZGdThd+9Vo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658495598; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DMELeVJ2IWtNbtfjbHFv36eX8cn2RFCk39q6I9hwIo4=; 
	b=QK+hkFrJE3sBtlLR2r7KcQujgWYd4CQpNK+I+3E7TmmF2ZB+JMBP9Pno0HlcpO8DXbpp3ytfWK0CkpKZYd9lVoeVeFD/QQ6Hs8NING/wyCi5a798xf/UntUCe9auuV/sCWUHtQkJ4lKZrDvZ92BaSgsEX3/idjUtd5Asan7/+Q8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658495598;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DMELeVJ2IWtNbtfjbHFv36eX8cn2RFCk39q6I9hwIo4=;
	b=oy0d7HU3eSVgDJFKxwfUyqK4FfVjC/+XMTH93NZJBkPVjyVx2WhBS2QYSlc7OYxS
	XtCMaUMPJqIlOXpGLZGW2pDuQLHcd6S8GYU241GagWmAh7BTSp01SYNQWS84rJYAN9l
	nzVEook4DZO9+CFocsUsNMK4pR1IdKcrfTl5QzBo=
Message-ID: <f6bc8761-b5cf-42b3-7e3f-596bb07528e2@apertussolutions.com>
Date: Fri, 22 Jul 2022 09:12:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-6-dpsmith@apertussolutions.com>
 <681d9e71-f618-ff33-59c4-bc7f793d45c7@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 05/18] x86: refactor xen cmdline into general framework
In-Reply-To: <681d9e71-f618-ff33-59c4-bc7f793d45c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/19/22 09:26, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> --- a/xen/include/xen/bootinfo.h
>> +++ b/xen/include/xen/bootinfo.h
>> @@ -53,6 +53,17 @@ struct __packed boot_info {
>>  
>>  extern struct boot_info *boot_info;
>>  
>> +static inline char *bootinfo_prepare_cmdline(struct boot_info *bi)
>> +{
>> +    bi->cmdline = arch_bootinfo_prepare_cmdline(bi->cmdline, bi->arch);
>> +
>> +    if ( *bi->cmdline == ' ' )
>> +        printk(XENLOG_WARNING "%s: leading whitespace left on cmdline\n",
>> +               __func__);
> 
> Just a remark and a question on this one: I don't view the use of
> __func__ here (and in fact in many other cases as well) as very
> useful. And why do we need such a warning all of the sudden in the
> first place?

This started as just a debug print, thus why __func__ is in place, but
later decided to leave it. This is because after this point, the code
assumes that all leading space was stripped, but there was never a check
that logic did the job correct. I don't believe a failure to do so
warranted a halt to the boot process, but at least provide a warning
into the log should the trimming fail. Doing so would allow an admin to
have a clue should an unexpected behavior occur as a result of leading
space making it through and breaking the fully trimmed assumption made
elsewhere.

v/r,
dps

