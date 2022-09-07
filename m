Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE365B0511
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401697.643601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv09-0007Fy-Ft; Wed, 07 Sep 2022 13:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401697.643601; Wed, 07 Sep 2022 13:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv09-0007Dr-Cq; Wed, 07 Sep 2022 13:21:57 +0000
Received: by outflank-mailman (input) for mailman id 401697;
 Wed, 07 Sep 2022 13:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVv07-0007Dl-KO
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:21:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7450ad-2eb0-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:21:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 13:21:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 13:21:52 +0000
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
X-Inumbo-ID: 0a7450ad-2eb0-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQq62dd3Gzn7rrqc8PAUkMU3oKwy+sGgJIqEGgDjgRDNE7X6WuTs46isp3jA+7T3/o3OEvFhNAmKcFfouO+VZQ4h9vflOmAvGbThdXZKokXAVdCJ96CyiHlR15br+4yWPyYjv0ScuJuixh4m8v+ShZIW0PDzQkTzVMWyH2r/M84zfgK8T0QlEg6mmw+eWEQlxMDNPp4Pv7uil4uj+4j71e+mS5h++cmu7NwL6gIUtVSYwAIEbEswcITiptd0kzWhs4QLLZhnI5PtBy1SgTPvPjOi+nyaEuAtEgEFkGHUSxAKpL3jkJbv0jNXay58lor5kZ1m8Tp1BKQOvuc0dJ0qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9GWfyb5PK+MoEjaitp5FPPBm/23WnA+TC8H9KVOd4w=;
 b=j6LbXaZ113U5J3iHxa3yZJvmvixtxoheQwJSbvvl44gudhFnPXg4388kiHujpuhCWkuv3hg5XoPYXR8ruyNeDIWEwPWQx+AMU0MHEmtosBhZzWLCkHNuKwgHOLxZP6al5MEKAQecGnwEY3ojHL65KRG4d99JDwbhQusfwxDWTv/HxAXp9xqqPj9qcbsboXOWC652tBmD6INhzJhzIrNZexiBmqe4iqejIg+2RO+Rgx3hzZ0pYBGl1+A7WErik9M+s6XeaqFFnBudGs/utPHBxt6wuiVIhdiBU3C2QdZ3oa6M0Q5mFDpGTDCVfxSGSS3ZysjFph/4IZ6g0hZPivPW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9GWfyb5PK+MoEjaitp5FPPBm/23WnA+TC8H9KVOd4w=;
 b=s7VhL2S1gR1gDKKqGdzsIXdket5CiHO+pRfuNegEcCvqLtyZz0KBW0JBwUlSlfd5KpwYkzxoTKKGMajw3STwhFDXw/zaVNH+7cf9Pfy4hQiTeuWqIqBkVYjcJ84xuTqRvihj4teuu11WSeU1GO1Szt9tqrRyLwznq9F4DfgANo6rKBQ99xs267KWYg4oZhBnb9VT8M+jRbBQhweZg9R3o2egpjxPSfCxWXwOTr8hdioiiBIilGrIU0PGcT0JpFwj8V/MFu4Ie7UrmnOSxOxafVo5F76xG9OB6cCghS/8TZNfVUL8vVwT0CRmpZ58UAQ8G1nr/giG02R/ns4hwRDH0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdfa302c-4f0e-4442-1af7-8d730bb7f627@suse.com>
