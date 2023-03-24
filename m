Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D685F6C7DD0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 13:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514297.796407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfgLB-0001EN-Fo; Fri, 24 Mar 2023 12:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514297.796407; Fri, 24 Mar 2023 12:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfgLB-0001Bz-Cg; Fri, 24 Mar 2023 12:16:17 +0000
Received: by outflank-mailman (input) for mailman id 514297;
 Fri, 24 Mar 2023 12:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfgLA-0001Bt-Cq
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 12:16:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98d330e-ca3d-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 13:16:14 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 08:16:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6053.namprd03.prod.outlook.com (2603:10b6:208:309::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 12:16:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 12:16:04 +0000
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
X-Inumbo-ID: a98d330e-ca3d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679660173;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OV4ieA3tts6XmpPtRrrSXZOT6+1FTFtCKlPxLRL9vEQ=;
  b=QcOpt/ZWRIcaVVmT4f8oNy7F3MH8jqT7oOiXdd/pkxFTRVStADjCAo1o
   btXK8D56PDySQFXHQY6IxeAYPxb1LGbB+pt32Yg6GGdTUGx1h+hqddd2e
   sU1EQ0M9PkdmX/pL/BVg6FQM5mEW1n9JP9Abf9an4yrKgk3EEyBhbKh7u
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 102186502
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:48zmAKu4OjMov8+WGB4UMrRSfufnVFlfMUV32f8akzHdYApBsoF/q
 tZmKTrSOfuOMGf3ed10Yd/l9EtSsJ+EzodnQFRs/y4zESoW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOSINUyqFluWK7423Zrh0vpoOPdG0M9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgrKc63gDLnAT/DjUxCEKgqKmakHSzfN5HK
 UtL6wg/oqYboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQXO
 kShmtroAXlltu2TQHfEr7OM92rsaG4SMHMIYjICQU0d+d7/rYovjxXJCNF+DKqyid6zEjb1q
 9yXkBUDa3wopZZj/82GEZrv2mLESkThJuLt2jjqYw==
IronPort-HdrOrdr: A9a23:7npTGq1y5jXys0/DKDSY4AqjBIwkLtp133Aq2lEZdPU1SK2lfq
 WV954mPHDP+VUssR0b9OxoQZPwJ080lqQa3WByB9uftWDd0QOVxOsL1/qa/9SKIULDH4BmtZ
 uJf8BFeb/N5VUTt7ec3OGze+xQpeVu/8iT9IPj80s=
X-IronPort-AV: E=Sophos;i="5.98,287,1673931600"; 
   d="scan'208";a="102186502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciV+xoz3q+gXo4IDG48Ao40yZdANjPo5fanExoF5M1+S2wpFg7KumDwYHOrrYTtYNhFBeUBNzla6m/NiHBOWAB/YrC42RWkqS46zfgglwfQN38rL9V2pl4EMyVv2fZyNxzfB34xdBzhYCNLk54MDyS5WyOHbhySgBruu7JixZ24YrgmPMvcmxGQJlg6Mpa3pidjpFvtFCn8uim79Q7Mm5OCYub79kCUz68zEUzfVOD+CI1fLlI5A09zHTO+G1QDUwhAvaJPF4jOFjXfLYMbtrhZujKekO3i05xG1V3nWG5H75MLRZMVdoDsjet/UxRHckBk2uwMvmKJj3YQSOzanrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+3AYN/G6DDqD5rYkzUHJWi9jP6p/gpjXT027LhFltw=;
 b=Dh1kWPQqyPvo+X1TC20yfb8XEbIr8kp0ViYWlcbRhcA3wt3HE/3q4qqU/MDRw0PLGsb8T+r1nOS8efu+QZncRkV4mca21iytHWjg6opJXAsi2uv4Uw9r0gZyJaLz67rxbMqpwv2ubfH5sEeOsKk79SlQY9W3tGeyfa8ex1pBFjyCfoJ1Zptfgs64y+lVj8LMm8B4naW5X8E9h7+kgFc62wAMcBZgACSn9b/3H+YEzNQFM3Um9MOWkjtkWnnT3jtx+GKXN9Z457ETIMeo5QwaOdnw1nEAOBeI1OYCN8uo85r/Mp7pKnBIVOA1oXgI6Hlkxe8OyDKcYrBv2RzT2KHBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+3AYN/G6DDqD5rYkzUHJWi9jP6p/gpjXT027LhFltw=;
 b=qi+kuHw4OR1140pYHLrfL79b+7Fb77eGZlhbcnhhX+ACFZ9FtNzI53bmuRIC66BA9UXGdxEYTsxEjEFbW2vTTlOgNbpuPnPELJtHsxWMKGHemIrhP5IHc6KhjegUwh2eh1nPR3NY7GTtKN4g2glcDM1mRVxQkcAqnNhz+arroD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb3650eb-080e-b232-cbe5-453d638b780b@citrix.com>
Date: Fri, 24 Mar 2023 12:15:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
 <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
 <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
 <1eff8db6-c358-9597-6096-0a1312d59712@suse.com>
 <6f59d2a4-fcb6-77a1-2cd4-51e032fc80f4@citrix.com>
 <18957f67-7afa-1327-6c31-ef38edac8211@suse.com>
In-Reply-To: <18957f67-7afa-1327-6c31-ef38edac8211@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 160c9010-2fa8-456b-1e06-08db2c6189c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W47Tur4cxQDdia2tk0fkhPjWWcZvxAXw9uIxOfA8Pj3RBIv9OMg/eRQDb2uDrQh8wrbmudlWrehWq0hSO8y2CbGg1gX8mj3Tbv8Zdup2FMok9Oaf91PBQYnLQQTKGFTeGCcLJEgFnsDs5RRKsWumep1QR+BvoPvzXRrGtGiC3Q0ZpqSWNbRezWDXso/i4EZtd4nV4AO7xrYMcBaxJjLeSqM/PVpaQ16jVs7zRo1Zm7jXvLGydIEPTgmQ4ViqDPfgzHgwhzizkuaXvvnixuGBt2LU5Q82C7LNsEjsrl2ZVHVKLJ/I/9YO7H5HwAiGM8lpODb7XCYO/i8E+POUk5wtoYio4vF7Kbv2N3bsfcxV9F3+tRjhE1PA4/uab9+ByqfrTQpN7ugNmGhLXfbA5qZS6bdw7b69wsuQRdjiK0zSbZ+QLaK7g0Of57pTObpBXtruxmUUxsd8tdderlRWMuDoM12o3Hyev4w3SInaBlYfMuXkPSrYrn4lP1zkRhCFTtzkj0yqmClC4Js7LwxlRaw7zj+JcfPyv/EkZ6B9ARqpV4YJQ3wlXIrDOXlr0r20YPSGuoEiesECbrID/MSmRsSXhsYFJeMZ3Cq7yI58LSJQDzjghT5TgOwYivrZCIJi6UzY3FXVIIvnZTnLcd5Apkz4GVoYP+cfvBnZ07m8GwPbQmZflZ02pD+48CRk9g1RhmYAABDChbFEQX/jTAGjkNyFXGguE60ZNWf2KqWJsQBJolg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199018)(31686004)(38100700002)(82960400001)(36756003)(31696002)(66556008)(8676002)(66946007)(316002)(478600001)(6916009)(66476007)(83380400001)(6486002)(186003)(6666004)(53546011)(6506007)(26005)(2906002)(6512007)(2616005)(41300700001)(5660300002)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJLT2pPZFk2Sm9UUHRXUklFYlVMelJKWU5IZGRiR0QyTDBFdTN0eG13dHFZ?=
 =?utf-8?B?UUlEWkJ0eVhDRC9TRjlmR0JBc2dXVU5Ra1ZGdzA3UVdUV3JSbW1hYU93ZHRG?=
 =?utf-8?B?bThCdjhMMmJVUmtoRU9oMGQ2VksrOUVIMThxVlFGZEV1ZVVadUhTbEJmbEdK?=
 =?utf-8?B?ZnJKOGNvMXhqTjMzNlBSVEtnSUVUcVk2VGFLdHd2alBIaTczTDlKNFB2S20x?=
 =?utf-8?B?dG1qUDhNeTYxbkFENEdtYm1FbysySDM2ekFDTFZBb2hZeC9wZmgxNGJuSkNI?=
 =?utf-8?B?YnJReUNnTHM2N3NHTDBqTnVRUkRJaEpudnRER2h1ZitRMHdIK1Nva3Vpd0RI?=
 =?utf-8?B?dE83OXVxcXE0NlF5RlBNaFNhZjNGbGwrTzhzL1VKNThFSkhraFMvU0M4dzYx?=
 =?utf-8?B?QzBud1plNmYvOTR1czZSSmZxVWFzQWJUOVNzcTA1TnVIdCtCSW02ZkQ3ZHZh?=
 =?utf-8?B?R1hxcEhZMUtDREpNZUM2Z21IcmpFUEc4ZXBJcVc0Ylp3UVVxYjlwVEJnVUFq?=
 =?utf-8?B?UDFRWXZNL3ZCdlRaV1pmYjJBQzBGTHA0N3poV1FrTVU3VFhnMThnYTJMTTVn?=
 =?utf-8?B?cVRLaW9aRWpRamhkRzFiRGIveWRhd0xJd3ZmKzFXT3BDOGhraTNWMUIvUVc1?=
 =?utf-8?B?SlBpSHJhc3ZtaFZXZFZiRWZPMmJkUnZ3WmFuNEErb1UxSVNFem4wSGZkcldm?=
 =?utf-8?B?czNpK1FVYUtkOW9ta1JDQVZCUUdxVmZpTjlsUzU1ZkZiN3RzbVY5K1dKZ25v?=
 =?utf-8?B?WSsreVZwTlBQWEJkMjVBWjc2YzV6L0JFeDJ4Yk15SEJxWU5PU0hFTXYvYisz?=
 =?utf-8?B?WUxReWUxblBWUFFKWkFyamh3c1ZNa0RZODVUdWg3MzF6ci9jQ24zUDBzY0VV?=
 =?utf-8?B?QnBXMUFDdHdNRThYQU1kY0ZJVUEwWDZ3VjNXZ3Z3Nm1EZVNEU0RBcFZMUlFw?=
 =?utf-8?B?dDI5MEwrOUUwbjdyL1dVeXBTSFU2SVprL3RRV0Q3WTRJVkNXaHRWYWk1SjZ1?=
 =?utf-8?B?UTk5NUhiSnlZVEVoTWZZNEgyNW9xRmdlWk9FSFR1N2EwcU9XR3dDM3Y2RjBx?=
 =?utf-8?B?c3JpSjBjcTc0K2FBQnluc2FZVzdBY0MwVmQ2cGlDbWQrdWl4d00vamtKL25F?=
 =?utf-8?B?ZnhmUEYvemwxaDRDR0RCc2JqdW9CZnc0VVdnUEovREQ0YVdnRVBYQzVScW91?=
 =?utf-8?B?c0EwZDVNUnpCbnY3RERqdlVzQjdjR2w5eVJjemo0YzlpU2Q5ZjJoYzFxOFp4?=
 =?utf-8?B?cldYWkJrNjhWdGtMMGNuMUhaTGZoeFZUQ0lxTW1wbTNsNVJIZmhZTmV1TlBL?=
 =?utf-8?B?WGFBR2JpampPZUdFWXJKakJtVjhkODBFa0FRZndwMWt4UVAzVmM4ZEFsQjBq?=
 =?utf-8?B?TEIxM2FlSFF1R2RWdFJCUXhnMWw3cjFoZjdIc3U4U1N0Nk1semozcUpxYW9Q?=
 =?utf-8?B?eWNmRzhHTXpZOE51RkFzRU9zQTNJL2R1eXlnQ2RPaWp0NTdTRFZWRThsTGox?=
 =?utf-8?B?azEvaXE2eitvV3I5bkVFMkI4ME8yTGdBUkE1ZEpVUWsyNkhQeGZvejFYb0M4?=
 =?utf-8?B?ZnFXTmloZFJmU1Y4TzNXdlN1OFhvb2EvZk5WM0ZCRy9QaW5BdWJyU211UHRS?=
 =?utf-8?B?OW1EdzQ1Z2hXcW1CaC80bHlFaHB5cnQ0eHpvUkRoS2phR2RIb3pnTStkUzhW?=
 =?utf-8?B?aWovQ1hxeGViZlgyMjBhNHl2Y2VCR0JVeVQxWU5RZmJaR0NBUVVvMmN0RXRJ?=
 =?utf-8?B?Y1U3VGRDSnpaVnJ4aWtreWZIbktkTHNqUG9wNmtjbGtKNDFPK3F3V3lqejc3?=
 =?utf-8?B?UkIzQXJCc3NyMkQ0bzNDc3pHNG84QmFnOFFsVkJNMDMyZ0gxZ2FkTG1YNkJi?=
 =?utf-8?B?SUlneVdGMCthZGNVd2dVY3h6c0FQM2lSUXdqMEg5a2hodWlFaHRscmNmUkNO?=
 =?utf-8?B?cnp5RUlDcFl5aGJYUk94K1pOYjFWV1lSckI1S2IxTGV4amszcjUvOXNZTElL?=
 =?utf-8?B?VHJYb3dya0RQTEV0YTJ6S0JuWjM0U2dYQlRYT2ppTnQ0U1J0dEZxSG5EZDc2?=
 =?utf-8?B?S01FU2tHNExSNzNJd044L1FqRHNmcDZKdVdoTGtRelRxN2ljYytpSFJXNStm?=
 =?utf-8?B?M0Y2UCs0dVo2cWduS3c3a3dCOVFrZXFnc2EycWhBekRKY3hSSlNYK1RVUkt3?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RLTlLYmothMQAURyTydx5iBEks+PtiInOmqoIl+VXBTBIR/4UKe9oFtsYby8rBoutztxrMRMV7kQVe1I87nK7iUbsS/Knl/KDXzpOmuAn0x3Gv61NvFIY1j2Ww5VyRGRzWJtQdubGuCAQLcfbuArsDX/qIuIIomkgr5jqLOyrZTrNTgLG0nq33hgkG/tXU9TsMeJwcyWpkne2rIjlsycphzYvH5E5XZS5ghtXCovTQtAHZ+0A+LbDCQQvme4eHzsAZQDYoU3L12fQI3KwSZTDVuMRZvQwECVY7y2TNM6HvYLqw0xr+/fMNsrYcxqIwkc+7Gebn+meUZIR838kqFEao/M14nqXaEnTiEWgg6xwC2nU0dytpCKi9z0Kro9QsIn59O8paGds+pLcoHadhLa9VemeEQMRrV+WK5SeWTUTd1lVruAEvgSTSAmSoQryWvVigfT0bk0iE/YjwjnRVpl+tSqcoDzciQwoocIX2mdMrSooraieR5Mu6wBcO2Judh7HQQEzFF1c9izl84Ha/PAa8uEuBa1JX9sG3WZlDrqrt6nghWdJoQH+TrWELklHWopzrgm814TXddZKrn2RM6l8hEqnJytf43fn6nflk8N4U7TZtrfVI0+MdSpPIek7w9QChqL7luHdO37kW3ZFUUHensHopTOIWe7Vp8+zYzNqqREBlBhe6JhthvQtfMSF6ZQ/xvv5w7jTEn7gDj+Auhy9EncxWQ/kwONRiDjjuS5JeSHsGi6jPoZwCRJByfRF4USCutz3Md5Qx52djrfImSvUg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160c9010-2fa8-456b-1e06-08db2c6189c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:16:04.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5KaA1Aoa4NUMh5HOmC700Ic9dsaK1weKm8b/7IIfyq82oCDsWZSwllrlPWNOmLrgRcFInw9pdqpY24cv7ffXrkjFRdXeOKWF0wl0RzG1ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6053

