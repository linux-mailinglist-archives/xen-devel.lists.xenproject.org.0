Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B24B51D9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272253.467020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbYP-00081D-N0; Mon, 14 Feb 2022 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272253.467020; Mon, 14 Feb 2022 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbYP-0007zO-Jh; Mon, 14 Feb 2022 13:38:09 +0000
Received: by outflank-mailman (input) for mailman id 272253;
 Mon, 14 Feb 2022 13:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbYN-0007zI-UG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:38:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573224e2-8d9b-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:38:06 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-usdHW8q0OfKHMs0ImxtQAA-1; Mon, 14 Feb 2022 14:38:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6036.eurprd04.prod.outlook.com (2603:10a6:208:146::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:38:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:38:03 +0000
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
X-Inumbo-ID: 573224e2-8d9b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644845886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3f2t+XhwEtN4J8hpx0P3ybYg15Md7WRWj+4V2dsWfU=;
	b=DvtsuS4tBp1Xtu6+FOFbYeFqtz5SAj10lQEQROaOPCW2FinTujDl/eqWJMpTWzH5PockYO
	/uKp5EzxvwrVcinyeCBbJRPOJqFDdILiQj9crpfnmShUw97EawyaFWDl/dBxCnpLvQhGvM
	mRB19RWB3pFMJRP7syFVac2seNKoUn8=
X-MC-Unique: usdHW8q0OfKHMs0ImxtQAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egDAskVMfwBh1VfTdNfd/ISMgSxp4oJbxOkyqlmNHchTipJMEZ5scmsU7/8wNq5xtw7C7c7iCm2YSstCFLLiuO7mucrFIvEJZE8T7lvqyp3Bn0ZnSmSTD6Y4F/nPEBuB/+caEIA6DcXx1/wOA09DS0iA/qUTdk6xwC7ziiMP+Ks2fjAR8npH3QCudkJF4M6yOQNz/cZyN3zZxdhckUE5YFWHm5Le2ADor2IXQO07Uo487s4JK70B068sCk/QoGrdRvRZGyVGUb+ITSJz3qhKveHIadjoBqNl1xT2y6ajDvLOFfS1T2v9MJ1jEvuLZQ6KWOAs+FqCgPN2/PMHI+JKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3f2t+XhwEtN4J8hpx0P3ybYg15Md7WRWj+4V2dsWfU=;
 b=Tj/RlJuXMxTELeC5Sa6YBDMEDTgq18M2cXZVx5TkQfz0KiI7SepEhqZ6ASfMkzDXSpwTXIeMTg4Vs4CzLYRHQft/wVIblE0T6U9Unxb/67GmuYpMihkiNhsCi428fxAOaT5C1Q/Eeuwqs+Rak08cM4iE1UZd4gY+bN+MQ1EoXsNtwRVbuYDXVcCp9gqu1WqNdLTVGyrzpnHxy8A10UeOJXTB598Ii/p6RCWn2ThPraHZgupaVIYX7/roTeq+8CmESBBZU/aGcMVlgWwLQMiGOP0lzJpOveYANCZX4bWw8I2fqUyXyeFVrgIqa7WzXDYVwBsydpS/nfH/Z9o4QX0V+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
Date: Mon, 14 Feb 2022 14:38:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 34/70] x86/emul: CFI hardening
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-35-andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-35-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 217ba6f6-0b3d-47d4-7e4d-08d9efbf3995
X-MS-TrafficTypeDiagnostic: AM0PR04MB6036:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6036C9680C78A10B332C2C3EB3339@AM0PR04MB6036.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P87r0dfWyyO8nG8uuRIVHxbrbJMafKVmhJwarLGYGS8F7N/gY04FXvT8l+D9hF+oVKM1LBS5JqST/Ocs4fUeDPKmly1SeXidb06SG3gYGBsL3GpNRbbdzsdtnsbh1pW2khhL6h2RBu2SegRCR5NPRVINa2OGFnGiYEpBrSnT0oz3+LjbnNEq3/fXK/ITDx+gPQzBBGPkMFaFz6m+ns7WX/dAD5FHtbkJGIWutfgw8yfgS5KXe6P7+tJtM+nvMg5VJjhanwAtYWVgRqwoHkX160jOcnDTCvGWD38h61WKRFB2ayMhjQORoatxoybcow8VM9rmxbpMk427/BilV/hqUcIc776F6dNHuUbaLz30EGZfJdgMzjee7NKuYT/0rVMM8uxGZCIhPu9MM8JfQdLEyR9cIeWPGDGqDj9xCjEJ4pDYYpclywruwYlxCW6HVzPPRlR4GmSe+7XZRavX8yy19nP4r5JOvF0Xexwj03xEzzI/G8WXJ2GaNTK9kCxIO/mihUz8BWLY3rdanxcQZafxpHDH9/xrEEZ5mjOLnuytQbYjBb59pgjGBVDKmKzHtoY1yULwzmPG3Tres0vSMjCsVPI6N2pNfpZAr51mYbkp1oxf62L27CE2UWfb9i1u0Jp3B//iP3h4ULUm85W+igvoTgtWUHfkI4/DQmdm/WLFqIk2LbEqyFXDuKczKYWLr10s7KeH/mf2dBAdMoXBcj6zUPtzKzwCGPVqJkqxPYeLgaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(4326008)(66476007)(8936002)(2616005)(8676002)(2906002)(53546011)(38100700002)(6506007)(6512007)(5660300002)(4744005)(6916009)(186003)(26005)(31696002)(36756003)(6486002)(31686004)(86362001)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEw1ODgyOFZmeEp3VC9TbGNOOE5SYm0rcGNEalNnRW5Jc1NTaEx0RVp4UXQ0?=
 =?utf-8?B?b1JTd0ZLckk3S0had0ZGNEs0TDFJVUJFMjlDVm40cjUwTG1GVnluUGxvUHNt?=
 =?utf-8?B?WVl0ODN3V3Q3Mk1EUTE5MHdFcjNZSk5GVTJ6STI0TWhHUlA4bThPMVJGK3Fh?=
 =?utf-8?B?Qi9mdDlPTmdHeXRsQUIxY0lqMURCWXJLeWJOT0U3b2VEc2N5cE85eWErVU1K?=
 =?utf-8?B?YUY4SlZsdzRjUGg2MVM4UTBteU12ZDZWQlk1WE8zc1ROQmdtQWlnU1ZPdGlK?=
 =?utf-8?B?VlM5d09KSldwdElyODJuZndRenZKTnA4cG0zQ0FJeHBwL3RxUUpmRG5EUEVQ?=
 =?utf-8?B?di9UaklxOWhDSmluMFdwTmFWVHNKKzFoUXMrOTNNMEJLcGFIUzVmNW4ra0ln?=
 =?utf-8?B?aFJ0UGhUbkoxZEdOenNOdTNMcVc1bjk2NVZDaUZ2dlJ0MmFMa1FGSEJJMXVn?=
 =?utf-8?B?REtXY1FyVjQ1RDh5NTJjU1hwNDhrSG0xQkpBTXpQZzA4d1pXQTZaNzRsVUdI?=
 =?utf-8?B?YlB1MjBaMDA5UXZtakxUWXVWNnhKUnhDQ3AwU25DdkpxeVVnUkpkSVRDZ1Ji?=
 =?utf-8?B?THlPVWtHK20xRXhBZDM2SWdiaWtKMEt0WWswOHk5SStzQys0bExFTlgvVW9y?=
 =?utf-8?B?MUY0OHFENFJzRzV1V3g3YkpEcVhScmVhVTd1WElLVmFYZnpnWVNUMDZhZ2FO?=
 =?utf-8?B?aUNFNUJ1eGdXbk9lZlU4TzFST3ZVV0FJc05OekFIZ21xeXpBY3FZMHRkNHBZ?=
 =?utf-8?B?aGt0R2ZHaFVHTjhvT2lLVEloc2ZWUTFVazNQbkh5d2lGZ2JnZE9GRDZUbDRo?=
 =?utf-8?B?NVNuKzhwZ0pRL3Q2Uit3UmczRVhSNFJWdUpaMDFnQTVqaW03T2M4ckdBbVpH?=
 =?utf-8?B?aVV3UktNWWhCVWxtaGxmNzdGbWtieGxTRzErZ3ZDdWdDRXlwUlphWUFmMDFl?=
 =?utf-8?B?MHhnaW44aHM5WVpzdFhWMTQ3YU5ueU8wVXhVK05TOEkzM2tzc3pKeExweWU4?=
 =?utf-8?B?Sk9ZWDkwWTd5TGV4eGsvWkJCdXJ2TUhVemtxRkdEdUFPT2R4YjI0RlIxVkht?=
 =?utf-8?B?WUhtT0dJN3JmVFBHQ2FxYUprYzNJdnNZZXZ2QkNzZFZhK3h0aHlLUDRIUkhj?=
 =?utf-8?B?NnhtbDFGOTZCR01LYU9YdGJUREtkc2JIQ2RMa2RMZkNHOUo5UnlEc2JKRk5K?=
 =?utf-8?B?c1ZQOHE2a2FrQnJWWjc0S0NyTW1qa1dtUldxUytPVjR2NUNTVXpYVVZqbGNs?=
 =?utf-8?B?SkoyWGpOc0h6STZCRkVqZjRNVFlhN01LRXBVOWs0OWlOR3pBc05ybDYxeEpY?=
 =?utf-8?B?NXM1QythT2x3Zy8xdXV3T1JON2EvRU4vYXZ6R2JxOXJ4Rk5wN3ZKZ1BzQVJY?=
 =?utf-8?B?WmdJR1A0dGhhdFh0YW1DM25pZU1FNEVJKytyRHpZZnEzTkF1V3VwNVJBbnRH?=
 =?utf-8?B?UEhXdHVoWHFiR0ZVQmszeXM4Tkl4bDRzSVFXdkRKeHBkc3pMWG5MWWhkbGIv?=
 =?utf-8?B?VENVKzJTMFV4MjJXQ2Fyc3BOQzFqS2ZIVjBBeVZ6ZGhpbnp1NlBCT1E0UmxY?=
 =?utf-8?B?Sjc1bzhtTGNRd3RnTGtCVUdSUk1EbUQwZXVuS2VJVGdKdWEzRE1GZEhBTjNH?=
 =?utf-8?B?Ky84MVJpa2VucUEyQlRxZVp5YVdRTXllQmJQZi80aWJCcGRHbWNybGhGZWVB?=
 =?utf-8?B?MVlBZXhGSzUvODRkb0kvQ3YwZis2eURmSVlyekMzZ1JzeVZ1a2t0YXh6L0Np?=
 =?utf-8?B?eVljWFVDbDd1WG1JbXlhZ3ZMKy9CdW5OdGtGUnlkUEdzQm9YQkhKNXhWdnlT?=
 =?utf-8?B?WlRaK0xxdWM1QVJ3QjRnZ0dpMjk4TE5namdQaHR6N3hPcEdGK1NCTXBXSFhW?=
 =?utf-8?B?YUliMUVMeVlkK3hFYlZ6ZlRESlcxeXNYdkZwZXNmLzdBNDRjRTNNZEVmTnh6?=
 =?utf-8?B?MDArdUVIY3VhUDBHYm9FZWNaN0RRNzFlTHVvaGR6L1E2SWJoOUh5STJIb2Na?=
 =?utf-8?B?TnExZ0tabjdXODcwQnVsR09tVThQdnBhRVpGeFMzQ1Q5dU01SjZsOWgrR1Ur?=
 =?utf-8?B?cU56UWZDY2xVMHJqcHVkK3pBZXJYN01YcERJSlFvdmplUExsTDM3aERISThv?=
 =?utf-8?B?Q2xaeFB2RnZmRndFVnRhMmZVa25pay9ndk5JM21aQ01XUk43MWhDSUY2T05M?=
 =?utf-8?Q?2E+fSxPsm6B42CZeiR1A4Vg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217ba6f6-0b3d-47d4-7e4d-08d9efbf3995
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:38:03.5557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPTS6Ioc3jOJ0VvcMZjo1jVZyX/rhHIXvN27uEfUpzWLGEcQifCV3+jKKNdMEVGc1cmNir3zocNCL21+Cc4Ftw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6036

On 14.02.2022 13:50, Andrew Cooper wrote:
> Control Flow Integrity schemes use toolchain and optionally hardware support
> to help protect against call/jump/return oriented programming attacks.
> 
> Use cf_check to annotate function pointer targets for the toolchain.
> 
> pv_emul_is_mem_write() is only used in a single file.  Having it as a static
> inline is pointless because it can't be inlined to begin with.

I'd like you to consider to re-word this: It being static inline was for
the case of there appearing a 2nd user. I don't view such as pointless.

Jan


