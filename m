Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4D5B9CA1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407409.649924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpZJ-0007Gt-QT; Thu, 15 Sep 2022 14:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407409.649924; Thu, 15 Sep 2022 14:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpZJ-0007Dm-N0; Thu, 15 Sep 2022 14:10:17 +0000
Received: by outflank-mailman (input) for mailman id 407409;
 Thu, 15 Sep 2022 14:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYpZH-0007Dg-WB
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:10:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e61a42a-3500-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:10:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 14:10:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 14:10:12 +0000
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
X-Inumbo-ID: 1e61a42a-3500-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsPGZx9x75mhVYbsUi92mu6zoX3I7NZkVwlyuWuK0JecVxkXKk/KkpZkGah5nTEV1lEJ9KLiC6bYX7k2kLLibsrPLCVgbZckEtoLBg3HyoE5rY+IXb8J4AAS607RkwbCvjW+zyKXY35tpGL3Ry+orw2m/OiaTOf8pkmCrt7QklBrVpcYVvAWs6ConAqyS0qwcTGhP0w15Tgr8/gG3K+KjcNoZDlWLEO27+w/K+jsA6GNloH/k0cyvPHPSOM5huzCbtq7SE06bx4X/DQuzGyvVYCxu7qtmH6roTkGRccqyvRCoFplzAzD+X1FrDthzJY0B3eVA3SsgEgcBswVC0qaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjA1wDACamPBIavzDa3U2kJc3Ji464I5quEEqDqAaX0=;
 b=Gh4mBA/B4GP9pv1iPbyh2LylV8sgUpi6OS3/pD0xo+tMd1CxsfrN3NG9Nw3u4k31noWoeEdw5+o01eKf6DqaUly2gSczkED6blSmWdgIoW94Pq+STVD33hbOl+uRR7jaUc3moogoZhQHV0RInIHDwvvLwxHy++dJa0j00V70TDW0roSGMS7SEmHKCY+hxCdO2C9WFD+g6FUdL4jKFqzcZFMf5PBD1nXHJLTBTr5Xl/KUJmT3MfvBN4LzcSrdxN8tCRss1BbobMsIGuLJ7hEqwV0Fy7G6IiTqi+xncQ7r8/zN/TaNekfpQljLziO1ugWgdhEwwUOQR1UKGlOUYpJ+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjA1wDACamPBIavzDa3U2kJc3Ji464I5quEEqDqAaX0=;
 b=0Q/n6yeDRQWYVpkCXV59f6n+yVdhRCFjNhl3NPCXk2mSNvvk0NxW2z7Dhdv2p0V9xMRbiH73vplArHujCuutxpHs6uqe3Aq6zTW/G2NyPKId6gGjf3fbktMkWvrHnvvinZTj4HCxSpFuj0O9z/wvLRUyP2NrvNcXcT/insWJSRVYZtNiJwSifYPK8UP4v1igYg/28zR0uYKgK5HTDccnvtP/923sgjM0gP1ckl8q46d+WUCNq5zpuvPO4sZ7/TctCS/LfA5NG7MzykJtjTm82IE4iBDJLt1yeBPGC/ikXejI4CIpIZ2ylMKUP4016Y5xBYSwH04zKqbwgwAXblTKQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
