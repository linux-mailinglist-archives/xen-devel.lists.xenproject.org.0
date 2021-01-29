Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1983087A3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77870.141346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qdu-0002gE-AQ; Fri, 29 Jan 2021 10:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77870.141346; Fri, 29 Jan 2021 10:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qdu-0002fp-6m; Fri, 29 Jan 2021 10:04:42 +0000
Received: by outflank-mailman (input) for mailman id 77870;
 Fri, 29 Jan 2021 10:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Qds-0002fk-IW
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:04:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e473dfd9-544e-4a7e-ab26-bc541dccf0c4;
 Fri, 29 Jan 2021 10:04:37 +0000 (UTC)
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
X-Inumbo-ID: e473dfd9-544e-4a7e-ab26-bc541dccf0c4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611914677;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DoWaDJbl9ilQlfrl8FllvZ/vxseNaUYfNqf+cHQPzrs=;
  b=dlKs/ywpKRfm+vZfmCHum81AgEcWq+ts94UAkEwfeWA3jPqMzHLGjCx4
   m5LYX1YbpoYZNY2xxLvshaXUXFxoJCbP9imABbaKkrrHeLgPK1smdaMZZ
   5F9LbcLtH3u23iDweVXyNsuTqlqvI3iywPYt6nl4FLF+aAJz8io1glJs+
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q6xA8U7YFDF2+LUeaFoTqH94PclNjoxzFnjIh7jhEexkfVOXHl15YlsDW/p/hNgvHtQ1xSGlCK
 5ayqpGji1mJQup9Ws/RAnM7EUIdJR+Zg5yS8QzQlHS4eW6Rn0jilreR8PspiLXjbhn6iDawa4L
 /WFrgOij32nIf/1XUmBxbToMnavz0RM/3jg6p2ZNkC0+NzUI5DAhKrj44GZtqhg4OW7XmoEbOo
 1+bQdhgtbSXeIVB1otlJmYMK817lcRZ8aNvHX6JwtLpltirutrGVUX2l36zVXNT6m2uN9iXGRn
 chs=
X-SBRS: 5.2
X-MesageID: 36100357
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36100357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWYbt/78IWHMFrNxjBj2I65Us9Z0LLr2tEJwhwkj1CXJU8Kb5BL7D6x+v6Z5cD1uHWO//kmsi92TDrz64SbAjGySHCrEmCVzc+JgBjZBlxYQXGxw4x8lBRsJ+aQ09l7nidne8pj9SWakFaVyfdSjRlbubeGXImR1QYYlNdGSJv5v6rHLhUb3SYsTV/c/tfJ1OTh8HQPR+SaI0fdoYcocUXK3Ei5JyHkYv9o+8lKj1uT/kYkH9H7bnNSu6MNGjr8qT3GkVNgFYBDU4KMWF2LZT7dRVk8i/YwgX93R4pLnuVB6OSyYCPCk8kIk+RRqR8N0YB2IUNcO9qAVBziGXuyH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoWaDJbl9ilQlfrl8FllvZ/vxseNaUYfNqf+cHQPzrs=;
 b=fHPmShcyMsI2QlCgg+17z9ekvq05OCJTg3/+jL/lVA5aC1afrspchVGryB0ZHzPWGD5/Z60I0eYeSfdIpKJpKxnfLv1EaCrxhyUQunsqTyRKBgGtomsBxB6DAJB6znSjfwtyenxNi5vQumevGR/QN/1S/i74QtJdaMdbvOi3nJ/lkU7W/KNUMYCGmoAZJpwOrmJTYXXAaBWdJzO6jrois46RRyXFrdK7HWhsJ7s0h0MJuo/0ZCATBOioyFdltptpjNVnIvnqf0Xna6QxccmHorA6Kpl/x0GywIro4uO56W+nSCh6G0/bZhm9ThOZGGc+GShLioZTslLTLg9FA5TgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoWaDJbl9ilQlfrl8FllvZ/vxseNaUYfNqf+cHQPzrs=;
 b=LQK3Pcnei6qLwlJbRfh7qys/4ASQY+3CRNE8awkBOrZDjGfVveSUBoRcIyFbcxkNRa5ChZxwggyCa6it/ZYcPaPxUUdR1EAh7+/IVdDS0P3ATyz+CSz+i3/wO1ISVdtPrT4MauVCzq5erzYZJAwE7gywdMtO+y+4f2Che/oDzj4=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul
 Durrant <paul@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
 <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
 <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
 <73e7ec42-12be-5b03-7c91-14e3132d3324@suse.com>
 <0c574f20-9d92-ba86-37fc-eaa72c3e3d16@citrix.com>
 <38e6a495-5573-5eeb-acdf-e11211dab73b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3606b707-a4ad-11fb-30e9-eb4fdb80fd6c@citrix.com>
