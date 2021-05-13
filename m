Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43FE37F7F6
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 14:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126920.238491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhATH-00013w-Gk; Thu, 13 May 2021 12:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126920.238491; Thu, 13 May 2021 12:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhATH-00010b-DS; Thu, 13 May 2021 12:29:43 +0000
Received: by outflank-mailman (input) for mailman id 126920;
 Thu, 13 May 2021 12:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U61U=KI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lhATG-00010U-Ma
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 12:29:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbf6bbc8-4547-459d-b6b3-812cb1cb09c8;
 Thu, 13 May 2021 12:29:41 +0000 (UTC)
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
X-Inumbo-ID: fbf6bbc8-4547-459d-b6b3-812cb1cb09c8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620908981;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ohf7UPG1S3BPgYS665xHfBXuDMNUeU7vCuoEhzzTtkI=;
  b=YSfwg29bvtaH38U6KrmzRLZszaD/faFal/U9leGEGJlDueV6NfaiFWlc
   TcW5aP95A5PZXsA8Vw27aMFNhGZctQNbC+jwj4AO08pip8XVFvnLRxrp6
   WPKcgSRppz1+ApIYSA+fsuudssKmjHaQy8TE0GOHs09fUYGg83MqImPcB
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GpRorewRqtZcOLksbPnldzKs1Pqmxxw6RL9wXSCQ9ItNxYZQ69qLHHL8cSKhBZF0Gz1cjTwxC7
 oH/224HspcV0JUlefJEdH4eFI5psDR42B4eVKkEO8nLTO/RA+la/Gc7oyhGnAkyCyKjSKoSuC0
 pSnHb2+QJJCK73jt58WD2B6Dviuzf1wIK21hUw5XSXC9CoDHZst4N95OUfBFL2x2jb3ACZRxRp
 FYx7S1qLnNVwqpZNuRSVtSTl5gWnK0IG95c3PLJLKf66WHdnckm8mXtYxlHlF8GNQVcvAvW7tS
 YE4=
X-SBRS: 5.1
X-MesageID: 45256819
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZWQX76nNVAUtHk7yNlt3Z2bgKhjpDfMpimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIYOrIouP3iZxA7N22pxwGLXAIGtRdBkVCe2Km+yVNNXl77PECZf
 yhD6R81lidkDgsH7+G7i5vZZmzmzSHruOrXfZobCRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y74gW07R6S071m3P/ajvdTDs2FjcYYbh/2jByzWYhnU7qe+BgoveCU7kowmt
 WkmWZgAy1K0QKSQoiJm2qp5+G5uwxer0MKiGXoz0cLmPaJBw7TUKF69MVkmnKz0TtTgDl+uJ
 g7lF5x+aAnSy8opx6NkOQgYSsa3nZckUBS5dL7sEYvJ7f2SIUh57D3r3klXavpIkrBmcka+b
 5Vfb/hDbBtAAqnU0w=
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; 
   d="scan'208";a="45256819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yj1xG/IaZc3WGZBEK/U0+sELdXf1JuhhtHyMN2kLvAgPt3DG0QWEHf5fR55om5ia9SKRAYeXOLHV2xgiuVIiJXuu3K4BWCQnBoNVfzZYv73U0MBGCTh8A+oY25gCdZ0LYx8VvC/fIyKFsI6VssymTYRpqmmF1/n0+K08xR6T7Yb2v3MWPr20/izUaZB1rxZqtQA9tM7kC2/+Glr2rd5NoNVh7r8LTLJGkIwTPqJKcs2fAYd/UStjBXWbt+rYtYzfnSoR0ot1I6lDzFO7aJ1aZAewFmhPX5BrAnGw6kr4LUZ289au9InMyDVWTvokYdD8kZ4Bl3NkDH3Qm1F0uvzkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohf7UPG1S3BPgYS665xHfBXuDMNUeU7vCuoEhzzTtkI=;
 b=MwKigK3UxN77xZ9VW8Vkng0Nibrs2Fus9Hmkodjcc2TqKw8EZ/qmfgbRTdjkRx0e/Zaor28WeUTc59vH7Z+Ft4ZehNGOqxlXHftlguxFpd0syuI7txdWhY6BhnZ4v663k2g/IYijief6TNwnnhfpWO9XxusyrTwVWfjLkP0zmnqk5y0z0zZN6EUjIqUSKX0OiX1R2gkTV1SVGWmFS1GpnJ3AHQEKTKVjGz0h3z/r7R5UQO3HS/oPLuqCnM3v2PJUPbljG9sbSzWBYJdfFJUzEyZijNt6l4K1yDRZpjLaCXO3XLCqi73H8qtMQdpBuJNy04zYnXE9urPMtplwVS0nFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohf7UPG1S3BPgYS665xHfBXuDMNUeU7vCuoEhzzTtkI=;
 b=PfdvSxOwDaJmX8oFrOk2slQ8n0nh1sGDhjnxXr62vrODmMAoToDpMprhj78cFPIV2ISyNETWk22rLLNJVWNvi5BW9Nb5OmMqHjJq2cTZUEdbDd8dqcmAq0jWKBgKYlPnM8uIbHxjua5/ixo/LeXAMxiZ0wmtO1inQvsBu5LfpGI=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
 <378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
 <20210513142229.2d2aa0b4.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
