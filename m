Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654A49E62F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261571.453030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6pZ-00015x-EC; Thu, 27 Jan 2022 15:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261571.453030; Thu, 27 Jan 2022 15:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6pZ-00013A-9b; Thu, 27 Jan 2022 15:37:01 +0000
Received: by outflank-mailman (input) for mailman id 261571;
 Thu, 27 Jan 2022 15:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6pY-000134-4u
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:37:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7045062-7f86-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 16:36:59 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-0MrOuMg-PGuR1HQbBKEZbw-1; Thu, 27 Jan 2022 16:36:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 15:36:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:36:56 +0000
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
X-Inumbo-ID: f7045062-7f86-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643297818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xB3AFYw3k0IzWWRUZBVRAMh5OlFxd6ihqY0OgI0bpUQ=;
	b=N/fZanLdPfiSIKeI1NRlsGK8xB/5cJ9usZE6Kn4KXEiJHY8t0exclLzsSAp6AE7Mzcjk9F
	5+ZlSFznwB+5i6qUWSS5RPFytKqdJGU9HWs56jhoIZwgzcYBsgs+XJoxI8MtjGDqpr3lHj
	08G/NdBuQXg6vBguBlyMTazL2Fd/TSM=
X-MC-Unique: 0MrOuMg-PGuR1HQbBKEZbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIzFP09X+zIKQg50c07FeOoGGVNPhJVfKleeqc4RivUwAbMsRKFwBZLw5vCsd1YnQdRG5uamMPmx5npi5Ffcwu35u46wKWxulRwVkAkTjyF/R++W5c6xNNNqbP+MREXUCe5UnkrL2QrmJFcu3Tx+zf9Siyj2JAnj6rQYpbyvIjRqrbyvj/qwv+fe5w+Q+p7M/B+8wr2h0QzHF3efxrfKq8+V3G+ka1K9yaLWqgjEgGzNIsc9zHXX7YD3VIeFp8Igzj3AjI/nBhIgQ03ODiqFnNmA/sm8/mDy6Luinu5kBZEpC8PedN/2CsvUdcrFf16EwroaLuoi817rGn2bfgLL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB3AFYw3k0IzWWRUZBVRAMh5OlFxd6ihqY0OgI0bpUQ=;
 b=YhGnzqBjy2aiTXLEawKJz3n7ozoZlcSi7NuV9iC/gkwANqemubIanWv1DpNsg2q55GmNvYSNGAsECFWHDXhuGfNMUadrkKs0kB2I4TFjo6/7a0Heo590T83CBAFIXbsTZw8rWark4/HkSU97dSHy4sQRty1hRjo24myg2q0poxJBdwv0pDT39dYiMuRKp572dxCvtP3qsvQYd2DkV9o1E4VDqO6q5Uu4x0KJF5M9adMKs9ogQb227P0VeAlC9eb+6X/xDKlTJd1uxPnGA+I+1lSIUvp3EVSafkOnlo1D5MrCarj2/l/4WtVy+XeRYmzzk72oTNJzr5EQ6S2mbVxtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ac912e7-d250-5e3b-33b0-262c293cf045@suse.com>
