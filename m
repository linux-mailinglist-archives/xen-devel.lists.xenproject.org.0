Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D23355A79
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106159.203036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpak-0001K6-MX; Tue, 06 Apr 2021 17:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106159.203036; Tue, 06 Apr 2021 17:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpak-0001Jh-JB; Tue, 06 Apr 2021 17:34:18 +0000
Received: by outflank-mailman (input) for mailman id 106159;
 Tue, 06 Apr 2021 17:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTMm=JD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lTpai-0001Jc-5f
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 17:34:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 075c08e0-dc6d-448f-a1c5-46ef96c69077;
 Tue, 06 Apr 2021 17:34:15 +0000 (UTC)
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
X-Inumbo-ID: 075c08e0-dc6d-448f-a1c5-46ef96c69077
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617730454;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IHnokvPOu6Q5uhUGljbZ8sZww5k4ZDZFr9fE4bXxImw=;
  b=YgFy1q7wF8w6OCuHvFkXReNVdZGpkGOMp6abjuYKpS0q2b7+2PWrko9O
   U2D7wUlKHMrtYNdvKtzKMfDErzw7h1NmLvE1iu9ZYSlxgDbaO7zR1peGr
   oPPQqt5AhMRh8lXuGVOObwct3YDazBP1Di9DAZF/+xDhTjYYr2ZRDSaox
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BCKVTVtazFFejypfh7ZYcICCnLCE6g1v4sp+Tz1Xpmi8M0ZMtJvube5YXdMsZaqaiIGXpFkIjL
 HPGVvrd91as/1Q46GgasXV5pNtf61NM6ZK5hqlziJVE5TwooFo8NiKkDn9WVJnOSBist6Vo2Y6
 tmAA9iRJZyxNE+uHl+WChp9boXFQmwpk81XS4YilUecYO57c3fjjG/hDvNPg4vgNoGv8mjNW+E
 X4olrWr64RWpGp39JJMwrcM3lu5IqKNx4nm9+TLCforHt12foOcY79uN8wZWSsuL3u50NHvEVx
 g44=
X-SBRS: 5.2
X-MesageID: 40987823
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CXDQ3asXaZ82O/0sJbe02tTe7skCM4Aji2hD6mlwRA09T+Wxnc
 qjhele8BfyhioYVn1Io6H0BICraxrnhONIyKMWOqqvWxSjnWOuIp1r44eK+UyVJwTV8OlB2a
 B8N5VvEdGYNykxse/WwimdV+whzt6O7byyiY7lr0tFYAl2Z8hbnnZEIyucFkV3QytLFd4CFJ
 Sa7tdavDbIQwV1Uu2VHX8ANtKz3OHjtJWjWhIeAg5i1Q/mt0Lb1JffMzy1migTSClOx7BKyx
 mJryXc6r+4u/+2jj/wvlWjn6h+o9fqxttdCMHksKF8QVSc6HfMFeARPMzlzUlF2N2H01oknM
 LBpB0tJa1ImgDsV1uoqhjg0RSI6kdT11beyESViXamgcv1SCNSMbs+uatlcwDU40dlgddk0K
 gj5RPni7NrC3r77V7AzumNcysvt0Kv5VI+jOYYjhVkIPwjQY4UibZawWR4P9MrGjng5IUuDe
 90Zfusksp+QBehdnjc+kNvzNavUm92IRucWEgFvaWuuQR+rTRC1kMdgOkSgXsEnahRd7B0o9
 7cOqAtr71KRt8NUaVhH/saXMe7Y1aifTv8dFiKKVCiLrwOJm7WwqSa3JwFoNuycJhN85sohI
 6pajxlnH93f1irBdyF3ZVN/ByIXX60Wi71zNpCo5djvLnxQ6fqLD2DRFgin9DImYRXPuTLH/
 CpOJxXBPf/LWzhXYZRtjeOE6V6OD0CVIkOvcsgH0iLv9ujEPygitDm
