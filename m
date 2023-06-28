Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8E740FC7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556423.868950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qET2m-0006pu-HA; Wed, 28 Jun 2023 11:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556423.868950; Wed, 28 Jun 2023 11:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qET2m-0006ma-Da; Wed, 28 Jun 2023 11:09:04 +0000
Received: by outflank-mailman (input) for mailman id 556423;
 Wed, 28 Jun 2023 11:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtaj=CQ=citrix.com=prvs=5364a0850=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qET2k-0006mS-64
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:09:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d5b75f7-15a4-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 13:08:59 +0200 (CEST)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 07:08:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6794.namprd03.prod.outlook.com (2603:10b6:a03:40d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Wed, 28 Jun
 2023 11:08:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 11:08:46 +0000
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
X-Inumbo-ID: 2d5b75f7-15a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687950538;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=T1o6298kNE7ixWaIRHuLRQBqSbmpS2wejkueFFIAhLM=;
  b=IBPcH2jpxYKkL9H4SzHXFxRdVa2+LcOHSTdO5Kdurz49ur3PQyDw3XEz
   86BIr58r1K7hCRYpULrGm/6MtQxt85NyuFB7WAtfyhYJKBy4fvSX0jlYn
   lt1MpXBt8w3qO+HBI1EfvezNBUJ+sgz0+CB7x2Fe+s3DvH8RYONHLaXk3
   w=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 114471629
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fr/zOqjLQWSEJMhRQKdlUIn1X161oBAKZh0ujC45NGQN5FlHY01je
 htvWmvVPaqKNmD1LYx3Po2xpkkEv5CBx4BjSFc+qSg8Qi4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4gWOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ+GCIDUh/egt6Ng46aSPQ0rM4hHMD0adZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluSyWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqnBN1LSufpnhJsqAXO6i8OKxMHaXS++aaDiGydYItzA
 kNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adjMDxGDz26
 yCHqm45nbp7pfAM06K37FXWmQWGr5LCThM2zgjPV2fj5QR8DKavapa081Hd4bBFJZyAU1ial
 HEeno6V6+VmJZuKniacTf4NGLys7vCtPzjVgFopFJ4knxyk/3+4YYlR+ndwPk5vOccfUSDla
 wnYvgY5zJRUOn2tb6N+fYOqI8svxKnkU9/iU5j8ad5DYYNwdUmE4Ttpbk6T2EjilUEtlec0P
 pLzWd2lC38BFa18zT2eXe4FzbgxyyYxxGXeSIr6yRvh2r2bDFaJUboMKkCJaMgj5buYpx/Y9
 dleMcaH0RRZX6v1ZSy/2ZQUJ10QMX99D5n5rcVNf8aJPwV9FWcuTfTWxNscl5dNmq1UkqLC+
 Ci7U0oAkl7n3yWbdkONd2xpb67pUdBnt3UnMCcwPFGunX8+fYKo66RZfJwyFVU6yNFeITdPZ
 6FtU6297j5nEVwrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:KpKqLKBcf6yH6BjlHejNsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dOwE/N
 323Ls2mxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6TEYLfI/c34+TAYegtFZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-Talos-CUID: =?us-ascii?q?9a23=3AlyIl9mtsTn4pp+6P0/Ml6bKk6IsDQm/T8HiNJnO?=
 =?us-ascii?q?DSlpISqDNY1WSyKp7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOKJjLA7oqRUIVobhJ4kZBO5PxowwvojtFWMDgKk?=
 =?us-ascii?q?pvpHbDy5SGAzEoB24F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114471629"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POf2Ik4nRoXwp6iMC+TtdiOGdyaAPAUV1Qq7zjBhm0LW8f9Qf6nOepf23KMF1lqg8xY41fn/+OlePlMaF15TUGqAjCGNXJtP3uK42jKYQn/NB0eHh7/CqNUVyYMm1KRbeNIK4Yj0P9FU4YS1Ukn97Nt+g26tI2OD3iZbBUM6oJkVrjhoTuIkE8ZWuR1enRxKDTNyvev0OK6GD5ITAYIGItkrl+94rm4HeH5qphWlBz+58X9f/pzULonlzhecm/fg6OrWS8Ibq6Qkuwx63v33/fcfyJ9Qqz1bBJlxDqATa0L5d5Jr9v+xfz9gEGrYs0PDObGVrao8wLWLhNXEJocGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdQjIBfTzR0IEWNUdj1wku4BPvPZSXv8beqDEbrltCY=;
 b=ZVAkLxXRBOt/vQ95029qdKyPtW6D/ix9ChmjunueWSBmrzF+hpAyEA/YzUIl+PNai0xTTs+Q1W41dPSs+6gls9DCoD4U147ybnlcalQDmCJ+79CkxDaKSZmD0bUqXFE4Q7tr2o8J9A7942XSM3+ry4J/JBzbpDrt5hNg0ItT3bB8udIpdzhNqsoFLOKe//IXLRkxPPvcrTrqqsAjIMhl7QTTxxP9uzUTAZAcy2GVHklcyo8zC4HPCx3M/pXv2WRdBSaCjG69xQK/nR4RQZodFlESn9HOM3mKhRAulGk5K7mJbhLqSN/c37tRnDoL+hUSHNQylGlm5oxJb3K5TzxwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdQjIBfTzR0IEWNUdj1wku4BPvPZSXv8beqDEbrltCY=;
 b=AyH0tZXyymk9CvQZGZ5YgjM+6ZfTgI7XfSfylcwnzcDX8fXnD787ng2sTSwOH+6kUYbLAcW4mxzR1PR9LJZrBv4+M/PKL8J6dXG4v+BiMp2Dnn6JB7DENhTzkreO2spwZGZXUSYEZCEdklK3QfObSWsSMsEWVnj6hAtLYYk0Ks8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jun 2023 13:08:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH v2 3/3] xen/types: Rework stdint vs __{u,s}$N types
