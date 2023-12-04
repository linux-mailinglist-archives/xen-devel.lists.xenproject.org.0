Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34211802E75
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646651.1009125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5BM-0001lj-4t; Mon, 04 Dec 2023 09:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646651.1009125; Mon, 04 Dec 2023 09:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5BM-0001jB-1z; Mon, 04 Dec 2023 09:24:04 +0000
Received: by outflank-mailman (input) for mailman id 646651;
 Mon, 04 Dec 2023 09:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA5BJ-0001hw-SD
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:24:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db15e2df-9286-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:23:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9693.eurprd04.prod.outlook.com (2603:10a6:10:322::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 09:23:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:23:56 +0000
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
X-Inumbo-ID: db15e2df-9286-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3BTvI+hpVi/KL8Weg0OTiFmqKUyk55yo43s16aaw95z4cDWuOoq+xXmothfD5559PJ0Yd1baB6UeiXTAwsYIBKzxQMTD7fYr2N0/xqRZbB7uL2lr7WmPUoBqaPolujkyojm2d1qpt7QzX9ETWptJWr6Dnyo5MPk3yTZARhzpzY/LQRBy9A6q9duHtMTJoQAPMgA3bDDrUtbJBYhgxpmof4c30gvJB/jAjcAfMs9TyMXwnn7WnALu7xL138mMswE6/YBT52GDJXvrk8Q1qzB82HYSerUGXZQAAi5cp0xSQsi3nOJpLnXQjGMuNa9RB2v3HpaNFix04gYlu51E9YH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my/b24KJPWtpI9z0upvFzWYYmWySoD5UmkW4tA2ie9c=;
 b=ZZcX0K8//OhpmiiEPf1Rc5dHMa2NoEPGON+yetKMV+sC8zWDHEU4g2YXd68mCBImPySubA7t0+6rSHyf8n7eObj+5849fdAytO9Kzz/O1gK+CKfqdSxsLlT+0jeQfQG9ZvwI4J/X0MiAMZkljBiqQ+m0+bfhQvslt4D1am/yu5MTvpehGrqX+p+9s/cmqsXdhMxCk9qvAJyzaTno2PnRE4FMc9Q6ks8IK3PFOVkGBK3ykTCXCMQjBywlPLNSV1Pn0rT+Ee1W2pWHc0oizbvPk5KAsMdW1MzcZtfLcsQRjDNA+DLLfZVck+7cA+ALaz854ekJEIziOYKjUUY8QHXmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my/b24KJPWtpI9z0upvFzWYYmWySoD5UmkW4tA2ie9c=;
 b=DuABeSf9bEg9Vb8dE9ZmF6MlHyBnmKX+o1ql9LfSVlS/q+bzgZvJnutmkQaAP85iSurNYjWTYOEHnkKi9sotdozgklhPwNp+51VKIXzrzbbP0gyYlTaE41bfsxZohBTMDVhHQVBw4nc9NTRFfJgrEqZeXlOiRUoXWrtyyaiJakZFsW8UgWQHsBFd0VaFQmQTJpguF25uEu8t/DPpGqGf5u5+6GWbPpApOXzT7H8s8+N6YDSx8AperxUAWBo0kbI9tEXobQdglunbqpp0I9uROfHGQQgLG++abpoiNebquBYi63uXwZmImr8DLHeXNINBWo9lAgucnAFMzYjwBZvnrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d42fedb6-ac96-4404-8478-66783118dbd1@suse.com>
Date: Mon, 4 Dec 2023 10:23:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Moving domain from credit2 to credit cpupool crash xen
Content-Language: en-US
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 Juergen Gross <jgross@suse.com>
References: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef9c08e-28f5-4e2b-1042-08dbf4aabd4b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FErm1SEKyZjM6iDB4mS/UFGkCUsvAx7RTe2zOwSaowQwHjj/4dYFjAKRIky2wfv1c/7QI96oAjx2GNf8OKaEezJsm8EWVougBrZE+CKE8p/DZZTOYCL78VrsLd3p6O/9VzfJ8l9wlUTZpy2HePuSrxzO8l2InUkUvMQzz61/QfuNFoC8DYfSTP/a3odRYFBpEIianMV3qs6rr1+GtOBCh3ZIhfElD/J8574UIbz2uKtAOkO39Rk7COG+MVV1Yzywa011ygkl0F8hff8VWQGari0S5R7mzbIDfbCptfts8lhle8bIdVr8k4IdKarOCBvXRKJ4iLnfjZi5QvnVNH52VreUOJ0dnI8NlQbb3DXuTCftTHftcwhaNNd+idUyN/PchaGK096jfSknv2oLQOu11u7xl7tcLCA2sUFt5A+LWJdiiFiKZW+vdbAp+qsCKiwpw1VOLoSei/29wvvL0eQ2MsejE4RLZhm14e9GX9Kd14ZTH+icN68fBWeCbPGg9lJpRA6GpfTtc3eTVR+IITQJKN81oRb1wgg5I2YuY45iM/0X3cXR/OjVsuIRWhLDrrl1hXZRHXqIQFCJ3cBolbreX6ZeDykmUjvJ/Qwp8Mfsf24dllFQelYzQqpZvm32K73Ke8/lw0FxSv7NgGxPkwltiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(36756003)(41300700001)(5660300002)(2906002)(86362001)(31696002)(2616005)(53546011)(6506007)(6512007)(26005)(478600001)(6486002)(38100700002)(31686004)(8936002)(316002)(6636002)(66476007)(4326008)(110136005)(66556008)(66946007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JkTnRnYVhVQWV4WjFmU2pDRURMYlJ3dFpGV0dZbE5ScmwrOEc4Tm4rS0Vh?=
 =?utf-8?B?dHYwMTJXbHpDSFFzTXB1cHROSkFkcHQxcDN3VzdDWGN3WUZqR0lyc3Qvb2xp?=
 =?utf-8?B?bmhUR2xMRnZYZC9LZ3VuSFdzQ2JML1ozNzBtaDlQS3QxZlJ5ODVWSnhLMlB0?=
 =?utf-8?B?WERkMCtJU1BYRlBhSGZvUDlpSXM0blN0T2swWHdFNE1Ud0dNemtBV2pibVk5?=
 =?utf-8?B?QTJwQjJWRVowWmhtTSt0ZlZmakRaRE5tTXdBZE16U1VZcE85TEVMUDJxZXhR?=
 =?utf-8?B?Z1o2cUhhT01qV3JVaWc4YUZPS2NaT042Z3RMT0NhdmluS2s3Sld1Tzg5cStH?=
 =?utf-8?B?alNubHFZQ0F3MjZIa05sWTlEKzF4RCtWcjF6clNnOUZaaEd1K1VWVXFHZDRm?=
 =?utf-8?B?UVE2QWlhcGV6QlpzMm9YS2ZOWm95TjVuVGNKMEpDT0I4VnVCS0J6WHh5VUJw?=
 =?utf-8?B?M3AyeVhFN3o2R2ZCR1NNb3VDaGlhOTVSUUhQd3dXUVN4VDNpaGZRUGtuZ1o2?=
 =?utf-8?B?VlJlTzNkaXYzK2I1VmxXOWRncTF6cGZDZitjVHN1STZJL1piMVBTQWlIeElO?=
 =?utf-8?B?VlVINFI1ZTdDaktoMDg5RzZndHdKd0tCcXB0T3RxZTNETXB2RTVmcXc2MHNo?=
 =?utf-8?B?c2Q0V05JQ0ZTbEl4cFhocmxaeVJXdEFhdm5lb2JBZHYvZ2JJVHNOYTYzUmV6?=
 =?utf-8?B?emdweGVDS0o1ZmExVUw1N0ZsWUEzb0RFQ0ZjVTB3R0ZYcUJNN0xVanJKRzNQ?=
 =?utf-8?B?RGNlWHZSbHFSdkpQbFZDamZiZFdkdVE1K0JLTTdWeWgyY01kVXlIb0lsSUxn?=
 =?utf-8?B?eHdLem14bU5sMGc1QW5VNFg3K1R5UGo2alNRbWZRZUM4MUJSbHN2MUI2VzZi?=
 =?utf-8?B?VlpwTEp0V0czQUI0QjRLUnhOTXJIMk9QMmdZMG9VMEw5RjFLaDdrY01rdS9y?=
 =?utf-8?B?T2pWZHBXUG5tTmpCUGNLUTdLT0JBUkRmUHFWUmxQV0duRFNua2FXNHBFdmxV?=
 =?utf-8?B?RE1Db1FLZEVRZ1BINnZYTVFHUjF0NjYxVUpCN25TZEdlQks3WWJPOVZDUHZX?=
 =?utf-8?B?ZWkxdkw5aGpBSGtKUGFtSVphOU9MUnFSVitDdlM5ay82Um5uWnNqRENTK2Qy?=
 =?utf-8?B?NG9DaTlESHV4dDBLYnZySkpTQ1d1OWQ1YWo0QmFTWnlVUUpWRStxdWoyOFRW?=
 =?utf-8?B?dUdIcmxIa09ITmlySGdUa3lQK2M1WldLY0xrODl5K3lCQXNnV2VscWxUMUFK?=
 =?utf-8?B?QWNxQS8vcTRVdjJxUjg2ZnBUMzJLalJudXVpQ2VKRW93MVh3d3BXV2FUSFpB?=
 =?utf-8?B?enFhNTRmaEZDdzRUNXMyb2xxMmgxY3dQaDNyUjBnSWRzVnQ3QXovMDFMSEZu?=
 =?utf-8?B?Uys4bzg5YytaaU9Pd1l2ekhTdThCQS9jY3lkbExaYnZET0xsS293SmJ2L0FG?=
 =?utf-8?B?UmtpVGFjNHE3dGluSkNaaDh4NWxTOUV4RS9uYVhkT3A4dkJINnkySmVaL0p2?=
 =?utf-8?B?OUltNlpKYTFyK2ZHdlJlbSsvZFlaV1ZwWE5SQWN4U0RxaHVsOUQvQmIwazBM?=
 =?utf-8?B?RDhhTzVUWnlIZkZFS3J4VUduYWRrR0JpdVV3NzJLTzBxVGplMFp4bjliN0pL?=
 =?utf-8?B?amxQQ2x3amM1ZmVoREppZUZlZlJyQW42RC8yWXR1TmI0MTVsWDhkZVhlUHZh?=
 =?utf-8?B?bHVWWVVxazU4b2RRaXRXV0lOK0NnQ2J0aHVwV2VHSkJpRVpKZklqU0dQUEMv?=
 =?utf-8?B?THFzV0MzQmJoRzJXU0sxSGpScGZwNkNON0wzeExBcHhsb2JBd2RIOEVOVXFp?=
 =?utf-8?B?Uk56RXZFV3ZWQ3dxMFVDdGVQeS9UaUZEWnhkcGhDSXFMWEhwSlp0S3JKUzdO?=
 =?utf-8?B?c3Y5alNZRUpMOU5ZOFNjSFU3d3FLbFEyL0lyNlJIM2hZTTZSTGNpZEh1T0dj?=
 =?utf-8?B?ZDFXYlJZYXROZFBXS3cvdUJtQlNxTnBhOGVURzhONG5LK01SZHlZeWR5ZG9R?=
 =?utf-8?B?UlpNVUMyNjFlQkhYOFhrR093Uzk2SmtUQ1R6RHpUQ2w2MStJWWZlV1k4VjQy?=
 =?utf-8?B?dHJHK3RTdGgwZVRyWnhmMDhodjA3NzNiVmNWNHp2eUVsMzFYWFExZjNuYS9L?=
 =?utf-8?Q?ZVRGTSqBRaiWumexHkS4c7Dde?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef9c08e-28f5-4e2b-1042-08dbf4aabd4b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:23:56.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht0hClexHbDvD8PupiI9lWOQml4Y8XH+5pJBJiUG0ZmS4bx97/Tfug6a0g9mEZR4aUL8m7K+odC6rAoHbSPngg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9693

On 01.12.2023 21:13, René Winther Højgaard wrote:
> When I move a domain from pool0 with credit2 to any pool with credit(1) I get the following crash.
> 
> 
> Software: Xen-4.17.3 / Qubes OS 4.2.0-RC5
> Firmware: Dasharo 0.9.0 - Z790P
> Hardware: 13900K
> (XEN) Xen BUG at common/sched/credit.c:1051(XEN) ----[ Xen-4.17.3-pre  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    2
> (XEN) RIP:    e008:[<ffff82d040237cfd>] credit.c#csched_free_udata+0x12/0x14
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v2)
> (XEN) rax: ffff82d040237ceb   rbx: 0000000000000014   rcx: 0000000000000013
> (XEN) rdx: ffff831087d7ffff   rsi: ffff830ad80e8da0   rdi: ffff830ad80e8da0
> (XEN) rbp: 0000000000000000   rsp: ffff831087d7fc90   r8:  ffff830e2d6a49b0
> (XEN) r9:  ffff831087d7fbe0   r10: ffff83107c481068   r11: 0000002cfd1c274a
> (XEN) r12: ffff830ad80e8c80   r13: ffff83107c45bee0   r14: 0000000000000000
> (XEN) r15: ffff82d0405a9288   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) cr3: 00000009284d8000   cr2: 00007fb535181240
> (XEN) fsb: 00007fb534c5f380   gsb: ffff8881b9d00000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d040237cfd> (credit.c#csched_free_udata+0x12/0x14):
> (XEN)  75 06 e8 19 74 ff ff c3 <0f> 0b f3 0f 1e fa 53 48 8b 5f 18 48 85 db 74 2b
> (XEN) Xen stack trace from rsp=ffff831087d7fc90:
> (XEN)    ffff82d040247503 0000001300002030 ffff830ad80e8bf0 ffff82d0405a9288
> (XEN)    ffff83107f59aa80 ffff830ad80e8c80 ffff83107c45bee0 ffff830ad80e8bf0
> (XEN)    ffff831000af1010 ffff83107c45bee0 ffff830ad80ed000 ffff83107c45bee0
> (XEN)    0000000000000000 ffff82d04045d5d8 ffff82d0405ae680 ffff82d040235303
> (XEN)    ffff831087d7fe20 00000000fffffffe ffff82d040236ec3 ffff830ad80ed000
> (XEN)    0000000000000000 00007fb535230010 ffff831087d7ffff 0000000000000000
> (XEN)    ffff82d04045d5d8 ffff82d040234763 00000000c0000102 0000000000000000
> (XEN)    0000000000000000 00000000c0000102 0000000d00000000 ffffffff8101ede6
> (XEN)    000000000000e033 0000000000011082 ffffc90046ebba90 000000000000e02b
> (XEN)    5a33a1a65352beef feadf9effdf1beef 122ae2fa736bbeef 46023e9af174beef
> (XEN)    ffff82d040227cc6 ffff831087d7fe48 0000000000000000 0000000000011082
> (XEN)    0000000000000000 ffff831087d7ffff 0000000000000000 ffffffff8101ede4
> (XEN)    ffff82d0403495d0 0000001500000012 0000000100000006 0000000d00000000
> (XEN)    00007ffdf93fb3fc 0000000000431042 000000000043d990 000000000043d9b0
> (XEN)    00007fb534eb8434 00007ffdf93fb400 0000000000000013 0000000002361838
> (XEN)    04457fe81f7cf300 0000000002360870 ffffffffffffff80 0000000000000000
> (XEN)    00007ffdf93fc652 000000000043d980 ffff831087d7fef8 0000000000000023
> (XEN)    ffff83107f544000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    ffff82d0402dd07f ffff83107f544000 0000000000000000 0000000000000000
> (XEN)    ffff82d0402012b7 0000000000000000 ffff88811abbc100 00007ffdf93fb2c0
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040237cfd>] R credit.c#csched_free_udata+0x12/0x14
> (XEN)    [<ffff82d040247503>] S sched_move_domain+0x5b0/0x5cc

Hmm, looks like sched_move_domain()'s calling of sched_free_udata() uses the
new pool's scheduler, not that of the original pool. I'm puzzled though that
there's no sign at all in the function of it caring about what the original
pool was. IOW I'm not sure that the simple and obvious change to latch the
original pool into a local and then use it on the "out_free" path is going
to be enough. Jürgen (sorry, again you)?

Jan

