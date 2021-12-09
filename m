Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451046E517
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 10:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242829.419945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFNK-0004Ju-7f; Thu, 09 Dec 2021 09:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242829.419945; Thu, 09 Dec 2021 09:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFNK-0004I4-4b; Thu, 09 Dec 2021 09:06:02 +0000
Received: by outflank-mailman (input) for mailman id 242829;
 Thu, 09 Dec 2021 09:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvFNI-0004Hy-Sr
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 09:06:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0265dc-58cf-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 10:05:59 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-bso-eePvN-WfI-UJn2SW0w-1; Thu, 09 Dec 2021 10:05:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 09:05:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 09:05:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0050.eurprd05.prod.outlook.com (2603:10a6:20b:489::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Thu, 9 Dec 2021 09:05:55 +0000
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
X-Inumbo-ID: 3a0265dc-58cf-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639040759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akOXLW2Bc9UpLCUzRX4M3PBmLGRNQU4Ro+R+EJ+ty5Y=;
	b=T2FdVO8okU2G9FZgSp7/GA1sJ8kbBT3IjwM21zEOB9pgb/3h+2E+ks1o1wO/JvHWFlOcEF
	I5QLYqZ1NbhKjhZydlHY95vV+5O66mHYjKGNJOK7ByGsHhARbBql8zK/heHiI3d3JVHSiP
	lKRpKzA5yQhxLMoqGV37k6N47Q+cBhY=
X-MC-Unique: bso-eePvN-WfI-UJn2SW0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVq3lBxi5XUD1Ib1cEpKB1w8KuqL3EBisdTJXqUJ5cyq0l54DdLcWgAfBKnHjT+Huo9yZAhjlUZNNRZh8n2AUUji96zeXNMAzqbSSD92CQ1IE4eaPPR+F3topsoYOai4cWtsorDqFHWnUp1BnTTeHLJ1Jjcbj0xqRQ+wyPTiuktoK2hM/L9jJ2gsmKuImcKIwJP4iKhGTst57Ab4P/aoBxIrKSTMFTYwyq0zauXXDlAPRG0SitmokviGweAI6Ts88HW7is5zfBW6+0d9hm8nNR/bPaQQJ2pTBGPDGufN/x1e4ByQ4t9eeNJGNp4W9/ZyFYFH/xNlE/aBgE42h/C1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akOXLW2Bc9UpLCUzRX4M3PBmLGRNQU4Ro+R+EJ+ty5Y=;
 b=WNOCBKQNhLj7/Gmp50Xg1LEGkOi10n6dh1QcCZq3O819c2FaX9TKmAGpJC6cVGPZTJ60lEBuA5Fe0kVgTfzZmVJsdn5fGVz9IVQfjfwEayqpaGwvp3+euVC/0JUhz5SiDaTRIF4wkVbH6ZmN8RZVDY70TNaJ7xCOWSOwlPwtIcOaCD0FaPTQHZmeQmjfi74TOYwWorp9KBlQ42apS9SmoUuU/d2EBkXmP08gvj2gNCM8F86EjqBQdBA9LO5VAr/pXilp3gv4idgOAepqc7YJ20ly3xxoQv23/CFCayJK+slG5qjxKoVmLmwQuf670/IQhhOeJK+dZPJCUf/Su/biVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7010028-5a5a-c6ea-fd14-e0d9aa662487@suse.com>
Date: Thu, 9 Dec 2021 10:05:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2704a4a1-5f3e-4beb-5fe8-08d9baf31c55
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43523930E6BD9E51D3B701AFB3709@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AKlJ9hzVTGA3UcGF5lHwabOix5qWD9SYCnAH4cRponm9Qj9QHVoHMTSuImZxWoOo/MBnFzR4qcaraXfUblNW4qVwnjoKbYTsK6VldjNrKu8bWyvgNrT0lVYKRtAqQ9SGgCbk4VHQ11WnlFb9PqnBLGElhDysuvHEYybM9shtrlppo0cwPQNsj44esW8GZLeW+NhfCXddz4S7BC6WtfYwMuASqdjPM5mDC0CZluUk7EBM/nqxKbN7RyMpUwRQoj9IQ6af3oIdBG5rx/Va/u6on0xBUUjeUcfY/h07Go3i3i7fMLwbiIvp0JyIBDewm+sdo6X+ABPSHKoWMxFwlscGP4rux85JBtFgD1EYYkFbtfEI3g22xDYTjtVrH16LzCW7gXMGRY8hviUejOh8lmZuDMy0YT88AWoA8BFAQFu+v6PgOhicSt3ux+jxq3ys9t3P5qJRVI7aLQZkYTk/Fx4kEYdjz7RoUCgIvOpYKESH+Si70xZughYp+qXd4DzTLafrsKKbEl0AmGsrQUmfBsugjv+XsiZYarwnk2LlMIDiIIOSNLk9AdCxg0trq4xrOj6iMDhb3wsPMkJ903UpfShjIK5BoWQ1Ud9dBHMcgtyIxVhljI6g5z1QuVKY2jv61I+h3VBKFcCWKPm6JsCIednsP7y6aSxgcBMFcUTQiWlJ69EVT8JIFJsOAGaW3GMUABM1L031OtVHbxptOJSXwvRw7AAnqRxrlrw+Jdg4TkmIwfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(5660300002)(16576012)(31686004)(2616005)(316002)(53546011)(6636002)(31696002)(66476007)(37006003)(6862004)(36756003)(7416002)(8936002)(8676002)(6486002)(2906002)(66556008)(186003)(66946007)(26005)(83380400001)(4326008)(54906003)(86362001)(38100700002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW8yWjR5anNoZFNQenZvOXlsTGlNWXVRQk1Sb3lJT0dLa0dhWml1OURWeWVx?=
 =?utf-8?B?b0VwdkFXdDNaVFl4UUFacHRTM1pWWDF4U3RIOVk5TzBpamZVMHdxVjk0SFRC?=
 =?utf-8?B?Q05MbEdPMFdReitHNDZEOWw5SnlweEFrWllzclNLWjUvZm02VG5Nc3ZoNlJX?=
 =?utf-8?B?US93Q0FQSkdmem9JMXdWZDBDZHdSSkxwR0NXRnV1SVBrTUlYRGdzaHBScUhp?=
 =?utf-8?B?b1psb3NiVncxUmxnZE5qNzJlcGhGamp1Nnp2SkI5cEcyYVVuK3NRQzdKVTlT?=
 =?utf-8?B?d1lJMEJjR3IxWXJIQXEwSG0raUh2L21vSytGTk05WVR6a0JncGxLbERCS3Vt?=
 =?utf-8?B?UE5IbUVHbEJmN3NKMS8xOGpzaXBMWVVmbXVtZkhqTmRzNFNlQkZxZTZ1M0FN?=
 =?utf-8?B?cE9xNGlxbWN6QlZXb2xGcVlhendrcHp0UDBVV1BzbnhzRWZHMTc5UExnL2Jh?=
 =?utf-8?B?VkF0TzZqL0NWVEZpNjFUZUJpc1VYa2xRTVZJVjk1UG02VGptbmlsR2dqRTly?=
 =?utf-8?B?dStMdzQxZE5mNGVEN0p0R0xrRmlrNXFBNzdTVGNXbGVibG10T25FVy9pWEZ2?=
 =?utf-8?B?bEh6U25ob0RGZjc1eW5TREc4a0p2RlJWZURDTzNEbzlEQW1LUzhVcTlKV3pn?=
 =?utf-8?B?RUxrRjV6UElNeVF5K0xIeGt4MzB5ZDNZL3FCTzNNY3lMV3VzRzh2T2dZbzdw?=
 =?utf-8?B?eXZDWCt3TjFoUnMrRzZlbzRQTnh6dnVBTmJvRnFyWEUxQWtTV0hjbDdXYzBN?=
 =?utf-8?B?bXo2QTU1Y2NGYklMWVBzeUdSeGgxamtmMEZWbllGTjdmN1k4Y01jeU1OTTBz?=
 =?utf-8?B?RlVKVzh0MkErbEsxSXB3VzdDMjFUMjNWUG02WGw1RW1hbzZIN0cyRk1IN3E1?=
 =?utf-8?B?U1RINFhQVTROUHpDY01ZRnBnclJNalVZMkZodWlrblEyT3E5eHhoYjlqeVp6?=
 =?utf-8?B?c29Db3R4VlFESm45TXF1SlhES3NmM3k4bGVIM0NqaTY4bXpIUFFMTElQTDcr?=
 =?utf-8?B?VzdtcmtLYzJxVFVmSzZiYVc1LzN0eitNMUwvNElseG1BR2NETzhXTzZNeXFt?=
 =?utf-8?B?dUxKbmVDa2s5OTdWcFhOSkJrS3FwaE5aUUcrSW9qOU8xZkdtdVhmTjZ4djlD?=
 =?utf-8?B?dnI5WHNKMVhLV3FEcDZqS0IzRzhUVGhvdkFZbnpsWDFjZVJKeWZSQTM1ejVt?=
 =?utf-8?B?QUdkOFJySWtXT1Z3cHZPTEJhSjZQcHdaaWJMOVpiMXh3SFBJM3k2VHA0S3A0?=
 =?utf-8?B?S2c4Z2EvQndjekxmMC95Q3Vwam9Lc1VXc2VkZEZQWUVYODVTSk9IcmhMVkZS?=
 =?utf-8?B?d0ZjRS9nVU44VTlQbEdGdUZESHdmSmNlcFl3M1NWdTEyNHNzRm8wckcxaXp5?=
 =?utf-8?B?Q05wZHBmYXVTSGYxUGZ1UnU0dzJjVElSMitNZzN3QWthVjFUZHMzSzMyMUx5?=
 =?utf-8?B?UHhjT205Rk9hSHZVcU1VeXdBNDFmak50bmNWeDVjZjgxUGYzcFNSWFgrMW5w?=
 =?utf-8?B?bVFRa1JSY2FZVC9ZOG1UUnFIL2plbjFvbnNBM21IUUI1ankzUUxNbVhreGJE?=
 =?utf-8?B?N3RwNDdKTHd3NitTNmc2dUI1VXZQUG9BQTRhYzJxRDhWOUdUcEZoY3dlR1RI?=
 =?utf-8?B?YWVDeEs0WHh4T0lhMmQvM085dk5FeGpRL1RMRitzZmR1NlFiTURMcHlua3FD?=
 =?utf-8?B?TFphWkZUN2pWbkdTbmRPcU96WTlJTDczTEpXZ01pRURkTnBCaDB6R1dYRXdN?=
 =?utf-8?B?bUt6SFpDNXZTTk51OHVxbUlORlVmMkNrc1plU1BMNHhNSklmVnFIZzdjTUtw?=
 =?utf-8?B?LzRLMGRNRnJRRDhhbGZNTGZkRDhEeDZCTlpSOGdiL2VIOTExSmpFdllQVHJw?=
 =?utf-8?B?Y0Jtd2c1bmZkRXpnV2RrRXV4S1cwR05sVTFucWFyUFRrWGJEY0szSkg4WjBs?=
 =?utf-8?B?KzlLazB1NSs1TFF5cTFOWmtZRDFlTE5rMEVQREtFS0lCaHlRN1RqYndzVCt6?=
 =?utf-8?B?NU5pT3lrUk1OU1BJZmppeXhwVERPYXhxVGRyWmxqNEVkNm9LTDZlZ1NTWDNH?=
 =?utf-8?B?WUlGM1R0NjB6cmNKMC9TTzBvRUk3b1lkL2RNQ0NqUWE5c3oxQkxxRGJBZTBj?=
 =?utf-8?B?VmRLYWxmK2ZIcHBmODBXTk52SWw2SUlhQzFWbTFKRGxqZWx0aTlZSXBFUDd6?=
 =?utf-8?Q?LeG3Ix1T6bEOHhOjLJXasd4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2704a4a1-5f3e-4beb-5fe8-08d9baf31c55
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 09:05:56.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xZfufzFUFIxlkTarRgzeHqKwtFv3osuArlbbqXXjDxKJEAD+5kVXxLpMUPPPWDMu/dylF3bmc8ZfUelEFtoRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 08.12.2021 16:55, Juergen Gross wrote:
> In order to avoid indirect function calls on the hypercall path as
> much as possible this series is removing the hypercall function tables
> and is replacing the hypercall handler calls via the function array
> by automatically generated call macros.
> 
> Another by-product of generating the call macros is the automatic
> generating of the hypercall handler prototypes from the same data base
> which is used to generate the macros.
> 
> This has the additional advantage of using type safe calls of the
> handlers and to ensure related handler (e.g. PV and HVM ones) share
> the same prototypes.
> 
> A very brief performance test (parallel build of the Xen hypervisor
> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
> the performance with the patches applied. The test was performed using
> a PV and a PVH guest.
> 
> Changes in V2:
> - new patches 6, 14, 15
> - patch 7: support hypercall priorities for faster code
> - comments addressed
> 
> Changes in V3:
> - patches 1 and 4 removed as already applied
> - comments addressed
> 
> Juergen Gross (13):
>   xen: move do_vcpu_op() to arch specific code
>   xen: harmonize return types of hypercall handlers
>   xen: don't include asm/hypercall.h from C sources
>   xen: include compat/platform.h from hypercall.h
>   xen: generate hypercall interface related code
>   xen: use generated prototypes for hypercall handlers
>   x86/pv-shim: don't modify hypercall table
>   xen/x86: don't use hypercall table for calling compat hypercalls
>   xen/x86: call hypercall handlers via generated macro
>   xen/arm: call hypercall handlers via generated macro
>   xen/x86: add hypercall performance counters for hvm, correct pv
>   xen: drop calls_to_multicall performance counter
>   tools/xenperf: update hypercall names

It's not easy to tell which, if any, of the later patches are fully
independent of earlier ones and could go in ahead of those awaiting
further acks. Do you have any suggestion there, or should we wait
until things can be applied in order?

Jan


