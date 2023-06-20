Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644D736BEA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551766.861463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaS5-0000bE-BM; Tue, 20 Jun 2023 12:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551766.861463; Tue, 20 Jun 2023 12:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaS5-0000ZY-8U; Tue, 20 Jun 2023 12:27:17 +0000
Received: by outflank-mailman (input) for mailman id 551766;
 Tue, 20 Jun 2023 12:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBaS3-0000QR-7Y
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:27:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8c07cb6-0f65-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:27:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 12:26:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:26:40 +0000
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
X-Inumbo-ID: c8c07cb6-0f65-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkfMvKEjj48RBwfmS0pRRHFonSyRuvmxaaIYTM0b06ez2s+bNVmBC0Hj4NVrE4CrkarNoP/D6HiBrwGHu5cJrk0NrZWdWFJCvGWrN1hnJdrXObx6qEnfR4X2skY/pDD48T+GohuneKm/RqR79frqOCweG8f3muHlJO2IO/zbSZyNdQ1cFtzH4S4FCP+IejKYYnKXR6BK0AQli+tcj30CTksL6d1dac10hrYM8+SnjXWxcGZ48jxSN1D0HcyYoSt9GE9zo3ddprkT2B3SSVkKzFD9/CwUmb5r9N6Mrb4LDvKLPBkqK0S7w7tpEhxJyQskbosab6789SIQoaKGJIgWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4sjQLRBClxiXNGEnkIMqHlg0Kr3Ya7D3lQGaZuocMY=;
 b=ZVvGPLsoL5uuDUXh7F2PZDGBAk7Fkog5P8V3htPDaXusa7tH4D0G/lWXVlZy+xshiBszoTfYZgh3L9bfo2z1DehZJ5csC9DOIkfFXcrTKuSBrJWyIs3JSYDOD22wSOkfgamFn3LgqITyp0MnmqhYXtjFxjvFHDxOxvYaN2N/ZQbRDwOopW/bPjtvKUGzID2JqEG9VQ4NCg+EAdqqD0i/jj0qiTFMmFSzdZ43+eYI5ot4WS8J/UiWo7lDlRYgASh0mGp5/L7dYkCEZC15s8Z3jATlwu569porKjsh9COEtn3rDNzdG7iOPGGx2J8TruZKr789VEyRDYyphaYOwomZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4sjQLRBClxiXNGEnkIMqHlg0Kr3Ya7D3lQGaZuocMY=;
 b=mk9s1m+hfpNdmf4fX4ohsjpfkgKPeVOQrmb1Grux+b8/3aZ0I+g2SM4Yd46pYjwUKfo7p7p3bQ0uDRwRtJfDfO6QDbPLmO5l9/WrvGuhULkyPOEbFUkOvAz3ajN878ADzUIdswQ4/xEuC320/EYqHjdGKrpBxjCvu75NW4L62R86FeS+aNgan+ocDK3EVVj5Dcc+E2FYPl9l0bt8nS5eVeWTk8MWxfcAjBnHz3e7RvVhNDnNBzbp1TDQFgNTbdXXJchPKZChtOlxc6WPPIAK3APXJ0vRQjpkeGhOJaCJ4ZF1Nwnr+QpZZRLBmP51pUPja77NBfES6+SjFJZXKeJmLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c21f0bdd-ca78-d18d-2084-78eb094fc41e@suse.com>
