Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D864557D6C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 16:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355038.582468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4NNC-0002lV-Ag; Thu, 23 Jun 2022 13:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355038.582468; Thu, 23 Jun 2022 13:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4NNC-0002iZ-7U; Thu, 23 Jun 2022 13:59:54 +0000
Received: by outflank-mailman (input) for mailman id 355038;
 Thu, 23 Jun 2022 13:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyAp=W6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o4NNB-0002iT-MA
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:59:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfff18b7-f2fc-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 15:59:51 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB5016.namprd12.prod.outlook.com (2603:10b6:a03:1c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 13:59:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 13:59:49 +0000
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
X-Inumbo-ID: bfff18b7-f2fc-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN6la/mCoowuHpRJqrZVK6d7Pg9CxGu3lb2ceoGgDa/poIzbKgVK0kPjRoKlPqxQ3o9j4bh3wNnKCdzXQyyHNAyzl2JuvxTjVywWncNtSXgiRmujHfwQSAS7Z9PaBEY/T9DogCb0bZ1M2De0WSR6piwaHmrXaBDft70ANSIz+SKRXv7ehU+H1e0sPS+YJ/Pl/38DuinssKRpXboRQYNQwj7TJPgYb9zGp7ZMSmCzqyb8hyun3vKgM735vdi/6f72a+cPi4LglyyIlkTn1uWFcggXs97j4BQDe0DUtncUaxufdk554roEd1y4UOOlwd5pfsNom7FXhlJAynFX8p9T5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irgGec9J5jV8MZAKDoUKDvKV/B3cNRwReIAzNSHrDR0=;
 b=YOq7O4MW5i6TRqgotq1qJhZRRt5wRTBUbmVF9RIAkIp1UVB4K6p8/UG8Bl8kFM2TtYyQ4gwQyFEAYMKLfnhq00FxgxW53VUGAZANsONjEvKK1sDQ9ui8nOIwUMCPvqfbRdZrtjZQ0L3dxhFBsyGLAUYIMTyCE4iviXS+5pJF5JUUJ3/XARoBInxOhAwxpGCLg0x33WRghjyMigyq1SzOHczYSKplgdUObOSHzJOJ+xMlLp3sh781qAH+1Jg45uFlFA/c1oPxpGDvTQtMhpwNWRaSX7lfOn+0n797tJ0y0B0VPYDFHgdeYz3Wm8jXZRW80aMLpiw8CGudPNhw3Zv7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irgGec9J5jV8MZAKDoUKDvKV/B3cNRwReIAzNSHrDR0=;
 b=T5L6owDWb4T5g9KF1zPonreJfRJaMko1280unk7I/6LnktjabgcZvFe/kDudskl30CiL4IKVhekPXXVF30zHZM2K/FJHWX84F9cHKMta/eWHTdSM1tcu1TOi8tEY+mqRT5umPwFmSwTN4ud6w8OrMcz5SHBphhTdEclHwKpQAx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f2add6f9-1573-5236-84ac-4db1ade60ce6@amd.com>
Date: Thu, 23 Jun 2022 14:59:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Viryaos-discuss] [ImageBuilder] [PATCH 2/2] uboot-script-gen:
 Enable direct mapping of statically allocated memory
To: xenia <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220619124316.378365-1-burzalodowa@gmail.com>
 <20220619124316.378365-2-burzalodowa@gmail.com>
 <5cd7ee29-d43a-1302-0a0b-6b4c339a96da@amd.com>
 <797bf441-9d7a-7eb8-4e90-787398acf726@amd.com>
 <96c919fe-dba1-d1c4-10e9-b73800f96cea@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <96c919fe-dba1-d1c4-10e9-b73800f96cea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b9406a3-f43e-407b-f552-08da5520a2ea
