Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0255E5A2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357217.585726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6D1H-0007B1-3q; Tue, 28 Jun 2022 15:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357217.585726; Tue, 28 Jun 2022 15:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6D1H-00078Y-0p; Tue, 28 Jun 2022 15:20:51 +0000
Received: by outflank-mailman (input) for mailman id 357217;
 Tue, 28 Jun 2022 15:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6D1F-00078Q-62
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:20:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c4c465-f6f5-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 17:20:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 15:20:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 15:20:44 +0000
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
X-Inumbo-ID: e2c4c465-f6f5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4BTBFzaT0gz9yXJcyiR76DywuRs5NTwKYPVEjwlVaH/6+LW0znUvMEBbAAajWVLQvT75Uf3oLlc17Fr/or9EqZzDZ6IMyK11+3RmeXDg2DI8OMNggxrEj8dckLqid1ruTSGciZQi87CTRkzs1OEt9wMSoWATwFujZgVhXHopJfWleCLcV/hCSJGtE5yTTEXlOZTrPv3FLcekRj9o1OE0jzkEjYAgDiRXQ4OU6+JKtYj0+4J/1MCfeLvl30m6HqBxWxke7jW/4qosFaelPNp9sylJSXi8SUvmw6972XJ9sD+6XMfem/w5US7V5IPzMf8fKWG+KMbpD+9Ne8kAlsvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2euJl6l9bPd9IDyYyw6HOemsHeHwjnRhK079qHDPPo=;
 b=lPLPG2EXnTwNgAwj0UOY36N8i8YLrtAlP5+DWyHlZNbGR9uRVU+jcZErjW5ZsGB6vthJIve1yOZG7TZvGCUBamGaPnkphmP6c2M+zRT9DS6/HD3w7vYQngrSFQTLe/vIjjWQP2THKA63HJnbUzFiXCnLKRvx0O6YIoZRf3/GYO9o0PIfsJMR3N5SNWEWLR2U7piumLJt44e2ICrSQ+BnUDHn/GkB96N7LzNjwCMNlqgY9FFlmP4FoZVkVP4YUKX0Zav1PhPNR40DZWJs2x+xhzYsiWCqcQDBeCNid+zU0ZxF2QaXO98KtY5Oixxy8mWEUJS/shp4QzHAYdyhRSibMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2euJl6l9bPd9IDyYyw6HOemsHeHwjnRhK079qHDPPo=;
 b=Ao6Qjjux9v8a8hdEei0JM7DRCRNtZ8ubEytoXFLQKzjh771l8rs5FM3F0YhLqCxwhaoT/kj99Sget5GCDOZZhLMknCL2N/UQaxpiMa7n01seF32w+TABPj+xLNDOJXxuWJij/4UlJwSOqZOCFBi/Z2jglXXTYIz/DTXH8lBAaTcpTZvdiK/gb+8Zk+UEGb7Wy2HX6kgogqT5WQD3xBh2gl0iupGpfDaPHiKt/azFqafbeJwr1PjenYYvXg7WIlNNYy4/AlPt8XREIBLKjPI3pmbCaW7UqoPFYXvfxHKBNA5V1O9ZPL4UTLLneSQpK3Aar2zRJZ/F6cxUg7rRFtHgCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad7423d7-c8b8-feaf-93b9-5cb02b0a2526@suse.com>
