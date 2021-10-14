Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A4642D6E0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 12:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209240.365634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxpS-0002kF-NC; Thu, 14 Oct 2021 10:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209240.365634; Thu, 14 Oct 2021 10:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxpS-0002hR-In; Thu, 14 Oct 2021 10:19:14 +0000
Received: by outflank-mailman (input) for mailman id 209240;
 Thu, 14 Oct 2021 10:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maxpR-0002hJ-Pa
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 10:19:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf4b8bb-2cd8-11ec-81b8-12813bfff9fa;
 Thu, 14 Oct 2021 10:19:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-s2Izz4m-MbaI65iAWeDn4Q-1; Thu, 14 Oct 2021 12:19:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 10:19:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 10:19:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.10 via Frontend Transport; Thu, 14 Oct 2021 10:19:08 +0000
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
X-Inumbo-ID: 2cf4b8bb-2cd8-11ec-81b8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634206751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOltcsqOZE+T2oTztPvYOhVv8pEFKs+NzKQA4A7f/Cs=;
	b=RRsL1aKw637/6IM7cdwmR+3Y4ONuANh4ABvL3efR2IqjwyWSXohKSGbrYUjQeHHwBqOr7Y
	pE6FmX97TfxeI0Lps0xWUZDWpoPU3xeFd8QQmiOpIYvfj+thaRD6N7LvDDhVUyD+0to2qH
	H9972jeYMzXdu5+3c+yR1b66FhF4PNc=
