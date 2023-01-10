Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B9866460E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474820.736204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHUf-0002jo-Ub; Tue, 10 Jan 2023 16:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474820.736204; Tue, 10 Jan 2023 16:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHUf-0002ge-Qe; Tue, 10 Jan 2023 16:28:57 +0000
Received: by outflank-mailman (input) for mailman id 474820;
 Tue, 10 Jan 2023 16:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFHUd-0002Nj-V0
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:28:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df73bbd6-9103-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 17:28:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:28:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:28:51 +0000
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
X-Inumbo-ID: df73bbd6-9103-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8sPbhbivOcO48IZOunKrVoXUbPtEvavt5C2gCaqRRyQ5o+9QWHRmFMXU6nDVXju5a/GNiHl5eOsgt8Qsryl0tYN4jBZgyTfCthDxrNuUADebKQJJngTx8GFBTu/QgECT2a8zkiM49SWlvY3XJ7dz3fHji6R9Zs2KCyeQQKdJQugf6wYS/oyMHER8brc9BlywtqMgpHvPbddCw1KdIjAO8Ut+fPlTyfZSb7b1y7vnFYgLx0MvG94TEZKlupNX66n4oC7MnS0jwkP1NJPK/q33P7PuzL/lOKm9VEq5oJr3GyzUMCFuqDSNP9HGeJ3Pnx9v4P7tDBFSy3JmDx+G5KTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIVMyZpviGvd+DtKXNdgcxEVV4JpxCQF5jkJDsFuoPo=;
 b=SD+3gfL3bG2rmDnX2+k9MnMeQ2JWEy/o4qcOlnKjcxJvOjntBdeznBOItERC/lnUVruW2S56RkeCXovlNnp4Yz2lCexoxV1ghoNq01xGk9VsvIst9NIF/NR8Al0gUdOEcNLi9o53wSBz/c2LcL7yVkLwCLxZeSucwys+G13+9Y8ViHK5VS6NxeU3mv84pND0lv27IaDtpaxBIPQGPTrs/d2hN+oMbhpgALDg9Yuv7sAdntSd6f4ZzPJAPliM2OiyxKZoMIMPLoWsMxlM13fsz4kfVQ7RYcoP21Elsa0AfhmHnYw3sxZD/1vbBv2KZGEWUZ+4DJozo/nkuSx8zFRSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIVMyZpviGvd+DtKXNdgcxEVV4JpxCQF5jkJDsFuoPo=;
 b=HCLWSd55e7/87mVXyknnvWG0moy4DL4x8GAsH4ekoy6sx5+l8FfnquwtuXT4VNcUVg8oR14iPpMcFpAVXGsXrfau4JEbF4zDNr3SlvA4CyPbepTQ8HliyBcFk3rrYJZnsN10w2MBjN4huV44FNIqfdDcmZ7Lo4mGPRkvuSuvfaK3kwSJII5w9Q0k0fMdVSrpIxqnOryMV9iQsDuQmZmRb3GZcoNtremeXzcAg3UpL0BHzOIGStu/Oe9fR3hFtGmn1kiPrZnFxotfM3GarzT5uv4R+NGWLYkEEXaz0juGr9O4qioB2OmhKmc5cMVY5DzDRyxWBLg4mM+4l6G5c55W4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7157543-3132-eda8-080a-ce8afcf43f68@suse.com>
