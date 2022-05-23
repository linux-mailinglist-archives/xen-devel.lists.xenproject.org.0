Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B07530E89
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 13:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335836.560041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5wH-0004KR-SK; Mon, 23 May 2022 11:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335836.560041; Mon, 23 May 2022 11:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5wH-0004He-PK; Mon, 23 May 2022 11:09:29 +0000
Received: by outflank-mailman (input) for mailman id 335836;
 Mon, 23 May 2022 11:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt5wG-0004HX-NK
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 11:09:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf972e26-da88-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 13:09:27 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-RFa2wGnkN8KHH2UFQSCeYQ-1; Mon, 23 May 2022 13:09:23 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4594.eurprd04.prod.outlook.com (2603:10a6:208:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 11:09:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 11:09:20 +0000
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
X-Inumbo-ID: cf972e26-da88-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653304167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnZoSPwy+gnzOQAbNFy5J4GpHhb1nV8TUO/EjW/tHfk=;
	b=YVqg3ifSKwkf/WBGLrZe9hQEqQQIZYWJElrfo25M/KFsFERDpRWnQ7mcam2A3JI5/aVdoc
	/hDUih6TTCtreOTCRnvoWKTOHBYApIJiYpMRi6RHGY8+/HNhS8GvkKsgbdP60yYEDOTNBt
	r10eGFQStPDOPHxYnwNI2qUKzjv1geg=
X-MC-Unique: RFa2wGnkN8KHH2UFQSCeYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O44PVkPBYRQNZ4NzB/pqgCxuKh8hzlGZVUUIGLS6H0V9U2bNAv9XsMaoCmaH8YSP2QqPuq5/bQ4r3VvLiRfeNCDhB1+c04TvSA1miYOmdPcXTHRNVo9TfvcEnspnMw7tFHv58hWhB8tbz6Crm4YgDtN8aj0/mf3aTg7wcdzT9cRyClmWgsRgKdJETVPol1pORyegY4I7N1qL7cZRNklQ782i3KvvPD4YjbqdXnIgN/w922q4w7uVGCoBDtWuVpoaSMNKRknKJ7ETDjCWcxAIyBPVN0EN2A/Cc65A2RFA135rbZ64DM1mus+L1WYk/f6HGth3TSHqAh86gca3Kgl9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnZoSPwy+gnzOQAbNFy5J4GpHhb1nV8TUO/EjW/tHfk=;
 b=lwgNp0axxkKYD6zpS/ratacyFJ8Z1elvYKKWvhO73qXTifXhUbr6buFYPGnRDLcEeCXGvT04vyHuRp1jyA5qE0QNCSYVMnmOKo6LRB+t5AP2Wcw5btX+8leSj9P2nyntqYPlDq7u4fkDgta9Cg7vF5gQUlWnbt9TJYVoJM8TQ/x+fc54csvunLM1vpVihEAN/CSb+BGTyIvlmZHIg8wDBgEn96gPxNhDxX2UxMd1T31133ODanP5KFU78nxGOCw4vE03jwYjOsNPq0o2WDUMirO1dG98s2I0IY3RpdGT9dkSJmudfpcCeb66aBFUZCls7LGjAIDKR6/Qd72rYxATKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f78b5be-93f5-8d9d-6b67-5d8b70f8019e@suse.com>
Date: Mon, 23 May 2022 13:09:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 4/6] xen: Switch to byteswap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Lin Liu <lin.liu@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1653295437.git.lin.liu@citrix.com>
 <3f8e73fdfb222b0d1ff391a18fa2a799f68a467c.1653295437.git.lin.liu@citrix.com>
 <e0f57922-39b0-a082-caf6-c333a4cd28a4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0f57922-39b0-a082-caf6-c333a4cd28a4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86123aa6-7f06-428e-da6e-08da3cacaf47
