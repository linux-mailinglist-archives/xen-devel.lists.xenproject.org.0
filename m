Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50B78A5CF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 08:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591372.923755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaVqk-0001Xs-Ns; Mon, 28 Aug 2023 06:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591372.923755; Mon, 28 Aug 2023 06:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaVqk-0001Vl-LI; Mon, 28 Aug 2023 06:35:46 +0000
Received: by outflank-mailman (input) for mailman id 591372;
 Mon, 28 Aug 2023 06:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaVqj-0001Vf-5y
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 06:35:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d3b4869-456d-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 08:35:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 06:35:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 06:35:41 +0000
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
X-Inumbo-ID: 1d3b4869-456d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK9u/igq+f+RUVtNaxL17IhIcoO1xAPa7Wqiu0KdD/Kfr5ggZzbDJgsAlZE3vawp7D17w24+6pPCvsPNkfsOhWIiWWfyZbjL4sr5JYNC+Rcgr49jr7u/oeQ+ZSmPSODFY3TOhUWFp+iYrIRvVIAsoFv4/JvSFJuJ5lPlQaSIQ46KQ0QJwxvIQ14KlLJ6f0nyH53mLAuSwk41q2IwzZHIjMqmOp3oCObnKPAQk2Of42KpgLMnoSxB4dsY7VfdXWF/3CVXmNvOzX+SUOSVzhDtGazyKhU/FnLGlS5yJDU2SE72uRrtZ797aesxI3p+k6k5dC0LR4yrN2r5PY2oZekScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk2HkhIJEUeZ69LdkQcNPRj2Op+2hDRrzI6oq+Rd9uo=;
 b=D87cCrqn8BNFB0vgsN6apzYAC290D0wwvjyEjEr0JoHucv4lTyroV6WvzolQFtHI47VApoZMBXIarJyPqR8A+qfk/rqbkkO+LCt5BreRzTTRDO0c0OdXUG0NniafgDkKhCT76iIQRtr+8ezU54/tpADRiMWsMXIUwOYV91ikMgyPwwYYTLma73di+xmEe5yP8OS73yKwQQwshc5Wp28OXdrH+/mbUnfyW2UjKjuUflmNHKCi9+4fvA3/W4LqfsdV0g2JcKOGu/T/AS6zIuMleqnUqql8/7aX7H8u8sC6ykGVFK8P4+3w2j7x9N954IJwxu4tc8P7a7OPs+cXOdPKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk2HkhIJEUeZ69LdkQcNPRj2Op+2hDRrzI6oq+Rd9uo=;
 b=eAPUUiyFf9GUU+IYIlHccNoBfM8D5MTAd+6Y9wzDJuQe7jIYdVVy1XAqsB7axgUeIg0gTO4/ZpbEMnLhpW9lVCvcF6qnIGDGJP3DMBoOBjTXsIrqqOyByO2oAFAMIKQkoJ4teW/kPYXRhhfMUoWbfc0jtCW1GAmZk9ekfpe4oenI16P9G4qUzw94mny6XRGKGfl11T3STdd6Xe5k/lktNe8YcUHd4x74Gw9WliD7qjQdztQ+pXuIWKl8DcqzCdfshM/2Hn/Wl2LJIFIFYwPnjkIY8nIp1WR4mS67RfFJaqwW4Of4J0/oKCippBFwsthAc5JqSVd7j94SxQFDgQ+CPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7c68b27-4ad7-175d-2c62-85a0f1246357@suse.com>
