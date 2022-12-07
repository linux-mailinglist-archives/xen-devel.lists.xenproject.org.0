Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD656457E3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456168.713903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rhi-0008C4-HM; Wed, 07 Dec 2022 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456168.713903; Wed, 07 Dec 2022 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rhi-0008AJ-EA; Wed, 07 Dec 2022 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 456168;
 Wed, 07 Dec 2022 10:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2rhg-0008AD-9A
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:31:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe02::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa6187e-761a-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 11:31:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 10:31:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:31:01 +0000
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
X-Inumbo-ID: 3fa6187e-761a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qw02Du5KTXwScvaZqaquBWwKhIncEOqPNT2Y71e/sl7I1t5toyTiqwoIu+X+zxmXr6y71ZsKZv3SHac2U4/2IloHj+5bKfX6IIMn9XHDfh40P+KxaJMRTehJSmmvuG/PYS/kmyj38bhEAFdHGZjEZ+5pptqViMrf4M/k/+heOg1H+Y9BZSb2LVkQjVOB5anftLyBvEA381gV61/85bWcvW83tELmn/CflPbBSf5awxepK3Emkg3r247pAmQ1D4QeNmbSzwnmgvYnij8ERSebZnOEnP7nzENY1mMN11WJcjDq6bL8ebuzh5mFiwFkph+cJzTktjh0Jjekz5fVAwr7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+po0AMZoktsY6y8iiX/ERyRQq4nHJe7TQHPdXfc9CI=;
 b=I0Mfg4GmrRTnohOLY/hAobzfKVMYl2xuNHjJkzlhpNxy+BGG6qswnUbFWbZMiB0DqF/b4/EZd76E9u3wQf4OoxskE5raOcPhDQcn7FRSgwOMVKl12crcAP4IFtoQm4Mkyx2bP75YR4HI1RwfJm5SjY1uUp/9jT195r3IqnBA5mRT2Q7TAwO7E3D4PcTQ8ukEcTmJ+vqnyZX4KrZbb2i735V0NNk5VbaVo5Xfb//aM9yX319jMhzMR4YgAisNwHpCht1FmUc5OChusJtGOPKc4TXo/Z4TLrFyg5oauTckvDpa8FoiMJEAdSjTcLaA1tAmbpzXDs7vKMrxhr5hGBtwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+po0AMZoktsY6y8iiX/ERyRQq4nHJe7TQHPdXfc9CI=;
 b=ItQIbGXcGXEx/B4NTy563xoWmBaaksNf6W+TCOGlY28nOlWDzk1v3ZJfxHC2ZUTPShE4oLRsAWXDnDHV7oA7ezPPXGPTqrITk66ZawFhyI/oyyBnx9obhk/ws/t0vl44jVZQI1MyYu8m0hwPruw4u0y8WiEtQ/ZA4mK4u70h5UhNqDV2z/OqJ754ft7dZgX9+arqSJF9E9IxDcoBwzXqK1U2fFpZZqMGvTMwVoXUrcXim+IsaItAZtlLfIxco35Cqiv74q8AWOex7gqK3q39KWcNIUfMtoXPfUhuv5uQyO4NRwhzkea8psYSXUbCAUgHJIbHc+8aMHHEwYkoa8y2/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae3fb691-ee52-221b-e73c-28560e480b4d@suse.com>
