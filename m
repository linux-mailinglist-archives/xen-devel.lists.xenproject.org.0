Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576A433576
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213101.371218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnvD-00019E-IQ; Tue, 19 Oct 2021 12:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213101.371218; Tue, 19 Oct 2021 12:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnvD-00017P-DJ; Tue, 19 Oct 2021 12:08:47 +0000
Received: by outflank-mailman (input) for mailman id 213101;
 Tue, 19 Oct 2021 12:08:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcnvB-00017J-MN
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:08:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4db01dc9-30d5-11ec-8310-12813bfff9fa;
 Tue, 19 Oct 2021 12:08:44 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-fnd0jdfXN36dk8QnpRl3nw-1; Tue, 19 Oct 2021 14:08:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 12:08:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:08:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 12:08:40 +0000
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
X-Inumbo-ID: 4db01dc9-30d5-11ec-8310-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634645323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvTy3qpsmaWkToaIQ87YCa1q9h6yaExDR4g721/Z+Qo=;
	b=aPwIoku0lueb6TLCJxhmPn5/STXi5qh2Gq9gjIpuuZzo7peGumKQx+WxBnxqEeEyLtG8xw
	o1SHj+GYVLOueEzHdtZ5En5IBQKpiI4eBs1aEL86aUEaS6t2VvbCLGuPob8KLl5r6APlg4
	yrfa7s46zUvt1Glap/AmI9Gd5ix7j6U=
X-MC-Unique: fnd0jdfXN36dk8QnpRl3nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3tKPMadIpgwYskPYlpHv6HCEWmjYYppeA/uOs66YZA5LdsK8Vfo0oASSpzPCrlF+LkLkOK37A1564VclX9Mmjrg8MkbT4Kj5TOF0gftuoLwXDMXQePlPNm4rjoDUoeuywyoLK/fjjJVeBfeR2SDqUXSKIZZ7EHdektoQUcn2h0c2fArXFtuDwt0kf5M8BaHKxXC542Mx43HWMx4cFiHOLzPE3PUgRNm6lUz9CTmt3yD/wwTcemAkvjLzL413EjX5+hD82f6Tpi7ENJj7wmbOW9zeyKZV8Ym4cXxE4Dq3gw39JoJ/xIAHypyUjSVj1603ydqL5LaVpw2kF2/LgRIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCdjDF8YVZif6oyeX01pU0Njxv+3yqCRWQgr37al+KY=;
 b=mHW1f8HzhAORCKG+BD0awCdV5nxo+x0/Q1LR5mQj5ZxLb5MrcmagnFxvT9HU5RxNH3vw42ywKqRVq0DLleWttSMuEShHjDNSzYLx0y5ChlADkj1fBY41alCyEeHoQ8uilQ7EBp1OG5UqcLaJVjKd7v2jhkWbLMl773kAei+BQamENAQixAxibzmUir+lyc/Os4j+164mOBpsG8Mo4Y0OMRwwT4XK++YZ9XHZ6Lf7BRW0m1WLR8bO8Jpf0CzHmeXrj6LwuKiLOtA4z1H0y1lPnBpBb9ncNeq/SGEAFM0Yixt+2pyoMJIcDFwh7K4mObv5dkaHdX0EnyOXgGpT8Y0N+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] x86/hpet: Use another crystalball to evaluate HPET
 usability
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
 <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
 <YW6sSXMyC6t4fB62@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a366ebf-61ed-7e41-193e-131540e555e4@suse.com>
