Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45F87E4B1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 09:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694516.1083327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7z8-0001pE-33; Mon, 18 Mar 2024 08:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694516.1083327; Mon, 18 Mar 2024 08:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7z8-0001mI-06; Mon, 18 Mar 2024 08:04:42 +0000
Received: by outflank-mailman (input) for mailman id 694516;
 Mon, 18 Mar 2024 08:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Kki=KY=bounce.vates.tech=bounce-md_30504962.65f7f593.v1-16831b18532c40069ca102c4ce20b37a@srs-se1.protection.inumbo.net>)
 id 1rm7z6-0001mC-Lt
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 08:04:40 +0000
Received: from mail135-12.atl141.mandrillapp.com
 (mail135-12.atl141.mandrillapp.com [198.2.135.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a957716-e4fe-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 09:04:39 +0100 (CET)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-12.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4TynSh0QWMz705b6B
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:04:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 16831b18532c40069ca102c4ce20b37a; Mon, 18 Mar 2024 08:04:35 +0000
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
X-Inumbo-ID: 2a957716-e4fe-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710749076; x=1711009576;
	bh=gJsE7eiED6CpC81of9blFJB7sBvJO4jKm0WVYh5nYeY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gkQOenfcVZDinNa7qTZKgEmsHKDYlnjctQJpptwlVAd+lvyCaTHYmZyGskMGjh6ti
	 pyvhUM9H1oTGC/OpUp5jKSx/xymsLDlLgJmaD3ldtC3Ln2cd90Ue+MsuyhDawupjNM
	 VKFHFfl10e9Pc9CTlfh2bkBV4cc3DwhjdGbm2oXU9/meJkOaJQlA5lz22/jOwbx9bb
	 mGKgsH2CkFTZ/PU+j1zrP27uMvEX0Q0Qb/h93JIl4xbAhxIpqlv4CqkzX7Go7x72cP
	 BF1PzyqwMS54r992w+VxsYBJWjNlYAqZS5Y+VgmPA2c2WEM+0KYWqtppYogSYRD36L
	 JFRJ6vKRkUVWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710749076; x=1711009576; i=vaishali.thakkar@vates.tech;
	bh=gJsE7eiED6CpC81of9blFJB7sBvJO4jKm0WVYh5nYeY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iKsV38YB6fadT/f87JsFd254Y2u/TFHt9bn95S/nr9pDcJd3Ag6Ozh7GlDTsups5i
	 6Tm6149cPUcLZRqAWWqun/bM+RudB+kZqs01utqFNt7IwqD09H0ZPzhAsbVuaoGZnE
	 ZG5rKL5y4EpZ4y8Z4nUHKZyds2NG/uSVzJpW6JEzZpgz9gPE91JlPGOF7RaE1untet
	 +gax0AW3OFqJWs8zGhQEbTHc3+HNWtXkpCsvHxIWw5LJ+Ty9SvSJbsHG9JREyJ5D1+
	 NIaQQ4TsdAHIPaZbkIu6xTD1l7HVSMsFNP3UgY3rTgNt/HwGsxZYuvsPBHrI4bOHZ7
	 fhS9ftpNKBYXg==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/3]=20x86/svm:=20Drop=20the=20suffix=20=5Fguest=20from=20vmcb=20bit?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710749074745
Message-Id: <eebb0fb3-4ad2-429a-9200-81ad7b3fc0ab@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <cover.1710347950.git.vaishali.thakkar@vates.tech> <88d5a0ce6745428120ebc37369d3d75358d5c582.1710347950.git.vaishali.thakkar@vates.tech> <3f8af14a-391b-46db-99cb-d7cafe126cfd@suse.com>
In-Reply-To: <3f8af14a-391b-46db-99cb-d7cafe126cfd@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.16831b18532c40069ca102c4ce20b37a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240318:md
Date: Mon, 18 Mar 2024 08:04:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/24 17:04, Jan Beulich wrote:
> On 13.03.2024 17:41, Vaishali Thakkar wrote:
>> The suffix _guest is redundant for asid bit. Drop it
>> to avoid adding extra code volume.
>>
>> While we're here, replace 0/1 with false/true and use
>> VMCB accessors instead of open coding.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
>> --- a/xen/arch/x86/hvm/svm/asid.c
>> +++ b/xen/arch/x86/hvm/svm/asid.c
>> @@ -37,14 +37,14 @@ void svm_asid_handle_vmrun(void)
>>       /* ASID 0 indicates that ASIDs are disabled. */
>>       if ( p_asid->asid == 0 )
>>       {
>> -        vmcb_set_guest_asid(vmcb, 1);
>> +        vmcb_set_asid(vmcb,true);
> 
> ... the blank put back that was lost here (can be done while committing).

Thanks

> Jan

