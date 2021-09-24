Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDF416D6D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 10:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195013.347469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgFd-0003jF-2h; Fri, 24 Sep 2021 08:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195013.347469; Fri, 24 Sep 2021 08:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgFc-0003g7-VF; Fri, 24 Sep 2021 08:08:08 +0000
Received: by outflank-mailman (input) for mailman id 195013;
 Fri, 24 Sep 2021 08:08:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTgFb-0003g0-7P
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 08:08:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf3f3c68-6a39-4cb1-9f96-af490b964b6c;
 Fri, 24 Sep 2021 08:08:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-l1EHB0llMpyKhJGKMg4Bjg-1; Fri, 24 Sep 2021 10:08:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 08:08:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 08:08:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0122.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 08:08:00 +0000
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
X-Inumbo-ID: bf3f3c68-6a39-4cb1-9f96-af490b964b6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632470885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6No7pRe5XjDcTkRgjdWd+8yzZrBfcMAd46s/hA9XNE=;
	b=NuZO9Y6hyMG7Ne++eiziby2y6TajlnpzdGJDjAdMOVfsRx7S/D6G2mizvn0/oocr3rpS7h
	zJpC7+RhYuJa6vDM+BSxyHSDGm5Gq/AQgCJx0eMFYeB6WeMbvCyA9/W0jOiASmGWKp+W0/
	+//g9kpM1g7d2GCAxNzA2lxyYUUadRQ=
X-MC-Unique: l1EHB0llMpyKhJGKMg4Bjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTprzOliNT8eaxHUPP9XYT/lOIws7ZSdDiDQJ/Tchqs6r37a0chTmmqo9JxkkqwYT0hhkktbxD3aBtZDUYJKRJvaO46G791i6Ag8+gn+e9CBE5iw1+yhqjpJ07XkdAS/ACY1krSqiWHXef0EqJKJGGbH87jtSnTr1Pm1dcqRuVSOAPxikVf0SGZm++NH43uTaT3jUjk0M5Fwy5uRrX0X1zkEkHoN1yTKcp8sIU19A2AJfMqWD2jd5LoCZHGT5aaz7rE0lzyllBmDiUl+6hUsN4w6+gsMHNPS9H3hg9OkEqd5mSqAPMBmtsr9G2F1FMMFTI7Ymmd3sKii/o0vm52j3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=F6No7pRe5XjDcTkRgjdWd+8yzZrBfcMAd46s/hA9XNE=;
 b=bL1MBn+w5gQUv58bzgMEXlsWMloMEbFPxhisnDddHxBHzNli5DwnUBNWgykCY35t3Co29xVKE7MlyTUKMeKNyeBR6GgQOq5KIwu+ZiWprFNuenGLJvkpGg/aiJrJ/CY79Cp5ehJn3EZQLmW/F0cSYJjnEzegU83c0VIxOcDlDouEkYG4Glwl4sGiIEp13v1D/LF3Fc2nlwpR3aLosShsRFev8Y/e8ISN7aFqWdGdunCIwmOsjYwSJtXdQ9b5GFYfNoBwn1DNQQLANoXeJb8pT2KKrLbmnhBTvn0jTuNiBfyoniHmT1MDbgk2MnsdN1c/VYp1rGV+e9Cnjlxa4gAWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA
 initialization
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-26-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6973324-52e2-1c78-4f57-929d3af07a80@suse.com>
Date: Fri, 24 Sep 2021 10:07:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d6e22f1-d52a-42c8-c5a2-08d97f326d68
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168439786B2D16EC4514FD4B3A49@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IxTsph81lmTl/c3MBqxVQ8TpB5vHsM3Un36kTpAsx2ued5k+uQC7p7TW8imzfOBe8RRyOi8iU13kwVNvevjFa5YCT8iGok0HprJRW/ccDEprxAOpXtHa6qlsytJ6YKcOBeNekVdezxYwzObPkp/TBrqZL52iiAfE3rtsXjlylII2S3ysotS0rptpWlU64aXQ1Ra6aEKARZR8PGJPs4rMKj27fgY5iqHc7/OE26yw+5md+8SF9rMIvox9kEm39he+iubcUH0bcEDwOwcbmO2LZxiwLOcl0CmD5SF8No6cECke6T8C9qYWvHg2d+JMgR8sLKpy+7ibVzsM0u3tUlh7+RRr8YpBZFXaw83g0MMMfc4zmQcIKPoKqvQxeAlHGV3UzxAPkqrpMFtz/JzSX+Pgwd9I9C9fLE9qPsz9/yTOwOyJtJrN/kbX7whXhm/Ye8A2SKdpxxyj8sizrUrKRdLYiZoaIG5K5fWCDXEPXQZEmH150r0CzntybIO9fj/ZIP1fAlH0IvR50tck5MNyIjz0+uWQw9LGOtBDxj7mAq4W6oHBTObYX5Fu5bsivttemdYF1F0aPxl/QjF78UX1GOlijsdcM9LFH2S2nw2pOKAo9rUhCqnFYzBUpbiaa21aGI9L64p1DsTW/omS6XQ3H2UdUjhK9N3qP4eEmtavaDRRMhYr0nd88Jq7yytonWxtlDF1ZmPjEnyiKqSg1/oSQndK/zVMYH2sDB1/lmUceoKgd1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(2906002)(53546011)(8676002)(956004)(8936002)(66946007)(31686004)(110136005)(316002)(36756003)(4326008)(2616005)(5660300002)(16576012)(31696002)(38100700002)(6486002)(86362001)(26005)(186003)(83380400001)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVFNjFYTklSdTRtM3FUS2VPOFdETGZaY281UTk3Z05hdmowanBEbTdSNGVj?=
 =?utf-8?B?TEpJSFQ1dytiUHhyYmh1ekpOQkdBOTgwSlRielVSci9qdHloQXQxbXhiNmlo?=
 =?utf-8?B?OXdINGsra3B5a3QvTk0zUUc3dm1VRnEvaVk5V3RDSmRzWXRnOHlDTnIzLzVC?=
 =?utf-8?B?TnorODVOLzFEWWVubkNtQ1k3aGpMMnZEck5VS24zZ0VCbHdsRUhncnhpNUNU?=
 =?utf-8?B?Yk5CYlZ4d1F6TS8vdGFQYWlLaXkvd3dIQWpUaEVONWw5N01JYlhWTnFqQ05W?=
 =?utf-8?B?UkpCNTEzMFQ2Y1VXMS9pYU9xSEluZjhuMlN3Uk1kRnRmZTJWSitzNEhGOUJH?=
 =?utf-8?B?aGZOK3kvSmxHRG5UWmNOZW5UU2t6U2ZmM09EakpYVHJjc01UbWhoNjlmTm90?=
 =?utf-8?B?aUNVMk4wd3k4RWpuZjRmRmV3dlZYMnZnVzNVR2pldkZsdDNxa21wSkp3MWc2?=
 =?utf-8?B?UVhUMGUzZVgrcG93bVlvN1Q1UzUwc2syNE1RQ3k5Rm44SVdmN3d6dWVuMnFJ?=
 =?utf-8?B?ZFBkN1U2YUZoM09XM2hiTnRidG9HSnZEMEsvNFkrWTNOZ0oxWW1KaEpOR3dv?=
 =?utf-8?B?M1I1SHNmcFJKQzlyT2pEc08xRVV5WlJIVURSVCtzb3pEM0psWW1GYVNWRnZT?=
 =?utf-8?B?K1FOSWMybWRwNXVsM3hnekdiTUU4RG9Yc2VERkp1N3Q3MDNZOEkxVlozUkVk?=
 =?utf-8?B?QWh1YUlXalVQRFJ3NHViYng0ZC91U2p5MHlKbWEzMFluV3pjZXNoazgwUnRK?=
 =?utf-8?B?NmRvTFVvNE44N1l6aS9Hbi9LSVZ1dFpvYTg1bkxWckN5UWozOWJqdFBNcTRn?=
 =?utf-8?B?Mythek4vTnlIOGFkYkUxQWFRM3dzOUNEN3lhUlRlSDh2THpVVFNVNmg0ODQ2?=
 =?utf-8?B?TzErcGJwcDYvcjZvZ2UxaFNjcXE5ZG1MWXJSREo4YTR3TFZ4S29OTU5SNFFD?=
 =?utf-8?B?UnJsUUpFcDB4amVvelB1UEJ2dkF0NlE3SjdkdURWekJpb3hGM3FnbGh4QnhZ?=
 =?utf-8?B?L256VnRsUTY1c0ZOMEtmVEZyMFE1c2JFQzJKL0h3WXZmQ2VoL1p6WUZyMUQ0?=
 =?utf-8?B?Y1FKTGp3MDU4V0FSMnY5eExuam5xamMzc2xkVHpjRHF2Vk9VMFR1M2xMem1s?=
 =?utf-8?B?NkNJUFVRcVB1d3BjMWJVYlQyUmI0TUxGbmNnTDU0QlRqRjZ5N1lTUmVKTjA3?=
 =?utf-8?B?c1VBMGZVUUMxK3BOK3h2VnJMM1dWL2prczhqYlRMZkFydjcycVovMG9HZ3Fw?=
 =?utf-8?B?WFVoMEFNdzA2MWpsUHBQNmh6MkwzWEp3WDRFT1B2SXJudjVudWkzWGFOUUtX?=
 =?utf-8?B?VHVpY3ZNbkpLd3FmTE05WCt3TFBXdzQzblBNYVZDaFZLQ2RUUUtFRlZ3eWFp?=
 =?utf-8?B?Yi8wemVKVzZLcmlvRU9reGdMVGptYWU1SkFCdVhqaDRQZHVPU0lJTnplb3JC?=
 =?utf-8?B?MHd1ZXovVEc2YXlzaHo1c09iZmdWZ01SR2VuZWJUbW9zYWs2Q0JzbzdVQjZV?=
 =?utf-8?B?WDZKSlhlekQvK2kvbm9pSFBRckUycGZCVGxUL2JNOExvTGUzRjRHWTJIVGdH?=
 =?utf-8?B?VTBnSDR1cXUzWUpQS2lNRmR0MWpoc002SzBGeThzNU42M3EvZkJQd2paQVBs?=
 =?utf-8?B?cHBUSHY0Ymo1b2pzNDIvUVMzUHh4S1IxSjg0eTBKVzhqTENHMjdQNU1QV3Fv?=
 =?utf-8?B?Z1BwdDM5clNQZmhlVGdMdWxZck8rTkJWSi9EYlg5UmJ1Umg5b0JydHlxakIy?=
 =?utf-8?Q?RZVelcWzQZIBex/l8vINMOoFdtoU+MAR+BOPwhk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6e22f1-d52a-42c8-c5a2-08d97f326d68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 08:08:01.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xyIT/+ngRMeZxvPTZ3G7NmVEZJtwx/8x8vURDUnGYt2oKmREWe1tX0RzvymvE4qq08vrermweoiLVq2kp0l2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 24.09.2021 04:09, Stefano Stabellini wrote:
> On Thu, 23 Sep 2021, Wei Chen wrote:
>> NUMA initialization will parse information from firmware provided
>> static resource affinity table (ACPI SRAT or DTB). bad_srat if a
>> function that will be used when initialization code encounters
>> some unexcepted errors.
>>
>> In this patch, we introduce Arm version bad_srat for NUMA common
>> initialization code to invoke it.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>  xen/arch/arm/numa.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
>> index 3755b01ef4..5209d3de4d 100644
>> --- a/xen/arch/arm/numa.c
>> +++ b/xen/arch/arm/numa.c
>> @@ -18,6 +18,7 @@
>>   *
>>   */
>>  #include <xen/init.h>
>> +#include <xen/nodemask.h>
>>  #include <xen/numa.h>
>>  
>>  static uint8_t __read_mostly
>> @@ -25,6 +26,12 @@ node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
>>      { 0 }
>>  };
>>  
>> +__init void bad_srat(void)
>> +{
>> +    printk(KERN_ERR "NUMA: Firmware SRAT table not used.\n");
>> +    fw_numa = -1;
>> +}
> 
> I realize that the series keeps the "srat" terminology everywhere on DT
> too. I wonder if it is worth replacing srat with something like
> "numa_distance" everywhere as appropriate. I am adding the x86
> maintainers for an opinion.
> 
> If you guys prefer to keep srat (if nothing else, it is concise), I am
> also OK with keeping srat although it is not technically accurate.

I think we want to tell apart both things: Where we truly talk about
the firmware's SRAT table, keeping that name is fine. But I suppose
there no "Firmware SRAT table" (as in the log message above) when
using DT? If so, at the very least in log messages SRAT shouldn't be
mentioned. Perhaps even functions serving both an ACPI and a DT
purpose would better not use "srat" in their names (but I'm not as
fussed about it there.)

Jan


