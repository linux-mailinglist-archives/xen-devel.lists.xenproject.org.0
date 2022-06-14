Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCA54B56A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349212.575402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1954-0008I7-EC; Tue, 14 Jun 2022 16:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349212.575402; Tue, 14 Jun 2022 16:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1954-0008Ei-AR; Tue, 14 Jun 2022 16:07:50 +0000
Received: by outflank-mailman (input) for mailman id 349212;
 Tue, 14 Jun 2022 16:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1952-0008Ec-SA
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:07:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218ef254-ebfc-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:07:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5505.eurprd04.prod.outlook.com (2603:10a6:208:111::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 16:07:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 16:07:45 +0000
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
X-Inumbo-ID: 218ef254-ebfc-11ec-a26a-b96bd03d9e80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O80ui5SagyU/xHSt9lcVMRHyzuBjIHUTRJWxtCS9rMhrWhn+eqBkh2ovxxOBrNyMX6bBlymhFJeFu7sA/stInW4hRdhh6Xn03iFuPyT1kSiZZCjqAFHQAv7m96uQSJK/OKNync8XhoMhVCvcBxnDtI1MW1gg25i7D5xqWe3n3ztf58Felv311zWYhk+2rEIdO2bFVbRA1iXlPgsoFlWZSkggQkkTJM+VdFgD/W3RPF7c4+ne3MX/WFNbG/he+ffSOvR8K6SFynBIRTbxVLL43YokrFgdMM4/JRXtLxGiAxxg8fi0/VpTnqhGrjRw5Dxi3qT9A0EPCRF6nwPKl5mduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJK9baG7B8jYSsbe5MfHd8EJ7l5huFSjrZfddjWe46U=;
 b=FtnaRyTokFr7jW6P1nyiavYKvh3h06Vrj+Yd5Zp62SqkC+nd5KF1GrgSaaZOc4J/DYhw4fZjac/I5jav+fVMFS/BBOGzfk0pI7zb/ojnA0iDo24BGvF0tNkB4hrlDQgx30xTDhuLBwgqMUNsVSqtDXqYLxAjNFrbpTlwTRKhhGHKvfwxqkslw+S+yJteTlxnIhP2DtTvA7II0EA/V/w6C3BHHSjhwE+Sa4cNK9zgcxcB9Ygyx+OA5317bM3h9cfOqteaF7OX+4dcbyBG6QI6dPHoYIeCjsPsZsP4O8tPbeQWUSS3I8LGs37BI3Ai+nNFbTKSwghJqV/BqmayO/wXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJK9baG7B8jYSsbe5MfHd8EJ7l5huFSjrZfddjWe46U=;
 b=5i4FCR9N4mnzuDGY1Fp8vgYa/mHUn9H+6/ir2Z0QqM18K0Lgfc5x9yMcJ4xGjRoYAcF1mLd0tdEEAxlMce3oq+OPvUJwPlGEjy/A8QSKRZNosUlXmhpSCnT0vl4BdkXZKuVVcbYcIVrlZqfmVgqGp30O5sGeqkqwKJKKMB2/FGZUrA+AXuy8yQ0F9vBM52ed7ul7n5F6zobHjtdthGF/hxloTkHTnDk608C4y+Q+vNTONhxucOwUiEbiBt+nyybyxJgwJsPhR1tyeoLCazcy+oTChpBW/zQorPEfFdAzAH0Lo+/jFT8yj/jKXCXTmskQQJcYIM9/sl2sC8QvhLEV9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae030a84-924c-bc1a-5069-f7b92896670e@suse.com>
Date: Tue, 14 Jun 2022 18:07:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] build: fix exporting for make 3.82
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>
 <Yqiwrt7j1gzYr72n@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yqiwrt7j1gzYr72n@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:206:14::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16a65e80-1f2a-46de-3917-08da4e200493
