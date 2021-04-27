Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2136CB61
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118861.225171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbStD-00083u-Gt; Tue, 27 Apr 2021 18:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118861.225171; Tue, 27 Apr 2021 18:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbStD-00083V-DY; Tue, 27 Apr 2021 18:56:55 +0000
Received: by outflank-mailman (input) for mailman id 118861;
 Tue, 27 Apr 2021 18:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbStB-00083O-L9
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:56:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5426bc5-cf69-4c9f-81f6-07dac1f9d463;
 Tue, 27 Apr 2021 18:56:52 +0000 (UTC)
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
X-Inumbo-ID: a5426bc5-cf69-4c9f-81f6-07dac1f9d463
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619549812;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u05wjO5t5p/1YzwMkHEjmTBXoni8xkmWqYG69Y9UsjQ=;
  b=TXTnkPTYzO93wjPYCkhdqeRH5aZ7mwxlvZP+TMRNKJpgZbVPWQh3VQJ/
   g8lDJUX7JKI9PpLGrnSgAPTDcW2dEY6EWvvNdvuPuWdLk3doTIp2FvwBH
   y7p8FG37vW+xO5NZS/igD7kWdDN/fl0VkEcBD31KzYaT6heMVCevsxrm4
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G0O1+TQPNxZGkCgtgvJ6Jdv6MwwqAfGoT5W2QV8vHAtPieTm+4j0jeGRxBe/1J7NiZJKD3zDEN
 S044cfxk2Ibc6Ljv+uUlK4EsuXRBZTOwflID6uq02eBuYN9vZkJ9x+TBX3MjS7vsUKsgNiuc58
 TQ3rMPYKmJlaY9ElTyaKBS/xcKy14dkY/ZnPf8Er0zuAdxW4teELgDVZo4CipbvL/Ljvu7lzWB
 s63wvBbomJ2H81wTPT/6Uq8YGFt+HVwScWRzEJshzh+cD0MaWp8WtlUDknhnHhdMdIDTRAzTMu
 GNY=
X-SBRS: 5.1
X-MesageID: 42662134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WuP1iqHjiM7m7OA9pLqFR5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0B0fuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYZ
 BTJfzbjcwmFG+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fl66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9dDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCH1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Ym31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EZXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EMTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03CtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xu/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd8BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfB7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q/6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXEEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0zfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpLKS6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 pHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+SXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn4doXH5mQ/k1Vf5jl7llninqieiV2rbH1uAEn+mZVZXT5aL36Sq9
 /KmNLoj0jA3A==
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="42662134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhoNKBm7CJlQZT5mKI9tNzaW9ZcX0Q8uP6CIIZUYbcTUNf0DRXa2kVUEzwayOALw0BWFBHSfuUUwzAaGfwEXs7rsTaACYMjl3LBsyYc3A0qX4wkWXec9Gs2GvlcL0AA2OlYd2W2a/TP8JZlmjXiSm5sBE1UL2K5D7VMEVpR//FyqjcnjMmAikvbzMkchYQQFkdx30cLoQwmT/kv5ywiq8A7rk103hdLlUrx0bCF/ZVpuISgHDolK4kjqTKLELgQl4wcwXCbppE/ZhDaeBvwljsruwtBbnWNowPdPzE6IR11kPdSdydZDEHBtoxePsE51mc78FcLygmhc9YDZbXfRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNba0iWHx+8tnNGEoXRZkYz9+FAmFBLwR09IWBw4wGs=;
 b=BELf1WkwlPEdBrTVjbew9Xi7xqBye59Exwp3oiiGqz0MLWX5FJSt1OzXJj6sZKEv7cGmMalzBbyktPJT5t/cnUvFE4vIF48aXsl9yaZu/V9qavr1nejsCXx1JwgTE7NocfEkjBFxr5pu/cX91jWFcVSnvokXWDSKM4ieM6ITwUITJzOmLn2WJDivVBeiqcZWilTyaZ8Q5yqduWudOA7s3uE3q52MOzxjsIhPx3cLtn4JZ1sWc7bw8M+gJqbOiockBL4n4hGiaPBzJ0zqBu5dDAi9DSbIYgCKydJ0wqr8vnYdf6YqyxnjaRcg/6mZAfQlDm8aq3NQf5TscOakkRpZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNba0iWHx+8tnNGEoXRZkYz9+FAmFBLwR09IWBw4wGs=;
 b=ep16otc+qhKRxJKZA/MOPPTcfyOJkz/a7EWtGY/a6a0j/OmjZdeNKG/6MPxEJO+io1tpvnztIZd8bY4PE3meL15Cb5+K4kZm01VE1Lc4QP+LzJ48YBE/ZODnbIR0DvkYLAy/YHQBCWKXMMAS6FWbE+ijfFQUryCUNjy2Ia7Wcx8=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426124535.23814-1-andrew.cooper3@citrix.com>
 <f11189be-7ce7-ed54-a078-541eb3513eba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/emul: Use existing X86_EXC_* constants
