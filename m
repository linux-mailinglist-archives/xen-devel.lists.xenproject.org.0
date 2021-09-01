Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59313FDDB0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176461.321123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR21-0008Nt-Nw; Wed, 01 Sep 2021 14:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176461.321123; Wed, 01 Sep 2021 14:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR21-0008Kz-Kc; Wed, 01 Sep 2021 14:16:01 +0000
Received: by outflank-mailman (input) for mailman id 176461;
 Wed, 01 Sep 2021 14:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqR/=NX=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mLR20-0007uB-9r
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 14:16:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d5064de-aaff-4d0b-b2e1-04820891abd9;
 Wed, 01 Sep 2021 14:15:53 +0000 (UTC)
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
X-Inumbo-ID: 5d5064de-aaff-4d0b-b2e1-04820891abd9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630505753;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9G1ixSwpVVNGO1qRAX6VZalDZxApZgkQDoR8Qn+vkJ8=;
  b=TsbSjKru0uqxfW7Z2gI3J5b+LdmwoiasA1xw0FDNYqTt+Mv1YCedGyHI
   QKUeJt26GR8aLlhAUCgjIfb0hO+6mIjjyEDbbtveSot1usJPJuvWmQyNf
   2NsLl/xNqgMNizd+38WZ/AqU4tlGLuPUtfuw3TB/y2nBpx0hEqFmTYbmu
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jReWgYl4LhKRC49tJO1X6kLz9XPWilzcEjx7uo+RU7C/pmTAF/49A7VNUznIYMmgmPzJhGwAMD
 b7kjXB2GgNsP2V+8FiD78hKAufV6WrT9K94ggJ7ZWWoJjjlDFbokr0R7KWtgmedrDCW0bed6es
 qtNVefiGvOCBv8n2wshBZEUN+JvxMpAfIIrfov99781KqSeY29eSxyGaWpbzj4wt9+TIH8qU3K
 pa0QvEdNb/uIfoc3SPuysCX0LiUVbjT2ZQ77VsiGjUEbgyq0dpvIzE0VnxPc40UJhL0k665V0v
 USu7frJixBq6jcAUVLjaSYOc
X-SBRS: 5.1
X-MesageID: 53539810
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:z7uTmqhJkhqUKspSXCnSq/OhrnBQXgoji2hC6mlwRA09TyX5ra
 qTdZUgpH3JYVkqNE3I9eruBEDiewK+yXcW2+gs1N6ZNWGKhILBFupfBODZowEIdReRygcn79
 YET0B/YueAdmSTj6zBkXOF+wBL+qj7zEiq792us0uEVWtRGsVdB58SMHfiLqVxLjM2YqbQRP
 Knl6x6TyPLQwVvUviG
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="53539810"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYbYmCJH+WJklh4o8rDBPVj/33lbhgYmnWm0ogsc4QS2Jm4UVOtgaK8C3ylx3hoXIq+KNLqqCowcF7OdNKllOV+Mw9wob6TVf1Bpn2QZxzHi4Hb/WQikuS4+Zo8S3vZl4e2GZqUAg9jWi4L9OXnYD+l/WjxTMQK2AxAMcm+JcO7q5v4QJ9pq4hEXD66g+sYbwg7uFmOWnt8U2j+Rm+bN0+8KFjLPsxnKlDv2tVwYt3+y2V9jLsWspy/xtAaYn+QvIsL8ZwDwpABJcput94pmiGPlE5yMW64NMY9C3QILsGvRbkLGNGYL9JT8EGmcDB0goJjY01O1TpMSXO20CXMwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiBzRMexSlFVfa1By3ARHlf7/NosDQULtDXwjFeft14=;
 b=Wa3zR+FNV8Z1gbEQFgdsf/oFNVGQyg8yediOTYI1UeP+0BySo1ZIQ8zdcLi+2gJnCjgXUek026qJiBBSjDl2Q+Uqk0dPY85EzqKtrCTFX5Y2J6KpqATdp4tbnms/pP6XfvOMMtCB8nq3FzC6UaHisIOGjyemi18EijjDZWp7KfGTUFyAEQncCfUoDSlDw8UZDy6Q23RkyHBtNAViSf+La6lcHLp+ljyYob+o1pQ3WPDOW1znNeSq67W3GU2AaworQvC+OmMFOXf5nEST0Xs764pwcMOWDgOLbSAD43D2l6o5v0/4y8OoCbKUUB0+AH2W158VM1c1AeOM13JUKNXifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiBzRMexSlFVfa1By3ARHlf7/NosDQULtDXwjFeft14=;
 b=VdL0Rp8yod+mjLG0Tisy0+BaIegQ1GRk76S/9mYeOKVX+cklOFIFD0yQ9Q4Xj/tqRh3EMPbLlqLtdmwbQpFP7R4tNTio46zyujxWcByKY6SYvBgONu4Zvzcz4Unr5CBzageoXlayIjkmExIFI5MWNCnPfJv7rQA4O1X402Gs25M=
