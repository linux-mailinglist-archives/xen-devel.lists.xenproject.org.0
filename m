Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B237464ACD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235729.408907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM5P-0000Zr-OQ; Wed, 01 Dec 2021 09:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235729.408907; Wed, 01 Dec 2021 09:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM5P-0000Xe-Kl; Wed, 01 Dec 2021 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 235729;
 Wed, 01 Dec 2021 09:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM5O-0000XY-JF
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:39:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 170d4911-5289-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 10:29:17 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-7O7W-PZXMeWOS9AHgo4S4A-1; Wed, 01 Dec 2021 10:38:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 09:38:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:38:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 1 Dec 2021 09:38:32 +0000
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
X-Inumbo-ID: 170d4911-5289-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRjudJYaDJBTDEpmDQGWloSQtoD3kcm4WrMbo4YMq/4=;
	b=mRJ6L2GC6ctkl8U1bxqjom9Be4U515CG6zjYEAbKrSK0+NN1Uw3jFV9hAr++8z+KkFvXkz
	nYLzDkwiSUSLxyY1XHnLn8JpUQ9mF2qrm2K9vUlvB3gVujrCgi5LBBaR0B0mRxSuNjLy1z
	xHYAOWVzzMhc+RMU93UeK70CYXrHWGo=
X-MC-Unique: 7O7W-PZXMeWOS9AHgo4S4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpQXvQo9hGLQi4ufHTvYiOO6iHVN+sRKvoMcReaSNEKMdK4hDFHvACKD/fNveiCwW8eUbVsBnx9T6d5PA7CpQhhE60YMdirnfGHbSob8PSTOpICo8zE95MEoB+KjNTsweOIHyucCzc5xCk15vIR4Eje4+zKZuitiGwnFHwas9O/WhyL8Q/PchHqEHXwPqGIN7ciBWpbSaHyc7mRIRRWBesLmjNsasXgWbLN4lVestFdl57G9M5WqFKtP3BGMXxwQ9U9B8jAC+P2NkCOlAl4ApQm+zV+N+D9ReHDcE+5FK+adr8O+pQ7kxZLidB9D52S/Dgxcixs4leWvrECKvP5P8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRjudJYaDJBTDEpmDQGWloSQtoD3kcm4WrMbo4YMq/4=;
 b=ZaeMJcl/AiMgaqvZc/MJSaWxK17szQOn/tY9vwTw1uKYWowa5oe3pF1ZdpAzLJUiQhJPXKZJa7LuOqaLvB14cKb+oGBvGCPOMlWOk6swE4dtENy84igCTxZ0hDSg7zEwqjxv/JIZaUb/3qmhDKbZvN2yei+GhP0L1dWPju006yWY2WG1bxbwXA3gSlPzgDt0comGc8diT9hZ/XcxxPd3VsaShMSU4aIFF8WjWjgrvo/zj1ZLyzS2nhcdwsNIwQCnRKlkdgsSqKXVmNovU3aV805e2SRFFe56z+RTRr/B1C9EbKXR5GqWEuEB2brx4ahDvSWqfEDHLFYrT8WQgdS7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3caf216e-95dd-97e1-b380-a31f5388dc86@suse.com>
