Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B76D6735
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517974.804042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiXK-00035L-78; Tue, 04 Apr 2023 15:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517974.804042; Tue, 04 Apr 2023 15:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiXK-00032p-3R; Tue, 04 Apr 2023 15:25:30 +0000
Received: by outflank-mailman (input) for mailman id 517974;
 Tue, 04 Apr 2023 15:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjiXH-00032i-Se
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:25:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1a3515-d2fc-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 17:25:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 15:25:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:25:24 +0000
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
X-Inumbo-ID: ec1a3515-d2fc-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXWFxTTIcAacLzPaNbkYtDFk6Cvndl3AkF7oZz+L4IaTpAEf/UkdzVPJsTf2R8sVCQweIHxMBNd+B49v9bSucx0nvvVSgy+WrWeDbkUbymtzTDRE0s4O/UhN5efqxHt7xWXZQq6LuUJk3oqpuHvDQJxN4hc1/LGZYgDKl/LxSZPxhdCIUNuFcuzTed/MNcxicJJpLEEYUFUt8pBSJ4hm05ZseBHsnUhJhFS9Q8RCK0/UGZgqABrYIbNSrUTZ7GVtfc8MH7aLk3VA7umEtmeoaHeBe4jlTJivlpN2q02+Zsyba6UL54YYlTEaB0qGuEu9D56/vCVx3/oiIo9H8Uiaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jGdw4viSV9S7TApuPOX3S47yaHtXnnnjRZnrRRyAqQ=;
 b=UgOTaCDs4vRN9m05gfghutBRClfUpbKngQIxdY8jVWHu5QZ8LzFSGBr61IfL4SMI+y5lJ43/VPGWcm8HZnNW53P0+RglJTbwCQLtYvTz0jdfOPjn7mtMf8pbDjIpuTxKj4O5ur0FZ1xNYsbiLzj8SlsNLbk9o2JrAulfayUuMlkeNkql7I4UTv7pU1h+lMx8WzrtPjZXNE2jpM0DzF+O5MamZe3k6se5vUD+2KGq/scrN164ThqcAEC3VuxMiEpUrAz62UBgtn7gQAJiOErdE+DQH2/KFTIy1bvsTTJEcjO4RpQUqfKyq662Zr3Ey8ni1/01j0LLhxDLU6GHKl69PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jGdw4viSV9S7TApuPOX3S47yaHtXnnnjRZnrRRyAqQ=;
 b=R1iOakWn/93EOmasSt+HE5fETSQXoKOSd1qraMJvih7cnFu3g+WppmpBUarssuitWebkKjNCyIMdhGWM5oKdkAlh+E+9aTYMIkCIUBpsdzvUoVIHZFd7vjNtaPo6VCjOMTOAd+1ga6DUoYK8hGsKtMA3MN32pO4W/liWR8kUzXbDFsMfKaF0HQzKzZFX9/wPHOTPK+l4S2rcNfM2hb6M0nQAMewNkxjcFkR/Z70o6kHeboAno+UWiNj3TjZxKEPRjDwr4x3b/Q36AAb/oT6fM+JtLGP6RZmWFEQW+OMHqJhg/5WJox3+8rJ801SDb0/yTJu6+VfT9bIQxq0vRdfnWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d569eec6-10b1-3d79-c7c5-14943ed8c78f@suse.com>
