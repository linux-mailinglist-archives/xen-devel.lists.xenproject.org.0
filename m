Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B85675C73
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:09:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482060.747374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvos-0002I7-27; Fri, 20 Jan 2023 18:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482060.747374; Fri, 20 Jan 2023 18:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvor-0002Ej-V5; Fri, 20 Jan 2023 18:08:53 +0000
Received: by outflank-mailman (input) for mailman id 482060;
 Fri, 20 Jan 2023 18:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FRq8=5R=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pIvoq-0002Ed-Ub
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:08:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d35dee3-98ed-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 19:08:50 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 18:08:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 18:08:46 +0000
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
X-Inumbo-ID: 7d35dee3-98ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuQdh/d+a00Kiwg2mCfX+3rqeuvsdqRFw6hMByqVEmkwR8gKBqsqDik6+Pfac82w/9musBAGTQbQ7aSNwym0WYGdfbB5wCS9fZ7RlRkh1qChRisIXozUwq6/QFSs/litvXeKmrAbw4zDfhjQx5llkN3N4S1e4o5mNXEpVrkbKj7VSiaWxisrPYtfJ6wCq01AXSpmgVGeflDxbt90jEdGolYAy4PNuPGZpEPw1Ks3MfNRxFLYqMudKeEdRnDxfGf2/Oh1yRX8m8nOPVaCDNwMkuGunkfuaDq6UGhYLJYOSo9wNV9ig89SkUOScq+oKNxY4giNOhdEwVBr1Dy/f2e1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQz9gMjcOkGcuQ/koF8QTlZfzLivqZ8CKaD0vRGtav0=;
 b=CtPordPcsGkIfQOhSkNc5AT7wmwRMOqafPvr4S89oU7q3gr88bK8nTE4VFKBSwufXuodzCgDrijaYDfuXMgKx1pDuMdjjT9RkrkUkmxUT+GVufbZD/C+ld2XEwQf1a9ILR0oHblMZUgS17iz4ws6FKGrsPMm1PcNaLk26H69IYjfzLvO0+xKD4JqBnNBT3IcmYBGgXupC6nnrAr38rg88BNflLW2kKhdd3JfLo4iFAvS4w1dPhTubsJ0kP95e74HmIvdCgsL8zIboy82RXAwxonMTXPHQTM7gjiCWBaPGwR5srsjn/lb5BabO7D08FcHLDHnWYBthKjM2E9/1psuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQz9gMjcOkGcuQ/koF8QTlZfzLivqZ8CKaD0vRGtav0=;
 b=IRaBfJcmxj0Eai5/SvgmJNBGZ5p8+jJXc0w6qbdk6UnUGPZILkkwMlHpoIKFn56RS0NL6k8dEfVE14Bl2UIytTZ2z4QIgVyB2W6GMuHzqutwf9GkYBtkP3GLSCjl3tZNKen2U1aLP44cv2layoPCuAXdhtpprd1CnnUnWNughr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0a7d3da6-efe7-2cf1-563a-3c5c2ec473b2@amd.com>
