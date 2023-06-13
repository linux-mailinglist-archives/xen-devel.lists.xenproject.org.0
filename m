Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A56872DE8D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547951.855629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90nz-0001Wp-4m; Tue, 13 Jun 2023 09:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547951.855629; Tue, 13 Jun 2023 09:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90nz-0001VO-0f; Tue, 13 Jun 2023 09:59:15 +0000
Received: by outflank-mailman (input) for mailman id 547951;
 Tue, 13 Jun 2023 09:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q90nx-0001VE-CR
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:59:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1b7d77d-09d0-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 11:59:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 09:59:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 09:59:07 +0000
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
X-Inumbo-ID: f1b7d77d-09d0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQiL4TWBjxIY0og1JbIO7AZPYE+xtLsGzTHjgV1JzsJ9VnsegHFVOpnzuIcD2V0da80MrCKS7vG7C2Z/NhIrUswT0rYX5kSlV2nM929Cl31I0VHaFvhcfPtByZoDv3dio7J7Xry9G/ZomN6ptWfTco41Ae4ZWgSVxEQtgpqmdE0k4x6iYp0MOXNiY/K075QathIpH9tjtbWpw3NHr4jIYUgfgVh3gQf1/zffyrv95nSPHwYBFIQsI76Jdwz1wNwZjYYTX53H5WxkyJHlO7g778y/TB22/1iUzVCESfNE+sA4CNZ/O3Fd+GO9d16nAegJ97H2euQsk3wH7RrKDYuk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P7WAoL8zBIqTgNvju3yNWx3PgzxRz5igygtiM0PERI=;
 b=ZQ1SuYKuUzH5XYsdg1+I8Z5oZonX3bSc0B+X+kLx+9Qemk+h+foiV1MpBAThkh1Wg6kLDOEN8/3Uw1qOmG9NFd8Cd5xiPQzrSzqSofHmHwLEFybhIJTfxZzzT4rWNBUfEdOkUCzo0+14hzvxlStPYNO0E3JGOe6TKxjRntoAB3of+oHXZ+9AxDHu0zQfH47IOc54ptCyo9RtRkdXVs+t2ZKStQTmy1Bnz4L85F5fc3MryUBv4bYFaYWDXpqKajueRQFNI+ktQo1Wbjp8wON6gqxwUtKOxfg+Kg6yHG7Plzz6yHcsHefLD+JeMSGZQWkuu3GVhHAwNhpjjeOCZCauSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P7WAoL8zBIqTgNvju3yNWx3PgzxRz5igygtiM0PERI=;
 b=R4ehkNuzu7hWdmwKwxQECYwSqdSuUHnj/byh+Y0pyMdvdvmOf5nROYgLKh8w4yCeOQJNX6Sb1opBbgRKbloC0Wr9g+I7Z1gAeP9/a7bmtu6MqKcIwQcxFN4cdY75t+RfbPHdU3eiY5/x11/IodXlL+M4g6RG0nYiffKTSKgQVL5BMD3ZRGuRApdRmEvxvX7Pdt9R24EW7halXEqpYpyO32dYPywQVTz2L+uzi28VYBRCRZQeHeb5/A5DhfOFtPGrRXaSsM1/k+RrHxqvasW4XC06x2UEz3onzimoCygvoak1/A3K6SDLmxucHFBMj6Yn4K4+u/Q61tSYa3HHgH+rGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
