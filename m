Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0476F3F5F58
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171398.312766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWeV-0005B3-2u; Tue, 24 Aug 2021 13:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171398.312766; Tue, 24 Aug 2021 13:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWeU-00058b-VX; Tue, 24 Aug 2021 13:39:42 +0000
Received: by outflank-mailman (input) for mailman id 171398;
 Tue, 24 Aug 2021 13:39:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIWeT-00058N-FT
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:39:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24a1ca31-2758-482c-9cf3-0739328b0e2b;
 Tue, 24 Aug 2021 13:39:40 +0000 (UTC)
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
X-Inumbo-ID: 24a1ca31-2758-482c-9cf3-0739328b0e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629812380;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QXLmZKSBjQzLtyoYnt9Oi1eIVRSdWKKbCacrreWnqqA=;
  b=dCfuKgDu8zqgVfA+jTG2uqiaDGE3xwxaWAPjGfB3xhqC+QoRAuwQUNCS
   rlMP0OrqjFGxNkua3y443Jk5MLLpBig77n5j15MxjjQPbKCgb/sr+MIGD
   qtt30R8Uz3rQ7IJVchWcakISpGxAH1GZV3xz6fX8NA/Vq7aEFRWo0LAAo
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ajIP/2OeHlGhY7ipKSbfIncXOOfZT0jslPReZ3YML8T0mbopXb7JEIm2ZW49zEhEceOtlS6V7j
 04eSggSjfs1fQnDB1wOpiXjwFH/NrnIoOtBwzj9fM+AQP6o5DI6VnGq6KX1rviE1l+IK6yr4zk
 wx9kxvdeVWCY3cEucLQ/jPGf3PQVqwNkJzQmiq8vLBhqUefg5lADSE4Npu3ZR0evKYUAL99mzs
 dNa2f+JD0N+eSY6rttKSaEWCS4Fi8dhAua5NB2+TKQ/YvOeg+B3g1RVGrtnmruq2JWM/X3aFqs
 WoP/BXvP7X//B/Ecj/0Xhls3
X-SBRS: 5.1
X-MesageID: 51554775
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0SDa962WO3DZ1MgvtI3VbAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51554775"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW8CCvSV1gMSwvkWS2yT+DA/YC1R88iaudbOh8kGGvP/0WpOu4NOh33JaVFgXF4sxLDtJ2CzjGYChVoQFkTx3vgj0YJT9/cJEcKVIm1KWorw9LH+LmwV0awQDC0p7LfATIgtcofbkJR80zxJ/DW/2Sq8aYvG/wNq0E90R/j2TDXaBZ+lbkeiAMJV5to+qHLqqmYlc9psZ8QI5/hdX6MVQJ7cN6yKNOrDJF8AUO8Nh75wDYDh01aBkyW/JUhF7bk2Iqi47MJ9ewK7Uz62hcxihHNnMO2x2SkiZzWhTj1Yzp2B1ETBR72JMwycM5iDfaNmvcMDGZt9BN9ymh+OH+K/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXLmZKSBjQzLtyoYnt9Oi1eIVRSdWKKbCacrreWnqqA=;
 b=Vrde5BAcO8RhgMWInuXa9zP63p+qSf3bEFpswg52IPQ0bBQWmRvhg0BMTzwRH65HKFsrBKH4Jivl1EaMLTH+szpooLkMaSJ6V5gfhRBrosPSKEZTC+UMja4YvBnS2XIEjdrdZ33BDkrQL4zLPRRf68BAgeKtRKZwUNVpMBZSLvY8n4pfhKJu+XXd/V0fbJ1gANOp1F0pwDg3GUHDP2Wrg7M1Z4UJk8uQieKkttR7BqSqawq2qlpfTOJSmVk9PiT2dckmBruxA9eyLvY4EhMrCINjYPKXiUUgQ4RldM3tdKULSki+c5466Gu+AQCNLaPrj+wM9B7bsi/x7wOnSPkq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXLmZKSBjQzLtyoYnt9Oi1eIVRSdWKKbCacrreWnqqA=;
 b=KosIYLmKo+z+e/8NF2annq4nuXH8onKKy6ZC/cWRGCRy0Ys0wVNyY53EHi2zfJt9FyVg/9925wzw4YG1KvbJVerkimrlpm4gW98y50o8DHqyZJutprTQSEbArW9eHtmDGkVFsCIjRykUkE3+lGwcvAc6MTE65AxrnnwDZwpIDiI=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-4-andrew.cooper3@citrix.com>
 <35356c32-46a1-815e-0ecd-bd2b4b77519d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/amd: Use newer SSBD mechanisms if they exist
