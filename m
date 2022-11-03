Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E1617E58
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 14:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436600.690680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqaaD-0003Yp-Fj; Thu, 03 Nov 2022 13:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436600.690680; Thu, 03 Nov 2022 13:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqaaD-0003WV-CW; Thu, 03 Nov 2022 13:48:37 +0000
Received: by outflank-mailman (input) for mailman id 436600;
 Thu, 03 Nov 2022 13:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqaaC-0003WP-Ii
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 13:48:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a90caa-5b7e-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 14:48:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 13:48:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 13:48:32 +0000
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
X-Inumbo-ID: 32a90caa-5b7e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmLPJJ/eSqTPv49t9fn5VPe5PPKdQmKeHK9xFpG6AxswgTIGG343V27oYcvrbTIDzFKDN65kKTtstkDrkXqu0lko3nTqeQuUU+N4EMXSvEoyBuCL6Vlua7eEzjQx8JKqTwBrFLCbEAfWfWIbdl9EB2Aca6OF+GJ97eweEI2F1IFbvYXyoWjTMzNIy6q3Z9foYmja2hWscla4Ab25rm/sH2PQWtER7f0g+g8tYrvs1/aJfC6rHWA2UEKuV3DXLGJpuEMTw8dNVgXga8kHkc8GIxoRB45bRZ7TPItR0O9nmDDl0BbLdQCpsEIT44VwykYFCQ+BbX7Qtg5df1tcThJbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe54xzSNXVksQiYOAH50cmCOIBeSDqgVz6CHue0NchU=;
 b=Es8hYcVkSxNkwq1nEhf5E2VoMcKmVfzRuLxxGoCxCj7JuVX4NJ+Y/qoPSioS4/1A7h1X77gbQ5rOEkSySBXUWqSgrwielNc4oMw8JwLTK9T/SbNT8mUh6tfZeuj9wv0wv3HbkegGqsbBPMWPNuIjvfmji6YTUZECqq7T+jO2N2ms2fxc7unIRkC4A04/PP2NO1g8BslimT+q1An3ySkM+mzap84vTaf82vR4ft1Iuru5xMEYXNszaIlViDFjOLFrxtiKHiti9+1UM5eFWtH1YHn6qf+oNM5LOYq74wJRWGiMffq2BpbrLXj/vkeOj4UP2PF7ERoHndh/dLAHfqNMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe54xzSNXVksQiYOAH50cmCOIBeSDqgVz6CHue0NchU=;
 b=h0etp0p97ILY/vWaN/Wkx/tLVxNWG8DZBEgHUI1xqN/R/BrfNSyhNEbS0EwL5kVnMmJ+cqYinytdaNnshl+23hovAXV3DDHcgAzMVA7IDMSdlHKKYZERce84xEcLZA8jIM2ZJFl+2xzKhLFF+mrJlA+OH5/6fnePRdoQJtnphrOJHTZ15YeeZu5ooOVwxy+oDwLFto7gHhU2nGn8+xmciKu0KEF3LER0THV/tGpaP6OCb4+4Lm5r8ZNAjrsdLmCpib5brd4C6WiHyV6SoONXfsEolMnyltEmZbHK7QM55ZVub68tckhKnLhuBn8fTlUvaFIKjBGBwdeCoy9Fsvbpwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <069b911a-bd38-ee07-e396-afbaf1838212@suse.com>
