Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96995310924
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 11:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81580.150857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7yQQ-0007dq-8c; Fri, 05 Feb 2021 10:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81580.150857; Fri, 05 Feb 2021 10:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7yQQ-0007dR-54; Fri, 05 Feb 2021 10:33:18 +0000
Received: by outflank-mailman (input) for mailman id 81580;
 Fri, 05 Feb 2021 10:33:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7yQP-0007dM-0N
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 10:33:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4313d5ea-b0e1-402b-8c21-fd777791c127;
 Fri, 05 Feb 2021 10:33:14 +0000 (UTC)
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
X-Inumbo-ID: 4313d5ea-b0e1-402b-8c21-fd777791c127
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612521194;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Yk+9SVcFZXJKfIzm15IKOvJ062xTXMZ7E/og3oxBvQo=;
  b=f/l8v8Me72TwM+2jAu5aQ9DAWQkPOV16aV0CwDs0S5lCB9rjAltV888U
   mvDqIo84goT8xyIWrIdco5X4Yj9Sz/2A2/9YR+5FJ2mwvTzL5mVwFdAHR
   +PxqY1IPpMVBdkLzynhUQ94eUvItYZXUR1Bzz0QBgJ6NLdSSi99tPZaVJ
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ttwBhKGBOe4P8Evt0nYvbhIHXX9QqvJIQf7DQ1vOqR8cSoQ33Vj3qkJFoQIztPOFPNJHQCcU6+
 PTaWFY8V2EsEPInI+TLsY+uH9qZW3RBps8QCf4AjcHITIw0KDZeCbxWcMzBLz80/erIM+goTqU
 HXPzT1ibwZeFbAejPIh4gnF2PP202S67MbszXQqAVzvRjkwuCqppUI9ZXZgrZnig91bhHvky4G
 2l82H4WSMmB9IUGbID2Z24mQFGIouSzXUWinPN/BowCwaiwFFocj3BLaHFpYWaWLvejllcYRuU
 0Vs=
X-SBRS: 5.2
X-MesageID: 36833515
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36833515"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSDF0CvYPnhN0EybmxeT+CmH1EL27x7EZaFDFlVfUPZoQhNh2WnFQsHuwtXGtIQQ8L6m/qqA4h8sNKlhxXIDqhk6F94qOdRuWukXzwJ3qOs4ZJNQBw1gDlxTLxEtMPEVCc1saM1Sv7FoRupjXAsDrjHLbxnEADwrO5zaBsRHa87yobQ7baOehla6MYG4mUbPkJhxMbRGg7/8JYAF62KRQq4XPaAWlOfdZhSoNpXqwIUp1/fSNuxjmTw2ZLvRiZhRjqiZJf/fgWrerwybNXDQd2qqAbkpSU6IZPxrAZK+z/cNEYccdL8dP5dGUapMyYr3KP+VjjbpceLIDOqJ3ta/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t1y/vW/EGERf7/B9L7HaSU5tqPV3o8mDIH/V5sGE/U=;
 b=P0FBsMOuduL+RwdNsWv+rA7weKhzEkQeGakjik6zeJbzMzEQvX2QUQufrlD6n2V0lC883hTKbImxl9xb/ec6S7+X2LiIwyUavfP0skmSc1nzoRvibU3V+BW5Lj4O5TyTNT2ocPJQeQLrtBprSzV4MRlIWR9PQZzB/H2lYnQ74EDNnrhOF1tlNlcQid66SXaiEAqjR4VwlifkrNHow60hscxoBQwufhgPC7brSg2S5RzgQ+lm7Y/irY3hIurUsQcYajTLM5bED0aEBA2YZJrx+qeDY28npczub9FGM5718Jwyu1g6xDoIom8TfoxAn4hx3j73jBIAcBWCO+mIkkQ93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t1y/vW/EGERf7/B9L7HaSU5tqPV3o8mDIH/V5sGE/U=;
 b=vcPdSJflPFdNZag6D1sauLwsQFxgHXW+XEhUXN3FQcW55gCFjnpjjlxNGejni8DzznnO0+OTqXO/MsPnUSzPvUZx9dG0mCrpWj5cWlFLmosDB+gcfL6sUfaqNG2D62DDkO20sRcK4svHwGWOw43kgyVLJoVvvOc2ChFLiRMdUMM=
Subject: Re: [PATCH] x86/EFI: work around GNU ld 2.36 issue
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <e6d59277-35b2-e7df-0e68-a794c8855ac0@suse.com>
 <8450b84d-93f2-7568-362e-af27954e5157@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <881b97a1-a4e3-f213-f81b-ac07ca46ed27@citrix.com>