Message-ID: <54ea3563-446d-8742-c99a-8eb2b0824ec2@citrix.com>
Date: Tue, 24 Aug 2021 14:39:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <35356c32-46a1-815e-0ecd-bd2b4b77519d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d1f981-72bb-4bdf-dd5d-08d967049c1d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46148E954770A0040474A9F9BAC59@BYAPR03MB4614.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3XpwiTu11vX6V2DQofiKglFFoV2NSkIIC4JLJ1vAhtVIQTrAuAdwohE5dBlPayY3DDOszgltbl8aCBhqJdxkQFQQ6zvaQC9Bs1SGRjhFVHvr9u6IPTvxXC5sdz+oz3U9mxwiOjaWgnjvwTHILovfsj6NrS1KklPxFLfMKOSpFPqjxTlLXyuL2jQ5tUztO5FA4M/ynVJqdxNfbaohnWFK5HpvYKOge16DhLPkUkJMTRw57uuFQ/vsryNmvDU+BQvsy9QeOrVxHPxxwdk3Ilz+ZMdxaAf/zanFMYZxG43F7tGW18I+sMsaMdegVPEH4LBWSV6Npdy74Dg+VLcAIXkUs4gtUli5L/A/xYfxNKF8Sp/15ShtYoZDfx4qrO5ObIpz3ltGtH3uNQR6f2yRlc4P7/YBj5SFUX++wFFGttHtAiNhGXO3OvCEm9630lzu7tofmQOUqfOYE/6xMl/O6Giso9poimX8jGjsJi9hnUB9egXIjf+DNZ+N0HX4KAfkrlgmxASmig9hFPSksVIrIZ6/VzLOesUKEdu9Biv93e7mtdCfyL+TOP/3RFBaUDnB/7zoXMSXn49JHpeVnlhGQVbZ7LqUtMd5aZnnJMis+5yasrT9aw7cUgEmS97AaMyVQcAI6uyAJBeNaX9G4Mm4AIzLyEN9iYqMogutd2yBiogK/Gyk7CbfLcx7bf3HTUU5XcrC504LhkWPm4KcluPFNDB4cR6KoKw6zp5Qg29ADNuYdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(956004)(16576012)(31686004)(316002)(478600001)(36756003)(6666004)(2906002)(4326008)(66556008)(54906003)(66946007)(186003)(66476007)(26005)(8676002)(55236004)(8936002)(6916009)(5660300002)(53546011)(2616005)(6486002)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJsV0dBd2w5SFJqZjVQNDhiTkdPTHlCSDZWbzlBZVRMVVdHdTdkNFpCQ25U?=
 =?utf-8?B?Rmg3NEdVa3drMG56UW9QNW92TXdOVlZOYklyYlhFMnlqMEZLekwrZFFRSUhE?=
 =?utf-8?B?RzN2dEoxY2ZJK3hlU05qLzh0Wll0Z1pucUFlekRDNXZmb2xlRXFwRmt4NmpG?=
 =?utf-8?B?RmtMSHoyUDkwbjFTY2JQT2xSMlUzSFJTaWZnRitWUENwNEkwa01SRTY4T2hZ?=
 =?utf-8?B?QitvUWZzYjNhSVg3dXJtZEdHMmlmL2hyOG1aRXdMY29NNnpkeStQWXVOV0Y0?=
 =?utf-8?B?aVJkdWVjWVZ5b3RuS1Ywczk2Ti9GRUFwK3NzZkR0RXFwUzNYQnU3RVhjU0Rr?=
 =?utf-8?B?RVJEbktXck5TeExidTFYc1JBQkd1YU9hcXgxUUw3aWFiOTBOVzR6VXFHUVcw?=
 =?utf-8?B?cktKSTFkM3BFZ3ZweTF3aVgwQVFsVmZSb2sycEE2Z1hmNkQ2TjVWd3RFNXMz?=
 =?utf-8?B?YW9ZVVZXRmIzcExVY2x3bnJudWt2dHZPSGk2T2JjaXVPOUtiZmM2bFQzdmpa?=
 =?utf-8?B?UnRMaU02RmhtNkFmZ3VOSkFTd3ZNMWpsQzZHNkZXa2VnWWY4NkpIWTFtaDV3?=
 =?utf-8?B?YmVqSnFjT1hraXNBMVQxU2laUzhqMUZ0Uysxd0ZxWFFPNS95T2VPdlNnYzlB?=
 =?utf-8?B?NGovUGlJK2ozNjlVNkdweVJVK3ZXWGlwMWNPbk80U01seW9yYXcrcmxGWmhn?=
 =?utf-8?B?RXVqUWFYQmpuTHI4RVptYWp0MDFaTWNqdUdqMjNVMzJBRldjWUxQZWZZcHJS?=
 =?utf-8?B?ek14bzJ2NmRoR2dDN1FhUnp0N2VHTTZSZGtqcE5kSlV2U2dicHpCUTFRT0Jq?=
 =?utf-8?B?WW1nOGZmTnlBTUNUZitDU2FuNGFUNUw4bGR6TWVXZ2VDNjBCS1dFRTZIc1JF?=
 =?utf-8?B?Nytqc1h1OTZaT2Fmd1g5UGQwWHFMNXgyc3lXbVpCajR6NkRKa2hESWhwNGZ2?=
 =?utf-8?B?S0dKZ0poeXdXUDNBakxYUUhWK0h2SlVSaVJSd3BuVlBlWEovalIwTDVuL2J5?=
 =?utf-8?B?a09DR0p5VXZjSGUzODRtSUxBSFJ3c25FazhMblNrQ2svbjdiWVZ0bHZBNkw0?=
 =?utf-8?B?blZSZ1l1YWpYeW9IYVNjNkJwNnkxUVJHbmVKR3daV01xaU1GYmN0cDE1U09V?=
 =?utf-8?B?SDhZdlYvbEYrczRjQUxxNm41WER0QjhsYmNSZzZERlRCalptTE1SLzNGYlFo?=
 =?utf-8?B?eTZKVURCZCtXdVQ3aFAxSlE1dWVleDNBOHRxblZZazh3ZFBJTWRQOHVMRVph?=
 =?utf-8?B?NERzMWJ5WkVzVVpCbkU0MEF2YVRDYUdSUnV1R041S1hwRFNwb1p3cjcweXpH?=
 =?utf-8?B?a3IrSTVSNkxtWmpWU3FGK3JNdEd6YWl5TE9waWU4ajBHZVNKOWlNbExRdkVa?=
 =?utf-8?B?Z2JMcVVMbGFxMmJWRk1JbHcxSGZ4aTJZaE9wRFRGWVRXU3hmbjJ0R0Fxelg5?=
 =?utf-8?B?U3RnMnlGZmZiYm1DN21CQS9UeW5zcnBVSGpOMVJRZUlHb0tqa20yRFdWMHRI?=
 =?utf-8?B?eUp4QVpCcm40V3pDZHhTdHZxaFhiclJ0RjJoUVQ4T3RtSGhxU1h5Qy8rTmRF?=
 =?utf-8?B?V1dONERFZWR4cVpLY28zVGhjUmZyQ1l5dU51a0hRNHR6UWkwYThlQmREL1Bw?=
 =?utf-8?B?M1hnQndIU3pEcFpCL3BFZ1RNZ2E5OFhKZFIxSTluOHdZdERsR0ZIb0ZMVE9l?=
 =?utf-8?B?RFd3c3M5ZWJDRHl5NXRtdWliMGx2cC9OSXZlU2JRSzUydHdLS1I2emwzNU9W?=
 =?utf-8?Q?XbutMgr+b10QIvO8iN93AUZc29njreRFsYHNhd6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d1f981-72bb-4bdf-dd5d-08d967049c1d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:39:34.7698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uySP8svZ+dUQ/IlKEuQM9T8WCRoTjfxMMpg4bl/YkDRDie4WV7l9b0iRIyBl9FTqEiocD1PXZ0tq1dQlKivz0/Rb2RWd1ueZcXR3PA9zXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4614
