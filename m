Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C1786C4E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589879.921936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ705-0001lu-Lj; Thu, 24 Aug 2023 09:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589879.921936; Thu, 24 Aug 2023 09:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ705-0001ix-IO; Thu, 24 Aug 2023 09:51:37 +0000
Received: by outflank-mailman (input) for mailman id 589879;
 Thu, 24 Aug 2023 09:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+mH=EJ=citrix.com=prvs=593bb07b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qZ704-0001ir-KU
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:51:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce07b09d-4263-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 11:51:33 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 05:51:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6123.namprd03.prod.outlook.com (2603:10b6:408:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:51:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:51:27 +0000
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
X-Inumbo-ID: ce07b09d-4263-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692870694;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8+7V+tSLJ2mAVNOJU/5Mk5d5oT0xQJvMMRV/kScLZ1o=;
  b=V9XOOQ2z0LxepGN70906g0GEKUWVfOLwIeoSIO3vAff5Kfbtk1P1yOFB
   sBv5b93eLiqhxjtdN/VTuqj/89Jmqk1XifoLXLQZtPKBxK9LIXEAYgyjF
   hneRs+wPObxnCzt3zJrIkJXw5p2CrCvXPoAqthUEjA7AtWdt8bOkmWrUn
   0=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 120925650
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KGE5zqj9bAjLERgMU1/+9ZcPX161UREKZh0ujC45NGQN5FlHY01je
 htvCGqAb/iIZjD1KNogPIXj9h8B78TQy9dlSFRkqntkQSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AWFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQnLhQRUS/eud6v3bCZd+1lrdUvHNb0adZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1b7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Tefgp6Q33gDLroAVIDkMWkedruiysXyva/9gD
 BIw1XQJ/IFnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQh3
 0WFmN7BDjV1vLqYD3ma89+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXryos1LFae0ipjwBmv2y
 jXT9Cwm3exL0ogMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:xZLyGq/mFY9eHfuBOHNuk+F0db1zdoMgy1knxilNoENuHvBwxv
 rCoB1E73XJYW4qKRYdcKO7Sc+9qBLnhOpICOYqTNKftWXd2VdAT7sSmrcKoQeQfxEWn9Q1vc
 wOHZSWY+eAbmSS+PyKgjVQfexB/PC3tISTwcvOxXZkSg9nL4t66R1iNwqdGkpqACFbGJsQDv
 Onl4N6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjAmv9KXxH3Gjr18junJ0sPwfGF
 r+4kHED5aYwr2GI9jnpiDuBqFt6ZHcIx14dYKxY4YuW3TRY02TFf1csvW5zUgISaeUmSAXeZ
 D30mwdFtU2433YZWHwqQfx2gXmzTYl42Ljz1jdmnf4vcnlXlsBeop8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJmJXf2eP0AsfeNQo/gxieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsamRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGdZU8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu138HLzou
 W/bLp1jx9PR6u1M7z14HRiyGGxfEytGTD21IVc65x1/rrxWqDvPTCfREtGqbrin8ki
X-Talos-CUID: =?us-ascii?q?9a23=3A5pevlGousCvMA9wT9GsIIzzmUf8jVmHi8yruH1a?=
 =?us-ascii?q?lC0RUTLS+WFOg57wxxg=3D=3D?=
X-Talos-MUID: 9a23:Z9sB/AU67sEPyDnq/Bv2iy1EO9Zj2Ja/OG0ytssilJejZAUlbg==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120925650"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4s08fKSH2op2psdWq5pBH7H4pW5i5mDakWBeMb6OJYaiGiOyTe8ofJWBJYZYddGsHhCSwJyq0k7NAqjf/G5Vd2mkqPtK2I5LkiEzp0b8NaSXyNytl4PmP5p1wl5bYjcG+ooyOIujB3ktRzgLdW3mQ6L9Gyt0uoHsgPxMCLdh/BZGn3SMj86++sOAodwyouBYifTm4iYiy26duJ9GZtHt6c3y9g5+z4NHpCTcBfmK3x8skLgOj3xXmt8h7eaC1oW7OH9W1m57uYom7SDSNRF7FHZdMHtsTCVyda646EAycodWtgXhak4dZE9n3c4P83Z4A3/DJJBAKBI0P8zJmwmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebrn7iNSvbxeUsWYagOYMIRTtZAOwsDsC4YciQDrPc4=;
 b=Snz25vf3pnEkGyJQ/yfKoXIivkxhEbDengEB37H1xq1Ll2B2tQQ+Xpcb2PR06JhloM3IawCZJivl206MvWUPw0SjN6LnnWOFWcLo/UDRqRZhdSFDkRWrI5+21b0MohydjDnWPfsyWzfWraLs99Lx2RcbqOJLW74Pt2iZ7YG4fSrQjSB3oa1TiRQOohw5q0+mgNAfSxhaaAW+UfGJQZJiE/O6Fztv+bpaln7g1Kghx5lhTlS5tweEzS++Si752w+L1KYb6qkWvzVY7yXB+y9mN1ul86OC0MzzRLlY/9p+/wkhhOHiIkr8L5KFNGW8YF32+iIIbr2QrWd+KTFIpCnXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebrn7iNSvbxeUsWYagOYMIRTtZAOwsDsC4YciQDrPc4=;
 b=xgCbv/OptJtCn3l/kd5cHGjheZCZuNgJDe88iku0aYUPy1/JWBgZaYR6YtYjlG8YJnqSPlZJJrqmQh7R45+EuLkGL97DlYxaeciweRjmN31qoCg1etIP46AAz7Jw9FQZ8UVzP1FjjVA1gSm0OuU5O3vRW9G4NygDn9RdJg4douo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3d1a3638-603a-b918-596c-03557f139d6e@citrix.com>
Date: Thu, 24 Aug 2023 10:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] CI: Always move the bisect build log back
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230823152334.8867-1-anthony.perard@citrix.com>
 <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>
 <f300fec6-9139-4ab9-959e-35397967446d@perard>
