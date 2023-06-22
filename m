Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F65739AFE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553416.863954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCG7n-0005sn-RU; Thu, 22 Jun 2023 08:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553416.863954; Thu, 22 Jun 2023 08:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCG7n-0005py-No; Thu, 22 Jun 2023 08:57:07 +0000
Received: by outflank-mailman (input) for mailman id 553416;
 Thu, 22 Jun 2023 08:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCG7m-0005ps-NG
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:57:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cfb697-10da-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 10:57:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 08:57:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:57:01 +0000
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
X-Inumbo-ID: c2cfb697-10da-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeiV7+awlN7hqUDwDL6k3uzD3b3RvpdBZuJ75/sEimMsEjOM3UDibrZYMQs/d72er0Sx5KS3A6BVLbhy6kLUXOSi5cPuhuqgsf0NJLdKSKvyhjk9+EYIZSJFhtPD+AV51L6FU6k6D4uTYXEKKBJ87BDHsX0/sS+6ItX5Wl3eQb6RCOBWt2A+AoV17qzqJEVFPmBIl8V/ExWQGBojJGP0MNs+ZBhJRokMGOXfjljSVlLhT56tBKrcUr3ydPIde64hO4XHmECWrM5ZivgXlIgLMhC0Z4AqnUHUjd/bm5dwYuoOgtOgtjjQkRuZnwMUS7dQZ0eJHmfTA2bPPROD79zyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfoinNXLdfvGfuSX4JYQ41+3P9uPb+XyS+vBKZ+ffh4=;
 b=RdI6c+Q7OXTopeQFZ5EC9CJVbCcfQAfRmbd7lonzqMrw7KjAujsS8xcwAdWlzIhqEAWJrgGw/siEz/tX0eYByz0zu4kljpxF0ECjDrTCVZ8bMjKbcQ8C27FSJLR/Ke1Fy2EvpY+NhEX8jKIkSHVO+0m4lcJoTtv4VtkfgnbRBVYyG7EmKlJmvnY8VD5f+jAmOlx2Nlzaiv3/uKqYEhqqM02PWob6EFT9Nlh+9x6/ib1uSR0VRvITDlfFEKG4t48Ry0JlTGbPd4X+ao8Syi6qy2qpsRCsW78FVeE4SA8sCGVnkAGeP3lmHTQ8/+V7nig6YMhW4GDKOn5wi9gwNGLk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfoinNXLdfvGfuSX4JYQ41+3P9uPb+XyS+vBKZ+ffh4=;
 b=qtZTqvKepXZT3BLQNmSXewrfEhp9n7oNH76l3WX/5pVccfjJNNjgAUEDoFs+OZ83QPuwSv96PV3Ae4GVua1FXgEQVr2V6RoiSz9OvFp1SJFnT3SqgJm/DkTjtifgPBS6WE1xGTKqpiSiQs9I3yqEdCQZTP7IC9GyUI10G/x1pBK8h7XcIQc0N3k3fJRo6jkxBqMUyH8nydCxfUxBaPBYOm5fp/NShA2y+DNm5LUrzIq5Ubtx5TGsg+7RUVz5+MCTFEJyWOGfUOlXUEAr+9+8MI61MP8g1KCGTnbgrQApnyXJHCDf8qs9CJRQETJ7LCUpQ1I1cjVRvYb7gFIvRdt1vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2cb3db9-50a6-f620-8001-1eac8586ad61@suse.com>
