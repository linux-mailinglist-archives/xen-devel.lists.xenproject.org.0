Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF337F799
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 14:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126904.238461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhABY-0007GV-IH; Thu, 13 May 2021 12:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126904.238461; Thu, 13 May 2021 12:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhABY-0007E9-Er; Thu, 13 May 2021 12:11:24 +0000
Received: by outflank-mailman (input) for mailman id 126904;
 Thu, 13 May 2021 12:11:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U61U=KI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lhABW-0007E3-D2
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 12:11:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0a965e2-7846-4cc1-a527-d7475b3a58d8;
 Thu, 13 May 2021 12:11:21 +0000 (UTC)
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
X-Inumbo-ID: e0a965e2-7846-4cc1-a527-d7475b3a58d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620907881;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w+AN/9riY62R/emu2iqBOPQg2ZLQNl9ooM5syoQh4+Q=;
  b=MJTYkV4jlDJ97nkrJBb8stFn3vhmP4Cy6DqAw9tuAj8hC4dDJLszUIFt
   1ESynjf+YDNOP+Zwz9rCk0m+Shyy69xu91cmAa0HkmZOke1F3zE3H747G
   /4Am+8zRyg41Bt2bH4gqwSzlNQfLp98cne0lfTa6sDynNmg3Qr9T6zWJh
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5XB6+Qj8Wo2ggOX71Lds5FX4VXWo8DxK4hblM+lHxTxBCDkZpvpLbFo3YfnQQlgjvYUTL4O2/e
 /AegzDZMuNHmkocly/Hkeizz2eMF6JslNpAw4l6S2T/EOD1wAjv9IPoDOJbyVxUDqjkUvwNHtO
 JbsV4MrM5VQoo03Rtiu/ey5MIuMsn3U3u3cAEZ20VKoh1fu4CQqPjuWzqC6ZTDUL0Hkn8VQDZq
 ucpkJMFf8g5dUT1BS0udYh4Jzy5IMffueGxUx6l7NEVa9GrNVKuXjaehKPqlyuyBVuyGJaJ2lU
 xNY=
X-SBRS: 5.1
X-MesageID: 43508827
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q6nzdajmPMBC78ZCoZoyR55MFnBQX9p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEDyewKiyXcT2/hsAV7CZniahILMFuBfBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfCtHZKTBkXCF+r8bqbHtms3Y5pa9vgJQpENRGsVdBm9Ce3am+yZNNW977PQCZf
 +hD4Z81kGdkSN9VLXLOpBJZZmOmzWl/6iWLiIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYD69jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idqrD
 D1mWZjAy1P0QKVQonsyiGdnzUIkQxepUMK8GXowkcK+qfCNXUH46Mrv/MqTvPbg3BQ9+2Unp
 g7mV5xjKAnei8oqh6Nr+QgZysa4nZcnkBS59L7r0YvG7f2O4Uh4LD2wituYd499XXBmf4a+a
 9VfZjh2Mo=
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; 
   d="scan'208";a="43508827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKK7D4D+1jS88pghRjHc0ktEsiKeqH6oFFKt3KxGZC9tsIEyARA/zoC+/euPZSDfNIjjlmxx8LhfVGkNu7wMSWLMdIoqt1QHxhwAYD3yJ84ZviwWZZk2lVSu4s88dzw6n8A3ej2AnvnYxLTw7pheEakLXytQfz6idusrLq2nAb6FI0P/V/vjOyNO4gm99YBEej8q9NnSVAPDddWj2IcoLq0AfZlQTM57qbKUO5qCL+tGs7uy9g3hitTKpIUPNNbQGq0ceEEjP9BMAuMzfSU3+gm9iuXjVrmS0nVl7qNVa27a7L5a7gaq7X/cyY8rtxAo6YO4fX4OeeTF87qrGITBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn4/+ic4aBLmKvcX13nj1p5Y+R1+ooz3HzIYW3wGZEs=;
 b=E+K5I9w/b7fZmO7GdAc2EtX5I15/niyr6zp86Fly/iWS8kA07aO1DLm2thP06kRIqwglzAR8tm9JhnRZRfaehYifUR73nacinf5qfDmE2ARmVMM2oLLTAHvCOy9goemrNQ54QbeFO+6kKpvxK2W5ZrYhe7VB/0ZfIUDb5B/oU0XVBl/mqxvYOqDyfBIwZ/JMKV2CZRfjjdVo72mwDG841ilIP482jDWzb0xJeI5mSxJMJX1jwFNTtUG3ffWY1l5C6Y0/nBOhV3x41SrEbVvsQvm/HhKawrEyY+7tIerCnzJOL8NpPxEM4wOKef6xGNGaz332Y+hNQUurUaxKCVPVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn4/+ic4aBLmKvcX13nj1p5Y+R1+ooz3HzIYW3wGZEs=;
 b=QYIh9oe4bP0SnPF5SwUbxpnYLnGJ4bgk0ANQLCD9dPU13CEmLVoY5QArS6FmQ9FN3XrOo81lUy49HhkO/r3aJSCnZnu74UVdyCltNvT6hI7j260Q3e11oRw6QM/0JEQHrMrZPlK0nBqL3KfMMDQBsaXG8lShKFWdfTL60T4c4P4=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
