Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238D3EEB6B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167754.306252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx3R-00055l-AJ; Tue, 17 Aug 2021 11:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167754.306252; Tue, 17 Aug 2021 11:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx3R-00052f-64; Tue, 17 Aug 2021 11:14:49 +0000
Received: by outflank-mailman (input) for mailman id 167754;
 Tue, 17 Aug 2021 11:14:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFx3P-00052V-Ra
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:14:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5437b54e-ff4c-11eb-a4a1-12813bfff9fa;
 Tue, 17 Aug 2021 11:14:46 +0000 (UTC)
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
X-Inumbo-ID: 5437b54e-ff4c-11eb-a4a1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629198886;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XTseuKYQdy/KukQnX6qf4nNsznt87wf7P8NH+sXAbzE=;
  b=W/ij4ZTvi2O8LSgYIexat5LUaewqEZnYidDPwz5OoQLlLUrKPFllNNuW
   FQJO1zCr8nokB8+1wiRB5+/BPUPHMuNbTJpLzBA9TaAynozGLQcFZKDx7
   3XAyPIZUhv15e9lc+Ymu+MvUvLKXnvbwW5VE2xIs4thfTHAabPCaGe8G8
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sftQxQiQN1nzwLvh2yssDaZQjwJyl6gJJLhPiIrq6qL7ESeN2ywCMnMCauoCI80BMPkRkJ7ySm
 F3JpeAC6y4urDxT/2UNNGcIMZgMfOdbN76dcPKb3Z35rk+slKYLPTl1LmSvyV4hEMJVgiFYfSn
 04Cool04nZsMRjDFV+C7rVG2/TAWHJWBfHUXyYGGtstqu6/pPbjD9OuvaLIIwDhh1tgMOAz9vk
 eiiuxFalLXQLZWh+stHzUk9ks2bYjtB7S/1wMZGsZvg3ScNmuXP3Elp5Ym1Y36dZYXTGK2zkhF
 AgFRjQpLErCQbs35kLr8Xomg
X-SBRS: 5.1
X-MesageID: 50263454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TWTas6g2sWsZFbh+fo+I0IBMJnBQXr0ji2hC6mlwRA09TyX4ra
 yTdZsgvyMc5AxwZJhCo7+90cu7MBDhHPdOiOF7UItKNzOJhILHFuBfBE/Zsl/dJxE=
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="50263454"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHO/Af42fJQudAbbNzHWVgYbuwF1C7kaE8G4PbUYiZ35t8L+HQkSQ4//K+Cw+ZUyhq7DiW6V2kyBgJ3o+9uxANMU+caV94HrSMr0YjukIR9VmHh3zhw7ZS9oYQNJAKmB+hMVyqqf7utqqZCgNf9l2XWkcJFaAztMsGsV+yBS9aauILovjAQRWI9XG2IRf0vp5HscaJegTzh6dCmtkv7fhnjytvfMCRP9IVTPpkdmU7RyV5GScX5ZS8QQWZkpPP+r1PZUQVUKl/mhLDiK14adc/s7CooU4NJuAl5YAelncDen+afIKIUBuiiqkCr8Xk+QcV2CkgYxUf9O2MYtKFbfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC402O3sHj8QGA3OQNY9BkvNsDudROYF5qFOoOTg+TA=;
 b=E9BfYJONhQb231ecAHa1WNbwZhYbSwoTRU4yXE4Po/RkB8WedhAkx1FuIYGojJI10D2tQTdkOPEo56dZzpUeUQwTkc7KlSwMIsMJD99XG7Qb8Bf7vUoaVPGAazwE1rTMl9PE1eHkmgjXnY4o4MVcy04pTGi9iodGXdERct0J7ey1M9Ywm+eHnEa9FRk9uGuxkcuGOi/GFQcYUGqwWTCZ4ttOqn/Wety7Rz8SRCvQv4rbc8uMKwflCFgJJFf9wJ+Z0XkRcSnvtc5jFIvwq307zHrxRbVBIG0A7lHG2CQxldLTaFwtIpcqNXTv8LUYVw2MXWpqaWCiDARgVwZAMI5p/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC402O3sHj8QGA3OQNY9BkvNsDudROYF5qFOoOTg+TA=;
 b=pYoZQkOWq/lG4AVqNitgGD1M4C6xmyFTg/fhmCjL9XYH7fB1P7k96dhl8+1Xwfq7SDEVQfZmO2kPWOQM/HT9eojOAJOtfy/LcYGHQo0ULlSu4PyBrgiG+dejahPruFN3HvA7VmRTf9ntuaP5sTtpWUYg7zmNLdGoLPUGx8zByww=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: S3 resume issue in xstate_init