Date: Tue, 4 Apr 2023 17:25:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 13/15] tools/fuzz: Rework afl-policy-fuzzer
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-14-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 736dabe2-4459-426e-7a95-08db3520cf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ax7uXd//TEu11IMdpodelv/GMAD3sEPJzccWxv6cbMxi7zLt2ImNo0V9MvNpaJqJ/8Uy0Wx4TkNFBGdkFQuRAtGQQNE5hLeaASV3IX03NztJqt/2Unjam4i/trGz2R5nC8w4tJtT16B5KAtxTMJMTjX+zqe7FLVQs8dvS2MfskOPDN0iQgGk9qFov98TnvzrVe2ti/+cLUvxq4x/8kWwXGfORgAPzFjM9srSCKXmS/EdlD0omxizIiHPe2qdmSD7rkMttXxVJjsQsdgqlG1PRsUOeeyhepEHCtbYOFC61pWqVoKkPGEVl5NsIfaxF9GFVPxz4k8Np0Rgb/VP2VwcrLhAGkLqTz6YgPWnmZ+ZkSEcUlXLjB3vi5J1bmCjjdXHYhlFMhAsFpd6FH+4kFzNAw4fsIq29wQ1txaMWlEel1pWOGvRcDp71h09Sdz6+sem5uuBUVlZq+X5/GWzX5GidLK+zoW3QOF7cqi3AwkfS1uf3SQ5vDBHY/Wrogri+Y94oPJV9pPE6CaehgpdLGSnms2ntqYV9rx84/XVKQcI/Ri+oBvNhevQYo25mLl7nechVhH3dwyNKteh0ib6QR/X8jAshK4UdA4jqNEeQqJngLVrViNLZ/Mg8N7Hfy8X0f6DRK09p4abx/NbqRG/Hf3SBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199021)(5660300002)(38100700002)(8676002)(8936002)(186003)(6506007)(6512007)(26005)(36756003)(2616005)(53546011)(2906002)(558084003)(31696002)(86362001)(41300700001)(54906003)(31686004)(66946007)(66476007)(66556008)(4326008)(6916009)(478600001)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxCeUVDcDAvc2JMcnEwSzVSd1F3bkMzUWErMndhT0szNjBnT3ErNGVmb0hN?=
 =?utf-8?B?U2NPL1ZZSWN3YXFLenU0OWt0eUVxUHczYmtuOUF3RlJQNDdqeVNjWVpXZ1Qr?=
 =?utf-8?B?ZllxZExjL3daUlFNWWJPL3pVaWFBcmIzWWJUa1kxWVZ3S3c0OFhLcitnSm5R?=
 =?utf-8?B?NmplS0cyekFMYnVyRy9MNk9KeVhibW5tQkQyUmNpWE5rNzhyR2ZsRlQ1MnFx?=
 =?utf-8?B?S3A2Zm10UXp1Y09HcCt3M3ZwbmZ4ekJlQjd5R0t6QTVnS2YxY0JqRER4UXlz?=
 =?utf-8?B?dFJYbUNCc1hRWDBvTllNakxUbys4TXRoMFlDRURqc05MaFJpSE9Ed1Z5VW9h?=
 =?utf-8?B?bVVBRkt6NzVXcUlPb0tQeTNIS1FsdnZFVlhhUG1sS3NTWEltc211UFV1S0R2?=
 =?utf-8?B?NC9oWWt5RFFLdnZ0eERwZVVvQ0w3a0JHdG5ZVzhQMVlYdkpTTFlJZm44RTlx?=
 =?utf-8?B?a3J5Qy9HWTI0VmRRY25CdjRBYnR6eTdrUSs1ZEZzcEltVkFKemZUcThJK3RX?=
 =?utf-8?B?WEQ5NzRWd3RRcDE2cTJ3YnR4OFUvUjZOTkZ2eVNZUUk1aGMycGJQa3d1dGJS?=
 =?utf-8?B?OHJnSDY5R3dtMC9QWEdaaS9JUUtmSVN0cG8wcTFvRjdvSHZEQ3MrdFZIYXI5?=
 =?utf-8?B?NFNBYmd1M3RvZ2krZFN1R3EycEsyVTNnaHhuR0dBMFNDTElVeUhKRlJIOGxy?=
 =?utf-8?B?OTZCL29xdG1LeFpqYXR4TkxoZ0d6bDBMeDNuMWZ6QWNkRzFucGw3RDB6b0N2?=
 =?utf-8?B?bWVmdGd0MGZaeWhZL2VlNGpYS01ZSXR1eTFZcnpyTXU4a3MvYytrbjh5TDhp?=
 =?utf-8?B?OHdiZ3EyQm9tMk1XbmptTzlnR3ltVWN1QllrRXkvWW81QWZYUXlIaHJpcnZn?=
 =?utf-8?B?TkFYWGsxSUkyRGR5RkRrSlU1cUsrZkxXVGRKbC84MkpxbGdHVS9kb3N0OWR5?=
 =?utf-8?B?V3pWWXRLaWRYWkg4ZVVOc1N1MFRVd0p1N0NBZWJnSmdVb0gwQUVjd0E0Skw2?=
 =?utf-8?B?aE1neXptRkdqRmFaNnVOSlN0K1hLZUNxLzZsejkxZFp2T1ljSWE0dGJ0NlJl?=
 =?utf-8?B?MU5oYjF6a2g4d2N1UmdHVDhOOUoxbmpHY2gvUFAvZzcydTAyRDMvVHpLTS94?=
 =?utf-8?B?aENJZGJDSWtzb0lZN1pQZ29IdHBlNzYxL0R0SVozdC9ZcHpLaXExbjNtTVZO?=
 =?utf-8?B?akpXWWNrbjNrd1RZNkJUc3ZzMnZpUmVBN2VnV2tSUWxZcW1BTTlmbnlzamt5?=
 =?utf-8?B?cDhxaHFXQ1pWdW16bnJqcEU2OTRkUzlUMEIrWlBUNzJ0d3lHU1NGZlJhY0VY?=
 =?utf-8?B?UGRFV0NyQUc0Z1VJRk0yMm1QM3lTVnorREZOTE5PRGFsODEweWhNY2txNCt0?=
 =?utf-8?B?R0ZBSUs1WkVTRDI3aEVxSmF4Rk8wY1pVMENFK3FCMkN6UExjOVM5MGFFelJJ?=
 =?utf-8?B?TWpubFdma25xelVKbGIyVU1NM0JsZE1QT3hhaDVsdkxlRzV3bmJRSGlPckZF?=
 =?utf-8?B?MXBDNm15QlNnbkdPa0JaZ0ZIcWtyTU1RamRMUnBMOXNwbUF6RnJSK1lneUdr?=
 =?utf-8?B?NjFESGJDeTloc3kybDF2aHpicEkvamkrMnhDK2pQT09EK2V4aUIvWlRpaGFw?=
 =?utf-8?B?UU5BWExKdFJiRUlKWkRLa0JHcGU5VXNJangxTVY5VzF1b3RUckkvTEFRSllS?=
 =?utf-8?B?c0k0NmV3dWl6KzBOWGJHcENhZmEwbVRPWXFZNjluYUhHOGdvUzhOYnZFQU5R?=
 =?utf-8?B?NU5hMjdXRmpHRXhmSDkrd1FVajlDN0dDMVVpcnFZVFRzOW0yaGxHNjZ4NkNQ?=
 =?utf-8?B?TURqMld2alIvb2k5UlNKaGlES3IyODFCeE5scGZZK3hPcjI5VFZIOHF4NGZN?=
 =?utf-8?B?bytSNnlwMkpJRzY0MnlpL2cvODhyNVhFRy9ybmxKdU1SZW0zZ2svNGhWcnZ5?=
 =?utf-8?B?ejdsN3hab1JWU0taamZzK20xbGVJSm5lYjVxTEdNWGNpUDlxdldmSDFBeEhJ?=
 =?utf-8?B?aVlsYU9rUHBzUU1SUFM4UXQ5d2M4d0VSWUx1UzNTUHRIc2tkYWFyM3VXMWt3?=
 =?utf-8?B?NVk0QzNhLzhQbXFUK0JHeWswbVIvcGR3dUVBdWpVWXNwNHZyRXIxNnJIQU5r?=
 =?utf-8?Q?zNwxvkAk+Dekflwb+lr8NSf/r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736dabe2-4459-426e-7a95-08db3520cf7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:25:24.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHojTxkwcnM5KxxqMO0v1yoxd+LWglPSyzc8t7y099zMTc7kyXO0PthkIyVXjB9glU2aTEU3n88geekI9I3fTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223

On 04.04.2023 11:52, Andrew Cooper wrote:
> With cpuid_policy and msr_policy merged to form cpu_policy, merge the
> respective fuzzing logic.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