X-MS-TrafficTypeDiagnostic: BY5PR12MB5016:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR12MB50168CB513AE4EDEA8972658BCB59@BY5PR12MB5016.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5ejbuBV6yPJSY6XoKJYyjNKLAsOK1ukdmqGvg4i7DaHSc3q6Uv6SRx1+yBXBUxzNc+EslBE8STwFRmv4E8IeSVCoD/olp13u950M2TvYgkUXR1Q9tlk4Tccw6bonl+BSyLUh5AZvFtwoLrUfWVYmuX6Fi/0yUJrK5qN96cSsrR/8hk3b1CWQEwSy3hZ11/v9HdBjHZ2xd1IW9KzLLZHx5Ka1zEZKhIHq70mPgkjKJe5rbY8OysIhTj2mgT41QP+FTe2GxrtWz/Og9cn31Ycw6UiqeqVCEWCqgdWvZQmbcJYBPTNaSkARUzEyfOTViWkUqZzxkqQGsJEqqsKmsmvpfJQtKfFlL/up6UB7ZwojrsYJUIxoZA+S3oB6qyCCETYzn8SEqVSbE4eh1TfOQDdhN4UA9ZJXjiwPxWFKWgKnjYjAC90+TLhPMA6RjfmVUZLSbQNmta2TsIDPFHe/7fDdyAoQoLLHDFCrvHF0UN79rym00IK13pXo81CoW3j0V/+o3ZTIOlc4v6QRmaiqhNxSEJyvDJNjdJhpBtt9VLAx9pCDVC0avEhz5l+kSzHC1zVCQYGmtNLgdGUp5ohlvWYKkfNoz6ZgMt9Dgm31lYS600HK5TqJJ5REnlzl5OFOkGNqZSaKGe+aaNilqnGT4W9FZzIMF9EgIwpQDVU+BVbxQ+C6yGG13i0afarSe2Vr/Fn3VtI99L0MT8hiGh9hirdEOvPKI3YpNY/jqkuXpkpf1qExFXI6Zj3E+QQV/Qr+LWTsLO1YHrx1WvCRvmb+S9rE330iFizgfESi4Ev5DO+SKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(41300700001)(186003)(6512007)(2616005)(6506007)(83380400001)(26005)(6666004)(31686004)(36756003)(53546011)(38100700002)(478600001)(5660300002)(2906002)(6486002)(66476007)(66946007)(66556008)(4326008)(8676002)(8936002)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ViQXRydFZETW9jdVkyaXYwZ2ROVFN0QVRnOXpET2RwUVk5aGFLb0J3Tk5G?=
 =?utf-8?B?N3NVNWliZkN0d0FEWjM2QTQ2RTBUcmJyakk5dDVCZDlBS2RXR1lCQmdUQUpD?=
 =?utf-8?B?Szh2ek5zdzBsdSt5NzhabmMzMjczZFFkOThXVWNoRGJ6cE5sMnhreFhUcTJO?=
 =?utf-8?B?cTF0eXhvaVYzVnFCdFM5V0czYlZjaVoxUFYvMm84Z1RIUWorT2xvODVnMGo1?=
 =?utf-8?B?UTRteU9ZellRNW4zS2cwcFN4ekhtV3VEMzdwOVBkb2ZRZlJVa0ZVT1dZY3oy?=
 =?utf-8?B?b2UrNENqM21LTi8yL1dWNkJoc2xDbWt0ODRHU3c3WXNLME9KZzY4Y0lkZjd6?=
 =?utf-8?B?dTVneFRVK0xGVHY0YUhDcWFaUkNlNWM0Nm9qZmRucWhDeTViK0NTSG03VWlD?=
 =?utf-8?B?UGl4R0RZZExzQU5SMCtib0QxeWVDdzlnK015bTNlYzFPUFlRSWNJVmZQQ21p?=
 =?utf-8?B?Zkk5Z3BVRUFXWGxPTEQ2ZmJBQTlnVlc1MFpiQXVzbm5YQUUzbzVBeWVKMVQ0?=
 =?utf-8?B?UjlVWDBjaGZrRFkwb0xHUWJteUtqQzY4SHN5ZDlhcGUvQzh3UlR3enhkU2dl?=
 =?utf-8?B?Z00rYzB1ZWRuVGJnbkRpaUZ0L0hJRG1BbU9qYjVGVDFCdTR1MWc0QmhaTThD?=
 =?utf-8?B?SWRzdGlieGlYMElXa3lCVHdRb3p4U0FRRTZYaXZ6Zk1LMm9hQlpVTlhCUjRG?=
 =?utf-8?B?S0tmNHlsc0ZWVlRKek5YZFZqYTl3Sm9Xc3BPVElNK1JNMTBsQnJuMW5QMTg1?=
 =?utf-8?B?UUREb0lrNlNpa3YxNFpSc2dxQWRSc3VBQXFKekNjYW10OHZBbFdWNzFjeWRz?=
 =?utf-8?B?SmsxU1FRSk9QekVQbHhVT3EvRjJNOW1yald0WGFHZVBCUHpxbnN0RXpYcVFx?=
 =?utf-8?B?SEZqd2JFeVZKSmxSZnRMSmpocCtOQlBLV3Y3UG9RSFRIazVqeXhkcnhGbHZa?=
 =?utf-8?B?eUZ2MEtoaGY2a2RoR2dSMWtDVSthWWhPcUgzUFg5YklPOHM3RnIwYUI0U0Ns?=
 =?utf-8?B?czRDT1VyUko0VjFYak1Pd1d4eHVYcTNma1ZyUk9tZmU5cUhIWmtNZHRoakZ6?=
 =?utf-8?B?QUVJeHV0clp1cVdsaWVFU1RjOU5aZStDNTBpdmltVUVJclBCUTRuYWl5bVNm?=
 =?utf-8?B?RXEyV1lSUUhsNEsvSEsyaDJudXNpNzg3NXhmTnVTMUZuZElBTGFSTHJGdTBj?=
 =?utf-8?B?WWxVdy9odUM2cW5obnBobEpTMjZXcGE5NGtNbVUyRktIU1VGV0lRYzlmRW1z?=
 =?utf-8?B?TmwvVzlMZzlad0l5eW9tYWZ2dGYwQXVqT3loaTF2RnVHZHMyMCtrQmdaZlNj?=
 =?utf-8?B?Rk1meVJEbXMzcFhHK2JFR0czTXdxSUllUGRNVlducE4vWEV5RUlqaXJYNTI2?=
 =?utf-8?B?MVBYSlpSVUcrbDhYc1liU043K0pXTFJ2SlAxU0lrMWdWK2tPS0VvT0Zna21n?=
 =?utf-8?B?RVJ0YUh0blpYaElPcFJyOUVBVXYvMkxBdlJQaEVOVFowZHpHU3pyNWtzZjdx?=
 =?utf-8?B?SFVodVlxVUsvZk4vR1ZFYjgyYklNeTBJaFNQbFdlaHA2a0FudFJ5M1hNL21p?=
 =?utf-8?B?TXlTQ1NDM3ZkN3A1ZjJHUG1Jc1F0VFMxN0pWWHFhNll4bHFvcm42U3ExNTFp?=
 =?utf-8?B?S1FmNVFvL3hrZGUyd3hGdUptYWRNVWdOd1c2Ti92ak44Z243MTNpdS91dTQ5?=
 =?utf-8?B?dGhOMnV4L1RWVlRLR0w5c1dCWHFMeW0zaEtEaG8xRFYycGxtVmh2WnpFVTkr?=
 =?utf-8?B?R0FDQ29yRkxpQWozZWdNTzhjMkd4RXN4RjRLNlJzcmMvM2xzNGQyMHJUVE1D?=
 =?utf-8?B?dFZuUllIUDhZaXBzcmVJY3JEalpwai9FWTRzVzdGZ0VxenRlYnRNTEF5NTVw?=
 =?utf-8?B?Zit6T0JOMEtzM0V1UFVWM3RuckpGN0lJZkY0ZDIza1hpUlFSb1BNeVVCaG12?=
 =?utf-8?B?NVhqSUtmQUlvUVlvUThZYnYrbEZFVE9TNkMvZnpMMURmaklOSTRQck1SNmo0?=
 =?utf-8?B?Z0JmNFNrREVnM3RlQjV0cDUvVU1UeWhvVmVFbXY2Q0dVRlZvWmIvTUJjVU0z?=
 =?utf-8?B?Um1jckRtM2pEMy8xd1EveTNsYStjcW1MNjNTcVNJMXhub0kxTlJKMTVDY2pj?=
 =?utf-8?B?OUIwbTRJWDg2emw5OU9lTWFaa2hvaktiN3ZGdHVFK1NnU0t5TnZXNWNNc0Nx?=
 =?utf-8?B?b0RKWGJRR2V0SzFmQ3FYSVlKemlhMTgxcGlseklsalJnWHJXcmhjS3Ayalhj?=
 =?utf-8?B?N0J3S2N6SERsZUloVFRpaUQwNEt4cTRaZ092dFd1VU1pcWlzM0l2c205Sy9N?=
 =?utf-8?B?ZFVDMXVlbkMzTnkrYzdLczRhRmhVZm9ldXRlYjNXSkt6SHIyeXVwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9406a3-f43e-407b-f552-08da5520a2ea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 13:59:48.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCNeqTyrI4IZqP6yajMZPCzoRcnQFX8yuaEVa8GA0lzTejBkZAnnTKw5w+W1TdboXuJPi8AOR42L9S+VIdQ3eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5016