Date: Mon, 28 Aug 2023 08:35:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, roger.pau@citrix.com
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
 <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com>
 <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com>
 <alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 82886b23-9a37-43cf-f0fd-08dba790ffde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QEP19zHAwQPg9a8CopKav3bCLAdsbAJPTZEb53M76UQHL+1VqhYXqWyIyi5jkbw014pqmOl6gtWcK3lFwActbDUH1nlLcg76ntpxsMH9sahNfWBKVaPpTbYl9KQNlvZuKXgaT0ptDpn979LG7n6AyFaBKZrLWwv/EgmdUNh8ds7n1Xg4QrnLdccrtEytLA//tBIuhwt7TYNSrd9WNuqKpJO6O7hQ9g8YQP9pcsxGSUtZX2w/dnM4AmlzZ6jvtiUEPlQ2WZDJlnHpLkKl3BAw/ltc1Gok+OHdKTp7O3gmqqrZja8NW0GpE4IjjAv6I91W57LWNcGQWCzFr2sbJHaMHSU/b7hYATuMaLxZu7WWEw+cA7RqFaUsSoOsxsfSc3//iZUkTrtLPXN9apt+qXTQXIWE44XRiVBrhGKZR1lNzobm0eGPnoO1JEg+t4DBy9od4kPJasK2Ah4CPZsCwNWT+iFfgq+6wkdvESWHlzed1XUSL/MllJtOLU9seElKyCoBeYbxE3ex5n1ElgMzB1DBpvE9skGkyJ2EcyMkW1QuLg4OrhPm4ahLkxuLf/1qkuhjC9+5gH0wVR4Q9e5+r3Pt5lmFkK77XBLitnBvZOU3q/Do9EsrkKXFck4h7leFhMAXNMmaUsi18ni/M9uWdMgVNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39850400004)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(2616005)(26005)(2906002)(478600001)(6916009)(6512007)(66556008)(316002)(54906003)(8676002)(5660300002)(66946007)(66476007)(8936002)(4326008)(31696002)(86362001)(36756003)(41300700001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGsrU2w4SCtiS3VYcit1WnNha05NeUJqOVhSUjk0K2VEdkNVeEk2UC9NN1hh?=
 =?utf-8?B?QzF5bUdjWVdOS01FWXhVUTlDYWNXR0hncDFLYWJMYllMOWp2WFhmVWdOVngw?=
 =?utf-8?B?cUNzcXljK2JpWGVkVHpxdElVbS9nT3JBbUpwOU96ZWpqOHM4eW9kOUlkLzhH?=
 =?utf-8?B?Wi9wQ0NqVUorNlY5QUVXdWR5S3Ftdk9YbDJVNUpFdERoRG5pbURLbkNZR3FB?=
 =?utf-8?B?dEFpM1lUQXNONGVFTUdYdVNlamNOM25TTUhvd3grcHE4L0t0WVhISHRZNTIx?=
 =?utf-8?B?ZjB6RW5KaERQeS9vcG9TVWlKdXprN0V6aUk3eTc4c3hBTEcxWjYxQVpJTVRh?=
 =?utf-8?B?UVpLeGY1WE42QVk2anQvTCsvWHdzaURudlZXeG9mQndod0lzTEtJbGVvWk5t?=
 =?utf-8?B?RmRPQkJmYXp4eWwyWlp5TTVheEtHRTZidkx3aXZyVUFPZFVwK29MTnVrUUMy?=
 =?utf-8?B?eEJnd2lQdVZ0TUlqbjQ2dHhEVXJmU3hPSVVnQWgvQzRzNzBoUkNITDNDT0o3?=
 =?utf-8?B?WGFad3FUR0dpUFdLa2EwSUpoeGdkSytlSWFGaWVYMEtqSW8yMGs0ZWFoUFRl?=
 =?utf-8?B?UXdWUjA0ekpDdUJ6UlN0VjNnTkc3SklYaVVXMmp3NEJKSVRMZGdOSG5YZjlx?=
 =?utf-8?B?QXZPN2VLckxFUXJxalU5MVJQK2xLTEE0RjRvM1o0cjllRVNoMFlZdVo2VXFj?=
 =?utf-8?B?cVJZZE9tOExnOGQ5aW1JdlBiWHdLakJuTTlvdUZOSFVLR3hKaXVWR1dEVS80?=
 =?utf-8?B?Z3pnZEZ5aEJJSkFBYzIrc1cvSGFxWFZTeGwrVVdmRlVMYkFmM1dud0FIU2RH?=
 =?utf-8?B?WHYyL3lBUzBYSjBNdTNiZXNmd0tKR05XV3ZZTWJXQXJiT0lQSmQxMFg4S2FY?=
 =?utf-8?B?Qy9FYXhocDh3VlFoeHhjbXVQVlVLVE00TjVXbFJyWjdzTFJjTmN5N2l5VnNt?=
 =?utf-8?B?RHMvRDRGVWxHeG51SmdpalFCTDJUSG5EczZyU1ZJVWw0MDRTNWVHeW5hbEJj?=
 =?utf-8?B?aFl5UE9rdjNFM1o4YWZCdkNIWVhnQmxCdkJIaXNtQWx6ZDBoYWhBL3R6dlZi?=
 =?utf-8?B?KzZHd3YyVStDdVdmbXlNeVJlRHBtYkdSbVBBbUw2QWRYL3lVZ3lvcDJ6WHU1?=
 =?utf-8?B?OHFodWhQcGdyUWpoRjhIM0ZJTlZjWDdncGdSekI1TmUwY0d0dFFUUEovSzQ1?=
 =?utf-8?B?SGRCRWpaV0R0OFlrZzJaMW5MZzZBeGR1TFlzeEt5R0pMZjNnQldLNXM0WFpD?=
 =?utf-8?B?QVhiWHFFM2hXK2tLd2Q3RHdRUnFpUjcyYjV5OHVLYm5XVnFCYlh4Z2FyRVJG?=
 =?utf-8?B?TW45KzZKT3BqREZ6S3VJSEo3N0FWWFltK1RZUVRyL2NLTzRtOENlY3VJZmxv?=
 =?utf-8?B?VG5URDFmOFFRNjljQjZUaklOaS9nWUtMQ2tSZk9ycHp2amdPMjNXMzloVjQv?=
 =?utf-8?B?blFEMks5eGtlbmxEUG9tOEFOaFpzRThVbEhvbDBoNnMrUldPSk40SERVWVNs?=
 =?utf-8?B?SzU1QzlGRmE3OXdVUnlETHhWQ2ZRRS9mQTZtSWVxakhRRFFyQWd4OWxPY3pV?=
 =?utf-8?B?RXQzaDZZWWFaaG1UZlFCcTF0dGxXZ1V6dThvcEJnTWdrVCswak50UVJEZmRl?=
 =?utf-8?B?ZTF0NVNqN2FPOFBYRGFTdXJqTlhJK2Q5Z2lkK0Fvb3dyWUc2R2RQSXI5STZX?=
 =?utf-8?B?UnA2OFFlNE5DK285bDZ1d1ptVjRsa05vT3BZZWJlY1JmRm9jTzAvOHJDUWN3?=
 =?utf-8?B?NTJWbW0reXlveGxweE5COWZPVEFtYlhNUU85VXVORXJhZlBydElrbThZTUhw?=
 =?utf-8?B?ZzNQeHhjR2Y1VlBvM1A1a0FhSmFhRHhhQ3BESDM3NlRzcUlXbjJIVkdkY1FX?=
 =?utf-8?B?czZHQlZTT3RMdDk3MlNsdmEySFVoNzVOL1U3cnFvZmx4aStleHU0QWFCeUFz?=
 =?utf-8?B?aFNQYTd1b3hvM05zNmFCNXBpbFgwNzJFa1habWd0d1R5Q2FIMmtteDVSUUJP?=
 =?utf-8?B?ZjJ2TDg1cHlYVnhzS3BZdjc3QkdTTHlDaDRwZHg4eG01YUs0VU41Z0tJUXNS?=
 =?utf-8?B?WkpFT0tVMzllbUVBOTFwdTRINTBBRlpyWHMydExsa1IzL2RpQzZ4M0luZlBL?=
 =?utf-8?Q?y9yn5I9j/O4HaZBG9cC4R6x3j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82886b23-9a37-43cf-f0fd-08dba790ffde
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 06:35:41.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GM2kccR1a/Cm7/5y1tCU6FXlWGc7bwz+UTgTTDql4Vp+hA/Kf8DkzQ4StllzFjIatdogZb1/YzSVgCD02qVarA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869

On 26.08.2023 00:21, Stefano Stabellini wrote:
> Coming to unsigned int, it should be 32-bit on all supported arches,

But this isn't a requirement, even if we're using "unsigned int" in the
C declarations / definitions: If "unsigned int" was wider, all we'd
demand is that hypercall entry code (likely written in assembly anyway)
zero-extend incoming values suitably to fit whatever "unsigned int" is.
Which is no different to Andrew (aiui) suggesting to use "unsigned
long" instead: That'll too require suitable zero-extension up front.

> so
> it is down to consistency, which is a bit arbitrary. We have quite a
> good mix of unsigned int and uint32_t in hypercall-defs.c, specifically:
> 10 uint32_t
> 32 unsigned int
> 
> By popular vote, I would go with unsigned int. So, I would keep the
> patch as is.

Well, I wouldn't quite say "as is": It clearly wants splitting for the
two entirely unrelated changes. Then the uncontroversial part can go
in right away, while we settle on the controversial aspect.

As to "popular vote" - ./CODING_STYLE also matters here, and favors
non-fixed-width types over fixed-width ones. And as per above imo
there's no technical reason to use fixed-width types here. Yet I
understand Andrew takes a different perspective ...

Jan

