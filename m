Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8465773AC5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 16:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579989.908228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNzN-0006cB-1y; Tue, 08 Aug 2023 14:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579989.908228; Tue, 08 Aug 2023 14:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNzM-0006Zm-Ul; Tue, 08 Aug 2023 14:47:12 +0000
Received: by outflank-mailman (input) for mailman id 579989;
 Tue, 08 Aug 2023 14:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNzL-0006Zg-7K
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 14:47:11 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 729da326-35fa-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 16:47:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8958.eurprd04.prod.outlook.com (2603:10a6:102:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Tue, 8 Aug
 2023 14:46:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 14:46:38 +0000
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
X-Inumbo-ID: 729da326-35fa-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJWE593TnzdxZu42I8QwikONsN+rurtok+RiovoIKnONWUaxRGBx/JJKpY84KY1UwFMId2MzzYj06BEu179eAaCMIDiijeHnbRRJExBUJuSpd85brt4tHHKJl9ggmU8izzkkajCvWPQWXC15Kj2y1W4rg2qgqmugRKtPrfQDDp8FYA0AGZHXKJnewET9ka3j6F2TCUUTzNhQLK5g0UvAjXWDGxmpEZbSMe+5fDkz8QrjaLTPL8HXTQi4c31sXBrfV2/tkfHbtTIZ+3z8ntMBw6o50zoR2/+2ds620HoUiq06XImSSOoqZjQH7K9NC/cZBUu1kZANMG6C7E1eT44/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFHFg9Drna9jR44+rSeaaZx+wNcat5CHqUdBCywA9k4=;
 b=ZsPpMSPe8+pJP9a0nGOoUBMhk/8qQIU5b4t+GLWtRaTZIYovpPwztzzrIMo9Nns05tAcorxfBaveU9iIww6/kFqqdYPO8csmgvPLJBkmKK3RYlikABKQQwDWoCvjr7zOQJ3vLBEasbQu3VGAXLcuQTiIGT8XQNvYo+omYsEZSvLqipib3uCGK7wPh9dJdo0t1mT/S7d82JChuFHzWarYM9jfqn8zQifehQSpTU93PpcpHAwtd71Q4qHrtyWYK8//PPk/epBOOLdsgKmK4+x1s/dsJ7+f316n18px3zvO8H2wQ7g0BMR05VxEXE+UMKiW3O1LU5PMkpb7Q0bcxx2Phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFHFg9Drna9jR44+rSeaaZx+wNcat5CHqUdBCywA9k4=;
 b=Pfqq4JrHvLV87LCkfkDwlId9F6Rs4V+pkzJTswGJbt64w5+++NnUcZM4lupe1Klu6Nx+df4Er5/mw8R9DSulilXADc5DCI0iTXjrnktm/9rWwXTDsaKkOQXMmf1H6/1f8Scj20Iy2iU0OpwiX2K8iUlUo++3zA0GZgUFWlDOpW7nKI7hnfy3n1o/L4luNh+m7OwAowVeT0qMu2S9v151+0icb9d1+EwuM9m5tSleAZLRMUK8HTEYA1NM9rhcQP2tfb8Qa9q3Y0Fyan2OiJGTUTqjBHB0NHqfZkBldW+RXDzZzxEua0DiD4snGBA9mz8DVGqXLwodKzWZVyI3vkXSJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e689708-5ea8-c3d9-10a1-3de5e2ecdab9@suse.com>
Date: Tue, 8 Aug 2023 16:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 5/5] x86: refactor macros in 'xen-mca.h'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ec88d2-c3c8-4705-f082-08db981e453f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FSLQkKcmV2BhmxOisaTAjEQIj/NHzwoUSeHgfdZInToNlV7fRCxPilxteXtEg5PWvJRS7E3/gZtUlm+YQPkSQA5m1GOrcrl5WDslrPwym2EIINhWEXefG8hHdsDtDeHhySjTVXbwapSl7DMfZ0zzEaF1ffncaTczS5N0zUCo31JDdgZ5wp3/PvauQ0rlzOSWzHV9PT/Hd4kBeBDEpdOevufa+PnWBb6N93mrG6yoaSmajWqQMf7Ptp0AgYPDzodZ1sJOGRtpFcg/tBgJWoB6OT8yk6LrmrW4xS1PXiQkh4Eoer8f9eE7ld89NwmVvpEjxVJ4snid/ISQ2atnQyFoFXgtvUFK48Hd0s/dCAsVwLu7xMqXF3COdmK6yTAWB0mv8achhcko9QErfczr1G1U8J61ZTwgSWpDkAC9Aw/mSPr0Mk4s6/VNxxP5zWLka8q8n5B86sKXsR0hEp8wzVg/vtTVyOLV1VvoNKn6K1X68bTMtqNDH4PLjTuxuvlrdiu+NYekD32kG5bpXYiB3cbWb76mi8xiKSzRqo5QSlPqzn5YqH5IY5xKcSPOI6prIQaV9ukAGv7LPIso3LL80ifu1Wbt/jtGfZZffPtuaHjwH3h/HmZAsb0yu4MEmfhPhUbdSj19dSUoQ7Pv6qeE4YPE3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(1800799003)(186006)(451199021)(8936002)(316002)(31686004)(8676002)(66946007)(66556008)(66476007)(6916009)(5660300002)(2906002)(4326008)(478600001)(54906003)(7416002)(4744005)(41300700001)(31696002)(86362001)(6486002)(6512007)(2616005)(36756003)(38100700002)(53546011)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVtNXFZMWthRkMxTzJRdnEybUdvUlhkcGdEZ2tRM0QwcXZneGRRWUdCRXZm?=
 =?utf-8?B?ZzNpeFkyTlo1ak1EakJFQytzOFB4R2pHSmR0aXdIZmZ1ZGFNVFpoYkJGR0RI?=
 =?utf-8?B?TWRqU1gwOHUzblZ0emFqaUJTUFhlWHlOQjlnNnpwL1I4YnFVekpSTHlieXlj?=
 =?utf-8?B?NUZXRmVlai81WHpmVEc1VDJTdGhiMmVkMUhOTE5aNXhXdWFKR28rK3NUMDdK?=
 =?utf-8?B?Y09MNDlzSGMyNHFsTGZ5UGxZQjgvMTA3Y0xtaXF5QllLMnhESU1ZV0JtdElV?=
 =?utf-8?B?RWh4dGVDUzVzcHBZZG9ZbHg2a1M4NTVMRG5yOTU1VTB0M2NXWWRxSDRhWFQw?=
 =?utf-8?B?Mkt2dHhMTUVQaDB4Q1dmc3Fidjd5cW1pZktqQm5sQWFTcFZEdGNRZ2Q1Qlhu?=
 =?utf-8?B?a0JkaWtxcjhvNlg2a28yOVVWK2VETWZWelc5WDNjbVp1RjZ4TFJWWnFtbTVZ?=
 =?utf-8?B?bGp1OTVFaGpsM09UYVJSMXR3eFlIMVMrMUMyeWE0U0RQZVd1cEdtWkhCbkxL?=
 =?utf-8?B?SllEWTdDcVR5dDQrRnQ4TjQweWF4blBoMzJLRW8xUjJLWlhCSlB2bE1TUXdR?=
 =?utf-8?B?TE9ET3ovbHZiY1FiTDF2Mi9INGswUHpvR2E5RHFicWc0N2Exa2xhYk5ZZnpn?=
 =?utf-8?B?ZFBhK0VyV0oxR1h0NFZBdnJlZE5icFNvaElJZXNyQVJka3JIMnBXSFA3VTIr?=
 =?utf-8?B?NXYzK1pFRlhyNkdSZGpKN3hMb281YW5SSVplTXdudEErVGdsWGlXSjhFdENN?=
 =?utf-8?B?V0o3NFVqdzQwcEZSSFhOUTFTUHp3c1ZRWnVmb2RVNGZBSTljdFdjWlFrU2Ez?=
 =?utf-8?B?Wjd6QnhXei9CM1dMbWZKWGV4UldZUkwwNlB6Mm1mczFrZldaSmVBL2hDWnUw?=
 =?utf-8?B?eVNzWndvczVVeUtzYVZ4RnlrdldNRmFBQjIzWU5lV1J2ZUFwN3lNV0hSQ0cr?=
 =?utf-8?B?UXUrcS9HbExZTTI2c1hBZEhHVjA2di9XT3A3RmJWUDJYcytSUm5KR0NLQ1NS?=
 =?utf-8?B?S3JEUEJtVTlUMVIvdGo5OGlyVUlYdEQwbjlTd05paEg5SXQ4MmJGdjJhVXEv?=
 =?utf-8?B?QU9MelhqOUlpRzh4cGZkOUNlSThRWVpLdHpJUHhOR0xHOUJWcUNTWGJiTU41?=
 =?utf-8?B?WFF0TlU3dW9vNkRBcEw4YUxFQUNILzhIendJWU5oVzZQY0tpZkFmZHlsODBQ?=
 =?utf-8?B?RUhWVnpoZ1ZHcjVoMmlqMnJwbWIxd0p4d2FRVE92ODBIN2tLQjIxWlRoS0E1?=
 =?utf-8?B?bHIrZ1QvMGlUb1VNaUJtdFpZMG84TWd4NTN5ejk5LzVKUDlIdCt2NnBTS3ln?=
 =?utf-8?B?eWZCNjBsazh0dnZvRkg0eW5wSnpBdVcyamVuUTNZdGtGT3V4bXJiMUIxRGVJ?=
 =?utf-8?B?dkwvdE1WOFdmbWU0dmQ2RXUxcDZCMlNZaGxZbEZsOWhBaVJTU0xLV3VQaWhw?=
 =?utf-8?B?LzkvUmlYcE94VndvRThONUdlN20yWWc5dTRleXR1dCtyaGREdG13eFFNOEVE?=
 =?utf-8?B?dmJtZzNPaHU1Vlk0L1h3dlcyUkk4WE1uWFpGZWJTR1JLWDRJa0tOQ2xmL0pw?=
 =?utf-8?B?WURTU2s1Vmc5VXBEQytYWjYybmU3QkJUTldQMnRsV3p3MllBODdmcXYxc3Jy?=
 =?utf-8?B?RlBVZFVIWDIwV3piSHN6TElkNk9GZ29DLzRnUkRKdXFOOGNsMENYTS8wV1Ev?=
 =?utf-8?B?QmxZVTRLUDFtbThVM2JYZkVvZnN1V0xSTXM5U05yQm9WMUo0akE1YjUwN0dv?=
 =?utf-8?B?bU9TbWtOZzFtZFJpV3pCalVtc05MRGJKNVZjNW95NHRURDdITnVrdUtnc1F4?=
 =?utf-8?B?ZjkzS3QxTCtlRjFYZ2xhN3VJcjUwRkVNeUF6RlNycmFGME4xNTc2MEpiOVdG?=
 =?utf-8?B?UzlCa1RIc3laWEV0VThpTUsrRUhGQWcyaWdNeWdBY0JzWVYxRk1EeW5ob0J5?=
 =?utf-8?B?M2MyZHY0UkpDSndqdVhRS1JVSXVyMzljZjB3ek1VVzdGRVhGckFBY1ovVE1U?=
 =?utf-8?B?djV5VFA2QzFldXoxZ1EySnlYZVlQbGk1VG1lb2xxVlcwZGxQVmIzWDljWlZa?=
 =?utf-8?B?aXhVektsQ0tiNDRUb3k3Z3NXZzJTRTFXRms4YXpDVXh3QVpCaVh2eVFOSTNX?=
 =?utf-8?Q?3vfu+1CWOqtiBvxRq1pTwk9qG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ec88d2-c3c8-4705-f082-08db981e453f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:46:38.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojb+HJNHmgyFLt3J31jvbT0912VTjN4ZWoJ0T3yURPHUZFokxhJYE3i1FTmrWgRfbf/iPfXo58bQh4stTEU4mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8958

On 08.08.2023 13:08, Nicola Vetrini wrote:
> The macros defined 'xen/include/public/arch-x86/xen-mca.h' are revised
> to address the following concerns:
> - needless underscore prefixes for parameter names;
> - the variable 'i' in function 'mce_action' that is shadowed
>   by the local variable in the macro.
> 
> Therefore, the refactoring aims to resolve present shadowing
> issues, which violate MISRA C:2012 Rule 5.3, and lessen the
> probability of future ones with some renames.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



