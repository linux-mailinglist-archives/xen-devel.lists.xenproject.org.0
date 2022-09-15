Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88295B95CA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 09:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407260.649700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjjI-00088k-6I; Thu, 15 Sep 2022 07:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407260.649700; Thu, 15 Sep 2022 07:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjjI-00085n-3U; Thu, 15 Sep 2022 07:56:12 +0000
Received: by outflank-mailman (input) for mailman id 407260;
 Thu, 15 Sep 2022 07:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYjjG-00085h-IF
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 07:56:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d684f0a4-34cb-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 09:56:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 07:55:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 07:55:58 +0000
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
X-Inumbo-ID: d684f0a4-34cb-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4EJHfA1KUy/+1Oyj6xt+G0M0wyn/+2XYgkbctw0piCKSxMPDdrqIaG2kNZ7NuRnu4RcFSxOtDhPYXH15cCCRmgPLtX12zHsNcuBmRCWQ9A2fjq+Dnpy/gm+AyG28qVCPhINSlYAOT/GkZSlfb0rRDOnC2PdRgIiwMeGn5HSQDeasBbwh8TYWmzVQu5gX6e8huP5J6q1iGeTshL/iJc/DL9GN0FuDDzoSFfrbegAF7arK+2gY6rMfxzaOvlAb8t/2kbjYGxsVIbXq8tI+G9/7rdbgibRR0WShk4NU3GU+J6BTBXi7OPBTPBd3GGOIWi7094cmXtb20xzFU/qbshs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5ohhaQ2MfmDZ7UaICgzFDSFl5HclAU3EVjSzGrBo5A=;
 b=kWX/KWNk7ItVuc5B3wLlGb2Q+1cC7mB13jZ6zhVTHiPhHOS0aXfmFdSYwuPKaZLN9F+6Gn51SDVMXk0um07VojnXlDoRe0wME6Xr6MFenyUQB9+BZ9Za9rQ7ad4wL/jjF7cJFL33V4G7vokiUxaM5vT+OLNPv2vBbW7uSkVDUEqovjKyoPW3LepWqXS3pv5CaHDt4FtqU8jbyKc3VHauzK9tBvYsYHj8UQGR6+CI25ForYvY1VTn/2yVLkWY2LTbEmLT4CrNfvZXou3s9BwxGVN4crST9/9U9x01fvfI67O4W2hwAoY/Hffx1kx67oYOxbhUaw91amPuzb2XZ7ZDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5ohhaQ2MfmDZ7UaICgzFDSFl5HclAU3EVjSzGrBo5A=;
 b=2bhatioP1hka5e/nZELrTRCoRr1SK0JLviAPi3AvAWpNKXUmzIJFLTaSJgSVysr2foK2bdZp6Gprlw3mjFHuH1SRNYJHdiqstbSprkGBJ5MglQiM5wAAaYLusUQ8GhMS5O0X8WHikKkODVBwyzVLpc3Vd+z0UN3mKWNooLNFNA4SYbodix1uzojeut0PAU4AXMRJgPkLWEZnlB7kRu+yje3mKk7IT8ph5XM5y5AYDzCf/aLm/Am5lN+u34uA7/ZV3h2q3dKeWluHYFT9jtYVP5C/pn5rEqGD1ZWcWUNr6e1gJYZ1DaJ+EtgHV0HNRuyqBoktrR042sjaECjWcF9BIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
