Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0467C2E1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 03:40:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484672.751379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKsBE-0000rO-Cg; Thu, 26 Jan 2023 02:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484672.751379; Thu, 26 Jan 2023 02:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKsBE-0000pC-9r; Thu, 26 Jan 2023 02:40:00 +0000
Received: by outflank-mailman (input) for mailman id 484672;
 Thu, 26 Jan 2023 02:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqmz=5X=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKsBC-0000p6-Hw
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 02:39:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6ba8fe6-9d22-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 03:39:55 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 02:39:51 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 02:39:51 +0000
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
X-Inumbo-ID: b6ba8fe6-9d22-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2w39JC6jvvUHlG7MixG3utS857ZREftnT46DK5L6qW0nfLbiGlJ50pkP4ACWWEz+XUalDdFmlimtLXUZ1Ewkv8JHpw7bkEKh1bO0pIagnOioy9WbjgwiFn+VBOmSsbIYMrWaCp09hx0/D34Z8iGTqgipkvuKTwDAmv35TEGz2sDsEd9dOWsoXZCftZKycH5uyt2YYV92SZSt7EgIg6WrnEMCgSSo6WzVgizcr1jjva+oEdoG7qC7qBALSnzeQdiLc5R9+fW1qpp+3oA0jTeLM0Xjm8WKvFHehg0B4s38ZRZaCffgqSET9UxCiFLxoug+qw/kVs/ORDzyto22KO7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMjrBvV4NfmaaAxqSQYzxP3uw/54BY9KnOmHBvTeIlU=;
 b=kBWUhIEr/LmtqbTC6mNWCTaH/j3aCpcSFqgsehn4dMrIvKKN9arl1sT2hMWeD0396HTc2Z5becFGugahrXfrHLg1aHQ8AKojGhwhtSIBv2jZNdy9+Q9stbGarumSDhq+BXoC53ae8tMpcdYvOqvtvy0UwLUoVU7IfuDC7hylPz8b2zUeNJ1eReMzKXhNqY0tnjsXrnxiL0MX6kZ3tB66Kzj5UiiBUiRA4jkQsPSboMBamesDpGsAy7GofaRi0E0NTNuUDBEzYxiKo2ECFPuRVTxX7Hzc/qgfsRw3Z+5QVPe3tV96w8mRlj/yHlLMI9USf5zyAVnp5mJb44cQNTKOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMjrBvV4NfmaaAxqSQYzxP3uw/54BY9KnOmHBvTeIlU=;
 b=LSTViJLa569gRxuWtpYc7YCcs3yiV5ykjZi3E3z6cYnIio9iRDIhQNuui3/60iTnBB5yfvXnIAUOg3rQaKHp0znh+LbTlIBfybeQJ/ijh9kliizxIp3pnkIzazTvOyVquioll34PZuPBQNt4wcwVuKT6r29jHyiug0Z/AJeVuTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <10564f02-1aef-9298-fa26-b5a8aecc4c37@amd.com>