To: Jason Andryuk <jandryuk@gmail.com>, Xen.org security team
	<security@xen.org>
CC: <xen-announce@lists.xen.org>, <xen-devel@lists.xen.org>,
	<xen-users@lists.xen.org>, <oss-security@lists.openwall.com>, "Xen.org
 security team" <security-team-members@xen.org>
References: <E1mLMZy-0006TJ-Rw@xenbits.xenproject.org>
 <CAKf6xpsAz7oPX+PdZokm+BAqreqL8rnrAd9UYvdz=F0M-bcMUQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen Security Advisory 378 v3
 (CVE-2021-28694,CVE-2021-28695,CVE-2021-28696) - IOMMU page mapping issues on
 x86
Message-ID: <43ba10b9-4b20-81d4-6bdc-18f9c2e2e0bc@citrix.com>
Date: Wed, 1 Sep 2021 15:15:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAKf6xpsAz7oPX+PdZokm+BAqreqL8rnrAd9UYvdz=F0M-bcMUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 233b439b-3171-444e-d1fe-08d96d53000b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3861272ADC8D5D63FA919C73BACD9@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlrVzEdOwyd4p4YyT1+xDKvUIYH2vTA4KKrgtaoryH3DoBaZ46y8fKkPSzQ9uzSu9oysNpyIceLKBiVg/7kT7fGthqRZr3977LbToSj9wmXxb+8uHdgBOIbjnSOI5UV4jJ2Sfa6tDvZjl9SHipB1aAsEFfzijD/eVN3zDalPBq1SKD0v8yufF2tH8YOtR0r+rd7109tZNVbTY2TbU+QMYNhnHccYRG4OujO2Nc5Wm5N5E6E0eML9Uji+BWZvaX+RW4ENC042hiOg8Z+VVDRzQzJMXmTvcFwsSX3uFFmrCzq6H/3E6I6i8oowAJoyRbKcAfxjRJHjAqmhuNnCAOjGtMBwnsT7yZiRdFktmioSOEILIluQM9hA8t7SRKxEOZ86YUataMsPnUPgS/ZxL4nky1JjCmINEQjrLI9fAoSrPO5uJ5czYxUN8+xY6xxOxZ+hjZK34xx1aGJ85XvncNKNNoSwrDfxMsPIxqtr0wBHhfWwnFw5m2kmVTpOj+nCCiM+cHphpM0nxDUnEcV2AoajXtD1aEC/4Y6A8zZn1CBJvuCxUyhNJkN7BhZFCdU0jPqddc4BxmJiyYqSv1bASq8MhT+ZA406dxX28jwZoMHAqONhEPVRnWLTwMzYLsHYeuBgCatBg5hpof7yldRsy91f1GPraIgZZce35lotcc8QDvj+b+2ha/lUUmgxWnKf5oUYXa2rQMSJCBT38c/VY0HzbH1PzkiqFWrS0MqiJNYBjAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(38100700002)(31686004)(86362001)(6486002)(5660300002)(8676002)(66946007)(8936002)(83380400001)(6666004)(31696002)(66556008)(66476007)(15650500001)(4326008)(316002)(110136005)(16576012)(26005)(36756003)(186003)(478600001)(956004)(55236004)(53546011)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9HcXcrVkIxOHNFSXZBWjVwTUQ1d0NPWDVZSUh5cHptQ2V5K3RRQ3RDSVJH?=
 =?utf-8?B?TjU0UGV2UWt3SFYwNlVkdlllbTFtMVRIVjdNc2diYmVGSWtRTjJLMHpnaU9u?=
 =?utf-8?B?RGxDVm13Rm5PdGoxR2ZWVXRBRVV5bWVWZlRadDdMSyszcHhPRXdLM082NG4y?=
 =?utf-8?B?U20zM1dVRXEwbU04TWlRMk5ZeUFHdkJpRHN0UEJlc1dlV0c0WWRYUDRCa3pv?=
 =?utf-8?B?NVBBSG5HeHlPbS9KcjBhMFQySU83YVVYUlppbzlsYm9hN0JyYkNsb3Y2TDMw?=
 =?utf-8?B?dmNDK25KdDhlVDVjTHpsRG9WWkVkQWhEaG9CMng3MUF4L0ZuWWtKc1VpVGwx?=
 =?utf-8?B?VkhveGlJZGxZbVBkNXU1VlBSSGo0SXNyOHNOZ1BRa1l3cGpUcE1YY2ttZFlE?=
 =?utf-8?B?c21SNllQVncveDJSN1lIazlnZ3NGdFA1TklnMDUzNVozZnVDMjBIakEvcVMv?=
 =?utf-8?B?RmM3NWcyV2llcnBCSWN5RXVLMTBNZExSR0xHRFlMMHNsMms3V3ltTXJnQWZT?=
 =?utf-8?B?U3Z3ZWIzT2hzRks4MlNNVC82eFlUUy9KRm1qd3RndnMzLzc0aS9JYVZ4UUYv?=
 =?utf-8?B?UWh1YUUveW1EQytyMkFsQnNuYkJTcUhGUWN6MDkxZE1JTzlRRWQ1THIrRDJp?=
 =?utf-8?B?LzVnSUFpNVB2Q210bE9nVitKMXl1ckgrN1Jtd3A2VHhOV3VtcG9GSG56Q2xk?=
 =?utf-8?B?NVZmWmFydFV1aytUZDRtbW8vOG1yYlkyMlVVYUduMXMzQ01Tc09CSzhQNkVD?=
 =?utf-8?B?UGZVamtFaW41NzljOHJFNW5nWHJ3N1dyM2o0aHVua1ZEVHFjbEVOaUc4RVJW?=
 =?utf-8?B?cjdwb3dURGthM1FOSVRGU1M5bUwzNlFXY0NBWjk3Wkt0UCtqYlNzV0ltZnRZ?=
 =?utf-8?B?bGRycXZhano5dEswYzY1TUlPV3NzS2grQXJIbjZTZnk5RWN0dVY5K3MxVGtN?=
 =?utf-8?B?V2VwdEw2cWZOWTNjOUtaTXRCQ2R4UUdFbzZBVWE0NktSdlZzQXFFcHdkRGkr?=
 =?utf-8?B?NWdXc1hoQmJRS0dTSE9mZ3gwbWgzaEczSjQxTWlNYTFxNUxFV1U0TlpPWStE?=
 =?utf-8?B?alJoZUttcXBFMkVzN2JMM0lDWVpSTDJ1THNaMVNjdk5QOXlSSW5OQ0FrTjJJ?=
 =?utf-8?B?VGs1bWwrS0xhZW0xNnlIU2pzL3NNRkVCbXdaTXJwWnJnTzBKbVJpcHJGdzN3?=
 =?utf-8?B?Vy9HYlljTExCYlh4VFNTZDVvc3h5U29HNTdSV1k2cXZ2L3lQRnBmZFFEcXFx?=
 =?utf-8?B?b3h5NUwvZm40YzlOeG5lbmlORnNsa3luSVdpMnBUaG1rVFdDQXFtQmdmQUtC?=
 =?utf-8?B?UWpJMENqRHdqbHZ5c1I1UmN4dFc3NTJzRy9lblVPMXpnUURJbHFTUmtvdU1M?=
 =?utf-8?B?bVlabGxiVU13SUVLUGh2T3hFbFlCTWZ5akFwUVNjRU9ycTRqR2Z1VkhBRTVW?=
 =?utf-8?B?aFpmY3pDcHl3ZjBaYWU0eC80SDRlMDEweWtvVXo0SjBUeFhrS1hMenljU1dF?=
 =?utf-8?B?V290azY4clBRTHFEYXRoMUxJeVdYVzNHTHdNUEdHU0dNSkI1SCtBemdkb1JU?=
 =?utf-8?B?c1Z5dlpuVlBBeG54dkdIOHNkcXBlakw3TmpYTkhSbGNUa3QrT053eSt6a3Nm?=
 =?utf-8?B?RW1Ta3VLNitPbkY4eGlzK3drMDVIM1VqTWtOUDY3VWhVQ2xlTUFOS3JGSzA0?=
 =?utf-8?B?M2VIelhGZ0VPYzVvSDc3UEs2R3NiVjM5Wld4SllzeERqOHQyTTQ3NXNza0x4?=
 =?utf-8?Q?0DErMNqBZ9c7rzkGe8H8u5vpqTcCFSAn3gpVEJm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 233b439b-3171-444e-d1fe-08d96d53000b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 14:15:50.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js9mm6UeiYw54KeNyeuL1/3dX+wMRzRqyXCYzraVNrPAlbz+LVflrRnXipHl6auEZ3JCC9BqUqRaJl448oUYifNePqRHFx20mzllBhakcgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 01/09/2021 14:22, Jason Andryuk wrote:
> On Wed, Sep 1, 2021 at 5:34 AM Xen.org security team <security@xen.org> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>>  Xen Security Advisory CVE-2021-28694,CVE-2021-28695,CVE-2021-28696 / XS=
A-378
>>                                    version 3
>>
>>                    IOMMU page mapping issues on x86
>>
>> UPDATES IN VERSION 3
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Warn about dom0=3Dpvh breakage in Resolution section.
>>
>> ISSUE DESCRIPTION
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Both AMD and Intel allow ACPI tables to specify regions of memory
>> which should be left untranslated, which typically means these
>> addresses should pass the translation phase unaltered.  While these
>> are typically device specific ACPI properties, they can also be
>> specified to apply to a range of devices, or even all devices.
>>
>> On all systems with such regions Xen failed to prevent guests from
>> undoing/replacing such mappings (CVE-2021-28694).
> Hi,
>
> Is there a way to identify if a system's ACPI tables have untranslated
> regions?  Does it show up in xen or linux dmesg or can it be
> identified in sysfs?

It's possible, but a little convoluted to do.=C2=A0 In dom0 (and in an empt=
y
directory) you want:

acpidump > acpi.dmp
acpixtract -a acpi.dmp

On Intel, open up rmad.dat and hexedit the first 4 bytes from RMAD to
DMAR (yes - really - this is how we stop the dom0 kernel from trying to
poke the IOMMU directly.)

Then disassemble (iasl -d) either rmad.dat or ivrs.dat depending on
whether you're on Intel or AMD.

On Intel, you're looking for Reserved Memory Regions, while on AMD
you're looking for IVMD ranges (specifically, types 20 thru 22)

These, if present, describe a range of memory needing identity mapping,
and a scope of the PCI device(s) the range applies to.

~Andrew


