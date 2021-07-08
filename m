Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4C3BF8DA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153008.282665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1S8D-0001Xl-OF; Thu, 08 Jul 2021 11:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153008.282665; Thu, 08 Jul 2021 11:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1S8D-0001Uq-Kh; Thu, 08 Jul 2021 11:23:49 +0000
Received: by outflank-mailman (input) for mailman id 153008;
 Thu, 08 Jul 2021 11:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1S8C-0001Uk-ME
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:23:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78dbfe91-707a-4924-b3b3-fbdbee80679d;
 Thu, 08 Jul 2021 11:23:47 +0000 (UTC)
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
X-Inumbo-ID: 78dbfe91-707a-4924-b3b3-fbdbee80679d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625743427;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TkMciVPeJZJ4pd6aDf9KgsWkn7CQVJuUPWrPbtchctE=;
  b=KAj29JFTIwBaeAZHiyu3KBwAyFNKZUziY8L03lMJ2W4Y0E2s+FvF/rC6
   R7bPHGKvq08SsNA2LdyXQ/wrqJgdfcZyGC5kl6uRUZsSRutZRm9HF8+pz
   jVV0uJmCzKM0muvDPMWlEkKY9tgbuQQgb0oIaspgYNmstvilnl9RXryOm
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RVpuTz0ktAPhAFYUvhq1Hu6jJQEySuDlKRGUm83lF7+szD/cgYrVFhrtLtmZMi6IVpzm6Ad7Wz
 RxC4SrXZlE9wGo12a2U5T4cAVB9wM0qNDLeRSCIoelCUUabZ1o4/BySZIK7kV8a5A7GIUGgZcU
 lE6POiwL/Okp+oAFMGdjec398TGW7FXiPps42hvz2nvqkjNhuv+W7LpKdnWTa7vjsXAYTWYWs6
 bGOIgNJDSVmCAom25grl9IXWGtp9dBMeipADCC3Fhau33I7vS87AYhMDSTst5KdBfAjatxDAlZ
 mtU=
