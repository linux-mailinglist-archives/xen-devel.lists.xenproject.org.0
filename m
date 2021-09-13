Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACF4084CF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185433.334083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfcm-0008AE-B5; Mon, 13 Sep 2021 06:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185433.334083; Mon, 13 Sep 2021 06:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfcm-00087w-7l; Mon, 13 Sep 2021 06:39:28 +0000
Received: by outflank-mailman (input) for mailman id 185433;
 Mon, 13 Sep 2021 06:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPfck-00087n-G7
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:39:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07cef170-282f-458d-9049-8c3df5539f5d;
 Mon, 13 Sep 2021 06:39:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-KKygg5OBP16PqWmfh_x4bw-1; Mon, 13 Sep 2021 08:39:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 06:39:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:39:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Mon, 13 Sep 2021 06:39:20 +0000
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
X-Inumbo-ID: 07cef170-282f-458d-9049-8c3df5539f5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631515164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hZV80eLlnUbQz40OrBm/kaIbk08Pq01QuLeBX7Og0zQ=;
	b=JQt/T+zqOM++aIrCgGPXlD26O4puli3l7o12k+dplGGlpV6rWiRca350YRyPNawmxsiwvt
	4hdm+5PLJjLdDijLPMKb+IE9f74xg+PqYpylwMwheWbzWip1cQ3kIqTSUiKzBxbLoigpbs
	VFiSFtPWD+zdlVhkuIPwXAtcNneRUZI=