Date: Thu, 13 May 2021 13:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210513122457.4182eb7f.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02d688b1-7a3e-4976-f2fe-08d916083537
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4806CB7EC49B4A3777664057BA519@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: px9Y1W/4wfPVlJBfo02Dwvh/EqTtLfcFly1bczYBzdHWkp4EpqMHEOYDTGLOJxxLDst2Wu0WIm1rxbVafVmoJNfTjzl425s7OtNHEx80lJwdtiPhuvJEGCXchSMrmWWtixj89FqfCNtfgTvSLr+I14jRJ1hmBV9NGrOe/33l1eAZMPADWhGArWjfWfQ96keQFKM7Edwf//AsjscOp07LzKwsuK5cBSXv4Hrgjpx/D7NEIuL4QLBj0uBMBp2BwWOeGPkTbNTKmmE/BFVsSthYmkeuuwN3NpAAYeLJ++emcQy3PtvsGraJUyuNausOKG8AWfeD555bl8yT1w2pkAHdixBZxIs+Qdra5+heKgg6koC81pI+JCpbf1oB4+Vo8wd0saBULuBGLWDWGmGw2BkmwiFbBzQDVS8gXai+xJpCuoZpi4U7yqR4wnwYdUjyW25OeyU1R7P1hY7GsPNBB4fBqG97vj9xJws2CeycOSpQ2ZIkYc6lpRpH1M92Ht1diWLWbElYzdw+N8ohlZS8RLb6dustHug7ZcDNpineYHXyZfBIbGPyeQVsQR6xXlz7WVphkxtmHcm6kgCyTlfCA76jwEDHawUnrI1d9/RLzxS7yP6oxzNdKosccne8pJdNtKUElR901aZZvDBBW3bvbdgurwZgGmNpQtGKuYbg65C5sHAQN+u8sBfVTJcmIinPbvd0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(396003)(346002)(136003)(83380400001)(186003)(6666004)(31686004)(956004)(53546011)(5660300002)(316002)(38100700002)(8936002)(16526019)(26005)(36756003)(31696002)(6486002)(66476007)(66946007)(86362001)(66556008)(16576012)(8676002)(478600001)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?LsZzbDvmMiR1PjsnSQxdTdH5kxZZY7SNqQdFwYbAY3J31WVEkn/07FSz?=
 =?Windows-1252?Q?gZ4QphY18GpAonqtTCLF1Gx3mTMWN54Uzy4EmdxZ/955QBgp/eyOFJmt?=
 =?Windows-1252?Q?Vs8tFCOP3+zzkxuxZ0ff8NGt8uyjjiir5SDJIP/e8oA+lSRcvsd0qcUP?=
 =?Windows-1252?Q?xaq/b6g+WtXTflaOpaVchYjSSjh2FDECGanOFaez7+WHGtK3jJ5OfSIh?=
 =?Windows-1252?Q?2rZ9nEWHxJi0by8OUbhyH40uFACA234FbXXhEFYHEgG0ChIFIIJL2j2r?=
 =?Windows-1252?Q?WeUYcNmIyy+H9x548jyE09U4QaKVC5QV3EMxcIdehiLNR3VmIyA/pBs3?=
 =?Windows-1252?Q?GF2ZFQJPrZXYBIc2/19SHvmyFZwiQYJiYFe1T0op6Mxo6YMZVrxum6HD?=
 =?Windows-1252?Q?M98vmFv+Rt6lg6lCISLOQLuK3VXn3pg752zZ5wuAnB42/uLo1SDcHZCr?=
 =?Windows-1252?Q?vf4Jdk6m35Nn4paT+6qz/PXggFMB5dngDT3KslCqEQdS/Ogbs7J4MWYQ?=
 =?Windows-1252?Q?Qj1rpmfTM8TL1VsPsci86Vp/Abo+apPZ1ubxyyFgvzkf2UUzTi6BxkLz?=
 =?Windows-1252?Q?/hmO9BTGr5T5UvpD7/06zDxrYpqYfzbigooY4zpT3bPm475291pz5tdA?=
 =?Windows-1252?Q?9haUrclz93ceITbj42OHPDg3Q+5TLzCeAv6qDUhwnCgg0UcwFHu4yi61?=
 =?Windows-1252?Q?Pt+TmmekcaF+GELQOi7NTzXA2Nqipod44SxM4AOReu3sakjSJODRHjxA?=
 =?Windows-1252?Q?Bc76oc6tKWZo31KOUNy+Bghcv2tD+5WX/s8J5PLjOHPG6Irds22R2Mpw?=
 =?Windows-1252?Q?yu4N+ZIWOSgD058C6Q0+rg2hbbS0ZnaIEJk0gd1zKn2JOJicA5z6i1ks?=
 =?Windows-1252?Q?UHB3dDS0EkCS5j7AZxJXZBHVrjDV3quiogOaYavNGBoT8wZMhyrnnGFD?=
 =?Windows-1252?Q?PH9g6ZuubXn6sB5tjcIRqziA+l3CUdIYGgRDhYlncdUZuaS94HqgmJ1u?=
 =?Windows-1252?Q?6h8Y2EDyWpR3I16zsbVKp6Vu1B4Ecx4n/qJBRvt1lbOYxyU6VrVbKddh?=
 =?Windows-1252?Q?baS0Nv6LGo/3FO7rrztlFnKsjNAHHMuLYzfm3HIrkrji9hW/CUB83M1+?=
 =?Windows-1252?Q?osIC9K4ARrlYFuDXvCllFY9g02WdKpJD/RCxXDWvzxry/oDVi1tNFY3J?=
 =?Windows-1252?Q?nmR5zBBDsiMQ5hxbyUZs6XSs3DZXuQhDunVuVG5zoiMh5tSC+CPi+ai7?=
 =?Windows-1252?Q?ThydAcEi77rIu4T4aJ7Miu7dyyZWB11FJ5wt05tMYwjFaMBxc2W5ZLnQ?=
 =?Windows-1252?Q?kz7qZ5N8PkmtpPlRObjp4Imb0RYpAu+36bxqcMVsIDjwM62E0Xz1usiX?=
 =?Windows-1252?Q?rz1b5FTwNhEukZWhpdUTptdRrwT2xHMce1fTCF+ZsSJBJIo2NEvj1MVp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d688b1-7a3e-4976-f2fe-08d916083537
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 12:11:16.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHNGXi6BTpgOq9jj6gqCTDLvV9zPZoKBRBSc4vegU0fGV7eUcg3KjuAFFwPb9pMyWvhLcB/krUBPoveJ8LID305ICkjWcnZ0rWdeH8s/x9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 13/05/2021 11:24, Olaf Hering wrote:
> Recent pvops dom0 kernels fail to boot on this particular ProLiant BL465c=
 G5 box.
> It happens to work with every Xen and a 4.4 based sle12sp3 kernel, but fa=
ils with every Xen and a 4.12 based sle12sp4 (and every newer) kernel.
>
> Any idea what is going on?
>
> ....
> (XEN) Freed 256kB init memory.
> (XEN) mm.c:1758:d0 Bad L1 flags 800000
> (XEN) traps.c:458:d0 Unhandled invalid opcode fault/trap [#6] on VCPU 0 [=
ec=3D0000]
> (XEN) domain_crash_sync called from entry.S: fault at ffff82d08022a2a0 cr=
eate_bounce_frame+0x133/0x143
> (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> (XEN) ----[ Xen-4.4.20170405T152638.6bf0560e12-9.xen44  x86_64  debug=3Dy=
  Not tainted ]----
> ....
>
> ....
> (XEN) Freed 656kB init memory
> (XEN) mm.c:2165:d0v0 Bad L1 flags 800000
> (XEN) d0v0 Unhandled invalid opcode fault/trap [#6, ec=3Dffffffff]
> (XEN) domain_crash_sync called from entry.S: fault at ffff82d04031a016 x8=
6_64/entry.S#create_bounce_frame+0x15d/0x177
> (XEN) Domain 0 (vcpu#0) crashed on cpu#5:
> (XEN) ----[ Xen-4.15.20210504T145803.280d472f4f-6.xen415  x86_64  debug=
=3Dy  Not tainted ]----
> ....
>
> I can probably cycle through all kernels between 4.4 and 4.12 to see wher=
e it broke.

"Unhandled invalid opcode fault/trap" is "Xen tried to raise #UD with
the guest, and it hasn't set up a handler yet".=A0 The Bad L1 flags
earlier means there was an attempted edit to a pagetable which was
rejected by Xen.

These two things aren't obviously related by a single action in Xen, so
I expect the pagetable modification failed, and the guest fell into a
bad error path.


If I'm counting bits correctly, that is Xen rejecting the use of the NX
bit, which is suspicious.=A0 Do you have the full Xen boot log on this
box?=A0 I wonder if we've some problem clobbing the XD-disable bit.

~Andrew