Message-ID: <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com>
Date: Tue, 17 Aug 2021 12:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRuXNmpT+03aPo+p@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20397ebf-2062-42b1-cba8-08d961703624
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5920:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB59206429F372BE65D01CBCFFBAFE9@SJ0PR03MB5920.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00AZEetHZQbsyubDJZ+gdWu2Npy5PDI6AKpfuVZv/LMp7Jp18ry+jvfqctp02eUr8fIQy7a4tCntjI90iuQ7ls5sxdLcoMzLc4pUsKiho+K/yAI3CpD8MV5H1Z/03+4xzi76/Ebjy2nZB/ufysvalNsK1wt6S/0eKfLcGt8pOCW9PIx4TPBzw8nHi0zNuy1GNwH8djLq6VC7rqjQO/OgAtLbDy8Aa5iThNr1vstbgtBbiK6q4NQxqhwzBFbg4yY3x27MXuuoOzMd/ggWMO9/3DxZbumrh4gFpMW9BuVrMmvsnwkJ/QOg2m8xRndAiez2fcNauFwdv4bhrnX9RAgLtoFhPttCQYlcHcBIyUxgF2laGEtd0A0I0m++eBBrMIculPyu4MPTbmnp9/NflQuNHduJ1V8Auf7/f/BrosAspJ9+LbEk/Mqh1ck+9ZPaJiSn5P+FKTIQTE9f4u8EzWfJuGc4YepUgsew6tyaxqsmMkadHkDOFmNtix+My4jujZbQ8xIfMpj6jzFgiAa8DFbSnxRgD38OCYdYc1Fmkg4+05IBMK4x48EdESX3Eh2M5E7Ca4W9gbmuQ8TcNUNnnigB/dXfqfFsK2HgcPE738pfK2/MaI+ztuItpo/zY0AOwGXe7wQI3zm86uWRLWlDbxsdejaHSZ1vUedTEYEE+hsIRLkpoT/Lo5aNaBfI33sSpkQDxDMngTkskb8/NOF50qiwWM0yFpJwdXriitSsOW6r9gc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(38100700002)(53546011)(8936002)(6666004)(66556008)(66574015)(83380400001)(5660300002)(66946007)(110136005)(66476007)(2906002)(478600001)(86362001)(956004)(2616005)(31686004)(36756003)(16576012)(8676002)(31696002)(186003)(316002)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExJZTc0RkhzcDFNUHR6S3hEV29lT0czUzN4ZkRZeUNXeE92VFpVNzZGbVBD?=
 =?utf-8?B?cDBFZDI0a0x3UE91ZTZ1ZWpWenY2WE5ZN1hOOEt3bW1CUFZhaVdkcEVldGNG?=
 =?utf-8?B?UUg3ZVFWZWJ6SGtycmRvMmY2MlNMWG1jaCs0b2F5YjZUbUFwSm4yc01jcjRY?=
 =?utf-8?B?WERhNUg3M2xkRkQyL21aOHRzNlJyUHg2VTEvVXprbHY3OXdrVXZ5Smt5S3k4?=
 =?utf-8?B?eFpHN2FCU1ZOTWFGRVZKMXIyRVlzNjRKM1d0TmNCQVdpRXN2NW55Y1NsdVRH?=
 =?utf-8?B?V2ltZFRxNUh5Z0pEYk9YOXJRWitNdkJpL016MUhDQWJkazFFUXJUMGh2Qnp4?=
 =?utf-8?B?S3JaSVk4eng1a0VwWlBPU0F4V2RZZ2FRek52YlV0anZORHprQ3A5TDJraWx1?=
 =?utf-8?B?elljaFo0ejBLRE9qSmU0anV0N293b1JVVlJRaWtuWjFPREhIQis1RzgxbUdj?=
 =?utf-8?B?MEdicmdQQm40bUNUaDRaQkRSb3RYWDNGK1VSWTg4OEQzaXMvcDlPbVFobisx?=
 =?utf-8?B?UWdpeDV3WDlRZjQ5MjFqQVAzRk9Dc3htTngwTkhXdkFEdjBsQzA1RVp5cVVo?=
 =?utf-8?B?MzhtZzZXbG1xNkl5RzJpeWlteWFucnhleURKRlppVlFDbnJYcVZhMkdpcmtn?=
 =?utf-8?B?clkzMDZTTkZTeFJZTWY0SjFDbUlYczNtYTNMcmJkMi9EL0lHb2d4MHUvM0Q3?=
 =?utf-8?B?L1BOTWtxaTJoMHRCVWlwYkdpQzR6S2VaVUdyVUVmTTVYaElsdWlVVklwNVJr?=
 =?utf-8?B?Rjg4VFgvd3Z4eHk0NjlVT1NJNzJRajhvTHRqNmhIbGpSdnNvdjQ5UVp4NDMr?=
 =?utf-8?B?QVJXaWNrTVBFU0RYTEQ2Rmo3cTJpYUkvWDR1MEtJOXc2ZFlBRTJNUkE1UjJV?=
 =?utf-8?B?RjVoUVEvU0NhQWN4ZVgydXk2cjNmRklmanRTOWVoVFdhdDFmczdLZVd6N05Z?=
 =?utf-8?B?TVJOcVdUdnRQTGJlRUE2T1BUSTFMWUkrTjhrK1pqNUVkT2lYYVJhRTJSTCtE?=
 =?utf-8?B?K3NjWnNoYzlzWE92ODU0RHozL0FrNktvbzl2OHg5cGplMU85cDJ0aHBKdC9P?=
 =?utf-8?B?VEF2czlJRERFMnFJRHNpcDNFVHRBRUZIc0Y1QUExUnZ0RlVuZC9sdEVuUE9D?=
 =?utf-8?B?djR4M1hBcVNhcUMwTEpTLzNSZzlJTnlQejZWK2FwQWsvb3FWRDlUNHdxMXVY?=
 =?utf-8?B?bHVZKzQxK2RYRUtSY3p2VUhrRmdpY2IwQUhUYWJLcjUzcUFHUW9KeDhMY3hH?=
 =?utf-8?B?L0cxaHZVajBlK3JoNzJ0dnFDZm5XWk92aWwyNHA4WjR3R2pXMCtUb3ZPamJS?=
 =?utf-8?B?V3diTnZhV3B0TlVZdWd4S2hNMjhpbFkwL2RIUVR5TXZzYW43T1lpYkVibUU0?=
 =?utf-8?B?cnlYR1FDZXFKNXZMMzVaYmhlaTNlbjBGS2pFNWwvWERBNFJjWWk4WGp3WHlx?=
 =?utf-8?B?MkRHeTlHd2dRNXRsYWhhMTVlcTBDWWpmU1pweUIxQ1p3ZW5wMEE5MGk3aEUy?=
 =?utf-8?B?Q2RkQXYydXpLOEJyY1lTbmpHSENCNUxDVDY4dzFmcHZBdDhNdCtpWWVMRElj?=
 =?utf-8?B?a0FnMkN1dS9IamxuWHFxT01ydzE2RHpXNWgrejZsNjlSQzlRRVhaZ3NsQ29V?=
 =?utf-8?B?OW1VYnFDQWgvQ05kMERqTnFVVUNHRmUrY0Q5M0hYeTFwNTY3Z1Bnd3ZsWmpC?=
 =?utf-8?B?T0ljY3FTWGw1RC9wZ1pXTkNtVSt0KzRNNTNrUy9tenh3MFFOQlMrOStGOEww?=
 =?utf-8?Q?tK5OQROnvA0eyXIVJE2N5hYUPafzQ+Ld+p4KwoF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20397ebf-2062-42b1-cba8-08d961703624
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:14:42.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN5TeJCgFVRF1pqH9AlLJXuPuej2Li2fnhIqUcsjGi9AfGpmbfrfuhrrVKB0nYBVN/HSFFcaqcUg0OWfdKCLKFZf17pm7X064UDV8lfJsi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920
X-OriginatorOrg: citrix.com

