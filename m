Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B569A3EECDC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167836.306405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFybJ-0005aL-IO; Tue, 17 Aug 2021 12:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167836.306405; Tue, 17 Aug 2021 12:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFybJ-0005XF-EV; Tue, 17 Aug 2021 12:53:53 +0000
Received: by outflank-mailman (input) for mailman id 167836;
 Tue, 17 Aug 2021 12:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFybH-0005X9-Ke
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:53:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71e1a98e-a204-4943-83b6-88261d7a6364;
 Tue, 17 Aug 2021 12:53:50 +0000 (UTC)
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
X-Inumbo-ID: 71e1a98e-a204-4943-83b6-88261d7a6364
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629204829;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WcSIQgGRz66BxI1NNov5RrcC/NBJ6UYUB9o/f06qFbk=;
  b=D1ZPEnz0w7KncHIGyaaxtPqMSCeo9JoOHOGfjgzrwPiAEbF4iqPr2nrc
   6n6H91UXKOABR6fj/7erGGS1A9+WC/OkQlUBDuyM4BEjzUDa9rpxjIb55
   Oaa/oyafLARlpVM3zGSOTgSFZLzyS3+DBdn/qNYECt8rT3f1CvhqpJ7dx
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5WVd0mWIwqRQYbubX81XPpwLbhXtriQFW5nCmqQGwGN71rFSgkYTshZWpGdHdElZ4sg3lQ9d5a
 EEk+5x3rYLU4WRpYUZ+64U4BwQk78RIuaiq1qnexNnjAq9AONkC9I2GeJ4bgjh751Hs0tHGxjH
 PoMFBDi8VYX2/p/YuWlwnb1YUA6EXkaFDvIO8uLYqANdpyMhX3IRrAi178aPkiZ9zWQmGay9G+
 NTio3x4RywKE9c3GiYxQKPCcuySIXf95u98rcVpoG7L1eTlsLiuYVTYSdBm2M4W1afBkA1w492
 x4WYPEdhAlRYdEbaK2MY+aT4
