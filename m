Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F265402625
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180693.327448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXLS-0001sI-NU; Tue, 07 Sep 2021 09:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180693.327448; Tue, 07 Sep 2021 09:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXLS-0001pb-K7; Tue, 07 Sep 2021 09:24:46 +0000
Received: by outflank-mailman (input) for mailman id 180693;
 Tue, 07 Sep 2021 09:24:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNXLR-0001pV-PT
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:24:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f73a761-0fbd-11ec-b0dd-12813bfff9fa;
 Tue, 07 Sep 2021 09:24:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-cfbypJ0_Nrq764JVaelNew-2; Tue, 07 Sep 2021 11:24:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 09:24:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 09:24:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22 via Frontend Transport; Tue, 7 Sep 2021 09:24:38 +0000
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
X-Inumbo-ID: 6f73a761-0fbd-11ec-b0dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631006683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92ya5n/p8bGdMWSZW+gUJtmHj66H2FVO1aSkxTQSLw4=;
	b=QzJJVhKi/BbrifPvFvsjTgC2Y0ncm0cfJZUMoUwXXHA+HnziDTkSefGwt2u1q6R7SDNOAk
	ozYFMudZfjxymSf4GAZjO06BTnxgYTS/Gid4yzwlEeU80LZ7IIQXcYvav+7D6GcaDVGL58
	iQjiESJEsSn8gcO45g/dlgzYwVrHNQw=
X-MC-Unique: cfbypJ0_Nrq764JVaelNew-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoCUmH7KES2lcCuH28BWCZKl6vv2eWfI4HT8dr0g/0nO7odmgcFf73a1vWyY/QFbloxiHlu/o+d0vlQSBVX4LZEvflsPxUpmlwl/0uC51RhmDyLKqUeQuI7BCEebM6t9EgdP41pRPXSxYj30li/EUSHICh5qiCp9JU+OXpaIdcU5yEGCaXDgNtjrSApw0cV5lZ8EgdilziI3rLLqn5ZpQxBg8BhDyZSqRTmwT78tx6qIagR0zevvkKpqAC39hG2wpguJRw3nmnA/HMYh/TIVDXZlJwFFVOvby/dxCyzB3mrcpensH3ChPuU6tpjpF8l+7brB+f+4FzfPK1Iehy9Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=92ya5n/p8bGdMWSZW+gUJtmHj66H2FVO1aSkxTQSLw4=;
 b=h7S+x70DHmBh76ah0GwTyHqR+dRxkrb1+iJZBBYadrJTUly4NEMHQV1ARKb75e/hcUAkTt2TkuTh03PnvuaXrbULUCWVEIa4zZaMf+h3kWsqCIAybCCOxKqQfSw25BugGDZCxvuR+tWoRKqfEhBB+qMv8KMa4C5zMp91KF4TVXeaulCWc3NPNRCgk7+ksg0s3J5nsXTKNlZ6qOZwpsFHdcT6WESKaf4L/q7XiKwMBw4/XFfm/JHefzdFKryRIe3UEbdiVB1DIsC0gMd4wqj+jjLDlh1imh+842GF/BC659oLPxtrJnVWh+CL9gLCUXcOopoFjlG2YQ+BG9aJyaUqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <ea736db5-e3cf-7eea-cffe-98ecb0290048@suse.com>
 <3222722f-b12e-3991-d0de-b455b9fca063@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b4eef88-78cb-7201-c326-551261f9e9ad@suse.com>
