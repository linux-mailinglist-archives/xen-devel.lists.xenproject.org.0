Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8CC70F99B
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539116.839679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1q0d-0001uY-6f; Wed, 24 May 2023 15:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539116.839679; Wed, 24 May 2023 15:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1q0d-0001rS-2u; Wed, 24 May 2023 15:02:39 +0000
Received: by outflank-mailman (input) for mailman id 539116;
 Wed, 24 May 2023 15:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1q0b-0001rM-PM
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:02:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0513678c-fa44-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:02:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7311.eurprd04.prod.outlook.com (2603:10a6:800:1ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:02:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 15:02:33 +0000
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
X-Inumbo-ID: 0513678c-fa44-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHrq4GI/jOqW26GB+m97rMpJhzaKMh1vY7HoX98BxQlVIOmfuc27AMigcEBx72XICV3Yq5mN4x8tqTByK6WPcd9poahvWuFCjBVy9qsJt4kaag9pevWqZFDs7PB9m6N1S2QiH9B0v1uU0TNqgjwZM00hqoYljHUz/VZCwI7fdFD51hl8BFg7gMBlyHdvnO3LOAr+LwRj0QqjmHsQVWHMr7KhoBTjxHLIH5jr6YC5EAc8prvL38L+JxMR2hLxaZcIFgF+Cz/AVb6ePXH/an0nGMPqByTfANz1ZExYq8ZQb3ypvA+HTqDdjhB/k1TJJJpipF3D0AmhZv3Rmcrn1+gOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFcYZRr9ZtsZhw023xziDDrFhaodemdX3B4JtSQTiOA=;
 b=EBYo/A7GeM6hoFzICNUV9cIdsEvuxPBnOcNYr5NKzitA4Zyrb6nwH2TvH1zL8Sc+VojeUeHjin1cp6U6Old8h+0rkrAc5wOSab7WRlP7g2rTYX4KZZVEWHA+PykhISXvokQRMHCEMBGL3Ldo+j/UFFw9DJRqjcNBVB8dJ7/Myky30WSSO8v+Nm96kPLRe6Yk55ULiyTeeNT22H30XDadEdV0ad3TwuCAAo6oVgKqmYDOGzm5iBeErSxdWSZASKXVL++EbOD0y3jTkAeG97KYyTjF6h+V7HTmN7dar1Z0vJ+wZQLIVkSWHKVtCRtd59Bplh1VaPiA1iYzVi22Xbfv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFcYZRr9ZtsZhw023xziDDrFhaodemdX3B4JtSQTiOA=;
 b=XImIM27uJ1Ql3WdVsk88CABS1/Xom6Y4mV/APpLVKCD+ZA4rbC7HasRcultgnWP6wmkRmXvvwPz34G8hILQbu5wVJZlyBDFJub81/TlNZCoJ576SwtlCD/mtPZJ3ksc+Aw1SAts+oYGR2iaaZhvFgYkNfHXIpiCxw7Q2BvQTD2hp/b2DVNjOOykBSoOculXFxwDBdoC/6XKA+b4eKRGueFOlhfmT3YbNS85JIkl1V2WgffzT24h23YFACy12dc20e9SeHyAfhw+fmZVO0DI9aCViFWRizpXVCxkPFS90MuacGYk6yxxmHoX3AabhuAWT58ME0aWAPF/k5mgHmgboIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c0e8676-8623-0b07-9d60-616736eecc98@suse.com>
Date: Wed, 24 May 2023 17:02:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/10] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524112526.3475200-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cb9642-305e-43e7-0722-08db5c67e768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eLdgTpBfgTs/Ce6BQxU/xieLPWXFaux2+L/LnqeN8PTK/uzgbCR5AuDS93KKRjna8nIECt0WYfHoYviBfKI/c42VsSaMAc9qcA1WD6Ig5avt/CU1ie7Zp8owWEv3UCKirxfD9a4BKmer2HFul4bEEaShz2aH2wSdbiy8CEDQ6R3/QPUkkmTZ+YfPkL+oLnAuESsxroJ5csIje1K2IpNHldUp10xXbyR61ar8l9rXDLI56dwq1GT/dltDF9RWMVn1ztNz6NGGJxEyVEkk/sZE/quyI29Q0KMTcORzdIqYAygUZwAvAAC8dQzvQ/VutoU3wX5mGnIBJqVxTzrRrdCFDzLZ29eEuosnzEsozqGjXtwvEjXNC6ARtDaK7nO8ZGAdMDg6VmgkT8I6d5YppfAXJMfTOehZ4+olBfir/PIZobW40EHw0pYeoTnca8COkaBILVIls0lNo851cjryKqQwznLyNs9It7k1kgLM+6k7grPJ/ctli3BPE5PUTZLkP4wi1AKMoLLF/8MPj911t5zlLXE0HPOYoY+8ZWs3uhMkUSvPEvopqaOHxy0Hoc2WIhM+9UQIOM1oNEvYy5ZE87I5nCLE3sqABG+iKbfZEMcdqWtsfcxbwMtsMnKBDPgr4QoPmHsfue4ncaJtgaAEXmTc+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(26005)(186003)(6512007)(6506007)(38100700002)(6486002)(53546011)(478600001)(54906003)(2616005)(31686004)(8676002)(66899021)(8936002)(6916009)(66556008)(66946007)(66476007)(2906002)(5660300002)(4744005)(316002)(41300700001)(4326008)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ams1UHBrNWpaK2gxQmkwTXZOZ25aT215dzdMRGNmRUFRM3ZYaWpPc0d5bitL?=
 =?utf-8?B?Yy9rRjV4TWxtUTRIR1J3L3JIb3I4Sk1FZ2VXS1JYOWwrY1doQ3pwd3NwRTJ5?=
 =?utf-8?B?aXdna1Y5MitGM3FjLzZweWN2blhVOTFKdVJsNVFxZVF3SDNXS3NncndqUCs5?=
 =?utf-8?B?L0MwcUNWd3h3T1ZlZllkM1d6RnY1YTlKTGdEYTQwWW5mcm1HSFJ2Y3hhRHBH?=
 =?utf-8?B?dW95SEIwWXNkc2RQeGptcmZKd2xRTW1IOTNKMXZxMmFGS0JXNGdNdStnZVpU?=
 =?utf-8?B?WUhyUE5Tc3Rxem94ZmdrMjFLbFFJTGhVSXJpRHA4VlFDbUtoZUM3aW9uaWM2?=
 =?utf-8?B?MTVYeFFHT2ZiZHUwUFJZcUFjc3NvV08zUVd1SVU1YVg0ak9qYzljMit3ajRl?=
 =?utf-8?B?RHdFU2hJdmt3aEh3TDVXeFJqSnRtVmlHWnlUWS94N2ZUb05kVXRhVDBKeXNL?=
 =?utf-8?B?ZUhrcy8yRVdkOGN2ZGFnMTE0NFgrMEFsc0RyQTBZUk1kT1VnNVdLd01YdlVr?=
 =?utf-8?B?aVBrRnlZeGlHQnpTeHhGWkcrRmpKMXdabEdIbHZ6Y0dnZEVvTUZJR0NyUVl4?=
 =?utf-8?B?dHh0bDhMREUxMHl1UEYxZDFnZHVhbUdxMGJLeDZ2Y3VZdlFpcUtGLzhaUVFR?=
 =?utf-8?B?RkpKZUh3TVhiYW1tQ3doV3k5NXFMaytJaURNMXl1MXhpMkVKR3ZrN2tDVjQz?=
 =?utf-8?B?d0dMSTE1KzJ6NS9DSlhPcmVRbWgrZjVCVzREbmRzSzVuaTRzNDhpeWYycWEx?=
 =?utf-8?B?M2xRYjU1RUhIM2pLaU92bHF5RVJibnRHUGRCa3d3TnYvR21vaHRYT09lWElX?=
 =?utf-8?B?V0pPU2tHWlkxU1ZGcXJJeHF2amFxNHpHZzNRWHVIcXZhU2pBS3V6RjUxT2lT?=
 =?utf-8?B?Y0F4a1Jxa3dvWTVwQmpMcm0wbEEySjJOWDZHQm01SkF1M1RqMWgxRTFqMFJD?=
 =?utf-8?B?amdKQXR4ZEczQXczUFJKTHNVeDQwais4RXdDdlBpdlBPbU9XY1NKMzhYR25Z?=
 =?utf-8?B?d1lucGtIZU8yc0paTCs1S2x3YlJiRVJqWUZXNGNDRVAvYWN2VGptMDBoMHFw?=
 =?utf-8?B?bTJYUVNMWmYyNVFzYVVzRm9LbVZleHJaYVFUcEFVTUNIajJrM2R5ZnhneFQ4?=
 =?utf-8?B?S1A0NkkzcTVIZTAzNGYrNEJ0a3VXbUJRZ3cvYzFQUFhaWkppNlhXNXE3QVNL?=
 =?utf-8?B?VVk0N0xZVTRzS1JmeGNVak9BU202R0g4Yk5WVFhBbnlielQ1S05jK0VCZ2dV?=
 =?utf-8?B?Q1UrZUg4em1KS1lyOXdweEtkQzQ5Q29qN3NmaUtZWDllZXhLS24xY0VGT0po?=
 =?utf-8?B?R05KR2pMSWJ5QkYwTjl0cTVBUVZQbUc4YndtaTQ4bnFyOTBIQTZKaGlhd3FD?=
 =?utf-8?B?Zlp6ZEtRSjNLQ1pOcm5qMFRnVnZTOWxFWWRXS2tHYUJLZXpHYWFubVFVWndM?=
 =?utf-8?B?dWUzMmpTeUZPbWN2WU9LZDY5Q0h2YTU2R2p0Q1NTcDZjQTIyOCtqbm4yM0lR?=
 =?utf-8?B?UHZlNFF4L3o1cWp0TUQ4ZnlOUkZRWlVQU1RtcUFYZVorUnM3Z0NBbWc5TmdE?=
 =?utf-8?B?cXlpRFVQYXoxY1VmclhPVWN0RjBkVU8wNVNZQjdwZzQxMzVNM29KaTl2K3Zq?=
 =?utf-8?B?dTVkWWpiZXN6aFJwalJSNU9CY0JvOVNqSGdwRklHVVZOcnhRRU1sUVR4SXQw?=
 =?utf-8?B?UURjRjhJUXNzS2FXQ1Jpc2VYcmh6RWZKdGsyR0tiNTRXWW9WR1lpRk0vaHV3?=
 =?utf-8?B?bThhbXN0b0EzVkVRNnZHa3paNXM5aGtzQ1g2enpwL2syY3JaODBHd1E2Vytn?=
 =?utf-8?B?WXB2K0dneXVmTWNOejJCWWNJcEVQWEFqZDRHMnNnOEw2QVRoVzRtTFZxdUpB?=
 =?utf-8?B?eXRXajNWR1QrZVlYcC9UZmZUa2hJcklLZVFWbE5NVDNHNitUUCtVeGJiM0o4?=
 =?utf-8?B?b3pYbmpPSG5RY28yK1ZrOU8wZDNQVW12YndMZzR4eE0wWFhVRVdTNWVlWW9I?=
 =?utf-8?B?ZVkzdHhGL1JjL1BuWkFDWEpxYjlUb1BBSXYyeFYwTG03MTY2QzR1NXZDeStY?=
 =?utf-8?B?d0xMbk1WOWlHa1QvWUFLeVQwZTk5YVNrVnVnSXdlTG5ncVVzaHJ6ajloa0sz?=
 =?utf-8?Q?lvAmD90FHsDWrvQF2tKYfF/Qx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cb9642-305e-43e7-0722-08db5c67e768
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:02:33.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6CUD3HaWa2w+Z6Np1bZPOMO1dqW+sOB5p+iBVlCyP9FoYKb9xeXfy3SjimeOsFHpEmR0fyxH6E92yIlWO9oTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7311

On 24.05.2023 13:25, Andrew Cooper wrote:
> We already have common and default feature adjustment helpers.  Introduce one
> for max featuresets too.
> 
> Offer MSR_ARCH_CAPS unconditionally in the max policy, and stop clobbering the
> data inherited from the Host policy.  This will be necessary to level a VM
> safely for migration.  Annotate the ARCH_CAPS CPUID bit as special.  Note:
> ARCH_CAPS is still max-only for now, so will not be inhereted by the default
> policies.
> 
> With this done, the special case for dom0 can be shrunk to just resampling the
> Host policy (as ARCH_CAPS isn't visible by default yet).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



