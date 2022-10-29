Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AAF6121FF
	for <lists+xen-devel@lfdr.de>; Sat, 29 Oct 2022 11:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432319.685103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooiRN-0004Hh-LZ; Sat, 29 Oct 2022 09:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432319.685103; Sat, 29 Oct 2022 09:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooiRN-0004FG-Hk; Sat, 29 Oct 2022 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 432319;
 Sat, 29 Oct 2022 09:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErAt=26=citrix.com=prvs=294fe0d1b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ooiRL-0004FA-RY
 for xen-devel@lists.xenproject.org; Sat, 29 Oct 2022 09:47:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b902b7b3-576e-11ed-8fd0-01056ac49cbb;
 Sat, 29 Oct 2022 11:47:39 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Oct 2022 05:47:36 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4924.namprd03.prod.outlook.com (2603:10b6:5:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 09:47:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 09:47:31 +0000
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
X-Inumbo-ID: b902b7b3-576e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667036859;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/4X8GMxWaqP7P7j2zUSRYmwYCoo7DvkDsz5FWzAAJbg=;
  b=Vrw6afcINVGvShDet/jrYr1GLhQnIoinMQn1VNS4Y8zmat/nS4y1obPr
   Z31N9t4AUa4XEQLczFZvGcsKIErCAsz4hOP7pfLENggQCOFXvjWiDRLSt
   YXM2oSprUOSvQfKQi27yaWfp3zxGExkdpyFd8j8go0l374EVJuss8A8kN
   Y=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 83368105
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Hb8u4KCN7EgSoRVW//Liw5YqxClBgxIJ4kV8jS/XYbTApG8ghTdVz
 moXW2GCPKzZZmbyetx0YIuypBwH75DXmNRnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6sdIWEB03
 9MiLzUNPkGMuqG136m5Y7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDa7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqSny1raXwEsXXqoDG4az/eE3o2TDy04dOE0TCgOqmdym3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJmUCVC8HV9Ugu+c/Xzls3
 ViM9/vrDzFytLyeSVqG66yZ6zi1PEA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pdEP/7W2+xbAmT3Em3TSZgs85wGSVWX86Ap8Pdehf9bxtgad6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:0iJwnKCJDYcbE6nlHehJsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dO0EPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmffHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+3CVTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qe5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuoktrdT5CvgglLfck7wY9HaIGOuZ5Dt
 v/Q9pVfZF1P7orhPFGdZM8aPryLFDxajTxF0/XCWjbNcg8SgLwQtjMkf0I2N0=
X-IronPort-AV: E=Sophos;i="5.95,223,1661832000"; 
   d="scan'208";a="83368105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kpido4vGMq8XOPqpkjv0Q8vgcN8zO42aB0eg6SJf9ucFZetTNpFdjHeDmon5QjwoYCVlVH0+8a6kyXKKB7uU3PaRpk1Qb40J5pl77WuqoG5Zv7p3U6UZnwSmT0FlrEaxRsoboGrFVpT/XLXhqhOQLACIE/rsvpJkaVZaAaj8Obbpj6XZtHhO12fXB+KKUxdtQ4IXQ2WBh5Lo9+/YYuU7CETZT+l6tNRSKJTS5lrIVLMizP/9hzrmXcrgJWdeNgOdqW0jxUHBnU3eqRr7Rx/10ZP8FEhMTI4+MJHTQj7YdqHlbVU2cZ/F8tRQihECTek3T6snfiVgjGyfE4PWqjGb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsxrMTGoYf/ZB43KrphfKm6g7UnDTQ62oWu/iIPZ0mg=;
 b=S1j8fsg1d5a41E6VX+XDsHqYpb0Q0uStHO72gqTxTqnNWuE9tILJSjZ3fovmuFLSaO0TEmRLQqv7wIBpW++z6FlH9kI1Gah1E8UIlnZoTX4ZjYWvGsdOTeacBMaRR0MLOmw1dN8aYrWCZ1eIisRG5Qlgbe4iURqBS4swef73rh/bEJhwg8XxX6Xg6weQgpfN+bHW2FcZTFwtUz9sReRKxTE28WZD2C5ioIPY9COE9kppK96K89lWWhwQXQ9jF/uXAsKrSX+rDBpS+BzgnENssF1psZmKuoh/EKaSG5hwrPikUJx4gint8m4awocDvccKiRGCXWYChYMQFbGej5MPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsxrMTGoYf/ZB43KrphfKm6g7UnDTQ62oWu/iIPZ0mg=;
 b=iZ7blH5zpL89xJGrRqzRN96MZDjK9gW7ZTwhkWiGveV8Gh8mjfvff8k7D/EpdQKv1p7Ky+5D3Z5Nx+yxTIOrC7bIgFtTqAquUefyzuX7HvxaHxuQ08KuwX8RXpTBF56F7fh3wuFTBq0bX2FQQTwiuwOVjpr91WlNKkfHAK0wyBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Sat, 29 Oct 2022 11:47:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v2 2/3] amd/virt_ssbd: set SSBD at vCPU context
 switch
