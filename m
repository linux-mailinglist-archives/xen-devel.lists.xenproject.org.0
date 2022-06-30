Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7B56157E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358340.587517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyO-0007Zz-QW; Thu, 30 Jun 2022 08:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358340.587517; Thu, 30 Jun 2022 08:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyO-0007WY-NX; Thu, 30 Jun 2022 08:56:28 +0000
Received: by outflank-mailman (input) for mailman id 358340;
 Thu, 30 Jun 2022 08:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pyN-0007Q3-BQ
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82f21d27-f852-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:56:23 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:21 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6977.namprd03.prod.outlook.com (2603:10b6:510:163::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 08:56:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:18 +0000
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
X-Inumbo-ID: 82f21d27-f852-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=N02eGk8FDP5Q9TobZZ+oVF55bMlSmE6X+tMDp50OFRI=;
  b=dLWoX9aJNDlI6bZLuVd8Us843DzZ6rZYZIJ7s7UYawt7y/+bH9aF9v6A
   cvtW57xnlfUqt46gpztCR5pMV+/0foV9PIiK/GAmky7IR3fS/kRJH5xk2
   1a7fLSYX/xyoib5U9NooVqca2MAVRPrsRgaGlP3nd1IFgdbrJmE5yv4xi
   Y=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 77339796
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SkXhW6OnjKZZlOvvrR24lsFynXyQoLVcMsEvi/4bfWQNrUpx1jUGz
 2MYUW+Pa/fYMWSnLdBzatuz8khS6JLTxoNlHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn2dYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 o9A9pqXGVkSMqDJvsEwUyBlKA9jMvgTkFPHCSDXXc276WTjKiGp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB4H9afEs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj33SKuLGwGwL6TjbgHxnn511R16qL8MP3cWNGtaeRyn2/N8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa9lGvT9T7dw21pjiDpBF0c8FLD+Qw5QWJy6zVywWUHG4JSnhGctNOnNAybSwn0
 BmOhdyBONB0mLicSHbY86jOqzq3YHIRNTVaOX5CShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:RPW3GKDF3bCZcO7lHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="77339796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSMoxkF3zOGw/GzKnKsnPvMfTFmWk6AIBQiHb6slTcR+MOAZ6GpiT56q/aSOZdd1gqA/W5qdr/qvE06oH3ogfNdVGrUrOHh0vLe/yMfnoyz2r/ZeS8D6eEqUKpJkIwZbA8QjD8CwBp+bp/oWP0r5KlY/6iEhERPWErLPmfBwjLOKA9IMb81Q61Qf2D15htgoD9DWmoZaGD/80r/NNo/d4dTU63NA03KHHN/gVuty1fZ1EVhWfGRcredjkOKTFx+W9dErBzzyYFiEeQ+hkkH9pU0Dkq+Rl+NC07ZYdggrDlZOPXgYwbnEVNoyJcjANffcH5GMk2HAuv7NFAoYFYoCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G83kxdx8/BCNbuvV4mxQ2qXbGd7+MsuOADIfqBBoRC4=;
 b=WotL2ZfM596tjpLIzABB1VpH8uUdLImvKKgWbLlRi9dBMKVjIVHgokpHbCiJB+CAP2oJG1VJ9YLhPf6XzYPxm/GFWLvf+Vg2itfn4OwO+3E+m2Gh6KY31RHmXDx746Ci6dCM+szz706+KEawm81u4mygYUVh2W/u4QHVDk6UdzcFJCsjgFawnajyvAISO5pevEZyyBcjSpvCWKqejZCK54mNQ/3fY+kZnVF4mFQIQPssHH36GDBcL6ZxXQU+NMlCmPAub5QVu5BWSJIeyueh+iHHBCiC1QnCb2+lyZ2Glq0ndjKv0GDtn9CmxtRaePSYpDaJpDVunP5BfzFMRjOFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G83kxdx8/BCNbuvV4mxQ2qXbGd7+MsuOADIfqBBoRC4=;
 b=lAunFh61UA7E/yb4GbSXWdoU3Bv4Js3YvynySD+b7qKduwOxuufxlu/7nC9MTMamkUHL7RQYimellLRu13CUUxNT28bO9oWqISy1mY5PMc0L/NwaqHZN01WqchnD4OQUOp17Lzuzb7Mp5uUerucroiyB9QYteipDF/fXjoHHUvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/6] x86/x2apic: use physical destination mode by default
