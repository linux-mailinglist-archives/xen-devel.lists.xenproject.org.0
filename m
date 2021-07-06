Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE3F3BC702
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150817.278816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fLQ-0003yo-3t; Tue, 06 Jul 2021 07:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150817.278816; Tue, 06 Jul 2021 07:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fLQ-0003wu-0T; Tue, 06 Jul 2021 07:18:12 +0000
Received: by outflank-mailman (input) for mailman id 150817;
 Tue, 06 Jul 2021 07:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0fLO-0003wm-QL
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:18:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ce75320-7f9a-4b13-96db-7644f02a49a0;
 Tue, 06 Jul 2021 07:18:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-b6qUq6NKM2KdC3Raa5kuAg-1; Tue, 06 Jul 2021 09:18:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 07:18:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:18:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:18:05 +0000
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
X-Inumbo-ID: 0ce75320-7f9a-4b13-96db-7644f02a49a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625555889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OtvgRo9GydKR8aC1M9CFNYXVySbDYH/S5PszfkQZkw=;
	b=Cel+mMy0u+ETlUZAvuhjJNsIaiGseEFSKzCxdGrqlLfFRmX2DDdV7dHaDGl+e2Jb4AkOIc
	1iD8anxF8IZFkmrODgYDyP+zLxqadcGzLS5qZoL0yCkoMFlve1YS+e5W+Ae4aoUWcTZlXl
	VQJfENhszjVRjVKlB57inxMByOTy7CY=
X-MC-Unique: b6qUq6NKM2KdC3Raa5kuAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USMEsrWOR4b4uZSyx8diCbetySchuBop0ikL4rRKjZdJgMI/Fkp1NvDaFnF3m9bq7LMVgncxwTdaXnMFThy8ptILzdiwzJGcy3DE9LWTxobRgsBIDR86wlhRL5BohzxLhr6X/zTrMvmUaGQrJqMDU7AsmuXzj0g1wfQeIfaIAsdZia0ElGHvepzjGET7ihcywoDySIFMjwVE/1Gv333XXinY+OHGwyERo75P1Y3/MpS3iUgzbtg755aOWX5Y9U1OviDrIkY3wgC3e5wkODi9F5W5oAorKxefYNjAhB50OJY+9pse8uesFd4ETkqRJDqp6JLfx4m9rfyJZ/1ytwvpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OtvgRo9GydKR8aC1M9CFNYXVySbDYH/S5PszfkQZkw=;
 b=FIKYaptsARzBD7Gs0RvalN+/bOeSZ+TtxbWfgz+ezH8GSoy7NmgOrthvF86TDqp0xrMrvXFVSwoVwfINDzZCw0PeczL8Dw99r6OwIOnf+AGRcEAbzUjnIwJj5hz0YbmbvM5OSCwuob6ZtH0i+cetRHz/g80VoItEJe2dDK7CqevvikrIn2n71MASaBss1tAq0CBoqHVoYFBYsmIpZs3VHqH76pimNekrWH3oOSWnp+Q0WwMYZFp4qOqBLfSkMZoc++vzxfuXmy8I7uwx8UmKw09mteO/pbGzEPvrjNbbjwXTkl9vsNyiHffpHgDpaH2ldDFQnm0BHmaQ0diM6NXqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: Ping: [PATCH v2 0/2] x86/AMD: MSR handling adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
 <cf132aaf-96cb-b79e-f5a2-7e0f0f2d28f1@suse.com>