Date: Thu, 22 Jun 2023 10:56:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <db883456d7d210e2ea9ac4a7b402dda73c3ea8cd.1687421893.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db883456d7d210e2ea9ac4a7b402dda73c3ea8cd.1687421893.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 01470250-467f-4d88-d739-08db72fea4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8g7DHBpPnpeNr6TiAA54D3NlOhtRnxCxxP0u+uKcDc8oMXa/5CvJv4OkulcY+E3VyIxLO+vDfqGQwsSldjc+sWNI70TRuyevCriXxLbDgay6Od2CeEjoMUZpSNBZeISsquG8dpov0H/kQNK6yWb+Y1nLN6o5mMCVKTD2Vq+H/G6N11jpPtk+n0AkDUIwpJule1yiv017iV0PKicsa1YrcI3RcU5GGZ1SchcXT0bKbu4yyQkNY556ze1MDS/AQnLbP0EUcqOSV0+MbkBErYZFbiIOQ/9W7OglBBxRtuNk/66dz7um28VxGA14/35Ki4MospVS+lbNKmPgvwYAD6ZZkaM7sM93v4lUqiTcEpx9ikivN8ucbaXlLoJT0jQdrwgJUnBkVbpXWhVRtMNSdFNj0uqyFUzDhCm9BVorkDqt/ZlB7nUETKYRpJ/s/EepIWwdvvUV6GQqVejMS8uBjXvG5LfqqIfL9tFIT9CaOnAH78Xe6qeW8NZeC9oFXPMWHWVKqEaALW+oASDzL+ipayx1dozXuH/aQTLjlpUZAbMtX7o0rvo1kf9g8FmM8FhAUrmSj13LVDMKYqvBLf9TBZeeuHAOODKy47RjPltoNgVDNBerHdDbnp2I7a18a5/AJZhqJubwNN94cxaoWLN3jmGaCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199021)(31686004)(7416002)(5660300002)(2906002)(6506007)(53546011)(6512007)(8936002)(8676002)(186003)(41300700001)(26005)(2616005)(478600001)(38100700002)(6916009)(66946007)(66556008)(4326008)(66476007)(86362001)(54906003)(36756003)(316002)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjI2NFV3YzhiNG5NSWRGQjM4dUc3UVN6cXRYOW93VDhLNjRHN0NjbjMwcDRJ?=
 =?utf-8?B?TDlDWm1idUVtaVdjREdJemJYVHg5SnJoYnVGTTVNTURPT1UwaHhlRFpadXZB?=
 =?utf-8?B?Q0kzZWZWdE0xdHVraXZNU1JxRkFBci96dEpVazZXUUhxT1FPYkxhZlp2emtS?=
 =?utf-8?B?d1N3MjZteGRjMUJNUEpHWFBOUS9DeEx6MG56bDgvUEZUd2JOSHQrTUt3d2Jp?=
 =?utf-8?B?eUpWVXllWDZ2NVhNMCtSKzRqa0VCZ3VQVU1UUm8rWXRFRnNsbjViUkdNOWJF?=
 =?utf-8?B?eXhRaVBmby84RXN1UDlqVVg5V0dpTUt2SEJad3BtRUFSUC9iZ0RITHlyNGps?=
 =?utf-8?B?S09xTUI1UGNpK1hCRytVZFdsNkVHbm9hM1FyZGpQNnk4S25xRkJSYXM4cUpp?=
 =?utf-8?B?U2dvWHhWaGpBZXozVkI5OU9pYkdQRjd6R0hDVEowSURNeDkrQVdpcllZd1hx?=
 =?utf-8?B?aWdNdkp1SWM5RCtnTW5MV1V0QXg1R2ZvZTVrcllXVyt2bDhFNkxtbHNhS1J6?=
 =?utf-8?B?ZHJxY3EzanY2YWRMNXVYa3lLZ3dPa1ZNL0JnVkV2ZndkYWUveW5JbFh0ZC9C?=
 =?utf-8?B?dWE2a2QyNGlSQzBtQlBNQWxkMkpKQytsRzBNMzZhWkM4M3QxTmhtNmw2cFRa?=
 =?utf-8?B?MTNoNG9KZi9pMk1jTlNPYmZyeFNocnVVMWE0MURNUzJSTk84NnNQSG50dHFG?=
 =?utf-8?B?WmdXNEl5NDhDNjh6VVlRSlA5TFdZNDNIOEVIVHJLY3BpMThPMXEwc3F5UnN2?=
 =?utf-8?B?eUl5aGFLdVh2T0MwbWQ0ek1laG5GMkNrSGFLWlRQMzlMVEpYSHl4aUNGYW54?=
 =?utf-8?B?S1NtNVVWakdrTjdjMzhGRzE0aHI5MzNSbXVGUVJrcFZwT2FrWEJqeVVqbmRV?=
 =?utf-8?B?Z0RpUllaNVA0ZHV6Q05MaE9GdlhCT0pxQUhoZG1DN0dSc1VQM1EyMFdFcUlC?=
 =?utf-8?B?dmhORktBMTZpVS80OW1XQTUyaTR4eUhVblVKc29ibFVFbmJFbUc0QWhTcW9F?=
 =?utf-8?B?VjBLRzFIcjVDTDZGNThoUVpsdzlmL2FsZ25URFYxZU1yaFhqYmVWS3BNM1BS?=
 =?utf-8?B?YVovS3Fha29ZZXNPMkRrd1pGZkZLS1FrZ2pzWldnSEpDb0ZFenlTcDNISWNq?=
 =?utf-8?B?ZDQwRGRrSktpSFVUSWNQT1cxZGRVdFRHUnpNZXl5cjNud29sK29MRFgzbmNu?=
 =?utf-8?B?a282eDlHVVdYdXpET0pyUmNZbGtLaUc3ZDljQ1doWitQL1F5QllmNmtTWE1p?=
 =?utf-8?B?TnRneXpnVFU3T29jZG5lV2tFQkVreEZIak8wc2NOM3FJbUJsaTZZN2xvd1hL?=
 =?utf-8?B?SlJOL1p0ZzI1TkJTdHpNK1A1YUhCNVRtcDdxK1NUenZXWHBJZTZvWEpzdmc1?=
 =?utf-8?B?amFHcHRqQlZYNlZRQzFlVmJrREo5Nk85TUxmUXlvdXIzNGVPMUY1cnlkOVZh?=
 =?utf-8?B?b1gxdnYwM3g0eFZ5eU51YVZDZVg4YURpN1NJTHRZUHQyVFRoNWVpZUEzcmxY?=
 =?utf-8?B?aHZuWXpLVEdJM1ZUTzBsY1NhMUwxazVPSEhRTGh0QUgyRjF1blhaaU9nY09z?=
 =?utf-8?B?T3A1OHhSL3RCbk1hS1pORUJWSEk2TWY2TW55d3F5YTBNL2MvbHRHWnordEVE?=
 =?utf-8?B?Q1lxRkxTbFNqS29mV25WSHpSejF2cFYxZ0xWVTAxbVFTT2YxSjZZbVBraGRz?=
 =?utf-8?B?OVdhRGwycFVaMDQ2c2VLWUJTalFKQk1KbmhZSjl5cTkvdjkrc3hqb29RWktF?=
 =?utf-8?B?aFREdjJOZGFubWtSQm9nbGdhTlNWSjBUa0Z3UWQ2L2I2RWQ3YkNZVkt4aEx1?=
 =?utf-8?B?M1hDSHZhN1IyZlRrbUpPZjB3UWRZUzB0MFRHSFlPb0g5UFdQZFBjd1BXKzN4?=
 =?utf-8?B?czVZRStuV2F5Z3ZPUmV1bnA1OWIwaldBd1dxVVdEeW51TnZjbGkwSnJNVkNt?=
 =?utf-8?B?L3ZPMWQwcUVTV3o0NHJ2SjMrR1UxN3dPdmZ2Vmp6azBFRGNDKzVEb3E1S3dG?=
 =?utf-8?B?S3I0dEVOaTFSQjAwaHpwY1F1a0tCZk5McXVpRlA5WUdDVTRwUTVXbDBseDRa?=
 =?utf-8?B?Mmg1YjROcCs0Njg4ZjlWeXZ1VmJTK2xYaDluRi8vWi8yYlllT1RvVFd3VGpX?=
 =?utf-8?Q?2iUXlJAKFRjWyvm86EsaAPPdz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01470250-467f-4d88-d739-08db72fea4d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:57:01.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aEA5MJbWlRbkv1eOrwdbTSZpVM7CMYcvIuzJZFlxz24vLdH0OY396mUX22K1n5cb1f06RtVN3pUCC+x+XF/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

On 22.06.2023 10:24, Nicola Vetrini wrote:
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -51,9 +51,10 @@
>     e.g. in a structure initializer (or where-ever else comma expressions
>     aren't permitted). */
>  #define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0U)
>  #else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : (cond) ? -1 : 1; }) & 0U)

Given your remark on named bitfields not being allowed to be zero length
(which hopefully holds universally, i.e. isn't subject to compiler
extensions), how about

#define BUILD_BUG_ON_ZERO(cond) (sizeof(struct { int _:!(cond); }) & 0)

? (Implicitly, as said before, I question the value of the U suffixes here.
Even better might be to make sure the expression is explicitly not of
unsigned type, to avoid surprises if someone used ~BUILD_BUG_ON_ZERO()
somewhere.)

Jan

