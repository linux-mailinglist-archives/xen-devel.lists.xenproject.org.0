Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325C76952F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572936.897080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRNh-0006Yr-R8; Mon, 31 Jul 2023 11:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572936.897080; Mon, 31 Jul 2023 11:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRNh-0006Wb-N1; Mon, 31 Jul 2023 11:48:09 +0000
Received: by outflank-mailman (input) for mailman id 572936;
 Mon, 31 Jul 2023 11:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQRNg-0006WQ-8n
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:48:08 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d778d54-2f98-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 13:48:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 11:48:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 11:48:05 +0000
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
X-Inumbo-ID: 1d778d54-2f98-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQcqg+ufGJBkpsXsoO/lIUJqsWBZcwSYVB56SiKEOiEQkPEV7f4jbe65/g3stjYl5E6RmSr5b/0z1ZOx7VUiN9H7dgwfelP75ymmDA+uKq1diihIQjpOiSqeKlmEQ8DrFvQkBTW3JWl4/rfuYa+4d9sb3BDBY9jJ4Uv7Ba0kYMUqxgCk0GBv5rdaE7v9CbiUOcSs2Dxja/00yS0SA28cV+dOTcGh6QG7OVGRsOelcxCagPGpzlnyj8ayeOdbezgi6G7hXMNkJCUVIVKLrx/w+c5B8MDdK8WUOg8zpKebMjpcXGMMddLyGlqHKtrAT1gP3GQ2N6jouTiY5XGALaPOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e68tzN+r6d6d+ew1BHV68AgQEJX+eBQh5BTQkiEv1o=;
 b=EPkKavUwiIHMrUvPWyyjLBEzOWVjSBo8chG4iTcNUXZxQf6GYPUBTUQSB5oYcRKA02+4HDl4xm8/Uhw6WN3IKb66d/34EpQ2SKbrkbBeiBjWiwdHbBJTd1jCmgd1c+IrR0AJDFKW+3JcWm4DEMeBKYBtL/4VkFKdPiJJ5iQIwgGFpJG5zk8aLbnYt3Cu+zIGO/JELguKhcTKQVlYE93noQaNcGadWrNILfgfVJPbC3GiR/x5Ug6Mc3Wlb/VXJV1vcp5cGlu0AzTxibQkbtUZz6+Mu7wWF0vDsecCDuzHtCp1DUlpB8Wnb3dKCeTJXmMYqNnXAMebIDx09w3i9EyWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e68tzN+r6d6d+ew1BHV68AgQEJX+eBQh5BTQkiEv1o=;
 b=Z4poNHQDmUwzHuvFReMaLxdYgicz52FF07LRNo2/hRRsbTl5UkR7jrDqKc5nlFZYsue413uYuo3bnwIAY85Sv0i4D4mTbKZNhN/vxLOA++g6EZaRCcuRAXocs3BuiwfL7jf3NBbwI2nlmDrr18qcX5JdX2VUKxhhnhJw6TxQDmU1LJUW6oeDdUn2uANaHiU4xDIy/LctLQGYnKwftHZSxtCcrbCb0QT/VA4O8Hi1vWAT5SjR5s7zRq13IdeNcF0nTU4d8j2q8gdxrOFLEAdPz39UT343tZv0IRU05+iyq18nke8jakaS97E9JTnVT0PTJF+YrZFMveEmOzh6MPtGzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed29a170-e6bf-e3ef-9aa8-5b1f29061f1a@suse.com>
