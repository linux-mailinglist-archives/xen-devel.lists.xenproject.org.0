Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065749D020
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261044.451576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClcB-0003oK-IN; Wed, 26 Jan 2022 16:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261044.451576; Wed, 26 Jan 2022 16:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClcB-0003mS-EW; Wed, 26 Jan 2022 16:57:47 +0000
Received: by outflank-mailman (input) for mailman id 261044;
 Wed, 26 Jan 2022 16:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nClcA-0003mM-8D
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:57:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 152d078d-7ec9-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 17:57:45 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-12CpTF2XOCW6dl48uqZQSQ-1; Wed, 26 Jan 2022 17:57:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:57:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:57:42 +0000
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
X-Inumbo-ID: 152d078d-7ec9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643216265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxbyjWi9KmySIm/kbMqSMYbFAQAJeCxR43U3kmXX1l4=;
	b=CTdFeMssPijEWuVY10ysX1B1VeYpyKwV3vUPktHlJySKd4e4i+DcMqE9jjs9O3Yb7abYba
	f2CKcVLIPggeuQ0IEgj9lM8VNj1PjNQEohPD7yWQTIggZJ4Jc61EoUaPpzSWQRRZN7pTym
	gCDzfOktlm7h/HDBevaGMy0pHjbwYuY=
X-MC-Unique: 12CpTF2XOCW6dl48uqZQSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyVLO6PHST3VAao2/6KLmUR8i76rEAA9EtT+G9VjXjp/WLEtqE6fABYyPeVSz/2V+0rrm42LjBO9KnGSHkars9B45OcLklN7IyZuirItjLVwdMKLFOuhYIfuHfieItJhxQXglpwv9b6hro4vitlDwIK4MAt0a9ziI9xfePVYH1Mu9zKfjzFl2b9h9y9birfxgcfYh+UH/dtqEnza7Up2Mc4RbuK5Y0EF5JeHgIiSry1yB5olQpSjw+SszxoTrcZD5rAwhx0JlON+uUk9QhLx//0bbluh7xvBxO40bERl5FFqD2BpV0bKdswMwMD1Skq97Z9D3lJG2VqCdXYbxxXA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxbyjWi9KmySIm/kbMqSMYbFAQAJeCxR43U3kmXX1l4=;
 b=m4qkC91Qk/PMEghwRGNHs0nwmflE89YVBjrB5FrKkFIxHu1QdJcsF9dYw7VhUnzAnVkQOT4Y4Fd/SmmDnU3VqdYroe6jyh+H1RVMHHp4WizNveYZJhOqiVvz+4EBg3PaXz/VsU2rRulFasW9VqLWMt8t60Qowlbo06sI1j+4xylsIn3DesZ8/8AkP0PCSIscPyYhsFsXlsXCIPHIAhZEuqRqNC86RL3ZJny7bSdmR0fm9FGcJIKZElWKT5U8y0KYrSZfaKoMWddJcvoIRmm49yXCOL7qx33DzIB5YVbArS8N9UEgj81lWvXze5LPs+sPt5uuzSsPdV+uDEeY2qC4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d7b4f86-7f2e-7c2e-c3fb-94f97ee1c646@suse.com>
