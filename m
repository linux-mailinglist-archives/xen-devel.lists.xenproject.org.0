Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9F7A16C8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602896.939705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2pZ-0006QO-NH; Fri, 15 Sep 2023 07:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602896.939705; Fri, 15 Sep 2023 07:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2pZ-0006Oj-JF; Fri, 15 Sep 2023 07:01:33 +0000
Received: by outflank-mailman (input) for mailman id 602896;
 Fri, 15 Sep 2023 07:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh2pY-0006Od-2l
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:01:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2befdf0-5395-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:01:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9352.eurprd04.prod.outlook.com (2603:10a6:102:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 07:01:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:01:00 +0000
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
X-Inumbo-ID: b2befdf0-5395-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhKgKHtPQwQrMDDupmUprDPcmKvJLQR48IDlU8rwmaYMEjzjOl4WE0dFcKYYegTLi3fpVA8IVRX1XT1yhX9WtIALUvv2b9fMO+CsLnueDYWoSyKOVOsRJOoFPSo/xA2LGgzuBQeyOtXXmw7YBu7BYDZILsbuecqTzOfeO6Y7rTXt4k2yBiQzklq4S+PxzJhUTJFvsetmR0pevNIf+usTva63VXPZ4PGdAcDJD0kaWbTQNy06j3PDXnYz4XdYgFUjDFYFMPqZKL9r1ljy1H26TSkvWshXamR9v7AIW0bnRoRhZ4SBQYAJo6CobDJ/qYncbT6B4CkQsBsqyZmVXJlDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFBszeExHVHK3rPmkhDPfcIX0seau8ijSyDiPy33SGk=;
 b=Vn0IBNn8HHvOQvA0z7j7eJAtTRp7VwtJG/IdL+pbI+3usNbhnfqLu/Dr8o0dGxwjgU36avFPcco+CU44m501O7/2ODM2iKI8dHL1CYMGIqVYGzJObCjOuKvijp/ExZLyq6T9FCJqdkCJRQQB4dfpAqBb9+4txoRHZj0pA1DtyTO0k9l4yVk74t4W5IyqEtitlqMOSwNH8Q8xnYWH5KQXnA1KGwlf6dGzNwaUmvTCQW6x0baBSSsiH91QESHe44OMeqZJ/tIR+p+/05rVOEgg1WyYdZ0904AFIDB3SPDxIL03jcxAONpLrAyll+ZHrZbt4nlY8yih5elKcnl76yI22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFBszeExHVHK3rPmkhDPfcIX0seau8ijSyDiPy33SGk=;
 b=E9oc88yO4iXgkyY7ZgzZH0315gnqnP6OcOBlaPkKVFEwn1evT+ryPO0R7h5eCohhecxLwGPm8Easecb9j8Hb7/pqZPnpUWZXTaFBViXN+AUA6wnSWZDAPm2Tzy4g+5fpeA2gSOMmKdpS8YUjE6Ox7RsvOuuVzZivGkZpQB+6LQuOJlyTBgKBXhTG+csayTg5sp0iCckF6laE5JFOJCUm6WX5Jwsbls+u3LLqMj1t+UAIyimW4lxTrCD7XtY1XR8olmnfyMJ5bNZ2Nq4zR9MOLvG8YVmuIZKX+pb3h44cu7jALHVMoNM/04+Ai/sQvaN9ld8b3A+8KRD/gREG/LDxCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06c3624b-0258-ba66-cc1d-76c475eb8382@suse.com>
Date: Fri, 15 Sep 2023 09:00:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/8] Arm: annotate entry points with type and size
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <e7685fa0-62e0-98b9-f9ba-7e698fb7373e@suse.com>
 <5a0d227d-74f6-457c-aab9-852ca55c6b77@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a0d227d-74f6-457c-aab9-852ca55c6b77@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: bae2faed-ed80-49d1-98e6-08dbb5b984cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xYaGpT76K64LlpYORwUx8LzxismVmdaZYNG4biKQpcah5QWuN6V7wp2XxdIvFd6IzPUvjjW128LgP9GjfMSpxIstEFsIHXMamvzgsa7ch5n010EqyrJTV6QwCnD7EovARnD4zwTiTP1g5uSXyYKc94GsWKILcWhA27hDwRivRn4VngfEftd2eqJX2yfNCLhpOAKPb3N3rFPMYMYP05Vk+Ea1WUxwEtrDs/f3AFh3MrPAScHkhuOZUXH20wK3zIo85KHhs8WcX+GOyiZ/8RFNqK5sWzLrC0vZTBvkYO1SPHa6EMfIo1ghdGwa69eKBKSqPOrpSMXaNlFAcsatHG6qBa+uAfA221/xgqZMkOfLy/JZKuVigRMcZjkM0byd+HfSP+wV3sdOSu3wN/GhvFanjLRrMOiEd9Kn1XMcA5r0ZlA2h63RUyRaxjCyFEf2pedWhy8NOeYJdjZCA40Jl5LnxXq+tjG1JhqGj1xhLzyKhLy/5kQ1y63KzlwFv5orYDi1ZiDIPipzQirsg3UYmRvYKBF0pWzPo7rP5cGNhU6BilMp6RQ/i0grEkN3e0M+SgR6VLGbeaFwGPg4b+nV6EPuHXBLfAKlILTSdSrfRiNul3O5kJhrxuv5bLljnlrEDkU3QAOMrqNhjq+3YB9GAcF4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(316002)(38100700002)(26005)(2616005)(478600001)(6512007)(36756003)(6486002)(6506007)(53546011)(66556008)(54906003)(41300700001)(66946007)(31686004)(66476007)(8936002)(5660300002)(4326008)(8676002)(2906002)(4744005)(31696002)(6916009)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RPQnBzQ0dNOHYwTHdEVE1uZ2V2OUhCTkR6UW0yb05iRjIwOVhwSHY4d1ZG?=
 =?utf-8?B?eXBFWFdKak1LbE9uQlJFcGdiaE1WK2RBMDJTWlcrRGlTdGl1NUZHUjBqZVpX?=
 =?utf-8?B?WDhmM05BTXVuaGRHenN1cmQwTWxNVlFIUTdqMUFsUFNmTXRsN0NJNUdBUGh6?=
 =?utf-8?B?OWU5ZkhNVjRMM2xpbnllNng3TWhPeHZFcHhvMWZZOGJ2ejdWV2trcFZvT2l0?=
 =?utf-8?B?QnJCbmdBUEpoMHpsZjQ4L05JNFFtc2NDMk9DUGE4UXQ5MXVuTnpSSGM4U0g4?=
 =?utf-8?B?anRwTUlLYk03MGE4eDQ2TFlXV21Zci84MW41Y1cvTGJoWmwxeVdEU21iTHZH?=
 =?utf-8?B?ZXJBcGdaZ0VhUGN5V2c3NDFFemFnWTd1Z21CNEpQWHZMM0hXd1pKaFM1ZkpB?=
 =?utf-8?B?WWhwd1hQbDdCaXFHVzNadkhwU2p5bVo2OXJqTW1oclo5MGNrZW96MmNSY0dn?=
 =?utf-8?B?ei9HRTA3VzRXOWpROUR2QXQ3dDB1b3dOV0pZdTBYQkJkOG8vTVJPeUl3OW1N?=
 =?utf-8?B?aWkvYUhJYmE4VFpGN3lqdm8xVVVpSjFlTnBvME40aWVtNFVLSUxLdmhObHFn?=
 =?utf-8?B?ZDBxT0VuUUxsSlB6WmxZVElPS3BnT3kyMXk2REFKZU0wckI4V1RtZ1Y5UVJM?=
 =?utf-8?B?UU03TDNqY2NyTkUvQkMrOS9ST25QM0Q3S3NBYzRFZDdHN1NVaC9EbUprdUl3?=
 =?utf-8?B?MTVLU3NEdnU3MzBmOXJiWDVBYTI1dnBPK1ltTHh0ZzN1SUhoUkFsS0hDRjZQ?=
 =?utf-8?B?Nng0MURFODJiem5QdFZTUEs0SjgrQ3p3L1B0QW92eitycUo3NlJYbjdoWTMr?=
 =?utf-8?B?WVl0T0lwZ3N1dVdla2dVN2twVG1JT1dmMXZDQy9pZWNPMnFTT3d0UEZtbnZp?=
 =?utf-8?B?ZzJwRkdXNURNVkp3ZVZlMzN3OTVlRmhvTUZ1NW9ndnp6MW1FZ2IrVzllVHpV?=
 =?utf-8?B?a1l1dENtYVJrdnh0TGh1KzFKTjZpb01YREZZTVMwR3grSU1mcnN2c0NWblZh?=
 =?utf-8?B?R1FpUEx3N3dnSWlXZHRrbXRHaHdraklwaVJCSzY4WjUvVjh1bkd0WHpXRld1?=
 =?utf-8?B?ZU80OXh2QXdxdmhPMUl6TU9EVnVEREYvendHRVpLbGZzeWlIM3dPekw3Uks0?=
 =?utf-8?B?QVR5cXI5RnJPYW9RbVc3ZDZZMUYyQUhDSkk0MmhDMldIU0kyRGJMemdGbHlE?=
 =?utf-8?B?dDkzbzdySDlzVlZMcG8xdTIrZVkzcDlFU0tXb1ZmVFNTckNVT1VYQXBkaHJa?=
 =?utf-8?B?WG1SMmh4ZEozYTdIMkdWZXpRWlpBYTl0eENvQzRhM2VzUmcrbTRtOUlkbjRV?=
 =?utf-8?B?ZGJiODBMc205VG9iNXR5VnpFQVZNVWNXQWU2SnZqWDROcWpFc2pSMUNER2lh?=
 =?utf-8?B?MnVyd0dEM0YxckFUNDBEaDRIUS9WUHkzb3QwdEdvbkJMRzJRK2ZDcHNvaEN6?=
 =?utf-8?B?WmhEMmNLSDlRL1FmRTFWa25KZzRGeGxqOThmRTgraE5NT0hreXpXSG84QjhW?=
 =?utf-8?B?cWNWREhRdCsyeVZ2aWtqOWw3Ui82cVcrT2VUcE42T3NXZXR5Q2c0L2x4b0Zw?=
 =?utf-8?B?ck9UbDhaSE13TUE2YXpqa0FhdXpuK2ZqK2wwd1F0d05ZWTlnNHBYWFEzYmli?=
 =?utf-8?B?eCtsa0FFMFYzeVFhQ0x6bndGeXpETDJwN2V4Y0tMZWJvbmRwR2xhTTQ3YWRn?=
 =?utf-8?B?bEQycVZVOU5JdXJYcVBhcDMycHBLbzg1amV6M3EyQlNLa1NKSGI5TlA3Smd4?=
 =?utf-8?B?TUQrR2hQcFVGMUpaa3NxTFJ1d2s0ZUNGTmh2eHJTVkFjQStYSHJHQTQ5MTQ0?=
 =?utf-8?B?UVpWMHNGZFNCU0xid3RWbWJzN0Q3TnNXQkFyenpoeFloRi9qRXNQNklrUEph?=
 =?utf-8?B?aitrSldha2lFSkVwNytPK3ZFYkpRaThJSm1mWmdIUHkra0tLRXNmT254Q1Jz?=
 =?utf-8?B?S2l3cGxxZ0t1aGZtN1lSZlNnaHNQN1FmdERYWUwxazZLa0tYU0h4aW1VejQ1?=
 =?utf-8?B?VGI0bGlaeEt2N2VZSVR5ZkJ6bHVhZ3JVNXJ1K3JpWWxkeU5DZjRvejhkYmQw?=
 =?utf-8?B?SkRLUkI4WFZIQTltVHJuN0JCcGt2azlPeGgyZCtaZTQ2R01XclJYS2dVT0tX?=
 =?utf-8?Q?XoxmFbLd5I5JzoFgRUOUBmCvi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae2faed-ed80-49d1-98e6-08dbb5b984cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:01:00.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOBrFdwrG8TgH4wkhY0H2rjPt+i1bHkldpe+Rwp6eCD9k4DEGnWh1X80p2mAnRrkTnl367NzUEQPiqthj7mweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9352

On 14.09.2023 23:25, Julien Grall wrote:
> On 04/08/2023 07:28, Jan Beulich wrote:
>> Use the generic framework in xen/linkage.h. No change in generated code
>> except for the changed padding value (noticable when config.gz isn't a
>> multiple of 4 in size). Plus of course the converted symbols change to
>> be hidden ones.
>>
>> Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
>> use site wants the symbol global anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> ---
>> Only one each of the assembly files is being converted for now. More
>> could be done right here or as follow-on in separate patches.
> 
> I don't have a strong preference. Are you planning to do follow-up? (I 
> am ok if it is no).

Well, I certainly can, but I wasn't expecting this series to remain pending
for this long, so time's running out for 4.18.

Jan