Date: Mon, 31 Jul 2023 13:48:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 3/4] x86emul: avoid shadowing to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <951f634fe058ce56791f3e67f011a2218db6626d.1690788513.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <951f634fe058ce56791f3e67f011a2218db6626d.1690788513.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfd1b32-5e13-4467-0e83-08db91bc0048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R4sHBSbczWYP4ji3k25RRJcE2p6spWaHmuHnKKrEo2dOtUVh9IzulVOTH+St0Y1aum3BJ4J+4immJSDjb6rOsllSM8KKU8/QPKC+Cxc+cRplrGerfUbDGyJb2oscLPSFopG7t0RiqhQ5nhtcZ1iLGbf+1xYzmM6ZnjxY080A0TBqaa2QNXOcsfIThqIh2IrqJVImQJ9ZrOwHAYm8t5TKA5rI31nxruX1r9nK1IFVwxaM2/3OF0vo/zum3VL4vBAd4FVtVYVawKbjs5ApgDDcTYDjtbLU2StxVX39HCXVbktIDjx+WztqM85n1jVxVFo2yac0ekEt7ZS5ghRbEC5TWexf24C6g7VjKxfg50wT8kDXcY4gBMXjdNsvyQMeadovz1h5z0l1SD0BkIRdWinbLoOLGHeOK1AxfQrI5xYS3bz6Br6wFVCzlAwoiENDfrHYDzIRTmengyA5nWMaIb0AVwOqKcE2sKtyCrMTqsQSUj/gR1NR/wAyyP/Wv9uRPhPNU2243Ar40PYuIilhFmlgZkdeSp19ZyG7sPHYf9ZDeiQmGkf+iaw8O6aR/t+cvg83ArbKsOdLIZksyZfYXetWsJ6uTq8SZOqQNv51t26T+tg89ei++4/is7kiO+Vkf4bJwVhJF7lbsfpKGSaAdl9rLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39850400004)(346002)(376002)(396003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(186003)(66946007)(66556008)(7416002)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(478600001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE5sWnVHaTAwMWd1RUJ4SkxZdzBJRDJUdjRlYURsenhyM2lGMFIyZHVSZ3Rk?=
 =?utf-8?B?WUloZHJ1K2NTZmgrYWw3L3JoNXFDeTJPeUpiRmc5ZnJLTjFJb05YQ01tVi9I?=
 =?utf-8?B?WGowbjZQMCszODdVZ2plYkpZZ2UwM0JGMGVUcGdnWWlEMGJESk42T2hIOWsv?=
 =?utf-8?B?KzBLblRTRmh2bmFucnhEODcvdTNaZmJSa2s5c09hM3RLaEFwQURseUp4eFBH?=
 =?utf-8?B?V0xiWGtFOGxueDN0UXkrMFE1ZVJGL3BHK0RGMzJ3VVZ3c2g0R2VPRWpVcWpM?=
 =?utf-8?B?QkQxcnVtNmVCU0FXVC9yb3J6aFpqcEZVeXZ2ZjM2K09RdWh2Rjg1azhGMkZz?=
 =?utf-8?B?U1YrSzFCU1RQTk9tVXozWW8rei9rY3RjSW9iMzJ3VlFnSlVlemxrODlQZk9m?=
 =?utf-8?B?YThiYUsxek5uYlZ6MmV1VGNmMmx1UmZ2M3FnV3lmck5mVExIRE9GSWRuZlZR?=
 =?utf-8?B?U2ZvSDl4L2QxbDFERWx1MGg5eGtFaVpmMWZVSXlMc29heHFuc04reGVrd0lB?=
 =?utf-8?B?OXhjY2ZyV2ZOcVRnQ1oxc0w0MWg5Q0Y2enUrNzZBNitCdDNaVXI0Q0ZrNnQw?=
 =?utf-8?B?OWF6SUJ5dU9FRWRrU3VXZFBZRXEweUFaMHZVVERLZmdhRHNEZExwUkJXWVIx?=
 =?utf-8?B?dTRnaDhRQzlPa2h4VzdVOWtrb05IK281TEVrakMvYnFZekNUOWFlMExJMFd2?=
 =?utf-8?B?QlZoQXQxb1h0a0JHWEI5UE0wU0d1cG5IUENFTitjTEZnVERBZ0hJSTdhR0FM?=
 =?utf-8?B?YWU3QVNzVFc5LzBHMUZoZDdmYVNjU3RsTUtuK1NXOUkzcXF3THErS1VNZ3V2?=
 =?utf-8?B?aFlIQzVUTVBIcmltemo3TmFTTWFSaVlUMnlvMmYyV1FhTCsvTzZNR2YwdDhJ?=
 =?utf-8?B?M3J0MVhIUEorRVE5MEVWaEZ1L3A1NXByOFM2YTBaVFh4Vi85L3pGVERwMGJZ?=
 =?utf-8?B?VEhFaE1zK0lpY1FaNTdETzN1T0xXWVBVSytRaFEzdksxTDNZMER3QWN2N05B?=
 =?utf-8?B?dU1DZGd0RUdVTFMzb0xzbzBXQXB1WW1lbWdzZzZtZlFYRC9yaTBJU1JXQUto?=
 =?utf-8?B?WVM3K3hkc1JVSDBqVk9wM0J6ZTF0WHZ2Wjc4UVJhb1JmMW5YNFhOV0drcysr?=
 =?utf-8?B?TEZLSVQ1Zm54R2VGS3dKc01HTThVb0pnd1RKYkVwZXdzMHhCNkFjMHY3SUZZ?=
 =?utf-8?B?bjBXSXc0T2daeDlwLzJUU1Z6NTY5cUUvTnRYV09JVklrTkFlYkUwejdQQnRj?=
 =?utf-8?B?WTJ2ZE1FcXFaVTh6dU5LRGhXSVViQVhicmZJNDFadDZFZ2l1MEIwVGlacjZK?=
 =?utf-8?B?dElGZ0ZnQmkydUtNZFkrUTBmOFo4bFlpU3IyS0Z3WUJaMERSakZCUyswV0c2?=
 =?utf-8?B?Z2E3NytPcVB1SzRIWjFFdUVDOHR5T2lsR2NnTGorNG8rK3hodTQ1Z2R0WTcx?=
 =?utf-8?B?L3BsZXVKU2xIK1p1SS8vRmo5RGR3U2M1WWpVdE9LZ2p6eEpHL1NOc3ZKTTBO?=
 =?utf-8?B?WkYybm5PYTNmWkdvU2xsUlZyVDBoKy8zYkVZL05mdVZ2clRJRHh0KzVLNHZL?=
 =?utf-8?B?RXVxL2lEZXdQbEhXTXVFQzd4SWc1aGJZc3d1bC91NFVUam1WQ1VmNkh4R0Qv?=
 =?utf-8?B?ci9UaUZsRWZ6ZWFZYkhUcUhLTUtOWVR3a3pxZFBPWUJmNkRYTE1CUktKbHpo?=
 =?utf-8?B?MGJLR01yR1hzSkROOUhiWnJYNGxUWU4rcURqQ0FYdlVVQzAxeCtvVjJLeGZM?=
 =?utf-8?B?TUhCdzFWRHhRUklQU2ZML0lYWnJFbndGM0xKWnZoZGtXallkVzF0aXludmR6?=
 =?utf-8?B?YXpWTUk4Y3JoZWtzTFpKZTIycXl2S2xNbjRXTUZXQ1l2Q1FoNWdaNkFxbkFD?=
 =?utf-8?B?VFZranZGSlNUNytJK2FrcmNuTnpIVkR5UG5FTm1FVVZZODVEelFYS3JVZlhq?=
 =?utf-8?B?aGlQTTdIVTEvZHg2VEJoM3Z3bEhRM2EySHFkVlR3eXk0Ry9XVTVicnpEVGdj?=
 =?utf-8?B?dmpGbEJzaVJHV0NmWTFQSmFvaldySWZ2WHdoRXpsR0RVN0ZiNmVkQWhiZzdO?=
 =?utf-8?B?TVQxY051czNEdUlrQzdBUXpGRDd0RmRaVFpNL2lRN3JLRGM2NFFNMVdRN0N2?=
 =?utf-8?Q?Q2GKOzR7xronzvWdWPwmG2v4q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfd1b32-5e13-4467-0e83-08db91bc0048
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 11:48:04.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpqHcATaEWL58qfTqC1BDVQ/6PoOgEnAee0yKHnMGDdxyaPF1kSD9OVqHb4O2g1Jm6g6O82g9flUBfRkcZ5RKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 31.07.2023 09:33, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The declaration of local variable 'cpuid_leaf' causes
> shadowing with the homonymous function to happen, therefore
> the variable is renamed to avoid this.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



