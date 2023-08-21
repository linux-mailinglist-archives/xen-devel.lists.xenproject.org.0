Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BC782434
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 09:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587302.918643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXz5p-0005GB-VG; Mon, 21 Aug 2023 07:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587302.918643; Mon, 21 Aug 2023 07:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXz5p-0005DV-SX; Mon, 21 Aug 2023 07:12:53 +0000
Received: by outflank-mailman (input) for mailman id 587302;
 Mon, 21 Aug 2023 07:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=phPX=EG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qXz5o-0005DP-AN
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 07:12:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe16::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22f73af3-3ff2-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 09:12:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 07:12:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 07:12:46 +0000
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
X-Inumbo-ID: 22f73af3-3ff2-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llGWVrwJyRf8+ySa7XCn3fb2TcPJJQBMWI7sakYPP8nM4ibKuC789wVOf9cqfy/0so5UuL7gUpATLt61QTC8IOKGp5fSOMpg4pBhYcVc4+P6yIqhdXj48SUZvt9gnRcl44HXchQQ3peWjawJ1+gFJVIwwHU6MT2LT/jpwPJYI7pty9ZtBawlHPTsLSGANQGxH7/OsZb3k3UjIb9Thjo5p3v1wd3Jj7CJW7wF4FxEF+sZRdm8r7V6DgC7aJh1k5y1P9MZMaQrAOB/xpi+/5BEgRV0/h20cYxTkxzmkZTFVT2dPhv5WJ/s833J4LD/iEwLUjzwAUrQ2qoEnV4XpkjvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD+JSGkPJBV3VIBzGn5OrL72bxp+yVyHJQ1IGIqcLE8=;
 b=RJuQP6kclIlWk+02u0/Ee9nXA5C/4U2HEftyIVnfNu4bfOS9pApksfSg60jZeNQgvoMVpxBsYUdDuof5z6r6L+6dtKx8hqMeQ0AJAEP1GIItS7gGH/+HxgX14gO4dulmtpGuJ81ZspNlRD4H7Vat2AbZISvsrVA1YPmla190qMNAs1hXzdecNyXEbwQFmhGYpHziQmrJOHeFs32ojm9JMsm+w7YjWxYPEtmsBBvXsq0cHdz5qKaCdEe6O74DWDhbUNBd18XFIqYdlzRmIRV0IDv90wNWp+VvqULoaWpbqBc4dkodzwc86yxo/apGh6YJ6pG3hLS6C1EXPbAmljWn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD+JSGkPJBV3VIBzGn5OrL72bxp+yVyHJQ1IGIqcLE8=;
 b=d4tB2RHLJhGtTVmLNnzBkPTFMJLllf0D+JSMHLbxnKeBHV6nnvPbpRsXhN0rarNAEm7qlKqlj5uSdZwRT+zzt3aoE/nnsr04R0vYOdp9FjgYgrUizj2wcF42glOzwwN1b0feVTpdYc5cXlg+VmWeVShrtS9fPMt9z/4HziVXwxeNOrWYjklQcbA2mfFy/QPQVqZiqKwcVCOiI3T+FF7JPhYqZOalHyEVK+662ILGhvyiSqn1J4RWc2JYJnF5PSz7LZKIZ2XBkGvYRWbGSSo4IqQkTGzfDtOuguSHtXPoNGq1gnvD9Fed9FM8Z73fIyZT5c4zG3Ms8vLRcWBXrqQOgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