Message-ID: <8c23d63a-e93f-6d2d-aaff-c816503f73e2@citrix.com>
Date: Tue, 27 Apr 2021 19:56:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f11189be-7ce7-ed54-a078-541eb3513eba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd13e7b-24c2-44b8-dfb5-08d909ae35c3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3735FDB33BEAAF54D78452ACBA419@BYAPR03MB3735.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgAQsJvfoJumPCroDOzN4HhbujIm5HyTqtD3DbzE16WA/Rb+dJDNhE5Lyo2zUk0DA+mgDmlqn7/gqNbCxT8rK3zk9QmAD5RLC0xVNZatSUSRw3aHHO24ocEyzM1VbCPI+hPqoq2mUmVCoFcjcvdznnjZ3/Bq9qnRzpx3izrZAxT55DcHm1G9SADhqmZgIIH/QQaYD7Hr2g1oPUmFVAmN8qDewIN2Alg+nr0pbPoUTrWF3GUhTX8q8XY1rBHI/RFP6sHm3VaQONnZBYW/Y0AukIeBQGpm7LXWLI1XCfustYRkOen12+Qhp6joYMTg6HnK/e9JHZZym1q+H5Qo9SB3Fk04Sll/NRAjZxZnGTpzRf8VIeU5MRrgFrq8IMDSM4eP05CxFdomhM1NgDWlMnZVvJLsdETrH3cQjks3GZ0+PVexyImMBhZuVkUBlcZyO5Q8H2prnreGSUwEfNj/rqxYgW6DiuPf9Q3l+raabDXsqZSBaa2Cm6gbc20/Ro9ezpLW/CHMgEXy2myrod01sFWGu6AtfEYTPgeJ6ah03rB0z7ew4hGEMQR5atX+vf0Um3PspzjUSC1iRXcFfIAzSIQYSP8qzsdQcKAMUXyam4iKhzWUaF56UQjdUoEFv3zaiKf6j6Gsd+R3wDAFSQTxwKi44sXNJNV4GqG7O3NWC052wMdSkSJjrQ6Uu5iQoUEf1/Gq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(66556008)(66476007)(31686004)(66946007)(186003)(2616005)(6486002)(956004)(16526019)(54906003)(26005)(316002)(6666004)(36756003)(16576012)(5660300002)(53546011)(478600001)(8936002)(38100700002)(83380400001)(8676002)(6916009)(31696002)(2906002)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmFaU0NDdTRtOEpDRzBFQmI1eTY1bmtyNDVRTG0reFgweDBONks3TlJSMGtI?=
 =?utf-8?B?MVNPN2wzRU1taXA3QmlTSEFSNWlZQ1dNR01rNGVGNjNlRENiam9lTFh4V05h?=
 =?utf-8?B?eUg5OEFkMUxwWWxjMVJQdnYxblh4VHlPRERIWEFNcEJ0b0luelFyL2dzYzMx?=
 =?utf-8?B?RjlrU1FMN2ZNVy9ZTStMMkhXQUI5dzV3ZFd0Q0ZaVm9GWElSblZXbjZzWFN5?=
 =?utf-8?B?d2JTd25BbmNrVFRwQ3JyZTJONFQ4Sm1vaEluMUh3dE1QOU1IMTF5bkE5alA0?=
 =?utf-8?B?eFQzYTRsSGRaS0N0OGJQRkIwS2o0dUFmby9yUDcwN1g3TWNIRGFLOTBJSWs3?=
 =?utf-8?B?RUZ6S0ZCMWtCckExR29XblY2a3ZpS1M1TWZLZzdrVmx1QmlzeUlXR1R4S2tL?=
 =?utf-8?B?cVJZNjhiMDhaSi9VTElMcXdHYWtPZVFKTGJCV0pkWVpZMzR0aHVjTHV3T05x?=
 =?utf-8?B?aXY5cDFjb3h1SHNHb29sdGpSVWR5Zyt1WkVKaE81bTRwZ0FaMHRqSUtzR05n?=
 =?utf-8?B?d0puSXFCN0V3ZjBVbkZ1OVFIWExUaXhaNjFzQjRuT3FZR3hsdElJdW9ialNl?=
 =?utf-8?B?Qks1N3pORHg4WjZEcDNjWjZSamFZVXQ4YjBuWVNiWi9wdmVrTGJPMHFoV25Z?=
 =?utf-8?B?SmFhcFg3cWRYbWpydGxWODdWdzJYNWw4ZmRLaTVibk5WbmxrZkxQNzVpcXRV?=
 =?utf-8?B?QndTcWNHckJDNHUrVklhQXp4c2llb3E4VjVTT1ViK0hPRDAxZm1CMVNqaThv?=
 =?utf-8?B?R3FjMzY1L3JWYXhld0NNeXVoVnljNW55Q1lINWtQTERpdjhueVhlSkFsdWVN?=
 =?utf-8?B?bmxmekhUanFHdGZIcXFjU1k3QW16aHlMUzh2L2djeWN0YVE1aUJOdDlXL2Fl?=
 =?utf-8?B?VUFBWmhteXFnZUtQencxLzJlUS9iTnh2R0prUCtRQVZra2FVVjJLZUZpNGk5?=
 =?utf-8?B?NUNLVVV4aUxsRHVUNlMzb0t2clRIRmpDdmVsMEpwQmgwUHdlRlZvQUdqVmJ3?=
 =?utf-8?B?WHNOMVFTNlRMMnpEU3k5Y042b2N5eElaV0tnVVI2UzByeE44a1pqMTJMVGZh?=
 =?utf-8?B?NHBiekZQZzNBc2hONTFkQjVJVW9BYU1NdVJlbXU3WFh6Q3VSMmRQRm5rcU1F?=
 =?utf-8?B?cnNKMmFPUkY4N3pyNzEzZnpqZWIwWEwwRDJYa25xTVdsL1U1Q2tWbGpwbWt4?=
 =?utf-8?B?MTQrRzQ2dlN0dUtXOWxrYWxIbTAvSHk5QXlYQUM0U0dXNlR3cUFtRlNEM3Fw?=
 =?utf-8?B?NjZTYzFVL1djUmZ4OXJTQ2NSUVBVTkhGTGNrZGNmdnlvVFoyZ1FuWURDVlpD?=
 =?utf-8?B?cUY5bDdwQWhoZUVmV1plSk41clhiRHF2VXdITldtbnZXd2Zjb2ppMEh0L2dW?=
 =?utf-8?B?dEVQYnhnMnlDeTVwM1BiVllyMko5Q2w2RGJySHgxNjNDS0xRNjZnajdINXhB?=
 =?utf-8?B?bVZxaGg5UVcvWkRnNFd3dGJBZ0ZSQnlTTGY0T0VFZFBQOXR6a1ZxWjNPWG5v?=
 =?utf-8?B?ZjRkMk5ubFozaTNkU2pDL0Nmd3I0Nit6d1RpYzlkbThqc2lWVXN0aXN3TGRI?=
 =?utf-8?B?OWRtUkg0WE9PRGIxZTJpRWszYkhXUTB6NUVrUG13amNoNERXSVg3d2d6TjNJ?=
 =?utf-8?B?cUNIY1I0QzBHTFd5QVZJRXRFcmhwMmtNdmdFN0V6VlJFS1FiR1R0anFIMUhB?=
 =?utf-8?B?NHFCZFU3bWZxWU04MEVIQ0F1K1VsRjVzcGU0ZXRWaGZwbFg0c3NWUHJXYmdm?=
 =?utf-8?Q?Zxt16VhbC2fxrRtc4Jlqt30PYyOdR/Pr76eSxWe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd13e7b-24c2-44b8-dfb5-08d909ae35c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 18:56:48.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlJlmv3NhoO+prqXeEQoyqkc2O+sRtok41payjxWTeJrfiCiI05PhUV1YLsnloeeiRAv08R2akGv94Gu6bk9RmOoHXbKZKe4SXSvWzdPAxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3735