Message-ID: <ZJwUt1r08pHhNK1n@MacBook-Air-de-Roger.local>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
 <20230627075618.1180248-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8477c8-db2a-4f99-a6ce-08db77c80a88
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/H/UnZIuC2ejkAw+jr07gGPL2/S5CcQosyROu8VODMF545lCCcOouo/IE7GOgLg3533RN6DRM05XgVCW6vTIy+wnoZN8M5eFJ9jJmOSuIrabDuzCvRMesRgFAH5hh0m4CI741QQ8MYhsz0Q6rXlgmMmJo5zVdRRPnh3CegBbDXBH0oTGpCHiEu5OEEBW5ZZ8vy1b1R9QbeaMKxlBKWvMYE4oebd7leavLRS+f9q8rtFRh3ZMXPqcMc+PhVFLZ40gDcNTAQOwT7Ve9EsJgu3SWmkbtYVsZ4zxQLlBG+ion+hWXT1bLmogKR6UeLsQGxlTpe9a3YjeBim+rlpieAJgVcli3RY9EES7TLZWRBLDs9g5aho1qhYVhcw7Oyai2HN6KspNv4HjXW4BUyfaU2NzDOhybx6F77b42UiE75lf4JfEQvHSMFq2f8QIplqKSsa1ajAd5kpEtRK9lOtpZOXIz4WXwKwubtDF3L+7q+x6x5jxr/NeqCndKc1Wz4LkonAkvew7rrdZESexdKV4TdjXrWU1i7O7QABAejzydLTahaS+Av4LOY5xXpWZAOwfFYK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(66946007)(4326008)(66556008)(6636002)(86362001)(82960400001)(66476007)(26005)(9686003)(6512007)(186003)(38100700002)(6506007)(85182001)(54906003)(478600001)(6486002)(6666004)(41300700001)(2906002)(5660300002)(7416002)(6862004)(8936002)(8676002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBkSXBGWkloR05XVmFOblhydklyeVlpNWJKZCtHejN1S1V1T2R2bG5kbEVt?=
 =?utf-8?B?WlAycUNTVUpDME5DaEQ4N3k3SWljUHFFMXl2ZTZsOFFaTlRpTFhEdlBVOGFC?=
 =?utf-8?B?MW15end6OWlrZWx2cGtKeGNNQW9nSGk5Y1BybWNoenBRL05ZZytRUS9lN2JD?=
 =?utf-8?B?Um9kb0xueWkyOWc5L1lPOStBc3NNTHZDS3NUSGVVUVBkTXIxbmQyN2taRXZ2?=
 =?utf-8?B?K080L3hKeDR4R2ZYa2NRM080bDFKaTljcVpQNFpYVkl5YXh6VU1YUmFmdWdE?=
 =?utf-8?B?OUFHd3JPV21Qa25XTm5uUjcxc003a1NEVHFTSzZSRzJEUmNuVUNkZ1NiYjNU?=
 =?utf-8?B?UERKSk1UMm1aTWJaSXFCUWVUNGVNcS8vMUNoQk1HbS9uY0R0V3QzbG1YTG14?=
 =?utf-8?B?M0JheVZzQkkycU5XakpXaXRKMkx3OG10dGptT3g5TjFFWlh1aXhjcHgwTFly?=
 =?utf-8?B?UWJuazRpMzlyVDIzSHdLNTFtZ2t3emk2alo2dVd5WVNEUGlSVGpvU3FzSWNh?=
 =?utf-8?B?K0ZzbDVKVjRFZ0R0VjlIa2hxMnJrZWJ6RE1YUGZhelV1ei9TTklmT09peGdR?=
 =?utf-8?B?ZmZQdjVzdk5nQm5SSlJwVUlnOU5xRGVDTkk5c3Yyd3J5WWxzUmlMbXhMdGlo?=
 =?utf-8?B?ZTJUQkpmMVdqT1FWKzc2TisxWkZEcFZHblhjdGFlRnBzbVZkcEZxdmlyckU5?=
 =?utf-8?B?WkF4cjRWSm9heEVJQ1k3U0ZreDBnSFJhSXBaWld1NHdHQWJhVDZNaEFNNVNh?=
 =?utf-8?B?eGZPSFYydkk1T1h6RU5NS0ZDT2daNnFLWFh4TE1rQTBHSEJNZXA3OWZpcHdI?=
 =?utf-8?B?c1NIbWsrZ0xVQzBSNldXKzIydy9tVDZZYlJ2NU1SUVZPRkdjZW5Wb2dFV2Nm?=
 =?utf-8?B?K21uOVZxRi9ZN1EyamRkT1JvVlJocnl0VE9Vcms3UlVLc3g4NkRRUlIzQUll?=
 =?utf-8?B?VzFaQkZhSUl3SVF4UzdpOXIyZkM4V3MvNnNrdGJad1F3Skx5ZW1DQkVpdVRZ?=
 =?utf-8?B?V3d3UUhBajhtMWU2TEtlWGNhN2tZRjIzbXZacmhrZ1lyN1pHbk16UEJOQTVL?=
 =?utf-8?B?UW9ocjd4Y25mRWxDRzlhZmNEMXBRZVFrZDR2bEhFUG15bG5XTE9yemJ3RnVj?=
 =?utf-8?B?S0hEd0w4a2lIa2dVY2lJaTBIajlpVExVVmZVUEVRMmhDSXhuc2ROUzN1MWdx?=
 =?utf-8?B?MHJzV0FUNTlBaFhtVm9icStLVVRMajVsRWUvNmIzbzNjeVg2OXpiT2U3OUhV?=
 =?utf-8?B?MTduTVpvck5ZWnNIemhvVE1tR3YwcTgzMG96bUxiajJTN0o5bUhEY0pCRDVK?=
 =?utf-8?B?enA0ZlNFWkNxcG9iNHljSG9HL2J1bnNONDcveG11MTl3Y3ljUGJYM29pNjlS?=
 =?utf-8?B?Rmgwem1vU0pLZGs5TW11a1dwYllKeVFYTHdha1Q2SmR5MU01azAzMkFvb3lj?=
 =?utf-8?B?LzhEU01BeHk0SEx6Snpzc2RFLzkzc0lxM0gvbmh2MWI2NXA2Q1pIYm11cWta?=
 =?utf-8?B?TGpKTHpwdUFxa3NmVDF2OEJnMm91UU42elp5VmordTB6MFVlekQ0SDRzdVBx?=
 =?utf-8?B?M0xPQ1k2RWpSWjEwYWZZK1I4dXE5SW5JVzJSb2NXTHVQY2hZZXZpSmc2b1RG?=
 =?utf-8?B?ZVkvc0prYk9jeDhqakJLbmhDTmw1VmxPVzVMVXpQcU9iNlY0S2JSNCtNeE82?=
 =?utf-8?B?ZzEwQnBSdkZhMWg0TWc4d1V6NUJUV3NnejRRR0haWTc5ZFFnMFhLUm54czMz?=
 =?utf-8?B?b2QyUUkxc0NGUVpEWDhnYldXeHFab1JCc2o3dGlhdXdsMWdiZzd0RXZQM2po?=
 =?utf-8?B?K2ZGaHBxbFZDQmRKUHh0eTdRc1d6M1pabjYvZHpWQmpDM2ovS014UjRtaTYx?=
 =?utf-8?B?N2hSUm1iZGJtMEUyam5yZnhZVERLdjE4d0Nad3RKdzlGTWdhaDdVRS9uUUV4?=
 =?utf-8?B?VTl4eFVhSEdZNzU5OHE0NE1nUTFtTUtLNHY0a29JVXVVRjEzUW83WEx3VjJQ?=
 =?utf-8?B?b3lyL0g4VWRJNHhxN3pPWXlKQUNDSTJ4OGc0N1BzOG1PQnJYd2I2V3cwSEdt?=
 =?utf-8?B?ZDZXaUxvcUExV3dSR21uWi91cldFaEdPV09yU2JlZ3YxYVdFZXpjTzNFNXhN?=
 =?utf-8?Q?xGy7/uLrFwSabI9pBZde7OQAw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?a21EVDhNWjREMGVvNXhoTlRMT0VrQ2gyb21EcDVuZFVEQThLVGx6K2dtOHFl?=
 =?utf-8?B?YzQyRWlnZVZNemlSN2NPcFE1TC9GN0swM1dkMkdSUkJVRzZTY3ZOU2p3bkdn?=
 =?utf-8?B?SVNETDBzUW94a2E5NXI1YWU2Mlo5aWFDampQTDlQZEVPQ2Z3OVVaQkRWVi80?=
 =?utf-8?B?WUJ5SHhlYTBtTklIMU9FTmxlQWROcFNFbm1XN0hyeC9tUVBaOWFJMjViT05h?=
 =?utf-8?B?UU5qK1Fodk8xdjJya2lKL0drREVUQ0JicWhXUGVUU09ELzAvalI3QWxKdVlE?=
 =?utf-8?B?bjVUU2hTOWZJRE1JYmVjTG1FdXQ1RjNiNjdmakM3eVVkdXR6RkZjb0J5aEx3?=
 =?utf-8?B?Wk5TTVdyUlNrWUhqbzVubmRhUjFrZXJBN2JrcUVwMVlHUFVZM1dqemQ1NXRq?=
 =?utf-8?B?TmtrMnV5VWVTaUdpVktrVXljYnlSMDByZTZtcFdTZ2QwMW9uMy9QM1hNWE4w?=
 =?utf-8?B?UEUrbWE4M2pvYTR0WlRSZ0dnTDR6VGR5Y2E5dWRraHVNVldIZ2pqc29jT012?=
 =?utf-8?B?bUpVaFB0cGtZRXBKeEpmMzRHeTQwaVEvYWtvUjE1MHErTURyOHRPdFY0R3pE?=
 =?utf-8?B?ZUhya2NCRTgvdldMVnJKRk1UNi84ZXFmU3RpNnRKblhWV2dYd1Q2ZitONUU4?=
 =?utf-8?B?QXdSbGtWbnkza3k0Vmk4Qk9YY0ZDZ3Y4TEJLcE9FRnRMYVdMNzdaekRaSmJz?=
 =?utf-8?B?RnhNNVdXK2RSdlpiUTFiNDBmNzRUZHNOUm1zcDJkeFdYSjRwVlBGOUZSYXRO?=
 =?utf-8?B?YU1PaGRsL2Z4RnVZTnBOdFdUN3ljd2hpMm5LREU2bVJ3WU1RdkpPdHRxWURu?=
 =?utf-8?B?WEtHNndVdmhqSW1YOFpnaVFORkovY2ZaZ2lVVE9TZnpHSUVETWw3R01ZTC9h?=
 =?utf-8?B?VThTTUd1UW1Gai85TTQyRllaV1dBV3B0ZDNvRldkODFlUEpVY3hkNzlRZUJh?=
 =?utf-8?B?bFVlcytQYTRHbTAvRk92ZkVzNW1WUTNQK0xmL1QxN3ZtdkNneXZLRGNmQVJF?=
 =?utf-8?B?OXc1c2ZjMFpxdENLT2hqVVlvNUp0ZDM1dWtCVzJUeXp2MGNFMDhTaWFDUzVU?=
 =?utf-8?B?Q2VCbVJxNlNYbHluVW9qaXVlRGU2VHFuT2tMMnk2OXo3Nzc3dVg3dFFWbnBy?=
 =?utf-8?B?NFdTdnB2T1dTaUxReFpxUXpGTkFnVS9JZCt0SHN0UjI5QW93OU5NQnZ3cy82?=
 =?utf-8?B?dEFJQWdzcHhKYnhKdE9nRWRqeVRMaStocnBIb1VFaE9aTnBEaERlc3RkQ04y?=
 =?utf-8?B?VFlMNFB5WFI4bm1ES2d0SU96dmNMQUtEZENobWc0ZCs3M2RwTkEvMzBSeWFi?=
 =?utf-8?B?czQyMG1sNnRrVnJibHBNVndGdDl1YXZtQWZRSHJ1Y3NpbDBQOGpReXp1ckZO?=
 =?utf-8?Q?zV91vMxntndpBJr1quWpkIhiSh1EJpYc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8477c8-db2a-4f99-a6ce-08db77c80a88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 11:08:46.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fycY0i0tCZajWiIgiPOdJQvzpQ4Kjq+5DHx1DD6MVLQKhrHiTqkdW6VYHVdS8E4J29RWv2rJbdQwxpoAg6jM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6794

On Tue, Jun 27, 2023 at 08:56:18AM +0100, Andrew Cooper wrote:
> Xen uses the stdint types.  Rearrange the types headers to define the
> compatibility __{u,s}$N types in terms of the stdint types, not the other way
> around.
> 
> All all supported compilers on architectures other than x86 support the stdint

Duplicated "all".

> diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
> new file mode 100644
> index 000000000000..4cf82790f196
> --- /dev/null
> +++ b/xen/include/xen/stdint.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_STDINT_H__
> +#define __XEN_STDINT_H__
> +
> +#ifndef __INT8_TYPE__ /* GCC <= 4.4 */

I'm possibly confused, but don't you want to use __INT8_TYPE__ if it's
defined, and hence this should be an ifdef instead of an ifndef?

> +
> +typedef __INT8_TYPE__        int8_t;
> +typedef __UINT8_TYPE__      uint8_t;
> +typedef __INT16_TYPE__      int16_t;
> +typedef __UINT16_TYPE__    uint16_t;
> +typedef __INT32_TYPE__      int32_t;
> +typedef __UINT32_TYPE__    uint32_t;
> +typedef __INT64_TYPE__      int64_t;
> +typedef __UINT64_TYPE__    uint64_t;

Thanks, Roger.

