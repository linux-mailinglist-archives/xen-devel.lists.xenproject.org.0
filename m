Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9330873FFF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689478.1074516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwMd-0001Yl-VK; Wed, 06 Mar 2024 18:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689478.1074516; Wed, 06 Mar 2024 18:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwMd-0001WI-RC; Wed, 06 Mar 2024 18:51:39 +0000
Received: by outflank-mailman (input) for mailman id 689478;
 Wed, 06 Mar 2024 18:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYTB=KM=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rhwMc-0007k1-6U
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:51:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e88::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f09cd48-dbea-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:51:36 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Wed, 6 Mar 2024 18:51:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 18:51:30 +0000
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
X-Inumbo-ID: 8f09cd48-dbea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+y7TdmXNxBluEQEIVpgetIXXewbJNh+/VaSrdg2F6mhOGzvkvmXTiAuhOXl0eJlFFlWNwW50ZZ7QL/Il3WvNZi2/nMqcgo7lj5tU+zgNp0sPLYFoqz+VjSEZdsyXh7ZnYLv8XlbUeNtIDp4hU5Uh0pf4l1WeNBULqy3mWLuwFPeZPQ9SpSeVj3AbxQHGWj7uzioF2C3n3KC2Qo/GSb0squdHDURfsoYpqtzR46kvvZC0AJmAyv2a6thT3Cyd3oXdNuZNlTbimA2VOAoJ16nseojLYS7Jz7WCfiClCoSkthR01DM2gFdFk02HyHcHDIUxRl+4lcGOP7vrtZVCU2vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njBIOzkPXzMFuv63yYQen7tK22va6bbzgMd3rSifM58=;
 b=kQxWnok/YXbUtLREMMbKbsErJt+U9QTQk6r57e4QAfyIJdZAL+t4SrX0/Tn4yhcPRFoc+hvRJPa+ed3y4XMNTb6mJ0Js+ijH1lRCCOHIO2DsgH+Dh7sXqvUskU6HNF5SwskV0WYSjhb7n1HlQS19CfpcTupOwnj4k9+AWnnpqtUOEY4NYFEPabCx/4YvmxTrQZMR5/r8lbNt0bkaTJrhSTyzuacNcQlv3absakr13EluhQC/JJSQp+qL5ofMwtuvEsei4YxNQPkIJBkQ54VKaZ83TGzJ2FTpdiONaorNbvPPQfKlUaXB0AbRYcGWKMPMdtnGrGsyb76NyolsZO/XmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njBIOzkPXzMFuv63yYQen7tK22va6bbzgMd3rSifM58=;
 b=mECtXOdOoVlr3XLksvSqT0Xi0X69mUxigSrJ9xn0FpIVER3Vs20tyTnq8UPfU3dxqJz5IlQgHVNC492pUAXDUstojOnWJjh65U/Fd1YtOH6Udto+10vYa305FgHLh7Hc54HgqAAKL6Et8xM3KqrSzvIPetQAkDGFF6bYe6IMGPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