X-SBRS: 5.1
X-MesageID: 52342421
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BaZhaaNtKbvTuMBcTqijsMiBIKoaSvp037BL7S5MoHBuGfBw9P
 rAoB1473LJYV8qMRkdcLu7VJVoL0m3yaJI
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="52342421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOpbBw/ZPptfucWH9qny6kBooTSwiiiRXZdM1rFbFAkrebfiW3ZRzbUG7mKLwbCgjH59a4Vqy5FT00ahqfukqsrr7Cp2KP1Df7fmFwIHzpZeeL/UyF0MIsv6OpiXGQHd52k6Z4TJ3+1BTb8WEERGWC1KS2m57/wCNvskiGWRFawAMONi1dofX9KkUBrqLUMHbQE/LkbTeTDOlkv9YJ5fuFjjKeEd9tJ5/2ysUNN8C0MIOpMpLaclcvOBInmdOY887WT+rhupUWu26ULQeYb36FQIkgGrzqaCbr7Erw/U1fUhb8zcCRZdsxVgUhoExxlWEj5GBNXpQVealA8mG0F1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRAH9Zu/Mc3LGc/E/kv+wRqJi6vAKm1eZA70QeYD+9o=;
 b=d3UudYENYjKMShre/hvXdMWg2ro8fgOpTQzX1dDk660XQOKXaVd9lVRK/TRmP+aldW6y3qdwKs2zyVpQHemrk9wQTVOldcO563OLe/dru3RPnKHiMYAJksndSNoBtUtn7N18dyfpiBbOwxGbMGTxmWWe7po2MptLI01y7oCXVZS5iqJyIky1EpMft/d69Dr4kVKmF/rTiCCbkUrw7xM/MQ69MoofB/F4PCwKc1w/vDKrLFi1zy2QY+0UGKFoO8C1rZ9AXneOafkjeIEl3MddU0fAbkLQU0QBdjMAZVntGXZcdOLbwPpZgYQsqK3v5QZHgE+HVAv5+Sp101Bgowt+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRAH9Zu/Mc3LGc/E/kv+wRqJi6vAKm1eZA70QeYD+9o=;
 b=kk0hcjR1olUK08l2MYExeq+EMRoupA/cFl1i++Herr7dxZdXtJ569Mg0qEiC8PRr8ZdKqF5j70h94uvH+poJnXCIi2BIxpArovG7PkzGanJxg7hkR4bGC3Roqj1cQt4S4+7xCqpKulLQtC3NxU1igIO388ssBfRKFmN7cBuw2CY=
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: S3 resume issue in xstate_init
Message-ID: <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
Date: Tue, 17 Aug 2021 13:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d1c36e3-c8ab-4c96-638c-08d9617e0cdb
X-MS-TrafficTypeDiagnostic: BY5PR03MB5077:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50778ED77277A98D093A3087BAFE9@BY5PR03MB5077.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzGJ9iOg19cDTGW7DGFy43hH/gWLeESeAnsq/7RJxCWcEar8gsO/308EkejJEuxKEoA63scPU2D5DZLy7WDp9ayqZZaCLkbiv46ZS0bKMn0+5G5Z+WinvorQCrpMEmCnDQOfN5U3x7dxfQD0Qa6Z3n2BboOwLdZnI/n9QcC3+U2fdu+JxyV0PxIc6FhP9ZcQ4pp90nBwRK5hoz5Za0Es0p72mgf/esbeodm4GtHFhxa+iEOybV+KZVVdVCOaJ795Nz5Wqa/r50RKA1v8jXsjxuCoSRaP77JomoSRnAEmCSZuhlS/g417EuYLVvfwYHrhYemnrbJAoNCw9ctq082HE/zyp/e5AHtPkIWxP6fEMOUkydkIgqhHUNETsi4deEjCbZS4x2rLbJmcWMF2xduugDmK6/Qv3fngdnlh2OlhknJVnFqV9w5HefQlTPE7t2oWP9O+H9VnxE6eNeOhzqYz6y6E2hgimQyIUIEyc38pDlHFFKOysX710BHEqGNdWOFlb6S+z5I5MWNjde6Q3H4g1aiQMxlwzWzDbqrUAZ2lejTi/4v9UVYJAhtPcfqD7b6SdC4/3WIi7XwoLw46fw7JdtQr8FFKytWnNTf28tGS+3qkiFf1cji2RbChjbsk1htfgAOBcQhhl01KJknPf2I6QZwReUyy8uYWjuI/VR3r4I8O1gIrAlE9DDxp/Y9viUZd508PT0v69DvdGLz0Bqb7Oh/A+RRsKGSd2gUA+yRc5F0ikNS1zo9h6977+t4hjegCfMGrGUEVEtIz84bMfwsvGZsKBCK+SK+/XgsUiUmL2K+1Y9f1cP9+EYqsH4J/FI/l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(66476007)(966005)(16576012)(66556008)(66946007)(316002)(8676002)(53546011)(86362001)(478600001)(45080400002)(6486002)(5660300002)(66574015)(83380400001)(186003)(31696002)(6666004)(31686004)(4326008)(110136005)(2906002)(2616005)(956004)(38100700002)(8936002)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnQ2clNCVjdTQzVyM3NkbGUwWXRacHE0WE5RbGtOWmtvRkdYMWZGQUtlSzFO?=
 =?utf-8?B?N3ZDSmRlQUpUbmVzSGRPeTZHMlcrbXBVNWNJZXJucC9mOHUzMWtmaUtyVnEw?=
 =?utf-8?B?ZUxmV2tmUzI3amlTMTZrVFd1cGtxQ0F5UEdGQVZaTDhjaGpPa25TKzI2azNQ?=
 =?utf-8?B?OG0xc040c0VkajRQM3FmSkZBQ3BFQjdBZDJ0M1YyNHFZUnF4WmdwRVphRGw1?=
 =?utf-8?B?RWgyT01ieVZLMFZaL1dVOFRWRE54QlI1T3d0cURPVndhbFVSd2FvTzd1aURF?=
 =?utf-8?B?cmVCSll0eW5iWW5JNTVMdVVRdXg2dTZjQnBrdmVxSkdCL0Z5VFV3UFdkWVlU?=
 =?utf-8?B?b3Z1bkhyRDB4dWg1T25jaElNOGRKczJxaHFHNkFJZTZWdFdXM3dyTWtrVzlS?=
 =?utf-8?B?MWwzRXJTQ3lNYTRmS0hBY3BjSUlVdDNZU2ZZR2plMnhFWWFzMkpwTC9TclJl?=
 =?utf-8?B?T0lTQnpsQ09lYmJGckNsM3RQLzMwZGVBdk40R1dEY0VnRkxsY3d3Ym1veGhX?=
 =?utf-8?B?TlUwUGRkc2xBOXB1WnYrZFA1enhJUjkrb09KRkszSVpCeXZWY3B6bHE2L1lT?=
 =?utf-8?B?OFY2ZkxJVGdhLzJXcjI4Y0owNGViL2R2elJjTjdrRVQ0akJIbE1WVlhmWVk3?=
 =?utf-8?B?bERGVVhZNzJUOTdkYmhYVklCWVdwYVlZKzVRaFcvNVJ3NnZEQWxZSG5lOE41?=
 =?utf-8?B?NEFLYzRsN09ibGdUdGxSK1VpWEZwaGJ3UFhvcWN4V3F4R252aHU0d2NOWnBK?=
 =?utf-8?B?djNreVQvZzV0d254OFY1dkl2MmczVEg4R1Y4UklyM2tLa2Rld29UTk44cGMv?=
 =?utf-8?B?U0E5RmtJOTl6OStFSFpxdW0rTzc5b0N3K3luWUpLRldUckh5Y0k1RmdzNml1?=
 =?utf-8?B?STh2bWF0M3VUQVpocnR0bG1FLzFLR0FDdUQ5VHQ1dGdCUzBUZU9lNE9IempW?=
 =?utf-8?B?N1haL015a2duZXFvTW4xWEhFMS9iekRiMTBEWCs2TFNjL3hNU1gxWUdnSDZY?=
 =?utf-8?B?Umt3dURlcVZobjJXRVBSSDRrdWs0MmR0TXArdHVvSE11cTlGa2hGbWorYk53?=
 =?utf-8?B?amZGajdQSE82ZU94QmlHTlFzNm5vY0cxUkNMQ2t0cVNESU9vQ2JtLzdub2lQ?=
 =?utf-8?B?dlRVUTdkajYzcGxXd1E1SlBxOXFURGxlN2FTcDIrcW5jUU5VKzgvSFZLcVNo?=
 =?utf-8?B?NWdIK0JrK285RThjT2FKOUF3N3p6UVJEMGV1NWhqZExweGpWQTFwdG1sOGZT?=
 =?utf-8?B?UVBGUU5Dd253eTNXSHFXUThDa0lZd3BDM0JpSjhta2RFdEx0cEFoOG5hK21y?=
 =?utf-8?B?Z2djaDkyTk1XUXhNa01QK1RoODNkeHExTHRhTmJxVC9NV1RWVlZFc0lWbU4x?=
 =?utf-8?B?YkRwSEtlbjlNWDlObXdpaWZhSEZPamFsQWJmQ0FUVXc1WDcwM05zbUFHaWNW?=
 =?utf-8?B?UFRKL1FhOVg0SFBCRndWWkN5RmN4L3BIR0FBRG5NeVd3RncrYi8wV3NSNC8z?=
 =?utf-8?B?eTZzMEp3cUlYMDlIeGEzNnk4aHA2VFY4Q2szc08xMEJ5Qy8wcFM5cXNHaWxk?=
 =?utf-8?B?eDh2ZFFjRjkxbVNQaENWZnlnWWRtNVpWNks3Q1RnM0ZZL251VzloWklXMy9k?=
 =?utf-8?B?N3ptbjV2V2FkeWxsaXFvZDNibU9hc0FIRmtLK3plcTlxd2N6UFAwMitWOUpj?=
 =?utf-8?B?Q3MrLzZ1K3hmb3lDRThJVnN1bThVVmlPL3VzUDRuTVE4clhoaURaL1ErT2VE?=
 =?utf-8?Q?dkGzp6YBXbwbAMoK2j/b2/b75k05aZYVrJBZg7L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1c36e3-c8ab-4c96-638c-08d9617e0cdb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 12:53:46.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd2EspdRmu5kosFsOvTjiKERVPvZqaLipPPOlvFrxc9klarMUs3oMFaGqCWms8shGsJfijCGhxRVpnYtNU9O/Z5JYuj5AuQgeNmM0j5nfGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5077
