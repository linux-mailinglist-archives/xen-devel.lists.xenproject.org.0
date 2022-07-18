Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1957860C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 17:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369886.601455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDSLR-0008E8-IX; Mon, 18 Jul 2022 15:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369886.601455; Mon, 18 Jul 2022 15:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDSLR-0008C0-Fi; Mon, 18 Jul 2022 15:07:37 +0000
Received: by outflank-mailman (input) for mailman id 369886;
 Mon, 18 Jul 2022 15:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDSLQ-0008Bu-86
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 15:07:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a141efc-06ab-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 17:07:34 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM7PR04MB7096.eurprd04.prod.outlook.com (2603:10a6:20b:113::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 15:07:32 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:07:31 +0000
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
X-Inumbo-ID: 5a141efc-06ab-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUNYLuKVtvPAx2NY3HT7yAKY5y29cooOgoOr5y6Wk/bCHzVEpubaOKcYYVf8djSMhqDX858H38hYNrSdc0PJyWPAIFIRiK842mDkSUFw3NDpK8oriJULsWxopjTVzdpGFlfCJQtaS7zdAPq5iH2AOmeOpAijPMgELoyymPrGWdBsHzezWJ+4mFZUSE1dB5hkvJljE00/3fJorhQCWuIcJG5yU9srR7YaHHY8NktYfTsSjw6jVLxEyIBhakQ6CJ34SxVQlx0Hy2tqbNbsPXV6LKpEEzPSVIVMzsYII9Eii6F8dGhAqJs9rHlM9Pt4mo/NQxxoWQ0M1cJ3eII0OQqcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm6ZZa/2Qcsr1jyZkJxTATwz0x7fHthxNCI/xgs+aRQ=;
 b=anAALyRXXYOTBYx86eSWxfwV3wh45icw6PNTjm4qSE1PNZCePG9nsZ84NymHz+oc5SpqiUlTrjd/HaLLusnNR4ITz84MkzYlPEaTb+G0cuCNz4WQWf1L+uZAplzUe0NYe4GxOUOyibi9sQv3R6E3hBLzCgO1q/Ohkcdn+9ACSEjudC7Z5H8r4SzBKm8AfyjPlBVbbrvep2S/Ad7xGC77HIq3GF8TRcHNNnq8Cd29icoN5wq4Q0qg/EtCx6H5bGV+Ro7pNT7tdp1Iz8Oc1HPAE1VnQQwp41aQ++1mc87tdAmzgCjEBRQoknpGydOAOjxhdKLkVEi4WXKvBRq+qitrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm6ZZa/2Qcsr1jyZkJxTATwz0x7fHthxNCI/xgs+aRQ=;
 b=eX5jkfBnJp4zdrmmxeLK1ZhcjQfrIVWNMW70jjdlj+aeUx8+xggx6ZV+P609xVSgyS7VAIBOaAHXhT9ttlTC6pt+csE05qnFyUwyUrLNRZHfHBArA8LPROKMvB5L5cexOrnbF7qn7R9mpuTpkVhQacfj5i+IH938UFgyEpb5omoPmavzn6+OSsdoMCULo6k0/FKD0Xq2xOCg41uWJCxN/pFrchx3EWnQYalzkrOe/Lf+QwB0rWpR4+k561gVOzT3ZYrcdWXoTEgAlKxbNFgvYf3e+uKYtgkEhaqPdqFM4h3Jpjz+QYqncLTdmqYhmJIh8N6WLE3XbLf0AooMMz6x0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80726e60-9ed7-fe59-ffaa-df8220d6fa2b@suse.com>
Date: Mon, 18 Jul 2022 17:07:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xue: allow driving the rest of XHCI by a domain
 while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a1becf0ed2a19304ce122540e67675c06aee1702.1657121519.git-series.marmarek@invisiblethingslab.com>
 <50867e92-8d35-44d6-e10f-a26f35f53221@suse.com> <YtVYDVThOO9KU0d2@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtVYDVThOO9KU0d2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0084.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::25) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d99cfa2-9196-4ec2-9870-08da68cf3d02