Date: Thu, 15 Sep 2022 16:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Console output stops on dbgp=xhci
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f8e68b-d2d8-4e85-eaaf-08da9724014a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cEtqiXb4/R2Aikf490l/5gN0yJ9G1JgFSi9eigDVzicON/cCWC6k+q2d+oy+0TbvhQ+KvShLw7Lum+1C37CPlmdvKh46RteUnFE2CfYQZM3GmsOxLhFR4RI0Y8pgVe/lCsQRTXR5WhVJOlXPvuqUIaSS69MA1eyMsfnCI0fD/wfkMdXgCjJSEvPoNLdhzrPq8xGyIEXbVN8ivK0r1oW5jW1ZAR16UsJZPe4JlvOKKWbT4mpMyh3eXGvQ+Ibw/IyNfngKecLwIjjs+EAlEJ5SnVRAlqQoDpy+0AsOdAu3Tx323Mkq+xza/RrIPqXnFuJd9jSy/2dZIDqXYg17dHo0WrPJn5TvGihPXASwuYwpy/3+K1suXjZgaPQTkXNs3QNdHUjFlm9Ay9ci44zHaYrGQufLa/TxU/NQvF3dNvvPP8n9kbiVK7PIy/ozEcRXn3iT3cudJtx62vFBeFmkQ6j14Ao8QjEquYpkJ0VJqDWpT+TJl6IE58EuaSu2TPQKTHcrNQ+xYquvxIs1ThyK2L6Yozs46Gvbcx5knRqalypUpI5ShCITVqPID+MAYBHbrKWgPIV+WFM5EnPe2qoyeWAYrQ/v2BJ40klmZpa14DwUxpd2RMHR4fBgGdA0icJe9h2uQIiNTY/u4EdfhqyPJ0XF5ib7NGY9guLezDPfir/PzJoxYoh7Jf59Abx9q0yZRIMVarXYrgH9GGyuVJIY//U3v6egLs2YX6Nb0QhgMBxBr0mniAxDEYCbhnfDt28bSo6p3f9t36iTotrGRnrYhV6mk8dNHzuXIInbIAgAu4kmHrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(31686004)(186003)(83380400001)(316002)(6486002)(41300700001)(38100700002)(53546011)(8676002)(54906003)(478600001)(6506007)(6512007)(6916009)(66476007)(2616005)(66946007)(66556008)(8936002)(4326008)(2906002)(26005)(5660300002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXRPS0ZxZjRiV0lKUEVZLzFCdmF4b0lLSURocU5Qa2xFOGYxQW80V25qREgx?=
 =?utf-8?B?aW5iRFMrZEkwcFFUS3JPSFNTMlpzS2FJa1pTRzZsLzZOM1p0N0tmd25xV01W?=
 =?utf-8?B?SFdPUmlneTNUY2lDTE15QmNEbnhTTXNLeU9CR1Ezd1l6cXFNL2JRR3ZNcVNO?=
 =?utf-8?B?L3o3ZmhOSWdBVEVMQ2p2eFloenNnZ0lFWVFRNUhTY25UTnJ2QmF0bVdCRHdz?=
 =?utf-8?B?alk3TXFtcmtxTTJOTDVqM0dsL2lBQW96TE90QnRVRXhNRWFFZlR4cG5JcGVR?=
 =?utf-8?B?d0RDdHhiUlZHVlp1R0ZuWmV2aVhJY1I3MllydjZtTm5nYmZ4ZnNsa0lGbms3?=
 =?utf-8?B?WnFBN2VORjl3dEV3KzZBcnA5cGhlemJVWXQyTkVEajR4ZWJlNHZteG81OFNl?=
 =?utf-8?B?Y0R0Mkc4dHBBbGVVZCsvUExRRHJPWHMvVFUvbEpCNHBoM2ZFUEU5WGdldlh5?=
 =?utf-8?B?YmJzejJEa3BENDN2bENmZWhkOVlKU0RjN2FsU01GWEdPTnZ0eHVPL0g0dGVh?=
 =?utf-8?B?TkthVDZiL0NrSFRwWW53bjdNUExBSnArZkE2cUxGbVdkL1ZMOHBGS1lWemdT?=
 =?utf-8?B?VTBQbkhkcTArczRMenJIc3pxZ3BiZTZpM0NseTJRMWg4WWMyY3J2Y28xN1VE?=
 =?utf-8?B?NjZUL0RNTVlGcmdSZXZEcEtWTWYvOVQvT0dsd2JpQnNvQmlidlZiZW05cDJH?=
 =?utf-8?B?WWt3TE1CZDVUTzl4VnNUTnNiSFIvNnJGaFQ2NnU0amNNK0FITVJ1MVFBUjRS?=
 =?utf-8?B?QUdsbFlmZ0EwZlFya2tXalNFYm1PWjkwTWhQL2pHdGVZOFFaV3IzS0xlV0kx?=
 =?utf-8?B?ckxERUlOOEltbVUzaUM4YXQxR2VsYStEVzJVNGZXN2YwY2hXaUVxSHBmTVU5?=
 =?utf-8?B?TVFxUFJrNE00RGFKN1NZMzl2VndNQWsvVW92QnE5WDBQVjNBSmhIQ2hSVlRU?=
 =?utf-8?B?WmhuODZ5T0NuYzNoaEtPaVVBcHZwTlUzZTBhZkYyYUp2cXVLK0RpYlBzMEdB?=
 =?utf-8?B?aTVLSlN1bDd2eldsTXNaenZkVHlhVUFLbzZZM25XT3Q5elZHcE9jQkRYM3JB?=
 =?utf-8?B?TkZVd0sybC9KbmdNcGhYOVI2dVE2emRnWXVOYnhnVjRaQkpkeXNlN011d1N3?=
 =?utf-8?B?VVVtbURlNndocnQ4SFFMYW11NEJoNlp0Y2ZEQWJpbTNQRnN3aVU5VzUxL0tx?=
 =?utf-8?B?SlYyU0VUbmIvRU1lM0FkUDRDeHdjN3UyWFZ0TjA5S3lMM1JNSmRrWnVnY05C?=
 =?utf-8?B?eFpKM21paDlqZW01VFk1OUUxYmx1Z0R2ZStGcEFUYXlxamlUa3JKektxS1hE?=
 =?utf-8?B?L096Ujl0ZWJnaFZGd01uQW0xYk1DZm1ZbStmNHp6aUZ1VFMrNnIrZURlbFhj?=
 =?utf-8?B?b05DSDBXUFZ0d2xLdlFVMHRmdFMzMm14a0dXRGRuZVR0RkJkR1JOWWhCWnFL?=
 =?utf-8?B?SUdZMmdiSC9CZVc5TUVibS94MFZjRStudEFqZFFUUnM2MHpqTXRSSUlXNGI2?=
 =?utf-8?B?bzR1c0RYTk9nOHFCYlRZRS9YRUhKOUpXbDNWQzdXb0p1WllPMGt1am80ODNk?=
 =?utf-8?B?cVhYc1hpUmp0aC9aVlFzVnNoTGdjLzJTYkdzZGJLc0VaczRDT2x2cHpVN1l4?=
 =?utf-8?B?RVduQkJqRjNic015NjlmMm16RUU4c3BqSGNpdnYzOGlGdG9hMzIzOGROYlg5?=
 =?utf-8?B?a2wydVFaR3NKM28xZUdMK2prZmxwZU1nWjdZR3V5bWV4S0RTVHVYNW14Wnhh?=
 =?utf-8?B?RjQ5Ykljb0pDdjVpM2t3YlJ5cFEzQTFOQlg3bm9Bc1pYTm9KMHd1bVNvVTlS?=
 =?utf-8?B?ejhoL2U5bW9jQU42WW5ZcHJvY2Z4NUFpdTFyNDYxTnU2eTIwZzU4QnJQd1dp?=
 =?utf-8?B?TTdCV1J0dVNRTWFxT2d1V3RyTHR5alNvWDlPSzdVdm41TFRDb0dsK0Z1QVMz?=
 =?utf-8?B?eG9FSXNXS1hORjMzTmhvZlA3UUZpM1gvdCtKdFAvRzd1a2xkZFo1OE10Nitl?=
 =?utf-8?B?RUxadnZVUEhsWVlsMGF2SlZ0WHQvVGNJd0FRaHladTdjbmRDd29aM2E4bjQx?=
 =?utf-8?B?Y0VLM0JRZDdpWmVTTHVaYUtlNmVvTHBBYTF6ZXM5QnJ6VHV0SW9ZNzM3N1hq?=
 =?utf-8?Q?QpH8bDrAelEegiHE+pxpJkxwG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f8e68b-d2d8-4e85-eaaf-08da9724014a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 14:10:12.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIkLmctcCsf61PyREy1/7zYxKwvTm1rUmdDtWruQR5O/7VJZBjTyn5aXM1AJ0kD7b3M/wuDnr35qr+7nqqpQ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269

