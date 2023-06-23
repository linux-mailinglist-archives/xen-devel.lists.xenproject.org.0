Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDCC73B21E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554284.865399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbZp-000230-7S; Fri, 23 Jun 2023 07:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554284.865399; Fri, 23 Jun 2023 07:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbZp-000208-4A; Fri, 23 Jun 2023 07:51:29 +0000
Received: by outflank-mailman (input) for mailman id 554284;
 Fri, 23 Jun 2023 07:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbZo-000202-3I
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:51:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04b8855-119a-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 09:51:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8289.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:51:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:51:21 +0000
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
X-Inumbo-ID: c04b8855-119a-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkOX1mlBEHmmD8gGzBOrB3BEW/z0PrhvMvu8KnWwiFEfAMGgGpvCR0h+5SUvw5mfCoasOxxlad/f1sqgCqKyHA0HNeTN6di+xLrIGf33uUl1jL7G5rXa8NPG/Yw1XkVVzBe4uzc1Vilejr/5NJTD4/h/J95Kau/3mfU+FBgk/lY8Uj0gUf/QuiYgHAhulK7wDCrnu8f7PZonRxU36FmSDCvPtJXcIqZHTaVHuIK3nQrwlaIDWGceozz3z2B0Goh2tJ/1z00hTkJ/y5A7rhOH5qRveQCcUcy6opq7cceeT6A3RyTjg/v1m01fTnd2sklmZtIizI+DDNZYPQMKYuUuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+JD3XYDEbQG0NNV9SwSP343kenoSRjX3LSyK6XyEbo=;
 b=ECUDcE7ijNQGopqXe33oH1VXRlMiedKlG8olo+BasR5atJkBHcqPN5Qn1Fwl9muUyfHl3WGwKjmVBoGYr6wufrWv95gzcJZ/HCxts1Kn4CEdqsG4G639pTih6aMaIMBcmYv6ohg+lybtaVpBSSBOOu3VPhq6XyGAudPW6Q91DTvxr94GcpYKMsaCt+AMB/cHEqrG8NJn+BBEIB6j5Sm6osxBjEd16V7rpM93EvxSziYxRcITVj6vpD/4/DPIf8SuTfNBKg3ejsC80E7gXnQ8Xx3Ewdzq1gJX4tt1a7tGhylGfG9fhLfL5orT7GpgEMrqFM1YMV+AmHQeZXjBaYmD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+JD3XYDEbQG0NNV9SwSP343kenoSRjX3LSyK6XyEbo=;
 b=R65sFjcL0f1r9sYY4cnQhoFefcd0hR6ostFEib75GV4fh0SAWqy/3nFmnWXpk+WK8MBPPFWLfw8uUnxkdhEUQWY0sJWk010lg0K1OsbOec53Su9bDpYxhP1g+/TnOzme2Ct9ZcFnWyMHmCjfhBLRXKge3fe83t78+4otD3VaAe7gRVfTL6aCep3SzV85zgaaEIhJi9GUp6J3YkcBjkqG3/dB6K0h9yABbNsmLMAOxf3I1j3Uqxc1ta2z9Hyjnaswpvu8GmroqhvkGABt8UHE5Rppvoe2MBKOB4n3d92rRIT3Fwf0mZ5LN0WVQfgJDbF0lMQUG4jzVBpm2jMra5XAJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ef93f73-db2f-32e9-6134-263b7b6ea5ff@suse.com>
