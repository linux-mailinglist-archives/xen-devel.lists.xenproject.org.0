Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB668BFFD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490483.759199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Qb-0008PF-5H; Mon, 06 Feb 2023 14:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490483.759199; Mon, 06 Feb 2023 14:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Qb-0008NR-1A; Mon, 06 Feb 2023 14:25:05 +0000
Received: by outflank-mailman (input) for mailman id 490483;
 Mon, 06 Feb 2023 14:25:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP2QZ-0008NL-Vk
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:25:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a89030c-a62a-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:25:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:24:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:24:59 +0000
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
X-Inumbo-ID: 0a89030c-a62a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaOuV/+SiSQlhomcSrrllEIUdpPm5G1RsL9G2yd6jQI1YKvbQfWSz1kl7pNU4JzQQssxT5jqSLYLPPuqb2DhNOVYM1mXe1h8tSDwfA9ojHyPb6KESfwhZxUBwdOZ6yrhHqLp2loOBNM+gv4XFSxOIpMfgcL1DC1Y0ZamQpVrsq8nRcfSORqVfA1IsJgoaqESckhFRaCB/pHTBBmjqV12c21uNSuzp43ww1LHJyT1zEGd8beYYWDikm4A3urwTs98RMfeQEStYa3gJtA9xVO1YfhokZWcN/KXW+fmMAHTEkTUv3KtHzdaAUeFUHckeQ2IApS+Dtmft8iCh1p/UKsavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwojmc3mZz6Ur7EYL7dib+qQAccTGS5ed5qfQSWcpw4=;
 b=HQzRA4dSelBeReAYWMw++khUBtTtmQ0ttFF1pvfX0aCxH2GmL3r0KO9UudGzJO2w1ZVNl3fDKyjVYuyWFJjEbflltp74TY8qY2MoBVGFnnFSHcdoZM3sjnK5rC+yfMTgb43xfkOeYhv7AKVpGsAZoezNj621aamrgDixR/DDdSJPRCDlEDSF3LwEOpAljEM56jBhOVBccd1qOQSzg6bP9KwTdVgU7siyJ32V29Qw0jhi8trOAN9luVjB0axr6I5eWA6GTHd+X9Yl9YsQH9sdb5LhGe8SQ0tk2aQIwCAlHiHktbeTIB87A5Pe+mEKq7wgBYvwd4Xlz8RKOrDOc4w8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwojmc3mZz6Ur7EYL7dib+qQAccTGS5ed5qfQSWcpw4=;
 b=kjPT08LEF4CMOcMfitULRGwGlcUeOdsQeP4GotnE1Ra8aGnlWQ9Bvg7DWIJTltY+inDtwVgyNLspeF7PLbIX+oHb70QQGiGpLjOe+FqopfsWMmDyEISynb2tlK1KbJGCwzo91iEhPTJm/8MbMSeQL1EvHJvGjJeDwsCFxuWknF+yNtdryk8unu4C06HdQ6yrhJ6XqX0hxPdEgsuMC+K2E1lG3iDcw3ci9GMKJ7m/jBVnG0JPohDwcv4pxH2xqiaNh5nZN6ZzSugX/lmHZExwFg3Krr4tpRZdjXEYMmx2CWoaD/dfXWpNsyEQdhKIWXX59aTyjVihV+ycm/vzqWMqqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15cdfa52-03fb-0052-4389-0781422b37f2@suse.com>
