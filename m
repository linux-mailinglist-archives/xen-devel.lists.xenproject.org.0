Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA73F8A1A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173125.315869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGOs-0008G9-2y; Thu, 26 Aug 2021 14:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173125.315869; Thu, 26 Aug 2021 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGOr-0008EH-Vx; Thu, 26 Aug 2021 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 173125;
 Thu, 26 Aug 2021 14:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJGOp-0008E7-LP
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:30:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54e8e117-274f-4495-ac94-d0bd8dec416e;
 Thu, 26 Aug 2021 14:30:34 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-Z-cG6bEJML6aQVhyY5sXTg-1; Thu, 26 Aug 2021 16:30:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 14:30:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 14:30:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Thu, 26 Aug 2021 14:30:30 +0000
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
X-Inumbo-ID: 54e8e117-274f-4495-ac94-d0bd8dec416e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629988233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWfwH9kc6fHt9MLyds0xb2MgFZKMGJezK5n3rnbweMQ=;
	b=jXeqW0QCgM7IK+34lF02klW2Zc8iU0n+48ySXYWhsFzfTqvK7l55dmItO+gyN9YgBXihIh
	sbXgFi9IafIu7L1LUq7Ju8s0U7OF0c7crUNCOMzkFWiUYQDkw6WK0sRAyphLNlk8b71s4z
	tTgLwmKYWc0/+QZ6KsMeqldeAXuRQ6c=
X-MC-Unique: Z-cG6bEJML6aQVhyY5sXTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR7BKSCEaWlUP13r51EhAYEoP/paXBFgGq+ra5LVYaClL26hl7SdZ3JRcSX+L2Y4C/ohjxm2shuEUGAUQMFkYVCaeNygMXFwMiZWn3XExPJNJLYfHOhuphIDiO962l3EFKqQd8zlLbxSQq6amBGcedunJI51T2m+/BvJVqSjJobqgaNuApVwpwI1dMwtxE94OrS3Nn8LgcBndjZqniC7++IcQM5cHoFT92QSKrD0IN+GXquqkLZ7xkdJw1mwj/cUmkV1Pvo6p1oWzLd9SY9QDc3KjTt/InERV8eHCuj65QRlmMx/yJf+BS4FN9bqn9nTFm5BqWtsS6GjQXiPAD6nbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWfwH9kc6fHt9MLyds0xb2MgFZKMGJezK5n3rnbweMQ=;
 b=JPf1VoEWRDBzQaKTtdkRL5Txk21JgZMUxxLKOYW+YwMRubMeNaHckOrQR9g4DKsXxkfJBoreCE5vlHIAzqfbaNZu77/tjVUkts9WnO0tDgLGgIv9QV+acvm0MqTolkrsqrkfFB+1EHJzkZJKI4gPDzrzhz8yvF85dka7+ZvbNQTBaX9nR7dkT5z4YMjrRUVi3eF8r5EeozmT8ZsRblRU46q9pdTWHY81SIsmk0Eex/qVBi0FSs7VttV3++eZdLoQdXYpTvzhQ96+nWKMxx87vU7lOiAcBWH/dyH/tIj437X4+MzBpJr8WGTuUUOJIry7bsq+MXtHY3pYrB0nKGXdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 7/8] AMD/IOMMU: add "ivmd=" command line option
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <1b974a3e-3ace-fbd9-411f-4493963317b8@suse.com>
 <46142ba8-0f41-4c3c-9108-281ece7528ce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1b4e18c-f4e8-a67f-6860-6c65f62d7a53@suse.com>
