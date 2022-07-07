Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0126856A7F2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 18:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363102.593458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9UHo-0001Bw-82; Thu, 07 Jul 2022 16:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363102.593458; Thu, 07 Jul 2022 16:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9UHo-00019y-4W; Thu, 07 Jul 2022 16:23:28 +0000
Received: by outflank-mailman (input) for mailman id 363102;
 Thu, 07 Jul 2022 16:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9UHn-00019p-9M
 for xen-devel@lists.xen.org; Thu, 07 Jul 2022 16:23:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20959c0b-fe11-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 18:23:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Thu, 7 Jul
 2022 16:23:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 16:23:23 +0000
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
X-Inumbo-ID: 20959c0b-fe11-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxjzyPo35btAQHOZZZnLesyEkSNiL6bnorTObIeqdqD46bQ6lxWQg/Q7wMXgWcQeWMp8VzCcwIRsrO45UJly7rUpYx179FQScaA2j4n/fRc0KiyjEGZhnmeGY1eI9gjv2PKc7s/dvbQcRrTzIsUXpMkXCrMhDY10ZrH874ZqIzT+4li6ypi9DMSEIrTa3zQNcYimYl8WcvlrKo6M1aPnzffzVMKHh84UliKKzOGhciQY5P8y45MNPOgUHhhDOc91braMv4QpVZUlIsk0HbiobYUya9CLRJTRBLhB2TOauMpZFpPY9N2RcTMTWjkGOeB0M9RDSuUpY9uDf2LrO5wTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7itPSpvibWGsBe0Aq83kx9QoMVNKCF9uTMtkyS1gJM=;
 b=Su0Fs1Y6qLeeMyC0L26zRZcUopOHodIXrsGTK0IKcVnvg0kUwVxDcksDfld81yCxRs9ZPk7hVdgOYb18q3zddcRbPYa1+FpQBTu4l7p/A3/YA5SFivFOducDZhL/DaIF4OmjXEC8q5s/C3RZKPiXz00jPpTpEIXBZXxQsL5W7U2iSjaqYMyxTiw0PsUdSzEIDbpxegDG52mkDJ5OoTaSqW7dBoaD2CDEIhSgYYg8yU487l5QPwj7BZZLHl2oR0zEr7h2Jm8zc7dfGhjDDKYtfGD/zjIbymBq4kecWp1MrZXNYAZuIbMe0EZ/m/nsEWpp+JUcXZbuiGue07H1QiVlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7itPSpvibWGsBe0Aq83kx9QoMVNKCF9uTMtkyS1gJM=;
 b=KZ5kxgvLqnyEIqbK69HwVVX6s7nY6ZvNY1oLhCc1D3Qe//0MHuIEIsRKErT4j7dEy/enW1GJVIJhlUQiLUBXZGahGy6zIxjhReMdBhyuYbgYd55cr7t6ooi0lk9VLI6ZtjIQ6uPFgJkCpoNUbOtOIc5xpoy4ARe0RgPnqDqVfpJYrPPZM+2lGjmeOqIJKjHdgPNhzZMxcZcVVaPDxkYR1Aqd+/ktlIIVNaZe26ze1VvmyXx/cjzq6Q7tVjDWlM/AlsXGDm/M33zVHJGXz68ga6yQBzgc+CRGv1ALIZ8iDd9XDLRaBdcNEIqEU4v0AI63+PBkPci/xT2TdH3zcQfg7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93c7b016-06f9-e3d2-5a7f-97a5f15c1a86@suse.com>
