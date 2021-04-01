Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282A3512B7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104254.199186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtyc-00066e-AV; Thu, 01 Apr 2021 09:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104254.199186; Thu, 01 Apr 2021 09:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtyc-00066F-6u; Thu, 01 Apr 2021 09:50:58 +0000
Received: by outflank-mailman (input) for mailman id 104254;
 Thu, 01 Apr 2021 09:50:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRtyZ-00066A-VM
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:50:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33041b3f-6611-48bd-8cfd-77b002683ab6;
 Thu, 01 Apr 2021 09:50:54 +0000 (UTC)
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
X-Inumbo-ID: 33041b3f-6611-48bd-8cfd-77b002683ab6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617270654;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GLBfyHpN38hVaa44ERXEym7AISBLwU7MwNIppvSFeNs=;
  b=Xoz6NRpq8SIwnRwCPbBSVePt9NtNwFgRYOP92koxZQ+3XrquF8/npFDz
   jAUfrK7qTjrhSSziVHT1ir7WLdoHtWTOt+SIrTmOzYQ67UgEx2HOXYPU8
   xYF1AEnDh1xi9zfbQjVFcrjfCuZ+NyVZ+DPjy7KeiIEYS+ppariChKnR7
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Abfrjz3cXdMX1fnzbRU4GUuJebJ3HGdEd+dP9pxL33nMgW4880sgBtAOhvghAr2he+MUEaBQAP
 gOEezJt9x3PNmk91nhzr8XTzM5HlWNpOC5NbYNZsmHg4UsVmscBOR9jCVPj+sUGKzZ7VQwXIhj
 6HraLTV/maObd+S2W7UWFC22vpHXtr88qOZCy4Yz3YR6R1NB1uj/3Fs62p1S982lKJOlDM/RW3
 7UXmKKm2Y12qQpql8FzDtgd/QxjRg5H9YqZ8bZzPgihJQ05vCLTAzgvqcFC//+JVix4kNI1ja4
 k50=
X-SBRS: 5.2
X-MesageID: 42127952
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jWblPKDxeIg985/lHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="42127952"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKm2IHCG+C/ERQ6eTcA4Ls4K80FVxXZk1Gha6HPjUHD+znQ7o2YG2gpnwkqnnphzgN76K92Os85tQUi1hsfMg1XyEuHkqpMzVYGdpn8xhZZIgE9ViOo4kaCEGLwi9/UtAWDQIEZEAoSgUKbxgW7cXnvUeKmijg9s4DXVHI78uk+LZJJaDvGOse2XkZUhzV+t6kegE9dnZPGhIVUy6BvshWJt7VDtKRNTyrrLy2q1NwjWctCywef09I2GhGMZJHH7HafeFNBmXjgNbOtUwtak1/zSE3PNxpmvygOzglx9J5az49EwlQ9evFasYG6LTNtBw80Kj5hTC5FRPDORjdLj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXDgp5zLeEO6xJnCs7W1qeqPsJCujqLjiz1imtJdVcM=;
 b=R6w9HnhXrGFVGc3cUk7O6+31G4jvM1P0hdahG3KpZRtPp8pELSW/qoMH7MhOMbiZV3iNv8PVjk9xGrUg549R91e72ho7H11d8QKEVdD9qd22JO3i8cBG3GrTJYrna1Q8uBcOJvAufDLF+sP/WgxdvAf9TSUNkmJVC9IE147lE+3H2dILj7kfrW2uM63/Zd9NdtINFujaFqHmYS1Inc9C9/aKeJhLrFV2WHici0j4HpBOG0qwLEDt1Vtgoy0REB8PP2QAzBB/byPepn5F5sqmGAUJZYT86YsO9BNdHO71/dEVIRNbiGwM2/+Se/7IgerOlzkD/NBgYAEnqTXEN5W2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXDgp5zLeEO6xJnCs7W1qeqPsJCujqLjiz1imtJdVcM=;
 b=MjNcclqKzkW7XFpCmoxKWEiobqpB1ZjlGR/GrXYa7jrqCXCvsGp+croPKImtg1LafWmIzElv0+9XbAHJmtCDXIxilc0L2Jj+RyODVe3bdfRWwdYDwx0Vmbb7ZY6SzM6PjUQarMvtwBMzHwwogXP4bZLqrghdEobHwCIdBYo1Hwk=
Date: Thu, 1 Apr 2021 11:50:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>
Subject: Re: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix
 for_each_cpu() again for NR_CPUS=1)
Message-ID: <YGWXcFOLKHJnH39S@Air-de-Roger>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
 <YGWLxey5nZeafUbB@Air-de-Roger>
 <59387a2d-e28d-4e12-6b91-5df464e8ab9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59387a2d-e28d-4e12-6b91-5df464e8ab9a@suse.com>
X-ClientProxiedBy: MR2P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0a8680f-1ca2-44d2-1a8d-08d8f4f39f91
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB405941808A9ADB5BC09B85DE8F7B9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iaRul7NL4gdfzmp10NqgcWIMtFW+x0FOiDCaiSDsz+UX7oM2zZtVQUhhbH1t0m5YNxnrA6GeV9Q0jYFTUQ+VTV+2k5/rQtcxLwJ4XZuL1XNcDPn3nagTg/hDmB7NrlzkQLtd9LJan0g5bjz4cYDcJxQoNFvGwpB1De2aGLEkjj6rCBwZqEIJXRxOg53Z5HbZHE19m01xBV3uzvhCqVCWQJTykfbmfC+sBS0Og+CnhH3Yp/qjeSoB3+UkhoDRQc1ZUO0N6Ua92BXg3JzZ6NjbDDy/tbqcsjKVZTCLNoI1nhX/qYdjSk3M9GcZis31sDimegPg4LyTX1A87qSHt4obYEOOKSRFSPzFKpfm+yoQxNv0WR3O3opleXp8x3DGtw09bnFojv9NkJwu+60CNpcPq76El5ARrQoGdHY209ndiJnvHn/NLX+8twvgA7kccVZfMUJ4QxEaIVmK8mJiIU+hxtAA3iKmkjr6dhqZhs2mQh0N1HwBEJz2Q3Tj3gsg3haUjW08wD7HgPuMnXL2rROJgDClP6ojWB35SZZ3EF5QEeAK3QswUBq+dQbDHx33JXuYf9qhK0FwP7kp+f1QDiI8RLDUEI5pJq73byctRAYexVmVlL5rJo3/gbX2/WfRfbzk+/z9bUI6FI/R4NdgmrAhYTMVRsdKFPJkyLisWTizyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(396003)(39850400004)(136003)(85182001)(6496006)(26005)(9686003)(956004)(66476007)(86362001)(53546011)(66556008)(66946007)(6916009)(6666004)(54906003)(4326008)(16526019)(186003)(33716001)(5660300002)(6486002)(8936002)(8676002)(478600001)(38100700001)(83380400001)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YU9kVWJLdDJiYkFjMEVBWEJROWZFdk91YU5lajYxL0VrdFVxcjZYSzZzQ1k2?=
 =?utf-8?B?NGNSYTE0bHNwemhZVUpTaTYwVFlXRWdHWmhuRnBnSE1PMHdUMGVnY3ZjUzIy?=
 =?utf-8?B?OUhLWjN3VkJlMG8zU3JGYmg0TTR2TXByN25oVnlZSkk1dE0yREVRS0FwbFU3?=
 =?utf-8?B?bHBFMThCQkw0WktEQ3c3TXBuN1BFSHdDOGhzQ2tEVDBKWjEzNWV5bTM0bDY5?=
 =?utf-8?B?YmI4VHE2YzRhcTFNS00zdDRybVlQUHI5UktJQ3Ztc0xXRTlIYk9vTkdmdkQ1?=
 =?utf-8?B?cnIwbmI1cnZlcEJlMTdpTzJZemd1SjkwaWJNZjEvOEI5N2FGOGNtNVJJVVcx?=
 =?utf-8?B?dmxYM1UraWdBVGhLVU9IY1JjU21LaVRxRVA0b1R6blFpS2lUWktkTkpOUDVh?=
 =?utf-8?B?ZWoydWFEeExOS0gxdFhrZXdjdnZLRktZRllJYlJYa2hpVzJzZHBnS2RId0NV?=
 =?utf-8?B?MFVDWnY1ZjJKcTk5QXhzVVdkYlppMS94K3NzeGpZZmZGc3JNVTZOVUpZRTRF?=
 =?utf-8?B?ZXRacjZxNjJHZHQzOVpCbmRhMENFOWRqT2Rna1F4VmxycmVlNjhmK3gvWW1J?=
 =?utf-8?B?Z1pPYUdwekdHNDVMZkxkWHVFK01hOFVMSzZSWnB0N0srTFB4bWpUaTJ3bitU?=
 =?utf-8?B?cnU5ZVVnR1VqLytFL2hSV08vcEp1Y1RiSGNkOURPQkk0NUJkWHpCalc3Wml2?=
 =?utf-8?B?dVFvcGQ3aGQ5enQ5V1VPM1NBN0pwaHd4ZUtWbU13a1pNc1U5QmQzMWxZMTFo?=
 =?utf-8?B?OGRKYTUxY1dTdVRXRTdRWStxZnBLK1JkWGlJTDNpV3hqTFlEZXhNOGQ3RXdt?=
 =?utf-8?B?N2s5Z09FdGgyRzlpNjRncVdzVDNDaGY0ZmNVV2JzTWFIUmxTeHVKZGQyR3dW?=
 =?utf-8?B?VWJqVmhVOU42WUd1RlVFZWxhandJQTI3dm1YQlNLcE1zbDJDMUw4WjFGWWxj?=
 =?utf-8?B?aWNNWUs0OWhFa1F4NlRpT3dZQ3RqdzhCTjdyNlZZa3pHVHBPUVljUVhzWVZO?=
 =?utf-8?B?K2lwbEVMeEpTZ2RLUFBkSFBoYWNkK2MwaUw1R3FFOU1hTjd4QlVZZDMwZE8v?=
 =?utf-8?B?eUxsQXdPWkkrWlNza294b1lSYmlQTklZVXE4OGxUZ1I1bWNMMUd3UWpnSlhG?=
 =?utf-8?B?VndTU29OWFFKNW5EN3daZGU0OUQrUGFqaG9zL3FxTXdKV3dzVTBUL1JZMWRN?=
 =?utf-8?B?TWtWOFZBZnc4R1lqb29DbW41VXFRSGtFeitzK2hndUlpUlladm03aDZEa0hp?=
 =?utf-8?B?RzQ3Nys5NityT29qVTFsQVNxcUg2SFZuYVZxRzJDNm5SN3Zoa1liME1LWVB3?=
 =?utf-8?B?ZndBN0tTR3JjUENqd0ZwRE5sQUVkMjhFcWNzT29QU2NxSTNnY1I2bG5vUDZr?=
 =?utf-8?B?QmpjbkJkelRwNFF1R3VqcndyVWV2Tjhhd2RtUWtCWlZSbytMZ0NiU2VTTkxq?=
 =?utf-8?B?alhDNW95eTBuQVIwTzdRODdtWnR1RC8xTldzU2lNc1Y2TzZHbC94ZG9qdmY2?=
 =?utf-8?B?YndqbDFZRjY5eUlrL0cyTkpaMWNjK2dnTVV1Ym5oN0pucTFCQk8yMytKclZ3?=
 =?utf-8?B?ampwblk0dDRNRVdnQlA5OW83SzNkL1pDSlhwTlNUcXI5aWFUUlB1R3l6WS8v?=
 =?utf-8?B?Y2xxS1ZyZkh2ZDExM09iMmVxS0U4bUh0UjlSSkgzTlFKa05EUm9IUUxJSk01?=
 =?utf-8?B?d0h5K1FHdmhsMnpUNjNGVEY2cm5sbTc0RElKUTJWQS9JR3djVW5IMkdnVSth?=
 =?utf-8?B?MlNQZzFKYTJEaGZlSitFQVl4d21SQVVudU03aDVJL2lFd3hTaEZTeG8wRDNU?=
 =?utf-8?B?YzFUMU1KQWUwRmQxUlR3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a8680f-1ca2-44d2-1a8d-08d8f4f39f91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 09:50:46.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsAQ0voMslsi3NFsfoHXdcxsmhGxhVDiEknUbp7ZQb18ljDovJjeA/gO0K3MN0a2XIBhRJIILGZKFD2UenlL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:26:03AM +0200, Jan Beulich wrote:
> On 01.04.2021 11:00, Roger Pau Monné wrote:
> > On Wed, Mar 31, 2021 at 04:52:47PM +0200, Jan Beulich wrote:
> >> Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=1") has
> >> caused quite a bit of fallout with gcc10, e.g. (there are at least two
> >> more similar ones, and I didn't bother trying to find them all):
> >>
> >> In file included from .../xen/include/xen/config.h:13,
> >>                  from <command-line>:
> >> core_parking.c: In function ‘core_parking_power’:
> >> .../xen/include/asm/percpu.h:12:51: error: array subscript 1 is above array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds]
> >>    12 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
> >> .../xen/include/xen/compiler.h:141:29: note: in definition of macro ‘RELOC_HIDE’
> >>   141 |     (typeof(ptr)) (__ptr + (off)); })
> >>       |                             ^~~
> >> core_parking.c:133:39: note: in expansion of macro ‘per_cpu’
> >>   133 |             core_tmp = cpumask_weight(per_cpu(cpu_core_mask, cpu));
> >>       |                                       ^~~~~~~
> >> In file included from .../xen/include/xen/percpu.h:4,
> >>                  from .../xen/include/asm/msr.h:7,
> >>                  from .../xen/include/asm/time.h:5,
> >>                  from .../xen/include/xen/time.h:76,
> >>                  from .../xen/include/xen/spinlock.h:4,
> >>                  from .../xen/include/xen/cpu.h:5,
> >>                  from core_parking.c:19:
> >> .../xen/include/asm/percpu.h:6:22: note: while referencing ‘__per_cpu_offset’
> >>     6 | extern unsigned long __per_cpu_offset[NR_CPUS];
> >>       |                      ^~~~~~~~~~~~~~~~
> > 
> > At this point, should be consider reverting the original fix from the
> > 4.15 branch, so that we don't release something that's build broken
> > with gcc 10?
> 
> Well, I didn't propose reverting (or taking this fix) because I think
> build breakage is better than runtime breakage. But in the end, Ian,
> it's up to you.

Oh, right, sorry. The build issue only happens with NR_CPUS=1, in
which case I agree, there's no need to do anything in 4.15 IMO.

Sorry for bothering.

Roger.

