Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45863404958
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183017.330932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIJs-00031Y-Sb; Thu, 09 Sep 2021 11:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183017.330932; Thu, 09 Sep 2021 11:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIJs-0002zV-PL; Thu, 09 Sep 2021 11:34:16 +0000
Received: by outflank-mailman (input) for mailman id 183017;
 Thu, 09 Sep 2021 11:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYjb=N7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mOIJr-0002zK-5w
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:34:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbacd8de-1161-11ec-b1ae-12813bfff9fa;
 Thu, 09 Sep 2021 11:34:14 +0000 (UTC)
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
X-Inumbo-ID: dbacd8de-1161-11ec-b1ae-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631187254;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A31SC3K57yoskmMRtA4jxh9pkrDlnp5Vw08nURW03Oc=;
  b=hHxXOVA5KXJ2rAPkuDFUN7om41bA429XyBPmWLXQDXwyrQzp+6sOem64
   MU8bndkOswNslEXH+nlifA00r/9+AB2mRKoaW/C5afu2yhueK/Cgxnvqm
   r1kKhk5NaDac1ZwXhPi75zn7hwxW3pxS5wBJ7zLUkpeAwRQV3lx7QuMYt
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lxtmIx3RJKTlGWXmlpCxSB6eULd/P5BwmRO9hYBjqfvz0P7qrLtW9xtl721yAKGp3SvfBrgdzE
 6jr2pKYneGEgH9Pg/sB56syjoGMHXLBBWbtkAH+oWuyTiLybNi8CNtJxWCrrJDYgxLf1YkoHY4
 fvl7gOqTOtKYhmYycb70WaXHy5ouY5jZHCSB3TnuLY6DQdYTzhax1prwpHWwBJFVIawhiVDQ0s
 EOZT9gaS771T2f2LXGMC1eBIhj0dtNFN6pU4gn2Vh5JlWA4++f1/+4VGwC8HjxtmP0xnZSMQR+
 rb5qJ7lMBT2KFl1MmAyqm3GN
X-SBRS: 5.1
X-MesageID: 51941907
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Xo7vB6wtOfX9UJFoHCxlKrPxbuskLtp133Aq2lEZdPULSKzo77
 HcoB1L736E8UdgZJh/o77wXtjwfZq9z+8Q3WDeB8biYOCGghrpEGgG1/qY/9SOIVyyygcw79
 YrT0E6Mqy6MbCV5fyKvTVRPb4bsYO6GeOT9KHjJ04Ed3AwV0gC1XYxNu4veXcGAzWuZ6BJWK
 Z0vfA34wZIEE5/Bq/LZAhjLpez1ay+qH//W29idmsaAUu1/HuVAdbBYnulN3wlInxyKNkZgC
 b4e82Q3NTej9iLjjP76k+71eUU6YeRleerx/bntiCkQQ+c0jpAqL4MZ1WO1wpF5d1GGD0R4Z
 vxSt4bUqsDkQKtDx/F1mqa5yDQlAw243un416Vi3nurIjYQ3YVEMxcnOtiA0Lk13Y=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="51941907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpdw5A444n7/PMecXpNTIFQQRZn8jdW0huYC+tD8hoA0S/v3WxS72Y8/Vx9wcAfPuy4UcdcvHvmD/CRJBoNrqMJjqmfV5cPjFvx02VlbqcunGrv7oudkKvVjA/ypd251cQC98nLWWW1n3fFGmJodBTTSdUcmt39Mnn9Se9BBmqKsEvKOVQXkozc/vwuxKnuUecXz4OUsts7D5vj3l9s19eUfcsdNALPQal2y08n6Zxq/qlwaFMJBvMSqKU0PJ9aSTzbvU031haOhijJj+45Z7HCCuvAsuUnepSzwfSCxmzrZ6F63Eo+5wwtqUdPh3My43YD06cxm9vDVAVihVqqujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6nn9WxfhhUGRAcX7rmQNrfi/mWoK2G/7C/2HhLQ7WOY=;
 b=FYiBYkeGx3OQQZJ89OuU7acc4J6D++U7fIBg34cPL5vdfYxMnjMsPlYKtTT2MymUBsXeVr2+t6hU8HKkRP0Q+cqBm1p+OB6LPCfSYK5Lwr/wTgfKCGPGRt3qXBOO57kH4+yYuiCTxaXLKqvWwIwazvwgr6qA+3TGp9S/0lGTWObYK3NpuHcnzEcNW3pp1vW056NweAKIefV1UmdcPnNlUoqZqFuVDiezuKvE1osAIyrpy4x1Rom9RSWouwcQmohNYHRIgnG/UWtRKGQcIE+/+pYYEBmmEVjFr2qOwS/rig2AKc3XiobA2UBu1ErqiitPNo1uZKVp7oziT8qSbZM1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nn9WxfhhUGRAcX7rmQNrfi/mWoK2G/7C/2HhLQ7WOY=;
 b=LOj0Ah76fdqa+rAKWbMQuFpo9dq349EZYYQVwRjzwZV6kdinPNk3qPbr1cVkMlmzKF6t+JrgSg/paUAG6OyxdaMk5nHyew6p3hIX0EElg8ova44g1X5QT+vgM+KP0YB4/nluV0KKlGxfmo/D6bQ99LvYiclxav7hcURcBy61e8k=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908161918.25911-1-andrew.cooper3@citrix.com>
 <3f272ea6-02ab-8f70-19cf-28a92421531e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Intercept and terminate RDPRU with #UD
