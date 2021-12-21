Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF89647BF94
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 13:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250378.431257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mze6W-0001FJ-3K; Tue, 21 Dec 2021 12:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250378.431257; Tue, 21 Dec 2021 12:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mze6W-0001DE-0D; Tue, 21 Dec 2021 12:18:52 +0000
Received: by outflank-mailman (input) for mailman id 250378;
 Tue, 21 Dec 2021 12:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mze6U-0001D6-VA
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 12:18:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27161eee-6258-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 13:18:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-K-qtQKeaOnebVwRqn9kg_A-2; Tue, 21 Dec 2021 13:18:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 12:18:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 12:18:46 +0000
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
X-Inumbo-ID: 27161eee-6258-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640089129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdBbRZZQfXXmFEzaqnGHC1rJTLtD1hXilMc6SU9ezdE=;
	b=PCxOgACzpaHlztTP6AdE3E0WaALa/b9LGYncY+K6Hm4EUyv+pVRnN4x9i1QZI+fdT4g947
	U+0nP+DT1p3uE02Vqi/8BlhQrngS9+Tp7ezae/h5t6dXBYGmV+nVjiT3YHo79kJUv+mFtD
	BqEXEMIjJShwVsr4dHIbQZRVoQp4KcQ=
X-MC-Unique: K-qtQKeaOnebVwRqn9kg_A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUQWKBKA2xDHCa1+cfW+jqXi+15VWK0p/wtoyTWre2JYxN1ctX0Xv2cx/PWP76UCcJoOnQo01YRvPsFSq1oKmcHl0uTYnvxLOcGUl8D3O6OIfRF9RJm4WboR+f09kxxf1V8YtIGXwbUNZYNVyGwoj8HcyA/YYt5IRyDb05iNRK4/Lv1VinIjkfSoCjbAuRj1CqZ1pivfsPWuowT7RfzRun1meHXcnfi7gLYnQEgWxL7ViquElEJYOJjv2it6pfUvI2VKgquS/0HkQSQu0NuMCvb57o8BO3K+d0TT6FXJOlJXXs4yYRbUAhXM3qY2aVVnTXdb1OKYdYyZdgLnoNeVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdBbRZZQfXXmFEzaqnGHC1rJTLtD1hXilMc6SU9ezdE=;
 b=G1lqT/TWWYS2fO24EYM+j0kCgzwzAny5ZvtYh8kztaXxvRI5yKbUR/QahYgIyWSW3qjP6ggVbXS6qhzez7fUCnUsAATzCY2/3tardAndWV0YRZb07s2v9vcizalASVkGT2JVaOe+CFneD1Is9Hvda6nzpgHreqwuMhbcdQGs4RF/dao4VYi/ahsnBAH1Jm85VLymZ0No0QdHwcJsb0zQF4h5JWiHLS4shxEkASuGtsQWELlU3YFEE0hYyNr+UxfxW8tVSdqghpDUTRC91Lv2l8ibx12PgUcdA/TdRRq0CGL18/SfYhdixFo7E+DdkMXG+wsPoNRZqX6QshOhBUW6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8d01f45-fc80-0908-99c5-454991a9209e@suse.com>
