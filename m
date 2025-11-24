Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA90C80279
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170329.1495391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUXt-0004TE-Oc; Mon, 24 Nov 2025 11:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170329.1495391; Mon, 24 Nov 2025 11:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUXt-0004Qb-Lg; Mon, 24 Nov 2025 11:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1170329;
 Mon, 24 Nov 2025 11:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNUXr-0004QV-U4
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:15:48 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6df1a27-c926-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:15:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6162.namprd03.prod.outlook.com (2603:10b6:610:d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:15:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 11:15:34 +0000
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
X-Inumbo-ID: e6df1a27-c926-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCrg3sKWH80x7+3mf9Za4A3waRGNFdDAI6hmzLkafqLzrSqIYYquE71lnZ54cwfJD8xoLcP8MMZT4Tqsf4aN6L2fG7oxzIsoldmEFBlr+t8yKV3Cj9rW0A0WhaUdtRCLdELFSka7tltcsnVg0Ib56qwKDLcNTNSyU0ZPfxeGt6C4ErqfHY9UyMOIyCNYGx7up8rqpC142WjhgSYkl5Q0jTD5gkF3hTuN7Nt/pLqXCn+h8/zJyZg4nIbCb2mpg1kTgtDV4mTX5M5II5CZdEXeoKDJqXvWf2vscWjvX+IQHGSP2FqouQumWDrIRABCNoU69AkRa2gFMjrS7knAdNxUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1VMGXwL8q20fHmEukd0b6FqWhnTelgtcDyTn1QeEuo=;
 b=T+oKZ2IyQBQ0Z+iEnAzX3fC0FOSbvLrm3BeBtNNSwGH0oNy7iPrW2CWWTH5uf+e9/85bfZVpxehAniOp+Xi0cP2bXUxRAsrIQwV6BA6fqH0CP6L4+hkCnI900VNHBG6KqepZBBCRdZU011UVMNgpoDXQczQxBB5lEj23cKw8L05cyHXqc4gcZaSHEpNrEHBvxuEgpGuHa/0OnOOAdf234QatEA085gyNYEJOV+fljII9bfPH//g7QKH76MFogtXPT2anBEOLLTEa6+tpEbYhCAAS4clu0+CeBfFhqw8EyKn6Y3Yt7ikF/KPkZ5cS7PXFAPElxa7clSqGQh9SqyoKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1VMGXwL8q20fHmEukd0b6FqWhnTelgtcDyTn1QeEuo=;
 b=Pux4pBOm5FhJxXrOXBqC9ldQ25oBQhaql6qoZelTkG9bEZavZxBUtlRhWknyxaabmGvdP99Erc+7vsMFTiXi7CcMefHuzUgx5BU7a1+DMUtCxkzzlFpfgwyUw46/Lgs7T8Bw09749uefqwqhi80MTYSPd9blvbQW79Klka9lrwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com>
Date: Mon, 24 Nov 2025 11:15:31 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: f490802a-3ba2-4e49-437c-08de2b4ac9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzB6Vk1SbGpKdnNyUy84ZyszblIxSzVURm5Pem4vTlhWQlpEMS9RTHhVRmQv?=
 =?utf-8?B?T3d3aWRQWmp2WVpaZGRuYXFSZERJR0NuT1RDbTUyb3luaTkrVFdtMmFWaDJR?=
 =?utf-8?B?Ukxybkt4NnEvMFJ0azZhVnIwQ2R4eGFZcnNvcGtmcGxGbDdaN2JaaXVLTGRo?=
 =?utf-8?B?R1RRam1jdGU0MEtQd0RNbXhLenZYSGt2djgrNnI0SENPODg5UEJaODFsN05Z?=
 =?utf-8?B?SDJvNnJ6S01rdnU1K3FhYzF1citxTnpManNjaDQrWTFaSkR5K05TeXViQ0Ra?=
 =?utf-8?B?S1o3dEF2Y082RzBQcnd3WHNNL2V5ODZKNnNRODhxVjZYZCsrbUVLa09uMGdp?=
 =?utf-8?B?ZUttWTZCZ3NHTWdod3Z2eDlkNDRFZVNXeWRROU5jYjdCVnlLN3l2d2JaN1Zp?=
 =?utf-8?B?OTFYYUVmSU5MbWw0ZmZweXlINEg4eHlYdi9tOVZYRWhVZDhpOTRDMllreUhL?=
 =?utf-8?B?cGN6dWtNRncxblFpQU1zOTV1YktnTUtuRTUwdEEvUHRycG1rYVhKVUtNbjBS?=
 =?utf-8?B?bVVjM2NXMHJrYndlK05YajhuS0lhVjBuSHhhZ050SkpjT0ZHc2pRSWJTa2Zw?=
 =?utf-8?B?T3FwMzBDbFFaamdwcTJlMFdHb2lmZUt3OFNKbCtUMWwxNU9vTFJXZ0xyUXB0?=
 =?utf-8?B?bWpCem5aZVFkR2tmclFpTVFwbzNDNy9JbXIrdWl3MHZaTFF3anFsZWk1VmFU?=
 =?utf-8?B?V3FWRzdUeHloNkZMZTVWZit1ZEtvalNBQzdjRjVsV2hUbTc2ZXR6UktUUUZm?=
 =?utf-8?B?NHZTNytvN2VrYXZkVndFYXUxNVhrYVpPMXpsMmxTelFFdVRLd1M4clU5d3dh?=
 =?utf-8?B?dXRQZW8xN3FjM3N3a0U0UWNCTVZiWHd4bGtaV1I5LzIzQzByWHczL0xXVmpE?=
 =?utf-8?B?K0N1WENxckE0MGNYTFZYVlNRYlJGOFA5a1VoZWE1eDJQNXhEMDZsR2d1RElr?=
 =?utf-8?B?NmwyZlBCZnhqcUg0b05xcVBHQzRQcC9VcEVVVzVFYklSMzFQMUIwcGhXeTRr?=
 =?utf-8?B?UkxjV0VwOHQzS01aVzdhZ0luckx1NXVaUldSazc2R1g5MUxYRCtXZ0dxWXh5?=
 =?utf-8?B?TXo0SDJac2QzZWdhZElJRGYwVHRycDI3eSt5d3FremhOdFFaMmVGOHVXbk5Q?=
 =?utf-8?B?QzR1YnhqOU1LYlhKcEFrTWtmNEZUSHNUaXdCQ1ZIdHZlL2JHUytuQ1hoSjhK?=
 =?utf-8?B?ZGJ2TnI3TXBTcW82MDBsanZGSnhRTWR3THhWRC9NbTNnT3dXTVB2RHBjQnl2?=
 =?utf-8?B?MThKWnpKMGxFdUMvdm83WlJwd2w2MTN6WmN6SHVXRkluRDdXdVZsdUpkQnBI?=
 =?utf-8?B?cWtKb0JLc3FIUXduRWUrZnBNQzZ6ODgyZFNwYlBjUVJ6UFNITFZxVjVHT3hr?=
 =?utf-8?B?UUNjYURtUUlIK3hDYy82WVVEKzVhZ0hVRnVONTBuVUc2aG5LRjNQajFpWGh6?=
 =?utf-8?B?NVprbkdERWpkcDhqbEhPNTZCVmdjWS9ScGNNRElWc1dzTTFBMXJYSllmc1VB?=
 =?utf-8?B?cUY3WGp2alhvWk5jczdZbGlqVGx2S21YelFYZUtOaGppSnB1aFh2UVNlZFE0?=
 =?utf-8?B?RU5FZlpKYmF6QURZS2lwbEtwZlBzeVU3TUczQkpFZDVJL3VjZWRFOW1KRWZl?=
 =?utf-8?B?WFhRWkNHNmFENFdDdDdZTXFwZnEvSVlXN2dBODluYjdvaFhNazFJcm5FSzdx?=
 =?utf-8?B?YTM0aURoMjZEcjBrK1I5SkJRRnJISTJNclhSWU1lSkkrNnpyWXdUNHZrSExR?=
 =?utf-8?B?MHk4R3AyRkErT3lnZnRrOW9vUjJBbmxDakhSSUduMk4zblVMQkNqVDZsbWl2?=
 =?utf-8?B?T0QvbnhMb2grSXRkbHpKV24rR2Myek5jaDJZNExzWHRGMDV1RDh2cFVmckc2?=
 =?utf-8?B?aE9FREZsVENnL25HL1NFbjU0dEkzZzFEd3QyLzZ1YU1xU1RYK2x1Y1JtMFUr?=
 =?utf-8?Q?LGqZ7rpEvpgR6e2tGmEgOIVap14FWEKE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWtwaUUzbG5QUVJ1blZicTRkWmkrZ1Q0Nm5ZNUNzWkt1OTZId3JXSnFJbjFG?=
 =?utf-8?B?ZW9sbEpYcW5DSUx2UkwyK3FRYnQ1cXZHZU00S2dyTU91NE9zbncrUFpxcVFP?=
 =?utf-8?B?Y29zc0dCSFFQUWZUWkZFbnhNenBHVGk2ZzVVRjFkcEg3bEl4dEN1dmRLWmRu?=
 =?utf-8?B?NG40a3krS0dXcnNyKzg3QklleWFETGVlQkpxdDgrYmgyaTA0ZkRJL2xHRWxQ?=
 =?utf-8?B?bWtTc1NnOSs5VEZyeTRlN01DMWJqSk8xRWRIRHZDTU9kbml6NFJUUGFqY0tW?=
 =?utf-8?B?MzAxaE1DRzRyWGZENVZ0d0U2U2d2MGMvYkNIU3VVcnFpWDF1dUNJMUVyQmpj?=
 =?utf-8?B?NHZZUDJ6UStuVFkydGZ0VVRFbGZVQjhUZll4MG5JUU5jdHhzQk9iQUY2SFUv?=
 =?utf-8?B?akVqYmpmOEJxOHdtUm9rT29aTlRaVVBsemxpbXY5R2pRSkNvZE54bXpQOHMz?=
 =?utf-8?B?ZzdKdHFnRlBudG5uRmxrR1MycXpEd3luRDNJSXU2ZDUvT3l0R3NmSUdnNXIz?=
 =?utf-8?B?cFRST3dhbWxuUjc4QkFUdE9GU0N1QmsxclBJL1hYWU5pNHQzLzJtQzA1ZmVt?=
 =?utf-8?B?R2tJOFBTRE5XQXlRTnNTbmFNUkRzdDRXVGtFS0wyV0Jzd290aStQZ2duRDNJ?=
 =?utf-8?B?Q1lZU3oyWHA0WGkwZ094WGYwYnc0K3lsS0tVbFNGbzZmelVjWDhrU1FZSnN1?=
 =?utf-8?B?R28zS0NOdlhUVk04aHkzSGtjQlI1bE5sNEtnNW1mMVg5QWdtQU4yZGcrczlZ?=
 =?utf-8?B?VEtVdFF2a1F6VkJEN3ZEMHJua0l5dUt1MjU0clZ2VmtiV250Q3AwZjNWQWtw?=
 =?utf-8?B?QU1ianV2R2Q0Z0JJajhpb1dCcExyQUdzY3lpeW43UEM0VHRPQmRXalAxall1?=
 =?utf-8?B?MVVPWVMzcnhNUk4vemMyTGo0TytueDhGek1VQWhJSEp5a1RNZ3E3SnAzcVc5?=
 =?utf-8?B?dkhOR29ENVVZTWFORVhnZVUwV2FNT0hpbGJTcjdldjB1V0hDWXh6OCtqWEZm?=
 =?utf-8?B?R3JEWG1NUzdSK3NicWdxQWtmaXUvSTB5M2dkN0d2cEdTRUI5ZDVBQzFRWU0r?=
 =?utf-8?B?ei8yaGJuYk9Mc1JDSzhxNWxjVkJRMU51L1lkY2g1Zk5uUno5ditpVXRKTUhu?=
 =?utf-8?B?U2haMG9NWmlQbmNNWGVFdEZRMGpEeTVuVFNPWnpnbWR4dFpqWW5IZEhucEk1?=
 =?utf-8?B?VmdReG5aOTRxa3J5c1pMVVdZTytJRytGZHArRkJNRDNWTFhwTWhFRGg0MU9a?=
 =?utf-8?B?bkpodjBNRm1pcTRVd1FnMis4TjBBdFBlQjI3S2Q5dDNaVmY2L1BSbzV5dU9x?=
 =?utf-8?B?TmpTWXEwMVV1MEw1SnRQRkpiYWpWZzVCcFhVa3JVZWRabG1SWDBiaE1rWDZ1?=
 =?utf-8?B?Sll0eE41VUxqbUtnQTZuUE1vWE9STDdRbDNBYTR0QzFYMElkaEZpckQ0cU1O?=
 =?utf-8?B?Vnd3b2R5SmlGMkZJMlFjNXZUbkVMOHRQa0dzVTNkOWtWcmNtcVFYM291dmQz?=
 =?utf-8?B?dXFDSWRXU29aY3JnR1hCS05veDluYjkvRFAzUWQrSGFtRnlIWlViZXRlL1Vp?=
 =?utf-8?B?WU5ES2hWcXFnRjQ2VGZpOXBnYVlIaE9HcVJuT0FFVkJ6QmZNaWFNSFRhNzFV?=
 =?utf-8?B?SURvbEREVzlmV2dJMERwOXY2QUhrZGJ3UnBLMy9CRVFzSmZPMHdydFl2RnJX?=
 =?utf-8?B?QTdKMmdTaUI0VFc4bmVtdlNCOHljRkJUSjBvc2djallqdkFZSVpodHBvTHIv?=
 =?utf-8?B?eTZQaFd1cGFPR2crQ1dMUnhHODRMTVd5V0NQL0FORHpGcWNENFB0SzE5aGlz?=
 =?utf-8?B?V3dFVG5TcEJ0UjBtQVc3OVdvV1RLNkhEUFJndUo0Wmg4d1dIaUVkV2xnbWsw?=
 =?utf-8?B?NE5GWWNVMXZ2TzRndVFpZm5URG94YXU5bnBpWEhPMmNYTlVOeCszY1ZCMFBu?=
 =?utf-8?B?V050VXNDUGMzbHdTUnlOUFNRME1XQXNHdFZJd205OGUwWE1XS2pTZHhrUkty?=
 =?utf-8?B?eDVQY1ZsZlRBU2ZNMXpLeFNGVTgvMko1c3BYa1BQc2p0b29tS0d5aGwrckpB?=
 =?utf-8?B?QU8wM2hucStlbnAwRk53ZE9QTGxhN2lNZmxYZE9CQUFaTVpCREZka0szUHZC?=
 =?utf-8?B?MlBaRmIrRjExWGdrcEZsaDdDakVqR1BZdGN0dzZUdjFFb1czNTM5SUlaK3lu?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f490802a-3ba2-4e49-437c-08de2b4ac9de
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:15:34.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TllQMpntW4OpukTS4G0F1+P5ammU51pSVWpq4cL1XGoYDc/lWVhUL3/mTUGapRahwufQJO/Y34Zn8oHFaEXp7ZOrZuCWA6n/ZwGxGUTZlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6162

On 24/11/2025 2:18 am, Saman Dehghan wrote:
> Clang >= 18 supports Modified Condition/Decision Coverage (MC/DC).
> This patch enables the detection and usage of this feature when
> compiling Xen with Clang.
>
> - Update detection logic to check for '-fcoverage-mcdc' when using Clang.
> - Update llvm.c to handle the profile format changes (bitmap section)
>   required for MC/DC.
> - Guard -Wno-error=coverage-too-many-conditions with CONFIG_CC_IS_GCC
>   to avoid passing a GCC-only warning option to Clang
>
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  xen/Kconfig                |  2 +-
>  xen/Rules.mk               |  1 +
>  xen/arch/x86/Makefile      |  4 +++-
>  xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
>  4 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/xen/Kconfig b/xen/Kconfig
> index a5e5af3b76..5508993f02 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  
>  # Compiler supports -fcondition-coverage aka MC/DC

While you're improving these comments, please drop -fcondition-coverage
(as it's no longer accurate), and expand MC/DC for the benefit of people
who don't know what it is.

>  config CC_HAS_MCDC

Also, # GCC >= 14, or Clang >= 18

It's important for toolchain versions to be given in comments, so we can
figure out what to clean up when upgrading the toolchain baselines.

> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 532889c857..a8c7e7e8d2 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -120,6 +120,10 @@ extern const char __start___llvm_prf_names[];
>  extern const char __stop___llvm_prf_names[];
>  extern uint64_t __start___llvm_prf_cnts[];
>  extern uint64_t __stop___llvm_prf_cnts[];
> +#ifdef CONFIG_CONDITION_COVERAGE
> +extern const char __start___llvm_prf_bits[];
> +extern const char __stop___llvm_prf_bits[];
> +#endif

No need for these to be #ifdef'd.  In turn, it lets you do ...

>  
>  #define START_DATA      ((const void *)__start___llvm_prf_data)
>  #define END_DATA        ((const void *)__stop___llvm_prf_data)
> @@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
>  #define END_NAMES       ((const void *)__stop___llvm_prf_names)
>  #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
>  #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
> +#define START_BITMAP    ((void *)__start___llvm_prf_bits)
> +#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
>  
>  static void cf_check reset_counters(void)
>  {
>      memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
> +#ifdef CONFIG_CONDITION_COVERAGE
> +    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
> +#endif

... this:

    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
        memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);

>  }
>  
>  static uint32_t cf_check get_size(void)
>  {
> -    return ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
> +    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
>                     END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
> +#ifdef CONFIG_CONDITION_COVERAGE
> +    size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
> +#endif

and similar here.

> +    return size;
>  }
>  
>  static int cf_check dump(
> @@ -147,11 +160,17 @@ static int cf_check dump(
>          .version = LLVM_PROFILE_VERSION,
>          .num_data = DIV_ROUND_UP(END_DATA - START_DATA, sizeof(struct llvm_profile_data)),
>          .num_counters = DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, sizeof(uint64_t)),
> +#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
> +        .num_bitmap_bytes = END_BITMAP - START_BITMAP,
> +#endif
>          .names_size = END_NAMES - START_NAMES,
>  #if LLVM_PROFILE_VERSION >= 8
>          .counters_delta = START_COUNTERS - START_DATA,
>  #else
>          .counters_delta = (uintptr_t)START_COUNTERS,
> +#endif
> +#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
> +        .bitmap_delta = START_BITMAP - START_DATA,
>  #endif
>          .names_delta = (uintptr_t)START_NAMES,
>          .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,

With structure initialisation, you do not need to have the fields in
declaration order.  Therefore, you want to do something like this:

         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
+#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
+        .num_bitmap_bytes = END_BITMAP - START_BITMAP,
+        .bitmap_delta = START_BITMAP - START_DATA,
+#endif
 };


to keep the ifdefary more simple.

~Andrew

