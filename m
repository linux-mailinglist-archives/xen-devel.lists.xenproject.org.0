Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B696716734
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541249.843803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41Oj-000544-3e; Tue, 30 May 2023 15:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541249.843803; Tue, 30 May 2023 15:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41Oj-00051x-0r; Tue, 30 May 2023 15:36:33 +0000
Received: by outflank-mailman (input) for mailman id 541249;
 Tue, 30 May 2023 15:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41Oh-00051p-FB
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:36:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfaa6603-feff-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 17:36:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:36:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:36:28 +0000
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
X-Inumbo-ID: bfaa6603-feff-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwufSNZrlSvlqhz8cqKXbDJyJNwWfZM6MTKdE4WZUHzqY032FdZ0eBAbJ743xeGFUNcHKtjV16Dq+wzGNRgN6OksO5g1pQvHDi28NOJFV6f+2O0HZimLaadrEI1krfEmlh5oxEA/YYPkhcChVaBWEYqbtSMF9AIiXO3uZ5TdM2V6f8SrDk9jbJkb9BF5CGTW1+tfipJlSKZC5yJgYn0sfJF2WneXfdB2/Mwg7EpbRr3jvIq1n92AVQ3LP92+A8c3Yqu4vuAfovS8TS8HIQs+Kopa8K1JHFBeRHItg8Eqwj5lKBiZfcH06AZHu90/4P6P94LMZgs3YStjs3G6CxpD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf6lMWMVW0XtD0ikh/Nwr1PebsDt2c9oPxVIxipWDL4=;
 b=ADwUImExFfP2+i8pcXU3nvX2OBf1vMmWxmhfKvtS4XNqIyC+5sVIB2Q6G/XtTGb8bqelQIFWCXn2EU6ZT4HiIbFTFiXNG1VtQ78WPoL4TaGZlRrqvsOeok63almuUeHxj3P2pwtQwUQbbZ+FHDodjfLXTdG335jJ01tatZQ6zQZ5LUQEwXtxfonneAp9uuogH2GtQBVPBcF5Q1/9F+ON6JB+TK6q/Q2aXHrV9hlKKWLXQRsL9PzR8/Velu30PH2YbXKy1VOMRRwOBejfwpsPfbMr4I++eF9lOZvd/QYFBG4XrJhanizrVyRSkDMTTn8f++wW5h5Zr6ouvxiKUB5HpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf6lMWMVW0XtD0ikh/Nwr1PebsDt2c9oPxVIxipWDL4=;
 b=Z0yMlx39rD7+u4zV5Hb0e2gKTRBzZRy8YlLZSD9PtrlFtcd4JS1JgUtr992BMJuAYM2rZ1ljicUot4xlpd0mnqrJ+R5qm0D06y3GkoDzIjGWAKJF5uUs5WTSCTrotScn81WYhOuGYzadGhivNuVFwcCJR40gXLNRdidthUvmRTLD6VwslLnFqvYSbZiFpTglXbHuj2sSqOg9Ro7ge5c2VU8s3U84giR1SrQQL1JX+6HdHqrrfdSYdhhf8vijU8iRIR4DEn1CYLMBZIxPw8555yg/NAZr5ka1FjjV6Wo4TWF5tRrsjquJF8XjqEC5j1dae0zGWXpj+MNgCWavnBjWYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d35664b5-a5fb-672f-e240-21fc1b5d83e9@suse.com>
