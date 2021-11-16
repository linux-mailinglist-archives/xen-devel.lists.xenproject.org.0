Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08853452C30
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226169.390769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtDx-0001tw-GF; Tue, 16 Nov 2021 07:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226169.390769; Tue, 16 Nov 2021 07:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtDx-0001rU-DI; Tue, 16 Nov 2021 07:49:49 +0000
Received: by outflank-mailman (input) for mailman id 226169;
 Tue, 16 Nov 2021 07:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmtDv-0001rN-4r
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:49:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4537fed-46b1-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 08:49:46 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-5nZ09YpSM06wMeLpKq4yUQ-1; Tue, 16 Nov 2021 08:49:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:49:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:49:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:310::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 07:49:39 +0000
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
X-Inumbo-ID: c4537fed-46b1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637048985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnHQDYU+f2npCEGWIn0LTMAsYXIdkkqX4C7ld4VOlA8=;
	b=Q88bqYg79CaRGGQNDcip7Y3QKELdJlSVAXot+MkfBdX7uz+Xfev0J10dGZRPYJ2NyFe1Gq
	7K7JNDbPTO+LsNRwb/0rPtP1wtABAPhkKzNJl+1TJgJoBGkd88gxC7bOfnpti7WUZL7lv/
	th33tubM8cLYUqc7kM/Dt9eTQRCpF6s=
X-MC-Unique: 5nZ09YpSM06wMeLpKq4yUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1vOCYWLCBiJ6jZBDKLMhWnCYAF8sNn2L2KNYLL+e5FnjVveiIHpEDihNflqcA36AGswvjDdfWMfo5pTFPd5OIj+Dounfhd11upvhvxR94BP5r2j3WfDGuYp7hmAf2qI2FAPjD1cW3p57oulgRWEr0swBqfxujHoR+WqN0WTYB4lj+uUvycKvbYnXtfmde2tZoeXfoxWIirvRwr25kwyLWaBCt7WYM/hUQdsUKelkCf79XB44Mmpp4SJ57U4IpsDwJM2tmRqIsNLgj5l6x9S/JDx3akvkVpGiRi2vZonvExZ8xhmeDm2YY+6I7EkobbstxHSohQmUC01WtxHNEiw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnHQDYU+f2npCEGWIn0LTMAsYXIdkkqX4C7ld4VOlA8=;
 b=YGaEHXWmK2S4vMrAdql3ZBlSH69qJe7Z7i2LMW2YGtLQ7BzDi1DIx7tgA8kIJohnGmv8/btd1banWEPMbrLmhzNwWQHO6ZBG502aUOQJwiyhknmVOHkIz4MlpC1632cYpJ+eYY54BskuHeRwdsg4MDFU2WrtmoiKnb9WspRJdy/6RitPlkE2psXHaKgSfli9PTsaZ6LXI4kUO74pQJLjGfrTmYVxTnSseOA0WVmed9a4bjOfMndnk6Iu1jByyFPvVmlsMmluzkXMQ39auG2z1rN3e0mwaGP+PKGjrHu8WRYZEMfx2R7hZzPEXXlxnpExEUhOIZ6XEYzwGSAMwtCOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f883c45-05ec-f362-57e7-f87741da08d5@suse.com>