Date: Fri, 23 Jun 2023 09:51:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 1/5] build: define ARCH and SRCARCH later
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-2-anthony.perard@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622153005.31604-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbf2908-8581-439e-101d-08db73bea2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dPxTXxFrKQ9jnQERlTx34QMgE+V05BOa2hiTLNuXS/TVr1Bx334LWqMrlsd0YZP1HhrGTHdf5PIQhJ9Qv6QU9+xqMSuX9bdLAccEJUobJTeRJR9g+xzqHc2noIaCSmsoT1DJXVgzD2CciWA+FPZXlpZRsWmb1ZQBkkJ1GzLI/+h0YWxZSsfTetg0SEYOMcNDYSCZyfQmuEc5Wby+NZroRMc2sBThonH09/6K7Bn/68hb4ZlWFIWeZ+Ww8IQZo1NBmZY2pi0xc8NvVmzG0QFcaA7HrhAvOJqnKqU7HgrlIFID6B3Qv2V6tfoDn97nZ3Rz3gh03fkJBn4dUf9EMEnSlkb2fP2Ersiy6+pmZhcDxzi/wq00HF0WlMLY37/IaWfoR1Wj+X3t833/SBVzHl93SvjYpA2YSgYft1pSw9/viNGT57UJ76DdEcEhrFE19k6vby70qwDyPpIEgWOQeMxuT+l5HWgO7NToyWEsTfxahZC4Q+thlgrlqEu+BOJPKAIv8l9NVsJ0iUYvrvKEvO/gbyGM39RjIVZB6kPxZcZQlRgiC2967LzCuP7c883tgjCEn3kSmZPVgL1ACJjDmXm+HElFKtdr9r8u9ha26/eyJlzQQZNX/xNCBDgKBTt/klR9Je971iwqpjkjthfEGs5bpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(478600001)(54906003)(86362001)(31696002)(2616005)(26005)(6512007)(6506007)(186003)(36756003)(53546011)(38100700002)(6486002)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(8676002)(8936002)(31686004)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXdoWU1FLzZDMWVyLzI2eWFMTUV5TGZ6THg3WFVpZEoxSmYvRlhIZGVweGFt?=
 =?utf-8?B?V01jOXFxaEszQWJnRHI1NnhsRE5XOGJlblF3VFBRajlwV0QzYjN6MjlONkJq?=
 =?utf-8?B?QldGTW0wWnlub3ZwY2FSSFB4aHdGY0ZiQ1Fvb2x1MURTc015RDhRcjVXSjhV?=
 =?utf-8?B?ckgrVzlVb21KbkV3QVUrMGlOaXdzdjY1ZTVnMm9WdXlCTFhBMEVnN29zeHBt?=
 =?utf-8?B?T1o3dnRkQUIzUTFsUFZnbVMzekVtUDJyNmJvUm5rNkdRUmxYOTBXQk1JOFBp?=
 =?utf-8?B?anhreXFnNmJTR214bzJneDg3cHNMNmM5a2R3eXpxZnBiMndjNEx3ZXJpUmFT?=
 =?utf-8?B?aWRaSnpXUkRQOFV2Yk5vWWRpaXR6cG5pM282RFYvV3I1NU1BdllZdmYySkxh?=
 =?utf-8?B?Y1QyWEhwTTh2c0QvRE9icjBYVndqajl4M29yQXI2SWp0VGNvbTVzNXh4K1Q0?=
 =?utf-8?B?VTN4bHhIR21qUWtmSFBHc25ZVGdJVFd5dXovazFDaDcyVm1BZVFsWTQycjNR?=
 =?utf-8?B?WXdRaUNrNERHaGRSbXNuQ0tRdzQzR0JUS1ZScy9MYnVMOFpob2cwWWNWWVJv?=
 =?utf-8?B?a3JtR0tJS2xkKzhBc2hDb0VWaFd0RjdYSU9EWXArYzR1aXhESHNZTnkrRHpK?=
 =?utf-8?B?eWNFOVp2K2prT3RDaXJpOHdHSGtoZXpoSUw4QjAwckNkUkpVRkU0amJ5dUN2?=
 =?utf-8?B?QllKVCtBeEVQK1NRTFJudHVkaFNvS1hiYmJpUnZuSXVvTUFsdVRjS3lKSU5V?=
 =?utf-8?B?enkvTUF2b1l3OXA0ZVc5V3ZJcmEyaS9xc25rK1RzclQxY2J2V3EyWWNiR1lq?=
 =?utf-8?B?TWIybHl5OUNmUUR0N0VhSDRDWm9KRnZwbHVjU280ZlpETWdGTlBpTTJSb1F3?=
 =?utf-8?B?ZXBBUXFOdFE2ME5sZ3laRW9OZlpZWFhKazhoR05WMlc5TkxvL3U2MVdoaGti?=
 =?utf-8?B?V1VndS9GOGg0WGZGbFdqRlBSSmtGdDdSM2dSdkNvcDQwM3FjVUFvZnJYSDNv?=
 =?utf-8?B?U2haMmIwODZMSklVWjZsalV6amt3MUVlWCswOFFBb1FtejJBdFhGdW5nTEVV?=
 =?utf-8?B?UHAvWEVCNDFvdGRMM3lla2xPdFR5STVnQWlhU3JWYzkrMFdrZGthdDFvclZ1?=
 =?utf-8?B?SnJONmZOK0dKUEdNNGU4Z0h4UU9jNE13bWI3R201ZG01anZqMW1zYVRvN3po?=
 =?utf-8?B?aUozMGJvSFhxZmV1KzF1OTdTOTBxbm5iTTNLSmxwK3o5ckpUckd1WVRFRnNS?=
 =?utf-8?B?a2RNUDYxUHRSSkdEdDY1OHU4bFVGVXNCVlVHNlFDQ1FzaEQxT01rTFI2MWNa?=
 =?utf-8?B?c0RBbEJDM2N2SzJSMkRVcVQraVFKYUVtY0lOR3prbVN2K0JnVWxDRzdmVEhQ?=
 =?utf-8?B?UmVIQmJmd0FjdHU1eURsenhZMmtqeXRJZXlGZkxlaFRlQVllK1RlMm5FelNC?=
 =?utf-8?B?a1N4MmdFcXpId1FXZWxualkzYzVtaWVkUElncXAvWTZRelY5b0cvQ1QvajZt?=
 =?utf-8?B?OWRLNHZxUWc0eU1SL2dqYkhvSWlxN0ZPM2R3ZjhHNmRMYkRtYmlVSzluQ29G?=
 =?utf-8?B?Qm1kbmJrbXFEZXFUNnVHcEpwb1E0L3hyRHREUU5rMmVZZzVlbjk1c3dsN2NS?=
 =?utf-8?B?cUtRRkJpcGpEd2ZqcnlWYWlIcmEwbGtqTFJXWm5Nd0Z4ekNyL3psNkZKM1J2?=
 =?utf-8?B?SnFiYkZtb0pUbTRvL1JGa3FzQUpTc055WjR6ZmY3aDNOdFFOWDJLak5LcThU?=
 =?utf-8?B?dGQyTUNhVkovQnh5alJBRlJrNTRnem5IR0RmZ3ZrcCt6VnE3TCtrSkxFcEJQ?=
 =?utf-8?B?RDVDSDY4cUhYSE95Y0YwRmRZR0tHVWlKWXc3VnllSG9iSDN4SVhZQmZnWmVv?=
 =?utf-8?B?eUwzc1VMS2tTN1dMamtCTlFMWFM0WHFGSjU4dTZ4M0x6dEtaZWVkWjBVSDRo?=
 =?utf-8?B?QjBVN3A1NGp4ZUdXUXgxSENpSFZJN2RQTHlhOFFFNTZBdEJTZFlqMVVFVVVo?=
 =?utf-8?B?MW9YZDQ1NE4wRHRsVzF1RUdPZWtLdU1ibFVPaFcxSW5mZW9oWjJwNGJmN2pG?=
 =?utf-8?B?ZUtqU0tycjRVYm4xb2w4V2p5RjNIOVZQWU9aK2hqYnQ0Uk4zM2JTVDB5MGk5?=
 =?utf-8?Q?MsPc1P2SesC2h2ZWabarwrbf8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbf2908-8581-439e-101d-08db73bea2ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:51:21.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOhMa2fKGjx7DJyDdj9LO+TRurRJqPrXBEAkWFw43UxvJvr7J4WqorRVS7W+GheiAJLgI5D+4tiMr4144/iCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289

On 22.06.2023 17:30, Anthony PERARD wrote:
> Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
> immediate evaluation variable type.
> 
> ARCH and SRCARCH depends on value defined in Config.mk and aren't used
> TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
> sub-make or a rule.

Something looks to be missing in this sentence. I first thought it
was merely a "by", but I don't see how TARGET_{,SUB}ARCH matter
here.

> This will help reduce the number of times the shell rune is been
> run.
> 
> With GNU make 4.4, the number of execution of the command present in
> these $(shell ) increased greatly. This is probably because as of make
> 4.4, exported variable are also added to the environment of $(shell )
> construct.
> 
> Also, `make -d` shows a lot of these:
>     Makefile:39: not recursively expanding SRCARCH to export to shell function
>     Makefile:38: not recursively expanding ARCH to export to shell function
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Tested-by: Jason Andryuk <jandryuk@gmail.com>

With some suitable adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