Date: Wed, 6 Mar 2024 12:51:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
 <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
 <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:806:20::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f1788e-f486-4727-a15a-08dc3e0e6fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TrhbM8zNiwCEN4aKk6yAiZm8qb991xjuTp9A0NUQpvcsDXDdT1oK7xj8mkD4YMIjCgi9R/Kdf/K/2pw8R6AFOnCOTfkztDToT03kJQqHjhElZkTied2u/bN0KJ9UxmnoRyUsfagAu6JiabkeE/AqFk5KKv3/gsbcBM17J3rsAbh0nTp4EK7rRI8c2NkVDQg0IZJPhtrPn/PjDZzfUOr9tozWVvhGccqWQLjVo9L7ONyP8JnV5RO1Wz2O7/0GLophTUdoeiBbB5VQsaFgl39+PzlAI7SVM/asz8RCGynyuLcqQ1ECpMXGPIBDGSNDT0aT0kT1XZz5hql+ovOauGPpguRo6yzPi/D9wWTk21DTvgPbbgNDgIO0mMxR2Cscl7rakDkPU7qhY3AQRrfb1BFJaYmPDT7T/ZTEyHN5BjE6/7mQe4V3E+R7onsg+G807BLRjSgvYJWJBobnQ3cePnHC4qzXy26z0G6mLnSoqxS9Y1RAKukZHvtefcMFvX+DfPPY6L/F677WmzhAEYn6NMOcKWgtJH7eMN40leKTDjl9AymkL3j9Q93GzWNsDtvO5Nt/S2VeRRrUfrZ92X0AdkvPdMX+m8oKJbRGiO6Uoc0D6Ro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2RkcHJQNk1JVzh2R3JwSGV2Y2dRcFFuVlN3TlI4NmhOaHRqMHFxTzVMd2J6?=
 =?utf-8?B?WFI0RXl3MGRpRjQ4dmdJNmxid0hMU1hRdUdISHA2RWE1SzZPQllvNXJtTUV3?=
 =?utf-8?B?QXJuN0o5bWhCMTUwK0IzYVhvcnNVM1NmVlNxZHZ0bHlvTW5pSG9vY1J6RTNF?=
 =?utf-8?B?QWM0SVVRQzNmU2U0UVpKWWkzRGNESWRCcWg0dGNaK2UwaVhzSGxrNzhoaEh5?=
 =?utf-8?B?eFlIUEVneU1sQzNKYzlTNWJYUUFYeElsMnVuYW14L1ROZTJvSlFHbXFiLzZQ?=
 =?utf-8?B?MklPZlhwRHFEUjFBR2xQM214YzNKUCs5cjA5Szc1eGQyOHhhNVY1aGtJdDFE?=
 =?utf-8?B?SmdGbnRTWDdqU2dyNzQ3ZUUvWDFNMzFvWTMvY20rSkM2eHNuc09yQkZTdEJ1?=
 =?utf-8?B?d0ZFUVdSd25FSDVTQWZrbldBYk5BWTQ3d3hMSVoxeDdQOFVua3ducXBwcmt5?=
 =?utf-8?B?a3owa3dGRHVvRlJDSlRHdlNGOUgyRzhCKzFLSWdSOVRpQTlGcEpSL3dTbzc3?=
 =?utf-8?B?WDNJRlZQckNnT0xXOVZCc0EyY0dYWHhMYWtlRVhtNldVc1U3MjN5WWVNdTBT?=
 =?utf-8?B?c0IrQjk2UWhiRVZlUCtxbXRYUG0yYk4xNTE1VzUvdkVNN0VXa2FHY3ZjOWUv?=
 =?utf-8?B?TVpxbnp0Z2hkczN4c212UnVKWkhWODd2Vy95OXFjVEZMOHJLKzRONUZtS0ky?=
 =?utf-8?B?NTB6d1gxcVlCS3NJeEZyRXg3aFk0WW5Da1lObk1PcVozamptODhRMHNFbzk0?=
 =?utf-8?B?RnR5Q2UrT0VVMDd4Q003aEhXYUFETzR4dEI2dS9ybWN3L2wyUXYzWGRiK2l5?=
 =?utf-8?B?NG9vc1BiWkphTktyckpaYktZWmE5clFjdXJSakNxUHVxVi96WnZCNU5NcFdz?=
 =?utf-8?B?OU1TcWZBVGkwclNsRE9SMnhoclZ5VnRSOEJWMnJGR2tTa1lxbkx6UDBBVHhB?=
 =?utf-8?B?V3ZvMzN2c3dENGV2OWhjalB2MnV3MlVEQjVYTmI5cW9sN3N2ellyN2YrdHVt?=
 =?utf-8?B?UlNSVS9ZYjMxWW16S3h6cFhWLzFMSDlVa0pzaGxQMmZvQzBQVG12ODN5cHly?=
 =?utf-8?B?ZHNidXFleWQ4U0Y0MC83QkVZd1RzL3d5QUM0Vy9NUmNKakNoYytYM3hIYkFy?=
 =?utf-8?B?YTFVNTZxeGROTkszYUx4ZExmRGlnY2xKdmtyaDczeDIwQnhOcmtDelcxbVpz?=
 =?utf-8?B?bitMSi95M2tKMnJCN3MzRmFpWmRCUVd6WlA2b2lnNHNyM0J3UmF5ZkhSR0RD?=
 =?utf-8?B?N240OEJuRW52UGtrOENnWFJUckptbHZuRGh4ZEpnQjVKcHV6YWQ4SVc2UXov?=
 =?utf-8?B?SG9TVkhXOHBWdHg1eWllYm96dXFtQUJLMkl0U1IyM1hJMDNJOXRYenFObU1K?=
 =?utf-8?B?djdwREFDM2NjSkJQYi9vQUpFc28zNlpLcFpxa0lzYlNYSk9kazR4SzNyaU94?=
 =?utf-8?B?WVg1REhRcUo5SmJEKzBDYVdWMEh3cmdYK2FqeGtreE1DZUx2OEJDRS9CTzEx?=
 =?utf-8?B?bk1jaVJhRjVsOEhYRTNmbHQ4My9seTUrbEdldTMxYlp0ZllTcVdNVnZJOUJj?=
 =?utf-8?B?ZzBFdDFNYWRtdmpheU5lazV3VXZFTEFNZXVJOWF3UkpGSS9SMlJjVCsyY2Fy?=
 =?utf-8?B?UURsRnJCTnNLTTRpN2RqY096OG9jNXpZSm5BeldZQnhnRGlhRDh6cVJyOWRU?=
 =?utf-8?B?VjluR0JBSFNMN0FaNmM1VlFnSXBlL1NHRVlVdk9oZmxpYjhGVG1ZRnRsaFhl?=
 =?utf-8?B?Vm80a0NLWFZsYVFPV3UveXBFZlpWU1pHZUY2QzUvWGhwWXJqT1VHaDM0Z2RQ?=
 =?utf-8?B?dmJtZkRaRmtKcXBBUGRhT2RzNDQxM3B0dHc2NjdYZmdsRUplcm0wVXp4aDls?=
 =?utf-8?B?ODVIbmp6eEowNkJQRTVFZGU2ZWZKRFdvQnpoM25zK3pxOFFKRWNCYlVKS09y?=
 =?utf-8?B?L3c3SHY1TXpYVEo2N2d1d20vWDZFVldoV2VBL1l1WE83WERBTVVmdVo0Zmlu?=
 =?utf-8?B?RThZZ3JhTDEvanBMM0FSUVN1aUZ1TlR3bjF6UXVvakZnUGN2NGhubTgwU2c5?=
 =?utf-8?B?VmhLenFNUFVXSjRLNGExOEpuaDAzbTkrZ3A3TUFLWVZNS2pLM1dCRlo0UWJG?=
 =?utf-8?Q?zprIoms8h88DZ4kofShA2K5lU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f1788e-f486-4727-a15a-08dc3e0e6fa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:51:30.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThBeWc4A1RayvVvBSdjWommayPUPM81uHANUE7pNiqJiohEnOUEyK9Q57gmb5PzpbwFF8pjhKDpLsJ2NlC6+6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216

