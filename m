Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36255A0DBE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 12:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393241.632067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9wS-0005pU-Bk; Thu, 25 Aug 2022 10:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393241.632067; Thu, 25 Aug 2022 10:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9wS-0005nU-7h; Thu, 25 Aug 2022 10:18:28 +0000
Received: by outflank-mailman (input) for mailman id 393241;
 Thu, 25 Aug 2022 10:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR9wQ-0005nO-Q0
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 10:18:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 412e5b9f-245f-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 12:18:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2600.eurprd04.prod.outlook.com (2603:10a6:4:30::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Thu, 25 Aug
 2022 10:18:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 10:18:23 +0000
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
X-Inumbo-ID: 412e5b9f-245f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7klRiHomUrrkXe402LUPnh67//x7FXTdI6S+uGCXkH//lyw7a4FDYbcOkYhKUN+xZzwe7wMJT/Z2yJinBbutDtAHjcpNduHMB30h/0inM83c1LnZtc6NaMjLWhjVvLf1G24GJqc6doHw28MC8PJkLcdvgrGmt/MaMDzNlKXddypo/NNDB02EtZWOJwvBsbjp+GgBd10RkjB7HR52qlQb/XCoV1t4KdUpiKAO71sNJmrDgOghPBzqj6tH49tiSwYMsXIs5UuB0qYPwfVKbzYnlZRQUOsk35TPMClB/+T5gB5WYN3tNc41S0msWledW8qtN0aUkNDMzPQVwX7y+Jteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TO/Wkl9OWTNErk2uogj+5BpYOVrbr1YzUDiHC8McFM=;
 b=TGKow0jEWzvaDSPmuttNIi9es3t4KX0OmZ4I2Gb7LVAYwZ7le8nLhimWcn64AGsXT+NLSC/Klg+SqkDJDcTbS4MoXHT4ClGa3Nfhosi+GrGT15EpbX/o9C8IrtUtFyYWp3ooWN2A/LmSpYn9L3Tr9z/V/Khbc16q1jOK5Zo1TpSRPvufZr+oOfnfcA14pyGX5SdLpHXMBDLxU/EoSnQrIkwMpq+tgLFLst589EIlR8eIJ+9GKreyyFDdJbQc5KMIftFVz5MNPGDVVIUFwgoS2OJlhgjj4eZdULf+iReZmLi3FwXXKtaW8SB5j7hshrm+T2AiljEAzOrHiR7vL+D57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TO/Wkl9OWTNErk2uogj+5BpYOVrbr1YzUDiHC8McFM=;
 b=eSSLUoE38uLNy2smdfWkbu0pXfSL+nYlEXQ7++Ix4mJzsLtWH0SUlkWZNo/Jy5sXuc9bayJNnXyIyYqZWpqUK9Aya4uK3W+tziZ1t8/fx7y8nqNGIjCiGX17E+UaWuwrMvtH9TobNgBf9HBS9KQyeUGYVLjgJ3g/9IpgmXBj/OCu4VIfrfi79Cwqm6l0zu87f1+riQZe3zyTHK/RpFtvG6mRhCDh70CKRj2PqCqtGkN0qzRSjbKTY0RPawf/B6uLrYHPBeqnvEJv6Ebquf+TeUmKNedx6ZauLfgTV4+vQBS7/nXQr3usN3dmSTf/2tdTub++YBHsaWknUXjE5avy0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <784c1d55-be94-eef9-eb96-fd8fd902db12@suse.com>
Date: Thu, 25 Aug 2022 12:18:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822025810.2240707-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51cf03ef-7dd3-4316-a986-08da86832452
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2600:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WSHdDCF9azJSN9I2uhcGdKe1n7kizUV1dYd7zQL33fgrw2Qxp6/hAqULLfxPFCz2RznnQKEBk9YQj/t0DVbXTkx1lyjdyQCM2nJWHNkoYwd5wgvqWdkgcefaFvprasGn+AAX9fC9CPFd0MoGo2Fm/iUkysnXMe0MLijXnBQG6E8IN7OiotOvM/zSe+7ZVKtRDBi6q0AcKbttObuX0itYPcMO/jjhYC8YRGkfE4M7xRi1/7Ntyz/NQlmivJEkPm4ze4aKrMKlj0Y5+1WKkKVvBDH6aNWaYIXRdpjly43+BtV3W+WJFoQ8KvcrP1h23IyraHMvD0PSoeuwBvSLIMaZkq5VRXjne0ckCw98t+5msBSFNj8h6fGAa0vv9TD9UoZ6o9mOfeUMX7XfPK46XD6C0YHsyXZdj2Y4tLdKdCEi2bLJkeBAQgWdOXO2JF4IUeOFJmroHCtKMNvK5WuVZGiSYmty4YAEAisCe4nsqyhLvN+Yl1tGwFgvU07nejxwsjujzQx5kVnCS29pLIIecq7PycpvJmpN7cp6bj1q55n/hrSHZGw/KhsTLOSzTkNiVZn9nknbAtd1Ty+6S6zbqwbg7mMZDp5tlTlTZ7ie2dKcZTnaE6KHr5u/yQt3t7ddUYW71B+wf4zw3RnQs+wt4MrabzwipjknAHmhB83kIaalZf97m20EWY4jgx1PRPOwsA23rLz+dSamWuAg2JagAhCSSfAHVW3NuNbXrg368PkXP9sLGJqb72pAFNHn/5oNJKLmolUz9IILS84rhtl6q6i8OHOslWggB7rBOngR4b5+R4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(39860400002)(366004)(136003)(31696002)(86362001)(316002)(38100700002)(6916009)(54906003)(478600001)(8936002)(4326008)(66476007)(5660300002)(66556008)(8676002)(66946007)(83380400001)(186003)(2906002)(6506007)(2616005)(6486002)(26005)(6512007)(53546011)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yll4dUtiQXRCSXk4VzIwY0xMNU1vM1c3aDNCdWFocGg1em5DUWlZcDJqUVYr?=
 =?utf-8?B?YmpGUWtNcm00SCtkeEFWM1RNZFdET2hoOUluYWV6UXVFenBYcjgvMmhtSXhE?=
 =?utf-8?B?Sy9VMTZUMTNNQnY3clBhbmRqZVVRWUo2d2t0QzNFeEY3SUJZWmRxU1g0Mlpq?=
 =?utf-8?B?ZWZWRXJIMzQ1Qjk3S2ZvaVQ5SHl2ZW5Sc3RuUC9BMDBNOGs1dXhHNEtPcytI?=
 =?utf-8?B?NzZKVll6dFdNeUEzbmFrRWErenQ1bmdwVmZhUlE5UlpXcjA1OStDaWNsNXNV?=
 =?utf-8?B?N295bGNIRnZ4K1Q4ajVoeFlrTU9WYS9zUVlPQzVRcVgzK20reGVkZkZRZ2VI?=
 =?utf-8?B?cXd3dkpIbWFERW1Ha01vT2gxcHBZUzVUeElXZWhWUTJIcCtUTnIrQU5aZFV0?=
 =?utf-8?B?TUFTb2xKajlRL3RlbnprenQ3dDkyY21FRm5hVmQ3VG1jeW9uazROcVBFbGhp?=
 =?utf-8?B?NVR2Rys1YWVXclZhTlJiN2NEWElMMFZRcEFvd2VpNmZVMU5PTXc2ODQ3bmV5?=
 =?utf-8?B?dEZENTU5bW13L2JXblJBSWhSL0l4WG9pdHZuY0htN1hwYWNwaWZpK2E4QXRW?=
 =?utf-8?B?bHNQYytVdisydVlOanVUTEVkNmxyanhKNmYvSS9mVzd4YkF4anJGS0Zzc2lx?=
 =?utf-8?B?WVAwZVBjMHB2NEFlcXhJZGg4c1FaTHVsY0Y4UWZQcGkybklIbUYwLzA2Zzlw?=
 =?utf-8?B?Vmx6RVc2ZFRpQXl4aHVlakp5NlhWZllreUIzaE9nMEJ1bEZTaVZRVk84WjVw?=
 =?utf-8?B?QUlMRFFZb1ozZFFrKy9XekRGR1BWQzNJVnZ0V1hkMDhsV1VDSXFTZEVCeTB4?=
 =?utf-8?B?NlpNRzdZcmdoN0Z6QXZ3UGpFbTVUOGVUMm9memdmZlk3VlVYNlJMQnNKMDBW?=
 =?utf-8?B?anU1amovNmR4T0JORFJ3S09xY0thblhtRDZmRldobzdaOVVJUGREUDI4bHRE?=
 =?utf-8?B?SnI0bURtcWcyamxIcFFESzFyVDAvY3l4cUh0RmprS253cnhiY2kzNzFtT0NY?=
 =?utf-8?B?SUhSZFZ1clNDUTVGTUtYSXRYaHdBNFJJQXhzNXZqd1EvQWxjWUplNktSbmtV?=
 =?utf-8?B?aSt3RzBwZ21kN0o4Y0xrdGk2RTZ4SHBMeVFvcGtxdWJaVWFORWIvbGZtdC9D?=
 =?utf-8?B?WFNtU3ZZZ3NJMHRETCtZY2tjQmRmUHo5SjdMd05rL2o3Nzlrb1hYRm53clRj?=
 =?utf-8?B?YXN4dnJyMWxPaGN2aTNqR2dhSndKQ0tQVW93cFh4Skh6d3J6Y2JlT0d6QVVV?=
 =?utf-8?B?T0IzSG9wV1hxMmVlMU5LSGNqb25mT0dZNDliOUp6VUJIZmVIMjFvdEJQUXgz?=
 =?utf-8?B?cjlwVER6RUdTbGpXTTRtUVF2dHUrRVBnOEladmM1WnZ2QVhOQ25sTDJLNmRH?=
 =?utf-8?B?RHJRSEFYZCszVjI5OE9KUFNHMC93Z3YwQTRWYjFuWExUbUFwdmNkS1Z2YTIz?=
 =?utf-8?B?a0dYS1RnQjNEN0VWSHpCYUpmTGQyL09URmJWSnZYcFg2bGJ6Y0sxM0FDZXBP?=
 =?utf-8?B?YzhMN1h6aDg1S0VWa2MyWG9YTU10MTJtRjJBbFY0RHBBU09LcU9Qb0hNZFBp?=
 =?utf-8?B?OS9LZW9GVWdDQjRmWlV1WXV5TEd1cTcwVWZOYVp1Q1M2T3BxWlJzMGtxSnVI?=
 =?utf-8?B?NVE0U0FsMWczZDRjOWpXNlBxTCtISWJ3WVhLNk1xOW1VTzE0TWFHTkozU0Ew?=
 =?utf-8?B?UmVLVkJLVUs5UXRCeHdqdGIrWnpESGJCYTBWNEl4b0FCdmk3ZjNOTFdSMXd4?=
 =?utf-8?B?bExMTndGYUtmWVZzZXFFY1ZoeDFnQnN3YXRwaHU1TkhYUFlzNmJWYTdocS9V?=
 =?utf-8?B?TXZGLzBla1dqd25YWW9LZk9xTEJyMk5Wb3BZQkFYN2RGdjhRdURETnNQeTBj?=
 =?utf-8?B?eEtKd1QyQWF5cEdjcTJSU3F6emQxMHpvQ2MxRXhBYmtDdGNUbDhZc2tXbzZP?=
 =?utf-8?B?bkk4Y2RDMENnZG90c2sxaDVqV0h0dmVzY3RrdWxydk56ZmRKbFlDenZLaUhX?=
 =?utf-8?B?KzQrWVBGS1lvODZ3dGJTdHNDWjNRejN2QThaNVFpckpyMnFqeitWSVZHQkw2?=
 =?utf-8?B?dDh0d1pWSWRhZktmSnE5eWpLTmZTam42ZUtuQ0d2RnFvZXpVSGtpZy9RdUJj?=
 =?utf-8?Q?F44suLnjBxOfuVB9W6niW93Dk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cf03ef-7dd3-4316-a986-08da86832452
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 10:18:23.5831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WlHwgIR56n2XTJXq85ymyzbWkIbtoxbDfS+k2RPMLQcBJRKMZGnlM6W2vF2B8E9V3DwfBjxTys9J9A+51w2SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2600

On 22.08.2022 04:58, Wei Chen wrote:
> --- a/xen/arch/x86/include/asm/numa.h
> +++ b/xen/arch/x86/include/asm/numa.h
> @@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
>  extern void numa_init_array(void);
>  extern bool numa_off;
>  
> -
> -extern int srat_disabled(void);
> +extern int arch_numa_setup(const char *opt);
> +extern bool arch_numa_disabled(bool init_as_disable);

What is the parameter name intended to mean? Since the only caller
passes "false", this also isn't really possible to guess from the
use(s) in this patch. In any event perhaps best for the parameter
to be introduced only once it's actually needed.

> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -50,9 +50,31 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  bool numa_off;
>  s8 acpi_numa = 0;
>  
> -int srat_disabled(void)
> +int __init arch_numa_setup(const char *opt)
>  {
> -    return numa_off || acpi_numa < 0;
> +#ifdef CONFIG_ACPI_NUMA
> +    if ( !strncmp(opt, "noacpi", 6) )
> +    {
> +        numa_off = false;
> +        acpi_numa = -1;
> +        return 0;

With this "return" ...

> +    }
> +    else

... this "else" is unnecessary and hence would better be dropped,
not the least to ...

> +#endif
> +    return -EINVAL;

... avoid the otherwise ambiguous indentation of this line.

Jan

