Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E27A6841
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604903.942449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicpv-0001Uj-I4; Tue, 19 Sep 2023 15:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604903.942449; Tue, 19 Sep 2023 15:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicpv-0001RN-Eg; Tue, 19 Sep 2023 15:40:27 +0000
Received: by outflank-mailman (input) for mailman id 604903;
 Tue, 19 Sep 2023 15:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qicpu-0001RF-Fe
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:40:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e085ba-5702-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 17:40:22 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 11:40:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5627.namprd03.prod.outlook.com (2603:10b6:806:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 15:39:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:39:46 +0000
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
X-Inumbo-ID: d6e085ba-5702-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695138022;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2IEwfVGPwRpi5Wtx749oUKufeQ52fjA0AN0cQCZknVg=;
  b=Cb9w10ooUTySBm+9ZS3p7NOi80V6dG0YDLw7ps88qTDflQEq9M+cLsR/
   jsjZ8/Xhtag8OI7A4TV/LS87xfpUiBAPExLFEh02Ow2DStH1f0IVoKmyh
   FN03pj/wbnITxZ2Y2RYCOaXH/BotzO4mIFmPivPKyekkaKGf+06ueF7iz
   0=;
X-CSE-ConnectionGUID: LykoRsIwRhCs2i4bH3BWKA==
X-CSE-MsgGUID: yPHodJk5Qu2RcphJ/gppGg==
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 123123137
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:UvY/uaqKMqAnclqfH0rqjbMyT9heBmKlZBIvgKrLsJaIsI4StFCzt
 garIBmDb62MZ2v2fI9+YNm//RkP6pOAyoRjQQc/pSgzRCgR9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQcbRe5nMOp+rKQUbNt2s4Dd+PUH6pK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIe9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtlLTubhraECbFu711QzDxE0VgaCvKODgVa+eZVQM
 1Q79X97xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAOMWIdbDUYCwsE59Xuqps6iB7nR9NvVqWyi7XdPjX9w
 CuDqiQksJwVgdQWzKWw/V3BgDWEq4DAS0g+4QC/dmCv4x59ZYWlT5e18lWd5vFFRK6GSnGRs
 X5CnNKRhMgMEJfLkiWOSecMGbiB5vCZPTmaillqd7Ei+iqs/Ti/fIlWyDB4OEptdM0DfFfBe
 EbOvStB6ZkVO2GlBZKbeKq0AsUuiLPmTNLsU6iOasIUOsQsMgia4CtpeEicmXj3l1Qhmr0+P
 pHddtuwCXEdCuJsyz/eq/oh7ILHDxsWnQv7La0XBTz+uVZCTBZ5kYs4DWY=
IronPort-HdrOrdr: A9a23:US0uYa22QpdQnXerH3d3fQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:W2TI+G7UKRkCcAvk3dss0F8XHfo+U2LnzFzLeU7kA0YyYoK2YArF
X-Talos-MUID: 9a23:PQ5a+wQKJ2JN/+uhRXT9vBFlOOVrvp2zUnoGiZUk/MacLQN/bmI=
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="123123137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0ax4oJOzkApGeoDH72PES74Q09DSsexBwuuMhjWecsBjmp9sS+2k84nZOkKTxpkyBDaCWLv9ZPK7D0PrIZkw1ojSzcLjSWZUO39Zo0ZRCUwbmFfda0mMTZA9K5WypDsbxh47mbQwfkLU8uaBLLklowdPSGAaekqBKhLyfEtTSs8K/3ckWTFBZBI14Pt9U5IjGM+3l0qGsumeN4wxNg8y1mTOLSVGxrlaTmxe4UxA04CZYpQCXM2APnLqR16j2ybt5WwsDNt04KBjaurb3JA0xeilY3+Sfil8udCjzfhfY0OWzXNszekLp58TIRDjkabo/2r2qkkZCgHiRObVaabVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLTwhBtM3ragJDvcqylor7Np7othjzZhN5b1k6Xl3+k=;
 b=hdkVkPYxqYE55YMRRLKYiAbl5Vxap5rTALb55tTmCsswF23oiDHrXsDNeOiESIgeaaR+cvon/dzXJQBhisBPTSDhKJvb6QYsWCoo/XvdmpHEkcfG6xAIhS5shyfJYYD4HQ7gVfOKatYL1pnbuD3raQGnsU/hBwpkgGY6lyp24ewcN222hxMRKI2wswDJ9yZbkj6MiG5MH87TpNRi1dOruX4/oNaukvTm6W++q170ecLfg7ghlVQRpBEHx1VOyE/3oAKhJ4zjoJaSdMpOKipDyalsTE1aHdvdZueHQQ0l9jaSwoGDw1Zf5x4qfstK+oXAliNpQ/KgPuKiESI9jbBJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLTwhBtM3ragJDvcqylor7Np7othjzZhN5b1k6Xl3+k=;
 b=pb4k1L07tK+w2U3d8nfPJuXfLFW+hSK4wBj5H1Y7BWSLqyGIcQkWwZuxWbaMffHfj+jX2GXD3xQ4BUPrjBfXHTLWHZeDjj7OWcU8EMgZPAb0bBn9a+qhECBv3LSvUwH9NfMmfAaqSkG0b2HXrYhZqOYqEkYzqpiIYGT7QFUEBu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 17:39:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO0P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: db1abd9b-0e35-4614-31fb-08dbb926a6ec
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oiqhb/nh35VfWknOVScV3TccIKv9nXI57QMUTkjf/8TQRxdxFYtvHb/kJP3yxZHltPQDIU6S9oQex8//JG2QshNxNH3MH3lKekW//f3hEmrxhWV38aT1o4S9uwxe0k2EUil5AFXf6wpj/bdxrWt/twWYA0IKiU6u0Jq9An8eQoY0/i9rsaoG0qzgmM0jnIj9lQnBb3nT3JlfWsxBIJeg3hKJ2H3ydSZVWKobQFoMU3JR7RRX4vKxLSZ9rNs68BwJsjzwoz8BWC0po3iV4fGc4qC7TzNxiIwhlO6bzziiCDyQk3LGM+oxafP/iqHffsa/kaxI5d1IUpd5xYsMtMJWuWAfzl6msx+H5NlCFizleN6NFnwA4bcCL5tWwK53c2GnqPRi0/SM6J+/9WZOkzY66cjlfMXl8OiC2YO0Abe+U+OCKuxB1ovaAAeVMh8ujtNqAilxxW9HJByfageUKfNvJLbJYyQTdkc/0B2IyZiPy7wSP4+dancNgiFiyxuaixFkWKO6u5RWXj7j2Q2BMFFpUm2hiO0x9zkmy4+NhBSQPf3ClEtqmYYOGBW3T3gvshkMpFAVNdOHJvU/Db2htNCtOE8oET1Pk0aVrTu8u9cZXPidr19A+y65Ey6eaTyzbwjp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(136003)(376002)(39860400002)(396003)(1800799009)(186009)(451199024)(26005)(82960400001)(8676002)(8936002)(4326008)(7416002)(83380400001)(33716001)(30864003)(2906002)(85182001)(5660300002)(86362001)(6506007)(6486002)(478600001)(6666004)(6916009)(316002)(54906003)(9686003)(6512007)(66946007)(41300700001)(38100700002)(66476007)(66556008)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdoNElLbmxnSXZLSW9CVXpsZ2oyMjlTSWE3bUl2QXRqTzdYZUo2YUFSdzRQ?=
 =?utf-8?B?QkQ1V3c4K3B6V0dlMTZvMFVxUWxaZklNNG9YVGlVZjZRZTdwTys0U0Rtd2lm?=
 =?utf-8?B?cm9JZnhuN0o0emJ1K0RNZ0tyenhoSjBETmJUenlBM1pkb2ZvcGI3czdoWTlQ?=
 =?utf-8?B?VWRSaXkydWtNcFdnWXlGYnlqY1JHbkV5NWJGcmRtNU82bkNlSllCNTYxMkUv?=
 =?utf-8?B?SWxIMHovTE5KS2k4RVRZODh6VkdqRTE3aGFjdFhJSzF6ZlFqZXhOcVJWdlRM?=
 =?utf-8?B?dVB3Z1JFc1VCM3BFUVVoaDYveUlsVWNyTTU3SWZrUllqWGFpQytpMVBOWDln?=
 =?utf-8?B?RGdiVXM4cTFjTzc3dE5OOUFXZytnNTZSUGpteml3Ti9tSHJITDl0TWQ0VGto?=
 =?utf-8?B?VjVvR3ZnK2ZEZWc5eVhpV0YxS3FhTGl1WXZueVExRHhBV3REcFB4TjZybHdZ?=
 =?utf-8?B?UDV2WllPckVrUGNuVXJVdEhLK0R4U2lNY21jRmNoV0ZSS3ljZU0wTHFjeCtv?=
 =?utf-8?B?WDNPdEpSRHJIR2d0cnUxZW84djFLWmVQUXVydWlXRFIrcVA1RG9JKzMvb3NP?=
 =?utf-8?B?SWptMVUwVHp6aW8vTC9rdWVFVlIra3hKMDVRRnZlbFpvSVZxRXdpNll3TWxv?=
 =?utf-8?B?cU5ZTzlaR0tjNnkrRnRaa3F0S1dUZnRvSVFycS9qeWVqek9JbU40SmxwSFVG?=
 =?utf-8?B?cWZlamV1VitrYnNoelVXNVpXdnZscUVGU0FyMDQzY3g3azVaMlVscmQveFZZ?=
 =?utf-8?B?V01EYm92TStoNzNmYXYwVHZFYS9hNVpDRm0vYzRGZUZuYWxaNWNTMzJXVU94?=
 =?utf-8?B?Wm1PdzNJL3ZCbmVwcUMrYmlIVVVEaUIvS2swaFQxcWdYajh2MGdjZWtmVUxP?=
 =?utf-8?B?SlNvY3VVTnl2K2h4TEg5T3lpVE9JRHY2R0xOQlFSTmhiQW04VWIyZDBTM3RB?=
 =?utf-8?B?RmlTSEt5dE8yb0xSQkFvWDA3L24wQkRkMXhXYWFiMGxqZFJBNXcvVmJaNHlB?=
 =?utf-8?B?a3ZTRU1mU242cGEvalRIR2FuMGQ0M2NrNW1kd0NQK2ZuYk1RVVhoc3dXY0ZZ?=
 =?utf-8?B?Q04zWFkycjhRRlRrZkRsa3NUdjZvMzBzVW4xcUNSc0VtckY0b3I2Z1l0d09m?=
 =?utf-8?B?UXlKNGFCbXV0eEt1REZOYm5Ob3hpZjlxeFg2ajhaVXdhb0dtVEo0ZWZUeDNE?=
 =?utf-8?B?UXlUVTVibFRjYW9Xb1BjUElBT0ROYzRramRtYzVKRkdHY0FMVi9NdkQrODk2?=
 =?utf-8?B?cklEYVNrQzN6RlliMzc3UERxUkxZOEh3OC8wUm1nblNtTkVpQ1NMVkFMa0VG?=
 =?utf-8?B?VDB1N0MxQk9PTVZnak41WTQ1OVYyR01OckRMMnd1VE5iRjFGbThrOE5Ib3Zv?=
 =?utf-8?B?RzhZODhTdlM4Wmpwb3E3emlLMi9BOHhhdi9PTTg3dUxDWEtUWFZLK3BMdmF3?=
 =?utf-8?B?OS84TWkrS0pwdENyeWdIUit2dkpLMENYbjhMNUNaM1dKRHJPKzE2cVBkbGdr?=
 =?utf-8?B?a0thaHFteVM3dE1tTXdLTFBsTjUyYW5SOERGaUlsTlhaK0JLeFJjV0dwamdp?=
 =?utf-8?B?Yk5tejBpaGJhc1QzS2lDTnhZY3dkQ09Cc3R3akRRa3VnUUQ0d05ZNUpaeFBp?=
 =?utf-8?B?SWw1NlltYzNqajFJdkJmN0wyWDROSFdmaG1pdjJFamRvUHBubEhMMkNteDNR?=
 =?utf-8?B?YThJN0lQLzM5blFqUEZuVVZzOGlwSUNmZjNFREtEZGI3dDZBYjlzTzhJbzg2?=
 =?utf-8?B?TEpLdWVXQkZnU1FEalo3bk5HWnZkOXZyVkNuWXpPd0RSbjVUZGdabUludXM0?=
 =?utf-8?B?VVNXU2IvT09UcFpBM0t4dDB5L2ZSVjhyNGVpRGcwdTRwWUU4MmtmOVF1Ynoz?=
 =?utf-8?B?cXA2TVJyMHMrbzhyYUNEMlROWUU1c0xMY1YyM2tpclRoOG9xRVZLcXd1ejI5?=
 =?utf-8?B?Y253dXpGbEtMb2ZCK29lWUZ5NW1pdDdyVVBhYktLNDFYUzhNVHN2V1pRZTBI?=
 =?utf-8?B?NkZvaUlxc0NsdnloMklxYlFPd2dwVTRZdzdZbW5aTzNpbFFPMGF6SUVhOHpC?=
 =?utf-8?B?S2drblVQS3FNRndJMlh6RjFld1pSQUl5VGVSTklJb1Q0dW1oek5ReW95OC9t?=
 =?utf-8?Q?rLTRLx+U5rJUsBsTLymotc3xQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yuawLtp9TncwSbGP/sA1UaC5L2xeqDhKBmRcsNGbdeWBbRFDrNJNq697Oo9L6ZiINV1ZjiPSx0PCL6L2ZC57LSFiLB8G7um7nc/7RGhCYBR7vlHyHqe5QuG1EEYtGRyxpybSUJ8Tb1irDHMktNmL/sUfNdT9wAqi8cprauCNcnaL7eLbI+pv3qywZyjputwavCA8XwMMz0BkI1y27lfKZeCIqW61kBxy+J7+6j8i8oIsoBuZB35/pQ9W4rRvLGNIeu4dGwlCLNQLNL4HiqPUgOIjc6jS3n93bM83JfsGKvAAUdnfkTkfDJd0i7/DMRnrL+BD5MyCY7Q9z7uraqXwBOT5DjmxV2I50WVFWeGszDb7B73e+F47J8xE6wGzj4B/6vabby7/hNiiAh/FifPnGQqo/Qsizq0O6nUAe8ANh9q4LwScG88n6eisgJSt4ti1+OxaSHbkAyLjSxXpi99tpDIeO1V9o5bY3dMjxRXlaBVK5DJqzjmm0j/N4fOMVMxO8HYDTdl2//BqNQysRpCViI5gp4WZQfvjBiJHJPjDiLJy2/PPgqaunRhsQYNBZbM+yJaQRdiZm0rCmhKZoddp5WehwM9F8GTf4jZZqZ00O1E+QfSow8EeX24I3BLyhRX1gU/tci2IhPYwl08QSejJ/dQ4vyh0lfLCQ/jXcqlq7xJ52+VtomOxyfSveXdn+LKQ1rC2fRRsHy8emNTdG8bYf9tFpTHGX+w65MSQZBb4RZ5G3OCQk/VW8rtYev16l1XOgGXQolHws4C9MsjHEYtPmL5eIaBQrjPJiuSds5cka/lltpwez8hjhEIQA5uFeFhXI03kVC2v5USmCRv8QGlCC/u6nY/64Rgy+NMELOTQS05LNdygX0pVdCdsdKOcJcR9EAR9N9EGSxbgVSazABkdFA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1abd9b-0e35-4614-31fb-08dbb926a6ec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:39:46.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBK6E7lw0dUW1YsGGhOPn/o5dD0/BKYNMDUCjaoiwq8g3iq3UaWPr6boe4HAU+6zQGpI2BF9J974wuAyxqSaHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5627

On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use a previously introduced per-domain read/write lock to check
> whether vpci is present, so we are sure there are no accesses to the
> contents of the vpci struct if not. This lock can be used (and in a
> few cases is used right away) so that vpci removal can be performed
> while holding the lock in write mode. Previously such removal could
> race with vpci_read for example.
> 
> When taking both d->pci_lock and pdev->vpci->lock they are should be

When taking both d->pci_lock and pdev->vpci->lock the order should be
...

> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> possible deadlock situations.
> 
> 1. Per-domain's pci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if
> done under the read lock, requires vpci->lock to be acquired on both
> devices being compared, which may produce a deadlock. It is not
> possible to upgrade read lock to write lock in such a case. So, in
> order to prevent the deadlock, use d->pci_lock instead. To prevent
> deadlock while locking both hwdom->pci_lock and dom_xen->pci_lock,
> always lock hwdom first.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does
> not access multiple pdevs at the same time, can still use a
> combination of the read lock and pdev->vpci->lock.
> 
> 3. Drop const qualifier where the new rwlock is used and this is
> appropriate.
> 
> 4. Do not call process_pending_softirqs with any locks held. For that
> unlock prior the call and re-acquire the locks after. After
> re-acquiring the lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.
> 
> There is a possible lock inversion in MSI code, as some parts of it
> acquire pcidevs_lock() while already holding d->pci_lock.

Those would as a minimum need to be pointed out with TODO comments of
some kind in order to be aware of them.

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in v9:
>  - extended locked region to protect vpci_remove_device and
>    vpci_add_handlers() calls
>  - vpci_write() takes lock in the write mode to protect
>    potential call to modify_bars()
>  - renamed lock releasing function
>  - removed ASSERT()s from msi code
>  - added trylock in vpci_dump_msi
> 
> Changes in v8:
>  - changed d->vpci_lock to d->pci_lock
>  - introducing d->pci_lock in a separate patch
>  - extended locked region in vpci_process_pending
>  - removed pcidevs_lockis vpci_dump_msi()
>  - removed some changes as they are not needed with
>    the new locking scheme
>  - added handling for hwdom && dom_xen case
> ---
>  xen/arch/x86/hvm/vmsi.c       | 24 ++++++++--------
>  xen/arch/x86/hvm/vmx/vmx.c    |  2 --
>  xen/arch/x86/irq.c            | 15 +++++++---
>  xen/arch/x86/msi.c            |  8 ++----
>  xen/drivers/passthrough/pci.c |  7 +++--
>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>  xen/drivers/vpci/msi.c        | 22 +++++++++++++--
>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c       | 46 +++++++++++++++++++++++++++++--
>  9 files changed, 154 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 128f236362..fde76cc6b4 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>      struct msixtbl_entry *entry, *new_entry;
>      int r = -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>      struct pci_dev *pdev;
>      struct msixtbl_entry *entry;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>  {
>      unsigned int i;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
>      if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
>      {
> @@ -725,8 +725,8 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>      int rc;
>  
>      ASSERT(msi->arch.pirq != INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    pcidevs_lock();
>      for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq unbind = {
> @@ -745,7 +745,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>  
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
>                                         msi->vectors, msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  }
>  
>  static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
> @@ -778,15 +777,13 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
>      int rc;
>  
>      ASSERT(msi->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>      rc = vpci_msi_enable(pdev, vectors, 0);
>      if ( rc < 0 )
>          return rc;
>      msi->arch.pirq = rc;
> -
> -    pcidevs_lock();
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
>                                         msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  
>      return 0;
>  }
> @@ -797,8 +794,8 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      unsigned int i;
>  
>      ASSERT(pirq != INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    pcidevs_lock();
>      for ( i = 0; i < nr && bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq bind = {
> @@ -814,7 +811,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      write_lock(&pdev->domain->event_lock);
>      unmap_domain_pirq(pdev->domain, pirq);
>      write_unlock(&pdev->domain->event_lock);
> -    pcidevs_unlock();
>  }
>  
>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
> @@ -854,6 +850,8 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>      int rc;
>  
>      ASSERT(entry->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
> +
>      rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
>                           table_base);
>      if ( rc < 0 )
> @@ -861,7 +859,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>  
>      entry->arch.pirq = rc;
>  
> -    pcidevs_lock();
>      rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
>                           entry->masked);
>      if ( rc )
> @@ -869,7 +866,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>          vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
>          entry->arch.pirq = INVALID_PIRQ;
>      }
> -    pcidevs_unlock();
>  
>      return rc;
>  }
> @@ -895,6 +891,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> @@ -913,7 +911,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            read_unlock(&pdev->domain->pci_lock);
>              process_pending_softirqs();
> +            read_lock(&pdev->domain->pci_lock);
>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 1edc7f1e91..545a27796e 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -413,8 +413,6 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT(pcidevs_locked());
> -

Hm, this removal seems dubious, same with some of the removal below.
And I don't see any comment in the log message as to why removing the
asserts here and in __pci_enable_msi{,x}(), pci_prepare_msix() is
safe.

>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>  
>   unlock_out:
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6abfd81621..cb99ae5392 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2157,7 +2157,7 @@ int map_domain_pirq(
>          struct pci_dev *pdev;
>          unsigned int nr = 0;
>  
> -        ASSERT(pcidevs_locked());
> +        ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>  
>          ret = -ENODEV;
>          if ( !cpu_has_apic )
> @@ -2314,7 +2314,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> @@ -2908,7 +2908,13 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>      msi->irq = irq;
>  
> -    pcidevs_lock();
> +    /*
> +     * If we are called via vPCI->vMSI path, we already are holding
> +     * d->pci_lock so there is no need to take pcidevs_lock, as it
> +     * will cause lock inversion.
> +     */
> +    if ( !rw_is_locked(&d->pci_lock) )
> +        pcidevs_lock();

This is not a safe expression to use, rw_is_locked() just returns
whether the lock is taken, but not if it's taken by the current CPU.
This is fine to use in assertions and debug code, but not in order to
take lock ordering decisions I'm afraid.

You will likely need to move the locking to the callers of the
function.

>      /* Verify or get pirq. */
>      write_lock(&d->event_lock);
>      pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
> @@ -2924,7 +2930,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>   done:
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
> +    if ( !rw_is_locked(&d->pci_lock) )
> +        pcidevs_unlock();
>      if ( ret )
>      {
>          switch ( type )
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1d..ba2963b7d2 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -613,7 +613,7 @@ static int msi_capability_init(struct pci_dev *dev,
>      u8 slot = PCI_SLOT(dev->devfn);
>      u8 func = PCI_FUNC(dev->devfn);
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>      pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
>      if ( !pos )
>          return -ENODEV;
> @@ -783,7 +783,7 @@ static int msix_capability_init(struct pci_dev *dev,
>      if ( !pos )
>          return -ENODEV;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>  
>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>      /*
> @@ -1000,7 +1000,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
>      if ( !pdev )
>          return -ENODEV;
> @@ -1055,7 +1054,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;
> @@ -1170,8 +1168,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>   */
>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>  {
> -    ASSERT(pcidevs_locked());
> -
>      if ( !use_msi )
>          return -EPERM;
>  
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 79ca928672..4f18293900 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -752,7 +752,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          pdev->domain = hardware_domain;
>          write_lock(&hardware_domain->pci_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> -        write_unlock(&hardware_domain->pci_lock);
>  
>          /*
>           * For devices not discovered by Xen during boot, add vPCI handlers
> @@ -762,17 +761,17 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);

You likely want to move the printk after the unlock now.

> -            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> +        write_unlock(&hardware_domain->pci_lock);
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {
> -            vpci_remove_device(pdev);
>              write_lock(&hardware_domain->pci_lock);
> +            vpci_remove_device(pdev);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
> @@ -1147,7 +1146,9 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>      } while ( devfn != pdev->devfn &&
>                PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>  
> +    write_lock(&ctxt->d->pci_lock);
>      err = vpci_add_handlers(pdev);
> +    write_unlock(&ctxt->d->pci_lock);
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>                 ctxt->d->domain_id, err);
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 60f7049e34..177a6b57a5 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -172,6 +172,7 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> +        write_lock(&v->domain->pci_lock);
>          spin_lock(&v->vpci.pdev->vpci->lock);
>          /* Disable memory decoding unconditionally on failure. */
>          modify_decoding(v->vpci.pdev,
> @@ -190,6 +191,7 @@ bool vpci_process_pending(struct vcpu *v)
>               * failure.
>               */
>              vpci_remove_device(v->vpci.pdev);
> +        write_unlock(&v->domain->pci_lock);

vpci_process_pending() is problematic wrt vpci_remove_device(), as the
removal of a device with pending map operations would render such
operations stale, effectively leaking the mappings to a device MMIO
area that's no longer owned by the domain.

In the same sense vpci_remove_device() should take care of removing
any MMIO mappings created, which is not currently the case.  I guess
such problem warrant at least some kind of comment in
vpci_process_pending() and/or vpci_remove_device().

>      }
>  
>      return false;
> @@ -201,8 +203,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      struct map_data data = { .d = d, .map = true };
>      int rc;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));

You want rw_is_write_locked(), as that check for exclusive ownership
of the lock (like you have in modify_bars()).

> +
>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    {
> +        /*
> +         * It's safe to drop and reacquire the lock in this context
> +         * without risking pdev disappearing because devices cannot be
> +         * removed until the initial domain has been started.
> +         */
> +        read_unlock(&d->pci_lock);
>          process_pending_softirqs();
> +        read_lock(&d->pci_lock);
> +    }
> +
>      rangeset_destroy(mem);
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
> @@ -243,6 +257,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      unsigned int i;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !mem )
>          return -ENOMEM;
>  
> @@ -522,6 +538,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));

Same here, initialization should be done with the lock exclusively
held.

> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 8f2b59e61a..a0733bb2cb 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -265,7 +265,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -277,6 +277,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !read_trylock(&d->pci_lock) )
> +            continue;
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
>                       * holding the lock.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
>              spin_unlock(&pdev->vpci->lock);
> + pdev_done:
> +            /*
> +             * Unlock lock to process pending softirqs. This is
> +             * potentially unsafe, as d->pdev_list can be changed in
> +             * meantime.
> +             */
> +            read_unlock(&d->pci_lock);
>              process_pending_softirqs();
> +            if ( !read_trylock(&d->pci_lock) )
> +            {
> +                printk("unable to access other devices for the domain\n");
> +                goto domain_done;

Shouldn't the domain_done label be after the read_unlock(), so that we
can proceed to try to dump the devices for the next domain?  With the
proposed code a failure to acquire one of the domains pci_lock
terminates the dump.

> +            }
>          }
> +        read_unlock(&d->pci_lock);
>      }
> + domain_done:
>      rcu_read_unlock(&domlist_read_lock);
>  }
>  
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index f9df506f29..f8c5bd393b 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
>      list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>      {
>          const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
> @@ -163,7 +165,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>  static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    int rc;
> +
> +    read_lock(&v->domain->pci_lock);
> +    rc = !!msix_find(v->domain, addr);
> +    read_unlock(&v->domain->pci_lock);
> +
> +    return rc;
>  }
>  
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
> @@ -358,21 +366,35 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_read(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      *data = ~0ul;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_read(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_read(d, msix, addr, len, data);
> +
> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -404,6 +426,7 @@ static int cf_check msix_read(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -491,19 +514,33 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_write(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_write(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_write(d, msix, addr, len, data);
> +
> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -579,6 +616,7 @@ static int cf_check msix_write(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index d73fa76302..34fff2ef2d 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
>          return;
>  
> @@ -73,6 +75,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> @@ -326,11 +330,12 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
> +    rwlock_t *lock;
>  
>      if ( !size )
>      {
> @@ -342,11 +347,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>       * Find the PCI dev matching the address, which for hwdom also requires
>       * consulting DomXEN.  Passthrough everything that's not trapped.
>       */
> +    lock = &d->pci_lock;
> +    read_lock(lock);
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev && is_hardware_domain(d) )
> +    {
> +        read_unlock(lock);
> +        lock = &dom_xen->pci_lock;
> +        read_lock(lock);
>          pdev = pci_get_pdev(dom_xen, sbdf);
> +    }
>      if ( !pdev || !pdev->vpci )
> +    {
> +        read_unlock(lock);
>          return vpci_read_hw(sbdf, reg, size);
> +    }
>  
>      spin_lock(&pdev->vpci->lock);
>  
F> @@ -392,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    read_unlock(lock);
>  
>      if ( data_offset < size )
>      {
> @@ -431,10 +447,23 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +/* Helper function to unlock locks taken by vpci_write in proper order */
> +static void release_domain_locks(struct domain *d)

release_domain_write_locks() might be more descriptive in case we ever
need a similar helper for reads also.

> +{
> +    ASSERT(rw_is_write_locked(&d->pci_lock));
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        ASSERT(rw_is_write_locked(&dom_xen->pci_lock));
> +        write_unlock(&dom_xen->pci_lock);
> +    }
> +    write_unlock(&d->pci_lock);
> +}
> +
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>      /*
>       * Find the PCI dev matching the address, which for hwdom also requires
> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> +     * consulting DomXEN. Passthrough everything that's not trapped.
> +     * If this is hwdom, we need to hold locks for both domain in case if
> +     * modify_bars() is called
>       */
> +    write_lock(&d->pci_lock);
> +
> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
> +    if ( is_hardware_domain(d) )
> +        write_lock(&dom_xen->pci_lock);

Strictly speaking we only need the pci_lock in exclusive mode when
enabling/disabling the BARs AFAICT?  For the rest of the operations
the per-device vPCI lock already protects against concurrent accesses.
Might be worth to mention that the write lock is only required for
those accesses, but that such improvement is left as a TODO.

> +
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev && is_hardware_domain(d) )
>          pdev = pci_get_pdev(dom_xen, sbdf);
> @@ -459,6 +496,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>          if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
>              vpci_write_hw(sbdf, reg, size, data);
> +
> +        release_domain_locks(d);

You can release the lock before the vpci_write_hw() call.

Thanks, Roger.