X-IronPort-AV: E=Sophos;i="5.82,201,1613451600"; 
   d="scan'208";a="40987823"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+aC5Aj4dVlUs9hZBk72/FoLSB5BE/lTmf921xqKnQ/ujk1Xb+MXb58e1/Hg6bzbBE3YyeoqTJo1cm94oqg0XSfHEs2le2h1h3H6cDUrwPhlUnT/5PfGyp/9SZsjeb2ddczLsTk1N8vzf0CwewO51oRH2+oKnq51jG6S78zEEk1bEVb/ammw8uiUAA93nPF4BD12VZT+nfbhifi5mV2tcoqsILSF7OciAwMIo0zqcppdvN6k/xRyeE32Vv8CjpLXqk1k7mhmfeYQOdU7iaPSr7ZyybFmhKNJxBc9qSDTknf1nRaz6alxqUnBkNIOqTM5hly3HDf6wK3QYiwwjLZWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moqfotm5duShMZ4N4znmFG9WmFdGzVoAkzbIKTRVweg=;
 b=F+wJdeBDSziZsX5m71+SDGagTGXaXG86iKE0DE3P1SY+c1++ddYmGUcsFF7d8XMMKkRmoYPWG1MO0dnGZ4u5ELha7fxKpPDfNh5to47tifo5eVhQ3r9/PEhiZBvj64Hn5efpChCzABOsfW67JA+47xlHmgC84/5Bfw03y3oyXghwwBubDmK1u8Zq6aThktyeLHas5MBUpl2c1bMUcDyfW09SU8X8BGvFOZdaEfAAdmgVng18NGR2A0sKAGiylmKucgmTyFVoR4wdhw0KgWSNH1nhQakMfpULJg+Pnrc/HY4vwv9O4DN6lJiyosOoUMCf2z+UvDvSEr9D6dEW6pktBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moqfotm5duShMZ4N4znmFG9WmFdGzVoAkzbIKTRVweg=;
 b=nu3pApNqn7LN9ER89aSVbkEezrIqkkdxaarMrqYo83fCBj7Awbcvg2F54Kvh9/lJVqYyfmsc1urjrSETA9VyOIHO2YT4EDQtLNZUaXAz5RbsG2AOcRgTqz6P0eYfRgzTH3hD5BYbS5xZz9hY+qHxgU0feiruD+11CFNcjYDHVQw=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <eea7162f-bbf8-bce9-b989-2a44fe10fa99@citrix.com>
 <ba34f9cf-0815-9671-a59d-04f16397ad90@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
