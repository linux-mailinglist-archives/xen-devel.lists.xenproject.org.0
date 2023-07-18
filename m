Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42C7580C9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565365.883478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmWU-0007nE-TZ; Tue, 18 Jul 2023 15:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565365.883478; Tue, 18 Jul 2023 15:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmWU-0007lY-QR; Tue, 18 Jul 2023 15:21:58 +0000
Received: by outflank-mailman (input) for mailman id 565365;
 Tue, 18 Jul 2023 15:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLmWT-0007lS-AE
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:21:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4b56a70-257e-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 17:21:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8041.eurprd04.prod.outlook.com (2603:10a6:10:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 15:21:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:21:26 +0000
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
X-Inumbo-ID: d4b56a70-257e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoVYgoBBYtoQ5RUq34+BDhixwwsFn+5e+Y8Ds13zX5XaFGS/nq+0sE/JMI4X7vALbdrytjrRVNUNI97ujWZ4YP9VTKfxrjB3U4JyUvExzakhe6GybN9CQOUgE5fSGfo2zEPOHWHC/gKh0Dy+3CRE9aINgmNPeqRcUuHBJGOJpTF9pO6JMVkyPgKlUY4G1+H9hn1w3n+zi6HZnJs/Ku5W0zYZjmMDnSu2fGGWdzUD2WYcVys+TP3IBpjeeZo59R02SPY3KlhAAqP6HD5qB0TV09Ewp8RpNgrokq30kVDdiuLs/jGJLYtR7jdnHKFGFeb88PGV3u+113kbJE6yUyvKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaB69kRt5wfhuIYifwZmcoRhtyVlFv1rZm0xo+VxziE=;
 b=KXhfP90DqYX7JYxBBYXqNqeTiIfJW382od55oZ1QqPZnxutUOeYIijAEaGLJTi8KAhNQoN28oam0AiQhHr/xb7kykuAGpA2kIrv9+5T7wqQ3jqPjL8Zg2uQ1FmpNRxpoF3Po3zdHbN3TFgLcwhCp6H7sCUPvimZA2vcBEX8m+F4heTOCk+zV4o7qXAWlj2W/pm2Ni1OY8T3yen+dHhAvPKtObE8uDiKhDLkRajAY5BxrjX6VZAlsqrkPggluaU5LiceBoF4jItKjnTYvmFoihUCrV4ocUTlv8PLZazWADtC4zTcMTU6+sxpmOWmSIoQ9akknT+6yXVwJgGZaG/SiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaB69kRt5wfhuIYifwZmcoRhtyVlFv1rZm0xo+VxziE=;
 b=YXIi9jUjFm42twaMs3ktfiN8pjBU9vkxOlU6SaQbOZ9QSstSCTnR2h2b8N7dUxol7EpKFn3bpy2UBhYOmMbM/eM+eIiy/ulwndE6F7CLD1jiv6egsHYxGHDqX9exaiU9rTP8vSEuD9B1ay+dzT0hJUXFD98zXakyMQGN+r1LwSS7ohiGZX2XYZmbec51oCW5IpDN8auD463XlFRVE/H4nyRjNYrGwYR/NY78yqKAIWFFhz37R/u8kytZX+sAD6/YcjKryKPKkPlOO8qvBL2OY0E1X3W3TiQUm4ciSKwYdqKmfr77eRvCjaK0gNtcbBblCZfDsmHlcVA//pclb0KZeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10f37ea5-7fa5-976f-3e7b-fc675db20ec0@suse.com>
Date: Tue, 18 Jul 2023 17:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC XEN PATCH] x86/mwait-idle: Use ACPI for CPUs without
 hardcoded C-state table
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <aef138a50aaa769fceb2002dd56de437f1b8c456.1689674757.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aef138a50aaa769fceb2002dd56de437f1b8c456.1689674757.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd3eed3-55dc-4f6e-ce8f-08db87a2a78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gtOX+v4eZbEf4Vf+3c156CDhgUkjvZ9VDzdXE5pA2txx92E/B4IzXCcKX22p0n3rs/yn4nJR4/zvzpBsM1+nL5GheR8yk/OAYfb2YAiCWcAZS7i+EOGCYpdWBCCR87iK+eALRN/TIPfh9YUuRRedRjPXje2UVO0LH8TxZd7QpkzTEUMBPebMu0ISRaWFJltmZB/WqSUu0ZskZHKfUk7HAnZqh9mfV3XD/OWKy9xyMaiKxa4NMWP5QK/kNhEK7FXOXXAb3ov2CtOdr/tENtuVhg4DvCmJo7ioIOVXfo9NXi+GCLppeeaHbHED8WByPhHvpKTQ+iaW2s+Aovq3puQgKl1kWL6Wmqp7m29sLT6/fCQncFLRD4sa60xomJ4ZwvS4ndrOfPg6Q79oD7tUKePFMfE/7cKk3ljf6hUmD/UvC50fF5GhICm3aOcUwUXTcRyMtVxA1q6m8LI9B/TCZFwR381vuSeg+zIvPfdxvgP+OGw/1BanYwOtCM00VWcNqu6WaH/AA9QMQcmfhnkT/njPOijmazFYbadV3KRJYDdKYK5LZDoLBPufjr14A8p6bn12EI8DzdowbGidJCJYbhP6yWmaDKLv1rGt+g6XnSKqEgr7Qo35CAqt+FOG+kdoPUAldzaErS8OPktVKyLp/Nixjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(86362001)(2906002)(31696002)(36756003)(31686004)(186003)(83380400001)(26005)(6506007)(53546011)(6486002)(54906003)(478600001)(66476007)(6512007)(6916009)(66556008)(4326008)(66946007)(38100700002)(316002)(41300700001)(2616005)(5660300002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0thcGRoZjVka3dwTFlUaTArSWVoV1lmNWhXaDIySzlIWHVDREdvZ3J1UjFy?=
 =?utf-8?B?d1lCRUh0ck0vQ2dwZUJkbEcvZ2hBWG9Jck1BbFA3UjhtcE5zb1R1bVlJT1du?=
 =?utf-8?B?RTZIa3Z0SkVocnUrSVJ0MGZ2UzkzeVhmTXplRzhSWDJMSVp6aUUzUy9oMzBO?=
 =?utf-8?B?dTB0eFVvNC9adWxFL2pRdmsyWnQxV05VYWdoZFFsaVFqN1VpcFZGUWVQZWtV?=
 =?utf-8?B?aUF6dll4Slc4Z0RvNEd6Q1V3QWs3cjB6L0VmM0RsdW9LQ3ZrSFlDVkZHYXUy?=
 =?utf-8?B?c3Q0bjJ5c2RrRzF5ellPYjRsaE9jSjlKbEJyM3IxZFRJL1huRms4S0JGT2hm?=
 =?utf-8?B?VC9xYmltS0RIYXg3d2Nnakdwd1NWNkVLdlRlUi9IekMybTRoT2NKTVpkeXds?=
 =?utf-8?B?Ni90NURqNWRFeW5QdE5hY216RTQ5ajFSeEtmTUtoZThkUDRzRk5pS3F3ZTRa?=
 =?utf-8?B?RjJWaDJRdjZUaXFoblJBZXZwVjViQXk5OUdwSGtTZ0dlbDArSGtLUkZFekYr?=
 =?utf-8?B?WTV6YlZIWlJ2R093aWZNQmNFMGVuVEdoUGNVNitPaitXV3VDclJQQVN5QlZv?=
 =?utf-8?B?K2tYRXFjbHFhNkpSS0pOUEZ6V1JaamF2RWxPU3JIOUZNOFBjUHlMUzZKQUR0?=
 =?utf-8?B?MnZZd29VWnhYQW1lQk84blBmTkZ0ZlpsQ0ZBSldVNm5IeHdYcGdjZ0VzemxE?=
 =?utf-8?B?blJGeUl6S0szbitlV0I2Rkk3R0NoNWJUSTdsYWRocjdFbWlYcXRwWUFjVUlt?=
 =?utf-8?B?cytrajVSbUdjdkNickE1ZzZDWmwwcHBRUExSVCtNd0h5ZzZwU3I0QzZ3ZmVl?=
 =?utf-8?B?MlRGSG1KNDh2OW83aEFlYkNYVm9MNFFCN2NJbWZwYzU2R2hDRTVhNEFFTTRR?=
 =?utf-8?B?YUNrcUVVNCtNYVhmMHpobE5IekJOM2ZveHZwaVpmVlppSDVaWkZKZ0JiNUFl?=
 =?utf-8?B?MkVkdE9hM1QxNTRlaldZTnIwcGVJWHpBbDF4b1RsR2E5U1hEU3hxQkNoc2F3?=
 =?utf-8?B?Zk5KUTZuRnhlek9La2pFcEtxV2JXNGRMVXZnaGNFMG5ZN05BNFIvQTd3RFN2?=
 =?utf-8?B?RkxCUTIvRkJHTTNWK2RWQjJvRmg3L1pEMjdQMTJ6a3N2TVdKV2NQLzhwOUZP?=
 =?utf-8?B?d2lBbzUzbG82azcrNkdHcUVxMnJIdXlCYXMwTFNQMFRDczlsMk5mTmxabDRT?=
 =?utf-8?B?MkZ0elM3Rk1hbzNGM0pNQjU0V0JmUFNPdDV3MjhPRkZldElFcDBSNWFidzR2?=
 =?utf-8?B?bW10K1M5RFN5RDdMTTRjVnFtQXhzbUJraHNvYUQxRGZzYThKQXBNMGE4dlFa?=
 =?utf-8?B?eE44NGcxRmY1eExqRGNSK0tyVWJYcFU3T2FhK2tZakFUUjdBYWVwRlR5NDhj?=
 =?utf-8?B?MWEwa3IyM0dQaUZGUnI1Z2NVbFMrKzBqeTNBeElBdlRKSmdteXNSMC9yOS9T?=
 =?utf-8?B?M0NTb2dwd1ViWTgybXRlNmdlMUJSVEdhNzdGVVVBamNQVndFWE5XSXdpNkdj?=
 =?utf-8?B?VHVKN1ZGWWYxT0hvZC9MZ1JGK3cvOVE1T0cxUWRjVGVycVZLcmlXTXB2dlFy?=
 =?utf-8?B?ajJ1cWZ3Ny9CeFVwSUZ1c0dzaXkvUXc1Um03YVQyT2t5LzdZT1Z4NnNJVzh4?=
 =?utf-8?B?Q3dKOFBhMTNxVTlLemNjQnV5K3Y1QWRHS1hSQ1FBcjhyalN2ZCt5SjFFRGRq?=
 =?utf-8?B?UjFuODRVYVRDMHFsWENxUmsrYWZuekVzTy9BT2hYZU4rSlR2ZG5HOFp5WHM4?=
 =?utf-8?B?NzcyaVVCN05jNWFLVGVwMkFrYW40cU53M2dPYkMyTEZtY0lKQVBwc04rNlRh?=
 =?utf-8?B?YndMRHkrUXA5YXhsdmRNZEpYMk9wMEdQTlVZMG9DYWJqcDlhcEYzNHRYbFpn?=
 =?utf-8?B?SHczeGYvcDhJYjhETWhPUDFtTEo5N2dvQ3lLbURnQ29ZREUvL1gvQXJEV1RT?=
 =?utf-8?B?Y3RiemVDWHBveG0vVWdFOGxRWE5vWHlZS2VSUFRZcW84VWdrcVJwNWMxdmpj?=
 =?utf-8?B?MytrVkdrbXpjU3dLUlorYzRyOW8zU2JSaTgzYjBtZFQvWW96dTcxKzZhc2o3?=
 =?utf-8?B?R3ZuaFhsc3FaQzZPamlNUDgxSHIrNFNIY2FLQnBlTmNORWZsb2ZONUZnRHJ0?=
 =?utf-8?Q?SKdNZ25y392tq5mQm3vAcgCbz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd3eed3-55dc-4f6e-ce8f-08db87a2a78a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:21:26.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEV+cR0oavV2h71l4W75UCtzsHnVwYXiOd4t2k+Kr+3fHMuZ8im1uQCIAvu2BWzuWLoWuQHV1CE2ySgJ/B3J+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8041

On 18.07.2023 13:04, Simon Gaiser wrote:
> mwait-idle includes a hardcoded config for many CPUs. But some are
> missing, for example Tiger Lake. Linux' driver reads the config from
> ACPI in those cases. This adds this to Xen's implementation.
> 
> The Linux driver also has a feature to combine the internal table with
> the infos from ACPI. This is not implemented here, for CPUs with
> internal config nothing is changed.
> 
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> ---
> 
> Sending this as RFC to get feedback on implementing it this way. I tried
> to keep this change small and to avoid changing the existing code path
> for CPUs with a config included in the driver. On the other hand this
> makes it look a bit hacky.
> 
> I'm not quite sure if initializing mwait-idle in set_cx_pminfo this way
> is correct. For example set_cx has some smp_wmb call I'm not sure when
> it's needed, so might be very well missing something.
> 
> What also surprised me is that the existing code in mwait-idle first
> calls cpuidle_current_governor->enable(processor_powers[cpu]) and later
> setup the C-state config in processor_powers[cpu]. This seems the be the
> wrong order (but, I think, current not important since
> menu_enable_device doesn't use that part of the struct).
> 
> When I brought up the topic of this patch the first time Jan had an
> interesting questions [1]:
> 
>> It hasn't become clear to me why Linux now has two CPU idle drivers
>> consuming ACPI data (intel_idle and the purely ACPI-based one).
> 
> I'm not quite sure either. Linux' intel_idle.c states:
> 
>     intel_idle is a cpuidle driver that loads on all Intel CPUs with
>     MWAIT in lieu of the legacy ACPI processor_idle driver.  The intent
>     is to make Linux more efficient on these processors, as intel_idle
>     knows more than ACPI, as well as make Linux more immune to ACPI BIOS
>     bugs.
> 
> The commit that first added ACPI support to the Linux driver [2] says:
> 
>     The main functional difference between intel_idle with this change
>     and the ACPI processor driver is that the former sets the target
>     residency to be equal to the exit latency (provided by _CST) for
>     C1-type C-states and to 3 times the exit latency value for the other
>     C-state types, whereas the latter obtains the target residency by
>     multiplying the exit latency by the same number (2 by default) for
>     all C-state types.  Therefore it is expected that in general using
>     the former instead of the latter on the same system will lead to
>     improved energy-efficiency.
> 
> This sounds less impressive and doesn't explain why not to just change
> the standard ACPI driver to use the better latency settings. On the
> Linux what might play also a role is that the mwait driver also gained
> the option to combine the internal settings with what it reads from
> ACPI. That would be probably harder to include in the generic ACPI
> driver.
> 
> This also raises the option to change the latency setting in Xen's
> generic ACPI driver for the affected CPUs instead of touching
> mwait-idle.
> 
> Currently I'm interested in this driver mainly for S0ix support. I did
> nearly all my testing while using the mwait-idle driver to keep
> differences to Linux as small as possible. (At first by hacking in some
> config for the Tiger Lake CPU of my test system. Now with this patch.).
> At some point I observed worse S0ix residency with Xen's generic ACPI
> idle driver than with mwait-idle. But when I tried to reproduce this for
> writing this e-mail I wasn't able to reproduce this measurement and got
> the same residency for both idle drivers. So either I did messed up my
> previous measurements or I have some unaccounted changes in my test
> setup.

Taking all together perhaps more of an argument to see about making
the ACPI driver better. If with the same ACPI data the mwait-idle
one can (maybe) achieve better results, surely there's a way for the
ACPI driver to achieve the same, likely with less of a change?

Therefore only a few basic comments.

> @@ -1360,24 +1381,27 @@ long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
>          set_cx(acpi_power, &xen_cx);
>      }
>  
> -    if ( !cpu_online(cpu_id) )
> -    {
> -        uint32_t apic_id = x86_cpu_to_apicid[cpu_id];
> -
> -        /*
> -         * If we've just learned of more available C states, wake the CPU if
> -         * it's parked, so it can go back to sleep in perhaps a deeper state.
> -         */
> -        if ( park_offline_cpus && apic_id != BAD_APICID )
> -        {
> -            unsigned long flags;
> -
> -            local_irq_save(flags);
> -            apic_wait_icr_idle();
> -            apic_icr_write(APIC_DM_NMI | APIC_DEST_PHYSICAL, apic_id);
> -            local_irq_restore(flags);
> +    if ( cpu_id == 0 && pm_idle_save == NULL ) {
> +        /* Now that we have the ACPI info from dom0, try again to setup
> +         * mwait-idle*/
> +        ret = mwait_idle_init(&cpu_nfb, true);
> +        if (ret >= 0) {
> +            unsigned int cpu;
> +            /* mwait-idle took over, call it's initializer for all CPUs*/
> +            for_each_present_cpu ( cpu )
> +            {
> +                cpu_nfb.notifier_call(&cpu_nfb, CPU_UP_PREPARE, (void *)(long)cpu);
> +                cpu_nfb.notifier_call(&cpu_nfb, CPU_ONLINE, (void *)(long)cpu);
> +                if ( !cpu_online(cpu) ) {
> +                    repark_cpu(cpu);
> +                }
> +            }

Is this safe against a CPU coming online or going offline?

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -71,13 +71,15 @@
>  #undef PREFIX
>  #define PREFIX "mwait-idle: "
>  
> +#define pr_err(fmt...) printk(KERN_ERR fmt)
> +
>  #ifdef DEBUG
>  # define pr_debug(fmt...) printk(KERN_DEBUG fmt)
>  #else
>  # define pr_debug(fmt...)
>  #endif
>  
> -static __initdata bool opt_mwait_idle = true;
> +static bool opt_mwait_idle = true;
>  boolean_param("mwait-idle", opt_mwait_idle);

The variable still isn't written post-boot, is it? If so, you
want to use __ro_after_init rather than dropping the placement
attribute altogether.

> @@ -92,7 +94,7 @@ static unsigned int mwait_substates;
>   * exclusive C-states, this parameter has no effect.
>   */
>  static unsigned int __ro_after_init preferred_states_mask;
> -static char __initdata preferred_states[64];
> +static char preferred_states[64];
>  string_param("preferred-cstates", preferred_states);

Same here, I suppose.

> @@ -1151,6 +1153,9 @@ static const struct idle_cpu idle_cpu_snr = {
>  	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
> +static struct idle_cpu __read_mostly idle_cpu_acpi = {
> +};

No need for an (empty) initializer.

There are also numerous style issues throughout the patch, which would
want correcting in case there's a convincing argument towards going
this route.

Jan