Date: Wed, 26 Jan 2022 17:57:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/8] x86/spec-ctrl: Introduce new has_spec_ctrl boolean
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877f2ccf-ba1f-4ea3-88d0-08d9e0ecf7c9
X-MS-TrafficTypeDiagnostic: PR3PR04MB7339:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB733976D91B1321F7A0F75E1CB3209@PR3PR04MB7339.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WzkIYtgPG7Per7tAN0c9XObd6j9hNx7dPDYX3csD4qTH17zqdoIeysfJn0SXezJLoCNpEEWu6qZrzFAm9z73Np0yhE+mFN24HqOhI2slm1V8RapALl1gEGdalVYhArPLWDHgI0yIIElOFr3kLDuIMrZDrTu2VnLWECss5dxy9fPpJxFoxFSU1Y4iNSSsBy/5gg41GBpk+t8oq4T8vdeD6lMFu4MsQQBc0ZGV729Fvyh6Wbn3CShkFxBs4xn/2ZbD5NynBnfE2zYtEajN6wSBH64z6nCLktRPUx1FkprQkVzo2CM2COWNzwLVhpHlqy1525WCXUEGKBoDyEb4eLoX4RMEKsJsaFefZPkXq71M/JXKVtJz8UvXccKWKjdgsTQRTZtmLjeydWthLqOh78jONtzqeOqbDijQmBq0tKRXVYtfegSe0nST/LGlKSC3qEX58POsFPakly64a/I1RE34rHBLUXj7cSP5y4d42RSe1xW9eI8tixN9eeTUqKK0Jp75UJDFM0JLSM0dFlw9pb3QGmug84Bv+FBgcY+22CWrYjUEY4uphakyg0g+tsEGRnQjYWHlxeSjqOJV7j1CLylZj/7fh6NPuVx+pg+s81vWfK8Qxv/f1LlVV0kEDRsnXJNu3DD3EBpI8dlPGUKV7APofdhKCaMy25OILN/bWB5TN/VFlrSPG4bsZdnJkyQn0ydpwF6FtJEqqfvj0QzCqNuk8sSyNvnXPMXPwWKJTY6s7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(186003)(26005)(36756003)(316002)(6916009)(66556008)(31686004)(6486002)(2616005)(66946007)(54906003)(66476007)(5660300002)(4744005)(53546011)(6512007)(6506007)(86362001)(4326008)(8676002)(8936002)(38100700002)(31696002)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpldUJNSlcwZFZYemsyS0U1eFphSytQaFhUVFB0eDdIMnRjSWgxajBnNVFs?=
 =?utf-8?B?b0FXSGVodnYveE5tRm5jZzVVRFgyQUd5ODZZK05sL0VoT3RDRG5NbUh6Tm5o?=
 =?utf-8?B?TFVsb2ZSalMrMHpGUnJiUVlXZGduclBRb1RPMDAreHo3a01Jc3NBeVhFSVVj?=
 =?utf-8?B?UUtHYTllelpzMDYzenFkclloYWlMYXNsZi9DdGQ2dUtuWGtTOENSMHpHTnNu?=
 =?utf-8?B?cEZEUEFqU3A4Y0ZBVkZlUVVrUXdIV2N1QURiVkVXRHNhcjNzaGdlQ0J6dGJP?=
 =?utf-8?B?dkg4RmxBa2VKZXZyMVZYNDdQT0gybXNPUlNsS0VVM2UxdXJjY2V2cjU2Umpm?=
 =?utf-8?B?RGVGUmdtVzNCSWNDb0lHZ1N5Y0d5eTdvNTA3NXZwQWYyRktNSC8rZ0prL2M0?=
 =?utf-8?B?VW12RFoxUzRYTzA3b3dkQ0lod0J3Z1FJcEFxdUZ6dWRkLzlLY2JvVW0wbURU?=
 =?utf-8?B?VVNNZlhGcEZyMm81VENBUHNjTHIxSVJxS1VRVzJKZUgvOFp3eHpienNlU2d3?=
 =?utf-8?B?SCtuWHlTWDg5ZlpIYTJTNjEyMmU4bDc1QWdKOEQxQVdlMzJjRmxNUnFIM0hV?=
 =?utf-8?B?NnRjV0ZZUUFVQWZNZTFnRmNyZlFWZzAvM1JKbnVoeUExT1dyRHNhemFITFU3?=
 =?utf-8?B?OEZ5MVJXZER2cjM5VDRUR051OTNhQVRSR016Y2JlVllEV3lKczlDSUVBTGZH?=
 =?utf-8?B?cGkxMXlhOEt1NmZWNXVpL01jeVZXbjczcmVMTUtoTEJ0Qm81NC9uRFpFcytC?=
 =?utf-8?B?Zm1penl6RTF2Ry9Dc3BkY01KR0xXdUV6b0hPbXlvQSttdUc1YUpOYmhBekJJ?=
 =?utf-8?B?bElLVGhsdlB5U2JucXJRZVg0UUhWL1k3bE83SEdDdXlFS2JJOVFDTjlDTis5?=
 =?utf-8?B?ZXBma3FnZ25HSkhXTDJLZk02Yjg0enlEN09pMk8wTXRockYwSHBRWlpIVEpn?=
 =?utf-8?B?eTkrakkrUU5XL0ptY3JZSENqY1E5NG13bmpFdU1hVmRLeE1YYjJRVE9NUTZv?=
 =?utf-8?B?cDVmNW84dkJ5czA5eWwxamYvcjliU2JhYnFmcDJvUUJZbnVXYXh4YUFJaTky?=
 =?utf-8?B?WTUyQUJaeDlxK0pZYUE0TWhJa3luRE9sUzd6YTZTQ3B0N2lhRHVjUy9uczVk?=
 =?utf-8?B?UHRsRjYzcXFwN1ltZk5oY3lySmN1M1RRVjJHTlNVMnUvY0lmd2luNmJpNjVT?=
 =?utf-8?B?WFZ2VWVabC82MjJNMzU1UlI5QWFGcVYzRVBzUTJpRGw1RHdWSWsxRmt1VXo2?=
 =?utf-8?B?MW5GamsxdkljTHBocUZFTHVoS1VubHMxaXhHdEY5MlppSHArSUZER1pVd2E3?=
 =?utf-8?B?WHkxNVVXbHBpeEJ1dzFKOWJDcDM5M0RNdG1zLzIxZXc5M010RmVpVXVraWNh?=
 =?utf-8?B?SmFIREpmZXIzL1hqN3RZdlZJV1VWZWc2eGNORnV2aVBNak90aEFaM0wzYlFZ?=
 =?utf-8?B?Zks5UGNsQ2orYUEzL0tBNXdhOUM2cCtUQ2R5NTVmYjcrS3dRU3NlQmczN2N1?=
 =?utf-8?B?c1l2dFBzZG5NQlowUy80SHVOem5OdlJtNmJGeW1UV0JPUWRzeTUxSzR3NVhx?=
 =?utf-8?B?YnNFNGE5MFZweHMrMDM5ckdGaEZDVDZndmR0MC9SZFhEd2toTkpQaWdTNUsr?=
 =?utf-8?B?TFZvM09pZzZyT1dTV3pSamhNSXVpeXU4QktmNW5CdHJaWXhRL3ZFKzVQdEJy?=
 =?utf-8?B?VG83S1BUd2lUdkNCQWEzYXRuN25NWksyQzBSSlN2WG1sb1Z5ZXB5MVFJemFK?=
 =?utf-8?B?S3lWRFVrUE9adEt5MXMvRzkwOU1rTlBKZXBDTmp3Um4rMXJoSWhqMG0vSTJD?=
 =?utf-8?B?OFgrVFBPSk5lS3NEbXpESmVWRmxrelVFS3FjV281QjZTY2h2cTN0bXJiRGRB?=
 =?utf-8?B?NklubGw1WmJ0OWtBWUdReU84Z3plSXpjWGdacXVtNEYrb25nbEI4cmZiTlFm?=
 =?utf-8?B?MmFRcGpGbjJRbzVpSTkrWDV4NXVFdFNPaWhJdHg3Tm4yb3M3U3BaYURuQUlW?=
 =?utf-8?B?SEFJanBsd1orb0NVNFNySndZNE01U3p3S2l1bThNZ1BaSGpiTmo1U2tJcnZS?=
 =?utf-8?B?UUU0Rmt1dDgxSGNheWNIVU1wS0pYQXppbER1YWRrMTFYR3lHVGNJOHg1OEhp?=
 =?utf-8?B?azhQVDRpYk1mOXZqWXNuZGxnQTBpUWZqNlFMWU5tV1FjVGZZalNtaVpxVGZY?=
 =?utf-8?Q?GC28f+vNM/lDjphxhbrqvOc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877f2ccf-ba1f-4ea3-88d0-08d9e0ecf7c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:57:42.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y5W/1t6jAoCtIPiquVNNVu2yOX440334gIO0qn7/aP4qYe2nG0v4qkWTyuUZuPFfcjLoAUNomM6Ymq41BOl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

On 26.01.2022 09:44, Andrew Cooper wrote:
> Most MSR_SPEC_CTRL setup will be common between Intel and AMD.  Instead of
> opencoding an OR of two features everywhere, introduce has_spec_ctrl instead.
> 
> Reword the comment above the Intel specific alternatives block to highlight
> that it is Intel specific, and pull the setting of default_xen_spec_ctrl.IBRS
> out because it will want to be common.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