Date: Tue, 21 Dec 2021 13:18:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/6] x86/hvm: Support PKS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0393.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49feeda7-4156-4415-7e3a-08d9c47c095a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70370D527430435562DE08F6B37C9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Z27vyTOcdjsrcbnqY6upP1ym/VvB2RJu5oHqwDTDWXURjTykM8uoMY4DlTR9l51gXVME+ouX44CRSa25s8CHHYurxnL2k5pqPBAY3P7xbw6Re/p36E+6jUG+nuFO1Oe7vXR6DDhGvL929i2KR4m5hycEtk3pOcLnd8lQYNJLynrJ3j+qICwlc8T86DiduDQkx6fFFYHUrowjq8OK57E8KQ6D+T1v53YxeEq8eRPAFkVFuZaaGrVLvkXUu8mvYragwgVEsd/KzxkUhduUJwXdFWWUwuxwzCqcS03C+aHZ6R1KdGNLlJj5UWI6a1rvtpPAnbceIGssOl3QmpE8n+EZlko42+hW69jntIGU2Hr6ZlHJKJF5z/Umb+cXXWVutJXIgDtdX0JM/BGHLni4Wx9wguzKUgH8fFRi7zz7qVfdwlmoadptZTlSo5MqYqAekUzAlLSqo9t74NtWK4A//TdxvNNj+qLogQ4EywheFJmTq77A6/cYmBLmWfK+dQaeilH/tAs+W7v7pAIYMJ2SDCcIn8t4CuksEtIWtR+rGRnLQSUbXH1aA/dkzsYDVaWiUgLJ/xhvNhXcCjQEuALWHyJbobTh1a5sfOl79igrGy5v42WxLq+wVHK66HumTVUqqYIjsI3cuT/qacvCOTQvzUbW/ZDjwI+KFPYxAWsZbwntvw8LHX47owS7xAJpeY14c1uVXvC6LAiDjMGIP9d17QGiT+s3J1wdSCLqOqTZgZ90z8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(66946007)(86362001)(8676002)(38100700002)(4326008)(186003)(66476007)(2616005)(6486002)(26005)(6512007)(53546011)(54906003)(6916009)(36756003)(31696002)(6506007)(508600001)(8936002)(31686004)(2906002)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEszbmo1eCsyeThjNkFmcnUybDNrc00rejJIb01jNTB5OXYxSXdscDJvNHhY?=
 =?utf-8?B?YXdWczBxZE1IY1QwbXhsTnVKVzFKTVpMSzJXT3kwYnk2T1hwYjkxam1sM2xy?=
 =?utf-8?B?SzFOaFJBVFg1RHpFTFAvV0JEMWRwUGtDMENNZS9sZERyZ0dHaktPRCt0SUJa?=
 =?utf-8?B?VW03SmRzNWViUDN6eVVnS1c2OWRlc29ibFY0UVFyWDdEU0ZNcU1Gd0NDd1VY?=
 =?utf-8?B?bkphSExHdkJkeHQwaWZTVmtUQjE3Yi95MFBvQlR5Z2FOSHlRMEFnWkZ3bHpo?=
 =?utf-8?B?RUpMMklTdGl2a1B5UVkzYjMxMDl6clBPN1h5Y0xQVUNjajhVWTNMVi80OW9q?=
 =?utf-8?B?c1RiWXhCNXFyNFAzR2xkWEFHOHRSYkUrMEJRRldQTGRqZHBiSTRvckFvc3VL?=
 =?utf-8?B?d0V6MHpIZlBoS2JjdjFNQWtvbU1Gemd0THdVQ1FocERPOWR2ekVnTzFHUXVS?=
 =?utf-8?B?bGZQODgvTlFWWjRJOXpETzc2UlYxVC9zNnM4dzRGZlNLZVl5Ymt5QWNZQStQ?=
 =?utf-8?B?dGVlTm1ZSHRRWjdRdHlqbmJsK0dwemI1WmhzakVCeElmR0U1YVM3NzY2bjdx?=
 =?utf-8?B?U1ZhVnoveDBTSDczT2dhdEF0dWE0bG1ka3lQTmZxbFpoVlQvUVExZWQ3OVdU?=
 =?utf-8?B?NW0zWDNIdUFuc2RndFBSc0wvNjVJejdtL3lsNlp0YlY2OEE4R3ZzR0NoLzNj?=
 =?utf-8?B?bE5Yb1pqWlNnT3NWUnhBM1UrS0FIeW9VbHQxYWhJaFhTazBnV2lLK25VZEFu?=
 =?utf-8?B?TENxYlFtcnR1a0pZK28xTVE0VmJVQmllNzJneHNZV0FFbHNFRGFnazY0c083?=
 =?utf-8?B?eVEzM3RkQWdjaDgrc1RqU2cwNmV5emtsL01NRlh6c1BGbDcrc2FYVkFnUW5h?=
 =?utf-8?B?bEVsaFVRYzRuazFFbG1sT2t0cENtY3VKNnFSSU15Z3A0ZXp1OWQ3cGlBUGo2?=
 =?utf-8?B?bnRvMVpaU1VCNHZocTNTVk56Y1MwL2NNSU5GMlAzcmtWNjNVenc2RlRiSWl3?=
 =?utf-8?B?M096YlBWbjAzT3JLTzhVTWRVMFJTaWFpLy9HQ0MxWURxcHZ3N0lEZW4xdk5N?=
 =?utf-8?B?S29WQjFwOUlqbzFqcUl5bXZJbllkWGRFUDcrQ1BUNmFEQVZqQ2tERVRHOWN3?=
 =?utf-8?B?NzlFVkFiSmtoaHBTdkdEdWM0OWY5eHZ2S01Xb2ljYkVQRkgxSFVhVjUvMFdr?=
 =?utf-8?B?d1NLMTFLTEo3Tm9EVEVhNklCNDh3NXExZE9XYzR5L1ZOUWFqcDRrWVp4alo5?=
 =?utf-8?B?Z05XbTFxTk1mV2t5VGI1MFo4cHJWdmdoMFRwNFRVdXh2b0JoaTdXK2ZQNlQ1?=
 =?utf-8?B?SSs3OGkzS042MjVST2dSYWNDRjBBblNva0swRjZmOTBnN09oSTZOaitVb3Jn?=
 =?utf-8?B?d2labDgvcHRxeWw2bVVHQ3FsN0hDZ0dDTFZNclZwenRmMVZKSjdiYytpdnlW?=
 =?utf-8?B?ZytvSXhUbFVlS3NWU242U0FERTl1Zk5IWmlSM2dBbncwYlJ6dEF4TFArWDRZ?=
 =?utf-8?B?S3BFK0l4d0FuMHhxaXl3S3JYNGlJenVubWtFUFFlRU1QNWRLZXFydUNiRW5U?=
 =?utf-8?B?VlV6MC9oZExHTjRxaURNYkljbXdEek9WSFRmVTUyYnpDV3EwOUY0V3cyb1ly?=
 =?utf-8?B?MDZlQTVBKzgwVXlDLzhObEl0T24vbHdUSVhZc2gzNmhlZnVmOVprVmgxSXJx?=
 =?utf-8?B?b3lXbVdLSDRmVncxSUt2Q0hEOG90djlnUDhpdWdhS1libXNvdmh2ZnMzNU4r?=
 =?utf-8?B?WnFXcUNYSDhCNjJJTERqcHVCSlpkejZYbTh3UjNuZjVkYytSSkRoek1RZERL?=
 =?utf-8?B?QU1OWVRkR0UyK2FlYW1Tai9kRUxiaG1hWGVIOUI0Z3QzU0hWWnJvVTdaTHVw?=
 =?utf-8?B?bjFrWXpicE9NM0ZOTTlTQkkzWmJXaGpqRXhWUFRRWitrdHhGQ2p3ZjRjL1pH?=
 =?utf-8?B?T1EyNEVpL3JRbENNSVRQU0tsY1BEVStNblVkZU5RdUt2SmtvNVZVWGU1WWls?=
 =?utf-8?B?OVZ5Vnd6YjRKbkxvdTJZUUxJenNCTWJGVFh0V0N3cEtDOXBGc3dqMXBMUHlo?=
 =?utf-8?B?SGhKakRwNmZmRGNudW5LaksxL3krTWxwQUQ5alFLL3VJZGF5MktJVXVoSmlk?=
 =?utf-8?B?anE0Tk5KNWl3OWxDTXcwU3ZpMVhGNitSU0dMRDIwelN5U295c0tlMkVxc1Jv?=
 =?utf-8?Q?YTZH5OOphZtuslkFAr2bzE0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49feeda7-4156-4415-7e3a-08d9c47c095a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 12:18:46.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZU/2PpnHWHT7Xe/nwEpks7KdM7dxnXw4YOhT3fDGUdNybTKtI05YQxnlZxzTRfwJ9ByYUtqI2LR5CRb0w+vsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 16.12.2021 10:54, Andrew Cooper wrote:
> With all infrastructure in place, advertise the PKS CPUID bit to guests, and
> let them set CR4.PKS.
> 
> Experiment with a tweak to the layout of hvm_cr4_guest_valid_bits() so future
> additions will be just a single added line.
> 
> The current context switching behaviour is tied to how VT-x works, so leave a
> safety check in the short term.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I would like to ask though that you ...

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -244,7 +244,7 @@ XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
>  XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
>  XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
>  XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
> -XEN_CPUFEATURE(PKS,           6*32+31) /*   Protection Key for Supervisor */
> +XEN_CPUFEATURE(PKS,           6*32+31) /*H  Protection Key for Supervisor */

... clarify this restriction of not covering shadow mode guests by
an adjustment to title or description. Aiui the sole reason for
the restriction is that shadow code doesn't propagate the key bits
from guest to shadow PTEs?

Jan


