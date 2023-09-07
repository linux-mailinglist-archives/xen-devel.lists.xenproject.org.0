Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D979706D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 09:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597140.931332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9Br-0002FQ-Lr; Thu, 07 Sep 2023 07:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597140.931332; Thu, 07 Sep 2023 07:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9Br-0002CY-J1; Thu, 07 Sep 2023 07:12:35 +0000
Received: by outflank-mailman (input) for mailman id 597140;
 Thu, 07 Sep 2023 07:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe9Bp-0002CS-Rd
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 07:12:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89678af-4d4d-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 09:12:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 07:12:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 07:12:28 +0000
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
X-Inumbo-ID: e89678af-4d4d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvwiKdGDHnIQGuT6y9NJ2MPFzhHUXUDC5gV/nsVvQaPXeijM8br7QLdHx9oEA1jYy0eeONHGyMEfr08vmfnGumY+bgJg3wjxBwsZNQ5+8xipG2HxXj67QJpbt3lAv9IyduRx51gYHxYpJt4gGf1uaFwRgax5/w9CAWqjnvJgs20gQM7AK/tX0XaVagtD/O4+/5FB2D+mW97XLOGUTKURirZfFaIGEuEgDxhMFen/zT76pY7pyGGPlDDnD2bdutUGbgry6wvLUPtllkI0XNPIciW6XSd5hNnFm1O//DA3r/MEgs1OJCjjXrhYM34Ogjqxpy6BxihhEmHPUkA1shKw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfU8m8MkVilqCzECsUk6lwLNz06CE3YNEd/+ssdY99Y=;
 b=gYFCVAKHjdk7LaxUeyWPtNgOHTQ9XZotg0hbT1sjPoQsYcGFXb/5PNeOS/OEeaegpxwU3erAkB6A9R3ecqfNnMUDMLGrUcaIhZj5bP6sl3SU6QQZWzTyfZya4Cb58WS5AHgeso2BTQkSosLrKUNYjY7sT5MspTszylNhscvgL3c6b7c7oZSM/aPNi+Z4xoRXGv9kiYpcOY11hhfrhyLLXyNBmxSPX/PM5CBFCXGIbSoZSsEPV/cMReuv1oKNmJXvif7yOrdowSnjGDaxvgeksntUVlepPDS8RI1D1qsn3Rz39g1gIPd9Xnxy39Qku7ofqs9kuln+O394Ek7SJ27zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfU8m8MkVilqCzECsUk6lwLNz06CE3YNEd/+ssdY99Y=;
 b=GlSuBnhhBjuEHEd6wrFF7+1qjfPgcLeJhGQIAfvwJIL8SZJtRYDuBrz2pRVQD5+w9/T7TLLDhJNoox1tm6GILq1KkLlnC/vWT9EuBWcNXpO0jZ2Z3RlW8VIHgSsjz3L5Mj2sVxS5hiYoLxuuYDwTtuvIHRLwTGhcoClYTkLfb5uhpiT0ME6zXsRl/0EwOZob/8tdbImXCdfzlhooQABXcW2Qfp5HaASwYxP4bPaigF0dvhmadnan7fRMny7UtEpRPy51b/4tx8j8w1Og81GXTbkTpBPHpengnhob0zihmHnLxDko5QUHX+NuSPs65Y/7qtzto9Ku161owFiRV+Pyxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com>
