Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DD64DE8B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 17:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463585.721800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5r1h-0006nj-Re; Thu, 15 Dec 2022 16:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463585.721800; Thu, 15 Dec 2022 16:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5r1h-0006l9-Ok; Thu, 15 Dec 2022 16:24:05 +0000
Received: by outflank-mailman (input) for mailman id 463585;
 Thu, 15 Dec 2022 16:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5r1g-0006l3-KT
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 16:24:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e0e449-7c94-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 17:24:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Thu, 15 Dec
 2022 16:24:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 16:24:02 +0000
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
X-Inumbo-ID: e3e0e449-7c94-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ai8aAEOFnZWd3EMkL5cBvikFybM7Y1j8ze5gtIF+MsKUMpcJ9yvc/MHofltRtoMvmviSZ1Kq8OYiZvJ7Cl4c9Y9DjNjbvMxY2+aIu859hc1ssMI+EwdFMke2/k6Il6MG/IYJMX/JBDH26zeGny8UOTQe5ytgB5jUeSh3uK/ne/0L5tYgiWiJux7+zjnjprnhz4rnTAv4VoO/Ts59AQfwXFNQakueLIYukIN6QcVcHnALY+ESnLFSCUsYjSB/2oYdg3FcXhl+aRLvR5tpyf44WDXT8xE4jq8xOZrhgg4IzS4tccMkyvBD0HGiVKFESF0slEW/kjcBtag3eLFu9VvLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aat3C6wNkLG25RX9rHUBU24tPQrGUHp182EBatY+ys=;
 b=YLxh/RS+wbifbPhcQ4K0mKb9FJEsq5An4gJ3l42Xc9WvxaMT4w5SF+EPr2ZpncX2bF196UHkydHFEWjgWDsqwus0GtEF8KhOZ7ramo/BWaUS4G+D6XvF6u3e3i1y5jxXLXyV1BBuH+xmSZ9mJ9t8YACWgNOqPhaYDbdbzQRL5IEmZAwbohv78rROv3Fp09SZIlb4uRH/jvjwKJwbvtzQmmIHFZWw1vhs4IbMEZJHpXbAiF4uSM8+DlM5pRUbyPolIyCelvrJbzi+emDmvhH5Qs5tRRfuJk9FnS1GAlv22q6svfE5P2k6Mxsv0wMDIdRg6qrtZVaG4v+p3px5j9FoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aat3C6wNkLG25RX9rHUBU24tPQrGUHp182EBatY+ys=;
 b=tO/jAeX/DKe7XOdnn5Z9IlL9C6tKkYU0M/L9PSR0ZNSeyW9FSkQPF1Fm+eF3XUK1lkBiLsWZkYMguaahh73bOsCkNvJ2ZiJ1Kt8tDK5RUTfIOvUTc3lUn6WnpFCgtMgGhK4x2/4bn/pBAGRB/u9i90oGSVfqKuJ5UOTMaDZTFRkfUChf/057pzA+YZWaCaLcrZuBDFJ0rx440bOkA7r46fBGATtl23qpCa8QKIFIoXmsDleihiFbuDvN5rM8GHSAlkonq6aS0SikK6xMkdOSjv2LYvuhPfLVsXDoTqSNH5JOUXWUL4qSnH3V7eStDzG5MGn2xT7k8Zp0NB8/o/KtoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59a0c496-a8cd-b6f2-d10c-e8bd01fe511d@suse.com>