X-MS-TrafficTypeDiagnostic: AM7PR04MB7096:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDacmPDPUojGpVPORlBN1JFoBZw0X75YXJG5gLlzfW6rkDHKSX+YH3fww+8b4doUuqH4WzROkddy3xpcJt58JUo67v05bQREQVY2esTbExyaCV8rESCqcABawuu63XjnDGYCF8gW56Gk8jOlxfvQ7GVtX3ggisESJz/sOYhUK+zknFLppf/Ezx6jlc/H5qge9c54I2lPRJR/0uqy8MgNDwKhfZkB0kxMw/t2Leng03Zoa2qdjWLeTEMX4pFAHPSXAdPcug7URY/8mTKRKbR5KHjbFNfOuwQ9jdrpYqJT9+Q/mms8uTWen8u3FHn47aeR8xbMGLY3az6lcgeyXU22ZGpQ8BNGQgyO+RtvV9+QgHQi/TYGBnXcLiz2s5p05dZ4ynhd5ePrA0cHlNr6EatoEmOIt61kmBfMuW71jtnulGJKXAfy6pMn3SgP7iTnDgPb8I6VEoiUZsVBHUN3kNWKvREvLjD+S+GNQxXH8WdOz25VLkjdpH6YCyBKaZtSbsgW4ujJ8954YRbMCPAKLxSSFUejEYSAai08SN01AdFmc87YwWx+/Pa89JCbTO6R8guC9Rc0LUJio9njj996jqqfw3rOXdQRFED+fjAMkO+dnSpoo0c/PQ1tZduZ+PVL+NQZ29CDmVMeBZSE0nPwiVhXTeknJl2OefKpaEaEr8TsuhqDmaBEmUpDSYeEPKh8SJkvlBX+y25MsinELvoA/gYHE3cpcYcSUbndeI5zX+6A2/ia/XlLO7WGJYn0h9k1UxWFXq3zzgo14iPJlBIA7iO9PJFKhf7I+bwmqsMl942pbc0byVzDsNmwEeAZniYFPeJ7N0brydrByIlhu3r2Hw8gDBtOn+4C0W9kiu4Jv7ovEL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(136003)(366004)(376002)(26005)(2616005)(6512007)(53546011)(6916009)(6486002)(6506007)(54906003)(478600001)(38100700002)(41300700001)(83380400001)(31696002)(66574015)(31686004)(2906002)(8936002)(36756003)(5660300002)(186003)(86362001)(316002)(66476007)(66556008)(66946007)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXEvNEltRDZaSkoyTkJDTjB6ci95d0RaSWxMQkJhNnBFRjk0TW00OGprYVIx?=
 =?utf-8?B?Z3QyS254dFlJUVZCck4zTS9ES1ZObTA3YnQ1TDVkaEZabmtyNm5aUWpDaCtX?=
 =?utf-8?B?WlU3OXFhZ3VKM2plQlI2K0NQT21ueVIxNDR0MnZZU3ZkK0phZFY1aVRxVmZQ?=
 =?utf-8?B?OCtTS1M3bi9KT1NDR1U4NzVqangyRUNPaHVCWWZvRWFRNkhrS1lZOGkrTVVC?=
 =?utf-8?B?bEk1WmtSZjhUeWVvRnFyakh1WHVrbGdYOWtheG5YYWs5YUxYcDl5S2M4ZSto?=
 =?utf-8?B?d1BRam14Y0hmUHVXVTQvUHpQellIYlEzdnFaektEa3RmampycWNvQUplY20r?=
 =?utf-8?B?OG9lRjY4YXlQeng3Z2RuNmNDTnhGREt5R3YzZFpjU3RZUXJBZkNnOUo3Z0Vv?=
 =?utf-8?B?cEFKM3JlUXV5MVRNLzJheTYrcm9hZzZKOW5CRlVwSGZkSFBiMUxicnlZTlFa?=
 =?utf-8?B?bEtuY3hvQVhpUmlaQzloMFRkS2ljUVoyQWJYWmNDeVR2cERUQ3dMWkp0VXN2?=
 =?utf-8?B?cEZhR3lVTSswVlpUQm9SRW1Ta2NGcXUyWXViS0xsaGdsT1VLYWhTelk0R0VM?=
 =?utf-8?B?cWZ6eWt5QW5iMzRyMFVkRjlvT1JPa0pWdGlWOGN3RnluMm5ndXhObUd6ejlM?=
 =?utf-8?B?R0xiVC9aNnBwcmdiVlBUa2tKdUFtbVVOOGFBZ2paS2tvb21MeWtJUjVwSXp2?=
 =?utf-8?B?d3I3N3lyRUNESzNjclczUDdyQ0RTajM0b1NTOGdqVUpNVThIL2M2M2R6QTMr?=
 =?utf-8?B?ZmxITGs5aVNXT0hETXVSQlNhSGVUaGpBS2cvdXlLQStkMmhrdWU2YWtXbWFM?=
 =?utf-8?B?VGtvZ2lxZ1o1b0pldWpJOGxvK3RkZndDdHc4eVVvOHptUUhobUFZcHBOM2VU?=
 =?utf-8?B?eWY0c1NXakJuVzNCTWxNbFluOEUyYkJyUjhPak9aRXUxQjhSVkp1b1hyeThK?=
 =?utf-8?B?eGVXQTVaZUlyK2Y3TUVEdk0vUVNIb2JMay95b3FHVUJqUVZoQldtNzQrSFM3?=
 =?utf-8?B?TEtBekZEQlh0QXpERy9KNlhvZyswKzdCQmtRbFp5Qzh2akxBL0lzZlNmZXpC?=
 =?utf-8?B?T3Fya1MxeEdhcUlCQlNzY1lIM3BWUXduMGR2TEY5WU40ZzZNWWdGemNSS1R6?=
 =?utf-8?B?M05uMC84MWR1ejVpcW8waE5HWUxlWmJvd2NsUXI0Wk9PS0Q5RUo5bXczTzJm?=
 =?utf-8?B?UjQzZlFUMWlDdnl6YmlxakFYaUk5YlY0eGgvdGgxV25GalVOVDZ0cGJPYU43?=
 =?utf-8?B?QTdWVkNHUUd3SjRWdmVyZmtUN0F3Uk5KY3lNU3RJQWN5NnNVQUY2eW9hTUdL?=
 =?utf-8?B?RkhibEI4alR6NTYveFMzdjBGdHNnaDJwSU5TS1ZkVitraUpveEh3RlZZVGlk?=
 =?utf-8?B?UnlTeDJFZTkrQVQxanRxczVPT2Q4ZWwzUFVpODdvMFoxZnJnekVlaUFMVjZW?=
 =?utf-8?B?U0VnQ0ovRXJJOURPS2dneS9Rb3BJM2x6d0ozUnZWSi91eDBRK1RWR0tXTmxW?=
 =?utf-8?B?Z1NpYUpHMzJ1SWdLemEweVdWam5NbTNncGwwYUhSRTh1QWwvcnhNZldnTjRu?=
 =?utf-8?B?alFmaHRJcS90OVFxNTMwcTNDZnJ4bUw4bElNVWltdDYxR0poa0pQOUFJMHJG?=
 =?utf-8?B?VFhkZFNUaG9JaFArZFduV3pDSEg0MVpwWTZWQmZEakovblI2VTl6YzRZenE5?=
 =?utf-8?B?bGgwSUVxc01hMTNnRENrVlRoK1JVMXdEN2JTcnErZW1VNElFSG5wSjNLQ0lG?=
 =?utf-8?B?TFRSYU4xUitMNU80N0g1MDlUWll0Qko4cGJBZ0pmRTRlanF3SFF1cmtoK1Vl?=
 =?utf-8?B?Y2xYelMzWi9Gakl5NGNybVJDdjIwZHB6QWxvZHFEeEdQS3ZPelJVWmNKYWs3?=
 =?utf-8?B?ZGkvUjdLc0JSeFJlVXdtMFFiQ3hxbXFkOG84OHdZTm9YT1FucWRQMkMxYUxz?=
 =?utf-8?B?MHRXOHMya3JjaE82LzhhWmwxaUlZR1YyN2EzVzNibzZIdHVLVnZYOCtWUXdv?=
 =?utf-8?B?QVRvYlpxbHI3TVlhWjU4WGVEcGlKYXk5djNxTEp6UXdaWGxadDZwQkJkMkZo?=
 =?utf-8?B?NWcyK05Gc0Q3Y0txS0loU3M5Rkw4L3lTQndpZFJSRUNINyt0bzNsNTlSeFFB?=
 =?utf-8?Q?SqStCOeCIr+2eUJZ2jbriO3a3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d99cfa2-9196-4ec2-9870-08da68cf3d02
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:07:31.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D37oUlxbl3iJ0f9TOeiiK4nPc0NMWmcoOWONiQFcThuxJa0SK3jfrurI0wnF4o2FbJbW3t66dyrvedsGOSRorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7096

