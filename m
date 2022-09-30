Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C97F5F0C2E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 15:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414221.658391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFk9-0006Ln-ML; Fri, 30 Sep 2022 13:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414221.658391; Fri, 30 Sep 2022 13:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFk9-0006JM-Ji; Fri, 30 Sep 2022 13:07:53 +0000
Received: by outflank-mailman (input) for mailman id 414221;
 Fri, 30 Sep 2022 13:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeFk8-0006JG-Br
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 13:07:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3398d31-40c0-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 15:07:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 13:07:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:07:49 +0000
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
X-Inumbo-ID: e3398d31-40c0-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgQ8V09LVWLjXwftwhDJ0pXFoHLvGNRqSd9AZsxIWD1BLNGrlVlNoogRkMYvFHuC9cZYi+a/9CVa2Mra5+VwzJcOmlPARYtIVoJOqheuZBYC92DAFINW3Io7fnT27TPAx9P8vVkxaUJydaBj31sVi0wh9d2U3X0haY1nxtWiZImxbc9RuSPMCjnxENC02WHCsW2KV3DizXrk/bLwGH57zkOLL+SbZsNjkPjsII0wJKezssfYkqg2kfYZqnfWW28yJWDci0kMT/ELHb3YIwq7+8Yl8XlDHOXzf3tgqy7NPlPMKEB9o9VuyDUi7Li0q8uXQIyQzIBMUDOEXGc2EaE/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzLpBGp7hs+UwkFZ3efQGLxJLr0RpDbq77EgNcKa3jQ=;
 b=VVyZjotN3kAZ+P6rZpdIFlSj0SNaETjpfUfsvjLOyScduFdO0kzNEiGiicz6zKSOahED2I3hTeF2PH+BeoYzGZFyXvQnKMiB4z94xWbi6o2INut2CsBS/zlVyJvSb/jFRrmhMKt7kFcU81/2eTYWLKpac9qN6flGV4uq9ddfq/vfcX2J55nwQkLFTU2bGMAZrm/5frgzmILnBgINlOEiJFJnUBla1gJ62EwdfcjC9Ha+XOtE/IxKigL5T2ixfHWnChT5ggsBH6c3fcp3SSWfEjQutwhefz7YRr399bxwfK8WmPm6cf7PYC2GHHHQrsrEF9XMHuaxy9zpJNyu8JbkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzLpBGp7hs+UwkFZ3efQGLxJLr0RpDbq77EgNcKa3jQ=;
 b=i1da9KxnOYxKcYPpUBTTrKIRQQbpU0vDMkmxUP7NPFZwrjFMRBeTaFdRTpilZx2kJ0bZzp2tY3kcC28I042kG4vjofqypw9oenhXMCJbA4X9/Njh7xXaNGweF3eca+u8XVGmPdNQkwTO8y27faSRB5ApfkMx8nHXM8eB8IteAaZFLBI4ADqDNW27J96pIjuBTJD+7hT2SSLGwdvlsVRIUK6jb/5bjIahq0wwVPlIDWLNpEttku8L4je/KkFYzk1icgJIBT2pmyHrT37AN8M8SX2IZTJU7RuikUBgsOAhX/kBW8UpHq+bybfNEU4ngzvrvmOCQiHi3Ar1puXxCU6s9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0cb3e6f6-2d80-ca27-bce7-3cde8770972a@suse.com>