X-MS-TrafficTypeDiagnostic: AM0PR04MB5505:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB55050E559CD780FDD0304A78B3AA9@AM0PR04MB5505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l+RuGLOuDPcWcYMmbRv22U/nfisfiQNOTmM84nviuKj1Dgh8bwpZBw4IYeT5medgm9+vFwNbh1ARHybGki4dyIfW02mN7Pur1gvNTscFW8YA5PaDgtCuKeul4WAdtKulDec0oGMO+kOBP+Xcpm9DBps+5EaRN53+fe896OISTN1YuOnSKcEaBZaQhS90FfszjHAM515S2IGEsa55KRSFrTRQ1s9+Bjz5bl5WVmKHEkit6T/rzFV2LdqBsvK8MSeohOyuGH/NXQWyHVkAXH90AnEBXW1e6rxA59qTzYcfTpC8aljD4/MC1ad6iIhjfPfXW3/ft4o663o9h8DeOMey8dFzangPUqkjwDOVmBbaC1W7uc7UxsdW3tCPboGEnqCUycNHi+6pBvnYltb7qYfuzx3R/0DCIC4DYgX/+N9ye/4qsw7ndYUmi9fiUYE/wJ3zhpGgxlL9X6jT9ixnIT3VQzzQwEtvjLlOeSKfu9BwsCYK6CKHV3I3G3FD6B0TPyWseD5w3nElaodMoWbKmLQpzJeZvZJRe8+56YpRv3SU9IZKh4uesJL0I6/nFCvQ06p87Fg3wKGg5+Rri0OFEfUvFMVLVS8p3FACcLGlo5Jht4uPAwKbiplFUldIBwe7ZDMX4J/a8CEia4BJKJl7HRkmzyKbI4xSUNCD89Pgp6R5kVexr6n5VzyHVqMzKHs6oLIq+fUmukUnqNpPwqKkw9Vvkxft9qMmrKW8pcvj3dNaNY9MJOgw7AdWx6+U1vpIT64A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(53546011)(31696002)(2906002)(86362001)(6512007)(2616005)(6506007)(83380400001)(26005)(6666004)(186003)(5660300002)(8676002)(66556008)(66476007)(6916009)(54906003)(66946007)(4326008)(31686004)(508600001)(6486002)(8936002)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bERxMTliaGlzRzB5bGtrTENId3JUb1NhRjBkNzJTd3BxK0tKWGNCYkpBRzhM?=
 =?utf-8?B?RzJUR2x6NUdUYVlBZ05OSHFBbE0yYnB0eXd5T29ZNHVWMDFDaXJrQWdBK3ZL?=
 =?utf-8?B?a3kzV2drY0tGT25ya201dWVrNVplMWtGSndaalVMQnhxQWJqd3RxNVM5bDYy?=
 =?utf-8?B?djkvb002ZWRhYUZxK21qeXo2WFRsNTQrTHJ1SmtOZzhzMzdSbzJYK2RSTXdY?=
 =?utf-8?B?MEljQnFtNGVMRlIvRDYzS05ka1p3SnRUWmxDM0JlYXRlMWxrU1dMSkhRdldk?=
 =?utf-8?B?dkNpbXZTbzA5MHZUR0pDdi92T3lJTVAybVhLdjJPSy8xUUxUNDFsR05HV3VI?=
 =?utf-8?B?S1lvSDl3S29Sd3dhNUlwcDZDWU1NMVpMd3B2RmtUMHRIZW9vQVFNUHNwWk1s?=
 =?utf-8?B?bTc5Mk01UWpSaC9CLzNFVmQzMkVld3dyNXo5dnYyQ1h1d21BT0ZuUVdFdjVk?=
 =?utf-8?B?anlyQmtsWTREK1lyeU9pQnhaYklCazlZeHJhNFd4cExEWGc1dzUwQkxsaU90?=
 =?utf-8?B?Y2ZBTE1GMGtlODg2dlFmdk5yaHhVRVJac2Y2OFNSSEVsSFk4Y0RqeTc0dGwv?=
 =?utf-8?B?Rm1RYjBJdWREb2RkV0g3bC9OaUZmMVkxTDV4Y21oay9TWTZicVBIb01UTVcr?=
 =?utf-8?B?b1kxb0VBSXJmTGpiYW9yU1o5RVphNEpXYVM1SGRmc0xHRitXL2JjUndlVEVM?=
 =?utf-8?B?aXBsUHFIQXp1SXpkaGJSelRFQXV2aU1HSWxGWVBLTHViU1lpWURJQTFPRHdE?=
 =?utf-8?B?NjBtTzdHMlhNajhnU2xVcnJvRm9ZYnFiZ2ZuWWtCS1FUWHZQVVpGMkFib2dm?=
 =?utf-8?B?S0lqK3MxZWNVVTNGU2MrN2JKZllUM1lmVUNXT09UQUdINHBWbWJZdEVmejhp?=
 =?utf-8?B?Slk2Ni9kTlFhckozc01hU2ltU3ZLaVQxQ0ZlM3JSZkdOWHB4YzVUZ3dDVi93?=
 =?utf-8?B?d2poMEJVZndOV2dtSFBqNVA5UTc4d1VMQmJGOUN0dE1HMTZmL2Rja0pSUXo3?=
 =?utf-8?B?anBnTk1SeXlVSXA3bXpXKzU0L0NEbFFYZVVKbEVvNk5vM2xLenk4bmVvcGc5?=
 =?utf-8?B?L2tIbUZqcVNkNld5dkd2UWQ3bytScEl5U0JJVWhUTXBqb3NucVBRT2d3QTNx?=
 =?utf-8?B?b1dkdmJuUkQ5OXp3cnY5VmRDK1UrckR5akV4cE1DZlM0NVFiM2hBbEdtLzN5?=
 =?utf-8?B?eGIvOWFwWC9oR1RtWWptMHNKYXQ1b0ROTDNiS05jc3M4aUJTc3ZXeTc1Rk1M?=
 =?utf-8?B?UW5VTUpMVkM5TWtqSmtBWGRwcjh2TGcvNkZWMnBDVjF0M1lsbUJiNWd3SnRh?=
 =?utf-8?B?c0RERUdTZHVXeEcrL05DYVAxMW9tZzk4c211Z1M3QmQwejUybTlhS1N0K0wy?=
 =?utf-8?B?YWNEaW9mWEIvWHEvV3dUR1BMWXZsc3hRRVZlWHRRUTcwNzB3OXdpQUZhQ1hk?=
 =?utf-8?B?YTBYNE1RQmgyZWFzbnkxK0dHTFdDT1BmOHk0bEF0enJza3hwZjBzWVUzbE40?=
 =?utf-8?B?ZGg5Qi9LZEhzVmdlNVJjOWNTZk1EV0hMQThhcTIxNXI0YURtVEtkbks4dVZJ?=
 =?utf-8?B?emgwL0w3TkdEVEs5blRGMTdzSVlhdTVVY0hqNm5jOGVNdXZiN2JtY3JTSndZ?=
 =?utf-8?B?MG94dm5VUWUwTC9uVlZxbyswcUtRbmV0cHIxcGRyL2FLRXFBUUhsOWVEb1pU?=
 =?utf-8?B?T3ZoWEZZZUhmeHdLUEExeTBrUTZLbk9FZnJGNzJzSXRRTTJXSjMxbHpWUW05?=
 =?utf-8?B?Q3ErcHpDRSs5QkZBUUt2Y2NjdEx4VzdWYnVRQzlOd3laR1VBS0lnSUtHclNs?=
 =?utf-8?B?SkRHb3EyR2dXY3ZOMXN1dmFpamdqMWdlK2VoV3Fsc21wU1lNN0FaT0hCdEZq?=
 =?utf-8?B?QmhvRkFiV29PNXI5VjFRYnRRZHNlT1hOT29sSnk3UHVqUS9rYVJTdm56bFFv?=
 =?utf-8?B?RVF0TUNZTW1Mc3p3SlIxb1c4cGlZZmh3aGZyWHNBc1J3MFdobnUvUEpwVDVD?=
 =?utf-8?B?TnhuT2RrdlE5N1NjRUNDSVlRckRva2VrMzFVY0RXMTZQZXI4ODVXYTAxRXhp?=
 =?utf-8?B?V2RNbUkvVFBnSnhhb3NRWjJNclF4YlpERk1taURMNE4xWEcxYXRQTkd3TUpL?=
 =?utf-8?B?enhKVHlSc2cvbFg5bXN3Uk5md0E3Q2RaZ25FMm5nY3hmRGNxa25qNVY2OU5F?=
 =?utf-8?B?bWk5a3dqbk5wYVlhV2FBMm1BbDRyR2xZMzJyQ1hUNG1rWVMvNjVlVVJSUTRw?=
 =?utf-8?B?Qm0yV2ZOMUtDZW53dmhTajNxS3BLbThvRDV0RzkvWVEzVk1FVjhSYjNEdXU2?=
 =?utf-8?B?Z1RJOWhBRjRFSmZENTB0WXR4QmxhWjJqVnBrRVg1WGZxQjd0MzhLQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a65e80-1f2a-46de-3917-08da4e200493
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 16:07:45.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKf68+QrZmVvlytue+2EeZRejcB/RTvArh1tn1QpUTe93NpX8WT8IcL9LKzjqjH/DgwelnrtSm4QrVZWiiIzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5505