Date: Wed, 7 Dec 2022 11:30:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] ioreq_broadcast(): accept partial broadcast success
Content-Language: en-US
To: "Per Bilse (3P)" <Per.Bilse@citrix.com>
References: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
 <397a24e0-e143-6a8a-571c-ea20ca4ccb63@suse.com>
 <312a88dd-0207-dfc1-8200-e5d399ac12b5@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <312a88dd-0207-dfc1-8200-e5d399ac12b5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: d860e74b-a950-47fe-5d55-08dad83e22ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hf04xhA4GnTTKluEuPvBtwQmMzSfuopz5dbXAa9z02F1v8K2RUm1i+6IL/iIR9wBTWCm0uvAQN7tAochK07a+6Ci/VgO2Bl0cuaNluw54CNHjkQ8biR+ThooiKTzbpwYLiRzBkJTd6v7ZZZc3S+D6gzcSIsa0br3SvFLC6cPq+EqJ7cLxqJiFosnuSX5YOdbohu3Q3kx2pYZJUUfMF/jQCSDBK15KQSABEIof4uak1OWiA46Kh6p8PwWeSoAJ4NzcNyj63GaGhphz8eGnCK1iF0QqjDBDqfASwlBX3esTew4yOYw+s0AJEH4iCVmJTDQp6fYggRVS8Rz72LkN4Q05Vse1AuNE3sZjrmWkbWK5hX+rng6JrEUMvWy9La7eRG1wcPeaEL/ct5kNsvlAo6FDS6RwCrY41E2Wl+aT0x6UJgSfyuTUkgZM6MY/BtvRFxdWFFsWdIRdmEYO6iZmyuSNUfnQShMD4pyVSB0rTEnFbZ3FMWQkoa1J8lzTe1J5vzwRMd6K6mA831pr9ibAjcB4qnbCVmHnystpEfmoGMqVtz4e9rFyEzagX0mFgvKDggnH8dhL7vE1Cw+r41FfFpkR6wFeD+grBOWzFalV6XXruAAFAFaDfZDR7vS//TcebgmY6zFApKJn8gDtkJ3zKBRi1eAyoW3apzfbJFYVJk/rhCki35MHgv20b7AlLcaUG3GOx6FoTo7CE8VMnbhRkVuGSXUQV6b8+66Yci3DZBtQ5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(6486002)(86362001)(38100700002)(41300700001)(31696002)(2906002)(6916009)(5660300002)(6512007)(6506007)(53546011)(4326008)(26005)(186003)(66476007)(2616005)(316002)(478600001)(66946007)(66556008)(8936002)(8676002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2ljQ1FGbmNYRm1NQVFxQzZDWmV4ck9GQkNWRzNZNzcxZkYxS3hEK3NmVWdQ?=
 =?utf-8?B?cFAyT1FONkZ5VkZCR1pIMlIrUHlhSi82UDFySFFhUVVpanJib1UrU3R2bXhp?=
 =?utf-8?B?blh2Z2plR2xxWEJhZWdIOG0xWGRJUTdrSDQwYXVkUCtzY3NTclI0YUUxWXhY?=
 =?utf-8?B?RXE4OTcvN2oxYnhmWlZBV2Y5Q2VpQ2xmM3J4S0NYSmFTYUFIQmhZUldWU0Uv?=
 =?utf-8?B?ZWVTNEM0WlowbmIzWExldnIwRFNGcHhtS1FtRVlvR05IRnQxdjFRQzArQk0w?=
 =?utf-8?B?S2pNK0RhVjFvcDNoRFhPNjJwZkUwM3krZVJrZ3BTVlk1Q0M3Z0lLN2dCVUxT?=
 =?utf-8?B?cCtDeitzMnFpQUhhbkpLWHREdytGdnVaZW1KQ0cvclNkbHN2MmpaSE9HL28r?=
 =?utf-8?B?VFI0Skl6WUVLc3ZINHpYRkF0cDhxSHJRaDFQRW1vc05ReDFsOXVFaU1zVEtn?=
 =?utf-8?B?czIybUQ3Tm9QOGdwNjN3UkpwRkxlTlYrekZoN1RaZ0hrWkRERXYwU0JDcENR?=
 =?utf-8?B?Q0hLd2ZyZjBEdllkR2c2YnkzcmZzQkFmYTlJVlhVRHkzb0lTcU1aaUJnN3dz?=
 =?utf-8?B?SkloS2dZSlQ5eGRlc2ZjdkVTek5VckR1M1pnWEsxeDFOb1YxdW55UlZPeUpH?=
 =?utf-8?B?bjgwU0JseXIwS054aWFFVjdDMHdTNHl1U1FGTUIyT0VqbTdFbUFkcENKVmtB?=
 =?utf-8?B?TlBkU2NYVGJxZGs2UVdRZzRiNG44ekNVa2NWYkpYVHdZY2hhY3hnMDBTUEtC?=
 =?utf-8?B?WVZGcWFORUpOVjNxLysvY09zU3p1Z00vVmF2V1pKd2hPc0c4YTNGdWxSUmtT?=
 =?utf-8?B?c0pkYlk0c0s2cUJMUWcybitrK1FRYVVRVFVReTR2dTFsdFhhRHdmUjFFY0VT?=
 =?utf-8?B?eERPUFV2c01KMUlQUGZhT2p1UzZRdFFycHBxTEloSkhRNVBwbDM1NTlmcjZG?=
 =?utf-8?B?L3IzbC9vb0dpem9hRjVKaHRVYW5mUW9MbWVCVWw1bnlhY1hYaUg0emdYRXI3?=
 =?utf-8?B?THNENWsvbnJ5ZmpXbWpXMTZoay9uWlp5bzJBeDVaRUwrN0l0L01XTW9pMk90?=
 =?utf-8?B?YnFOaVBIQVhYTGlvcnhRWjVINGowWk9DeWNuVW90aitqbnY3UU5FRGhoVk1X?=
 =?utf-8?B?dzNlRTJQaFFyVGtSb3R2TU9qQytTMlNDYnNoK1BBYVZyZmhRMnlveGJ0a1li?=
 =?utf-8?B?ZURCMnNUcHpUdXdHaU5hWXRGaWxUTlVaL0Z1aGtQN2NObU5FWUlNYS9ZNjE4?=
 =?utf-8?B?MGJFVnMvalVGNmkwYWplcStXOW5JTjNDVEEySVhER2FkM0Irc3gzc2dacHBz?=
 =?utf-8?B?VUpHTzdiamRkeXlCWTU1MEZwampJZkRMTlpOMjV1d1NoeGpRR29hNlZLaExM?=
 =?utf-8?B?MG1GbWJsUWxUY2U4emFGTkdyTUdhRGFCbnBsWXVtU3I3NGk5VXFFTEVrOEdz?=
 =?utf-8?B?OSttQzZHKzRhMGxVT3dLN1FseGt1dEpnRFF6NGE5LzdIWWh0OTZxZDduc0pa?=
 =?utf-8?B?TERlRnFPZVg4eHE4aENzSnZ1TlduT3VKR1BKU3dpT3NOcEpCVFZFeXloSldN?=
 =?utf-8?B?TTVoWktGcnRFbEtRTjVlQ2Y0N3pyV3pTUFlBZzM2OElMelhqbGhWUWxwdlhl?=
 =?utf-8?B?dTJ4enlYY3laeVFKVFNXbzhzZnJmcWdoazhGeGJqM3RySGtFUS94QzJ1S1V6?=
 =?utf-8?B?VC9wbXBTSmpXK2ZWZGZKbmtqQm45ckVtU25oRm1KdWtubmxiL3FwWU9LMzFx?=
 =?utf-8?B?SFA4d3NJbGpiSWFDaVI4MjNOUE9YMkJHcVp6ZllDTmlySFVKZmhQNm9mc21P?=
 =?utf-8?B?LzZwSXVpclRvb0diRkZQYVBTQlBxZWhDbXpDRk1SL1UwMEJ0SjY2MjFtTWor?=
 =?utf-8?B?UDU4Z09XUG53dk94WUR3cktVTmNKNmt5bHZlV3V6SGV0VFdnQmNOTGZGc1p0?=
 =?utf-8?B?MXpQK3dYSlFCSndVNmZReUFldWFuRFdkRjNDaVNGSDZvZWRqWTF3NjVQUEUr?=
 =?utf-8?B?ZjA5a1NMN2tMSkNXZ0hndk5ySWdaZlNNc2RFVmZ2UGtERWg4R3U5bElEenor?=
 =?utf-8?B?MS9kcjZlMEtPZU12Kyt6N00rWGwxVnMwWFl0NUlVUVQrWkcyQ1F0bklvNExs?=
 =?utf-8?Q?afyygIo0mk1qGclZajOavcBZ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d860e74b-a950-47fe-5d55-08dad83e22ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:31:01.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: On2zrNAX0q4qfr383Rb0ktYd+r/a4DJ87sjESLq2LQj5cPaHrJJt0eqimOVXy8xlzfM11uIL0cpo/X+q0eKHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7500

(Cc to xen-devel@ re-added; I don't see why it was dropped)

On 07.12.2022 11:25, Per Bilse (3P) wrote:
> On 07/12/2022 09:05, Jan Beulich wrote:
>> On 06.12.2022 18:52, Per Bilse wrote:
>>> +        if ( !s->enabled || (buffered &&
>>> +                    s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )
>>
>> Nit: Bad indentation. Since inserting the missing blanks would make
>> the line too long, the expression wants re-wrapping. Can certainly
>> be done while committing.
> 
> Thanks for the feedback, but what should the indentation be (and where 
> would I find the information)?  I checked the coding style and it simply 
> says "Long line should be split at sensible places and the trailing 
> portions indented."

You'll find ample examples throughout the tree. Indentation of pieces
of expressions should be such that related pieces align. Hence in the
case here it could be

        if ( !s->enabled || (buffered &&
                             s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )

but since that's too long a line it'll want to be e.g.

        if ( !s->enabled ||
             (buffered && s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )

or

        if ( !s->enabled ||
             (buffered &&
              s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )

(of which I prefer the former, and that's what I'll convert to if I
end up committing this change).

Jan

