Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2978C4F0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592200.924850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayXN-0006eX-JI; Tue, 29 Aug 2023 13:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592200.924850; Tue, 29 Aug 2023 13:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayXN-0006ci-Ex; Tue, 29 Aug 2023 13:13:41 +0000
Received: by outflank-mailman (input) for mailman id 592200;
 Tue, 29 Aug 2023 13:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qayXM-0006cc-36
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:13:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe12::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcfa6c0c-466d-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 15:13:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:13:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:13:34 +0000
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
X-Inumbo-ID: dcfa6c0c-466d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKrqmA72c3W5wTelK+RLVhoOwbkEWf+3wf2Jx8u9mfQdLK0bH4VJxdyWJUPvW79dmCmXa93+tH/7t93YMzCJYX6Iymbzf7zTsNasO3D63vlKX4OUl+sRy4W0J1AfAbWquN6MY/psb/hWjUl4EBnsTr5LBHPHRnSig9o+kbK6E0m2rxg/czqZuRdNWjm/GXFE4Yjpe7hwxtRMZwEjFQx7T/udtQI5dNbcWQt43qJlFoa9Qg6j4Er2oTrtfri20Z7iVdG3FProwqrGCbekRDsGokR7QF3HSo1SiV7vK+6UoBxmCX71qCAgYQqb/HsjhQmabeQjhVrMDd2VHlwPWspdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSLqWc6qIp471HZXX773rGP7pKy8rVHQVx1Gd3d65/Q=;
 b=jsFXX9OUV75b5J6iWPW89/Itx1bbSBGtD5AJaat439SNWmPvZnsugYvMJq5BRhTG1QqQJVQbWIT2rPqZgJEi6/SaPFob1qOj0qrLLBnpUmeZc1ofBLDDguo5gI6FRZ1MJnpiMVyBZ9j0qW69xKEFMF1hlLjW75Bk3fYF+wVR6HhSecJJZAuLuQGPC2C/QY2WuXQnaMmPSncaHeDLrxCGtb+Wau6hClkX56C8bgmgajZuF/S+T9DysG4jpWUbxwe0D87lLLxXhDSUWocNIw6O07q+fLzhkSx3pEci375r0tptVJGp2tTTnULLuoDvQw6u0yoC4b0zi8giFNt5ahassg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSLqWc6qIp471HZXX773rGP7pKy8rVHQVx1Gd3d65/Q=;
 b=WBxfFfoInepACsN6oQ+k5pW6bkwtFRd5OInc3hXEOrcQhpj78UQCuDl2M6Avi/NQfAmBsdyfpp/433tCXLpnbqHhn2KE5A8eRhSdK2Er4G6xqpd4agdVSNgLBASK7qhXjfEp6x30h7idNLd9mVrWrHyJj7dy6zwJI3igNsABvDvs1T5SBAi+1cgY9zlHMuSFdkaoJNulI6MNzaqlaJ8leQTb452yhLKutnE3GAM361opODe/eLHSnOnfCUcKfwxBXr8oaHBnJ1vf6f/+hn57IJyIU+f1ILIg4qYSq+hBcf584C8E8KptvwghnqHwbXbAkdudJMgywgKwrwwiDlN5Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <558e7aa6-27bf-439e-11a4-a82f2756325c@suse.com>
