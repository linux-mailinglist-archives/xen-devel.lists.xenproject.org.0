Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3E7FA0C2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642081.1001206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bWS-0000uZ-VA; Mon, 27 Nov 2023 13:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642081.1001206; Mon, 27 Nov 2023 13:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bWS-0000rG-SO; Mon, 27 Nov 2023 13:19:36 +0000
Received: by outflank-mailman (input) for mailman id 642081;
 Mon, 27 Nov 2023 13:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7bWR-0000rA-Fc
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:19:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a876101-8d27-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 14:19:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 13:19:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 13:19:30 +0000
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
X-Inumbo-ID: 9a876101-8d27-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYljT4RECzLK6qHFJZ0v+P4sqyDowLGlkSi9c8KUQPEnaKoEj4vZLN5QCNVkOw02QiljDKlMT7aStchzEvAa7OUxsIypXG2ZozPHAX/TTzG7BMxNvy4cZZX8qVE1AtFFnbS1KSbvbraCA0ZJXMxMfZpUnlIUiWEtwOhJjGHH8jYF4qUEzbxsCMJyl3ZLTRATROYoRYYo3fEYYK5my1AhqiBVOA908QEw7qHKErOKQtqaSN1sx3/PDmky5yPNx0qnf+jsWcGPVVgx3BjIUOHD8FBl2mRaSuqI6aQZorJh5ucyb0q6XlXd/PAX3PWdAjJdWQTdgtmoHRcrFEID5ak9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfmtKYUJa4Hp2RWuPwRM812YInh7TUPrj1c+SIjGv+I=;
 b=VPY4sAywhwnsjGLHsTAkwxewydubpYwTNoZF/eVI2nua46CgjPcyD45vfw/ctpDDL7GZhaLj6VkduGCtHZy8D1zZ4If6Xg6nNeTeQ2L7fbGp9xmCgCZcGmR+jG/cc6a5DKkMZ/y6v+GqFoJH75IcAZSbpHfpq03jZO152rqNw1eoc+3w1SNTZLNmNpB22mXywkGOUSg+B4WiEbFRaMIKHOYzaxK5oq/RzDRTvEVJpnXmsRe+8xokikCDudDLHThjr/5Nd+l27PgUuAjzkS60iGvXIyxsTxzRQt5+V8GGTcR97LFxGAR6pVLWTOFHXHEKlD5OWy1Gi4wgDMrN3hj9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfmtKYUJa4Hp2RWuPwRM812YInh7TUPrj1c+SIjGv+I=;
 b=g93uLre9n0Tc3XxaOH/itrMhUqrBqOZrxyVVJXKr9tJfj3ZUrA2/0AGxzh7kkx4CMLesSXAcQakypews6CPIIyaNDgeOrTnFO+1CvleVRDE+WjNrwLudBV65GalmPVYrPfaNSL24B976Dz99pplLQjL4huIUZbndPXLdPtswnGIzoTOPHiW2jsl82RGntdfzAvHP/XWopNYIBqIRE2OfhWDqPtgaRush1nWPwXJZNDeT3ZB/ozrihLxSLZNE0Bdez21sRw081LkVwzD5nOp/OIXJ9rVCD6DBhT2NjpRhmS5bN0/eHOOhnjbc/EqT+bDi+Y0/8k4Mz9ElbNhrUbpCYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0331c55-fcc4-41c7-ace0-688d98c02dfa@suse.com>