Date: Thu, 3 Nov 2022 14:48:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: x86/HVM: Linux'es apic_pending_intr_clear() warns about stale IRR
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7d9022ce-4a46-e0cb-67c3-4124e1c0d2db@suse.com>
 <ee91d4d2-e889-355b-4d5a-b40f3dabf81f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee91d4d2-e889-355b-4d5a-b40f3dabf81f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d41f62-7e13-48b8-30b0-08dabda218ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4wQVjC9iR993sjBpjLe337UaPFacqEdm/t2yy3/Y7PR13TMYUWIPSWk3jkd8/5cXvg0lAOfGU7DJUEGxXNFvzSHKqXTX2K8euy8m7qpRgdokH7l57zYMLDkRL55IvNSWuteMkmU3zSUkdr674vipQoCGH0ks4GMhpDVMfmxNexYksm6lKCSzFBXYV16KRo0tybAABOUOzcLp6oCTcsAsmYwY2WyOTV7bB9hmkbDc632dwu15SQxdYuTN6aQXTB+Kw5wjcKXciBnKeEg8J514v7qbDlYS44A5JU1MZVqTs6Cu7WJwyUjdZm6TR2w5kUoyUyb09wfLqemklJNdwqHRwKhf7fKNuLpA8M1RBHHkZAsIdElT698EE78ZzcYiLCGXCyq4cOL+2hL2+wa9DEAkj/TWbWbq6c/1DTt8kzlYDs/W4geFgFjLvui8+iW9TvQ0zH99QHLWjiSKJcbrzJ8P9fPmsAdA2plM8wrBh1/sW7yqK5fDZLREL6fG++MXNR5re3Q88lXfvrmqIlTxHj8R2PUgFC6DRFilpBQHCf53l3eyKmbGUpKzJXaxoEjh1S1Ee9l2PgVRRa0d6+P1vpp3aR/gjojvCFiOoNq9wZjTof6UQ1QnwD82Eng+ZbnoTidjOipnULWmpOlCSybP4vqMIn59xxNNul4eJtRw7wOFtHtKHoOuec3xwF+HCFbqxDvRUxrLcd1OLpLx3ILjW4NlMdD8aySP7+Zua39i7NUgTOm7hiHPUPTPkv9QEK3TjnUSnaZhVi9/RjzuI4OYQbG5fRDwiW8WJPEwzlUTO5s5EeW7gfwgZgaqdW5ojt4n/DLjKeF/JbqdQCuFd0xu21Gww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(26005)(4744005)(5660300002)(2616005)(41300700001)(8936002)(478600001)(966005)(186003)(6486002)(31686004)(36756003)(86362001)(83380400001)(66476007)(66556008)(66946007)(8676002)(31696002)(4326008)(53546011)(38100700002)(2906002)(6506007)(6916009)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?andRem9BdmR2VEV0V1dvanBVajlieUNvY0twUXZRcXFlSVZTOHZXWUEzeDV1?=
 =?utf-8?B?TXJDdHk3TkFoNmZRa2JzRFh2Z0ZVOE5NRG4yOWxtbHVMeUVhQW4zVktueGxz?=
 =?utf-8?B?ZlJOUTZRSWdGU1RGSkFaS1ZjL3N4czhBZHJrVHpkc1BFVEJXblZUZHdGcE1v?=
 =?utf-8?B?ZHJZRjhEQ2pTTVg3bWtoWE14MHZIYlBHeHV3cnZmR3RDVlRIY3lrVEZKMFJz?=
 =?utf-8?B?eHB3NkVGVUwwaUk0aHdCTHA4a0xCckRieVJuREhYOVhvZTdRZDRsSTJvRVhk?=
 =?utf-8?B?YUVHaVlVZ0dMSFQ0ejIySEVMbjIzT0ZZakFYNDhLa2pHSmVVb3BjZzJPenZP?=
 =?utf-8?B?UW1nUHRpSkhoekRlNE1ZMStrS00rV0k4cEVHZ0xuOS96RzBXc3hGbzVPcC9x?=
 =?utf-8?B?MnB6dmV5RDMvOXFSbi9YblB6Zm5YVXY2UklKNzE2ZGxGcWVQZ05DOWFSUWRi?=
 =?utf-8?B?VEVMWG80R0RkcnFHVWdFS1FQZHFZdVliOEhwbk5nQ0MzQTJHZGVkT3BGdFVx?=
 =?utf-8?B?UVhzbXlTQ2JNS200aTdoQnpuYkpDczBBVFFrZnZCVXZuUHM3eE03aGkraGxZ?=
 =?utf-8?B?OTBtenZrTjRGQUlLUnhTWnJ5dTNCMUJ6TnFsWGVFYVhhYnY5Zk4yNDgyazBH?=
 =?utf-8?B?Q1hEN2xVZ3dyeUxOREI0cXowUnRXS3FUTm4vaXdFYm84b3F0ei94OE5zcVl6?=
 =?utf-8?B?QzI3eXFMbklKMVRzQ0M4eUpvVHhUSUxac1F2cS9lVllMTThaR1Vib2ZMSXVn?=
 =?utf-8?B?a2lkcWdKUHVzc1RoYUc0THIyT2JUQUJzN0RKUGlyanBZbUQrSlRPUndVM2FE?=
 =?utf-8?B?RytqMkdHSnprTmlMTHlRbWdmLzNKQ0MzajBQRWZabU42dnB4YmJKWEs2ZXlK?=
 =?utf-8?B?UnE2V1VOODd2d1hJNUtuN203aXRPWGhQazNHbjZFTmdMUEkxZnpMU0pXMW1I?=
 =?utf-8?B?Um4xQTJGeEp3MUZGZXJQRXg0c05TZGo5SlV3MEszbWdWck82TjdRY0IzLzNw?=
 =?utf-8?B?a3ZEeHRyTmxwNG5zS1kzUVVsQjNaT2xXMVo0ZnRkZjRGS1Q0VFdGbndTUnFh?=
 =?utf-8?B?VGhHZ3k2UFlTclQ0ZDgyRlFnZlBUQXhKMFoyU1FhL0MreStibnVHcHpObDNS?=
 =?utf-8?B?WXJIWW42UHRMYzI2VGpVZFRsdGl3QWw0enpobmVObDFVTVh6NkkxZ2lRcWVG?=
 =?utf-8?B?aWhnYUc1Mk9NU3k4ckk2cGh2aUt0MDRjbWg4a29zRGUwckxlRGZFN2RmeUl1?=
 =?utf-8?B?d3l6YmNoclYycittQTJzM3puem9EV0dsUngwQWNSNkxMSE81OSs0QzUrYVF6?=
 =?utf-8?B?MEFGRi9aSDdXTUFtOFUrT29RNngxOWZXVHdEM2lvSGo3M01PdkYyN2lQUmds?=
 =?utf-8?B?NVp0NDdpOFlKLytUK2V4a0FtdFNjbHBiaVhsUnFRRTVpR2ZwUFFNeStxdnFD?=
 =?utf-8?B?dHRjaVBpMXpLRGRld285eCtjcllWbXRBT1RmWFFDeWpXT05OZmliTktLMjVz?=
 =?utf-8?B?VHdWa1U2L2RMSGhJYmV2YkZiNGU3eng4SW9TZEVYVG53SFZiQWRHVGdROElu?=
 =?utf-8?B?bFlZV2tDbzJvYUZDL2F2OUF6ZklHY1V1a1JLTmo4R1hBODB5UkNtNkdOQ3Z5?=
 =?utf-8?B?T2N4TlE0b284SUs4QXVTWWloQWxGM3M2ZHMxaWloN0RKamFUL1dYQ3JBOXFT?=
 =?utf-8?B?MjdmUG9jbm15RHh5enZ3STFHK0FYWDExTUFFMWFVeGJOeis1N1hTNm5MUm01?=
 =?utf-8?B?NDcxNlhsNDc1bzZFOWpZdDViVW9jK2ZmU291ZlVWM1pza1JTR1psK1dVS2J5?=
 =?utf-8?B?b3M2cW81SCsyUVJ6Rm9DZ0FNZi90bXVZWWdkNytXd2gyb0REdUhrK0hoYnVw?=
 =?utf-8?B?VEZqTlFlYU0wVU4zeWtIWGNOT3pCbnB0UGY5OWU4TU5UZ3lhWUFMREs5V3Jq?=
 =?utf-8?B?a0gySVI5ZEJRdFk1OGpoaXAzQlN5VWNwMHk4NEpOdEZXNGJOYVFRL0xySVRw?=
 =?utf-8?B?ZzdZQnJJTEdkWFYwQ2hxUmFWOFBFbnIrb1kzUEl4VExKc2pYaFNjRkpNQkZN?=
 =?utf-8?B?d2VULzFjdEZYODBsSGs4TktRY0c3OE1TSHBIVGsxZS9VZFVWMUNRRjZxK1Bl?=
 =?utf-8?Q?KURyAO4I8HVqnyH673RYxHS7g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d41f62-7e13-48b8-30b0-08dabda218ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 13:48:32.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBzZ1DegANM4IJ/Vblue89/HYXWsWBE3cV/5PbqTXaSy6sCvz9H3IzTPj43WLmpJhL8OidgU9a7qo+bT+zMa7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058

On 31.10.2022 19:37, Andrew Cooper wrote:
> On 31/10/2022 15:55, Jan Beulich wrote:
>> Of course I'm yet to figure out how IRR bit 0x13 ends up being set in
>> the first place.
> 
> 0x13 is a legal vector for incoming interrupts (for reasons of Windows
> using 0x1f for self-IPI.)

I was wrong here, mislead by the way Linux logs the IRR and ISR: About
any other separator than comma (and perhaps a blank) would likely have
made me check the order of elements. With commas it was pretty natural
to assume the logged items are in array element order. Turns out they
are not, so the bit in question corresponds to vector 0xf3. Which then
pretty cleanly connects to a new feature in 6.0 - see
https://lists.xen.org/archives/html/xen-devel/2022-11/msg00199.html.

Jan