On 17/08/2021 12:02, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
>> Hi,
>>
>> I've got another S3 issue:
>>
>> (XEN) Preparing system for ACPI S3 state.
>> (XEN) Disabling non-boot CPUs ...
>> (XEN) Broke affinity for IRQ1, new: ffff
>> (XEN) Broke affinity for IRQ16, new: ffff
>> (XEN) Broke affinity for IRQ9, new: ffff
>> (XEN) Broke affinity for IRQ139, new: ffff
>> (XEN) Broke affinity for IRQ8, new: ffff
>> (XEN) Broke affinity for IRQ14, new: ffff
>> (XEN) Broke affinity for IRQ20, new: ffff
>> (XEN) Broke affinity for IRQ137, new: ffff
>> (XEN) Broke affinity for IRQ138, new: ffff
>> (XEN) Entering ACPI S3 state.
>> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, =
BCAST, CMCI
>> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
>> (XEN) Finishing wakeup from ACPI S3 state.
>> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 2021-=
01-05
>> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
>> (XEN) Enabling non-boot CPUs  ...
>> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
>> (XEN) Xen BUG at xstate.c:673
>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
>> (XEN) CPU:    1
>> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
>> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
>> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 0000000000000=
440
>> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 0000000000000=
01f
>> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  0000000000000=
001
>> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 0000000000000=
001
>> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 0000000000000=
001
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000352=
6e0
>> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000=
000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
>> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0d =
cb b4 0f
>> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
>> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025dc9=
fd70
>> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bfeb=
fbff
>> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d0402e=
43ce
>> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f0000=
0121
>> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f0000=
0000
>> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f43202952=
286c
>> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a48=
4730
>> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085dc9=
fe30
>> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d0402e=
0040
>> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 000000000000=
0001
>> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 000000000000=
0001
>> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 000000000000=
0001
>> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025dc9=
fee8
>> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 000000000000=
0000
>> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 080000200000=
0002
>> (XEN)    0100000400010000 0000002000000000 2000000000100000 000000100000=
0000
>> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a000=
0000
>> (XEN)    8000000080000000 4000000000000008 0000100000000000 020000004000=
0080
>> (XEN)    0004000000000000 0000010000000002 0400002030000000 000000006000=
0000
>> (XEN)    0400001000010000 0000000010000000 0000004010000000 000000000000=
0000
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
>> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
>> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
>> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
>> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
>> (XEN)=20
>> (XEN)=20
>> (XEN) ****************************************
>> (XEN) Panic on CPU 1:
>> (XEN) Xen BUG at xstate.c:673
>> (XEN) ****************************************
>> (XEN)=20
>> (XEN) Reboot in five seconds...
>>
>> This is with added debug patch:
>>
>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>> index 6aaf9a2f1546..7873a21b356a 100644
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>>      else
>>      {
>>          BUG_ON(xfeature_mask !=3D feature_mask);
>> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"PRI=
x64"\n",
>> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask), fe=
ature_mask);
>>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_mask)=
);
>>      }
>> =20
>>
>> As can be seen above - the xsave size differs between BSP and other
>> CPU(s) - likely because of (not) loaded ucode update there.
>> I guess it's a matter of moving ucode loading somewhere else, right?
>
> Few more data points:
>
> 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
> 2. I do have "smt=3Doff" on the Xen cmdline, if that matters.

As a datapoint, it would be interesting to confirm what the behaviour is
with SMT enabled.

I'd expect it not to make a difference, because smt=3Doff is a purely Xen
construct and doesn't change the hardware configuration.

>
> I've tried the same without letting Xen load the ucode update (so,
> staying at 0xca) and got the same effect. So, I think it isn't about
> ucode...

Any chance of a full boot log?

This is bizzare.=C2=A0 Looking through start_secondary(), we've got an
ordering error between updating microcode and checking for dropped
features, but again I don't think this would be relevant here.

I suspect this is going to take some more custom debugging logic.

~Andrew