Date: Thu, 27 Jan 2022 16:36:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 03/30] build: fix exported variable name
 CFLAGS_stack_boundary
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0399.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61bbe9f3-8ec6-49e6-cc23-08d9e1aad9a3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7703:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB77036866B9F04C6757F2DA1EB3219@AS8PR04MB7703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1BeSpSdlruagvcrICFbYyCluozSGyvM7HX+E5J8rAr0auxPcWo/E8OH6tix0QIAqybBq6Q48JyT8B1TwX3bE/Hxp9zGOemj98zkjnhz2RyjuqFuRCk+YtGFUppleb01gSf1UDOmHuh5saj02aCcdfCKU9N8+LoBDxIiRNNevVYmSdYY3BjLBubl+J6mhxTB5xlj1p9gfdfxq6IFrRPc4aOpgVhE2o56Or/zBVp4boAtLPcDHK98rNMMkbogs7JHk70KKi4jAUxlS2FldVoCwj0R3bk38kHABBCsNwFvN1By1EzCh3HTrwgyVenjlL5dfi6hFPzN/IHsvUYjAPlB5IM+0v4789yifavlY2OGipT4NlsUAZpnyxg5/ka396ralLZ0ddMAMfblwoyVtZzNLyCPFuOuY/pt7e60Cl2xggFYJlmzV/AO3CNMJjww4B+Q6lkU4YnXHyhBaeqeG2OLKd2D3YgoDpdFZElAYd6qWADKs6TnD/M9mSALTUxqS8d6dVwe4IqDD7HqE4hogZiHGgeQNzxALm6W+fJmEX8hiRHUoU9Af9v5iJ/eq2qF3maVmON5qX9rX6e/gwgF/o3e2jjm5XNxvxm9mhZOmXgwAf0jdFojBuzeg3QTLVkK4Ed+7RESClM87juuOP2hnwD9XM9LYbrj+9hEtTHdMM0lEEVLwKHuMO+QsA5u7opCi1k3VYzF0xezXNHN5KQv4R0XA0bTZxz2m/i4v0XRrNnucnxzZUR5qGqGERd+vMzRMbbK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(8676002)(53546011)(6506007)(6512007)(26005)(36756003)(4326008)(66476007)(8936002)(6486002)(508600001)(4744005)(86362001)(5660300002)(31696002)(66946007)(31686004)(66556008)(38100700002)(2906002)(6916009)(316002)(54906003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFSTVd1azVnR2ZZRjJUWVVEc1gzWnViY21LT24zK0hFVmx1WkVpRTVMbGhw?=
 =?utf-8?B?WXRTWjlpWTUySjdKbkJZZnRrSDkrUmJTZHRGZWlPaHo4R1dDMXU3NUZHeFVx?=
 =?utf-8?B?V2ZNTzdmSXIweHZib0FuZE5PTWJnRDI5eVhJMkFjb0dsZTJIekQrcFRjRDFJ?=
 =?utf-8?B?bmtPM2F5U3dBYkl5WXUySHdMMDEzSHZXb2VicHcrUHlnM3g2b25oQTQ5OGpI?=
 =?utf-8?B?cUhGSXZxUllzc0c4ZzhnUThqM1NZZkxIblprMUdLSEh3aUhvTkJTWGl6eWE5?=
 =?utf-8?B?TXFUWFlLTGNIQ1JCME9mWHVqOFY4OWtjR1hLZTJHYlJQTVJQZWYremNKaGJ6?=
 =?utf-8?B?RFFMVlcwTzJZUWZud1B4c2RScUxVUkVmc0NWWXJaVTBQbG9DaUM1YWIzSDdI?=
 =?utf-8?B?Sk9CQ2hYUFBHMHhvUlQrUWVWYXFZTWNiLzdrZWtkRzVyeE1LNFRhYUU5OVdj?=
 =?utf-8?B?aG9LT241SVc2RStFRS9qc2grRFkxL1NLMkk1YU5GWERVWUNWNnJ6QSt0Y3Az?=
 =?utf-8?B?VnkvTjJ5cC9HaHVNTE04VFJkMXdnQ3ZEb2hMTTBLemFQOE9UY3NlQklRZEdW?=
 =?utf-8?B?SjQ4TzhnNjVjWjcyUlNHeUxKTmV4d0FHMUtqNEdtZzdtMnpkYmk5ZTRsUzRh?=
 =?utf-8?B?ZlAwYURSaFBGaGd1aWlQdkg2SHhpVkVVUjkrbjVnSHFlbGk4b0NBdWhJTUJO?=
 =?utf-8?B?cmlzdjlSYUgxQ3ZWRVFEZU1KbFpXZjJVRVI3MC92SENUVzNITi9Vd0NTZks0?=
 =?utf-8?B?VUlvS1BPZ1dxWXFQS200VXNuNUFsTU9wU2doMklEK2xOcVkrTms3UEdhaGVK?=
 =?utf-8?B?c0g0Y3ZlUC9VOTNlc2NGbGhpQjYzeTRrM0dHWDhzT3RRRDJZbDc5bVY2UGVo?=
 =?utf-8?B?Z1R5NlYzVEtPa2lvVDZyQkdySVBzT3M5MUZidXkzTW9EdkRnbzJiNnNyTExu?=
 =?utf-8?B?QVYxbktPbjRJY25vWW4rajZhRWxIMUxEaXViVlNFY0dzZU1CRnBaWWFxYXg5?=
 =?utf-8?B?NWhFZ0xySmw5b2FYMFo2M0VKRXY4dmZMMzBqNWIvOWprS24zVk5JNHFtb2lK?=
 =?utf-8?B?MDAvVU01QXB4ZHNzWTd1Q1o2Vk1TcDlXNEhmVWJVa0hFdFBVU3MrUWtqcit0?=
 =?utf-8?B?T250RWVjUWk2RGU2d0JscTIrcnRVQ1hhRE43SDEzckU4UUhkenVnR3RmbFFM?=
 =?utf-8?B?SnNhdU43SkpIQ0o2N1prSC9VVUFzSkdmeFg5OEJXakYvb2pvOTBmSnpkSUtP?=
 =?utf-8?B?UTdDRHJPY3Vmb0cyZHhieVZLQmM4UXRjUTBpd2FmTG5pY3lXUVZnY0pSSzBj?=
 =?utf-8?B?Z29lV1lnY0V3Yy93VXorL2RHSWFrUEZrT010bStDL3JiZnhjaW5XY0I1RG9U?=
 =?utf-8?B?aXRFSjZkejkrQTNFdnI3SjBJRnFiOHhqOHk1SmNsMnk0MkpzN3dMRUxObFB0?=
 =?utf-8?B?ZDNlaEdHWE9SOEJuSndNNGhuVmx1aVU5SjNacUw4VkJjbDRzV3VXSWJZcFpu?=
 =?utf-8?B?ZXRuN2hEWDMxZHJBWTczdlMxUFc5dUtaYkE5WTQ1K2MwNWVCb1ovcUF4bzVF?=
 =?utf-8?B?ajQwUVJycnF1S25OTU1RREtObzN0VkpKMjl5WC90Vkk0YXJqVFZZeG9WQ0Rv?=
 =?utf-8?B?am1ZV2xva0xCOXNsSzJxbWhKenN2bjBBMDhhanQya0t3RUFyQXpZK1B3YlFx?=
 =?utf-8?B?cS9mNFl6bTFPYTZqbE9ONk1oWGpHVGx0RDFwRUc5WFF2TEM3VEVTRXR5VkNl?=
 =?utf-8?B?YS9TUmN2VHVWRTBkZWlHMDI5Qkh3V2FBWkdrU3M5WEduUVJadGJGSUN0OCtX?=
 =?utf-8?B?QWpKVE5KYUw1ZjlBYTY4OFgzTEdwYStPeXY3bGFHa00zKzRLV0F3YlNoOVBv?=
 =?utf-8?B?MHVwemN0MVI4Vmwrdi8weEcvbVBBUnk3eXRmUDRaTUlhekVsYmx1Q0duM1Uw?=
 =?utf-8?B?ek9peWIvL2RIbWRlUTZmYUlBcVhYdG9IR2VlVUJMZ1FKTVhIT210TnJzQU04?=
 =?utf-8?B?eUllSHpKZmZod09YNExHUEM1OUlkU3VnNEZ1THVNbHAwMkM4ajhWT3ZiVVZ2?=
 =?utf-8?B?aGtGbGFhays1anBQTXBFWTFyaUNiUlVjRmFqQUQ1TnkyVWxHZXg3STB6MjNt?=
 =?utf-8?B?a0p4OHhLdkovUGFQS1ZTNW00MkdwTjVwQkJIbW1LQk15anc0bUF0SlZlS3Ux?=
 =?utf-8?Q?oCAY4U3uJn51XpybHmUDLW0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bbe9f3-8ec6-49e6-cc23-08d9e1aad9a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:36:56.2966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7Q6QtV3ADpdYR+h69RDfEv3D1cdK0A3WeLn26ExmUo1kWcHoRpWqwN6FHrRRUGfUCvd1Kh6m2EQBHgvw6V44w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 25.01.2022 12:00, Anthony PERARD wrote:
> Exporting a variable with a dash doesn't work reliably, they may be
> striped from the environment when calling a sub-make or sub-shell.
> 
> CFLAGS-stack-boundary start to be removed from env in patch "build:
> set ALL_OBJS in main Makefile; move prelink.o to main Makefile" when
> running `make "ALL_OBJS=.."` due to the addition of the quote. At
> least in my empirical tests.
> 
> Fixes: 2740d96efd ("xen/build: have the root Makefile generates the CFLAGS")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


