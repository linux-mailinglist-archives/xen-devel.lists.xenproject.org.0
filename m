Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3A76E558
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576168.902012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVMm-0002PX-Tl; Thu, 03 Aug 2023 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576168.902012; Thu, 03 Aug 2023 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVMm-0002MB-QR; Thu, 03 Aug 2023 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 576168;
 Thu, 03 Aug 2023 10:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRVMk-0002Lc-Rx
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:15:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2cdd08-31e6-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:15:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6963.eurprd04.prod.outlook.com (2603:10a6:208:18b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:15:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:15:29 +0000
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
X-Inumbo-ID: ae2cdd08-31e6-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTogRfIfphU3kX4C/e9M9lGRbYO5GK1D1pIKjtN6ukE+um8z+x7uVCkcdxmt4PvDvp0Rj8xQCQECV2DRlnRiek0AGE+tNMLjTIi7Bdmt8JSciGPEKcY6lyQlmHf9CRk4HA2r5BtF5kn1356E+LiJ21LryQ18d+qRRTRaSnBqYbv+pUAxSTbFFTLVgs5zA9K8Sub9NAZ+8lc8PXHHzFw7V8SdnMUXSV0if6yOP64IaPitaXiG49frMKGvYKzKFDa+uAyo+PLTALJOdVzrDsmYuzClVXyhi2SFuVIrnLQQ7yVCooPDRoy1xnHRuaDakpDDsnO/22KHwRWZqE8flt/hLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q9BXtk8s2rkrLIMpuk5869VQ4BI6xtPmbxxCg4i8TM=;
 b=A6hzeFZ24dvzHOrjMhllm1aBAeJwp2nAIFWIrQCtY0lH2JEshoqLwkBEZ9SWESS9jfi+wlXREoJaJd8lJejZcWLM2L46j9SDen297Mbkytk5/MyORL8oYOWh60DPtmjBeNUsqEsqdiPhmGJRLIPuTZumfz07PL/WxolqCJhs/yOpk2naIlMiXZ0WEyU9J+xAIJH5/opEEWz6RpQlKeWd1XnnkXFZS6eph33wmDR9GIjwciaC2eMmWqrHm2+pxnSLGbYZAXvTkhPx5QAhO2uFCYwLk8Ks85SnhHts7EYivLpzds8QO93WdSUsluR40qGcdV9ffoVCPVce4wLt0tm+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q9BXtk8s2rkrLIMpuk5869VQ4BI6xtPmbxxCg4i8TM=;
 b=aoH7nemT3VpTcDlC2gj6Yjp5Rrn+eIpqQRDlb1UyhJKckVAeuDqfJVUdxOY0UWh0RPcN1Y33BmYWjGq+TAC9SudQNcBCgAtvY8V/TElrepusJettbRv4XRXCTH321Zjqo06armxRu8pBXfs+AtHJ+F2Zmg4eBJIBb/DtLbs1AQd+TknSCMKYgEJDmlYtrFuFuyHuaejHBBbRVVhKq5mOTNSHPpqjTWGIYzL3kcBPefaAFtAJUfxn4i7PwZIShwdlVM3D3cO9l+p0SxL12yEb7m1nMVY1rulX9xviXZnGESyAmMFtXPoqD+0nF3j5L8O4WkoDMwU2J71w71hUBytU4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99d89bce-42ff-f6e5-090b-3b9f8e130e66@suse.com>
Date: Thu, 3 Aug 2023 12:15:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] xenctrl_stubs.c: fix NULL dereference
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2bba31-ec35-4998-0f44-08db940a8fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1fBwV7dz4aUa47nCE1sqbgd0LtDS4opDKtQm6uwGiNNlacTrDcHQvpGUe6ZOfbzvaQz3aGDCR4XK3hSeqx/Y4/EdgYhD0xaYc0qT/xU16Mj3atzSpqDPtAuJAxZOLQJV1mJQKJfra7APRcR1OOJAUt4o+TETi5Z+lFPrkTymM+yQVLQuRHhMIkFiJvHOABdN589qDB/wBtBSzLsxMXs9SW3O5YvXV9GWHmE2e7ZLsP8l/D0nu0dUyXqIAFeS+girKZ5pRHFZ45D6MCTz4AcwobsIf3ipvH9LluYuE8Zrt7AftxmUzm6RtymE7clEjoddBBRQ1t0yRXpO1PP5Ag1I2JRlvKvAgREC0dST9t/iQb26BcXY7OXY0jY1oY3wchb/8hCZesXtZqW3SeyGDlVuaQgxBjN/oqvNS9L3WcyGQMdJd5ZlXZpDGdnp2WJVQwtGvQnUsh+dw6CBnA+VrOfy7IiKJDAdmr0nQ647IjqvaIBoNo1MRUFwjj19kQSJjmzwDCqaIR6vPCZX5AzGov6qElgvYywIT6sLy424xF4uCcTXqV+v2J8Eg8winGrhlhP5kGn8zlvh/HDm7i1JhHQ2V0st1/kZtGU7cigtjqXw8J1y0aPd8HGf1nPNgZDH2MzVCo3pCfgaPVPxWSIo0q/OQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(4744005)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(6666004)(6512007)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjdYc1lxS2I2dktHRm5pbTJrUXhwcmR2QlJnZTJTb0YzOHZBZ0FzdUVqdytQ?=
 =?utf-8?B?OUhhS3pRUHZDVFNZbUFJZHF1cWwzOHNaQnJwZWVKemxzWEhEVHlzL1d3Z090?=
 =?utf-8?B?WU1vVE1tWTdOcmFSUFZsa0ZudE5EN1VEYmJNOUVkWDlwTUJtV3E5dmVObENz?=
 =?utf-8?B?VllKRjNrT2hySUtZSjdPOTJLYXFTRzZnYUQ3cWhRV1FoMjgxbmpiUWRJbjNl?=
 =?utf-8?B?UXIzUkFPclJubmdac3ZlTUhDMUdoam1jbjhmS21UdnpCSDc1ZzFkOTkxMTB1?=
 =?utf-8?B?dVppZ0cwb2d1bm1Qbk1SbTRNbEVkT2VRRVAzZ0RXQlFlZ2pzTzhpNXpFZVJh?=
 =?utf-8?B?RG8rSUxLT0c2akpodXJBOFFhQnlWUkVHcjRhcnNlbUErM0pzM1ZqM3NlOGpj?=
 =?utf-8?B?MVlIK3FMYXlJUHRTNDdDRndzT0RFUmgvMHRQZU9ONWU5dUNBYjZuVGFYVnVr?=
 =?utf-8?B?Z1JqY05BdUhidTJublpqUisxNHNWVldiTVM0NTEwMmcrTlJEM0hjclpDQ1JE?=
 =?utf-8?B?Z2Q4U3A1aFhiZU9scVpvT0tnbmhmNnZzWGNEK2o5UHBjb25CUjBhRUlxRlBW?=
 =?utf-8?B?VndST3BqWlJaMi9RNkZ1Tzg3N1R4TVFVVEZWNmVlTnVlOWNhRlgzSGpyL3A5?=
 =?utf-8?B?M2ptc2hScnpicW9GcVBleGVQUjQ4Q282akxmSHl1M0JLUG9HUmRhajBzWlhL?=
 =?utf-8?B?R0dvL21OaXVxTVM3cnY4eW11VWFJck1sY3FIeFdzTGdpRFRMOExxRE1IY3hk?=
 =?utf-8?B?ODZsdEVTaVFrZmYzY1p6VDdoY2VzSG5VRnBwcW9GWXM4Ty9wNEg0cFJwaXY5?=
 =?utf-8?B?Z3ovMVZyRmRESEkwVllVMnFFcUpDMFl5dE1MSjg5TDZjQ3lsRHpMM1VGd2xo?=
 =?utf-8?B?eVY4b3czNnhYMGpsb1dQOFVEeGFPN3loS3pDeXZVamJtSS9XeG1Wd3ZEU3NN?=
 =?utf-8?B?dmxLVVRsQnl2QU54UU5vTCtneTA4U1dFSmRlVkNiM2tWaUplOERHOENOWU1t?=
 =?utf-8?B?dVdYSExsdllrZTVwOEFxV3VjbmtrazFWMjJ0azJDOGRPUzFPcitiWDhmTUxy?=
 =?utf-8?B?ekdySG1FNlRMU3lpOFJpL1BYTk5FeTB0TEJLUUh2R2tFVHlzVXVtVGFSVitB?=
 =?utf-8?B?N3hlWE9aUDZVMFIxTi9BSzVuaHBQMnVsM242bHErMDRuMEIwWHN6SnVhekEv?=
 =?utf-8?B?UHVsTUVxN3B5b3pDUkFkaEdhMHRaclNTSHdhYkp4cFRWL1FKL1d3ZzRXdFJv?=
 =?utf-8?B?dk9vYnhuSlozNEEycmV1WXhSL2IyVEZOeHNIS3ZHaHNsVEJJWVRCWElWRE93?=
 =?utf-8?B?L21UNlA5YmZoSHA5ZzQ2a3FkMkc2TGVVWmUvRW50NC9pbFRXRDFqWDdBNk5O?=
 =?utf-8?B?YkhXbHVMRVJGTCtocUhrT21adXFUc0MvcFVHMWtZcXBFNlJlMk1ZYVJVMERO?=
 =?utf-8?B?L2Q0UGl0djRPaGptZ0FIVTNLVWxGNWNyODdoZkdjM0hZUThlMFgzbmlLbjIw?=
 =?utf-8?B?VjdzRDU0U0tuQ1RNaG54NUErbGhaM0NNNjJra1lQdjZNRGMzNlZEbTZiQ0xv?=
 =?utf-8?B?L2RVVUgvU0VhR0p6RWdKYko0SDdCeXdXMGxrdHNMeXhCT1BKL1FXaHZnMlN3?=
 =?utf-8?B?UFpHdU9uNllxTmtZRmx0K202Mk9XMlgweU13aXhvbFowZTZlQWNFSXY5L2cw?=
 =?utf-8?B?VjZQVmRqQklVZ2RlcE44eEZRcVhHRlM4bzJ3MXVVS2VoQW41RHRycUxORlJ3?=
 =?utf-8?B?bDNyRDlnRldrcEJ4NGhUZ2xwY0t1VGpyOGZGOEZuempYVVNsa1VKbE81ak5T?=
 =?utf-8?B?NGJBZmxhUUp6aERWd21KUzQyeVJNWDhCckpVdDcxczlid2FTRWRxZjJpZ0xy?=
 =?utf-8?B?dityc1owTDBnMWtlTlJ2Z1pPcE5KUm1UaW1zQVRKbyswTm1uOFVTaVNkVU5u?=
 =?utf-8?B?ajNhd1RZVVZmTUZ5MXBIejN6eVpySFE2K29rQjg3K201N2h2S2xYV1pxVWR4?=
 =?utf-8?B?dExXNXpsV0k5dlJwcDIwZEI1Y0lSU1kzS1YrTFo2c0Fzb1UyMjl2MEpvbFpk?=
 =?utf-8?B?TTE3Q0NqY1pDMWFKQkdVdjRIcVV3SXZmNWFqb3llSE83OTRYQ2ZIUC9UWFZX?=
 =?utf-8?Q?LYJ+TXgkVR8I8cb3JdDRauRkh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2bba31-ec35-4998-0f44-08db940a8fdb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 10:15:29.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jOKw8wB7vWje8o9wArXA4Fy+67Qrmq/8WA5ddQ+tZhatEHXA2LwGZQ26e3IjRDAR6u5/xPxeIzOaZ3bqy/WhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6963

On 13.07.2023 10:30, Edwin Török wrote:
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -832,7 +832,7 @@ CAMLprim value physinfo_arch_caps(const xc_physinfo_t *info)
>  
>  	tag = 1; /* tag x86 */
>  
> -	arch_obj = Tag_cons;
> +	arch_obj = Val_emptylist;
>  
>  #endif
>  

Since, aiui, this also affects 4.17, but the patch as is doesn't apply
there, could you please provide a suitable backport of what went onto
the master branch?

Thanks, Jan

