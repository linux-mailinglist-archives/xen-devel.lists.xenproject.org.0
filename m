Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6772C38A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547092.854304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gBF-0003jr-TD; Mon, 12 Jun 2023 11:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547092.854304; Mon, 12 Jun 2023 11:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gBF-0003hv-Pn; Mon, 12 Jun 2023 11:57:53 +0000
Received: by outflank-mailman (input) for mailman id 547092;
 Mon, 12 Jun 2023 11:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8gBE-0003hn-7S
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:57:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b240754-0918-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:57:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 11:57:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:57:21 +0000
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
X-Inumbo-ID: 5b240754-0918-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cvj/Sbg2uiqfHE03+5W8//3LTb77i7VOtQRa49lMTLzbZb1Jb/m0ake75YmiclvTJmLzH89enw+sCg3ni0CuABkqpMyDHbCDZ98pkiwKkVL3MRsa9Rmnv+HRyv47p0fuQWvD83JXtbF1ucFeESFMA+k969fjB4GrhJ4V2AVIfH4wz2DgaZN4dSxuxNSdOQo6az/hloGKEdtCT7cVn/w2d6TRXNKvTYNyW2qEClbRbVrhArHDuIb9E7GMNsJeS/rcuz59vfnY2COyu5YvxZuMDWVlGWFY7PTQ97UlFEnED0wxX+vatIYyoxLPAr4+uD8dBGMwlBbSWKinJU9bKJvwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoAtAJgLAt5NBE72QOjF+TOsQViCS/hrUsnTgPw7ikc=;
 b=aWnO5lHiymUZ6LoSMFHS+niI14TqWaSObyfsMtZMXgj8KyLzFZEElxJXLnkTHo7jLx2LStWuU8hLg6/zChVA704HmVzn/akXHAs5ZzSm0AWJku0mz0F7wDZ7IACVOGP4n1aQ2x1EP4XgMXUzlPz31Ew6DWFYde11Hb71uPjT68yeKytj6dvVP1RdErPlxAkkMzYrwlXnYEvL0jy1H3O2qH4hQ2d6r09IaoHJ+kPAfhL+wm2TEiHohEuLBH1o9bISxyHXU5c8X+yVhhOSfp/vdKzqMc3uwS88JNiQy7LUTcY9Ki0R7XAoHs9Zm77FMcImTTSRws5i2ycwkitbNQ93hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoAtAJgLAt5NBE72QOjF+TOsQViCS/hrUsnTgPw7ikc=;
 b=Vc/kR6Amw4MeNJgQIxgbTeDc9jaP9ryAHEB4RxBxyqsxx1P0KYfjpKlUGwMK+dqSZo+eFMW54kauRQWIOYZX4bR2Wfq9AEgIQNrpEjFaCGJ5FO6OeQhBp8J5CyoNHklRIL4Z/aYzYmIO6FNULLpiaKElaB7zNJISkqnTOCM9rv+ibVde4Tryx1SAl7wHlmrCKnnav/iWi/8ggU3pq2Sijfryg6qt0nHZ+4sZpY+ye3p/MrT8u+/FssG/gTRMgrrhyUx3Z+5sUbLOZ8bZEmyI7gOWFU9A8Zmr4dvf14efXSNxFFlTForE1/iNm0fxMOPrzBHLc50E0BH2IMBW+vdt5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d7a304b-d41d-0ad6-7057-05978c52bc52@suse.com>