Date: Thu, 7 Sep 2023 09:12:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] docs/misra: add 14.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230907012203.1238090-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230907012203.1238090-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 95861b1b-8815-4685-2dee-08dbaf71cbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f5nD98i7HwV/qHk9jyxY1DfFmtVn0UI1ifP6iNDYH71bFII6d881MBuWuS45tiMDFc326G6/BeST/ZBEh0DU8Q83jdDJnmeXaaIWZ6eG9dHd+kWoOKkCu5fh+xvqwOS9dBVgKpEDGUlHwk5wrFiboMcX8AA7Yr9WBrDdZzEhn6fiYA4MnWw+dF6ZefqoT6ZxJ34+dc6Q8/c+XmLo7TFYMOZfNKKlzzHUgBUDcsDCxDj2maHMybkr2ODhzbHZVASKvHlDV5pHaxmk4lg3RO63NIUFdkQ2enr9DU0gHwCcLpUK6hIgrMiNUr03NlOKk2VsSaF5dgBrS8XWsv5hZObEXQibFM+naa2yE2BoZ1mtoPM1sVZwyeHxwDVB4Ow0ZLFALbqiGHqkz7YsGXl3jKeZBbvvw2HGCdBeAK2GiPMo4CvGpGBXJtHLLYxCwLpeEja80Ghtu8oNNNWXRAYFx8k2bbaK5x2ka1flJTv4SXLKMY8i1bkoLXk0UOFM57cqkcBCvGoBm93RGWwAMJQIRrNN3HUeKeK3uTGi8TcGkKzpRqTBVrhzVDXA4P2ph846LAAeXKwDmh6YmYd+FgNXyyJ7aFMGZLwO0Kd+2L4ppVI0ZflEOuxe4Nn78h5cc+IJj+xW41584hNkCHZgwDxibtVL0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199024)(186009)(1800799009)(36756003)(31686004)(5660300002)(83380400001)(4326008)(31696002)(7416002)(86362001)(8936002)(8676002)(41300700001)(6666004)(6486002)(4744005)(53546011)(2616005)(26005)(6506007)(6512007)(2906002)(38100700002)(316002)(478600001)(66476007)(66556008)(6916009)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUFzdEdUWlI0Z1k5NTBPeU93Tjlzb24zUkM5TVgwK1dUZG9tek5waU9paVJq?=
 =?utf-8?B?dzVaNGY1d2RveUlCQ3BscWZvSWw1VjZXYW5RNWJ5anFrY0J3MnVod3dwc2VV?=
 =?utf-8?B?Rmd0R1BFMDBDTlZ4N04vUXhRQkJXSVB5OXRuTHk1ak1BekY4aWlGQnh6UmRQ?=
 =?utf-8?B?MjlTQkRYWnA4Q0VxcTRHK1FYQjRZK2w0QU5aOFhoajFVUGtUM0JaSDZYenR0?=
 =?utf-8?B?KzUvT0JwSjJ6M0Y3OWIwdmZMTnBucHd2ZkZSZWdzdHhlMm5MQmVMa0dJcy9Q?=
 =?utf-8?B?dEN3YXB3UHRRbEIyWGovaVRjQlNEaTByenB6MldsVHplZ3ZKRzJaWlhhcGdi?=
 =?utf-8?B?c013VEhuSklkMVp3dWpwZi91SUJiWU15N3kvN3k4elM3U1ovU0tyOC9nM0JH?=
 =?utf-8?B?S3FCVUNNdVVVQ21ya09YQUk0UHNLc2pkWEo2OUVCYVZ3N3ZNUzBNYTROMUkr?=
 =?utf-8?B?b0dyNXVaWXo0S0pMYkJOeEI2U2ZtbTZCQzhhNlJEdCtibkFIcXpHaWtDM1hU?=
 =?utf-8?B?c1hBbVpBNFZnbXN0aldETDNrWWVrWHBTbFhpVHpvVGZuYllOeVhKSDA3aHJz?=
 =?utf-8?B?ZHQ3L0UrZ0JmYlo5YVB2MXRDV2xwYkg4TjRlYjRlWkV5eWlFay9JK3dObE8r?=
 =?utf-8?B?SUVjWTZHeEMxQVY1Rm1aVHJtU3hBWWd5WG9VRmFSMWNTTHk5S3ArZm1sQlhB?=
 =?utf-8?B?aFFiOC9CdnBQSTBVc3VvckNmRTB1SUFQTjJmV0NxT1Q2V1pkZ1I5U3hoSWF5?=
 =?utf-8?B?bHY4S3oyQk84dHAzdS95SjVnK0o4a0c4ekMreTJjc0w2OXRqcDcrQ0RBWkZC?=
 =?utf-8?B?UHBpZHhhU2VYSWVyRmxEczlwaDV0Rkw5R29QTXJyV05TRDhhdHd0MjEyTWZ2?=
 =?utf-8?B?ejltMm1TNklCTHhYeGEzcTBHdm1PTnJuUVNkeThYUXpEL0F3R3ViZDNUZVpC?=
 =?utf-8?B?RFJKNWlUWTFabmNNaktNcWpqZ1NMcDJ3bWVTOHVxanhjQW1pY0x0Q3FiN3dm?=
 =?utf-8?B?N2pOeGkrQVpwYmdRZ0U3THR5L0dRd0tRWWk4UXptZUozVmpIWmx4YzJiaVBS?=
 =?utf-8?B?cm1WcllHRUw0VlB2UUx3Z3ZKYUw1dml4WlZwUmxPT1IrSDVsamc3azBhRFBX?=
 =?utf-8?B?bWo1ZHkyamVOV3BaQVhQTXZoMFBaeHo4Q0V4U0RLOFQwakM0SFljSXN6aWlF?=
 =?utf-8?B?eVlCSThsK2ZVRmI1V2k2ZzRwUDVtQnZ6bnYwb21XQ2d4ZkNPR0ZLdEhEalFj?=
 =?utf-8?B?cnQ3VmpZOTVvZ3ZXc1RIdXEyeWVCV1pwb2VpOFFXRDNXd2RzTGdXVWZHRjZz?=
 =?utf-8?B?Nm9DVTlYeEMzVW5Cdll1NkJKVkdiL2ZyNTVTT250UmdkblY4TmRQN1J6eFBw?=
 =?utf-8?B?THFCd0wxKy81RTcrSHV2OUYyeFNuTkk5L2ZqZGxUVWd6SUp6MnB4UFMwaUUr?=
 =?utf-8?B?cHRObXZKRUZRU1A2dGdzUjlHY051cmtaS1h4TEp2V0NaWEN4dTRxTEJGcjgr?=
 =?utf-8?B?N1pjM1F4K2FXYkhkL0l3YmNMVWY2dHNYZmFVSmxYNmU5Y0RoaHdvdStBc0hv?=
 =?utf-8?B?YkNnVE9lM0RSRGh3YVd6elhzZ0JpTE5HUkVpKzQrRENvSW9XUURFZE83RU5S?=
 =?utf-8?B?OWNla0lsK3dZQzdlM0loWTFiMTZRMTg4ZTArSzlYOWNxdDVyam4vdHp4V0Q5?=
 =?utf-8?B?N3pmcnZGNmtFWVpyTmtGdERqRUdPMmdDQ1pOVHRmZFg3NzM2MzBBZXFlVTA0?=
 =?utf-8?B?WXFJZUdPSlBpUHpDU21zelpuT1lMWGUrcUNqWHNIQWtYa1JXVVIyU3FmbzYw?=
 =?utf-8?B?cWVZeWYxVkRjRGZqTGhwQUZseEJEbFcwNUpkbnZRL3JvRkVTaEFXM05PTFkr?=
 =?utf-8?B?ckVYcHFRaEJ3RkpnSnluQ1RjTm1uMVVNQmQxbGw5b2dHd3g5bm1UYXhOTWdG?=
 =?utf-8?B?a3ZweHZJZDl4N2N5YUFENnNVaDhDN1dWVmM2NVgwKzE5UUxaVDdLaWJQeWFX?=
 =?utf-8?B?WFBNc2thMXg1b2t0Z1owWlhLYXlsbFJqeWwxVnB1TVZ6UVh0a2RSTnVtZ2Rq?=
 =?utf-8?B?NS92Y3JHVlFGZU5UR3cwSDQ3NFVPek85Q0xGU283T3VZa3ptdjVXaVZ3WVNI?=
 =?utf-8?Q?dsKnKQ6K9UoB0VgQ5yWpCAdyU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95861b1b-8815-4685-2dee-08dbaf71cbce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 07:12:28.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOR6if999tcgwQOJ1xTpi3LZE000gens1+qJHQzawk5BiN0fmqcoQYp1UFee4+aQpmBXdpDeck3EErkaJH0blQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287

On 07.09.2023 03:22, Stefano Stabellini wrote:
> @@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
>       - A loop counter shall not have essentially floating type
>       -
>  
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on if ?: and switch statements.

Do we want to go as far as permitting this uniformly for all switch()? In
my earlier reply I had included sizeof() for a reason.

Also (nit) there's at least a comma missing after "if". To make clear it's
keywords that are meant, maybe better use if() / switch()?

Jan

