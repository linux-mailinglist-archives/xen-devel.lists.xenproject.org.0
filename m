Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45A759499
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565790.884300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5gn-0002i0-Qv; Wed, 19 Jul 2023 11:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565790.884300; Wed, 19 Jul 2023 11:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5gn-0002gA-ML; Wed, 19 Jul 2023 11:49:53 +0000
Received: by outflank-mailman (input) for mailman id 565790;
 Wed, 19 Jul 2023 11:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM5gm-0002ft-3v
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:49:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d705c62-262a-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 13:49:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 11:49:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 11:49:20 +0000
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
X-Inumbo-ID: 5d705c62-262a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSjIILZcL2Yx1UBFTPa3cZdzw4OiEnCuWB8mEe0DxhkuYElE19Vm+qsqUbjlpeTQGYd4gIJfvt0Ke97PplOKYpzRRAAwV0xm0gf1MEqzSa9lTGK/9TaQ/NsatAyAojQ+4vHtPpZFoHNcGdL/zrShuip/XqvlUs6DhWKX7EXLSdgdxbZ9oYRq7jZmk+GGntTutTwYmLC1Dv7AcINGWQccR+2qvyiw1tGZQp4hLWjEVVEIVary02KuAs1iRCXVB8UXcO9F+rWVtGUx0R3dgElZLBjrD3eO458+GsBCbgKOExT06XpUYtFZ51QzDN5hQ/yh/EVoItiLjOm9wokvmAsQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwOxv1I4WwuFX4ESSMgQPQjzT1Q7GW1/04nr0SYMs/M=;
 b=HvLRr2zGcisKIlKZMOh5aaQEnM4ZzImEdcPiPrejFwy6NgIqyBZDXHUNCkjHJc1S1/7R3OlXmM1g5kOjpqtznaL03St46+3UCQo8udv7lyjJHrItpj9Eco8A8q8FzLFXyU+lKEUWBhgID59gW9scSiHZSQiosJA48w7LBbJGa2eNjMlmRB/JeeIvjM2O13E8gywSXoam1G/0LV47LN4CvCiHnx5pa/TW0L2vgn8kzQNboDCOCI9aNl/zeSPQ1HBVZLcmPlpsMOAI13o365+KIvFR1miEvaD6/vn/hyE8Uo3fPRpPyWH1wt72H7cuiv7B+ENGxr/qx5ozH7a7vgSiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwOxv1I4WwuFX4ESSMgQPQjzT1Q7GW1/04nr0SYMs/M=;
 b=FZtA7jCCchuREx5H5bh8ktUEkTYqkUhhUQUecSOEc6Fs6jzDzT9XBpPlmvBt/ymeGTLDPymksJe2DpUlyG3Rb2faP4hoVb1qxtTEeZTo2NKXWLBABMzknVAnd4BejKdhjre0PBaFmOJmWIepNGULW64DDKSU3hpSR82cfAFQGdR84MXmLrnSGvA3w5zKpNGF0jn1YcT+NsQJLxQLX4Mu2Td0SoCCf/xr2mLwdck8iiltXeGs61ulFnFup4KPOnc5FAx8JBiWj9onHQId8941mEyUjx0pEQFwwhLt4tVzpYCwFA2sCaBUGkVhItAuJ5IRXgZKdtMV4z0sTx5Y19MN2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a11e332-fbfc-4aaf-b824-682eca87d345@suse.com>