X-SBRS: 5.1
X-MesageID: 47829873
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6qWhXqypPopB77zI1XYBKrPxwuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjlfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpM
 Fdmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHRXguNbnmBE426gYz1LrWJ9dOME/f
 Snl696TnabCA4qhpPRPAh1YwGPnayFqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1nkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMgjgYdq3MgiFX5uYdA99HqQ0vFgLA
 AuNrCd2B9uSyLeU5iD1VMfmeBFNx8Ib2W7qktrgL3e79EZpgEg86O0rPZv10voz6hNPKWs0d
 60eZiApIs+OvP+UpgNctvpYfHHR1AlEii8fF57HzzcZek60jT22sXK3Ik=
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47829873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHV/V9gtsCoUrLbgIj0LDYw8umOwoaX+5/+qlMMvKqJPjFbq6NwXbsGk8mWMjPDSBalX8wzBeNpKdOjhTemEya5iSHa76eirvysT5s+cBm4T0pVG/PbQ1HM9AVusc+1JAvMsE6+3TIL+n2ey8B3duIm6Djz2XWvs2QHu44hIvdPJdq+BskzW7q10LDP4wkfSx1BxKKsfaQIr+/g+7eDW9Py6lHFDG0VVvyziejzqmGIvvaZ0IHPGKZwE/d0wxHe73oCE78eumDS8jb09RREhaELVsk4ffV4doTf0U8LheaRPAQt3v/vEzZHTaGNJGnoicclXctDNQbpCzBCgKIREng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRJ8gXC6RBFPQjBvCkDOF4p2MtJZRtCX/AjIffnMPMw=;
 b=dThEguynpz8XO1Q1elIyJaoCpVBBhjoKncdVjcChUU5AMpjSjRORbbUTkQwFmZdyIkpzuk3FwibEk/AS4EKmWPjEWj/wWlCNHrSQQtN5nQpKD405iPwxz2+7ydnK9oZoOkt9KTGb9USECP9NrjBljB021COZ6r/qsrxcJudtFrW55pCfl50fo9CgZw6H6BBw5aO1pW1tKiLJvPDghj/nRdx8wAyM2XmGxFLHxRNXE1X4vZVal7WIrMFq1AOdK2g/kQcg93y9HuN8Jhb+9r+vz66hvLQLAemhCm6jETqWjmf3HFGL/JFD/ucmMaAIv+73JEcYAgDoTEn8HSDJfQODXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRJ8gXC6RBFPQjBvCkDOF4p2MtJZRtCX/AjIffnMPMw=;
 b=sduK7dNx1iSY5nEJib3tZIt8ODjyfl8JRnYDFrj1/OOb/Dvgm1EleTiThGQ8bZWfoy3K7s+YXW3GlkxcS2k7NdAodhJaOzNPFnS2lTVaLTcCvzyh0TiQFu3WabEJ8XeHUqF/qaXlyVUX6gm8cY5roQo7O3dawSDfm1rv9KM+uPE=
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com> <YObY02T0Mhnw82DS@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <4667fbe6-8767-4769-7d3d-26ebfdf070ed@citrix.com>
Date: Thu, 8 Jul 2021 12:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YObY02T0Mhnw82DS@perard>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0417.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c65fefc7-50ec-42a9-13f0-08d94202d87c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4245CE1EBBE8D65223386939BA199@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f250VSg83iFRbeBVjPE1YtKg6ad+6sqpB6oO2h4Qk5W7TuiUCit1jTMqaGEmuO69737lw7a6QhLfZjBs1AzgY390QWfWCn19s8a1QzOIAVZUE1i4Doo2HWPEwp9HFetLN2sdE8+glx9twG185HcTwmISZAM36zeHKusIKrEYoMTF1BtnwF8qnq7FXGT+jdTCayySdiHI7yxqSP8z5SglFY+tHYZbCmIqLrdMV1nulgir7ImoTTGgquwV6qlF2AvVtupXjar5Vp5W9NC+V5cr9hM7yuRMOlZsa32/EMjzUJdOifnxsFF7OGvE/Nkb2BZkq+NauRIR9H/miW0LHUhwFowtNhINGYeaTWXU2YwYQMf7oJGdOVc80aD2vH+FqCYM9z/MzS/HVYZqHCJMUgwfEepwMSZawtCY8JXxYNCz5MJc32hOlB/6Uke6+3+ff/PyXtfWXrHwRUIzLFjJAZ8KSrWw2xfoDNYdMn1LydvfBOYnQfQdhAE4eAiyXp27lAWYbJM1rsDPKQCsi3O7A2TFJx7/tTBwx574CyjseFVEPrdNPW/rR9IATF5NeLzDpj8HrB/3pF1mO7YNZD0j7khAlBqrg/h8DUM/R/15SS0aKt9LXZsXo5AS0ZO/dd2gSEHzEY9gvT7Rr/XHnHG/sTjvFlPqDqn5UhfmtMOpJkuKgZ0m/f0i4rorFndx6J1dlkX/aMsCsmpLaKl/5ZpIlUTTp32eCxKkt9wf8ADqdQBAas3bccgIWkqaxTbl8nwI9ce+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(6666004)(8936002)(186003)(8676002)(26005)(478600001)(36756003)(86362001)(38100700002)(6862004)(6636002)(53546011)(956004)(2616005)(5660300002)(4326008)(16576012)(316002)(83380400001)(37006003)(66476007)(2906002)(66946007)(66556008)(31696002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckp0Qm5UMGVheXU0ZlZtZmw2WjlRR2UxKzVkNmtMS2tTckc4UnFiQXBMZkVl?=
 =?utf-8?B?NDZUM2wrbDVJN3NSSXBlWjVQWlFwcUhPdWVTSlNtMW5qYmZDd0NWZ2ZONmZr?=
 =?utf-8?B?UyttNFYxWG5DTFprOElNVTRuSEp6MzNDQUE5M2NiVUk5UFZtbFVEdXowRWZN?=
 =?utf-8?B?YVNXZ2I1a2RaQk1MUWZMUDJ1Qnlnb1o1N3Q3S1JpamhvcTFidXVzeCtIOXdR?=
 =?utf-8?B?LzJuTkNhYXpZR0h3MlhnRWZCSXZpZ3JSY0xJSzAxUklTWDZuUVlFVm40QlM4?=
 =?utf-8?B?Nlh5UG9Fd0Fabkpmc0l0b3pZdGtTSFhUTEJYRTJaVWNGTmNXN3psa1NkL2Jv?=
 =?utf-8?B?emVSaGNNUU1YekpIc0NyZzlldTM3SGRweU0vaTB6b2R5cDBlUGlXb1pwYnRq?=
 =?utf-8?B?c3MzWkpQdnMrSEw1NS9jOUV1enY0Ym9kRVlNWWVBcm9XQytNTkVuZVdqQ0lx?=
 =?utf-8?B?MW8wUnlPUE9XWGJoWnhObkhiVjlsZ2xzTHptZlJCSm1Lb2lWN2ppakZBdHI1?=
 =?utf-8?B?RW5Tc0tqTVJaOGE2L0M2RjNvNEdyM1NOcVFLRDc2ZUVzamUxVEM0dTg0SE5j?=
 =?utf-8?B?eU8xbUI1cDFSd1F5VkkxTmFtQ2FpNzhPaWNBRlYyYllLQ0w2MXNjWkRsMzBo?=
 =?utf-8?B?M0hWL04zd2ozdG5YOStTb0NidDUxbUxnakh0L2R1QjBjYndXZ2hXcElISlAy?=
 =?utf-8?B?WmhmbmEzVkxEN2VQeVV5UHhPNEpuNlJpY3BDSzBEYk13U2hIV3VxL1A3V05Q?=
 =?utf-8?B?NWZCZ3pESG82STRzR3RXV2REZ2RDdGp4dkIxamp2aDhvSkI3cm9aVzM4bDhr?=
 =?utf-8?B?NnNSUjRFVFpxcGhpUWNMeFdSaEdBdDZaRFlHOHdDZ0txVStiTDZoWEhTOVB4?=
 =?utf-8?B?Rmprc3NRRlZJdHp4c3NvMDA4ZEhnWWpGRWI4T2R1cFJwanpqK1VUZ3BXei9s?=
 =?utf-8?B?RW5DcmtpVFNZcEFhUmhYaGhJeVRGWnlBdHFic05wTkRUVGRhTUVNemd6WTdO?=
 =?utf-8?B?NkdDT2JGdER0bjgrR3hJWEh1ZE52dUNoa3U5eXZkb3hOa1NqY09SMWZUMDJB?=
 =?utf-8?B?UDNiYjhYRkpVYUF0Y0FmZTgyK2tSdnNiVVhPdG5JMnY4R1dPakFqTzJFLzJD?=
 =?utf-8?B?TVc0dG1abU5WS3c5NisxZExTYUwzY0NoM3Q2Rk1wbUFmcnJFODIrYjZ4WHFJ?=
 =?utf-8?B?NVZib3BEQnFZS2djZWdwamVsMkRQNnZmcnlpSmFTbDJMTWNuWFRGU1BMeE0z?=
 =?utf-8?B?S2xzU0l3enBxdVFhc29STGpCaWNpZU1lVVNuUFFCczIwQmpOZndYQW40dmZy?=
 =?utf-8?B?Z3JRREo2TktEckV5eno2anJUMCtwTHVTNnVpajdDU2lyNVpGelErNm01ek5j?=
 =?utf-8?B?R0JqMmVQbjVBaktnRGV5NXBGSFgyeUU1cXZUMFJIVm85RHZNdW12RXBPQ1hn?=
 =?utf-8?B?QmJ4Ny9aL25sdVVYZEpuemxuc2UxRXA1RFVYLzhUTHZTdEN0a1dlajB3Kzd3?=
 =?utf-8?B?NkcxOFJzbHNpR1FBclZiYkNXWElWc1dIK21ITWk2ZXNmRWFKSFJUbFg4MUVu?=
 =?utf-8?B?Z2NXV2dDNGVOa25FWWExc1E0M1JVc0gxVXpwYm1iTEVFKzZyb0U0ZWd2Vi9T?=
 =?utf-8?B?N3pqZTdQTEdDTXM3YzhoZjR0QTUrMEkyWlg2am11Ui8vU0hQbWRsdFRjK0Vz?=
 =?utf-8?B?cHFFeE1rV1gvWFpmQitGYi9Rcjc2bkRmZVlOR0FHRmlBRHlpcmJWTUZxMFdh?=
 =?utf-8?Q?QMjaDZ+FUUI4LSDorUjJ1d5mo1HZv3a0p0tib6M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c65fefc7-50ec-42a9-13f0-08d94202d87c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:23:44.0173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wc3h8ffhMRaK+02NMdbpN7RyOVgeBcugWKN49ppGwPLA+X3AEVtjuY6idj0sLn1TOxtthUaHuuuAncakM12Em09bJ2wdS+Rn55UF2f7KWCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 08/07/2021 11:52, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 06:46:03PM +0100, Andrew Cooper wrote:
>> On 07/07/2021 17:40, Anthony PERARD wrote:
>>> ninja is now required to build the latest version of QEMU, some
>>> container still don't have ninja and attempting to add it breaks the
>>> build for different reasons, so QEMU will be skip on those containers.
>>>
>>> Failures:
>>> - ubuntu/xenial:
>>>     fatal: ninja version (1.5.1) incompatible with build file ninja_req=
uired_version version (1.7.1).
>>> - debian/unstable-i386: (debian-unstable-32)
>>>     /build/tools/flask/policy/Makefile.common:115: *** target pattern c=
ontains no '%'.  Stop.
>>> - suse/opensuse-tumbleweed:
>>>     failed to build iPXE
>>> - debian/unstable:
>>>     update of the container fails with:
>>>         The following packages have unmet dependencies:
>>>          clang-8 : Depends: libstdc++-8-dev but it is not installable
>>>                    Depends: libgcc-8-dev but it is not installable
>>>                    Depends: libobjc-8-dev but it is not installable
>>>                    Recommends: llvm-8-dev but it is not going to be ins=
talled
>>>                    Recommends: libomp-8-dev but it is not going to be i=
nstalled
>> Only the first failure seems to be related to ninja.
>>
>> The second is a known bug which still needs addressing.=C2=A0 Our build
>> system's logic to cope with `checkpolicy` being absent doesn't work.
>>
>> Tumbleweed is generally broken and fails at ./configure due to missing
>> compression libraries.=C2=A0 It is quite possible that the iPXE failure =
is
>> related.
>>
>> The final one is probably because unstable has dropped clang-8.=C2=A0 Th=
e
>> container hasn't been rebuilt in a while because we still haven't got
>> auto-rebuild sorted.
>
> So those containers are ones that I've noticed needed ninja (as found
> out by looking at a single pipeline), but one which trying to install
> ninja and thus rebuilding the container mean that the build was broken.
> I just didn't want to spend time trying to fix issues that should have
> been found out by a regular rebuild of the containers.

That's fine, but as these containers weren't rebuilt, the details of any
knock-on error aren't relevant here.

I'd go with simply:

"ninja is now required to build the latest version of QEMU, and not all
distros have a suitable version.=C2=A0 Skip the QEMU build when ninja is no=
t
available".

Can fix on commit if you're happy with this.

~Andrew