Date: Tue, 28 Jun 2022 17:20:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 869ad558-4648-40e2-e8b1-08da5919c53d
X-MS-TrafficTypeDiagnostic: DBBPR04MB7819:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qkyel6FXdJu7oal0TFOsIgK+gnFwXCOPpZ3gyrlor+o/NzT+jB0RU5ixHm4O6EL62Ku+RsBn+ZovtYI64MbKp34qZ0ua/dZKlsiwYXOitfXe5gZH2bJGaBwLimRtm6FRToxH1LQUZPHru6VFI4e9f8+Igo/dRISdj+QiVCYJUWjRMAbtSKCXuTekCQZ/GPUGnuhYRJKmcQfyS8kPPe39K6rzKCNvH7cKdSh7FyhpgCDXnV9elNGbhDLDZkKytKyalRxqkcFgHuSxGHVjeXdwPO7YDTkF0t0qReTkPoqwby6cnC2RbEDXa74B7MeylOagq/4c26zyolPgZ3ob9WhVmiiQ825icA/UdYSaB9OA7gd/nwg9HBqjwJ2lrBiOzM6hzs51y0karRKH6ukFkZVop3HZFbyW1xrlZJHs73S66VeJ01+FvHuMMgdJofQw1ecBfANXz645XVHx1o/cFl5qEb7HLsQWOBQRCpCORnM86bKRUjIJbJv7tsUEMITqyEbsSjbKqa3k6YY7PztMBzX7H0qC6WHTzLn52teFof+/oRWix3VsAQtTt1w750YAJ4/P4BvWrNgWvdBsWS+MtZR+fMmae3hUWMNueoKFN6LWfw2XI6zBONW7HDvyuAisJwZ2g0Soji7BdVF84CDNBwB2vk4gGap4eyi4SscGZF7YCrGO/V5E30UByCZRF91PP3e5Z57v39/8/HIki0CUoOaYqmWqjudXfBIghF+1Y5ZxOwLvHpf5M9wYEDEHndkDgHOYmfUhj8kMsucD/rQ1FCNb+ZkaJBTmnRrHpLTZs1KRKcyaMtacPl2m7RTFgcQsd6W9i26Ajs/UZJmADqTvsfAlyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(396003)(39860400002)(136003)(2616005)(86362001)(26005)(31696002)(6512007)(8676002)(54906003)(4744005)(186003)(83380400001)(6506007)(110136005)(36756003)(2906002)(6486002)(66556008)(66946007)(41300700001)(38100700002)(4326008)(31686004)(5660300002)(66476007)(8936002)(478600001)(316002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHliYlRteUhlU29YQ1dnYzVHWmlLSkJTNkdqaDkwOUtVeVpVOCtIWEdLTnB0?=
 =?utf-8?B?RGZGTUtpdXVzUE14Wk5iTXRJRkpzMzVVcmlia2Rvc1o3VnBlR0JYMVRKMnZU?=
 =?utf-8?B?eUQwMTdUWkFFenhQSy9ZVm9jQkxzWXlQU2QzU3BiU3p2L2ttUGVrNnRUOW44?=
 =?utf-8?B?dXBnQjluQ2I3UjR1Mk8vdkhrci9adHg1UU5pN0xVaFdOekdZM0dDaVhIUVlo?=
 =?utf-8?B?enF2V1RiSDFGVjdFN0haVDFQSUhMeFdEc0RUa2wvR0EzeEpZSHZ0RzlsQWhr?=
 =?utf-8?B?M29kMWp4WXJPdkNkL3FEbnNCQWNXSUtJNlh6eFE1TGRkbUt1dDlOQU1vNVMy?=
 =?utf-8?B?dlNHbDh2QW5ZbkJoKzdIZzVUb1Q3QTJKN3crOXArMXVhUFh0UmVKcWJUSTFY?=
 =?utf-8?B?NUxKdHZaY3owUG9lYWUvdW1lYUwwOGNrN0E5SXpsSFEySEFnVU5nSXpOdmZM?=
 =?utf-8?B?cVhyYzNnbGJQdDdEZytINUtvdGRiNE93TUhmQ2FWWTdKNUp1VTlUUVJ3V0ZL?=
 =?utf-8?B?Z1pOZ2xKVlBrb2ZZcnVNRm1lVUVwYS9KUHp0c012NFpnZ0FYdUJkSGZ6Wlow?=
 =?utf-8?B?QTNuWXhqeUVJUGVkOGhFSHFBbDc5bnI0UGcwUE56T05LT3ZLdjlCTEwvcCtR?=
 =?utf-8?B?OGo1aEJnemQ1Qk5pTXcwNHF2OGdmSFlhNFRQb25RNlg0Zk0vdjJVZTBUZ0NF?=
 =?utf-8?B?U1JhaTdTOEZVcEFCT0N4aFFXbDVudU5hbFlhTUFEZXZNTDV4U0RrdmhQbW9k?=
 =?utf-8?B?TG00UzBxcVFodHJSN21RdlJ4REpVdGlUS0p3c3ViMXllR283dU9RVXliSkVU?=
 =?utf-8?B?K014bTJnRlRzNzM3SjlYdzAxYXNTUThFSzFtM3o3MFJiVHhNeXFkV1ZRM2o1?=
 =?utf-8?B?b203UHlOekFXa29qNFZwL0M2TDkwbVN2bjgyMVRCOGhHYnJQK1EzL3lkN3k5?=
 =?utf-8?B?eHBBSHBESFlQOWR1OER2ZjBlRUN0OFJDa21wQnV6T0pCVkZJYmV4VlVYWTNY?=
 =?utf-8?B?eWFsZTdIQWZOMHcxV05MTHVSczNMNDJ5OFI4R2RVVGN0LzhMdkJWM2poeFBz?=
 =?utf-8?B?MFpSd2VFK2JsV2RpVENyYzFjbzZPejlWelI3ZDB2aWIwNVd0SUlkMGVzZmc0?=
 =?utf-8?B?bGhzaC9vajY4RDRjOTdkNm9IcGJwZk5Ic0VPTWZEWW53elpkVEJabExITmdz?=
 =?utf-8?B?a2l6eStxRXdUSjJEV1lWc0pJUnJmRUQ5ZStoSDFIZndiN01DSFh4eVExUEl0?=
 =?utf-8?B?Z3g5eHN0ek5hZFVQVUZJRCthMW5EcjlIbmJ5K2txblgvcmdyblIvS3BiMkFl?=
 =?utf-8?B?RVRJMmFBWDVzbXUvTUpOM2cxc2Q1UlV2bGltNVVmSlExcERZS28ybklIUGNq?=
 =?utf-8?B?ZzRmeEdLQktaZXA1SlRFMDY1NDBzS0lMYVIvZmozbnE3cXJSMVZpVm85Uk1t?=
 =?utf-8?B?VzNUQmpMUk5OU1ZFQWhPdXg0VmxwQVZjSVZQdm1TYklwQW50cVlMYllvdXFs?=
 =?utf-8?B?eitsUDB4VElSc0dxVUtkNUVlVWZ5d3FxZ3ROeElNOGFnbHhxenNTa3NaUFhh?=
 =?utf-8?B?Mmg5a2hEd2IzTFF0dXN0WFNIb24zV05SbU5Rc08yVmYycWFIZTNGNjErdEl1?=
 =?utf-8?B?YXpGUjRaZVdOSk5RRnh3YmZIbmpuNU8zSXdvQXpVMGx2Ky9GSkdXS01xL0ZW?=
 =?utf-8?B?Qm9INStpRVluditnbkhNMUliT1U4bkxoTDRCTE44WkxyTzhBUVJ3b01YOHo2?=
 =?utf-8?B?NjdGUFVsb1VSRjlRY0NDRzRBTWswaHJ5R2hFaVdSVHpKeE16ZU5KQVlHRitE?=
 =?utf-8?B?eXRJWEJBUk5FMlFoZnl6Z2RIQmVVa1NQbmtFc2NzbUdvejJGRmtBYnpCVnMv?=
 =?utf-8?B?L3A0bkdZQ2puZWZGSGtKUTBsT2RJdVhpN1VSVERnTXdwYTR6TTF2TkZsd0N0?=
 =?utf-8?B?YXZTTHcrUlUraEtVQUVRaWtWaTZLWkJVUVBNRHdZUXFZcFFJN1IwazdRQ1h0?=
 =?utf-8?B?RWI1QTh1K0tsTU5UNjB3S0JwSXZNamZlM1BuVFZma2Q1QWtPUEJYZm54S1RB?=
 =?utf-8?B?YURtTVVZR0RlUFRxYldaV2ttRHphTmc0VDU1bjBpWWFuY2xyQ045NTB0WW4v?=
 =?utf-8?Q?Us0YUMxUuJR9UOK3cPcGDI9/S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869ad558-4648-40e2-e8b1-08da5919c53d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 15:20:44.5975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq8faolfTYTN2VlqcebA9p0ViDCOAmLIBhaMyt+AXFXup2oh5XVHjcGeFokCIH9BSMvUVdkmMJLnDzQO06Wq2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 28.06.2022 17:18, Julien Grall wrote:
> In fact, to me, a "static" port is the same as if the event channel was 
> allocated from the toolstack (for instance this is the case for 
> Xenstored). In such case, we are still allowing the guest to close the 
> port and then re-opening. So I don't really see why we should diverge here.

Fwiw, I agree with Julien's view here.

Jan

