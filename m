Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1B72273C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 15:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543716.848919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6A8R-0003db-7i; Mon, 05 Jun 2023 13:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543716.848919; Mon, 05 Jun 2023 13:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6A8R-0003b7-4I; Mon, 05 Jun 2023 13:20:35 +0000
Received: by outflank-mailman (input) for mailman id 543716;
 Mon, 05 Jun 2023 13:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryrp=BZ=citrix.com=prvs=5133587e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6A8P-0003b1-2E
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 13:20:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd4484eb-03a3-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 15:20:30 +0200 (CEST)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 09:20:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6599.namprd03.prod.outlook.com (2603:10b6:a03:388::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 13:20:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 13:20:23 +0000
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
X-Inumbo-ID: bd4484eb-03a3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685971230;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Zd3R/Rm3Px4eLh4BuPXDsr8h6eMdfTLCr71pqKICGG0=;
  b=dev7fn9Wl4Sz+itPsbsj7/ZEoZh6mYbcOe6BoG/LmsOfebrqLvWoW/J1
   8YQ3XwLCestKqVT4gU/G+gcd9napWBtCOI/3Y17Jkiy2R9ZHBy7Y1RMKS
   wrWpxZBYEUJfYhYA3FIcVDUkSsYN4biexlUzuqJGSy28XhtVh1q9nt67w
   U=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 112035792
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wSEEvKrkFGFyRLRm1ONeqEZAfX5eBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBnXaPyJMDHwe9pwatnloRgB7JPVm9IwHgRqqSg2RSMVpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzyVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACFQSDCNjeid+ZiyE/NPg/VkN+LXZKpK7xmMzRmBZRonabbqZv2WoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OraYWIEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtITOblqa8w6LGV7kAqMyQ8WGmCmOuGk2K8So0cA
 nMs5iV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A5sa5pog21k7LVow6T/PzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:UY2BSKmZAIEMcTdTiW1e7ITah7jpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:1yuvBW4XB2GIDHJzcdss5RMyOs4veFbk5n6JOWy9OCFyY4HNYArF
X-Talos-MUID: 9a23:9NagxQgR0JVqZZTxJekeBcMpGP5T2o6jOnk0g6ofl8uVam9ZBA+Bg2Hi
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="112035792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOShvd6oBGLpluFXHMK2rAVm48S/bjoNsId/5bAJg/Up3Azsk9R4OqOYHWDePXRbEuxGdiYPMVQmQz9GfHqACUJ8Nyk6vfqYgwuS7troKwPCVy2OFOwgkwJygNoTLYGAIqhUMXqRxPK468QnRTuAwcsnbSLciaF7wq5QkZsZi25UripBdueji+kEnY3Wvps2QNR89/QAA8bSaNbZApVHHz3eBjQExCpJNzjVBDU+5B4Kch3Up0QcDOeFX86caD6LilNoSAghfDCTSy/zZQH9mA3wHoltlz2poR/ZdC+OT/9SnbaKRVzza735v6FxsPsgnboeb04k0t1pdyH8AvbyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeioqXaB2OLmd2c6WMESP0yxxwkHMKNYi1LjgannAKU=;
 b=bcFCZkSHh3xXQaGiQ07lZ0AeNp84f/t8nGp4W6Rjgt85FyBPm0kFoZvnU3ybTUdY3TUYNZUccAXJkwSTiUyTeJptda67kBXl1GrawnwbCR61cEw5PW0a3p3B57Dz/nE+njiK2oJGZrSFM7EMXFqXt2gHA/pI/K4DxR8jKNamPakknY1qKPZ0RkqQTkKIvys7KuVlXuheV/HUV+y+23r3braB8WeXsPPU2y4D/JWuYJTsinFichlUmJDbZjImQt/D/A0zRUIhz7ba8eKJeYH6uU76+2kqQBwtguqtS1OB3/a03l+jMs4rEBhMd7YljhSmvVX1tk2J2+O1XcDkf5xQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeioqXaB2OLmd2c6WMESP0yxxwkHMKNYi1LjgannAKU=;
 b=R3upLGWbFApFmvm8UqPchIR3QdeLcJdEMDQm65Vs4in/2P8flseXO/O0OIYWQKIImlFCzTHUFpSfLDFi95s0He7lSWUcJ567XRaJHddfdhrrWX+BKni6m3MraQdZEPiQEomOQl6vdgPz4+PaUYgPq1KE4/gMzuhYI31DiZuO5Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 5 Jun 2023 15:20:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libs/light: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <ZH3hEJMsZXBhc6v4@Air-de-Roger>
References: <20230605103657.14191-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230605103657.14191-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b937c18-2725-4e64-6689-08db65c79e40
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IxA4T9NBIJYYj+MwJDX+vB2ubcKWkJ7AZEXKPBboxg9YIfJzsvaFiJBi4+aKqO2NogGILq4iGj9RVJqdQTcuwHqbJiaSvP+4Y7jMV7k3b6i+6UpfsmkdpeTP3w4Rai0FXUKE+8tjNDHtnDsRh4ZryhZtflRYLpkpOSg+8tFDdy+cAwQW/pTNeUaZpbgV5v0Ppn66S5bakuqwNKOOj3fYY/7O+gR67Fz2TzL305kt0rtg7AGV4OM/IvNbGMAuKJ/dn2CPQ6rxV36raNMDXMRR/Yr8XrYFxFGgikJVvLjUNhtTzvgT7+el4qI6/C06E0lB8Z0s0KKRjdvaMQ6d25oi7SIUt21lQi/z6ZfjWzgm5vILqyqoAyF4fVHXz3Ms1jiIsfBvAJOpAwMfSqhHQEudDku1jWPrED2N3JIF+UvefYKWnvepeKHF4f6KiQMftjQtk03fyVQ1lai/MbYsmfv7o1PWCi6CSkXeeRX6muqSMOD45LDe459mAczKnfHnjmaYJjSoEibcsXHTlXcZElyHJCyOicmv/EpsoI5tqSEmpwfbj/ryBgo1lUoJy/PdMiIs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(6486002)(6666004)(26005)(9686003)(6512007)(6506007)(186003)(85182001)(86362001)(38100700002)(33716001)(82960400001)(54906003)(5660300002)(316002)(41300700001)(8676002)(66476007)(8936002)(66556008)(4326008)(66946007)(6916009)(4744005)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkRKYVpkdjR4UkVnYVd3cENtK2xJODJjSWQ1VkFmU0VCM04wd3h6Q3Z4MEFl?=
 =?utf-8?B?T1ZqMWlXVWY5THIrRnVlOUJqWUhzQmk5bldQMG0rQmxjRHhXcjVHZTlKSEdL?=
 =?utf-8?B?eDNJOG9QWld1ZTRIRlFDZGZpbGh3YisyaER2MzEzaGhPejdGYUlTY0F0QTJk?=
 =?utf-8?B?Vmw4Uzg5RzViZmduYU9ySmNsVGpYRDZwNFdEV1VINkNTQW9Ua25KSWRzcWpM?=
 =?utf-8?B?ZWM4R0xUanE5QW1GQ3hNYmdKbU8wZGxxYURTdGUrOTdlV3JKRkdDdEhFY0lQ?=
 =?utf-8?B?V2F5SmNRY2ZCOGw5cHBlUXN3Ny9SMVFObjBsQkdBK2NYRUR6YkowRnl1YXN6?=
 =?utf-8?B?TUdaMFVjT0xtR1BHeTUxaVVLZ0FyRjZLMnRZYlJpMGRSK2cwWGc2Y2hOK0FR?=
 =?utf-8?B?QUNxU3BZZk8vcGlKRjNzdjFxTDM1eTAzemZZUk9SWVRmUTJMbk1sdUh6YXBj?=
 =?utf-8?B?RWF1alB6V0dzRk9rTVA5bDMxQjdGcEhHZUZFdEZuNTNUb1N2M2gxSy9uOFRv?=
 =?utf-8?B?R1VoekVzT0g1bi9yUThMOTU4enFrdlphTnMwMmJhckJjaC9CZExoYUJsM1pu?=
 =?utf-8?B?VTh5RkpUZ2tIMWF1ZUZuaXRNbUJrZGtxZUJjY1l5cE5DMmpzc3Bod09qSUZ2?=
 =?utf-8?B?cEt6RzliM2ljUTlrODB0ckZkUXNENnJHektEczVYTVozSGNpQk9NM00wQ3FZ?=
 =?utf-8?B?Vzg2VGdZTGU4WmFOZlJpd0hGN09WeXpzQ0MvQjhLeVpJTEg5SDlxNGJHMThS?=
 =?utf-8?B?MGRUUFRPV3JjRG5ZWklOVFdtZTlkN1A4d25UR29IRVZUUUlVK3hxOFpxVDZ6?=
 =?utf-8?B?LzltTk9GMTAxY3ZjaUU3MUFBYkFVS1pGd0hocmM0dlh0NVdyWnJ6UU80RlpQ?=
 =?utf-8?B?Q3QvQ2tzRnp3MGJscmRYTWMzWUJ4dHBQSGVYM0NFb05KMHIyRkhheVQ5eDB5?=
 =?utf-8?B?VFFEWENRN2Q5bElNc1ZHRjBTZ205SERCZDhXSlFwOHFuMzg4UVRkZytNVVBB?=
 =?utf-8?B?NnFnQ0w1cHZOL2FrSkxGK2cxdzFpMDZMSUZCdUtiZ3A3UjcwSEMrOXlCUStN?=
 =?utf-8?B?SEF0ZWhPbGF6RjdGbEVDOG5Xc2xLbGxabjMxMlNJNnRHQU9RZCtyeC9LVmpq?=
 =?utf-8?B?VXR2Qk0zRE1zQnY3VjBSdE9SeHMvQU1BWm5QWjhPcFJ2bTk3cmFlN1VsVHpp?=
 =?utf-8?B?cGpOREpERHdvV1JhbHNJaS9pZ1Q2b0NnMzY0SDB2c3pQN1F5RGh5L1NocjV1?=
 =?utf-8?B?S2NhM3RraThkclpXSkh6MGhFRHMxVlE3M2piNW42c3dCOWI1U2V5R2xJMXJr?=
 =?utf-8?B?Y1F0ckcwUDZQN0N0c3hHQ2xqZlhvQVdXK2tQakNOOUt3M1ZIL01ROVdueFg2?=
 =?utf-8?B?aDFkYzZrSzRWQWJMVC9pOVg1SUZCelBKc3JUZ3lvNy9Mdy9hZDhjMTU5NEQw?=
 =?utf-8?B?M2p2dGtQTjV4a3dKcGF2djhqZEdKNjBXSEVLNU9ZUm5sZktJSnRweW9Uekg0?=
 =?utf-8?B?NFJVdVg2SDVmTkxCZkZKRG4vdTlCM3lmQzFldnR4NndVMEl4VXd4MTZYbnNh?=
 =?utf-8?B?SFhtNzAzK01sUTlpM0FXUlpDRXlxVWh6QVlUa2djY1VieThNeG9WdnMvenZj?=
 =?utf-8?B?eWxuaElXOXE5U01PVUg1Z3MzNENSbEpTbzB1dm1NandhaVFUeFZrRURmdDF4?=
 =?utf-8?B?TEw4NVRkdHFpaWdaZ2tac2xPaGVzVlNyejBGYXY4dUJZVUV0MzZjMWdmQnc2?=
 =?utf-8?B?cEVxS1pFbkdYQmtlQTZROFlRTFZJTXZTeXhNTVZacWhoNUpyc0dEbXVRU2hu?=
 =?utf-8?B?WWtKOWpkWGhtR3FkU1BVblNsdmNDMmhxdVlCWnhXQ3E3SUd0MGZ4aTFmeXZM?=
 =?utf-8?B?eDEyNm4zcVo2NXloU3haMGgxNUZzeFZtRjRjcWVySmdVNlVwN0dhY0lrOFdG?=
 =?utf-8?B?aWZIL0x0eWgzU1k3OGZCZ2ZlQStPSUhKSHh0Y25YMm9jclZ2akh4QVVlcHIv?=
 =?utf-8?B?WEQ3OXB0amhUODl3dDVDdVNDS2RMNDhhYzZVeU1lUmV0U2lpVlNoUlhSaXlZ?=
 =?utf-8?B?aDB1NG5RRGs4azQzbXgzSTdRLzgyT0dxa2xxaDU4bDNSd250N1ZVNkJQckdl?=
 =?utf-8?Q?1Id6CL0wAdHX+LEaKwqaDVzSD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qqA+LsxKrb7DD2yqfY4I8+emFos0UF+iRojRouhJtQMVUFz+WczkvEmLAYaNkicn4i2ULtwM051Xz2l+GITeZJLtXLUGfMFVzIhqjuP3plfN7pXPGPRC0BVskVpEN+mUHoE32bMfFzE4RgYKFw1WBQ/gp+X06SBLzTXkSZU5sq5OrxX9nJ1Fzku2N6GVgxmedF0rxI95d9xnAlvZxD97GaqrovRBUROuPXGFUT/Wk1U1DAk6nOBcvXJrwPm5T2yju2Ad+KuBCZVXicSyUc8C6ojB+CT2sMN7kGTbJeHhS0ZAHMs/owK3ADGVK2g4S+lVOgs0RZ+w3TnV5vKqUf6DjxiMLYL7QNDNvc0Hwc9MQR2ih3wyca/MwMOWWlCIvDpioNpVudgyetPMiG+As6IdUVOsfkx3iDox2kxRo1fpR1bAWaPvklwPo9MP1cQYB8pS9USRc5rMwIBl/4YXGf0C91ejrXZf5Ui2nO2BWPhyI1nw1QacqespatS3CSSUeP8Hg/7P7XP8u/Xh9bKexSsQ00eXnBJUPPjH7a1DYUax0McLnjiNAYXwyOOestjoLLfZGqiwuFZXpA1ytxQYAakkz7M5nRlvd86gqxJF4IUXjPK6xGAQ1s9Udu7N1F1vztI73m9gTrgXXgasCSkKi8esyBH5sqc+DxMuy6gThMm0rihEjnhI+VY3bT+rw/FSobS9Z0vdcoQ6iL5rz9Q+RBt/PjXx+Nd8uQNFqunwYir0Uy/pmddJYYD4j89r00aHKsKy6gtGX9qlmaCRgyPlQu13cyVojigaBjsq1KOCefGXYP4eU+q4ZX+EoOdXXW7ULTwg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b937c18-2725-4e64-6689-08db65c79e40
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 13:20:23.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWy44NILfTjmgXUEeDEzPzV3oVD0Y+GFc4wQ0tGxr9C9QHmT+OZgaKO6/QdI6vUj/NM+B1g2S4UH8zdqgWe1TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6599

On Mon, Jun 05, 2023 at 12:36:57PM +0200, Roger Pau Monne wrote:
> @@ -81,6 +83,14 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
>      return *list + i;
>  }
>  
> +static int search_feature(const void *a, const void *b)
> +{
> +    const char *key = a;
> +    const char *feat = ((struct { const char *n; } *)b)->n;

The cast should be (const struct { const char *n; } *) to not drop the
const.

Thanks, Roger.

