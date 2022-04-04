Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FEE4F156E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298330.508177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMN0-00033x-8a; Mon, 04 Apr 2022 13:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298330.508177; Mon, 04 Apr 2022 13:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMN0-00030t-4m; Mon, 04 Apr 2022 13:03:46 +0000
Received: by outflank-mailman (input) for mailman id 298330;
 Mon, 04 Apr 2022 13:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbMMz-00030n-5O
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:03:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8008c1f-b417-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 15:03:44 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-HjaH0_T1N7qDnCWIwx8l_g-1; Mon, 04 Apr 2022 15:03:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5440.eurprd04.prod.outlook.com (2603:10a6:803:ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:03:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:03:40 +0000
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
X-Inumbo-ID: a8008c1f-b417-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649077423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+2xlrgRHzQbJ4h/+EbSyZ1KEG/IJVa9mrLfiMZpFD0=;
	b=AJswuE4N0DOzEIEd4PX60abvVa6oFNnpUNczmhK3L7PwklfzxMqXT/xcLRYHxV93uhtrvt
	S75hUssIeauwMvCeNU2lwPNeSptdRLcPzOSe7c7WV8L2pjFjztNBW3gKmgqi8n4bVgCVwD
	D08Ff4NphhJ8aVUGKS9sBPnSU6yRTys=
X-MC-Unique: HjaH0_T1N7qDnCWIwx8l_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgTsLv3mPA86twYextMKvsnZkdxefdRqJShe3ptpSNAnJTqSBp2y8MqN1UX2Ac4KzSohLF1HVCUC1JEKGj/u4SL+UQtj/JxSOBkVV/LHwZkkohSV41KW3ngOJYgFB5NmWYT6OojKUObMm7e3XqRC3mu74piLqzDOmhAxSWBeMeJgsrIc30tKQC3GbHx8A3by622YaMyy8VGP5TPVyVfLdKJ+uIvMC7NWrC0hDy7JheHTSgaDrPXZEZ40hCFaIxGC3lkE2ClerNHaPXrQMX4KjJh19DqeNXdxlOx2Wsx8tXCC/q0GUzk66rtqvgmbx8UHhpnLwHI+Sh6VTN/mzh2GpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+2xlrgRHzQbJ4h/+EbSyZ1KEG/IJVa9mrLfiMZpFD0=;
 b=HYKRMCP7AD8L607Lcx8vPRBpuFb7PnvUpYASHc23c20i/NlndrfxatZr+CXvYEyQim+e12dLYodREIQ6TeO+7Bx9lMyq8gB4dGzZyfOrxTfsZtYH97iCC1Xrs6/OjFo7UWMCRInfa7B0nvlsCwSxvRX+PAewFUetLxnkhEB72BjBQxQ4VmPPjczBcGekImXkpBeTh3aADMN7ao7h+yokeQE1JuqgB1MdmOP+D88WZgUVgs9ec3sNNndqLQvprFVgOyyRiazC35Dk/uBPmqKzi+q6ysht6ULlPGMv1UTySX1IYmIFi9hkqB3NWcMkZv8fFlzBCm1Q7b+ZoV2k79JqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bd17005-b662-125b-76c9-ac971c8ac2e5@suse.com>
Date: Mon, 4 Apr 2022 15:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: PCI passthrough: possible bug in memory relocation
Content-Language: en-US
To: Mateusz <mati7337@protonmail.ch>
References: <l3LThLG8tkJBvD-3WTxzw6TRrj7GPAN9uWh-AWqzelw75qpdP1ZLXzBV7599MWrjrHH-lRKof3b0jm1DEGrUXLJszgh5hjW25oNtHoTI9Ts=@protonmail.ch>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <l3LThLG8tkJBvD-3WTxzw6TRrj7GPAN9uWh-AWqzelw75qpdP1ZLXzBV7599MWrjrHH-lRKof3b0jm1DEGrUXLJszgh5hjW25oNtHoTI9Ts=@protonmail.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0349.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 666dbf11-2a4d-4b00-b94f-08da163b8a41
X-MS-TrafficTypeDiagnostic: VI1PR04MB5440:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB544028466A627330846E371DB3E59@VI1PR04MB5440.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPyy+c6BfpZqV5T7rMQ5Ov/wSkauM9XsHJCKRN/sXMA5z2KUTcOuO9UDeLTIQjgottvPNe/oex4m/YS8NmItf9UOkjS+CZRp/zhA2j6fOcPIzyLeFJL2FAj6gLNufBN5qzOVo1jCPowKYLs4ach5aYkaZdKxVrZ/opwicD4dKD0B05bpf1/bm/9BpBPumNxAC8sgMqzyTP9Z9+K01HpSuCqWGXCj6mG1WYafB0S3798zdwYvJ8IhViL9WZuUyiWLHBg2i031uld+7R4/xEMUhsHN8ICX+2xQSFsu82u0U5xxWMPfWtk8k32TBZn5GSlKEqakp46LT1F6jxD7aDikczqPXQNfEj9PeJXv02YA+0WCjqWmIOP1b3Y37MDHDJ9l0WvkzzfXoNoshw9n1OD1gfua6oxwn/NYCByetVO9z1imVPrRKkHJnYYf5Wrp5WnJPgRYxL3RrazirquEX3JeINxJffjiEZfag3IQ5WB90yyQ+K6lA7gb6ozdMyvNc6pW4c4crAXjBLZ0Cj+369JkP8HPHYMJ3prTdB6YVZKAwhWINMfP6sJecBgHEUUsKu8+lWrJ6Z1dxH7Dt9tNbo3/zogucSRYsLI4rM0DoaMrQurCg3ur++sDKWMkHTtSZ43ccjW3YEXaZQf3nic1oy7QLw2/5u3vE0mwI3SLll4yB4oLPBb0YVQHspmkoOdxHYxSnbmY9CpOU0Jo9U7pkwtznAWjwKTB3CTFmMt8i5Y+cbhuqksf3lo9ioiOMWOjzNTUXL4CULqw1uSk1kbOfmRju+7mQYavHgYS4X7sc9IjMGcY6fvYgmeYvT4gLPS0DUUY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8676002)(6916009)(38100700002)(316002)(66946007)(66556008)(5660300002)(8936002)(31686004)(186003)(26005)(66476007)(4326008)(508600001)(6506007)(2616005)(966005)(86362001)(6512007)(2906002)(53546011)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ti9pL1BORG1aVTczYzNDa0w2L1hLcEpOeTVscm1tUUZlaG51N054cHRmb0xX?=
 =?utf-8?B?ZjlPNTRWQjFTQ29aeTVmeEEyOVowTER1b1ovSk41eXlxdUFqemJqeXJQcHV3?=
 =?utf-8?B?bnI1U2JYVExxR0gzcC9mSlZ6QlFockI3Z0JQc0RFVmp2M3RGYThNR0JxN0pj?=
 =?utf-8?B?RjlSQU9mYUpGSk9GVXo2TityOXBmMG5jODI4TmtiTDNrRlo3bm9TRmVkMVJY?=
 =?utf-8?B?LzFkSktLTEoySWlZalhjTTUxb0JGekpjMmRNcjl4Vkxtd0lSQ1NtTzdFaE1E?=
 =?utf-8?B?dlVrSHRNN00vVlNWemlLS0pEQllXbVZHNGZYdVJUU3RqdXk1V0hYbWtXWE83?=
 =?utf-8?B?MmdFVDlMM1VxZlRyZ2xwTkFHVlRQc0RkV1V4VGhOVG9SVXdyRTFBdDZjT0d5?=
 =?utf-8?B?dGQwdmp1UzZEbDFlVWhWa2ovUldBWkM2K2k4TXloVi93V1dRdCtCRDB0VTFZ?=
 =?utf-8?B?MDJiajNBV1hMeE1JVHVqVnk0VC80ckJ6b05nWGFZOWJzcFhocEJoaE1UMEVX?=
 =?utf-8?B?ZmczU0RhNGtCTkh4c1B1aUVMWGhCamtSQmJFd3JaRnZTQ2VPbFAyNXpEK0da?=
 =?utf-8?B?ZUNCRjFrY3VhYmljYVRpbHI3akNEU21SSm9PcWhOb0QrY2pPc2RzQXozWXZt?=
 =?utf-8?B?amU3TGxMcm9pMFVmU0Nhank0dGxEbEMrQVVnb0JwSUwvS3RNTTZLcGs0VEZ0?=
 =?utf-8?B?dXhmVnNkM1BTdkFNZzVkUFQ4aUVSSlkwOTNoNGJrOVlLM25udGpIM1FnTW4x?=
 =?utf-8?B?SXpnZ1VweHM2RG4yT2dFcWF2MjAxNFRueWE4VENLazBvaC9aMFAySzJ3STU5?=
 =?utf-8?B?QVU3T2dicWdRNzAzMmJPd0grVzJjbmFSTkVKN2QxckwwYVBWMUN4THBzT09j?=
 =?utf-8?B?MkZTclZIbGNuVThCZENjd3FLc256djdEb0NRWU03ZTRMYllZMVJZb2RnNkw1?=
 =?utf-8?B?eWIwRzJtNlJuRXRFQlNwZ1QvLyt1TlluUXJvczlKN3FQNUowdGRSYWNVQXZj?=
 =?utf-8?B?M3U3NnBzU3F4L1QxdkFKQmZ1UXhJN3EyYlRQa3A4aXh4dWFtVVFjWFdMeWtS?=
 =?utf-8?B?eVNNNUpRbzRBcFFhZjY3Wmg3QkVNTTdVS0ZVbEpPcFUxTTRZcjkxU0pDUWUz?=
 =?utf-8?B?TWtmM0JEZU1WVTBlTFdCdkt0NkpuRmVxTnk2T1lRYnN1U3Yzb1A4U0w3VUow?=
 =?utf-8?B?M2JFRjdKcGJYWUg4Njgvb2hZRkVaU3pCRUYyajc1YXFucWV1UDR4TGNwc1FH?=
 =?utf-8?B?WGJ4MmluWkFqUEZhRGtqOExlVE5UNHBDM0d6RWZiMkxGZlBXZUpXNFdYenFJ?=
 =?utf-8?B?emYvSTFjNE9HRTZDV2R0WTgwRXUxOVBHdTdqM1E4LzJrL2txY0sxWmwyTDdI?=
 =?utf-8?B?bUNqV09hWklvWXdUU09ya2VIaHcvV1U2ZlpaRWMyMTN2ckw2SVhZMEVZcXZZ?=
 =?utf-8?B?L09JQVZ5Mm1MRmdRdFdXdmx5TjYwUXc1emlra0taODZHbHV3cDg0SXE4RGg2?=
 =?utf-8?B?QzFCY2hCQTZyUFBSMWVlV3IvREg0eDlyZ1lQYkhBZDlEU0thUThOU3FZS0lV?=
 =?utf-8?B?S0hxUU9xY0I1aHQ1RjV0QXJMQWg4SSs2OGFSRXMrNlc0R3E5WUpraDZwOG1s?=
 =?utf-8?B?K2ZvUXRha3JMaUpEK29BRTNlUCtRSW1Ra0FlaCttQitaN1ZrUTB4V3dlMk1k?=
 =?utf-8?B?YnpUYzh6UlFaQkRsZGs4VmRwQUZPRVN5OC83enRFNzhaZ1JJZFBtaW1XaHRO?=
 =?utf-8?B?Z2EvdkRPNWRKKzdoQlBVMllXbEd1eEpzKzhBc2hGR0ROZGdoRTlYbk9kcExP?=
 =?utf-8?B?RVc3LzRWT1JGQ05zbE5Qck9USnBXV2hpdmtUeXNlLyt5VmxSZUwydHdSaEly?=
 =?utf-8?B?Ry8vSDEweFkrVFY4N0FteTNlTHhVWlNHdEtWck1YMDEySmh2SWk4Q3JraHNU?=
 =?utf-8?B?ejhQR2MyUjlxSlRsOU5nQkZ3Y3hhclQrK2VSVHlDZzEvRkt0b3MvbG1xemxy?=
 =?utf-8?B?YUdyMzBkTnhjOFN0T25iSGM0MnZkU2tnRFRuU0lIRWRCTHF0S1p4RlE3KzJw?=
 =?utf-8?B?NUkxRTBvYy9QNnNsbHhYcFd1dTBCSXhNSEE5Q0FaMlpjczFRYlpHL3J3Umsv?=
 =?utf-8?B?cENYY1FSVkZkbFJwM0ZtcWFxNnBhYmdmaFpQYkJPaU5zTzBEMnpXczZoWTY0?=
 =?utf-8?B?eEpRcUhhVUsxU3B1TVVIVWkxUTAyYnFwdTl4SFFyRXBvUk5mNVdKMWxMRVNW?=
 =?utf-8?B?OVAvWUFqNFBnZzYxeVBNb1k3NkVUNHZlRHJwZTJvZnJGbzdFTGNNY2xZZEw0?=
 =?utf-8?B?SThxSDI4RnJzOFdWNWxjSEthaGNLMXlPdHpwNklPWXA4VXloenhJdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666dbf11-2a4d-4b00-b94f-08da163b8a41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:03:40.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYDHJLpZytbQHaoD13lYqCZSOvIslrhl14asUcvobVH/Fga9mK11z/hEn86aGO+fR9JmcN5qBGemHaWLowG1AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5440

