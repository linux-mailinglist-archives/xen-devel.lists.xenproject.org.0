Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155644330B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 17:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220427.381707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwmD-0003tp-O2; Tue, 02 Nov 2021 16:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220427.381707; Tue, 02 Nov 2021 16:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwmD-0003rJ-Kn; Tue, 02 Nov 2021 16:36:45 +0000
Received: by outflank-mailman (input) for mailman id 220427;
 Tue, 02 Nov 2021 16:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhwmB-0003qx-Kz
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:36:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d15fe036-757a-4759-b38c-5db01a67c164;
 Tue, 02 Nov 2021 16:36:42 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-fpMJvkbQNa2-BMI1ujX0Ew-1;
 Tue, 02 Nov 2021 17:36:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 16:36:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:36:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:206:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 16:36:37 +0000
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
X-Inumbo-ID: d15fe036-757a-4759-b38c-5db01a67c164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635871001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXdttXKkhlq2EKKHB51M9XelpFL4mhE9EhXefEQ5kdM=;
	b=J6pyRG4WNUAtrqNNIQSq5dfnYrlLZZaRsmO2fPNbZ0rM9JNMQTvwV53glchZlcJoG7g/Py
	3uVfDv9CYtL4m6rDWZ9/hpxdae+hN5PG8dSY+Xqiv/qT+VgcQnvzYZOnxMj/GzKr6zG6qH
	ZrjRJV4bmE8FGLLxjmydeeH330+OmXo=
X-MC-Unique: fpMJvkbQNa2-BMI1ujX0Ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akGZbqHy0o0BP9L/w+hJ/CRklaspvbbn4JvKA3EX0ZDdoIKZaqI9rg59jpbgQDcd4Rh9JLUfHN2/wxeK9Dfz2ggHXe7JVV3O6hPnKYtDv8IZeSFRM3+dU83mq6MkMKm4amxK5+8Mp94SBudvuduTm2mG6CRISqfFAgib70KALrDFlh9OPESVI0OyptxC96spboPPUeE/oQ25tCMKHbRy9rJq5McIKL6sbGxGscuXKTlSiWwhAvBSvjyv2hlq/dwyCRphz0x0ucsixm4B0lFKcmU2zXZDOddz/RbU+xK3YQKvXapkhqB5moROpqH9OEwuOLkzqugoYmTnKpvZL2rS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXdttXKkhlq2EKKHB51M9XelpFL4mhE9EhXefEQ5kdM=;
 b=DEoh9tQRm+SucEeNVU5NWmsBmH653ULWAc2C+bnGNS/6ERnh9FjAYD8FLqhj9Gi6TXtbf8HljYMheDKwMOyRclWN1KuWP+xGid7tWPoexoZ4bkQ94vNDPb4nIbZays+FwAMloRSBuHfH0TUUPu5YmLvb8t7HKmqdBUrVv4AtNvR8m53WWW0uRAIumD56ky8eKsuYvg2yFmKs2nHdiQVr6ZT3wz8g2qIypUYLRKdKn9wdv4avfMCmTC6gsO+9bdCrGOrK6Rr+D+znMUM+uxAqjUtF9TVUo9YH5Ybu/d5ZLhajSEkzmrqReRk+MuAjG8MZHb3+hj9IN+hbVdX6aQP3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec809d19-670c-bc91-7b08-0cb7734f0d80@suse.com>
Date: Tue, 2 Nov 2021 17:36:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/1] xen: update system time immediately when
 VCPUOP_register_vcpu_info
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Dongli Zhang <dongli.zhang@oracle.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, joe.jin@oracle.com,
 xen-devel@lists.xenproject.org