Message-ID: <e34f599a-689c-6116-989f-407789e004f9@citrix.com>
Date: Tue, 6 Apr 2021 18:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ba34f9cf-0815-9671-a59d-04f16397ad90@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2659b61-195f-4d72-3c07-08d8f9222fbc
X-MS-TrafficTypeDiagnostic: BN6PR03MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB25159B5D94D8E48BB81A4CBFBA769@BN6PR03MB2515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 421i9tbUYEhWFMC+I2o+jC6cWynp7U9ncnvIC/PsdLfMC9nBbQjLT0npq+DUJkzXy6FvuNt7bjfWxJWY19YdeiZDBa5unxHI3VjzOR7EJCYOmRskr+KUiQVuCkQ5pzWDl16BAC7bKM5Qkh6r9JzESxUpEZll8yWFQr0/Bz9JSz/qg4hfSXlPcdgsFvD92oGJQaAwjAUgIXMood/4KMG/0/1/o35hbT4ldvhLegKRueIssoQXZlhh2aCAnrt6xKd2ZRngfIx7cSC08iwUKVx4Owmeyl9PVHXbtrfzyX+lHPqA9Z8yYwecxyD1yl35KmuxbYxyNattKGejSucLC1JLzB1TkAWoNMh+advGxrY2VQKbOWikqeo+fksenGjwZ2rUvQPf9cpjyL9zWtxl2hnSmOXjpnj95OH6VsQYTTdv5I2MPs1XDCr+zUgnVo8ZQ12Wy2t3OAzGsXnz0D2s0mYiX9My+IVBfpAmLEI8g3zBlMzztEwhVjtEZRUiMTF6HlCp5KKVST7NTeaYTOIzY4abzBf9Rqke+ZP+Dq2XEW0994mQUMOoDn13PjevxeQs5PgUQu/6VCXXHgI7fQ8Rc1M3yY+lqF/jCM7/imjd8XUFR9Rx80pN7GqBasaO8GJLyH1ydv0EYlTPaZB77Sh9WbMy5NqyDt3kLARSp8DYP8LZ0DhxwdShnAVKGPQN/zVHZwPlujhjL22+N936kjPo+Ycxydx0xzF3ETVU3dW9Ar3GDp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(38100700001)(16576012)(16526019)(2906002)(66476007)(5660300002)(8676002)(316002)(31686004)(6916009)(66556008)(8936002)(478600001)(31696002)(6486002)(53546011)(26005)(86362001)(6666004)(83380400001)(66946007)(54906003)(2616005)(956004)(4326008)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHBpdGtmMXZsekFjMEhPdVV4QURDUlVGd0p0NEhmS2NUZ1czbkhvUm90VWNu?=
 =?utf-8?B?elBOL3puc0JWRHhabi9rNEcvbE1UQ1NnTGk2bFJWTENYU1RYUk5teHBabEZI?=
 =?utf-8?B?cVVNbGt0UHN4R2RZL0swbDIzbWFUdkNxOXFKOGxTcENuQkV3bk5tTUNoSWlk?=
 =?utf-8?B?QWRyOWJvNmhSLzdDZlRKc2pXWTJISVo3SkNzZ2tXaDZzSlRCcHFhZmdnQ0J6?=
 =?utf-8?B?NmNkZlJ1dWFpS3daNlJhRWswWXpmNVh4bGJod2k2TEpucWxEbWpNYUV5MlBa?=
 =?utf-8?B?UW5ZR0hoMDVyTWROUjdzNjRBa0lnelRheG1NeUwrNGpsQTd4YXV2UVhNbG5X?=
 =?utf-8?B?RUowVzZMWGVDQkpNTk1LaDJmRW5WMEJCNnA5M2FEeU1SbTVTR3FLM2lCQUNM?=
 =?utf-8?B?V29hT0lwSjhrcEZOYWtNMVFNdHpvMFhkTjB3dlBJRG5VMUltUWR6V3ljM1VK?=
 =?utf-8?B?ZmtTeTZxN1VsL1B6Z2xQaUtyNmVEZE1tTzhQSk4ydzJHMEg1dU5tMmpBYTc4?=
 =?utf-8?B?aU5uQlU0UEJxbHprNnlTSUlwbmVEQ0V6V09RcmQ4NHdzdXF5OGNPb2ZJMXdV?=
 =?utf-8?B?Qm1zTlUvU2tJbkJsNUpqMWIrTWUrSUNwaGpVYUxUUWNZNDdyK2RySHYyZ2JK?=
 =?utf-8?B?R1hkeWh4R3dQK0t4eUVOaUFzeWhiUXRnOFBTYUp0N09nRitFYUdvSjJtZC9s?=
 =?utf-8?B?bjVRemNKRjNSMVR6SnhyUUIxODdJcjBhUVo4TnBITWRrbDQ2QWl4aTk0OG44?=
 =?utf-8?B?ZE5LR084Z1hhVGpiRXg0dHIyR1ZjWkpTZWR2Y0V1enJGS3phWFlkNjVEY2Ur?=
 =?utf-8?B?by9xRDRjazkyd2xxK3dxaTlQNU1jS2JZaFkrK24veGF6WFBsTndXMzhuLzAr?=
 =?utf-8?B?NUFKa0hxczhhUElaTktVOTdPWEtxeEQyWXpVb2lYUktnSUF2U2l1QlZGQjV1?=
 =?utf-8?B?MWhHdXorYWVkanV3YzQ3T0VaRkVyQUFrc0t4NWI2UG94ZndlZGFQVkFjbXR5?=
 =?utf-8?B?K1BoWlRIVzRXR0ZML3JLRjBvajFOZnFJZGRNaDRwSHFXZmdDaUk5MkVsVmpu?=
 =?utf-8?B?YWs4RzRoNVV6ZzJSUEJXWTZ5S3VPMkNjKzZueU1ORDVsQTBWT2JjSCs0V1o4?=
 =?utf-8?B?NllTSW1uUXJYcmRoOWI3Uk5FMXpFSXRNWFlNNERsMUo1ODl3NlpyeVdmQlJD?=
 =?utf-8?B?b0p6b1M0cDY0U1VBa0NhSXU3anZuZWxtR1c0ZTZPTHJjOVFEakhIUjBtallP?=
 =?utf-8?B?dGhuQVQrc3FET1RMTExVQVBuaHhvSlV0bzJoY1A5SzRVVnZGL2lJdkdVY1A3?=
 =?utf-8?B?VmlEci8vRDNxUko2dHhvOEhEVXl6Yk5TRit0NHNnYzNKSGg2Vmk4b2dOWmdr?=
 =?utf-8?B?ZGsxODVQUHRsdU9jeFl3bHk2eXROYzlRUkxHZlhXdm80aElHLzJmYzBMSk80?=
 =?utf-8?B?cEo2RHNWcElibWEyaXdJakN0Y1hTWTI4NDB1MWxkNVRIbEFEUGJiWkNFaEJQ?=
 =?utf-8?B?V0lrbE5FbkVJYnZRRjdoNGJiU3RScDhJNGdXWVliM2ZEd1pZTFkzay9zc05k?=
 =?utf-8?B?Qjh4L1NoemZCRGZpQURodU5hMEI5Vm8rOUNxcTlyWmV3V3ExVGUvNzNJSy9y?=
 =?utf-8?B?VzJORzFGL1phWWVLK1BUT0g5VjY3R1k5UW40SllTZFZJdGdqSEl2c01xZWh0?=
 =?utf-8?B?anRQaldTU3VkbThkeGl4WG5ic2N3WjdZRkdQdytoUTk4STJobWFWU1VtVk5z?=
 =?utf-8?Q?LjQQcWJbbFIVOLt6aAzxNvWYWkhNB88Nw2FcVvn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2659b61-195f-4d72-3c07-08d8f9222fbc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 17:34:10.0483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaj3+mIEbYAJEyVnK/rvOgUY+4kYFIdS6y3iPkseYu48T/XK7z6Z4v6O92uro/5hSX+8CrfzXH5JEDHAApQmwd4RYz8+knJJ+Q2Jpeag79Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2515