Date: Mon, 12 Jun 2023 13:57:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] tools: fix make rpmball
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230530111807.6521-1-olaf@aepfle.de>
 <6734a258-3396-4641-b9bf-edf6193a8095@perard>
 <20230612133545.1318ce98.olaf@aepfle.de>
 <8eb549c7-be3a-a41b-bee0-4cc6d39e7aa7@suse.com>
 <20230612135226.0190f2e3.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612135226.0190f2e3.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 36008500-6ffe-4c9a-8b95-08db6b3c2d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KdCcZH0zuWOFV9NF0xY0Eg1lAbloc9qOWWV5aN8geb+4ErnRgH7Qak2LUC6LwwjchiNbeHMd5+HEH463iu04PI9TjdfO9uVdwPAoHkeYmpJMfsKGuUs9FhsNsZ8RyVzaEWnqJivV5rkqx+TeFcBIO27RgaQ3uRW0WM9bKlvjQI9/RgBMbDICEzEqtLYX01VxHEOy/Y4gQJ1jcuKGEIlHL/KUXn89nCKQzWxxI9YAuhT26RqO3nRKCbWSbdQJwfVHBLiliWvBsbEdX/bdeW50HlWPaYFuXN+wGlkluebyriw+bjF1AtQ39EGqbhBfWCOkIzqEGXOydxhJww6vtTnfk5NBkp6dM3ehG0LhBm81X1rbtTWwK6vYDCf7WIW3bYGIV1YFUNHW+fqrEiQfZSEJmlx2pyxLndYUzaip39i7doSfkzkSORTa5UXA5hIZW0Rm19GnhjgoNzRyMHhs/skBX2WkdAunSOMyQZjA0pOQTWFPYop3wRX20oL/cyLLxoFZNukL5/qtnDyjXQG1ZYt8+m0uYVH5PTFFRbmjF1RBMfvTwsHa8iVj71EDfQbwme9YZews9mvEne+qBpkKE98MVWubfcdrxM/SrOwdUUmwiklRVAXgvU44U3pnMMJBNYoF/5Da2PyZ9zQFydmPWgPCkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(2906002)(31686004)(316002)(41300700001)(4744005)(8936002)(66476007)(66556008)(66946007)(6916009)(4326008)(478600001)(54906003)(5660300002)(36756003)(6506007)(8676002)(6486002)(186003)(53546011)(86362001)(31696002)(2616005)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFZUR1ZCWFdtSFMreXlpVlVDaW9aenkxc2xQc0ZERXNIcy9mcHZmRVdzQ2pq?=
 =?utf-8?B?MFZRQk0vWXZaVGt4eTg0NGczaXhUczNwYmtUVHh0RjQrSE9tVEFuMHlpNlc5?=
 =?utf-8?B?Sk9MNVJjdzgyZVZ1VlZaYUxxbHM4ZGU2VytmQUp4aWNJZEIweWV5cGVuNU8r?=
 =?utf-8?B?a0NzdWQzb0o4T3g0U0Q3L2VGdVQ0UjZBcURza0Q2TGRtdmZJTmlYNXo5bkwy?=
 =?utf-8?B?K3MzK3dCU1IwSmZaK1ZWTjgzODBzVWRNY0djMU1md21tU1d6SDRDNnpISWU3?=
 =?utf-8?B?V0Zjazh2RmV3K0NVbjc1NElKTEZWQVdLNVhuV2RaTUJWRHU5ZG5sdlVrUHha?=
 =?utf-8?B?NmVBOTNhZ1l4T2E4MDFwbHk3UXNyL3FPMlorS0Zlbkc0ZUJtbFlwSnNUTTVE?=
 =?utf-8?B?QkdUZisxT292TFduMnJWUzk1MWRnNTJQMWZDOUdwSjFyV1RLREM3STZXYk1Z?=
 =?utf-8?B?ckd3U3hTN0p3QzlIT1Q1ZFhSUXFTNnBPL1VEaGRHK0laeFZQMVBPQ3c2U1Vn?=
 =?utf-8?B?UUtseE9iVFlLYlhOeEtFWk54Z0I3WWNPdDI4dURGNi9XTmxuYS9SdzNwaEFQ?=
 =?utf-8?B?UzFmUGw5N1ptUFMrRXBvVllTVDdlQ29iR1piVjFIeDhRMkgzTTU4SjZNSkJN?=
 =?utf-8?B?clhDTTcreTFWekptaldTbHd6RVlmTUtZU0JjVVBxakkvQVg0V3NIWS83L0Yz?=
 =?utf-8?B?R0tBMzIrVzhkUW5ESFRhT0tycXNjVkNiaSsrVi9SaWlLVFZlMGZxcTFGTzFn?=
 =?utf-8?B?SE1zYlVKY2Y4OWVtNWY3RWtWbDRreHNSd2dLeE1iWnY5eXYxS0U5eFJhRVJk?=
 =?utf-8?B?L3R4eWpJYXRWQk5JZXhZWkx1WjV1Mk11NzBzdUFjNEZzVG50L25RMDFxOFM2?=
 =?utf-8?B?ZTlrMVNJS3dkRnRHS3o1dWg2UFFCbDlzSXpZWGFSbW9UZGg1VGVJVm5BQSta?=
 =?utf-8?B?MkprbDJUMUZDR0IxbFA2WnI0MzhjZTVaOVNqbmZvUUdmL0FKVVBvOEx0L09T?=
 =?utf-8?B?RHdpdEtXM1JJRW5mbytNUDZsZXgxMGsvdHBRMFh0UWpIcWJ1RkZhREE4MW1M?=
 =?utf-8?B?UExBR1ltY29pem15Z0NYS25JdDhTS2RkNjErYTYrZHhkMHF5R0M5eW1oVW50?=
 =?utf-8?B?VU5weE1JUE0vbDRkdzFBQVhqM1RQOHh4VWg3d1ZTa0VnN3RISHI1YStYaDlW?=
 =?utf-8?B?NWVGdUE3d2VwOHlNeUxldlVkZnA3cU9BVkNFcGRpRmE0ZG9IWnN4ajF1QXFK?=
 =?utf-8?B?cHJaUDFnSnEvZHZzeUVIMHJrUko3N3BuTXlYK2FLbDNVbXdWeUN0QjNTcHFz?=
 =?utf-8?B?RVRWMjlRSnA0YUplaFJKZGpGVFhEcWZYcWFzUWFKcmNkM3dJc1RRNkNseFlR?=
 =?utf-8?B?S3FIdW5oZDBRZEE2ZU1zZitRYmdHWVdjcjRqRXcvRDBnOG1kVDZQTnlIRjRt?=
 =?utf-8?B?VDlGa0JQK1Z4U0FjL0E0S1ZQbEJXQVNHWkJaaTF1V3J6aFIzQU50bDhWRGtO?=
 =?utf-8?B?QnJqSDBLeEdmV3lVRy9XNkJDOFJGQmJhandXRFdmbHZLVHZhRXVFYzFXcEQ1?=
 =?utf-8?B?RFZBd093cU9mNHp0bXc2eC9KV2JiVEFqdWE1MFZYVnRGZEVxMHdzZ2FzQlVT?=
 =?utf-8?B?QUN0WGg3Q1MxNXBqeml2RXEvYWpHQjloZ2pYeFcyVnN3UnBscS9kRU0ra1M0?=
 =?utf-8?B?SGVtclRGZmlYcnVySHJCdWNzbk03NFBSYnJQckFwUWF1UWQ1ZHh4bEVCRXlV?=
 =?utf-8?B?MUpaK0NVYWZJNkFkdHMvbk5SOG5iSkZrZzRMS2I0MTlOalB0UDRKdlJNRS9S?=
 =?utf-8?B?cDRFWHZ6N3g0ZjRUZmZibVZmMVVHKzgyalR1SWg5K2d0RU4yV0NmM3c0azR2?=
 =?utf-8?B?Z0xLQnJISnQzTHFlL08xM2h4bTg4dlJoWktkazk3YVo5YjNEdTYrbGxlcWY3?=
 =?utf-8?B?b0xvcTdIWmJrUzFMU0hZYy9ERWdkR0oxekZVbVh2ZWpSVXIxcVZqVnRzamFF?=
 =?utf-8?B?V1R6N2ljVENvZ2NVZ3VEQ2lxWWRKdFZiRkMyMEp4c3dqK0YvZ3FMMDNPNDhH?=
 =?utf-8?B?eHIyRWdLSzZzcCtGNVlLdVJNc1AyUTJDSjBvTDR4b0pINFVCcm1MYkJjR2s5?=
 =?utf-8?Q?98N93l+6kfeZJjrZqViSwGzn8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36008500-6ffe-4c9a-8b95-08db6b3c2d90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:57:21.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfryG9E+/wgkgjE4SkhhxBuOH8GOXHoYkkQQJd1JDYU8Kps/87TgcPgz6Y3F4s+ZQnmm0xz0Ev2KAfRy5+5t4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

On 12.06.2023 13:52, Olaf Hering wrote:
> Mon, 12 Jun 2023 13:44:34 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> On 12.06.2023 13:35, Olaf Hering wrote:
>>> I will send v2 without these two lines.  
>> I'd be fine dropping them while committing.
> 
> Another cosmetic change in such v2 would be the usage of | instead of @
> in the last sed call, for consistency with the other three earlier sed
> calls. I think it was a result of copy&paste from elsewhere.

I see. If you want that, then please indeed send a v2.

Jan

