Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F346970C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238912.414059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE43-0001ms-6F; Mon, 06 Dec 2021 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238912.414059; Mon, 06 Dec 2021 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE43-0001l4-2w; Mon, 06 Dec 2021 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 238912;
 Mon, 06 Dec 2021 13:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE41-0001ky-BH
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:29:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97674f77-5698-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:29:51 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-IFcU3Z6rN2SdMgnKV-E19g-1; Mon, 06 Dec 2021 14:29:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:29:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:29:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 13:29:47 +0000
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
X-Inumbo-ID: 97674f77-5698-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XaFqQ/j5v8nVoRuIcB8FLvaeesWu7Z2skNYq1vYcRGw=;
	b=cCSr6i0mr5JWwKfSt7NviYs7Dw8XSEHvPyNcgScIDn9A7755GwWhvXS2u2aE4NaEockijS
	qQm1pV0qVPjTSDC98WFSfYLEOZ65GEhl3dBuSu1xEsjSiOBhxP5VnHQeuXIBUL/oPk3OdK
	2fHaS3uCHe0be9UIfFD1SAvip1tGJqA=
X-MC-Unique: IFcU3Z6rN2SdMgnKV-E19g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7RtipHL6iWBdo3rgFUxdxA1UhHnAcINeyn488UbnWt0CM8Ux/rYPWDdzuvz4G6wUX9vckE6z340VWDDJ7+mZ+DSJF3pzHlC8V3EBqt+z1C1VI7/K9rHKdXxy3WADlFcXz4svH28R5uR/CSXLHAuRIh8jP8pJiYQnI8sWlhJD8vOMQrD6dMLkixCw2R9Q3vHJZ1iexhb5td72ctbIKPAm4/aKlHZR1SxCQW0NJYu8X47x4XGFc+JKf0oUPPv5aW2FFvFo0Q19Oomfit5oaa8QbG0dML+86m1cAiYiqB1LRGu9wQd1cxmj82d9nP6SLolfZMXkWhZS9IrpGMCe4mo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaFqQ/j5v8nVoRuIcB8FLvaeesWu7Z2skNYq1vYcRGw=;
 b=TJ+48e3cy+9SlFXJlG9a96hKZ93/7zR23aeXUXzfshEaKrQuAlmgPAQCW4VGBZXmQm/XELFYzWLuOItOsUzB0H1Ff2ZuwbYe3a3Zhdy7AVdnPehAXYvjw8yd8M8VNKx6yfAVFEXgIeLi8Yr6GVnv4/36jYYR4urW996wcvRBi96Udd/Wyfy1KAVmn3Pb0IpOW/WmNkPo9745FDzMlNa9I9hF8LZ0v/xXsgJrmWV+BaLZRoCkoA6vq28C8qt5cogJp9Oi7XjqKQBV7rQdfVVZFvPfNx4g6SvUlfprWhbIiKzUeCr0at21s+xEha/Pctpk5aAGvXeewvx7Jx+GXEmR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Date: Mon, 6 Dec 2021 14:29:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/7] (mainly) xz imports from Linux
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9bbc42-789e-4c37-aa8a-08d9b8bc7975
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28292549FDC7EB43CC74B94EB36D9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z9Im3KAz/2WgTu6CAoifqhFOf9k8LV3uY8C76NkPupChGWjPwdXw7m9WsxxHu4UIU8pfZ7T5X6hqylvriPU/Ikh+yw5pssw292D7uVeTwZQ+JCeu5yfSQuG0xxh79NZXPCcm1d9kEebj2lS7OIJCKilgNgqW40uVFxlJ3I4LBPRjGZLFPZ1izR9YAD4eYgP7ol5jRrNEgAYAC1PpOOL+Es98C337H9QyqEXnTNDH5lrSyH4i6c8iVHH5ns4rHX23ea6YHkg7LCGkfto06OEqfqj4viK9yfOzBAun2L5Xiqh7WgU5sCjKzeZNQ91d1XL/wbhccqzzVKXw8eGOmmGIBvPtv8N2NYSHhYqPQ01BXMX5vel1PuU02SYlZJQX59sVBDc5fCEeVLlYSNEp4p4G7DsiHk3cN+2XDm9cKsvDW2hrh4w5AKxOLjhnUmU4LSeBCO4dFQVOocLv9fK0sJvkho6ca2pjE6uaMeIpZqgVbRJ1hGtiPlzNt2Gg1C8LWwyNbu45bNflY0Vx4YVbDcWPkPlS5iV/ctdfdJlI/tYYDmGi3AsvzJOvOu4KkciDR+y/T1ffpCZd9reRf1BjIM3zeK7yM1VHi32pdFfm1iZMZUgv1pxMGmkuHNaGNbD8CnY5malyg3WBBQhypihZykY1gQsTklgSRNbOAPlo0X/H773d6Jpj+hHs9ppgIIoOpjOB/HhXGNmCy4V01Q7a6MbMOlC3xmia0LzNdZ7zDYMMJIMflnYyPb32O2mzoAjH4hL0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(2906002)(5660300002)(6486002)(66476007)(316002)(6916009)(83380400001)(54906003)(4326008)(66946007)(508600001)(16576012)(66556008)(26005)(8936002)(4744005)(38100700002)(956004)(2616005)(36756003)(8676002)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pKSWcxQ0FtTXV1WEZDUjduQjBJS0czN25Fd1g0TnNEbEV4Uk1BTTUzZTJy?=
 =?utf-8?B?NFFPWS9NcmVyOU8xVzN1eEttRzJ1TmF2MG9mUDJqTWY5MGg5RDFFZFVUcklk?=
 =?utf-8?B?WmZLeHVRRS8zNTI2emNCTEU4dmFBR05lblJEeDhhM2k5bUdsV0ErVXIvUGor?=
 =?utf-8?B?eWV6R0FzZ0gxekJwdUdMcitjUEJXN1VZUllDVTJCZFVockRDalZOMyszcDZ2?=
 =?utf-8?B?UWtFTFQ5dFJZSWNVZC9OdDVDdzl5Z3YrYXVreCtLRVI1U0dUa0RpbFlYK3NC?=
 =?utf-8?B?U1A0VmFpdnBhdElCcWlZSUpCUTV6NFlHYk90dnAzSUgzb2wzTnNtTE9GL3BE?=
 =?utf-8?B?MVRpdDUzTDZsQnI2cncxV014Rkl4V1F5Mm16MDZOMVJQd1BQd25WZXV2MnFi?=
 =?utf-8?B?YkUyTTlWL1RrRTM5SHRldnQ2OUFFTENvZytMYUFtSldGZEFXcXlmdmhFaHkx?=
 =?utf-8?B?d0hJckh1bHk4YzQrSjVoK21MbHRlbUl1VEN5RlZGeW9KWHJlNDJTVlR3Nkcv?=
 =?utf-8?B?K250dzRlSVc0YUt3VmlSVC94MFNFSXdiNU9kbzVhN2R3RXNreGdHc0M2KzVs?=
 =?utf-8?B?ZTJ2MEVxUnVYdXR0Z0NIazB4VkMzc01ydk9od25rWnFkenBRek15eTVzbVRx?=
 =?utf-8?B?QitaUlZYaGYyQ3ExTDFTWE5UTVZvUnVBVDhzRXFpQmN4QzdPYjhaNlROMDF5?=
 =?utf-8?B?bDUrR3k4ZW9Vd1VLMjJGV253OHRqZjAweUsrSG5ZV1lFYjd6UGRpaVduUkpE?=
 =?utf-8?B?Qi8xUzJySWNZWmh5SEFvOUtnNzE2bXVwWTk0VzgvOHdyT1BuSzdDVXFTVkxH?=
 =?utf-8?B?d21DODV4TXAyZWFRSmVYd1JKOGdiQzRHMlY0YWthSy9GZzB4c0FmcHdTc2Zv?=
 =?utf-8?B?dURhbnYrL01kSHZpR0EwQ3hwR1VOaTBZWFZnVE1kelJjWGVQRmFHbVJkdjJE?=
 =?utf-8?B?YjBVK3lDZDlrcE50VE1oeXNNNnptRzUyOERaZ1VwV0NrRFpPaUs1RzdsbXdw?=
 =?utf-8?B?MG5ZQVhmUkNVZTJSSFl3UnBMbHY3eUZwM0xUUS8rY1VPOVk4aE13OFBhN3NH?=
 =?utf-8?B?eHJFMHhXeDloYVlodnhqMHlMNzJvVWVMcHJVVks1d3hSODU3WlRpYzE1cG54?=
 =?utf-8?B?aldEK1lFOStKN0FDZlFYYTBBMzAwd0hCSFN5UmVVM0E0aS9odC9uY3N2b0Jy?=
 =?utf-8?B?TFcwWnBpeVFkZTI0YUtpQTNBVDdPR1hGa0VYV3pwWlB0R0lMRDNVaHpVZ0ZD?=
 =?utf-8?B?RStlZ0xVWFlqK2s1U3V4QlZRTUkvamhLeXVKU2NLdzJ3aWUxVGwzVGlkSGt5?=
 =?utf-8?B?b2VjWDhFTStEb0ZnRmhncExtRHVjUVd2VVlzYnpSeUtQYkVwZkpPeStlcm1R?=
 =?utf-8?B?VU5ISmIyVmtNTkhkN1pBd0h3VFFiSnJRenUrVVlWV0srR2c1UDJBUlp3NXR4?=
 =?utf-8?B?R0N0Qis0Vld1VnZYZWI4M01qMUc2bzBFOWtESUdHUUtMVVFZYjQybEMzajJW?=
 =?utf-8?B?TTVFbUx4QkxSS3BRTmoxT2FTWDdFdlBZZGhNclRHVmhjZGhDclNQeUs2Qm5D?=
 =?utf-8?B?aCtRNzBLbmt4UkJCSy90WUVXZkpWbE5nRnNuZmFVNnFzR0ZmSG8xVVhDNG5u?=
 =?utf-8?B?VHVLSjVnY3RsSmxpUFdnNjJ3SnJqRklsQUYxTHlwSFp3TUVuYUV4M0NGVlgw?=
 =?utf-8?B?WkJzQ1BqelhJQXdCZ2w1TkJZcDUwV29nYjIzTUZveTBaT2MrSWFEai9JWVRk?=
 =?utf-8?B?N1BUbEcwa3c5dkJwcTJjcnRZdXlWV3FqdGxVVnhodFVreHp2ZHh0dzZMUFgr?=
 =?utf-8?B?bXJVQzBhL3hueEVVenBlS1ZvWWpIZDBubkhKK294MmgvK2g2OEZXVHIzV2Q5?=
 =?utf-8?B?OTJKcUJreHBueXkvZ1daZlo1NTlDUFJlRzZCcDJJRUtqNmIzbWtRcDlxVEZD?=
 =?utf-8?B?NnNJSEgwNUU5RmM0MjBBQ1JCRHRYd1A2b05DYXhmUHFNNkJNT0Z6eFNRcXNF?=
 =?utf-8?B?VjR2eFZPN1JtVzU1VVZxYjJvQVQ5Z3I2S3daOElOWitsZmpmZ1lKVTFmREJV?=
 =?utf-8?B?MWFnMW55RnpiMDJhWU0yOG1Qd3B6S3VWaEJxK1RuMnc0RWtRWU9FYXVRMFVN?=
 =?utf-8?B?ZGRrU3hQekQ1NS9PTUc1cUlFYitTeUpKZFlNWGQxdVB6cG0weFplNVRsWHJD?=
 =?utf-8?Q?3roCptehR7n26yikaqqjkPg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9bbc42-789e-4c37-aa8a-08d9b8bc7975
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:29:48.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBj/S64UzSrpdUEPe8XVeFo0kWefFsVhI/YTm7FAIyJRR2lTeRmBvXk5Od25YkjMRnXuYSF4zPDp7bEYK/jHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

While going through their 5.15.3 log I did notice two changes, which made
me go check what else we might be missing. The series here is the result.
Linux has also updated zstd, but that includes a pretty large change which
I'm not ready to deal with right now. Them moving closer to the upstream
zstd sources is certainly a good thing, so I suppose sooner or later we
will want to follow them in doing so.

The only change in v2 is the re-adding of some previously dropped S-o-b
representing the original, documentable submission flow.

1: xz: add fall-through comments to a switch statement
2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
3: decompressors: fix spelling mistakes
4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
5: xz: fix spelling in comments
6: xz: move s->lzma.len = 0 initialization to lzma_reset()
7: xz: validate the value before assigning it to an enum variable

Jan


