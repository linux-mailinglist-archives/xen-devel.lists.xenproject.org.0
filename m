Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90C58AB0F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381205.615790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwo6-00015L-IG; Fri, 05 Aug 2022 12:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381205.615790; Fri, 05 Aug 2022 12:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwo6-00012F-Dr; Fri, 05 Aug 2022 12:52:02 +0000
Received: by outflank-mailman (input) for mailman id 381205;
 Fri, 05 Aug 2022 12:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJwo4-000127-Ts
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:52:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00062.outbound.protection.outlook.com [40.107.0.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 651c6ff0-14bd-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:51:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7576.eurprd04.prod.outlook.com (2603:10a6:20b:29b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 5 Aug
 2022 12:51:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 12:51:59 +0000
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
X-Inumbo-ID: 651c6ff0-14bd-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bveTuXAPKuT0RDlEhigAVC7d+ONab5F8aykkTZ+xM1480y1wA9TLvllMU4WMSFk9gGjGIYLVMmVzmHSbWDtq684CpeE4qF6kGrf5n6jCwjcuFyFa2mq/DAwpGlSu4vdo/DJfisj3fVagR5+gKb7sT9wqBNjgLAX3bONc92oNOIUASRTIZrgaE1CwPFElyGaiVdLcLBA/dLqAYG7d8rFlsK0qaCtn6VWieV0rNm29lhR1OqCs1+wVOAAYKXU9zyVxYphucD6m2XLIO6L2lGAlQesXKhzW2Mr4rBvC5BneS0roJoxnz71hJrIiVYe/wghwIAtZ8La9HkR7vWN96Wzj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4YCCyZq4pRPcp5PXZinSK0SdcCmt321BWtKAzULGHI=;
 b=fpXlAxz5Rq9vRxmi15Oyo+L067b41f0OUebGsngG/wcg1CiW3Rn3U94GzqEuF3NfP6/wUS9iKbnW620f//jT3Or1ZZ/V9kRs+9Fr6lW+a2z7iNYnDY1rtab1Rgk7f7mEJQWbHw7z4p1+YOT5aM6zX8uLwtBRpcUkNjMqJ8u4y0cMmMmCSyylcayBQu1V23CrPM+azg+K/OgoFBmfq7/dJomNCiDeTeiShWprUTkU13zZq6e+kc7cQtKh7dDeDLPAQG5QDJu3dAVSJ0tM/OykVRj56YIfNSDqLnxcugi30etV4QPJLq3AVuopOWmFhW/jQtKEghrIZon9g1Z/IzHLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4YCCyZq4pRPcp5PXZinSK0SdcCmt321BWtKAzULGHI=;
 b=g8G1n5sQKxIxKEYTpvYBhkCOuC9MGOfzPYOqyuwueJQW7KGxLVxmdMJoUAlQg1by4SzOjAvs+n3Gb1s8BJalZjJj25pBpGNEYhSvvWgxbjkiWbHCrN80j3GGXDnmO0YJhXoy1T+G/AJKzjth2doF6+ddrfJObDd0ExPG6v4a/5Y3gg5eCmdrMXG5uJnMnAUpKexprmt1DeSxlviqBw1JfF0tOuw8fDVgqfrulNjjDWMmoA+c6DtAiJn4WcY5Mq/XmMptrbHh1hZ2Z5PrLAneEjHdt8/vS6+i4k6eZKGWy8cQNTGnoBM8pBlKV90jJ4HMvS7FjdOtb9cF4AOhBBOsBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7525c124-0dcc-1511-28dd-9ddab7370b25@suse.com>
Date: Fri, 5 Aug 2022 14:51:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
 <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com> <YuzpuUz5g+HtJdzy@mail-itl>
 <65f4ef5d-a174-2d23-3ed6-1c80e5f6244a@suse.com> <Yu0RSB0OwfoKX+Fp@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yu0RSB0OwfoKX+Fp@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0051.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92f4e8c5-56c7-485c-8f7c-08da76e148dd
X-MS-TrafficTypeDiagnostic: AS8PR04MB7576:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KmKzJ61zqvzmZIrIXC4s8NGiM2GwAStzDclrvroqZKk262H5UgirFkJnTI4enb7xHLgldG0v+dk9rNku/FLqCtFd7tgfz2YThihIAvQnMk16qQEblkf7AfQq+egYHuRtA5EIv7ru+6/v65atcwHwhTOloXAXQcYFvDayBWU+3tsED8QzHL1SydNk1YTv1NKWcx47YUkAQHyZ2pK4DfNotzfCO9XYlrPTcl0i5JP57pvApTTQ7QM+sxDX5O13ApOJan2tZQmHkrd6lPm8FWGuHWe5JWOCRnAvqLBHW79cceOBOKtoTtoxkSN00YXvsokrqrmXBee5GrKINd9ssM7qgq2pYMpqL1Afit8Ui9dXx83tOEGcZJlBFVStDpZRX+askSnRDV2D/xuD2H84lpr9yYimGCF/RiHti5qSFX3//Pl1IKOvx6HE7Fwj2lJvnF5/oodCMjQl9mr4m+PDBJgzyKZTkb+aVwz74V5FdZbqI8U4NeqS05uZGnfCdX5E6FutVDa3S2ZtaS0nAUx7RJsC8/NJMFJBIkaD3+t6HcURyNrT84nWPb98UYh/RE8m2mvhukEYgvMXAiQLyRdyG8DQ8A5vR6QRzPLhgrOIWtHW+1aBqmIf3Tu8akoHon6bCLWlwucI4M1y9mf2rXrksJs2gnQkjWoe8r2U79NK01eaqqgsbhHFkZJxqLeNxxqYZgYFrq1Gse/rUotcX132AzWsjuPsN/xBfE7XTFnnDw0Md9N2pytgXhMZpSRA7SDyc6zZNswcBOVToQV9/T+6uONMGuaCdu/EnGrex9LqnEGf9nzqu4OUfjDSzR7N9zdoZVIgZFXiuyCky97NXBxZyOaa7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39860400002)(396003)(376002)(136003)(66946007)(316002)(66476007)(6916009)(6486002)(54906003)(31696002)(66556008)(478600001)(2906002)(4326008)(41300700001)(6666004)(8936002)(8676002)(36756003)(6512007)(26005)(2616005)(6506007)(186003)(86362001)(53546011)(5660300002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpiOXMyNVQ0SkRxTmFLdUJ2VWZWb0h1SEkxemlZYnJIejhnRVlZLysvdW1M?=
 =?utf-8?B?UWkvNGNyNkgwLzZyWUFRZFZlZU05dnh6eWQyTU15VVFldUNyRnpCTVF1YnBL?=
 =?utf-8?B?RHVMQWZPWEl5QVdIOStsazNSZkIrdzVLUlY3YVpHYnRhMFhreVZvVjZsdHpQ?=
 =?utf-8?B?RFdtQXhiWHBQaGs0a3FtUDRZNW1sT0p6Z3dZSHVMSW1ZNGlFS1lVV0pULy96?=
 =?utf-8?B?cnhDQUl2VUlpVDJBc0k0L0JycHQvT2laYjNleEFIbHN0N0NBZHBzTkNqUmFL?=
 =?utf-8?B?aVd0bURYZGZoY1ZTSmpodlNrdnlpb2w3OHRNYkw5TGxNdkpyTS9KNXdGcVpR?=
 =?utf-8?B?MXRvQ21zc09aaVhOQWpJWnM2YjljRjAwejZQY3hZZXB0TEUwdHFqY2llemNF?=
 =?utf-8?B?N29yaEtSUVhuampURVZiaW5QNTYyWjcrS1Z0RjFzMitjTjJkNnNyN1JFc1N3?=
 =?utf-8?B?WktXaTkwUytHUEVjT21rVDlqeUpZWVhFc2phdVRoZ2IrNFQzYmpTbTJaNDR0?=
 =?utf-8?B?MjB0aHdMb1NwdEZHb29aanBSU3pIMmlFMzJxK1VuYkorQjFwZFRzOWVyZWZT?=
 =?utf-8?B?TFBPcDhHQ2ltLytzZEZ4V2NLUS9HK2E1N3V5a1NmQXgrRVF5M1Z0SWZVRVYv?=
 =?utf-8?B?d3d0OURqRUZLemtHd3JnVy9jWFNLaGcxMThWR0E3MkRiam1pL2FxanJ3Mnpx?=
 =?utf-8?B?TGV6RFhiamZUVE90SzJLcGkybkIrdE5FWlZyaHgzb3pLRFcyQ3NXYndaK0pl?=
 =?utf-8?B?VHNIKzlKZm94ZGN1a1VjcGFoWE00M3VQMEswNkxVcWVrMnNiVGlWaS92aWtV?=
 =?utf-8?B?dk43dGNGMXJzaDYvU3V0YU5WYk1DaVBBTEVjQ21hWTcrVnFiV1RmcFNTTGkw?=
 =?utf-8?B?dGREWC9GQTVZc2VtdllLWXB3aHR1TnhkL1RFeUgrTGhyZDhTdXZCT2xIMDNL?=
 =?utf-8?B?TjYxd3BWTkFXK2NVdUNhVWZLdytvd0p3cTZncmw2QU5HTmZGZnlVaGNaNk9U?=
 =?utf-8?B?MUVUSlhjMmxwM0Z2cUFQODVmdFJ6RDJPc3dCOFNUWG8rMHFrd2tWNDJQd2hT?=
 =?utf-8?B?NmNpajV4dWtTZkxOZ09ydUUxZXdpY2N5L1ZOSjZoQzgzVzZPVU1XV1dNbjNz?=
 =?utf-8?B?Z00wSDdwQlVac3h6L2lFVTZHVnI1V3V4RlVicER4TWFjQU5NS2cvdmFSTGlG?=
 =?utf-8?B?WDdvTENkVWxRRGtOVytSbDRvVlVjU0FGNWFtSnQxSTNncE1uamw5SHZYQ2ha?=
 =?utf-8?B?eTB3dTFYTkc5Ky9tWjFJL296YkNLZncxVVRyMzN5cEFvWDJKM0IvcHhiMUNo?=
 =?utf-8?B?L01lWVNCRFE4Qk1LLyszaHBUS2VxTGdacUJ4MTh3YVF5NTJvVEdwSCtYRmJp?=
 =?utf-8?B?M0RYTjB6bno0K2M1YnV1SUEwVnM3dmloYUI0cFhDRzJJdEIyUmpubW1wUXp6?=
 =?utf-8?B?WFRGZmFNa1JrZnVZUzU1MFdWQm0zNjBjSlN4N3BGTDNLZU03YzR2TzZ2N3gx?=
 =?utf-8?B?cjl4dzZSMEZMWWcvZG5FaGpUVkJzeVdMZGY5Z3ptOEg5MEh1VWdQd3FwTDFZ?=
 =?utf-8?B?NC9EQ3NHalBCWXdDeGpiYm1DZWVBYWsrelRKczF3Wkh5OC9JY201THFtbHlL?=
 =?utf-8?B?aENwK0pHcE8rUzQrY0pjSWU1Nk1NRENmMG1yUTZKYmkvam05STE4ait0TjAz?=
 =?utf-8?B?US9TZWhuTk8yT0ZaTHRCY3gwZ0c4Tklmelo5a3hOUS9rTnYwQWNISUpEaDgy?=
 =?utf-8?B?ME5qcGtSV2FlMWx1bWRta3FjTEZNNU1ocjEvU0JwOHdIK3libVpNd0Z6SHpD?=
 =?utf-8?B?VTgyQXdGRHV5SXowV0RWOXd4ZGllYm91a0JpQjJhQ0k1NVYvcjNER0ZmZm00?=
 =?utf-8?B?NTRCbDRrUkkxcW15NHVwUEtrWTFOYU9KOERIUTJKcFU3aFZ1aVJ2N1ZDQnFI?=
 =?utf-8?B?M1ppZWpmZFRlWmZLNVluVjNFN1MvWTdlN1RZdmVBMkNTc1ppRytOcVhEdHM2?=
 =?utf-8?B?MnJXMDFOcVR0S0w5VHNGQzBmQjNQcWltVU9tVWN1WDVrNWJxK0lKREhWNWdu?=
 =?utf-8?B?emkrVHJYQjROOVhSY0dqbzZTL21YeE1JK2R1VlgyeW1pdnVsNmFtaWdKTjU4?=
 =?utf-8?Q?+J4BlL1kc3g0no3X3i+GXVgxy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f4e8c5-56c7-485c-8f7c-08da76e148dd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:51:58.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ifjf3uw1WoZtGEHA/+o5jAFIrPq/iD82960XYuzPGteZux+bdR9EkHUIMWNP+fNEZlvwM/lvd0E1tjjhlMxgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7576

On 05.08.2022 14:47, Marek Marczykowski-Górecki wrote:
> On Fri, Aug 05, 2022 at 02:38:26PM +0200, Jan Beulich wrote:
>> On 05.08.2022 11:58, Marek Marczykowski-Górecki wrote:
>>> On Fri, Aug 05, 2022 at 10:38:13AM +0200, Jan Beulich wrote:
>>>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>>>> @@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
>>>>>      return trb->status >> 24;
>>>>>  }
>>>>>  
>>>>> +/* Amount of data _not_ transferred */
>>>>> +static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
>>>>> +{
>>>>> +    return trb->status & 0x1FFFF;
>>>>> +}
>>>>
>>>> Same as xhci_trb_norm_len()?
>>>
>>> Yes, I was considering to use that, but technically those are different
>>> packets, only incidentally using the same bits.
>>
>> I see. That's the problem with using literal numbers rather than #define-s.
>> But for a driver like this I didn't want to be overly picky, and hence
>> would have wanted to let you get away without introducing many more.
> 
> That's kind of the purpose of those helper functions - to extract
> specific fields according to the xhci interface, one per function. An
> alternative could be #define _instead of_ those functions, but I think
> that would be worse.  What I mean, is the function name serves as
> description of that those constants are about.

Right - as said, fair enough for a driver like this.

Jan

