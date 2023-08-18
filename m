Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70821780C70
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586278.917507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzMx-0006Nf-GJ; Fri, 18 Aug 2023 13:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586278.917507; Fri, 18 Aug 2023 13:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzMx-0006LL-D7; Fri, 18 Aug 2023 13:18:27 +0000
Received: by outflank-mailman (input) for mailman id 586278;
 Fri, 18 Aug 2023 13:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWzMu-0006FP-Ty
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:18:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3e2ff66-3dc9-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 15:18:22 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 09:18:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH3PR03MB7482.namprd03.prod.outlook.com (2603:10b6:610:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:18:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 13:18:07 +0000
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
X-Inumbo-ID: b3e2ff66-3dc9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692364702;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l4R5g429eqaXZJM9n80ATdChTDiYQf0T2JINTYBur1I=;
  b=Hy1L7QGENDFSa28QcVJZhi7wPuxZGiljHjF20YC/VGxDMRc2kEX6PrR6
   V/HpZqOMg25o3hsZnOFQ3wb+g2Z4gkkCX4EIHngru3vcOFQ4MtGw11DcZ
   RNkcayKJ8aq6OPx8ejFuH96iXu9aIJDbTSE/S7VTGZ9H8PdhYjEXhK6oA
   w=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 119171111
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l3FAVq/tdXvbnrqWMBNFDrUDrX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DAdWzqPOanYamr9Kt8nbIS2oUMEupHWxtdjSVRvqnw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNakb5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklV+
 60AMhIgVyzEitDsxLbiS+o2vc48eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtDTeLhr6cz6LGV7kBKN00rfBy/mvSSkGKxVowCM
 3IQ1AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zmv9s1hxeWFtJ7Svft0ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztp6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:S+zToa165VQRFcoyf/CI+gqjBB8kLtp133Aq2lEZdPWaSK2lfq
 eV7ZImPH7P+VEssRQb8+xoV5PsfZqxz/JICMwqTNSftOePghrVEGgg1/qe/9XYcxeOidK1rJ
 0QDZSWaueRMbEKt7ef3ODiKadY/DDvysnB7ts2jU0dLz2CDZsO0+4TMHf/LqQZfmd77LMCZe
 uhz/sCiTq8WGgdKv+2DmMCWIH41qf2vaOjTx4aJgItrDKDhzOw6LL8DnGjr2wjegIK77c+0H
 TP1zf07KW7s/2911v12mLJ445N8eGRuedrNYijitU1Nj6psAquaYh7MofyxAwdre209VYsmM
 TNpRA7Vv4Dm0/sQg==
X-Talos-CUID: =?us-ascii?q?9a23=3Ai2sEF2hgipuA9PVgLsOkaUzjWjJuaXOM1G3yDna?=
 =?us-ascii?q?ETmtbErmREF6TophujJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3tlPug/4DA8x8N9ytFNiQ6yQf+sx3PSTIQcJqpg?=
 =?us-ascii?q?toeWLOHItIwmZoh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119171111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwSbnVd6A+2yRAGrqWD5stm5z3rFxzCqLbTHOOyfBPjdQGsuZl4t+YAw+Y8lUG5iWbDIJNcCyM/4oFjXzvsPxyK2dHEJL4Rpy6gmiskd+t3YhTrdtaDzlpj03/53154Ox6nKhVkievOCP85R5mTd2UW6pK3RunMj7mme0OacaG2TqhJO2ONVfnMPm3IdZe+ANzmWX5WGnrKOGH76AwZSAaOqO2SfAb7twx4EvHIkghtMybKRb2e5Nk+fclB2et52pr3mlORy3fGfQhigDt1Tv0kN1ALMGFB51cm3xMDWsfrCD1pw9yOL5lKEVzkP08fxixzEbU/r37AuXRUrzIwm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbePUAEHyuEsP1r6aofGGlt/5LQiCW/v7+1psjgEzVw=;
 b=jAfRLYqSFijVGyQsjVeBVL6JhsvAHvRWRiB0H+lB72Yd03namfaF/NH2kB9znEzVzcUZV6x4sZmDPaF3iqlzdgreezVUxpAxoDt8eKBvCsnHmhKT+dhDU7CODJ6/VoeutaSnjNJijjxJulfVvQamJZyn0SFAfY6dNfjt3ssAkl9wogGywUOoP6vocxpPgCKg3jxAsem42NLMN0DOTdv3mdCXpdHClZxzDlbAsLXAJt+krh4ZdMamopvQSvspqAgerO5vx8DnxbTKhYqKUz96fR9JzLpiplDXa3/Wgmc/PLTvLWSuocDbHjybADeVlGtzxz9hYsWqhvt8AYX8Bbd00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbePUAEHyuEsP1r6aofGGlt/5LQiCW/v7+1psjgEzVw=;
 b=Zz+MirvquK6Og/f2u97D+3fqEAcNIXsX+LXUtvvqar4J8JmOdeGTOkxXqI0Q7MyIsuD6mAhMuXqdOaQMhlvzeNVCtAJUAJEM0v64HnqKiizZCx98fceRGB82yguGoutYKrv3diNeee07jGWG9eATH3l17iXacB+MSp0oa7wcSHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0d2d18fb-c102-5e87-f836-cff428d96ffb@citrix.com>
Date: Fri, 18 Aug 2023 14:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] Rombios build fixes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
 <9c9ac724-9f86-14bc-5a22-e6e64c64e48c@citrix.com>
 <a59c7111-b349-4deb-326e-3fde6e5125f9@suse.com>
