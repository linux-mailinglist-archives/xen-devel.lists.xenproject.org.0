Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AED47BF35
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 12:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250339.431214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdn7-0004sw-4X; Tue, 21 Dec 2021 11:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250339.431214; Tue, 21 Dec 2021 11:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdn7-0004r5-0n; Tue, 21 Dec 2021 11:58:49 +0000
Received: by outflank-mailman (input) for mailman id 250339;
 Tue, 21 Dec 2021 11:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzdn5-0004qx-Qf
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 11:58:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a40c05d-6255-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 12:58:46 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-JqyD5oJ3NDCHd6uM3arJkw-1; Tue, 21 Dec 2021 12:58:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.18; Tue, 21 Dec
 2021 11:58:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 11:58:44 +0000
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
X-Inumbo-ID: 5a40c05d-6255-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640087926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZkTUfBEpMtfcW2+wcrYiy0GqhKWAAI5fRJa3HM6GUo=;
	b=YZDJ5dRsnF9ijH05tAyDREwlj9og+y5B1zBtGL9qYtNcnjLxrpadUORmDRCMmfyxK/2goY
	P5Dz7IWTxJUuyHrfetqPGJFQ9m6avw0dCC0A2NwpHzzsX6xCoqa84L1p7gnRGGayYwCaK1
	axzaA7eWTps/4J1CKZaWgh/wDcvSJWI=
X-MC-Unique: JqyD5oJ3NDCHd6uM3arJkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mq7vXeZEGGKkEro6Oqw5QSaV1sigj8wZwueJeUaci1ksWRddT69qX58z/Wp42wCDqB2UH8k6ddUddAcQRwTVKCA88yKfBwNOYqjtDIVUd83qyVrKVOZgJKE55GS6wgh5W0xQGbdx3xKWIrGdInXSgKUUYemi2gGe6mF7uevzj3JXrAug9Vk3CNLLeRcQjBAvsg8/9a2A5bx/G1bIAGnHDicfym4ECa6Id/e9KsoINpeVkGfTpAlftSsNh0nrPj0En7rDYUq55CcmmUajyxfI/CLADjJZU68TKmlRhOO7fNJz4vTtF3mRyYVj0fL7bwctAJcfxLLl0MOvuZXgZmq+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZkTUfBEpMtfcW2+wcrYiy0GqhKWAAI5fRJa3HM6GUo=;
 b=Dqp4f6TqxBcuCVQcCVI0a2BnXy4pcJCMVaaDQU55EIcjFkqOOpZf/jDKxlKxugcf9UU7ZEEMe3YaYKwOAN828YW+ppnvZsG2f4mdkhptWrEGiCQeGUDNOL4b6XPHNQJTQDK55uiDu8b1dlbP4LSflWuyXZE33XZwn3KUK3wwFC3C/mrZDKMXeqbxBZFDljuTKkRydLPGTPpzTmHy7nTu6CAgsc2ISgBIhToNzWi+uf0K1MjfMDcJWOa8NeQy6BDgG40G/BxTQ+RjH+UnQTldJJvTFhEwTZqIUXydUEyp/qW3zF/OkzH056Yytr/9OWXtTYeXz1udrw0AYlNPpZf13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a85987df-aeaf-b0cf-232d-1649f5ce418b@suse.com>