Date: Mon, 6 Feb 2023 15:24:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/4] x86/spec-ctrl: defer context-switch IBPB until
 guest entry
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <23ea08db-3b64-5d1a-6743-19abb7bd6529@suse.com>
 <8b4c6aa8-cdc5-50a3-2170-f4af80fe1a26@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8b4c6aa8-cdc5-50a3-2170-f4af80fe1a26@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c64ec7-7cd4-4720-29b7-08db084ded2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iildtqJhvAdp6MG6BEqthxkkF/WUZC4Sh4LPGYVySpzJ64DJT3UXJk9gWp/JE652eHfMoM7Xs/TsLUUW1AoV/6Eaa6Ff3qHW8Kq1dxvAZwkqr7pZHWE7LF5lFPComFaIsksT3QVFFxHZXsaCKZ6jc45lzfRZJxcFxGqMnwu2Cp3vqShVCVRRJjsc/syOPpTU31sZE1ATrgBovLyS7dtLXqA3XerMprDm1ihRC2MrbgQcM8H+KoJtke6Bek8m9KLT6lkeSL0DAqErIUiiALQEVict4J3foj2cO6hUHkaJpAq6A40vS18i1+11pxuVWITE8qtg/JQQBtw5kDRumynmgxck1cqIHiqzbnPZ93VJ4eAcDr4ytYRn4JpqgilZsh9c3iQCtWBz6yOREgxJCiwOm8Orkm0WqK5sWSsQ9sjxPO0FR/OCx7uCZM1ECbLzoVrgcvDzSOorcq5R0p9Yy2b/lgC17i0r+SX7p8eN+NVd5YZEb4z5lk/6L76vH/sOmlJY3WeAecem+74AFlJZQSD1b6QK2vPRHHfA/gvlC9A2XU6nStjsCTTwSYSbGruiGs+2JmkQaL6mv1jtQnOrWVi2vJUq1piCtwr9sGFtsb4o5uav1CV0DiQJltwSnfXkhmbf+YlzW1JxXvQjM5NKZKa+i/0L2D9O8LgX+Klc541YpLmlcS/EA+trkQQGdwS6bWPNcJrTFU28kp3a9EOFRBUlO6/s1FEQuW5r2AHVsaxcoT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(186003)(66946007)(38100700002)(83380400001)(5660300002)(6916009)(41300700001)(6506007)(2906002)(66476007)(66556008)(4326008)(8936002)(8676002)(6666004)(6486002)(478600001)(53546011)(2616005)(26005)(31696002)(6512007)(86362001)(316002)(54906003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk15Y0xnaDJ4QXY2T055OVZyeVpyS3B5ZWR4eXZQQ2NjNS9TS1pxT045SG4w?=
 =?utf-8?B?MUxVMGl0ZXgwUmlCYmJpV1ZKdVVVWFVlT1RFY0VGUW8vYVNlTEppODFOR1Zl?=
 =?utf-8?B?U1dVdWhiaWFMYWtlQUh0V2FaWFpUc1lDbHQ2c3BKMURQRGRkN0NQcXdkTjNI?=
 =?utf-8?B?ZjNzK1k2TE11QzBDOW1XKys1WDREYms5YVllOWZxZHJCamFEbVFuWGw1dC9q?=
 =?utf-8?B?RWIzbTZCbjUwR3BpLzEwemg5VWxrb2RWWnhYRGJZUVRva1IxMEdmamlsaXVT?=
 =?utf-8?B?TjNYTlU5ZHA4eFUrN0loS04veFN0OFh5YXNBYXpMd3c1aEZFbWgvTlVVVXRU?=
 =?utf-8?B?Q1BvUlVJWmRFdXNybDBjM0dMejRrVjJjNWNtQmUwTjdlMVh2aWoxNm9LMGxx?=
 =?utf-8?B?bTZNYk05TWNhRmlPTEhzZEtSeDhQSWZvcnlmNDNTb3MyWU03WVBORk9xbFQ5?=
 =?utf-8?B?WFVMYnNrR2tnWHNMRFZUc3Uxa0Jjcm1tY2hrTk5CbFczbysyT0pXMGZaRWwx?=
 =?utf-8?B?c3hNU0xZQS80bVRLWjRodHh2aEZIUDRqRlIyRUtyK3hKaTlLU3JyOUYyWWFj?=
 =?utf-8?B?YXdoOXpvRDBlMUdmMHV2ZjRwbXNCbXpURDdHVGYwMm44Q2dYYnloZDJ4YmN1?=
 =?utf-8?B?WTV1YnhDcDZVQXpKWWpybkszc04zQTRBVlpzOUJ3c2VUam1FY0pNRFdhSkQr?=
 =?utf-8?B?b3pSZFRobm1yNktqRnZ0ZUdlMWN4aHJaR2VOUElvMG9DTWVIMjB3UDVFQXB5?=
 =?utf-8?B?V0owNjdUeGNJTHNnZ2RCeEVNeGJaZ2ZaT1oxZ3JoQkk4WnJUdi92dHdDV1R2?=
 =?utf-8?B?S0thYy8wVEEvWkw0Y3RXR0k5UXlnV0JmTU40MWpPc2NWMjRER2pVbmhYQXhK?=
 =?utf-8?B?Yll4M0xTL2lZTlBoNVBpSG11KzdUYU9uSm9ULzJsQVhBaHpKWmUxOEZZWFM0?=
 =?utf-8?B?N2xBTEUyWTBPM3BWTytCV3hGejU5RTFpTkk1Rk5BTTlJeXluSk1nU1I1dXN2?=
 =?utf-8?B?MGJDalNmYlNrdWttakp3V2xMNklZSThxamM2azFCKzRBdDN0NmkvNlhrVnJr?=
 =?utf-8?B?R3EyMDVEeWJRY2wvQXM1M1U5R0JaSWZOM3ZLcnA0RW42YUFtV2NWeXBic0tF?=
 =?utf-8?B?eE9ZV1VsM3FPUUY0bTg3TndLOFRHZU5ZQ3ErSkpXcHB3VFovcXpTcW83SzJS?=
 =?utf-8?B?M1AzZmNjQjhQTjlXREU4WDBFUjkwZDQ2UGFkSVY5dE9ORDc5MlR2OVppaU9j?=
 =?utf-8?B?cUx3S0FVWk5NZzZRK29ueitWYVpWSHZYamFFNExGdzcxdm9DU2lZRGdWT1VR?=
 =?utf-8?B?RGhhZkRYTVdCWjBSYm9SM2NMMFF5UytCZnNQVm1QYTY5Ui83T0o2Qkl1cm5N?=
 =?utf-8?B?NWh2cS81clFqWnNLWkpZdUdJL3Y0ZmJDUUxTc3VySUcyL25SSUFVTmFNa2V4?=
 =?utf-8?B?bCs3aUZoaXh1cVFJZzQ5K1pNWkg1L29OcEZCVHlnbHBaU2I5N3pnOHhPUXlv?=
 =?utf-8?B?WnI4UzhXeHNZQU5QTkJ0YkRFdW85Q2ZFMXJwamtVS09kVWU3L09HQk9abkFY?=
 =?utf-8?B?eVFBOXIreDdJNTFSd1Jid0twSkRaY2RTR21sTmtDaTdVL0hXMkFqUkxYdjBa?=
 =?utf-8?B?SWd3QTZNTHY5TzF6ZjdjYzU4NCtqQjNyeTVSdmRWSmZQdVVNN1pVZ2NCVDZW?=
 =?utf-8?B?ZnJ2S2tPQ21lY1BoVGlxeEY5V2M2SEZJN3g0ZzBXTll6dHkxMFNsdnJLTStk?=
 =?utf-8?B?aUF5ZmdTVnZDUmxWTEk5b1F5cjc1RG1JcjI3cDd6UWhaSXpZSXZjUzRJTGRy?=
 =?utf-8?B?WFFuNnAxWFdZSGdFMXprVWVpMXZJaHFhTUprM0xIaS9Qb3F6Z29yZ3hISGd2?=
 =?utf-8?B?a2JHOVZmS1cwMUhiZWlEL2w0dGQ5QXR3SGFrell6N0JNc0pMM3ZNQlMraWpX?=
 =?utf-8?B?M2J6S0xaOWJlOHFybWtwMTI0cHdTU3I2RUVJbEQvWXVodmlqUmh2TGFEbmh1?=
 =?utf-8?B?VTZ4cXdWdHRrdXZHWXAyOTJYRkQ0TXJrUzZJbFpNamNzbURSNWxnTGYrSUZO?=
 =?utf-8?B?QlVnOEsySCtnckZXY0xiNTlyU296OWN6NlZLS09UUVpQRW4rYitkci9JeTRJ?=
 =?utf-8?Q?U1fFoPHFw2UDRrgYpXyuHVr5r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c64ec7-7cd4-4720-29b7-08db084ded2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:24:58.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nw/1r7aIBe28vp1rDZHwlR8lStUoxr3Yy7CPRwJGxzT39NzGJqiYXEsZCFOV4zqODl+5V0dx47Y8Gxmq8LnzWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815

On 26.01.2023 21:43, Andrew Cooper wrote:
> On 25/01/2023 3:26 pm, Jan Beulich wrote:
>> In order to avoid clobbering Xen's own predictions, defer the barrier as
>> much as possible.
> 
> I can't actually think of a case where this matters.  We've done a
> reasonable amount of work to get rid of indirect branches, and rets were
> already immaterial because of the reset_stack_and_jump().
> 
> What I'm trying to figure out is whether this ends up hurting us.  If
> there was an indirect call we used reliably pre and post context switch,
> that changed target based on the guest type, then we'd now retain and
> use the bad prediction.

Hmm, so far I was understanding that the context switch operation is
solely for guests' purposes; this looks to be supported by the comments
there. If we were worried about Xen itself here (which of course is a
valid concern), then I think that together with the issue you've
spotted in patch 3 all I can do is drop the two middle patches (and
the HVM part of patch 1). At which point ...

>>  Merely mark the CPU as needing a barrier issued the
>> next time we're exiting to guest context.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I couldn't find any sensible (central/unique) place where to move the
>> comment which is being deleted alongside spec_ctrl_new_guest_context().
> 
> Given this, I'm wondering whether in patch 1, it might be better to name
> the new bit SCF_new_guest_context.  Or new_pred_context context (which
> on consideration, I think is better than the current name)?
> 
> This would have a knock-on effect on the feature names, which I think is
> important because I think you've got a subtle bug in patch 3.

... this renaming, which I've done already, may have been in vein.

Jan

