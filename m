Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27552C2A98
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 16:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36521.68455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZoj-0001dj-Va; Tue, 24 Nov 2020 15:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36521.68455; Tue, 24 Nov 2020 15:01:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZoj-0001dK-SR; Tue, 24 Nov 2020 15:01:17 +0000
Received: by outflank-mailman (input) for mailman id 36521;
 Tue, 24 Nov 2020 15:01:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khZoj-0001dC-4s
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:01:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba056cdb-20b9-4923-bbb6-7ce87b54adcc;
 Tue, 24 Nov 2020 15:01:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khZoj-0001dC-4s
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:01:17 +0000
X-Inumbo-ID: ba056cdb-20b9-4923-bbb6-7ce87b54adcc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ba056cdb-20b9-4923-bbb6-7ce87b54adcc;
	Tue, 24 Nov 2020 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606230076;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2a4yB+JfMHRId1QIG1O6Wp1JAcjZWl3my9baKUr6mD0=;
  b=ZY2dTTB5YQVH89asG7KE2x0fpuSVkt02pQBylRrvsIsnibjRzkS34+T7
   lEa0nlzywOxaFmLyK3/y0hM1QC6sKVUu/y6ygBiADg5fyi7FipAu48mBf
   f38aH9cpWgjnhzxAR3eKLb7KfY+vroZqZAS7Q8ppqbt7T1i3dpWJFVDS9
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0+zTNiXaxA6UmK/n0vLjTgDDhQHg0qMFyVcqLrxH+mg7et2c3VagyDLSmCDZhBuhxdcmz70aAn
 aRlLruF+BKfo3OzVLPLhpg/ft7Vpgs+o+VuNvq1ZLPqOJwEhHUKfhZcDRCsfoov1JPzna384FJ
 gpNkwOA8iDz85nlhJ98fqYnEE2J6xV/ibPVd5FwGRCVdCAuVINdOxiycuJcj/p7YSUWyj6ZH36
 m/G5UiO2J7lLCJ3szubnMi9d1tErUAyRUMVM+hwo2Gw5EnKAgf+KYyzef0OtReR95ABm2wxeZL
 YQM=
X-SBRS: None
X-MesageID: 31836550
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,366,1599537600"; 
   d="scan'208";a="31836550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgcCnr2e9oTWw/wOq6NbieldQbs0lhPQqMR/sOg1lqPeFv43hHOyq1sXBkY5bQ47KtcUeTdFRe3KO7xcP2ab8HaJPjU6prVwJZgFZsTM6F66cc5vLXw25Apx7R8/QoQIP27u1egq8pi5BAvXU0+POBWf3vRIT9Qa2ZsB8F6ncL2xlMYVrfDi2U/U/ld8oktPPRF9NtRkk/SmZXdUGhgZwez6b2/cGSI1X2YF8/s44QQ1xIskl+3VD9/ZnBFj5ty0jYGDJYdVQra+7/XR0zKPnYOAke4YzNwnht/Ve32ftbyxVqseUvuM1zvjBrpqoRj4EIi1rpbnd7jn34h5Z0CEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzxjoM+xOpXp0iwVrOM2L/2HGB1E0f48N6Hvv43dKv0=;
 b=OP9F4tLj7TGzUpEvkvDR23oODkG4j4rpasE8cD4M5h4skTfSyAxvflCYWe2jfl5tT09YKUCerWsvLsLEYumuk4wkiTW2RQhTyqqWmwrX5CaA+Due7RKedMNGPZC1u8Rs1n/LgP0SP9EbO1QcCm8m/DmF3k1l3exZxDHFvDUpQH7/9Hwl4RX0PfajT5SgkpQcJcMD61+FhPCPXtY1BuW/cTV8QHdkSC22/X8+9D0H4Vxl/QGvqb5ywkBYzpXqrKePAIVnEprZEsjVlcBMG2NMwHAnltDGkkWR9xMd++keUEtfaVIl1FdNfuLKEDaC/qS1hTD7Y9dRBE8Rl9IAWQcAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzxjoM+xOpXp0iwVrOM2L/2HGB1E0f48N6Hvv43dKv0=;
 b=DfKgcPmyDtps4AP6gPC+IRMaktqOtGpDwAYYDpZhW6OE0mJ4uecfEHvktHjnC7wguE0fGyKFJ/jkCIQe3mOeV6Tr0ottgWyhZ0Ef/dofOr9Mt/igbUcvn+Ax1pzQIh2HSYdR3pqwFnIGD5uIuDO2Z+c09kJb8bOA434SmXJv0Ac=