Date: Thu, 7 Jul 2022 18:23:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
 <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com>
 <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
 <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
 <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com>
 <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef2e860-923a-478f-4700-08da60350365
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6vzM6ZpBXPQQEL82GqxhNAhFZ/xJGSk20Z6h/yu6p2jdehwvA3aUgivQNbbLBSP//RiUKrJo4cd/7Emkgks1h/KqbD2LbOFyq5o/FI8FwQ0zwy1dq3vKegHUB/ec0wC+wLiTzOZjfFJkvIuNI1CvEpjy495lsjcAdddoLbua+sXrWG3EPLGjTbQHpzWRmkALZyLQrgyfalffu3FdqsgX+CT6djEEmfpPmTzDNIAFAya3MCWuFFI4hutKbfr28hSZedtMzCVZvR55yXIE0n5awV07FLIfizXUnzOrtWxaAzBZGR2BF9VTZi5TSSY4R1t32bjgYNV8G21+yCeIjQQE/Raoh4xvyBqAi+BM6mjw/C6vNP8pj6SoytW/PpQvOllD0F0s9PK0b/oGVDYhPE1snx5A7r4MsTOqxlT7WfydGM1lsPTBr9fZF2TpcPM6MQg3uEQdADPtkBDqHFU34yFtioV3DDTja8LdCq6b4abb6pbYRDLjiefJClx6TNhnSI0GAXyN+fnwGsTSAhHzl2Funu5JIrD6KEba0CKKabJrp9iyA45FBpDkw8q5XfzJft306vaX/DFnfIQviABg72wB3VIf0wZJ9fYRB8OrKSiIxtMCC0CeVRlMAXhQUEE1CsH3t418yAXrdcpQNZpt46u/OMALsgKZm5+4jXkMiYdN2m7fPvBYBymWYMMCr9cZyh/1KbHuHINcadB8vp9HIZsr1emY41rUmsrzs/7AmUhfeZeZ2Az7jhtyqa8WpOun73N1uOWn+Le6T+lNBbc7N2IV4b0453JSeXI70UavhPR4XXjR8FkNbi50W79HvDtAog7sBwpJv1F/bZ25Wg3YlhcV19xvwyXz1ftkw+8qkCjvhv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(376002)(396003)(346002)(2616005)(186003)(83380400001)(54906003)(316002)(38100700002)(31686004)(8676002)(6916009)(66946007)(66556008)(36756003)(66476007)(4326008)(478600001)(53546011)(31696002)(6486002)(86362001)(6506007)(8936002)(5660300002)(26005)(2906002)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjZGcXJaZkQ1eHpsZGVwd1BGNXFYYVFlNytLdjZLU1FhenRra2xDRlpQR1Rq?=
 =?utf-8?B?NENvY2FpWGdVK2ZweDlNa2d4SW9ta0R1MG1LOEZuY0lLbzJkNGk5Wnpjbi9a?=
 =?utf-8?B?eitnR284NFpLdmJ5RHdQYmw1VjVWQXR1T3lReE1FZTVLQVgyb2Q3R2hSaEFK?=
 =?utf-8?B?SjJ1VGVHMWFycUNYOXlyd1g2Z1E0OTl5WVZuam55MjROV21XU0dnRytUV043?=
 =?utf-8?B?UjQydXZSRkMxWkx2QU80RXZjbHVjUGFRWVU4enVnV0dlSW1WQzN3VVRrcm1x?=
 =?utf-8?B?K0lJL2kxZmtYWXMrcmI3ZmhQYy9TMkNpbnhOckFBN0VCRi91OTZHOUxpNks4?=
 =?utf-8?B?YlltZnpJcjVEakxxNUpNWGlLK1BDL05TR3lBLy9yQ3VyMnlKc3BncGkzQ012?=
 =?utf-8?B?S3paNUN4b2wzQUE2RGFsT00wZlpjd3ZFd3hnd1VsVjlSbjZ2YW5RZ1VPZU54?=
 =?utf-8?B?K3pLL0hQR0pVODlmMmRUMEZZUGtHaGxGOUVxcXRDZnBnTzBENEFZSmNnaTQ1?=
 =?utf-8?B?RlBHdGJvdHBwSEQya015dWpvU0ZlYTBlbWJrVGE5KzVmZ3JLN2kya2VuZG9h?=
 =?utf-8?B?ZWtwbVBDdnJBY3dkY1RPZ0RYYVNLaGNpbmtxWGRsZ212TnN1TGMzd2trUUJJ?=
 =?utf-8?B?bklTUmZibXJUZVIwK3lwM1VCcFZLbEFUN253TGQ2aS9PNnBjS243V2hvRkow?=
 =?utf-8?B?OVVjV3lCOFJjRmYvMzErM0ZKcUpEbWh1UVJQZ0FiYXVVU2ErZmxZam1Yem4w?=
 =?utf-8?B?eFJwL0EzMVY5SlBHNHRzajJ3WGxqSWNlbWhWZWJSeUowZVFhdXVJcmxHR0Q1?=
 =?utf-8?B?c0ZpSitWcmdGUXhMR21LMjNtYld4djlESFp4WjN2TG1vZENJVlgvTEt0OE1S?=
 =?utf-8?B?R1JpOWhjMExDV1VFUmxGekk2NnY2MWF1dk5SbEpscnd5MERXL2loY0k2ZTRj?=
 =?utf-8?B?YWdEL1hHMEgzV3pVWnArZWZ2eGJsZFh2RDJwMUt0aHJ2UUtLVmo0UnlqS3B4?=
 =?utf-8?B?RXRzNU1lS1d3Zm9sTFRLTUt5UEhQZUs3dHJHWGQ2aytPRWs3OFlzMnB2bG5I?=
 =?utf-8?B?UmdXL29iYklXVnp6V3d3VjB5WGJuanpSb1BITnR1STFvL3BLVTRYdlJFSzYr?=
 =?utf-8?B?SW1OWkRkQ1pHS3NnOUhUQmVDN1REaGlxZ25FL1JKRFNOVGtnamhUVlFUTkti?=
 =?utf-8?B?bnN1b2thNFdPSFd0NkNHTkliQmhxVWlIWTB6UUszMCtoRDBPK24zRTEwdVhl?=
 =?utf-8?B?YzJ4cnV6aVdJUC90U3g5N0J2b1MvdlA5dDdTd1gvS0F5WFZWdTZzSWJ3aHJ2?=
 =?utf-8?B?T2wzN296VUZseTg4YkVxTzJ4ZjIvNHdlVy9NZXFtMWppZTJGL0YzVEhGajhp?=
 =?utf-8?B?VjI1aWJGOERhYWthZ0xVbzN1SWFaRU84VWVBZTl4YjFPd3pZclRGVy90bUE2?=
 =?utf-8?B?YVpKVEc3ajFvMjFDOVhidm1zRVVleHdlOGZSQkgyaVNsOVhoSXhTUWYzSWR1?=
 =?utf-8?B?OVVNaFdndjc5M3J1VkkvdzJkZUc1NnkwZ3VWNG9xNTdEbU1oUmoxT0RWMnJ0?=
 =?utf-8?B?eVV5RVhpQ1RxS25rTTFkb2ZYaTJDN3BLVVk4YjRpWWtUQkh2K0RHQng0bnlu?=
 =?utf-8?B?alI1QWFhdVg2VFlLQnBVN2VmeVFRUUFxWVVHckNKL2lMalo2V3hmRXc2bGJ5?=
 =?utf-8?B?c2wybzNYNG40UnRmejVjWkxNWUY3VFVXbXRtR2FWYVo2Z1hYSkZIS1VlMm0y?=
 =?utf-8?B?ejlLNVBwczRLV1A5K1JYb0pYWWdBODg0aGJ2d0wrVlJjNXlZK3RyUENsZ2xV?=
 =?utf-8?B?SHVzakRKYnFNVnVGRmNCaFAvWXBTZTJKY3BhS3FoQXBBS3ZTSHUwdDBnUUVj?=
 =?utf-8?B?SFprZE9qRFdYSFFWTWs4TGgvWnV4emFra3BvWjM2KzNsQXNqSkhuVFFQQjlI?=
 =?utf-8?B?N2tPRy90MmlwSGp0TlBQeFIvQTVzRFovZ0FEZWt2QnlQQVJ1VkFEZ0E5SEsw?=
 =?utf-8?B?TEYrVFFESkgzNFlrYkRDSENVVFpnQjZQYXByR3ZsR09ac3JpTUFOcWRmZ3lp?=
 =?utf-8?B?OXNhM3VPRWlNWXBocGxMWHU2Qi9KMWNkOG0wME5CcVRtakpJY1JacTJSMlVI?=
 =?utf-8?Q?ePD0kilXm6KMJdyZE4EXHWEIy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef2e860-923a-478f-4700-08da60350365
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:23:23.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aU2xiP3n8VZyx30DFlxn2x/4DWOZ+byWBc+tYVRRfO7+Wqkr4XtH9uxvG+wNT5KXYP2XCQHn1zC8dakZC3tHDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9386