X-OriginatorOrg: citrix.com

On 17/08/2021 13:21, Jan Beulich wrote:
> On 17.08.2021 13:44, Marek Marczykowski-G=C3=B3recki wrote:
>> On Tue, Aug 17, 2021 at 12:14:36PM +0100, Andrew Cooper wrote:
>>> On 17/08/2021 12:02, Marek Marczykowski-G=C3=B3recki wrote:
>>>> On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3re=
cki wrote:
>>>>> Hi,
>>>>>
>>>>> I've got another S3 issue:
>>>>>
>>>>> (XEN) Preparing system for ACPI S3 state.
>>>>> (XEN) Disabling non-boot CPUs ...
>>>>> (XEN) Broke affinity for IRQ1, new: ffff
>>>>> (XEN) Broke affinity for IRQ16, new: ffff
>>>>> (XEN) Broke affinity for IRQ9, new: ffff
>>>>> (XEN) Broke affinity for IRQ139, new: ffff
>>>>> (XEN) Broke affinity for IRQ8, new: ffff
>>>>> (XEN) Broke affinity for IRQ14, new: ffff
>>>>> (XEN) Broke affinity for IRQ20, new: ffff
>>>>> (XEN) Broke affinity for IRQ137, new: ffff
>>>>> (XEN) Broke affinity for IRQ138, new: ffff
>>>>> (XEN) Entering ACPI S3 state.
>>>>> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR =
0, BCAST, CMCI
>>>>> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
>>>>> (XEN) Finishing wakeup from ACPI S3 state.
>>>>> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 20=
21-01-05
>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
>>>>> (XEN) Enabling non-boot CPUs  ...
>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
>>>>> (XEN) Xen BUG at xstate.c:673
>>>>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
>>>>> (XEN) CPU:    1
>>>>> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
>>>>> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
>>>>> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 0000000000=
000440
>>>>> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 0000000000=
00001f
>>>>> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  0000000000=
000001
>>>>> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 0000000000=
000001
>>>>> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 0000000000=
000001
>>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000=
3526e0
>>>>> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000=
000000
>>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
>>>>> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b =
0d cb b4 0f
>>>>> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
>>>>> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025=
dc9fd70
>>>>> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000b=
febfbff
>>>>> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d04=
02e43ce
>>>>> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f0=
0000121
>>>>> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f0=
0000000
>>>>> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f43202=
952286c
>>>>> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007=
a484730
>>>>> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085=
dc9fe30
>>>>> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d04=
02e0040
>>>>> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 000000000=
0000001
>>>>> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 000000000=
0000001
>>>>> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 000000000=
0000001
>>>>> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025=
dc9fee8
>>>>> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 000000000=
0000000
>>>>> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 080000200=
0000002
>>>>> (XEN)    0100000400010000 0000002000000000 2000000000100000 000000100=
0000000
>>>>> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a=
0000000
>>>>> (XEN)    8000000080000000 4000000000000008 0000100000000000 020000004=
0000080
>>>>> (XEN)    0004000000000000 0000010000000002 0400002030000000 000000006=
0000000
>>>>> (XEN)    0400001000010000 0000000010000000 0000004010000000 000000000=
0000000
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
>>>>> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
>>>>> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
>>>>> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
>>>>> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
>>>>> (XEN)=20
>>>>> (XEN)=20
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 1:
>>>>> (XEN) Xen BUG at xstate.c:673
>>>>> (XEN) ****************************************
>>>>> (XEN)=20
>>>>> (XEN) Reboot in five seconds...
>>>>>
>>>>> This is with added debug patch:
>>>>>
>>>>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>>>>> index 6aaf9a2f1546..7873a21b356a 100644
>>>>> --- a/xen/arch/x86/xstate.c
>>>>> +++ b/xen/arch/x86/xstate.c
>>>>> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>>>>>      else
>>>>>      {
>>>>>          BUG_ON(xfeature_mask !=3D feature_mask);
>>>>> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"=
PRIx64"\n",
>>>>> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask),=
 feature_mask);
