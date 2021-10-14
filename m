Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A242DB30
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 16:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209394.365841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1R7-00085E-9Z; Thu, 14 Oct 2021 14:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209394.365841; Thu, 14 Oct 2021 14:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1R7-00083N-6W; Thu, 14 Oct 2021 14:10:21 +0000
Received: by outflank-mailman (input) for mailman id 209394;
 Thu, 14 Oct 2021 14:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mb1R6-00083H-6t
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:10:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c551044-d61f-443a-a5d4-d496519f6eb8;
 Thu, 14 Oct 2021 14:10:19 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-l7kgciG_MCC3Vs_32HQfxA-1; Thu, 14 Oct 2021 16:10:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 14:10:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 14:10:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:20b:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 14:10:14 +0000
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
X-Inumbo-ID: 8c551044-d61f-443a-a5d4-d496519f6eb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634220618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l639VDLbiZkVv389eesn61ZpL3id56pUiOhfW4T4v4=;
	b=NTlfm+lxjMNkv386et568NVVmO+W5cPGLWzlpjJZOSLDGmHf0NAtpRAKc+GocL+H+vw5EB
	T3RuACegk1UXoTZaFya56HdPTkZceeqNM3/CVBM4fTFkqMgIoKIte3swC5tww0AMFE9HhP
	PhDbpbMvQf6+AGfOO0U8O6EGCfBLYg0=
X-MC-Unique: l7kgciG_MCC3Vs_32HQfxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSv9SyuBD+OwAlmKzXngWWg1VtrOHGucRaNfV5s6BYmsws4yeMrkY2Rt1Xqc4ThVD0ok5bxRdXH85dBiYclInalZHL5H6xzmfqENzT9hPv1LrW57k//d5ntnU7IpIIFra62a1YjpFXZ9R6B2WA91DihyyGa3fXthXtQK50mBWWLQhb8sIfvBdzaAKuhJ3lUH4el1xS8ZJWj7HCJdqhWc+2gQcXX6Sxo27zogpnLm8VcQnzxrZN4Lk8+rGSw3N1qgDCR1Z5/Qf5Hj6uO7oA5kB1ujpcWOttt4zKZIdvU9+v0+Olyq/DpIrz9TLiXCw4YoJbq+0oETYAi+CwETtxi1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l639VDLbiZkVv389eesn61ZpL3id56pUiOhfW4T4v4=;
 b=elvNPAnR8ZVdQpd1rrdHAxUW/U/bAzVbvIQ0icfUc/WBFNcdRZE82BvV4yDMDw7kcvAyMkkmQfRXNQP/ScRx3mlBHXk87uElH8BSiFbAURQo0sjiuHB8A/OG5U5vVPx9mYfx4AX0eojB3igXRPtX0ORqV7OVy83bKGhP+wNCYIElQTYCued4XLB6goLS8AMqoCtqAnRTS0Ch+5r1uRapyYUqFDtaLoRew75/nWJu0e19HBLmPCtO7y2TRmF1GF9i0vE/mX+Y5wNYeBDkfmzyYmBWvZ6VoEw4qRVgaNbJnZn0bdUzFHc5xWJYWoCgW9Sk6HTKOevA9ztcQd1ZQ7SCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
 <561dcb90-7b6d-4dd6-2ca7-a4a5ec1c5e35@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e829583-d593-3b19-ea54-acb31ee8eec9@suse.com>