Message-ID: <9a4392f1-dc8b-76aa-f5c0-1db70dce3b42@citrix.com>
Date: Thu, 9 Sep 2021 12:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3f272ea6-02ab-8f70-19cf-28a92421531e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cde61e0-22c5-4d9e-b299-08d97385bba3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB386121C81A720F52D99C688CBAD59@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4tHRmIAC9WtW3wVLBsWS3aGsGCsFyBJb97QSP8zEtiLSL0bUnhvBXAY9kOgg4B2g8TEC7yYyn7U3NC5xnvtvAyYxG39aw2VVqu/BWoYNKrfAzkWgAI+86vdwXLRPmcJsxXqHwrfDFdBECi8aIgylN2j5LqfPHGumczuBccAASLK7sLIHH3V5qMyDjPj6TvO3kpk3D2kPec0SaXg69dL/s69hTZzJJaKIdahXznWM/wAt0zcL2kWE547PkQhHWqoulXS13dV2xo45eeRdb+LwNgdee1hOk4R3u4dOQA8weru/Z5FVOUsuVwLxi70muBqbmqEtjH4fhZonH6na20SQpkctK/DCwkzm2HJkDKxISbhw8KckbvwoD/AraoAW18rnHI340ulZmaipU+pJnd5ImNncc7ly3gtgKdPR/HGQBo9EdntmYv988KRMbUTU4vBZWo/+A3Hl3cuMyyBQUYefGHUtIjHcNws0hiz7Hgx4+BLVYtg2uRIs58yUBScjiZdDFYont/JVO9GJeKTn1EjM+ebO39wanGZG284Y9dR+/ZiAjuzix9jgmez/G7yJ3SXMSLtTo2SbbfttZsECmjAvRvEbU0f01dCNkSb2z5hitkmJSyPc+AlKSfKrAoUt5tdsCklJFXKykW052rnC/9yEB5xxYRHTLEgaeb/tw1ws6iggNOXvrTRXSiyif3LBl4LYWOdadRKhpBFIYkZ/ZJcWpfStXSA4qvxvhDeEC35Hyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(26005)(6666004)(6916009)(36756003)(31686004)(5660300002)(186003)(31696002)(86362001)(4326008)(478600001)(53546011)(55236004)(83380400001)(16576012)(54906003)(6486002)(66946007)(2906002)(66476007)(66556008)(38100700002)(8676002)(956004)(8936002)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTZLV1U3VDN3b0JRckJnQVZ5OGFCNVBYZGpDVHJsaE03bEhNbDQxci9Cemp3?=
 =?utf-8?B?ZnVwLzRnTldmWHdvMVVZcHVVc3hPT1p0NVR3NDNoWk9hb21ISkljSHZ4aDlm?=
 =?utf-8?B?d1Y1OGFFSTNnZTJQVDF3ZjNHOUxRTGoxbTJFUVJKRC9IWjIvc2xodXlOeVpW?=
 =?utf-8?B?RmtqVUJEVHNGVU1YMlBFOStaZ3lnL2RJMmpUVFlYYkU2cXNnUUpzalVmVWlP?=
 =?utf-8?B?ZXY0MnZVdm0xMWM3NUVaQXVFOUQ3ZVN1anR1SjM5ZXlXN0NPTFprYjVqbDJm?=
 =?utf-8?B?NUdyeEN2Wko1ditjOW92d1VFZzI3R3h3WXgzNk1ITU5NUGd0cHo0UHo0VFdI?=
 =?utf-8?B?UU5qUk10LzNXd2VyS0R6ZURVYytzdlZzaTJpNlh2VW5TdmRBcE1sK2c1ak5m?=
 =?utf-8?B?RGZrbXhDaUVPSjFFSTBVajc1M0hkbEJBNVJMaGkvWG5uaUNkZEY2UFI5R01X?=
 =?utf-8?B?RXNCU1RWbEVGMUJJdXlQS3ZwZ1MxT2s5TFN2Y0g2SWtLcks5SWtuZmZZbGhm?=
 =?utf-8?B?L1ZNTDNKVWkzaWNucFZRdXpoaUZQWmhFeG9BSDdjQWh4S1BYVDBKZlQzS1RU?=
 =?utf-8?B?SnYwdXlRdjc1Z2s3RVZEVGpyT2htcUtYdXVnWjlOb3JrQUVjUklXSEhySmRU?=
 =?utf-8?B?eThzaUNmM0FOZkFySm9qZk5BL0VJYzN5ZjNrL1pJaUthR01OZ1RueURRTHFL?=
 =?utf-8?B?U01XT1dCakdSL05hSjFjUmlHYUFZMEtlMm1ra2NMUVhOeW1uM213eVFDTFF1?=
 =?utf-8?B?enJFRXRtQTVlY0dYWFJjclB3N2Q4bnR2VGlrRkJPdnRZaVpmTzZkMTZzcHNo?=
 =?utf-8?B?MHloRjVXSFVJWEQ5Q3Q4cnZUcW9CUkNXSVpySjFqZkV5aHlnbWRsOWZFT1p6?=
 =?utf-8?B?a0tTaGFLSUV3dDF0bFRkVW9uMWFCQnFZZlBtU0lIcU1hRG1XL1dyeWlaQUxa?=
 =?utf-8?B?TW1UeGNkQ3Uwck5HZHRTU2cwMVFMU1lhU25vSnJkbENYWjgvY1JyZTQzcHpN?=
 =?utf-8?B?d0JmZ090TzBwZ3BJc0UxbnBiNDZiOXd1S1dGSFB6Wk5OQm9XWnZ5WmwrSGdx?=
 =?utf-8?B?U0VtNTc4RHFjK2REb2d6L21LS215TzNTVG5SSUVjQUw3Q29xRmpGUDA3SFFa?=
 =?utf-8?B?bmNtVmZtZWIwVDR5ckVzT3pJWkhzMEpCN3JIblRtTDhHWmJSQ3pWdlpFK3V6?=
 =?utf-8?B?WURSVXM4M1JUVldyMVFxYisxczkvNHNnSlZQdnNrSk1pRWVqR2VTT0lDN2pT?=
 =?utf-8?B?Q1BmdUkwV0prTXNXMGN0RlNORnZzQUVWVXcwN1oxYmhOUkJ5MW41RnZzOEhp?=
 =?utf-8?B?MSs5L21xZTQ1VHNRL3VsY3djS0hEKzFaam9Nc3hGYmhLaklOeVkzZWtZNEVH?=
 =?utf-8?B?cFR6STdtdWJlb3dwcHVGV2w1NVVpUC90cGNJUUluQzhlRFArSkIwaXE1UmJN?=
 =?utf-8?B?UXhFSHZyeGRTd3crZ292VUcxUGdlM0g3QWloRlJiN1k0K0lCVWwxYXVrY3hM?=
 =?utf-8?B?Rk1kWk9lZHBXa1RMUWJaZ1lYQVV2TzFwVUVOYnlEQmZ2SGJ2Sk1JblVPZmJN?=
 =?utf-8?B?dU8zT2g0YllSQllraDNkbVFqa2NadVl1a2I1TGdCRzk5dURReXdSUmwzVFhY?=
 =?utf-8?B?cDNmNFZjT2R2ZjRZaHhQUEplSzFWV0VRQzYyTldPc0tpZUMvNVdCR2UvL29B?=
 =?utf-8?B?VldiK3ExUW1LRjhPUXRScjJnWENjRnl6RmdoSXgyK0FiUEJIbU8zdHBVdjAx?=
 =?utf-8?Q?AcspQh8Foh2bbLvS9sWDFRomJTOSBSMC7uulPRx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cde61e0-22c5-4d9e-b299-08d97385bba3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:34:06.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLRNn+xTOs4YGHqHZqv1MdRydPu/ZiWGe63OVU9OiCSSz55QO3SRhrz1u7mRFHgdawRtASGfV5nXCucsXMEK1nNrlS2Z0X98LTzlJOzHB78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 09/09/2021 10:57, Jan Beulich wrote:
