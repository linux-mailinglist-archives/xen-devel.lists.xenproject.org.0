Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF8783A43
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 09:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588171.919650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYLQ8-0000xy-Mr; Tue, 22 Aug 2023 07:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588171.919650; Tue, 22 Aug 2023 07:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYLQ8-0000vH-Jh; Tue, 22 Aug 2023 07:03:20 +0000
Received: by outflank-mailman (input) for mailman id 588171;
 Tue, 22 Aug 2023 07:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYLQ6-0000vB-VA
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 07:03:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f79e64eb-40b9-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 09:03:16 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8325.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 07:03:13 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 07:03:13 +0000
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
X-Inumbo-ID: f79e64eb-40b9-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOj5Fjp6XkwDewT1B8P9uDpb7iPLQh6jaDr61wjbEi7N/+t1qLAaGV+p7+PxEXt3zhmpLC9wePM4e+k+h/fcwBSdi2DewBzj52kHpKQ88MkWrUEHjGJXZpYV2gAWBk+VODUzjTEjLQf7wgBaXimByFqpcC4daQ2gYQITsOSu30lGejaK6Isc6Ws0mVJek7JOHJePz/QtNugqvzr71uS5Y80p9v0q9xygRmkVAa4uBBY+FVW3DN6A5Br6J94HL7/hBTVax0Oqk9AqV0lTdVyL4xDfcCnDL8ZFcSwe3k84G7UrwVoWIp/aB7LDn3WtLD7x7D7Hg3p+NlN2DplBNS75Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igG/KmPKVy2voYzaiWRr9FXRC6eKpTDZ0Ri/lUqc3oc=;
 b=NO0DPZIJv5QSdMiw6fl41u2AhqKu4X+8YPU+H0G3KTdsAC42d1zda+/3YseRYAT2EQfsSXeTEU8ey9nQDwgkXLi2CXfzYC/14dv2oFVBZLOR5jTsDWSqqsgTtTu8YDabBZdxC9Fs6xwyLYuAPIL/YQY3sjQGaMlaIGH/4iF9FaZNeQaHasc2gbEuIdMLZHV49GNn+JwWxsXR9BSmkrIlOH5x6QYxMYXn8cGrd3J/yJP4YtOS42eICEDhBPJeJ92WQ3HM0WfF9hEPVqFrlUrryVSu06TkH0LY9hBXrhFIuA0uM7MauesfzTmIOgjHs7QxzmXEQxi+Y/W+g3Rbjt38MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igG/KmPKVy2voYzaiWRr9FXRC6eKpTDZ0Ri/lUqc3oc=;
 b=Y6PFg72LJOMUwwO9UCVRXF0Myt3hpW5wamF6d/FROX/GGoFLUhco9ZLiGZttkBL2HRzyUBycuX1Jm6A7fyuuFrtE6sp9/VNHRl2jdWMa4kUyWAr+QqRvrhicVaEN4HCYJklRdZpavl7poTDMR+F9pciWoZuJKh7KEPTCxpAC9J0icSeWylCNv0rlTE4/+L7lIdTuoyVpAd/W+bG4zfdD47Ds2KHfUAjJ9fBUp0r1JJVgsXEtpGiqj+kWrkIE/j8ojj/kWrmc9Y3BB+GDoVMl3uVgRudYn6FIaICOPhkEgjVGu1zxa2+N584/Z7dNDent8pNlUmoxHoyZYgbNWnl8JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <370dd885-0f80-5d18-62b9-9ccbc2696d28@suse.com>