On 24/03/2023 9:32 am, Jan Beulich wrote:
> On 24.03.2023 01:59, Andrew Cooper wrote:
>> On 19/12/2022 7:28 am, Jan Beulich wrote:
>>> On 16.12.2022 21:53, Andrew Cooper wrote:
>>> Again - one way to look at things. Plus, with Demi's series now also in
>>> mind, what's done here is moving us in exactly the opposite direction.
>>> Is this hot enough a function to warrant that?
>> Yes - from the first cset, 9ce0a5e207f3 - it's used on virtual
>> vmentry/exit so is (or will be) reasonably hot in due course.
>>
>> What is more important in the short term is avoiding the catastrophic
>> code generation that Clang still does with default Xen build settings,
>> also linked from the commit message.
>>
>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>> @@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
>>>>>>          *guest_pat = v->arch.hvm.pat_cr;
>>>>>>  }
>>>>>>  
>>>>>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>>>>>> +/*
>>>>>> + * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
>>>>>> + * memory type (0, 1, 4-7).  This is a fully vectorised form of the
>>>>>> + * 8-iteration loop over bytes looking for PAT_TYPE_* constants.
>>>>> While grep-ing for PAT_TYPE_ will hit this line, I think we want
>>>>> every individual type to also be found here when grep-ing for one.
>>>>> The actual values aren't going to change, but perhaps the beast
>>>>> way to do so would still be by way of BUILD_BUG_ON()s.
>>>> Why?  What does that solve or improve?
>>>>
>>>> "pat" is the thing people are going to be looking for if they're
>>>> actually trying to find this logic.
>>>>
>>>> (And I bring this patch up specifically after reviewing Demi's series,
>>>> where PAT_TYPE_* changes to X86_MT_* but "pat" is still the useful
>>>> search term IMO.)
>>> I don't think "PAT" is a good thing to grep for when trying to find uses
>>> of particular memory types.
>> This is not a logical use of a particular memory type.  Being an
>> architectural auditing function, the only legitimate use of these
>> constants here is all of them at once.  This is the one place you firmly
>> don't care about finding when asking the question "How does Xen go about
>> handling WP mappings".
>>
>> I have swapped PAT_TYPE_* for X86_MT_* now that Demi's series has been
>> committed, but that is the extent to which I think there are relevant
>> changes to be made.
> In the interest of getting the code gen issue addressed, but without
> being fully convinced this is a good move:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thankyou.

~Andrew