Date: Wed, 7 Sep 2022 15:21:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
 <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
 <06E1E4AB-5DA1-4AC4-9452-9507C2B75E81@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06E1E4AB-5DA1-4AC4-9452-9507C2B75E81@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 93080f43-d70a-430d-f13d-08da90d3ed53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DBH01G12QWE0k5N9Kw6lpOYlKeWx1zksmoYYBeHuiFuzYXzyDqxQvDzt5MBJ2DfwrEe+TOJOy5p71DlrP7c49c9by6pubvllc1+4N+17ie9oorosm1UR4AbM0Pvuq4QwALoHclgsS6rH8ry6sTO7eDJ2NA/4Vh7TlbGNHVe2DZYsh5ZUlk2CeAiGXiDhIYe8T+ciQz8e9cx7+4FZVMDNJ4qdFxvCBIYBh+w8pW9sxrQBAAJJmyK/lhs5icBZ+xdb0ftXcRLPmBlxBXDbszQzEiZv1aI0shkYto962dIy03Wp8shQhTh5LZEZD/SG/NAOeJ66nOZuO9IQOHMlF/E9eCCTQRSmGoB3UoT7sjRCVvI3yFMSrVz2wYB80Ix6x0sGgXOf1ia6HKswFfxh2X0HHs4OiXr+PMeGx1ZNiGznsizgylO3/10+i+DiQUXly++DxrOKbyALNs45bQz2P8ABN8BCy8Ob3hdwCLcMfDWy1+pkTMoKkyfxXUF0NM8/t5dLIjDd2Apz6FRXLl7bgROzEImhBYA0K9oEBHwI0HKUQJ6Tk0U2YrheIa1OvyWV7H3+hD5+ra/oK4rSqLtkvKG3anIq6/LJelqgLzHBjjHL73YvN1ohJh5I7lIJ5UrcHEUAzj4w6rSYW8Ryb4eq/b4LpFaq9VRLUANWOGh9mvJVKBJ7QrZ9GJBcq6U9d/nuR9NwRwvZg7qld4HHNx8hWM7/+p2uJZrYY/2u+b5R0y2xB5B/dFWRuTFWA30lYcfP4PaCnA8G0UTBlFg7h3KyEZzNvQQqrgc2VY8wnk5I5aH63MM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(39860400002)(136003)(396003)(26005)(86362001)(31686004)(6506007)(36756003)(31696002)(54906003)(6916009)(8936002)(38100700002)(8676002)(6512007)(53546011)(4326008)(186003)(66946007)(66476007)(66556008)(478600001)(316002)(6486002)(7416002)(5660300002)(2906002)(41300700001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHFkU21ldHhJR01kRWNRUUZCOWoxOU1OYVJoRmFCUjFTNTRpWHlvT2E1N2hQ?=
 =?utf-8?B?anRjWUZjaFVUUW85amVGMlZhMERsUFNiMjN3SmMrWmJFSHQrVnRlUi9CbFQz?=
 =?utf-8?B?a1libTZwRVc1YVYvNDFncno1UjZ2RHZwTk9NNThlMm5LV0U4OWkyQndjNTF3?=
 =?utf-8?B?NndLT1loRVlFSk5wU2d2b09mQkFxcmJwTFh5MHRWdTJYVE96MG1PVjlDdXJX?=
 =?utf-8?B?T3ZWTWxBNXZlSDJ3MDA0VEZVQXRwSUtkVGs1eWpYdkxEYStMTXJZZU9sY0ZY?=
 =?utf-8?B?ZFJHQW4veEJCTk9SbkUyeUJXQmNKNWMyVCtWTWYrYmJBY2J1RWQ4K0NLd1NG?=
 =?utf-8?B?TGNFTnEvN05JbUVsL3FxbVF1bndUSHN6SXBuaEg5NXdIWW80emFmaEthbWdL?=
 =?utf-8?B?ajNGa1BESDJLS1B5TEc0ZGFPS3FDbVRNK2lEcjhXOTdGWlREdkZad0RBRUlT?=
 =?utf-8?B?eHpncGI3elZHVDRESitBK2tkdW10VUxucVRmUE0vd3REOVJqQkJTOVdLdVZX?=
 =?utf-8?B?NnhvM1BtdFBWeHRBMUsvWCs1OC9pMVU4TmJ3dlF0VFNRdnplSUFKKy9oSmJq?=
 =?utf-8?B?azFxWjd1Q2VTc3F2Wkl0WG83SWZ2TmF0bExmY1Q3Vml3MEtqR25zWExna2hn?=
 =?utf-8?B?eG55VDJ2OTAxWHQ3RHc4Tmc2YXIzSWJtNjg0ZmxvL1hCaWFGd0dZcktMb0Rz?=
 =?utf-8?B?OWZJYWlzamxPQ3g0Z2pOZS9Sc2xNd0d0SW1SR0hMVDBmNDZET2RCeXhIeDRC?=
 =?utf-8?B?SUpqKzVRc1Z6dzZ2d2hUL0ZHU245TWtTTEJGenRvUXcxNlY4MzlFRmZFZDRs?=
 =?utf-8?B?RENWRTcxbTdUQ1l3cmtTejJ3TW1mOXlPR0VDVmFVNXlUaTB2RXg1Mmd1d1B6?=
 =?utf-8?B?bXBzWlFSQTBCcXEwV3IzU3cyd2pXN2RkM1BkakpuNDNoajFZSzZJQm40UWZR?=
 =?utf-8?B?ZEFHUDFFbElWK1k2Zm9XcTU3Nm44NG81RktieEZaN3dPQTJ2WmUxV2JoVUFq?=
 =?utf-8?B?T2NINHVZdStCVnJLMkhWUzhrUVBETkFCbUdtKzlMWUE5bGNIc1Jsb0RaQ2pO?=
 =?utf-8?B?OHlvOTB1NUxhQ1ZRbWx3YXRvbzNpaWdENmpyZW1kdHh6d0J5dGZtY21xUXpt?=
 =?utf-8?B?UTVRMHc2ZUUxK1o2SG4zWEk1aUwyUS8vSzRuMlMzTW5RTnBNQ1FnV0ZpNmxQ?=
 =?utf-8?B?RCtqSDNVaStJK1RMRld6dnJZR1dRUVRMWDl0bVB2eUhFeWV3VUlpMEZlQVVS?=
 =?utf-8?B?Rkg3T0pEL3pDa29jMEFLTmdSRWVrbVFQaGFWL0RNNHB6dDdzMVlGRHQrU0lk?=
 =?utf-8?B?YzJOYXFJd0Evcm5XMWtFb2s5QkxRcFJGZ280Z1ZUTnB1WE5CaUdpOUVNTGtq?=
 =?utf-8?B?YWkyU1FBL1lyR1daOTRpNTN3Ylg5OUJKcUx5eGRGbFRGOFdBdzdWOEc1WUs1?=
 =?utf-8?B?TmRRSVJuQVB6eDlyMzhjaUxZNzd5MHlETElKWUJlYXFXWEVCTFZhcEREcEVr?=
 =?utf-8?B?K3pDQlRENmo5R2REQ3ZuZFJYUndrVGh2OUVpeGpwdjRwQVZOdzU1RkZGbHp2?=
 =?utf-8?B?RTRKcGRWN2hLKzBUOFJvemZXVGxXK2wxRGJXSmw0azNiOXdNUHJoeGlCa2hS?=
 =?utf-8?B?bFZwcWNPbWVJTWxGWXhHRk4rYjdKVUo5ajNPS2pnM2hseXNBbFdDSG5VOEhr?=
 =?utf-8?B?VCtFRGNwMzl4SFhtbktCYjlsa3JKZFl5Vk4wdUY0c3R3RDlsRFdwUlM0aS9Z?=
 =?utf-8?B?ZVpxZjZwSWNzbG5EbTNTY0NybTEvRXJsMUp4a1NFbDJsYk43T2NYTmx4WlZR?=
 =?utf-8?B?U1NYR3BWVUVuUDZRaXQwVGdQa0dFMElRUXRhM3RoRHpDVFJvYUVTZC9VNXVY?=
 =?utf-8?B?WEQvaFBIdTdnR1ZWd1NMNG1ETjI5Q2pEekhaSjlodSs2VytEL0RrRGxFZzVm?=
 =?utf-8?B?YW5TWEpnbVF4eWIwS3VOeHlzc1JJY2d1SCtad3pLemptS0NXZEpzNkpVbXRF?=
 =?utf-8?B?VHh5QStJcVJONW1ua1dxSUZpUlZaZjBiY0VGbjB1clZUNW9oOGtJVm96Q3Bi?=
 =?utf-8?B?RWRnZExRODFIb1hXVXVTdUNzVWRGRFNKV0h6dllZR0E4eEwzK1VGOVBJZERp?=
 =?utf-8?Q?8asAZUc4fvvhJpNKS3pUsm77N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93080f43-d70a-430d-f13d-08da90d3ed53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:21:52.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ5CsMnZ5dZW/IASAsIcMJGm9psgFwy9Q/dA7b0iuj5w8GiHYred+rsuZogJI+KJd+y26Is/l1+ndyZVRsuCxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

On 07.09.2022 15:13, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 7 Sep 2022, at 13:06, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 07.09.2022 13:09, Rahul Singh wrote:
>>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>>> Replace is_memory_hole call to pci_check_bar as function should check
>>> if device BAR is in defined memory range. Also, add an implementation
>>> for ARM which is required for PCI passthrough.
>>>
>>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>>> is not overlapping with any memory region defined in the memory map.
>>>
>>> On ARM, pci_check_bar will go through the host bridge ranges and check
>>> if the BAR is in the range of defined ranges.
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes in v4:
>>> - check "s <= e" before callback
>>> - Add TODO comment for revisiting the function pci_check_bar() when
>>>   ACPI PCI passthrough support is added.
>>> - Not Added the Jan Acked-by as patch is modified.
>>
>> Hmm, I don't see any change to the parts the ack covers (x86 and common),
>> so please re-instate. I'm not in the position to ack Arm changes; things
>> would be different for a Reviewed-by without scope restriction.
> 
> This might have been clear for you but your ack was not mentioning anything.
> As the newer version is modified anyway, we remove it.

An ack can only ever apply to changes to files the person offering the
tag is a maintainer of. Hence there's rarely a reason to scope-restrict
it. As opposed to Reviewed-by, where someone may indeed have reviewed
only part of a patch.

> But I understand from your answer that your ack is still valid for this version.

That's correct.

Jan

