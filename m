Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A1538CD6
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339242.564070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxBy-0007ee-TB; Tue, 31 May 2022 08:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339242.564070; Tue, 31 May 2022 08:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxBy-0007ct-Q3; Tue, 31 May 2022 08:25:30 +0000
Received: by outflank-mailman (input) for mailman id 339242;
 Tue, 31 May 2022 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxBx-0007Ou-7u
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:25:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a029da5-e0bb-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 10:25:28 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-EslTSaQ3NrCctrbHjE4sTg-1; Tue, 31 May 2022 10:25:25 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5396.eurprd04.prod.outlook.com (2603:10a6:208:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:25:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:25:24 +0000
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
X-Inumbo-ID: 3a029da5-e0bb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653985528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiG6PFZfhjVGsIA/wdDcU84fErX3fpItHievOS/np0w=;
	b=lTTNLTHJIWCxHck3a4a0agCn+w6VayzNMlIyJh1tjxE+tfVsX7R5Od7J30rXJOlCGxLSMs
	VLLz8xzYFYJECn+XfhnRYRagAGvXrKnx3OBnQ87I2ycGRxNLQwNPwitCdlLNC2KWJA5VLv
	c1R5VMgO7A6A7BrW3XEYckMcQfxxAdQ=
X-MC-Unique: EslTSaQ3NrCctrbHjE4sTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aipddmgkwVdHdZtf2wqN1R0q6r4txLSsdCtKp8QnJprjeDmGGQwTNIu1ttY8ZZoVrCuGRAX9SZFc+X//dbAI9lWZKaGl4dab024appP/AHwh/qEgYI7OIXEC6yicsJNCqpiGnp1CNGPGq6rfkCNFQqP73Ji6ciOQla3eMv2DBScxHd0I8tk2HSrdPCLNEGCTdmaAtRe4YKkc5sFzoC+mZ37FLGO2qvvw3q8hyQ0fzMLV6bfhqmuNhh4PhOeEsKX5BIA+Z3DzOgDjXs+jnpsWwuB0BUlYVwAYDak3OSVMCO5lZ/8fjJn0DDlvgHlexrkjrQffQHTc6X8yNrXf8B8xXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiG6PFZfhjVGsIA/wdDcU84fErX3fpItHievOS/np0w=;
 b=mAoQKyzehSjfAX7avLBJRLYHVy8UoazmKrgG/1S/JwZgazV525Gh824U4OrzP1ivHYyj+DdNy3j39S+vpjCHfmCAXQxxS9bgZ5vX83vyYpqzRVW162PFK3zR8uiyh3lB1lq4MqmVkMQHR8bfwX1TP7RehIBaCLEcIRnNX3/7nyELCQ/LkcI/ZgtgElpul8tGsY5QP6xIodA53iPEv4AUWpfr/PyvAB6iGcicYRGNFt0d1yGbeA2K6h4V0pL5fAwqE+GBPOfhmaC72FWy1kk5+n9XeSQgaO+Co2cEKFPH8g8qvy0tPJVXdI8w1de3n/jRfZjfFOr6h3djK6qf/l0XNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1340b4d-88dc-b146-d159-a54f662a2791@suse.com>
Date: Tue, 31 May 2022 10:25:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [v2 0/3] xsm: refactor and optimize policy loading
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 xen-devel@lists.xenproject.org
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531023945.22196-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9ae122-8885-45f4-f6c5-08da42df1c03
X-MS-TrafficTypeDiagnostic: AM0PR04MB5396:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB53963731674164DBD44F55C2B3DC9@AM0PR04MB5396.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8P5AmW42s5yzD6mfqcwkoZbs7YB2vhNzYs7M+ajNx4fsBytrjzXygCx6RzYiO0mKBynuceay3Ra1jU9tVvez2b427/+1cKfRwODgaParo+2duA5/aLyGzNZ/SSC7Ty3kVdOhJDL6Z6dAQJmD9lqHOtphcKjhS7KpcukSrhQh3ZaOKEJy54YgtfLnw8Dq0eGc7E7IEpcB3tWrIGpN5+UMTcrmEftiQdvK64rCiv/PDPKP2TYxLXHGb0WY4UcSlb8QwU11thqDRuGeGpmS0gK23blFMmhhGhdAsoXJU7XY7oHRiAqpWuWFwvbJAwar9w+MqNSVD/La21NCwb7L9ObJ9Y77TqKBYBC9fLHhHLL4rrvF009RMvyw5Bp5nvOiH8O9lXmAaYtsbB9bxz42+hnRvAjNthwGInyuvFYBqP63vccjNiGMZ+ueUQ4CQZ1756EDh8eOpYkfFAUFZBVk08+Ip2ucCxCYCLDj0Lek2cfztyOaStyTTOXFNxlyNI11i5IVYpVXGucligeBRFEXR+IceV8iwQWZxezULDn8sptL2RZYpkXnSgNtBvuhgXLRtMy9yfqwlbnpBN1OsEXZYh4NFEQqsCOMN2Y/MqWe+lYvIoW0DZQ9fJ6Yz1EJ/NWTAOMDzWENyBwvIk9NNHKT+VNwyelZbgwCVpGsRiBinDE8bFc0a5WBVJgq4WCmjyZ8h8geUwy0W8KRSn8UYCVFbde6VlDtAyz/ERUXx44SsCo0ZOLG9ltASVac6M0Wq1O+kswy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(36756003)(508600001)(31696002)(66946007)(66556008)(186003)(4326008)(2616005)(86362001)(2906002)(38100700002)(31686004)(6506007)(26005)(6512007)(5660300002)(8936002)(53546011)(6486002)(4744005)(6916009)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHJRdFp4Y2d1R3hDREZCMnNWOHdFZkk3U3ZCcFd6OHdNdEErU3RpemxhMU1z?=
 =?utf-8?B?QjlKVHcyQktJQ3dJVlJzbjF4ODFZVm5qOG9aU0RydUpSREFUTCtDNnNKbkNO?=
 =?utf-8?B?bFJXRDREVitIM096SlM2aEZuanZ3eDg2emtvQ2J6dFpYOEIwZFAzVjFsNkNM?=
 =?utf-8?B?MzZHTmgrS0VhNHZPdE5Vd1lNeVVkN0N1YkFBa3BDVE0rYUpQSkVFa1B5M2FP?=
 =?utf-8?B?VWlqc2VhQ0x6ejZkNnFOUlcvaEtTL1ZMOXMvTCtNS2o4RmtVeHo5RFJUdXBw?=
 =?utf-8?B?YWNIZGcxRzJHa2J5cTA3Z2NIZXYvNmxIZ1k4RGVrNmpsaGJJQ1lvTlJsV2c2?=
 =?utf-8?B?aEdXaHdwc2lhOHRLTWkzekh1Nm9ROGNabUpXUU1LTUo0dFBzREhTeGRleDJt?=
 =?utf-8?B?ZkxSRHdzNlVMWTJ4Vjk3NmZxVEdvU3c5WERmcVB2Vm5ESmhnTHIwZTJ2U1NX?=
 =?utf-8?B?Ynd0Wm9qa2tIQzVkMW5sVEt2Y0lvUVJlVjFwMmV1MWF0dGhQUHVKL3FiclZk?=
 =?utf-8?B?QmNXU3BWR3JZZGlOWG95aTRPVzZOQU16b011S3hqKzdVWjBXTnpvbkdJZ2VE?=
 =?utf-8?B?dnNOVnk3NG9MVmpWVjhjamNoUXZsKzVzMWQvN3ZxcTF4QS8zZmRpVU9hMTFr?=
 =?utf-8?B?SC90RUVFUFNQZVJDOG9PdmJIRmJ4Sm1EdHk5U2N1bnlCNDJpRFFDbnZUeEgx?=
 =?utf-8?B?d0w1akhveVNRS2ZmMzVRVW1SbkFjTENPWEhPRG1GaVdNQzE2Rm44SjN2azll?=
 =?utf-8?B?TU0wTkNiSkZzTkdIQXBrQzdXNTFvNlJBUnc1N2RvUVRVNE5waWp4Z2dLMytH?=
 =?utf-8?B?RGxhWnpaOHRSM2J6WGprNGZHY25jTGdLUGxtSnRTTHZYcXo0RUNBdWE5ditH?=
 =?utf-8?B?Q0xqYWU1YW9wYkx5b2Rya2lhVXhHVlBBNVdzNTFsM3RhaGRWMXU3eGlOSkpm?=
 =?utf-8?B?alRXNkRWdEdqMVNZR2h5Y0pudmZJTTJVNTZ2b3cyQm5OZWNwUVI1S1lCQzZ0?=
 =?utf-8?B?YW5OUFV0SGUzOGdjK3hlZlVQV0hEc2hMVSt0RWxPbDlSVHBJVWpOM3NKeWk0?=
 =?utf-8?B?R1Y4ZGUyT01qMDcrTDlML2llYThEb0QwVHBsYkRmM1J2ZWx3enpkTFVMSXdq?=
 =?utf-8?B?ME5zVENsdEJlcnN5OEtibDJ6dFdYVFVWd2RtMlpBb0hLMTYvYkNtZXdkQmw2?=
 =?utf-8?B?amovczNDejJxeWdzVGdwanNCSEErSjVnMjNzZFpqa29nT0t0dzlyQ3N2SHV1?=
 =?utf-8?B?dEt0WU9vaEg0N2pYU1c1SjFSdkY5QTVxbExGS1p4K3RXTzdHZDZXUXlBQ1hH?=
 =?utf-8?B?NmlQelJuMGFtYzBGdW9rbVFObDRDT2ZSb3hiSloxTUk0elFZUTRLaFhKVUZC?=
 =?utf-8?B?ZUZ3QXRUMzl3M1dGbHgvb1VIbWFCNUZmZG5yd1dFN1ZzWU9rMGQzY2VsaGhU?=
 =?utf-8?B?M0tLS3RkUVZtaEZrbU1jT0lBQmEydmFZTGJSN1BvbWFud0JvaU00UTNwQzNz?=
 =?utf-8?B?dlJQQzFEZ08xdmR0VXd3RmhhTzRxYnpOak5DNEltYlVXRVkrWE1kY3FyRTFs?=
 =?utf-8?B?dlZOMHRLNlk0U2syaXFWRUs5OExEWHRQY3ZXZ21KdGRhaGpkd0w5V0ZwVkY3?=
 =?utf-8?B?MXY4cTY3Mk9RNUpPSEh0aXpvdXROZGExc1NLNWUyRmN3WG5iQTlsMHpmVGdO?=
 =?utf-8?B?OUZOeVg3dG5FdW9weURwSWcwNXNDSVR0UytObGZpSzFxRmZtWnBHUlhVa1p1?=
 =?utf-8?B?UjZqRHlZN1JlNWtDNUFiNm42YVU3RFRoWnE2WWxBdHpreWtFdmJ1d2ExRVFP?=
 =?utf-8?B?N2Qxa3AvNTF4VFFVTVNzU0UvRmtuWXdXbHVYRXByUVhiSVNQUWZRczdaMjBp?=
 =?utf-8?B?OC82K2poM0s5ZUpTMUlpTDIzenV5a3hRZ1BybGhPZitWQUEzSUU5NlhhWXpT?=
 =?utf-8?B?Q2d1MEJiZU1MblpvbXU1YmF4bHRuSHdqR1pGZ1d4b1kyNExRZzR3Q1RGQWxl?=
 =?utf-8?B?U2E0Y2JIMy9tYW92NHdSZ0pWd1RRVHo4NGtaSng4UTBSV3AyUjFDbjE2NHFq?=
 =?utf-8?B?cUtIdTdiWE1PVm0zRUd6NjA0VUVDcThHR01jZi84MTlUU2p2eXViczBxQzlN?=
 =?utf-8?B?S0gzOHhRRUkrOHRMUTBkaXRMd2ZTVDVBNnRobUh4cEhZM21URlprRzRlS1hT?=
 =?utf-8?B?S2xHRTJXdklNQVlHaUZ0WHRCUDRLeW9GUDN5U1dkSGtKUStNbHFoSERveFov?=
 =?utf-8?B?SDg3M21KNVpSZml3K3h6Y0pEcnBnZS85NW5ySm5FQTVvaWVDenFpNXlVRGFT?=
 =?utf-8?B?eU43VitGV084MTl1TWRpek9zb0IwYVdoTTZ4Y0NsWTFQdnRkOGprUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9ae122-8885-45f4-f6c5-08da42df1c03
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:25:24.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VphjTy93o097MHJv8WLyGWClykwVNc8wRch3oBjL5nTk8NGMTsSrBxo5oIWAA/VaEBwVi/cuLPdXK0/2G5Hng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5396

On 31.05.2022 04:39, Daniel P. Smith wrote:
> This series was born out of some cleanup work done while crafting the
> hyperlaunch boot modules patch series. The primary purpose of this series was
> to stop walking all boot modules when it was not necessary, but the scope
> creeped during review.
> 
> Changes in v2:
> * changed init_policy to policy_file_required
> * split the patch into a series
> * corrected casting of policy buffer
> * use IS_ENABLED() instead of #ifdef sequence
> * moved #ifdef inside of braces for xsm_dt_policy_init()
> * addressed lack of error handling of xsm{mb,dt}_init()
> 
> Daniel P. Smith (3):
>   xsm: only search for a policy file when needed
>   xsm: consolidate loading the policy buffer
>   xsm: properly handle error from XSM init

The thread consists of 5 follow-ups, including two different 1/3 and two
different 2/3. This wants sorting and then perhaps (properly) resending.

Jan