Date: Tue, 19 Oct 2021 14:08:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW6sSXMyC6t4fB62@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d600918-0575-46fa-4f28-08d992f93076
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4846CC03418F920FDB2CFA02B3BD9@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0von/rjG1JvY7YWQiiGe2rmCtf7gQ1/NBgK5fsok8NiJfjbORnJScRek+puazzGbX5NuKwjhClvh9TWFQt/M3aFhTg0sVSgLtLRleFnq/eHkIB81sD1Dksgac5X8fg0UxOEyVq5TZiA5siqFhuIk7ikdhT7nYi5h+JTgDEsWohkPv0+jBAlxRAh4XhhVMiOTTpASGorF+sUB/dkebVWLZa09A16He22MiANPkA19dBGAO6FuJ5+2p87uWnspw+1JSL12/wVYO1q54XRayPX4M+B9Z/0bRV92MMq9D6f4AhM5PdB22WZnviUz+gyy3BOOBN62FqxxinE4g2pJFVzadsEAkoCPvprf2jcOoB8O3cth+vqBTcGYowpBHtkuhetuxbO2moRSqBPx5wYXbBh20CxOPxnIyhaflQVdqxETQrkdpPeoE691zFz+Yxod4ALMWkq+BgbkYh/s4pYCtZ0mBgkcWIQpebXKKDPBYCA+G9EumloqNQEhkmQ2UxBjCo51nNrU5OwUTTFokF0JQVUVbwar66/i77xFz16uSvIAwBrDnsD4WQ0ZHeNB14qHR3SSujVZSSZhkruFUVT5wAgx2DGnP37DXg2+BQELkYkulmyz2k/ojgb/cK2JnJCwG+SJWzKK4sMtCvy5JCi0F9yzIiL3Rkk/qArnICgv3xgZ00U1b2wa/D4im8o7WTuVZodrTWEAslmyewzqsnvPF3KQyz0fJcCZcppZmqLCScYX/mngIqGBIJAIwT0gfsblI/8+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(8676002)(26005)(66946007)(66476007)(66556008)(38100700002)(8936002)(186003)(6916009)(316002)(2906002)(16576012)(31686004)(6486002)(54906003)(36756003)(956004)(2616005)(31696002)(508600001)(86362001)(4326008)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GO/PJJFXRk5eV9J78GZITnN5w+r7qDuaWiD7pR/p1IPsQ6u0WYI4Ge9qnA/k?=
 =?us-ascii?Q?Ml2BDDA93nu3xU0/5rvEntt1MM+agnIzG52KmQ0r6Kftc7W7zphUP0OJTLTS?=
 =?us-ascii?Q?YrkWvoq9allLhR0e5UfNE/pYgeJ7nbqgJCg+/1HqYm5b8NpiJEf6sHYyWnyS?=
 =?us-ascii?Q?Y0kw/2Hx5tOfQeyV4U4xw/t6z54z0/vtbNiS5Ie9hu2hHipvw/5Ahq9GJRUm?=
 =?us-ascii?Q?c7preyKi0Smn0HgH4tNWBQA6aUFOySCTzA8f2ebYbcsvolTzvolTZaaDD6cO?=
 =?us-ascii?Q?TAxtigsK2uNN+yRLzjMHhrURgfLIp67lzFvL98NG8mH6IbWWsy6HG7x2MgfX?=
 =?us-ascii?Q?duCeQrn2rEOLRYJ+rVx7xvyLP+CMmQNFO0SDXGuEXBmBBWH67JEgJEmkE7iP?=
 =?us-ascii?Q?OpOhbiJ83jMeWKxr8EvTwwJqBQTMvMvwhaUWnLm0CCeYBf2558zdYSBeNtrX?=
 =?us-ascii?Q?CUjVGU0pFGZYmYdL1k1C7WRL1+tXDB78OU6NSJVUKd3dyBv9eKQbXU09Bixo?=
 =?us-ascii?Q?3ilwuQq+AEQ18ZEURt8wtXcdE76sYUF4qN1njpoMagGOE3Tm/eZeHmNumzum?=
 =?us-ascii?Q?GLaweKak0PZa1gWTTACkCA5SQU2JLdhjr537j+qQz7qKc29j1481pHf6vGMf?=
 =?us-ascii?Q?E/qqG6tOxpXU3gebrFPSaGdUWdXJs5TJaZ3HP7/e8AKk6pLmgmxG4vuDTFEY?=
 =?us-ascii?Q?VpgWsDQn4jqiQzilP2pgdrbxaFdSGI+kevVc9iCETg2/W93PQkbhTJfKmk+s?=
 =?us-ascii?Q?53pep09Q0aqO8QXzzYiCKoT2gXs3Ol02T+Z32rE+muGMEdsVk+B7Y/cGNrik?=
 =?us-ascii?Q?iWwcNpcw8cqC6ESSaqXCqcLLKgOR4UY6JwIwYtR7WYUY2/YKDBAmZIiJMh04?=
 =?us-ascii?Q?5AbezLM36SIMx/MEmBoHEQGHY7VN0o7vGBVWw8MOg9hrbz28TxHitH4SXKP/?=
 =?us-ascii?Q?qJjq9S/4qdmAtT5UcLfEiJFrkftNfENtwQtJgZIO/CUtwinB3f10lWFS9tir?=
 =?us-ascii?Q?CiHzvPsvObOpABw3bs8RhKwJTejZFuJ4DS0UmD5dkt4Hr87mAqM9pDMXrCI/?=
 =?us-ascii?Q?t2nRQaLB0n0IOmvDv4BD7Ovt7w1LN07x/fqP+wCMtyllHUaDnxKU08pgdvZQ?=
 =?us-ascii?Q?gCDDQ3OhCg1hcKvWrVRKA5znzcM2jV1WnF7y7w/eu405PzrFwRYUOt1YWg2w?=
 =?us-ascii?Q?45Lfd+Fcx4OygH2otJioo2f0vWUp+3qEbBqyC7YhrITHDcfutu1FLMoMs2Vh?=
 =?us-ascii?Q?MzR+k12tJUecU7mMzSUX+DywzPz7KCvogUPsprHn4Lqf9BwoBtVgM044vK8v?=
 =?us-ascii?Q?oAcUqlbv3sJAtUEXjiRffIQ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d600918-0575-46fa-4f28-08d992f93076
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:08:40.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILslAFjNyN7K48W++70PcAe1n72zuRjg+S/+5pZ6NuI15B9mM1pgOdgtc9oRN7RaeQBULHLFMbEYryadcShqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 19.10.2021 13:30, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 09:07:39AM +0200, Jan Beulich wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>>
>> On recent Intel systems the HPET stops working when the system reaches P=
C10
>> idle state.
>>
>> The approach of adding PCI ids to the early quirks to disable HPET on
>> these systems is a whack a mole game which makes no sense.
>>
>> Check for PC10 instead and force disable HPET if supported. The check is
>> overbroad as it does not take ACPI, mwait-idle enablement and command
>> line parameters into account. That's fine as long as there is at least
>> PMTIMER available to calibrate the TSC frequency. The decision can be
>> overruled by adding "clocksource=3Dhpet" on the Xen command line.
>>
>> Remove the related PCI quirks for affected Coffee Lake systems as they
>> are not longer required. That should also cover all other systems, i.e.
>> Ice Lake, Tiger Lake, and newer generations, which are most likely
>> affected by this as well.
>>
>> Fixes: Yet another hardware trainwreck
>> Reported-by: Jakub Kicinski <kuba@kernel.org>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> [Linux commit: 6e3cd95234dc1eda488f4f487c281bac8fef4d9b]
>>
>> I have to admit that the purpose of checking CPUID5_ECX_INTERRUPT_BREAK
>> is unclear to me, but I didn't want to diverge in technical aspects from
>> the Linux commit.
>>
>> In mwait_pc10_supported(), besides some cosmetic adjustments, avoid UB
>> from shifting left a signed 4-bit constant by 28 bits.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> @@ -395,14 +396,43 @@ static int64_t __init init_hpet(struct p
>>              }
>> =20
>>          /*
>> -         * Some Coffee Lake platforms have a skewed HPET timer once the=
 SoCs
>> -         * entered PC10.
>> +         * Some Coffee Lake and later platforms have a skewed HPET time=
r once
>> +         * they entered PC10.
>> +         *
>> +         * Check whether the system supports PC10. If so force disable =
HPET as
>> +         * that stops counting in PC10. This check is overbroad as it d=
oes not
>> +         * take any of the following into account:
>> +         *
>> +         *	- ACPI tables
>> +         *	- Enablement of mwait-idle
>> +         *	- Command line arguments which limit mwait-idle C-state supp=
ort
>> +         *
>> +         * That's perfectly fine. HPET is a piece of hardware designed =
by
>> +         * committee and the only reasons why it is still in use on mod=
ern
>> +         * systems is the fact that it is impossible to reliably query =
TSC and
>> +         * CPU frequency via CPUID or firmware.
>> +         *
>> +         * If HPET is functional it is useful for calibrating TSC, but =
this can
>> +         * be done via PMTIMER as well which seems to be the last remai=
ning
>> +         * timer on X86/INTEL platforms that has not been completely wr=
eckaged
>> +         * by feature creep.
>> +         *
>> +         * In theory HPET support should be removed altogether, but the=
re are
>> +         * older systems out there which depend on it because TSC and A=
PIC timer
>> +         * are dysfunctional in deeper C-states.
>>           */
>> -        if ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
>> -                             PCI_VENDOR_ID) =3D=3D PCI_VENDOR_ID_INTEL =
&&
>> -             pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
>> -                             PCI_DEVICE_ID) =3D=3D 0x3ec4 )
>> -            hpet_address =3D 0;
>> +        if ( mwait_pc10_supported() )
>> +        {
>> +            uint64_t pcfg;
>> +
>> +            rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
>> +            if ( (pcfg & 0xf) < 8 )
>> +                /* nothing */;
>> +            else if ( !strcmp(opt_clocksource, pts->id) )
>> +                printk("HPET use requested via command line, but dysfun=
ctional in PC10\n");
>> +            else
>> +                hpet_address =3D 0;
>=20
> Should we print a message that HPET is being disabled?

There is one, and it was even visible in patch context that you
did strip from your reply:

         if ( !hpet_address )
             printk("Disabling HPET for being unreliable\n");

Jan