Date: Tue, 22 Aug 2023 09:03:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230822013014.2523202-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822013014.2523202-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 222119e2-e3cb-4967-5dd8-08dba2ddda40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AGGHF3iiFjpijQcBLc5MqnzABadisO2chwspZeK3FuSoq+NoMrUh1Rt47qXrU5+iTMLU/lKZfy+fGjJF549owKFOALGERi7JJzn+LY/bNMb0KuvwDwg8LtPP2qH3RN2iN071UTIAe66iuuevrLb5J9h3Sgr0g4TalERclXjtoJYKj/08wUTcYpsjnVj/CPP+P6pWK9WU9Zhc2NuaFhdPhrp/mCZuY1Fq3VxgvNkIyyBqrjypNRqrHEYSHcnNx7RN6auWeQnLbzAPkfpJxK7vteyw0VzORAGQc+kybK5p3eguhjM+3SfdJjx1Yqag8Ao7IQQK637Dhn6AAP0apkO0QlnG2MssFJt49uEkFVS/7FRQ+ntNnrdurkRfcJtWd1hgtOdO51aoZ/IO52uJv0xmclYrZlkdZlkiP4VXO/WNvsWmK2X+aZtnGyCasQG6jwKqug20tNOAbpFPuLj5cQK3cRLh9jvwszuGmJ2qF6tCw4YJ5dKcJAMqn0Co2H6mUObQTBJUrGtP1mfwVQdQ42DMUoY7zdZxydsX82xR3KfC8RCdAHQr1q4S85JEm0HycSgNqIykmT0kDsJEK+39VIkh5CeikY4oAMGCE2x9Q6EyGC4n6Tj1qPtXdEC0jsz4/Kj3Gpb+PtIFNFKiB2C1eVNeDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkdhZGY4UmQ0bHIwbXoyNEVzaDJoUlJnd0tERzgxa2I1UjBlMTlXUGNISEhW?=
 =?utf-8?B?dmpqZzN2akR2NnBnUnpLbzJ2YTRRakVyMjlNcWZLS21WZEFuNFBHRjVtbDAx?=
 =?utf-8?B?RG13N285cEMrVkkwQ1dCM1pGeC9aSFZXUy8rTTFKNDVaN1NGRmpLZEk3VUpG?=
 =?utf-8?B?YkFqRXB1djBydjR4U1pydFBIRmRyZldmcnU3ZE1oYnQyMHlJYU1mZGp0Z3pR?=
 =?utf-8?B?dllZMThqd3VmdXBwM001T0N4QjZmMndOYzBjWnV3NXhoMFFwSWRBNVFneFJr?=
 =?utf-8?B?cW82QWNPNW5uNzZCNHB0NS84QnlJVEppNDhOd0xFNDdVWFFEVDRFLytpa2Jn?=
 =?utf-8?B?RkRSZXYyOThaNkV2OXNuQlBhZUVBWmluSXBNNE1PckU4QkwwanFJbzZiRlAw?=
 =?utf-8?B?d29LVURyL0pTUjZpcEljKzNVNW1uVzNZR2g3MXpRK3FIK255V0JHb2pCcVQ5?=
 =?utf-8?B?OTd2VTVlbHFBbjk5bVI5RE5ZdXduMTJvTHpCYjhsd2N6WlVVd1NlUEdGcS9S?=
 =?utf-8?B?N0ZpNWRuc1QvQnVMNit6d1NBbHN1N2lqY3Jmam00elZUUGFHVWd6dGVuaHdi?=
 =?utf-8?B?K3hPNDJVZUYvVmpadnlyZHZyVHd6SUFzTGs3dk5JaFpXRFBuTGhMUUdIb3Q4?=
 =?utf-8?B?UktqN0IycEo3eVJJT3NaUzFzMkc4RjZGbEsxNWNDaDlVVG1hMEprK2lEek1j?=
 =?utf-8?B?d2FDZW1BbzI5eDhHRlRpa2t4OEs1UWV2NXhCdURaVHhBL2thU1JhRWpTeU9k?=
 =?utf-8?B?Y2hBQVFNN3hXR2dCVnpxSUFheGRFWnRqMW5kclpwMTNUNVFNUTJHVjZyL09j?=
 =?utf-8?B?d2ZsTy80OG9YZ3A5UFBYWTMxdXhIcENUTzhBL1NIR0RhYnpDWXdUVFV2N1Fr?=
 =?utf-8?B?clcwMGVmV25nSlRaNmZTMVQrMmFlRzBmSjVXbVU5ZE9QL0llZzVwV0w5SUFB?=
 =?utf-8?B?dHNNSHREUHVNMWw5WGwzT0RTb0YxdG55cGFTditUMk16TDRmbDgzU3h5cCs5?=
 =?utf-8?B?R2JCM0QzdDEydkQ2SWs0UUd1ODBacGI4YWFlNHBNSlZxeGhPM2UvVzJWSTVY?=
 =?utf-8?B?WmJWSEgyZVNhM1htK2JiUy8xVWRhalJPMDkxaEg1ano0eHN0czVQcHk0UjFu?=
 =?utf-8?B?TSt1and1MldiODIyRU0zUTFJZmFheVJZaFVlcmhFZVE5MmV3aDN5TmYxdE9a?=
 =?utf-8?B?ZitUWDFEL0Jjei9aNUtSREVGZCt3MUZCWVhoQ3BlUnIzRFBsQzN3akwvOUtv?=
 =?utf-8?B?Yld6QWZESjFWbWlYdUJPTE8wM2dVQi9PNTRMcGpvTC95endRZ3dzRm12L21E?=
 =?utf-8?B?TjEwd3JqRkRzOElmbkZKeWxSVUJpOXp4Qy9yamtkaVRjZG54aTJkVUhJeXEv?=
 =?utf-8?B?Qkg5cklNaEdGYUR4Z2RGRmh5M0VQWVNYbnhsTkxIUGppRm1HbTlmVGs3V3ZM?=
 =?utf-8?B?T3ZweThtZ3kxUmFSdlJjSXhqeXA4czd0Y2o1MlVuUHlsVGJOeGQ4UDRhd0dU?=
 =?utf-8?B?UkRUNjB1ZUlCRmxVbWxRUThIbmJJclNaNFJoN3NBN0hOQkVtNWhJS3liYzlh?=
 =?utf-8?B?bkZJVUZER3phSnBabjZEWXBXMnl4UU9OazZqTkJEQ244d1BNbEhBWHZObnlW?=
 =?utf-8?B?bWFGTjBQM3ROZzVVbFZuc2w4L3dKQk1rWWMvL3RmdDhuclB2R3VWSDdISU5q?=
 =?utf-8?B?VSt5T1ZmR01pQmhEV05UU2NZL3pvVm1kalFkaG5NLys1VlQyKzhDamtrRTlK?=
 =?utf-8?B?cWQyVFJ2bnZOQmtYczhyYXN2dkk4ZEdESjJraTR6YlREeXIzcy9KRFFaeENP?=
 =?utf-8?B?OCtEUEJHc1hESVgyUGVvUFNsYUZ3RXR1VFlHbUhpMG9KcFUvaUhzSXF1UTJ6?=
 =?utf-8?B?ZmVKL3lmcmdkaVkzMGg1NjBTS0JKYTRadlI2Y3lJK21FMy81YWhvaVM0YUVL?=
 =?utf-8?B?amFpdTlsTDdTdStUaWpPWm9IZXZoTVllZWZjYW5YR2dmRUJhbSsxdmRLVm9Y?=
 =?utf-8?B?TUorUlJhcEkrYmJkeWY1VndDck1DMjQvUElTelRlOEhydCtxdnVwYmlJR0hK?=
 =?utf-8?B?dGN5TldkeitMdEZ0cGx1S3Qra0lLYUhlZTZRWEhqV2RiTTM3L3Z2ME0wZEVL?=
 =?utf-8?Q?zwWqGHCfV6xgCttVrcxDpAL9o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222119e2-e3cb-4967-5dd8-08dba2ddda40
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 07:03:13.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbHHNIs+e9D7+N8hNfKTEssCnM4nyMF4V/4JJa1dj3TlIKXGFbUQI+93p0IICgVQqQJ00TgZmkqixdV/Sk+Qtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8325

