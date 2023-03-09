Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A326B1F45
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508195.782590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCBO-0001ng-Kw; Thu, 09 Mar 2023 09:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508195.782590; Thu, 09 Mar 2023 09:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCBO-0001l9-Hy; Thu, 09 Mar 2023 09:03:30 +0000
Received: by outflank-mailman (input) for mailman id 508195;
 Thu, 09 Mar 2023 09:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paCBN-0001l3-70
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:03:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41034f0c-be59-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 10:03:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 09:03:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:03:25 +0000
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
X-Inumbo-ID: 41034f0c-be59-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHHlG1grMkejHpLJ/7/GRb+Ne0+NNCDBpqu+f/ZiJNTQ3TbLVZtSwX93T5s3X43DngRpJOVaaaHOrNv/R1kEQLcxCB8qgtmGmALCZHC3ppJbqF9xdLL3CJ0uEkVGRg8QOxeobYEoosD3KNgzo2AY9A1P8f/9ScXg3gwDlKq7pKA8VWQz9FwuKdyNefapZnY/AzdIOsPf3rxqhsswxfbRXGlj+W5xo2E32zRLHXT/UV1uOk+oT9RQM1PdZexMoenBV3TqDWGjI+cvo886r0INFobLUx4augL+htcrlJTgnjJuMWfKFjwhHt4ptF6socJzF7pBgGtENZF6QR1Ylo+f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvrPsUqeclVuqnRYHwwmCDeuyZvzMYQ9zKT3YS7imwU=;
 b=n+lg/B4vFDCpBPtEq8xDOyteSaHKKVvHOK6rbR5JUrXgSPhdNdJZT9BE9IwNBhuLpvhzedCERu2xWpEtt+CMB8+kuTQPj9aFhBFgx0ODXlcnBkTp03MfUUz8gHNBNcaD0Ig3equmLvflNF/dinhnVePXSsQhHuMTluylqJtOWfXEfY+BShy1dYGiVA1aA7dpl2wYQEUxihfm93mnQFaNZdKe6wdBnYu812MdFI7WI/7lFAYesX/uv4XtDmR2QBK9NjU80eceb0g/J53xo2Y+UrMd0KAgVBMdhBFtrLwuMefqfgSM4dpfIt+lT2p/fZGb661I6yM4RAL23XiBtFsQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvrPsUqeclVuqnRYHwwmCDeuyZvzMYQ9zKT3YS7imwU=;
 b=a7v7Tdhs2bN0St9PU4KGWSiptkem4IyXHyHnDSMNdDhC0f4p+dLGwM70ybpgJ2/7uN53L5ObBdHDVHQuCnwfuVfBl6xEbJHbc+rQ5EqNEnQOMJgpQ29c34G+Vm9vlaJFqz3mu7ZyouV+2nwjlS3iLJSgIZ6CIk/VXTx0lOhObm46GCyUcoZFw0C0//vFPaOeBzGaAydDb9UUiJmKqHYuCk1y7D7pbw83Zc9ZSSm3pvDFFIUXAAW/8NfbdnriZ9QSjN70u0KElcH6GbDWhH+EhZYmdjfPqBVJ4ydF234/sAnybasgDW40AGwIeoT+YebvR/np4nRWnwdGkSXL85uPRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
