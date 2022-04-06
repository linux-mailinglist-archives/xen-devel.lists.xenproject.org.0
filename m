Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD474F622F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299940.511298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc714-0001DX-7x; Wed, 06 Apr 2022 14:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299940.511298; Wed, 06 Apr 2022 14:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc714-0001B2-3s; Wed, 06 Apr 2022 14:52:14 +0000
Received: by outflank-mailman (input) for mailman id 299940;
 Wed, 06 Apr 2022 14:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc712-0001Aw-NB
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:52:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 239ac2b4-b5b9-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 16:52:11 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-q5TUcGPeMT2RVzNeeGausw-1; Wed, 06 Apr 2022 16:52:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4825.eurprd04.prod.outlook.com (2603:10a6:10:1b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:52:08 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:52:08 +0000
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
X-Inumbo-ID: 239ac2b4-b5b9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649256731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXxMUPdjJ0cPh9pY6piCGH82AFpiP8wrG9npPLLZqik=;
	b=P1J3vpDiuVrjhmWyt10ehTITygUseGVBs73ngIBpJyKLi2tFZ8qG3Y0aZAoHHYvXXb6aSy
	toBj2tXLVHYWTt3Ua/aStZNK13rYPWxTP+p4FSnJDlLCi8W6k2zqqY44D03Uzv184k2Owk
	z4TChXlGLqY0WWv2jxkhsFkZhzicpAA=
X-MC-Unique: q5TUcGPeMT2RVzNeeGausw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8X08Sh1wTz1cfGCirosAnwvxguMDIoKSnEirXWqeR1JvnZ0V9cseq5sbjPeNYuAEVffN80ObkAk0Jw4PBABryveVno6rRcCG+simshaWvDyAJa/7RGFMpZOv+XiR8ON9iCsJmxkwpb6+FaVotl4tKK9sB7kooTuVOHU3HYnKf8m2QatFP3hk4Z/usqhgxPIBfnnsJ/9NR6R82tEiOnSc4YE0AOqyyJ8AamReGh18P0E6XFi4w69NWvUdmrKIKQG4BTVprxfQni3HMj+fwj7CouH/4427re1cZTIDezZAONm/KLHXV4mhaMT/Ero8PxL29f5dOnagWPvuURN3/+a1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXxMUPdjJ0cPh9pY6piCGH82AFpiP8wrG9npPLLZqik=;
 b=Tqb7TcikpFANGQjiy+PWMAf9WSRDiGGWu8H14jgVtoq7VB3C0YQfQ9J9qmHzADGWfufzn5GBrGLcg3djjpTH6pZUfOLFJvJLJ6KajXON2/H1CNaCy/zN08hO/0DBFKOq+htkCZCgwG4iZWAb9zUT2LLQLUEWWg4jdjdfw9RV5kw5aZBbjXbqz9ZjdZ88qdDspS2rCEp9X8LgNYk42J1AMX3HlTPnnQ3nXSoFwDhXx+gQz59yXvJM3GT3e/2+G572jRhDbepiN8OXUv9B849Gkf6pUvot1bl0w/VcSu/F6ZpB2z8skdc2MDIFfYFzAFWN3PpJ2Egp+cjn9GuqJGCCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca77d916-a283-f3f0-d813-eeedac1c5098@suse.com>
Date: Wed, 6 Apr 2022 16:52:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV
 and HVM parts
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
In-Reply-To: <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0546.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69eb8de8-7cb1-430f-81d7-08da17dd0607
X-MS-TrafficTypeDiagnostic: DB7PR04MB4825:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4825664D5CFBAF8BBB9A2E75B3E79@DB7PR04MB4825.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xak7c9pKrYwBaq0zU1pmEDZw6MQROytuhKuhd+bYnTY0SZP+z2gJZc6+kiWJU2ySCAgyB7h52hUWNeRh2SBiZxIbweSSDb5Swi0l4wd1zxgTjO6mki1W9p+C5CYl+QXY4cMr7t2beIFeY/avde0SN2jkIw2TGNssby2X7gM0XPt3Twt4bIU1s1mRbC7HC1C6gqWozeMvuUeiwFbxbqm3B7YV320Lq1relD5szNcRcbQGxNtlniZHdRHcKpoO4PbQko7Sa8gFedYHwnhwK54ZO4JMqXXz9SMT85/ynLPAR92e+P5kas+nY/6xQIsVimn7LlbikZtnyZxwszWlKv44KER8uTWeDNbpssAOrMC7xqJLZfU3gRXqgC8RlmCeEvLniZ8unBsnqamYvtCXJvHrZ2Nh3WAnB2MRfcnspDtGpcaXtI+1w/BoNwU842hzQ8ffzN4kAlo6wRbCpOMAngdpo1ekiCFXgV+/v0sBB628rR6mF4bLHXV4UptyqxpSLp9FhaV61kAEVJsg+6INBlrq2dJRqHBBCkyfGYcyC/y/XL7DfSKte/i8BWJ7YbLT0i8UEguhtH7ez9FKDi3HiQr/NKr1fgHDt2XHvEewx5EEPydaJfGYSL7Of4Hh8DWIEBvR9Z8guM8dfNRjERsPOA0vfMJsDggfc6VWVz9Z8/ZuDdO8/8RJY0uEHB/qmhCzcSsNML3t0Jot2QwFfpEGXtkzr1DkcLkBQf3Rr006D1NlninMYS6RgQO22vvr4SmQROY1xP5qxzN08RDUZlprORWrIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4744005)(36756003)(2906002)(8936002)(31686004)(54906003)(186003)(26005)(38100700002)(508600001)(6916009)(66476007)(6512007)(53546011)(86362001)(31696002)(4326008)(5660300002)(6506007)(8676002)(6486002)(66946007)(2616005)(66556008)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUpseTN5VHYraFFzd2F1dm90eGhPZHlqT1pyakp6dXd0blJ0Zmw0eHZQbkUr?=
 =?utf-8?B?N2NTM3ZXV0FCTDh1QnA3RENocG1FUjJCSngrbGRDT0NiNExFMG9ZcWFmcjA0?=
 =?utf-8?B?UnF3SGtna1ZSV0pJRXpiaXgyb29zazRYOHZmNXJqWTB5bG0wdmx6MjZ5UWtp?=
 =?utf-8?B?WnlHaVpBTHdzOC9uK3lqZHNCTVZac2ErZ1VDc0JlTHlzS3BrWEVxbFRlVXdB?=
 =?utf-8?B?M1NSMGdGUmhvaFRURWU1eCt6T0h0cE5zV0FBVzFYOEJvNjdpdWIwaXVCSkNC?=
 =?utf-8?B?azc2RzMvZDcxcWxTNVZ3TFdJOFFSL1AyeS8yT1ZHZy9kdVFDRjdhR0U4RDdE?=
 =?utf-8?B?bzd0VkcrRUg2aWdiclpLdXNTUk95b1NtYk1CNDFvSFRXbCtZakpMM3Z5d1Bq?=
 =?utf-8?B?N2swVDVKTW8rTlhMM0lqRXhyL2haU08zbndPekxCYWUrbzJIREN6S1pZeUFD?=
 =?utf-8?B?L3UrS0VONkhsdnVxOUFjeCtwOXRjUG0wd004VlRkLzNNMFhOZzVKZEhpMXly?=
 =?utf-8?B?RzdWMDdUOTFPNWVKU3BlWWQwZjM3N2lVRnAyRkNPS283Z1FBSDlvQ05CcDBV?=
 =?utf-8?B?bVhVZlRzMEJqUVgxc0tSZTFMV1NvaDJ1cWVnY2YyUUpUdVFBdVorTCtBTnlp?=
 =?utf-8?B?cU5vNk0wSUZOUUdsY2k5UHVta0l5a2RDNzRkYldwMUkva2NHQUxlNHZvVHND?=
 =?utf-8?B?SlVUREtUaUtUbWlKSVFMOFpQN05RbHV2b0ZsUFlHWGFvNnY0OXZEa2JPOEJK?=
 =?utf-8?B?d1JRaXpFU2R4K2NkMVJXbjNqSGtrY2dnd3JXalFmYnZJTDZvMGNlc3NJZTRl?=
 =?utf-8?B?VlpxS3lZSmhUQUM1UnhJMWJrQ0w4Vi92TmRWVFZjOXRLUTdBWTU0WGcyYXJP?=
 =?utf-8?B?SlV1eEpuTjRYc3dWb3phRTNva3k2OC9kTUxqZHRNeXNpUWFuckxEM040TGpy?=
 =?utf-8?B?aFVsa0NicVBWbFBxVzVhTEVHakdLbGdIQXM1SVE0NUc2OEFOVHBwbHJsakFN?=
 =?utf-8?B?ZVlKQXY5L3Q3Njc2ak9vM1QwUW9yeHR6alV3RzBUSFJrVjd1N3FPNG9OaUFG?=
 =?utf-8?B?V3VYQXoyT05wTlEwWS9RWlZPNnJDOE8rTm5RWGxEV25vY250L0tXY21uZjRM?=
 =?utf-8?B?VnBPL1E4YnVjNWtkcE1keGR2dktndGdKcUdpdXltL3pvS0c3UjBEanF3dGtX?=
 =?utf-8?B?cUhCTFNZMERvQVEwR0k4UnZGeXdtbXhER1Z2R0dueCs5cFdMa3JZZXQxa2Fm?=
 =?utf-8?B?clZrWDUzcklOQjZMSGhrckVhaW14dk5KaHhWSk9tUU5YTjVING1TZWkzMjg3?=
 =?utf-8?B?NWFDSzIxekZLdlVSbzN4ZFVpN2JWVGtQeGRlOUVrQVd1Zmc0MTU1S2VXNlNI?=
 =?utf-8?B?SFJadEtOZUJHTm5oajlVdDhqdDY2WG9RUnFUYzJVWWRtQ3owbEkyd1hIb3dt?=
 =?utf-8?B?ODUrb1NTQ0YxdERRelNYSEFuQmthcGJMSXF4bjhmUGkyOHAxQXJpM3RTUWxo?=
 =?utf-8?B?Wkl6L0RPRnJlbzdHZjYxdzJ6dlhnTXlEN2srUXJmR2ZkekhxZ0tHdVcwQUV6?=
 =?utf-8?B?bTk2bHhVakpHRGQ1NGhBalZEeEZ6OWhlZXlGMVlsMmp6MzY1WW9vSDlLL0pp?=
 =?utf-8?B?RzkrNDRBTzZKYXJlVUpWTUZNRnNUakZ3c0FPTFBhb2p4QnArMFkzeDVzRERZ?=
 =?utf-8?B?QzZRS1oydENLRlV0Vi9RNWQvaXFleE1mbktMZjI3bEpSb2pXdTVpZmQzYTFX?=
 =?utf-8?B?UXlIYmdlcE1WeEtSWEJnVUxJUVRaUGwyUHlIQ2ducSs2QkYxbUZva040TWJa?=
 =?utf-8?B?Q2pCeDBRVTNUblQ1ZDhlcVUwTEFFdmpCNFlWNG52L0dEQ2JEZWhTL205Vmc4?=
 =?utf-8?B?Zk9WdTNRRVh6NFVWRnIwZ09CQmpIVmV4eFRuRmZab2llY000TmxMcnhOT2Zk?=
 =?utf-8?B?ejg0b1NlWnZISXA5R0wyNkRiSnNsSkIxbWZCT2EwZ3JzT0wyT1hGVHNIVVpv?=
 =?utf-8?B?OTF3ZVhzZ1RWWmhSSk41b05jaTRMV2ExYkl0MXIvQlAwendPdGozdXhjaVNB?=
 =?utf-8?B?L29Ddy9HZ21xbHBTUmw2UFpMVGRHN2IzeUFxTkJBRDFxYUZoWGpYOFJFMlA2?=
 =?utf-8?B?VFVXT0VGTWV0VW5wdXZQMmpyL200L0Q4Q0d3a0sydE1QR2Mveks2aGJ4QVl0?=
 =?utf-8?B?bE1nNnZKOGt6bVFzZWNFVVQ2OHpJWFNtQWpTRGJaaTczU1Q4aEcvSnJQSVJU?=
 =?utf-8?B?cW9NZEFIWDJDdHhLY01heDFyZEhTeWhrQmpWQUozb0JZVmdmaE4zanJ0ZmZP?=
 =?utf-8?B?UThGUjdiZ2pRS1lKNlI4Qm9hbUlTNFU5b1YxZDFFbnpxVGJ0emZZQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eb8de8-7cb1-430f-81d7-08da17dd0607
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:52:08.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUjN/TXhviCfWnc3AfAxCx4k8WxFx29knA5B/EpbO2zPAEKe7ZYkuq2+H+Sz9CCzx5ot9qRBu1bxjqrIbtwivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4825

On 23.02.2022 16:59, Jan Beulich wrote:
> ..., moving the former into the new physmap.c. Also call the new
> functions directly from arch_iommu_hwdom_init() and
> vpci_make_msix_hole(), as the PV/HVM split is explicit there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: George Dunlap <george.dunlap@ctirix.com>

May I ask for an ack on the vPCI change here?

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -409,7 +409,7 @@ int vpci_make_msix_hole(const struct pci
>              case p2m_mmio_direct:
>                  if ( mfn_x(mfn) == start )
>                  {
> -                    clear_identity_p2m_entry(d, start);
> +                    p2m_remove_identity_entry(d, start);
>                      break;
>                  }
>                  /* fallthrough. */

Thanks, Jan


