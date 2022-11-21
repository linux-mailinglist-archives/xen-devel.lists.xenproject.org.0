Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C2631ED6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 11:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446507.702114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4RG-0005jG-Me; Mon, 21 Nov 2022 10:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446507.702114; Mon, 21 Nov 2022 10:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4RG-0005fk-JH; Mon, 21 Nov 2022 10:54:10 +0000
Received: by outflank-mailman (input) for mailman id 446507;
 Mon, 21 Nov 2022 10:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFi4=3V=citrix.com=prvs=317825b77=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ox4RE-0005fd-Uu
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 10:54:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1009760-698a-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 11:54:06 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 05:54:04 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6204.namprd03.prod.outlook.com (2603:10b6:408:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 10:54:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 10:54:01 +0000
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
X-Inumbo-ID: d1009760-698a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669028046;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FRHsnaIg+6wT3rKzyFR1BgKLBJcUu9uYnF0YbcQXc3s=;
  b=ABjHg7SMwvlBbM/KIU2GDWLWObfb2zFzP4AH/uWyE8M1Sfi3O17vMCcE
   6Ot3dWKeZhKRuM5yorivvw9CFVeU0yvo33yEAQ6AqkzL0ialfOf+C4JzQ
   gqgCL3fSocB2yAdDitwH3G3B77D7g/LUU0Lo5gfjex8AgygfY3p+d7tqM
   Y=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 87780530
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DPVSj6rs+TpoMyVf125QmISBBbheBmItZBIvgKrLsJaIsI4StFCzt
 garIBmAM/aPYDShKdB2Yd628h5VuZeBndFkG1Fkry5jHypD85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzSBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC5QUT+f3+Pp+rycTvVxvZoNPfvSFYxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCN1NROXlraYCbFu76WA0KQwKBX2Ho+CrgF++VP9nM
 xBK9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUcabDIAZRsI5Z/kuo5bs/7UZtNqEarwhNulHzj1m
 mmOtHJn2eRVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:Y7dzSK+ze4+4LC4MUvJuk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="87780530"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6WpdUAZIRGp7+T4lhroEE6Gyyy9weVMc0mYaevkUCFSTkNj92iZiYcfhjgB3Kt0h8OwPQhwCb6Tf35Wy/mTLbbOXXz7vnU8Bv7//UX0LOlQruEF1kh+bW1f7LWeK7LUgugQya5C9XiWZkke3iuiR1iC13+mYnaKO6qsfEtO7c3Yccs5Uqxw5x7UHsXKnf733H15C1BuKv9ItnINcdoN6wi02EWUO1NxRsETnYGbDM/po0MPoMzIJoR0kqHVQjk1IGbTiQ3rHTTFsyByAM6+V4HJhCOzch0h6WHKlsQ802p1OEPVDCKlXNrna1mMmcZ9HNjWpfkZ09pbEeSBbaUhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXPRE9/w0IxQsZlnqZBqfQmBsGGlHugRoDRt+bTKGTA=;
 b=MnRE207ElzERtrTYRtqclrSbVRswoQVl8C+9cV0okfVjRfULc+XgDznuAaDJDLf8faDQPB+CPOKDQypanAjn++26vpNncfyQsWs9KToNruyj8xBDxtIUMv5p2uQOZRRUVcZjN5Hpc5ZjeMgZTnXjpy1YBnnudFNbU5tJy8s+J0zOHRBRZQvKKb09rn8QlAu3B/SV2M/Qtv0e5arMzFuNTBXSfE+pRsNizU1zUIpf8XPJ+jcwRhpJuJ2iVUhIZuxnydfRhnVUlDBTVrtKsZp7A5huH3mLLDW1J+gV5Kp/rS1mVzDu+5mN8Fo2AQVnazHbK0gtpLZub7vQj7BhbTtI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXPRE9/w0IxQsZlnqZBqfQmBsGGlHugRoDRt+bTKGTA=;
 b=azeJvRbNPKnfTDLxHE072vJ+K849y1j1mItv1KZY58sdYDQxpbYyf/SJMMEoFIqKwov8YaWfPtu+PxNLlVGX5j+FBDB6QMf2jJQibcEqKiGWd0ewVNiF73rMJ4cptHwGdWQ8EPbntu0yDkZ3og1VYro5DXTM7qhd3jy0P03XUSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 21 Nov 2022 11:53:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3tYxMSGLDtBLHVc@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <Y3eWISfCCW/ktjB+@Air-de-Roger>
 <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
X-ClientProxiedBy: LO6P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fb676d-e592-4912-0339-08dacbaeb2f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PL0Q3i7xhWfPjHrZ0I22uZksEmMsj+kAiyQLMF4e29zX9nsQIQzXp+6wlvMxkt2pSNxWofdSgIZ/tdw8vUPxYNEewlUym5Axs7CyrnwiYwsynYix7IOQEjFsmLmVTgFr/KbNGSop8dIh4jKt0MzbeCabhdi5cGmc7Ixd5qpK3f33jBcCmv+YjYN9C4emktaBENnaby7GefhlZL3yObzdtLJ2Zh7qQ+UkmU3WiJIxQPIrbSGeDIY4OEJbrod3kL+3a4UMiQyrq0kMsx/v1VxGs8k2YrS5WQ6jSI7hvr/7U6fM3+nhpFquonebn8fyBO8hSwLCRbVZwLcXJHdphJ9VzTf4d+Ov8O7ouPpmRYsWASaJlsj7u6QKDo+P0shmbhvOGGMdoNCNnafu2gz+Ad+VtETelsN4Oab5ciZm7JSVZ//dKN7EKEzeQGGPDQbvDKerrP8J4OMYi48YVCqqZcXF/v+WtFpNRJxGAt1a1u7mjM3pMOsGrtDQWU9TehqMIx7po6ofC+gBkCJTwo8qiCNy2q8MPranb7ku99HUVzSbfIKXNq5YRj+REpHSdT+Xdjdh3nvv10SezyouxEMvua5rla/DRV9S7ZMRcCrTLiVkvm78ognOZYiFWARamukiuH4JLiXWTPkAOFEv3m8Dmw/oHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(2906002)(66556008)(66946007)(53546011)(41300700001)(86362001)(85182001)(4326008)(6916009)(6506007)(38100700002)(54906003)(82960400001)(83380400001)(33716001)(8936002)(8676002)(186003)(5660300002)(66476007)(9686003)(26005)(6512007)(316002)(478600001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHFNR3JnODNSWkQ4T1Y1aVhrbnNlVjFLMkxKSi9CZ0VjL2NLVTRIcjFLN01o?=
 =?utf-8?B?VVdoS1kybnYwczNacXMvcldKN2tLc1VaMGpNWXhMTXZwVFBtbFFhOUZoK1pR?=
 =?utf-8?B?RG9HeUsyUy9UQ01QV01Da2FwaHovVG16OEhJTldhNk5hbEFOVHN1WElFZDBM?=
 =?utf-8?B?dG5YNlBFS1Vtd3lWdzRQYWZxdktnTjR5aktQbkVxZXBGN2RvbXcwbWhOdUM1?=
 =?utf-8?B?MWwzeDM3NzhCbEg1bTRuVldKSGR2ZDYvZ2xPS1ZwbFVCUHZWSGtPY3Vuc0hm?=
 =?utf-8?B?RWxub2NYcTZiYUtPbmJpQnErQlJEM2lReFB3NWV3SjZsS2hGR1I1cGhYMXZn?=
 =?utf-8?B?WDdiZklUdEhCMmp6YkxrUkc0OFJLMTVLMGVkaGVweWY1R3hybjkvdEFoV1J5?=
 =?utf-8?B?SGJXbnlKcWg3Z3N6dE11anBTTzFJSHkvYldybHFVZ3dJTTlOaFdHUys5YkZq?=
 =?utf-8?B?WkQvS21Zc1hXMUMwU1M0Zjl5T3FtTzFrQUluOU4wbi9JNHdmSy9wdFVGcjBt?=
 =?utf-8?B?OVJQWmRudVhmQ3JuUmlZUEs1Y0I5bElBVU5iQkhzNmJjQ29OZXpEK0VMbUhs?=
 =?utf-8?B?WXVxSkVDRFA4STlzZVhvQ1NaWGFYcHdyaFFyOHpaSzZJU3N3UTh1TTJBajBO?=
 =?utf-8?B?a0VBMGRWbnRhRFpMWk9iQ1FDNXdVNkhkNENFRW16Nm5LMGkwM1BuZVp3bCtk?=
 =?utf-8?B?bFZKYnRVRWdZMm5HUkVuZnNqVktMRGFiUzMrU0JvUXRQTjZLNy9UeGQ0RzVT?=
 =?utf-8?B?UE1LVXJMMWhtMSswMGduRmFWQ2g1SnlmeCs3cmJzQjN6TWRrdkhSdkZkWDM2?=
 =?utf-8?B?RXB5UVlnWExoNDcrb3lrVUlkVndHVUtBUGJRaUtHVVFJcTZCbHRaVE0xZWNY?=
 =?utf-8?B?TEhKSXQxcTdUVy9xcEhxd2dUNU1ubnYzWitHMlQ4cnN4cUJVenJ2M3dFNWNY?=
 =?utf-8?B?R0w2RGFIVVYzZHBYTmF5ZkRBeVVCRmt6WDRaT203YlhyMFJrQmU2R281dVpp?=
 =?utf-8?B?MWcvZVpYTDROTndYZ0Z5dTY4N043NW9iRG9kdk9RSG1ZNGhlZkFiR3JXRHVt?=
 =?utf-8?B?Rll6RExhTGplWmNaUW5LV2pXM1NsbHVBQld0T2hsK0VpRy96QUtCQVN0N2Zq?=
 =?utf-8?B?anBPbGxjZDFiV1pWeGtpb2dZTUs0a0RZYXZqZmR6UTQvQW5Ha3IxK3ZSN2ZZ?=
 =?utf-8?B?TGFhWmlTMWc3UXhDTGk1ZXpDOGlaKy9LcHM1NTQyR002bGFNamJsTENOUW9q?=
 =?utf-8?B?b0dPNGN4WXZQdXlpV1hkVUV2REZ5WHY5K3FCbDVXMUczZjVYVjVxZ09DVzFS?=
 =?utf-8?B?ek54Z0hzS3hZU29LZ2lyaTRRRHJKWnV6c1lBcW9RSEtpUXRXZ2E3SUFxTE9W?=
 =?utf-8?B?OWhZTUJ4T0dWT0pPWFJxMEV2YXZQZ0EraVYwOFNVUFczWnR6WnVnL1ZRQW1n?=
 =?utf-8?B?dlRnYTdqcG01aFdlalpJQmhVeFk0SHprUWZBY0pGQXZSWEVGbnBUeENoVzZz?=
 =?utf-8?B?SW15QnpFbzJMb3VjUThBaEFIa011K2Rla3MrQ2ZvMmQxMnNEeXhHMCtmMFFo?=
 =?utf-8?B?UjB5Y0VtU3RxaHFvWTBHYkd5eDh2WHRiYWNuZ3JXUzNERmFNM1BZTC9BNnhw?=
 =?utf-8?B?MHkxSXAybUZpTVdJRUltYmJaNG94MzVFaldDd3ZDWjZ3eVQ2QVovd05OVlBF?=
 =?utf-8?B?cU1vdGdyZGtvZUh2Vy8zQ1dsaFhmTnQzTk1HL2M0WGlicHViam9GUkVaR0Fw?=
 =?utf-8?B?cjJseEdETzB1SXhKVlhGQzlPbkpQUDFCQW40YUcwZlR6YkpiMU1NMnRhUG9F?=
 =?utf-8?B?VXhZUmtzeHM3WFJjTnBQYmpENDBKdFRvaFQ4cVArNFozTGFBYVFJRTg1RWFY?=
 =?utf-8?B?blg3ME9wTDZvSEJsNVJac0RhOEw4NmpYTlY4V3lKY3RjdmR5eEZuMkdUZk1y?=
 =?utf-8?B?aGNBbGhrYVJMSzc1d2R4eEVlQjF3ZUZUWGFIcEV0RDNFTkNZY3BDZ0ZyZExE?=
 =?utf-8?B?Z1ZvcUtsRmZaQ2RmZWoydEY1RkZrdTJ5eVZrbTc5aGkwYTdwemx5NENJSVpl?=
 =?utf-8?B?Z29TYlhTZlJJaHhvbE9hTVU0MThwMEtVL05JNCtFL2JheFdzZ1BpVGhqWlJI?=
 =?utf-8?Q?JH3Gg8mwrkn6pMS2+Hg9c3etQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m0LbAa7i5K636D7bYdNsXqFOywKo5jlVAirWvo1xS4wEIKOdLKjdEGly1IOIKAO3CGfChcHi2GqyFX2uDOi9xK0zTFGcIOXy3F/5D2ZEW8IgYInZ9/69pI+tHYsy8fwPORGr45HCwgx+grSbLzQox5+U6RtOiWBAAKjCKbv5qEYbNIl0MQ2DoWool4sWKwfGpHT5NMFNmuKak6+G5lq1IUBQ3JBfIOM0v5jXOszrmJztne1LzTpZEdIo+Zg2szE3VH0przWvW10S1JC7JIqMKlljaBCEz+oOFshVP4f1wKoGNBHF1iW2X7UXnPl086WWPf/mG3uFm2+UGZ0MAHXy5cx+4Hyw1tNx4WPAYkId+JDnvtrIuNmo7dZ05TZ1K/hHJRf+8/U9kJKWdTjS5ID5swUUOb0xaULJmlHPyk7726fI+4uk5iAtQgIi8R16+QSK+3xgORsMVppRGufUlOkMkElaPMuIyUfiLVeAK+ebT98b/mtDrHnRtEUAX0ZlIXZSww6CWKl/1gWmgpMtsWRyHtcznigzhjqumdGzEF1ZUWF1yxy0Z0VtZSCJN7knxiMzPblVzIqeJ4UqvfHExAeaFq2ymkOUnPiEe2ruLWznZtJ+Lw4UtJPGC8wmOZyCmc32+FGPPEJoxtFJjCzXcNg+dQUwAsdHjdhQlFYxlP31tPitu6SAh/xFLS7clbFGnYh6+XzVH/V0XLOiN8KcBHKexPyxRvvN7KFGlpZVI5azKK7F3J7fd7KRy/OSiUQOxRB2cTPDBwkv4oGlt1jiyJ2FzlE5MwWAWnQFXl9zWSj+74RsyBbNDYtYszd7avYAJ824qY5JFP0SVO75JuyJTazAY+MZwzer2J6br0kaIAXjtFM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fb676d-e592-4912-0339-08dacbaeb2f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 10:54:01.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSo16z09zSaO55tUhVVJBTqZNT/VDfpQ/rY9Gc8fe/Or2YwQYRBtIgz72dqA7cPsPEEvF85hG55d2uk+CR2YLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6204

On Mon, Nov 21, 2022 at 09:33:53AM +0100, Jan Beulich wrote:
> On 18.11.2022 15:26, Roger Pau Monné wrote:
> > On Fri, Nov 18, 2022 at 11:31:28AM +0100, Jan Beulich wrote:
> >> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> >> exposed a problem with the marking of the respective vector as
> >> pending: For quite some time Linux has been checking whether any stale
> >> ISR or IRR bits would still be set while preparing the LAPIC for use.
> >> This check is now triggering on the upcall vector, as the registration,
> >> at least for APs, happens before the LAPIC is actually enabled.
> >>
> >> In software-disabled state an LAPIC would not accept any interrupt
> >> requests and hence no IRR bit would newly become set while in this
> >> state. As a result it is also wrong for us to mark the upcall vector as
> >> having a pending request when the vLAPIC is in this state.
> >>
> >> To compensate for the "enabled" check added to the assertion logic, add
> >> logic to (conditionally) mark the upcall vector as having a request
> >> pending at the time the LAPIC is being software-enabled by the guest.
> >>
> >> Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Don't one or both of the Viridian uses of vlapic_set_irq() need similar
> >> guarding?
> >>
> >> Is it actually necessary for hvmop_set_evtchn_upcall_vector() and
> >> hvm_set_callback_via() to call hvm_assert_evtchn_irq() when
> >> evtchn_upcall_pending is false?
> >>
> >> --- a/xen/arch/x86/hvm/irq.c
> >> +++ b/xen/arch/x86/hvm/irq.c
> >> @@ -321,9 +321,10 @@ void hvm_assert_evtchn_irq(struct vcpu *
> >>  
> >>      if ( v->arch.hvm.evtchn_upcall_vector != 0 )
> >>      {
> >> -        uint8_t vector = v->arch.hvm.evtchn_upcall_vector;
> >> +        struct vlapic *vlapic = vcpu_vlapic(v);
> >>  
> >> -        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
> >> +        if ( vlapic_enabled(vlapic) )
> >> +           vlapic_set_irq(vlapic, v->arch.hvm.evtchn_upcall_vector, 0);
> > 
> > Shouldn't the vlapic_enabled() check itself be in vlapic_set_irq()? We
> > certainly don't want any vectors set until the vlapic is enabled, be
> > it event channel upcalls or any other sources.
> 
> In principle yes, and I did consider doing so, but for several callers
> (potentially used frequently) this would be redundant with other
> checking they do already (first and foremost callers using
> vlapic_lowest_prio()). However, looking again I think vioapic_deliver()
> and vmsi_deliver() violate this as well in their dest_Fixed handling.
> (In both cases I'm actually inclined to also remove the odd *_inj_irq()
> helper functions.)
> 
> > Maybe best to add an ASSERT in vlapic_set_irq() to be sure the lapic is
> > enabled, as other callers already check this before trying to inject?
> 
> Perhaps, yes (once we've fixed paths where the check is presently
> missing).

Another option would be to unconditionally return 0 for IRR and ISR
reads when the LAPIC is disabled, that would avoid having to force the
event channel injection when the LAPIC is enabled, but there could be
more than just the event channel vector queued in that way which would
be against the spec.

> > Also, and not strictly related to your change, isn't this possibly
> > racy, as by the time you evaluate the return of vlapic_enabled() it is
> > already stale, as there's no lock to protect it from changing?
> 
> Wouldn't this simply match a signal arriving to a physical LAPIC just
> the moment before it is enabled?

Hm, yes, any guest trying to play this kind of games with the APIC is
free to keep the pieces.

Thanks, Roger.