Message-ID: <Y1z2rMNrzui3x9+J@Air-de-Roger>
References: <20221028114913.88921-1-roger.pau@citrix.com>
 <20221028114913.88921-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028114913.88921-3-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0609e0-fa8d-477a-5395-08dab99298f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2hWU0iLynHmm4OUO8tRd3Rm4THE7XM2swEb7XBWu0IpVNeZt+Q/xd7JBUIi3wlIRmr625Xr8GU1xhV3J6BzOrxzF/v+011EpMtEZ2ukN2BTd7xf/51ufr3UKY0cIPGYM3aATPv4BevvLsJv27ABfYUgb78FgU3sZqnzNDGKWlYEgBIo9ncv4aGF6Tw+NQywIDBLiaRWa9LIrhsBloX+/VM44q8TcBCLdwWxePLDNshnQb2LDHeiwEh0O2CcD55f2pkFUwPYQUfxZY/tz4lXgycHkirQLoTvLJWKlQ4HbGlJZ5uPqsORPtd6/tByU3CFwI604h+kFlRN1WFS7EmFLyHRGPcIzwxkZUe4It00atyGwXIiXp892aQL2/OCotyOglKXmib4a/2l54kHXGj7YunccejeUTz7OfTZoh06F8svgvIvmq4l/rNFLriOh1lM/MROnFyzj95Ad1aEYLNlOx52bKGqnuCkp6zjXHt99RiQU3XQS8rCRE6amJ1/ULUG9AgK1WMnWH0VmATL9vGEAS1w8e/9QX8XBdQHnq7Rc7Hf86w0PX+AXOYSWsjeHbjkLTs7MI0JKwFfHAmNk0EvlvVBI+Lc+bAM+SYUlUmJ/iPmccv3kX5RIIi4+iLKZpdJynCuFEDe9Eeiq38w+T6Vq8/p0tuRY/IQz+1pfMQK/o/Hk+q0kIAuMzlJ4nP/NBg8VbZNdggyUqbZJOZa3zDeTTgqB6KtUkBMUXDkbUyP886WBxWHz+xKJgUp5y0zFTDRY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(41300700001)(6862004)(4744005)(5660300002)(8936002)(8676002)(316002)(54906003)(66476007)(66556008)(66946007)(478600001)(6486002)(4326008)(83380400001)(82960400001)(38100700002)(6506007)(6666004)(86362001)(6512007)(186003)(9686003)(26005)(33716001)(2906002)(6200100001)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWg0VUJOUEN1amM1M3NxU0V1ZmdaMFVFeWNNdmQ0SG1RYTVMeDRpM082dVQr?=
 =?utf-8?B?TzNXbVBqeUtuUzNsMHlqeUgzMnNLb0dhSC91aTdPSEJhWXJrRi9NdDhUNnJD?=
 =?utf-8?B?U1N1SWtBRElRbzN2bEsrbzJVUEIybGpCL3E5VHRoM01QS3hzWjRsQzlGeHdJ?=
 =?utf-8?B?LzFXZ29EMm1mR1N5NXZjTEMyTjFsNmF2cUFic05JaGVFRFQxdEc5MHRvMzV5?=
 =?utf-8?B?U3REOWJmOFB6cyt3Wk9rU3FtY2hwM2JFekV4VkFSSHp3clZsRmVIVVA2cDly?=
 =?utf-8?B?dTk1RkZwc2ZOdFRiRzdSdU5rUVVjR0o1TVRoaVp2WU8xNEdZYkt0RTh3czdx?=
 =?utf-8?B?Q0Rjc2dpYlQzc1RndDFaOHRGWWlZVkVJY3pnb2hPbjVnZFZpOEo4dmZoMEVw?=
 =?utf-8?B?M3pBSGwwNmw2OVVZRFdOdHlOVS9RMFp5VjRCQ0pTb0xPdjlISWR4SnVhNUVT?=
 =?utf-8?B?cEFzYlhWa0dXdVJjN1FwTVRHSjNoaW1BNDAwc2FrU0VyNEhvOFVNdjZuakVD?=
 =?utf-8?B?SlhPdEZzVW5ubFNrTTRobHpLNUNXenFMd3Z3RGl5cFZ4YWlhYUFiT2lTZkY0?=
 =?utf-8?B?OUJ6ak9Pa3VPWmxBZ0lzb1JoMnN2VHNGbHBNMUFrM2RQTllwUnVrWTZwSEw0?=
 =?utf-8?B?UUVOb2RjK081S2EzSDJWRHU4T21PTUVZK3JNL3JrenBPM3NpMCtPaFA2eVRX?=
 =?utf-8?B?dW42K0QrQUtKZS95eEJpTGh6VzNLeHlDL3h4M0t2L2NOZWQ1a0lEM0JQTGFp?=
 =?utf-8?B?NnBzZ0JNdG9LYjJjS3c2akdXWTd6QWxHSUxEalQ4R3A5b0xVV2VtY1A2Y1U2?=
 =?utf-8?B?RDNqdVhOUE5NWjRuOHQxMFdYeENlOERTNGNLMVIxUnM5ekxYa0VWaGR2VmpR?=
 =?utf-8?B?VnJCa3lFSGhaeU8yOG5ubTYvUDRXbStwckRoamUvSkttd1plN0FnNCthUDQ2?=
 =?utf-8?B?TGtPK0I1ZksxVnZNcE9pR3gyNStrVlcySjBtRUp6bHlsQVlyVTV4bFM5K0Ri?=
 =?utf-8?B?cDJMZUorNHhNQXFjUVkzT2VrNHdWcnN6QmJTdjFmMWlFK0xPeEV3OWFtUnJD?=
 =?utf-8?B?VC9lZDFFcyswYThtOW81Nk5KeEFZeGVPeHB0NW83Qy9ieDlFZjY4SlRZOUlx?=
 =?utf-8?B?bUVZalc5bHRjak11WStxV3FsTEJ0TURreDdHOTZJck9nUG9WVEVuN1V1T21G?=
 =?utf-8?B?SlZBN0J2NVJjMVUzQ1huYkZqeGhrK2ZZNXJyYkZQa2JOcHQ0YlhSdXkzeVBq?=
 =?utf-8?B?TUZlamhuYW5Ud09WRitkRGd6L0ROQSt6dmo0QVRyUFRWQlZoTHVySHB6Q0Ry?=
 =?utf-8?B?M1dhcmtrVWtmVHl0dHpiczd1NXRRSC9XTEwxMEpkeDRFM1ZyWmduN00zbTFs?=
 =?utf-8?B?bm5sMFM1UkZ3WlQ3QzFLZVBMazR2eWllaVFpMSs4d3V3VjNxRVRHaTBaZmhw?=
 =?utf-8?B?TnlMUXcrVDgxZFBWZGFPMGpaYnVrVHNCVVErT2pnUFEybjFqR3pUUnhvQ3ht?=
 =?utf-8?B?dGowTUtoOWtpZDU1Sm9ZZFJnb1B2OHh4eWZvbWNETmVvRnJjTXl3ZnRMVFJK?=
 =?utf-8?B?U0JYTk50Mzd2U0d1VFcwc0xhYVhNdlBkZkpWTWhGdVhwWENRNG5BaWw3blBp?=
 =?utf-8?B?RTFFYXJ3VW5yQnB3TjdNaWhJb2ZKVG55dDNvUHhDTTN3WHdYdEpxdG9OM3dx?=
 =?utf-8?B?SmQwQTVNQkJDL3FhWFpPMTVJTG1NUGc1TTVjRGhVNThqbDdTMUNrOXBDbTJh?=
 =?utf-8?B?WllpTEZxT0g0UUsvSjlYT2R1R3V6V2pBaUhpdU4rdlB0a2tQbVdjOTdWamtF?=
 =?utf-8?B?VFhWQ2E3WkpWdDQyUE5UaFhKMkM0SnpZazZEVjZGWG85eXc3dEs5QmJNQVg0?=
 =?utf-8?B?cmJFVHF0UDlWTzlEcUxsdkNnaVJ1SmxNSjN5SmZWcWJsWDNpWEZBa3VUS05D?=
 =?utf-8?B?VnFQemt3VUpyc0ZKSEQrWGVaZStSMG8rTllwUS93RG1TSm80UXJvQ2tuQWRa?=
 =?utf-8?B?SElRZTl2ZTY3bi9qR0RYc1FRWGhrTnJVNVF2SlkrUFJwNk5HeFBRa3V3WUsr?=
 =?utf-8?B?MW5ZblRKR0w2UWFQcFFJdlFmcjRMV2xReHl5VlRlcWdleXFCZVh1Z3k1cDlM?=
 =?utf-8?Q?elQI0M6mE/0AWMmqziTe5hJ8/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0609e0-fa8d-477a-5395-08dab99298f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 09:47:31.0330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX5xllLuo/tuCz7vEzhFopkxkfZc8g4vVTnSf9NI9j9m+1Ht2jcApz5Hlg1BtqKrKXKG4f1sxwX1dJwKzHJqLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4924

On Fri, Oct 28, 2022 at 01:49:12PM +0200, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 95416995a5..a4c28879bc 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -697,7 +697,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>                  msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
>          }
>          else
> +        {
>              msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
> +            /*
> +             * Propagate the value to hardware, as it won't be context switched
> +             * on vmentry.
> +             */
> +            goto set_reg;

Doing this when v != curr is wrong, will send an updated patch.

Roger.