Date: Fri, 5 Feb 2021 10:33:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8450b84d-93f2-7568-362e-af27954e5157@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acca0212-23f5-47bc-563c-08d8c9c16d53
X-MS-TrafficTypeDiagnostic: BYAPR03MB4726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4726666B40928DDC1F7ABD79BAB29@BYAPR03MB4726.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tc8FHiTMl1fAM/DG1RHMDlA2QlewlpkaWfzhoPgNLUJWiclGG4PymoIIPtW+Eb6X050sFB/Rmn3M1ANvma3Knn51wDhiOk2NBe1MbdaEXBb+tSeGtqyjHlnws6zukTiKhmV1iqzkxGrzZerc/xS2iLvI/kiAPUson50fdtCO8j2v00rDtr0fdiJ0QlBG6bwGpXUfpJ+uRtCG3Iv9bFJoM+OC7+Bqtvc5VqSDuL77yxdSVpf1DfrO0XKUXP0FIWsMvatLe9PeSvX2b7KbEJbxyKJ+aDXc0Ea+CSAs6AkoKSS3Wn/9XGQAP6r98dyRR54jvGtQ/8a1ESmyJ9jDwp48pQIjJi7x6FMDlmw4dJRGO0nZXzvRbBbSMZKrXg7FB3boS5j9o0JZ5gXEehBEEu/pAVywn9etl18PNe3oOR4pE6dqzoIB/qItpuhguyNgR/KZcRy5c2zFDou1+cUg77XP2oYI2yPQ37UwlalqkDxbln2Dg7lLIOvgW23sZcmrraWnt1Xawpxvv2ZBZx0OGqGp8y4D2kgard5iXDjEdQ6pS1KAvSL8yXj4ZWvpBOSVJk2QvlHh19p8kVvcWgL2JG5C5wRshmez+4xyz/ZqSKHYXs4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(66556008)(66476007)(83380400001)(66946007)(5660300002)(478600001)(16526019)(4326008)(186003)(2906002)(31686004)(86362001)(8936002)(36756003)(26005)(16576012)(956004)(54906003)(8676002)(316002)(2616005)(53546011)(6486002)(31696002)(6666004)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGRuTWZzb0ZxZ3g1UkpQYjNVczRkN2Rvb3dCQzFWNzArUks0UlhhVUJFejQy?=
 =?utf-8?B?UzlodGVLMXE2aGhmMlhRK1M5QjZsYjU2SmtQN0psUlE2SEFMUlA2VTBDNEli?=
 =?utf-8?B?UHFPM0NaWk5Ra0QvNy81cll6MisvM3lOaEVSZmNGd0hrWjdnQzFxSHJHY0hr?=
 =?utf-8?B?QlhRMzFoVmQzMHJVeHVDUjJSR1dvaXQydDhTd0JxOE9vVmVkZmdPNzU1UUN3?=
 =?utf-8?B?S1NLR3lvazlqSVV0cHU5MXBVSUt3czVyTTdDOGxTV1Rac2RkbG9jZTkxMjl4?=
 =?utf-8?B?Siszb0VFSGRkb3F4STB4OXFwMkNxZDJETm16VXM1OVJQZ3E4RXFJUkE1d2py?=
 =?utf-8?B?L2xEclRkV0p1dUJjSzNpWUY4Tkd0OGZrZ2RacDhETS9scXJ1aTEvQ0liWnR6?=
 =?utf-8?B?cTd1eG1XK1JIcnhUeGJzYUhXSytZUUhMWHhQQnlOaDJyOElVcUVUVktDRUtr?=
 =?utf-8?B?N0x3OFJHTWFBVTVPSkxUbkhaM2xzbW5zeSsxZFNiSVl2TjVFQUFMYzRGeXNl?=
 =?utf-8?B?M1F1aWNTbU1YYTJpMWRCSXc5V0Y5dTRZTDhMVHlleWhDTGlzQk9qdEhZSzFs?=
 =?utf-8?B?VnlkN2U2YTNjdE5Sb2hrMGlPN2Q4WGYyRUtURnVnYnR3V01iN2pkbXBPMkl2?=
 =?utf-8?B?WW9Ha2xJSk1mWkZ6N0VDdTdmd2I0MlFSeUlmdXNZN1l6NjVUaGxrSTNxK01H?=
 =?utf-8?B?MzQxVnh2OHh2MXo2TVFiSk9HT1UzOW1JNUdhdG5McFBrOEZwYXFYTkM1Nk5X?=
 =?utf-8?B?MXgrTjZpNForekdwZ2x4VVNYN3I4NEhHK1NrMno2djBhMVM1V3JYblZ6QUVH?=
 =?utf-8?B?TkR6U2QzM0g5ZVNxazZ1SW1YcS9WQlNqRDVtMk9jVFMxZ1JJVlpYMlFSVVdq?=
 =?utf-8?B?ZUhsWTMya1RVVzB6cHllUnEwekhWMjZDMEtGaDRDRU9zWUswZWo0V1llbHZG?=
 =?utf-8?B?cDRlUFo4V1VOR0pMLzE2N0hPRTVSb0VGLzFvelRXS3VmeGszOXI3N1FGMG84?=
 =?utf-8?B?U0k0Z0pMa0pHVE1HYnIvWGlkMGQ2MTJzZDl5YjlkMDJQQVphQXh4dnRzb0Qw?=
 =?utf-8?B?SkVkdDQzWnkxUEM2ZGRHdWU1ZXA4TG04cW15RUw2eFpSTUVXZ0tMdEsweUN5?=
 =?utf-8?B?L0JnaVFnT0F6Rm1FdGpYTjNSaWw3MWFENW1NVjNzV0xPSHQwbUNlT3lXUzdx?=
 =?utf-8?B?UlJGa0Z3elJzMlNrVE9DeXZQTzllVlZYVGFOdTArNlRSU29rNjVHMzBVcDVB?=
 =?utf-8?B?ZGdLSDUwVDJxSU4vdHlqbmdhQ25Rdy92cmQxeGYzbGlxQWY1a2FhRytoWXA5?=
 =?utf-8?B?ZjZ3cEFyZjJjTjhDc28rSkhxTEYxcnArU3laVmpxb1VGQUNINExOZjhzd0Zv?=
 =?utf-8?B?WWFUa05ENVdUTnFOdFhVR1BFbzlvODJEYzkvd2U0VXQ5NjRGUDFNOTdMOTJT?=
 =?utf-8?B?cDk5RTY4MDFxTG9VRzl5OWY0UUhISmJUNStkempBYVU4T0ZkaFl4a3ltSEJJ?=
 =?utf-8?B?dkZoVVhtZGVmWGNPVE13aU1mNHpZQ2ZCUk9rWEdGN081Z09pbmtmNkQrcS9x?=
 =?utf-8?B?V29jaXJIblQrK3JZV1VyNUcrN1BHM2hsV3Z1cXFiRTE5NGR4dE81NTdxS0Ey?=
 =?utf-8?B?ZVZYdGJ4VGNsV2JYQ0txU2hpUldNKzNtelEvWVRIc2libUFxMExPYU50K0NR?=
 =?utf-8?B?MitrZTNXV256SnJZLzl1cDZqcGE0NzEwTUkvcktsVU5uZDQ3cyt2MWVCc1VU?=
 =?utf-8?Q?02QIPDOSMcdbvRUPfFXOq7XCjM3+uo975XqHl0D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acca0212-23f5-47bc-563c-08d8c9c16d53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:33:07.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0MWxunAkLKhfyvBg7BxUVAuRhLLRWALF2X9omH26uR9zm1Gtw/rR52FRDoRg5LYdGoiKy444ZuPednxRx/fA5VYHL7K6unK5Y1KUjJ2fqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4726
