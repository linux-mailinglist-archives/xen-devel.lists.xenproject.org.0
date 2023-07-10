Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D074D4F7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 14:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561201.877588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpiN-0001kE-Uo; Mon, 10 Jul 2023 12:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561201.877588; Mon, 10 Jul 2023 12:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpiN-0001gX-R1; Mon, 10 Jul 2023 12:10:03 +0000
Received: by outflank-mailman (input) for mailman id 561201;
 Mon, 10 Jul 2023 12:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIpiN-0001Wc-3A
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 12:10:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2532c2e-1f1a-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 14:10:02 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 12:09:57 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 12:09:57 +0000
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
X-Inumbo-ID: b2532c2e-1f1a-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiaJQFZqpc3T7T6/kKZHyBPqP0C5A3poo1hoh2aKehk9TNx8O3avfynaKuYlr+kSokfOs/RKA+Z+rT7osnAPqOSOpXZWPbH3Pb5YpURSuG68aCZv18XPlKwmFqDM7suUqUwnJty+7ciLmB/c5f70MVzt4CPAD1s/0zvRkB2hdQ9E3c8hgyaeu57M8SRaHcnxh5RzNG9Wh3B4mD5u+wArZHYxjasKBa831hgLbvDLxz+JYbzVlj1qMp3bXrl8ADzX4mJ07vrgEV7HHTRsa7wXAtLYQftBiy3azhCjqXRMECvfUbgc3j7O0iFyqcYrlgQ78sxlLJTjoYdN2SkY5uZ5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF3cSdk6rYS+BzEnzl8gS/3nPiFhCHZ6zpoXcZV0KUc=;
 b=XIvmSYR1t7a4TfvLVVJlLsGJIAjMXZPBesxXPh+K4xXPZWFhqKBYAXCZYHjSzH3ksu7l4QWfn1N4PGHkhYIbyArg/Z/dCM+8yNOfpKxomybuPaaeGraZER+cd0sDRX6HFQnHyIHhWejf/8nIRpvZ+R9JzPtMvUgRsu5O8OHSQSBxM8JlI3zmPmZjJaOUV8/L8oalF94DXNVCYFUOjYvA0TBCB8GeKDjjn9R9+aX1SrmH08B/Zs8hUUDdh5HRrqtcODhmuWRkGYx9uM/4rN68U8NxGJ7RLiWIumCq7ZOhfQOdbZTRjjUQvrlyyszlcYG0Lo9BtYr1DlwWX+JfjPQ2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF3cSdk6rYS+BzEnzl8gS/3nPiFhCHZ6zpoXcZV0KUc=;
 b=eDUZiBtlMcNDWtlWrg3vo0dPOm6kVAeua5+BijmLyB6sAQUGPcvyPlV1o4X1QoOLyDSHhwMl0VLjzi5h/pEzFubgTmYDy/RzWQ7TeX9Tg/58eof77JUZj7fRngtJxMyiiSR0jyK9rTft+KDhUbltVpTFJfAu0gsYQWxSKJJ96k6k/Ogu1tfNyquhg3BARfgh3xs079MvDS+qH8jMMnOFTpIYjvtmROBiGLsLKAXhWQTEJI1z25D5Sx8l0f0v+9UNep50P64bWYABntpWfRaoAOXIei1s/E55+CQlkjd1IijmNZQJ+cG6K8vROBO+R4NUuWGgCJBO30NUHwr/LXDoNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <898f7edd-0134-c147-57ee-f01cca105bcd@suse.com>
