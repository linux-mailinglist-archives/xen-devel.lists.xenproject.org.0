Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48044428BCE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205788.361186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtF1-0006yR-7f; Mon, 11 Oct 2021 11:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205788.361186; Mon, 11 Oct 2021 11:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtF1-0006vU-3y; Mon, 11 Oct 2021 11:13:11 +0000
Received: by outflank-mailman (input) for mailman id 205788;
 Mon, 11 Oct 2021 11:13:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZtEz-0006vO-BC
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:13:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36474f96-2a84-11ec-80d4-12813bfff9fa;
 Mon, 11 Oct 2021 11:13:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-S_kqxFFxPSWf4idVwV52jg-1; Mon, 11 Oct 2021 13:13:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 11:13:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:13:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:6e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 11:13:04 +0000
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
X-Inumbo-ID: 36474f96-2a84-11ec-80d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633950787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQXq58kpHN9JB/4f2ub/bjpEwq412Za9mK4KLYwjdmY=;
	b=WogkLNiNKGVrSxsbab/3N/MirwhFBfq9UGJoQBJmHcyv/b5BbuoZ35sd9YfxLp1WxT4diZ
	w9TXNowz/T6R8ipKdtNX87ayGfq4fFrmDu/LdYaC7DZJJDc/Hyic/h1xuQgzzyVcpO4xBY
	ONAWgz4EomlA29CIO1ho7hhz2wXOT+c=
X-MC-Unique: S_kqxFFxPSWf4idVwV52jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIa5sPcuNAlWJ2OhtkdcavgWZ+X1bNWh6b+5fEvW3JtZ4/T35yI2nc0fWoB1LwNjrSRDseHkClqdHWgQePec2jVKVZDPtnzsB6Jolrsw9pPsa8t8UFem+K6VKOV8TQVZtFsPbobZOemwuCjKG1vlXCe/NziQ5TMvY6poEOdOPyRpnQlYm5D5KU5DMNQziRwJvOZj6tYUAHaX6swkfhy0QdT1VIFGIQDtM67uqo2AUlB1928JVYX8K0MYzt0CKFcT+cJRHu7GzLn+sr6kPk9wK2N2qYJb6OgJUqTIR737ztf4PmcmatzJfk05j+iRXW76+oYs4e6yF+/OBgsOXCtxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQXq58kpHN9JB/4f2ub/bjpEwq412Za9mK4KLYwjdmY=;
 b=OJkpTp5tyIqiztd3QX85KXcngKBTERLPqZ5W5xEcnr2YpF714v6vSgVAO0xKTPtESsujBNPGEj3XG2zA04aKzIzEQrLpc0S8IiNMSQK/16fqhlwQ5STW8mbg+zo66VFc81PJekDSxnito1HlkMEqoBPLzpdwgs35jWGtFzgskws9RmupUPMXpJjJHiZnJBPhMmXnBpp1ZDsi1+izW9g5ioTYH772AyCjAIpj+drTb9vVsECBgEea4r8AVLp1O+4d+FZZ7W4A9uPrA2KoGbMlJrUyQDy76EAJf06/hdm3i68kWhxqZ1V1E8zYdAh48ev4TH/lsCfQppOFEj3PPlXYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 01/11] xen: reserve flags for internal usage in
 xen_domctl_createdomain
To: Julien Grall <julien@xen.org>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-2-penny.zheng@arm.com>
 <7da75d7c-5640-305d-d742-d64b8c219949@xen.org>
 <60d813f7-a756-172c-999d-44f81504e268@suse.com>
 <975079d0-38d4-2a56-541d-b6d652ce87c3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32d35bc1-5d3b-87d7-c24f-4e067ccacc23@suse.com>