In-Reply-To: <a59c7111-b349-4deb-326e-3fde6e5125f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH3PR03MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3e2980-e86e-4600-2e62-08db9fed8fff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMKfWaTOUSFA44sxIqlfZbNTJ84yLU+So8asyLNnL9mv04Wvh5mLlkDYJ4hYb8bJmK5zeLiA8IeMyFJDSVrho8CNDMIGRgYklPPWz3pMS2VEuAdgZ8Ef0+ZPkFHrKSm4FlgZBtyMelQOB3wDP/wE6g7EmzkG/kgakPaFzzPGz2v2kqWO+8XlvywpZKCDZNfCJFGfKobNN4FZiH36nznnwwOFGto+ssm72Zncp2r2hRU4QkchYIltJev9GVX2KvupGI+k6a85AkcrSeO15mvmIDW1JwcSxFNZ2/T8g0LVCe61FN9PlBXPhCcakbiIcbfG+nc0Maxx4a/eglB5YH4wiyNEBq7gOEwcbWxMNfmnLTnuAS5Kl8es7jPjLzsaW6hBZ71ltE6GEdcUSfc2ywcMD29ps45/6zzw0t55Z6V6+3ThuyNkkvqrXiUyksjnu3CzwJi7Ec1yrrtso7aedvlKQbCGzp23nKVBNW/vkRQ3Yh35uQLFBgshGgqEhc+N0jzj9/VHyk1gmaB6jMgVjO130pcCM9Aub9k8p+LUF6GlvD5kxPAsQo+PSt+BF/3QX5M7oSA2Xxb41BEoi6vJKmy2xgsXNO2TLAp/zznA85n4vr60vDkzgE/fJxEzPjGw0EcPhjOJLPptua57FTwyOdu3lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(1800799009)(186009)(451199024)(478600001)(316002)(5660300002)(6916009)(26005)(966005)(4326008)(8936002)(8676002)(54906003)(31686004)(66556008)(41300700001)(66476007)(66946007)(6506007)(53546011)(2906002)(6512007)(6666004)(2616005)(38100700002)(82960400001)(36756003)(6486002)(83380400001)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YStkWVlyT3cwNnRlTkQyWm93RG5NSXhpYjZlMFdpOEVaYWcxUFN6MkQ0REM2?=
 =?utf-8?B?SVRwbU5DeUI5RUdZcFBySzhwb3k1d0cxd0pHbndZRkliWHRCNUZlZi8zL2Qz?=
 =?utf-8?B?cm9IZDh6emxpR0NiV0dIWnVyTUEyNmwrTUgzdEU1ZXp6SnlDZkZMVGk3b0R0?=
 =?utf-8?B?L3FmUWlqdkVRMnBDMlNtSE4vQjBmbzEwRFYzSGJtc2k4b21EWXNDUEd5aDdS?=
 =?utf-8?B?anJKb3dPUTI3OFJPL1R6UEg0QWlIZ2pTTVRodm81Nm1WTlI5a0tZV3RCU25T?=
 =?utf-8?B?NXpqaENjWWlrYjUzZEJQSFA4Q2tBNEN3WldBZDFEUHpYM0V6Y3NFUVRWMVI3?=
 =?utf-8?B?L3lncXJ1cTRCNEpWREliQVdZc3ZLMkJLU3prV3JrSEI3RkhIM3ZNN2VCUDFC?=
 =?utf-8?B?eTUvcFgvV1RxbGd5dnMwVmFOWW1XbEVVUVhwUTFGS0cwaTRVaXI1VHZleTBx?=
 =?utf-8?B?NU1jbVR4alBKbnpnT0FUODhlMTUrVTVvanZzeEQ2SWpucTRVVDhUeUd0dml3?=
 =?utf-8?B?cTJJblo4SWs3Z0VsSHJCK2VwU1QrQUZDZzZxWi9zS3pCR2hoYlVvdG5UMHlH?=
 =?utf-8?B?THZyK2F2bXRFQ1ZDcmppb2ZkODFRanBWcWowb2dqenRnS21uQmk3emkwVksy?=
 =?utf-8?B?cERUZVg2R2FlL0tRaDJlTDFnaDFHdkFsWjUvTjN0U3NPNUNUWlFKK08xU2hy?=
 =?utf-8?B?Vzgwb0lBbWJGSTZlekJkSFhMVkY5YWpnbklQZm9nY1ZhbnFMb2hrWG9Vc3Zm?=
 =?utf-8?B?ejE1bnNHajFiSzRHS2x6UXp6VWVwb1RMVHVYQUZNMWZhSXFDLzlUT0JaQUdH?=
 =?utf-8?B?TFhxQTlqelBmYW5tUVpieEN1UU0zM003V3pkbm5uOEFCa3pHZ3pLaVlxTjdF?=
 =?utf-8?B?Zi9la2V0TEErTHV5bnFtRGhXTExPWGpkNkVXWHlSU3hwcGVUUHNBc2xyeHJ5?=
 =?utf-8?B?cG1KWXVUSlpxUWVQaEVoaGxTbWZxRG84c3VYRnRyRDJTSDRyNHIxY08vT2tX?=
 =?utf-8?B?ZHdQTndpZmdwL0dRVS9wVDFEOEpBV2tkWHI2TWs3NXJUdlAwMzR5dnA2VlVs?=
 =?utf-8?B?dmFLY2ZnMFRiUEpXNUhBcUw2QjFQY1ZpeDFkOHBOWDdKK0xjL1E2Tm50emYw?=
 =?utf-8?B?SzBTZXlSR3RoL1BLb0w5YUN0UHFXNGpaNDdId2pHcVJvMmZRbEw0UmxNbE4r?=
 =?utf-8?B?TTROWXRiS0hDY0tOenBrSmphRmdqRWM5eGZKOHllRFZwc20xY21nd3FYbFJ6?=
 =?utf-8?B?Y0ZtUkZ2am55b3JrdmE0M1NZZk5WUkMrVHdHTndML1FPcjM4SWR0dWY5OG15?=
 =?utf-8?B?MnhPem1xbk5QZnJUVHJTb1J3cVRyQ3VqcGFnUytPMDQyNHhZbnA4V2lsUklC?=
 =?utf-8?B?cUcwZElKOFdxTENLVEVDNVd6dGdCbVFnUG0rZ0NsckZ0VWlhbzVlTzVBRzQ1?=
 =?utf-8?B?NVoybitlZXlEWEtjZXRWQzNxT2RLcE1oSTBqQ2hmRTRvOUlpc1ZsK1lyZDlo?=
 =?utf-8?B?UTJ6aTk1VEZLV2Q1Z2FnWExOY0tOMnl3Z0syNit6TlJTVkhubDJKQ2h3eUt1?=
 =?utf-8?B?NUJuQ3ZYdkNpK1N2cnhKckZwcytzVzVCbXNmK1RwZUMyTDNCV0VGUjcvR2lF?=
 =?utf-8?B?ZTQ0SjZ1Yk5uNWhSalpXOSs5Sldwd01XaXZUZWNNVHRVb0R3aHVMOG9NNWFt?=
 =?utf-8?B?M2hWRWwzZHZqWG53OE9VSkljYmd2R0UwYllPc29BS21CL2FyNjl5YUo2SDNU?=
 =?utf-8?B?aTJyQ3k1ek1oa01KOVFJWmtkRjBNWnJWTXBkaGRvZUpZNjBMSW9uQWRzaFlw?=
 =?utf-8?B?ZFFGakxIOWU1UHZseXd6V0NWRzhOQWFnVENwUXdtNGMzNG9LaGtSaDNjMW9r?=
 =?utf-8?B?cEsySmg2UGlJMUxKYlVIeUZUUXpKbGxQRjBMbFF6dDlLQkhnTWN4bmNYd05k?=
 =?utf-8?B?aDNVN2lnSTBGeE9hbmdnbEwxdTJiTXdRb1VJQ1ArUTlyaG9Ocmg5NS90c3k3?=
 =?utf-8?B?Q3h1QU5kcVNnZG9VSm5CSkdIY09vN0J3TUJzU3VQN2pMMXBiTmh5YXlaTkRQ?=
 =?utf-8?B?TmFSV3k2bzBJNERXcEtoRThYc0J5emo5aEZZQ2Q3eDZSVlE5SEpZTnQ5QWZP?=
 =?utf-8?B?RHVmbGUyWDF2ZStmZFR0emYyRVNjam9iYzJrSHhvU1Jld2hYZGlpUTQ5aUlw?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c1bpVsFnxXevksBlctehCorRQ02Ndp3XQc/5mNHWVQQTfX678/xfINhz4UeO+hZdeTtO2dD1gDAmlSQW+1snq8o+cL6GCmUd5xBbZWbxDWKDOrjMGpClKsZr1ChBSZ7N3R7eUhQpddBagiq0GYhntPXp2K+QGLfM6tTe8hDM6hxGOCwlLQzG78HGT7WWMANCzPly0Ls0AeVTzdvmdLz3biErjyFT1LTuxhEfM/suTYBQEnAhtS55sKVlSpqonrCst4cIQz7rKU9fkG6SQyESTWet9gTKvGGMa3X7BQRprG7gvK/SS6xOB9V9rOgpQosz7sBREQ/gqSZ+MPZyAUeCOBZfjnfrRo5fqEUwoA1CFXwY883rZZeYv5zqVgwoaBM20D9POtu4Q40m2Vv0LV+FwkuVWP5Yb694fqJGGOzVjQr6xcubMlkQEhXTnFkToj8afXVMQldg2Vq6p4ttjAjmHCo9MbS6aJVRvo//HIzloNYX8zu5STOzAtvFev84i+guqUlDpKppJbaBSt75qQu9Vq9Eibr7a6fb1CCxtk5+a9oTiApmfuejsMtfG9vfzzlZANT3qGiF0gMysVyEnLfusf1OSH89AQXTNte/5bo+LeOltvmKiyo2aZjDTgZEGkmbgJc47SgZ+MkNfqQcrO5mQu1ugBQEXdYn8NqkchhYUTnUzHaW8MoJVaW1/YRIllTnf0AFyGGuSNHzAMbGAIA8npBLigq5dbtM8J5Wz1SpBOIk8YBW86uFV6aOuelT6xL199mp+i6uwqmEb838x9QMlSMM6qcIVGCDGw4bt0MLF20uXZxwttUkGVzJn7Zw3wGX
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3e2980-e86e-4600-2e62-08db9fed8fff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:18:07.7434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZpCNFh2ToLrbJ3mNrKeX+TigTyFKg7C0kgPWli3HTi8prWSyl16tpYIqkdLmCDOU1rPFMKkvoJB32gttk84n5cUDv9aRTONr8c626s/lpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7482

On 18/08/2023 2:13 pm, Jan Beulich wrote:
> On 18.08.2023 15:05, Andrew Cooper wrote:
>> On 18/08/2023 1:57 pm, Andrew Cooper wrote:
>>> Andrew Cooper (2):
>>>   rombios: Avoid using K&R function syntax
>>>   rombiosn: Remove the use of egrep
>>>
>>>  tools/firmware/rombios/32bit/Makefile          |  2 +-
>>>  tools/firmware/rombios/32bit/tcgbios/tcgbios.c | 10 +++++-----
>>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>>
>>> base-commit: e6cb27f2f20d09dd2ba135fbc341a4dc98656e10
>> Urgh, forgot to write what I meant to write.
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/972116359
>>
>> This gives a clean CI run when ROMBios is explicitly (re)activated.
> On irc you said "more array bounds issues in GET_BDA", yet nothing further
> is being adjusted here in that regard?

So yes, I did end up being confused about those.

They're from the iPXE build, not the RomBIOS build.  They can be seen in
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4899807239 but
there's clearly no -Werror going on.

I'm going to leave it for now.  The only reasonable fix would be to bump
the version of iPXE and I don't have time to that right now.

~Andrew

