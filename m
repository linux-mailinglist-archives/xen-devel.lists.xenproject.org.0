Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6D7A464A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 11:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603869.940981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAoh-0000PH-8v; Mon, 18 Sep 2023 09:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603869.940981; Mon, 18 Sep 2023 09:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAoh-0000Mf-69; Mon, 18 Sep 2023 09:45:19 +0000
Received: by outflank-mailman (input) for mailman id 603869;
 Mon, 18 Sep 2023 09:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiAof-0000MZ-Ny
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 09:45:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 127c5c87-5608-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 11:45:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 09:45:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 09:45:13 +0000
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
X-Inumbo-ID: 127c5c87-5608-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSMFfXw2akWEquJmt4N+obW6BUb7R/98+uWhb5IcS+NnB7EtGqUPQHf0T1YnHzzMpTbSRElZ2QVSPHcU+4yPMvG0I8aZGPIoclJOed1CtNjwQ1VMTv2LCe2Fh3KRDk1s3UBQ3nULBwVejNkGCoy1zqP9KJZLdH2oEslC6emMB9o5oZHH6q7+nVFQzHXaq40rhOxs2CM9jvBnJ195aTOwWYXQiZ6ur1xzzcNwvL79bcWqzzYSKSwYS4pG6yC47UQCFHNvYY6BrMPDKvO3x9O5HeNHng/I4n4coqRXcHs/+w9b9aEPbmIOHiZw0M/3gaTkmmQ7VX0fv8v3O9brcvvyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaChuDRNB3CuTbk24ZYE2XSj6r+x++0IdJ3aj/UQips=;
 b=MeXwN0g6CMpEixi5BBdpf9ixZUvQgKre6oEY5Fa1BBlnNJf4LvrR1KdySQh50OTCslJYgCgGpfT3MFddAjBWIma6L2FY8cSYT373Xvaw5Om4jXV4f9SyuGNWas8cnL6ludeOubvOlVPQR9bm2s2IkLQznmBijofVY/NjPteIx9w4iGSAxLWD8bfVSRCgUc885A8+KMmGOXu0eAQ7PoENKTRr6rmsB0ALdusl2qZSprX1+b8G0J3xk4j6+01oNKzw83Z3B4Sw9h+ZxpvRaLxz1ui0oKCu23UytgBMGDvqgtxUlxSVYav/C/9lGHFEeKCIAzG7zgBgOL3M0vvi+2pUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaChuDRNB3CuTbk24ZYE2XSj6r+x++0IdJ3aj/UQips=;
 b=1ouk9ydKCbYpFSFvAwb1Wg/v/OGJcgCT+GGVTxys+jGUy643SNaowx3qfjcIChOB/leEHcNsi1IXocXu2VdxhCzYFTCDDTBzaipuoFHh8cQ2DAgaostYJdsIbzvtUhO4OWSVK7By68hCpeVacOMOjZRoqbvPd9TbbIzr99TWB5zmhe3ulFQZFaAdlfTYGDbV302/kmLY07tLAWTIhJoE6HhMSCybzPkS/5fNR/WhEiUU0L8QJ6ksLwWtXRMAt+BSCTmpAyfp+BV14CM00gJ6x5cR2kCn0iTX9Lwx9QVpOW2ba3p9xeM7F2HOa8dScPB0sl8yFwM0m/C2rncZLwDTlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79108c60-adbc-2dcb-bbc6-afac26cc10a8@suse.com>
