Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C53F89BA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173086.315818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJG15-0002N4-G6; Thu, 26 Aug 2021 14:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173086.315818; Thu, 26 Aug 2021 14:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJG15-0002K4-Ci; Thu, 26 Aug 2021 14:06:03 +0000
Received: by outflank-mailman (input) for mailman id 173086;
 Thu, 26 Aug 2021 14:06:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJG14-0002Jy-58
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:06:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd92ea98-0676-11ec-aa09-12813bfff9fa;
 Thu, 26 Aug 2021 14:06:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-rFuoNqRLMH6t2eu5HkRV7A-1; Thu, 26 Aug 2021 16:05:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 14:05:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 14:05:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.10 via Frontend Transport; Thu, 26 Aug 2021 14:05:56 +0000
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
X-Inumbo-ID: bd92ea98-0676-11ec-aa09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629986760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VPyvXcf4IjnTUJ74MZhwOXd4X4XWnIhck2OGPmmw6M=;
	b=RjrLV/8YojDAPeZtGFb1Mi47jkDFhFQrJ4vr0USgh6NGgnjFkIBpDBOpnJUFEZ8w+UyW01
	FXwZPgGqqX4iscsaq9U9lMLo7PEwBx4ae3G1jEaYakFPwJSIywdFuijejWpsm0O97WJBMr
	cmyfnxMbgpMH4u/ER5zOgbK+dZuNlac=
X-MC-Unique: rFuoNqRLMH6t2eu5HkRV7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwR/QYkzu7k9WwyKxdoSkMeJPGCOgVTznU6168RMzMpLNlqFuAfEBx34RdaRquq7YKmH4st8loVPyHZrYH4i2MqXHRLvGpUs99KEfZdCTEfm/H5aSozr6MTL4Hf962jiHQHjRbMMJm/X/5ttIjTa6P7QetqFMRkDJ5+7qFJQFNXZl0Fcf9pHrarn+kI/M8Irz9Z55INwqRnhx9Zcf8lyvXr+1p4scaSks58n0R6JFTKji7RtCjX9+hLsfOqtZUWquLgazxYVK7H1noYNY81bjAsDmiu5S4KjYnrk9ZmpgvPUZIM/O8rnbF06xX83PofZxYGKkhxzm9xon97enagc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VPyvXcf4IjnTUJ74MZhwOXd4X4XWnIhck2OGPmmw6M=;
 b=j5a7OJHkZREM9nZCtvZfnyx7NAGGmi/gnda5J+z2abewPvRzqjyPKDk1ZBzDCLPZWO113WpKNqBXiBEJcm1VKCwY8QMl4ogk7v23fpNXbsWXr63v82X7PeVtko/+tPR8NI0YCcAFT+SPppHeY9mPrDcUvlBqnGp5RlCRf1VkJAUTqR6RBlMDtMliRhCi72F4BzQZX0W2Qr+dOKs+O4qcV5ToC16+v/qiDJVbC31lQ/mM20cQeTs/SulQiDirjbXTNYBZSpbZSk0nLvOaSktMD6hAYYZ4rv29ee0SuOXn5/Fedp/rZQ2+6xsJ9Dz2eSD0C6RrtsD+O8/rHt7bGxyxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 6/8] AMD/IOMMU: provide function backing
 XENMEM_reserved_device_memory_map
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <93f33c54-8abe-4a73-3597-2f7d00d2f4af@suse.com>
 <9c682319-0db4-1536-9a82-b7d5250ead52@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e06e746b-ce9e-de12-78eb-3e0a44acd78f@suse.com>
