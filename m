Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5351A0EC
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320749.541645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmF4j-0005Tg-MP; Wed, 04 May 2022 13:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320749.541645; Wed, 04 May 2022 13:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmF4j-0005Qr-IC; Wed, 04 May 2022 13:29:53 +0000
Received: by outflank-mailman (input) for mailman id 320749;
 Wed, 04 May 2022 13:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmF4i-0005Ql-GF
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:29:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b87242-cbae-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 15:29:51 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-M1Fa6z5vOqqHdgO0E-AT7w-1; Wed, 04 May 2022 15:29:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5851.eurprd04.prod.outlook.com (2603:10a6:10:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 13:29:46 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:29:46 +0000
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
X-Inumbo-ID: 46b87242-cbae-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651670991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9+FwQel3xlzm+ts3VujKHKpahUBSQESjXCgj5tGyjk=;
	b=GYXQEzRRH0DIefA2ES6jucZ1LniQXQ6dpL6kRBmAQe9apbZNwOxd+e2Lu90cLO/MbI2Ykl
	tneYN/tO5vIg0eavPvc8U5R9fRc08q8wzcMDZLR9zrad+YdB0pVwvzVxEZxtCeQyBrqWF2
	AUos5UWb7lSTqMnyErhoTAeFyCl53i0=
X-MC-Unique: M1Fa6z5vOqqHdgO0E-AT7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpy2r+MDovDcNjM4ebaY+UqmzIWP6WKCNvgChU3gkjOIK6cPB2qA0PMgprKCo/J9cvuM+D2ZHueKTAwBJ4IGXbIZGDEaVREYzyeP7x/cx10hf5xMXt9LT9MVbezBzR6jMevnPqO7Ue2tSuCJttEZbv0v1keG1pqXgXhBQ9U8MinHOphyrQvPkpssWcaZ0Uz3wWVhYzt/6U+NZsDuiewPkI2Mu3NJDX2n5RwTMW+2n1FwV4sSVBmqqAX/SqjgsPiO9ifm1oFH5WyhyAcnN8pRqxuOrL7CgR/1Ck0pfJ86xhsNf0VTAyfRajO5fRTYTVUE9D7SHOgFOsZhZROeNvNYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9+FwQel3xlzm+ts3VujKHKpahUBSQESjXCgj5tGyjk=;
 b=A7Dm754bpMUrhAUMmSgq49nYUD81gu/LEKUCEbMBrM8yiyTI8J9irEZB8SDPdqbdAUxUct3FM+FApCcbh9lH32kFwbgVstEdoRUziSfHQBYdJErHOh8iezR+/iYM4oSZbhbgNi4ClSWk5mxv62PoRmnWiLHygWadyxJJkkePMuEBDeNKSCC4Jzdc/aAihMX+V7i6G3amPMPMMpIRuV0Pz7qoni3VRxO/F2vsT+J2PO4GPsfw09qJuhDGboclERnTpbqX9NhTULE+vQkKn+VIr6/7sNSjIFanY8Gh6tDFJKrCLgOenx2R4eaO1O86gdQtBRoDIKVaoBUyc58bmOgiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ba5fb49-4cbf-916f-9d8e-4b64211fa87c@suse.com>
Date: Wed, 4 May 2022 15:29:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/6] xen: do not merge reserved pages in
 free_heap_pages()
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427092743.925563-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939215fb-cbd0-4ad3-58b5-08da2dd227a1
X-MS-TrafficTypeDiagnostic: DB8PR04MB5851:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB58513059C2900000DD23EC09B3C39@DB8PR04MB5851.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z5yXe80XQ6G+Q89Xe4DLzzS1gvrVkpO49C4FhQschL11kj//q7aT9pajSkIvcGHZr6NhOlPYPoeX92veyzwviOHk3oGNlIeEIVy3C6kOI3tKwGsRIHn0tl4WF8I55txPyFIq93xCnCr9QQ0xBAVwYnqdi97g4WiSGlg9kb5pAKlnAiFcm7YRJBFfymZdoEGoLY3XOPaOh5WXtr+NgeFwMTh0jCYE/mbUAZfb8yNvlsc6HNRoMtLmboKIdBT5eKHUi/RMzaM0KppoHNxh8Nq2+xAkECQQIyg89Qzsse7aUOEcDnTP2DnJFhzstoxRXHSoh6bQfL4vYd0W7+5QWqPKCL0fiW//YB4273U5Dx6ZoKJbnk3vRMzFaBpyZV6LA95UqFEooUnheV21aePqYRpw2bvmmTAscfT9k/zA+CA5K5zmqq9xSIK/pEO454ak+5n/rzJAQhlZF4/D75PIFSVG7GzFsoPXdki9/ctFKPwYvsJ7U3n+svZcP+zFBEEpAJDHoJ8G4QaEHWJ35qLnoqbGtzPc0iOoL7ALoY4bmxWECYJ+kEgM63XNjV4zQoIZflvbm0p1lYhUI9VN0H4rCkQzbjCAAwrQbEMOednukgCltshwm+iP+HGC84N1IMS22Ct/WUMdj43+yT2JrPyNm8ZSi+9YN7MAk/PwV2MCPeoKQIImKTc8fRk0H4iuxSJUT80FbsOSW3DGNLtu+tU1ZbldBriIKTpSKa01k+LSxDKhnD6rNAO8h2dlV8YbdZhSb1ev
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(26005)(6512007)(5660300002)(508600001)(2906002)(4744005)(36756003)(6506007)(86362001)(53546011)(6486002)(31686004)(6916009)(66556008)(54906003)(186003)(66946007)(316002)(66476007)(31696002)(83380400001)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2N2TnpRaVgwODdzbFl5aUpvSURIV1NKWjBwOU5RWERNb1dla1ZxT1l0d0s1?=
 =?utf-8?B?b1VUSDBHbURydDRRbVFiMXpiOG9xYS9zL2d5U0xLT3dTNi9ZOTdIZlhWMkxB?=
 =?utf-8?B?andPSjJpWG5JT2tJOS9XMk40K3JoYmp5L0NhTEtsdW1HMWVmMStTRElBVjV6?=
 =?utf-8?B?c2hPVlBmM0VmM2lJTVllQXB2T3lCcFByNENGeDNqU1FoMjk4UVloR1B3N2tp?=
 =?utf-8?B?Zlg2ZjJpRTJ1RGU4VUZwUjU2ak5RZFdxbnhBQmxxM0pHRCtPaWRSMFFWTmtI?=
 =?utf-8?B?eC93Q0Qzd1k0S0ZkMlNuVDRlbmQzeG5MMlFCVWQ1MlZLeU0rdjA5Tkp6UVJJ?=
 =?utf-8?B?KzFvWi9VOE5Zai9GMFdGaXlxVFN1K2pkeHdDeW1Ea3h2cGZ0MkFPOVp1dERY?=
 =?utf-8?B?ck53UVdySk13ZEhwVmcrOEpqdXJ5aWxtSWRCQTRzclVIOG1WOEFtNHBReHdt?=
 =?utf-8?B?SDk1eFhjM0thanBYT3VMaTFsUGEyZUc1ZHJmMlJETmZhSUx2YmcyTThQTUd3?=
 =?utf-8?B?Q0d5bWRBZzZ6V2ZGQnBjLzlneWRTSVNydnYwK1lyaUY4S3Bjbng5OGx2QUx0?=
 =?utf-8?B?THd2KzVzR21aaDBIRkh0L291a3FadGRzSGRITUk1d3J4ZUhLb0d0eGlwYUlz?=
 =?utf-8?B?cXhiV1dsVVRRU0QzbWtHc3U1a3Vuc0RFYnF6a1ZqU2dWc2l3QWx2YjBuUlc5?=
 =?utf-8?B?cTRaaHUzQUFLYUJ5clVyRHZrOEFIZDgvdk01ZVhuVVp1WFNqN1pqejhOcFpY?=
 =?utf-8?B?ZDJGbkFTaUlPVEVVZnVxT2JHbmxac1hSczZFMmsybGF6TVd3ZWpHc0l5d0NV?=
 =?utf-8?B?NEdkZUhOUG9uMzJUL25mUGxGNlpZWWxDSUxwVDdtaWs3Z0Jrck1jWEpFREs0?=
 =?utf-8?B?QWUzaWtxbVhhZzV5cUtvTGlBbzU3c1krSkY2TkUxb2tNSHY5dlpPQ0tmYnNC?=
 =?utf-8?B?c3lxc3VESW9wemZNQkRoNGtZSENiR29qbUxqQ3ZubHAyeDFYTkc2dWdBQ2tM?=
 =?utf-8?B?emlYdHF5cExnOEpBTHhnd0hFbkJpdk9Fbi9TZWpxVXhBRVQ1UGFQU0didDJO?=
 =?utf-8?B?VlU4cGRpNE1aMHQ3aWFjTGdLdTBIdzRKRElHemlYMkhkVnlHK0RPU2luU2x4?=
 =?utf-8?B?SXp4N01oZzI2cm5JYjJ0MytndFkvbGlqdjhNajROZjlJZFk3ei82WStneWlI?=
 =?utf-8?B?WEZsaXoxZ3AxcFJMbk5Ob3JWeXJKUE43NjRKcEhKdTNJbWhmcVVYV1hpRDc4?=
 =?utf-8?B?R3FibG12VEZRL1E1QnVSMTR4SmpPa2t5ekJYc3NMdGF4NUVNWFVKTS93bDRj?=
 =?utf-8?B?TVNvTUVCUjFkbDBwZ2xWSzFqWWJZVXlZU0x1M1ljQ1BZUjBibXY5emZHOEZs?=
 =?utf-8?B?Yk1PVHVrTFBFeVhWamcvTW5SQlhEZy9oVVRxQ1Z4UXFkdGpQem9XQkhvemZT?=
 =?utf-8?B?VC9janFxdE96ZElTeC9rb2ZQR2lERG1oWG9kTUxPalNQaE16OVVMZ0JXNDkx?=
 =?utf-8?B?dFZmQkovaWhyays5RHFWbVBubG52N3VkWEdzdXg4RzkrYXNpVVIvNWZpc3dw?=
 =?utf-8?B?NHhaQ0F0OGpqZVlRaGFFRHkzMkxRUW9vb2VPNGQyaUo4bmdWV295TEc4cDNp?=
 =?utf-8?B?WE1Jc0prbTJyeFR4a2pJR0wyNnZMOEh1SVcrZXEyNVhHSXhqY3BMcERvWEpm?=
 =?utf-8?B?K21NVWdrdWxWYmY4emxHdldlL1RUU29KSEgzYmFOVWxVaTNaSThTc0tJSzZG?=
 =?utf-8?B?cU9SY2U5WFhUMzdhVHlaMFlYS3ZxNGRnRGhOS0hPNEc1KzM1WnNsdEs5ekdX?=
 =?utf-8?B?dHZpNjZLWEVHZDBoVC9pTWhVemVmbXJMeTdjZXQ5Z2orKytpZmtPdC9odW8v?=
 =?utf-8?B?REJrSUk1UENUQUIvem9RVis2VUx2dEd1T1BhTVhOd2F0OWl6eU1waHVuZjZE?=
 =?utf-8?B?TEdYbE81QkMxVExhMUZLWlhZU2hOZ1JzT2NPa2JwMi8xZWpJZ3RqRG9qYkN0?=
 =?utf-8?B?SVRXS2RyTnd2cEh2cEJQS00wYjBWcWVMTmtKS21MMW9yMExNWWdxa3NhTEsx?=
 =?utf-8?B?Yi9sdG9STXdOWExHRkVIeHZrMkJCb1g4bXVidXJWRmVGSnliMEFlWVRHS0xi?=
 =?utf-8?B?QXFUaDI0TENLVmtaeWdyRVNxQ09laVB0VEVFSVFiNkRTam1ockhXMTRPVDcw?=
 =?utf-8?B?ajFkOFZGYWU3bVFkb1hobTVsWDlaMHZ6cE8vTytmd3U5eUhiQUVwdFdwaXpC?=
 =?utf-8?B?M2RQMXBxNkNnZEpYcVNTaThJemc1MjFSay8xZ0k4RUNFaXh6VGk5U3p5RkNI?=
 =?utf-8?B?M1J5OSt4Ky85SGxmUjkxcmlJcTZaMnNkRytmMVlYSHhGWGkrbjdRZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939215fb-cbd0-4ad3-58b5-08da2dd227a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:29:45.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5p4CpRrKESz3Zr3MymauNb430t8o16JzykN0ZRj2/MfvdbIb1KE1jBIDGB6J2jxTNIcpcqbEaSv9plaH3Zb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5851

On 27.04.2022 11:27, Penny Zheng wrote:
> There is a slim chance that free_heap_pages() may decide to merge a chunk
> from the static region(PGC_reserved) with the about-to-be-free chunk.
> 
> So in order to avoid the above scenario, this commit updates free_heap_pages()
> to check whether the predecessor and/or successor has PGC_reserved set,
> when trying to merge the about-to-be-freed chunk with the predecessor
> and/or successor.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I think this also wants a Suggested-by or Reported-by (iirc) Julien?

Jan