Date: Fri, 20 Jan 2023 18:08:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
 <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
 <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org>
 <2017e0d4-dd02-e81d-99f4-1ef47fc9e774@amd.com>
 <42b138a6-59f5-7614-d96f-30e1784c97a4@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <42b138a6-59f5-7614-d96f-30e1784c97a4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: af1274c1-ecbe-4e67-06d7-08dafb115f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGEBXxqnN//23OUogZvd2rDbLu4l4MxXRDEr66T5LRGYluqlfVU5hocbh5wVasbp0BO2WwXTkGZbrviblmyjdF55nE70blK8w37FjojlAW9Z2OJmIjjKe6H3jNeBqerp8x2qULbAq+s/Fd06Ismzrq/gAUDtRhWVr1si/QKaQXDWoiWjZyIZo1QAfTrF1fCXD6VHo+JhDjkhcUhtcXZ+0vXjthRKMoM75jGswvLoIcywo9QaV1z4XsGrtkNc/0XgdY2QdlSBpGSpwPACdspgsn97nb+fMR8vZ4H1gIbcvqyYhNb9eutr2+BJAHtm9vw3K20+EN70ssfvJ1MqeeAXRf79a+sfx7Zb8w0QOBFW6Q//dMZFdA77NKIRvKhm68OjlrvrRH1x6T2AsWS5NaXPO1SNB9g5WrF+odrbrMBPJR6S+fP1UhkdtFbnL1zoJpLIExEByLa43+qJcAYYi01LfMiEQIXk/XEVg+gYc1R+k/jnTF09BYSolz0oCir8d6Jlh9rwfOyJ0u/24aafxksJfdunR/nt/+h0xuln+IpZIEJSMWkv/202aWCj3cEjXfBCqZvjBWSW3kxFZRXvgIdwmBeCcCoVzVdZCZKFcZZX1XqmorS34NR5O5K9H+fPp50O18Dgo4ly+WraY1U1YN8SnEcltnIhbuSfU4iaC2qNOMREOINep34KmTVZc3qS8m02XXiKjufRen+1XP1i9g7SZhLRXFKpnBAuHTz64fdfxOUDArDlfGeDZeKHCjg27jmD043tmKrjXu1ysLvQqY/k/Lwi9jzKp1VubViS08bNHvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(5660300002)(8936002)(31686004)(4326008)(66476007)(66556008)(66946007)(8676002)(38100700002)(53546011)(31696002)(6666004)(6506007)(6636002)(186003)(2906002)(110136005)(26005)(6512007)(966005)(6486002)(36756003)(478600001)(316002)(2616005)(83380400001)(41300700001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FKMC9RYUhPYmxPMUdnWHc1MHdmSTFNckJKbG1GN3NMK1pKM3JLRjBNck1R?=
 =?utf-8?B?SlpPYnlCY1FFaldLbUpSNm9GenRSSFRTb3RRZnVsY1h3ektONnY1OHdhZTNI?=
 =?utf-8?B?TmVZQVh2NWVLNzBsQ096Y2grSDZyNGpvMDhyOUdjQjllYzVjOFFvSUY0aVlh?=
 =?utf-8?B?cjhCS1dKRGFIODF4czN1d1cyN2w1dytnclpoRTQ4Umg0QlI0MVVJS3RQS3Rw?=
 =?utf-8?B?SlNKNjZRRVcwb0R4VmdtWEtaeDNUTVZmY1Z6VTArSTVINGpJZ1M3WkU4UU5s?=
 =?utf-8?B?WUNrU2tOMkxONXRDMkl4TDUvRWJ5emRrM1FCb3RQandhVE9GczcxTXU1TGhX?=
 =?utf-8?B?Y2hGblkvMGtJZzlJbGhEYnQ0algzNnFGemtnclFMb21zWWZWY1RaSHJJZ2J0?=
 =?utf-8?B?UDArWGJOUFo1aWYwZ1NwSDZaclp6YzJ0RWVubG5JVm9MY21aNGFsT2FxMTIv?=
 =?utf-8?B?Y0RGeEEvRVh6bHdXNXBlQ0t6K2NLTzhpOTU2OHljdXBwZncwcVFDYUdYSWlS?=
 =?utf-8?B?c2d3YW9oeldlbmhiekZrZGg4N3V5OElFR055ZG1vbHhVSklBMkxHdFlkNWtm?=
 =?utf-8?B?SE9KQ1lNU0o2TFRvMUFyUEFrYURoOGZ1TElGMlQ1U3VBV09ILzk0NzRMeUJH?=
 =?utf-8?B?YS9UaFBQV3pKKzVtQlBnSTVNZG9sNWlzbXhORUtURVJiU1A4amZkaWRNK1dU?=
 =?utf-8?B?amxWWnNYdk15czhmb3RnZVVIemFXcDJHM3FnTkUzamdoMS9IRzhFN3Y4eFlG?=
 =?utf-8?B?RDJVSTh1WTQ1Q0tpUUt6dGFwcGw2UiszSUxWMjRRU3F3cXdkYVB4QUlMUDdS?=
 =?utf-8?B?cXpabkRJbDJMa3JwdFR4eWFSenpualpHZ2VmNDRwMkxxTUpjVllyRC9uODBY?=
 =?utf-8?B?cHN3dUtBZFdBZmVUUDM0RTFHMHdMNUo2VFcxOWhQWVFzaVdEeGhHSVZUbkMw?=
 =?utf-8?B?WW9hUVZXRXdvdHV4Z1JQRTNIZGp1ZVpRN0hjcTdkLzM3N1NUaTBwYXgyVTh4?=
 =?utf-8?B?N1FVNG9yUzNIQ2NRYUlQYUNkT0l2R3hTYkIwVjRaZDM4UmdHLzNubk0xdUQy?=
 =?utf-8?B?YzVqZXJleWV1YmQ5Q3VSSERBVUVuV2tBWml3cXpDWjJ4TUovREVqTldBNGdB?=
 =?utf-8?B?aHIxM0lENUNCQkNLZmgrcFJmS1FTdFR1NFJCaldKa0gvK2xva09uWE02MGtE?=
 =?utf-8?B?Q3J4N3dLMUx0MzkrWTk2SkpQdllBbTZEWWZGUEhWQmJHajVDMW8zdFZCU0FI?=
 =?utf-8?B?QTlMeXBmdGVuN09UbjdXSEgyWUVrc01QY3QzM0JzbmVYRTJSZGpqNldQMFVS?=
 =?utf-8?B?LzBnZEREWVFpMm95YldDMGNRU3k5cFlQaHpzUWJ5VVJMaTVBVjVlMkVLNENv?=
 =?utf-8?B?WmQwYmZnbEhCR3lHbmFwNHVBdTB5Nm02aDBiUTRqcUNVSjF3ZGJwRExyT3BE?=
 =?utf-8?B?c3FMQkozNFE0QWZoS09pMCtnakVRMGxKTHptZThDU3VrMGhTWmRRcUlyUm1N?=
 =?utf-8?B?YS80N05WMWZob2ZuYzY4THZ6K05EMHBWN0FiV09HT1ZXcThQVFZOSG5qWVpB?=
 =?utf-8?B?UENORi96MnVpSVFHUzZHYTFYcm9ZdkRzVEVJSDJvMktvcVRtcHdJZng3a1lO?=
 =?utf-8?B?QmVUaE9zNE0wUzRRbmVaVnJPNHNLYXY0SmY0MVZWMC9WQnA4UEdDUkJFRzZZ?=
 =?utf-8?B?ZVhLRGhoaUkzUndBK3RDL1RDb29ZRVV0ZXE2UzAvY0E0enZyM1hrWWNCWStH?=
 =?utf-8?B?cHZkR3A2c0ZRVkx2QlNFaVQzcHdWRWMyVWx1eFk0bGxzWkRJYlB4T0daU0xk?=
 =?utf-8?B?QlNZeUxVOXhhYU9zRFdibGZjMUU3ZjExdnI4SExWS1VORjlOTHQxTEdoR1F4?=
 =?utf-8?B?Wmk4anQwcmhaRkg5QWF3YkdMZzBPYWpHeUJPWjRFVmRYbUo3dW1ld2FDcC80?=
 =?utf-8?B?dUFzRHBqWS8vV2EzU2daOVc4RWsraE9CeU9JYnFINjhnQzNiYndTQWJYc1NP?=
 =?utf-8?B?d0REelVkY1VaOWpZRk1xTlVIWHNDY2Mzdm0zaVVFajFaV1ZsWEllaDNtdmFC?=
 =?utf-8?B?empDS2J4OVlLR01tc0xTQkVtQmUwaFNvN3ZDT0xlWmI2anF3bmpmak9TUlNR?=
 =?utf-8?Q?vKygsXgT/TtBTyCHTnUUyhXIN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1274c1-ecbe-4e67-06d7-08dafb115f8d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 18:08:46.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKDK39wuGRuneaL1cBq4cXiaUJ/4efI/9NsEapZcV2UW5V+8PbWf4XnUqD2r1afWfhtbZW6YOzKhqVBtc/DuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117

