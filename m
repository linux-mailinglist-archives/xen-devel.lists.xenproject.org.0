Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B44C6A2F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 12:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280428.478368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOe4l-0002yt-NR; Mon, 28 Feb 2022 11:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280428.478368; Mon, 28 Feb 2022 11:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOe4l-0002wT-K8; Mon, 28 Feb 2022 11:20:23 +0000
Received: by outflank-mailman (input) for mailman id 280428;
 Mon, 28 Feb 2022 11:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOe4k-0002wN-BA
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 11:20:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 691450c0-9888-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 12:20:20 +0100 (CET)
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
X-Inumbo-ID: 691450c0-9888-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646047220;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y4ytSXfK6Nh9Alsu1C63kMxrUJ61iCes5+3YzPOZCEI=;
  b=h9zITVM3q+7AcDDVh8wTIwMNJKmAZMiYXSJ3H6xCb2+5CtSFCQGpe32S
   baSDMUndiFKOLNznFLqkUAvKWJ2p7nKP6KVLh7vkgvyG/5D5MH/nOaZX9
   eNiYTaQUGzXpSmeRk7M8CPJwDBmZ7RfEfqLFK/T1TTYnAkvlEP4/Jl9Jt
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65118256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mGP4zaNsrZCqLtfvrR1Zl8FynXyQoLVcMsEvi/4bfWQNrUp20TJWy
 TMeDWDVa6yMY2H0f9t2bo2zpEgBvJ7VyYVkQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NEw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 PcUh5DpRgYVLoaWu79MSzoBEioiIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpp35AUQKi2i
 8wxQGQ+cQTHXyV2eVo8FLM8mf2QtkHcSmgNwL6SjfVuuDWCpOBr65DhOcTYUsaHTsJUmgCfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGk68280C6S8jnaDexqnWEox00VsJZFqsx7wTl4rXQyxaUAC4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqZyAeShAey8L+u4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY233wn1j2ujp6TZZVQWvVTPfTuk5V9mMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2OBjatSsIoHONiwM2ITRTNt4wKuBJx+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jefPNCHMEOtbaAvmggUFAEWs+li9H
 zF3bZbi9vmieLemPnm/HXA7dzjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XOiELQO6+Bv5X8CNkVRHAyH71ghDPl670t/xBH3b2FJF6nNFeIQlcF
 KFUK53dWa0UElwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW/
 9VMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:VioNpasZ4K7HhzVrhLldJh7h7skCmoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wI9HdwGOtt5Dt
 //Q9RVfYF1P74rhJ1GdZQ8qOuMexvwqEH3QRSvyWqOLtB0B5uKke+z3IkI
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65118256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1oRJgtXGrR7oJZOua6T3j4DSDzUUhcD+v2Aq8pdK0Bjw7K9JIQPoEPxrDS3hREDTH0F7oRtr6C8xAJPSbp+T7wL82kjG1aVZ0NZGPjcyvmT43tIahCajzXQ8TBl57eDgP9QB/gFUDQSqzG8Nk1AHdCDr71FNlPHBArhN5L+7kaPzd4JUqUjr5wcFetwdY0kiaRHKL3okZCiHosmS/Ge3kliNgsYTjU7xb5xK5nN/tmgMhLqjiC2bkkOQpjWDcO+1fZ44pxSvEhfOXbatSm5tNw8JpkYvIb9zudzGa6oJVWtRvkL4LMfkP96jRipKnNvA1cZDYWfajfYsyJmkhSU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed8stpYibYnHXQX7i9FoEI4P3r8EueLvw52VaHs/nr0=;
 b=UHh+hw/9c5K1/TUC7GjDIysJ19QkQjvp8/rLvdiVHlT76HS4tKIhDdX8V+NCo9rUVt9dsj742j94ZMhzu9uTOG8iJwPH0kxQpJ5IyjReFSPie59Q1ML40ovV6Og1i96fV4IXeZEa9FnrNlOpcjZ+zPsJXdq47ZiwooDDi01PoMUbdSmOBozO4F2JevqJ+q7ympL/R46tFTRGMiYGxKbg8PRx7VzxVFYoOooiMVP0jtg4DkciCL2NJGG9b410D5PWgwFSmXyCkkFHkxexcgmTTK6LiYsbaafk3pkj2/AgOVe2Yvm/GOlSOUKQk3fDvpKzsniq6oAAumu/wEl4Lzn87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed8stpYibYnHXQX7i9FoEI4P3r8EueLvw52VaHs/nr0=;
 b=XNXnDu8VHtESOm2Hraso+74s1Im0smWImNEvLnHWUAaQNVeNYVOfbLEgTZfiLVrbR58qpDyW/v+bUyO+VlrcQrisDnpe6ZdFlCCd8n669EZG1SxSg+kAL/suEfjTpVCpwibkAo0XDxCGGgepNSWly7Ol04SAlhHbfiLAebevciA=