X-OriginatorOrg: citrix.com

On 27/04/2021 08:09, Jan Beulich wrote:
> On 26.04.2021 14:45, Andrew Cooper wrote:
>> ... rather than having separate definitions locally.  EXC_HAS_EC in part=
icular
>> is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.
>>
>> Also switch a raw 14 for X86_EXC_PF in x86_emul_pagefault().
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/x86_emulate/x86_emulate.c | 739 ++++++++++++++++----------=
-------
>>  xen/arch/x86/x86_emulate/x86_emulate.h |   4 +-
>>  2 files changed, 361 insertions(+), 382 deletions(-)
> This is a lot of code churn (almost all some slight growth) for this
> kind of a change.

Interestingly, no lines needed re-wrapping as a consequence.

[Answering out of order]

>  The other option,
> not reducing churn but reducing rather than increasing code volume (and
> hence imo helping readability), would be to have shorthands for at
> least some frequently raised exceptions like #UD and #GP - e.g.
> generate_ud_if(). Thougths?

#UD and #GP[0] are the overwhelming majority of cases.=C2=A0=C2=A0 If you w=
ant to
reduce code volume further, I've always found the "generate" on the
front rather gratuitous.=C2=A0 "raise" is a more common expression to use
with exceptions.

>  I'm not opposed, but I'd like to explore alternatives
> first. I know you often dislike token concatenation in macros, which
> would be my first suggestion to get churn down here.