Hi Julien/Michal,

On 20/01/2023 17:49, Julien Grall wrote:
>
>
> On 20/01/2023 16:03, Michal Orzel wrote:
>> Hi Julien,
>
> Hi Michal,
>
>>
>> On 20/01/2023 16:09, Julien Grall wrote:
>>>
>>>
>>> On 20/01/2023 14:40, Michal Orzel wrote:
>>>> Hello,
>>>
>>> Hi,
>>>
>>>>
>>>> On 20/01/2023 10:32, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 19/01/2023 22:54, Stefano Stabellini wrote:
>>>>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>>>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>>>>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The 
>>>>>>> current
>>>>>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a 
>>>>>>> physical
>>>>>>> address.
>>>>>>>
>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>
>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>
>>>>>
>>>>> I have committed the patch.
>>>> The CI test jobs (static-mem) failed on this patch:
>>>> https://gitlab.com/xen-project/xen/-/pipelines/752911309
>>>
>>> Thanks for the report.
>>>
>>>>
>>>> I took a look at it and this is because in the test script we
>>>> try to find a node whose unit-address does not have leading zeroes.
>>>> However, after this patch, we switched to PRIpaddr which is defined 
>>>> as 016lx/016llx and
>>>> we end up creating nodes like:
>>>>
>>>> memory@0000000050000000
>>>>
>>>> instead of:
>>>>
>>>> memory@60000000
>>>>
>>>> We could modify the script,
>>>
>>> TBH, I think it was a mistake for the script to rely on how Xen 
>>> describe
>>> the memory banks in the Device-Tree.
>>>
>>> For instance, from my understanding, it would be valid for Xen to 
>>> create
>>> a single node for all the banks or even omitting the unit-address if
>>> there is only one bank.
>>>
>>>> but do we really want to create nodes
>>>> with leading zeroes? The dt spec does not mention it, although [1]
>>>> specifies that the Linux convention is not to have leading zeroes.
>>>
>>> Reading through the spec in [2], it suggested the current naming is
>>> fine. That said the example match the Linux convention (I guess that's
>>> not surprising...).
>>>
>>> I am open to remove the leading. However, I think the CI also needs to
>>> be updated (see above why).
>> Yes, the CI needs to be updated as well.
>
> Can either you or Ayan look at it?