Date: Thu, 14 Oct 2021 16:10:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <561dcb90-7b6d-4dd6-2ca7-a4a5ec1c5e35@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 106193ee-e61a-438b-1ad9-08d98f1c580b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57420A73E277DEF8E6B17F2DB3B89@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ARquG3QGZPHksLb+wD0RKnaVIwFvVvkUggLn2gyv2Wh9wWcwNt4ZZ0pgMYltOwC3/N41s1+iQg3ghmqFaVx54r3G4H6fg7OMHKC128ygzUtLjgjmBVaFbwkAKiSJu2lpvpuWB7B2d9DAvYt+rKG4c8hbFvokdfFm5sVP+Zyaj5fXly1vNcS2cP/3qLo1p/X/1j2UDhth2SOo0Ido+V/Y03q7VdfZMfzWBgnnI3eTC34TwUeU60rukRlfb6DYCrmwXHvjVXYkT9SO4iqkbbUJuQd0QaaHwJ00Syf0MD6g2xBWpbFkeasaxyz/F+H5tmI1gY0d9+mNC01jKz37CEKXcRcH8js9Wz9sdBRWEhM3LawnKeJOlmFzezr0JfoTCr2vFwmEPYsBTKRChnE5nyQ+aAxQAY645r8w1PCUljyO6ZVNb22VVxFIRgApuo82m2mnqwEGz0iE8GMHdOrE+bh0CAzKQsSZsZv24sTleFJjYmZZk25kz/ZD9Uqf2jb6gcZ0wsa1XdsIHIzZuRXfOpJ5WHn3NpIf3Kwpnha2Txf6gsaLFQIptEJXKmOpNrFyQih7gT1hkFStcf6ukl2JV1ngh48/tm9kzEkhPYbqOrP0VEPDZzkO/2A+0QGT+lbEqhmzSUMYKPKpe8+q8VPrDjRbgkiakpcD+wT/ZsIRppMe8UYtOEBMd9HSD89A9BbGHGmz0OBBTTbjaZZN2SHIfdpAJBaoiGKjV/LdoE8KfRYXmCXBTb6IyRg13SQ02quF7OWZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8676002)(186003)(31686004)(8936002)(16576012)(83380400001)(86362001)(6486002)(26005)(53546011)(36756003)(5660300002)(4326008)(31696002)(508600001)(38100700002)(66476007)(66556008)(66946007)(54906003)(2906002)(6916009)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFFNEVLMmgxVjdlTmo3Ynl0QW5yQzBRV3hwaUh3d3hTYXVRcld1d3lHbThQ?=
 =?utf-8?B?TmhKdDFmMWJGV1c3Y1p1bkltMGl0eDVoS3BYTG92RFAxWGZESXo0eXpLTWZR?=
 =?utf-8?B?KzBkQVR1Ni9RSEpCeCtBeVlEdTJGc3RYS1AwNU5OWUU0UzNjMVlWemJ6b1pL?=
 =?utf-8?B?Y1kxendIZElIckdiUitEODhXNkFSYTFXL2thZVY0aXdHSE9lUzVRcnlZcktO?=
 =?utf-8?B?djJYY0tVSHlWbmtzQ2NPcjhQRjVGMnJ0M0VIaEFDdCtTUUxOOGhOaTJQMVdI?=
 =?utf-8?B?VFE3RTJURVhjdFo3OWp1NWhPR2lTdVQwdjFOOWdycCt5bnNVaTg5ZGxwYktr?=
 =?utf-8?B?ME5jRlZBQzh4ZUVIdnJDTS9rV09BNjhNNWZBZW5TdTFwc0RaaXpiWVdrSHYw?=
 =?utf-8?B?aEFlSVM0bXJNeGdISlppeU9ObU16bTlWSlV1cW9OdTF6bjhNK1QvUEZsWGZB?=
 =?utf-8?B?Z0gwelJQWDFGYThiQ2lVQjU2My9lNEUvc2t4THdURGNKZ0VxdGQxV29SQ0xN?=
 =?utf-8?B?VjluQ2QvWHg3ZWxYaVk3QUVEempSUVZ1Ry9iNWQ4UFhKaG83czl4QXF2T1gw?=
 =?utf-8?B?SC85azk3SGlDWG04TlRFUkVPWXhuRkdvRUhDNjZrL0JMeWlNZnN1VW83U0ph?=
 =?utf-8?B?Z09oNklVNVhISHdWLy9Ra2FJVDJZS0xNeXlkSW1LZ1hlSGI2cll5M3AzU1lu?=
 =?utf-8?B?NmwzNUNVbkhycm1aRzRuYzAya1pLM3pWNFpSbFMvbEQyOXhpb3g4eVBVQTR6?=
 =?utf-8?B?T1l4dk8zZnNwNWNrZHliekZyZVZEREhMYzFWQ3FrTnhUcXZoblVJa3RzU3JP?=
 =?utf-8?B?cUl2andmVlRtVDdsbU9BVlNqZkNRM1V4eUNtWXJSUjFSR201MElxWnF0TC84?=
 =?utf-8?B?aTBQZWdtbjQrMmYyek95VDRGQS9JU1dISlNnd2tKNzBKYXhrV3pJOWg2cmFL?=
 =?utf-8?B?QnVsQ0FMbmRSV1dzNVJGTUkrN1o0dzVwdE9PcmU2TGhzZkpaTWk3M1Y2L1lo?=
 =?utf-8?B?aEtCYXlIdTJhU05VRFNnMm95SmJtZ1BDMDlWSlF3bEl3YnY3cHdFWXd3N016?=
 =?utf-8?B?VnBSTnlLQ0hOYzErdVdhR0wzRmt3SnkwMERmL29seWdXU3krQ2RMa0tYdHJ3?=
 =?utf-8?B?dnd2SGREL0prdG15d2tWMlh1RWNzYkZqT0MzVCs0Q0lZaEpQMWtrS2lMbHBr?=
 =?utf-8?B?eFlVWXd5RFptWEt0TitlZGFyVTlwWjNjMUh0YWdtaGxQWk1OTjFpdlROU1l6?=
 =?utf-8?B?REFlSjN2T2pQVXNjYS9qZ3FiVFdPc3pQRjV6VkZFa2FIclJoZk9yY3hqMkNt?=
 =?utf-8?B?UlR1dkpyRndYelBRcEtQa3hiaTN0L2tCeGxoQ2RoNVdKU3hDcVp2TUhGWXNX?=
 =?utf-8?B?eUo1dEVtelRCY1pDeTY5MGJUSnhKSU5xSEMvblp4eUp0c1hURFZkbDNrVGpZ?=
 =?utf-8?B?ODVFRjJHZVdrR1JsMjRuMGlPRGR4VEkxNjZ0KzJNSmdWTWQxTUpDQTFVcTI2?=
 =?utf-8?B?MTVJdU15cUtUVXlVZEhyd1Z3NFQraldGSDN1dnB2N0F1WXRnTDdZdUdKVEdB?=
 =?utf-8?B?d0UxZ0c2U1d6NWZOdnRiMTZLOWpka3RJWmVOV09ZUm5qamZLZW82WE8yTERr?=
 =?utf-8?B?WkdFeTROdm1rR1lwTWY2dGFOY0w1NitCUnlUVkhrcVZyaS9hOHlwTHl4NlpI?=
 =?utf-8?B?VHR1bHlNRjlFb3Q2L2pFNUhjK09nejg0SkdBSlhnZWVqZ1puR2FiRFYyaVov?=
 =?utf-8?Q?XClGeEb2P1YxFqTpQEJ7edp9p8hRvi+S70Bs1K+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106193ee-e61a-438b-1ad9-08d98f1c580b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 14:10:14.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPT6cnPYjY21EqYGQiRvgrJosvqZuVqyZ4SJDPjBoQ0KRAMRMqARA1tKuXrEvpjk2OWfV3kuJEib3ddaf0tlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 14.10.2021 13:29, Julien Grall wrote:
> On 13/09/2021 07:42, Jan Beulich wrote:
>> Determining that behavior is correct (i.e. results in failure) for a
>> passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a
>> bit more obvious by checking input in generic code - both for singular
>> requests to not match the value and for range ones to not pass / wrap
>> through it.
>>
>> For Arm similarly make more obvious that no wrapping of MFNs passed
>> for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
>> Drop the "nr" parameter of the function to avoid future callers
>> appearing which might not themselves check for wrapping. Otherwise
>> the respective ASSERT() in rangeset_contains_range() could trigger.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I find it odd that map_dev_mmio_region() returns success upon
>> iomem_access_permitted() indicating failure - is this really intended?
> 
> AFAIR yes. The hypercall is not used as "Map the region" but instead 
> "Make sure the region is mapped if the IOMEM region is accessible".
> 
> It is necessary to return 0 because dom0 OS cannot distinguished between 
> emulated and non-emulated. So we may report error when there is none.

Odd, but I clearly don't understand all the aspects here.

>> As per commit 102984bb1987 introducing it this also was added for ACPI
>> only - any reason XENMAPSPACE_dev_mmio isn't restricted to CONFIG_ACPI
>> builds?
> 
> There is nothing specific to ACPI in the implementation. So I don't 
> really see the reason to restrict to CONFIG_ACPI.
> 
> However, it is still possible to boot using DT when Xen is built with 
> CONFIG_ACPI. So if the restriction was desirable, then I think it should 
> be using !acpi_disabled.

My point was rather about this potentially being dead code in non-ACPI
builds (i.e. in particular uniformly on 32-bit).

>> @@ -841,6 +844,15 @@ int xenmem_add_to_physmap(struct domain
>>       if ( xatp->size < start )
>>           return -EILSEQ;
>>   
>> +    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
>> +         xatp->idx + xatp->size < xatp->idx )
>> +    {
>> +#define _gfn(x) (x)
> 
> AFAICT, _gfn() will already be defined. So some compiler may complain 
> because will be defined differently on debug build.

No - _gfn() is an inline function as per typesafe.h. (Or else it
wouldn't be just "some" compiler, but gcc at least would have
complained to me.)

> However...
> 
>> +        BUILD_BUG_ON(INVALID_GFN + 1);
> 
> ... I might be missing something... but why can't use gfn_x(INVALID_GFN) 
> + 1 here?

Because gfn_x() also is an inline function, and that's not suitable
for a compile-time constant expression.

> In fact, I am not entirely sure what's the purpose of this 
> BUILD_BUG_ON(). Could you give more details?

The expression in the surrounding if() relies on INVALID_GFN being the
largest representable value, i.e. this ensures that INVALID_GFN doesn't
sit anywhere in [xatp->gpfn, xatp->gpfn + xatp->size).

Jan