Date: Tue, 24 Nov 2020 16:00:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124150038.q6tcolqcbvws55eh@Air-de-Roger>
References: <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
X-ClientProxiedBy: LNXP265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb573b7-2865-41d7-ee41-08d89089b6fb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4139:
X-Microsoft-Antispam-PRVS: <DM6PR03MB41399ECD6E64DF135A73F1BD8FFB0@DM6PR03MB4139.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjcFYKJyDKy0XMxRDV4ph9U83OKoNAl8r45xIlQeJlaaxQahipr/COwlDEJ36D59rn6VZPwB7GY/8zODNkLPoYXRqid/sizjQMUOJyb3Mu0bBw+4jlLRabqvhgkn8auktwXBTsOknm1ns3y7Ht5cJzOGhqwa6e7Xr8IWffUE13rkrPPQBNVhzA/DI0reWRwEf6h4LSp3YLDfm807yusRfFPIAYsUKY8WIgJxMqfm+UsuymFdy158Ane3yhYUmoO13AXptCEsQWEqgMDqEDYstaR1TqBI6ICJJvUQ0y1SyAQMO+J1nTv6UNnHbW4V643XDE6nSBVxaTXn7V5FqAIiUfWOCAyYeXIJvS9qychhTWmuILpdjNEo0wr4wmNvC3C/58HdHWIQNrSdCMRAaDBE6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(316002)(186003)(16526019)(8936002)(4326008)(8676002)(9686003)(6916009)(6486002)(33716001)(6496006)(26005)(478600001)(966005)(53546011)(6666004)(5660300002)(85182001)(66476007)(2906002)(956004)(86362001)(1076003)(66946007)(4744005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SFoXVeGX+c2CJuJVpzv7mxBD/1xe/Yxlgzgqp8htU1072lcPnledHHjjD3vXfRhaOtZuL8xftLH4PbrKJpsPM3bBYin9odm9cdqle5KnxhW1g+v8zKM8AQtgbyoFpCzRevTyzXVBRo2LUOMmvL/YzA4VNUi5v5t4sNRuepqey/bR5HMMsjLb8CBqF/KlIWuSuGbtCf/vmXCLQJgnruqPFNawyzHt75O9M4uyDb6/QsV5WRGMP+Z40rUP+BU1E789oki1iihlpiHBwq9u3njBJWPsz2JHVPzJzLau6tLPpKG9HQDevN6Q2AQxv2/R2mhKJjbQtb1utDuODhj5fZozF+r+ONu3G7YLdeFT3w2lm6kV6B46tRmPvqXTJ/w5PguvJFlKVgWeyEDYUNaqXA4M28feE+iqGicBfHkDpr+RN2h6A6SXnMKTYB5iUhYUEk980qg2FQBRbvj4hEM8ZZdi/H43lRIrQOT1tzPOESrxniVpCijrtPqOn/DD71/JgOaK1MA/qSCtwjEoeqLdgPS+43McIRVxtC8zxkl4cfrlQJnjrBTc+RcrOaR/Tll11p/rnPwTHf8caAYBfbx/xedeebCPDc2RmKr0N18BGq2rY4/o22H4whd/Xg2RXiXzAIvinMJuT3kEA8t5/ULpZnldhsxoxFa7VD3LZqUf63NbELbwKabmk4U8yIeWb9QdEakDDwJCIx9T/sVs3L4C7mqaF1LPhpCwJVMb30MToHw3yICjYCXLsMOHM4m/uSfMNuQkGBz2FjFvx8eQqPqMfeGv3r/uTurRRH2Zm1YPgy9VzrpQHyxctZvbraZBpA9TGN5j7KR9r0PMF0k34X/ox/wlHRDdVK9eE2074wjWDw02+VVqfqxncl5OzkX+XEm1X76Vylle8SHAb7ccvUsbJe+ZeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb573b7-2865-41d7-ee41-08d89089b6fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 15:00:42.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIK7Y6NJvPRT0Dnyf9w/J2AL2/xyALw6xde6qWb/sQqgMyXd7vK10y1vbERUam0hvvDG8w260xgEff6IKDxjVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4139
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 03:52:25PM +0100, Jan Beulich wrote:
> On 24.11.2020 15:27, Manuel Bouyer wrote:
> > new log at
> > http://www-soc.lip6.fr/~bouyer/xen-log7.txt
> > 
> > this one ends up in a panic, I hope you'll find what you expect here.
> 
> Did you actually, just to have the data point, ever try to disable
> interrupt remapping ("iommu=no-intremap")? For PVH we can't ask you
> to turn of the IOMMU as a whole, but aiui interrupt remapping is
> not a strict prereq. (I'm sure Roger will correct me if I'm wrong.)

No, interrupt remapping is not required for PVH dom0. I was actually
going to ask the same, albeit I'm not sure it will make a difference.

Roger.