On 3/6/2024 12:49, Sébastien Chaumat wrote:
> 
> 
> Le mer. 6 mars 2024 à 19:08, Mario Limonciello 
> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a écrit :
> 
>     On 3/6/2024 12:05, Sébastien Chaumat wrote:
>      >
>      >
>      > Le mer. 6 mars 2024 à 18:33, Mario Limonciello
>      > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>
>     <mailto:mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>>> a écrit :
>      >
>      >     On 3/6/2024 11:28, Sébastien Chaumat wrote:
>      >      >
>      >      >
>      >      >
>      >      >
>      >      >     Reasoning backward  (using a  kernel without the
>     pinctrl_amd
>      >     driver
>      >      >     to ensure xen only is at stake) :
>      >      >       checking the diff in IOAPIC  between bare metal and xen
>      >     (IRQ7 is
>      >      >     on pin07 on APIC )
>      >      >
>      >      >     using kernel argument : apic=debug
>      >      >
>      >      >     bare metal :
>      >      >     [    0.715330] fedora kernel: ... APIC VERSION: 81050010
>      >      >     ...
>      >      >     [    0.715433] fedora kernel:  pin07, disabled, edge ,
>     high,
>      >     V(00),
>      >      >     IRR(0), S(0), physical, D(0000), M(0)
>      >      >
>      >      >     xen :
>      >      >     [    2.249582] fedora kernel: ... APIC VERSION: 00000014
>      >      >     ...
>      >      >     [    2.249730] fedora kernel:  pin07, disabled, level,
>     low ,
>      >     V(60),
>      >      >     IRR(0), S(0), physical, D(0000), M(0)
>      >      >
>      >      >     So the APIC table is not the same.
>      >      >
>      >      >     As strange as it looks the  (IOAPIC 0) pin07 is correctly
>      >     described
>      >      >     by the APIC in xen but yet differently than in baremetal.
>      >      >     But the APIC message comes long after the
>      >      >     [    1.833145] fedora kernel: xen: registering gsi 7
>     triggering 0
>      >      >     polarity 1
>      >      >
>      >      >     so I wonder if the APIC pin07 info had any influence.
>      >      >
>      >      > Finally found the fix : adding ioapic_ack=new to xen boot
>     parameters.
>      >      > Not only the trackpad is now working but also the ACPI
>     Embedded
>      >      > Controller which is completely disabled.
>      >      >
>      >      > Sébastien
>      >      >
>      >     That's great news!  I'm personally totally unfamiliar with
>      >     ioapic_ack=new, so I did a quick search and found out it's a Xen
>      >     parameter (I came across
>      >
>     https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html
>     <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>
>      >   
>       <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>>).
>      >
>      >     This mentions that "new" should be the default, so why isn't
>     it the
>      >     case?
>      >
>      >
>      >   "This is the the default unless directed-EOI is supported"
>      > xl dmesg without forcing the parameters shows :
>      >
>      > (XEN) Enabled directed EOI with ioapic_ack_old on!
> 
>     Got it; it sounds to me like a logic mismatch in Xen then.
> 
>      >
>      >     Also; I'd be really interested to hear what happens with
>     s2idle with
>      >     Xen
>      >     now (if it works).
>      >
>      >
>      > suspend to RAM now works :)
> 
>     Do you see /sys/power/suspend_stats/last_hw_sleep increasing with your
>     suspend cycle?
> 
> 
> No,  it does not increase (0).
> 

OK, then in that case I suggest you run 
https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py 
in the hypervisor to find out what's wrong.


