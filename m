Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FA1512BE2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 08:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316005.534700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njxwU-0008L5-Uw; Thu, 28 Apr 2022 06:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316005.534700; Thu, 28 Apr 2022 06:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njxwU-0008IX-S5; Thu, 28 Apr 2022 06:47:58 +0000
Received: by outflank-mailman (input) for mailman id 316005;
 Thu, 28 Apr 2022 06:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njxwT-0008IP-Cg
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 06:47:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 226ffb67-c6bf-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 08:47:56 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-d6EUPs3rPZuEjBbRe6kp_g-1; Thu, 28 Apr 2022 08:47:54 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6832.eurprd04.prod.outlook.com (2603:10a6:803:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 06:47:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 06:47:52 +0000
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
X-Inumbo-ID: 226ffb67-c6bf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651128476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxcE4Bhw2fovnyvrz8+l7FQqIdIiB+G8LguTXUm4Neo=;
	b=UDZNxen1zKHhQvOCDs+tyeTNXIUEKRO425qUS6qGBQ1WFlQUCU96ZRNcpyj4TgI9O+XJ+J
	eUvYb/XF8ml7TCFVI/qoh57CT/fkcLfG1i6kIV3FC1GewV+nFitp/bPTjlVXJrmQRpLCx9
	GwpKtj83a5YHTvLZDD/5IIV0NRvfzhE=
X-MC-Unique: d6EUPs3rPZuEjBbRe6kp_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkKHBeBJR3JSph6SVPJL/W0xTbm/BMsGYhvE+AUFST73nE+Mi4ryaISl2Ud2CtnJ5WK/EItCyKKifGH+sk6MYLuOPfiN9wxaonjzWnomK/PEGgko3o8FXVZQ1TIZ0fBwfqbrgXldm2OoKvb2kg2xG68G/jSWivUSSucToAUe8a+qMBxTsrcnUr1by1EgZJYs6JTOsCwGMVNyePuRDH5YteZMz6Z/L2Q+fD8IbnFz5NLSl+FewTf1vLcNIgIjPzpRERCDEHkAfwUDSuTNOfLC34fKPY+Xr+7OnK6+ly6DEJpZ7afKpos3/4iTVafs8piSLKNGfMy+dtwFpa4j/kl5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxcE4Bhw2fovnyvrz8+l7FQqIdIiB+G8LguTXUm4Neo=;
 b=EDfcCe5MwqttgMGDwpYhAUMqFAJJxg98ogJeV3QCDcZmWWWIzlknSxj7JWfojJoNYXAkU2ynZBSkOFQJuKHB64Z0D6c2He8g8NFWkYTNsQTZQXJM2v9Ah0Z795FGjjlNL2Vg0YpRyTSF/2Ykm4XO1dduyWIhuvwmX58zsge+2uJ7UVM/X/APWoPN0U22eKtNlOrMIMZ3GuWvqoc//wnnq8/QuG4pFf1nXjEW/HbExgGDm7auPHT05ZkiDHP17ncrTi25cXboLAv6doey8ygYSmULtCNrd1yB5BUFYLCAVkVSIS3Vlzr7GwXDrfd5aIbb3tEWYEf6ipxxUCdxGonOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>
Date: Thu, 28 Apr 2022 08:47:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com> <YmmUtiBkhEYvXHUB@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmmUtiBkhEYvXHUB@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be7efcf6-c8b4-4464-9923-08da28e30498
X-MS-TrafficTypeDiagnostic: VI1PR04MB6832:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68328876C90F074774404ABBB3FD9@VI1PR04MB6832.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IYw3q2/t8gC7CaZNtDLK9pqjAYXndoPbEUiUM4mxGpvaJUs/AMmk/afxkIYK14jaaIl97r66UgHye/qQ13j7miu3viUtunIZWD3bPIKNq6dKYyvne0Z4qn75U8VqiYNQU7VE0GQRxaR1zCFBFMn6i2ZGG+UsAHZ56vLnZpKnx9aIiluLetzAP2V3jV9Nwhj2Es/DH5xBW+SV80N/gA5gRnncYe//rozssTkfUdbScwlgywGlSO6rFQmvfhGr4gfAQd7lf96HY6oWYpEGRa59rgBsf2G+dRNkDZbXVMpr5ucgXIkyALz/Hqi4kpzzZDKfF6KQOF3Qg4jZQ+1h7uFtiaRVCqnwAfnOeTN0m7fVRVgmhM4DZx3wQmpSDGuTi+M3ya4UOCo+TZpv2HH5+wlQerRqwtbFSUStJAQn0CV3TLRnTOoYK9oWYBKWQ2q+IhiG6eyi46R1aw8P52DQeHQZ09UI/rR9FrI7jpGLG7C/p99S3KxwqNdrtGBw788kvH3NBpDxUCEF536T8TSa+HTerDvYYwZhIsT2vWa0Xi1OLSN8+aGbQAlIF8czSenovkbRWmVVNjLX3Rm4nwlilgTlxf16+U11u1u8tedAEYrlaIX1wFimaIJQd+EQ5jUZ+fXLr8/xw2D3C8LEeMOzsVsh82DtzaJQOsTQ3ENsNdINGvYoJTyA6mrmK+RtHLrbkWn6pi4eLJiWzzcQRbYaele09ngojxNbenFzkptdEdHvvLlsTHJB0PkaijfjHZ2GWLpKYT7npA8zSHKsG1rw4w7K1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6512007)(26005)(54906003)(316002)(83380400001)(2906002)(31686004)(53546011)(36756003)(6666004)(6506007)(6916009)(8676002)(8936002)(66946007)(4326008)(186003)(31696002)(86362001)(66476007)(66556008)(5660300002)(2616005)(508600001)(6486002)(15583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODhHcW5xN045TXZjeFFodDdCdTFWMGpmdHpURTlGTUNHcnM3THZsTklJdWVz?=
 =?utf-8?B?L2RuS2RVZ0tIeTFpUUptdmlKbUw3YzV4OGlFcVcxOGZRMjNsT1ZqRGlqeUhJ?=
 =?utf-8?B?cVduUmh0OHM2NzlBcGhva2luNVcrdUxRRk5ieTRtUWFneVowbkV4Q01VNVJv?=
 =?utf-8?B?NWtENEVBTDVUZXlzdDFjMHhlN0pjRTBpSG9iRGJHNjIrL2RrNGJ1OXdBR3lu?=
 =?utf-8?B?Mjc4a2ZIUFcyTjhGQ1Z4TjNqUGd4QzFubGI4VkQrNU5Cb1h6cjBNL3VHUjlz?=
 =?utf-8?B?WG9GbG1OTW96NVgvYTUxT1ZkTzJ6WGVnYmxyTk05Q0VJcE5LOUtoSExjNVNI?=
 =?utf-8?B?L2ErOXZucTU3aW45MWM3RzB4V3Q2Q2JiSzB0U0pyL2pDQW1yZFJhVFQwNzRi?=
 =?utf-8?B?NFYrSzdXSW41bEU0N0VrUDFreDZHQ1d6UjFuNXZzTDg5dWprbnVQRzBKWWYr?=
 =?utf-8?B?L2hkbG5DWEJMdUxENndBNGM0R09nRTJOWVJ2bzZGa0JEWUdnenhEaXlpR3c2?=
 =?utf-8?B?M2V4b3RFTUZlbkVlbHJTeE9jUzZXNDgxMm9oNFV1UlQvUXZFdFNCQ1lGa2pu?=
 =?utf-8?B?bjJzMy9VNGs2YjRtbGRseS9IV3pwalRwdkx6VG9QZ2VNLzFoOUxLTlBQZmZa?=
 =?utf-8?B?V25GTGw0UGxBcGR5SGhORjNibVUrWllIZkh4UVk1NHdkODVPNnR2QkQ2U1V5?=
 =?utf-8?B?bXdUaWJVWEFxNng5UTBWSEVFRVVuTURrRW1WeU1nbVVtblh2YndFQVdBbG1T?=
 =?utf-8?B?Q0QxNjA5bUFhZ2EvRGNaRGZIQ0FSdUp4SUNUeHdCK0k0bnhKSEU0Q1Vsd3d5?=
 =?utf-8?B?MnNCRWsvMjl5WmNobTAyZEtlazQzNEpIM2ZrTkIzeGNvTzdGWUZ0Vk1yMXE5?=
 =?utf-8?B?SWZsb1o2ZW9ZdGhOMVczeGNQcjVDVWZHMjlLUUt4b0xHNmYyUnpRc0QvL1ZH?=
 =?utf-8?B?bjlwU0JSbk1IYytuUTFtZjRmaVVPMEMrNkRUcU9kemJxbnpYTVBZQjc0dFBG?=
 =?utf-8?B?dWtyM1lGYWlRSGF3WmRhY01PSE5yVXZNdUNEL1JWdHppem92RWJlNGZXSWpP?=
 =?utf-8?B?UUI0c1RUOFd4WjZkTFVKVjFxMTlmNE9wcnJvM0d5dDZlTkUyQ0htd0lwckw4?=
 =?utf-8?B?LzRDNDQrRUhHS3JxbitKMlN4b0R1SHo5di91V3c5RTVNcnMyVEp2VjkzS1dK?=
 =?utf-8?B?b1RDWmVPTUJUWUZOU09ENFJDdCtoWElDbEVoK1ZvV1RHTTBxVWVqVVVOTzhE?=
 =?utf-8?B?WWE5MDMzVE42RXc5M3l4VFEvY1J5VEJGVnZqdERCdzJUd0w0anYxS2ovMFpU?=
 =?utf-8?B?b3A3MEdiU3NGc0FDZmM0aFdnYk5IQndVRmdqZElMWlYybEZKMFdmRFdBNmU3?=
 =?utf-8?B?R01JN2xWTGdPWUt6VXpyQVBkdFF6bklJU1RYa3MyUG9ad1dWdUtrOHNuZVNr?=
 =?utf-8?B?NjNGc0V4RmUwcnczd0N3aEQ1OGZHd3hGcGtmVVdGc2RyQktVVDlDdEtPVjg5?=
 =?utf-8?B?ZjlNNjlXM3JwcUdkRldnWGU3ZDdjRUx3bnQyaGVMZGpGcVhWelBla0w3TjZs?=
 =?utf-8?B?Y2pmVlhTWUtITHNxcVBIQ2MxNmE4NmRCSU9qVmYyWHNUME1vVXZaMzRwTWF4?=
 =?utf-8?B?aTM0V3JGWjQrcUlURUYyNXNML0RnVmxQeEJWMmpRd3Y3eWljZ0dZZldCQ2hq?=
 =?utf-8?B?MkFYTVVRdloyd2JXWjNqK29MaklhWDAwcVliaVpKVUovL0V3bGpKVDAxZWR6?=
 =?utf-8?B?MUQ4eXNXZGExeVhpdmQ2elVEaHFMRTZkM29lWkRBWGNjWVJ0bWEvRmFLVmls?=
 =?utf-8?B?VnZ1d2s3MXVSRG5uNUFwVDBnZS9CampwdFN5eEJXdGh5LzVYeFdDaEZxOTFu?=
 =?utf-8?B?S3IxODBZUDVJUWt3Q0ZQelR1TDJncnJSdmFmVTJtRGZINThpbUNLRGpQQWJk?=
 =?utf-8?B?MnhabU1yc2daR2RaM29DQldXVjZzeVlpOVE4ZDh3bUpDZ3lNR0pldmNxMFIx?=
 =?utf-8?B?c2w3QmRqYVMrUlZVa0s3Q2R2T3Jid21WaFdpcEtXOEJ2aGpvd2RtZ3hNcWVs?=
 =?utf-8?B?eCtqSUpOWis4VVFySmg2RFpwZzhUOElBZjdmYXk1aUpoa3RLby84anpHbi9Q?=
 =?utf-8?B?MVB1TVltTzBYZ1dHWDBIMm1uR3A0UHgwd2xXV000SjU3MHJINmN4Yk9TZGUz?=
 =?utf-8?B?eTdsbmRFbjBJYXlMazJiTnVTZTg4QWUzeGcvdC9CR1FUYWJ4TzJNekNxU3JN?=
 =?utf-8?B?OVd4YkNySUluK3pDd1NCcUkwQ0lERlllRGNpNnpsTEtCc0k1L21FamdGQVNy?=
 =?utf-8?B?aEgxMVQyK2QrL1hpV2ZDWXVBcmtkN2M5cC9BenNXWkJ0SlBqVjFnQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7efcf6-c8b4-4464-9923-08da28e30498
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 06:47:52.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A05PlcuQ6zm+NB2zHHkPyxt5hWv574C1vbhGKgChMhfmHsPLbM/NZkpePQ+wS7YAsHufNHLk0tH4oipq1BBPvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6832

On 27.04.2022 21:08, Demi Marie Obenour wrote:
> On Wed, Apr 27, 2022 at 10:56:34AM +0200, Jan Beulich wrote:
>> On 19.04.2022 17:49, Demi Marie Obenour wrote:
>>> This hypercall can be used to get the ESRT from the hypervisor.  It
>>> returning successfully also indicates that Xen has reserved the ESRT and
>>> it can safely be parsed by dom0.
>>
>> I'm not convinced of the need, and I view such an addition as inconsistent
>> with the original intentions. The pointer comes from the config table,
>> which Dom0 already has access to. All a Dom0 kernel may need to know in
>> addition is whether the range was properly reserved. This could be achieved
>> by splitting the EFI memory map entry in patch 2, instead of only splitting
>> the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find out
>> the range's type. Another way to find out would be for Dom0 to attempt to
>> map this area as MMIO, after first checking that no part of the range is in
>> its own memory allocation. This 2nd approach may, however, not really be
>> suitable for PVH Dom0, I think.
> 
> On further thought, I think the hypercall approach is actually better
> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
> return anything other than the actual firmware-provided memory
> information, and the current approach seems to require more and more
> special-casing of the ESRT, not to mention potentially wasting memory
> and splitting a potentially large memory region into two smaller ones.
> By copying the entire ESRT into memory owned by Xen, the logic becomes
> significantly simpler on both the Xen and dom0 sides.

I actually did consider the option of making a private copy when you did
send the initial version of this, but I'm not convinced this simplifies
things from a kernel perspective: They'd now need to discover the table
by some entirely different means. In Linux at least such divergence
"just for Xen" hasn't been liked in the past.

There's also the question of how to propagate the information across
kexec. But I guess that question exists even outside of Xen, with the
area living in memory which the OS is expected to recycle.

> Is using ebmalloc() to allocate a copy of the ESRT a reasonable option?

I'd suggest to try hard to avoid ebmalloc(). It ought to be possible to
make the copy before ExitBootServices(), via normal EFI allocation. If
replacing a pointer in the config table was okay(ish), this could even
be utilized to overcome the kexec problem.

> Is it possible that the ESRT is so large that this causes boot to fail?

I don't know - that's a question firmware folks would need to answer.

Jan


