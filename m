Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D26CC164
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515862.799143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9jY-0001TV-Fn; Tue, 28 Mar 2023 13:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515862.799143; Tue, 28 Mar 2023 13:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9jY-0001RB-CR; Tue, 28 Mar 2023 13:51:32 +0000
Received: by outflank-mailman (input) for mailman id 515862;
 Tue, 28 Mar 2023 13:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9jW-0001R5-T2
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:51:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a34a000f-cd6f-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:51:28 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB6930.eurprd04.prod.outlook.com (2603:10a6:208:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 13:51:26 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:51:26 +0000
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
X-Inumbo-ID: a34a000f-cd6f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXUU1SA4cIrWhYd9O3Pi6pyRGcLq/Sd2esITsCq8ghao7riLcxyAhHfb7H5OnhJnQSdNr0cFLGMeOaEb7FKgv8wLQQXPVc3BB9dKFpsmPu1Qul/eh/bJBbiWKVI4jrqT7y1yOC5GkaSPYNqVZUDl2L+WNwGHVRZrmQfZI/ormiPNSJlLULjIOkFfUiRDj1RUY2kGCL4z+Tpyar8rdH228EcjOcjQB8JVtfS07a/EfePa8vfcC8E5DYff38FUY0qbJBwd07641v/CVd8zGc7cTQlwSp7s+yJd2oSwYHWvbP/Shn6pmXOBXUFf4hy8RneFg5ZmaDV0I4lfzDKj/uTZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZcaX2y5V1bTP0Arq0RT/OQDF/ptatLDuxmANi7x0dw=;
 b=D+VV9jENRT/qoEd9TV2WTMYMbYm/pIIhTjXgHxAmp9SeESirIY7JkwLn2NoNcIvROtr+TpdbNOTgj2H1XeRLjHw4dk9Zp7FmyRkSNphosZytWhGMTMFvBPGdoDVbQa5aZHLrC5juUz+Nv4GiBvr13SCvUvnjk6F1/0Q0oNNfYIWngLTjL38BAXfkw68dlUyyar2FBzcRkskXaxJIICfQpXkEvegZq5WkuNc+ucltOMQ2EShFuRqjU7Ktf8h6MKi6ovoIx7rGSIuYsuttdkfixusORoHI1XsNOFu3xZh3QzRjxFNbvtuQXPDmmX3Ziiiiv7h5fLgWK4cm2p/uYAtv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZcaX2y5V1bTP0Arq0RT/OQDF/ptatLDuxmANi7x0dw=;
 b=FLqm6X56Ottg4NUzEJI9lVfQB8p/r5X6sd9iuf9xEy0xXXFEjHTRZ5W5Y/sCA3z5oRcAcgp00JCSCsaglMiNU/RTJMy8cpjXPciYQ+yFdGPRb+svoSc4sDJGeEcy/qpCtY3gqLsVmgKxJHmzgr6Xs82WKwRTTeKqMcMd4ukS8fNNzryUAWfkd22zlhUZsdNrX1XY1hXqw7DTbMjJE06JK5Ju3bIsgUmFqV2EYtwJNmk7OkxeXbajilZAqeM+PVgPZ56AieXzVnrtP0dcBCCcR/spPExOsMwovYo3+azUlIH601sgkPwq9SwGnP1dVaLWIqARD2iHCf1vjAssrzqb3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
Date: Tue, 28 Mar 2023 15:51:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into
 microcode_init_cache()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327194126.3573997-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 057048bf-e696-428e-7990-08db2f93864f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qCxSGP2m6EeV22BZoZuFu6wVB7zs6BeK24WEW1nkd4DvTFIMmyLQiBSk6MMvVHh2GbY5SGffIR2VjIMMHQJo6zFVHI51BebUwcRtJuuBTV66yg6zL+wfS11T5yBMGdCKhCG5rqwhW5tAtt3GZq3g8GXJ78nXhEeCbdIIuqGqj+JVfh7giox8tFU8lF4scaQtfY6ntxrL27lh/GYNaGPde2wFm0qW5GDIdcSFDxV1fD/K6iHDeblG98mUKBoQrIdWMkAQfMaS4DdCE1q9m4k0zgvOgVaQL36wQHBfiPeurgAe8X13tKLSgZiwIyvGpkQpYlIfytUh38lFWx522qUZcjWoT1F9QRen5e+1vRHB4Tyfim4HsMOaj5Crb2HqgjvaSOxwZ5T1B/+Ml8M2ouWzSibCnOqCtD+LrAcR8tCNc9B0DKENTYTqXFqvpVxm4t5cBV5w2V9vFprxh2ChasArHPZfcLhV20KLgE0f1AxjtI1xZEOWBf0l01dFf/qbMMTNmsVI3JcMgozaxn9zPJBmdy6j2eOvdbbPwbAgxvg0NuN1ypuISmPTREY0XgIk9urBan6fXiwtmjw81TcMMokAIRHhK/0fb1Bg4baWFDCKSZxGEh+Jijm8emOvM4kDdmhJs3W+zKaw47Z3BbfcGivN1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(36756003)(31696002)(86362001)(478600001)(316002)(54906003)(6916009)(6486002)(4326008)(186003)(66946007)(66476007)(66556008)(8676002)(41300700001)(6506007)(6512007)(26005)(53546011)(2616005)(31686004)(83380400001)(2906002)(8936002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhvWnY4RnQxL3ZhUVZPNE93aGVxaXkybEs5eUhCaFN1TTgxSFd1SnVDcFlY?=
 =?utf-8?B?UTdoOHRVL2ZKcVlQcGgrU1ZiREczM0NHdkY3cWNhc0t1OFZmZXgwQ3Y1bjlI?=
 =?utf-8?B?MVVPSytTSk5uTDBSNVhWcVl2ZXA4OTd1bXpueGZ1c1IrVkpELzBmNVo3N0VV?=
 =?utf-8?B?Z1c5ZEFrRnQxcG5nRXloZ2krZkMvdUZGa0djSjFjVmJySEcwRGRGR0c2Mnlo?=
 =?utf-8?B?U3FhaUxEUklabkJ1aENaQTUrNGF4WUovYkFWS1VvcE1IMEFGSXFqWmg5bWNz?=
 =?utf-8?B?b2V3bjJ0SmgwOTljVTdKWEtneTZoWW1BSzd1ang1S1JKb0pHOTFBaFNseWE0?=
 =?utf-8?B?S2FrYlI3UXJaanEyaFNmWndCL0RrVktRVXJqKzZOa0JuTnE1QjhSY3NFQXgz?=
 =?utf-8?B?VjVxMEFvSVZxMzVzZ3grVFBMWDNBUmRWc2JqSEF6aEpPTEZzY1laSkRCT2xP?=
 =?utf-8?B?bW01eXozaC84RTl4aVozMWYwM1hNWmpIa2VQWkNCT1Z3SkxhYjhFQlR3QXZC?=
 =?utf-8?B?allEWUcwRnFTWGo0Nm1XSTV4SDFZY0d6alNJYTExVlE2eXNvcnh6WGFhTUUy?=
 =?utf-8?B?R1dJQTZYSFNpNWhiaFN4WHM4TW9CQmRDZytyQlR5R0JhUlZ1THJaNjVrdWhk?=
 =?utf-8?B?eUVIQTNhSGR5dGd1aXZDbmhsS21jV2c2T2Z0Y01DR3VPMiswaE9DMWJsMDNo?=
 =?utf-8?B?S3ZjLzJVUDFyMkc2UFg0TWtQK21KajFUR2w3dXVJWk5YWkVkditxYmxlUDF0?=
 =?utf-8?B?UDB0b2NTdHpPdzMwUnZFbGRhTjRzblp0MklmZnNQOWdxTWxySkxKYmhFbHhl?=
 =?utf-8?B?STA1L01zNE9ZZk54TGJUQ253ekpQekY4dmxmRzZVVzQ2Y05qQlNDNlNSNE5H?=
 =?utf-8?B?bEU1ZzgxMTRoOENUanJORXJLS0VTc24vVjJUckNXeks0Qit3T3hMczIxY0Va?=
 =?utf-8?B?L2QxQkp3dVE3R1RsVzNxalNneWJNWWNGUGVIelgvdnZSblZoVUFWMlZSOGdJ?=
 =?utf-8?B?TFdJRW1mVnN6dkhwUGJlY1A3UVdCUUk1bER3QmRKRS9jQTlsTXJEN3B1cWlj?=
 =?utf-8?B?c1VpSHVkZ1JLaEtidWZzdCt1a1RWbStuTWFteDAvYSsrZFhqS0NGYnd3SGRB?=
 =?utf-8?B?SW9EWVJuMHRQVTgzNnhMQnBKVVI1dGhCNXpUNG1sZVByNmx2MFE1cTUxSEti?=
 =?utf-8?B?UW1hVVNKN0ZGMmlGOFBFQnNCQW5mUjVnYzdzWlRWMXd2TzZWQXJGUmJ2aUMx?=
 =?utf-8?B?MWVSTC9GUUxGb1diQURkYlFKV29sU1RUanRqTExzY2NkNSt2dThTUUF6bWky?=
 =?utf-8?B?dEVVbVo4c05nOWhUWmFwVTZLZ29oZXAwTkxwMTBmU2xVbzlieHB6UVB5WmtL?=
 =?utf-8?B?VlVJMmFwdHFxdVZjWFdzd2RkY0dKaG1mT0wvRTNaMWZtejI3OVIrWlhIT0VC?=
 =?utf-8?B?MFcvdUx1VSsrYVFySWFFblVSWTdpbXJScXU5aHpGcHc3T3AzdnkxQVc5aW1z?=
 =?utf-8?B?SkpTN1dmUnE1dGhkbDh2TE95WkhtSy8xQUNSMTI1WjQ3b090bmM4MlpaVlo0?=
 =?utf-8?B?OUZPNGg0RUhzeGZRUkp0NHdyWVpMYWtrUmwwVEVIV1ZJMlNjd3JoaWxabXdo?=
 =?utf-8?B?elhjSUdUb1NBOHZPYlB2RHpqWllrTlhUUnFlSDBjelFqd3NzbmFQeExmSS9i?=
 =?utf-8?B?Q1pjdXIvQ3Z3ak4rOGlkcVFqNE9XdEE2c0liZ09DWkNsNkMzbi85OTQzdVpK?=
 =?utf-8?B?RlFNdWFWdDFKVVFPcHN4SUh2bE5Ob2R4eFdnVVpmeEZpamJsSllXU0N1UWNa?=
 =?utf-8?B?akVoMzFNRkdMYStPZEVjeWtGbCtnRWFPU09HQS9EbjAyWVpKaGRnSklvMFls?=
 =?utf-8?B?TmhiZEJ1TEdQcXZ2bjcvOGdnUFNKVXJCU1BiRkx3SkY1Rzc2UzhSRmllcjdo?=
 =?utf-8?B?c3ZOQ1IyS0JZcXg5L0pwbjhtRi9ES1dvcWhyRGtpbHp3bnBCS3hTSmZXeFFa?=
 =?utf-8?B?R01rQjc5bE1LMU0xbkVoOWttWG1RUmVldXh6YlIzcDgrc1RKK2JIMmE2SW9s?=
 =?utf-8?B?ZDRaczlsTHFOd3pvYjRxcHJTNE94VStYaGZQMnE4MWxjWWI5Nlg5UUhBVkRu?=
 =?utf-8?Q?EYH6Dqr5igLclT8OGEms1BAqr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057048bf-e696-428e-7990-08db2f93864f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:51:26.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3lsKbHNcegDWEE95hTViu0flCErci/c0qLiTQklNUOFIquUSo4FfWLIsSstsO6b0YFWDI0sY05kiOGknDKRhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6930

On 27.03.2023 21:41, Andrew Cooper wrote:
> It is not valid to retain a bootstrap_map() across returning back to
> __start_xen(), but various pointers get stashed across calls.

It's error prone, yes, but "not valid" isn't really true imo: As long as
nothing calls bootstrap_map(NULL) all mappings will remain as they are.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -755,47 +755,51 @@ int microcode_update_one(void)
>      return microcode_update_cpu(NULL);
>  }
>  
> -static int __init early_update_cache(const void *data, size_t len)
> +int __init microcode_init_cache(unsigned long *module_map,
> +                                const struct multiboot_info *mbi)
>  {
>      int rc = 0;
>      struct microcode_patch *patch;
> +    struct ucode_mod_blob blob = {};
>  
> -    if ( !data )
> -        return -ENOMEM;

This is lost afaict. To be in sync with earlier code ) think you want to ...

> +    if ( ucode_scan )
> +        /* Need to rescan the modules because they might have been relocated */
> +        microcode_scan_module(module_map, mbi);
> +
> +    if ( ucode_mod.mod_end )
> +    {
> +        blob.data = bootstrap_map(&ucode_mod);

... check here instead of ...

> +        blob.size = ucode_mod.mod_end;
> +    }
> +    else if ( ucode_blob.size )
> +    {
> +        blob = ucode_blob;
> +    }

(nit: unnecessary braces)

> -    patch = parse_blob(data, len);
> +    if ( !blob.data )
> +        return 0;

... here, making the "return 0" the "else" to the earlier if/else-if.

Alternatively, if you think the -ENOMEM isn't sensible, I'm happy to
consider respective justification for its removal.

Jan

