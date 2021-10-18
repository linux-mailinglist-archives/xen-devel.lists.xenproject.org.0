Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7543231E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212465.370340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUk6-0005IH-DF; Mon, 18 Oct 2021 15:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212465.370340; Mon, 18 Oct 2021 15:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUk6-0005FA-94; Mon, 18 Oct 2021 15:40:02 +0000
Received: by outflank-mailman (input) for mailman id 212465;
 Mon, 18 Oct 2021 15:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcUk4-00057K-Bc
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:40:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7fe01c8-fb38-416f-a107-1ddf74c73c0b;
 Mon, 18 Oct 2021 15:39:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-a8NaJD8MOy2AJM3GOqgd6Q-1; Mon, 18 Oct 2021 17:39:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 15:39:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 15:39:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0220.eurprd06.prod.outlook.com (2603:10a6:20b:45e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 15:39:55 +0000
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
X-Inumbo-ID: f7fe01c8-fb38-416f-a107-1ddf74c73c0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634571598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUPUgUGRp82d2oHDYxtXqy24gz5P2252wrJjPKdhjwo=;
	b=jXie1cN/H+qUFCVHf/DFiB89BXsYlsx0cmVNYM7f1DSz5pLZ65jyrsIY0CiXRbgqJ7gYrV
	5IOt9Kt34WHghA9y7Icm7iBBBcpm4NUVADHWcqAX6r5JVb8yr//WaZesp/GWDEpMRI4ISb
	aLrPkzsIEclo0H8K3JX/XY1+ZqutJ8U=
X-MC-Unique: a8NaJD8MOy2AJM3GOqgd6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib8hlUX8KXdi0BkzIIkHZ4z7yeqlyDWsULTVb5GrXyvGsJKWXFJKd2uqJimjK/DSvWWFhi2Uo4PpnQGrBNWp2rUNWlw2B5MRv+mur98EOFFvNb8NMVi4+XW/kyu6sT/B7+2Cl6sQR6DlFd27x9mM2hBOZyEetwKgX++ikMEHI/5WNBvMoohizm1JczCI5JlczVe6t/mbIjdG5iw/FlskyCLXRA6h0YT1LqUwASCxGRczYQRh7BhJtq9pj872IvvK8cW/b+dsz9gMziEiquPyecKgID/WuNe/lIB0o59BguSeKt3XuuGSPof7Xh98nmg5wKJnxBT2MDS8GJspPy0IJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUPUgUGRp82d2oHDYxtXqy24gz5P2252wrJjPKdhjwo=;
 b=kjcj9iJsI56tH18KHS2n5+sGF5eTUNgqAAthQ0nLQAaiJ6QM2dZsK29GTpRqy251PN5AcqQtkbosYf3BkzkZEBUE1MS9xFKh6Wzx1CPyzur9VV2125AVxpGFls6uwR075YuUIwDEx9+qjAlc9CBeUHOgASZ69+AynZ/nkzOFnJMd5pbtcNB+LpDFWUCoK9mSv33obOX6blIglygPKmlK53PWJdTfDQJ0+R1nKT8T3jN4P8OjCtUj5TDXriY4vXLK6F92/JnaR60YZvOTvWlm3INtq1GCMqXd7Z6vmZezcNqLVTsS4bEkxLIVbLCHCxn0JSxJ/jnW1erI7PLfYLnrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
 <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4050acf-b9ce-e619-5357-96fed8324215@suse.com>
Date: Mon, 18 Oct 2021 17:39:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0220.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e5fc9f4-ef67-4f44-86b7-08d9924d8906
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31186546BCBAD20228C9B1E2B3BC9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nvKGsGO3aFydaCXGGwcz9lRFWd5BqMz60KW6sMczbjYA+CE/Z1xA7bpjrVjizUsoxmG9tn1JtkIw4yxrHvTQBLJe2rR4sW8jNteqtifhjw/ajlHnUqIiNc+BlZBRQ3wiv8MkKwOZDTrgkC9rTDnQTZY1QvXZCMKPCtp1X0LwlMYZfSaNbGSE7v8KsYmS7vlecYZca8eZsx90C/fbkWUk3xm6vPg5pi1YL1uPRdqyiW96ERaC68CYtzW1B8gV/ixfk/MC/aeXgBPvOFb/vnAKQPhel5jTsDz2wf8mDFnziOS2pUqc2cYxc/Fdd+FeswbdDQwbmlVJB8asmmDneOTPZrux8PxZ9IIWaH9Frf4IfAGJyk2KzIcN0Ddl2ovcAk2hIdhjTlTNYI4RdF0N/rWjXQkTH3SLbBHSIp3FUwpexml0aoeX987YitjhVktGR51Gdvx6g+KdFb7CxolP5J7WOQLjcJUFGz6WZqxRRIqhi3TxjBRsT6g0zhyVdWXn2qUrguIZLD4XIjdYTaJBcolWTGjfSdLZVhLC/pQDSvHKHfzU2nqJ2G7FR4+zd02M+mmtpJl3LjcBN+ucOwvvs4uc5cH9kD0jslbWB/BYrY5Vwj/oRBWYmvn41g7K1+INyEuJWNQNwIdWVDY36xqo/H0VVl+/TTZF7m6qhbZ1WXWvWBWyrJcVuANBhlA24pt95JlRhBZMajoX7OmsdyaB/PjTjzc8bhbSF64UGdzlriVJSYCgPOVB1lg2uKbGzI4Z+3f2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(956004)(66946007)(53546011)(83380400001)(186003)(6862004)(66476007)(2906002)(316002)(26005)(4326008)(16576012)(37006003)(6636002)(6486002)(5660300002)(8676002)(86362001)(2616005)(66556008)(508600001)(36756003)(38100700002)(31686004)(8936002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnlGV1Fwb1ZkUGs2NjJjbVJxM1JsNG4rVGdnNkhsVkNiaHIxM0diVW01a3ND?=
 =?utf-8?B?RjVEbjdVRHQzOFRjSDNHQ29Vb2FEcnlDTEFUTjAxZEc3SllpWTBDS05Dc3hD?=
 =?utf-8?B?am1ldEpXK2ZuQVdvQytLdTh4eXordmdjWjMwL2xLQmFzM3FvUWsvQ1pBSENy?=
 =?utf-8?B?YjViNnlpT2hvS3ZhZVZoZjBDWEUzUmloeHpNQVp5VmpOck5VS1A0Zk9BRitV?=
 =?utf-8?B?R0tzeUxvQ2hMZ0lyKzZDbFlMZ09VZnFDaURsaGhoOTBoUng3d2VDc2Jtai94?=
 =?utf-8?B?bjQwblJ2MEk0Y3ArcVFuMEVnTVV0ZUFsS3praTNrVHl1QWVxSU1Rd0xZS3Jr?=
 =?utf-8?B?NTl0bDVxeEhLeUMxZ2NxSFRSaUwzMmFSdzFvVkVxV0lHK09RdVJLaWV0aWQ4?=
 =?utf-8?B?SVhwZ0NYZUJoajR2VlViem1OeVlXaUg2WVJqYkZlZEwrdmNySTBQN0gxdU85?=
 =?utf-8?B?N1FyUUk1bTR2ZnBraDAyTmpoaUtGN290QXRzYjk0QWxiaGYveGxXcittUlBp?=
 =?utf-8?B?bkp1YUlqdnBEbWJiQ1JYWUZSVkxvKzRIMS9BaHFFc1FXSU9PeFQ4a2FiYTFT?=
 =?utf-8?B?eVliMW9QaytBMnh6NTkza284R1NsZlAxMDdMOGJPVGlGc0JIYzZHVmRGdjVu?=
 =?utf-8?B?dGVxMTFCaFZCUTYzVVZCNEtuYXZabkRkR3VZbEZFb3l6aUxhWjkwUVNoS05S?=
 =?utf-8?B?c3VKMndIRDJoNGhOWmJiSzFJZDZwa2UwNFhXSHRXbVcxc2I3NXFJZGU3Y1BE?=
 =?utf-8?B?QlNKLzlnZkE3NFhLWW9lMGhaOWFXWUZ5OTZDUjNlYVBROHFFYnlRbjd4VFk4?=
 =?utf-8?B?aTlzRmNqcFlLTXl3V29LZjN5TkcxUFF3MllwNEJWSXFnUFFnS3k1MDBHR2hD?=
 =?utf-8?B?c0tFUTdOSDRMSFNETkFOd1JnQXBmZDQ5ZjZJU3FHemRKYmRHNnpJcGE1VW1V?=
 =?utf-8?B?eUUydnlPVmdWZjdqU0tOWi94d2NDRWlpZDloalhmZ3dVd2c1V1ZzZm45RVVI?=
 =?utf-8?B?K1o3cWZwSUt5dm1QRjJXTzQ3TUkwNjVDZGFIQkcvbXJRQVk5QTlKeG10STlO?=
 =?utf-8?B?bnF6ZTZYNmVFL0ZiVS9DdnFoQk0xUGFrVk1ZV3VBSnloYlhsSVhqaXJ3Sy9K?=
 =?utf-8?B?TVpRTk82RHUwclBJTFMrd0FlMy9HWWN4TVd5Vm5rcGF1ZWo2TDYyRGNGTjV1?=
 =?utf-8?B?VndYQkhQSjZTN043bTFvNnBiN0hmaUZyUHNia0REN0FDZTkxSlBOeThEMk42?=
 =?utf-8?B?cE13MW0za3VJWitHNHZ3ajRBdzBrbjlJU2I5U2tlQlNEQmFrNmJYRjNsRFA4?=
 =?utf-8?B?N0x0STdXVS9tdjhPVXp0dTJPWXpSY0Fqa2xBdDlVRXlIdi8yWmV0QmdXd1Q2?=
 =?utf-8?B?NE8vMkdUa3BzRDg1Q00zemJJcmhZYTVTUDhYUDJXcU0wcGpxVDJnVURlNEVi?=
 =?utf-8?B?ZE5sMFplK09RN2gwdW9wMmpTQWUwUFZxaGxBMm9lbTJTQ1R4cEdUdFh1aWpR?=
 =?utf-8?B?UTZKdUx3N3k5TVpSRnYrVksyTEREaDNwb3NyVTFpODZaOUJHY2ZvVUMrZG5r?=
 =?utf-8?B?T1dpUEZCT2JRcDdITjNFYmg2NkRFOFlIRTBGWldDQXJjZ0JzbXQ0OUthQWlw?=
 =?utf-8?B?RTdxZmR4ZWN0TjdrTkRaam1iNlFRN1VHKzlGU1g1alRyT2Z6eVN5ekh3ak1O?=
 =?utf-8?B?ZGI5K2xpYzEySnhRc0xkY1BHNmZUemw4RDZCczdqNlZGNkUwei9veVQwd1dM?=
 =?utf-8?Q?u0cK0Htz40FA4ikTHQQgnoRHcf0eJ/9dJ9qNInQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5fc9f4-ef67-4f44-86b7-08d9924d8906
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 15:39:56.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvGaT66FQW6cJ6bwC/kyJYWTSxnZmlnAgVVejnVInB7nQsE7OGHEGnMwsQjddxDKtNGlOnF8qS6/AKhIkzPPAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 18.10.2021 17:28, Juergen Gross wrote:
> On 18.10.21 14:58, Jan Beulich wrote:
>> On 15.10.2021 14:51, Juergen Gross wrote:
>>> Instead of repeating similar data multiple times use a single source
>>> file and a generator script for producing prototypes and call sequences
>>> of the hypercalls.
>>>
>>> As the script already knows the number of parameters used add generating
>>> a macro for populating an array with the number of parameters per
>>> hypercall.
>>
>> Isn't that array intended to go away?
> 
> I thought so, yes, but on Arm there is a case where it is needed.
> 
> So generating it from the available data is the sensible thing to do
> IMO.

Absolutely, if such a table continues to be needed.

>>> @@ -466,6 +468,14 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
>>>   	  echo ""; \
>>>   	  echo "#endif") <$< >$@
>>>   
>>> +quiet_cmd_genhyp = GEN     $@
>>> +define cmd_genhyp
>>> +    awk -f scripts/gen_hypercall.awk <$< >$@
>>> +endef
>>> +
>>> +include/xen/hypercall-defs.h: include/hypercall-defs.i scripts/gen_hypercall.awk FORCE
>>> +	$(call if_changed,genhyp)
>>
>> As per patch 5 there are quite a few sources including xen/hypercall.h
>> and hence (in one of the next patches) the header generated here. If
>> this one gets re-generated for a benign reason (i.e. without changing
>> the header), all dependents will get rebuilt for no reason. Use
>> $(move-if-changed ...)?
> 
> The reasons for re-generating are quite limited. The most probable case
> is a .config change, which will trigger quite some rebuild anyway.

Oh, good point - I should also have considered the dependencies here,
which are pretty limited. Please disregard my remark then.

Jan


