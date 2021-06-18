Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2A3AD098
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144884.266625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHWB-0000L2-Pa; Fri, 18 Jun 2021 16:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144884.266625; Fri, 18 Jun 2021 16:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHWB-0000IG-MR; Fri, 18 Jun 2021 16:38:55 +0000
Received: by outflank-mailman (input) for mailman id 144884;
 Fri, 18 Jun 2021 16:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHWA-0000I2-7z
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:38:54 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5261fe5b-cbf6-4d37-9a43-710cdf632d28;
 Fri, 18 Jun 2021 16:38:53 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624034315940750.6890552082559;
 Fri, 18 Jun 2021 09:38:35 -0700 (PDT)
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
X-Inumbo-ID: 5261fe5b-cbf6-4d37-9a43-710cdf632d28
ARC-Seal: i=1; a=rsa-sha256; t=1624034317; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dv46wiqkC3MRZnUVVRCEgJfXCVTnjqu5YyfSiTcbx6Jv5N0IJU3wsiQuuo7fGqNzH1rScZOPvvtzoZ/KhOZWUP5P5T7gjeRhk6UTdWGvHjJR0BkbFns+7MMcB4LRc9etxZHfhofjh3Z0rObm8PxOD2CtfOpEk1A2wdjWw40/0So=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624034317; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=79+2Bn17i2gljjwjmZjJM5aEdhfxcybpIU7fGuMkMl8=; 
	b=By4p1CaaRKSvaFg5DNPBmM5G8nK4r/yOcr5nb+6/qIgNqpiuKHFnkDxpUXoI0fbmPhRiGnOBRprUpdmgMDGqLmSiuWz3UeXb2yMgvmFN/YKiC1DXqJNjmUZRi8W20EakAs7WArPVForftd4F7oW9S+UChYFVAY+RAJatnxUz1tI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624034317;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=79+2Bn17i2gljjwjmZjJM5aEdhfxcybpIU7fGuMkMl8=;
	b=V+lWIFvVFKGO+9JXNC0pvNQsjHLJZOKYM0LOeu1OzT1s1X0LhMIwp6A6u1bAk101
	f1uiP59V8CJjgO8LJsUxscCwXurFQDoBo1PQsl64e+/LTFMiAbIS0hi9KDpHcJvfzWm
	Gww//2DEZ44iiv+Riei3GoIWlzq2lhVUH2MRicXE=
Subject: Re: [PATCH 5/6] xsm: expanding function related macros in dummy.h
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-6-dpsmith@apertussolutions.com>
 <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
 <60894a2d-0977-18e7-75d3-726695dd06eb@suse.com>
 <e6d0eb00-b2ad-15ae-e9cb-65716779d960@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <db18d9d4-b10c-0a4b-22e7-95daa9575888@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:38:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e6d0eb00-b2ad-15ae-e9cb-65716779d960@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 8:44 AM, Jan Beulich wrote:
> On 18.06.2021 14:40, Jan Beulich wrote:
>> On 18.06.2021 14:03, Andrew Cooper wrote:
>>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>>> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
>>>> index 7e2bb09dac..0f8ea163af 100644
>>>> --- a/xen/xsm/dummy.h
>>>> +++ b/xen/xsm/dummy.h
>>>> @@ -9,7 +9,7 @@
>>>>   *
>>>>   *
>>>>   *  Each XSM hook implementing an access check should have its first parameter
>>>> - *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
>>>> + *  preceded by (or use XSM_DEFAULT_VOID if it has no
>>>>   *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
>>>>   *  with the expected type of the hook, which will either define or check the
>>>>   *  value of action.
>>>> @@ -47,14 +47,12 @@ void __xsm_action_mismatch_detected(void);
>>>>   * xsm_default_t argument available, so the value from the assertion is used to
>>>>   * initialize the variable.
>>>>   */
>>>> -#define XSM_INLINE __maybe_unused
>>>
>>> Nothing in a header file should ever need __maybe_unused.  Now that the
>>> !XSM case has been untangled, I think this can be dropped, rather than
>>> expanded inline.
>>>
>>>> -
>>>> -#define XSM_DEFAULT_ARG /* */
>>>>  #define XSM_DEFAULT_VOID void
>>>
>>> XSM_DEFAULT_VOID needs to disappear too.  I can't see what it is even
>>> doing before the cleanup, because if it is missing, you'll fail the
>>> compile for using K&R style functions.
>>
>> You need to look at the state before patch 3 to see its purpose. Patch 3
>> removed the other variant, and hence the need for this one as well, but
>> I think it is reasonable to not clean up everything in one go (unless
>> it would mean touching exactly the same code a 2nd time later on).
> 
> Albeit, having looked at the patch itself, I agree it should be dropped
> here together with XSM_DEFAULT_ARG, of which it is (was) a companion.
> But again, all provided there is agreement to remove the top level XSM
> option, which I personally don't think is a good idea.

ack, will be removing it

v/r,
dps