Date: Wed, 19 Jul 2023 13:49:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/x86: Use const char * for string literals (2)
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230719110239.4065060-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230719110239.4065060-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: cd078cd1-edc1-413a-517b-08db884e3074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdYOeYnJDSTO0GlLXNj/+C3VrJdY59bNd0cq92m9v9awe0aIHjpNDx3wvmOPRV50sxlXJPOs2ub6eTekb+iZB87Jn2/k8G1UBa9H3vmOIc7laaPmXz3Cha7ErCRnNfnmLig79F6/Sk2dvAITpvTQAqAfR/NSih1UJ5zN7lAb9Lw/wWvqSHkbKCKqSFNcteZa7FWjykVnaUEH/wpAQVRzA4mAkpfwiB4l8eVkN7GwV17PhKW3zHkEhA5xjOfs3mouYLBnldOtsGkJT6bTQJeF6uIeQjXO9VWe4pF8fqr2X7iV25gHHra7Spa2eY/8IZmptB4qevC9hBVPSNF0131M2huaOPQ2xR2i30pMNzZlr6Kf6fN4br0BEJCoNt3+njpEHB0NZ3g7ApdjfB69z6kyo1tA5aSAbQt76CiZiIMkQoQh+NAOxu4EH3Noru6FZVdrT+wdgfXLj+WyRkZnoPl5byk/Hy6voqMU/5eKrnGYQ2FfgGL0vJNVEJtsfsxK9BNUL2xYAmBYpXPpbNK8e/Bhi30+8dzpF2yz2SWVUJ8lAiEq9so27TQoHvgw+ZMEm6xjLu27vRpqMHk31TFa6Gv+/+qlx4A5qF9b2sxD3EKH9B5VFcNw38qkqCwM6Pq3cUvNx95tACGhSHkkyci/r3aiBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(66946007)(558084003)(66556008)(6512007)(6486002)(66476007)(2906002)(316002)(53546011)(8676002)(8936002)(6916009)(4326008)(36756003)(5660300002)(6506007)(2616005)(38100700002)(186003)(26005)(41300700001)(86362001)(478600001)(31686004)(54906003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVIwSFRnQ2VEbG4ybjZYSVdjbUE4dnNnT3MzQUtLNDQ3VnR6dVlNcWFNbEdX?=
 =?utf-8?B?aGdJNHhWOWxGZUk2NUR6bGhLdEZoUUszYitSOWovV25GQnZVRTNiRXdaWDRS?=
 =?utf-8?B?VWRYOFJ2enM5djFPakVZOVV3VHJLbDNCd1YvU0dmN0Z1YVBnaHVYVktWM0pF?=
 =?utf-8?B?MFdJc1hlTmV2OE16U2RuQ2JsZ3VZTzZMWVdSV0JpNS9EWUdrOTNxMEZLWTBS?=
 =?utf-8?B?Y09nTi9nNGVlY3prWXN4ZmNtOFFkWkRFb1AxTHlneSt4NDgwK2NXdm5wVWpX?=
 =?utf-8?B?TnE1TEt0dUE1SGVOUTFSWEVTR3hQVGVUMUtKWWI1Y2lFVkRJcks5RDNxZkNl?=
 =?utf-8?B?cjhYcDR5ZlBsRFB1SEJhbmwwV3RHWm00ZXZFd1B6MGF3N3lxeTRucW1Ja2ly?=
 =?utf-8?B?WkxLNmpmYjN1NWQwTWk3TkRxTmJTR2xEQnRJYUE4NkN5akRrVTFybEsvR0pj?=
 =?utf-8?B?SXI3aVl1VFA5RWFCeG9JRlBrd2FWTEprSlN3SVFOS2JFRWoxcDRTUjlXd2hh?=
 =?utf-8?B?d2NoYzBQbHRyLzBXSmhuL2o3VkNvTEtpRm1qd0lMZ1A5aUJwa1ZtU251QTNU?=
 =?utf-8?B?M0gxQkczZHA0SXZ6UFJrNVJiOGRTYXQzTDcyUStxcXd2dkZSL1hQTWMvc29W?=
 =?utf-8?B?NXlNeEFzWk1GU0tqTmhXSVAzMzQzM1NZby9mcm1wN1RiUTJ3cm84bGszZVFn?=
 =?utf-8?B?RFZBbkZNMlFVZzlMZGsrYzNDR2s5MXVBMkVPaDYwNHlyYWk4bnFGZ2gxWkYz?=
 =?utf-8?B?QjMvUFhPTUxvUk9ETmdZREQ1cnpwbTFJOWZjWXJOK0UrVW9jcERXZ2ZGd1ky?=
 =?utf-8?B?aXVJbE9TaFVLMG8wZks4TWRVWmM0clU1a1JLL2cwMVNHdW50cnRwQW5Ld3RI?=
 =?utf-8?B?NHQzOFlzV3lROG1hN1BVZEpmcS9yQmJPZkt4TVBIbUM1eG00Yk1JeXVKSEZG?=
 =?utf-8?B?MnJ6ZklqVWpSU2NYQkpqbDZId2RWWjZ0empwYzAxUTd1cVRzUWpNSzVPWDVG?=
 =?utf-8?B?MUJQTFYxWFpVcFZveCtOaU5TUXYxSGc1ZGN0eHVLeUpxMzA5S1I0d0w3cXNt?=
 =?utf-8?B?Y3JkMkhXeHNGN2hEMG5sazh3T0d3MlhSdStCblRSY2FTQ2I0aHdmRDZGUnRT?=
 =?utf-8?B?YXpUU0ZCTGYzUEV5UHViTjdBc1JTY3luNVJJdGRmcVFzMVhqNldmaGZhNE5a?=
 =?utf-8?B?aVdZMjFsQ3R0ditNbXhpUnRVQXkrSGZvbjBOL1R3Tm1XVHZIR1dFU1Q3dlk5?=
 =?utf-8?B?TWRORmdVTGVSM3AzU3FKYkRzVzFCMjhCTlU2MlNoTFVUQVA4cnZGTXVnbXFt?=
 =?utf-8?B?T1ZUZG5CeGRKWWpFdGVJRE52eEtPYVBoT09tVFJOUS9KSEFsQ2RtUkIzTUsx?=
 =?utf-8?B?emlOS1pnTlVoaGpOUEhkWktwckF3b0NPTkVrT3l1cUhhNkpXSGV5djBiODhH?=
 =?utf-8?B?MXM5L1Mrbjl3empKY0N1UEhvaDIvUnZ4NWVvK0x3SHRudlUrQmhOWnEycFdJ?=
 =?utf-8?B?eC81NllPZlFHbzl3VmdOR1dmWFZWQnNvczh0OEpDdXFXNk1JcGtPeDdFR0E0?=
 =?utf-8?B?RVRCTkN6MDZZTWk1SDIxNGJYNllFUmgxVmhxc2FsRTFrWlBUTUt4YzQzelRN?=
 =?utf-8?B?Nkh6L3hOWUExajlVNmkySHppZzNnbWd5NDFrNEltMFptQi9MZVhPUmhoNzJi?=
 =?utf-8?B?bzZTbEVBenVGZWRXYTRpbENMaFl0RExFQnl3N1E0YUVCaGt2QUMrK2J2MS9r?=
 =?utf-8?B?NXJGWkRvMmdJSFczUWtBSEFnYnVQdUlqWEVGZm5ON2cvbktPbEpoakpMd2ds?=
 =?utf-8?B?bjdmN0FWMHZMbStxbmliQmVxTENvRWdraHVTV3dLbTc5a1J1a1p5UGNRQk92?=
 =?utf-8?B?VDdMc3hYYjk4empJT0ZNeUFMazJGWkswU0NsRlpVbWNkdWJ5T1ZMc0pBZ3lu?=
 =?utf-8?B?eG0rMkY5bHJBK0hYZFlhMmdSVjVGK05UMEZVajV0UHpPQkhSZ2JvUHpKSi9u?=
 =?utf-8?B?eEtDTnBpbjNtRG1BT3A2U01senFyUFNkeGRSYUpGS0pDSFpFMlpxaHBneURZ?=
 =?utf-8?B?SnNMK1EvTkZqS3diZTNIWVd6bXl0L2h5Mnpjajh2Ti9LS1MzenBXMkE0R2pp?=
 =?utf-8?Q?EdyGc/5DX61NqkHADdklRHGiU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd078cd1-edc1-413a-517b-08db884e3074
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 11:49:20.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lf7pMNV3IXC1seRHwQ7q8fcLUwwGvx9crAbD0AT20GAC1E6NAx3/nxxtBU6Q1pTUAX0ApIS8XAgsqf5TepTkxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485

On 19.07.2023 13:02, Andrew Cooper wrote:
> This hunk was accidentally missing from a previous change.
> 
> Fixes: d642c0706678 ("xen/x86: Use const char * for string literals")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