Date: Tue, 30 May 2023 17:36:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/spec-ctrl: Update hardware hints
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230530153452.1123823-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230530153452.1123823-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: e499fd43-3f7f-4328-a624-08db6123a2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YcRbaGYUojF3N916BXhbYn3IL5revkIl1RzF1jBv+U2M6RKsUKgudJzbJ1TmhYkgxQ7cZDiXtmr8IWe2+vRxSiiBwFZIEKQE1WYbTzc+6dfVwUPPN/596k02OYJFPmkn7gFI7ziSP2P37Lfh6ONPFvCLc7khMDw3sNt0wP0h4u5LZIy/XDcvjYaJfgn5fYzRBDztQhQdbC9/xzGZOrd3ClNGO4OAkoXzUNWfBdikH+1nWn8DMIhwmtPbE35WjK5JZFJKWdTaAjY1BYFDFfrUueMOhvmALsdbvfwJZFzupcQh0zBbGpllnhXOf925DsLwQ4HbGyFT8R0wy4XY0p99J/riX/QohBh6jyHnffAQDudKktfQTGd2JVKqxZIKwZJkEtaEU+fcz7Um/pxs/3P+XK3wk7dc+GjhCvzYq8fAMusg3Y2TiQpPebPb97P+A5hFUTKIrRyjlfxhof59eOb0Ad5xx+jbVRsbvKqCjOGNnov4FBuhIqn+V2xN3xkBGDwjFRBDnQc1fUU6/mhE7ISyo4XcpafWMOzkJHih3rO3oJC6K/nqjbGA/b5K8f7Q9wQeWP6Nk5pPICV5avFK6Y0/UetgqLkw4+uOGtKh+jpO9X3RtlDxstV0spEb+ydEVZBbUZbXUGLYLDfFzNk4FS7uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(478600001)(54906003)(8676002)(8936002)(5660300002)(36756003)(2906002)(31696002)(86362001)(4744005)(66476007)(4326008)(6916009)(66556008)(66946007)(316002)(38100700002)(41300700001)(2616005)(186003)(26005)(6506007)(53546011)(6512007)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2xTOVFOZlR6QW94SWx4SEgzVFp3amFGbEFOU3VIVXg5NFlMbnNXZFNSMXY3?=
 =?utf-8?B?Mk9PY1ZNMHN3VTZwQjRJSDIrQmdKRElwbVRoME1idjZjZ0tPYmFVNFpKR29C?=
 =?utf-8?B?c3A3WHY1Ry9QM2lzUzdzUDQrcmp6MWM4VkhFdzlUMytweEdPQjMwbWZWd2ha?=
 =?utf-8?B?N0h3TFRYMkJOTDBEMkxOSkFiRUJmZnJjUHNpaHJ6bDRBYUQzdmMzUFFiekNB?=
 =?utf-8?B?NWdDeUpUYUQxeWpldDFDV1ZNd2d1RjYxbURWQWtRNlVlRVg4YzJwZmZoWTBE?=
 =?utf-8?B?cU5MS3YyWjFhMWxYcTQ1Vnk4bU5GazdSd1pNZUZXcTBJUU1YU0t2NUdaVXVE?=
 =?utf-8?B?WndGanAwWndDUW1RTEZDa3I3RnExYUtaa2hVV29jOGgvN1d1ejFLd0tjZXdB?=
 =?utf-8?B?MldmWlB0djQrc1o4V3Y0bkwzN0RTaytyamtkZU1hajFKcnRDVjNVZFNwdG9P?=
 =?utf-8?B?cWVSUTVvdjFXdVlXTEx5U1hidlpQRDFOZkFyUUprczJvTEVGaHNQeVNES2xu?=
 =?utf-8?B?aUJuNU1FWkszZEJpZFBvWENobWFPT3R3RU00Y0RWT1h2dy9aNm1DamRUNVR5?=
 =?utf-8?B?dTgxbVBaaXQ4NkV6cHZzN1BucFB4ck8rbnhqdTFHek5sS29lMkVRYk1DVDdO?=
 =?utf-8?B?dzhaUkVXRk80VjE2UnFyNC84WENwanRxaWhqM2IrckN0bmxjVEYzZ3grWm4r?=
 =?utf-8?B?bngvOWg5aUorWHFLNjArS0VtdElPUjY1V0RZL3JqcjQ0L0Vla01aVGJQR1Fl?=
 =?utf-8?B?NnN6Z0tZMnYvZS9ZeWlQVjk2NG9tRXhZMTU1RVpsTWN3TW9NRHllRTNwTk1r?=
 =?utf-8?B?c1oyYzhvV09ZYkY2U0w4blIwcDlZczQ2OTl3dHVyWDRINnlER2dGREUwT3Np?=
 =?utf-8?B?SHRwazZWaWJLUFNDZTRPcGNJWkErc2phdWt3OXFCazJDRThyeGVhVm9kTENF?=
 =?utf-8?B?WWE4UXNnZi9ZeWxraVowemNZUklYU2NBaGZqSFVXMVoxbjlFS0srVmlZbkhw?=
 =?utf-8?B?OGhNOTdkS2xBYzlxRWZPWmlqMDRMOFJ0eThQOUlMbUVPZW1hWFdIQXQzNkVp?=
 =?utf-8?B?eVl5U3p6djdOdlFtSzlhVjdQQ2l3THVwSGtyR0hxazhtY3J4Z3VuaEpwelJQ?=
 =?utf-8?B?ejEvVVRQQTduVmZmYi92MmgxMWU4ZTRiU1ViZnY5QjdwL1VHL0JnSVNnUlBR?=
 =?utf-8?B?T0tpWElYR1p1MlRTUHFMUWZ3TDFNTVU5ZmJOemxuZ3BNNC8rLzRtUm5KcUhI?=
 =?utf-8?B?Y2FDQVRuYjdxMUp0emhibWZScWlkOU50NHB4bUlYOURVTGZuOGxMZDVWV2dQ?=
 =?utf-8?B?eU5KYXNFTDV5OGpOMHNPS1gwbUsvOWxsMDR2WklxVnpqSzBQRmtyYkdEaWVW?=
 =?utf-8?B?bS9mOHIrQkQvb0R0TE1hNUJKQWRrN0s1ZWkzUTdEelowZGRJUWJQTmwxUThZ?=
 =?utf-8?B?T3VMQ0ZuOXZXY1B3YUdLRGp4V3lZVHBxa0tHV2J2eGFXMXgxRmJnb3ZIWjBH?=
 =?utf-8?B?TENqWFBleEtaTEw4RVljNEtMbWc5MDZyYXR2K1FIOXBkTGQvMDEybVN2UGZR?=
 =?utf-8?B?NmJ2NlJ1Q1RRd0ZLT3RkNDQyQUNVRkRyTzcveHpWRUNVU0F3R2JsM2xjWXZW?=
 =?utf-8?B?NHluSUFBL1NFWlBqck9KK1pVVk1PYnhPd3hoL2cyWkZWajRGeHpvMHdndnJN?=
 =?utf-8?B?K3liZ2w0USs1QmtZUXYxRkpYY2JJQS8rOWI3K2ViOFdRSXduQjlBRkdZeXU0?=
 =?utf-8?B?TGpvSHRDVWRoL3J4N0ZoRlhxenVHVnBKMzVrMFVRYityeXUyMVlOQmd2dzJQ?=
 =?utf-8?B?dHlsaFRuVW10SDJjOVBNU1F5blB6TkFMTGU5cUg3YXZZNXRpdlhKd1dmNUVO?=
 =?utf-8?B?T2pXOTZEOHJiVXdJRUV2QWlsbWlNNHllbXBGRzYydFNLVVVGczJwU1BERDMx?=
 =?utf-8?B?VnkzeTlDb0IxNHQ5d2wzQ1kyUGdpZjVYR3M1eFJtZXo0UWpVbTN0L291SVk5?=
 =?utf-8?B?NTJBemR6SGttOTI4T3BaV2NBV1R1UGlkaTRYVzJ4TUp3S29BbUxzNkxpS29E?=
 =?utf-8?B?a1F6TldlTlBLaExEdkJEMGZBSFJqelNOczhHT0lYTm9Hb3B5N1ZjMklpRC9O?=
 =?utf-8?Q?XV1y/mF/jHzmo9XCbGvuGTlG4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e499fd43-3f7f-4328-a624-08db6123a2d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:36:28.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6O1t+kWGmN/LioccPxyPs1sMPL5CWgA1P54pQlfeuZX+ZnJrmzhfsdjgS71nZsJPGGHVRTIH38yHWkgjTrriw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149

On 30.05.2023 17:34, Andrew Cooper wrote:
>  * Rename IBRS_ALL to EIBRS.  EIBRS is the term that everyone knows, and this
>    makes ARCH_CAPS_EIBRS match the X86_FEATURE_EIBRS form.
>  * Print RRSBA too, which is also a hint about behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



