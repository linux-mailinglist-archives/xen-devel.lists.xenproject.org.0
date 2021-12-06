Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F164696F5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238893.414026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDz1-00086P-TW; Mon, 06 Dec 2021 13:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238893.414026; Mon, 06 Dec 2021 13:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDz1-00084R-QH; Mon, 06 Dec 2021 13:24:43 +0000
Received: by outflank-mailman (input) for mailman id 238893;
 Mon, 06 Dec 2021 13:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muDz0-000827-1A
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:24:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd92eea2-5697-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:24:40 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-g_DZWoWMN5GqEvmL3CQEpQ-1; Mon, 06 Dec 2021 14:24:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:24:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:24:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0047.eurprd02.prod.outlook.com (2603:10a6:20b:3a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 13:24:35 +0000
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
X-Inumbo-ID: dd92eea2-5697-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz5reFBIoDMHY6Wx6KZn6tzgyF4Qv4/Rr22OybwzF7k=;
	b=BlLaYDp9vNfYkTO9S8ImKADA/qKz6P0oO9tn0j0wDrcXwlFAHhWDnxf/SL+w6+DYJxzAJ5
	obPPYswB9By5kiYoIffJ45QqAtUXdaQ8XjNH3tTM/tnb+0LD7WwFyXiN5nJhTKgfx34FAC
	6H97ySInhqbEK1khFagZTBLOyQJDscg=
X-MC-Unique: g_DZWoWMN5GqEvmL3CQEpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2AGsXfHiYimp6XepQVG32upadsAedynS3GgX85EDl9qQssPGT2y06zMOxVDFbKo9GbTwZJSPriUfOV3rBY2Bc5FNC51TUMLtEiFJqhoLOGeu84QGs/y7bXVy99xqhn9lU2SLLkXwyo06LsCJ8dgXB9Jq744/JZbAnpsz7AFV1PsR9YbJ+aivsHWFlSZpbe2kay+F+Fchd5K2xLfZa4fbxIiQ9him5u6ea4n/cfSydCFE5D0RKQtY59GPrucfKKlVh8aFPsiFjzNY24B7HnZssQw9PnQZUtk73CqiH6/NSYLBECMeymk9w7Qks3LARn/2O9MJUqAeprzdKr3qYM1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz5reFBIoDMHY6Wx6KZn6tzgyF4Qv4/Rr22OybwzF7k=;
 b=C1J32GxekkMnO1PGdnCnpBaF+Z0u06F7AnlN7UWD1QBZgY8LyGbErwiwX6CETVAM/sIf5m1q9rH9WXKK27m015lr4Z679J4n/ZQHcfqJfP5DJY96DKUvkr9SuMpUKtGkGIoYXofbGjmi/Im8Ek2CgdL97Kt+/AT9IS9YWbs3Dof9lP0nI/kExN3BCZALkgIWxxRneOoYth0wDB6i6qqq+riNtQ/CUu4FoHni6kwjjuXmD2evVH/3NckC94ehbYU9VEDoCT2/XjJ4rpfLR0xUDbG61qrdEideYyU5PH/U0MGZKxLsvQEUCaHbSKeDr+OO6/8A0dsUgxTfCyTS8iIhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39a4ae01-7ea9-7526-74da-1fea71274890@suse.com>
Date: Mon, 6 Dec 2021 14:24:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] mini-os: support event channel 0 for console
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206124612.24758-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211206124612.24758-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0047.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b62ed72-d34c-449b-2600-08d9b8bbbf6a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61765937BE47CC46B01DA6B0B36D9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/9pXj7xd3e+s/St+4XHNv+M4rgmPepHF56SQnqOBiAiJrYsxQtgSuyG7sIxS5gszsK0JjPfzkrgbDyZSrpAo5gxGAlmAlJ6lOxb8sjF82UXGafwoa+etNeMm/TI0lbx8X95EueTMrifpU1ewBzSs/Ub81ZhtcrJhNONhMakfy7xhmz1DdX41KlAYf8PaR2BEDSC0hTseURGYbabg0ENeq+Fbs5MP7XjHSUl4Y1/bUDyxYTAdr+x2LTi/+cpcAdCUBEzB1JA7Ojfn5oEpHii4m3SQwzjdF5bN1Oy2tm/Xhygt6VHp8/5RO69QqR3u3qDCdddDJg90IwScPIzWsRkuXL4dxsfKw05Ef6Cims/KZMDvY2LrW6jEOSZEVWR4W8AgN1POzJwSjcEMo4d7CRkarF+mXovRGaSbsaICCtKwE/8Uaa56yXxVdChXJTl+6jklcbhwRbhmO3oxvkz4aM3MmJV3gS4eRxwvl3Ojd3jah9z0Gx1b0CxY6lI2pYtVHJ/NlzOU639r6nY78d66l9u5j/dU/HYyx7lXPlhsIh89dggUysC+w2OnGZRAgFDp1VFJ0ph8hnei6SBK242RuFARmhUAz2CB0T5w5gaY+iYwxlQJoWs7FOd0gBaGYdPkqght5JcVHVNCt/k+rC4cZjLfwndsC+Km2lHxkvhXEfupYpqotjO61TMbaVhyNjjEagk+ONR0qUmS2whunv8zRo7K2+w8zuG1f1GyMtloaIzuTUi4DvCfrnWH4NbjlPyc5a8e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(558084003)(86362001)(6636002)(6486002)(31686004)(508600001)(66556008)(2616005)(6862004)(38100700002)(66946007)(4326008)(66476007)(31696002)(8676002)(186003)(316002)(37006003)(16576012)(2906002)(26005)(5660300002)(36756003)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnYvVmJ0R0lOYS9Jb2J4RGdYSWd2amk5QVI5bHBaVE5Rcjl3djRNTzhmbllr?=
 =?utf-8?B?REJJWlAzZE5uSFNGRHBNUnltWXhYUnlNcjRiUVd5OGVyL1ZucXBPOGpLKysy?=
 =?utf-8?B?YjBwOGNPWjBRcmcxajF2eW1SM2YrSFFzWnQwSWlrMGs3bWZJL1NmVjRaTWxy?=
 =?utf-8?B?RzVId2NDY3p1MUZpT1VLOXlRS0dYNVRSTXA5WEIrNmFrZ2UzSm16azhpNHds?=
 =?utf-8?B?Z3dsTE5RL2VxUVVRMCtqcCszV3ZpWUVXeVZpK0IwRTJvOUExeGVmNDdsQnlw?=
 =?utf-8?B?M0Mzd3RrM1JDdjkrc2tqZlEzYlMvTWJuVzI2Rkl3NHJLQkFDTW5uVWhQL0Vm?=
 =?utf-8?B?OTlGY1FucUp6WDNiTEZjdVl4OHc1dGFueGZ1clVteGF2OFlWQnRGVllXaUJy?=
 =?utf-8?B?RWNaL0tZWTd4QkgxeGs4VkdGTS9vOGV6Y1VUSVkxMjhaTlI1bTEwS1lBdnZh?=
 =?utf-8?B?azd3OEY4cm5WWFRNYkpGWVVFTTlTODFaNkhoSkJZTWU0OUxmQ29XNUtaSm1F?=
 =?utf-8?B?b2duTlZiUHJXQzd3QXRaaEdzSHkwbTI3aUlScGZCRVJPa3g0elVXV1NLYlNP?=
 =?utf-8?B?RmdHNGlVNkJIWEhpS0gvUUhJN0czcDVqaHRQSFNobktCdGJ5eU5qVElKa3J0?=
 =?utf-8?B?L293aWptenovdE9mTlBocHhWcmRxQWZoNXpSZkxHNlplOENMMzBkZk9rQ0Ra?=
 =?utf-8?B?WE9Ldk1ubE9tZFh5cXJuRUpDU1RRUnlUNGg0VUZTWHBsM2IwWWlwUmgrVUZC?=
 =?utf-8?B?b0RES3NXb2tiN0xsNU9UUjlOdWZiVkE1NFRTcnN5UCs0dTBLYkRJanpidmpE?=
 =?utf-8?B?RGZxUnFuT1phRUk3UCsycklUY3JMWkcvSkU1VmNrbjdmMmc1ektOSmNFNkUw?=
 =?utf-8?B?SUxwVUtRc3FmUmJ0d0dOZlFXK3VUOUthUlIzWjZkQjI2bnpQaEZrL2s5NWM5?=
 =?utf-8?B?ZWNUSEFVRFdmRUZTc25NdWVtVDNxeWNmRStuVnJ1WktIRGZ0Z0h1TWVRSUly?=
 =?utf-8?B?Qm1PMDdPQ1lEdmwvUVhkNnh2Nm9sSDlmUnhIK01QOWEyMERIMURqN3d6WHJN?=
 =?utf-8?B?dGJNWFdtbFo2aDlxZGJrdCtSTDA5L3VnZ09ydGc2cXFJZ1dTa1E5VUN5QzVp?=
 =?utf-8?B?VDBSWnh2OEhaRXZLRjYwVjdxRktHMDJ1Y3RzQVh4eFFLNmYvdmVXQWY4bTdp?=
 =?utf-8?B?eDgwdlZLWDl3WThGSWNXcXorRThnM3Q1OHVmVkVVcjNNRUFkT3BvSllSdENw?=
 =?utf-8?B?OFhzdVgybjFpZEhpeUdLR2pVR2cwZ0M0QzgvTmUwTUNUcmk0L0FzdlJueW41?=
 =?utf-8?B?L3U2dTZ6eS9OQlN1MVYwbmFSN3BaUE1pSWpsSHJwM0kvN3U2T3BtMktNeGdZ?=
 =?utf-8?B?OEI4Q2cwWTBVTFpqSjdMcWkzcENPTmJVSkxqeUo3YXV6QWZDSVYxVDBNdDRx?=
 =?utf-8?B?ZnBQSWw3V0t4d0k0Vm8zYzFvVG4xUE0zT3JuZkJPZ3FJSFVJL3V4bWdXQ1BZ?=
 =?utf-8?B?blBoRHdkOExWQk42T1V4cUZ1WXlJcTVMalB4dWhhS1R3dFQrT05TelI4SGRz?=
 =?utf-8?B?SlExekFRU0NyMTZHdWZJamJEdzduK0pZQ3EvZUU5NHdkMFhRQlpwQkU3R1pH?=
 =?utf-8?B?amRqTmJnckcwc0NqcWxQK0tzbUZPZnZOYlNIL3NOQWRZbDFWK3o5WnI5V2JZ?=
 =?utf-8?B?elY5SjZtN0ZuTVp5U01sbWU4Y0FLUTRGWUNVREZlc0ZSR1VPQkorQm14WWhk?=
 =?utf-8?B?djN1SjI0TW91TEVrQ1d0SmZlTlJ0UFZERUdMWUJLTTU2U2dZd3M5Y0IybkQr?=
 =?utf-8?B?YnlabnZYUnlRdzlEL2JDWjlVemhGMGxnbnVMWGw1aGFTSEJwM21LRmdKYW9a?=
 =?utf-8?B?M24xR1pwN3dMN3ZXU0tVbmMzMllCV29kNFdkSS92U2VXWHE5VVlyUXJsUzAx?=
 =?utf-8?B?ZE12czhWMlBHa21veTMvQzZWMW5IMWtLVFU0YU9UemhSaGRhM2ljTUZ5dVFn?=
 =?utf-8?B?VzRlNGs4N045b21kcGlDa2VTVC9jZGNIcnJ6dHhlemVHbS9xVEJRaGlvaU5R?=
 =?utf-8?B?b1dJenhmK1IvU0hGVDllR0JuOVhnaWt5ZUVFUUhCNUNpa3NKY2I3Nnh2d1N1?=
 =?utf-8?B?Z20zWHFOdU9lS1N2aUxtUDAzSGtRa00xWXJQeGtJSHVSdWF5RDQyUUJ6eHJV?=
 =?utf-8?Q?T9pqZ6HvRbHPhlWgc0Zd1ME=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b62ed72-d34c-449b-2600-08d9b8bbbf6a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:24:36.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QA2ZKKsLHFGecx1rAEH3Jtz2mrlGPa1mzNaXifp79f2xAd3tCJHikA9hLHizlKbFcpvLqjeF1iEKJz+yyfZYLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 06.12.2021 13:46, Juergen Gross wrote:
> The console event channel might be 0 for the console, so use the value
> of ~0 as invalid instead.

I may be missing something mini-os specific here, but in Xen channel 0
is always invalid. It's not just here that this value would be used as
a sentinel.

Jan