Date: Tue, 13 Jun 2023 11:59:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612161306.2739572-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: f16560e4-c677-43cd-1988-08db6bf4d406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nabCHnFwjE/IwmqkgRVYgQUPDiTe2F/JE6KE3PIOKQHjCmQwm0UWQvvn/SjtJ7HbQmxMVZmaK+2qfYFAepEPLh64YjqzcxeTIrfz+ysNQX/4NeSvQiAnemsD57MREzNqkh8XAkGXB2HHqjDm/0e2IcBwEprX/kLXnWaeYtvmZjXBFJBPsJV92oF7uIYIll9n8N9Axz2ORcgDjPCOu1ChMrTwl3a44BD88BfvwqJckIg2vRzK8OVVqF+CesO8kCxPfwVXcW89892LDLtdF3wGJSYVtF4I0sgIjuQhEGbTtFadnWPj/2IRY1XFHDIkzvuxAeu9WPp2Jj1Rm3vUPeWy26giuy3Ep0eGs3OM6KqSt0tIsEbydi/f+NOu6g//AbT9etqC2u2/Y6pd0yjmzC9SggUwRxoO0edgPx/pAmpxEmPV+Sz4dq5vejNoWtgvbiZ1Ucomxf9TjCzZZBpT1hxcmrmDbb15EIfavejDNO42BLdSioeU44yxAlpcY1jMAy4hTCgiCJnDwlIeNSFNOGBLce1s9kUx7LIGGLesyVaFyd8vuyVvecOaOmRwyQaMHLucC7ZiAy+iT3nhKx6s1TWfHvkd0bzVHBjjWCXZD+L+8R4vKaQNBEQ0J9EGxxhDx04j3YhzH0iMmu223/08q/Ij0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199021)(31686004)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(54906003)(478600001)(31696002)(36756003)(86362001)(6512007)(6506007)(26005)(83380400001)(186003)(53546011)(2906002)(8936002)(5660300002)(8676002)(6486002)(41300700001)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZjN3FqY1FOSXZEMDBKZmdnR0xKTzc5QXJxbnpBMVFDdys1d2pWYklwOGcy?=
 =?utf-8?B?WUF1N0JLenh3ZFZQWktjQjk3OUJJaGdnbnNpeHg1Z1pVWXVDTW11MWJvYys2?=
 =?utf-8?B?ZDNvcjBNdXdRTkM4U0dCa1laczZXUlI3cDU1cEtsVUlZODVDOXNPd2RDdnNP?=
 =?utf-8?B?VHlnQnlLSnVMTDQ3QUJRRnFjWTdiVnpMNFJyVThQeUVxYnExNzRpN0FnSGt5?=
 =?utf-8?B?MU5QeXo2SW9XdkxTQmcyVUhiOXVIczJseElQRSthd1FMbWg4ZVNTWERQQ3Zs?=
 =?utf-8?B?TDgzbTJjWmpiSjRZNTFtZVY1aG1YTUFCcVRUZlFmenk4b3JSaHJGTlFZQmVB?=
 =?utf-8?B?RWJNb0ZNUmJJaHh6ZUZtSU9ZaWJueWlMdUN3azhmNHVqdmVyTmI5dERsTUhQ?=
 =?utf-8?B?OXVmNkdUaktKTDNFN0lubUlLYmh1YldsVlpRWVVPNFVkTGo5dG1RYlZNbkR0?=
 =?utf-8?B?bzVFdTh0WU9PeFMxS2tsK2RLZll0eTU3RUI5MGlSVnNSYnh3SFZ2bnBMQmYy?=
 =?utf-8?B?SXdlbml0SFArcmEzdzAvUGEvYkpwQlNoUHNoSEt6R2J3SlpWbURLQkc3dUF5?=
 =?utf-8?B?WElyVGF1WEliWUxIaitXVm0yZm9KSFVCWTFCeGtZeEdCWW9DSGtQNmoxd3d0?=
 =?utf-8?B?U0NvSjgrQ1pvV21QN2ZyOHpsZWo4Y2k2bzJYM3o1S3F3MFJiRGlmTG1lS3g5?=
 =?utf-8?B?NGR6RkpYbjhmWDVzdVpvVTQxZExJb25XVExyUE9RM2VOdVNBZ1E4ZHhZSFJO?=
 =?utf-8?B?c2dOSVJlTXY1M2ZSMGV0bkFHQzVuaHNEdkhKVUR4WndwMDhCUnBVNlB6Q01h?=
 =?utf-8?B?eW03dzByb1lNSm9lSmtsSFp1NDVaSWpnTHd6VHg2VGlES2pSY3ZheVZwWGUx?=
 =?utf-8?B?aGpqamw5ODBrY2NnN0ZQQThiekczaTFDWFBPbFowVGJocnRpT3hUMVVwREtJ?=
 =?utf-8?B?YjVUUnY4QWlYa09LRnZpakxMRmFXU282cVQ5NnA2MS82STFvUzVpRjZHUlB4?=
 =?utf-8?B?c2VmWUJOdHJ0dFIxbUk2eGdscVZkaWEzVlV2dURrc3VwbWVuYVMvOVJ6SHZ2?=
 =?utf-8?B?bGxMT0NEU0l1R0VubUUrS2JVVG1HcXoxclJYYTBPeGlqejJhN09FZ1NmNTNY?=
 =?utf-8?B?eFhTRnJ1YW5Ca2wxWnRWU1RxY05QSGVhZzNCOTQ5UnE1SzNJSkc1N2FCK24x?=
 =?utf-8?B?RzFCVFdESFhhbkdQalJuUDFsSjBsR2ZXYmRycG03dmJEQUNnWnQzM29zZGxF?=
 =?utf-8?B?YVRadWxWbkZhU1BHOEp3c0lkMWV5a1dMYWd3LzFENnRkZjNzQ2lYaXYvYW1H?=
 =?utf-8?B?TVNUSHhJb1hJbW0vb3VPM1VXYzk0Yy9ZUzNBWnc0U1VOQXlPTFZUV0tVKzA1?=
 =?utf-8?B?Ync4VXBMTTR5L25xMG9lT1ZQU0tUeU9BMERVRWp6bzk3aHNvaWU2aFZkZ3Fv?=
 =?utf-8?B?KzZ4UllLZUs1Mm0zZU50RGU0QXNVVFFhbnV1QUcrNUlkVEdjM2tPS0tnWkN5?=
 =?utf-8?B?MmF3UG5GdGozenJIbldNb2t3LzQ2RTBFY0dtRDdxVU1LZDd5UG04QWEzR2hy?=
 =?utf-8?B?YmRBeGFPUzdEWktodWN4TlU3VVJwT0xBQ3g5T1N6T09jZWhkaHN4Ty9EY2N6?=
 =?utf-8?B?czFXUmVpMHQvZTE2cmFleTNqZkhGbE9nYjF1cVhtUUlNbkcrWUZOYnFORDBL?=
 =?utf-8?B?TFN5U0czOURNVENRRGpGK0IrY295aEZKdVl2c3lGNEFyMmFFaGRXU3c2ZTV2?=
 =?utf-8?B?K2NpS05ZNUR2NWN3anJvY1J1TTdYdkhmcWFwaWlOYU1hM1M3N0JWOWE2aWVy?=
 =?utf-8?B?RjFhTG53ZW5xSjcwYzFRMVN1NVZ1Y0R6WXA5TEdSYlhFR3Z2am8rN0M3Ukpr?=
 =?utf-8?B?c2xPSXhjQ0hiYVhzSUU5YW5jTlR2WWFGNEh4YkFOOTRTRXMrNmlCeUtoS0Ez?=
 =?utf-8?B?WVUwOWNQYUJVSXBsaU41eTJZeDBFUjlucWVaTGFyZldNY2UwVEpRdkFLR2RO?=
 =?utf-8?B?dUpJYVZIVmo3WnY1RHMydi9IYk14alZzYUQwcURUMVRpa2lOMHFkenlQMXRP?=
 =?utf-8?B?RENNVVFxNng3TkpnejF4ME5xMnFkT0tMdG5qenZTSW41MDlmMnZWcEVBMlRu?=
 =?utf-8?Q?silQyyk6n41UdTNqAlCPTVT74?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16560e4-c677-43cd-1988-08db6bf4d406
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:59:07.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddAAo2ECKkSNTyaaXW3nLnGFJeWVuSu0CsMedBiE27MMCoGhhUJst46CKOmc3mMo//G80s1cFFHNbA2Q2kRkKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562

