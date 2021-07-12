Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A323C66D2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154876.286038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m356c-0006L8-4S; Mon, 12 Jul 2021 23:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154876.286038; Mon, 12 Jul 2021 23:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m356c-0006J3-18; Mon, 12 Jul 2021 23:12:54 +0000
Received: by outflank-mailman (input) for mailman id 154876;
 Mon, 12 Jul 2021 23:12:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m356Z-0006Ix-Ow
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:12:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad741910-e366-11eb-870e-12813bfff9fa;
 Mon, 12 Jul 2021 23:12:50 +0000 (UTC)
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
X-Inumbo-ID: ad741910-e366-11eb-870e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626131570;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fO5xrBFe9sZDy1xRbutWikW+NSmnMmrkkxEtZnT1q7U=;
  b=Fb/IfcN9ye1jmCY5hNsBOaGJmHArv7YCw7p6kWK6Jjo1s6bMex34t0vc
   pyPXDr6J6CqwngbfUJUZ2Oh9Xsx87YU2YvWAlCT9O+hsZ4i5UIYwXekyG
   5yDPjViskocbgCHdECggxT8N8XPW7nx85h62V/5JrskKl4Y3fOhNeKipN
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zGh6s00ADok86WXpGRQbEwyAEPC4EzDLh/QnGyYd2Aj4lUVVtm8ibvXgodJO9U8hcuaqDREQih
 m5F0HWXQaXktSQZyaag5s3YP2DmMewIrqNfh6m2RedbIhNY65+NQgxstLseyvNEwu9O63SNWLT
 QsRDsT4DSKI3gBcGQAi2JNM/6lO+SnmlbCvpAxN4vohnKw2/SmYI/GUR/tHA+m3JjE5F8oe//f
 jascjsKQakn78cyKRRg2wevpPrs1NuJjISsSaqrQtSqvL5jJAsZV28kdX0a6Sqbz6Ut0rSiq4N
 kos=
X-SBRS: 5.1
X-MesageID: 48170957
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UyVlT6MhUkVhGsBcTzH155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN9jYgBepTnmAtj9fZq8z+8J3WB1B9aftWbdyROVxe1ZnOzfKnjbalfDH41mpN
 ddmspFeaTN5DFB5K6QimTIcKdDsau6GeKT9IPjJh9WPHBXgspbnmFE42igYyhLrUV9dOEE/M
 323Ls4m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6xmxLY0IzEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnR76+8PDW3hR5wuJSEIZ4KwuZkFkIM4jgOc7l/1awKoVKuZPIMvC0vFlLA
 E0Z/uso8q/GDihHgPkVmoG+q3lYp18JGbBfqE4gL3g79FhpgEx86Ip/r1rop4+zuNLd3Bl3Z
 WODk06rsAFcicpBZgNctvpB/HHU1DwfQ==
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="48170957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MctR3fia/gt+fZmrcyCen6be4bmQckTd/MTxRqI/UnMhLinB2OxeF/JQMbgJciuzmntTNOPrgFVPFTVG6VUGEQobRnEo/l+NIh672htx1sv3SaVuwsNtz/Yx26vCYQhQNZgJbPFOgZWcopZHA796UmiyDA1CvkY3uwPO+9ylOvKv7gnFmdeCmGvJf+TaAqXFJ/zEmBUa6q7wmj1CrXoC/NTMt9jylVbSb1MmzIHCb6/eek+W5YCrXIWxtmJWsfILtDkMXEEqO4qrw8bD2oHF5xC9BDtovai+cKjaR2rPyRlcPFm+QJf9NrgwnoxURVJ5EmKwvu/v4jdGYikbM5xcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtvBYwMbV/PM/7BNt6mcTNmrFO7CR4EdLVk/zw+8vw=;
 b=NZZDjiyVpWUEtLLu2G9b/3JbObykGPngf/3BMwn6Z+jYvLb1n3LGGWhX+UolIg8C5NWM8GG9mOnJ/0sX4M6FeCnzu0RjJevtHQsJe5xyR4YgDdwEkd/QL5OPP/j7qcEGVXPi0pMN2QbxG9NKE9RKlpTU88qZWQyjfbqRX15e3bMwof7rGHbzQqXM0tTFS9Qz90+5QLXKSOipkhPwIHIMNRLrQ2qMwDBbYQ1zFXjX44kg2kVXWfMJSUIP6jNukBdh2TQYh0zPw64ONv+j7OD1S76IGrtWkQbzdNLEw6DgusrL3r/JbaNpD/NnnJGCPY9dbSKlUcPF+DE11gmIs7MP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtvBYwMbV/PM/7BNt6mcTNmrFO7CR4EdLVk/zw+8vw=;
 b=NyEF92On1jVG4okmdvu5GNm6Pyz8MEXPJpoFUXEDacv6Dibhe3doNg3UPuRpUm/VDJfRbVOqmwGZL6sZfHPprAgBj/F4xkuDV1I3oG4A8O5Hk5wD12E3cFBGA8Ga3zxKGaFhLacYfgdeMIBJ17ksFKZW+mV4wXGqiLhzio3kiik=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/10] xsm: refactoring xsm hooks