On 14.06.2022 18:00, Anthony PERARD wrote:
> On Tue, Jun 14, 2022 at 05:40:27PM +0200, Jan Beulich wrote:
>> GNU make 3.82 apparently has a quirk where exporting an undefined
>> variable prevents its value from subsequently being updated. This
>> situation can arise due to our adding of -rR to MAKEFLAGS, which takes
>> effect also on make simply re-invoking itself. Once these flags are in
>> effect, CC (in particular) is empty (undefined), and would be defined
>> only via Config.mk including StdGNU.mk or alike. With the quirk, CC
>> remains empty, yet with an empty CC the compiler minimum version check
>> fails, breaking the build.
>>
>> Move the exporting of the various tool stack component variables past
>> where they gain their (final) values.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> There may be further factors playing into the described quirk, as I've
>> also observed that simply running make as 2nd time would lead to
>> successful building of xen/.
>>
>> While this wasn't a problem until several weeks back, I've not been able
>> to identify which exact commit would have caused the breakage. Hence no
>> Fixes: tag.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

> Looks like this happened before: be63d9d47f ("build: tweak variable exporting for make 3.82")

Ah yes. I did think I had to deal with that before, but I did check patches
only back to early 2021. But it's somewhat worse than described there: It's
not just the origin which changes, but (as explained) it actually prevents
the variable to further change its value.

> So, maybe the issue is started again with 15a0578ca4 ("build: shuffle
> main Makefile"), which move the include of Config.mk even later.

Yes, that's certainly it. Thanks for spotting - I'll add a Fixes: tag.

Jan

