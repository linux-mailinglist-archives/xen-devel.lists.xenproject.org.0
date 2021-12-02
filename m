Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE7465EA6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 08:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236335.409968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msgS6-0004Mm-0P; Thu, 02 Dec 2021 07:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236335.409968; Thu, 02 Dec 2021 07:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msgS5-0004Ky-SU; Thu, 02 Dec 2021 07:24:21 +0000
Received: by outflank-mailman (input) for mailman id 236335;
 Thu, 02 Dec 2021 07:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msgS4-0004Ks-8q
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 07:24:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcaacfc9-5340-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 08:24:19 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-mBKoVXJTPLufmJAA7_2L_Q-1; Thu, 02 Dec 2021 08:24:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 07:24:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 07:24:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0368.eurprd06.prod.outlook.com (2603:10a6:20b:460::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Thu, 2 Dec 2021 07:24:16 +0000
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
X-Inumbo-ID: dcaacfc9-5340-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638429858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzxGWKaoW59Od2WpYxt5a7eai2jl7ItmwhCtKOxvhiI=;
	b=dDTQQHrqvKuuS0BJpGUdUt9Dt5tVZbIBa0/SndVBmHPRPspRKUlUkRRItrPLarE7PYAJXY
	6CLCTiIRPEhc+Ilqw/ughkGP6igIgonUN3uHMshU9BUB6Qi+riM9wwieH/uSYK2oP+To2N
	sI2YBZZ1pvY/Bv+DJyhhz5qrEshjsAE=
X-MC-Unique: mBKoVXJTPLufmJAA7_2L_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCc9VQbwNLgYa1LnyZ0X62lqda6fM714DOuLTYCzPGgbs34nBt5RYA0KJ7sgaJc3VklG7laE8kuDJ0WT6xwaXQa5zmHXQ7W62WK4PuFgRd2JjHgidLl/lgOpoLh3ypVFOGmrpNZhKnZOa1Op3/4UQmFmsIV3TPfeTVesn4TNWzM1iAtmUTchCgjcSSYN7bbU4ivz15+OL0cqr1/Lg1t0gEEzhrEcNi8B/0tb0F8QtR2Sv2fmsD5YJoVIrJANCzdvTNbJLItZz0D1MxLro1ORg0USs61zHp8SIa+cBTBza6vUWdF8HMRQUZCYo/CesBDIAF5g4NUZAd6IZCbK5qs6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzxGWKaoW59Od2WpYxt5a7eai2jl7ItmwhCtKOxvhiI=;
 b=oVTmhfszWVafRY6zKJBoV/pNButWmk4VYIZkvRa3/kGGWlbwvH17o9T+8KOKH+UBc7cCVl8T2XnlY1yyT4LnFLt0t/tU7qYj5HEu1zbgewQisv6SxX97TYlQ3T2EKAyY2S+RJ1kaTSVnhSuvoJKOskLIywdEBHQHnVkHmh3/gLV3PSGsYe1veid8Fy2s2X22Jl0+hCGER6s/hKxlm4LtySRQun2SPtQtnOvVGVFuVdXcjRGIZ6u13e7Z4taORaEygC6/hXfACOuMcbpLNk/OTnAP3hbUAZ1ENrGQcGANJzC4caa8T2RNrJhSd0mmGkqTNjDLz+r72qndsRrr05OKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2b76ad4-6221-7e5b-b9d2-625f97167ba3@suse.com>
Date: Thu, 2 Dec 2021 08:24:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <f7a7ce32-f921-ced7-4699-26f907392eb4@suse.com>
 <3dbcb5ed-c776-84d8-92a7-b9d265ef7d7b@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3dbcb5ed-c776-84d8-92a7-b9d265ef7d7b@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0368.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efb13d62-31bb-41c4-94d1-08d9b564bf97
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57429D0B41306203F9900FBFB3699@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X2nqWqrV4SUvI68NXW7WvifGsg3OhnLBDWZyfLQQPqHpFqGcXtiovhUUXPhdc67GfQdwq2WuTb0hgCSZxkmWuYFvLvrWJ+ukYlYYPmbb1duT+tzO0C8NqK9kfSQl1nSqgb4+uw+W85ZYNZaHS57BxDXoOZHhUKcpaC6HOYdh+4uytfms1YiDAbV0kpUeorb7v6YmvEfnChRtC1S4ufSIRXSSY/e195U7X/+BE5JYWLHpRIIdJUNc4s230JKYkx7a8NL8aAZ9Xdf46AVTPptz/oRp2ZLBbMa9NDmruy035pUoLTuM/XJ6NH175aQ0WQlIyXjVnwXyOnl5Fcgf+n/MaL6dmkZUh+ogg+U7YlGlpa5N5MCKwyIAbwM+aHiuJl6cV8woplNBFj3v6W6VUtqW0Yewmh2rLxYNvhZJbALaYT7SmxvLtNgMazVDRkFyVC69ZoSGenzcR/QOKWd7MB3eOBPk8x5cLBxMbE28bFWv21gnCnmiMj5uwOxoGt/5p+XP9iseld9yh5Qrfl4CapiWZiQwDrdg07TiWpcKAHzl3KA7y8tgAC0lWBe2LLCGJZnJYDlCejAGHa3HUuoFqUnSgdHzmpvKn47xOeenOSYYJqCHPcFiowz0W4RD+Dnjg1IuGrffaQN+jnBm4Xt+fN6gTX6QmJCEGvLB/zOTm3YdpafsQOkSK17hAj/Vv3/LA4J/YP3bCcy4Iy+PFeJbyOaFrfXrfdoSY3GoN5Bf1hK8ACk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66476007)(66946007)(8936002)(6486002)(4326008)(31686004)(36756003)(66556008)(31696002)(4744005)(956004)(16576012)(38100700002)(2616005)(508600001)(2906002)(8676002)(316002)(86362001)(53546011)(54906003)(186003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDd3VWtwb1F4akhvT2pkVmFHTkpDV2hWdG1qcWlCT3R3a2dUbE1wd05hcHdP?=
 =?utf-8?B?ZGdsOEFmc2JmOFFRZFNET2NYUlg4aGM5OG1JSFZqTFdaM0xGL2NBYzgrVWFB?=
 =?utf-8?B?Q1JIbEt0eDFlM2ZrdDg1Vm03MEY4czJsMDZRRlVSNHdTUERYYzNMZGJIM2tM?=
 =?utf-8?B?ajVhYlQ3eHcxdy9CT3cyVSt5bkNsTEZOUTdiV3RkTUwzRkJRU28xd3dTQ2I5?=
 =?utf-8?B?ZzFxeGRoVERFekVGK040K2NPcXBEaXljMmF6VHBDeWh6d2p2Vy93TDB1Qitt?=
 =?utf-8?B?a0J0ZG9TL0NGOHg2RG91V1FETk9yazJsY0hkRkg3S1VNR0tGZWpwWklYM0hB?=
 =?utf-8?B?d1pkKzNLaVQ4aURvdXk1MEFhVUF3MWUrTlMyZkIySExsSGJOeGc3YmxhbTVu?=
 =?utf-8?B?M2pNL0laZjZHclhWMUpzanF2OGNJKzA0dGczNFZ3S0t3V0c2OGJoRWc3Y2Nx?=
 =?utf-8?B?QjJSZjdoOGhyVEJVdlZHczBNWmlQbzZrY2tzSzAzQitSenZJQytqZTRvZXVC?=
 =?utf-8?B?MDBOcEVtbXdrcHppQ3k0RW9DT1BwOVlucnF3QzRTTHlLcHY5U3BSb3pnRVdC?=
 =?utf-8?B?N256RW8rdDB6OHEwYTZveDYxTklxSm1IOEVrS0tnM2hEWkVKNm9Mc01RYjRj?=
 =?utf-8?B?N2tOalRBdVM5eXR4UmFrQUNYWGhYYXVUTENNcEtmV2Q5RUFiZEF1RWdaZkpw?=
 =?utf-8?B?bGxVekhpYjRYNFZHMXZNZkFxSTgrenlCQ1ZuRVMxOXhtQzkyRTBhZUo5T3hY?=
 =?utf-8?B?OURKVjRad3ZGVWtBWUUrcGd5ME5lTUk4bm9CQ0xTOTRlUlplVW91dnk4THor?=
 =?utf-8?B?V2lpMW0yUUhvWTkvdmlsSHlrSnFxbk9SSk9nUkdSdnp2UlRsTTdmbURzblU0?=
 =?utf-8?B?b09Fa2FzWGJrNlpFRmc2NUdJNG1ZSS9XRW9zU3ZGbEhDbFNLTlFYeGdyNGI4?=
 =?utf-8?B?SGlza3NmQUtPRXBkcUhYbklJWHpZSUF1NGtTVmljSDY1Mm1WczdUeGRtRWVv?=
 =?utf-8?B?cHN5c3RTemZLWGdjRHEyakovZ3Vhb3AvdEdGQXhKcFI2NWt5S2Y3UTlaUUQ0?=
 =?utf-8?B?WWVhRVNaYjhsU0VGL2dqa0pUcVdVd0k2TCthVitENnhoQXBhanE2Mm0wLzJz?=
 =?utf-8?B?TDB2VHBXZGVWR3JURTFCMDBiRlVHcEpPM0VPQW5nU2NscnJWeXRCZ1NqSFN0?=
 =?utf-8?B?dHVqSDRJQmRaRjdhSE5xTlRTaC9weENONXF6T25ZcnYyVExLWGZyZ0l1RjFP?=
 =?utf-8?B?VUtPUi8ybW5aNmFScWJPY3dJbXVNeHFtUlRIdnd6dEpZeEV4aDM4TkhISHBx?=
 =?utf-8?B?anRhM2lsSnpnL1JITHBzdC90MHNhUXZEK2tLUzZoZDVURmYydkJac0V6YWUx?=
 =?utf-8?B?ZmVUYm5UMmRHalEwNWJCRXY2Q093YkUrYUtJYWdqWUdjRnVKZGRPV1VwVlZK?=
 =?utf-8?B?YTlQYVcxVnNuMUgrbEtURU9EVS9TZ2oxMmRyQytEZ29vMFZFTGU0Q1ZNNWlq?=
 =?utf-8?B?M0JsVzJCbkgrTU1mb2lLZG1oanFseXpaTnpQR1pHSXpDM3R1YzJmWmZjZE04?=
 =?utf-8?B?cVFEZXJTMjc1UTRiSDBzSUV5NDh0SHRMR0ZvcDhYSkkvN0l5WU1PcUIzZzU2?=
 =?utf-8?B?UEU2RWpWcm9SQzQrYUtqUi82RDRTZHQ4eGNsR2ViYmV2Ny9lYVRkaU5SR3g0?=
 =?utf-8?B?Rkl4TWxPeXhQeE1LZ0FQY2NubmNxd000UjFTMzNvdERNcktlVS90c2hIUHFn?=
 =?utf-8?B?MUFFQ0hLSHJzT0srQUVYV1dZam15dlV3SjJvWnN1VXg4WEVHWHQxUkQ2UHJL?=
 =?utf-8?B?aVJmWFZZUTYzMHM4NXVEbjlva1pHdUczVjB5akpCa293dkRTVDE4d2Jxb3lZ?=
 =?utf-8?B?WkpmZy9KaWppejdaaExldlNFZ0F5bTI2QjJXY1IvZDVxYTY3RmxtUHk5enQ2?=
 =?utf-8?B?UkRtWnBnb1g0aWtLRkl4b1ozRHlXWHlwUDArM3ZLcGo2TGRNMGdUWkF0WU1R?=
 =?utf-8?B?Y21veVpvVFBYenZNUzQzZzFPa0VnajU5TVV1VkJ6azhoVVR6QUpRR3huSGoz?=
 =?utf-8?B?ckljamhtUGZNVzN0eElNTno2YktEUmZQUk5yVllzcExJUjBTdjlkVnlnWWZx?=
 =?utf-8?B?NzY3dnhmWk9pY09iRDR0c3pQV0JPN0R5QWpSeEk5cTkxR1U4Q0RCUmEycThG?=
 =?utf-8?Q?RNET2X3zPsmSk2wVb/JVwYI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb13d62-31bb-41c4-94d1-08d9b564bf97
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 07:24:16.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/eM319uPOA9Mi52qWUMgOvFqsKrPJP1Z/5xmOFzy75F1nSYixMO+BgL6q/LY2c8obrjNh7ilP0iKSIYXHykIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 01.12.2021 16:13, Andrew Cooper wrote:
> On 01/12/2021 09:39, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
>>      if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
>>          return 0;
>>  
>> -    group_id = ops->get_device_group_id(seg, bus, devfn);
>> +    group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);
> 
> So I was going to suggest adjusting this to use more pci_sbdf_t, but the
> Intel implementation can fail and return -1.

How are the two aspects related? Wouldn't you mean the parameter of the
function to become pci_sbdf_t? If so, I'd view this as an orthogonal
change. I'll reply to the question of removal on the subthread of patch 4.

Jan


