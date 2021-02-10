Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1641316776
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83592.155914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pCr-00036I-VK; Wed, 10 Feb 2021 13:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83592.155914; Wed, 10 Feb 2021 13:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pCr-00035t-Ry; Wed, 10 Feb 2021 13:06:57 +0000
Received: by outflank-mailman (input) for mailman id 83592;
 Wed, 10 Feb 2021 13:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9pCr-00035o-0q
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 13:06:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21c67e1a-eb4f-4c02-a654-47f971c9ae52;
 Wed, 10 Feb 2021 13:06:55 +0000 (UTC)
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
X-Inumbo-ID: 21c67e1a-eb4f-4c02-a654-47f971c9ae52
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612962415;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CzeGTnabnmW9jdhhvUNUY2czbocXBYcaisgwRwIZVu4=;
  b=WIiHpa2ivLOAH1W8LXHEe+bxUt62exiH+MiCCj/xnDGYcnzd6HofzQ5H
   SdVVLMRhNDWs4LD9MmZj//7GUpQmBYs5HFgGXKzvbXpHQPkPtxP4+2CjK
   u/JYoPwoXoj0mt7Xq/AhXB+rexGU86jqZ+x+nGe++rak31/mONN0r89KT
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WYDf+LBokPn6T9yRJqGgcFXZ0bm8FK96Hf5QRTJL7tkK7wktdhT045h5WVK6u40iP3AAmQomMC
 8Ytp/rIJnunVTsaGDFE38bVJWxQO/92MQGtcN95cjHp3Jkn2DSKWXgQ2YLvgE0LMf7Eb9ST/2S
 Co0QM6ytjOUuD8toatDyk0VxOXjkLGRz8w1vMQxmldPVGITKi4/I9rpPZkOt+Q+ZTG7QbxxIXH
 qBCiE9pcrGml5geaUUr0PkHvnCs0Kildk1hXp6fEWVPeOAlP7I8C+QI19/PovqWam9f7vtW1hj
 vnU=
X-SBRS: 5.2
X-MesageID: 36889415
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="36889415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hF9tMdzRed9mAUZ4dSYPVTPJdqLTmmcfBr4KuHYA/1IbSNx8TVWBqq4r48/rY2bk+jRDHSu7F2arGOqD1VfaTkyinpWGYVI38giP6Aq11z5phbQ/rMqXjF8bYrAsvQLOuaOX7S5tvBtDDhsbl1rreNhu3HSAYJvu/1URGM6mP+OvUjWh733Edlweidwn8Q5Fgl35CzKsG+BDnVQXe6lnCjAgWgB/rOokTrmilAeaqt7ROjh39ZW6GCUT0cDZj9XsOlOuqmy8j5MoCyJtaLWasAXz5O+Z2deOJahV7Jvj4Cfp4/Km009QwPobHr0Ug56032uh/NIFr2K4l4FwSpG+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I24MA5PNI/EgwkSnWseXrKXGL1J6wOkrf8NckIIML0=;
 b=WlcG+2ycbGCb0mwuhHyO4GPedLkt8WxzavTluBPvKKjHNz31QoByydACK9QQ8ml/l1PEEassH2cC1OJLQhW38te6VI3WboAXusU3WhsQAASSV1+xztq/3+HJgUmwLxZly62W+op7KyFm0qWr4+bROnN1OclG7OuoG2mqZIhjV/x3T7dwgDDg0ylhqiSnc5TuNCwF6bR7MSEoHusPb4P/JUUMsfsJy4rbeAEUG9nmSYgrWXRkbqiW6xVoySjKYlBTnRCCth9rNl+zSwonVVSq5D7M/uTWpXTJxxoceLsTL8ZD7vZREeruehaFJqJvG8XXH98AzA29yynEj6F5gYImSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I24MA5PNI/EgwkSnWseXrKXGL1J6wOkrf8NckIIML0=;
 b=qpiWKckBtS+/L23XEg4JDOER0eu+oGmMVlfS3A6AF55fcIyXS46MEzVzQIY5V+DxNgto32KG09hisieRI+3EjOXU9Kc5Tc9PBxHIE/tcbHqQZiYBMEJJGvEMuHEh/sVsYo+X4OVsLC0dNO6NVXwiPiBQRzigGh8sFOQopz/MMpA=
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
 <c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
 <24610.50089.887907.573064@mariner.uk.xensource.com>
 <6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
 <a0da7d15-d0a2-62c6-0551-f62a09780e16@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e5decfb-cfdb-0fc1-73c2-8ee14d750323@citrix.com>