Date: Mon, 11 Oct 2021 13:13:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <975079d0-38d4-2a56-541d-b6d652ce87c3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b53f7f91-67a9-4653-4152-08d98ca81888
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776FBC05C45D6C32AEDB8C7B3B59@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVudanh4ZDCTatmmv5cPQJ2TlsLJ9Czuz5lKdpWSf6B+2iP0Vg0bO+qgVf8ws1dy6IDDb3YwXIPiXKa2jG0c9cIYRyWcxt+tP6rRPrLdwKOIsnxmQ3uoZX4rFJC7I0j3UyZFUOJ7q5lUDbeM21BqcnbVdC6C5qlRMdC9P9ShMoC5WIvJF8KSDcpla2hT1AM3nGKGuJmiXnE6l8kaDJBL1marLeh+mxKrR0k9rbUXB57iSPRtGklMUCnGFFxts2cTERHRQQJDCHtxEL1Lynl4srneVbCdRtrR6+SfXjNi3Xy5+k+8Pf4E4CaafKAWZuIcltJSIZuC2akWjxmXWiAlrGGSc1X121cCZ3EUI5y3e2aYOLDrTSPGdHt/25BpkNETnAzo44Rs1MWyRriNEtwSwZayEnTVlJyx2qp/Ef+bgE73O1Uo/r0OcguEAkumvNjTk3DTEPfDxjRCINC0hBSqO1OrjdKbNuHKVEQZ891FeacdLwFaGW2Bf0V2kzNYsGNEdpq/PTu/4XDUSwADg72POug6sW1oo+dMuWUsHyziPedePgtS7mBLgQ7lRu3mjxhb/m71l6lCvvUkC9diefTZZMCiHuz5s8j0TBJoj/YBcXQUg27xNsKZzWGvlFVuHQtxaI4eWhUclrIj4KMjpov6/fP+UzIIu8myKvBQmcT3rq3A1WNA8Jq5+GtDrYM+OHtZpIYHM45jpW9KcEqgZsr1gap+e5Xf6EpReSdAgc7gnATttni8k6w+Srrx4lQnsvLx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(110136005)(53546011)(2906002)(31686004)(86362001)(83380400001)(316002)(6486002)(16576012)(5660300002)(186003)(36756003)(4326008)(8936002)(8676002)(66556008)(38100700002)(66946007)(508600001)(66476007)(2616005)(956004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW05d3hVdG9BL3dIZHNNbENvWDFUZFZ1eFBrZ3Y5aS9TQStwbTNtR0d4WkY0?=
 =?utf-8?B?Z3NGL2g1ZUxTVURabi81VlVGOTZGdmNOS0c4SXVhVDlKYks0emltRFdVcW0y?=
 =?utf-8?B?aitFcjlyS1pKRW1mSENERjZZL1ZCdTRQV01jTDBwTi9HeTNnSG10UjFsQnNX?=
 =?utf-8?B?Sko4N1lubWdVaDdzdFQ2Ri9ER01SSW1zZmhSTXdwTWx2ek1GRHRoSXBvSVpz?=
 =?utf-8?B?QU9BM2s0OXRRUExuVWcvVHgwNk41L1I2SXhxUWVnWjIvZmo2MzBlUzBMdEor?=
 =?utf-8?B?a1JsR09BTkovYkpzQmtPNkhGY3JkKzZVcTUxQnBqVEl2RFVsMFJFNSsxa2hT?=
 =?utf-8?B?SEo5VGx0VjhaOFBFeTRIZ1ZsaEhsU1lsYWk4MGVsWDF6UVlkaWdiQkFNQjlM?=
 =?utf-8?B?YTF5eVRhU3ZuSlUwdFBuZ2VNWUhSNDZsZjlyOUpFZ1g4OHFIaEgyZFpnVUhG?=
 =?utf-8?B?RERrYy9qU3A5SVdqcmFrVHNIeEpVMEhWa3pyVWZkNWtIRnFhUFptOXBVbHo5?=
 =?utf-8?B?azhHVEV1SkFwRlZ1QldsQU5WcERSZU1jenVvTElNRXdnRisweFRiM2dIZVlE?=
 =?utf-8?B?UEhaaS84NERrb05PUHVJUEdCZXVtVE5zWTdqTFdEZTlnb0dkeTAvcG5DZ1ll?=
 =?utf-8?B?ZTQ5eGFRK2thcGFSMHRSbmh6NlNJS1VOak1tbHRCVW1ZZ2JQZVViVVJmZFFa?=
 =?utf-8?B?NkhCZVhsMFYwRzgzNXZoTURFZEwzQXpjTGxLMjR2NTZEUWp0Y2E3UFhMYis5?=
 =?utf-8?B?QWw3aUxOZm5kQ29oSkZ6TXNCL1pOaTd0b1BHQWlmM29OSGxPQVBZZkRjbi9G?=
 =?utf-8?B?RzYzWmtKRlZWVGFvNHlDQUwrZmxuV25uZ05EVjhiQVVsSWp6RGhqN1FvOGRB?=
 =?utf-8?B?NVI3QjA0OHB6aU9vdGM3cmZZblJDVEhYSDhENW1qam1YeEJtbTYyeWZuYUVQ?=
 =?utf-8?B?dGt3YzJCNEthQ2VxQUZFUkUyWENJaXRqOEF1MDJ1RWpzTlVCc2hxUHdpVmwz?=
 =?utf-8?B?M1phN0daWGk2N1ZTTHRDc0pxRjVPRzVrNXRPSWlraXNBdmhSSEpFbnpjQkhS?=
 =?utf-8?B?VkdJNVpxQlN2TWRaTSthaGRadllJZk5nTzcwdExRdFU1VDRQd25LTmlIZHp1?=
 =?utf-8?B?ZC83c2NENTdHLzByRjhZWWt4cXRvZjk3amJHQ05NMzlDVkpUSDFzN2VwT0pB?=
 =?utf-8?B?MnNlc054TFF1cmFqcFNnN2JJODcwanREb29mTkh3dFhRejBYdzREMWtvLzQ4?=
 =?utf-8?B?SXEwUFNBdHByd0U2SmZ2Y3B1bGhyY3luWFY4RHc1S0tFMmlpYlIwdjY4OU9o?=
 =?utf-8?B?WlZVQXM4NmMrem1RcmwzdFdHY09RUk9VdkdBOWRGUUtQR0ZrRnh5NkxpbEhX?=
 =?utf-8?B?OFRTWFpwSzh6V2dhYWVtZDJWc2F0cEw5VlEwWGZjdER6Nk44YnNVdVphTVQ5?=
 =?utf-8?B?c0hia2VVRWtyVmlsVW1XZnBUTnVQcmF6Zk53WWtaeXBhbGgwaW9zQXhMTW95?=
 =?utf-8?B?UzFieUU5UVg2WWZJQk1pcVpwYVdicUxCNUowQXFoYnRTa0JETnJRcXhSbVhF?=
 =?utf-8?B?d3QrdUVxQlZaYVVycUplc240UUl0SGl2YkMrdWdudngycExVbE5BM2UvbHly?=
 =?utf-8?B?cVQvOTkwMVRPSmgxcWRuSDVzWVVPZ2VGKzRoUGxidTA4WHU5NXhmb0dIOFJN?=
 =?utf-8?B?RWU4dmdqTldQNDdtcUVxenVNdlNZeWdEbG1NeTdTRUF0bVlrekx1eE03eGZp?=
 =?utf-8?Q?WDx0mVWHPeyNBwwjQoWVMs8CU9sA9DgZekrXz4I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53f7f91-67a9-4653-4152-08d98ca81888
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:13:04.4572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk9LdyMXNq6jLNcdH0LRtbSiCi1s/rt/01VY2haPZ8uSnIb5OUDtAEEXii0UDGf7LH7tSOTDnkgpUKeZeeSndA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 11.10.2021 12:45, Julien Grall wrote:
> Hi Jan,
> 
> On 28/09/2021 13:05, Jan Beulich wrote:
>> On 23.09.2021 11:54, Julien Grall wrote:
>>> On 23/09/2021 08:11, Penny Zheng wrote:
>>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>
>>>> We are passing an extra special boolean flag at domain creation to
>>>> specify whether we want to the domain to be privileged (i.e. dom0) or
>>>> not. Another flag will be introduced later in this series.
>>>>
>>>> Reserve bits 16-31 from the existing flags bitfield in struct
>>>> xen_domctl_createdomain for internal Xen usage.
>>>
>>> I am a bit split with this approach. This feels a bit of a hack to
>>> reserve bits for internal purpose in external headers. But at the same
>>> time I can see how this is easier to deal with it over repurposing the
>>> last argument of domain_create().
>>
>> I actually have trouble seeing why that's easier. It is a common thing
>> to widen a bool to "unsigned int flags" when more than one control is
>> needed.
> 
> I was suggesting this is easier for the following two reasons:
>    1) All the option flags (internal and external) are in a single place.
>    2) Reduce the risk to make a mistake when widening the field. In 
> particular in the context of backporting. Although, this looks unlikely 
> here.
> 
>> Plus this makes things needlessly harder once (in the future)
>> the low 16 bits are exhausted in the public interface.
> 
> That's why I suggested this sounds like a hack. At the same time the 
> split between external vs internal option is a bit more a pain for the 
> developper. So I didn't feel pushing for one vs the other. That said, I 
> will not argue against if you want to push for repurposing the last 
> argument.

In which case - Penny, would you please change the patch accordingly?

Jan