On 18.07.2022 14:54, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 02:06:07PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> That's possible, because the capability was designed specifically to
>>> allow separate driver handle it, in parallel to unmodified xhci driver
>>> (separate set of registers, pretending the port is "disconnected" for
>>> the main xhci driver etc). It works with Linux dom0, although requires
>>> an awful hack - re-enabling bus mastering behind dom0's backs.
>>> Linux driver does similar thing - see
>>> drivers/usb/early/xhci-dbc.c:xdbc_handle_events().
>>
>> Isn't there a risk that intermediately data was lost?
> 
> Yes, there is such risk (although minimal in practice - it happens just
> once during dom0 boot). You can avoid it by instructing dom0 to not use
> that USB controller.
> Having this capability is really helpful (compared with the alternative
> of using the whole USB controller by either Xen or Linux), as many
> (most) systems have only a single USB controller.

No question about the usefulness. But this aspect wants spelling out,
and it is one of the arguments against allowing use of the device by
other than hwdom.

>>> To avoid Linux messing with the DbC, mark this MMIO area as read-only.
>>
>> In principle this would want to happen quite a bit earlier in the
>> series. I'm okay with it being kept here as long as it is made
>> very obvious to and easily noticeable by committers that this series
>> should only be committed all in one go.
>>
>> Also along with this is where I'd see the pci_hide_device() go.
> 
> Earlier version of the patch set had pci_ro_device() before this patch.
> I can add pci_ro_device() in the initial patch, and drop it in this one.

Having pci_ro_device() up to here sounds reasonable, but then you still
want to flip to using pci_hide_device() rather than just dropping the
call.

Jan

