Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D976A9835
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 14:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505992.778999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5HC-0005XV-NR; Fri, 03 Mar 2023 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505992.778999; Fri, 03 Mar 2023 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5HC-0005Vl-I4; Fri, 03 Mar 2023 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 505992;
 Fri, 03 Mar 2023 13:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY5HA-0005Vf-VI
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 13:16:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e474e3-b9c5-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 14:16:41 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 08:15:23 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7065.namprd03.prod.outlook.com (2603:10b6:510:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 13:15:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 13:15:19 +0000
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
X-Inumbo-ID: a1e474e3-b9c5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677849401;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A0Tv8fDQBgTHiDtmoZ+dW6MBnDab28HG0qz5q+pXfqo=;
  b=hwiv1UXB+gAz6ERWb3b2m3xb+oDdk3Cx4+YZwIotwOFXXwUIeKoMSxCB
   tB5Ah7wy0zGXrPXzNFX8vE3A0KHYspoSNEtLedrIld64avpdb5aHUMwVI
   UlSdGK/wXGdX2zCQlW8likKkHLw+Zye8yOTptEVtnnJORxpkSiSTtS6Lv
   o=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 98712216
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/tRKs6g8kzvqJSmAgNKfb2eNX161rBEKZh0ujC45NGQN5FlHY01je
 htvW2/QP/+LZjb0ctsjOYy29UkP6JLQn4NqSAZorHg1FHsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5weFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRCcBwPXimkmNvu77bmdOZytucEDPHCadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Re3nr6Qw2QP7Kmo7ECYtDQK9uNmAsw2PSpVOc
 lMXohMtov1nnKCsZpynN/Gim1aBvxUcUt4WFPco5QWlw6/YpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu5MDIZKmIqbiYeQQwIpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUj0qy6+RXNhWKqr52QFwotvFyJDySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02zaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:2xPlQKnFmO1hUj+UEpCesL5uEXTpDfIR3DAbv31ZSRFFG/GwvM
 ql9c5rsiMc7wx8ZJhAo7+90cy7Kk80mqQa3WB8B9aftWvdyQiVxfBZjbcKqgeIc0eSygc379
 YDT0ERMqyVMXFKyer8/QmkA5IB7bC8gcaVbD7lvhJQcT0=
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="98712216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrpNvnM1bfbY1wQj2ZBV6AW0fq+2QVpEtp6ftw7xgI/KjEvW3ixxrz1h8zzwawbDHLeFOEcp32JDY4+MUoOUJRGpZOmANF5yco++mSGZ4boKgekh45TXjrMx3Fm+CVwLxSQJOL9PuGsRG5Qk4+1tHofjxVLlM5ZYIFV4CCd/XyzOgi4LGhxSba++6P2kCH49sJQUw1Z4qqaqfzC6+0kF3D4Jd/WQUm0CTTtY2mAELL1iMNTpSbX6/xyxPqc0deq8cJBaz62DD1kQ0L90UXe5Ac/UBlRb6jt1efRsPpcqBddXnPnGXZQ19Vh6rHwBdaLp+PlK8t9w9uj6YCRhYitoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Tv8fDQBgTHiDtmoZ+dW6MBnDab28HG0qz5q+pXfqo=;
 b=SMsAmViRufPGDTQ3gfrXdB8DY6iP0ZsnQp3bmoaBCykagT/7FTADWovV5i69bUSyidXlHWnxjNaxdDHdt2fDaT9lW5sU8KESD7KIpkm0sw1vq83dWA9erzQKTumTGiZrStPTE9L4wiZIz047CyGoCkfhQ0kEvdOxtOWEEHwtMtVM2wMAh6bUF2EO9GcGQFa2StWk7/VyTW7m3DAdQHupi/szV5xtUdWNsVtOW7mMsk13lb2RdL1lXTLFscgoVkpDjZzVvvXIt1a+3hl7475PDgO1ZqHlpcR2TGY9+rF9JQBCqFYTEXatLF31MBn/noX7wBHl+yAL/imUcedPfQ+dZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0Tv8fDQBgTHiDtmoZ+dW6MBnDab28HG0qz5q+pXfqo=;
 b=k3w68gbJtVV+Hdb9nZyZVpzRStKog+KKYYp+C5OWwjhGE8g6k8lPXJG89HKKqqDzda7pb5X90RbgJssJUZDWY6A4zzHje9x8jj+QUbFQlJC+WYpKX9Di20niUlyKzVJLDV13o3r3RGQ+FTL6LlWG2iSBAGzt/XsNf5o/HBPW5sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c294cac-b09d-ba2d-e4e4-31aff4ec7151@citrix.com>
Date: Fri, 3 Mar 2023 13:15:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Drop sles11sp4 dockerfile
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230303125346.20620-1-michal.orzel@amd.com>
In-Reply-To: <20230303125346.20620-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 231b50a8-8d6b-45bc-e5a8-08db1be95649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0vZohWIlSVaXuw4a4R8x6kHWJQP9oznkIyTIm3LvnBjnL6Jz1193MWu5NazeQtAZH+SbZNPuPPS/JwvKYvmY4G2nC+tCBaQBGOKBJrhdDe27C65FJoTx/oMcMBv87EXDKPN9ORx5ZhyYnTGOkN4Ftcaj/4sFf/dVdGv8AGFv2lRfARQnx7m5Lt7M5AYskfTzGx2giy7jgiVLVCynv35fBH7KQKoOLfJx97aULjAujpk4PBXScvZuwq/nTfrU78V7g2DeI/GZY5gLJHXJXHRuNWZuEQ4bZbl7tfDMfEGBR2z3Dj2pC6OMPmX7sLutuqX1LfSPuBoXjrak9N8Dz2CSlozlwi4/CWyB+BVpcbJ7+gqPFQ/BG1dIYYyLVAqGyzvPZF5fDlgF8ReWFjq8GRq7YwqkoCdedSMf4yknCua4DFnyGS6jJSRSOJkkNNdM+VVqzNTRNq0ORwyyUvLgn1OjK+3Uh0o0otkforVQLtY99EL9RMKfQlouk95E3OaW18fYGFJYQ5IfaVI9FYU0J4F/s/UCf2ZCgb3HubR0VCFgEbweN+kYUmM8XrDM7rhU2Rh8uAQhLulSFeQ1gHrUgAadNbvgHhdetJIhThidH8dUXw3k9qYFUISd6LfCIVXk3ibkqKbqT1qkqsc7x5CAIXUOKz2SdYYT2vi4lk8TPXt5vkMzt/v9Ih77hTi1tTJ9dYzHWh+2RHwS3+x1AfUytlGAnJHBjimxIX49w5Ood6VeT14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(26005)(316002)(82960400001)(66556008)(186003)(66946007)(31686004)(2906002)(558084003)(54906003)(5660300002)(36756003)(8936002)(86362001)(31696002)(4326008)(66476007)(53546011)(6512007)(8676002)(6506007)(38100700002)(41300700001)(6666004)(6486002)(478600001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG5qU2Vzc0xUS1U1d1Q3dkxhZEVnS2NER1NiWSszV3JmZ2NVTXY5L2d2OXRN?=
 =?utf-8?B?Qy91TFg4RHUxMHY5T1NoS2xET3lTdFFuTVBaaWdVR1NXNDUyQzlUTlFkM2d1?=
 =?utf-8?B?YVVUaXZ5R2treCtVcHFrUnlMdFBhZ3dCWklIUmFCUnozblZwSkZYdTAyb2t5?=
 =?utf-8?B?em9aOU9OZTlqUXo2TDY0cjQxSUY2YWR2OW82WFIvVHpTS1ZFU1ZZQWxqWk51?=
 =?utf-8?B?UEJSZERjOG91TEUvcnlFd0JNTllGaW9zWm9MaWlaZkRsR3N3c0o5Q0JwQk1J?=
 =?utf-8?B?TkMwTEd6blRyZGJiczVROHE4TUROcVFSYmlzSnczRlZrbm1MbDNBQnN5ZlJR?=
 =?utf-8?B?bkdOYTZkUDEyanc4WkE4U09WWG1BcDdsR0RBcnQxTXVIZWUxYXdweGQ1ai80?=
 =?utf-8?B?bm54SFAxajJ2N3VQSDl6eFArdmQxSXNhelpkM29Db1A0RUxiN1lZaWQ5NWFO?=
 =?utf-8?B?L2dpbUthQytPZ2g5L0ljY2NxTHhFL2FRNWN6ZE5qWkNHSStGVEdkRURJcE16?=
 =?utf-8?B?YkFxQm5Mb2xHUE0ydlhvQmNOZkZZMXQ5ZStjbWVvWHY3Smx2cGdaYWx1QlJu?=
 =?utf-8?B?RllJOTVFVVdZSHU3TUJPaG5YNnJ5TklISFp1RTN0ZW51NG9DQU8vSzZlejQx?=
 =?utf-8?B?VHhyWWUrSm0yY3hncTVWRncwZ0ZDN3VMemdPWXRyRlpCYUthOTE2ejQ3UFM0?=
 =?utf-8?B?L2JlQzcrWFZMZ3g0OUhOY3BTN294UmN1cmU2dFMycDNmaUVDMW1KSjh4UjFH?=
 =?utf-8?B?b0xuRlF4ZGliL3QvUTdwTmJKNk54RDFWNmlyYndON3plbUdaNmZSbzZRaUlC?=
 =?utf-8?B?RStUeTAzTDhmOFJMdFFBYkxndnNJeFE4OUNiNzlqZTgzcVovSTd3NnlZeUJy?=
 =?utf-8?B?UEdCZHBJQ2QxZmNQOW1EeW41TWtzdWhqbEI4M2NDM1lQQUl2TzVnMHI5Qk50?=
 =?utf-8?B?WG43WGJWOEpDMm5HNUI0anRaRmwwU0ZLRS93NHh5Z0hycTNhU2cyVG5nbTNo?=
 =?utf-8?B?aTBFQ0I0VmY1VXZmUnI5dmFvMWl6ZWZ6cWJmQURZL2NFR2xJT1FFOWJhS0pm?=
 =?utf-8?B?WVNWeEgwZnA1anBPbzNwc1NUcjUzZVozRUtCaFd6UDl4a1UxZGl3enJzWWRm?=
 =?utf-8?B?WEs5eVFveXgwa2lMV240VkR6QlVlb25OQ1ROanE4K0F4a2JzUDJQenM1djJq?=
 =?utf-8?B?QTEyV3dZKy9Yekxadm9xRDBpRDR4MEhJdGdTazhXK0MzbStXN3licHdqWkZM?=
 =?utf-8?B?UWhyN25sS0ZUZFlJT0hsY2xXRDBTalAybThVOWYrTkFJSW9Mc0ZoR1ZqR3Zi?=
 =?utf-8?B?WU9FNnFaVXVEa044UzI4M29iazFBZ0h1RXNsQ2pyMmZQNHlCMk94YTkvTjRp?=
 =?utf-8?B?R2JqTkxjbm5jUHdMUkJ2S1NpNFpOOHZ5R1dpQnExVC9XYUN2dDY4VVFLRXJ3?=
 =?utf-8?B?eklna0xPS0RqcnpmZGp5V0hKSFVXd1d2akl5ZUJLcFZDcnNDU0NBTDgzSEZL?=
 =?utf-8?B?a2xDZGRKZ3lOUXZVVnJyWXRqL0p6YTRhQ0NoY2pXOGl0bEllaTNyWlRDaDNs?=
 =?utf-8?B?aXJGQmszM2p6dWV3R1hhOGFFVlR5YXczQjFwQXBCM3lpb2xGdU1HcjJBcjZx?=
 =?utf-8?B?WmRqUjgyQmt4ZkpzQ2QrZ1VzY3VXc24xL2FqbldkY0M5OVd5TE1UanMvSjJL?=
 =?utf-8?B?ZW9WeXp5clBydGlxZVBIYmNraURiM2QzRytxd1FOWkpGeEd4N2EzUzB1TmU3?=
 =?utf-8?B?WEVMSjk1RWtQYWRnekJWWkE3emZMYlNDSUV6b25oOVhLMWJINmJZSWd3YW0w?=
 =?utf-8?B?TWc2OGUwRm5abDBSMzBDRFhnMDVUc0duZ0JYTzh3WTNMMmw1aTg0ZkRMbGM4?=
 =?utf-8?B?Tzlmckc5ekNseVRKT2ZwTUYxV00yS2lSakFBTWtWN3k0Z3JsRDZhODB1MUZu?=
 =?utf-8?B?OUZuZWFFNUZWYjBDUVhxRkxJZm9WZVNhOUowSC9EWDRXdkRQZVI4anlCMnZt?=
 =?utf-8?B?bVJmRDc4TmlzOU05dmhZQmU1bXJlaWRLRTZRaS81ZHg1d1FaV2Nzc3diODdo?=
 =?utf-8?B?bFdORWVIU2NZYVpnalA0NVphVGJJU1hCZWlYNXl3Z29IV3NocDA1aWNpdmRQ?=
 =?utf-8?B?NXhta09EYng2RHFrdFMxM2pXQkFsaWFpN1dCamYrMklyNWJOVFZpNGp0MmNu?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xsQ4fYrrApRAjwlL7Lj4Y1LysI8J7WdZBDccJ1Y5ABlgcGRsPWJN7FfS6e8dqMhTa0Gibu0L8ksOvc5XDXv40SBzGj4H/JtCPFVZDiQW4ng4BnfujGnmgDkfYr/HU3LlJ06QP0aMvd2qw7x/Hbzad9ZnSTdkw0P8ZA4ssD0kcrTvtMzIAFipBOLF3NMnWvZti5CyZ5wZCc4baZhat3Fi+sG4FwZHUr5clqq/yaiPYt78SFNAnJztjFyn/3/qT9hHs/NNMTPsF1iLUJWU1SLUczG0a9KOcb04IYomvfq/geMyfCkVyMNi61yI+n7uAHIyX0AvDav8NWu8rWV848LS/9BH2iek1IAZCTd5Wb75YDR5hn19nctvrpqjNErgH8hPn2//f30Jab1BOA2jQ065F0bDbaQwvclTfY+wwRR9c5dYZGTNd8WGBp2PcKW5D3DYBs5qdln052K3G0sMbatLbc2vaJLCT86/B9Kivd6ZbIYKGnycKqogCwJ2VcPGaf7LN2hN40FPBPMEfJetlFvQItWKdIH/3cTem/hXClaoFq0XD4C6H7kdmKRaj1V16lyzlv2FgjtB4JS9PW1CVRtgwew3eEXFi4YzRts8QwM/HNbwxdRvsbz6neo4c2S9jGpw44SKYLAPDL5OYzeC1lmkw2so0Za1+mTeFyrP+XDqeAakgvSaxxf/XjrIfCCOiZuojYV0UySPeNRFLiD2aAR7JYAWPpufOJbQB8zjMOK4hye4Guagy6SNQfocJTE+G/iX0GyQpMzxcYDMlQyVD0Xep7kfEJP+XB+bDjhYHmp59QwQc91hls+JDmFv4+MRf9ts1kz1Y1jFKDaikGCaF1aOmub01XMIfAMMQDgnAPipvuU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231b50a8-8d6b-45bc-e5a8-08db1be95649
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 13:15:19.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eV/GaE268LSPSmUtSa1U2eFhiE1T6qa2o+99CFac3FhFfT+OpWtDcCuc3Bg27WEAxPsZJdf9K3kBp9rKTy4JP5mszkISdykBBrR/+/WB8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7065

On 03/03/2023 12:53 pm, Michal Orzel wrote:
> It has reached EOL and there are no jobs using it on any branch.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll drop the registry tags when I commit this.