Date: Wed, 25 Jan 2023 18:39:48 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v4 01/10] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-2-vikram.garhwal@amd.com>
 <1294362f-4359-949e-3673-6198a78310be@linaro.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <1294362f-4359-949e-3673-6198a78310be@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH8PR12MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: e5abccd0-d351-4a50-7fe9-08daff469912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T5dkPwsCHqm0lei3T8iT2Tn6ToiV9YkQftIO0JBbu2fLaGUohTgqLZPTnyK2bc4doPYWX9zatt8KeXXPebjXCl7P/+0HWXfesqXvafrh7jorEsuYo7W2a+Vy2sWZZFhKrnQPOLEG36QW0EOOKdoD3acmR08QxIcH/VttR8I9EnwmQEp1Pz1JTi6W5FK7X9ttVmR7wOo7xSa+X68hKOrXp4qffH65B9PShJv3SRwwPyxNNESP8U2Ec6fAzy8d8S/SKDXQRfJtxtYGBm+vr3hjNfknRSavo09PGANR6/fxpHCT+RkMPx/R7UKMJhYpYCYlzqraTFfChois7uEN6f4Im4vcdQMECXSnb1Okr6SLqiNT8m9yjrew6ebhTIDY1iEl912cZL8OmqjpFxb52Jt7dvySsWY1TaB/dgsTm1p/mDpuEic4UcbJIqwXb2SGCoGNfu8g4aK6BLWw06VMYoamKix1ViYMGNzGPStoZ5g+leoPXBqRBHsEf5w+aLaPxzPEabpfx/dgG7L7HtAJ2R/EIAxMzzI/00AOT41vnC9x9CBa9I/t+h4hsyMHaOeb7TINWjiGClRRydXmHpTH9vh2LQoADEpG+1yI8qLqHgLFsK4aTi7ZsnwSirWVMWy7ziyqoaNAu24ORuslqJh7aFveLf1O3pFa7eB3pQPUHHOh/rP8v5flZDSAlLF+PtYuVbLcGCTqymFmUoWx2+YOobraukE+vTB59p/9KT99jLfMK9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199018)(31686004)(6512007)(2616005)(83380400001)(186003)(44832011)(53546011)(36756003)(86362001)(31696002)(66946007)(38100700002)(26005)(41300700001)(6506007)(6666004)(5660300002)(478600001)(7416002)(66476007)(8936002)(2906002)(4326008)(8676002)(66556008)(6486002)(316002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjZ6eSs4eDVueVZqZE96RUg2REhoZllXZ2o1cG1EeDVKZ2NxU2RPY0RsaGtq?=
 =?utf-8?B?b0trdCtGVGVLNWhabFB6dnEvQyttV2E0S1FTSWtRVnZEK1NUVzJNT1BTZDlY?=
 =?utf-8?B?QXFZWExzekhLSWc4OFVTd3JzbWp5Zm9CbXN1Y0pzeUo0ekJWYURtR0F2RXdL?=
 =?utf-8?B?M2I5SVZLRkZ2aHFsTWV4SWNwYWRXbmJBSEhmTXkrbDZtdHpOLzhvdi8zKzJz?=
 =?utf-8?B?d3AyUDU1OWJsWUhSOExHNng5UlRGVEgwZkUyMHAxTjlzeUlDd1hyNUhHM0VV?=
 =?utf-8?B?eTBhQW5ldUMyMlVxcDg4STA5Y2MrZngzVEI4dG5POHV2RjN5QVZjRDdCdTV1?=
 =?utf-8?B?My9PL0JENXVLU3hrZjZBN2VwejZmdGlHbFR1NjVtd3Z4N25iN0lRWWhSR0la?=
 =?utf-8?B?d0pmeE9lU0tyZ1BRRXNUOEVWbjVmREUzZms4YzEvQTlEWVlqYldUL095aWRJ?=
 =?utf-8?B?SWNlZVRUU1JhaGVMSmdqOExCc0I4KzJkOWF3SmpYNVRxK2FabDQxWUxUVkhs?=
 =?utf-8?B?M3haQmx3Y3hycEM2TEJtODZlaWRpMHJmRnRENVh3NFVXbWJzeFNnUnVCSnMy?=
 =?utf-8?B?LzV4czRJUFJScEt1SXRIa3JDTm00azM2K0t3REZQQnFhTEEyMnZ4Y09MdXVw?=
 =?utf-8?B?em53TUNQcG92cnhMbjFKWXRuOFcxbVB6VnVobzdMMCtOcmo3bWNzMUdaOGRa?=
 =?utf-8?B?VnczQlRJZGlaUStvd0xPemhwNHIwajFXcW9vRkMyMGY0SEJ6aVI0WEUxZFhW?=
 =?utf-8?B?SXBqOHlOTHhBVG10bnhId0dYMTB2UHZJdmVsbkZhRzc0VVhyNnZLaUhsd2dJ?=
 =?utf-8?B?andqdTdjUEkyL0VFd1o0OTc4TmFGTU1hUHc4V2Jwd0ZzYXljTXNRYitBdmk4?=
 =?utf-8?B?NEV6WDdQeUNObHlXNzU5Q2pwaFVrUXB5aDVZdVdWWFVEbXI4bUJyR3NuWEpi?=
 =?utf-8?B?SFJ4Y3crTkdHZlZPa3gwRW5GVEsvZUI4OXFUTEZabDdXNnZ0bzFVK1Z4d0t6?=
 =?utf-8?B?dmpqY3RuTjVFbW5QaFdEZEZkWlRSWmxoQVNYK2JxUlNTWVNFQUtJamt6UXdD?=
 =?utf-8?B?VWh0MUJ1YkkrZ1V1SkkxTldkSkZwbXhBOXc2bzNIUnJZbmdEb3huSDdLa0xu?=
 =?utf-8?B?Q3ZuVU5CaU90enJ2L3FuRkh3ME5QYnNhTVB2TC9QRlpjSGJFeTZlSGZlcnZQ?=
 =?utf-8?B?VE9IeEJFaGZhWWRvRHBWNnk2T2hjaENlNy9VM3c5SzhWUWdlZWU4RHVZUGJ2?=
 =?utf-8?B?d2hOVjM4ekNoWWRoUWYxbVR5cFJKQ2ZoSTR6MzJLWDNZNW1pakc4WmJYZkF3?=
 =?utf-8?B?L3NtUFJPdWlrZWxyQlE2aElkU2Z1dzJNWGFIYlBGcDJLQ3ZvTTAyREZUR0hj?=
 =?utf-8?B?RUg1OERNZG8xVUhIYkFSWVpPRk1PcWRQbnA2ellsRGhPVGE1UEhrNGlkRVZM?=
 =?utf-8?B?UGdBWDF6Um0vS3RzMEhkU2tjZ1B4YUQ4M2NKdmMwUWdtTDhEWFVmL2lvdWps?=
 =?utf-8?B?azVQU3d6ZnhjRU4rOGZYeW5XeW03aUM0cG5UUXRyNjR0T1JpaTVWdmpxWFFW?=
 =?utf-8?B?NEEzQlVmRTBJb0U5YXU5UkFUUzE1ZWl5dVFvbURvQitIaUtKVXdVRG5WSE9G?=
 =?utf-8?B?alFTNDRtUWRjK1ljQWEzZW1oV2FtVFpRdWg1L2xBM2hickYxUzAwVkNxUEdy?=
 =?utf-8?B?Y1JJNzBiY3FvT2RMalRzdW4ya2k1ZWZ5cWlMa0thMmFYVWNhMHFRTE5jcTM4?=
 =?utf-8?B?SGYrZ2VQZTNTclhsaHRLRjZER3RkRis3d2VzMklwYmkwbVM3Tll3SFBYTWJD?=
 =?utf-8?B?OWVPUFVoNllJVmFWdStzNW9GTkxhdWUyS0Yxc0dhMVk0azJxOFNPU1NXVmFX?=
 =?utf-8?B?c3l4TEhOTE9XVUR4VjRRMkRUTDZyM1UwRlRpRStzZkQyL3o2VG9kSUdFNzU1?=
 =?utf-8?B?ekovaDlVbUptaUhYWlZmRWxZTk15V3NjcDErY1N4Zy9VTG9XeTVXdjMzMFUz?=
 =?utf-8?B?NE16Qm9DSXVmOHhyWUhGNVdvcDRHRzN5OVFDcmxHQWhTVWtFbkI4QTBxdnhw?=
 =?utf-8?B?VTVCeWV4Tys3TkcrU1hkTndjRDNzWUxRVVNpbHJWL1RobEJFdU1ZVnlGZDRO?=
 =?utf-8?Q?F435p2yKRX0Ku+TrDaraQ3ogb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5abccd0-d351-4a50-7fe9-08daff469912
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:39:50.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR/AWSLeIKb5uAtnGFpnVJCpUY5cMRDSFrB4bTf2GIfcbHbizG2xlursIqHS2kSofkJfhyH1lL/7F7srMfQdDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302

Hi Philippe,

On 1/25/23 2:59 PM, Philippe Mathieu-Daudé wrote:
> On 25/1/23 09:53, Vikram Garhwal wrote:
>> xen-mapcache.c contains common functions which can be used for 
>> enabling Xen on
>> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen 
>> to make it
>> accessible for both aarch64 and x86.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>   hw/i386/meson.build              | 1 +
>>   hw/i386/xen/meson.build          | 1 -
>>   hw/i386/xen/trace-events         | 5 -----
>>   hw/xen/meson.build               | 4 ++++
>>   hw/xen/trace-events              | 5 +++++
>>   hw/{i386 => }/xen/xen-mapcache.c | 0
>>   6 files changed, 10 insertions(+), 6 deletions(-)
>>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
>>
>> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
>> index 213e2e82b3..cfdbfdcbcb 100644
>> --- a/hw/i386/meson.build
>> +++ b/hw/i386/meson.build
>> @@ -33,5 +33,6 @@ subdir('kvm')
>>   subdir('xen')
>>     i386_ss.add_all(xenpv_ss)
>> +i386_ss.add_all(xen_ss)
>>     hw_arch += {'i386': i386_ss}
>> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
>> index be84130300..2fcc46e6ca 100644
>> --- a/hw/i386/xen/meson.build
>> +++ b/hw/i386/xen/meson.build
>> @@ -1,6 +1,5 @@
>>   i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>>     'xen-hvm.c',
>> -  'xen-mapcache.c',
>>     'xen_apic.c',
>>     'xen_platform.c',
>>     'xen_pvdevice.c',
>> diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
>> index 5d6be61090..a0c89d91c4 100644
>> --- a/hw/i386/xen/trace-events
>> +++ b/hw/i386/xen/trace-events
>> @@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) 
>> "id: %u addr: %p"
>>   cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, 
>> uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u 
>> data=0x%x"
>>   cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, 
>> uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u 
>> data=0x%x"
>>   -# xen-mapcache.c
>> -xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
>> -xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
>> -xen_map_cache_return(void* ptr) "%p"
>> -
>> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
>> index ae0ace3046..19d0637c46 100644
>> --- a/hw/xen/meson.build
>> +++ b/hw/xen/meson.build
>> @@ -22,3 +22,7 @@ else
>>   endif
>>     specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: 
>> xen_specific_ss)
>> +
>> +xen_ss = ss.source_set()
>> +
>> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
>
> Can't we add it to softmmu_ss directly?
>
I tried adding this in softmmu_ss as per your comment in v2. But it 
fails with following error:
//mnt/qemu_ioreq_upstream/include/sysemu/xen-mapcache.h:16:8: error: 
attempt to use poisoned "CONFIG_XEN"//
// #ifdef CONFIG_XEN//
//        ^//
//../hw/xen/xen-mapcache.c:106:6: error: redefinition of 
'xen_map_cache_init'//
/

/ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)/

I couldn't fix it in easy way.

>> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
>> index 3da3fd8348..2c8f238f42 100644
>> --- a/hw/xen/trace-events
>> +++ b/hw/xen/trace-events
>> @@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
>>   xs_node_vscanf(char *path, char *value) "%s %s"
>>   xs_node_watch(char *path) "%s"
>>   xs_node_unwatch(char *path) "%s"
>> +
>> +# xen-mapcache.c
>> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
>> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
>> +xen_map_cache_return(void* ptr) "%p"
>> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
>> similarity index 100%
>> rename from hw/i386/xen/xen-mapcache.c
>> rename to hw/xen/xen-mapcache.c
>