Date: Thu, 26 Aug 2021 16:05:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9c682319-0db4-1536-9a82-b7d5250ead52@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a25e31-89c4-43f0-d045-08d9689aa024
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532637E5E29A57048A89B923B3C79@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydAJhIvGa/up4GLsMNS9kw88DFCjmGhztuoel2OEy4Y+aJBflRL9JQhFQSiJlCp4w9oQt3nfFCv2pdRHZJkADE/YQRowdWtoOpEULExyHGMv2g/UnEk13qdhekomX5X4AGxU91NiEAdkIkA5GL8/7EHd8ptwHCSeAG/0MJzPXR3n2mqK/MMbztMbP2hwqyruD84OBI4Ot52i2XpC0Z7dUmRrBukSC+sbbw2qJTKe9ae53CdPsgdmH7Z8o7MLGtHmfw23GHKuNLmxGCWnBeHrx6ntTEzP58/0+hY+0hlcX82QcWImMb++fD/sID0bZfoS9EN5PLLpsjgzXriZSRm83M2EdJLVyDW7qthBRPcFmPpziLxLoV+JxFFjgTMOXM/XxopPF0Ug5OR72S/eycw2QF3xxwT9ykGTlCqhwDsv0TQp51uMwxAtf9C/y1ilL1j3z8vBOAzvzd0T2UTZbDKptZvL2QpSYXUemq3SHcesu5gEmw85TigvKYi2IbqGNLShhk+6lemWoMf0sMxydEQNcpfKarAPRYmos6671GMyy84k/l2mMxfftFYOyjCvFl6ykFUg3Bx09+fP74+Tl6xqdmvtFmIl9ljvt0ofIAmUP3zhMsFuPi1a/ATB2gx4ypX+RkkAj2LEhBQqOwep6qXy64tFKUgrZWMHoao8732jZ7YkoT7gVSY/EdD+kR85391inlfj0JZK1jnRAW1tEQCOnpFuOkcwvVo0ac7SqI5+2QYgeRavi9DfdYg9HKV3vpRQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(376002)(346002)(136003)(8936002)(36756003)(31696002)(6486002)(66946007)(66556008)(5660300002)(316002)(66476007)(31686004)(8676002)(6916009)(54906003)(16576012)(478600001)(38100700002)(26005)(53546011)(186003)(2906002)(956004)(2616005)(4326008)(4744005)(86362001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXF2OHozM3lYZFFaeTF0dGRGeDJ4VitaMnFxTzdnTm42VWJLNVVwZk9MQ2wv?=
 =?utf-8?B?Q0NkTG5BS2lXMWFEMFQ4dDlnRk5Xb052clpJSlMxL3pIMGc5TmxLQXVMZ0V5?=
 =?utf-8?B?Zm4xRVdjQml5NGtoSkdnV1hkRUJwSHVkTmZQaGo0cng5bTRIKzJvaVI3aGZ5?=
 =?utf-8?B?Yi9zL3R6R3ZEblN2N2xZeGpQWDNZMGZVVWF0MEtTaVptcGpBSG1tSlFmakU0?=
 =?utf-8?B?R1R2UVdQTnc0R0R1OE93V2JHTFMxLzNxa0tUaTc5SUdTSWRnRjZEdjhtVzRz?=
 =?utf-8?B?YnprK3pnTlo0cnkzSFFxWHI4d2JWQy8rL1ovdzJkUGlUa3gzQ0JhUTRVZSsr?=
 =?utf-8?B?bWsxM2UrYVU5enhkQmw1YnlydU5JUEVPNG9rUkFONnpNZUU1VzVGbjJOUGMy?=
 =?utf-8?B?cjNKVmFNaEt4ZFV6VjdPVEpreXQxaUJVNGRiRDBwaEwybEJ0Nll0cDdnZXlm?=
 =?utf-8?B?UTJjNVIwbXBvNTZLcmJ2aW5sNGZaQUo0d003cnRESmtjMDZKTG1CZnFObzM0?=
 =?utf-8?B?aDRpNUtsdHEyenpyd1hPOGwyOXlKRTV1eDZaZzVHWnZBRjlZcElMYkRhMGxU?=
 =?utf-8?B?YXJMT1NpQXArOWtqdmNyNjVnNDZQbG9HN21oUWFMSDcxNEROZ1ZpcGdTckYz?=
 =?utf-8?B?QmtHU1VwUWpVVmJBTm45ZWFvUzh1MVF6U2J3cVlHNGtBK1RweldKdThmSWN5?=
 =?utf-8?B?bnBMdmxXYjFUcDNOR2drL29ObUNwWmM3aHlFMlozR1E3eGVvMEo1MGVKeGV4?=
 =?utf-8?B?L1U4N2JmNU5WbTlSNGFTNzRYSDZHSVQzbzVlMEpZR1piVkJvNDJSMkVZakk0?=
 =?utf-8?B?c3UrS2YrWXJkNFhNaXl0NDR2QU43ZnlJRWhLWTJrS1N6TllpbXluWVpXVFox?=
 =?utf-8?B?dmZmem5jdGJOdDAySEUwdy95TTZCdVBmV1hSS0hRT2liY1RqY291em9JT01E?=
 =?utf-8?B?TXJjY0pTeFlEUFRHOVRjclc2MUpxU2lZbEFkUDJMQkVHOThYcjBQOVNpYUdX?=
 =?utf-8?B?K0cydURDcG9ZMmYxVTFCRE53VmNzTlY3T3ZHMHhPbms3R3R4TFlBTVkvMkN4?=
 =?utf-8?B?RGhQSENFV3JLajBTbHgydjJqUkh0eWIvWHNTeFVVbXgrNDlMcXV6dDR5L2Jz?=
 =?utf-8?B?Q3lrditMa0hqYU5JOFV1Qk5ST1l1Z3BCR082RDFvNE5YUEhocStjRDlIdmdL?=
 =?utf-8?B?emVzaVQvN2w3WnUzNTdIbU9iWWRJT2J6V1cwenZrUFNuV3dHbVZ2bHcwQy9V?=
 =?utf-8?B?a2c1VDI0bDRyMnhPYWdRUU5lR0swZ0d5ZGNNVTBsNzN6NlYrMUltanVlZjV3?=
 =?utf-8?B?MzlHVXpSNjl4ZFZnTW1hdHhDd0hmejNRd2FLTnJNcUxmWWJZSndrdzlUaEFa?=
 =?utf-8?B?UERyaG0xZXp1NE5rZFdhbjYvU3ZUZGtpTkx6dFpYK04yZkJMaG9Ia015VVZU?=
 =?utf-8?B?M0M1WW1BQUhmR0NPU0hrSlRuY0dodUlRMW9lYWVWY29EaXkwMEhaR25HRk9x?=
 =?utf-8?B?VDdYVk54SUxJQjZySlgzSUpVRllKWDZVbTkzMTJrUkZMR2x5V3JXbTFzeWNY?=
 =?utf-8?B?cDlSZXVnZFRCRWVtLzBhbVhRUXlnUlhNWW14RjNMQ0srUnV2QTdmMVJseURP?=
 =?utf-8?B?SjcyYW8ycUxHdGYxclhNWkFpVkh3SzhVcEtzZ0Nmd2JCd1ZJRlRncUhQVWdk?=
 =?utf-8?B?UStpN0tUVEUybjJ0Mmt0L1JnREJMOWVqR2hhbllwODdLNWpScDlqNklXcTdk?=
 =?utf-8?Q?wDDh5JFygVmCaKtmekmEgXFdRa1f8jA4GwLj4mt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a25e31-89c4-43f0-d045-08d9689aa024
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:05:57.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1szzzlkas0Wb+ZJsm12RQ6vyY6kan+4YjvWs2O4YKA1WO9V+trqzss78ALb6h/6l0xm8HcPczv7heR01gA14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 26.08.2021 15:24, Andrew Cooper wrote:
> On 26/08/2021 08:25, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -467,6 +467,81 @@ int amd_iommu_reserve_domain_unity_unmap
>>      return rc;
>>  }
>>  
>> +int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
>> +{
>> +    unsigned int seg = 0 /* XXX */, bdf;
> 
> Is this XXX intended to stay?

Yes - we've already got 3 similar instances plus at least two where the
hardcoding of segment 0 is not otherwise marked.

Jan

> I can't say I'm fussed about multi-segment handling, given the absence
> of support on any hardware I've ever encountered.
> 
> ~Andrew
> 