In-Reply-To: <f300fec6-9139-4ab9-959e-35397967446d@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2311c0-0fa6-4fe7-b04a-08dba487aef3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7iHzx+r1vsU/FizoZMBMvTamwGJgf+lUeq8r+KIG5K2CceucKtLDgeHdOf9t59DnimgtxXyOetAm1Xl/ARqGan/zw9AQ+IWN+FvP6XwkTHrvbj5litSbM5qe6WYXzWawo+YhZxR8DliyTakp4RzQS2PU0P0JN3jCkVmWec4zfB7/12nIo5IPLpZ51LadcxXe03PXN3B465nVUOdby8iuLYdYu75uP69oHXvXxsFoBUchoujcNIVXOKEYOs9Brerx6lTO3QsBW9OhR0gzz+4iHjsi/Qzre6P4+AAbG9TAjBX+OuBu2UdvIGlBDiG/VQl34sXo9cdhSrSN6Cs8HvGjYTJaXxsVH7rObMSR0VNq+5lNxsHOS7wrQe/pG+GKSkBEduKSvRNKzh5bZC3HAu7f6FJZ4rxQX12/4SZ4UXyPZX9sVaD0xlZdPZdm9UdTLy6Sm7m3eS3rEhVbPVa1+yuHlgo093vfnaOgg8mTBqCCpO/sZBQOKXzhEU8tavgABZ5nwTxHZqjJyRBFnBX9V4/jLtPUQ4aRzgeSjAOaspv0Q1t453Y75VNN8UWMdRxMpJkKUoSedOrdKFuzMD1wCMebDs6OREjejWw4b81ncskqAeyxRllY15eOQVE+5mvoJYxruOl8lrLZXspR01ZZjlljQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199024)(186009)(1800799009)(54906003)(6636002)(37006003)(66476007)(66556008)(66946007)(316002)(82960400001)(478600001)(26005)(38100700002)(6666004)(41300700001)(53546011)(86362001)(6486002)(31696002)(2906002)(6506007)(6512007)(31686004)(4326008)(6862004)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWxJQnRLWEErZ1N4RXdXR0JFNUxScHcxY2lpOHVIY0R3eHJtTTc5VmdpZjNQ?=
 =?utf-8?B?SkpaTzZocnJ6TXVJSFpwSnczQW1IMVFGKzJQbDcrVnk5aXJDM3FKTnJJN3Yz?=
 =?utf-8?B?NFp5RFVkZEpJMU93RmsyMlJxSUJBaEVyMld5ZTJQOHhHUytURXpMck94b3gr?=
 =?utf-8?B?Sm9LaFd4MGJ2SmR3Tzlqd0oxZXVJdDRLcWZ6QkdUeEdlVExBcFFjVnJRZ21U?=
 =?utf-8?B?Rm1SRlNhL05DNFVVNS9TUE1NdHBqQk9uWTBoQ01JNE40Y0xIK0hEZFJaSVo5?=
 =?utf-8?B?eStnSVl0Qk5pMTNsNm56V2pkUUU4NmszbWtQUGt6SHlBdTFGSlAyVHpJYzhn?=
 =?utf-8?B?L1pRSGZ2c0NNdzFnNUIwbEpCOEZRODkwbHZjV1dCOXM4Zkw4OWJ6MFFEMFFu?=
 =?utf-8?B?TTk3eWpqZlNuYlpuSXpBNXk1RDhDVXh0YVM2WUxNUDJiK1ZubEtQREZFOGs4?=
 =?utf-8?B?aHA5N3ZnZ2FTblAzbWRJVGtWVXVHaFJoQ0M0ejlTQk14VkRpYW8rTWdPNDRa?=
 =?utf-8?B?T0pCeFZ2SmdVakR5cWFDa1hsMHhPN2E4bWFJenFuZzBBN3dEdHFJbGhxd2d4?=
 =?utf-8?B?OE1JbjVXdFdoTWp5MFBIc2hMR3FCeGtoaXppL3dVYjI2Y0tSR3VaOTlDMnZR?=
 =?utf-8?B?N1hPbVZ1YkJ1V0ZKZEM2aHNiK0JBZ2lGa3B3YVlvWlhzbWJobFZ5Y0crSGVx?=
 =?utf-8?B?VjJGeUtYbTlFWW9JZjhManBaSWhpR3MwZnJhWEk4eUU4WC9aNTFjM3hOM3Rk?=
 =?utf-8?B?N0JOd2paWUprckI1QTdNdHp0cFEza0lZa0hNRG5QcmhQd21kUFN3S1daRTcr?=
 =?utf-8?B?ZTQ3SG55ZzJsRjk0cUNkY2pIL0szUWZQYnl1TzRxTER3VlY2eFVDQitPajU5?=
 =?utf-8?B?NTZFTnFRWHJoTVlpampldTdmdEVBZkU1STNSRzJKci9qRFQ4bGJya2s4Zjkr?=
 =?utf-8?B?RE5nRjN0Ui9xYzR3bDBVNVNGOEo3RndVZU5OMUtyTnpRUVlDSlJLdDdUS21D?=
 =?utf-8?B?cUhjUWE2UXJ2SkZ4ZjVrL0E3ekw2WXhLR1BQam1VdWRTZmFDaExZUHUwT1pF?=
 =?utf-8?B?K1dnemVrUUxPVEp1ekMwaW5nb0t0cDQ0bFJOanpjazhDYXZYaTVYVVFzc1Ur?=
 =?utf-8?B?cWI5elFMVnVPdUFMdVF6aU9XZUFaZXlpUEhOUngxcDFVYWZpUWs1V3pSZGYv?=
 =?utf-8?B?aGloRmZDUXVOZEtnVDlMRlNnYm5FZTdPb3k1K2hyMFh5VXFMUW1abExDZ29z?=
 =?utf-8?B?Vk80b0RNVDhPWUhqNi95UG9YUmhqRnhpZG1mZkk3RXFMbFk2OHA4ZDhVbHc2?=
 =?utf-8?B?RHFBWWNvUzBubGJtWDU2TXE4eitDemVBaDdWallYejhXOTA5TnVnWUpmM3Nn?=
 =?utf-8?B?N0pRenl4K2xPNkRTVWF5Uk5rQ0hTeDUxRm8rQk5TNldQUUcwTlk4TUh6VDls?=
 =?utf-8?B?VWw5VUluM0FlOCt1NU1tcUgyN2VQUThRMWdqRGk2SFBwYkNwYlNIWnp5RXhK?=
 =?utf-8?B?M3dDNnhkQWxDNFNCRmllYWtaMzZXVUwvQXV1eEZiK3BQVzE5eHpsS2JrNEtF?=
 =?utf-8?B?UkNXRXN5OWRtQTljQk5XcHZNQ1llRExpZmVzdU14N2pHMDNycjlLbHVzMnJt?=
 =?utf-8?B?blRMYyttYmdrNldOYmZub0xnZjVGSER4aTZmRk9ZMy9NY0VZaFhCcnpyUWwz?=
 =?utf-8?B?ZWRSTUhJU3JGVlk4d09GUTJGZjhoVFFpZFB6NmQ0UEdXdkJtQWdrWXAvY1hx?=
 =?utf-8?B?M3c3Kzg4aEpCQVYxaGFCWXNYT1hnL2ZmMjF2QzNTRlgzTHhKWCszU2paSjVQ?=
 =?utf-8?B?S09BT0xxR1N0YittTFRqYkNUMngrNFoyd3pCRFlKU3FtKzhMWldSZFBadHJ1?=
 =?utf-8?B?SG8rVmpXSnlMZjZoa1VraHlRWFIvL2dCMEpOL2dJazhZRTVEN3YrZG4xZndU?=
 =?utf-8?B?WkhKM2FkdjlRVVcxemZpTWFYaFVCT3VrZDdDRmtPRWIvRmxRakdPQ3RNWThB?=
 =?utf-8?B?WFNaMTEvbWV3LzRlU0tRdFJyemloYis1K0pUTVBNbVNLUEJmcGFYZGFOQlBo?=
 =?utf-8?B?ZXMvUHZmN0t2bmlWOU40cVFvcVZMbEZ3T2I0aDJhMVhHTCs4cHI1YkExUnZ6?=
 =?utf-8?B?bGxxZXFZVUJqSGRiK05PQlNTNEt4V2JNaFlWUDJaMjMrWGVGNEI3NUpXcEJH?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	axNGVV9XFKtPaHCNwaHw5pmgLnN41f+X33ZxA9XogWjwRhYVfoLrFuimrsXmo853S8HlRXBEFo/J9Y4e7VNLBkLgp4Fa/C3bqJ3NG284mZlpkrPRWlZlV/WcrZJKAxYhjR9Qv69nXlMSyGPe0lvWKJPHdl4F1Z9ZNJRg0dhdiiCXMRrPy/rdBoSlrzoS8vvCPCXVrq3wELpjAXmL+POVRX5hwZE8EUSC83baSFEIZYlTmjqXFiwYF4kfYYNZycjT4YKoZe7yMrE1QYZ8T+eDGQjsMSQlQ9jFTfhxUpKPNcrLbfGYfE8vNtEr55c8dUE8dIzN3ZBTQRV+y7drRRJimP6OOyh4ZtWCbDYg4uTip+ivKSx1S0eSP9GpjLY6buRvZaB/CEitzbSxRyK/U1DcnQ1bLlXh2vL2tFGU9S8chTac1gEvWcJc3J1r9n3YIlIHwfrV6af4+7WtxppQLiZjYP8BM3i+OQYXcpitsQ9XVMVykaJ0Fxw4Q4c+M5YTdQNiL1GW4Y5wW4xV0uRsejt7gsf4yfshBF+thsaXp3Ub5zs3xgeKVbhVeT4z6yGF+oMvHbDxw/wpuSFxVAn8a8jrCzf6f7CRUL6ypidnKUxZPx+IsFbZAoM493dULG3a3gm/dzX7IDOryKHdFAZ1VPuECR3g0RoyiRTcE46plJBunIwk42YSc5KOlqqzxk98jk/QYHBWgtt4TZbAkuxSMw5xZZwYlPd1GMEKueKZBA8YHHl5IF/Z3UTFgc+IS18b2u7rVEAGxVg8G/JU1mlzSsL+nXiMvXZbMfRK/OfkMdu6nIQMETsFtS7SgYVx9KiLs1n1mw2BvXGgdgiUxTVUhygrqA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2311c0-0fa6-4fe7-b04a-08dba487aef3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:51:26.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1n980fqQMxscL/2ov7C+gM8pH5mC6dhwviJZcNit1LXrNleuOsgor3E/hPukI9+NFfc6Cpp9jJyyHmikq8zfBfdrpLcnnwx2aG7B/Vtd+sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6123

On 24/08/2023 9:52 am, Anthony PERARD wrote:
> On Wed, Aug 23, 2023 at 07:05:56PM +0100, Andrew Cooper wrote:
>> On 23/08/2023 4:23 pm, Anthony PERARD wrote:
>>> On failure of "build"-each-commit script, the next command that move
>>> the log back into the build directory isn't executed. Fix that by
>>> using "after_script" which is always executed even if the main
>>> "script" fails. (We would still miss the log when the jobs times out.)
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> ---
>>>  automation/gitlab-ci/test.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index 810631bc46..5099f2e6b6 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -140,6 +140,7 @@ build-each-commit-gcc:
>>>      CC: gcc
>>>    script:
>>>      - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
>>> +  after_script:
>>>      - mv ../build-each-commit-gcc.log .
>>>    artifacts:
>>>      paths:
>> Thanks for looking into this, and yeah that is dumb, but why play games
>> with the parent directory?
> `git clean -ffdx` has the tendency to remove everything that's not
> committed, that's why. But maybe we can teach ./build-each-commit.sh to
> ignore that logfile.

Oh, right.  Yeah, lets not lose the log file like that.

I'd say that teaching `git clean` to leave the file interacted and not
copying it is going to be a more robust option.

~Andrew