On 23/06/2022 13:05, xenia wrote:
> Hi Ayan!
Hi Xenia,
>
> On 6/23/22 13:02, Ayan Kumar Halder wrote:
>> (Resending mail, as the previous delivery failed)
>>
>> On 21/06/2022 12:34, Ayan Kumar Halder wrote:
>>> Hi,
>>>
>>> On 19/06/2022 13:43, Xenia Ragiadakou wrote:
>>>> Direct mapping for dom0less VMs is disabled by default in XEN and 
>>>> can be
>>>> enabled through the 'direct-map' property.
>>>> Add a new config parameter DOMU_DIRECT_MAP to be able to enable or 
>>>> disable
>>>> direct mapping, i.e set to 1 for enabling and to 0 for disabling.
>>>> This parameter is optional. Direct mapping is enabled by default 
>>>> for all
>>>> dom0less VMs with static allocation.
>>>>
>>>> The property 'direct-map' is a boolean property. Boolean properties 
>>>> are true
>>>> if present and false if missing.
>>>> Add a new data_type 'bool' in function dt_set() to setup a boolean 
>>>> property.
>>>>
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> ---
>>>>   README.md                |  4 ++++
>>>>   scripts/uboot-script-gen | 18 ++++++++++++++++++
>>>>   2 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/README.md b/README.md
>>>> index c52e4b9..17ff206 100644
>>>> --- a/README.md
>>>> +++ b/README.md
>>>> @@ -168,6 +168,10 @@ Where:
>>>>     if specified, indicates the host physical address regions
>>>>     [baseaddr, baseaddr + size) to be reserved to the VM for static 
>>>> allocation.
>>>>   +- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>>>> +  If set to 1, the VM is direct mapped. The default is 1.
>>>> +  This is only applicable when DOMU_STATIC_MEM is specified.
>>>
>>> Can't we just use $DOMU_STATIC_MEM to set "direct-map" in dts ?
>>>
>>> Is there a valid use-case for static allocation without direct 
>>> mapping ? Sorry, it is not very clear to me.
>>>
> Thank you for taking the time to review the patch!
>
> I agree with you that static allocation without direct mapping is not 
> a common configuration, that's why, in the script, direct mapping is 
> enabled by default.
>
> My reasoning was that, since direct mapping is not enabled by default 
> in XEN for all domUs with static allocation but instead requires the 
> 'direct-map' property to be present in the domU dt node, then such a 
> configuration is still valid.
> I thought that with this parameter it is much easier to setup (and 
> test) both configurations.

Thanks for the explanation. This makes sense to me. :)

In this case, can we remove the below snippet from your patch.

+        if test -z "${DOMU_DIRECT_MAP[$i]}"
+        then
+ DOMU_DIRECT_MAP[$i]=1
+        fi

The reason being if the user wants to set 'direct-map' prop in dts, then 
the user can specify it in the config.
Else, (by default) the direct-map will be set to false. This is inline 
with XEN's behavior as you described above.

- Ayan

- Ayan

>
>
> Xenia
>