Date: Tue, 21 Dec 2021 12:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/6] x86/hvm: Enable guest access to MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 282714fb-5719-4f4c-e97c-08d9c4793cac
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB737565E3C771A5FEC6096E98B37C9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXe6srQqVgmfdC0yyFos6WLp2pGQAynEUVXlVSD16T3vJYTlcz0pfCeSIoRyncNQajPm4mRnHe1pbVLxvinrZUZHIGQ6ABg6aGaAXUTBPaRiZ8K3u0xyO/2+rMASbkMu26XQgQAZMOxrjfwW+laP0HPFAjfAo9wDcqff81i9BHqiJO115MUmdua58WriNStbiFCKUh1ziuhtX3agjZg3Aq5UuKXm3weC+kWLD5R8FNISfB30UKiE/+UqyWlwBIT6uyNPskmmhFCT9PNtf3ZsUyvnOS8Qrkj3NYN2wMoBzq4uMtjy0jdNSP07QWbIBUgbLKcTdp0da/oxb4hxVheMnCysC/8W8BVkBNJsq/kj+Iiw3cUms9enI8lJDGsW1XvytjR+BlYWvl+mRZ0OpPxS6B80OYXkf9JY8QrMhV4NVVhQW7mAvZvPjOiSEKEP+BfKBiWTI91pOTGM8fSzlGwpVkMuUjRVQZ9ExterTs6xCjFhtgKci6yQCNz6Dhwf5Gj2TJ/Ty6Hq3/psFrof7BSw16MYiRLOOqLk6i9dzBsx6B8rzx80krU7hiBGkN+Ndr3CfY8TUPzJnQK/6IvatpLxtoxrV+YE8x0fJQqt6v7Ssz4HFUTbHitODhbrWUbk6IHa2uWB0++/0KfNnKPlkxTVH0IAfyVW2KyqFsrcEQ4PnTTlSfYr9FRmAAabJlIAPo/BcbgQk3178EdA4wpkqURbZGuEV5PtthkkudUDuYNfjsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6506007)(2616005)(54906003)(4326008)(2906002)(508600001)(4744005)(53546011)(186003)(31696002)(6512007)(316002)(8676002)(86362001)(83380400001)(66556008)(36756003)(6486002)(66946007)(66476007)(38100700002)(8936002)(5660300002)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akQ3UWc3eEs1VXJ5WmlMRnpZTGZncktKbWo4WWc1bWVPa2Z0SnpOUWpNTTA4?=
 =?utf-8?B?MnNlQXhKK2hQU3Q3b3RpWWtzOS9rSTVZVkRSMTJIVmF0M2RNNlBIdFE4YXo4?=
 =?utf-8?B?WitOSFd2dS93L3dWd0VBT2YvaG1UekdpSk56aER5ZXlqdzBLb3FjSGsxU0d3?=
 =?utf-8?B?b0MyYTdDZXNucmllR01YeVdBRDI5L1p3a2J1REJOS2Nycm1KY0tJbS9ZWEJY?=
 =?utf-8?B?NmRjV2RjUjZJSUJCK3dncVV1TFV2bjlKNTlqR0dwWkZSVlQ0eE4zOU9hL3dD?=
 =?utf-8?B?c1o2dUJvakRGelFOUzJ1Z01pWWNHMWR2d3dNZndZMExNVDkrejJqMTYxK0Q3?=
 =?utf-8?B?eUo0Y2xFM25lc0d0dzdJdUxBalorSXBlRHUzNkxza0QzcjZTY2tWZ0dubkNK?=
 =?utf-8?B?QlJaNTNVajVKa1lFb0FkSjRvOHhERUVKbllVUEdRcWkzWS9IWXF5dlNSN3hi?=
 =?utf-8?B?bzF3Mmt5THQrLzN3d1FOMmJLN3BZOGh1eUdBaEFianc2Qm12QnMxVU5Zdm1w?=
 =?utf-8?B?WWdOYXg0ZCtZV0QybUV0M0I5aU9Ib29WZ3poRHhxNEZZTkV2VzdhNk53MkxW?=
 =?utf-8?B?RytwMll0NldmeUpiSklKWHMvaUdzeUFTcmNybGhBV1dNVU1DVTlaS0R4Zzlo?=
 =?utf-8?B?YVFFRjh1SnZNeU9EN2pRSzI5Z2JqQk9GTVQ4NWdUeDFZdm1Xd3JUVFFxTmRy?=
 =?utf-8?B?STJQMkdiMUVyS05hSVd5bWJRb1B6S05LMGI0blBYa1FVK0tqYkVLeVhLOE1x?=
 =?utf-8?B?V3pMTFVFT3N4cnZabm4zYStTYXV5T3BIdklwclRpcElJWGUwMk5zdWgydFRi?=
 =?utf-8?B?akhWV0RLa3pSQVpub1g4cjY3NGFidXoxV2w1WGFONldYRDJESEQrbW1kdW44?=
 =?utf-8?B?RGJORC9TdkR4dXAxSDZDYzdVTHB4ZWIybDZWRXc2VTg0cURRSEdmWXFIRXhM?=
 =?utf-8?B?U053Z1lFeUtZc3l3NXVDem80RjNFckY3UXM0TWtzZnpZQjQ2UEREYWVrdWo0?=
 =?utf-8?B?ZGg4UGhnNHZQMHB3bURLZW8yMEVmOUhFWkkzMVFIYW5MbDM3SlJwUHErY2Jl?=
 =?utf-8?B?Rms0UUdMWEJMekpYdVg3a1dNZkVkeitJV3ozSXg0RmNBRGhSOFM1WGxzclcz?=
 =?utf-8?B?a0VaTjl5YWdmSEFXUnpLVXY3RG8rbXFpb3l3aHZTRFRpWi90ckJPRWR2Y1BH?=
 =?utf-8?B?dzdQMDczenRLcUZyRkxqSVVGYlNYcnZ3RlZ0b1NxOW5pcmdtd0Q1N1k3d3FD?=
 =?utf-8?B?MDFmWmhYcy8rdUQ4aE16eXpDNUx6YlNLYVNyaVJKaGlDd29hSExDQ2Y5cjlm?=
 =?utf-8?B?akJwaEVzelYwK0h5TUxzeGpWc1VCTFRnaW9ITTIxb0I0RXM1SzgzUDF3aDE3?=
 =?utf-8?B?Y05pd2VUQ0h1eHZZZ1p3VWhGNEd4ZElkajB0bXZidnlQdW1UcmM3NnRHems1?=
 =?utf-8?B?S0kwUUJXVVZYdWhXaHM3NjNFdUJ6SGcwKzBTMGNxY3dZS3NjWWtSdzA1cjlD?=
 =?utf-8?B?YXRSQnhrNVhxWVh5cTB3YzBJL0lDZlJteFpFd0pmN0ZjVkRUTW1RcEVyM1Vh?=
 =?utf-8?B?MEpSUDFVNk0rTDE4M2JqbkQwVldlZXh5SlRFa1NyUUtkNTdwbDdRblc2OE16?=
 =?utf-8?B?aURjb2hvS3A3RzY5TTYva1RPa0J3Vm5KaXV1SjhUODZEb1dacHdSY3d5WHVq?=
 =?utf-8?B?UCtLanhvYUhCQ0xTMFNLdXpnMVBFejZzMFZhVDRLcXBaNEtuRlI5bDk5aDVT?=
 =?utf-8?B?blAxeFZQUVQzYXBYc2xFY1lIUWZSZDhscDd6NWdVMmtyb1g2WEFKZXJZUkNl?=
 =?utf-8?B?bU5yaWM2UEx0S0Vzb0lLMDFydlpVMXVCMFdLR3Zmb25iT1JYWVM1UzB5cDgz?=
 =?utf-8?B?Ym92L0lwZnF5VVd3cnZRdHE2cEE2Qm8xOFUyc1hGZmhyVTdDVW5JcjMwUlhG?=
 =?utf-8?B?bWFrU2J2UVR1QWFOdnJybXVieFZxd0JWeGp6VmVmci8ydDViUGV4Wm1vNE8v?=
 =?utf-8?B?aHg1cEp4RDR4VkNUWjVyRzZwOTUySmRjci9STEFwTjMvYTZQSnFhejJDZ01m?=
 =?utf-8?B?WEh3WlJwZGN0VmN5WitoOUVTZ3BGZGJjSytBa09LUjMxTkNBc3N6cHgxNHd4?=
 =?utf-8?B?VDNDcEFPUWVVTTZKR2dVZEEwaWJOMjZVT3VtZGxNaWE3TmdleWR4STN3K1dk?=
 =?utf-8?Q?QS7/4LKPmp73D337Iegy7B8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282714fb-5719-4f4c-e97c-08d9c4793cac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 11:58:43.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baqC7oVn3TYZnZby9YQ7ziki6TRpbBjDLZSfQ0Sms7ZcpuN8JUKPudeD/mDd+Zvr0lssGKpzChzpDCX4b1jmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 16.12.2021 10:54, Andrew Cooper wrote:
> Have guest_{rd,wr}msr() access either the live register, or stashed state,
> depending on context.  Include MSR_PKRS for migration, and let the guest have
> full access.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