>>>>>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_ma=
sk));
>>>>>      }
>>>>> =20
>>>>>
>>>>> As can be seen above - the xsave size differs between BSP and other
>>>>> CPU(s) - likely because of (not) loaded ucode update there.
>>>>> I guess it's a matter of moving ucode loading somewhere else, right?
>>>> Few more data points:
>>>>
>>>> 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
>>>> 2. I do have "smt=3Doff" on the Xen cmdline, if that matters.
>>> As a datapoint, it would be interesting to confirm what the behaviour i=
s
>>> with SMT enabled.
>>>
>>> I'd expect it not to make a difference, because smt=3Doff is a purely X=
en
>>> construct and doesn't change the hardware configuration.
>> Uhm, changing to smt=3Don actually _did_ change it. Now it doesn't crash=
!
>>
>> Let me add CPU number to the above printk - is smp_processor_id() the
>> thing I want?
>> With that, I get:
>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgist=
.github.com%2Fmarmarek%2Fae604a1e5cf49639a1eec9e220c037ca&amp;data=3D04%7C0=
1%7CAndrew.Cooper3%40citrix.com%7Cf7c03eb0fa0341ac60bf08d96179964f%7C335836=
de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637647997122346495%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DYZg2191dKLlppcbdCBwTnXuk08Vq37pcHOftyjrGO3Q%3D&amp;reserved=
=3D0
>> Note that at boot all CPUs reports 0x440 (but only later are parked).
> And for a feature mask of 0x1f only 0x440 can possibly be correct.

