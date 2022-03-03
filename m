Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011A4CB80B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 08:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282796.481616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPg8D-0005NK-Sl; Thu, 03 Mar 2022 07:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282796.481616; Thu, 03 Mar 2022 07:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPg8D-0005LE-PP; Thu, 03 Mar 2022 07:44:13 +0000
Received: by outflank-mailman (input) for mailman id 282796;
 Thu, 03 Mar 2022 07:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPg8B-0005L8-V3
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 07:44:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b66066de-9ac5-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 08:44:10 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-KPeLBl7DPn-pAsEc1wTLJQ-1; Thu, 03 Mar 2022 08:44:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4207.eurprd04.prod.outlook.com (2603:10a6:803:3d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 07:44:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 07:44:08 +0000
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
X-Inumbo-ID: b66066de-9ac5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646293450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jC6mGHn2Ad2BGiJFLUZjUmDowOsvazMP52tFaHd/OY=;
	b=IKnNeAnCAcLtroDzvLWxLV1pgBoLhGE4FPLswEH7L2xs3X40mjEP+QeMaMXLoJbJmqiUUF
	/OZuxmp01pMwsBPmv7+FwFbirtSJ3PkFbbPZbUv4Kdae15LFdTVx4VRlf7vSw0zExyIiKO
	T/1KyBDY3nXtLU3kxw6gtJUdhd1jbas=
X-MC-Unique: KPeLBl7DPn-pAsEc1wTLJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O++pxZVD18kVLigntuum7ViPVR+tfhWPJXMUlNuxu3OTaT6GHAfCvYQ2btrIYjDvTWEOmfK708WoDQWRif0xghMVaQ7N1EPVir4H40VrYTP6PrSfIKWjKg9eoB5XEyvEZoENlPQhmd/3LSHk0vCOUDqfakF4GWPK5m/08p/okpt+QInPGJ7m7lwJFHaWj0/GaIb0wUDrfYmDFr48Bh7nlTzsS37kmXIvVWFX/OPpi7FCT5GKDWxyMl4btSNlBJZNXYrOfZLo7u4UdSETKGIWzfwmvcrR/4ZRZ7v5u0ihVX4LiTwLTA9tbUu8QkB/Pl8LI1aMj6b/u3FcUdn8HzsDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jC6mGHn2Ad2BGiJFLUZjUmDowOsvazMP52tFaHd/OY=;
 b=a/yTGpCd/+hsIy/lL5lslSpFO0NwEDkY4mFa+xLr7ZHPBMwxhfwk+egKNF27R9iFBszHDJrZ12zmFsVn6sCayXIhoxdvCZ3g1Pt6fHp9RRVEk9wGBpVm1Btz1STovJWkunag0qfNBUctUMKOtqFoIzxtImjoctm18uwczgH+OBD6AIsTxXsKp6bLFFrN6oTYK2tehOF2Uakp7TuzyuknT3TgcOznNH4jtrVxNV07QYPbCJYIYdSekDnfzVU6Y77oBU2oD676dtkkqNubgQWsdqvnhv9USqUOxLNEYoO2bSDXHl8W+kp98i2K1WSrrxdWuV3uMiEuBKsVtBJAOH5Tmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
Date: Thu, 3 Mar 2022 08:44:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302221157.17246-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220302221157.17246-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b6e1a75-036d-4a20-db66-08d9fce99908
X-MS-TrafficTypeDiagnostic: VI1PR04MB4207:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4207EDC3A595FB9CFEBC455BB3049@VI1PR04MB4207.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+mH58AeWmPraN1MRdAOpuhPZip9LlnznMPch6BHcCP/H0E8k0WsAWF+3FBatWW8SDKT/MwdHIxArZmark1wCBaQH1Wza548B4tiBoBFFzy9Yvvaev1jQavEBm6TsdYJAVXiIRS2RzRpYn1aQSUAR4x5x+9uSAb+ErEgVBVoeHA9IBsr5NmhlCW5Yduy81fEFcYm60ESw/L/xCVb5PKCBoVWhwsTxYupyYk5/nrUY0VtakO0IhxMXI/H1EZFHdnH+ZCo8Ccop7MRzGCT1M4zOjtHcDwPUstlrl/smryxCjDu5cLo8+0yaEP0kER7MS9zjMSqI3syJ5WfqY8w6Awg3AiWqDSj6vsQXfcez4FewKx9iu1kkdHn9TiqFjcLLU8vN6LJde5vJ+HWyxVwSFkTHvszQNxYJUZVNlRNTJnr05sg1L4+D4ft0bySz2jDhpcWNk2cTWD975y5QN2lMZ4/SNtqipAQo4XQ2874LPppnynWUIAo2xRlHMVg5XeRoVgBkrgXsroIacvyD2O7geSQ6P+pQaFoQf751NoQhmlJcmJAiBI5rCO6rpd9Z6fXPam6B6brfNddc4v/U7k3hddGHeu52qh6dfxWndW5di5w6rNeG8ABVM6+jmJ0ClUtby2elVrIck9GhWr+c4fWle4p7dF4tqUbkhv2CYkIJMqR9ke9cR7aaptl/P92JrX/AAaY8lV95pOypXAxRDUK3d/Zce0RfRtKIY/63gdpDMT1LDuukWrd3ftrDsqRfLoxYWQ/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(4326008)(31696002)(6666004)(36756003)(86362001)(53546011)(4744005)(54906003)(31686004)(26005)(186003)(6916009)(6506007)(316002)(8936002)(38100700002)(66946007)(66556008)(66476007)(2906002)(8676002)(5660300002)(6512007)(2616005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTN1VjRveFJwaVAyc3Y5OE0yTWU1ZEQ0V0tiWFRoNTl3WlpDYm1XaTFQZWlu?=
 =?utf-8?B?ckdIUk9LL2VpVnFwZmp3STRjK2MzUURaV2JSbldUTEdNM2RtWXhmYTlrSG5a?=
 =?utf-8?B?a3FYQ0RyU3ZHUjBJV0h2cE1FNHUwYjJIMTYrTm5DQjhQWFFHeHoyeUtCWEZj?=
 =?utf-8?B?UWptdWxzWXdwRlZOOVdZUFVUTXplMEsrdmthNnpadVJaNjdWTUpuOU92MWJM?=
 =?utf-8?B?UStWaVA4aFlka1FWL3FTOWt0WENYWVRvbmR5aTZVY0c1cmJoa1NRZ0dlY3Ur?=
 =?utf-8?B?c3FySEY0Ykx4aUFCOTZ2Nml3MUFPNHozK3pvK3RZQ1FmZWRzaWxiV2FxQzZX?=
 =?utf-8?B?ZWl5SDdaOHN3NDNiNUZ5MVN2VHZ5cXdRUmQyU0pFU2NwWkw2WkRaQ1krSnJy?=
 =?utf-8?B?bTJQYStZT0E5cUdCNldZL0dmR0NNdmQvSEd5dGRSQmpwcFBONEZwNTNYc3Vt?=
 =?utf-8?B?UUYxVFVIL2xWL3MyTnRNQUFmWTRhc0ZzQko0QUQ4SDdvSEw5WGZJdldDbm40?=
 =?utf-8?B?bnBhaDdLYVU0R3BobGJTN3FVZUs2OTBZUkk5cTNUdTg4WGhmOStZVmNBc3N1?=
 =?utf-8?B?eDJOeGN1Y0Y4WEd6bnhKUCtLbFpXVVE0SlRmUGY2NlBmYndJMlRHVGp0bjZi?=
 =?utf-8?B?bGZjOFdpaXI3c3NGOUwwaFVlR3drcEZ4L2VTZU5wczRkN2M5Z0UySTk4Qktj?=
 =?utf-8?B?aHc4UXhLRlZKOEhtV1pOTU5PNk9OcER5RDM5em5YSlFUZ2M0eVNCTTlzVzhB?=
 =?utf-8?B?REJTbmVQcDZqYVpXa0IyQTZzbTlOVk1oQ01LendINUdaa3I1WFk1QWdDTXlE?=
 =?utf-8?B?ai9EMGxkaS95aWJscEdmZDlwekpEVXBDMTNjYXl5LzBaMm9zV3ZZdlVCNlZQ?=
 =?utf-8?B?VHArTEwvYjBaYkxxOXR2MlBGeUtlUVZralFJMnlySkxHa3BZRU9naFNJdVlN?=
 =?utf-8?B?cCtnSlduQjAzLzM4RnNyZWJNQUdqbTFnMFQzZG52ckk5d1hRTUc4WXdsWlVq?=
 =?utf-8?B?RUsyOTFGeVRzRG1NN1c4VmN5Mk0zWEFnbjFpVnZwT2NzN0F2VWxZcUpJcHRr?=
 =?utf-8?B?a2JXdysxU0JUSk1JWFhjZHE4SmE1ajV3YUozQWgrMXdQUzVhOStsNVBOektO?=
 =?utf-8?B?emY1aTU3dzhERHdDRmZqdHdyQ3JlZHhhSnowZ29HN0dxTmFTQXl6WVNQbmph?=
 =?utf-8?B?ZFc5NlpjUHhHdWYxRkVWQ2ZleXFWTVlxNVIyQldZZGpiRjZ6dXMyWmM5Uk9k?=
 =?utf-8?B?RG5lUitLdy9TaE9XR3F3VW5oVVhtS1VYUUZId3c1bkNkUFV4UncvTkdFb2Rz?=
 =?utf-8?B?SHA0cFYwQUNtS0ZyZFlzcjRUTEpkRmRPVDR6WS8rY1NyVjVlZzlCZ1RWM2Ey?=
 =?utf-8?B?T3JieFk0di9VcnZBUU9mS3FjTUsvRnpmWUJIazRDWmg1amZlb0hiQjkvVUxz?=
 =?utf-8?B?QWloaXRUT3I5UGcxWjZYbjJzSXhIMzFRWUE5bE1BUzNSZXB2ZEhqbVFBaHpZ?=
 =?utf-8?B?WnRNTGlmWUVvMVJacnR4ZEtOM09KTlJKRG1mblg4ZnhFSUx3b2hxOG1ndWxx?=
 =?utf-8?B?MC8ySTZ1MU1yeUtWS0NzYno2dWpveWtXUDIwdFgzQVdGS0ZTcVNXcE55N3V3?=
 =?utf-8?B?RGxRUjVKSytMUWZXYndNeTFQOWxJdUpOYlo1aWdkOW5QVVBHT0lFeWRtS1VZ?=
 =?utf-8?B?US94YmlaSFI2d0FPTVh4Ny9RelB4dzJBQWdHNmtDS3hzTW9TTzhUaWp4ZHdS?=
 =?utf-8?B?MWV0b2k3ckc0RHNURkJJTVVTamYwWG5IU1hOakc1YlUrKzJ1WWZkdW9Lbzl3?=
 =?utf-8?B?NUFkSnpZNWNkKzVxZVFzZ1BzRUU1bjVzTWxaUmhsdnRDb2JpeGRDU0x0RUxP?=
 =?utf-8?B?TFVkR3UyY2xPM1g1c3Vzbk0xczc3T0VOcVZmK1E4SVhMZjRqS3llUW93ZFZM?=
 =?utf-8?B?OWYwS3BzZnQ1UnRQbVVXVzUwTnA1VTVmSUR5RUROT0dwenE2eHpqMi9DTG55?=
 =?utf-8?B?SnAxZ3V2N0lpWkdvVGM5RWU3bUxNREY2eDBoV2hacXFHWHBsRVR0TzMwSGZl?=
 =?utf-8?B?OFhRZk4zL0hhbmdDQm8xZEZ6c2g4L0cxSWZuUXROczROaExQMUQ0eW9FN3Rr?=
 =?utf-8?B?TDZYWXVHVytXK29sVHJPQWtFUnFheXZheEpHK3UwdlZRYkVZK2NiUzBlS0kx?=
 =?utf-8?Q?lWmMWNSGDBeYm4i1SuD4rLs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6e1a75-036d-4a20-db66-08d9fce99908
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 07:44:07.9865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9oyrF3YVWpox2XOu2fu/N4g9ihw3MKPZYBPiP5wo/8iQeVzj+lu1kGG6EypjMFR7WTdMvJMewfsO+k6qzDhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4207

On 02.03.2022 23:11, Andrew Cooper wrote:
> This makes it behave slightly more like a regular boolean option.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Slightly RFC, because there is no easy way of making the opposite "normal
> boolean" case work for no-vpmu.

There's nothing to do to make this work afaict: Generic command line
handling converts "no-<option>" to "<option>=no" for custom params.

Jan


