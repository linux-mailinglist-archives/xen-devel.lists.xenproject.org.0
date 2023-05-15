Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB2702F6C
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534767.832108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZ1X-0005Jp-67; Mon, 15 May 2023 14:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534767.832108; Mon, 15 May 2023 14:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZ1X-0005IA-2d; Mon, 15 May 2023 14:18:03 +0000
Received: by outflank-mailman (input) for mailman id 534767;
 Mon, 15 May 2023 14:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyZ1V-0005I2-Cr
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:18:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bdbee2d-f32b-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:18:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 14:17:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 14:17:58 +0000
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
X-Inumbo-ID: 4bdbee2d-f32b-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8vLfD78F9yUZBhIqhd1/QLTwkPL+j3eu8JtjoaT5nUFtJR+TMGyv2iifnFjQCwQFG+lY2ZMY/rtwYw+X2u1xB2z2R5CNH2Xf02kwztySb1jnLZRJQyJcR+IWvSzUq7oud+srYKmd2hh8H9vx0owixW1UofwpAh9FOJ3U96O8RjYVtk/Ldpz/+Ox8BlkrCzZNqi8Jye/5F1/68hx2rEWfJp1/JYcEiNR6JoLCrC5jICy806Tw3MWa74RxkRTKG6LKcGxWPy1cJlN7liJ8soiv8QQQxNoSjvOEw2Q+PNAnDcmyAOANdOYP3Dno6xwN4gVnJGa1KOAGZ7X3DJ6jDgOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/siV6QeM35HdbrNIfkBM5oBIH1tlKDoalu1/+ke1uUA=;
 b=lHMklogAAZYR0Xween42+YzaI9XYOsHWilddDLbj8TQrC9/zcpOl3uXQ0N3Bd4C0D77GiKgLBJ2o3X478Jzw9oEVv5U50GlGdsFh+gYedzvZkvWm5ZzO4RZgduXKcLFbquz+4viTOmSnAjSoJCAuwiQ9ozlDGOC+FYSluTxdB0kxeUFSfK7CMNSMT7rld4lmVj1wdOTZ9oppqvmcpjPsGxIRfCctf+ZS4IiCRSFBPgCqVlQ27iP7qqt1aCO1RUF8PGQ4uepFDxiSmKOdzBSH0UZViRHIqMj1FU8FH8qM3v9fPc+n5/BczWR/sjTbTy3SL6NTb0uqGJx5ec+Tk2WHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/siV6QeM35HdbrNIfkBM5oBIH1tlKDoalu1/+ke1uUA=;
 b=g1cg4A/L7UH+z3xt33ped3m6j7qJtolIw08noyEr1iCx8Q5lbUGUz7PGUvXrmcpOpdwaBQ2INtUSaIqe6XmG1qJuNblcpsrF7js7FO41t5NRBEzUjc6ZD3j0qLX/33gj/zY4dhW38gAg74ORSJoiqAbT4HWXx5aKQ81i5zr+KPS/j1XupdBcvYbSOi/IplTqiTTTKDrP+UGkGQj/+8wJRP3VkwgQn/MEt/UGtJxZkRXdo2A3ua7iVsc7VsRrdtv8vfgBbM2Wac3r3HLqydV6Vv44WrfY37QPZihCA3+Y9g9vPfhI1eWRvIR2zuRyFio3n5nrMwqMTyZymu6FmF1jYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
