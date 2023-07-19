Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C0759532
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565826.884370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6O5-000457-VT; Wed, 19 Jul 2023 12:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565826.884370; Wed, 19 Jul 2023 12:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6O5-00042l-SU; Wed, 19 Jul 2023 12:34:37 +0000
Received: by outflank-mailman (input) for mailman id 565826;
 Wed, 19 Jul 2023 12:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM6O4-00042f-Ao
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:34:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5b1bc5-2630-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 14:34:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 12:34:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:34:33 +0000
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
X-Inumbo-ID: 9e5b1bc5-2630-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiCu8d3QxuDCo3F8ae2mB6iAD8iEHUUcm80hjFCHW8RqgGKH/9YAdSraAW1CxD+IybJkPlZ/Eho/1pIrfYlauOHv8x/7IPse8wNr8vP4U6e9BWFre+fo6ue+hFY/jyiW0XLsyeR1GwRX9cyDA06pZqmol7i2g8nS7YqsFddHmYZR3qQBWjQici4Cl3wNjS3+GZ96wglpSOlgyTSgbi0ZqJfyoWFWPgrNZriXdEdygX0JCBM0ARO/ndVdGYjqiHpL3omWlJ//cWbCzYIh5kpGNF37Ah8a1PClwo8y0dHegJnjLwlbUUPplEm+uSV8Id4hDGmF6e0kQg7s/Zek8J+ydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GebT5ibwqiK8B0jNzdjNV8syz8KD1POtQzM2wkK0Al0=;
 b=Z94Gw3y5TvF5bKNU1VQnj2+QRRVP48ndwUvndYqUbgA45vrXvEquDHJiY1/XcY5Y7LWIhZd6WqrgiS3F8ise2rSkwk/P0G6Y0DeR8C6jMLN+crkTe9Y4+oUn1/3jg7dzI+8g5xotIEZK7FcqtS0kbVLjJZnIe/JScqxxQ4w7jeQcm5MWQ1YcPaNiE7xB3hNiASUyl25PayvQR8JMJdW1WzbAt5opHjeT3pZ4wlJhgqKOOVnMygZ+qkkHFfd3HYjqcKfPJzNEEhnp7Vj44heaAiWc1QciHPAqKi/I6Pp4HDk86IMHdV2Rxp/TY72Lr4FRGEjCE+kiTU69KsxJcC7vVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GebT5ibwqiK8B0jNzdjNV8syz8KD1POtQzM2wkK0Al0=;
 b=zyOEWTSlcq3ihYXYL9X8rp5WsyN90KyBmIjazGgmAE3gi9t+uKqJSW7r7jsRn/Cs6jzE6zML8fDP4wOXec9VA/NiqFnzNO9XrdNH7HGRKXnYMt15p5KmE+YCrDxPsYJaT5krFgZ2rtTGOYmc9vqSnlJg0AgSGqwQiOtHWpC1aIR7VxQOJIE9zkl3O7mdKQFtIMM7007SFbe53ypYAJD+kR5tvyDe0Su0o9pGNR+bMXwKeJvPg+8f5D+uOPIQtj+ms+0jANRXhIewkayLzmWF4GeZLn5hZAvNXm7DBVMiMslHEIpmKd5oh98viL8T+MqxcwytteYOCTzhudmJxTyNEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb33c444-934c-6db2-dac5-9e17ed0d1b0a@suse.com>