Message-ID: <eb53dbc5-1d3d-661a-18fd-a92059e52df2@suse.com>
Date: Tue, 6 Jul 2021 09:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cf132aaf-96cb-b79e-f5a2-7e0f0f2d28f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1064971-492d-43b4-d895-08d9404e3352
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260835FAA85735C66F053B55B31B9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+RJu7yRL3ADIOFSsTvsGJ0uICmaC+30HN3AUqALiFkn5/z2C4rZ1vmLJIswG0q1Aih2jRZkZilwU/6ULpobQEaF4eXIXJX09OrbBs9dnzMv0BCtrxB0AW01zhxshIoGcMkHjwhFPeeIDEt+RteUENoXUn7l6oF75MaaqkfQHDncHcxLsJ3LDjIppQFNHa0p5BShGHKtOIm7CgQ+n/34sbYAWOTZiiLCSclTgzMbtBLOBj0/RqPj0q9lnMDH78WYqugdFuPE7r2r/ALi/L/mKKAtUdr21coUqPM2JTvp71dFKMcdLPYfgbpsVIdcntFQK/T8S9SZBC8TDykfs93ct9CyE5c9eD0YKE397scwA6mQFb5p0HIXOOjy/YLPD4i+HAFKKvQf9OD6awbQZoDFPS7SFbNLQhaGa7EHA2q9UMd+d+51AAvroMjuWwwd8UKbUL0bJJFpHRiPqJ9qYrz92iz501UwZ3Rx2QK5icFLIl9+b/nhaaIS0Yuu0gb8Aq/gNwKReeEvLGN19tIFxj4ppiYswegGoaRdlh6Q0t7jJz549WH0J9ZgRQUDzXCtpk+hbFSSuChD9fTHTY1xZzBTwAmoR7AEkkeC86kDoMUsUVMwmgrdhORZ+26Rw0rkFWIigN8qKUGbH4+gfyuJhWoe/cCb7xAI3tcVcT3FxxNvwbG5+h7wTHRTfFz2PCkyLh8jRcro5li1PGxQ9lVRWXNAEaKDXwyPy3tT9bdZSU01cSHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39850400004)(376002)(366004)(136003)(4326008)(54906003)(36756003)(66556008)(53546011)(8676002)(8936002)(186003)(16576012)(6486002)(2906002)(5660300002)(6916009)(38100700002)(26005)(16526019)(4744005)(316002)(66476007)(66946007)(31686004)(31696002)(956004)(2616005)(478600001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bllhQklWS3NNK0ZFT2NXRnplN0NLcys0WHpLTkNJdHA5MHNabG1Ra2Y3ZFlF?=
 =?utf-8?B?RjlvNWVkSitrL1d4TFdQZk1IWFJFMlRBa2xpMmIzbEpxZnUvdm9YV01nWE9K?=
 =?utf-8?B?NWdOZ0h1bFVQK2NoeGhtTThLVnJYVzZDZGpWUUZKaEoxcXJ4VW91ZDdEdEwv?=
 =?utf-8?B?TXkyaHFjcWJuRit0eDV3Q2dub0U3VmxKRUpnOEt1Qm5aeXYyWFJ2RWNTTWpT?=
 =?utf-8?B?SjhGc1h3R3g1Y2I5U0hLblhvV1JwZFVRVEhMeDJyNzR2dnliclNDL2c1NlRX?=
 =?utf-8?B?NWpRZmVpKzM2ZjQvTG9CY0RQV3lFK0t4OWw0ZVVkakxMaTJRRUhFOEVaYjZ3?=
 =?utf-8?B?Q0dySWNXTENHMlQzWkZQMXJtN0lOYUFNY0l1NW9HZVdKc1hLWXpXT3RhNGdU?=
 =?utf-8?B?S3VlcUJnR3RRVGw1ZysxdlRKMTV4amdWMFAzRlNCUkJhazBaa011V3hrNzRr?=
 =?utf-8?B?YUVVemtaek9RM0JnL215U3BWUG51SUljZmZMcG1kOEtsRUlja0Z5ME93dWxs?=
 =?utf-8?B?cUNvcCtwdlQ2dWVzemM0U0hCOUZMZEd6UDEzRzIwejZrdGovVGV3RW9RYU5j?=
 =?utf-8?B?Yk1JKzVVWmxMTThGOVRMbG9SaGY0U20wZjgxZFVNZUxQVS9RWElXSTNtTEVh?=
 =?utf-8?B?SS8yRG1DQkNvb1ZuenlIWVhnaW5aUGxIdkxGbERYY2FtTXRsRCtyYTQrcXd0?=
 =?utf-8?B?RnorMkljYWhTNi96aXRyQXhGRzVwaXF6R2FzRGVBY3gySXlMTlRZTkIzWDFw?=
 =?utf-8?B?VFZoSmRYaUpXdDFGSTdCc0NEVE9Xb1VxOXFsNzNmOFV4NFo0MG0rWUpTTHNR?=
 =?utf-8?B?ZDhSaDVSdERwMnFNMnZYaGxYclk1ZzFpN21vYmFpeDZLSVJ5eFpVeFRjcTZ0?=
 =?utf-8?B?RHV1anhuaHV4U241OE9FamNadGtUVXFXYUZkRFFneFBLRHQ3TkhVMHNMRjF0?=
 =?utf-8?B?T1d3VURJZlQzSzExN3BPNDF1NG0yU0ZOWjBPb2lheFpDd2lnVjZ2TFFRQUdG?=
 =?utf-8?B?dGEwaGdwZEV6cUc3ZS9YM0lWRXFndSsvenQ3cVlpbkovM29tUlBOaUZaY3pz?=
 =?utf-8?B?TFZyd3JQdjdBKy91ZTRMMDdhSU5rWGlHbzJxdENLR1dQdEE1Rzh2VkxHMjdz?=
 =?utf-8?B?YmZ4V3BJZjFWUFBVMitXTWx2UEJnZ3JDUGt1NTdtQ2Z2amdSQmZqSURtajgy?=
 =?utf-8?B?Rm11Q2JQMk81TVhLdTZldk1nT0hsc1Y1ZjZ4ZkRZdjEvTU5tRnBraW5EWnQx?=
 =?utf-8?B?R3RtR24xTDlNREpoMi8rVlNPQTNwZXJ5U0dROXpGbEovaCtNWHJLSXA0QWZn?=
 =?utf-8?B?N3k1ekUvMTcwTjVscnp3ekZSU3YxRUpmaWw2RzVCQzZLQ1liRkREb3pNRzRI?=
 =?utf-8?B?NzBIMWw3S1NZM0Z4OVY3U3cxYUlDNlBjaHNBTmxmYmlZYUtLVExJVEJPa01M?=
 =?utf-8?B?V0hSQ0h3S015aDQ0RVZGV3UwRHlwM0VYbXFYelNJN3AxTGdDSG0raE0ybS9U?=
 =?utf-8?B?NUNybGZhS3JmUEI0UFpqd0F2bm9HNFRVU2RlVkRrQ2R0bHF1Y0RyYlVWUGg2?=
 =?utf-8?B?dUZvdTNNTXVORHZmdDFkS3NseUR1Szl4Qk1EcFBUbWJOSnM2bUlxMm9sOHND?=
 =?utf-8?B?aFJ5RERlZFA5VVdERVVZN1QyeTFla1dBMFVDcVh0UXZXbC96bGQzQ1M5aTJ6?=
 =?utf-8?B?YTBYN1llalA2Q3dVZUdySVg5K2FxQ2N6L3JTckpFTVdOb0djVWY0aXlnbG9D?=
 =?utf-8?Q?PunsDFC/2zyNXF4R+kkLm8EeTgsI6WLClogIVAF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1064971-492d-43b4-d895-08d9404e3352
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:18:06.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1NwgWpirPzHKwIcQ5ynfqqs62eTOiNN9vQh/oxiq4tsAZYlXhMomubCFTFwICe1VThPXgj/xH/oJjEKn/kC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 24.06.2021 17:29, Jan Beulich wrote:
> On 28.05.2021 08:56, Jan Beulich wrote:
>> 1: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
>> 2: drop MSR_K7_HWCR
> 
> Any thoughts here?

Okay, this v2 was put together on the basis of a discussion with Roger, so
I'll have it also fall under "lazy consensus" if I don't hear back by
Thursday.

Jan