X-OriginatorOrg: citrix.com

On 01/04/2021 15:37, Jan Beulich wrote:
> On 01.04.2021 16:31, Andrew Cooper wrote:
>> On 25/11/2020 08:51, Jan Beulich wrote:
>>> @@ -102,19 +102,21 @@ void __dummy__(void)
>>>      BLANK();
>>>  #endif
>>> =20
>>> -#ifdef CONFIG_PV
>>> +#ifdef CONFIG_PV32
>>>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>> Even if PV32 is compiled out, the is_32bit field still exists, and is
>> still necessary for crash analysis.=C2=A0 XCA parses this offset informa=
tion
>> as part of dissecting /proc/vmcore.
>>
>> It's one single bool in a fixed size allocation which we've got plenty
>> of room in.=C2=A0 It can and should stay to avoid impacting the existing
>> diagnostic tools.
> I'm afraid I don't understand at all: I'm not removing the field.

You talked about removing it in the commit message.

> All I'm removing is the entry for it in asm-offsets.h.

Yes, and that will break XCA, which is used by several downstreams, not
just XenServer.

For RPM package reasons, you can't use debuginfo packages, because
what's on disk doesn't match what's in memory until you've rebooted.=C2=A0
Livepatching adds an extra dimension of fun here.=C2=A0 There's not enough
space in the vmcoreinfo page to pass enough structure information, so
asm offsets is appended to the symbol table.=C2=A0 Yes its a gross hack, bu=
t
its how things currently work.

~Andrew