Date: Thu, 9 Mar 2023 10:03:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: adac2c97-df46-492a-7340-08db207d2401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjA5feu6mfNQsgqDbcnQ6EcwQ3fUBAurq6tE0PZtsuCtmXz6aMieAk219lwX/w+/WRbCJOcFS40eZwuyzqaQpGVglVoCQMcDHQCeLX/4lLDfZqaL2Ny0iEsU7iSW8sO2KsmG/U+hC5EtxnPEfpd9pIlauAI6WUL0Ic8OQcp834ojgRdX6Os0r9hShMy/wA+pLhHBLnqOG5aEEhu9/iN13gj52uwD3C/CvYb4dngBXHFGyvivQDBZozlZkMTppH6P3wA+Au7ci/co7EcBz0LP0MghNVoCpN1OEFVkBpf0c/IlhJGeXNPbqtoPh/bSe+45OLauKlbou/Vwrwuw04Pz4CuEzHmVA79SSJCfqcq0GtTGEEAdLpRkJeuLRfKEtfIdud6zru7FrVpdTg05NYoG35SW0lv7J0tjGgYTxRJssBc1jHbiPD7O7SK8ZxSQiHom0zMLr2h3+xsmggu9IMGxUi5AphPKd+jL8eTtU2Ltj2UVz94NQv8aO+v9v+P/e/XqU13amBfqYEB4sYCIXEB+l5iffvW1iVt3GX+apOMYh+cutp/xL8baV562dF2yNIvUazoBt/mPkFHn4j722kyoIdH9Y5p9HZ1fqM2b1Lt4P5n4q0TvqfSRdtcF/KSGhUG3g+lhDDxiZEAwpWzBaMtbQFog8aU4HoJchOp5V63WQQN9s3fy+SJsgJxyihFgGMDuSOI8SMSWxO1NivOJIg8rDtdlE8ZUUNCtpd1ztSiyUDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(31686004)(2616005)(66556008)(66476007)(8676002)(5660300002)(186003)(66946007)(41300700001)(53546011)(8936002)(26005)(36756003)(2906002)(38100700002)(966005)(86362001)(31696002)(6486002)(478600001)(4326008)(6506007)(6512007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cElENFR5b3JGa0ZRb1R0ZDUzeExLcmFFVVBaRisyTTNsSko2UW9qcUNvSURN?=
 =?utf-8?B?UHNhL1FTNnBuQ2Z0UXhqdC9QK1NJaTBEazdJRVRpWlRVUjNqdW9BNDNnNHFY?=
 =?utf-8?B?UVpkVUt3T01nK0hKVWZJMER6Szl6K3h4SFRYakxxZHVpWnNFd01NU2FnTzFK?=
 =?utf-8?B?L25NWDJ0YWlHek9ySmlBTmNhemVNQ0JSUFhjd2g3UHFiTjhyQlI4czFtSzFP?=
 =?utf-8?B?dVowQjhsTDRyWjdSR0FuUGFTMEFKZEhqMmlWMVU0YlhteUVmZUlKQWlwcHhF?=
 =?utf-8?B?R3lRVURTcGlTMG5PdlFOSkh0ZENlZFpob0xLTGxTYmZvc3ZYQmlWNjVhQ2ds?=
 =?utf-8?B?dmltYU0rK1dtaGRJQSs1WVlJbUF5Ri8wR3VKVEs0d0R1RTl5UXVlMzEzM3Ni?=
 =?utf-8?B?aVBzd093aStqK3QvK2RXaFBjbzAyb3dmQmt5OUY5NTlZMVA5TkRFa1l4eHAw?=
 =?utf-8?B?TUJhb3c2dmpuclBoQzZtKzZ5SS9sU05Fc092WFhrTVI1UGkxMHFPWGNualUv?=
 =?utf-8?B?Zkl1R2V4NVFiMFhMU1NhbTdMNllERUE2cDRRRHVwRzJpVnVxZnJ1K0VIdnZD?=
 =?utf-8?B?MFFsazB3K09WSnNpUEpPU1JybWpzVnhEeFpZd0NnMG9wZUx2NWszaUlTZkxo?=
 =?utf-8?B?RVFWNU9GYiszMS9tWlNEQktSU2QrTGlJWGpqdjJzWVdyUnA0Y0k3Rk5KclB4?=
 =?utf-8?B?bkxWa3h4SVlWT2N4WUdIM0hsUDhPVk1uaVRuQ3FnWWJkVEpGRUF3VHFIU013?=
 =?utf-8?B?dlZOTGpjb2NUQUMzZTlEYUFzYzZVeGdSOHBPNUZrcmhoM1M1aFNFYXVqZDdH?=
 =?utf-8?B?N2VOblljVEdmRjJkc3hZbHZQdEdoYjlIUDY2aDVlaS9DTXFOdzJoSjNybVZx?=
 =?utf-8?B?UmN5N3UrWHF3ejlZdWxqMklZK0F1RGtVY1BYR25lbVVlcmJaUHUyN0hEQVFC?=
 =?utf-8?B?R1EvWnJ2Z3docy94R1hvbG4vd2JvWVl0cEFBSHFHL0ZuR0lkbnlCanordTZB?=
 =?utf-8?B?VW5TTUZOUEhrR1pyQnplRE1EeTZ1MVdraFN6SGJNbGsxemtnMmZjL1dVRW9Z?=
 =?utf-8?B?alhWWFVISEdpSisxMHk5bnVHM0Q4dkdzNGRDQzNtajlzN2tiWC84MFo4b3JF?=
 =?utf-8?B?WjVBOC9yMFlNaDhuNjFGUVJpOEUzSGpKdzRsZkg5eXVVZjVjLzR0b3hMV1hs?=
 =?utf-8?B?anp3eHpFQ0tSVjEwNG9iRnpLcTMyNkRXcWl3QWpCOU9qRzJ3WmdGek9wdGEr?=
 =?utf-8?B?Lyt6RUZOTXdyZjkzOG5yQVJHSFpzVGpONnVScHZWK3R0U1JkT1laYVhzNm00?=
 =?utf-8?B?d2tXV1A3b1dtK3grMWMydnRJUDYrcXMrbmRVbHF5TjU2QzhIK2pqdm1FMHpj?=
 =?utf-8?B?WmovcnoyZ1d6aEhwc0RxTThXa2xoUkNJdnd0VEV6aHM0cjduNDhqMFhITjdt?=
 =?utf-8?B?dVFzTEFGdjVqOFMrM2pjSWV3RVorcDR4UlJnemNaL29oQ21TMHFMVk15cU5m?=
 =?utf-8?B?SjNyaGY3aVB5NWVvQktCL1VoYnAvamVCaU9kbHhqNVZRTHd5NzZmZ2pKZmpr?=
 =?utf-8?B?dkIzYlU2VENQcHkvTEdFQ1EvMm9DTTRobStBbndmck5TbzlkckVBTkpDMzUx?=
 =?utf-8?B?TGlMRXYvd0xIbE5VRG1JNEszNWw4a2ZieXlGNklneHFLUTljdWZid2lJQXd5?=
 =?utf-8?B?L3BzYitqL095UzMvcDBoTFg2K0QwT3AxaVQ1TXgveGtORDF1U2ZZVG1lRmIw?=
 =?utf-8?B?MnRhVEw0VS84cDhSeWNwTDMyUFJ3bmJBc0tyK1BGNVpOeXVxbGJPTVBUaXFY?=
 =?utf-8?B?dFR2LzYzNnNFR3hmbU9QMzFWd0o0dWtoWWZrZDhCeTRjNW0rME1MKytwdVNZ?=
 =?utf-8?B?aGZFNlpyUW9kcysxektmQ25kUXBVempIeDM2Z3VsUkcwT2cxbXVJb3VVZ1hy?=
 =?utf-8?B?b0s3SUtZb0VkWWNRVEp2SDMwSFNsQU9XRDhWTm5Yd29RNGRtZmhFZXRxcjFn?=
 =?utf-8?B?MlFMZU1FbGIrTThnZTNmM05oM296enFvYkhJQkNqUk1Pd3lIQ3FHRm11UC9F?=
 =?utf-8?B?RVU5Mmc4Y3VnTU93bnA3ZjNQTmJxeHdnQk9pdXYydzVMOTFFZGtVRDVreGNR?=
 =?utf-8?Q?i3lyaNMrzAC2TlPjgurOv/ExW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adac2c97-df46-492a-7340-08db207d2401
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:03:25.2163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlYHdpf9kdOYtEgmLIvVmxIT0hHLEppK6iI+f/VMTWTGT901H56tMh3KYz/4Kt+zLI7APDY1Rz4XdNljsp3n+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968

On 09.03.2023 00:08, Elliott Mitchell wrote:
> On Wed, Mar 08, 2023 at 04:50:51PM +0100, Jan Beulich wrote:
>> On 08.03.2023 16:23, Elliott Mitchell wrote:
>>> Mostly SSIA.  As originally identified by "Neowutran", appears Xen's
>>> x2apic wrapper implementation fails with current generation AMD hardware
>>> (Ryzen 7xxx/Zen 4).  This can be worked around by passing "x2apic=false"
>>> on Xen's command-line, though I'm wondering about the performance impact.
>>>
>>> There hasn't been much activity on xen-devel WRT x2apic, so a patch which
>>> fixed this may have flown under the radar.  Most testing has also been
>>> somewhat removed from HEAD.
>>>
>>> Thanks to "Neowutran" for falling on this grenade and making it easier
>>> for the followers.  Pointer to first report:
>>> https://forum.qubes-os.org/t/ryzen-7000-serie/14538
>>
>> I'm sorry, but when you point at this long a report, would you please be a
>> little more specific as to where the problem in question is actually
>> mentioned? Searching the page for "x2apic" didn't give any hits at all
>> until I first scrolled to the bottom of the (at present) 95 comments. And
>> then while there are five mentions, there's nothing I could spot that
>> would actually help understanding what is actually wrong. A statement like
>> "... is because the implementation of x2apic is incorrect" isn't helpful
>> on its own. And a later statement by another person puts under question
>> whether "x2apic=false" actually helps in all cases.
>>
>> Please can we get a proper bug report here with suitable technical detail?
>> Or alternatively a patch to discuss?
> 
> Mostly I was pointing to the thread to credit Neowutran and company with
> originally finding the workaround.  I'm concerned about how
> representative my reproduction is since the computer in question is
> presently using Debian's build of Xen, 4.14.
> 
> As such I'm less than certain the problem is still in HEAD, though
> Neowutran and Co working with 4.16 and the commit log being quiet
> suggests there is a good chance.
> 
> More detail, pretty well most things are broken for Domain 0 without
> "x2apic=false".  Trying to boot with a 6.1.12 a USB keyboard was
> completely unresponsive, on screen the initial ramdisk script output was
> indicating problems interacting with storage devices.  Those two together
> suggested an interrupt issue and adding "x2apic=false" caused domain 0 to
> successfully boot.
> A 5.10 kernel similarly requires "x2apic=false" to successfully boot.
> 
> So could be a commit after 4.16 fixed x2apic for current AMD hardware,
> but may still be broken.

If Dom0 boot is affected, trying a newer hypervisor shouldn't be a problem.
You won't need any of the toolstack to match just to see whether Dom0 boots.

In any event you will want to collect a serial log at maximum verbosity.
It would also be of interest to know whether turning off the IOMMU avoids
the issue as well (on the assumption that your system has less than 255
CPUs).

Jan