On 15.09.2022 16:05, Tamas K Lengyel wrote:
> On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.09.2022 02:41, Tamas K Lengyel wrote:
>>>>> Do you have any idea what might be going on and preventing the output
>>>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
>>>>> present on the receiving side, just nothing is being received over it.
>>>>
>>>> There are few more patches in the series that are de facto required.
>>>> Especially those about IOMMU, otherwise it can only possibly work with
>>>> iommu=0 (which I'm not sure if even is enough).
>>>
>>> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
>>> on the console:
>>>
>>> (XEN) Panic on CPU 0:
>>> (XEN) FATAL PAGE FAULT
>>> (XEN) [error_code=0011]
>>> (XEN) Faulting linear address: 00000000328b3a54
>>
>> Perhaps in another thread, could you post details about this? I guess
>> we want to address this independent of your XHCI issue. That's an
>> attempt to execute code outside of the Xen image - the only reason I
>> can think of for this would be an EFI boot services or runtime
>> services call, with (possibly but not necessarily) quirky EFI firmware.
>> Any other context this is appearing in would quite certainly require a
>> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
>> calls we make.
> 
> This was indeed observed with a xen.efi booted directly from UEFI.
> Beside the limited boot log I get through xhci I don't have more
> insight but happy to send that (and anything else you think would be
> useful).

And with "iommu=0" but no use of XHCI it doesn't crash? Or there you have
no way to collect the log then?

In any event, from your description the interesting part might be the
EFI memory map. That ought to be pretty stable between boots, so you may
be able to collect that in full via "xl dmesg" in a run without "iommu=0".

Jan