X-MC-Unique: s2Izz4m-MbaI65iAWeDn4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEZaRnJbxHBB7AacaWMlSq3c+9D5wtJ5aN0CiADOzv0j6luP0gefN4vlzrCVUATAlRtgIcuyEphw2udO9cHfpJ9Um38tT/OE503W5nA13J5RMN+OvyV5IMaavBGL+ionxYszUFBzN6ySRwUB2sy+lK7ol8Zuw1H8wnz0+NzlTTSnOoLUxgmTSJh6mCByIETneR+Leg3qJdIR8YN6mNuaPTJmVPGajZkGbQZhLyRFZEiCH2ix4Nj31/anE3/Xi1U8PgfXV5L9PWURx7U+6MEVNJCGBCgRC1VpFyDLLlQLAZu/LTnoAgKJJ/qJ2CRpeOJp+UM6wHjrNkhbPJH8Tb0fpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOltcsqOZE+T2oTztPvYOhVv8pEFKs+NzKQA4A7f/Cs=;
 b=hDcEb8+i620hr9JIculwAbB/Sl5Qj9BqJue3myhAjWKsBuvVcH/L1KuS5EvHd3Tx3boH3PUUd+JUbDZGm5xZYUqoaF6V+yE+LJQAvv0Wf5+FO4652nZJzRBMKLQw9z3bX73VY/tOZQpb70OsdA2OZqcx2WqbrTMQ6KAMdIxTuxizGKLgJrTcz+IgQgQcGxj3pQpYrmf7rgvCmP2i2eWe06tNaoMQLwMOKvzExTDXl/ui0cUW/vGFaD8a3DJs1sOY4ZcN/Pg/16Nq3r73Z0VHQgw9Vbllb9jw9MCyienTFHMd8Q8JyCyPQcEk135Lcl3eMyQCFShUstOV6tFpXL82hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 50/51] build: specify source tree in include/ for
 prerequisite
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-51-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9591c5f-9cff-e135-1d1e-c79a82095da7@suse.com>
Date: Thu, 14 Oct 2021 12:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-51-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b204bb77-caca-4c0e-8a0c-08d98efc0f00
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381269E9EEFDC066611A09DB3B89@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jwDsdfpUe33Qt+lQyn5H4XkgEIaWAh3yYPmwqhYhGmp1KCHa1Dp/MLWAYp11LCAXP/d7RhWU1op0Z/HzZ71u2P3jvLvMIvlBMZPEqEYXRuHkMbG3wu0Y5t+6Y0q7dtAv0SWVVbsYLvyyErQRjQh8EWK5QEzb9Yyf+ttmE/Fub1CiisIefSG9JPqsDScfi+vDkXXTt8/XyB/2b4cByyZOOqfTIA1HLVFkDaVjWHtIBqq6SAlrtnMf70rkgBlvYm2SlGy1pK17uf4HKyMKIzo4Yknpx17Sj/13qV4gxBjK8rNziSt58vBFKW6UYPwn1ABSIRzUNg/SaPQTSTowzx7mGYIxARmM/k5q0zuF2OLf+DarArQTnLtgAH9RRQCiyGAJ9/+aQq6wIa77nVNfiI9BGlvKEz7IStBGRUE83Psr/nsNruNPVsMZhWM/wLS+1ZPEST7ox7HCrkFndK+dnwnjxlf7wGAlYyYPt8TAim4bRcOwUGtjDfvJQeec1ec2zb4WpoJj6jqrbjjYyzLLTIuw7sgpXlAK52dRJrNF2L+YVkNWEAWNAw13TpT5+K0Zq/7nRfZ8JKALrvvam0lFVIw40W2Pmtwrr1BFjQMwHj8o9BhbvRDqZwhwMetdLAFhP3xXaHLtD2TgFe6EC12P+yB4h49YV4bx42LtXuMiqSji2DtvOIcbOvSOYuFXeBH36jI2UBvu6pFcbmq1W+U4uMjJVoVONHgLGZLcy64+E+UdwE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(53546011)(26005)(66556008)(31686004)(36756003)(956004)(508600001)(5660300002)(2616005)(6486002)(38100700002)(86362001)(16576012)(316002)(6916009)(8936002)(186003)(66946007)(4744005)(8676002)(2906002)(54906003)(66476007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkFrK0dGK2gwek1lRndGUnMrRTQ2NUt6bVN1YW9PbUw4Rjl6ZzlGK2FnbUw4?=
 =?utf-8?B?R1kxVzBlenlDM01GSG5UV2srd2l1VTJBYjBzTFV1RDF6azF0b21vMGY4YTV2?=
 =?utf-8?B?MVBaNmU0RlkweHF3SnVVV3dXWEkvc0llSEhKY2hteXA3ZjNBd3JGdU4wc29p?=
 =?utf-8?B?dTFYemxzd1ZuZjl2S0RzTXBVb1hOLzJ1ZmdianBrRnY2Z3paK29kTHkrZFpV?=
 =?utf-8?B?eERTT3RvZW84UDFhcG5hM0lTSDJkZVVZMmVTV2dHcUNFU2FvdloxVUo0MUtO?=
 =?utf-8?B?RFNlcklDaXRwdnNEWi9FeFY5RUt3d0lYd3JQQXBkTmZocXQ4ZGVXRFkwVkdN?=
 =?utf-8?B?b0lHdGVOSWI3TElsVGdFRnNDL0Roc1ZJQUd4YWszbTJ2akVGUFAzeDFlQXpt?=
 =?utf-8?B?S1RXRlFpeG5zMkZQdThiK1krcEZGMFIzaVJ1R3pxNWd5aFh5Vi8xeWRaVVZw?=
 =?utf-8?B?czN4YXhRS0o3MTlxSmoxWlB5c25CdDJnVjdhem12UEx4R096RUxRbjQyY2dz?=
 =?utf-8?B?L0FHT2NvQUF4aks2cUNjcXk2Zko3bG9UZ21TYmU1UFltWFdDUWlYNkVpVFhS?=
 =?utf-8?B?dEVqK0NWU3N6c0tDck5UK3IzVXgxSFhmczBIcHhYNEdKR2NESHU1TVVoUU9p?=
 =?utf-8?B?dVlwQ1QzN3hlZmovbDliWFg5MG1pRzdodlhvOHNkcEpiQytvekdPVXlWYjV5?=
 =?utf-8?B?cWN6ek1LRitjMEQxa3NQTzlXWmNQYkhJaDF1QnEyNGxHMThLaFEyUVIyVU5w?=
 =?utf-8?B?QW1nTnJZeGliUEY0czdmRWVaM3Z3bUs1Wjh3SEttelZ6RHhGRVVibnUzSWNj?=
 =?utf-8?B?NUltWVNxYldERlhZWFpEK256NmpRYXQrUFV1dnFoUjFkWlN1dGFrN25KR1lI?=
 =?utf-8?B?YVN4MFdlRG9yRXJOUmRsTHkrUjlvQzNxU3UxZFJKcTJFTEpBZHRnbVRFclQr?=
 =?utf-8?B?akxGTHE5dFI2ZHgyYi8zU0F5dEZaUnFWSmFiTHAwRFRtcGVvckEyaEQyV0hu?=
 =?utf-8?B?YTl0MFJqamVtVFo1c0loQlcvcnVkRXJ2SXVLM3dia1RXd1o3U1drSkk2YjAw?=
 =?utf-8?B?VWFoanpMYmNqZkVGWFp6NmlNQnpZQWlWOUV5MjQ5TG5sNjhhdmkzUWNOaGEy?=
 =?utf-8?B?MFhZaTFwNmJ0VjRPaXJOYnVYWDYxd284YjFpQlJWcDJRSmluTm01Qk9US2lm?=
 =?utf-8?B?ait2WDhPSEtFWThmMmU0K2RjOElSdVhnWXhBQUNLd1g3ZkFOT3RqVFk2b2Mr?=
 =?utf-8?B?a3ZqcnJQN2lERjRaV3NKM3ZRMUdHUXlEK012c3prNzFiOVk2WGw1dHVMQ25O?=
 =?utf-8?B?NDRtUmoyZmtkQmdTYTRMdUxTYnpUaEJaKzF0M0lnMEY0dm1aYmswUGM3bmN2?=
 =?utf-8?B?aUJhU09OM3k0a1pBdVdKZE11VU9hRnNCSmpsWTFvaFYzWE0zRS9nZzdDQXV4?=
 =?utf-8?B?S0MvMkdiSXhBU3pValhTRG5DYjl6S25seHNhdzNLeXpySzNYQ1dCQTJheHR3?=
 =?utf-8?B?MTlOV2pIVjFSMkxhTkQzbnBwNnJaVmMvNTVKZnJsRWREVEtkUGRZZVlKMXE3?=
 =?utf-8?B?RjA5NDY2UDJSQm9penpVcS9RVWVuYkhxcVJDK3MvOEdCRnU4MXRBdk5JMVdt?=
 =?utf-8?B?aFJRRnRIakNHbnFDbmR2NFd2dy92eGJ2NDkrN1E4YnBVZlgwWkVJOEZ6Y2J5?=
 =?utf-8?B?OEJpVlhhKzVjN2dBRkJhY3k0Rzl0YnBDMkNybU14UFZnVDhtRzJFcGFxU1lL?=
 =?utf-8?Q?+/ChC9ZxrJETPYmqim/j5DHRR5W6koMcxx55hN9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b204bb77-caca-4c0e-8a0c-08d98efc0f00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 10:19:08.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVyct1LNuJV3nr+n3nMoUobWiw6nYaGwucWz0dgpNChZDMHTMbAfpB0OSyrzQ/dY8cXBnBWJwKG4u797QGWqAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 24.08.2021 12:50, Anthony PERARD wrote:
> When doing an out-of-tree build, and thus setting VPATH,
> GNU Make 0.81 on Ubuntu Trusty complains about Circular dependency of
> include/Makefile and include/xlat.lst and drop them. The build fails
> later due to headers malformed.

Doesn't this change need to come ahead of the one enabling out-of-tree
builds then? Also do you again mean 3.81?

Jan