On 07.07.2022 17:24, G.R. wrote:
> On Wed, Jul 6, 2022 at 2:33 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.07.2022 08:25, G.R. wrote:
>>> On Tue, Jul 5, 2022 at 7:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> Nothing useful in there. Yet independent of that I guess we need to
>>>> separate the issues you're seeing. Otherwise it'll be impossible to
>>>> know what piece of data belongs where.
>>> Yep, I think I'm seeing several different issues here:
>>> 1. The FLR related DPC / AER message seen on the 1st attempt only when
>>> pciback tries to seize and release the SN570
>>>     - Later-on pciback operations appear just fine.
>>> 2. MSI-X preparation failure message that shows up each time the SN570
>>> is seized by pciback or when it's passed to domU.
>>> 3. XEN tries to map BAR from two devices to the same page
>>> 4. The "write-back to unknown field" message in QEMU log that goes
>>> away with permissive=1 passthrough config.
>>> 5. The "irq 16: nobody cared" message shows up *sometimes* in a
>>> pattern that I haven't figured out  (See attached)
>>> 6. The FreeBSD domU sees the device but fails to use it because low
>>> level commands sent to it are aborted.
>>> 7. The device does not return to the pci-assignable-list when the domU
>>> it was assigned shuts-down. (See attached)
>>>
>>> #3 appears to be a known issue that could be worked around with
>>> patches from the list.
>>> I suspect #1 may have something to do with the device itself. It's
>>> still not clear if it's deadly or just annoying.
>>> I was able to update the firmware to the latest version and confirmed
>>> that the new firmware didn't make any noticeable difference.
>>>
>>> I suspect issue #2, #4, #5, #6, #7 may be related, and the
>>> pass-through was not completely successful...
>>>
>>> Should I expect a debug build of XEN hypervisor to give better
>>> diagnose messages, without the debug patch that Roger mentioned?
>>
>> Well, "expect" is perhaps too much to say, but with problems like
>> yours (and even more so with multiple ones) using a debug
>> hypervisor (or kernel, if there such a build mode existed) is imo
>> always a good idea. As is using as up-to-date a version as
>> possible.
> 
> I built both 4.14.3 debug version and 4.16.1 release version for
> testing purposes.
> Unfortunately they gave me absolutely zero information, since both of
> them are not able to get through issue #1
> the FlR related DPC / AER issue.
> With 4.16.1 release, it actually can survive the 'xl
> pci-assignable-add' which triggers the first AER failure.

Then that's what needs debugging first. Yet from all I've seen so
far I'm not sure who one the Xen side could be doing that, the more
without themselves being able to repro - this seems more like a
Linux side issue (and even outside of the pciback driver).

> But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
>> [  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
>> [  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44

That'll need debugging. Cc-ing Anthony for awareness, but I'm sure
he'll need more data to actually stand a chance of doing something
about it.

Is there any chance you could be doing some debugging work yourself,
at the very least to figure out where this (apparent) NULL deref is
happening?

Jan