Date: Tue, 7 Sep 2021 11:24:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3222722f-b12e-3991-d0de-b455b9fca063@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c45b6758-e959-49a3-d3c9-08d971e15136
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715211BDE62E1AF911727DEFB3D39@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T4Nz5BsL4QGfoQ9urWOtzoRhB8eKZYHxT3Wrc2gHfWtx7WzBfYsnhJ5NaCN0s6NFKtpYCsKP99HK+fCJKtscsuDFiVMwgE0efAKpk7ZcdlaPGAqsMXUZRc2LKNCksens/v9ieFiliwOB0U0kEWN+JKDe+hrJEukSwnDYe3hD+jArlaWDSI1UqK1illwgwiIIfIyKgqx1sTTLOGTp5CA6V0xywsx8sYBcco6UV5sGzA5CoZHsOwqUGqVN28VkyBoqQOew3xIBdS/434fQAJBAxagKPk40lWPbT5ysTCRDecIhR97vSxmj6hNZmkElwHzCzn3J96yG3GTGmn3smDCVCbB2nYwGlNs0PeM1MbA0ozHKVLXp5edX4xBxckNf+NtSNoJy0x4t8XoD/Q6BbbEpFY8ig5oeEKYcUmvUs894JTY57LcUKNWe2jn1txBPB2Rvw+ixvzrMVpb1rAeJtomCtPhqrrNjCJq7QEXj72Up3mWDrMcq7kgl944a9rhv6aBj+3uZhyNK4MsNwIK0oluJyDxmY1/bW+CncwDMJp9oOAplEedRMhIeJJcLMRx93T5f7JzudC3Osiui1OGP81npXi3nzVkdpYrFeog43ymEE1vmuV6JfgC1+ccnUoUPwv/1gLYWHRxue2oPUdY/dolVakrp0uBHEkIXk0WmTDqnwPZKBnCCjzEBundkwbVTXYZMvKX8hq8JEKa0t4vNOqfefd24tdljXpHX2Rw043HWid/O3qT3lB/QS8Sy6tIf4TzG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(366004)(39860400002)(66946007)(6486002)(66476007)(66556008)(83380400001)(478600001)(31686004)(36756003)(5660300002)(7416002)(86362001)(31696002)(6916009)(54906003)(316002)(956004)(38100700002)(2616005)(16576012)(2906002)(186003)(26005)(53546011)(8936002)(4326008)(8676002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDR3NFJFVUsraW9XZTd3N2paYjByL2xqUDBHcis2b2x0YklJNXFZR2JuTFdF?=
 =?utf-8?B?RlhDalhkUmhtQjlUZkVhWmN4djJ3NzY3T1dVSmNBdXlEdUNibDV2SjZTRUw5?=
 =?utf-8?B?OG9heEo3M1NnUzVJeWwzRGgwS1JxZ0FrdUFnaWVvSG5wUVRQSHVHNW96Q0dI?=
 =?utf-8?B?WldkNncva1JoVXMrZDkwbGRvZy9yeHNPMW9QUVRuNVdnbHQ4TWZNTEhVUFYw?=
 =?utf-8?B?ZXpuU3ZrUENSTXE1UVQ1Ynk2WllnNkM4Vi8zekEraytBTlRMNTlzMjVraDdJ?=
 =?utf-8?B?c0JPaG0yQnpxaHg5VGFmZjJiRGVaMUMyRGlYTy9HenBHY2UyUDJhenlsSWg3?=
 =?utf-8?B?ZHN5ejhVQ1VYVU9OeThVRHRvbmdESWxLMUU1RmFSUXUyb1hDaWRoQ2Z2bXdn?=
 =?utf-8?B?V1VSRm1tU0FnMTFIUFZkazd0anRmd3dkMlJvN09ENDNrZ1BncmtIRTIwWXNQ?=
 =?utf-8?B?bEFKUEdRQzhFK2UyYk5DYnpwQ2c3NU92L2FxTGFxWERmUm5rYkkzRVRITXZ0?=
 =?utf-8?B?QnIrWlEycURYNitnTU1CejVxbFVHYUpZWlRYWmd0OVBzZUVqTWQ2UHBZV3ZP?=
 =?utf-8?B?MDVDa1FVaEtuUUlidGNXRm8yT1gxcnFmN3QyM1RWUERYcFJqcU5SUWYzR3dm?=
 =?utf-8?B?dTdJaklVYmxQREFwMnZqU0R5dWJMc3dwUk9OUmh3NXREZ1NCM1NtdlU2R01B?=
 =?utf-8?B?RHNiMDg5Zk1CWklRYzZoNFRjakM1SWxzbjlYU0E5Rno1bmxnN0VONkgxY3ZM?=
 =?utf-8?B?VThCbTRXYXUzSm5GL0NJcTQySlQwMENxWHY0U1dGVnl3cHljWURVU0g2cGJE?=
 =?utf-8?B?d3lnL2w5cFJRMDR6R3orUUNyWFIvNEF4TGZSZFgvalAyMkhEYVVrUVJCbWdp?=
 =?utf-8?B?am52RnVCcFl2dU9WTkhISG5OSnpIdFQ1VGZMUlZod2V3U09RZVd1Y0pva2pF?=
 =?utf-8?B?aFpia1JVMGQ2dVUwR2ZHY0g4R3BYLzBTYStJcTgxbXZGdzJYZGFYYlMyVll5?=
 =?utf-8?B?ejFNUy9aSVkvQjVzRXVFOEJNQk4yT3J2QjF4Y2JVbHRJdTRSUG8xYzF5eUd0?=
 =?utf-8?B?U01USXlkdUpYYml3TFRmc0lpelhORnRnMVNWMmF3SVBLSWQwandrVU9FL0d1?=
 =?utf-8?B?Nnp5UzBrUm8ycXJjLzNsUy8rSTFvbnc0ZE92dmpTQnVDemhuYkppeDlGSmY0?=
 =?utf-8?B?eFNjNEhSMGNEa0Z5YUJDem9HcVBTbzZpTnRhME44NUR0cEVOU2Z1dWxmQk5M?=
 =?utf-8?B?WWloSGliZklEV1lld21HOEo3K3ZQamQ3U1FLUmxkWktNc1B3ZGg3MEpiYmdu?=
 =?utf-8?B?dnRBNDc5WXN1U2ZQZXdnTmx3QkdWY0hIZlpiUUYrMExGZEZDS2NSMlZuZkJZ?=
 =?utf-8?B?TXlwdjgwOEVtY2Y1MlpoUVZmR25jTlNzWTc2VTRPeE9ISG1QME5MZWlTRjZ2?=
 =?utf-8?B?TFBaMzUwQ0pLOUpERXNURmIwNnByeWxwL3lMN3EySHdPSjMvYWdYanJpdEVE?=
 =?utf-8?B?YVgxRXZ5YzJKN0JSUlAwOVRHSjk2T0RNaEtoUFhiZS9qZGxRa3RBWFM4SXNP?=
 =?utf-8?B?R1hSK0FqUjJCOWhzeis0cUxFckFjdFZ3aDUvcllxS3lZUkNuU2toOXlwOUZx?=
 =?utf-8?B?c0hnUEJDTmNUQXJ6a3lYZUc2Q2cvWVBUUnVab3d4SVlSOTlKY0dUZ0RIYTBa?=
 =?utf-8?B?QmpSeEVHaFd3RVQzb1Q3RnNWNnEwSmE5YjFQSTE1SWVJdnI0MzFpU2p1emla?=
 =?utf-8?Q?NMGkA7AfmeB1l8lUbX3a15/OIHd+Ra4oeDBFGLY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45b6758-e959-49a3-d3c9-08d971e15136
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:24:39.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNgdy4r1gZD2LWgrT6GFIy+FwTuDdZ48xSCbYQ9RBzK0hv1tKrfhWtzqHScbPblez7R8jpkePLvoBsaTpoZXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 07.09.2021 11:17, Julien Grall wrote:
> On 07/09/2021 09:33, Jan Beulich wrote:
>> I'd like to suggest a different scheme, not the least because I expect
>> the individual domains being independent of e.g. hypervisor command
>> line options or Dom0 kernel versions. Yet varying sets of these are,
>> for example, a reason to have multiple sections in the current scheme.
>> Every dom0less guest would then require spelling out in every such
>> section. Hence I think we'd be better off having a section per guest:
>>
>> [guest1]
>> kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
>> property=cpus=1
>> property=memory=0xC0000
>> dtb=domu.dtb
> 
> I much prefer the idea of the section. This is going to be easier to 
> parse the configuration file as we would not have to look for "domuX_" 
> and then distinguishing X.
> 
>>
>> These sections would then be referenced by other sections, e.g. by a
>> new "guests" (or "domus", but this ends up looking a little odd for
>> its matching of an unrelated latin word) keyword:
>>
>> guests=guest1,guest2
>>
>> If it is deemed necessary to make sure such a section can't be
>> (mistakenly) used to create Dom0, such sections would need identifying
>> in some way. Presence of property= (or, as per below, properties=)
>> could be one means (allowing an empty setting would then be desirable).
> 
> I would expect dom0 to be described in the similar fashion at some 
> point. So maybe we should name the property "domains=...".

Not sure - the order above doesn't mandate domain IDs, yet Dom0 needs
creating with ID 0. IOW I was deliberately suggesting "guests=".

>> As to the properties, is there anything wrong with having them all on
>> one line:
>>
>> [guest1]
>> kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
>> dtb=domu.dtb
>> properties=cpus=1 memory=0xC0000
> 
> It depends on the number of properties for the domain, this may become 
> quickly unreadable.
> 
> But... if we use sections, then I think it would be better to have:
> 
> kernel=..
> dtb=...
> cpu=1
> memory=0xC0000
> 
> This would also allow us to create more complex setup (such as for the 
> static memory allocation).

If that's feasible parsing-wise - sure. I was first thinking to suggest
separate keywords, but then decided there was a reason this wasn't done
in the original proposal (with respective dom#_ prefixes).

Jan