Date: Fri, 30 Sep 2022 15:07:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <bd694db3-683e-a856-d4de-97589e4520aa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd694db3-683e-a856-d4de-97589e4520aa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0194.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2d7870-8c6d-4142-4776-08daa2e4c689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ui3HNZOTZTD0B4PjHbHYmknm5cPe6s2jGbYQ+F3jv4ftQgtuuc9Hotb4rIhS5neFA4SBcIXSY+5yaz3o01f3PXQoL5Nkugqetx6At99UTrWLTzWE4YCoh58bs4PnYddMR1FuWflWnF7XFKm+L8eOFvbtrHy1R1lLt3GfVcZycMh4IoMHqCVHec156TTuundfZLR9oRXIGXNgUP3QkQYPNT+mwSAC3sxyNrsP3UxSyg2ARu71O4BzC1rIR8rHkKQHxFLVXioHRaKG0wshTRGeuDQIH+X2Hk1uvu5btdYRClxhImyfvIJ5nHU1dXzivWKIOoAuIwH7wENv8uaPyC16rPUWZ+jYn6zgXGdRjW8V6X0rkZjAvBlooxX1P00KbDkfAIejOtlOaKapxDzTnyKBOPjJDuv8C+cIbSdskcBqBAUVagpqD3E64whNA8Vrv1Nzkq5xts8ueN3NY19ioY3Ui6G5Q0+u0ui7y4RQJ489vqrEY3R2Xmq6o6pKenCXqY4HGK2b3pPcOmKrfDXGzCFMnUQocOoIzzEuZqGGqK6CWzwFCIdvYN2zlfwpISNynxfvx8q0jj9fV4g5jZ7QDxwm2zNz8REc76wSyyrrSut/XVt4XnU73WuOhD7E26+tzhKawB9dt9aLDvO4kDhjgFENROiv/vNa6yV2REMf+E5fn/B0oTEop1vuAmyZY/6vYAJ2MNxH3yzvzTWUBj3px/kCapoPMV98W7nly0oa4wfW4L2seXGON8iRydvsrdLyYkqq6rIZwEfNC5ivw4kN+E7sAcE05Iu1XeesCu67oI62Rtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(83380400001)(36756003)(54906003)(6916009)(66556008)(31686004)(31696002)(86362001)(4744005)(2616005)(6512007)(5660300002)(38100700002)(186003)(478600001)(66946007)(6506007)(4326008)(53546011)(8676002)(6486002)(316002)(26005)(66476007)(41300700001)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9Wd1psbHhubHRCT2RJaXJSN0RKWDlNRTRhWDI5WUwrcDdoWEZpOHAzRlgz?=
 =?utf-8?B?S1VEcXNnUFhTazBhWm4ydEtpTGI3amF3NGpwcGxJUXVLUkhhODZ5M2ZPOGhr?=
 =?utf-8?B?dHg4NmhMa2R5VnpyZXZGZHpSVVVTSEpwZEpuMEFNZnpFREVXckpIY25CU0k1?=
 =?utf-8?B?RzhBdUtwOUZUaFJLVDNBRWJiWUh3RXBhRDNGVEQrRzNJRUlMWnlSOWJtaENq?=
 =?utf-8?B?cWxodk96YkpNVk9MajROek5Gb1g4Y2tRQWVCaytWM1FQZ3ZGMHYraUpQSFZJ?=
 =?utf-8?B?MkdRWm5heDUvcDV4WXR3WWpQazlFemtHVmQydUh0a2w5MkREbWd4a2Z2cllF?=
 =?utf-8?B?NXpscFpIM1BNcFdyczVNOFB1WVp5bkcvZHlyckx4OEMrOVZRc2lRdXp6VGhX?=
 =?utf-8?B?ajZLVWMwZGhOV01ZaTVsL3MyWVJMeUtkT0FGY2oyc1dyME91NlNkQXhGZWlv?=
 =?utf-8?B?S2hVNXFBVVBFREZweFRDbWpqRWgrbTFOem9qaEpaZEx2RWZnaS9xVTVodHd0?=
 =?utf-8?B?OFlmSDRiMjhzV2ZDeXhjVTdiZ0JrMllQMnYwRmMzZ1RTdzM4cElidWY1ay9G?=
 =?utf-8?B?ZGk1WDUrd2VBT2FpRCtFZ0syczdvTExPMXo1ditPNW5EUlhPKy9QZC9lV1Fv?=
 =?utf-8?B?NXBjUHZ4SmV3RnQvTGp1bXhFVzJCV2NCWDg0Z2lHU1FNWmJlRmJxZWJkSU92?=
 =?utf-8?B?TmdSMzVFbk0vVDBJZVZmVU4yOUp0eDVnME5aaXI1US9kcnRvb2VPZVp5dFdR?=
 =?utf-8?B?L2R4aWhkYy9XenVLZEJiN0E0cWZWZVVkbll5ZDhEamkwUHdNSktBc0t2ZHBq?=
 =?utf-8?B?cU51cVVCK3dyOWZoclZhbFNYSkJrMEg3SU5QbE00ZXlHU0ZwZ21RcW9BdFB4?=
 =?utf-8?B?Yk12MmZJR0NLYXdyV005UjVlVG80eVdtY0dHQUZTbGcyTUhjN0U0NVlKS2Nm?=
 =?utf-8?B?MEJGd01FZWtIWUJ5dFlJUUFsTnRGY2poZWt1MEVSbThRS2lOWC9iZko2Q3Zt?=
 =?utf-8?B?c2dKeUJLT0N6bXdUa0pZVE9qUzgrSjRpTG9FbysxMGpQNUlkakZ6alR0eTNa?=
 =?utf-8?B?WkhGMytKNkxYL3R1QXA0Syt4TFIvSkdHbkNOaGVoc1o3TmxBTlc5b3l6L29w?=
 =?utf-8?B?OFI0WldWRERoS0VMVGhBWGRhZ3RnRWdNenB4VjB0QnJ5ZzFQMjZqUmZ0aTJ6?=
 =?utf-8?B?RS9ZdUR6U2ZmSS83SmhMYW5zdXo5T3prT0w4bHdOUldxNFM3S0NGM1BackxQ?=
 =?utf-8?B?NDQxK0NLaThpTU9CNTNSNDdEamRhd1V4ZzNKVXdRMUdFak1JQzQ3UHkzQmJo?=
 =?utf-8?B?akVRRzI5eTE5dWtCL2FGZDdTMlF4YmNKeXJlRXpmTFNCZVVQWHZOKytPQzFW?=
 =?utf-8?B?RWdLbklRRDJmazQzT3NRYnVOcGduS25ES09Qb0FhK0hJeHpXWFd3dGlOa081?=
 =?utf-8?B?ZjBIYWtScjhsTzhVaWdmekd2YmhnRENqZWMxUk1CWlJ5bnB6OHp5L0tHemFy?=
 =?utf-8?B?aVFnSDJDMDU2aXJRRDBUMUNWQUVDc3RycmNUV3hQNHFlekhWY2xvcDh4U3BJ?=
 =?utf-8?B?SUZnSGI5S3Njbm1nRmduNmRDVFBnM3hNMkRYekJoWWo5YnlleHA0a1JlaFFl?=
 =?utf-8?B?eC9mczAzcXNJTE5mWXA4VnhpTktOZWFBVUNxQTBMa1FxNFA4TnVHK0htN1hN?=
 =?utf-8?B?aFQ0YlNjVlQ5dWF2Zi9IWGdheFJHOW1pYndjMDFUNi9aMm1KMVFjTHhISldQ?=
 =?utf-8?B?bXptVXUyMXpVR1ZVbWdRU2RJRE5weDFURG1xWlE3MTVUbkVqclRuOUtQcXZq?=
 =?utf-8?B?SW1oSUFzbEE4OU9vMFdQUjFXbkhHdVl3RU15MXZzZHlMaXZJZkxrUVBRcFNl?=
 =?utf-8?B?RC9oSzJndGY0NHJnVXpkaEtoQWJYZmZ1Uy9nbEpRdy8xZGZnVzZPUnpYRUlZ?=
 =?utf-8?B?RkpiV0V3bkFQcGNmS21FVkluLzRpek5ZYmtkNXlUVE5jb0tpRVVFaG05S1VN?=
 =?utf-8?B?ZThvNTJWT2YzSWtLMnNjVjRJcUdid2xsV2Y0NFpQclZ4U2V0dGtSYVY5cFR5?=
 =?utf-8?B?WWpLMnFFN0tHM1ZoRGZLeUVFRzVJZTNwc0FabFhFcnRsUCtsd1VIN1JVdE0x?=
 =?utf-8?Q?mR9/BMuerhsh2rEmNDlFoknrt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2d7870-8c6d-4142-4776-08daa2e4c689
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:07:49.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFHgA/fJbWQsjT6H0eJ0rkmA2o+07i41V8XNcou3k82Xx97Y34WwgM3PD1SLTLDpVrmvQOwSJzED5NzT7ep69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620

On 30.09.2022 14:53, Andrew Cooper wrote:
> On 30/09/2022 08:50, Jan Beulich wrote:
>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>> higher priority than the type of the range. To avoid accessing memory at
>> runtime which was re-used for other purposes, make
>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there and hence that type's handling can be left alone.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Isn't this also liable to be the root cause of the crash reported on
> IRC, where a read-only page was being inserted into the heap?

I wouldn't be able to make the connection, I'm afraid. What was asked there
was lacking details, though.

Jan