Date: Tue, 20 Jun 2023 14:26:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 01/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <5aa3a54af456b8faee681a1d737c361abe89296f.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5aa3a54af456b8faee681a1d737c361abe89296f.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 2859c6eb-e8f0-4baf-1c29-08db71899969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WxQkk/ET7jYzQkh2W0CgJVSmuA9yXe9oGTRJMU+RdpTMpA591b9bgfaKnv3e3CcyLF7L7PbOMDJssFS4g8COpgAGizeOoIQ1y9xLCPc1cAdz2aRkubKEk9CsvIBWHwIHIJ3D5/jmmEXczNCFts8WhxWGt6kRcqXQScCazNRLCtOBYq17XEP3QBRDOw4qxxyxiuOpIyIjEujeYu6PvbALeX3sj9sre3FrO49PlquOIa+2FytFLJ5BaVRv5OY/E3ALzf4cBxesPFDV8Mz8A3WEi3UzZuS6n3DPpdFgG+MsPkej2Cou/w+UClfDvmDybvUGH3Yt9md8hy2oYeKuTn6c5NpelaDspFWrzXIkY6bvZ86BQ6pY3LV/jNK+Rbd3XCBP2NvX65xdWpvbyTcb5ESRk/G6Q0vffnBEJrXIPiZiM3THuiHtQtNnsNDBTXmvxFG4D04aaJ546vC6EiSHAYkNWcWfjI+TPWHzSckGzWJ+0qgZFcO2/KFiOopAl384xtZJIaqQpd+6wbnLwE3iUlMzE8z2NQn8w6nDKOynPQEu1DqWyb62E8bqeUn5vW3/DIbG3gsBtXnTKxk4KtYfBz4K6xHTsg/1ps5NZJ5wYessVxYDqTDc2ZQhFk0Mg3BrplOutmU/Vo52/NJP4JwJ8mY7yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(7416002)(31686004)(2906002)(41300700001)(316002)(5660300002)(8936002)(8676002)(66899021)(4326008)(6916009)(66556008)(66946007)(36756003)(478600001)(54906003)(6486002)(31696002)(38100700002)(53546011)(86362001)(66476007)(2616005)(26005)(186003)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNndWVKZ0piRW9HVWZiellDQm56VW9KSnNBSStkR1EwcStBQUtJVlJtc1pz?=
 =?utf-8?B?K2t1V24wZU1mdlRpWCsvc2ZtU0NOM1hZM3RvZzN3ODlneld5NUZUYjg0bTZY?=
 =?utf-8?B?R1pZSHhuMm9tQnRtdHN1MVc2ZDVlb1U5dW1JZmF2Y2xEdVEvblZ3VXN4RE1V?=
 =?utf-8?B?a0N1TU0yZVkyQWo0QkRIM0RMNWJLbU5JK052bm5laUNQY0gwNllKRnJsY2d2?=
 =?utf-8?B?SC9iZUUySTJHcVVuYUloTkEySE41WlVaMEsrL2VYRGlHMGlLcmIwSnQxTUxU?=
 =?utf-8?B?QjJXVVJxdGFtRnpOK1BwVU5EcmkxVDlRb2tyUEZQdi85K1Rua2hnbUJxZ3dH?=
 =?utf-8?B?RmJsZUJmOG9uKzdVMHdlNTZQRVlIUUlOSWhkTTJtTUsxT1RiZUFBU24wN2RO?=
 =?utf-8?B?RXZUYkttM0s5MUxlTmVpdzhIaWMvMThHRWIyRVJhWjlYemZ1SGw1M0J0N2dy?=
 =?utf-8?B?eFN4SVFJY29hQU5ENWcwQk9RUkgrUkVCTGN0alkyTnhWcHROekJLK0ZxOWs2?=
 =?utf-8?B?ZnprUGxOUm5UYzFKNThvYTh3aDFNVVdlTXFQbWxseXM3Yk9wTk1raElabVdX?=
 =?utf-8?B?QWRxenpxVmp4V2RXKzdTL0tjSmN0Ykh3bzZLKy9uRTUySCtXV2F6ZURPU1pT?=
 =?utf-8?B?aEF6SzNKVHBJYVhlOE00alkyTWMvRDBhd0tWWjZrektOSjcrUnY0VlllSFN6?=
 =?utf-8?B?T2txa28rOEMxQThteC9taG5kRUhBL3V3NGFQeHRNMUxUc05YMGFHa0kreWJo?=
 =?utf-8?B?em1OMVVFRlV0YnNzWnEySHFnY29BSmw0cTFFazYveUJLY0hReXVlS0p3Y2tL?=
 =?utf-8?B?VnlIY25hK1ErWm5Pa3F6T0lhd3VGbWhWZFRzNFZHNVcycjhBOFAzWUp6RCtC?=
 =?utf-8?B?aXdZWVpNdXNCWHJ1MVI0VHdmak1oL1hsSkI4UW01SHIwMkdOdVg4VlhUOGZC?=
 =?utf-8?B?amNHcFphWCtVYWdKYmFQbWxlZmQ1alB2VmZUVUd3cDNGNVByZUlRVUpxb3Zm?=
 =?utf-8?B?aEVrcXVkNFhPV25lUnBuWjV3MDR5RUUxY0RjbG82aHlZTzlFbTNtdzBWTURs?=
 =?utf-8?B?OEY3RjdNUHMzTmhFT3pNbDBGU1ZNOGNGRU5uejdqRnlBRXNodFpDSkZuTDBm?=
 =?utf-8?B?VEVrTW82MGpEVUptR1h6NWxWejg4UEd3WXBpQTFIellvYkFpOGdvWC80RXZF?=
 =?utf-8?B?YkU3SjVUZ3IvVC9lUnZZbDFOaUZ5c1pHQjJrSnN1clpWZVJZQTNLWTIzTHdu?=
 =?utf-8?B?d1UxUWM2Q0tLUFA4OXhWKzZna3VRSmVONHVmbVIvYWI4V092OVVJdVpncHNi?=
 =?utf-8?B?Njh2ZFh0dlUybmxBSzlFVDdUVlBlM29zQkFSYXBlc1l0MXExby8wTVY2T2hp?=
 =?utf-8?B?N1Z6WkQyV2R4N2FTRU9CbFdpK3RWT1Z5WExoNlUraWMxYU9va25Ma2hXNzQ5?=
 =?utf-8?B?eDFyVTI5STY4R3JoQjFBN0ZnYk5xdlNNT2c2VkQzRHNmYlNDNzdRVHhJM3Br?=
 =?utf-8?B?dzBDdjZOZ1NyZkVwYzkzdVp4bzNpMmc3Ui9saXNvNzdtWVRGSUN3WjNjclJi?=
 =?utf-8?B?V2Q0eDVOU1p4QlVHekdQak5yMUhzN09sNmpDaWhVZTg1N21NaFdma2l1bSsr?=
 =?utf-8?B?OXFWckhLWmhVTVdJeGl1a1puWDB4QmRsUkdhRjZqczBtWjI5Q2kxL2NsSCsy?=
 =?utf-8?B?Szk2eVNRcWdSczE5MVZpS2FBZGlYL09JM1hSWXhSTDVYQ1ZIREVUU3NKYWND?=
 =?utf-8?B?NXBXb2lhcUZpaGVlQWNtbmlMYk4vNFYzUk9IMy9hQlFldVVvWEo1bGJmY3px?=
 =?utf-8?B?MUJPZTV5ZlZhSmVuTURGV1R5Y1JhUDBPSTQ0NHY0WHF4MjBXWUNXazJYSGFO?=
 =?utf-8?B?bmRHVGtmVkFXVzY5dkg4SFJ4aGxJeCtXNDY4S1gvUkhtYnMvQU1GSFNhVWww?=
 =?utf-8?B?QnZBWUNBTUtUMjh6ZE5URzRqOVFmbGNVc0dHUFFBZmRRMXZsaTNkKytFckxE?=
 =?utf-8?B?Sy9hTG1qUWFCNEw2b2h6M2M4dlBsZUk2TGdrc2ZWNndTc3lZY21JcGQ5RlFl?=
 =?utf-8?B?dGJhTXVDZHVMNWM1K1huMTZkaDZWN2hwaFJBSkZSdkxmQWdXY2lLVFF3UGda?=
 =?utf-8?Q?IXtL7+gBi/Dy9p7v7viQzCkwy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2859c6eb-e8f0-4baf-1c29-08db71899969
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:26:40.8584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQfE2CePPnm5uH7DDXGFH0Go0Z9fmbP4bUGfDWFiW3w3LGcM/DHuwirvCgkhd5ecA21kRVhCqD54CfAt8TrBPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On 20.06.2023 12:34, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.

The code adjustments here are certainly fine, but I'd like to ask that
patch descriptions be written as such. "I propose ..." in particular
may be okay in an upfront discussion, but for a patch you want to
describe what the patch does, and why (the latter part you're dealing
with already).

Furthermore I continue to have trouble with the wording "is represented
in an unsigned type": As previously pointed out, what type a constant
is going to be represented in depends on the ABI and eventual variables
(specifically their types) that the value might then be assigned to, or
expressions that the value might be used in. A possible future
architecture with "int" wider than 32 bits would represent all the
constants touched here in a signed type. I think what is meant instead
(despite Misra's imo unhelpful wording) is that you add suffixes for
constants which are meant to have unsigned values (no matter what type
variable they would be stored in, or what expression they would appear
in, and hence independent of their eventual representation).

Furthermore the U suffix (as an example) doesn't help at all when the
value then is assigned to a variable of type long, and long is wider
than int. The value would then _still_ be represented in a signed type.

Taken together, how about 'Use "U" as a suffix to explicitly state when
an integer constant is intended to be an unsigned one'?

I expect both remarks will apply throughout the series, so I'm not
going to repeat them for later patches.

Jan

