Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573750C012
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 21:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311193.528290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyXH-0003sm-4C; Fri, 22 Apr 2022 19:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311193.528290; Fri, 22 Apr 2022 19:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyXH-0003qw-1B; Fri, 22 Apr 2022 19:01:43 +0000
Received: by outflank-mailman (input) for mailman id 311193;
 Fri, 22 Apr 2022 19:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhyXF-0003qq-A9
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 19:01:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2fe9fd9-c26e-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 21:01:39 +0200 (CEST)
Received: from mail-dm6nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 15:01:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL0PR03MB4148.namprd03.prod.outlook.com (2603:10b6:208:65::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 19:01:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 19:01:34 +0000
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
X-Inumbo-ID: a2fe9fd9-c26e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650654099;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IlQGvV+muFMVKgvw9h8yPUKC3o/hjcUSdtxGSXtmxnU=;
  b=Zc+NlsdDRTnbNmyMxqQldWka7PLBUGAglElLzIgMnQ1a2IMdWTS5fbSh
   Qu7FJoYqXGt6U8wdkbG3wM6viaelbbHzwkl8UqRqz5Qm7hraby204T0sO
   8Tcj9BoIYyTOw7L/cErzbaLnv7CpWBbuOnmcYxD6pVsrmDVJt2aD5Pj2c
   o=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 70134481
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0RVv3qi/uy/q1nWu3k5DnG4NX161lxEKZh0ujC45NGQN5FlHY01je
 htvD2iDO/eLNmSnedB1O4Sz8h8D6J7RmNYyQFA4/is2ESMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nX4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YS0qAar3vqMQaThJCi1kZpVh3OTlMHfq5KR/z2WeG5ft69NHKRlqeKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuoQegGpYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvujOPkFwouFTrGMXHR9yDRsZ6onazh
 k399WunWQoLGMPKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZtvgWxy1plaUsxhaXMBfe8Uw5RuR0KPS70CcD3IdUz9aQNU8sYk9QjlC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcbSSMV7t+lp5s85jrXR8tnOL64iJvyAz6Y6
 yCHqm0yiqseieYP1r6n5hbXjjS0vJ/LQwUpoALNUQqN7AxjY5W+T5e18lWd5vFFRLt1VXGEt
 XkA3sSbsuYHCMndkDTXGLlQWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4ctC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:oDfttq1Brw1mLOuHzy6ddQqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="70134481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuSESmM8Lgu2cpqeF+iQZ/5S8ptM65FcHmHsc9EC9Wf84FUjiTgUpgi53n0lo0QVUeKulQ7TyF73udJa41ythmI9M7g3bQPewacyvehGlC8YTaL20Vgsu9nQWxGhgmRiJHQekjPX8GliTARe314D00sFfgo522DGRpD5kNcTwiKMgB0Vke49OkVQ+TInW2c/8CJbtPe228SkZY7zmr2sntX1VUecLLbCOhWEvANWxhlOpY82mBjFNP6UqxWSLB2OpWU+wlZXtmv8CtFh0Qemb80YLZ3hqjD0n0H/+LlptvakQjaepeLroG66ex9NJvcspdIt74YaS7AMcy7e3iLvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlQGvV+muFMVKgvw9h8yPUKC3o/hjcUSdtxGSXtmxnU=;
 b=WfIvIdBySTE3rr9uE0lyE2HfzKuwT0YDhZau2rxSGz9dy/B4p50I7hjeLnP1pRYq7owqImmiYQM+jo1tTbqQbEYcj/HzRZXs9j39Y3gkiGIDvvmf7tiOh2oVNIDeS82um46jl1m6WG5Hpl1HkpCPZXU3U8d147vn4djVu/PVDfOt+HG/4T2eQodxMG/EfQm7TPMVq8Aiht0aHbmeXKdv+MmQG1IdjMYTYFnBU3garHjkA3hxff+ozv+hrV1bOl+yZnGMfzUSGh1MfxiTPB2tP9H2/TCr+lPLGUWCuvos5RHZncJRhx6aGkk9QSuYyeDoaz4+VYitCI79JpRZ8GccfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlQGvV+muFMVKgvw9h8yPUKC3o/hjcUSdtxGSXtmxnU=;
 b=bXJIClcRrQwHHND6JH3a+uzbC9TnGoSbKU8aPdmTOvHSqYJz1N55T1RcQu6c6Zw5LBIhVWJNl8wk98c/YMD5XwfosCm1R/7RYJWmmcNZak8FFMOiHOlt+mvNRd6bIXQHScDErFbVWQGnlo9sCih/f2qbG8RGNxGBVvKGsujtn/o=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Topic: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Index:
 AQHYVHuOvzYJLKPprEuLadRqUVZq9az4UhqAgAAC1gCAAAFpgIACUHUAgADgBQCAAMb5gA==
Date: Fri, 22 Apr 2022 19:01:33 +0000
Message-ID: <a39c8975-b331-8d3b-a09d-688a91fa8fb1@citrix.com>
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
 <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
 <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
 <a83fc8db-f8c0-5a17-a668-1a00cb1fdc2a@suse.com>
In-Reply-To: <a83fc8db-f8c0-5a17-a668-1a00cb1fdc2a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 713d76f1-d8a1-4a5c-d39c-08da249284dc
x-ms-traffictypediagnostic: BL0PR03MB4148:EE_
x-microsoft-antispam-prvs:
 <BL0PR03MB414845C9BC7DD8A1D5753206BAF79@BL0PR03MB4148.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FNrd9XI0TSAFMJCPWNC9lgKeIiJWLcdXynhvi7t/3oZ9DLkycJssiJdugIVslEx+/x6ktqbvKLH+QMoYS24D3YceaHr6ViulUWBlhNvdL4+uBPky9Tx5HDmjBuacfQNLWr1bCPpkE2m0arwIMVOUBniR0kbBp8jAaP9UWTtre9dHgSyagPo9RCTLXdiHsXILquEH/0eeHdg/8YMPUY1KYHSyRcusdi8BzU/6hLMfHzQE+/hY3sM1TwVEQmkywPpQxJ6LX3Uvm3W5lGzPAKYKDykhq2uxv3L9rpgO7BTNSWt+F8DuayhVO3giIbJGMmLQcnVTUHrBYgyMIyaGlBra2aUMqAM/mICBNxuWDOk1NrK13twOji7KGqHhIVWN5OP4kj6w+dQkE2UTenH2H9yZ69xpBpWDnhFT38liQ/SHMrOsrHRG/J/0HMZFZniO9eZ7vFCW+aHnA1Oe0S9ZLABJ++Vmh/PQH1Lh27WfxtBjpApRaL+wU5sLXVC1JRhYYUQsM1I+36cuD3VhlXl9PrAoPy2tdxObSll0V1TH0yDEHvVBfEeagN3SoPmJT4wX81QQfAu2u0i1ZDsAFDaF26XhP8vuahQ6yCQAdi1CZ/TKFbiGnnnDLdkIrlSSgJn59YSL3Ql6Y0H18V9KLq6nWtJQMeBlZie8SdOX6oTQx/ig8OcMTYbIpCSJy7dAQlJMfKT3MvaNB1YOp6L60tSIYiVUgH5kenluv9F58819xgwh5ndMhdt4XKQvbgfCRkgUYCTIDqOwo+sSlCoCtUR6RdurLQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(82960400001)(64756008)(8676002)(66476007)(8936002)(91956017)(5660300002)(66446008)(4326008)(38070700005)(38100700002)(122000001)(6486002)(71200400001)(508600001)(6506007)(31686004)(53546011)(6512007)(26005)(36756003)(76116006)(186003)(83380400001)(86362001)(31696002)(316002)(54906003)(2906002)(2616005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emd0ckFpSVE1MGtPcEdxYU1UVUJPQmdtS1EvUnQvSVpoQk5iQlNZQVBVWUFq?=
 =?utf-8?B?QzliM3ZTZWpYVm9ZQTVpeDFPMjFUTmRNZCtKUzVrOEtWeHNOVm1ncXozcExo?=
 =?utf-8?B?UnFYTjNvakJsNWY4WjNDbEdyWXFOcGpYa0ZQeExqeVZvYWZ0YS9ybkdaK21n?=
 =?utf-8?B?eU5nQmxYMHZKRzhWczUxSUJ6dndFc3JwUHdxRm1QTURDSkJ0a1VuMG90aUhh?=
 =?utf-8?B?dUZjY3hKS3VTN3dtQS90cWVpbkxvWklxM0xld2dYaHJzWjdEL2x1akJnZkJm?=
 =?utf-8?B?TkRINUJ1aEc0azlQcVlJdDJKc1NtczhEY3FPem9BYjVJWWFITDlxVWs4dlpq?=
 =?utf-8?B?NUxGZXhJemVtQmt4aDRXWHZCeDRycnNmSGd3T1VyUTFhdFlTRkhwME1LWnRP?=
 =?utf-8?B?akRQY2lzYzVwSVAxR2NaTDFyZEpRYjF4WDQrbHdsMGtuWGNHelBmUzR3a09N?=
 =?utf-8?B?Q0FHRVJ5QVljMDUxeEdsMThXQm9TUXdFYllhV1hHWkFlWUJtYmQrVTNzeVEv?=
 =?utf-8?B?b05yaTBnK2IvN3JEV1FZeDVVRXZKLzR6bXBKT3RhczY0UGtUbXh1Z3VQUkhu?=
 =?utf-8?B?VThZeVB6eHFoRFJmN0d1cS9mQ29ralo4UlJCQks3aFljeWw2WHhwbGdTNnBs?=
 =?utf-8?B?L3dIZEZlOFRZNWFscW5pSUppc2pBMFJ1NVFud0NQS0EybkVzeDVEdU9QbHVs?=
 =?utf-8?B?QXBZSktOdVZlYVpWNENJeXVJYVkwVkN4eXhZVXFuakNDVFRadlgxMnNScUVy?=
 =?utf-8?B?cjR4UHdSU2lIQUV1V0o1czdvd2g1NmE4RU9UcGNqYnM0c1k2QURaU2xLQUFC?=
 =?utf-8?B?WE1heWwzNi80cUVmdDFueW1JbTNEeXVBTmQxbGcwSVh0WFlPa3hJVElIUVVm?=
 =?utf-8?B?VEY5YkhrNFJGR0ZHeThvT3NsdTFGTVlkZzRnRytzMU1tZHRBaTQ4a1RnaEYz?=
 =?utf-8?B?V1FiK1QvcUIyKzFYWlBPS2FUTkJjZWZpLzNCKzdteTdJZFNjTTRGaWluanBE?=
 =?utf-8?B?VzljWHN4QjBsUTY3clhGMk5yRlRIay9PYm5zRjh6ZGY0VmV4Q0JxRVBlOHdS?=
 =?utf-8?B?aXM4cXJSUnZPVjQ4Rjh0WnVOZitaQVAxUXhSWmdlRDVERnhSaGdNOVdaT2hv?=
 =?utf-8?B?NE1oSkV3NE5UZ05vMVVYcUFkZ1FlR3Y4NDBkN2VvK1orWkw0eG0ybFZjZDR2?=
 =?utf-8?B?SW8wRTExdnYzNjlkYlYvN0lYRHlzRGU0MFBTblZvaVROYnlVRFFCQ2w5czJJ?=
 =?utf-8?B?bmtuc2t2VHowa05HbUp1TDU4ckJCNHQrNE1rUklNQjVHZ2tXQ0t1akQ1Y2hU?=
 =?utf-8?B?czZRa1BMODQ0cmpDZmIrWmZZOERzR0xnOG41SHExWWRrUkZScDgrdE9TUUJm?=
 =?utf-8?B?eEFsaTU4aFFXV0lIbjVKTWhOZFhKVVNVVzl2OTA0OEM4ZU9raHd0bUxIOFJo?=
 =?utf-8?B?NFQ5QU9wLzA5SHBBVlA0bTlhZWd4ek9zSkJ2aFVXTzJ5NjlpK0tmZ2ljd0xI?=
 =?utf-8?B?Q0pENk54bCtLaW82VlRrVytjU2hZNUdDK2M3NDQzSHJvUzhoUWVnT3U0WkxT?=
 =?utf-8?B?MXlmQnR3V0ZTeGRiRDdQekc3R0JuQ3h4dVRETlFncEVPUk9ESEdLVXM1ZHZa?=
 =?utf-8?B?bVBiMXZmbW9GdE1Wbk4yTVdITzVFM1pEdnhRODllQlpieXlKaSsvdk05bjRI?=
 =?utf-8?B?cyttQzd6RmV0dnJEOStOR3h5WGhNTnJvVjJnV0s4TEM4NUpiYWxhaXN5ZWxp?=
 =?utf-8?B?bVhYb213STJrOXlDVi9YQUp1TkVXTTNveWlFTUNGUXQ5QS9MUGpTTE5ZTWla?=
 =?utf-8?B?cTZQZUxnbGtjVkRZZXl0c2Q4YVBwNjBOZmVmbkFXNUszdUp5Z2ZTYVQ0R2ZB?=
 =?utf-8?B?VjVsTWJvWVM3T1JEQlN5aTZzM1JFYXVWbEFSdlhqYkZXM1lWODVSdFNNb2xI?=
 =?utf-8?B?elBTMkMrcnJUOGdBSS9rVXNmZDRQemROSHJlRVc1THFHR2k3ZjIwMTV3Z3JJ?=
 =?utf-8?B?cHJWazBMaFZGVWpTSE9aS0VFempBVnMvRVphUTErMVFkc01VOHZ0aU50RWRZ?=
 =?utf-8?B?TTAzRXlOWllIRmVSOWNEajAya2Y2UGl1eGRYTjRzQmpXK1ZibVBYbXpzbTVR?=
 =?utf-8?B?VEx0ZWhvNFljUXFHTFdRNXVvc1VNYzJENnVDNFpSekxadDFQeUFNOGFYQ3lJ?=
 =?utf-8?B?WlhwZFFITXNZRk9kNlZNdWl6eGZrbFpOM3cza3lkQjc3Y0pURlM0akxORVBo?=
 =?utf-8?B?YnZXdjA0aG40NXNaU3lhZng4MzZwUlZpQjdwcTA0b1QwaFkxWDJsc21jQTFI?=
 =?utf-8?B?L3ZkOVJBcUZXYTNnaDMxRkMzRUJUcmllT0FTRm1qckZ1TWZraHdpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21D9DDD78E1B3E4FAB1DA16FDA6B868A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d76f1-d8a1-4a5c-d39c-08da249284dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 19:01:33.8611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hIlA88aiG5KWBwsjI5yu+PVOQNhz89rJUp/4ozhQZxdi3JRvqHuCiylgrIJoSUDfIBIqzB99f9n3vktuAHTEZmQYPiJN4FPxKNwitecS2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4148

T24gMjIvMDQvMjAyMiAwODowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjA0LjIwMjIg
MTk6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wNC8yMDIyIDA3OjI3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMC4wNC4yMDIyIDA4OjIyLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPj4+PiBPbiAyMC4wNC4yMiAwODoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBP
biAyMC4wNC4yMDIyIDA3OjU3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgNCj4+Pj4+PiBAQCAtMzQxLDggKzM0MSwxNyBAQCBzdHJ1Y3QgZG9tYWluX2lvbW11IHsNCj4+
Pj4+PiAgIC8qIERvZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVkIHRvIGJlIGtlcHQgc3luY2hy
b25pemVkIHdpdGggdGhlIFAyTSAqLw0KPj4+Pj4+ICAgI2lmZGVmIENPTkZJR19IQVNfUEFTU1RI
Uk9VR0gNCj4+Pj4+PiAgICNkZWZpbmUgbmVlZF9pb21tdV9wdF9zeW5jKGQpICAgICAoZG9tX2lv
bW11KGQpLT5uZWVkX3N5bmMpDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtpbnQgaW9tbXVfZG9fZG9tY3Rs
KHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVf
ZG9tY3RsKTsNCj4+Pj4+PiAgICNlbHNlDQo+Pj4+Pj4gICAjZGVmaW5lIG5lZWRfaW9tbXVfcHRf
c3luYyhkKSAgICAgKHsgKHZvaWQpKGQpOyBmYWxzZTsgfSkNCj4+Pj4+PiArDQo+Pj4+Pj4gK3N0
YXRpYyBpbmxpbmUgaW50IGlvbW11X2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3Rs
LCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+
Pj4+ICt7DQo+Pj4+Pj4gKyAgICByZXR1cm4gLUVOT1NZUzsNCj4+Pj4+PiArfQ0KPj4+Pj4gQXMg
c2FpZCBpbiByZXBseSB0byBBbmRyZXcgYXMgd2VsbCBhcyBpbiBhIG51bWJlciBvciBlYXJsaWVy
IG9jY2FzaW9ucywNCj4+Pj4+IEkgZmlybWx5IHRoaW5rIHRoYXQgdGhpcyB3YW50cyB0byBiZSAt
RU9QTk9UU1VQUCwgbm90IC1FTk9TWVMuIFZpZXdzDQo+Pj4+IEluIGxpYnhsIHRoZXJlIGlzIGFu
IGV4cGxpY2l0IGNoZWNrIGZvciBFTk9TWVMgYmVpbmcgcmV0dXJuZWQgZm9yDQo+Pj4+IGFzc2ln
bmluZy9kZWFzc2lnbmluZyBhIGRldmljZSwgc2FtZSBpbiB0aGUgeGMgcHl0aG9uIGJpbmRpbmdz
Lg0KPj4+IFVyZ2guDQo+PiBIb25lc3RseSwgSSB3YXNuJ3QgcGFydGljdWxhcmx5IGhhcHB5IHdp
dGggeW91ciBwdXNoIHRvIHN3YXAgRU5PU1lTIG91dA0KPj4gZm9yIEVPUE5PVFNVUFAuwqAgVGhp
cyBzaG93cyBwbGFpbmx5IHdoeSBpdCdzIGEgYmFkIG1vdmUuDQo+Pg0KPj4gQW4gZW5kIHVzZXIg
ZG9lc24ndCBnaXZlIHR3byBob290cyBhYm91dCB0aGUgZGlzdGluY3Rpb24gYmV0d2Vlbg0KPj4g
aHlwZXJjYWxsIG5vdCBzdXBwb3J0ZWQgYW5kIHN1Ym9wcyBub3Qgc3VwcG9ydGVkOyB0aGV5IGNh
cmUgYWJvdXQNCj4+IHdoZXRoZXIgWGVuIGNhbiBwZXJmb3JtIHRoZSByZXF1ZXN0ZWQgYWN0aW9u
IG9yIG5vdC7CoCBFTk9TWVMgaXMgdGhlIG1vcmUNCj4+IGNvbW1vbiB3YXkgb2Ygc2lnbmFsbGlu
ZyB0aGlzLCBhbmQgaGF2aW5nIG9ubHkgb25lIGVycm5vIHZhbHVlIHRvIGNoZWNrDQo+PiBpcyBi
ZXR0ZXIgZm9yIGV2ZXJ5b25lIGludm9sdmVkLg0KPiBFbmQgdXNlcnMgYXJlIG9mIGxpdHRsZSBp
bnRlcmVzdCBoZXJlLiBDb2RlIGxvb2tpbmcgZm9yIEVOT1NZUyBpcyB3aGF0DQo+IGlzIG9mIGlu
dGVyZXN0LCB3aGVuIHRoZSBtZWFuaW5nIG9mIEVOT1NZUyBpcyBxdWl0ZSB3ZWxsIGRlZmluZWQg
YXMNCj4gInN5c3RlbSBjYWxsIG5vdCBpbXBsZW1lbnRlZCINCg0KUE9TSVggc3BlY2lmaWVzIGl0
IGFzICJGdW5jdGlvbmFsaXR5IG5vdCBzdXBwb3J0ZWQiIHdoaWNoIGlzIHdoeSBvdGhlcg0KY29t
cGxpbWVudCBzeXN0ZW1zIHVzZSBpdCBmb3Igc21hbGxlciBncmFudWxhcml0eSB0aGFuIGEgc3lz
dGVtIGNhbGwuDQoNCn5BbmRyZXcNCg==