X-MS-TrafficTypeDiagnostic: AM0PR04MB4594:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB459436FA6051CA5AD9B05919B3D49@AM0PR04MB4594.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3BtLhjfQFEPxw3i5iErFdwVPuJAv8sOJM0/goDRDX+nn/PhdUue18XWPfgK2vR7bNI7AoeIGfBVlP2m6OaIjZoWU1AOuLC8YWmvx6lX5zPgI0HoF+NFLHkEACvqoBGUfBibz+xl2kRSJ/5DtMRb/6VKz9naSGFPjqnW5A1znHu0Dhm8iZYtWwzzN09GPx61wlpdsIJdEriHE3Sz2UZ+T+8OGVlzBGPR40+nbluwWeapZXawYp3VZr4UWSc/COVdMhARXJq+Pft53cDZ5Bra/PzlZjBkK9OJXR6Yyi3oxEjVszlVaOX28wFX1WwWI6GdLW0Fa4MZMWZ7dZm+GfDDlsIK5iVCAKLJC77Aqy49pcXX1iSfIKGo13o0BDUy+BBBN36hUkCbUtAzbFxRAPItTofFKLbNFeabygzq3AJB0iGqHQxdk/+AevY5gL2J2zk4TbF1QNQU64Eee4pKpjqAb/57sQpXcJWpB8HWG9we2rRxST4OW9PLDCGwt3O9KIjwEfmB07M7BeCVuANADouk/f/os5MVydMkib5jjwTcS3tcNo7+zRWyBz0Gswz5tAA4ZGSlFNlkmDb8Zy+SsyUChPayPcWigrM+D7wmd9Rpx+KdlQTj2v02xeeFpdJ95Qn7l4tJ4AAvlHOTU4n7Z8RZUUVht/4GcwevtdQdNEd3YdUXMVrBUU5rH+3qaZ8lZiHYGRttBDUUnT0etCRrhC6uErwbURBa5X8trKQyWhVy9GrGrjPQvH0tY5z149D5Z+Rwx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(53546011)(2906002)(6486002)(83380400001)(26005)(6512007)(36756003)(186003)(508600001)(6506007)(2616005)(66476007)(66556008)(66946007)(5660300002)(4326008)(54906003)(31696002)(316002)(38100700002)(8936002)(31686004)(110136005)(8676002)(4744005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWh1dU9mc3BtVitWbXFISFpZaWVYcXNHL0UzV0M1RUVGcUtIZW1oR3BicmtV?=
 =?utf-8?B?T0R6UnJSTGJjemxaY0FWTE81U3FLMlV6S0lBaDFIemJUMGN0Wkt5V24zWG9Q?=
 =?utf-8?B?anM2SlFFa3JkWUErdCtsTWRuczIvY0RZMmpUMFdRenVTRGlFY1dTYU1CU3FN?=
 =?utf-8?B?bWdteDR6ZkZUM1MxcjhGN25vL2JObS9kVkZxaTBTU212c1puRGNpclZSN2VC?=
 =?utf-8?B?VjJPMTRvT2xRT1JsYlhNU2pCYTgvSTZnTDVORXlPRG42Y1J5T0J6RUluQXlk?=
 =?utf-8?B?SkJOVTFwQ21qdzdnUkJkcVVHWGNjc05VR2NoazhNbStZNWh4RFdKbjRtSW5Y?=
 =?utf-8?B?Ti93ZDhGZmdpVWRodGxxb3NuQkk4clhHOXhOMDZ6cHBqa05SWllWRnNlaWRE?=
 =?utf-8?B?NnlqVmsyNXF1VkVmQjllK3VNWUE0enNvY0dLc1lFU1FqcUhIQ2xEOEV0TFNG?=
 =?utf-8?B?aUlPVll5TFNyYTBOcUtyc0xZWVNyOWlNa0FUeU10QWlMOUlXN09QSUZsZVBQ?=
 =?utf-8?B?cDVIWmd4SkNNazZlVUpJVGtyc1RZU2NacWlsQjVpQkZGSjZTeUhia212RWdo?=
 =?utf-8?B?Zkkrc1pYbDhoOU5XS3phSTFNb2p4UEdGbnJDcU9CcitqN2lLdkJRRXBzSVlN?=
 =?utf-8?B?NmRCbHExaDB2TzB4Z0srSVpCaTZldjFsSHMzN3hpakhqQ1RpSTc0WmVXNVpo?=
 =?utf-8?B?NzFIMVNlRjNXUnhWSncrc21TTEV6T3JybmJMakdsa1hPK3RyaTVwZXNWa2U2?=
 =?utf-8?B?Y21SZ0R5dWRVY29PelRZamtpNlpHMy9YRTVib2RSZGhzMExpTzNVMThpRUlH?=
 =?utf-8?B?N2FpN1BWZFoxSUNmQ0pscU1raFlMSGUvZEJRMCtFei9LckhsY0IyUjlJeklM?=
 =?utf-8?B?eUlEMlZRTzNyK05UTzhHWmZjeFFRMmYxb1F0ZWxWWGQ5cjJneHAwejhVZUFt?=
 =?utf-8?B?SHBFQnZCTEpRSnNteFFZK1FLdktIT1RwejFRNUhNQlhtQi9FK1d5ZFpnMTFx?=
 =?utf-8?B?Vk1RdVkwQ0dvZ1E5TkhoTW55RlFZWnJtNG9weXZTOUlIWGVsQ3hHRkdxZUFJ?=
 =?utf-8?B?cm5xQ2ZiMGdHa1R4SldBTzF0WW5acnRmelFOcDVZS2tRdVF6QUNFTDJmU1N0?=
 =?utf-8?B?R2dTSWlMMGIzaFN4cU0yQnh4cTFsdXdLL1B4WGNGWHFXamlNWnloMEJMUmo2?=
 =?utf-8?B?d0Z2dmExNWlwenZ6djkyZ0hrMXE0b1Ixc0dJOVh6eGFGeHVyY1RlRHRhbXow?=
 =?utf-8?B?UkxxOCtoQWtxQzBWS1duUzdHU2NxMnlCbytjbk5KQnJ5bDNxaDNPOXNtby8z?=
 =?utf-8?B?TlBuRC9TaTduTnlvNllzUXpUcmRkdGl4dFNGVVF3Z0lTZitiWTcyMmlLanRv?=
 =?utf-8?B?MEJHeWUzNFZCR002SXphcHRDYnhOL2k5Yjd3amRSZjlkSk93RTRVc1dTdkE4?=
 =?utf-8?B?ZnlMOUZLQUQ2Y0Z2RElaMlVSQ3NlazJjTzRscXNlaVJ6V282ZnFwMGFiaXlQ?=
 =?utf-8?B?dXYzRHM0WmtIRE5xay9TWkFmbFpLRkJZeVYxUitvOE5oUk9pYjVNRlZxcWgv?=
 =?utf-8?B?V2RQaXRPYmxFT2RrOUxNZGF3SkNjSHRuajZPbDJEZERlTFFwZFl0RmFrdktB?=
 =?utf-8?B?QURQaUZmS0JZVU5MdVNKUjVpZFMrcEp4OEZ4SjB0WkJqZUxkd1dnS0U2RHV2?=
 =?utf-8?B?VlVLbDZsU1NSOFMvUzNsYlVDZkNmb3FWclRhYVNpcXNiVUpRL1MwZGQxZksw?=
 =?utf-8?B?YlBheUp5c2E4SHdUMWh4bUVOOVN4ZmtpeDI0RTd5azF0SC9kSHZTaHFCUG1y?=
 =?utf-8?B?VDBnN1QrYWkySklnczdxeUo4SHRTS0pnOGRISFFaZ3R5Qyt0RkZRYkhLVGU3?=
 =?utf-8?B?RTJ5MkxIaWgzTktQemNlZUdlU0RrazA2S3crckZjelBUVTF4OXN5UThLTWNv?=
 =?utf-8?B?MjFrMXZTbXJMSWdMSHhpVEZJL3Z2T0l5Z09KcXZ1SFVKcXhybU55dkhZTjRL?=
 =?utf-8?B?a2UzcWxzeld2S0Q2VHVGaFhPbWd0NzhPL3JtQlVneVdLcnNhVEJrMS8zL25u?=
 =?utf-8?B?dmg2SjlKRVRxSlVyc21yMmVITmp5SDBNSEJMZDFWSW9tWEdwWnl3TENqc3pY?=
 =?utf-8?B?b29ZeThlVVpFT2lFcjRqVzZpaGE0TWFOc2lkTkVZSW9yWmNDdTNybVFtcnd4?=
 =?utf-8?B?NmpKVzREMTlYekpwYlpRMUFBNFpBRVVrNUJZTDhVRFlhS1lvV1hUNHZxV2Zz?=
 =?utf-8?B?NkRVMWw5cWVXZHk1OTBVMFJMTW1nVWZNTSs5S3VSWlM1T01yd013d0FtREp1?=
 =?utf-8?B?Y2RCMXFqc1NwbDI0TUdEMitISjE0NE5neUNBZHE5WWpHNGJNYStMQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86123aa6-7f06-428e-da6e-08da3cacaf47
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:09:20.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXKTkKBvML1xhLl0xfgN2huxsnhEIdnw5TtWJq5QBq+DtnGwqM+DphZ+NBzS40SPTQfwZHoma5xqN2ZcSehI4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4594

On 23.05.2022 12:12, Julien Grall wrote:
> On 23/05/2022 10:52, Lin Liu wrote:
>> Update to use byteswap to swap bytes.
> 
> I am still objecting on switching from be*_to_cpup() to be*_to_cpu().

And I agree. Especially the cast to explicitly aligned types in
get_unaligned_*() is rather unhelpful (and kind of a lie) imo.

Jan

> I will not Nack, however the strict minimum is to explain why you want 
> to replace the helpers as I think the reason that was currently provided 
> is incorrect.
> 
> Cheers,
> 