Message-ID: <9d8e9cbf-e7cd-cfc8-ee55-204537590d62@citrix.com>
Date: Tue, 13 Jul 2021 00:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0353.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d95b1510-6493-48bf-246e-08d9458a8f71
X-MS-TrafficTypeDiagnostic: BYAPR03MB3943:
X-Microsoft-Antispam-PRVS: <BYAPR03MB394333C2521749A3354A0E10BA159@BYAPR03MB3943.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDElU3RP+rSV+wCd06r27YO+ylTa8EhkC1pla5O22oRBm5atXlgtGSuRQOxjNjAMDdsuY6q+qO7oguun3HdxbdG3AwmtUqxb2Ta4vQulN74K145oEygDaw+AMV6GhjDKNcpghTPgJ3nXjic8lkqiqzC2EBpA3FrVJLHuSHbhwuDA52oF25o9BzNMONeiA1TzBPOdigTt5Bb5S+PEQMAPoM0fYgyYLJgu5LmMd1v9g1qpy1Mz/sUvel/bQsaHbVI7qG+YgEHX0IQo+z0jFmMSv8NcL2Xb6UxbnEviN7bilX/Re3Rc/nFpNTL3oa0fNC8LymgjO+Iz5x6nmOru29/YrZ6Gn/6oQeLmQd87gNc9JkezAASmlevJKQbHiSMy8SxzltVTftO940wZ3eqx+KBzt+er+b0t9jgUd2+Kh/RVjZJN/FG4JdmjV/3PQZun5k9z5c6BywYxBXhujT0aOzIwK2mQRo5O8BNXqMIy8AiQCKJeVfXWh9b5/laip84L4OxbiRE5jC4JjyuEtXUfHkN2rI5v3HkxYO4nrP/oFC5G8Xwz9D4oQWSVu38fGgxSNViNcmnn5u2JuuvE4Xwcrv3e3dOHzJ57+GidMVme1Cnae4dYwVjYetQZBuTqRLXaNqNM0o+Z5o3dsqYVCWBLZ7Gs8ueRKK02Gr2m8APYZD0z1DdOnytXTkEcMzgVBYMYXeWjlIoSAxAbjBndvpkI98a8TY7+MFxllmHUjyGA+1GRpInV5ZcmcLzhARau/0c72RQdpv5MnCj4E3j4fjg0ovX1ByWdCqLdcpNT76KQdyKYab/SDw6TWj3z+dUhnMfBRpiI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(36756003)(478600001)(966005)(31686004)(316002)(86362001)(6666004)(26005)(6486002)(31696002)(16576012)(186003)(2616005)(53546011)(2906002)(956004)(83380400001)(8936002)(8676002)(66946007)(66476007)(5660300002)(38100700002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNZVCsyQjZGT0d2aWUxOGIxSkd0NzNTcWVPQU5XNFJKN2lndnl1WnBIWDk3?=
 =?utf-8?B?WDdjRjBnckJxcy83Z0c1V3E2bWs2R0NRNDRmcWRJTXZFZHBZQyt0SHI3czRi?=
 =?utf-8?B?TUJrenJaWFVtRzRZeEw0TnRSRHBRQVJ2RlJzWDJ6ZFo1TjhkQTNLaWRsem80?=
 =?utf-8?B?SHFFTU9XbERtVGNjY2RWWVRoWEZjQ1NWNFZSVENPNFJJYTJvZlE0SUt1QUhT?=
 =?utf-8?B?NzdIM25EUXB5cHN2V08zREJ6dy94UmxQcUJ6d1ZvYUU0U25vbk82bk5XU3JB?=
 =?utf-8?B?TWpzYUpWZ0tOcW1BY2lDem1aTG42ZHpWdk1GSVJNKzlYM2F5SU5LeGxzaVEx?=
 =?utf-8?B?U1RBejl3ajJDR0RUNzFRRmdXQUtMU3lWVVRnd0d5K2F3bnA4cFc2NDBSSXEx?=
 =?utf-8?B?SU9GbDRBa21KeUZwL0llQzQrVTh0dkdWa2VleDMwSXBhQXg2ZFovR2I3RWxv?=
 =?utf-8?B?ZSsraFRwVTVsYm0wN3FmRDNNNFdXSzhhUldGSm04OFYwU3BEZW9nWUFYakYr?=
 =?utf-8?B?T01FVnp3eGlXVFgzT0RzOG1KaWJXc2dTTEprRnZxU1VDNWJaaGtpWVMybytE?=
 =?utf-8?B?K1NmSVpubERjTlIrVlEyNUxWL3IzWWlvOUJCZkIwS2RFaGs4WHZwVmcxbDJ5?=
 =?utf-8?B?bHpFeTFwU3c5d0xGSUhPVUtjOWcvZDlMSzd4SFl3TkM5N2F6NTc1Q2orWHNh?=
 =?utf-8?B?TkxyWlRFWGlFQ0ZSZklDRDVDZG52TFBybDZMNHIrWmp1WEh2dkJRODQ0UTBH?=
 =?utf-8?B?WUYzVDNaN0V1Ny94TFBDMnhqQnpBcjF6OElQMEtiTVlFTVFEVVBqNzM0b2RE?=
 =?utf-8?B?M2cyL2F5MTJlTStqZ0hweGZYc3Vvd3owaVVZT0hwckpuVm1GTk8zWm9ZVFRS?=
 =?utf-8?B?ZlNUdktTZTVrNE1EZHNGS05rK3lEVWppZ2tiY3JOeUpPYjFIdGJPR3IzaWRa?=
 =?utf-8?B?SlBtRGtUb3VyeFFVdkdkblBMcnRmMWxnOGxHZk1tQkR5ZER2U3NxM2c2LzM0?=
 =?utf-8?B?NW4ydEdadnUvNGZqTmlHUlRpVFNJNDkwWElGL0hFb3RLL1ZnaFRud3hDLzJi?=
 =?utf-8?B?RytTa1dpWjdhUUVFS0FJYWdDU1U0S0hLYkdFVkhEd1FodVFvNTgxWGtrMHFN?=
 =?utf-8?B?YUhqV3NmN3FDcThkdEwySmQxT1lYTVZuWTU5ZklIa2ZJWWg0NzFZenNQeEhp?=
 =?utf-8?B?c2VDTHlRS0k4dVRkMml6NnBSSkFSZGtMcHRudFRRL1FuYnVnR3R1eWJMbEU3?=
 =?utf-8?B?MVFyUytmMUVWUzJ2RVlWOGMvUktzZFE5WmtoV2NYWEVQYXF2M3NieitDUmRE?=
 =?utf-8?B?SStqclBJRGVGQzI5OEZNOHJPaTBxcG9MVkhCMGlhUFhuYlppdlphZW1yTmZ0?=
 =?utf-8?B?eW5oODZnMzJ6bTFORWc2Q01hN09GeVpJOUJrTG1scFFnb0RrWWk5YXNMaVE0?=
 =?utf-8?B?Wm1FckU3bmlXN0tHbG0wd3lNd2U0bDlSM2dVemlNNVJnREF6WUxRQnZoRk1R?=
 =?utf-8?B?UHJjaktaazZmNURaQlVnb3U2ZGZQL2o1bmJNU3NrbFF2SHVlZDB5Wi9HcDNV?=
 =?utf-8?B?ZVlEamU3R3ZaNG4wVVByeGdYNGxJamRHMVF5WENrUUFiaTE5ck9va003ZDZB?=
 =?utf-8?B?cERLUWROOEdyM2o1ZzB3U2p5R294VXRNcGpNV3IxbTBrZFRqTkp4S2hGcFdD?=
 =?utf-8?B?L3RHZmRXM0VpSG8vbWhxc0V1dzdWOUt4eG5EbUlYZ0E1UGJ3akErajBYdEZj?=
 =?utf-8?Q?iB05PNPZKlMOwmHe1PCwBhGLO6bCYEkp6BMaB1N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b1510-6493-48bf-246e-08d9458a8f71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:12:46.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkQ9K8jS8+2KZpxlPQCu6FB2hQ0B3V6qC2Etd+W9EAGeHLtGRbGRY8K7XX34HJaPZocNb5YjygOxw1t6s13BqInV0iFqqaN5/1/x8Fpv7RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3943
X-OriginatorOrg: citrix.com

On 12/07/2021 21:32, Daniel P. Smith wrote:
> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
> patch set is being split into two separate patch sets. This is the first
> patch set and is focused purely on the clean up and refactoring of the
> XSM hooks.
>
> This patch set refactors the xsm_ops wrapper hooks to use the alternative=
_call
> infrastructure. Then proceeds to move and realign the headers to remove t=
he
> psuedo is/is not enable implementation. The remainder of the changes are =
clean up
> and removing no longer necessary abstractions.
>
> v2:
>  - restructured the patches, breaking them up as needed
>  - incorporate Andrew Cooper's alternative call common code
>  - change XSM module registration, removing register_xsm
>  - incoporate KConfig recommendations
>  - reworded commit messages
>  - incorporate macro expansion recommendations
>  - misc clean-up fallout from recommendations

CI is heavily broken atm, but there is one issue I've spotted which is
introduced by this series.

https://gitlab.com/xen-project/patchew/xen/-/jobs/1418359368

In file included from xsm_policy.c:21:
/builds/xen-project/patchew/xen/xen/include/xsm/xsm.h: In function
'xsm_security_domaininfo':
/builds/xen-project/patchew/xen/xen/include/xsm/xsm.h:30:5: error:
implicit declaration of function 'alternative_vcall'
[-Werror=3Dimplicit-function-declaration]
=C2=A0=C2=A0 30 |=C2=A0=C2=A0=C2=A0=C2=A0 alternative_vcall(xsm_ops.securit=
y_domaininfo, d, info);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~


You need to drop the XSM guard around including xen/alternative-call.h
in patch 4, especially seeing as as you don't delete it in patch 6 where
CONFIG_XSM formally disappears.=C2=A0 The x86 build only works by chance,
with asm/alternative.h being included implicitly.

~Andrew