> On 08.09.2021 18:19, Andrew Cooper wrote:
>> The RDPRU instruction isn't supported at all (and it is unclear how this=
 can
>> ever be offered safely to guests).
> An implicit hint to me to consider "x86emul: support RDPRU" rejected? Tha=
t's
> still in my queue waiting for ...
>
>>  However, a guest which ignores CPUID and
>> blindly executes RDPRU will find that it functions.
>>
>> Use the intercept and terminate with #UD.  While at it, fold SKINIT into=
 the
>> same "unconditionally disabled" path.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> I could have sworn that I'd posted this before, but I can't locate any
>> evidence of it.  I've got a separate patch adding the CPUID infrastructu=
re for
>> rdpru, but that is better left until we've got more libx86 levelling log=
ic in
>> place.
> ... this. Which - if exposure to guests makes no sense - would seem prett=
y
> pointless then as well?

Well - given how many people want aperf/mperf, I suspect we might end up
having it as an opt-in only thing, so no - this isn't a rejection of the
x86emul work.

We can *almost* provide a safe way for VM's to use this infrastructure
if we had something like Linux's restartable sequences infrastructure.=C2=
=A0
In that case, only an SMI would mess things up, from the guest kernel's
perspective.

On the other hand, it's probably easier to lobby Intel and AMD for an
interface here which isn't fundamentally broken in the face of NMI/SMI/etc.

>
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -70,7 +70,8 @@ static int construct_vmcb(struct vcpu *v)
>>          GENERAL2_INTERCEPT_STGI        | GENERAL2_INTERCEPT_CLGI       =
 |
>>          GENERAL2_INTERCEPT_SKINIT      | GENERAL2_INTERCEPT_MWAIT      =
 |
>>          GENERAL2_INTERCEPT_WBINVD      | GENERAL2_INTERCEPT_MONITOR    =
 |
>> -        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP;
>> +        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP      =
 |
>> +        GENERAL2_INTERCEPT_RDPRU;
> Some of the other intercepts here suggest it is okay to enable ones
> in the absence of support in the underlying hardware, but I thought
> I'd double check. I couldn't find any statement either way in the PM.
> Assuming this is fine

They're just bits in memory.=C2=A0 Older CPUs will ignore them, and indeed =
-
pre-RDPRU hardware is fine running with this intercept bit set.

Honestly, I've got half a mind to default the intercepts to ~0 rather
than 0.=C2=A0 For running older Xen on new hardware, it will lead to fewer
unexpected surprises.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew


