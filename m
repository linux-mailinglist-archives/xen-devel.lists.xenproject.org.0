Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7193B4397CD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:46:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215876.375285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0J8-0001ng-G0; Mon, 25 Oct 2021 13:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215876.375285; Mon, 25 Oct 2021 13:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0J8-0001kD-CJ; Mon, 25 Oct 2021 13:46:34 +0000
Received: by outflank-mailman (input) for mailman id 215876;
 Mon, 25 Oct 2021 13:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mf0J7-0001k7-FO
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:46:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6afeee6e-385f-442c-8fad-4ac414c064f6;
 Mon, 25 Oct 2021 13:46:31 +0000 (UTC)
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
X-Inumbo-ID: 6afeee6e-385f-442c-8fad-4ac414c064f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635169591;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/DBKMZs0aA4zw6WSJTSZjla/q+pUYVqmhr5UKfSG3k0=;
  b=S6S0aBQn9wTGE7jiZlJrDn51KGnjXgibMGfrDorbpnLUp5eMN+9xicJz
   DryTB3utCE00y27DwRy5jJDvWdCEIyNdOojNDtZzp9AGTGR+DHotqrc+A
   zVK4vIZqpPRLMo+cNxSZEzrJ8o/7ONAnTVfvHRCeSisgKQoIKIfNRad5/
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PwBPMnbxubQsYOcLaIagNtn4GwZBb+NjNy7d6+s2v59Hy1u8M6GEilUJ2RRCYioXFYNjY27LxZ
 JmqmD4oVDPXlyB15GJ4eSodEmQkLVxmbrLuoXqMrx1IERM4sIb1RxUMRx1jT2OTBARZkTA26gR
 3aq01jSHjs5dOvOCW0EGEpAPmCh6pzr5rV3N883iXWxZlW015Orivqf1dAfxn7wOL/7QUaubcL
 CCUstlcgVX4gjzoRZZo2xgh161h/rxws/pVfqPW24C8UtmUf42RdeWXbh2VCmXipqnvQ2zDy9s
 QF2YFW5kWU2y8P0NlnIUWGyJ
X-SBRS: 5.1
X-MesageID: 57903427
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xw6T4qzFSYhp53ih4HR6t+f+wCrEfRIJ4+MujC+fZmUNrF6WrkUDy
 TZLUGGHPf6OazHwKdoiYdnj8kgBsJ6Hx4cwTwVtrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7Rk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4t4l
 fAV7p6PcEA4brHvmMpaDVpiOBgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIHjW9r2poRdRrYT
 +AXNSdoQhXOXxNWZA5UVcscueavr3aqJlW0r3rK/PFqsgA/1jdZyrHtLd6TYd2MSsV9l1yd4
 GnB+gzRCBwAKMaWzzbD93u2n/LOhgvyQodUH7q9ntZyiUCX7nweDlsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSpQcP6RAaQu2Ofs1gXXN84O+wl6imdx6zM+QGbC2MYCDlbZ7QOndUqSDkd8
 06GltLkGxRiqLSQD3ma89+8ry62OCUTBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj8KG2/kvOhT62kbHPQhQo/QXcXm+j7QRRaZasYsqj7l2zxchHKIGVX1yQp
 k8uksKV7P0NJZyVnSnLS+IIdJmO4/uGKzTajURYI4g69z+t9nigeqhd+Dh7YkxuN64sYiT1a
 UXevQdQ4p57P3awa6JzJYWrBKwXIbPITIq/EKqON5wXP8Y3JFTvEDxSiVC4hGmwtRB3k54Gf
 obLbeWsIzFESp5M9W/jLwsC6oMDyic7zGLVYJn0yRW7zLaTDEKopac53EimNb9hsvvVyOnB2
 5MGbZHSkkQAOAHrSnCPqdZ7ELwcEZQs6XkaQeRsfemfPhEuJmglD/LAqV/KU904x/oL/gskE
 3fUZ6O59LYdrSCfQelpQio6AF8KYXqYhSljVRHAxX7yhxAejX+Htc/zjacfc7g97/BExvVpV
 fQDcMjoKq0REWmeo2xHPMGl9twKmPGXaeSmZXrNjN8XJMYIeuA00oW8IluHGNcmV3LfWTQCT
 02IiVqAHMtrq/VKB8fKcvO/p25dTlBG8N+eq3Dge4EJEG21qdACA3Wo0pcffpFdQT2el2Dy/
 1vHXn8lSRzl/tZdHC/h3vvf8e9E0oJWQyJnIoUsxe/nZXeBpjH4n94ovSThVWm1aV4YMZ6KP
 I195/r9LOcGjBBNtY99GKxs1qUw+53koLoy8+iuNC6jg42DBuwyL3+Y89NIs6ERlLZVtRHvA
 hCE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygBfrF7B5won
 LU6s8kM5g3h1hdzaoSajjpZ/ninJ2AbV/l1rYkTBYLm01J5ylxLbZHGJDXx5ZWDN4dFPkUwe
 2fGj6venbVMgEHFdiNrR3TK2ONcg7UIuQxLkwBedwjYxIKdi6ZujhNL8DkxQgBE9Tl90rp+a
 jpxKkl4BaSS5DM01sJNaH+hRlNaDxqD902vl1ZQzD/FT1OlX3DmJXEmPbrf51gQ9m9Rc2QJ/
 Lycz2q5Az/mcNuog3k3UE9h7ffiUcZw5kvJn8X+R5aJGJwzYDzEhK6yZDVX90u7UJ1p3ECX9
 /N3+OtQaLHgMX9CqqI2PICWyLAMRU3WP2dFW/xgoPsEEGy0lOteAtRSx5Rdov9wGsE=
IronPort-HdrOrdr: A9a23:RuXvT6tgBq2FfMi1D9o9s4I47skC+YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H6BEDyewKnyXcV2/haAV7GZmjbUQSTXfhfBOfZsl/d8k7Fh6NgPM
 VbAtBD4bTLZDAQ56ubkWqF+r4bsZ66GcuT9IPjJgJWPGdXgtZbnmBE42igYyhLbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SyIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoKi+2eGRhOerNvb8yvT9GQ+cyTpAo74RGYFqiQpF4d1HLmxa1e
 Uk7S1Qe/iboEmhA11d6SGdpzUIlgxerUMKgGXo/kfLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRC8osR6NkOQgbSsa4HZcYEBS4tI7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9VVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJZ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZWXkVwzve4Pcb
 j6ISJlXF8JCjDT4Je1reN2Gzj2MRWAYQg=
X-IronPort-AV: E=Sophos;i="5.87,180,1631592000"; 
   d="scan'208";a="57903427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUF+3i38K3dyWSUKOJcuF31XvJxydR8trmzR3afw0ZFzn0rMJebcHD6x2gCF1HDPInLalj0fJSUGjbIeTdSi9puvRi9/mOSMR98WEYRUDzFpmQWgcozJp9NDgFd7VfBL+dn/OKSJoyqzn7+c4Sxuhkyd1SZpWN7Ybfohq9QIAlEYY6fs35kMBOjU1C80cIr8SnofFwx76++bSFTWIi0Gp08wP88wYDmj8R/id80+meJk4vzi6Dgz3fRh54JMBt2uj/QIsbU3SNbLE0uAonACQgdVY1HXFvAnHNPo+8gah9089nnFYE3A27YbOwXnlCAcGaDTbl7ZE0SU5++k7ygVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ty06Uj7JfE65tSUpt28Gf14m7X0EBKkraud9zrsoVs=;
 b=ZNQSIcaOu1eKwJF7cynoFkEjr45FlM2zwOngqOaRST2Adt8xHLttcc8MwGr53/hNlBQRsAWbgNqNUWOkkmdiVmG1eVwQQKdPZ3XbWj0UQjGCN+Lr5vv6x0d4iIfwDvye7JhWoo9FreVQFVJb25+e7lu3mddMdW04UtTCzjcxpjuztW/rUKtIIPMR9sTaKxoUwkdClbtxpTHjZQMxx6AA7/llxDxb1Uh3UPnWwzEfsVRqN0QeI5ojhnmqcaDsUJ+ZlCw4mqr6MvfDdZ4MelwpbCGvHTcc0v+1LMQLmD5GglPKoBMJeJ9xIDIKYlNV0VHyqjrqFw1RzzgEMouOWJN4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ty06Uj7JfE65tSUpt28Gf14m7X0EBKkraud9zrsoVs=;
 b=LXgbC+x5KgYx0bEg+gQ6nzsr38DnWA64fpPkQa7hpuLiffMRU+zc0ANXYDI2+mM6bpIrZKNNE55CFOsfgJn/e5w8QNG2naR0isIsCV0n/ZL3xNTS2lX6EzpN63p5HoeGWNcx37TBHEVsQjz83hdZXCSkDJrUvKkY3K4AAosERJM=
Date: Mon, 25 Oct 2021 15:46:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>, "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Message-ID: <YXa1HBMCMQUDr++2@MacBook-Air-de-Roger.local>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
 <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
 <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
X-ClientProxiedBy: MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac82045a-35de-4f85-2c27-08d997bdcd93
X-MS-TrafficTypeDiagnostic: DM6PR03MB4681:
X-Microsoft-Antispam-PRVS: <DM6PR03MB468136CCE4083E640E48E5428F839@DM6PR03MB4681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKv0xCkCv/kBHALFlMY0e5nWRkCW0DUMcQtGOaxzcxrrIE7y7bmgS222aSJlvSZTC2SoWFoYTXq457JEdque8uJzoHWJeMek0iKt2SvSBu+JkluPossGcWoCTz418KPa9Sv55Ej58HmIjIRV4MyFuYpEkBL5ghp3vEv/jQ78irB4CoSmh1viZCPahEjrevCUeFsnyOKff1YaSzprJqjt+Nn6Sna8s/4/vmX07vlB3JUX4QNEeBs7YZGQ1ZGr1y0qK2sXi+q5GRW7MpbID3GcoX9hda5rlEwWpWdD26ejkwsu9bTibdS7meUjj0Lk8G99974ZxbtqupJ1Ec8oehruk8iwMZPYSaEkpfSdXPK9sDeB29tNtxgXrkGDqIv739vhFlscPjEjL9rseWx4Elms8t9M1U/VhFRFBcYV7TD5MOrwQq09o+Hqa2Uv+E0RoJhB4shJSEoVUPH8rDHiaXjQ+RLjjC+wweQyUvbns+lmkyBm6Sm+YSKGnJRE+21ZsFu457mGmrQ6r/fwZ/IXm8AIBXcjQGXezTweFek9385kKTAwrN6FSr3q+//bdcC4K/JxbfMzg3TQbAueiD6yIM2zQZNe6k3YjxkA5bsuNi+IBkMdTDzGZDJJy5tlg1D/eNQrNQTUtwCaXpImtWa0tqro5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(4326008)(508600001)(53546011)(956004)(8676002)(186003)(6486002)(66556008)(2906002)(66946007)(26005)(66476007)(85182001)(54906003)(316002)(82960400001)(86362001)(7416002)(5660300002)(6666004)(6496006)(8936002)(38100700002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pGaWJ4aGowRWpsUXJDUm1Lb0IxbmJwYzMxWjRSR29Ocy9OV0dLQTRJMnZ4?=
 =?utf-8?B?YkNpdnhjMkI3SW4vQy9FMFNsVjdic1ZPeUdNbU9WRlN3ZmhPWHdYVU5RcmpM?=
 =?utf-8?B?YVhYU1dvOUxLeSt5YkVzVXVUM2lIMHdENmxpMzU0Z081clFLbjRyajAzOWpx?=
 =?utf-8?B?Mkl5Z05YNHQzZ0pwWE1rRk5MZmJ1c1RSMWd0R3dKNlRhdEVWVU1rRnc1Mll4?=
 =?utf-8?B?UFUrMmRvRTlZbEcwcFIzQTB0V1dyMEtnRHdDSGpzYnlybkJ0eVlHdTFDd0JM?=
 =?utf-8?B?WVR4UVR6bnE0T0YwT1QzTHlEUmJYc0NzOFErUG9FYW9IOWZGQ0VDODN6WE5Z?=
 =?utf-8?B?Z1lkMFVxS1R1d1dJSkhEbzJVd1dHWm1vc2tiZG9oRWxXTXpPRjlQS3dQcHhh?=
 =?utf-8?B?Tkc5aXE2THdXZUZIQWJ5SEoxdjBPb1V6TUk3ako2UU1UR205OU5tcWRQekZP?=
 =?utf-8?B?WWJJZ2FudVh6VlhPZ0YrSzBVU3RJdUpHU0l0THZtUnFETDRSWit1MjZONVpG?=
 =?utf-8?B?cHc5SkFTZDBOYlNteWVNMEEvSTZyMlhQNk5IVEVxKzF5dW5HeFQzdkpldzlz?=
 =?utf-8?B?NVJ4QW9hRDk2bU5oVVJuNVFHaWNtb04xUGhFSU1PSEhjd2JyZW1PREtFZWxj?=
 =?utf-8?B?TVdGWTRleG1hR1gvUHpLZG5ucDhwazZMeTFIQ1d3aHJVTkE0d0hFd3JMb0I1?=
 =?utf-8?B?bGw4MzIyMDR1YjBlZTRyZlRWR1MwM0NUU2tlMnU2b1QwVjZRanRiUjNqZ2FS?=
 =?utf-8?B?T3NmN1BrRGU0amcwby9WUjJLMHlPU3FqVlo4bkZDQjFkK25kWi9NQkkyUUZL?=
 =?utf-8?B?ZlYxVVkvdDFwNjNPUVdqSUZvZkM2N3pDRXMzZk5icWJzbS9zNURCaXRoWU1R?=
 =?utf-8?B?WU9vRnZjWUVTK3M1MVdIcFYwaStOd2F1VU1wSVdYc0tVbjFkb1dVSjVJVGEx?=
 =?utf-8?B?Z3JVejVnQTdSMzlrblAybjBxMWNlUDF4SXFCSXJwaFFRZXZETWUrbHczMzhP?=
 =?utf-8?B?VzUyYzNNbUVMaVptRzVILzNyc21ZOTkwUHFXaTAyMVovNU53eDVyK0t1WWZM?=
 =?utf-8?B?dmdjVEtTMkEyM3F3d2gvYnN4UXhwODNxZjZ5K242c0M4T1dPcGRpYzBJdDhP?=
 =?utf-8?B?VTBnc0k2cVZuUjl0YWJoNmg0Zm9QWlYzaXZvSFpvRTJuNHFoYm40VkZyRldT?=
 =?utf-8?B?SjBoOVUyWmlVd3FoZDFWbW11V2NOeHkxbms4clRkVGxqUUdFdG1VY1dkZ1Ba?=
 =?utf-8?B?UHhHcFdWMm0ya0NFMmVQbUhrMThoNHU1RjBhWXhMWDBoOFovNUg4S01aSlJG?=
 =?utf-8?B?ZDZ0K1BHcjZiUW5rdDhNSE5FcnVhUlF5T25zMUhUUy9FMUNCQ21WdTd2RGFB?=
 =?utf-8?B?QU9xamM1aGVEcXIzSHZUN0xyZnk1MGU1Qm1VUnhsWXNCWFlVY3Z2UEx0NU1N?=
 =?utf-8?B?cUZBZlBZbzRPd2lMdVkzVmxsaEwwWEVwSWR0b00yV3JjdGdYanI1SG80MDRk?=
 =?utf-8?B?VHVPK1F6clNtcVpsYWZWWkdSUjJ5S0ZEZitmb0JjeTRJWUEvQjh0ZUk0NUl2?=
 =?utf-8?B?Y3RNdmxaMkw1bGlsUzdsWkIrZE02eklrWTdYTmpsbHNQOWY3VlZnaVFMa3Vu?=
 =?utf-8?B?eFVRYlZ4NnRGSUZGdVZMM2dEWVBCMjdWWUlqQlBxTGQzaUhOcitqbkhlcWRY?=
 =?utf-8?B?a0tNeTF0bGJ4RWJpVDIraHdMMGIxZks1SU14SEVWTkVJR3l3Z0FlcDVYOGJ4?=
 =?utf-8?B?c2d0UGN4V3R0OUdueEhRZVJGanBpLzFKZ09sUXRpUWFsSTcyQzlvaXA3eVNp?=
 =?utf-8?B?UDVzV05UUitIcnFlZ0hEMEh4bzVEbFFqM1AvSVNRVUh2RUp0Ujd5NStSSHJl?=
 =?utf-8?B?akhEYU10MmtqMUV1NXYxV2tNWDdwdk0wOEhNRVF0bENwVE85UzZtdUVuc3JV?=
 =?utf-8?B?TU9QTVpmTEhPSXhTeEVjRHY4Z0p6VFlWUk1JSmVtYngyK3BLU0pXU3ZFajVU?=
 =?utf-8?B?T1hZV001aDBHeWFaM3FTN3NSbzV3SWN0MytBMnNTZysrTEd3eDE5ZWZRSi9m?=
 =?utf-8?B?bDRNeHArL2VVYmQ3ajJTZEtJbjMxV3ZlbkRtOGZIeFhvL0FJK3FwU01MUzJ2?=
 =?utf-8?B?U3ZlZk0zYXFLNGsydG04Z0d5bnJEMXprUjBjVGJrOUQ2c3BnZ3cvdU13d2dG?=
 =?utf-8?Q?sqqqos4+KSrZ35ojvZqRIT0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac82045a-35de-4f85-2c27-08d997bdcd93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:46:10.4607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBbC4sb4bPRDm72EbJ7cs7vAMM2NDpOBEKnu1RXr+be61gNLTcBrlPdVw++XEMDtcW9SQrTJ2tjy3wDJoCvBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4681
X-OriginatorOrg: citrix.com

On Mon, Oct 25, 2021 at 01:38:19PM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 25.10.21 16:22, Roger Pau Monné wrote:
> > On Fri, Oct 08, 2021 at 08:55:32AM +0300, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> Arm's PCI passthrough implementation doesn't support legacy interrupts,
> >> but MSI/MSI-X. This can be the case for other platforms too.
> >> For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> >> it to the CFLAGS and compile the relevant code in the toolstack only if
> >> applicable.
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> >> Tested-by: Rahul Singh <rahul.singh@arm.com>
> >> ---
> >> Cc: Ian Jackson <iwj@xenproject.org>
> >> Cc: Juergen Gross <jgross@suse.com>
> >>
> >> Since v1:
> >>   - Minimized #idefery by introducing pci_supp_legacy_irq function
> >>     for relevant checks
> >> ---
> >>   tools/libs/light/Makefile    |  4 ++++
> >>   tools/libs/light/libxl_pci.c | 13 +++++++++++++
> >>   2 files changed, 17 insertions(+)
> >>
> >> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> >> index 7d8c51d49242..bd3f6be2a183 100644
> >> --- a/tools/libs/light/Makefile
> >> +++ b/tools/libs/light/Makefile
> >> @@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> >>   	-Wno-declaration-after-statement -Wformat-nonliteral
> >>   CFLAGS += -I.
> >>   
> >> +ifeq ($(CONFIG_X86),y)
> >> +CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> >> +endif
> > TBH, since CONFIG_PCI_SUPP_LEGACY_IRQ is used in a single place in the
> > source I would consider just using CONFIG_X86, as I think it would be
> > clear enough that some arches support legacy interrupt while others
> > don't. Not sure it's worth going through the obfuscation of defining a
> > separate one.
> The idea behind not using CONFIG_X86 is to be arch agnostic,
> so CONFIG_PCI_SUPP_LEGACY_IRQ makes more sense with this
> respect

I'm not going to insist, but you could have avoided modifying the
Makefile at all by just using:

static bool pci_supp_legacy_irq(void)
{
#ifdef CONFIG_X86
    return true;
#else
    return false;
#endif
}

Which IMO is clearer than the current approach since it's a single
place where CONFIG_PCI_SUPP_LEGACY_IRQ gets used.

> >> +
> >>   SRCS-$(CONFIG_X86) += libxl_cpuid.c
> >>   SRCS-$(CONFIG_X86) += libxl_x86.c
> >>   SRCS-$(CONFIG_X86) += libxl_psr.c
> >> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> >> index 59f3686fc85e..4c2d7aeefbb2 100644
> >> --- a/tools/libs/light/libxl_pci.c
> >> +++ b/tools/libs/light/libxl_pci.c
> >> @@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, libxl__ev_time *ev,
> >>       pci_add_dm_done(egc, pas, rc);
> >>   }
> >>   
> >> +static bool pci_supp_legacy_irq(void)
> > A naming more inline with the PCI specification (since we insisted on
> > using ECAM instead of MCFG) would be intx, ie: pci_supports_intx.
> This will require a follow up patch if we all agree this change is needed.
> @Jan, are you ok with the rename?

Didn't realize it was already committed, in which case I guess we could
leave it as-is.

Thanks, Roger.