X-MC-Unique: KKygg5OBP16PqWmfh_x4bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPNt8yHXVBq4HbSLRFk1oeJ9j4UmkOPB3uWxeUcXdhdb2wPG3KH+hgCXNP11hItbnOf1FncMEZN3zS3rJ80iQ4aR+YnGXYQ+odBfdbCZfdEEg9hndlGXdoyYTL8qmkjLGC5jut/QWAN91FtuxuzAgsqg5rtCbXMlU/ryevOZJaaKHqDFL53LAEWJWKXguuP075BCM39cN2KrhvB7HpSCoCNwARo7OxdkzKs3m8MThEtPhGLmsZL6naS/pbWNzgTm+hXzTd9TEYNczuHjwn18q2kiIjaAhgbwiGALqF2amu997Na+hjBoQM29GwfCz97BUYXsTQn4wEqEQAm/c99k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hZV80eLlnUbQz40OrBm/kaIbk08Pq01QuLeBX7Og0zQ=;
 b=BxpfFzibcKn/wpVzzBdNF4JJiPQjMn1oORWoBW5GfIGJeSS+qjK81eqxac6+M6arBTT1mFDbc72sPfug+0oDuxXRv7yzaGId0PLnsWaRI0fLOT607FNlqpPL76KbkskwrKPxDga+OiTIQjT2bpqrUpujipVmubEfeDpfx2rp83XTaYIN0BamoU/b1HZgqHCqa1z+GPBUqGWCLm14v522FhK5nzz+Joz2Tood5xTxekjl8ddCvg2TLPXvxE3azNZ7dXivLtVZyYrtWH+ocEapCLDkfaKXnKUDGXttkjTfLvyYYXxg6kO9DBuA+eRURjebpnouLJaSXCOcLRu+rGdfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] grant table and add-to-physmap adjustments on top of XSAs
 379 and 384
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Date: Mon, 13 Sep 2021 08:39:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0678c548-5aa7-4b58-5b8b-08d9768137db
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71520E576A677BE8D56F0F6CB3D99@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EehZm2qFwAwNF5qZYKjJmGFID65/sona8eM6CTeMwXnPXabbfgCjj5hM8GV6VzaZFUhxH7G2g+S+lXEqE7MwxqY7QHOyeQCh6GiJ13UgIDAh48GME+8AxX/bMPL4jQNtd5aqPey/c2ZoHRUWTieb/PoPamYwB3va9sPQCn4Z/6XF+3lDFSFys+7YPONiD5FV4xkVu8MIxoWmWUGRJa6rtdOSLlcIMPSuNyckvPhevj0zJ8QiopqsdwdVaNrL1qAKclkrktTZ7Ivjdd6DlabOvtgN86D5AqKGxLrOP2XCRnH7yTZ6OKxoIGjaq939p9Q4AoKh4C6Yd1MdYHaXd0Km9N4Er0yc8N5xnENwm5qjs8D3Ku3XCUZ+Ton5S27pX4chMNPdLQBPNk7ynCWxxeZ+oS3kPNLNtMOs7gUIIzaQqysy+QOjWxTvSLW5CX+Ch4++rF/peHMdNyOmX0dZKKHYW4fmU1/SQbNuvNslg5kLxna5rR+mpVJhN9Ty0OorEZXBrQw4fhLZXlHnEi/7dMWGb217aJPT1ZqbF6yM9FPI9gmaooUm4Utv2jU8zN+LaS32Rm1l6URQTZgOR2FlSeA+/b/hVQ9mP1A97Yd5nGnsbmMss0U3nAb2DlVsJcqTciOUR2wuSO1w8lSkkt31vNMsb9nb2WULv/oMm2LXfpq3ieRlIyIJ6fc0yQgwyZbIMbdxSogvCP6vBA2S7LSJThdw4K5xGbmukMJnjS683b3LK8z3BP0q7id77FCG3V/w4zaI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(39860400002)(136003)(346002)(2906002)(66556008)(36756003)(66476007)(38100700002)(8936002)(31686004)(478600001)(86362001)(66946007)(316002)(6486002)(26005)(5660300002)(16576012)(4326008)(186003)(31696002)(956004)(54906003)(8676002)(2616005)(4744005)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEc2WFpkazV5ZVI1NTkrWVJ6bnI1cmJWZlpyY2M0anBJUjBXbC9vSlM4OEd4?=
 =?utf-8?B?RFRkSVBCdS9BSTJndTlMV1h1NzlnTW13QlU4eU1iVGptQVVjY3hXUDFTbXdZ?=
 =?utf-8?B?cXhiZ2kvRDd4Z1RxMUFadERaenRzNHRham93RXJieGRRRHBPRlltQkVDb2th?=
 =?utf-8?B?cEl0Ykc1TS9abnM4NUUwSjBSMHBhNU5KR2N3dXcybmdxVGVwSUZpNDJyMHk4?=
 =?utf-8?B?UFVoQVlRVENtNUpOeXdKMGtvN1BmdnFCdnAxZGlkcHZLcmRmMTRiOXo4NFZH?=
 =?utf-8?B?WkNRRFpiaG14Q2tUbHVBS0pNeUdPbHNjRXJ1a2VTbXlydmhGMmNnNzFNVmhi?=
 =?utf-8?B?RFdndnhCYkJHM0FCbkRUL3ByNDZ6UERpenZtd2NndmIzdVhuRWJNT0hsRGth?=
 =?utf-8?B?YjlKYXVJNXRJaXRqZVlzd0pkVlhCdmxlR1dDRHJYc0VydktiRit1UHRCME1I?=
 =?utf-8?B?ZCtWYm01T1R3WHV3WE9RMjlZTmJESlZ0UDB3dC9HaFl0dVZxeklYZzBNVGg5?=
 =?utf-8?B?YVk0QlBWRWRkaTdveUhNc01iei9wL1pIWWV5dzlaTmR3YVRDTjVYQjFqSVhT?=
 =?utf-8?B?dy9Xcy81ZkdWdXNKSURvNHl6aERGM3NZZGJWTC9lTmIwUDQ3REI4OUw0Yy9U?=
 =?utf-8?B?LzRXbms2YWtJU2NWSExMdk9FMmkzVzNoMXIxSkpDdksxKy9FUTN1NmQxNDdE?=
 =?utf-8?B?K2ZqbGQ1YkxIeFVUbEh0cVR5L0hJaTFYQUo1Tk9wdmUwNk1VVm1kK0tLS01z?=
 =?utf-8?B?dmFiK3VxQUhzRDI3NmdWZjZzZS91azFWUnBTUU8vTFZ4UFo3T002a1RNYTRQ?=
 =?utf-8?B?a3BDSHE5Um1uTnJGUEZMai9yQTNtNjUyQVVYbU9sdElKOS9mSmpZS3VURm9H?=
 =?utf-8?B?aml4RHRQYTBjZEFIaXMrc29lK1UybHRoQ2pwZGF0eW81VGpyNFdpYjJXZU5D?=
 =?utf-8?B?VmgrRzR0WnBwdUIzY2VndnlBZlVKVmQzbkprckl6aXMvNkI0RTlhaWlGa0VN?=
 =?utf-8?B?SW5ZVUlzNE04dVkzWEp0NXhWSFdiMVdMU21KeUJ1bE9xTjljZmZwZ1IwZ1Va?=
 =?utf-8?B?endVWENSc2JPclpwSFF0cjVWRlVWUVhSQXl5YTRZVW03Y0lmRVJKUlZSUng5?=
 =?utf-8?B?VTJnK3lNN1lPMVBLeXR3WHVzVHVkN1VmV3IwWUJIalBONG9Ta2hyOHF2bW9I?=
 =?utf-8?B?enN2QnNIL1JyK1Mrb1VyVDNWWnRFMnArcmJTdDh5YjBpaWxhQzRLNWRHVFUr?=
 =?utf-8?B?c3dwa1ZnSDFjYTlMbWxIM3J6bjNqNlkyOWsrQm9PdnNBdHNZc0NyVDhQSk5t?=
 =?utf-8?B?cHRQaG9QUTFGUmNYSDkva0JYKzdKZ0d0cHNuSTRJWVVlUGRoV3JBTlN3U2k0?=
 =?utf-8?B?Rmw3VEVVSS9NbUN6dUxueEwyamVKSTNtaXlUeGRoL2dhV0hqenkvMEpDSzRD?=
 =?utf-8?B?ZzRMb05UVGhUdlZFTzNYWFU3RXYxODB5REUvcjlwZzA3dmN3SitwNXYvcDlt?=
 =?utf-8?B?TEVaZm1DeUpXNVEvYjJ6Mys2dXdNNDRWUGd1T05aSXdQWnR1UVpCMDNzSWtl?=
 =?utf-8?B?d0c3N2NBa0NQUHEzeVltMjhWQklzWmRqZWtIaENMb0NxbGF5blllTjUxeTNy?=
 =?utf-8?B?OVNXbzRPdWhPRkEwNW1Na0J5c1h3R0xINkhKYUlLSS9KbmlEN3d0ZkFzVWl0?=
 =?utf-8?B?RG1YMEQ4dWxmSWRzY1k2MkJHZzkrNVJWS3RpbzVrUW05eFpoZXErMTFaL2g4?=
 =?utf-8?Q?7QbiIgtoP3Cx3o2ncueeH3EmyulWB0fVSRyHzZa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0678c548-5aa7-4b58-5b8b-08d9768137db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:39:21.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEum/1StdDkmAicup/fXUlWXVOHCDuDHUB27ohlEhkFJD0sDkBAyU5GZDUkmsbghRpE4aQvMBlPSFXZ0u+DIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

I'm prepared for the "how" aspect of the 1st patch here to end up
controversial. Since the observed quirk will imo want dealing with,
I'd appreciate any objection to the proposed change to be accompanied
by an alternative suggestion. An intention of mine was to not further
increase the number of arch hooks needed. I further realize that this
change conflicts with Oleksandr's "xen/gnttab: Store frame GFN in
struct page_info on Arm", at the very least contextually.

1: gnttab: remove guest_physmap_remove_page() call from gnttab_map_frame()
2: memory: XENMEM_add_to_physmap (almost) wrapping checks

Jan