Date: Thu, 15 Dec 2022 17:24:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 08/12] x86: Remove MEMORY_NUM_TYPES and
 NO_HARDCODE_MEM_TYPE
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <1de1a7456e4501bc67faa8ee17af76ca1688781e.1671057808.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1de1a7456e4501bc67faa8ee17af76ca1688781e.1671057808.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: d596ce72-ee7d-4e7f-e239-08dadeb8c73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2eFyjT0o03Gt5QeXSr9MaiL+xc/Rcg345rOYr7v/HL95e4Pp5hOt4NLUXLdziM5nsHAkxtw4Cf0b6+YPsjrL3PUTZud3/+kWk9V30+wMrv7hNkBMJMLid0ZBDu/ID43CXDgjnzvmRt5w+TYRx5BntrZXQuGExPI68zod1rIIAXZ98j6FZ8SGuIIvIor+ucQ7tndqzjRtKVXXWvMgPcEDFJMKbNBdgcmUsGvkT5SQB16FvnI24DcRxXQNjycAWzRR85hEJvnhhCHdZdWhzJgYwXuNdiDGsoB04Ugp28nslKrRgjqcP7XzrWlv3vR7qykXIWz0pBFa7jx67Z13DxrRELOwx/KMp9ow/sErJXG3ppwoLvbn87uC64c6BOQOcTUCIj6aKgHfgDgND/ir+kQ98gdubaXjaBWcxG3BAFdJzoHppRDZIFvt6ZZfu8AGK+Yj30O6Kx3fzyly/fLtW3VCiU7Hg/LebLQTTzvY5wpUz9Y6mNgCcwmQu2DWKzei/Xm3R1gy/m/D/hQHBY9RkvNdX3cSSFG9AkKQMhFPhxyLpvHvOJFf/F+Cnh4dVmoH3Me5tq3OUo2pC15j9Bzy3SzEQk4swceKLtB0xJiBl5WYKhBwWpuPeY3ni3G9ZVShi1s9juZn1nUfa1WmX+ZsellKOBpwxugFycPFLdxkvMjWPFpYpvsLpSlkqYP8eDqLxU8fr9vzBB5xBLPqmmCMxhdkpkPvqgBeCeJnV2u7rscPQhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(6916009)(4326008)(38100700002)(7416002)(41300700001)(8676002)(5660300002)(316002)(66556008)(31696002)(36756003)(8936002)(26005)(66946007)(54906003)(86362001)(6512007)(53546011)(6506007)(2906002)(2616005)(186003)(558084003)(6486002)(478600001)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBSSkVGUGxHbHdlL2lDdVVhMEFDU3ZUeS9oTHJiaHVwSURRb1UxZUhabGNO?=
 =?utf-8?B?b2NLdU9ZaVhGSEZvUGowdEUzWlhWQklHU2pJMzgrWDBGcFUwTDRKYU1FWDV1?=
 =?utf-8?B?a0lOTW1zYlhZK0Rlc0ZPaEMxYkp3WTlaVmVZQkdyMkdsQ2J0ZWFPc2sweUpV?=
 =?utf-8?B?TjdvMnB1dnd2YWNFeVVocWNGL3NWNjNTcVNvQ0w1RGY2ZVdxV1M2d1hvOGJO?=
 =?utf-8?B?MHgxMjMrK0hmaEs0aUxpYndYZnBlNyt5N2MyQVVFS05ZUCtpTTZsWG5VOEtJ?=
 =?utf-8?B?bTVaTUNzRndQWG5ubjVkMlE5MHZLTFh6bldIdWtHaGFSSFdxNDVYbGdLUndn?=
 =?utf-8?B?TzlTYUExdU5GeFpxbDhUUjRaOGxNL0svejNhbGliMVlMS0FOZ0VQUWxOUUEx?=
 =?utf-8?B?MFU0ek9pNTAyU3pxYlVVVDkwdFoxQkZPQUdiZEMwejZEKzQyKzlJZlZCZ3VQ?=
 =?utf-8?B?RmFKQzhDNmZzMzBkcXNXMytCaU1DcE5PcmlDZ3RkYk4vN3E3VGhEWEN5aThE?=
 =?utf-8?B?TmEzMG9Rd1BIaU1hTS81VG04c1RRck8yMmFvdzVheFVPaVNPOFF5cHpycjhx?=
 =?utf-8?B?eENLK1ZLUFpBUmhuN3BaKzBrbTBETEY2bXJ2Z2JNdGZRbUdYY0VSSWVMUTZE?=
 =?utf-8?B?cm9BT21GUjJhdXQrVDJzYUV4OHZubU90a2p0ZmdtQmNTd3E3Yjl0SktyTnla?=
 =?utf-8?B?Ny81V1hnZUI5a0h1S1JZNm1KU1BmWGk0OVJlczYzNTRIKzk4NlFyYmRBMVdr?=
 =?utf-8?B?d3hPa3QzRDRIVHJoTXp0Z21TNDN0NzBRem9sZGJ0Q0FPamFVUGR4cktTVi9U?=
 =?utf-8?B?bDJsMWRjajk2UVQwa3N2NGp3RWx4ekdSZkYxY3p3ZExQbVdhMDNzNGplSFJP?=
 =?utf-8?B?QUhGWWRYR2p1RlllSTVQS0RCRGR2dW5XMytlbHlaeGtFZ3AyZUt4RENlRnVE?=
 =?utf-8?B?am5rQ3l6RlIxYkxWaFNqV3p0NFBadnlVbjVkL3l4ZWd3cldheFNjaXpNczlv?=
 =?utf-8?B?YXh3ZFJyN01BbE9lb2FrMUVGekhKYWovZ0dtYnZab1BkR3h4VmN6NWdwVERh?=
 =?utf-8?B?c1hvR2hBRTVyTjdiZXNkWDJ6MWsrdE5LelhPbFJWa1hYdjFzbHRTYzBnUjZo?=
 =?utf-8?B?amd1MjhrYVU2S014cWJTZWVvMnBwNGFqODNVc0lDdENYcGdTUDRUckVJb2ZH?=
 =?utf-8?B?RWdzc0cxcXJvRGxGcHhjYkJTeWdOSUNVVlVCUXVLTTFuWmhTOWtFUVV1OFlM?=
 =?utf-8?B?eGdaQ3hSQlRsZWVnQW05aDdISEluTHRBem9SSitXN0RHQW9YUTBVZEMzZ3JO?=
 =?utf-8?B?SE5JM29pMFdqdTdTMjVLTm05Mml0ZHFCeDUzbG5DRnpZV1Yzc0prWHdEWk5C?=
 =?utf-8?B?bmNPT0dReVlTbkVOam1oNFZ3bHBHVkkybnU1RlhGWE9rYllSMDZsTFdwSlB3?=
 =?utf-8?B?eVJudFRtVDNySTFxWkZoU1RtY0VlaWlLQ3JJOG90K1crLytjSnNtSHZxVm9L?=
 =?utf-8?B?TGVuY1JtRXdmVHZyOW13SXRkSGhoN05PQXNhSyszWmlZb3NEZndKNmxVWmpm?=
 =?utf-8?B?YjdJK09LS0NMZEk2ZWFyc1NwSUJBN3FRV2x4ZFdmVGgycU5pUk5Fdi9ndk1D?=
 =?utf-8?B?b3p6UzFYYzhYWmhIWHRmOWZQSzBjd0JuU0pnWDREakFLenFyZFowSldoZU92?=
 =?utf-8?B?RkJEeFlKQ2cvbVh0THl0N3dmeW55NXU1ZGh1MktTcE5lN3pHOWI4Y2ZUS1pr?=
 =?utf-8?B?L25FdFFBTERRZy9UREl2Zm1NNzczc3dlSWdBVlJ6QjEwWEVKdWZHRXlNaFA3?=
 =?utf-8?B?UkV6VTE1Ump2alE4UGd6bVI2QllhSDZpc00rOHNIWXljdm4xczBiU2VqQ0hW?=
 =?utf-8?B?L2hwRnA5Y0pNZGlyUzBxczhRWnZ5SExmbW55c2pyZk01VzNlSFUwc2FLZmM3?=
 =?utf-8?B?Z0tVbUpwMEM0L1UyNEJnOHpxblhCb0xGU3FOUGY5cU5rSEdvQWN2TjhNSG02?=
 =?utf-8?B?NitXUFZrMkJ1NzRQcDVRTkhVc3ZacDc0aUFwSHR0YmJEcWpTRGN4dlFBNjI5?=
 =?utf-8?B?SXlGUHk5bnE2MGttSGN0WjF1bytFU2VrdXd4a2NjU0pOeVhFRlRkUHIwRFda?=
 =?utf-8?Q?Yi3CS7PJ9XDgRZCacT//Omj9S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d596ce72-ee7d-4e7f-e239-08dadeb8c73a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 16:24:02.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/B56IRuWhKRy+2eSz13pis/tuFN42JMa/2l45+SJljLV/X2rGh0fFfwEnFAfGuMz7zdhduyBXQPXF/L7eiU6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8644

On 15.12.2022 00:11, Demi Marie Obenour wrote:
> No functional change intended.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

I'm not convinced removing this (visual) distinction is a good idea.
I'd like to wait for other maontainers' views here.

Jan