Date: Tue, 29 Aug 2023 15:13:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v5 4/4] xen/x86: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693219887.git.simone.ballarin@bugseng.com>
 <d4729e2d0b9d1e7e067e37a4318e0fc1b4f433db.1693219887.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4729e2d0b9d1e7e067e37a4318e0fc1b4f433db.1693219887.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: dc92d0ac-b222-4333-b9f4-08dba891bfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oCVYSDyP7tcZsgf3IMfLwtdIZIwDFwoBQCVAhw03SftDI+bWrolZu++FrLpeXUMTL8h0zCk0D5Lzw2n0l8T73IBvR/XQsdVpl3uJ2hvwOiDND9ulSCgq3S6BNk8WgzA2K5tAW4Yh5o1hhpLHJZoAL9RFiHKVMIP0t4fC4GHTxLUu6uccf5tcIh69wsNZWwWqC5fDZwUmU7cMxKCLc+AnfHicjXzyLnf+uhaXKe4bsvaZq7WBGVmJNVDxgVBz4/UfnyCkG8JvdvMKYzRLUmq5F9ghOQmToADCr6bjT4TjLmjdSjKzIRjtGWyVRyt/11A0RRgw7fTy+8ur7w8wV9x0+ae7PdGb5C/xY6b7VvHm0nYb+fhB7p9tCoI4cnje2jBx9c/RtAjXJBNW5ccYXquDFTrf7P0VPiEtEGEwGUmoURS8ND841GTuNQu+OSyOKCbY5fmzU+CIna0tFss0Hwn1lgrPv1bS6jKkzz+V64onIT7ehZsuEZVSgcyAzF2EYDNeSfn3zugKQvPULYmbHtK4jGlMZoxEuTLDretowrXta7OdKOLvvIiCn78qcGMFk7YwPn07VEZ3cC4dMj9TaFC2KLcQLS8GPz0aYs++DgL2buVOESMXmCvCwXMffZoXqpnMGj3uRqoYZoCbLTEO5yvOQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(54906003)(6486002)(6916009)(316002)(38100700002)(41300700001)(66899024)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(83380400001)(2906002)(86362001)(2616005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3dXZTBIMmc4UGFkRVRINm9LZzR2UzAxTWltU2dwMjRDaXVlSFNBRU5aVGVt?=
 =?utf-8?B?R0hWTzUwM0xVRkVxbThSVzk2Vk15czBqY0NhM2pnOW8zZzVBRllnQVUySTlp?=
 =?utf-8?B?cjFoWk9LMHpMOElTWHV4Sk0wSnpFYis4YWhuUWtyMDdkSnZVV3I2RGRRN2VR?=
 =?utf-8?B?TUVsQ090bUh3akNQN1dOZElhenZhRy9ZOFhsY29Pa2hkUm93TnVDN05odVBw?=
 =?utf-8?B?S2s5Tm9iV2UvdmdRY3Q4SkwzK1dPT1BoZ1N1aU1yVFlSMkY4RFFCcWVLTHZF?=
 =?utf-8?B?M29lTGVRNTlScURQM2R1bnd4UUlCLzJRQWFuczQ4akJBRVFRaEc1U1pyYlFI?=
 =?utf-8?B?ZGFuMjJ1WW5NREJPT3c2VWV6clU3ci9Qd1J5VjVvVTFoazBxcHZ1NHdNYndw?=
 =?utf-8?B?WlBjdGpoVHpPSzNTcWt0dW1pZ3loYUh6UXZMTC8xOWh6c1VvZUVLSmhDS0ZN?=
 =?utf-8?B?RjhWZFg5cGZTby9TMlZLZmdWS2lTOE1tUHVoOWQ4MjlQMlhRU3RpUWk4ZXhx?=
 =?utf-8?B?c2U0OHhNNC9FUkZsTWdyc3JzRVhFRVU2TjlCZjF3dENIYTlwK2VoK3p3RU03?=
 =?utf-8?B?cW03V3gyRmZhenR1WVA1c3FpMFQwUUVLZDBvN1VtTFE3d2JmYWEzK1MydWMx?=
 =?utf-8?B?djd6cjc3bkV5cWNzTVNnajQzZkxFQ0VqSGhjaVVzcnVwaUU2VjErT2o0SGQy?=
 =?utf-8?B?RkVSZWp2ZHFiMWYvSjl4dHVFRG0yaXV6cFFzUCtSRzRBVXJBV1FEUWhhbzZM?=
 =?utf-8?B?OVc1L3l5aC9aTHZLTnNUSXZ4eDRnQkEyN3FCTFlXdFVkLzVONFFCY1pSUmUz?=
 =?utf-8?B?emtYRU9zS29zN1BqdVV0YUk5bGpMVlJlcWYyZmN0WGUvMWt4VEJENjNLbERT?=
 =?utf-8?B?TDJURUhtWUo1dVF3M1dabDAwVVVQWlpEZ3YrdEFsUmNNa0cvSHRHM08yeDZk?=
 =?utf-8?B?YlArZXZ0aGRPckw2SjRMaWdYQXdQbU9HSGJ1MGRTcjVaZFFRWHhuaWZSMzFH?=
 =?utf-8?B?aVFRb2srWm1uMW1HRnFqQitQalZPakJQbHo1WEMwNlNnV25PaDFUM0pSUHo3?=
 =?utf-8?B?dERJUmg5NHF0L3RjZTAvVWU1ZFpaQm9vZ0RUV0xidmtuRUhtTU5sRTRPbFI4?=
 =?utf-8?B?T1VZTUg0NVJJQVlqa3ZxVDFZV3lXV3k2d2hJZWpyRG1GbnpiMlRWMlNGUHhJ?=
 =?utf-8?B?UlRKQUQxQlRjNHdpN0pmbVhVSmpOZ1VLanhPMGNFeXVhQ2dPKzJzeVZhUGUw?=
 =?utf-8?B?akFuSzVqaEZrc0lqeE9VbXprY1RWOFFBaVBJRy84b1Zhc3FRdytrYlJNcndP?=
 =?utf-8?B?aUEweWhWTTFOQk5jcDdpZVRVY2docWRZQXdRckI5aHREOTJWWXAxZkFNd3Bs?=
 =?utf-8?B?VGZjeWN3RjBtK1pQdDU2bXdOWHBxWXJsTzJoMEViNzcreXphNFhmbG1RTEFL?=
 =?utf-8?B?bFFZYW83aHlwZ0lzQlJ4cjdGNTVJeXFXSE52MVYvc3U3QWJqVG1rNUhaZllV?=
 =?utf-8?B?Yks2cUtjWUc2S1NFTGlzbTUyLzhhZXh3NTFjQldjQmdISHlhVkUvSC9NZjRa?=
 =?utf-8?B?TjQ4eUM2blFjSjM5Tmw1UDYrR1dvNTE4UmUwZjBCNXRLTHdtVisvcDMydkJt?=
 =?utf-8?B?cnVYTnNDUlVjbWV2Z085UzRjKytFUXpjczRLYjhtMTNjMmlJc2lseW9hTzFQ?=
 =?utf-8?B?TCtEMk5NTUs5dVBna2U5bGxKZnZKUGE3UyttaUVCaHNRR3Zlb2tmcUczaUI1?=
 =?utf-8?B?bUVEUG1qak0zZG1FeXZtK1AxTHgrTFN6M2YvY05HVW8wMGlPTTIvdmRIWnNy?=
 =?utf-8?B?THptaFdNK2FkZ2ZEdnQ0bnRwRUd4citHUzJQZ3Q1ZlVLVExWUXNRQkFHa2RG?=
 =?utf-8?B?elZ6NlhsSEorUnRsdnJZRWlqNDUwOFJ0d3NldGNXNHRJNHVqVFB1c1hzQWMw?=
 =?utf-8?B?WHVGRHhCVHdJaWdJUU5pTVpiZHptNnRWVTVpRlo2eTE1ZnpJRnVTMVNOdUFG?=
 =?utf-8?B?cXI2d1pIbnMxUU00aXZUbXNjTDJZbzVTL1ZNUE1hQ2F3a25yY0ZVakhVVFc2?=
 =?utf-8?B?bGs4alpOSWgyRDJxSmpjcnBsMWgxMzNoYUp0czB0YU9zTmJWSGhHTHBwTXZx?=
 =?utf-8?Q?KDKO0iCmmJw7YJgESD3SxK03J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc92d0ac-b222-4333-b9f4-08dba891bfb6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:13:34.4230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLZpO+LT+u+rEOGdxqYkbIvjc6gqk1S2JF7stOr5/Y6d59Y10/Chyy8oDuoHjiNGMLspVRMULKzsAhbvTZ+qTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 28.08.2023 13:03, Simone Ballarin wrote:
> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -39,34 +39,35 @@
>  
>  #define PAT(x) (x)
>  static const uint32_t mask16[16] = {
> -    PAT(0x00000000),
> -    PAT(0x000000ff),
> -    PAT(0x0000ff00),
> -    PAT(0x0000ffff),
> -    PAT(0x00ff0000),
> -    PAT(0x00ff00ff),
> -    PAT(0x00ffff00),
> -    PAT(0x00ffffff),
> -    PAT(0xff000000),
> -    PAT(0xff0000ff),
> -    PAT(0xff00ff00),
> -    PAT(0xff00ffff),
> -    PAT(0xffff0000),
> -    PAT(0xffff00ff),
> -    PAT(0xffffff00),
> -    PAT(0xffffffff),
> +    PAT(0x00000000U),
> +    PAT(0x000000ffU),
> +    PAT(0x0000ff00U),
> +    PAT(0x0000ffffU),
> +    PAT(0x00ff0000U),
> +    PAT(0x00ff00ffU),
> +    PAT(0x00ffff00U),
> +    PAT(0x00ffffffU),
> +    PAT(0xff000000U),
> +    PAT(0xff0000ffU),
> +    PAT(0xff00ff00U),
> +    PAT(0xff00ffffU),
> +    PAT(0xffff0000U),
> +    PAT(0xffff00ffU),
> +    PAT(0xffffff00U),
> +    PAT(0xffffffffU),
>  };
>  
>  /* force some bits to zero */
>  static const uint8_t sr_mask[8] = {
> -    (uint8_t)~0xfc,
> -    (uint8_t)~0xc2,
> -    (uint8_t)~0xf0,
> -    (uint8_t)~0xc0,
> -    (uint8_t)~0xf1,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0x00,
> +    (uint8_t)~0xf0, /* 0x00 */
> +    (uint8_t)~0xf0, /* 0x01 */
> +    (uint8_t)~0xf0, /* 0x02 */
> +    (uint8_t)~0xe0, /* 0x03 */
> +    (uint8_t)~0xfc, /* 0x04 */
> +    (uint8_t)~0x84, /* 0x05 */
> +    (uint8_t)~0xf0, /* 0x06 */
> +    (uint8_t)~0xf0, /* 0x07 */
> +    (uint8_t)~0x00, /* 0x08 */
>  };

I'm sorry to say this quite bluntly, but this is what absolutely should
not happen when doing supposedly mechanical changes: Initially I was
merely puzzled by the comments that are appearing here all of the
sudden, but then I noticed that values also change. (This also
definitely invalidates Stefano's R-b; quite likely it shouldn't have
been kept in the first place.)

May I remind you of something that was said earlier on: As soon as a
change is controversial, it's likely better to split out. And the
changes to this file were previously commented upon. This is even more
so that by its mere size this patch likely would better have been split
at some reasonable boundaries (hvm, include [there msr-index.h would
probably have been good to deal with all on its own], lib, and the rest
would come to mind). That way you also wouldn't need to carry (and
repeatedly re-submit) such large a chunk of work, because parts likely
would have gone in already.

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -30,17 +30,17 @@
>  /*
>   * Intel CPU flags in CR0
>   */
> -#define X86_CR0_PE              0x00000001 /* Enable Protected Mode    (RW) */
> -#define X86_CR0_MP              0x00000002 /* Monitor Coprocessor      (RW) */
> -#define X86_CR0_EM              0x00000004 /* Require FPU Emulation    (RO) */
> -#define X86_CR0_TS              0x00000008 /* Task Switched            (RW) */
> -#define X86_CR0_ET              0x00000010 /* Extension type           (RO) */
> -#define X86_CR0_NE              0x00000020 /* Numeric Error Reporting  (RW) */
> -#define X86_CR0_WP              0x00010000 /* Supervisor Write Protect (RW) */
> -#define X86_CR0_AM              0x00040000 /* Alignment Checking       (RW) */
> -#define X86_CR0_NW              0x20000000 /* Not Write-Through        (RW) */
> -#define X86_CR0_CD              0x40000000 /* Cache Disable            (RW) */
> -#define X86_CR0_PG              0x80000000 /* Paging                   (RW) */
> +#define X86_CR0_PE              _AC(0x00000001, U) /* Enable Protected Mode    (RW) */
> +#define X86_CR0_MP              _AC(0x00000002, U) /* Monitor Coprocessor      (RW) */
> +#define X86_CR0_EM              _AC(0x00000004, U) /* Require FPU Emulation    (RO) */
> +#define X86_CR0_TS              _AC(0x00000008, U) /* Task Switched            (RW) */
> +#define X86_CR0_ET              _AC(0x00000010, U) /* Extension type           (RO) */
> +#define X86_CR0_NE              _AC(0x00000020, U) /* Numeric Error Reporting  (RW) */
> +#define X86_CR0_WP              _AC(0x00010000, U) /* Supervisor Write Protect (RW) */
> +#define X86_CR0_AM              _AC(0x00040000, U) /* Alignment Checking       (RW) */
> +#define X86_CR0_NW              _AC(0x20000000, U) /* Not Write-Through        (RW) */
> +#define X86_CR0_CD              _AC(0x40000000, U) /* Cache Disable            (RW) */
> +#define X86_CR0_PG              _AC(0x80000000, U) /* Paging                   (RW) */

CR0 being a 64-bit register, I consider this risky. Imo either UL needs
to be used as suffix, or the change needs limiting to just PG (and even
then perhaps better using UL).

Jan