Date: Mon, 28 Feb 2022 12:20:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yhyv6Ui4ap1wOeNd@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 646f2ca6-f09d-4ad6-ef6a-08d9faac4a17
X-MS-TrafficTypeDiagnostic: BN6PR03MB3395:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB33953938F000D7E63494207B8F019@BN6PR03MB3395.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKXi2MsG1tq8tB/EUDafJHNBJ8HnmTEPEUxZiWv4jRe7Jeg6I/81ItTmVNfq7pTzp4l2PJOfYDzMUYeJKB7bYt3qr48fZCGcATfsLWN6xLXWqzO6PYbRtrtC7A689sKeiszarvsKpnp8S1HLzmiXxGmyOcpK6jpLH24DzchvNJruM7cJpsPk57QGspQ0Yji4WD/vawnVzBN/P+kS0h1WFfBXReuxxqw4hAU13AAAmHaAx6QKSaeypZNDQrIy4WnPjRdSA5rBVgEYjdGyS8KCP+rM58IVSLJ7HSk0/zslt9dITtdN94dZ3YmYSriVMSeY8477rlQ3bcaawcbHp8y+XSTsYiBZUc0B5DPAJ/AMnCa8/sfq3TxYdXaMNUq9Fu8r28PAKIYjYCWQSIr7h4K6A5l6BiYYCHG92vmFNSU4QWvVmHmqMGmEpXlync/zpEivZVgicf2lhtkNCK1MTn93JA9+NPI7e0nkpMvRHe/OzHSdqN6LBqG0L2t+y/rJfNj57JO8jDlw8VQpaRPtcPeUhE+nQsy8QbYor6VSbxbuoQn6llyEOtNohZuh5ruTrIgXO3RqsA88qDyXaO6mT7GVQwDJYM3gjPpyVJhkTfUn6S0mrLVITrIji9SWQQET4SWZ6IGl+N4J0h1gz2NPM8BaFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66556008)(5660300002)(82960400001)(66946007)(66476007)(8676002)(4326008)(8936002)(316002)(6486002)(6916009)(85182001)(54906003)(38100700002)(2906002)(508600001)(6666004)(6512007)(6506007)(26005)(33716001)(9686003)(53546011)(86362001)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T000b2Q5SUxnMjk5YWpNWVRGWTliL08rSWhQZlhLb29MQjZhSDY3dlR5MVNQ?=
 =?utf-8?B?UFo0bWt4cGFFK3N5TUM3ZzFtVnIxV0JGMjZoWm05WFo2S0xNMmh2UWd5WjFw?=
 =?utf-8?B?bmd6eVNQRDNxbGhBcjdEWkFuUlFpQWo2WGxXYS84amF0WkQveVgxaW1GOUsv?=
 =?utf-8?B?Ymk1RGh0My9maXFmTHVwQXZKMWU3blgySGE4SXR6MkU0TDYwOWtQUlQvUE5X?=
 =?utf-8?B?YnpKVTZpVmZQczRJZWhDU0ZwbFhKOTZlMEwwWmg1RXRmREh4QUR1T0pHcmtC?=
 =?utf-8?B?ODdjYnpJMzJXV2tObWlxZHNGT20xSUJrM1JKUC9JWG1mWFBuY1J0b2Rack1o?=
 =?utf-8?B?TzFKVXV2dG50MlAzR01JUk8yby9VSm1ZaUtFeEhYbnpOWDBqYjJORVJIWUMr?=
 =?utf-8?B?c3RuYk1ZeWRmR0VqQjU5NmcxR0xsWU51S1IzR0ZYaGM0RTI1T0lFeHdkejJh?=
 =?utf-8?B?Q3RmMHdvS1JOTy83M0p1dTdueDl0QWxiR1Z0MWoyVDYrSTkzUWNSMDRRcVRN?=
 =?utf-8?B?Ykh3THBwakFHYVBBaU43Z0hmOVZ6NktGVlZuVGlQcVFZL01OZ3ZOaDRlUWI1?=
 =?utf-8?B?T2JJVXY1RTYzYjNvZEpKY05qQlFjeFEyNmVGY05zMGRKM1NRNWdpQWl5K1ZU?=
 =?utf-8?B?VGh2OVZDQ2sxY1IzclQ1T1hHdlRwVWNIZDBJSHhjWkQ1c0NpMDRvL0t5YVNT?=
 =?utf-8?B?d3liVTB1VEpOTDZhQzhTWkE1OTlvRk9aRlNscGx2SDZUZTdIMzZDMG5xWkxx?=
 =?utf-8?B?ZlMrc1pZRVVONHhXVWtRNzF4QnZBSXlMbU1ydmk2a1Bnb1E1TjJpOEs4Sldx?=
 =?utf-8?B?RSs2KzI0bng5MFZGeUFVeHVMa0NIMnJGM25qZmtoZElKS0xFSDFiYXZWREpP?=
 =?utf-8?B?UXF3blFVOUszZlNMRXJtMnhLbUZIbTF5d0Y3TjBMV2liejJQbEJpV2RlZndV?=
 =?utf-8?B?QmtMcWQyTTBtdDlZUWlDM2MzQVVzSUd6aXBvZmVCeDhIakRJSTBWT01yai9u?=
 =?utf-8?B?dTlPdit3dGpEK0pKSWRMRVA5M2RGeFpleE9EYzdCQW9ycXN4MExqZVdyeThM?=
 =?utf-8?B?eGdpaDN4TnlhVERtaHEzcWZNRit0b3o4R3hYV2NQQWthdmF2V0tPN1UvLy9K?=
 =?utf-8?B?dVllZWFGNFlGV3Z5ZHdwRjFwRkVXVjY0SDN4MCt5Y2xRTXE0VitVQTdIM29I?=
 =?utf-8?B?THRnVlZ3bzRXTmJjR1h3aHJvUTJlQVdScURtc2o4UG9qY0R1dTNJL0Zqd1d0?=
 =?utf-8?B?ZmFpa3BoaVFXR1IvVmlWeDNoTVZPNUlIQWIxUFY1d0RSaVFnQ3A4TjhlS05w?=
 =?utf-8?B?aGhQRkFSMmhFNXIxUXpZMWt6Z21ZTW5CMEp2VzZqRWovQjFrYnI3bHc1QTJO?=
 =?utf-8?B?MmJOZllzMEQ2c09GczZzMElmWllOSTJxd01ReDhPblBJUnNTK1ZsWDBoT1NR?=
 =?utf-8?B?TzdiR01ydlhqMDA5a0ZwZExmSHk4a1IrS2ZJY0xHVm1hdFVSMWtnNW9JRlgx?=
 =?utf-8?B?VmhTeE84c3ZHV0NBT1cyOVFJNUlzdSs5UlFHWnY2K1RCMFdGTE9oNERoMkRI?=
 =?utf-8?B?V2RsOVJvYUplU25CSEZIWDBIdTZqRUNKY29xNndxTHZ2TSt0ZU1YcWdUNDJZ?=
 =?utf-8?B?K2xGTUlPYWZYWGRTY2dtUnVpMkZ2aGNPUzBZZU9OTkZmcVRDempwNzNyZXVW?=
 =?utf-8?B?N0oxbWdlZ0tsRUcxQTlpTkdOREpLS2ZxR1FzbGdMZ0ZWaEw5N2YzME1KUjE5?=
 =?utf-8?B?Q2NDM1lHSFE0ZnNZYXlEQWZVZU5oZFN5ZUVCeVpWSmxiTmhJR0pqeHRVaklp?=
 =?utf-8?B?YzI4NEVOQ2dOVlBrWk1wUWFxZzNmTjgwaS81S3NXbEpzOVd4N0NsUngrQXNo?=
 =?utf-8?B?cTFkM0tabGp0ekoxVTdwTTRDVTZTanNXMmt6cXdISVJMOERodjMrTGpURGlD?=
 =?utf-8?B?Y0hkOWx4cyszRG5aWEE0OVNVVlFQdVBxancvVWV5aGk0RDR6SHNqVVAwRFpV?=
 =?utf-8?B?ajQ0WVhCUU1Sd0hXazNqT2h6VkRTeUNXaGQvSFNHRGFteEFseGlzbmdSQ2VK?=
 =?utf-8?B?SXJUVklNenpmcXVsNUxVVFE5S1MvY1lzNlhWUU42YVpweG1QU3U5aGc2OWhs?=
 =?utf-8?B?RkJkSWlaWHRhamVGUnljMVI0RU15eVdVaGRreGVuNDZoRFdvSVBUdW5uak96?=
 =?utf-8?Q?WqUA1Pnh1JfSU4rZ5W8OVQM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 646f2ca6-f09d-4ad6-ef6a-08d9faac4a17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:20:13.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi9AnydJhWdI6mQMn1TVPFomINz7tj5OxRxpVBPVH4HTEyBhOHIkBBYtG/0z3O5r0kRFA/g3v8WOT1mjd3SEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3395
X-OriginatorOrg: citrix.com

On Thu, Feb 24, 2022 at 03:16:08PM +0100, Jan Beulich wrote:
> On 18.02.2022 18:29, Jane Malalane wrote:
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
> >  
> >  void vmx_vlapic_msr_changed(struct vcpu *v)
> >  {
> > -    int virtualize_x2apic_mode;
> > +    bool virtualize_x2apic_mode;
> >      struct vlapic *vlapic = vcpu_vlapic(v);
> >      unsigned int msr;
> >  
> >      virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
> >                                  cpu_has_vmx_virtual_intr_delivery) &&
> > -                               cpu_has_vmx_virtualize_x2apic_mode );
> > +                               v->domain->arch.hvm.assisted_x2apic );
> 
> Following from my comment on patch 1, I'd expect this to become a simple
> assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
> local variable could go away), just like ...

I think we want to keep assisted_x{2}apic mapped to
SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES and
SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE respectively, so that in the
future we could add further controls for
SECONDARY_EXEC_APIC_REGISTER_VIRT and interrupt delivery.

Thanks, Roger.