Date: Thu, 30 Jun 2022 10:54:35 +0200
Message-Id: <20220630085439.83193-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e8a997-0a74-4b5b-91d8-08da5a76659b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKHfTAs0PE7JQ/IadQsaRqq6k3/5MK1UlAoaQTthlZiRZ11xZ8V2jnusdl582L+h9LPd/fFwcqV77E+THNiFrTTo5jYmUldktrhsQra+eW3NrhPZH0JWS+2mEfzt0yEQWZER1TqcIgzF6nkFPWxggncKZIRIhaLpBpjka227+Q49pTdoME8xZ39hmTLWpzP8OSodeds6zGJh21kwNiIvRmR1FiZ4nromi6CqusbBwxCnmNMGWkbRhTrhstLYNmXbe+N3HSC3C4zlJL7q0UThL8B/8Y880BZoqK5B77Rqxi8Cj07ipKjFHLwM70i0hfJvj+il/rM1YbhsRiTzGPPTphO1H5DeXUxoUPL+VvB9H/DPscPOLONbURgXOu0edIbOVflaEh08kesEZNhu9EcKk9+Kdbv+ByFVd90MkFm/BDkt6rbCN+y3n3X3QiDFT9jx9otuql1y2GES/9g8n98z4/sdFoWcjZgiw6xReKn0o9le1sDQ5lzDPWPUqGbToWfvHfMMwW0VtomUPlnuT2zNpZ7jMsg/GjGkFpULxIUWlUIWFF7zIQxJVRCMQkfyBenP5d+SzU9/D2fomtgFuzG/cOEWUVSat65jinHiQXm/L+zaUUi4QRdznwvulvZ4z3Ql3kn+jwIlb5V3RavjbyZ0wN2veKr9bKZLiKAUpQiBIcAhjU4RqikXgAtd7tGvVoXqrj6AAM09LtWa7K5JVK8wxV2bJZoRF1DtMlFwFwshUBFRU0wR+4pj9zdeDAUh+4VHU4OE57qHw4YxKUxsgui6Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(316002)(38100700002)(66556008)(66476007)(8676002)(4326008)(66946007)(478600001)(2616005)(186003)(6486002)(1076003)(6666004)(41300700001)(6506007)(26005)(6512007)(82960400001)(54906003)(6916009)(83380400001)(2906002)(5660300002)(86362001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEl3dTZHZ0MyZTVKdzA3cWxIcEdzbXNLY1VRNEd2M2dRNURlNW13VjB6NDd5?=
 =?utf-8?B?VEkvS1hJbG9iYmJWSmJrM0VoK21xSW9WZ0lueGcydm5VK3pPVUpKWlNwanlB?=
 =?utf-8?B?VFlKcUhZaVlHcHovZmYxUDIwZHFYbVAzdjcwWXhoRGhzR3hsazdkMm51dFVF?=
 =?utf-8?B?ZWVVaHVyeXlFemZzZmZpYWZsNEhJMHowTGJjWDZ2MWtRWENZRVNEekJYR2M1?=
 =?utf-8?B?ZFdKRTJEOWp6dWxJMGVwS0RuTHJlYU1na29PbXAvbzlZdVpUTmc3R0ZRaThx?=
 =?utf-8?B?azMrTEluRHdPMk02OFlQZjhOS3ZwMUFxaWVCcDRUbG9uZHNVcTc0ZkFnVFR2?=
 =?utf-8?B?VWdIdVpsVXFVRFVJUklwcEk1T2lEZjh6VWltOGswVzgvS0lyaURKVGZSViti?=
 =?utf-8?B?emRyall4L1plUWpLYlZUZkpLSjBZd0psY0JXNWdRRlZ2MmNWdkdGQ09BTVNG?=
 =?utf-8?B?Zm1UamNJZ3huQ3RsUzVpS0FjREg2NXl0RFRLMjRPNHBDaDBiQzk1aEtMUm8y?=
 =?utf-8?B?VGhBZUJaaFdUcW9pZHlpUVBHV2RSUFpjb3pIRUUwK1lSdHNiMDZaaXgrdWp6?=
 =?utf-8?B?ZjhITWdwMmx4bVFyVHlVdFdSNWpIR043VHlWZnpJVC90SFcxOTBKMEJYZGgw?=
 =?utf-8?B?eFZJaXoxYlVKWFkxVzUxTGNQdmErcDdvanVFT3BQOFgyczFWTHVydXRGZUZ0?=
 =?utf-8?B?ZGFCMnR4VzE5c0lhbXdTaFBPZkFNeGZkdzlhM0JVYVJ4Z2ZVaUpLSFVySExJ?=
 =?utf-8?B?MnNuejNWR21GZDhHZ3hGUzdEeXZEMEFnKzhzNXpLcDhQOVZ2OG5LNm9TQ3Z6?=
 =?utf-8?B?MUZkRnBVSXNRNjkycjg1aGNNSUJYUEM0dHZCQ2hrYlNrTnA1NGxSeUl6RHE1?=
 =?utf-8?B?MGN3VUYyVmRvcUViWmpjdGpzZktzRi9OT3NwWldaNlRyQlMxU0FPVnhmRU14?=
 =?utf-8?B?aEhoM0R6b1htQUF6aXBqSzlPeU9YS00yMHZ5Z2VZUnEzSWFGRithZ3FBNGFZ?=
 =?utf-8?B?WGsvN1NqTERpSjV6eHIrSTI2emJ1aHB1Y1JiWDNVZ3E4M2VaZnV4WEExdkRO?=
 =?utf-8?B?SWJBVVZrRjdnMEthSjJTaUxRYzNKR3NSVitPY09iWFNpMitBSFpQV1J0OElh?=
 =?utf-8?B?TkwraGZJbXllcXV1UHQ1ZTByakdzUTNoRHhnQURnN0FhSWc0VXBEUW5ORWJD?=
 =?utf-8?B?YUpobjAxUU5jZGZpRFVXclNPa3M1b3Bsck43TjJHa1NzNzlQWTFiTWtRd1Nm?=
 =?utf-8?B?U0swWnpGbWdaMHBkVFZycDN5QVNsVFpFeTkvcjRGTENvTUxtNG85bnRTVEpL?=
 =?utf-8?B?WDBNeDJQMDlIMzRTRk5TcC9Xa1MwUFVjZjEzL0JmVjNKR21EVHVxaDljZk5X?=
 =?utf-8?B?Z3BEKzNvZ0UvK2VoMWIrQ29WSXpHQVc4UDhucG5KMktnR2pQb3JPTDlGVGRS?=
 =?utf-8?B?ODg5TEs5ZHc3aVNSRGdUYWxRNWhTa2EzeXV3RTJCa3c3WCtPckE4WE1uekF4?=
 =?utf-8?B?Wm44TzViT1NyVHNYZzY2dVBYZ01xK2kzWGQ5R3BURFBtMG1zNWMvY0JCVC9W?=
 =?utf-8?B?bEZtR1RTY1NxUmVHc1R5RHdLb3ZIOFVwdWhpV1VJcDNUQUZVbCttY21SMWdy?=
 =?utf-8?B?d1RVVUlRQndVb2xXWGpGT3c2cFhxKzhsRDV5RUFSWjIyTmtPUEhIalJjUXlV?=
 =?utf-8?B?eHRJODdRbWwvcDFSYVpja2lYdm5GMkowTlIrRGxJRjNVNnI3T2cwVGNJZXVh?=
 =?utf-8?B?RzhSQ0ZWdGFKOHAwUWR4VmYrUEViOVBsM3lMeENGMEkzdjB2MlorSURMUkRi?=
 =?utf-8?B?bCtCWUZwQnNydTlOSVlhUWg5Z2NTc1BlL0JMaTBveUNNd2ZZeTZNZ3UwVHNL?=
 =?utf-8?B?NVI0OWFJa1NENDNxeGNSZ3FDV3JNekNydWVUY1NZRjNYSy9nZE5paFFjQThw?=
 =?utf-8?B?ZGd2bHdBM29udEF3blh0NGY5U0xINUlyS2xXK29seTRZaHlxVFRRWkg2Nkh4?=
 =?utf-8?B?K3V0N2tYNzF0TXNiTGplVnh6cW1CR2kzNzJPeldjRk1aZ2dEL2N4N1c4eHIx?=
 =?utf-8?B?RWpSa2d5S2RKVGYrMzcxQXRiWW1TVE9yRjV6Wk8ybG02WW16V0FTOGI2djVZ?=
 =?utf-8?B?NS80RnVKVGl2S0lOd1UxNUtEalBXT2lORTladVVPb2NnTjNQWW8rc0R3TlJR?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e8a997-0a74-4b5b-91d8-08da5a76659b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:18.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdD5NV2ZuhSqfwae47NhMSyNCZd/w/vIqLr/Ns4BDhzEEtMmL+IZHKmEJJcGoM0JhGGZiY9MBdihmQ/bMKx4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6977

Using cluster mode by default greatly limits the amount of vectors
available, as then vector space is shared amongst all the CPUs in the
logical cluster.

This can lead to vector shortage issues on boxes with not a huge
amount of CPUs but with a non-trivial amount of devices.  There are
reports of boxes with 32 CPUs (2 logical clusters, and thus only 414
dynamic vectors) that run out of vectors and fail to setup interrupts
for dom0.

This could be considered a regression when switching from xAPIC, as
when using xAPIC physical mode is the default when the system has more
than 8 CPUs.

Note that using Physical Destination mode is less efficient than
Logical mode when sending IPIs to multiple CPUs, as in Logical mode
IPIs to CPUs on the same Cluster can be batched together.

Switch default Kconfig selection to use x2APIC physical destination
mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Expand commit message.
---
 docs/misc/xen-command-line.pandoc | 5 ++---
 xen/arch/x86/Kconfig              | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a92b7d228c..952874c4f4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2646,11 +2646,10 @@ Permit use of x2apic setup for SMP environments.
 ### x2apic_phys (x86)
 > `= <boolean>`
 
-> Default: `true` if **FADT** mandates physical mode or if interrupt remapping
->          is not available, `false` otherwise.
+> Default: `false` if **FADT** mandates cluster mode, `true` otherwise.
 
 In the case that x2apic is in use, this option switches between physical and
-clustered mode.  The default, given no hint from the **FADT**, is cluster
+clustered mode.  The default, given no hint from the **FADT**, is physical
 mode.
 
 ### xenheap_megabytes (arm32)
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6bed72b791..09441761d1 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -228,6 +228,7 @@ endchoice
 
 config X2APIC_PHYSICAL
 	bool "x2APIC Physical Destination mode"
+	default y
 	help
 	  Use x2APIC Physical Destination mode by default when available.
 
@@ -242,7 +243,7 @@ config X2APIC_PHYSICAL
 
 	  The mode when this option is not selected is Logical Destination.
 
-	  If unsure, say N.
+	  If unsure, say Y.
 
 config GUEST
 	bool
-- 
2.36.1


