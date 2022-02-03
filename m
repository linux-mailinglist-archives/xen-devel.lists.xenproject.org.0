Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C464A85F2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264828.458081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcs3-0001NU-2s; Thu, 03 Feb 2022 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264828.458081; Thu, 03 Feb 2022 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcs2-0001Ky-Vz; Thu, 03 Feb 2022 14:13:58 +0000
Received: by outflank-mailman (input) for mailman id 264828;
 Thu, 03 Feb 2022 14:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFcs1-0001Kk-58
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:13:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85e78eec-84fb-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:13:56 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-l_0gKs22OgaqIq-0_oWDSA-1; Thu, 03 Feb 2022 15:13:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4502.eurprd04.prod.outlook.com (2603:10a6:20b:1e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:13:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:13:53 +0000
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
X-Inumbo-ID: 85e78eec-84fb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643897635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zm0wIMA1IAoeOuJCXF+lU0XyxSNv9xb2pgurAmm6lU4=;
	b=PhGN2lkvLreHtS0ZwE9ZsO8wqf+68JodTUpwSVaEnKxSycB65cGS3CCcsYflbyo+t31u1A
	i2HKqLOiphUyqjXux7Dlb8o5oxOZe65WSapSCZIJIWTAaJ24lwAF28iUCOsOIvD3/2VeaL
	h07X3G1BGZuipv4yer0fz2YASd5hmp0=
X-MC-Unique: l_0gKs22OgaqIq-0_oWDSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOFJmWaEd/eHcQ+OWeLg9y7vifmG17Jap4EMKFwvaldDu1+Fz1Lzwl43yuOUpW/hItVUABzKFR2h0r+k6JARruC55cPipUCY3+y6kZ5o9LJwtu4IivYgckCjsRSlbRZnieU4Z8CMZP1TJk0++VoGMvUB0ykkV5YzAYtQ4/3mS2b9ZjKhYYOsKSve6UhCthF3XEJA9UDFekhh2kXwwipSpjlLTH++Hi/DPEs1ALvbVY+Iq1BHzmXdQ6yC9KO0FL+u/2XaWe8/m3fl13Rav717oDcFNdHapCdZf/5Zw9tuE3LESNRvoWodOd4pinuKid0ojX+OdXJUS7UAqyN5j02PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm0wIMA1IAoeOuJCXF+lU0XyxSNv9xb2pgurAmm6lU4=;
 b=IXg3nJP3RzdPkcuXtzw7o+oz42A3Sg0byq3Mydb2l+CkNblTJ7ME6mr2K2NESx7HN6Uk5mu3KSHQmjCAkqqDKiepU0RxTvniw1N7We2Gb4LE7JBJwWdVq75NRnD62oAtxTZJIic1p1uMHBv4mTH3kNBOMJwXb0+HgEI9a/p7DyuFD9BjH8F8Iio5/JBZw1tFk9+/rRlWxsyAgAB/PYNhryITkMJABOOoIkJCpgm/FQRDufxGAjSfbyIA3YYxQfbIV+Ctvc07ABrorjWjE1LtI+GKP7E6q42CvaT5BuHcRl5hnuhTkPE21AX+RaLLrBr+twjV6FgOblFJ7oTyQlAxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1b1aea3-4258-d012-b7ae-634c3efce993@suse.com>
Date: Thu, 3 Feb 2022 15:13:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.15.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8042517-521c-423b-6f91-08d9e71f68b7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4502:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB45027CB6D1AEFCE0288841CAB3289@AM6PR04MB4502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YNuOwmyh04H1YCh6n5jNqT5jEYkRZRrPDY7zSUKMLYOdQbJy4SYhNgaAlOHchNXAaMB+b3zwz/BpxTfRVdBB9Y/f2PsrqesXpbeaNiv7638fuAMLXYhNRq0TE8lgoHJSTjVRgX6v/2SWaDAfGXcVUh363VKVwvg3vo+BzFcFhJ8Fqs88TOGtb7Q7GykZdSUv8Ku//zLt+Ks3ZdiqYiFQxRXkZq0hvErX/sIs8yhdS8s5AJ5Rwet4gh4AvOl5777qAwALn5aLPV8dUgU5z2ki1Eexs50+Jat5jrFT9QPvd2CHPiV5vm2zrXLc06OOxMG0bF0nEXshdJgMvQNJ+BqRofGZwwYniBWQ2O/hqVWIKXsLoV1VGPomAtbmsDaf3w0/FsLSmNQMCDoQGik6xjtkhqmdrE0u7DCHr+6IvdIl1sl0sKmslUQS9a6MHH0z0wRS8ElYMkMNTd9EiNqJbYcI+4fz21k6fqZpChXgIhIspky4dChQlp4ruEITUmYJqgq/h3xtnXU5vxGs8kS60b1cMX9a/M+MWPntb3sKnYVnMaSiSkL4kz/SLuQJ8uoHAFBGZ/KnVTkDRm6DFdMhyGY1wbtuzjvtJEt63w/3rHKg+A1i55ezY1eqtx3YC3MpBNl+HFNDKd7G7yQpjsYw6QmbBpUL+kw6G6/6O4FvXZ2gyDj251GWQ5aR2ptoQ8TLavU4BCZXiS65rI0PkbwxfrsGF+xCfJ6UhtglVned+p03VZpE0NW5cfmNZCR7p3C/lLo0QAdiPfnY95+pgwoZ0mkHstk5AjZPIyEhVYtWnz0a6yoGk4bcuo309EhSXnwmJ7F/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31686004)(4744005)(2906002)(6506007)(450100002)(5660300002)(6916009)(36756003)(316002)(38100700002)(4326008)(508600001)(7116003)(31696002)(86362001)(8936002)(66476007)(66946007)(66556008)(8676002)(966005)(6486002)(186003)(26005)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjBRMitkSFViRjd3dnpQSEt6a0VQQVgvRTgyTEJHK1IrTkU1dXVYcThlL3g0?=
 =?utf-8?B?N3JUVWxSandpMmI2R3VGa1JyYlZRR25hczRuaUVteGtuT0NicFJPKzlvR1cr?=
 =?utf-8?B?aXczd3IyS3Q5ZWMwR250Ni9TZ1hjUTNKNnVuNEJoa1NqVE95dVhBQW56aGJ0?=
 =?utf-8?B?VTA1ODRoVXpOM2NvZXFGK0FBSDlUSkh5R2xRMU9HdXJROWQ1L2tZckg5ZW5i?=
 =?utf-8?B?OEUraUZXaWpWMzJqb3FJUHVrVTdZejI4dzRTSnhTdkdWMElSVEdUQ1RQT2Np?=
 =?utf-8?B?UUIyRnV6RHNsMXlsZExublpTQ3ZIckRGQVVCZ1NCOTVKVitramdSclZMQSti?=
 =?utf-8?B?RGhGRVVQODhjYm90aEQvZVp1TldpMkpmVk9xdkJGWEtFZVkzczFQY3RiQlph?=
 =?utf-8?B?WkVPL0RwcU1KWit6YUVUaXljZ2lvcjMrUy9EbHJ2RXhnZWtMV0NlOHVVTDMx?=
 =?utf-8?B?ZkE4UHlJU3ZpZHB1bkJPOTFYMTRRWTFtMTJaTnhUV0ZPRFppcDRRVzVpOU5E?=
 =?utf-8?B?enV0ZnpZeTNrc2JmV3ZSSkNSc2tmVFJod3Zhbm8wZlUwSW9tcGNmNkZGdVpy?=
 =?utf-8?B?NE9KdThjbWdCTzRqWnNCaFcxWS9FaisrMnZPcU9DL2lrUHp1cWVPcmZDK0dk?=
 =?utf-8?B?c0FKU1ZOMTEybHpteVNqYnRUb3FzL1FkcC9FNXJTNlJOSFl0azNDd1pWTmZP?=
 =?utf-8?B?TllBZEhoN1R4TVhzblduN1ppckNaZG9kc0pwV2U0VlZDN0IvRHkxSlhKU1Y5?=
 =?utf-8?B?ZG1YMnMvd2dpY2g5eHRGWEdaOFVlZFB2L0tCa2U1M1ZUeW1JQjhvZUxQM1Zu?=
 =?utf-8?B?bkx6dG1WSGVuc0dhS0ppeGJ2WTQ4UGwwaGQzb1V3OFdDSGdhYjhTYm13YlFE?=
 =?utf-8?B?cS8zb1R3cFpKdkNNNGFnZ3E3REJKNGp1N1o4cHN2Vy9HZzM4bTByTUtvNHUy?=
 =?utf-8?B?RWlMWXB3eHlMVHUvNVZFcjlCYllaTUpObEVyQ1p0dEF3UE1pV2kzWHFoY0pz?=
 =?utf-8?B?WkhrcTNCelJseEpxRU9xSHZrQXpiSW5LMUsxTjBibXlpVTJsR3VpTkNwcita?=
 =?utf-8?B?V0xYb2hFZE5MSXpub3RUQmlRQWRNeW44cEcwck1EQlJuSTNxZ1JGdzBlWHB2?=
 =?utf-8?B?Mk5aZk5KekR0UmhnOS9WU1dEcFhTQlR2VjE0ZlJSbFdHSE5FdVc4dnd0dFU3?=
 =?utf-8?B?ZFl6b1hYcXROU2tYZjAzOThpaTNXT3FwUG10MSs1YUhwZXZjWGM5Rkc0STZM?=
 =?utf-8?B?VXA4RmxPb2x1UWNRZUk4eXVYTk4vcnBJRzYxeGRERVh1RWN6V2E0UmhtcUoy?=
 =?utf-8?B?MnlpZmZSU3N1Z1RaT1VkSFVSTHpuMVNFK1JMN2Y5UWczYmVpNWV0TXRHcGxo?=
 =?utf-8?B?VERYanROL25jcVNiajB0NHlqbllSTEJHQ2ZWcldtckFCNkdFWVJnamk1YUdX?=
 =?utf-8?B?NGVQdmc0eGxDL0ljaERNKzE2RlBCYVJhS01JWVRDaGFmVzBuWnRUOTg1ckNK?=
 =?utf-8?B?T202MHVVcnVnY1cxVVhUQ2ZqRnZJUkJFWitpYURrMGp6b1pCVUQ5VVVLYWg1?=
 =?utf-8?B?bEw5SXJtckFTYlBNem9SdWc3NnBrQXQraUJDOHpiV0IwLzN0Y2E0M3g3MHYz?=
 =?utf-8?B?TE1LRE1EbXNnTnE0L0ZZcUtBUHlHZlVpWFNDY1RTNzc4RFQzT0NseVNnYThV?=
 =?utf-8?B?azNSdlJtM0hXTVZCZk8xZDhnZCtwZ3FPaldWWHRncktSNHBnZCtCbHVZczRM?=
 =?utf-8?B?c2paSXEvOWp1ZEo5M3oybS9mVFRMNlduVTZOQ0tyUm5zanBsK0c4akNhck52?=
 =?utf-8?B?d3c5amExdUNoRnFGTEttVVlybVpMWEs5ZEpkbzMyUHdkWlJ5UFRIVzVOM3pP?=
 =?utf-8?B?MTZMOWJ4WUZ4bXR6MGwvMjRiVWVYUmJuc1QvRFlkeWlnUmY4alNGek0vRHFZ?=
 =?utf-8?B?dlRMTGQ1ZTlZd05oWWNoREk3OVFDdFQ4Uy9CaXJmREtoYjJwWm5XOHFzb2tQ?=
 =?utf-8?B?ZXEwSEtwKys0UGxmc1loY2VYY2FrenprV2VtMlc4TURtclN2Qk80bll3U3I5?=
 =?utf-8?B?eTNPVzNzc2FaTC92SHVLTytLWGZjaWhWVGtkR0ljZEZGM2haL3V0aXpIM2xT?=
 =?utf-8?B?RHRUekRXSklPYUJwV0twMFJIVTQwVndxOUdMczByTFJzWlZtc3FxMnY1MllD?=
 =?utf-8?Q?55UmQFnQFhPyEgQSg4CKW2Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8042517-521c-423b-6f91-08d9e71f68b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:13:53.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIluJoHTXi2atZY+XA+T8907HeQ/KYjNUd0dl4TUOxDtg4xFefpmSkOdTQpXzhII6j4egzbGnRVDJi6Hi2g+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4502

All,

we're pleased to announce the release of Xen 4.15.2. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.15
(tag RELEASE-4.15.2) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-15-series/xen-project-4-15-2/
(where a list of changes can also be found).

We recommend all users of the 4.15 stable series to update to this
latest point release.

Regards, Jan