Date: Tue, 16 Nov 2021 08:49:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/10] direct-map memory map
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20211116063155.901183-1-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbdab9e-47b4-4aa5-4213-08d9a8d5a543
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494444A8E878CE9197251D5BB3999@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/HXDxVNFufuUDL7ViZPYQXnWUtIgpyL7DGXJcaSayd6tGrFkjqZnNKbR0NyKPExZ+JIr1rR+btmrCeCEDwjGhrWiTOMbpTj79N8GHYUW3XP0LlYKR45Te8t4gzdMIUsf2EiFXrV233WmsGHzNVUTF5NWqH6+HsL/g0YZEadwlNuYChNZlN7+6kCkCJEk8Ur7SBCkMljbrvOsTtHv+hxLuGCEwXqsrCXTY7B3uo0MvuT2s3+gLrG0vwaA7l9lNWhk6pPi44h3FMfYj66z5ZiMGZJJEjo3GXRHTFAf0/pEMUeja6QCepolCKhcIMRlInBGtOoT6ldXeKG3Q3u0nrF1850ZbHUYZTI3WOfw+4Hj6icV3LGseOP+vHzupWoErtXcXa6Z+45wFlaRWRFt6e17by9ma40c+zSFA375oQLAoorjpDicbY52cBBLKInM0Yk5KmDgb0GYXsnUYFRjcLwLc0CM4ouF8qioyKp4evlJZ/AntkwotSoUopLSmiMQ+R64DQh9qrszmeNI5gkOZthBaOeTqydo6JzB1XgAhCOiQRQ4gurzWpVM4WvTYAGXrQnl26MIc6XQ9PziHFaSHR9WPjtVnmq/hpvx9tTqWsq1DLhD3HToRE7zG7c7fjk8nxA6Bf35Xfv7lnwv3ZxykIaR3l68eqAR+8lr94ndC/+GbUUg0fDqdCCKJQraSD6LIfGaKp7PqaAwVC3Sj+TPeNyYNQBr3S3QB07QOk5mnVM5NNP2XvLQ++9cwjzorAt+GMjY97ddt48Iq7dovlXqhFgSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8676002)(4744005)(66556008)(86362001)(16576012)(66946007)(316002)(53546011)(4326008)(2616005)(26005)(66476007)(38100700002)(508600001)(186003)(5660300002)(8936002)(956004)(36756003)(2906002)(31686004)(6916009)(31696002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlVsUUpVR0NUcnI0UlRHMFhGdWREc3lvQjRIb0V6enF6TjJ3RkFDVSt0NEF0?=
 =?utf-8?B?TEk1S3VwbDFJcTQ1Y0pvanljQkJWeUYxSDlxYzBxU29LdGlJTXRVNHpxYVVz?=
 =?utf-8?B?Z0pVb3d5aXhGYUFscHozOU5lcUx5Y3AwdnRYak9xTVVVa3hKejZ2eEE4UHFE?=
 =?utf-8?B?aDdrTkg2VExUY0VtZ3V5TkxZV25uVkNtWmtRVnpQZDhJTVJWTjRaWXh6dlN0?=
 =?utf-8?B?SFd4N3VhQTdGYUlRTE05eTR6Tjc5eExGZkxUY3dkbjUyekRBcHBYdzdaeWVV?=
 =?utf-8?B?MFVtZExOZ3FDN3lzVmRNWXp2dnVEa2U3VkhNR1Q1TU0rcnVxRXFEWGtON2po?=
 =?utf-8?B?VFFMcEJjaHBEbXIzRFQ5Z2p4UkFjaXhvWlhzTnR4MXdTcTdMVDJmVk9BbVdr?=
 =?utf-8?B?ZGFNblUwRnNjTzZvTktOM1ZFVXdSQnVBUTFYYW1JbDJjdEQ2YlZMSi9mZkwx?=
 =?utf-8?B?TmQ2Ly9DcC9SYXlyR29mazM1eEl0R1RmSXNOOWwyTzdERCtOekd5STZXZmlE?=
 =?utf-8?B?WmlIaFllUTVHNzlHMUFPeDZnczc0UVg1VVljcTlIRnlWWCtXVzZHWFBWNkJu?=
 =?utf-8?B?Z2QvQ3lTM0NqREJXNkFILzNqUnRWM201d1Q5SUhkQ2dqSUZKUWFDcEU5ZENk?=
 =?utf-8?B?eXVya29vc09SM3hPaGdoQ1VkRTUvMzJSZnRZRVkzWVFlUVpqc0hKVkF2cWJt?=
 =?utf-8?B?aUhQMUNubTc1ejV1ZytVSWZ1TlZUOWtmZnpXRHlwSksyZmVQUE5sRm1qR0tv?=
 =?utf-8?B?MjBGZU8xOE9zTXFFanJlS3E5a2svUTNGVUxuN0cxVldySDRXTmY3cGttVFZu?=
 =?utf-8?B?cWJ6U3piOVZ6WFJSQjliUjVYN2dHVmtqM1oyYlZTVWd6L1ZsREVrdkhTWlo2?=
 =?utf-8?B?QVpoa0xwb3ZmdUVHNUQ4czRQUURlMldyZTJ4ZTJEWEpkU0FuN3NPQjVFZExr?=
 =?utf-8?B?ZTExS095bFQ0TkUvakZUMzlqUEpnQlh6SlNMM0lQVlJiNGxHc0lnNFpVZ1Fv?=
 =?utf-8?B?MjlMRmJkS1hYOEpFWGI2dEFIcGdEOU80QVJGdnVjbytwRUE5eUJjUnZDMmxB?=
 =?utf-8?B?aTNIWXRiS3Vtb3B6b0JtRld5cDgyVUtHaWdrNkpIY2FBU1lnbHQ5akpmQVZp?=
 =?utf-8?B?QVBaVWo2WW5abDFMWTVzMFp5T2Z5NSsxUFI0K0tudll6c2Z2QjUxRDZNclBM?=
 =?utf-8?B?ZmFjUExFMENnK0QwMjk2YWRjTklZVWFkWXVxVzVjcjZGZnBzQ1R0L202bDJI?=
 =?utf-8?B?V2pDQnlPN0J2UEZTYlJ5MmR3SlN2Yjllb0tMWnpmRnJsUHZNSEg4Z0szOFRD?=
 =?utf-8?B?Y0t5OEhHVFp3enAyTm14NzRUbUxmSVZHZmNIc21wcjk1ZDd0c25XQTRnYWVT?=
 =?utf-8?B?b0tiOFN6TXFNTE5jb1hubGRPaFJRcDZlMndtei9ua0hsaUFSTVJYQU1lNTZ3?=
 =?utf-8?B?M0MwbWJSblJKcEZZT0JWRHBqaDlxenVIcjVvaEVEUEc3OU9tUHJVOFFveTQ0?=
 =?utf-8?B?UEk1cTYvVXRtOElmN3lYNFpqdWxCQ0J0K3poQmludkRic2kwYU5ZSWh0dWpC?=
 =?utf-8?B?UGg0d2FhSEpQWFlLUHNkOUFldnFBNXEyelFLWUpPTkNCT0RzYkYzSjUzbEly?=
 =?utf-8?B?elR4cWx0cEZ0UzVYakRXcERJaGo0c1RJM2ZWcFBBclVLRDN1QnNaMWdzZlha?=
 =?utf-8?B?aGNXRjFNcTdPdkVYa0VUeitGQjdXV0tyc0RrQXZxZXI0bWhtaEZoLzV3RGFt?=
 =?utf-8?B?Q1VtanR3UmZoYlFKb0dTR2RkT1M5RWY1NEswUjgvWmRIWnV4K252bXNsdjdH?=
 =?utf-8?B?Tk5vamxVR1ZhSlFVS3dNdmxKc21lYmEzTnNFL2ZsQkpNVGN0WVJVcXY3OGdS?=
 =?utf-8?B?Y0RVY2xKRndLWmluYzIvRFpEek1oVHR3SEk3NFkzV0RtQXJZNitack01Wm8v?=
 =?utf-8?B?QkRIZFlaTEgxZEdSZWNuNDVsQ2tQWFNOZ1VWQVJZKzBXeFJsRlkrL3NHQmwx?=
 =?utf-8?B?Tld4MzhoRFRTTzRFRDJscUc1TURhWVMvaTNqVC9qb2NhR1M5UEpKZy8xVytB?=
 =?utf-8?B?eWpSMklPOVdHZUJScHBteDdWb2lKZS8wMElUZksvTkhHYndETzJTRWR1aWsv?=
 =?utf-8?B?clp4TjFvTkh6RStKVDRqNjJuYlc5MS9qMkNScnZjbU1UWkRYUXd6eEtDV2wr?=
 =?utf-8?Q?4PVKnPnpUolv4RD7nD85msA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbdab9e-47b4-4aa5-4213-08d9a8d5a543
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:49:40.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhSDUUg9J2pS0orjdK5z3+wQolUAnv+GsM0Y0kJyFw9gxaFZTUAKmcp2b2ReapGWP5KuFP+Zlr7rD7Y2owgv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 16.11.2021 07:31, Penny Zheng wrote:
> v3 changes:
> - move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
> to let it be only available for domain created by XEN.
> - name it with extra "INTERNAL" and add comments to warn developers not
> to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.

FTR I continue to object to the hijacking of a public interface bit for
this purpose. Not to the degree of nak-ing the change, but still.

Jan