On 22.08.2023 03:30, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptable of the Rules, we

Nit: acceptance

> decided on a few exceptions that were not properly recorded in
> rules.rst. Other times, the exceptions were decided later when it came
> to enabling a rule in ECLAIR.
> 
> Either way, update rules.rst with appropriate notes.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>[...]
> @@ -239,13 +256,16 @@ maintainers if you want to suggest a change.
>       - Required
>       - All declarations of an object or function shall use the same
>         names and type qualifiers
> -     -
> +     - The type ret_t maybe be deliberately used and defined as int or
> +       long depending on the type of guest to service
>  
>     * - `Rule 8.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c>`_
>       - Required
>       - A compatible declaration shall be visible when an object or
>         function with external linkage is defined
> -     -
> +     - Allowed exceptions: asm-offsets.c (definitions for asm modules
> +       not called from C code), gcov_base.c (definitions only used in
> +       non-release builds)

Doesn't this want to be

     - Allowed exceptions: asm-offsets.c, definitions for asm modules
       not called from C code, and gcov_base.c (definitions only used in
       non-release builds)

? As to coverage: Why "only used in non-release builds"? COVERAGE doesn't
depend on DEBUG, and people may actually want to enable it for release
builds. Just likely not for production ones.

If you agree with and make respective adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

