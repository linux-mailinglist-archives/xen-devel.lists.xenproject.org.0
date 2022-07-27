Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A75824C2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376055.608650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeaQ-0006JV-7r; Wed, 27 Jul 2022 10:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376055.608650; Wed, 27 Jul 2022 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeaQ-0006HX-4t; Wed, 27 Jul 2022 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 376055;
 Wed, 27 Jul 2022 10:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGeaO-0006HL-BO
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:48:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9df90f98-0d99-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 12:48:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5497.eurprd04.prod.outlook.com (2603:10a6:10:8a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 10:48:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:48:13 +0000
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
X-Inumbo-ID: 9df90f98-0d99-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaaQ4duVb5dqT5GK4vg5YAWUcbH3VyzDruD4Jv2cX4e6r496jMLONxfLK+TEef+YMYmfJ0Ra4o8Q2lTaMBWPnCQOY1tGsaF+21hsAxRs4z0WMaDFqCF7anJfLK4pBcvV7K77PIwox3ZDkP4LVlgVYq77R9z3/138NFdUQyNI2VX1CH46Ago3RrlWBmDZ8fEmlcKS2RUHFx+IpS/H57EcG+Z99YASgxj8X+xHxqJPk9bGiuSd3E7Z1aLRvdErahW4gfOLavM1sY9oJijIsRjriwzmils6wZOurBNivaifyhImhbMOrTCKI/P8oKXEoT89Nm/Voxai1Eb09AFIEh6q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZodIK44oQNCpMRJ6hqorMeZoI7hGSt0V3b6pyUE9Xw=;
 b=LHKGb4rhcjSoQhPcfv/H4ObnMzIgtU6dtZi97RBmId7zHeoMRBFkwYWhwlPcg7tNtDU09ZFCKoctF5+0R5EqwyMoUBGFWfCc+dd8BCH/66KGTRBIuVVKsj7OnEjfydUP+IZbvztb5gaJ9XXl8Q20N3U6qsYK2MxRHrN+wdwq+FvAoPPQHYQmogMPlP4j42TKK0n2A3/H1uLKxntffSPBiROv9xgcp9FMGiod/N9OfnQhFonZY7mcAannJ12wyG+uBr8mpoDcYf8sm5E3RTGElIy5FCGTS/8w122JOYie47GhPLf0SJdziVptgkBPBVucsqiPgOehrtwm+0Hd6gvYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZodIK44oQNCpMRJ6hqorMeZoI7hGSt0V3b6pyUE9Xw=;
 b=VPGuJTTqvcRTikvU0A83iuiOT02ZnVjW0/auQLh23wHiwkVJlZXt549L2rx3aljMX/p+GFak//ezdDXUSLnkF6DNxr1nKoKed6wl23GcJLYQ5MMrsONP2pbjCD+qXwAahkgRbZh5Vj1KfvBO/lb0jdh5WW+m5lwkMxxebvBmDBzGAejPw5R6pFkQP5rr31BHAzLEtTc2hrAcgzbEUWHSaei78LA0D+JXolI4qjYFwjq/hOYPGIgsXHdlkWpkkjv45NQkHL8zJ7HARQhYTPVJTL0NluBrq5TFZPlvsOz991i+OGhD1rBEWAPWVxOZGd7p2gLXafPKvpUNl95vfctJhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ffd7303-2814-37a0-b1ba-aaf5b21837f0@suse.com>
Date: Wed, 27 Jul 2022 12:48:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/PV: correct post-preemption progress recording in
 iommu_memory_setup()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <amc96@srcf.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13f6ca1c-559d-b89e-207b-d2685ea80bef@suse.com>
 <b5c3d4e0-5055-f220-691d-8367536e1ead@srcf.net>
 <d7cafbee-37e2-0e28-d1ba-51d4b49c0752@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d7cafbee-37e2-0e28-d1ba-51d4b49c0752@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed4bf4c-acf8-4c0d-16f3-08da6fbd8126
X-MS-TrafficTypeDiagnostic: DB7PR04MB5497:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tb1HeTFddxfu+wFuAZ/nH+XZUDijAM1OcqxPJvuo9uB/JsifiPCG7BJ1LxEDXB57aQ90NF07tc4stq1F/0zwRrTBBM76k5v8m04/1tjixw7EKDwzyVXyf35hheTlcFH5m/RL5lJE3MC51bgHHBOjZklAjM+VGE+TNj85oXoIwkvcl2DRgC4b8xSwXcw9xhqr2qD+Z8dfqiQhYGVS+MjUlEZuTNq6rUgqlCMeLbqb8q5iXBjavI8DP/IifBf2UjqvoXLsY9Pk8jnkbsHS/fYwLv1sWRz7l74aXSGtaVFz+iUg8TlRdjelRzJ7XzjnyHwm42Kuy2EPf6/Md6+hWUEV7nZAovfTK8wqsBP6ReQ8DMZhLugmRQ+VyM74GQVSzkKeubIqHjghwefQLoFapr+RT/d30nPzWcOZdylZcnLqc4AyT31q0beQuNowCpYi5nw+QtAXMjM2bt77r0Nkw9/d+r2pxsQgyw3hr574582DaprXb9Ud266Rxh2w72OUBtGUr2VXFnOqDofFwfepg04s5PrSUvIAn9218lInfYnIyEbS+RVAmSwl8RNobrIsuZrdU6m+XCR5mzWjRMnsDX6e3aMdoXHxqVqICeP+S8B+4lz1nE0w4Y3RO+suFRHRAlc8NdkEnWmENYLpnHIb3pfOgoDEI0dseDMe5lnLxVkcEXm0c/Jz9Wu+ncNNIrEAr0sYLZaguOTYnkm62091CNMWNMVpgcWpipD1ZzlhErAApga0HNPDfFznqPSH4Z3Nlx2VZgx+ZwSp/VvupGDfkRJJ58zMj6viVLlhG3/n9O6ENVfb0A1JlsUvxfv09mblM9pMqOw1rU2AWB7B93fk7+jO2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(376002)(39860400002)(366004)(5660300002)(6486002)(54906003)(41300700001)(6916009)(8936002)(36756003)(66476007)(4744005)(66946007)(31686004)(66556008)(8676002)(316002)(4326008)(478600001)(2616005)(186003)(6506007)(2906002)(31696002)(53546011)(6512007)(38100700002)(86362001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpwU1NkRFppTjF3SnA0TXVyQXpRQU05UzJiSjA1UUo1dUJGdnVJZCt1MjJI?=
 =?utf-8?B?WW5OS0hXajBYQjFBaWNlUjd6NVBPanF0cldUQmk2d25oVHJnRWlJczFuelYy?=
 =?utf-8?B?T0NyS3NFVm5yVStaT0U0WTA2ZlVzdFFwOGF5MnN4YjdBbzdUWU90Yk42K202?=
 =?utf-8?B?ZDUrUHNFeVh1b0xYQ2dEUlVoQmtqM2VmbDF0aEo3NzFXckNvdXU2NVVIZjZW?=
 =?utf-8?B?SUtwZEFYc1RRcnBQS0dCakNFSmtMbFoxRU5IWlNJcVpJZnVtY3YxZDVZV0pJ?=
 =?utf-8?B?WFFqc3NxV3NoNVBVRmpYR2d4L3p0YmlwRkFhK0tnMVFsUmx3YXdMUUlLUjlp?=
 =?utf-8?B?OXRScnhTWk1OMEtNM0xsL2VtazBIYmFXc0pudWZRQjB3dnJ5WGJCKy9LZGVm?=
 =?utf-8?B?M1NPbkRXVlpyb2o2L3RhQ0UweWlCVmNJUnBvckQyaXY1QnlKZGlqdjBDb2dU?=
 =?utf-8?B?QThaUmdGekF3b2RER3dMU1RnU1NDYVRWWnVJMVoyUkRZTjFhRWxjN3ZvdlZB?=
 =?utf-8?B?eHJ1WG9Ja3k1eTZ6SmpWYlZubTNHYW1FeE5RUUxneGYyU1hTM2toUnRJdXFV?=
 =?utf-8?B?Si9JUkxwRTZZTUp0dk5RY1ZqbUdiczBpUXMwTVNWRHE3VHptQThLRkE5REZu?=
 =?utf-8?B?M0RTZEJwN21aODR3NVlVaTUzTUllV3pRWHd0V3FKcWdCRitSWVVOdVRCTy9s?=
 =?utf-8?B?TmQzZGV1SXprMWo1aVhxeFZBNS9RZ3NEd1VxUmllNE1UYVp1QjJGZ0NiMDBt?=
 =?utf-8?B?RjBQczlnVktXSGJxY3ZVQlRDQitja01YZWVuTFNYelJMb0dhOEN3NnpES1Rj?=
 =?utf-8?B?MjB4NGNiVVRZQnd1SXJVRHUvTTZpRy91Z3NEbG93Rm9NTHNWR1UrSEt1dFhX?=
 =?utf-8?B?NEx5RjVpNE1ieG1lb292SDdKSEdEOTBVWG0ybC9WY2dNQVZHY1RoVDRmNm9i?=
 =?utf-8?B?bm1Ock96aEFxTWRtTDBldFRsSVYyMEFrbklOTjFaSGQ4ZFVidk1PdUlvUU85?=
 =?utf-8?B?MDRHbDd3anovRWpnYXBGSTlFdGJsN2pZcHNqMG1paTZlRjc5VWI5K0hlVE4w?=
 =?utf-8?B?Q2pxSHJrUW52ckRMU05ieER0ZXp1RkFCMmp4cFJJbk1RV1RrK1BtU08rSENr?=
 =?utf-8?B?QmhLM0NPMzBjVXdHSlgra3NIS05TK3hFQ2N2b2FvWW5EeVFEMEVLNG1oSlVL?=
 =?utf-8?B?NFRZN01vNnE1QzViSFEwekxjSkR5RW9EMVFsRUh6VDBCQ1dJb3h0aXd6OG1s?=
 =?utf-8?B?bzhLUDQvQnBFTVpZMDNEam1ONTM5cjB2bC9YTmdPYzJGVWhQdTBGOXl3TTVs?=
 =?utf-8?B?elp5NUpQZTJiZ0dPNW1kQW9jaWJaR1BZU1ZhbUVud2FSOWFjb2ZRL29oc0pr?=
 =?utf-8?B?NFpDY0JDZEIrcXdrcXJnekxDd2lKSG9VUmJtTFBoclRJZTNta2NpNHM1QTNq?=
 =?utf-8?B?UEc4Y2pEVXRDTjV0ZEc4L2lXR3FzY25NdXZObWR5TUZMWlRVeFdZRGxKZmhU?=
 =?utf-8?B?dWY5Z2U2S2plS3lFREtCNHZ6dG1RUEZOeHZwazdYc3BRaGFaR2NRNWhaNjBw?=
 =?utf-8?B?TFF5bmhINzZSWjBVd2ZCL3UwbXhBb2ZFenFhdlVWWlBoZDlZQ1NZODhWWllD?=
 =?utf-8?B?S0M4MnBqdFFHSi9aVnIxSnpwTklUaXRsQSsyRDNUVXM5a0UvUWcvVSt2VHZ6?=
 =?utf-8?B?QUoyMHl2TEdsTGRwdDNPa1ZFVEtWZ08yNUxRdWM2N0JpL1RXd0R6Y2FKdFhl?=
 =?utf-8?B?TjhsVVdIYi9VL2E2NDdMemh6TVVvSjRHNUQySE56U0w2UTBlL1M0UjdGZmN2?=
 =?utf-8?B?b2JqZ1pjNTVkVlI0b0FZTTlZUWFrblVZRXVKeWNuOC9LTk4wWkpnNEFiTVdE?=
 =?utf-8?B?U0hnMG9IOGxNZFJuek5naU9XTmwrTG50MjdtSVJ4QVgwc080WDBod0VwdEZR?=
 =?utf-8?B?N0xlcm5nYnU4VkZTNzE5K3p4TlhtaUNic1haUlFaQjRSa0VjaytBWEdhTzBO?=
 =?utf-8?B?MVk0Q3M2Tis3K0crMDJMd2ZXMytaaEFTVW5VNk1DVGNCWHhKVEV4QnNZUEpt?=
 =?utf-8?B?aXNFcTIveVB2cDRweTVES05CQmFLL3E5L3g0QzYvTTJFZThXUEE1YzR5Zit0?=
 =?utf-8?Q?+u00iDYi2Cg53tA1EWPz8p2Fm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed4bf4c-acf8-4c0d-16f3-08da6fbd8126
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:48:13.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gxuexYUMOas5O6vRRuPAAtsSKkwRCbQmq35W8398bIUHnicRHm7g4pk583G5e5rRzd76QNd0elu/Y2Fl74zZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5497

On 27.07.2022 12:46, Andrew Cooper wrote:
> On 27/07/2022 11:44, Andrew Cooper wrote:
>> On 27/07/2022 11:41, Jan Beulich wrote:
>>> Coverity validly points out that the mfn_add() as used was dead code.
>>>
>>> Coverity ID: 1507475
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although on second thoughts, this needs a fixes c1e1564c8995d tag too.

Oh, of course.

Jan