Date: Tue, 10 Jan 2023 17:28:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] x86/vmx: Support for CPUs without model-specific LBR
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
 <20230109120828.344-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230109120828.344-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 82541215-5bf8-4f39-97d2-08daf327c26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeCwC7iO+TZIFyhKzLqwbXZYUZykVRkzbPc+KShMmDHyLZ4w3hZ2ANLRG1ruP0j0Gxtrzk8DD9U5Pwsyj9WtOaVfcsWDIJIYMYKK4elaT+dsuEGLn7Zgz5xQRHfMq+GMAdWPs4rQp3nZXygTtQiQFuhwpIjWXrUgSaMxdqBmm67Q9GPEexYPhBpFYBaEn9FWR4w6w9Vc4AnayE8mWsVvFV+RMRx+7hyPaHCu8nBT8LgclO1WTGDBX/z/a+pV7epowM0NOTxZGXfSgisUisT8dvexYrLEB6l7f+6NvvsTYqxfEWcNgLmYkacEHiCyiOVFgmoov3fvTGadh/09lvx+entjBWvitUuE31z0O7Z0a8yMdvycaru6Gmpw50VkYPPudhUsazOYP2bP5u3nYCeF5g/2HLySTq6lhv4EyG22+guceOAq24lN08JTUJzjPMrqnNaPfSy9impbfimI5NdzG7Ej6r5kzo0hhultNy3bPberNSRovXUNdbPBX9eSDMIM2vvw99ux2yq1Nu7+pv7P+q9dy9Foo9ZUvDfuEXKHsWT6QrPLY7jh30zSwrnCsenuwEN6jRAaHBMT0bgY7yEPPrW1Qn75AuOxL2xbi037ActV89oSM2YulCOiU7zPTz0NKj7sgl3kI9Gq+BKOzGL/JSJdjjj26d8wZ+kUfidvHalxkSk19l1fWr73gZtUsQ/2XbDbBIIk8xyAQALGor0b204fvcX7ICpzCI/wKtFVhBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(4744005)(4326008)(316002)(6916009)(8676002)(66556008)(66476007)(66946007)(54906003)(26005)(6512007)(2616005)(38100700002)(31686004)(86362001)(186003)(31696002)(36756003)(53546011)(478600001)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2dPbmNnNFRCQmdwWk1vNDRBYXZMSXk0K3IwSVdGZG1KNE9yK3pwV1JUeDFR?=
 =?utf-8?B?NWU0QXNHTU9CVlpTMzYxN3ZsOEtxbEp5bFd2UkN1cDRMTG5TU1hWS2diRmNn?=
 =?utf-8?B?TXFxaEJiUkxNT01pZTBQRm12NFdPNVZ6SmxoT25HaXZhYnA4eGNUNWcxaTZh?=
 =?utf-8?B?OWZMSi9rZjAvYVU2c1pUNW5wRVgwVXFMdm5uTG9SMTJkK3Y1Z213d0JycFZn?=
 =?utf-8?B?SG0raThMejlhTm1mNC9pSitSMFhFbC9kSmRZRWRveXNUcjc3M0V6YlZuSXpY?=
 =?utf-8?B?M2cyTEpCU3JmMWJyRW9NYjZ6bzJqb2x0SkdhcWFSNzlTNkdnUmRFdXpJWXo0?=
 =?utf-8?B?UVYydmp1YjFuR0RYWCtWSWN4eWZDNUQzcTNLbFA4dFdSZ0tGRC9YejRmSldz?=
 =?utf-8?B?bE9uaS9yRDVzZ2NPM1dLWEpRMUx4VnlobDVWR25KY3dIWStaU2J6M3JjVVg5?=
 =?utf-8?B?Tm8wbU5GL0kxS29mVEhBenNyUUg0L2o2WjFDdWZ5Zm5SU0dtQ1RjY1dMU1BP?=
 =?utf-8?B?UkJlRHVLdUZTc0NsUDBMN2d3aEFtWFlHV3NEbkV1VnpQYk5sN0V6NG5tbFds?=
 =?utf-8?B?WW81MGgrOUdJOE1RYlF4RzNacUlSLzFSOEdnb29KVGJaQkw0ZnZLY0FFRWVN?=
 =?utf-8?B?R2RsYWttVnV0M3VwL09FU001a1c1cSsxOGsxM3RpY3VGeml0WHZnZTRPVUt1?=
 =?utf-8?B?NjMvNERxc0wyT1p2QTZDbzAxbFU4V2JlLzBqeldYUThGQ3hNN2NlTUdQUjdE?=
 =?utf-8?B?RmFvdXFlTkxpNzFlL21WeDRIb2pJeSs2OWJSNVgzU1F1VWF0c0I0Y1dxWkQ5?=
 =?utf-8?B?WFl4KzVlVnhjbnYrZFVxSCtqRy9yM3hrVzRKMms1STRFbk05OFZ4ckxtRWFa?=
 =?utf-8?B?T2kxZUYvbTRVc3FsNnJ4ZmxSTDkzZjRqRldTdjZiQ3o1WDNUT0JiVTduUzJZ?=
 =?utf-8?B?WnJBNThvbmRLdHA3WWZKTWZwRjAwa3h6MWl2ZEtBeGdmampIQ3AxZUhxODJ3?=
 =?utf-8?B?WWQ3Tno4eHRuSFZwZG5sTVRBQlRYMW52bEhYeEx3SzY0ZXV3RUVrbnllZHpF?=
 =?utf-8?B?YWdOQ2dmbXZuNm5EZ215VWtreC83bDQ3WW1QZTJtbHViVVBRTmJNc1NRUWc4?=
 =?utf-8?B?WHZjalVWSFlrdlR1RGUyUysyWVZWK2RwYmF6KzVEdk5oVVM5WjhubXNScVNy?=
 =?utf-8?B?S3c1VjVjdzVhZHdISWR0dktqeEVCM09md1JDdTE3ZGIrbmRDQy9IUGpOUGJJ?=
 =?utf-8?B?UXVsQU9hd3NTeXVUendKVmxBSmYzb0ViMXQzSVVWM1I1MHRsVnRiVDBJU0Nm?=
 =?utf-8?B?azdIMmRHaTFnR09ZM3VyelJSdXY0ZlA1TFZkVW9FUDg1RGMrV1dNN3FxSXpW?=
 =?utf-8?B?UXJOelQrUG50NE1IeEcwTVROTE50dko1VWplMDY0SmhIb21pS1BqZWFHU1FN?=
 =?utf-8?B?S1Z5NFJGK3Z4ZmJtMGhEbHdaZUtmQXlVVXZMOTZBS3djUWFzb0hZdkFHSG1S?=
 =?utf-8?B?NEtxcU5Jd2d5LzFVTUx4MHZDK2U1SFpIaFkzU0Q5OHNOb2tJMkc0QXJ2UnF0?=
 =?utf-8?B?bzg0ZVhLOTl0ekhBWENEbHI0TURnK2p1T0JsZnRIV1BpSlZwUzVnQjVWbmNo?=
 =?utf-8?B?aG1xR3k0QTg3d292cXE5clRCcHZYNlo0MXRXWWhURHIyK2ZJZzNLcWZTN1Mr?=
 =?utf-8?B?MzRubHh3TDAzQkIxU3lYbkdZaStlVDBrbkM2ejRHbmZ4eFBNazgyalVQUnRF?=
 =?utf-8?B?MW85RXJnNTNGeVZxclc4bnpraHRqNVZka0FIQ3lIa0gySW5PeUVZU0pMTEhm?=
 =?utf-8?B?cVNOdVZlTEF1UThMUkhMajNwamtzLzFhMmcrajJpd1QvOGVLTForLzhWcGNF?=
 =?utf-8?B?MjJNSmdoSnFPZ3BMRXpCTTVyYnJ3NGk1NnF6VDByMlJqK09OeGpoRlBvTnhB?=
 =?utf-8?B?YmdCQXRLTUhsOTFUUGVDeTRGeS9jRFREb1hLdzg3U01aM3g2YlVBVG9EOFFl?=
 =?utf-8?B?RkZUSk4wdVZpV0JudW5Tc0FjbVJ0NlJLNWRQUUlWY3ZVUXIyZTFRaXVNK09S?=
 =?utf-8?B?QXBLOUl3ckJINStFcUl5YkFra3FGRnI1YTdLNXVzWU1leVEvMTd6TGVHSU80?=
 =?utf-8?Q?VCjOHm8sgCaePcnK4mhMfRxzO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82541215-5bf8-4f39-97d2-08daf327c26d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:28:51.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34psCZcaThLG8CiW7Bzj/dfDuT7FO91r15ijWZxfoEtPAR3XV9mfQFd6IufBoxpovf5vV5wKaGwHlnMswAUnbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 09.01.2023 13:08, Andrew Cooper wrote:
> Ice Lake (server at least) has both Arch LBR and model-specific LBR.  Sapphire
> Rapids does not have model-specific LBR at all.  I.e. On SPR and later,
> model_specific_lbr will always be NULL, so we must make changes to avoid
> reliably hitting the domain_crash().
> 
> The Arch LBR spec states that CPUs without model-specific LBR implement
> MSR_DBG_CTL.LBR by discarding writes and always returning 0.
> 
> Do this for any CPU for which we lack model-specific LBR information.
> 
> Adjust the now-stale comment, now that the Arch LBR spec has created a way to
> signal "no model specific LBR" to guests.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