Date: Wed, 10 Feb 2021 13:06:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <a0da7d15-d0a2-62c6-0551-f62a09780e16@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b95160bb-c712-43d0-186c-08d8cdc4bbaa
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50006E8D911803CD2D4379D3BA8D9@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XtI/2ZRGfjFKnAXLsMIdO1p9lPyFhDJO6QGpMs+4kFZV2GKacpxUaHCPVGKK+UCeZ6KfD7GL3mmtiXSJ1RPUEdUutY4NmpbsmMpneLRGXbajLTqWoeJ0DtXFvSw9gab0k5XfBOs0IFW0YoF3EusNAYH3zE/BbMwuWBSCsYrtDnwlmJdkDwVYLDq0TWfjxLlMJbbA8D9Wactx7cEUq/MTcC4t72KQn3slkXBqZzeIA4zkn3yjeV+biGyu5rptol9iiUzg+yqt4CnqBInybMfZkkoSf5HbgLrGCIb+PLLI8ZuKDOkAr2UEvpPwKXWdMp5CAFS8EoK1U7A8ulKAuwaIdzvE7Q9MMa5s5iHfVvYjdwH6h0Qu8GjMjbopStt1FHzEVYO4/DchEbTED0ylNm+Hhm9IaIN4DupE0iJKfNQkWQyXIPAOaPIBUsa84LCe8819+zQ7d5MdckkLLakMiFdr//3b7w064Rj3NRAQRu/rQEZLpaNf6tiCTpv2v7Yd34JzjW82vfmxDydy30/2AAGhVWHsVZRUY08WSQyTfFJVT276fVExPNnB/qZQiiGrqYs+bQicmzyUHVV/1yFONsLl+UIZGGHQUCpmguuP6C1PSaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(86362001)(36756003)(31686004)(478600001)(66476007)(66556008)(66946007)(83380400001)(31696002)(956004)(2616005)(53546011)(8936002)(16526019)(186003)(8676002)(26005)(16576012)(316002)(2906002)(5660300002)(6916009)(4326008)(6666004)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QSt2RTJ0b3dTampqNmZ5RkF6S0JBTFlDajNjcmtsUERCcGZISmxjNHNXUmdM?=
 =?utf-8?B?UTlYZkgyS2JUK0xIbUgxMHM5dVI2ekIxaFRwZUxQa1poMTIydXN1ODkxcXZO?=
 =?utf-8?B?bTNaZXRkUXZ1VHZVNFlIWjc2U255elBBSkY2VDFJTGpmNmxwNlN0VG1YNHpV?=
 =?utf-8?B?aUpyMFNuejZSRVFCUmh3U24wZFdLMXhQZ2Q1QXdIY01sSFFmYzNFWksvc0JE?=
 =?utf-8?B?YXdPR1U0SWpCZ2dremZ5YWlsNmdBUUVEN1VRR0FGTVpyRmhUM2YvclJTaHZC?=
 =?utf-8?B?VmJMQUdSOENaZytkSHZNcTVMRHBHSzhucFdBTG9XM3BKK1lSdUlFd2pCeHVh?=
 =?utf-8?B?THZBTGQvUW9iRnI2ZGMvcHR6YWhsRWYvTHJWdDNtYU9nS01JV1hHNFVuQU5X?=
 =?utf-8?B?ODZ6WnNhL0hqQmFXK1NZV28vbmwraVVrMnYyRDVFL0FqYkMrVFJOV25FOGlV?=
 =?utf-8?B?YllwRFhIczRmSnZmbDB0enc2L242Q3JiTldqblF0TWRQTTRKeWZGejZWQk1x?=
 =?utf-8?B?OURMZGVndlpQQ3ZNV1REemFNdVVSeEtrTEV2RERqUm9WNWE5Uko1djdMc3Nr?=
 =?utf-8?B?U0pCdUpWNjdrSXZ0ck9OTTI2SFBpczNPMHdyRTZ5ZnZGZ2JnWkFyVWJOUEg1?=
 =?utf-8?B?Y2hkTzJHWVc4UHc4OUtQRUtSN3Naby9QbjB6eG1XZlBPTTJBUzlSUUdheFI1?=
 =?utf-8?B?QlZjL1ZIRjRRcm9zM0M2QlB4Z2NIWkxoNnRpZzQwcTIxZXFFZkdZL0ZWNlpm?=
 =?utf-8?B?L0dRdnZPTkV2WWU4ZXpEeWlNSUVMaEp0aWhuendiRWJmVTFNMnE3czMyMENx?=
 =?utf-8?B?NVgzcU1TUDVBL015UzAwRXNQemorTjlDUTZ3MUdzRXl5QjRoUUFMUjJzRCt3?=
 =?utf-8?B?OFpQc0RKSWpuTzdXaXd4MzBOOCt0eUhIWnk5THVLc2VhandHV1VnQ2hTb0VN?=
 =?utf-8?B?LzhFYmVFelk3SVc3MkY4akYvcEV2TmFoWmJBS3BvMmZKVGZlcmV4SDJmUERB?=
 =?utf-8?B?V1EzTnlGSzFWSDh2Tmh0d0RsYXI5M29EM0hBNkJRUGJYdWhlZGR0Y2M1TEp5?=
 =?utf-8?B?NnRSaS94RVpxWFBrK1lQWU5YcFRlbk82R2ZFYkxYZ3piK0hONE1uSDRkQ0JH?=
 =?utf-8?B?WDV2Z1VVNmkrcG9MeDVUYnlZdWhWNGtiM3cxTzZIc2V3a0VUTHdzbTU4cEZO?=
 =?utf-8?B?c1lUZk14RkFPcWVEcUcvOXN2R0xYcW9lb2prYkU1aHYzZzlGMTRLSURvbkxm?=
 =?utf-8?B?dmI0MHB3VmtUekh4Z1VYYld6bFRUaUUwZEZRS3ZKVXB3VjZqYnNyajI0NDV6?=
 =?utf-8?B?YU1HYzl3ZE9EemFWeU41YUFwTlI3NU13OE5BMTFwUVFhV0g1dnRjMmZyeTRP?=
 =?utf-8?B?WUhPQUxuUGhNVnk2TVpYQi9kSW1UakNVUmMzUlNOWko3UkROZ3pKTGJkd2ZV?=
 =?utf-8?B?NE5OV0Z6L0F5ZkM0ZDRqdUlENUYrS1BzZEJobzliaEplVzBiWHBXZXpmVnNV?=
 =?utf-8?B?enBTYVNhcGk5MTVKc0dXRmc3RjF5K0ZHRDI5S1VVOVRwSVl6WlFDWktTK0pE?=
 =?utf-8?B?UTdjdkpud2wvbE8xV0VMTDgwR21qVDZ1NmtlbXZsSCsvRlRyNWtKNWVXUVEw?=
 =?utf-8?B?b3A5dTZiSWlFa1dKeVF4Sk1ZeFRUZGRzU0VkczlMN05SanRwTlZ6bDM1Nkk4?=
 =?utf-8?B?cUFXYlhKTGc3RGJrVWxzb0RIYnRhVEJad2l0OHI1RHZmbmpSUTdlWTFYY0JU?=
 =?utf-8?Q?fGlR28BlQVpxkYxf0awVnNRxvvhixuSwFsogUnh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b95160bb-c712-43d0-186c-08d8cdc4bbaa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 13:06:52.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5sBHzrilC7q1zaUA/kWFlQkcDopaHD9m/RQmV+zeu90PLwDzzU1R4XuVlAXJGopZPlXWa/cdxkEKT8hinOXND8QHnto9/osaEQKp5vRqwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 10/02/2021 08:37, Jan Beulich wrote:
