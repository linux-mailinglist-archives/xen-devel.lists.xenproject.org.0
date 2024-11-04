Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD19BB491
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 13:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829981.1244911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7w4k-0007DT-6R; Mon, 04 Nov 2024 12:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829981.1244911; Mon, 04 Nov 2024 12:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7w4k-0007BK-3q; Mon, 04 Nov 2024 12:20:54 +0000
Received: by outflank-mailman (input) for mailman id 829981;
 Mon, 04 Nov 2024 12:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0Og=R7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7w4i-0007BE-Ns
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 12:20:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387f0240-9aa7-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 13:20:48 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730722843787562.3585731585786;
 Mon, 4 Nov 2024 04:20:43 -0800 (PST)
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
X-Inumbo-ID: 387f0240-9aa7-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM4N2YwMjQwLTlhYTctMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzIyODQ4LjkyNjI5NSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730722844; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a2aOf0Vc/3JPKraiX+AOpTsaAXxjvUQlzrOJ0ZdxlpuvYo6TxYwKEmUdUUZlmNqsd3RTUNCm5Dtv46QLb5SGzOXGsyi3aHdjO6gHkjXKPj/C1YVToCpo9euCeBwAHmM1sAow5CxuDalVdmDwdAwzTo8fMzjqP4bMBNPQh1q43hQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730722844; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sHOznbzE12eQPgSMHy8JjcdOLta14SbOUjhyMpUZxwI=; 
	b=Dj3dBMiw5jFCBxsMvdwjBXJJa+jOT6K3/4Uskd5JGubQdAECiY2+bCIp8Z53x+/OZdD2j4tZBrsni8SdiTIe9QMPp94QGv+hrwSo7WidxLaBt4bG5HtRFPnmqgdxChSwd0Zfwnq7F6XBxavxCihDOXvNELgEtB0Rf7TsJV8aSHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730722844;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sHOznbzE12eQPgSMHy8JjcdOLta14SbOUjhyMpUZxwI=;
	b=ZZVS2h0fhcmVK+y1xRk+L2Dn9h6SvyMkyM8EA0w3lpvhcZC5AVkdfFZG3MeuuePP
	s0eCziTg0gUcSrt0bwdhLSOi7UO1TQG8DXX4FXlqDTpgFOcEAFUr1ri3WOcfwGBpFNU
	PV8B9ksub9Oe+J277hdiEYZOy9zv/Zqeq4ZmnWRg=
Message-ID: <182d5e0d-0950-47b2-8e6e-281b4488b6c7@apertussolutions.com>
Date: Mon, 4 Nov 2024 07:20:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Boot modules for Hyperlaunch
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <b04fb1c2-7b62-49ec-93a0-452edd241d4a@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b04fb1c2-7b62-49ec-93a0-452edd241d4a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/4/24 03:41, Jan Beulich wrote:
> On 02.11.2024 18:25, Daniel P. Smith wrote:
>> The Boot Modules for Hyperlaunch series is an effort to split out preliminary
>> changes necessary for the introduction of the Hyperlaunch domain builder
>> logic. These preliminary changes revolve around introducing the struct
>> boot_module and struct boot_domain structures. This includes converting the
>> dom0 construction path to use these structures. These abstractions lay the
>> groundwork to transform and extend the dom0 construction logic into a limited,
>> but general domain builder.
>>
>> The splitting of Hyperlaunch into a set of series are twofold, to reduce the
>> effort in reviewing a much larger series, and to reduce the effort in handling
>> the knock-on effects to the construction logic from requested review changes.
>>
>> Much thanks to AMD for supporting this work.
>>
>> !!NOTE on v8!!
>> For this version a complete re-organization of the changes were made with the
>> concept that three tasks were being carried out that were intertwined in the past
>> versions. These three tasks were 1. capturing the state tracking and
>> enrichment, 2. removing the use of module_t to track where a boot module is
>> located in memory, and 3. abstract the domain construction state. The first
>> eight patches address task 1, task 2 is address with patch nine, and the
>> remaining addresses task 3.
> 
> Just to mention it - a v8 tag would also have been nice in the mail thread
> subjects.

Absolutely, my apologies, I totally missed that I hadn't tagged the series.

v/r,
dps