On 12.06.2023 18:13, Andrew Cooper wrote:
> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
> predictors when empty.  From a practical point of view, this mean "Retpoline
> not safe".
> 
> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
> statement that IBRS is implemented in hardware (as opposed to the form
> retrofitted to existing CPUs in microcode).
> 
> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
> property that predictions are tagged with the mode in which they were learnt.
> Therefore, it means "when eIBRS is active, the RSB may fall back to
> alternative predictors but restricted to the current prediction mode".  As
> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
> 
> CPUs are not expected to enumerate both RSBA and RRSBA.
> 
> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
> linked, absolutely nothing good can come of letting the guest see RRSBA
> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
> this dependency to simplify the max derivation logic.
> 
> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
> "somewhere you might run, Retpoline isn't safe".
> 
> The default policies are more complicated.  A guest shouldn't see both bits,
> but it needs to see one if the current host suffers from any form of RSBA, and
> which bit it needs to see depends on whether eIBRS is visible or not.
> Therefore, the calculation must be performed after sanitise_featureset().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v3:
>  * Minor commit message adjustment.
>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.

With this dropped, with the title not saying "max/default", and with
the description also not mentioning "live" policies at all, I don't
think this patch is self-consistent (meaning in particular: leaving
aside the fact that there's no way right now to requests e.g. both
RSBA and RRSBA for a guest; aiui it is possible for Dom0).

As you may imagine I'm also curious why you decided to drop this.

Jan