X-OriginatorOrg: citrix.com

On 19/08/2021 15:59, Jan Beulich wrote:
> On 17.08.2021 16:30, Andrew Cooper wrote:
>> The opencoded legacy Memory Disambiguation logic in init_amd() neglected
>> Fam19h for the Zen3 microarchitecture.
>>
>> In practice, all Zen2 based system (AMD Fam17h Model >=3D 0x30 and Hygon=
 Fam18h
>> Model >=3D 0x4) have the architectural MSR_SPEC_CTRL and the SSBD bit wi=
thin it.
>>
>> Implement the algorithm given in AMD's SSBD whitepaper, and leave a
>> printk_once() behind in the case that no controls can be found.
>>
>> This now means that a user choosing `spec-ctrl=3Dno-ssb` will actually t=
urn off
>> Memory Disambiguation on Fam19h/Zen3 systems.
> Aiui you mean `spec-ctrl=3Dno-ssbd` here? And the effect would then be
> to turn _on_ Memory Disambiguation, unless the original comment was
> the wrong way round? I'm also concerned by this behavioral change:
> I think opt_ssbd would want to become a tristate, such that not
> specifying the option at all will not also result in turning the bit
> off even if it was on for some reason (firmware?). Similarly
> "spec-ctrl=3Dno" and "spec-ctrl=3Dno-xen" imo shouldn't have this effect.

I messed that bit of the description up.=C2=A0 I means `spec-ctrl=3Dssb`, i=
.e.
the non-default value.

We do not disable Memory Disambiguation (the speculative feature which
causes the Speculative Store Bypass vulnerability) by default (due to
the perf hit), but if the user explicitly asks for it using the
available command line option, nothing currently happens on Fam19h.

~Andrew


