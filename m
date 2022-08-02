Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4720587F84
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 17:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379405.612839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIuCi-0000iA-Ub; Tue, 02 Aug 2022 15:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379405.612839; Tue, 02 Aug 2022 15:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIuCi-0000f4-QV; Tue, 02 Aug 2022 15:53:08 +0000
Received: by outflank-mailman (input) for mailman id 379405;
 Tue, 02 Aug 2022 15:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIuCh-0000ey-KX
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 15:53:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a2e950-127b-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 17:53:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3199.eurprd04.prod.outlook.com (2603:10a6:802:3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 15:53:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 15:53:04 +0000
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
X-Inumbo-ID: 32a2e950-127b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q334k+96pqNI1TSo2h8FvyCGSxJnA58+Hf4TlVUXNdA2Ym7uKpVbL4eYYx4Um8MXRxXb/1pRKQrhNzhmtpffYDu0IozVktzOjCIpYhKigS3x8BVNhZdrwBGWOReVGZ7vGVWbmwIm/RVbTsEhyyiEr7JjMn9mTDC8IirnCqTdSTSLi8M5a/eoyUxH7u5vRntYRwnN8oJfFEixdHjAccJM9GVU9zcoXOATuQtxXckLknWz6wtSOMMBT8h/b8WJa2zGXTXSriZl2RWXCt/YtyISuRytkskVvBBlu0xU1fM2QipOUhmHguXz1avBtHZIbOq+wd/GNvwWyTk9Xs8A8NdEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpSjyP0cqlxfdo4JoLuYFxdd7Tx7FMzsemLVikpq4a0=;
 b=mLsaL/hcVFjQJLo2jVH2h2Go2D3gfbcUoLQsuzVzTtJkp1sA7BWBqWXh6BZKnu7jCpHEuFo61l0hF60o7XkK8J9r160UqyiLVtw8NY6oc7wclnDsW4t2K54lJnji8k891dux3T/PrOXb6UiyHLAxPLU9SWR8rOvaLlkoeErGtCt08y5VA+/vUPNhK7RUcWvkWsoItVSIr5k+pUKiedLbiLegy6TgE/bPWGyvNmr2G60Sh+nO279fHxpdY8RTa5ISe2rwy48SF+FEs7cwLsTRnJxGx0cGR5xCgeval2RZTw1ZT7kBTdW4BWf8/0JkDQJzgcG2OLsCnlr/UOdXk0Bp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpSjyP0cqlxfdo4JoLuYFxdd7Tx7FMzsemLVikpq4a0=;
 b=kkecOa3sCdEHuKHOt//FUIaqpUbwL0oGBlCwMby8VJ/U6KoMva0f3kMiUIQ5sh5wKb8Bt/jKH9l02MIaXOwbCt1fdQjhAr6FSsniYSTKJmuY+5tJcUoypZOgwm5TOG9Ps1aUnuMMLoiabmaVAdM25G3lj9I+EH0ciRay5KxvOABg+qE0vwIynasyuHVx/JCxBWZLzAXyRxaZ13Qbqff66solmswc2SnnVTWuFnfo/uoRFFQHcxpn4P+picB4DZu/sYKhIOys3KaF0VZ41sKSvuIVWQDTXGZYPsfbcgo6zuknWzWJbFqFhICHa+1jT6OEIQkoQx5RCMyJObDkjRExGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaa074c2-350e-c526-b825-c2d45ff0fc48@suse.com>
Date: Tue, 2 Aug 2022 17:53:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Content-Language: en-US
To: Bruno <brunoce@kolabnow.com>
Cc: xen-devel@lists.xenproject.org
References: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
 <B8D2151F-D58B-4443-8171-48623AB77595@kolabnow.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <B8D2151F-D58B-4443-8171-48623AB77595@kolabnow.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb76505-2646-4a0e-8473-08da749f15f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lim+1pUSSAWkxvx8q3o/M5z8tdUnCfZCIIPcGkX+CDu+TE+15ErwdDBcFCNSHDRuVKIHfokW0xIjtEzNdy7DJj0Kyicvq3IFZXFoRNPUxpk9GVQkaKwmsU7I+04K0/MijFojT1E0cOPh3r1xzWCMxeb2wpaHRCvLCfOaDKMRbM04Bzs1jAE8CqHxufC8uMWZwZUSW6Ic/3jGOymTS1Vicy/6qOhtXk1+MErreDWsFY8eUVmaGfJBfgiG62fyd5gJ2olhGQdDtic6lkGhP/O/BDmpyszdJzgB5GILlC/BwVmOkK//cGr31po3y81ct88qVyHYcnewCD5/nrNsJ6mO5vnSgz8PEGw9r9TOnSdcVgP5BYK4TvBMg1yUqaxXPwp/D3l3ZHQTBB3GTzqPJvcxGulgxm7+Yw4osIa8eCDSS6C4+HXQHVznkI6quBY3Bek5efcSuGGR9Ds6dDVOO12gzJWhVOblzX6j1d2EraZoBvV+IzydRNE9P4nKUa2ILd8x+v0XhMerM/mCjMe52cKSudJFJsPDzRu64LP9tjhRGn1F03fZWrEy0pT98rmmsUYTv3Kpmxs7NwOSrCMvCvbByFaHswtfdHRClWw8zYfZQYJi+NgvQKJ3ae3R2wxOtLVbiILhW3VWy9RnAqcP0IFGAdNLCMX5u+hV5yecU4Iaq97bB7Ptz1ZALDRXCLSvT7D2rcvtYePxxQMTKupAwjviGVtt/WQ6f9oA45LtW4KrQmhHZuZpiD51saSkm5Ls442UEjX4Yv+qvdpdtOKaA/fmOAadjpXPMt7ilXHnr02dZ8jsoMsLBaIH1YmIcx87OdcGxJDok8/ZxJllUDhBaKRui2sO6rh/WNvM+XTBfkgLcDN6H6gXOFzyS8sUJ9sKQK0Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(136003)(346002)(39860400002)(66574015)(8676002)(5660300002)(66476007)(66946007)(86362001)(66556008)(4326008)(31696002)(2906002)(6916009)(38100700002)(478600001)(31686004)(8936002)(53546011)(6506007)(36756003)(83380400001)(966005)(41300700001)(6512007)(26005)(6486002)(316002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0pBd3MyYTVETmpVME9zbVBKYWtZSHJyUWJaemJoNk5ldXF5a2swOWZXMjlv?=
 =?utf-8?B?QUkwZkhCV0U4VnZKOGlMVkdMQVdwd1NXSkNUZGZSeHlzLzNuVGs3eW52aUpR?=
 =?utf-8?B?VUp2dUorWUx6dWpEeEZpcXhwZlNxT1VwUmRvcTlUMFVQSkd6a01IVmhJajV5?=
 =?utf-8?B?Ym8vbGY2ZUhEWU5CMlpNcXpja05kbks5Ly9MK01oVUlGUmEzMjkvYjVYNkll?=
 =?utf-8?B?aWJsT0pMTTRpUUxqQ3hIN0tWNFY5Ym9hbkRQWTBablFodVkrcG9lU3hFMThY?=
 =?utf-8?B?S0RrT2VSdUNmUExxTUpBVTYwUnBPTVpNZXpmaHN6aExCbjhkdHRWUTZMYVo3?=
 =?utf-8?B?UE9TQWJRZ0hPQjU0RnZLdE45M3NDZGR3em5ranEyNkdqRFg3RmxlMFU5Q2lt?=
 =?utf-8?B?eWdRSWJ1S2hxL1hYdWE3ZHIzRU1PMmcyVU9zK0lYZk5KRXpIQzhYQTRIaEMz?=
 =?utf-8?B?NGNqWjBwSitjWlB0S0ZmcWQ5eGJ4UVRKd1pFUE1EWjVtNWQxekxFazZLYVht?=
 =?utf-8?B?bWtsL1h0RGYxWWJLMU9wUVhiRjhKU3gwdzB0TWNiaE40bnk5Yk9kZk8wY1Vz?=
 =?utf-8?B?anBieExVcVpHeXZIdnZRbXVrQ2JCTkR5VjFpd212M3pmaGRyM2VlUVZiamhO?=
 =?utf-8?B?Vm9ta1UvdFBVTWRpTHFFYzE4Z25rN2JzVXIrZUdWWkFiejloTDlqWm1lcjl6?=
 =?utf-8?B?dWp1b3BOYWtRK25maG5BakdvbnR1RElrVXh2UWpVQkNtOVZoL3ZiU29HKzhy?=
 =?utf-8?B?ZmNQaFBaY3E4MG1YUGM2S01aRUp0ZlZzV05IQkN2dHk3QVJXUDZ0WVdqMGlt?=
 =?utf-8?B?Q0I5SERlWldPeUFucjNreE41SG9KM2h4N1FhTitndDB6WFpVaEVnVzFja1cy?=
 =?utf-8?B?ZkRDL0l6S25yVnYzd09FME5pZVBvWlB0eVNFSE54L0VSdlFFQ2xyLzE3bjFN?=
 =?utf-8?B?QjNkWENXRzRpc3ZFdDVnVEFDRVJQblJNOHlQcHVEdUJMSEFrUm80Mk9zV2ZP?=
 =?utf-8?B?MktYdDJPd1pWbTYwWjk2dDVDSjU1eENkbldZd2NWemsxQktwNVFqVUhtMTN5?=
 =?utf-8?B?ZWxGQ2xwdEFTWlpobDc5L2haVEwvaEZTcjZuc0tnRXpQbE5tOFR4YjVBci94?=
 =?utf-8?B?ck5VYnRUdVhwKzZsanduMmdYcmxVUHJrSUpodjVuYkZ5Mk5TOWxCdTltV0Nt?=
 =?utf-8?B?aHZTK1VLWVJ3WGQ5akhrY3V1dmpodUVROGlQWjdtdzJaWkxMNytPa3lJaGRW?=
 =?utf-8?B?WE54Mi9pY253bGlVWFl6QWRWYXB6SmNsNDhOUElpeFpiZHdXcUwrWjRlb2E2?=
 =?utf-8?B?UWhPdmRpSWVhL25kcTJSVFZLM3lwYXB0RWJGdXFOVEQ4WFZxa3BWcU1XYWpz?=
 =?utf-8?B?K3A4d091QmoxR1ZQdW14UmhMdjRseThmSDUzRUN1cnFyQ0hTTzBBY3lGVnJ0?=
 =?utf-8?B?ZnI2Um9FSUdHNFNLSGJBYnEyTEFCaG5hbTYvQVE3K2g5Y0hXL2NINjNhb3hE?=
 =?utf-8?B?SDhJdkJ4b2o3VzhDb0hNQzlLcGNIVE94Vm50Ym1XQW9FbHl6TkYrY0QrbzBR?=
 =?utf-8?B?cHFTTnFoOXp6OHZSbUlaMnByQkVyRXJSeWRSL0I2MVllMUJKN2JDMnB6SWcy?=
 =?utf-8?B?WDNyQ1BmZ3c5RDk0U0JoZ2FOc0VTamNBL3hWWUpUSFVPK08vY0l3dTBiK25u?=
 =?utf-8?B?VkZUR1JycWVWbGlOVm9WL3Nld3YzUjdjQk4xZnp3aERUeGJiWUFvZTI0eGpL?=
 =?utf-8?B?ZmpXeTdOQW9tRGxIb09lSmdXMW1HQTE1V3l5ZzdKRjZqaU03YXhNRWNudzZB?=
 =?utf-8?B?MzBJTFZJbVllRldlcktuR0g1ZTdDbDRZSXNnN0RURWw4eGZUNE8vMU1aWUJX?=
 =?utf-8?B?VThENWpnMWc4OE1DY1luOVMrMGhXdHJTSEJ3ZmNjd0ZWVC9rNytyS0czOEpo?=
 =?utf-8?B?SEpSUFZVRzV5eGlHTXJBSFREQmxOdjNjQ0l0ZWgrWHhxd3BTT3FLRE5TVGlz?=
 =?utf-8?B?ZlVCNWJxWDh3NHRzS0xScmRaeVZVMkJaSzd1cktLMSthT2dGL2NiY0NxVENk?=
 =?utf-8?B?NDhkZE5jS1dFeUtTRWo1N25MTFZpVFZqMGIvTlRwTjdmL1ZPNVkzS3hYc2NT?=
 =?utf-8?Q?PWEDU6lqmo8HsFMntuxbQwUhT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb76505-2646-4a0e-8473-08da749f15f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:53:04.4892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZABU/jmoT4sQj37xhtA6kXWhIdrOsIu4HjCI1iyeTdgzYh7Odr6nqhpQum8OQKxaqNNw41cqzoffB/DUzncF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3199

On 02.08.2022 17:40, Bruno wrote:
> I’m talking about booting on the host Xen (“Linux with Xen”) - goes to an initramfs prompt.
> 
> I don’t know how to get to this hypervisor log. Maybe not the case as I am attempting the boot on the host linux with Xen. There is no /var/log - only cache and lock

Generally the hypervisor log is obtained via "xl dmesg" (likely not an
option for you when you end up on an initramfs prompt) or a serial
cable. How do you obtain the kernel log (there was one posted on
xen-users)?

> I can list the hard drive partitions under /dev (nvme0n1p1-5), but I cannot mount them. I cannot access a thumb drive either /dev/block, when mounted has two strange symlinks to ../sda1 (8:0 and 1:8). This is a bit frustrating because it does not allow me to export dmesg or other info.
> 
> Im not receiving the error messages on screen before initramfs, they are hidden, but I do get this message:
> 
>     Gave up waiting for suspend/resume device
>      Gave up waiting for root file system device.  Common problems:
> Boot args (cat /proc/cmdline) - Check rootdelay= (did the system wait long enough?)
> Missing modules (cat /proc/modules; ls /dev)
> ALERT! UUID=0123abc does not exist. Dropping to a shell!
> 
> On the dmesg, I got the ACPI errors:
> 
> ACPI BIOS Error
> (bug): Failure creating named ob
> I_SB.PCOO.XHCI.RHUB.HS05._UPC], AE ALREADY _EXISTS (Z0211217/dsuloadZ-326)
> ACPI Error: AE_ALREADY EXISTS, During name
> slookun/catalog
> -9451181 ACPI: Skipping parse of AML opcode: OpcodeNane unavailable
> (20211217/psobject-z20)
> (0x0014)
> 
> Repeated several times
> 
> ACPI: Skipping parse of AML opcode: DpcodeNane unavailable (0x0014)

Right - I've seen those. These were why I did ask for a pair of kernel logs
(with and without Xen), to put them side by side and see which of the errors
are common (and hence likely of no interest to resolve your issue).

> Latter on the dmesg I got repeated errors like this:
> 
> RIP: 0033:0x7 969a2e2äc9
> RSP: 002b:00007ffaff421a28 FLAGS: 00000246 RIG RAX: 0000000000000139
> RAX: Efffffffffffffda RBX: 00005582Bb061d10 RCX: 00007 969aZeZäc9
> 244.4412241 RDX:000000000RSI: 000071969a49bfOd RDI: 00000000000000
> RB: 0000000000020000 ROB: 0000000000000000 R09: 000055828b04c290
> R10: 000000000000000c R11: 0000000000000246 R12: 00007f969a49bf®d
> R13: 000000GBOOOOOOOO R14: 000055B28b060aZO R15: 00005582Bb06110
> 
> (/TASK>
> INFO: task systemd-udevd: 190 blocked for more than 120 seconds.

Besides some of the characters looking scrambled, I can spot nothing like
this in
https://lists.xenproject.org/archives/html/xen-users/2022-07/msg00057.html

Anyway, my request stands: Please post the three named logs here.

Jan