Date: Mon, 18 Sep 2023 11:45:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/5] x86/pv: #DB vs %dr6 fixes, part 2
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <7148ecb7-f1b0-754f-ba1c-f8be18cf6bd9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7148ecb7-f1b0-754f-ba1c-f8be18cf6bd9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6626316a-1197-4f39-d766-08dbb82bf4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pvDk1ij7zQdiVG9ELQfVbjnkMTf+V51AYl8wTCxIxkjlTaR9DbMH9sV9N1XMxb6cqNqEzObYDJvMe3aH8GdxHbLxXWpgrYxQaodRCLeipGWoBaxDWH8GXwlVbrmFFy4ENpRFgOCAcxMJQ95sV6mrIdT0OJ0crzo6b3bDV1i5i/99TIp6yqP1eqD2bafcn+/uxCo/9h53mkP/pqLUimo8c0+iOXtFGpuXv6p+NRo7YCPM7xZRqdR8qRbxP8PnWIp9BlMuqFLZDX7Xsie8oWy5gylRaY6wI9vMbTFK6Ps8VLcpjtoVJUACwxCkt9jvsJyhoLVdPWQr/f5cw3ogX9Ur0yTJyQpneof0uQl2SpkmAj6sniEB2TSgysSrrtXH+Z8zjZrDYbltEOcnyU2ttqkjogO89zKYIXx4ynz8SBic94wiHzQhnXQyAjCdM1cwRlFQ2Bd0znUYk47eCSPiy7RGse2yE8BCZH4DhsJiCk1Idk0h9W6mK26DoRkMRLK+5VrlXodWQxm+novyGdmwft6wpzhBuXU3xpxdF2/rombqZssPXIbI2qaPCMiao+ttsqnDJXfa4emPc4cAG0MthKF1F3766Tndq6frJ3lStHNaqaATx2dCAkfjKwLRB8dYZrfn2CPrT2RjIgby+ip5WwHSbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(6512007)(83380400001)(478600001)(26005)(2616005)(4744005)(2906002)(5660300002)(66556008)(66476007)(54906003)(66946007)(6916009)(8676002)(4326008)(8936002)(316002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHF6cEVEVy9wNk0ydml5TXJiTVYxUXJUQlpSRU1vYUhaMHY2VHJRTm4xUngx?=
 =?utf-8?B?eGtIUC9kN1pYTjRpL2RRY1VzcStuYW5yQ2czRlZDT0JxRHR1aCs1bnIwUXlK?=
 =?utf-8?B?VEplb1ErOGJvNmlacm9tSklMa1FocEFlNkROZmQ1OEc5U0RHYjk5UTVLcnVr?=
 =?utf-8?B?Z1R1bUdKWFhGYkhTVTk0dEJKbnNua0V3QzljbE1zdkZyYUJyV2VYZlIvT0dj?=
 =?utf-8?B?Sjg1azNzZVF2WHd1d3FnQ0MzL0xHaTBYWGF2WDlma2dEcHpzWkhXdUJkVXpP?=
 =?utf-8?B?TWM5cVE5cUp1THlzUDc4Q2xJSDR2V0VVYXFKYjlKMEtiSFoybVFUZS9PckFa?=
 =?utf-8?B?M0dBbkw5bGE3NnJjN0o2NGkyTHVCY2pnOEtSampUeTNBVlJDRWxMNmdheDMr?=
 =?utf-8?B?eWliYWV1NGkyTlVjM3JUTkZOcURsMG5EbGNrR2cwUEFYQ08ya3ZWeEhtMkVN?=
 =?utf-8?B?SWs0WUFmMU1xblVTN2JhOVdMKys5RVp5M0dwbWRrODFyVEZOVy9NbS9vMUhv?=
 =?utf-8?B?V0lMY2ZpNi9KV0U5WktQSEprSlJvSGY1ek5UMmNnR1NqY3QzaVUvS0s1Y3Zq?=
 =?utf-8?B?L0h2QUdiRDJGR04wL090QzMxVnZ4UHFMRXhZbG1QdmRqbXpVaHgvUCtncDdt?=
 =?utf-8?B?RGsyZXRxekorMUkxaFpIQlpPOEx5WEUwemhWRnAxWW5GNWoyYkNyc2ZJZkpw?=
 =?utf-8?B?aWVKNyt0bFY3TnlDa0lyWTBpaEwrZTBRTkdubmdZYTdBQm5oVmNTVDNmNzBS?=
 =?utf-8?B?VXRZN0FQYnlnN3ZYRjJoTXdFaEVGYlRJd0YwVXdKRUJ2K01IbkMxK096eUNK?=
 =?utf-8?B?TWl2eThGZnFCS2VrV05WZGpXbFBVYVlKdE5sdjRjb2pOUTNFUytOUEQwNmtw?=
 =?utf-8?B?cVU0K1JMZnYyMXVTdGlsWkxod3o5dWhIUnVnenlsdnlOS1lwNW5rK285Mnoy?=
 =?utf-8?B?eVpTOUUrd1NkZXQ5L0VDZ08wZG5HbDltK3ZLZTdURjk4WGZQU08vZGpoeENz?=
 =?utf-8?B?N1FVWFJnNjZYN0xUQytSNFJ3K1ljM1BrVzdsRkhrL2w4Q2dGbVVNS2F1OEFx?=
 =?utf-8?B?dzBmVjFLWkFFK2Fhc3JSM0NVT25TY3Rtd0dHbmFFOVNCclVreUtIVnF3UHRx?=
 =?utf-8?B?NHBuTVN2NjhtTUpOYSsxV1hQL21mSVdMRGFhQ29mRTgyWDB2dDZ0c2pKdnNz?=
 =?utf-8?B?cEEvbExOcjA0NnNVdzVGMkRaazg0bEIzY1NabHJpM0lscGJaeThHVFVyWHpU?=
 =?utf-8?B?Y21oRThKMzBJMkJDc1JFRjJFWHBGNUNHWEpqRlF1cWhMKzZJT0JoWFVkLzdB?=
 =?utf-8?B?QVhSSmtiZWd1VDBwam4vNHlZMGVYYkdpZEUvbEVaMEVVYXYwZGJyVWJ2WDQx?=
 =?utf-8?B?TXdadW5RV0t2YW9UZTQwc3RMK1FWY0RJS1R1S0RxTjZDTTBnZDdYZG5wakxr?=
 =?utf-8?B?dGJXSVZudWs2M1lSL0dqUFg1NmhMM0gzVllBeGlzV1hOWmVHNGlqM1phd2RC?=
 =?utf-8?B?Y3Nyb0hjRjE1WjV6ajF5V3lJRERLSU9RVzlQUVFSSjAzUUZMN2lwalR6U2JN?=
 =?utf-8?B?a3c2emR5d3RpSjU0UDZLUFRCTnEzT25RQU5NWnVXVjIyKzdEWDJHN1hGTU5a?=
 =?utf-8?B?QzhodEZuYXZobHpPZDFIOEMrQ2JqU2xxZUhvaE5Hb2MvV2lkYXk5L2cvK0xI?=
 =?utf-8?B?dnhjTld0Y01iWlRyd0U2YjZsWTZSSW95cnBPc1NVaVBjallVUUJQWDdlN25x?=
 =?utf-8?B?ajNDQmpGK3AzTTRVNW1ISlByN1BoZEwwNUxNSVhkbFpiSlliMCt4MTJwcXU5?=
 =?utf-8?B?Z0t6RWQyZlNyb3diTmowSnNJTmFmS1JjTjU3S3dMc0Nsek9vZUJjdFJQenRM?=
 =?utf-8?B?dDNPLzEyTmFYRnZxRmdzZHpCeEwwMEpYNTcwbHhvMG5TRjdVNnlCK0JkL2V6?=
 =?utf-8?B?YW1zUTQrN2RxbHNsL05RRFRPTWIrYmMwWmI0UExOalFEVjU1TEs4aFZtbU15?=
 =?utf-8?B?M1hMUnpUY1RxejB4ak84TWpEV2Q4WWNVbnRLRGs3N0xxVGk3WnhrU1VXTlor?=
 =?utf-8?B?ay9jMC9NcFRiTERFYnY1ZkRCK0t6eVZzY3I5Nms3d0Faa1QxejNEa2JVYlFG?=
 =?utf-8?Q?i47HZwrygnoeMVoPKnARqxiyF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6626316a-1197-4f39-d766-08dbb82bf4ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 09:45:13.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sR6IFfgfz3D78J3igc+2cYxupopvF8gQcQP9Wo3FxECzmQwAakFmUpp16RHAGRi1ywDY2bKTmOiWZGoeQEP7uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6849

On 15.09.2023 21:56, Andrew Cooper wrote:
> A third which I'm on the fence about is about PV guests and General
> Detect.  We firmly prohibit PV guests from setting DR7.GD, but we them
> play with the DR6.GD bit as if it had been asserted.
> 
> It would be easy to put GD back into the set of reserved bits for DR6,
> but it also wouldn't be hard to handle GD via dr7_emul and let the PV
> guest have a more-normal looking set of debug functionality.

Anything "more-normal looking" is to be preferred, I would say. As long
as, like you say here, it isn't overly hard.

Jan