Date: Wed, 1 Dec 2021 10:38:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 andre.przywara@arm.com, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20211130181238.5501-1-ayankuma@xilinx.com>
 <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a315ca66-986e-4c04-83e3-08d9b4ae5777
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934CAD9344BB5405775AB9FB3689@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OQMgoa0cvT8cipMsfIANgMGncJzcZobOrfAwbuEZwWj6oXJ9+rBCCFkGJxmbz2LDvP5xf/trv9RimdiNPhZSq7OhCoxihFXspyA0UxVcGm5S587g3wxI9Y9j8haVKaGn66TFu8ypJVyPGQGl17a5qs1k1sCHH7zPRLrUk7dkmrv4eKEFaE+/PpNzuJZwVdknDa/L5BUpcKXtLGr+lmX5wR89sTJC/COsC7ni2ruZ9hwu39sEr+IvWgUm2CchS++w6L0aqJvrWTN6Zqds85ZHeEvYWq5n9uzNXBi0R812k7E6TE/VjQR6d0PyTblFNoifnEEVw+8Mdy+okuQOAk4HJoC94Qo15gVU5QyatLQeC/az+lG0Aofd+fXts+7l/6FfhkT8iNgHvskyLLL02RFXpwTerpFagytxBcTLxzpOOfaqnCGrb1iMFSWXx3fwcBIupO98kFfHu5bWY72VIJlN2+ZXtp9gNr2l1w8l+9n81dyhxezvyT29NsPpoGfXRWKC6rTEjf86U7X1rjm1+5aZHfawHWu0Ntd7xx9uCOAVaamAb++0hzOfPeG2u8VC8HmEp5T7a427jUMWHrdbFh8qjQvATZsLUtKUYn8WZWfHtNpYs/ENzZ4Vb29xbZwMhM4RqmHdM8nCGhuk1dnV/UXElu8rKa3tdRtKv/dxipfYsUQoLYD+0T+sjHERzzDKWVsmm8FJzP7ESZrh4+t6KDSIzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(86362001)(31696002)(53546011)(956004)(2616005)(2906002)(186003)(38100700002)(26005)(31686004)(83380400001)(6916009)(4326008)(8936002)(6486002)(508600001)(5660300002)(66476007)(54906003)(66556008)(4744005)(66946007)(8676002)(16576012)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2x6NUE5Q0FIM01iOWEwNlhGVFQ3T2tMSFJndmovKzZJN2RkdU5TN2dxTklR?=
 =?utf-8?B?UWxvYXJmU2NpbWErT040KzRYZmNXdUdnT09vOE9ZOTdGY01HbzF2TkRlTzdF?=
 =?utf-8?B?SHNxSkJrQkZBZ3dDUlN2SE1RZXVQUVpwYzJlVmg0bGdZbFdSaTBOTVZCZkZG?=
 =?utf-8?B?TXZPbGtmYjl1a3k0YWlyWklTZGFuSytRVHNuOWh1cVNxSS83ZWtiOHl1WjVN?=
 =?utf-8?B?eFBWL283K2cyRkhwcXdQaFA4TG1SWU84UjdIdDcwWXJXUVcrSjhvNkhZZUE4?=
 =?utf-8?B?cnNxZWlYbUszSk10R3diYXZLRS9ld2dFOFdTa2tISVhaN3dYYlJHTDFPbStH?=
 =?utf-8?B?SERiTXYwZzRIb1pRVWVIYzZ3bXdVaDViMVd3WTZJUWFwYmt1VlVybFRxUjRC?=
 =?utf-8?B?T2dEejRST1RBNlUrU1hZclZQK1FaMHRIOFhuSnRmTngrL3VRbUxyZkdrS2NI?=
 =?utf-8?B?cUxYeTFxNWxIMCthd05VcTgxNGt4NTQ4S3ZwcTltc2VjblFnRFVxdnFhcTlv?=
 =?utf-8?B?aTNHQTcwQkRQUjlwaVo0bzNGSzNUaVRpRmgwMFRCWitkZVh1dzE0LytoMTdq?=
 =?utf-8?B?Yk9EVjhTNlNTYUc5N2FvdFR0ZDVCc2lZd1crM2ZlTUliTWpWK0ZXVEY0QXMw?=
 =?utf-8?B?K1NvUkdTcVVmUjdWTkZJWHFBQnJ2ZDh6a04yZGU1eTU1UXp0cDFtZnhTSkM2?=
 =?utf-8?B?YkpCK0xMYTZzc0w4cERRKzBIc3JHaGVPZlluTlhnRHpCQ2oydEFNRFRWb0hC?=
 =?utf-8?B?U3o2ZldBdXJ1dkVlVklhT2svbE9NK3JjWVdlVmg0UEZDTk8zbHMxL1ZaUjh4?=
 =?utf-8?B?N2tMYVo5REEveHh4UEdPd1AxZHk0WWkyMDM1K3B3K1hjaVErL3ZIaU1odzBJ?=
 =?utf-8?B?NjRDZzNzSWJYQmJQaGNyb0hTWXhqcDhHcVlRQWJEam9aUGtBLzN2M0tjWmda?=
 =?utf-8?B?Y2dIc09QUEQyY2IrR2xQZ2VESTdvRTRwZVJDc3p5VEx5cmcrendmSFpYK1Bj?=
 =?utf-8?B?QVdKYWZWbmpJRVdJT2RVSFBKQVdJMzdqekhtVG5aMEMwUzBnT1hwMTQ4RGxa?=
 =?utf-8?B?M0dMQ0ZzNkpxQ2dBcG9TV1ZZVDk1UGpicW5LM3ZGcFRsYTZrSjBwNWMxOGly?=
 =?utf-8?B?eWx4aGNBUjlaNW1XbTg0QXNucDQzcFFpUmJWSy9GeDVXZWRHN3lYVHhZdjMv?=
 =?utf-8?B?RzdHaHdyVzJ6Y24zcnp3R1ljWUhHNmE4M2N3c0QwUmxYeFd3YVB0VEhjQUVn?=
 =?utf-8?B?Y3BXL2xCR01QTHoyb3lKTVlmTWduYjBXbi9RcTBFU0pUR2tUZURtZG5nRzVT?=
 =?utf-8?B?Mk1WZU52VUNBZjFhcFAwWkFFdE1seEZNSzV4U1Z4NWJtR2NBMWZQcTY3eWRo?=
 =?utf-8?B?MjlzZWtac3F4MW13cHluQzNJS1pwUzZhWDVUU1JrVndkNlhJZDVXUWF1REox?=
 =?utf-8?B?OEJiTC95RG4xZ3lTakQ1S0IxZE9rcG5nRTlEU1FZVEZqWkg4ckNrNGdmZmxH?=
 =?utf-8?B?MzJIVnVpb2d1LzZhN21aWGtDQTNaZUtQV20xWm55WDcvSUJ5QWxtY04rTEtE?=
 =?utf-8?B?SGljd0pGYXZFREZ5UkNpdmVFeE5MMHlVUGphSHdxQVZ0aTFXcDdZN3hvbkp6?=
 =?utf-8?B?aHkxZVE0ajYrUEpPSDNXbks4U052SjNiMlJhTzhldC9nakVpcFFLYjJXQTRI?=
 =?utf-8?B?WmhXRUUwbHpzakFRZCtVK3ovMzQ4UW5KRlZKbkpsTE4wWjUvYXdrZG1zRjJD?=
 =?utf-8?B?a0Q0cklIaWJjdytsS08vMGdmSVlQcUVIakVINkFMRWpoZ3o4WnNWRnc4c2ZN?=
 =?utf-8?B?MnJHY0p0WHIySkQ3THZjSW1BN1NrYm5UUUhGSjNPNjNTMUxWdDdBTnRJeko0?=
 =?utf-8?B?SUxNYThWMm5kMEFoRnIrc3YxNFZxc2J6c1NFVEtHbWZaK25ERlIyWDdjQUU1?=
 =?utf-8?B?QmJsL2RCS2R5cUMzSUZ5TWc5TjhwQVV3WWxzRjRuaXNSeUpCanpQT1EzTmtZ?=
 =?utf-8?B?eXpYb1drcW44K0QwS2dCbkRxR0pzZmZxUzhsN2hzOW9tU04vQWFDY09HUVY4?=
 =?utf-8?B?UWZBWCt1VDZ3dVFRN1Y3bmFuc242VjlWQk15bkVmWDBVSGVtcXloS0NNUUor?=
 =?utf-8?B?U3YyMVZwWUFwV2Q4YklueGJ4UXdva3RhVFFPWWFPNklTYjZSUmw4dGdNaUhL?=
 =?utf-8?Q?ORMCA6o18bADmOzwrr9I+UE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a315ca66-986e-4c04-83e3-08d9b4ae5777
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:38:33.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05znvFGuJli+Et0z5ZukRvZ4a4ypq7H6gwpGCn8IAnqVNzk8icsnWm+e8ib9+Q5RZYYKxAAyCrjSbxyYMbidXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 01.12.2021 10:33, Julien Grall wrote:
> On 30/11/2021 18:12, Ayan Kumar Halder wrote:
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -5,7 +5,7 @@
>>   /*
>>    * Create a contiguous bitmask starting at bit position @l and ending at
>>    * position @h. For example
>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
> 
> ... there are two extra changes here:
>    1) The bitmask is now described with 8-characters (rather than 9)
>    2) 'vector' is replaced with 'value'
> 
> The former makes sense to me, but it is not clear to me why the latter 
> should be changed.

Would you mind explaining to me in which way you see "vector" accurately
describe the entity talked about?

I also think the commit message is quite fine as is.

Jan