Date: Wed, 19 Jul 2023 14:34:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/hvm: Allow hvm_copy_to_guest_*() to come from const
 sources
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230719122457.4067001-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230719122457.4067001-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: b353f17e-f5f6-49e6-7a91-08db88548164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zyejbF8Avq8oud4IB26khorYC+LoMZCHuiQurB3YT4HVDsbg8Wn9R7sjYEt/EYxJaya+za4H4dJuTE3rwC8q/ttT5tU29dMZJlemRYuhFt1GMRjM9lDbaz5bWg3r2N0kNcjAcpMF02SykAturNAEkP/wbqUxvsl5q/t+ReqNHGl3VYqr0kX9pTrvHzKZSVp86M5w8CLNqRVWj/S3AsV3SeF9IawHuiURnr5nMxdOE5Ec3Ex6m3xxNvVWllP0pevqlXh7OIGKziXqQo7XHGmECRT1wCfDBSw9XstfQLm3U7nyBt/isM1q2sQ7znGUpyRFxzH3f27zQpGf6ycoodbzDpCzzIYMDzgdln9lg0wnywVKE2JIgvRZIQ+eTBxhX6DzAQCSdOo+U50n7pwnQpqoDwQBzTADRpDNnTCg+NZpDIOnIENQ8kjYtQLjdKqooU6HggjszgyFVsUK2AfDgwhuO3Oc5iA7ka9FXYZQmpUe8DuEcn07yVi5vI1ZLZGwg4jno+Qvnw8f0SqATZwGpMC6N7EWSd/X8dHr4/ZzJYg2Zjy0LYknbBAOUoc8V7e2hmELmYNAxLQPwJ2vimyJ/bv/Hh8yOr+f2CtEAh5DX97caCbEpYjJXEOZHG6dZ1bAk49CTSxV7y68QRtn3gj2GNQXUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(31686004)(4326008)(6486002)(54906003)(478600001)(2616005)(83380400001)(86362001)(31696002)(4744005)(2906002)(6506007)(186003)(6512007)(53546011)(26005)(316002)(38100700002)(66476007)(41300700001)(66556008)(66946007)(6916009)(36756003)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJ2L3JxODRONW5wdnZWNHRLTU9sbkNqRi9tSElXSW1WNkZDOEMzd1ExWU8x?=
 =?utf-8?B?NVczTzJWM2ZRR1FxRXBJTW1ocGdRNE1ycUJxdllFdWtqWG1kNnRCSCs1Q21x?=
 =?utf-8?B?bjBTRFVwY3Vrekg2M3UvVGlGNmtoRmt0eGpzenlXSHBXdXp1RSs4MTNhcmFY?=
 =?utf-8?B?VjdnanhieU5uL2gxU0RTT1NiSU5ocGhZdVRXd1RrTCtBR0pqRFJpbE9mckZK?=
 =?utf-8?B?MEpJcG50MTgxYnl3VlRaVkp2Wk1BU1hUdGJ5eHhOM2k4dHNFZkdUd2g1MHUx?=
 =?utf-8?B?OVk4R3JEN251dThoVm1SU3RoejhtMGNDQVQ0MU1BT04xN0lCL291KzhWaDlN?=
 =?utf-8?B?d3hHek1Qa0Mvd0dFb3ZyMEQzUkFBNzhlZUZpbmJvaGlrZ0svdmZqQmxSOEs4?=
 =?utf-8?B?c3E3L0kvVFcyRlJidVBtQmljaExiTkRjWFdlVWlxZFdrdkRQOFVuazFNK2Z2?=
 =?utf-8?B?ZkdxQkRGNmNMYWJCN2FFYWVCRkQza1lvYm4zUHk4MWVCS3lidWtkbkNqY1Av?=
 =?utf-8?B?VjBoSlZiNmlQdVlmait5MFNRcGE1aW1UZ3IwUEVzTWt6S0dJRm9kcDVEVTNP?=
 =?utf-8?B?TDI2VTdWT0JiK3FudlhuNlN3STVjZUtuQTl4V3N4ajQ1bW13UjdNRW02d0wx?=
 =?utf-8?B?TldxWEpubFBqcUhaSWlQYWt5MlNRbHQwanlHeXhPYlB0YTBkanNtOVVQalpR?=
 =?utf-8?B?am1nWXdiclhJcndMdC8weEpSMG9yVFVIaEROVW9LOFdTTytUdW54QVRLbXZv?=
 =?utf-8?B?Q0hkRHN0Y25xZ2Z0SlZHcHIzdTdWeXNmZTdJbWF6L0I5S2ErMWFNeHBJVzJt?=
 =?utf-8?B?cWptUm93TnlCTnJhU3BCWW1XaklIb1RDSTFZNG1USUpBQ2lwSXhGQWJHU1ov?=
 =?utf-8?B?WUdhblpKUmhaOGtLOXNyN3l2dWpUZ0QyNVFMaldNRnIrTFppd0UxK05aS3R1?=
 =?utf-8?B?ZERmYUQyRm1Kancxb2xqU0w0dlNZREVnaXRWQ2tMbUg4TGVyWWVRdjF0YTdl?=
 =?utf-8?B?dTJGSk9OQ21DemhzT0RyMFN3LzI5WUpOR00rRWxWeWxkMnp3eWM1Mnp3QUE0?=
 =?utf-8?B?UnVUajZpbE5HY1IzNTJCMEhaQ2UvWC9BU2ttdEpIYjgwVkIwNUJhTVZPZitq?=
 =?utf-8?B?alN0YjBjYU9tNmhrakRoekRJdzhjb0ExWkFHN08weDcyQ1M4YjZ5Sm1ENTlT?=
 =?utf-8?B?QjBSVjhsY2YwOWk3L1loZnQvYUhLcnZxYjZvUEl1bm0rRERkTVJzTE14ODhG?=
 =?utf-8?B?WXo3dUZuMzd4ZFBGSTZRNW5NVVRPaUlUWm9NSWcwVHduM1JRdmhOdjlGTnBs?=
 =?utf-8?B?YjBJcFFUdXZvR3dXT05WdHdyaEp5WTUwYjREZGtzdE1aNmIyd0tVR0JQKytn?=
 =?utf-8?B?UDltd0Z5L2hLQlZzZURBSHFMQXcrMGtpUHN5eTM2Zmd4dXFhSytscXk4VTFl?=
 =?utf-8?B?N3d4TnBIL2IzelZqUGxYUXNteHFVVWFQaWVMWVhhbjRBTzNDKzFUSy9lT2xa?=
 =?utf-8?B?dUZTN2p5ODQxTUsrd0Zlb09yTXBjbWZGOUcrOXVsWGNpdW5FNG1RSUtqdjVt?=
 =?utf-8?B?V0lueTRrcXhGNVptNG5XRjZ1S0lycVhpdkRRR0NkVHZHRm9zbDE5OGVMTE1F?=
 =?utf-8?B?Sjl6Yko0Tnh1ZmlHblppV3BDRzNyY0NRZCtJZTRYbXFpUjhQYU5Va2ErRWY5?=
 =?utf-8?B?MmRRYWNXeS9LQkdSTkMrZStQSUZwci9LNkkzZkdIQUp2Ty90OVhiVENpSGJI?=
 =?utf-8?B?ajZhL2hOYUhrK1VreXB0VldHNkhWZllXT28reDk1UHZOSTZpdXkvcUFYcWxy?=
 =?utf-8?B?Q015ZldYTGtZZUFuUU0xdCtOOWRXbGlNTXNPaDJhYnRJdDloVm9xaWFKOC9E?=
 =?utf-8?B?NUFrRmlZZ3lIR041eFFPRHJaQ2Rsb3pOZmRqWFU5NlpTeklWUFg2U2wrVy9l?=
 =?utf-8?B?dFJjbC9PQkpaVkUrTnl1UFRpeEtIcWhnR1RvQklrU1pKN2pZTktzakVQZ1Bp?=
 =?utf-8?B?b0pienptWUdWQkh3TzVjbFU2YWRhSXdMOXpOcHNIZldXS09KUlpUTWIyL2Y5?=
 =?utf-8?B?RWFtZlcrUkRSblViWFB6eW5jVHN0dlVBbjRjWVdlZTErRXBZSkcxSXVDRElM?=
 =?utf-8?Q?/uoPgYDDze5QymmVHU8/3JhUY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b353f17e-f5f6-49e6-7a91-08db88548164
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:34:33.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWUWv/7/viozgqV+X7otCKm9H4oOpPVm4qHCmh01F2yyPMeRHa5kVpm9F09ISnb6bSPOiXUmmEf15IVckg2KFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043

On 19.07.2023 14:24, Andrew Cooper wrote:
> The work to fix MISRA rule 7.4 (using mutable pointers to string literals)
> identifies that string literals do indeed get passed into
> hvm_copy_to_guest_linear() by way of the PVH dom0 command line.
> 
> This higlights that the copy_to_* helpers really ought to take a const
> source.  Update the function types to match, and cast away constness in the
> wrappers around __hvm_copy() where HVMCOPY_to_guest is used.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Well, yes, what do you do.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