X-OriginatorOrg: citrix.com

On 05/02/2021 08:11, Jan Beulich wrote:
> On 04.02.2021 14:38, Jan Beulich wrote:
>> Our linker capability check fails with the recent binutils release's ld:
>>
>> .../check.o:(.debug_aranges+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_info'
>> .../check.o:(.debug_info+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_abbrev'
>> .../check.o:(.debug_info+0xc): relocation truncated to fit: R_X86_64_32 against `.debug_str'+76
>> .../check.o:(.debug_info+0x11): relocation truncated to fit: R_X86_64_32 against `.debug_str'+d
>> .../check.o:(.debug_info+0x15): relocation truncated to fit: R_X86_64_32 against `.debug_str'+2b
>> .../check.o:(.debug_info+0x29): relocation truncated to fit: R_X86_64_32 against `.debug_line'
>> .../check.o:(.debug_info+0x30): relocation truncated to fit: R_X86_64_32 against `.debug_str'+19
>> .../check.o:(.debug_info+0x37): relocation truncated to fit: R_X86_64_32 against `.debug_str'+71
>> .../check.o:(.debug_info+0x3e): relocation truncated to fit: R_X86_64_32 against `.debug_str'
>> .../check.o:(.debug_info+0x45): relocation truncated to fit: R_X86_64_32 against `.debug_str'+5e
>> .../check.o:(.debug_info+0x4c): additional relocation overflows omitted from the output
>>
>> Tell the linker to strip debug info as a workaround. Oddly enough debug
>> info has been getting stripped when linking the actual xen.efi, without
>> me being able to tell why this would be.
> I've changed this to
>
> "Tell the linker to strip debug info as a workaround. Debug info has been
>  getting stripped already anyway when linking the actual xen.efi."
>
> as I noticed I did look for -S only yesterday, while we have
>
> EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 --strip-debug

So, in terms of the bugfix, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

However, we ought be keeping the debug symbols for xen-syms.efi (or
equiv) seeing as there is logic included here which isn't in the regular
xen-syms.

~Andrew