Date: Thu, 26 Aug 2021 16:30:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <46142ba8-0f41-4c3c-9108-281ece7528ce@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb9095dc-f231-4a84-d367-08d9689e0e7e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43512D7D1C15F7B5435E368DB3C79@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	43jBM3+qpQjtocmG0Hoeh8kotenM/FdVQ/VD4bEsNXcZdIL5GiaOIGVn792effAc3cfb2PRUF6RCNqB8T/8U7djFlcboWi+WO4Auxs+Elt/t1kNBUWjEkIXcnmmPpy+QlSQL66iO1N7nLRhbERzKpU+9839vDnmamDGImqd1qrEclFe6/FFVABKkHhd1jWxD9Je6CKfVkWHL7c0fjm9WdFC5ihkADqU7PAfXX50/lZu5QaKE1IuYORBlmOeyJrAA/JFjFqCcZ5FnXh0saCqhqsnBHc+z9CbFcEpnsuVkjZkIFXtaPtfbMHN+29glQWkTGFfEChomK8XcabAhrYfl+5mlaF2IKiFupJRSvLs1ny0DXpaQhlkrTdFV7R91/iCRNtVTgfjXUtLHU7SqzDIkiKMPObXLSUJkHs85737v1yVxa0sPXFXhoZa+Jas3pE0AZiGUJVaPvh9obgureucjPCBG4KIhbOaABFvN4a3ijz0ywrAO5zeSitaK0RM6GoC1XmMNnjKnyZFRbmJzFVNAYmKMiavo3sOssAqt5DDH8PmVHYQXo7eNB7Vy2nAFp2rPw/8t7rDSn2dn/cXr0CAVjwKdv9WupGNuWugAQbEGViKAQURvufDfhPrxEu8TD/ZV2t7b68Dcx8VDhh5CVDMGASkuqdIxnzcOzbNrVCMO4OQIUIaA/gzQ0IFH4yIzou/eqxSS54V3aI2UUIvBWICf4zLSEnO3WuH6+tZl5f4Vvlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(508600001)(5660300002)(31686004)(36756003)(6486002)(38100700002)(66946007)(6916009)(16576012)(316002)(2616005)(956004)(53546011)(8676002)(66556008)(66476007)(4326008)(2906002)(26005)(54906003)(186003)(86362001)(6666004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNiUWtncXgzRC8xQ2pJSGpzYWo3akhaMWRiNUI0Um56Zng1L0VnOXpJVjEy?=
 =?utf-8?B?UmVzckVzYi9RN0pUQXY5ZGFzbWVQakRBZnZoY1dqeWdmMkVPTFp3cldJa00z?=
 =?utf-8?B?WW1FUE56ZDE0VWZxMGRtQ3J1aTZUaThZbmJVKzdDTzNTOUI4VytGUTUxN0Mr?=
 =?utf-8?B?SXBnQ0JvUkt0Z1J5WkFseWpuc0p0T2Z3Mnh2Uzd1blBnbG1NZ1RKcWlmUTJx?=
 =?utf-8?B?dkRwNjVaYzgvN1pTOCtVZWpKMjg0c05jNVQzTFFzRHpWcUtHRmg2ODdJdUQ2?=
 =?utf-8?B?TUJiQTBkN2w4bzkxTWZDdGZ1clR1MitPY2s3T0pEK3lKRW5aTVhxbkEwQmFv?=
 =?utf-8?B?Wlo4THRwTGlKOTZnNGxmbjhYak1ZS0p5ZVlDNUt6K05TQjNKVkkxZG85R0VK?=
 =?utf-8?B?WnE5OGZGci9NSnhuOS8wTWhaZFg4MGplaEVkQTJlVHRmS1RPR2hEN3NxVEwy?=
 =?utf-8?B?dFB3NmZ3Y2dVQmdNRzRKSnFuWEwxK1Rrbk51MktyYjFUWTZld0tuRmt2Vk1u?=
 =?utf-8?B?V0FueVB1aUJVakNsYklWWE9VZlFyUWxJL3VMaXlyMitYcy9qc0ZLZjZScVQ1?=
 =?utf-8?B?U3pFT1JzcDF0NjJQMHlEK3VKTlJ2NjdOU3c1dGJGYlUzUjJsaUtDUGtBZUgw?=
 =?utf-8?B?TEVsbC96cmpCMmlwbjJhVno0bzVjNmptR0JuaUlEQjByNHo0QitYc21tNE1p?=
 =?utf-8?B?RzcvNmk2QUQyWUtKbHliNGIzdkYvSk56ancwcVN2Qld5QW9vYkpSVXRGK1pC?=
 =?utf-8?B?MWh6OTIwN1ZiQktXVnp3aW9wNitDVklMU1NPZHNPeXFQeXNlcmovOEFJT21K?=
 =?utf-8?B?Mk5ORjVhTUd1OWgrRURMaW0rTnZXOUNyOGhFYlp1dS9TVFpYM08wc0xjeUhn?=
 =?utf-8?B?eTZyWWJNcURHOW1DbllFakFPUVoxYXZjOGFwRno0T0pMTVV4b0YrYnZpcFFa?=
 =?utf-8?B?NFFuL3hSSnU3Rno1eXJQRTUzbHpXa05lcTF6dmNWaGtzSUV4WENCczZrMDNy?=
 =?utf-8?B?QndwOUEwZVlXSHR2dTZXWStEU0FDWStLdGhxOU5oWWZKVXBHakZlUVdwaE5h?=
 =?utf-8?B?YUhmVEJTNXRReDljSDlhSXJtd3cyeHdtL2xxTlE0MVdLTGhyT2g5QktGUkZy?=
 =?utf-8?B?SGR5eG04bzgwM0xvMVRMWUx0ZnBtYkRNOUJiYlpWVUpUYVhTMElLd056S0Zh?=
 =?utf-8?B?N2c4QVBKYnhGb2JiWlZPL2FlUjd6SWluSC9vM3NYTTJSZmdxQXpsSlFqUzdE?=
 =?utf-8?B?bUM4OFdDTjZreTlhVEdmbzI0MGZRdmhCSjVxd3owRTFZYXhCdmVpWU5EZmxZ?=
 =?utf-8?B?TFBnSXJidHM1TllNcVJZSDBrckRMc3R4VG9mRmFoTUJYY2JBMElSVnpXaHB5?=
 =?utf-8?B?Wll5ZW4rNjZDVk9ZbW9wa0JBVTlMZTk5M3l5bWVKYWhZRVhlSlZkVjA0LzM3?=
 =?utf-8?B?aEtUbnB0cUl4RmNLVU9qY2J5YlA1R1ppZDhKK01mQzBDRGgwTnhreGtNbm4r?=
 =?utf-8?B?Y0NQTS9pVUMwSEZvcUpBVmJYRTJRV0t4NzVkZzdSOFJQYmExdEgwbDNpSUVk?=
 =?utf-8?B?QXA4NHZBOUVYWU5MenlORk95QjZkWHZsTGZwYU93ZlpYbGpMOVk0OTFhZkVI?=
 =?utf-8?B?UUgrRkw1ZFpuZEs0Z0tIRTJTL0p1YVpoZkYxWVVWL3BmU3RpV2xjWHZOWGFu?=
 =?utf-8?B?aTY4T0IzZHVmYlc4QlhuZHZidmhDRWRhc3ArRitNakZOaW80M2ZYQk96WU1O?=
 =?utf-8?Q?OGk1j7dmOIZcwYhiGE8POufzrIxb13BNngReb4f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9095dc-f231-4a84-d367-08d9689e0e7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:30:30.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEMeO3GWKLJPSnrrijiYpMbAZoJ9FH5z8Tr3MtgAw0m4AbelCZ0CHVOIcJQqqbn4nP7FqFh0qn1TFA1lEGuWqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 26.08.2021 16:08, Andrew Cooper wrote:
> On 26/08/2021 08:25, Jan Beulich wrote:
>> @@ -1523,6 +1523,31 @@ _dom0-iommu=map-inclusive_ - using both
>>  > `= <integer>`
>>  
>>  ### irq_vector_map (x86)
>> +
>> +### ivmd (x86)
>> +> `= <start>[-<end>][=<bdf1>[-<bdf1'>][,<bdf2>[-<bdf2'>][,...]]][;<start>...]`
>> +
>> +Define IVMD-like ranges that are missing from ACPI tables along with the
>> +device(s) they belong to, and use them for 1:1 mapping.  End addresses can be
>> +omitted when exactly one page is meant.  The ranges are inclusive when start
>> +and end are specified.  Note that only PCI segment 0 is supported at this time,
>> +but it is fine to specify it explicitly.
>> +
>> +'start' and 'end' values are page numbers (not full physical addresses),
>> +in hexadecimal format (can optionally be preceded by "0x").
>> +
>> +Omitting the optional (range of) BDF spcifiers signals that the range is to
>> +be applied to all devices.
>> +
>> +Usage example: If device 0:0:1d.0 requires one page (0xd5d45) to be
>> +reserved, and devices 0:0:1a.0...0:0:1a.3 collectively require three pages
>> +(0xd5d46 thru 0xd5d48) to be reserved, one usage would be:
>> +
>> +ivmd=d5d45=0:1d.0;0xd5d46-0xd5d48=0:1a.0-0:1a.3
>> +
>> +Note: grub2 requires to escape or quote special characters, like ';' when
>> +multiple ranges are specified - refer to the grub2 documentation.
> 
> I'm slightly concerned that we're putting in syntax which the majority
> bootloader in use can't handle.

This matches RMRR handling, and I'd really like to keep the two as
similar as possible. Plus you can avoid the use of ; also by having
more than one "ivmd=" on the command line.

> A real IVMD entry in hardware doesn't have the concept of multiple
> device ranges, so I think comma ought to be the main list separator, and
> I don't think we need ; at all.

Firmware would need to present two IVMD entries in such a case. On
the command line I think we should allow more compact representation.
Plus again - this is similar to "rmrr=".

Jan