Date: Mon, 21 Aug 2023 09:12:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add exceptions to rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230819012410.1754839-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230819012410.1754839-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: e98506f1-85ad-43e0-1ca1-08dba21604e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uPpTyL6UOn+OfGnrbWhzKq2gKNWdo9T0dAzU3kttFx64T/FWJZwzq6xfaTeS8fpCHdarrWaBu2Y7UegKa/jOuU0AKh+vFWjHYDJGq9jBHf6BKHkJuwKakZ9/bw/Z0HQjkmcyKBX1mRFu687NITzGn01T3J75dxvOtzCzs7aRFkE5qNdrVKQgfdqdkGe0NsH2IPIbczx0xnXR1tjLDLLGfZvaZXKN5iARY1DsoGXUAx/4OZ/FHcrEBu7d073pUsb5n2w95XzplEfsNgZ4CxXPS9uHRZeOwsQkoSX5pBMfHBpe/NCexXaxUrBti3gtGz+joZq8xWwMm88LWdg3zberiFqwytO0jfQlmgSgGjw2GTvdxqW0ClpGg8EDgZuxcWKrpQecxEoDZrM4j56g42c02DufuS7ilKdYxw+al3NvGtycHuKMQBgmUikuVnQm8vyOfNMBgnUzwrj7DxVGd+jfRVL68f3LzhIEW6izE8IOYnLFMYanAUvpCazEYBRtvoT8bHdOQ/3Ms60IsthVXsEMHrauzSmX+oiYC6dY0Z14hMLXoJQTjsum4sLH+Zyh7GVbYG6I8AwVQ/bUFYC6G0Z1L+/LazHq47H8UmvpFII6hpUDbPo2wmuhiVjJb996qPGltk3xlb+eqOhYKm+8t4oyPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39850400004)(376002)(451199024)(186009)(1800799009)(2906002)(66556008)(66476007)(6916009)(66946007)(4326008)(5660300002)(8676002)(8936002)(316002)(41300700001)(478600001)(53546011)(6486002)(6506007)(31686004)(6512007)(66899024)(26005)(2616005)(83380400001)(31696002)(38100700002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blBVbGgvRnpkUFVaZ2t4REdIVE9hNWJ6bXN6OEdUSUFvWlZMQW5SMkU3QytC?=
 =?utf-8?B?ZFdhaTY0M3h2MWpwYjhjYkJRSFB3UmZpTm0rQmU1TUkwdE0xMVFkcjFHanlQ?=
 =?utf-8?B?c2Rpa2VpTkRaVU92WjNYd3RsaVFtSGhwR3ZJdE1mcUdSTDI5bFQwQ09Cb2R2?=
 =?utf-8?B?UlN2R3BkZnpQM3lpVlhmU3UzVE5DK3dvOUptRWFyQnpDS1RXSyttZ0xQOXll?=
 =?utf-8?B?emtuYy9QZE1qYXBWSWNEcnZJSTNkMkpJTUR1elk5QUZVVEtIK2xWNnU2TVNE?=
 =?utf-8?B?STFteExxUUR5RC9QUS9la0dxYmVUY3hwNGZTOXpFWTBhZHVsaXVSWjU2Q1Nx?=
 =?utf-8?B?d2JnZ1dDQlh6VlIxY2d6RXV0NThITjNWVlUvL2xEZFlaQndaekhKcXJLaXZp?=
 =?utf-8?B?Y2d1QmRiUXpQR2pYK09tU2s1WGczT0E4QzNjT1g0MXNZM1A3NUJ2ZFBjZjBa?=
 =?utf-8?B?dDZpZk9YcFpPeVhqdG85dDc2NXdaS0YwT1JIMmJ1V2U3NVA3YU9LUlJZV0Nj?=
 =?utf-8?B?SFhZWXFMODlWNkswQXF5NktJckxIbVNtcFY4dzB6T1BIMDBhTXJreG9oSWcr?=
 =?utf-8?B?THR2SXpDUU9IT3hVUlMvOXRXZGI1ZU9uZG5WQjl1aFAwY2NuVlIyWXM0amxQ?=
 =?utf-8?B?TnBiWjBoU2dMUTVEczk4d2JpdUpsclhWaUVpRXU5MEMrdlNFNGZxeVRTWWdE?=
 =?utf-8?B?akl1blpjL3N1ekZudldpNW9nNC9rdWkvN0VHL2YydGpldVA0TjFxYzR1OExt?=
 =?utf-8?B?ZzhyR2xXZU1XYWNRNTFSY2d3TDB3azhuTGpVT2VDS2tid3dIOGlJTGVEZS9v?=
 =?utf-8?B?RWZtOVVzZngrdFVESEZGUjIyZ2lNQjMxUlpzbXNKcFNydkhVNm9wd0llWDRs?=
 =?utf-8?B?c2NjRE9YbnA0R1NtRnl5bmhqMFNUZ1V0VzIwYWk1UnljcGx0SlNITDd1SEpi?=
 =?utf-8?B?MStUTytnK1pOUnpTa0tnQWdLWW43cWN3NVlCVWlWMk8zSTZlV2kzL0tDdmFo?=
 =?utf-8?B?ME85QlJLdk1lSTVBS0Y2WnJSK3dSUnkwYkY3K3Q1aFZVZC9odFVmY3ZoU2t0?=
 =?utf-8?B?aFJsNDBLczI3RjJ1R1dDMjdYRnhZQjJkZTJuZW1RV0wxQ0NDZzFyYnBKSElX?=
 =?utf-8?B?UXRKamRaYS9XQ2srTzgvTlk1OHpyLyszc29CRDJPTUx2cGxuM2drU3FkRmRa?=
 =?utf-8?B?SkNldys0QVdJRHV5bE93bklHRlZxYUVOMHV0Ylk5eSt1bFJ4N0tlZEtxa2dG?=
 =?utf-8?B?M3ZnWG5oMldOQXVhL2lmV2psd2pFUnVNVFFiT0wrM1lOYTNpeUI4T1M1dWNO?=
 =?utf-8?B?L2h3RS9aaGR0Y3ZkNEVMZ3FMWUZPZ0ZQc0NCZXk5bG9KcE0vbjAvc1ZWNDVZ?=
 =?utf-8?B?dGM5WEpZYjZRMm13NHpBRGZEdmE1a0dpblFocW9qMStFYzRwSjBPMXRjQmFH?=
 =?utf-8?B?NHVJdWRxRDZoanNIOU4xYzR0K0lObENsY1M1c296cmh4anhWOHZHdEZwQWxa?=
 =?utf-8?B?Z3doa0RNamc3S2h2OW9nYS9qekthYUJDcnpQNVd2cEZXM3lpU1FFRkFOWmtN?=
 =?utf-8?B?SDNUTkdXUGVpT2VhMS9WK3VOUDVwWU9OdE8xVmpPKzdHY1VFcnBsVklYZ3FV?=
 =?utf-8?B?cFJLb0t1MXk3NFJSK2VmczQxdDI2Y0RiYjgxS0Fva0xqaERwYlJmVVNxL1Q2?=
 =?utf-8?B?RzZUbmlRdDFFZjBIditOVzRPa01LMUhxeGlRTUJQRTFhYTIrWWRPeGErVk9P?=
 =?utf-8?B?STJ3MU9yQjMrQ3piT3d0RENIZWY2NnYzTDNqM3dyK2VvOXlZRlNEclB1N2hZ?=
 =?utf-8?B?YW9uSmVKVk1wVmp6MlBlU29IdmRpR3Rwd0E2RGFtaG05MHh6S1hYWUkwbFNB?=
 =?utf-8?B?UEVQMFVmQkFtYlgxZXByak5CcHo5YlZ0RFYxL3l6SDBCb0Q0M0lxTTE1c1pC?=
 =?utf-8?B?Mnkvb1F1T0lzNVFWSi81eDFDSnZxL2l2WkpSV3BiSXRHRzdQcXhiZWFtYUUx?=
 =?utf-8?B?dDQzRHAybUNyUVpEZUd5QUdGSWtmaVB5QllGRUtMZStyV09RWTRkVGhnVG85?=
 =?utf-8?B?VExKUHZ3ZXp3SVBpQTdZenFUZWxWN3FoQTZZK09MSzVoNXI2OGowZHNtNjQy?=
 =?utf-8?Q?d+epAPyNmY42OIKwF082avN86?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98506f1-85ad-43e0-1ca1-08dba21604e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 07:12:45.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRBVoJe1IKwJdyAuU1GOpllzH8eX+zDYaGBJBsLipp6IqQlgWbHqZv/gDNycSucgupKcCUnjxyevOg71FLUFqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 19.08.2023 03:24, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptable of the Rules, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Other times, the exceptions were decided later when it came
> to enabling a rule in ECLAIR.

In a number of cases I'm unaware of such decisions. May be worth splitting
the patch into a controversial and an uncontroversial part, such that the
latter can go in while we discuss the former.

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
>       - Required
>       - Precautions shall be taken in order to prevent the contents of a
>         header file being included more than once
> -     -
> +     - Files that are intended to be included more than once do not need to
> +       conform to the directive (e.g. autogenerated or empty header files)

Auto-generated isn't a reason for an exception here. The logic generating
the header can very well be adjusted. Same for empty headers - there's no
reason they couldn't gain guards. An exception is needed for headers which
we deliberately include more than once, in order to have a single central
place for attributes, enumerations, and alike.

> @@ -106,7 +107,23 @@ maintainers if you want to suggest a change.
>     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>       - Required
>       - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions (e.g. while(0) { S; })

When (and why) was this decided? The example given looks exactly like what
Misra wants us to not have.

> +         - Switch with a controlling value incompatible with labeled
> +           statements

What does this mean?

> +         - Functions that are intended to be never referenced from C
> +           code, or are referenced in builds not under analysis (e.g.
> +           'do_trap_fiq' for the former and 'check_for_unexpected_msi'
> +           for the latter)

I agree with the "not referenced from C", but I don't see why the other
kind couldn't be properly addressed.

> +         - Unreachability caused by the following macros/functions is
> +           deliberate: BUG, assert_failed, ERROR_EXIT, ERROR_EXIT_DOM,
> +           PIN_FAIL, __builtin_unreachable, panic, do_unexpected_trap,
> +           machine_halt, machine_restart, machine_reboot,
> +           ASSERT_UNREACHABLE

Base infrastructure items like BUG() are imo fine to mention here. But
specific items shouldn't be; the more we mention here, the more we invite
the list to be grown. Note also how you mention items which no longer
exist (ERROR_EXIT{,_DOM}, PIN_FAIL).

> +         - asm-offsets.c, as they are not linked deliberately, because
> +           they are used to generate definitions for asm modules
> +         - pure declarations (i.e. declarations without
> +           initialization) are safe, as they are not executed

I don't think "pure declarations" is a term used in the spec. Let's better
call it the way it is called elsewhere - declarations without initializer
(where, as mentioned before, the term "unreachable code" is questionable
anyway).

> @@ -167,7 +184,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>       - Required
>       - A typedef name shall be a unique identifier
> -     -
> +     - BOOLEAN, UINT{8,32,64} and INT{8,32,64} are allowed

I think this permission needs to be limited as much as possible.

> @@ -183,7 +200,10 @@ maintainers if you want to suggest a change.
>     * - `Rule 7.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_01.c>`_
>       - Required
>       - Octal constants shall not be used
> -     -
> +     - Usage of the following constants is safe, since they are given
> +       as-is in the inflate algorithm specification and there is
> +       therefore no risk of them being interpreted as decimal constants:
> +       ^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$

This is a very odd set of exceptions, which by stating them here you then
grant to be exercised everywhere. Once again I don't think special cases
dealing with a single source or sub-component should be globally named.

> @@ -239,13 +259,16 @@ maintainers if you want to suggest a change.
>       - Required
>       - All declarations of an object or function shall use the same
>         names and type qualifiers
> -     -
> +     - The type ret_t is deliberately used and defined as int or long
> +       depending on the architecture

That's not depending on the architecture, but depending on the type of
guest to service. I'd also suggest "may", not "is".

Jan