Date: Thu, 15 Sep 2022 09:55:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Console output stops on dbgp=xhci
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0470.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b90ab60-713a-4178-e51c-08da96efb9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5ozZIB6sTTeGiWwhL/eBQC3rIC0UWuC8rU12I2p4QiauuZDsKNlTyhEiV/qeGltqDGYHW0zYu5Lbyx2R/m9yU0SMRDdfp9pu7nrfksprHubGpnnTc7wwOswNcNx7nkjg0nW3dLl0PBdOLb9oczuUqwNN9lexjpIEpLhmuCCXZuRUmvFd1ABiJ1QPNY4w6DshzxAdm+eAtBrkdJ+WIZTV7P6YoeTeJ4AXySxziRCNQ912d9+Ywe3NcELH6Gv77kOq1EZmFjuAorgMbfpCvdv5z7UTPo2JjHSV6g5sUBR506Cu/AHRfSh11ijnidd3yTGILbmqfVmhMluJGPFpwqBj1ebsX0abiG0+YkxTrVzggSy4ZfqRQ4DONmD6Jy0BEUiDe6ol4pno9PX50mbwk8Y+A8bbrZ5J53t4V4o+3NxzmUgRI60/PFBkwn4/NXZyl3xeZq3KG15aZubICW5s8zfOK5xPrCaPenzpfzZuw5UZnOhqpyEC9iqwINahbigqZ7GKER29YpyQWcnWw0qvJce84mjupr4dsyn/Ry7B6Ly3lSenA1VUwNtQYJUyFGYGuIkvaQqAMqHisdG0xK896C+ykip343Ha4Rvkvg01bJ+vJ1MOnsC8UBunUZJqtvV1cWwFqz4eYr/EWXqfaw64J/gvbn3yWOcGbB/7Am7GLOO6iZn8gp37TEcuNxfRDskfoyJ1VXCKRdgUVIDvAbqvsI3+04tJxfIG98PhS0yK6wQHxE+6Obw87vjYTYjIthulrtk3wOTR1ebYkYexHQZRuJzkFbPbzcTkXjaMpWB1ao4euk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(38100700002)(316002)(66476007)(66946007)(4326008)(6916009)(31696002)(54906003)(31686004)(86362001)(66556008)(41300700001)(83380400001)(2616005)(26005)(53546011)(6512007)(6506007)(6486002)(8936002)(478600001)(186003)(8676002)(2906002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0k3SlNrd0VCUE1Yd3NHdndhMHpoNHQrc1E5MFRYWkx6T2pmR2UrZlNEOUdH?=
 =?utf-8?B?dFRQY0tySU8rU1hXazFPazJhTjlQbDA5MEE1RjVkRm1KTzZFcjE4M2p1eVA4?=
 =?utf-8?B?ZXFvbk9BMUFDNlZJcC9LQkx4Y25VUjd0eGd6ZUd6N2k3TnNQalZ6NGV1WDRa?=
 =?utf-8?B?cVZ6R0VhNWpOanVhSTdXWm1HZjh1Q1VLV3gvTWxSazFRaktNWmNwbzRRazJJ?=
 =?utf-8?B?QzJrSUtieWtqNUhrdGUrb1RIR0xuaHo2dnRlNmMxWHdtNGVwd0w1dHJRclh4?=
 =?utf-8?B?TkJhc1lOb2JONHlnQkRCQVNNblAzd0xqd1dhd3ZDUFQvWlE5SGE0N1NOQTZS?=
 =?utf-8?B?bGxibWVCcE5aK20wYnZJWFhaYkRLZ1paNE1vUjdjVVlkZW1keUZ5cnVUUDIw?=
 =?utf-8?B?MG1ZUE42dDRZbnFTQUk1c3RlcVpyY2owQ2FUckcxcThyd3BTZTVQWk96Vjdx?=
 =?utf-8?B?RDJFbHo4Z3RXVzE5UUpIMDJaa0RVSXR5WWRXbHE2a1pmQlA0WGUvZmxlWW05?=
 =?utf-8?B?b01QY1VZK21sUmhjdFZaQ2pSMzFVamlUQzhjb1NMZkp1ZG80TmZHbkVlS05w?=
 =?utf-8?B?NWc1cUszeDkyZXRaNTB5M2ZGRlRrUFQzN2NpOEdKNHpMSURkNzZUc1FjNFdB?=
 =?utf-8?B?UmQ4R1Z1bnpqWmVwYVQ4eEp4ZzFmS1E4NUdCNTZaR2ZnVnhMc3lQNmtRbk9y?=
 =?utf-8?B?ZUlWbTc4YmQ2b3U5cVUwVmovOVp4VWx1ZE9YT1h4aHQxUGtXMWZUcThManVN?=
 =?utf-8?B?VSt1WEtyR2lrekxZM3VOZUsrVVRGSm9aQU1WRHMrMGhVSHIrZEJpd0VpbTVU?=
 =?utf-8?B?Nm5kWmpnb09RZlAwbUhWZXJMTUhEdms4N3l6M3diRS93eW9qZE5KMFhwTjh5?=
 =?utf-8?B?d25pZndCZk0zSmtMa1U5WDRGYjUya1lCMEx6WS95R2xKR01jNGovWUFoMUY0?=
 =?utf-8?B?aU10M01lSjhJRkxyTGRzWFBTYTA4cEFIUFNNY2hXYXFLRlUwck1nQUVjVitn?=
 =?utf-8?B?dTZxM0tVbkw3dm9IRE9tMFFic3A2QmhrU0UxVjdwTGNOWTJOMU5wSVVkTFlx?=
 =?utf-8?B?ZWwyZjZhOG1Pd0hCNFBtZlVXd3B5MXE0UktzOWZUd2VzcmdmMVB0WWdzM1JB?=
 =?utf-8?B?V0ozL21uMW8yZlRvK3VRaGNDQVhTV1VWV2J5S2xHOTRzbXJwc0kwVlZ6U1M1?=
 =?utf-8?B?aWhLL2dxdkE5WVBKSC8zNXZ4Q05MU3E2aUQwY2JqKzdNOEFoa3ROVGROUzdR?=
 =?utf-8?B?dG1rVjRISk9uNVBkTkZ4RXB2WkdhTVFIS2psVVRwYlIrQ0dvczBsOGNoYnRN?=
 =?utf-8?B?MjhDaW00K1djelZNcHFkekUzQUJTcnhyYklOUHlPOUFtMUl3OUZoY0V2T0tH?=
 =?utf-8?B?UzhTaGtlamw4WG82d2NUZmp1NnVKZ3NtL0NSQklZMHlzcGhuVFJrNitGVG1W?=
 =?utf-8?B?Wng0Zy9xYy91c1JQU2VSdTJ0YVBjeVJ5bXlQYzlYNWp0UEwzai9IbDdXSGgw?=
 =?utf-8?B?d2V5b0s4dnJQMGJJSTZ0S1F4S1JDcWttTU8zQWsrb0dHYjJOUFBUWXRhemZz?=
 =?utf-8?B?Y09neWlKb3pHUHhiNVFDbWhsZU9kK3hlRHRQaElsMDc0ZldPS3FqeUdTQSsy?=
 =?utf-8?B?NGZxQXFUbGluNDhieWp2Y1g2Q1M5WmRlcHl4WnZHRGFUV0ViS0JENHB2WGdi?=
 =?utf-8?B?MElySWF3ZERkL0RIcjFzb1BZQlllVmN4VzdaTFkrUk11K3VMSncvYitkbk15?=
 =?utf-8?B?WE1yTk5tMGtCYW9UQ1VWTjFjLzFxSzN0Zmxjd2lrWWczbXdqRlR0dnppY2lG?=
 =?utf-8?B?K1dKZFFaTFd1NUVMbVQzZjZCd096a0x2TzNmZTFweVE3YW16NWlLQ0pVVTc5?=
 =?utf-8?B?TjhSTGl5ancxaExxbmVGYWxIMWpjazg0K0VFeUx3T20ybmtYRDlmYUNZTG5Z?=
 =?utf-8?B?dzRtRlQyR3Vxek44a3BVbzN6QVoyeklScUxDNHVQd3pKVHBWUW13ZmdFcExE?=
 =?utf-8?B?UDNLeEQzUkQ4SWR2Ky83RVFONlFGaXljSDJISGpaa1ZBY1h6V2M0dHpRdWdC?=
 =?utf-8?B?ZWtjaUlYdW8zV3VQYm0wUXN5WDh4SjZVV3NGWFE1RXA2c3FpaWpGM3AyUE14?=
 =?utf-8?Q?NyP28+o+SggTMS+OGI6C1NJsw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b90ab60-713a-4178-e51c-08da96efb9c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 07:55:58.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJnVIiA8HPZSarDSWXaw6m+UhFI3BLzemsDXR2oOwIdBzmUJZEXG3FfyJj/Qcjs4WDpb98MGDUiOTVuo5dRtpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

On 15.09.2022 02:41, Tamas K Lengyel wrote:
>>> Do you have any idea what might be going on and preventing the output
>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
>>> present on the receiving side, just nothing is being received over it.
>>
>> There are few more patches in the series that are de facto required.
>> Especially those about IOMMU, otherwise it can only possibly work with
>> iommu=0 (which I'm not sure if even is enough).
> 
> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
> on the console:
> 
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0011]
> (XEN) Faulting linear address: 00000000328b3a54

Perhaps in another thread, could you post details about this? I guess
we want to address this independent of your XHCI issue. That's an
attempt to execute code outside of the Xen image - the only reason I
can think of for this would be an EFI boot services or runtime
services call, with (possibly but not necessarily) quirky EFI firmware.
Any other context this is appearing in would quite certainly require a
fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
calls we make.

Jan