As a complete tangent, we really want an mpx=3Doff option (or extend
cpuid=3Dno-mpx to clobber bnd{regs,csr} too).=C2=A0 For systems not wanting=
 to
use MPX in the first place - and I'd expect QubesOS falls into this
category - this will increase performance by not partitioning the
physical register file, as well as reducing the xstate size for client
parts.

> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
> write, due to the cached value matching the to-be-written one, yet
> the cache having gone stale across S3.

This is a rats nest, and area for concern, but ...

>  I think this is to be expected
> for previously parked CPUs, as those don't have their per-CPU data
> de-allocated (and hence also not re-setup, and thus also not starting
> out as zero).

... we don't deallocate regular APs either, so I don't see why the smt=3D
setting would make a difference in this case.

To be clear - I think your guess about set_xcr0() skipping the write is
correct, because 0x240 is correct for xcr0=3DX87, but I don't see why smt=
=3D
makes a difference.

>  I guess an easy fix would be to write 0 to
> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
> to the early "if ( bsp )".
>
> I'm not sure though this would be a good fix longer term, as there
> might easily be other similar issues elsewhere. IOW we may need to
> see whether per-CPU data initialization wouldn't want changing.

We've got other registers too, like MSR_TSC_AUX, but I don't think we
want to be doing anything as drastic as changing how the initialisation
works.

The S3 path needs to explicitly write every register we do lazy context
switching of.

~Andrew