On 04.04.2022 01:24, Mateusz wrote:
> Hello,
> I'm working on resolving a bug in Qubes OS. The problem is that
> when someone gives a VM too much RAM the GPU passthrough doesn't
> work as intended. I think it's because in these cases RAM overlaps
> with PCI addresses and memory relocation doesn't work in Xen.
> 
> Here are the memory BARs of the GPU I've tried to passthrough:
> Memory at f3000000 (32-bit, non-prefetchable) [size=16M]
> Memory at e0000000 (64-bit, prefetchable) [size=256M]
> Memory at f0000000 (64-bit, prefetchable) [size=32M]
> 
> The interesting thing is that in xl dmesg hvmloader prints these
> lines:
> (d1) Relocating 0xffff pages from 0e0001000 to 187000000 for lowmem MMIO hole
> (d1) Relocating 0x1 pages from 0e0000000 to 196fff000 for lowmem MMIO hole
> so it looks like it tries to move these pages to a different address
> to make space for PCI memory, but for some reason it doesn't work.
> Changing TOLUD to 3.5G solves the problem.
> I tested it on xen 4.14.3
> Here's the issue on github regarding this problem:
> https://github.com/QubesOS/qubes-issues/issues/4321
> 
> Is it a bug in Xen and fixing it would fix the problem or is there
> something I'm missing?

I'm afraid answering this requires debugging the issue. Yet you don't
share any technical details (as to how things don't work, logs, and
alike), and the provided link also doesn't look to point to any such
information (and as an aside I consider it somewhat unfriendly to
point at such a bug as an information source, not just for reference).
I'm pretty sure this code in hvmloader did work at some point, but
since it may be used quite rarely I could see that it might have got
broken.

Jan