Date: Mon, 27 Nov 2023 14:19:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 2/2] xen/mm: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1700645120.git.federico.serafini@bugseng.com>
 <9a73c479f3a9b2a3f796f8f65de3b3feb735c56d.1700645120.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2311221422440.2053963@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2311221422440.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 396cc1b8-e608-4c6f-b167-08dbef4b7d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UYqXYBQTVtgivycKdbAesiBF9rIxFdIxRfHr4uxyepHWjk4fDSaqOZZClJrIW3pSDgGizzWfj8zDf0Up9IacTItwmhl5AK26+iY2Af60kjTm77omYe3b64jPxXQ0Bh0oX2OWLjgbuuHvTzMxRMQuzZS2o57SsKiZldghVhU+Zt8CMNw+Hq4gAdwjeeSH3xEyi4av5K5+KSzc73S/8UcKEB/VYO94Tr7L3JiQIk+Jpj6oDIJ78hI1yD96c35U0LEWtkEd44+OadvxokKmMSI5nPU+MfG7tByocrnaYDJ1G5lvPemWvusb21DNygxQtybOUU3mCoyxZf6Rupre/gUKlmNdqjHejzJ/ISK41Ee4YCPP9P2bo40PBldL+K75LoP+aoNTM1ZQdjhGHyFOeaKA3UpH01vcBNGSPU8zX3mVUPyg7q56z33/PudcE1UWjECgxIzo6a2tudL86HJjgYIFI5bV4TtQG36K0LyenjUrkycd5CmRJ5wl2UmmVopEI6eB+zZiWcoWM1UDegh5ybVPQb7TDZBOtdDX/FR9h3FgQfJW3Q9THSpibcDzrjsFiKFQTC0U4ldU8/yd76HG18QSd2udgy/kBz1Ou0cnGn49UbzBm2IWSnj04HvrtM6Wk5LJwViJu/3Jv4QrTMXZiZ2fJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(31686004)(4326008)(2906002)(4744005)(8936002)(8676002)(6512007)(6506007)(53546011)(86362001)(2616005)(31696002)(316002)(66476007)(66556008)(66946007)(6916009)(54906003)(7416002)(5660300002)(478600001)(6486002)(36756003)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RCtWZVVxdzc4Wit0Uml1MWwrWHB0aVpMWTVOWVhuUEpFNFhscmQ1QkdIUnh0?=
 =?utf-8?B?TUZ5dkNqbzRFam56eGVjRGVxQTFWMFlEOCthUDNpZW1jdW1KRFZuQk5GUlBU?=
 =?utf-8?B?KzFoTCtFK3g4TTNWQmhPTFVDZ0lwUFZFYjl1TUNoa1Jzei9IcmJ6SG83ZHZJ?=
 =?utf-8?B?cDBuTTRQM2JlQ1Q3MnE4VXJrV3hwaGhGNUFGVWtOV1hHeE5SWHZudU43Ukdq?=
 =?utf-8?B?cEd2R1B0Nm45WHVuZXRxQlA1VEJpcC9iRkVaOWdzcG95K2hpOUxhRVNUR054?=
 =?utf-8?B?MnhzU3p4UDdVWC9qQmlKMmUrYzBZT3NNSzlGMnVTdTdKbW80bFRhZHdJQ1Yw?=
 =?utf-8?B?V1lURE9NTFZVeHNZc0J1SlVkZ01pM3h3U1RzdFNGc3pWemtOeWM4VDBYNnlr?=
 =?utf-8?B?NUs0L2lZRjFYUGRSdkVMdFNNZjlzNFcwK3QvMmxLdjRzR1kvdTJONEtaMGdu?=
 =?utf-8?B?TzBuejMwWXFVL1JQaks4dWI2Ny9yRWlvS2FyNUxMTU5DR0M1UStkMFJuRlI5?=
 =?utf-8?B?L2EybU5GNzNYbXdxWXlBUytJNEYxOWdGcUhzMG5JMGU0cEkrM3k2b0hvQWd0?=
 =?utf-8?B?aThRNDJUVUJ2cnoxVi8zRzZZUms2OWFySlpGcW53RzRPWjZEeUtTMTgyR3Zr?=
 =?utf-8?B?TXFnTGdWRWhLRzJPakpsMTdzTlN5ckRvQUJhVDErSjhwL240MHNhd0RleWJa?=
 =?utf-8?B?UnFDY1l6NHRjbEtLdk1BT1lpcy8zQXJPampEaWtkcmVwNnNodFA1eWdMbjlQ?=
 =?utf-8?B?ZTQ5eHFTMExWYjJYRFJVRmQzd2lPdFB1M1RFOVdXSGthek5LRzAwbEhIUVlZ?=
 =?utf-8?B?MFB5ODUyand5TzY3eVpoa1J2NzBzbkNjOVpvR29uTitIUmlXeDgrSVg1VzRB?=
 =?utf-8?B?OHBlRUNxV3VpeFd6QzJ2ODJCMXJUck1kT25RYS9rTEh5S3NOYjBlRnhRRXQ1?=
 =?utf-8?B?aXFqMGY3VURaRTBOalJZVDZSSFhMdTdlenluMG5keFFHKzRKdGx2K2s2OW1i?=
 =?utf-8?B?Rm1xNkNyRXdyOXNQWm9Pankwb0NodmlrRVpEa3dqck56SUVXK0dyYkFIKzho?=
 =?utf-8?B?cW9pUHVkQU4ranU3a2VVSUE5OGRjMWlKSHVib0hYc09tNWxuanhXZ0twd0ZS?=
 =?utf-8?B?bkJpSkx0cmpoUmhrV0RBYVNWeFdiOThTVkhPa3Rqd0x4ZFVPM210TWtQOFAx?=
 =?utf-8?B?aW5wRUNsNnhLVVFoNUpzd1I0YmhJZWJvTlRqSDRxellsbFp2UnlVb1RibU5k?=
 =?utf-8?B?Z2c1SnRoTlMrVkpBRDFQMVBoamVKTmlYdnd0RE1Od29RZnpNNk9ZL3hGaGNq?=
 =?utf-8?B?MkNPSXN0NjkrSFMrMXNQTzlNMzk5TUdlNThoZW90S1BSekxPMk81YzJSdDU0?=
 =?utf-8?B?dno2dnhGZTZoMklzbnhMaTdnaGV3eU9EQ0l0cTdoVENuRkEwemlHTW1ueEYw?=
 =?utf-8?B?bHo2czBJMHBmUmR4MUZ0TWJ3SE82cjYvUWVUWm5hWnJodDJVVS94dWNwU2tC?=
 =?utf-8?B?L0pmVko3Z0VyeiticnBPZ2o2NTZZaWtzdTFmVU11KzZYME1RVkh1NHFsVnhq?=
 =?utf-8?B?VGg3THVxM0pWQVRxNlJST3B2ZGMzS3pyeEFkQ1RZM3VPU2Y1MXF6Q2laQUFj?=
 =?utf-8?B?cHp0Nm41ejM4a0F0VWVHbUNPUFhtZ3FEWlZNSFU1L2ljK2lVZHVRQXVBRTFQ?=
 =?utf-8?B?VmZMcVFXZGVwdGdvaVUvRHJMWG91YUo0a2lEUWREK1BMdWplWVlwVmxFcFdD?=
 =?utf-8?B?SndnU3N5VGVoSkU0cTlEeWZnRC9TNXhoQk9DcnJZaHN2REFvVmFIK2lQajVw?=
 =?utf-8?B?d3ZaRnYycUUrWDY0bFJGK1JyL2U3UGZTcmZKSEdocUF0LzFzVUZRdWkyZndp?=
 =?utf-8?B?bm9UVVV0bTlQSXNxUlB1eTdLWTI5OTBRNTBMWm9RTnYzU2h0eHlqUHdZMXQw?=
 =?utf-8?B?ZG9MMUpLZ1VzTXRFN2MzTlJYRUllNHpaRG1NUW1NQ2ZLUW0ybzR1cWFTNFpQ?=
 =?utf-8?B?dlhxTlJJVkc3RmRNMFBtMTlBK0sra3R2OFZIWUNBV1ZBMmlMVnY1YkJtVVFq?=
 =?utf-8?B?Mlg1eThQaFhWck1aSGVIS3Z1azJaRnNRMExvV0JYUytBdzVJd0J2Z01WWWFJ?=
 =?utf-8?Q?Qk/ST+Xxac6gwInNA2yIGha4V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396cc1b8-e608-4c6f-b167-08dbef4b7d48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:19:30.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9bk2pDbVB/Mt3gNNvc8gruGDfs+GPCoyh8MqROsYWDUnYMSrWmYWIXpGSN72iZBDjgtmLnjFMzx5mLcyq7Vkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

On 22.11.2023 23:22, Stefano Stabellini wrote:
> On Wed, 22 Nov 2023, Federico Serafini wrote:
>> Add missing parameter names and uniform the interfaces of
>> modify_xen_mappings() and modify_xen_mappings_lite().
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