Does this change match the expectation ?

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh 
b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 2b59346fdc..9f5e700f0e 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -20,7 +20,7 @@ if [[ "${test_variant}" == "static-mem" ]]; then
      domu_size="10000000"
      passed="${test_variant} test passed"
      domU_check="
-current=\$(hexdump -e '16/1 \"%02x\"' 
/proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
+current=\$(hexdump -e '16/1 \"%02x\"' 
/proc/device-tree/memory@$[0-9]*/reg 2>/dev/null)
  expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
  if [[ \"\${expected}\" == \"\${current}\" ]]; then
         echo \"${passed}\"

>
>> I'm in favor of removing leading zeroes because this is what Xen uses 
>> in all
>> the other places when creating nodes (or copying them from the host 
>> dtb) including xl
>> when creating dtb for domUs. Having a mismatch may be confusing and 
>> having a unit-address
>> with leading zeroes looks unusual.
>
> I decided to revert the patch mainly because it will be easier to 
> review the fix if it is folded in this patch.
>
> I would consider to create a wrapper on top of fdt_begin_node() that 
> will take the name of the node and the unit. Something like:
>
> /* XXX: Explain why the wrapper is needed */
> static void domain_fdt_begin_node(void *fdt, const char *name, 
> uint64_t unit)
> {
>    char buf[X];
>
>    snprintf(buf, sizeof(buf), "%s@%"PRIx64, ...);
>    /* XXX check the return of snprintf() */
>
>
>    return fdt_begin_node(buf);
> }
>
> X would be a value that is large enough to accommodate the existing name.
>
> The reason I don't suggest a new PRI* is because I can't think of a 
> name that is short and descriptive enough to understand the different 
> with the existing PRIpaddr.

Looks fine to me. I can incorporate the change in this existing patch.

- Ayan

>
> Cheers,
>