References: <20211025173523.3647-1-dongli.zhang@oracle.com>
 <fdcc4adb-c823-2c08-57ed-e4306c1e186e@suse.com>
 <24961.24756.236341.888900@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24961.24756.236341.888900@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:206:1::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e02431e-dd4c-4385-e974-08d99e1ef134
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638259CF41B205809E02A232B38B9@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H11oIOE0lXL48UZ3G9nk4qEtfdmbcHWsqJzBvmj217CRAzXqZHfv0Mv0aokbqRdR46xZ4tcXWRRLi1rPvd+kn9+fi6ylKTkfgyiErIrmOXQPo0NAiXovHE7DsriMqBY1YDmAkOWVTO78KwVSdKFLLmEgoV5gsvwP5+50X7ERocfI5Q0LD9SJE2GOBDMdPp4O1ivIyDoVzrt09vzd3d8kOvekxs4YTVF4COZ4j0UjZt3B3PggVUo3Ge8iAsB8E6bbT0AiWgaNnYsxRfSFpPecmEnMjz4rS31AcfG8Rh1Ca2zrC0DSoNsFERANocSgq1mPXWSmHTXvYLkBkEf1UMJbjw6ab4i7zkYT1K+sa4Pi3NsVxISsbHw0ISngITwfIBP0p06mpsMGYcnjB3ubgeRQy8RP4PhM/LTbf57eFd/dpV4untNe/iYjxbgLAjFNaEj+cqmkRUBEBpEdzNzEhg6Siki60amgTy3/2qmk8kG85e/b1x03eQ4UVlWIsoX9NGCmXklFGagTqJZnNZXfyJ7ckPPBlGb6kCDybaU1Sk0KjAE+ReIW//u9U1oHJwGbBahTGFUyPf4mXMBKevxuZrhz2GElva6dDz/9RU8YsNZoOQNndSWdvfA3w3C8RWi3chxk0FYK5R87VVKcHhnTo6wneJYtGWsRDzkgVWGxnSbTDoGnX5r0F0id1NtWIl88oh768iNhRTg7KK/vq+y98BuMA0zQX7y9CKnoVdV7Zg63ymvuMeWM1PYPYTFlECpEfErY3HJ/Z5dvrvFb389wg61grqOHkKmpBQ44yDGF2SzPwT9WJ9kESQg3HYwJwes01COGVkHDQVy5TSgaNY1aupUIPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(15650500001)(26005)(508600001)(4326008)(316002)(16576012)(53546011)(186003)(956004)(2906002)(2616005)(31696002)(6486002)(7416002)(36756003)(83380400001)(6916009)(66946007)(8676002)(66556008)(5660300002)(86362001)(966005)(38100700002)(8936002)(66476007)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9McHg2aXdrbDBiWEZSZ3hvbFVLdnc5eVhmc2o1MDl2Qlh2TmxjVU9xNFh1?=
 =?utf-8?B?ZXIvN2cvYkFaN1BlcDBNL1dUd3lwRXRhb3d6a1BxQ09Kd2Q2aTcrTkUrUElR?=
 =?utf-8?B?MnVLVml0ZXUrdFRKNHpuN251Wkk5aCtxdDBsVWFzOWsrb0lvdkZFMWk5WEFV?=
 =?utf-8?B?RVl1d09NOHVmQ1hzUzdkSTgxNU5EWDJnMkRXUnY2aTFrN3hiUmNaMmRjUWhC?=
 =?utf-8?B?dmsvSzRHdCtTc2FZdUlxcUlpbThjWkhIOWRXd05lMmZGWHdaS0V0L094VTEy?=
 =?utf-8?B?eUR1UjAxVStzRDM4Nys3Q0JnTFBPOERTWWxXSHNRWkx1eU8zK0V6NnM2dk1P?=
 =?utf-8?B?UDcrOW95VWxNbFlIZlBUSHpEYUg2c1owRFVTTjJ2SGc1bksvb1dWVElLU0VQ?=
 =?utf-8?B?Y2E5LzBGY1JjVUxHYzNwMlQrZDJWS3cxaHNTTXBSMUU4L0lhSkhWbkZ3Vmho?=
 =?utf-8?B?dERzdjJrWlEwRWlXay95VW1OMytrNmE3WXBDSVlwWGxoMEZKY2c2WmRhTFhy?=
 =?utf-8?B?MU0yQXRGUG40Ymp1TmVLWjZWc3VpY0kwbldjaFU4WDZNMnIwa0FvUDdqZEhG?=
 =?utf-8?B?a3prT0VLSWtLcmREeUlIUXI4ZEppMjA5TlpRZTA4UlRKMmJJUXZEcFBweklE?=
 =?utf-8?B?SENCdUJVUlRWY3dVRjI0b3hCRmdhc3AzbElXZGNNWDVLajMybWY4ekE4S0I2?=
 =?utf-8?B?M015QzdKVHM5Ym9wekkvcmJzdWRiYmpablVVbXdNMVV1OFhlVDRxOFZQZVJK?=
 =?utf-8?B?L3ltRHVOd0JXNjlQcmxOaWthL3ZEYlZaL0o0cUV0cTBBcHd1eURSMXpkZDlN?=
 =?utf-8?B?dXN5QXdkV2sxMUhGWkFDemZLOFh3QldyM2VTdVp5UHhTM2Zod1Noa0tlaXl5?=
 =?utf-8?B?VUw5Rkh2NGtnK3AzSWhCMGhQZjRFMDQ0b3hJU3VYZDV6UVVreGQzV0hFWUkx?=
 =?utf-8?B?NWU4Nk55OExIS2pKdVJ0dkhnSFU4eDBEc0l5cGkxYVpWeGYrZTg1eXlRQmtl?=
 =?utf-8?B?bDVMdWtyWDk4U2R4NTlzREhFVzIrd2VyOVk1aklTVVRJVUpMV0RFQi9heUVU?=
 =?utf-8?B?VGd4VTRrMXBHNlRWQnE2cDVoRWhpa21xSDg1Ri96VUtBa0Z5a0gzeHZkb2hr?=
 =?utf-8?B?VVJ4anVtc3g2YnNIWkd0NzJpdU01Zmd0Z3AwOUhucWllcjBFN3JrQTNqbEx1?=
 =?utf-8?B?VjkxSzRjWDE0NGw5RlJaNUhzY3RxdSt1Rld1RHV6eDd0K1hkWHdqS2dWQ2Uy?=
 =?utf-8?B?SXkxQ1BTMzBhS3BtL2pkYm9OUEtZckNxZ1VTSTdJbkMwTkprRnlRcWJuQ2Ni?=
 =?utf-8?B?dVJ2bGFHYzI3akJtYVdwa29SNW9OVmtXd2F3RldwYkI3UzdIMXVLUWNIY01Y?=
 =?utf-8?B?VG5EZmtqTkc0REJsTG1VcW14MGFtNnJyS0RaN1U3aGE5VUFsZFE0a2ZLakwz?=
 =?utf-8?B?ZkhHRWdQUG45eGRiYmhUNFQrVnk3dGN6SzlnT3NMNVBWNlhaRHpObTBEdmxE?=
 =?utf-8?B?N0xUT1ViWVFMQlg0Z0NSVGUwczFGTWZQSTR1ZTkvNkxDZDBWd0ZWN1ZOQ3ZS?=
 =?utf-8?B?NVJDdStvOER4cjBZaVBDZDMxdTZhWVJHbmprQ1RRemFTR0c4eGNwMmtCdUZZ?=
 =?utf-8?B?TGNPRFVIajEzVWpqL1hBeUJYc2Qrb0FsWUJlQUlJQWNOSTdHU3hIWlVFemZr?=
 =?utf-8?B?aFI1VEM0OU80bnBIVkJiWWVRT3pOa1JYbm5udGxpakhPcS8xNHk2MTRpcEgv?=
 =?utf-8?B?cTIwY0ZseG5kVVV3c0JMY0FVc2dkVXRySkc5K2FvUmlTWmJxZ0Z4ZkRkWFox?=
 =?utf-8?B?ZFJwNi8vdXhjQit4TkNNcHE0VVo3eDRvY051Skp6WTRDTHYzL09vZU4yRWtr?=
 =?utf-8?B?dDN1bFllRGErTmV3MzkvY1lMVlVxR1VmWHhOYk5HVzNxRVhHTkx4RjR2TWU4?=
 =?utf-8?B?N0taNitiNHF3cTFBZW9xY3lQNXVOZU5rNzVnUy9uVDgwcTZLeDBaWmw1VEI3?=
 =?utf-8?B?TEJtcnRGTHFsenZtUnhmWWd2WlcyWlVqcEh4dmVwNHBFbktNTnk2U0k0Mmln?=
 =?utf-8?B?QTJyYUlEV3JzeG5hbGkvTnRIMHZFTEZEdnZtSm1wTjlsK2Zxd2l0RjRwZ2tS?=
 =?utf-8?B?NlJQUUZ1ejhnRVJzWEpoYmR0VkpyY0Z3YUVHMXNkVmRCRThDZkNkdXRsMjRE?=
 =?utf-8?Q?zJryssJ4vDFZChXSROeB4Wk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02431e-dd4c-4385-e974-08d99e1ef134
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:36:38.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40/MD7Sqr8OddPWItjblIokwu76u5dDwuG6K9dTDwAON/sCfX7EgqkdUOc5uBQ361nAsyL79uuOUedGccR60HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 02.11.2021 17:00, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2 1/1] xen: update system time immediately when VCPUOP_register_vcpu_info"):
>> On 25.10.2021 19:35, Dongli Zhang wrote:
>>> The guest may access the pv vcpu_time_info immediately after
>>> VCPUOP_register_vcpu_info. This is to borrow the idea of
>>> VCPUOP_register_vcpu_time_memory_area, where the
>>> force_update_vcpu_system_time() is called immediately when the new memory
>>> area is registered.
>>>
>>> Otherwise, we may observe clock drift at the VM side if the VM accesses
>>> the clocksource immediately after VCPUOP_register_vcpu_info().
>>>
>>> Reference:
>>> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Ian - any thoughts towards 4.16 here either way?
> 
> This looks like a bugfix to me, and the diff is certainly small.  I am
> positively inclined.  I would like to know what the risks are.
> Stefano says this does nothing on ARM so the risk would be to x86.
> Can you advise ?

I don't see any noteworthy risks - a call to a function gets added
in a 2nd place; the function itself has been working fine for years,
and it is fine to be used in this new context.

Jan