Date: Fri, 29 Jan 2021 10:04:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <38e6a495-5573-5eeb-acdf-e11211dab73b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e474de82-38e0-4909-3775-08d8c43d4726
X-MS-TrafficTypeDiagnostic: BYAPR03MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4342777BF6CF67649603DFB2BAB99@BYAPR03MB4342.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWFT+G8l2JFJQgB6lIp0gl4vlujrwfN1MESPtw8hPHMBHCtLK0Mj4t5EqNm+qDhr45ZVFAjxg+xOG4DVU3hXybyPcPBYN/sCBG0lkXufAHECBLNke/4yE832dTvf6+SHH+Vz9U2+rfA2FkWEarb1cv5hzv/L1Vv/e//umU7I8YRuNYoxlEyT2RGrN9Ig2ok8v/zQqHQBRyzKwici4ZwdMaRtlNr97Np/ofJMvvydfCXsNut7dTecxyqkPb/bEW1Khsqn/oSOD7gxxifSQZecgbGIze66Cd5jkWMfv9oPeeWCqWLScBDMPiAeBXy6ZXj0OoGlIWxywp2UbQf8s8rkUM+P4NKDdZeY/oDnNCQAGDS0QuZd42vXoLEDRIWMG7JkSNOJMxznGycgVestjTvt9mmUJq7HVCivaVL/bYTdakZMOnNM4+0V/N8Wct8E4FB897ajNj1A/A3kCfTfYtXOubRmRFzG0Fgzp+9uVV+RH4rOfMjxPvMUc7scL1UZw+RzWF2Hjtba/lBCiFqLwvZV4YQ6A5a+oSBdZOQSw75os390unKTsbKS6SXZnM1iW+brA01qcumtQ9QzMgJtdLzE+pD+QAwHAIHElqi3TDgPdk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(53546011)(8936002)(16526019)(54906003)(478600001)(26005)(66946007)(6486002)(36756003)(66556008)(66476007)(8676002)(5660300002)(316002)(6916009)(86362001)(4326008)(31686004)(83380400001)(16576012)(956004)(6666004)(2616005)(186003)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVpTR01WU08xSU9MRTlJWnVjaFM4cW42TWdhbFIwQ3N5Nk9pbWpMME9jYytu?=
 =?utf-8?B?eHFCelhybHBjZDZWZjFKUzdzdEhtT1BvMWpiTUpBMGtKaENPdk5BOUJSNTRn?=
 =?utf-8?B?V0pLQ01HK2dOQ085WG1OaExQZWdVVHIxN25zMVhqOVJlNzJ1Ym5zbEVrQTc2?=
 =?utf-8?B?TERiTHBWSjhFRTBIelZmVEFQamZUdGN1Q0p3L3JIQlJMTkhZdTVsTkQveGxP?=
 =?utf-8?B?eFQrSHVvS1B2SUMxNkRVYzB4MEZTYmU5Vy9pcUVMOXFpa2NtYkxybUk4Wml2?=
 =?utf-8?B?Ly91MTA5dTNYZEtkbEVaL2F4OGhWQmMyRWNRbjFqK0ZmWHRndk8yYThmVi9Z?=
 =?utf-8?B?dlhpb2pIUW5QMnhMekdqY3R5QmpUREJ6SFk5YWIzMTIxUkI4bzJxZnBHaDUv?=
 =?utf-8?B?UHYwMVVSRzZVbkpGYUtySnZyVnFyc1pPQzhpTkJhbWRuVnNnQ2JkNmE1Rm5I?=
 =?utf-8?B?ay9NNWszcUtKUXVsbTgxeE5VUnhpR3NmYnVWUmx1eVp6UU80djdsUU42aVQ3?=
 =?utf-8?B?RGdsMk8wL2JhaFZJYXE0SVR3TjZML0N5cFk5ckpSMGZuamtwUTdobDZyakFR?=
 =?utf-8?B?dDdITzc3ZUcrMTVQR2hRSDJ3WURSYitKUjd1b1RybUJ6NlB5L2Q0Rmc0MXlw?=
 =?utf-8?B?Tnk0RzFuSjFUSERwNTNuQzlQOFAwNE9RbjdoK09oc1V5dUo3cUtHaWRIMlVO?=
 =?utf-8?B?MFRDdnl3d2JNUnQ2dGF4aWRrczlKUG9jWnliQlJ1VER4VFVnMWtZNTFaN1ps?=
 =?utf-8?B?Y3c2aGh5QWZoVXJZSjdWbm9sWDY2OEtjNUpSMDlrV0xDOW5tRkxSbTh4QUZn?=
 =?utf-8?B?UGUzbHRyWjVRWjZHd2cyYzhsb3FnU2pScFQyeFo5dXJZVDduTEdnZHZEdG1O?=
 =?utf-8?B?Z1o5aEFTUUJQTWdGVUNjNGJ5YjY1R29sUUdCMXNTeHBGSDFRUDFGZUFCTVBY?=
 =?utf-8?B?SWFlMFpmU2wrbHJjbGdUTTVyNnZ5Q2x4YzZmTTlQMDBCSWduTEIzSStrUlNQ?=
 =?utf-8?B?b1hMVStqTG91UUlRZVJiVC9IaEZiZlBHNnZHRnZ1MXBJTHROUzhoa1ZnYWFj?=
 =?utf-8?B?VXNTSU5WYXNlV29lMTNXOGJpY3NHd2RtM29qZW5sL01hQXB4WjRjWkFUbFB3?=
 =?utf-8?B?VDBOaWMvdUp5U0dTQ2RJNUcyb294Sm1DZThtR2UrY0hhd2pDYitRQnozZWRO?=
 =?utf-8?B?aU93TzdHaU0wNzJFSDQ3MmVQUDlJMVhWaHZlbERvSm9DMTc3blZRclFhc0s1?=
 =?utf-8?B?VDNCNlhRcU5KdHdWWS9iU244QkpKM0NjeFlIWDI2S08zVyt5UjlmYTRNWXho?=
 =?utf-8?B?bFNDbHV1QTlSYk1HT0V6MjVKSUFXRE1Pamx3MHNHYjkycXQ0ZU1PZkFDZDdW?=
 =?utf-8?B?UE1WdE96cFd2MFdOZzZPUDZEVTRlcmhvZkkyc1ZRcVRoY25xSlhOdWxTMXp6?=
 =?utf-8?B?Y3o0dTBxamVoTk1yL0diZFBSY1ZHTjNUeE1wTnhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e474de82-38e0-4909-3775-08d8c43d4726
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 10:04:34.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XARwcf5qMfD5Cm7KMaL8LOboY5j4aGGmWDgUW5FCv6k/ScIGsKtbFozJNtD3JjYcZytkdWY0A6WmU8p4sAXYdOLpn31+yX+28ZOYsg5NyuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4342
X-OriginatorOrg: citrix.com

On 29/01/2021 10:01, Jan Beulich wrote:
> On 29.01.2021 10:47, Andrew Cooper wrote:
>> On 29/01/2021 09:40, Jan Beulich wrote:
>>> On 29.01.2021 10:32, Andrew Cooper wrote:
>>>> What's the likelihood that you'll choose to backport this?
>>> Didn't consider this aspect yet. I think I wouldn't have picked
>>> it without anyone asking for it to be backported.
>>>
>>>>   I can extend it if needs be.
>>> Well, if that deletion of code gets committed in time, then of
>>> course there's no real need to fiddle with it here.
>> This specific patch fixes a real bug on arm32 which will cause unsigned
>> long + unsigned int to truncate together and permit certain values.
> Why Arm32 only? Looking at current staging, there's no overflow
> check at all on the grant part of the path. A suitably large
> 64-bit "frame" will allow the same behavior on 64-bit (wrapping
> around through zero), afaict.

Very good point.  I'd worked the logic through logically at the end of
my fixes, rather than at its position in the beginning of the series.

In which case I'll propagate through the whole call-tree.

~Andrew