Date: Mon, 15 May 2023 16:17:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
 Stefano Stabellini <stefano.stabellini@amd.com>, roger.pau@citrix.com,
 andrew.cooper3@citrix.com
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230513011720.3978354-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc1ae88-9d3f-486a-a01e-08db554f2f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4vwj2j3npOxK7bt+KujPhIDKCo3/EVH3yIpJcOAVad85jdOJsrD9232n/4NlNcoYTmx9dzLRY5IjHNPqCHo/O5QSNAkxkTt60N77plJ4bcYNn3SDjkpaRitP5BAghQw8vzGHd9Oe/zR2Ivd8KpZ4TNAlR6Eoc4KzkOGcabBcv5makDvHRCRJqJc3twKi+teHtIvynZTu5yqJZdRcEV7btPDsSYwLHhy51Pdz7RrWFH5DMOHUctewASy2zmnDothbc0eseHzAa5CvNp5jOQJmXAEhN/3M1TKkLWE998dlWIXAW9j0IQo+J3yeRQx1cbi6WhSmEgRbunI9gGLdBmxitycu7ht+MZ18RyN0G5IzIGiyFDP90nx/JbjWjw5LqFS35g4YwIDklBf0pFUUdx9ILXM0QDRvG0QEkzjeDq0SkKpDyVldcHeBSkFV4qvA0Yar24FXu2vbV8kIiUS17Ny+kSD20CcMYCt6RFfsBH2ZopaVoO52zATc31O483kAGULs/7BpI59bUiVAkH4pkq0KMY3Fj2XGbefMTXl/12AW2Mfyc4FhZ9jXcCLf3iVYKWBLlt/EUolsH0Ns+cu1H/r+aIYd9LfaELWFCxiaCbAkIZ+nyCE14l9uxqEBibQedFW9jIMjmGnSpWXttm13Spi9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(4744005)(2906002)(38100700002)(316002)(41300700001)(5660300002)(8936002)(8676002)(36756003)(31696002)(86362001)(478600001)(53546011)(6512007)(6506007)(26005)(186003)(6486002)(31686004)(2616005)(66946007)(66556008)(66476007)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHdXVjVxdnR6ZHoxY1RLYnlOTzBycldBVG9GbTNPZHNNS1BwTFdjRTc4SmJZ?=
 =?utf-8?B?VzNKVDdwbzlNNFNZdUl2ZDJ6eTN4aW5RK1FNTlZHMlNkenNQZzY1cXdZZWhL?=
 =?utf-8?B?aDNMTkNkdTVGVERYNkNXcm1INndrRjJYZGVReGpEQ01pZC9uMmVxTG9ESHZx?=
 =?utf-8?B?T0xDbnM3Y0FsWFZZa2R5bFRiYjF6UFF2Y0NKZ21kaVJVSnhlSlB3alB0dCtk?=
 =?utf-8?B?T1FIVFZ0L3ZVa2htbjJvMDlwZFNNUTlwRlBqT3I3dE9pTHFwekpSUk43anNB?=
 =?utf-8?B?MVkrRVpKWVQrbEVLVVFzU05kdUkvcnJOK3NGa2Zpd2xJWnBJaGhIZzExQWJi?=
 =?utf-8?B?Y2xsdlJXWVpYSExLL1J4T1ZpMFVJWFpsQnBhL093ZXY0K0NMOXI3ZU1WQnNT?=
 =?utf-8?B?WUhmS25iYmhDOVNFaGExQXcveWxZRnBxOU9wUThkSk84ZHNORE1XRkFEWVg5?=
 =?utf-8?B?L3lZclBXWGdsS2R3akM0V3ZFRy9oeTFLU2lZd1llNURHRGtvR1ZGUm1aTzJC?=
 =?utf-8?B?NUcxMlR3ZU9jVVM3Qmc0cE4vQ2lLTTVXZmU2QXJaV3NRc0JzTUlPb2VxU0FH?=
 =?utf-8?B?R3F4TkdlUi95S2F5bU5ld1RpdnhZOVRPbUVFaEpuWjJiQXF2NWhFUDBtUGhv?=
 =?utf-8?B?QTlmbGRpNGFEdmtvTXczT0t6ZHFLUTRoMVZJYjZ3Y0QzM3dFYjU0RHl2eDh4?=
 =?utf-8?B?R0tBNGMxZjV5ZzkxcGVYdzZRQjZVLy9pZ0lSQ3dHT3h6T3ZhWU9BbFhZWHRN?=
 =?utf-8?B?Ykl1MFA0WFhobFdVSFhqU3pmcTJ1SnhSYjhQNmlNZzB1akQ0a25SaU9KcWtT?=
 =?utf-8?B?ZnE0U3NsY2RaM2pzdkdmL2FrR3dBUXNIbVZhc09oTVBrTnkvbXlBRlpqbm52?=
 =?utf-8?B?MUdFeTlyOHNNUjdySzBHTDFHdzJtdEJWYm03cHI1aWNNQWM3MHRlcE55OVhZ?=
 =?utf-8?B?b1h2T2x0bXZDU1RDbWYrOXZEcFZPaGtJN0xwMS9rWnJtVFVQSlk0VFJLNXpM?=
 =?utf-8?B?VEhlVjdoVGl0M0RyMUFUNlcrRy9MTDFKQUYwMjliMHlML3dPekpJcFA0RkIr?=
 =?utf-8?B?bi83ekRFbGJXOURneVo3U1BuRUNpUEJqTUxzUUhSQTlIZTY0T1IwYkxFeFJG?=
 =?utf-8?B?TVFXUnJFeWRHMkZkamZGMkhPRk5CRUNMOXRIdzJEOXdRbUlFeko3a2xKRDhN?=
 =?utf-8?B?OU16YmNxV0RpUG9jQXBXczNYU0JHM2FFeDZvOEF1RlAxYTl0TUlsOCt2RHVE?=
 =?utf-8?B?YmF3c2NBUVdBMUhVUUZCbDRPM2RFN0p6WWsyMm1uQTRlL3QxT1JydTNJdVZ6?=
 =?utf-8?B?cjliczZnREwyVU0ycEcvOWJreHl2S2hxN1FxY2ZMb3dLWkcxNjBxaTdEVEll?=
 =?utf-8?B?UzZITkRoK2ZsQWJsWkdpUzhpNkF2dXoyZXRTV1hQdnZGS0FyM1EvOEQ1bmoz?=
 =?utf-8?B?bFpRR0Y3dUZFakNZYlg5UTZEanZUVXI5dXBhSkphaDJHRTdHTy9iUHJ5UmhH?=
 =?utf-8?B?ajFQS29IWXZ3WlBzMVdUMlhRcjkxa1g4YkI5WmZTM1Q1OEZSR3VkZUVSVU5R?=
 =?utf-8?B?OHhobXV3QTBuYWtkdkVRLzhnWTZqeDczREhSdko2dEg3MWF2WS9LdVc3blZB?=
 =?utf-8?B?dGpTL1M4UlBKUkE2UlMyWk01NGlMUjEzQXNxY0kzSjYzVE85SHh4MXVxNHFy?=
 =?utf-8?B?RFNJblBsa1ZsNE1lZGRVRzVRU1A0V1FnbzJZWUl3MEFITWZmaHc4YlBvWjZC?=
 =?utf-8?B?dk1LWnNGZUk3OXVlRFhMMzhzVmwxNk40V1JKL0EvTnFad0ZWS2Y0cmVNTmU1?=
 =?utf-8?B?MGxQMzhKUjdrQm16M3ZsWTIvT3NRM25wT2RFNTRveWJPdjZkSXdiM0FqVUdO?=
 =?utf-8?B?Rm9ianB3c2J4V1BjanBNenJMbTRMam1FQkdhWWVsenBoeFdRRXhQSld3azFo?=
 =?utf-8?B?d2Fka2JhK1hlYWF1U0FoU2pXVnoyU3k0TEV2OEJCTTA4cU50Vm1Za0F6RWw4?=
 =?utf-8?B?TUlwd1o3RENON0cvQm9TMlNzNERPN3RXejZSUk9SU0cxWDQ0T2tWT1JMVEZJ?=
 =?utf-8?B?aXhxK3BRN0syTWsyUDZ3bTZnVHBnODhpMmZodStFeUtJNElua2hxdU5Gc2VS?=
 =?utf-8?Q?Wfc7lcU9Mt+VUJyD3c+NRfgUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc1ae88-9d3f-486a-a01e-08db554f2f1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 14:17:58.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuSqNN+Xn+QYtHJC0HszRdmUL1p42svvFxb1O9atbzX8thVtoKgyrRbaG0znWIgRhFLJV9nj+G+dV1osRdVAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101

On 13.05.2023 03:17, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> the tables in the guest. Instead, copy the tables to Dom0.

Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
ignoring that when running on qemu it is kind of a guest itself)?

I also consider the statement too broad anyway: Various people have
run PVH Dom0 without running into such an issue, so it's clearly not
just "leads to".

Jan