Date: Mon, 10 Jul 2023 14:09:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-6-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-6-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a12e4f3-7a2e-4c10-cde4-08db813e93ef
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kk9KMY1+pXPxuhc0KY4tpvI8xzVvf2ppouRrttGL4jbdTCgzjhdmppXfKAdzd1WO/8Qv31zPJxFRCrTuvWgorPKmovIjJzvgYlE6KwVj4AwTF5W3GoI/uXukGLVR+sOHqjhzQqcWhT2REIjZDJYTzKeygbFuw/4Pl7//pjnjI7vFoehfkFo96mOVOo68+VNpIYblbWtJQ5s/IT+LTLDynarLVxT4FXUmTv4jrTCaxYhP1lc0Yh0XIan9bXXwp0Efae2KYKWhW8vLWOKmbePbZGCto5EeN5BWolabsULsn2ks1hdnvnLsvBFGhbvufQK2HN62yAI8pnQwANfGlY8VzubtFy7OX8cKYjaUBhvcA2W7nt82qNjZaaMcT9bichbpMw/qarmSRHptK/F7D3l6rkeNdi8BJg4dPoSCcZeSnu90NZkW8zll7QM9e+jyAkLUycOtS9apS8Efj/VxzOy1DztpZIVaKFRDj+UaerZG+EVZ5sTwAgpzHKIHPoX7w0lSTyCGqj3c4nEhCd4RJL0YsmPWPebSUpta9Mk34vjxclmB45HT8EzrNVazUj8menrZr3UEAKP4Rne/C1apiLMLVWhvklz/zUbAxheox06lp6iWt6DYw7wnrAKZuh5Tzvi+sKe89Qpq61tHFydtqMGMVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(54906003)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(4326008)(6916009)(4744005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTNkQWRScENsTUJiOEtiaDNRVnNOSmFteEhzTnJjZHJLUE5JQzdKT3BKcUFQ?=
 =?utf-8?B?Wmk5UWg5YVEyQ3pQS2l2WVc1RUl0Mk9rTGJLMTR3MXQxUC8rMStRbVUyQkpL?=
 =?utf-8?B?Tkp0dUh5b3FFZG9MVGRWeEdyYWtoQTVjcmNZMTA5T3pWRU02akgyMThlTWZJ?=
 =?utf-8?B?bnYwRUc5Y0dIMStzUWNUQTdid1MyR1NCR3V5UzFxWk1rT25yRHkrNU5HSGZL?=
 =?utf-8?B?QTFyUVFyZTIxYlNUcFRVTE83ajRQRWs4YjBWbmNNMS9sUGIySjBLcEhGdFhs?=
 =?utf-8?B?MTlsa0ZPVTEwRzRnWWJ2ZTFwLzArN0NtK2hPTFdYWU1kaFZidmNXSDZLTmho?=
 =?utf-8?B?M0tSaDRkY09LUWJqek5IUENTYXVXVVZoN2NKZWlMNndWZ2dhZFozOWkwNHVF?=
 =?utf-8?B?MU9nMC9aalQrTktCV2RZbUs2VGprRkxPbWxFNitISGM2TW45TmhXcnlIUzBl?=
 =?utf-8?B?YnFybEZ0OTFHVXJVVDkyUHlIRlBQVUxURFUxSEhuSzZOZldhNmhZQWlsenFl?=
 =?utf-8?B?TUZZdWhKZVdDUWpOT3NMQ2lPRmFwVkxzZHZuSHp3WXpGSXkrc2hiNDdiQzFB?=
 =?utf-8?B?OStFcHA5OVV5d0xIRGk5bTZZMnFrOTdPbzJrTWZpbmhDaWdQT1dJRThrbEhw?=
 =?utf-8?B?aE9pTGpWTFBveWd0aFZXZEVteGxNYWhWa3hxR0w2bkR3N002Y3J5UlNDdFdz?=
 =?utf-8?B?eVZCMnpDdXBmdkdQcG8xVjhlMzZCU1YzSk1GbCtnQ1IvZ1h2K3V1RGtCZXhH?=
 =?utf-8?B?SWF0ZXNCdEpxa0dHbnBtT2FRS0RMYkViVkJOVjA5T1BHSFJCQ1FENStkWk5m?=
 =?utf-8?B?eXo1eXk4YVVMaFRHRlluem1sbEhLZUxoaTRlRlhpcjRWS3dzR1czUmpmWmZF?=
 =?utf-8?B?aXlPZXJHQkxwWExsZ3ViLytGc3hjRHU4Y2lDeS9ubWIrZ1I1czBueXRaanA3?=
 =?utf-8?B?Vnl1VkpzT0ZqTHREVTBscEZzalRIaTNHbmxxcWlkdlpHRzVWYUVwSmFtRUUx?=
 =?utf-8?B?QjVjQ0hvdVlrSmRlVkg1OWcyT0xzWkxwOU5GZ0ZaczhqM2ZhOFBjVDFUUHJT?=
 =?utf-8?B?Tm9OM3IybzZLb0RrZkxkeEVqVW1rQlBrbUh6VWVPZkNoU3RJc0R6RVRLa1ov?=
 =?utf-8?B?cENuRmQ4eWFVRUdPd2RwV2tSRnJRbzlzVk9DUWxvZG9wNkVCUnY1M0lkc1Fz?=
 =?utf-8?B?OUlKL0tTbUtqRlQ1aW9vRFhEVFR2Q1oydEJwZGNQMG1BTFhUb0NnOG40RU5C?=
 =?utf-8?B?VkQvZUVxRWRVN2ljdm1BOGJGUFprN1ZuQmMvM2MwVE55b0hHYjlpK2I3TkNC?=
 =?utf-8?B?VXg1KzhCK1ZzOHMydGNHUC85VW1yR0hZK1c2SlVqOEM4MHpjSjZSZ2RPY3Mv?=
 =?utf-8?B?bERqc1pFVW4rODFwNmEwSkUyZHFyVTNzekpGMDA2bWgrSWdYTUV5MktxL0d2?=
 =?utf-8?B?NkdvOXBxbWNSUmZpTDEvUGZ6SUNFeTVzcWxhRThGYlEyckxCNllZM29EYXVr?=
 =?utf-8?B?OWlJdHFvK0NHY2tEdk1KSWh0YmJ1RldCSnM1bDkzUHc0eVFvb0RhcnNPc0x4?=
 =?utf-8?B?ekE0aEZvZ3FibTBxMnRXTTMzSXNnaUZCTE9PZkpEY21pbWhHMjNHUnF1RC8w?=
 =?utf-8?B?U1NoRU83Y3FJZmNYTVNwdmtMcTBoU2kySXYwSDRabUNPbW1Dd2U5b0hDaDBF?=
 =?utf-8?B?ZjA3cHZTYlp1ek5WaFJ2Y05Xb21nVWdNM08zZHIwaUhCWUlVL3NsYjdBaHlB?=
 =?utf-8?B?OFFxTk8rVE1MbXdET2M1KzBvamlvNkl5SVNlOU1TVEhvVDZRWCtZVEtjKytK?=
 =?utf-8?B?a3pUSUF4Um9XTHVNY2xKaTYyTytweG5qUFVPeWdqREFvNnUvaW5Ea1pwUjhD?=
 =?utf-8?B?K1VmMHR0VlNuZUk5N09xR3Z3Yk5tWm5BVERYcWpxVC9ZWThZMytGR0ZNSUZC?=
 =?utf-8?B?cVdyZGFiSlBwKzBTMFI0QUxXUFZ3cEF5QjhCM1JYNWlVVjcrb0lFNEkvUnJY?=
 =?utf-8?B?c0t3dmRXanA5UWdkeGZvR2EwbzJneGpxK25vdTUrcnkyb1ZyMVA5ejZWT0l2?=
 =?utf-8?B?MHY4V0Rva1lFUkVRSERyUmdFWjlzajlORDl1a1d6enVwWjZPZUVCUnBsaGgy?=
 =?utf-8?Q?DIwfuaOxUuJ0LP57zeq21fzpQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a12e4f3-7a2e-4c10-cde4-08db813e93ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 12:09:57.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk8D63HOeaVyYEWiPReV3n1KplQbNmeFNXKayz49820iOQ4uGLYe76+O9tPUdQzFsAgrRp4ocUvHfPU+ABtCvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

On 06.07.2023 20:54, Jason Andryuk wrote:
> Rearrange code now that xen_sysctl_pm_op's get_para fields has the
> nested union and struct.  In particular, the scaling governor
> information like scaling_available_governors is inside the union, so it
> is not always available.  Move those fields (op->u.get_para.u.s.u.*)
> together as well as the common fields (ones outside the union like
> op->u.get_para.turbo_enabled).
> 
> With that, gov_num may be 0, so bounce buffer handling needs
> to be modified.
> 
> scaling_governor and other fields inside op->u.get_para.u.s.u.* won't be
> used for hwp, so this will simplify the change when hwp support is
> introduced and re-indents these lines all together.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