Outside of a few specific cases, yes, but as you can see in XTF,
exception handling is one area where IMO clarity can be improved with
certain limited macro magic.

In the emulator, I could get behind a single #define RAISE() along the
lines of:

#define RAISE(e, ...)
do {
=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(((X86_EXC_HAS_EC & (1u=C2=A0 << X86_EXC_##e=
)) !=3D
__count_args(__VA_ARGS__));
=C2=A0=C2=A0=C2=A0 x86_emul_hw_exception(X86_EXC_##e, __count_args(__VA_ARG=
S__) ?
__VA_ARGS__ : X86_EVENT_NO_EC, ctxt);
=C2=A0=C2=A0=C2=A0 rc =3D X86EMUL_EXCEPTION;
=C2=A0=C2=A0=C2=A0 goto done;
} while ( 0 )


It's obviously playing behind your back, unlike generate_exception(),
and does build-time checking that error codes are handled correctly
(unlike mkec() which has a substantial quantity of code bloat to not
actually handle it correctly at runtime).

I dislike _if() suffixed macros, again for obfuscation reasons.

if ( foo )
=C2=A0=C2=A0=C2=A0 RAISE(UD);

is far more normal C than

RAISE_IF(UD, foo);
or
RAISE_IF(foo, UD);

neither if which is a natural reading order.=C2=A0 The reduction in line
count does not equate to improved code clarity.=C2=A0 Frankly, areas of
x86_emulate() would benefit greatly from extra spacing per our normal
coding style.

~Andrew