Date: Thu, 13 May 2021 13:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210513142229.2d2aa0b4.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a359349e-efee-403d-8ea4-08d9160ac62f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4485:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4485160F4E52E24FF3CF9A85BA519@BYAPR03MB4485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXyVMW88ttiyT1f7eDSrWMt1J1pRR3oA8Ym656p2zPaLZSfdCLFfAvf5wQVUf8JLgLuqDQarnZ1znq7Q7E43JF6L9DkgCrScaQXM9MfLd1ZkKcQwyEPuOW4tV8+zD2sI8Ug7RitVXcRTRR5MBLjhCjAqZP7Y7esrV0iYXG0EJ4JD5nYZrsGZzZzKhqexKy7jQoMbCdb0BhhCUQRaXc8YCU8jKVZiF1VzSENLZ9bU2/dVCwpmDmLNfCfKrwhHf5eqGroG+FL3UVMf/TDGF6IFTh+omrxrbObbw5B/+ZUFWY6gX+Mo6hc5xJT0NhebN7TJSoHACR362LoQCCLEOhk2tJaPz2KCoW/DWBkfqSdpUKf2xJ78maRZ7gHsSxLUhwtv7iXjA6o+g96HWF83SUB8eV9dI/YJ2J/HZvrC/ozDN8YmH257NP4NsG5f/XyJIiF/5BINU1HkivdeolPru7w0yyqf68bpBFJSbQ2fLjLfYMVTOpH5FmmG+3Z/yHhXjeqOuJUuVJLcyNoC3w6bqjZJVLDaW2/o979y8STzNNzj8xds48YnxcvieVXvO8An5/ej0hCBt/ycK4GFPgK94L9A5kGZ0om0GpwzreeTU5GAlDdlo5vQLT17d6eP+BR4Nu4tnWruzyc5M/OUp8biNbmEWuvEVQz8kbAddTizeE/JL8oRLVa6CIb39xUkbFC7GeSs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(6486002)(31696002)(38100700002)(26005)(6916009)(83380400001)(2906002)(86362001)(478600001)(5660300002)(2616005)(956004)(36756003)(186003)(16576012)(8936002)(6666004)(16526019)(66556008)(66946007)(66476007)(31686004)(53546011)(4744005)(4326008)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajg4ZkN5YnBvdmZLV25xM1lUTU5wa3d0bGlMbGhXS3Y3TzQrN3lGQUJZTUd3?=
 =?utf-8?B?SGdiY0FiNDRyZ1JyY1ErbEhxVmNsbUdBUEhhYS8xam1zVzlMTXVNVFlRN3pM?=
 =?utf-8?B?Q0Zpb2NpT2R4NVlDY2N2c0p0M3RGLzZXaTh6WHB0QUVIaVc4TllQK0xaQ0pF?=
 =?utf-8?B?NUFIVmFoMitOWmJiR21BWWRLM1BSNnd4NUlKV1FUY01SYndBZm1lbnJneHpZ?=
 =?utf-8?B?Y2lBYjVOajdCejJ4SWdNRVBZVDIrZWJFdzRRU21rdHprZk9GL25mSTdGUlUz?=
 =?utf-8?B?a3lpUDZHQ05uSlRVNUhnQTJFcVpOcFM4ckRqTGNPcTA2bEdDcUNCTThjTldG?=
 =?utf-8?B?a1V6Y3k3TDNsZS9Yb25kRHo0dnFvV0Q0dVRhSnZFdDJpSVFIQmZVMkd1a20w?=
 =?utf-8?B?ZVZGSXI1bHNKdzFJU3pJQ09wbmxOdytjZ2hPMWZvRjAzYmVsQVZ0TG9HWitX?=
 =?utf-8?B?ME5PQ1BRTlVYWEQ4QllDKzRtMVRaa2wyQXFNTVNZUHN4TlYzcm1yYy9sVjVZ?=
 =?utf-8?B?M1Nwam5veEJxRWFqaWZnYmxNaHZ2VFNMUTV1NnpoVW5jaTk4ZWJ1SmtXeFJa?=
 =?utf-8?B?MnZOOGt1NDY2VmZQN1MxS2dOaVZLTWYyQk9aeEVFN1FlTWt1Wjl3MVF5RTFR?=
 =?utf-8?B?VlpFcWlqTDRoZWZGaDBiUFVnb2poYzhSbzRzdDIrY0MxVVY5a2FVM3U3K1pm?=
 =?utf-8?B?SHVmK0ozWkp3NlBCK3N0YjFDNFgyUjNWY1dnbjdWM1ZIK1NCQWhkWjB1VmFs?=
 =?utf-8?B?dy96Y1BLNzZNbCtyM0taQkhTM3FOVVB6Uk9ieDB6dFpMZ3hkWk5RRG8wRW5O?=
 =?utf-8?B?cUtYNEpLZW1ybWU5QkQ0bVBxWWxOaGhjSGoveStHNEs1clllT3ZQTTZGcHlF?=
 =?utf-8?B?c2RTVVBuTzJLWkVkU2hKcnVMK2RTNC9GY25QZndJd0JHSWVrcVNXSWNYcW5v?=
 =?utf-8?B?Z1paMWYxMS9sOEpxTG51MWRLOWhBdGJxbDJURTkzVU1aT1BtRmo4WEJZSzQ0?=
 =?utf-8?B?RkNja0pQSFRMYTJwakIvSTI3azFMTSt3WHo0Y25BYS9iQkk0QkxrV1M4dHJr?=
 =?utf-8?B?YmpXS3FLKzdiK3BNbkhOdDl5d3pjb3lXVmUxMWllNksvYUpSM2hhVU9XOGgy?=
 =?utf-8?B?dm9tY054WGc0TWRCNk9VTG9OZGRHdkpZRUNlMEs2Z1pQU0ZBQ2NQSDM2Tk1O?=
 =?utf-8?B?a3JYRlBGOGRJV2E1c0N2RHc3RVhhV0FhTllURjh0amZsdGd2dTBKMTFyYmg1?=
 =?utf-8?B?cXhyRG9iMWRPcEhLZitVL1lOUnVMNjRDc0VxZ0RXYTZLWHdHdjdsRGozRXhX?=
 =?utf-8?B?ZzgzOUdrL3NXRWRNU0d6RlNUbUZWVXR5Vnc2UHFxaVVtaXRRMHhCMUxnYmIw?=
 =?utf-8?B?MkRpdkpScm1aeHcvNmkvSFdkbW9xWXVrWlZtMzJsRjFkUmhrd3NVU3pQYkVN?=
 =?utf-8?B?Y1dseGEvME9Vak9XNHpDZlVXQWwyZ2RVR2N2MVpxRlFhYXJzNEhzSEdzR0NN?=
 =?utf-8?B?ZDNQT0FmWXJLUFJKd3hlZnB5NjJXUkZ0NnJqaDlGTmdVUDcwZElobjJ6WWJM?=
 =?utf-8?B?Q3FhK2pBRU44ZVkxRUxFYWE5MVVnLzRpOGs4RG1QWHN6RzFkcnkxM0cwRTJn?=
 =?utf-8?B?REJIZ2t4aHN1b0dlcWV4cHZJTTk3dFhFOEpaODBNOUwvaElvN2FzWVhxdGJz?=
 =?utf-8?B?WWJTZWxXTVVOeHA1aGF4TTdmZkdxNHhDK2ViZjYxc2NsSzBvS3phUXVzT2h2?=
 =?utf-8?Q?vCs9mBzhQ/PuC3Wj2Gh7K6MPeehqeXYXdaSwbfB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a359349e-efee-403d-8ea4-08d9160ac62f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 12:29:38.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXDQw7jlyvwhj2pOQyCjoSAgD6Cregsy0rGhdeqt6dK7kf4wiXmbjy5z1ZnEnARLc86KTa7Yra+yJDa1kxqjAivrK3PdJSEjCA7XkdxnMWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4485
X-OriginatorOrg: citrix.com

On 13/05/2021 13:22, Olaf Hering wrote:
> Am Thu, 13 May 2021 13:11:10 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> If I'm counting bits correctly, that is Xen rejecting the use of the NX
>> bit, which is suspicious.=C2=A0 Do you have the full Xen boot log on thi=
s
>> box?=C2=A0 I wonder if we've some problem clobbing the XD-disable bit.
>
> Yes, it was attached.
> Is there any other Xen cmdline knob to enable more debug?

Urgh sorry - I've not had enough coffee yet today.

Warning: NX (Execute Disable) protection not active

And this is an AMD box not an Intel box, so no XD-disable nonsense (that
I'm aware of).

So, the two options are:
1) This box legitimately doesn't have NX, and the dom0 kernel is buggy
for trying to use it.
2) This box does actually have NX, Xen has failed to turn it on, and
dom0 (through non CPUID means) thinks that NX is usable.

Can we first establish whether this box really does, or does not, have NX ?

~Andrew


