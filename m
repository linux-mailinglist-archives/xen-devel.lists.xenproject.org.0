Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A5579346
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370363.602071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgjf-0002BY-EL; Tue, 19 Jul 2022 06:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370363.602071; Tue, 19 Jul 2022 06:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgjf-00028x-AW; Tue, 19 Jul 2022 06:29:35 +0000
Received: by outflank-mailman (input) for mailman id 370363;
 Tue, 19 Jul 2022 06:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgjd-00028r-7V
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:29:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25f3b478-072c-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:29:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2456.eurprd04.prod.outlook.com (2603:10a6:4:36::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:29:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:29:28 +0000
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
X-Inumbo-ID: 25f3b478-072c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLYE2nnClDEKKy+226xDbZoItBQoDZcs217M79bVpn10lPQ+CXSiXcwWa5J+0zS0MUus3qlEsm/55SjuM+Mhg/OWqsWB/hNQgh6TGDYz3W4sILCrm820U+N9+zUSEASUojow7GN9YX7/tYioCZtCvHEJzufMorXrBVkoslkA2z1J7imS0HF84gJYv9dKPIWntDBEHBlFKZmg9sM8W/aKad7zPwSWa00MvPu9vhq/J78AgUbl1HtwgHILXZWrb/UvM95jeIMEtKcGgyC1rJAdBiABhtFtTYKo4kodeO+xkBdtkosLsxeR2c3PbeGBLUcVgjCZ02xttMCIFKV+Dv5LJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwj3HuGbaptPzMUmpnWm3KcocECrbuLMfqjFe01mlyg=;
 b=Nnq4bbkvrFq9N6Chfj7IcxGysdHTCkGklv9ovA0QPEzi8OM8/VcQywZIABChtopQKAnIZw+Kbwt71BlKnfSMd8VJ1r3eG2fcCJ3Sgg19GQCe0adD9HLJe/07GSqhdyb8J1KzGLpDXlM9CWpeUlTDRvnNK6TivlFHhfrbphU35vJExl+8YioDCfuy9uA9krpNwmpGLK8LUrsBVN4+zoQ9xrbDr5FRVtV5fdThjuRuYb47nt4kWu0XqgEjWk2+rFF0xiuDWZFxrD7whZZTqmPh3gu02GwHjFhw3Mgdp4H9UDABbRAYeguznan/nIqbI7QK8PJbCz7bE0cxqzbmfBCXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jwj3HuGbaptPzMUmpnWm3KcocECrbuLMfqjFe01mlyg=;
 b=V+0wBYqS29JTPgcosiB6MjAckJbXkyyGVJY11HT523p7oEp9jIU5T0CatOisRv7ZRUdzh1n2W3xBc7MbVUlHLGKmz1Gg8lFoxcw3j4X5v0xOTQt2xZhM0ZlQ7JH976CZqHFV5JYeFXBrKFKGr/ZROMnLhH8PPL1wjMe7HJx0oDPgHams2FNDoD/XJZwY37xCKhIcGysoEiok5pv2ghc6Iabeacz5428++nPGy51F3H2B/P60/Yt6InsVTWsKpwv9D1YMCLTapYRNFOOnSIun82br4NQWZulo3UQu7j8fcy407cWkUEAw2fSMd0KK8HMBXnwzR3n6vGQtHpHvxG4cZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
Date: Tue, 19 Jul 2022 08:29:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b132e104-f7c2-48bc-8578-08da6950087a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	az9ASlZBw+BqQ+ODhtpxnvWPiomRUCtAxkzPBapZgsRzmRA7i9V/HeOwsGHjO5mxv7L+AKdbSA0zmcoiyRQdELPgEKkGyFxfv84lF9kH8WTyWn/L9uoWVeqaEECtAiPgSMt/KwicmgeqEvwVd16eoMCYf4TNJBYozKreEjIP7RFMq44jOjBdUl+wF/Ou3MODjqyoyFGsVV+7ztWrrfw3lYYSu6d4Sm02O6guDMQj7GxcWxebSM+DETgVmcEevkyHMyyHJ34rHpyJj5dEZ373bEzGnjp23D0ocdACFT/L88aUEo6p3fPkTId3+8Nki1ONFBmaWPPdT9ypKoQ+FvuS+a7H7WWqW/IEZUGvdvOr2g0Zz9FdKuARCCXMLyODLK6EteB8lJZEXDT+5R1THkGRrJZlMb8i9nEta1ek5jOkYXCijoQmTx8GQwpFlKbodofPE9HnCoMRLx5AY5EOqt7DGpS3/yRfGIPQG9j1y+VCil0e4YSM0+tUmKls5bzl975nSehmNqRS85O8s6ZK3cU+1N/+22lPIv2XoVroW5pa75WQsZUGg4CqzMC/ygOlLHzcvCn68WObV7G/HbU6NZ/h/DNK40bD7Yie6wsjH32ZolCZ228Ws2mZHP279GU6z6Zir2yPRTvzgFShX/wkuyO30AG4+aEh4ySH77b+lK1AuywGFSbLFwJ00sfgdREGj3yQ/oK5CMTcGR1FDdcWyxMw8UMiS+BinF3q2TwmGVwlphHNOsXycsN7YW0CIPfqi7f2PQ4m8k4n0A/UbI9IqrFSQgil4VSD9lHf27bV/V8LBVjAb250sFCMMU2frv3QQB/pQ3TNCWmPHyWNRvMDUD8IWLiCrvKcqvWpJ+XDlSA8kWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(39860400002)(396003)(83380400001)(316002)(478600001)(36756003)(966005)(53546011)(2616005)(41300700001)(6486002)(26005)(6512007)(186003)(38100700002)(31686004)(6916009)(66476007)(8676002)(8936002)(4326008)(66556008)(5660300002)(66946007)(2906002)(6506007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVTQ21meXNvUjNGQkJJckl6Zm9uRlpMZmtzeEEveVdWb1ErT21kWXIwSEtN?=
 =?utf-8?B?N0xFL2U5K2NwcjhLVkN2ejBmOWpTWC9XbGlmYkF2TlNxZVEvREhrMGpZbitt?=
 =?utf-8?B?UlFwVGduRjBiK0EyYmw3REZkazduemJsQ0tyNmFWaGQxS2JZZTFNRG9JZHhs?=
 =?utf-8?B?dnNaNVptSUo0UnpWUkYxOUhRbTFFdlRJUUpTdnRFQmlNYVhqYktlUkdJN0ts?=
 =?utf-8?B?cHNwY2ZZa2c0bFRpeE51aWZ1ZzRDSHZHcUNxVlFFWDFJeE9rajdJY3p3RVZn?=
 =?utf-8?B?L1hiV2hFWG1LY2h2YzlZTW5GUEN4cVBsMmh2MGRrTzBUZUVBQS9XMFlnaXBt?=
 =?utf-8?B?bWQwdldzMkZWNEUrQ0JSTE1GQ1AzYVNFcmJXOFVWVjhoYkhsSDRXVmRVRkxQ?=
 =?utf-8?B?dXRTSXRKL2xKSjNBUjdsNUQwQlhSQmZ3d1BNZEhOdU9lL1c0RlowZW1BaCtE?=
 =?utf-8?B?YUFoZC9wRi92UlRMNDJ4VkU4ejVRWmNpZFE0Z1U1M29vRitqdTJudms5WkRy?=
 =?utf-8?B?b1FKR0Z0bmdkQTZTcStIU0ZkM0thamgwd3RqZk8rTzdDc3hSNVdKN25WNDNJ?=
 =?utf-8?B?Mm5ha242Ylh6bkJFZkNGa0hBK1FSRi9hZkpCT2t2Q2FpUGdGUU5DamlBK0FX?=
 =?utf-8?B?VDIreDdwaDNrTjhrRW9kUW8yS2p2d284YjBoeEZFaGRqWkF6bktyNW82cWlQ?=
 =?utf-8?B?ejk1Rjl2M2UzR016KzRqODdjL0ptMlg1MVZaTitTMUdrYVhna1NkbTFZWkd1?=
 =?utf-8?B?ZXo4WVhUeEdHcTFKdkZXeVpxNC9LdFhsRUt0QUR4dVYvMS9PZXlRK1JPS3hN?=
 =?utf-8?B?UDYyZUQybmtYb25VZmxRZ3VDc3IrUDQxRk5OeFc1b2I1V2tvdHdSMmNZNExh?=
 =?utf-8?B?RmNNNXBHeW9IMDV3aGRvNTg1UVltZHdIb2xUVVhTV0JGVzFHUDhHZGpId1l1?=
 =?utf-8?B?RjQySUJuNUgwUlhuakhPeXlTVm1vL2tRd1NNR2RGOHp0Q0dqbDdPNi9wMWJn?=
 =?utf-8?B?azh2TDJsbGtlQWczSVYwWHZLL21jNnFWSk1TQjM4SEpqQWhLV2wwWkI3dnkx?=
 =?utf-8?B?ZmxLUFMzRlUrdXJvRUE1NHR5NHpnTVZ1OVVYblpiT05TbXhJczlkQUdxZzVy?=
 =?utf-8?B?d2NLQlBYa3p4aE1lU3RCYUw5Q2xnTnNIUDR0ektvWVhvZ1RLa2gxUHZPcjEr?=
 =?utf-8?B?emVLVE1TUjVSTElwMU5aZG9raEN1VXd2dnorMDVOcGJhZ3VlZGhGQ3h1bStm?=
 =?utf-8?B?UnRIczhVSlRkYW5MZmRoMTVBQmlaZzZOQnd3VkpWcjBKanpqWVpsNWZNQmtp?=
 =?utf-8?B?MzlQcmtLL2U4OExmbmlsRC9CNmdkSlF0eFMzbzRGbHZyV2JnSGplb2h6WlNQ?=
 =?utf-8?B?YU15SndvdlJQUTdFSVd0a2p5OGJpaU5wNGdMdDdyTGFmUFFQSlpOQ3FsaE43?=
 =?utf-8?B?Vms2T1JFTlJHSTgzMmdnTEFaZnBBL3NwOHUvYnViTVcyY3BVRTJIbzNpanA4?=
 =?utf-8?B?R3ZGTzlWUDR0VnV5Sng2R1VaNU1jS052Sk8yUzVBYllnUVdEWXpUdHg1ejk3?=
 =?utf-8?B?TFpXbjFOd3hSeW53Skw2Q0JiWGs4MFRyeW1iaXRtbEt3NVpyYlBIcUtTcjZ0?=
 =?utf-8?B?TTZYbTIrYjdad3RUV292U0U5MkxTblk2Wkk5Z2FzUHQwWnNnbWJjOEhoS0xi?=
 =?utf-8?B?aEZFOFNCWkRjdWd6NVpVcVB6OVdEQkcwcGRqT3N0SG9MTy96aXVUTC9rZ2tE?=
 =?utf-8?B?WkFqR2dPZGdBR1J5MEtiM2dZZ0RBZ1pJZXVsZHY4Q2FQRElEWWEydm93blJM?=
 =?utf-8?B?b0QwQ09KaE9QakpEcnVXNmcyWGtQR3FqRHhIWVVYNHd2UnRJN3BTcmZKeEcy?=
 =?utf-8?B?NzJQejJhVS8raVdnbitHZmtRQWNtY2ZxNnlpdzl0djhKajlCZXZ1RGZqYm0x?=
 =?utf-8?B?ZGVwVURmb0hjMWFiVHNlSnJVWGIrSEpXbXlZQzluY3ROZjBhZ0xTTnk1TFVX?=
 =?utf-8?B?SlZrNFllemJndUh4WG1Ya2xPOEM0YnhUeGtGTkF2NDJxQzZrVjJyWURsMEsy?=
 =?utf-8?B?Y1RlbHdQeFR5TlMzMzh4TzJQT2JSL1NqVzN1SHhYY0R3RVhZaUhQMi9LeEdY?=
 =?utf-8?Q?3SzmHSGLMzg3QvLMKDJhy7/2s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b132e104-f7c2-48bc-8578-08da6950087a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:29:28.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkSXLqWEnnLlu4oAdCP8D9R07IUyj+SC+A1P/gmiV7Dcd9GUHYadCzlI2M5rE7aflPQELHwRADOtx+bhTEnRpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2456

On 19.07.2022 01:04, Dylanger Daly wrote:
> I'm having issues getting QubesOS running on my Lenovo Yoga Slim 7 ProX (AMD Ryzen 6800HS)
> 
> Firstly in order to boot the device at all, I'm required to add `dom0_max_vcpus=1 dom0_vcpus_pin` to dom0's CMDLINE, this is similar to what I had to do previously - https://xen.markmail.org/search/?q=Ryzen#query:Ryzen+page:1+mid:f3hel4yj25qilabv+state:results with the Ryzen 4000 series, however without these options added dom0 never fully boots into Fedora.
> 
> The other interesting issue I'm having is upon booting any VM, just a normal simple VM without any PCI devices attached, it'll successfully start, about 1 second will pass then the entire device will hang and reset, it's virtually impossible to get any logs at all out of the device when it's in this state.
> 
> FYI: QubesOS uses Xen 4.14

I guess you understand that with no logs or anything else technical
there's very little chance anyone is going to be able to do anything
about this, without having access to an affected system?

Jan