> On 09.02.2021 18:39, Andrew Cooper wrote:
>> On 09/02/2021 17:17, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
>>>> On 09.02.2021 16:33, Andrew Cooper wrote:
>>>>> The original limit provided wasn't accurate.  Blobs are in fact rather larger.
>>>>>
>>>>> Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>>>> @@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
>>>>>  #define F15H_MPB_MAX_SIZE 4096
>>>>>  #define F16H_MPB_MAX_SIZE 3458
>>>>>  #define F17H_MPB_MAX_SIZE 3200
>>>>> -#define F19H_MPB_MAX_SIZE 4800
>>>>> +#define F19H_MPB_MAX_SIZE 5568
>>>> How certain is it that there's not going to be another increase?
>>>> And in comparison, how bad would it be if we pulled this upper
>>>> limit to something that's at least slightly less of an "odd"
>>>> number, e.g. 0x1800, and thus provide some headroom?
>>> 5568 does seem really an excessively magic number...
>> It reads better in hex - 0x15c0.  It is exactly the header,
>> match/patch-ram, and the digital signature of a fixed algorithm.
> And I realize it's less odd than Fam16's 3458 (0xd82).

This particular value is under investigation.  Firmware packages for
Fam16's have the blob size at 0xd60.

>> Its far simpler than Intel's format which contains multiple embedded
>> blobs, and support for minor platform variations within the same blob.
>>
>> There are a lot of problems with how we do patch verification on AMD
>> right now, but its all a consequence of the header not containing a
>> length field.
>>
>> This number wont change now.  Zen3 processors are out in the world.
> Given history on earlier families, where in some cases sizes
> also vary by model, how can this fact guarantee anything?

There is one example where it changed, and it got shorter.  Making it
larger would involve someone re-laying out the core so more silicon area
could be used for patch ram space, which is increasingly unlikely with
newer models in the same family.

When 4.16 comes, I do have plans to try and make us more robust to
changes in debug builds, particularly given the lack of suitable
documentation on the matter.

~Andrew

