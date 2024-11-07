Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3449BFB03
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831478.1246793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qox-0000G8-4m; Thu, 07 Nov 2024 00:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831478.1246793; Thu, 07 Nov 2024 00:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qox-0000Dx-27; Thu, 07 Nov 2024 00:56:23 +0000
Received: by outflank-mailman (input) for mailman id 831478;
 Thu, 07 Nov 2024 00:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qov-0000Dr-Ra
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:56:21 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18b43082-9ca3-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:56:19 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173094097272833.11558330149671;
 Wed, 6 Nov 2024 16:56:12 -0800 (PST)
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
X-Inumbo-ID: 18b43082-9ca3-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE4YjQzMDgyLTljYTMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQwOTc5LjY0NDQxOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730940974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RsU+T97qpqzoE7F2uVwNjBzBFvv/+vSpG+ZbyM/HRgmcWtBrLhCQaRu0FLar3x5lBGvIAKsnQCTDqsrL3UdFpIFZr5m6KWUnWQzDfTQYTm99u9Z5Cw4cdh5KJoipG9oObyWbib/hxuVAAlPjw1Q69UgYHJfrK/iDKr3aiuhIaM4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730940974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PbpVuIuZ+J2ObY7J9JpNwlrnWFQTBbcPVHqVE77AOnw=; 
	b=KBZoXS3oiNUc6mddO2tJ8KSO3CUPaswktU2x8Vo4l7L8kqJdB9Aq0zhv0lhhHgj6KfS32Fqq9/NSri9fA717e1V5FWc+mSeKZ9g9teBcJ9WrKkdawEJP8uzNwGTDnuqj0dTHhSyZhBletXza1Qv9V/ksqBxdPOUXXMPfORGv+pQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730940974;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PbpVuIuZ+J2ObY7J9JpNwlrnWFQTBbcPVHqVE77AOnw=;
	b=ojAfAC2CYpUG6SVQl2AUwMDgmQQgPhj4QBLrYX30fwHMAbZoiPXPyMzun951jRxg
	wPmt65lZ6gKeYg6LpdfjGoKWNhLReLOLeLbhSBdFkx3F3WzasfRfgIce8yXG69GKF7+
	YECI2pC2R+PVdRvetrEdIjzvWmC5V14KhYfgHkvA=
Message-ID: <db147471-95ff-4744-9945-e5ffbffa1b15@apertussolutions.com>
Date: Wed, 6 Nov 2024 19:56:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] x86/boot: add cmdline_pa to struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-8-dpsmith@apertussolutions.com>
 <95af4f8e-585c-4bd6-a3fc-c7234e9cce83@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <95af4f8e-585c-4bd6-a3fc-c7234e9cce83@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/6/24 17:19, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> Add an address field, cmdline_pa, to struct boot_module to hold the 
>> address of
>> the string field from struct mod.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you.

