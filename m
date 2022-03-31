Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22F4ED6E5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296794.505329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr78-00060A-BD; Thu, 31 Mar 2022 09:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296794.505329; Thu, 31 Mar 2022 09:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr78-0005xX-6y; Thu, 31 Mar 2022 09:29:10 +0000
Received: by outflank-mailman (input) for mailman id 296794;
 Thu, 31 Mar 2022 09:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZr76-00057w-U3
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:29:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d091a5-b0d5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:29:06 +0200 (CEST)
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
X-Inumbo-ID: 01d091a5-b0d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648718946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Rs2MHh2ZJ+EDYLUADCFGhFUgZykTojljIizKD8oilmo=;
  b=P865HzZsFTh+D+AUwWh6OQtKzTpK+glYL10SBA/MSlP1QB2lIW0lQ7WC
   0IrqmJ4nBY1icx8KAnpLoYp1rNMz2KXYtOdaS7I8b/qXDiYs54SdJEksW
   OIRaVmLUxRJ+yp1rxcgIM/HvIfTFhtsBvUFZawHYRf1hjs53LHwXwLPAm
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67073037
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:alCV8aB88sgFXBVW/z7jw5YqxClBgxIJ4kV8jS/XYbTApGshgjUCy
 2oWUDyCOqqJZWvwftkkb4+w9UIAvJ/WyIJiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vi29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgvx
 PR9noy+eDsQZPfPv9kiTiJqVAVHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg29v3ZgVQp4yY
 eJIUhw2ZiXNTyZNO04cOYk8wf2uhnXwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCCIny43S9RhL9RgsgKq95XJ2DTeIlFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94adu51qXHb4
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLzI94Nv28keRg0WirhRdMPS
 BWJ0e+2zMUOVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5DUk08GCr2vP3G/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chMwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:4bptDqnCVk9wUS8ENArLh70soyrpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTMuftWjdyRaVxeRZg7cKrAeQfREWmtQtt5
 uINpIOc+EYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ARV0gJ1XYGNu/xKDwQeOApP+tdKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfcla9OS4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="67073037"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRg/V0qiiZOR+tfk8fShmtC6nni3ox9nIht/nl0hk32yMQNC+EpfXBwdGXPx/15IvlQ6ILLPMSx4CU0BQpwLLZZQHAGTvqvvOkpZRtxifu3sG64KeDHN6tJUeJhHoqKWlRR7JxXhMULQEB2B+ZSirihX3065cJVAiAnAznssa+eX0I2mulu1jNQMisQE8y3iHNqPmbtGT1o3bCaEEWWVtDmicW1QMKJGYq8Toj8ojiXfxgL8tJljIUM1sOAIItzf5uYLCIfIScYGXuAgIDVpbHBer7HtMkTn73RkV/2Q6nhjpEUQ6orq9xWzdrqsKIteoPCh2VanTlgyagsPLGwWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zOs9KQDLyMD6IlI88q5G+0E9Ex/JRqGOGtfaTxdMpA=;
 b=K22cu1rXxD0HzcBrC9I6RfFizDT5ofQAw00aThVMXX7RKtE2jaFIYTZKRru7z3XH6NOpgsRUom4y8FpLk0kZ/qumd/Hz3xoM/UEGIDlbseM9rogT+B/gTSYZdPwMEgAfsYOr6xdQgjmhIskQy/kFGDGsPQA/cSYxW+pj2G2Lio82lj9joliGvsVKXJdFV0OdfVkB8iN4hkjgdWzosG4YGcPJHIJPszPzg4D7nXkRCqAybSMtaH0ixXb7RSF8A3WiIF6TGleq4QytBCwRUkPG9VxaielE637x5RneEZz24c9aAf4oiYS4R3tofuDpT5KEmO7GHhkrZMJpCyYKcWtObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zOs9KQDLyMD6IlI88q5G+0E9Ex/JRqGOGtfaTxdMpA=;
 b=u53t94ywhRXdl/bf3+JTLJ1Qc3oIzLwRXBa/QygV1dFYNq4RhhO5Cvxn8zfQjftp/nv2LKlU1sK5z3rarraKWvkxB7P0YmAfqEkCzejU8m8wHz+tvF3qX9fCNPxnQod8HeP19TYbG1FScyg2uKfhHnzoEzx+wiUZpnSsw688xz8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Thu, 31 Mar 2022 11:27:16 +0200
Message-ID: <20220331092717.9023-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331092717.9023-1-roger.pau@citrix.com>
References: <20220331092717.9023-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57b4bb55-1c43-445f-cf9f-08da12f8e391
X-MS-TrafficTypeDiagnostic: CY4PR03MB3112:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB31122A633BCE5F0B59F9DB3C8FE19@CY4PR03MB3112.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/KoITIlkVH07clgCivq/hw/wTfzHFhM2NBa/oB8QyKBpyEelkPhKFjrnFk9ARZJcLOxWRSMAsCnCuGrY1wMdtb45RmDzYlkaKw/lmMO5r+RiUkJeyPSG9BKiziQtklkHeFNOUHO+2WPG8C9DOG9yDehP7UhEaZs0J9590mqrIVCmB29RIe2uOuKVm7JJJlBPk9mkPfhrnVw1PieFfVKANWL9l/ltbKyFK12IrNPUezG78A5MVPuK/UPDDNCgXXeaCdQYkAJqhcTx8W7u3VBf3aSQMh3OPIx1YnurCj/mQYPehPHs1tr+MkOWZ1zu0jjOhtqEV1rR1xY5t4d2TTXvNevDqy2UJiJBLLbDn0Wg350Yjatg+ruKDv4hr+qggGLW1q89U3DLShCJ4ouHWgF/neSeg8WzeqYZ+QbstrEp6v4KjycQW6wBU+psvjZR04PrNRAsZwg07XTDJLg+KWRRoGjeiBZfrFzbtf35s9g5ELxgcKlYXvsHsEySdFEuDvjAbPpFBOX2qYl5x+ApKx7QIktFqub4y2FLM6hcdw/uisvmmKRAWFClov5zRydQSjyI4BadViK1mU27SSEmenIuABQvGzWz7fK5iNSVImYZMpMiujZ7cYnxHzbXiS/dVycHns9nwkJnDH0Kbtx/u28bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(186003)(1076003)(26005)(83380400001)(2906002)(6506007)(2616005)(6666004)(66556008)(5660300002)(54906003)(6512007)(82960400001)(8936002)(6486002)(66476007)(38100700002)(8676002)(6916009)(4326008)(86362001)(316002)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1lobUpBaTJJQXcxVWU0ZkpZYW0vQkgzQWxkaHJzQzRZdVNUTm9ZRmNlNHBh?=
 =?utf-8?B?UmIxRWpGVUFhaWZLVE5rdFVIVEVjczQyTEsxLzVYeEptRkxzRXFNV3RCWGNx?=
 =?utf-8?B?K1g3UG9vRVVqODE0L3FPSDVwWE4rTHlkOFhUK3JHcUpoT0lYWTRFU0VwUnRQ?=
 =?utf-8?B?U3l5eExuZkdNcHR5d2U4L1AzUEtQa3lJQ3l2RDVnWmhYVFk4dzZHeUJRTUV6?=
 =?utf-8?B?Tkw5MjNvd3pSM1lDRCtGVG5HckNOY2txLzA3WWg4QjFSYVRQNGpSSVdPK3ZZ?=
 =?utf-8?B?YmVlWmNjcFB1czdVR1lGYmdkNVVzMmYzMElwaFc5ZVBORUI2RnFvaVJXWlZi?=
 =?utf-8?B?d1BIdnlEcnZrSlYzOEczVzVPNmZiVi81Q3Mzc3BJQVI5QnNCRVhBLy93dm55?=
 =?utf-8?B?NEp1Y1hHN1FsUTBYY2d0cmEvZkFEUVFaMExNVk9vR1RFcngrWkxHN051ZVNx?=
 =?utf-8?B?cmtJbkV0YlJKSkZJR2prOFR5QU9oNXhXQmFDTVFJL09mRlVYb2FiOWJMUzM3?=
 =?utf-8?B?VXBrcWpWREpzQ3Q1V1RsMXJNRHhQcE9LQUZ0MGYrY2RaMFNOT29QWHdNWDdw?=
 =?utf-8?B?TmNSdmsyREpqN2dqYkNZTDNqeTNKaXJCaTdmWWliSFNyT0d0UGppNTBtQzIy?=
 =?utf-8?B?d21YalBzbUJ4TXZFMWYvdmhLNTBWYkxVa2V4ZFFvM09CTXNYODFPUzhUOSty?=
 =?utf-8?B?SGlLVks3eEhTL1Y0V2pNOXc5SDlLVGRWM0dPd2dFaERjbWRBMjMvTXE5Rm8y?=
 =?utf-8?B?Y3pZdXA5ZkZxU0pleUwrMTVzOVRJa2htajkxd04rampWdGZ5L3Z2cm5JbGtZ?=
 =?utf-8?B?QWdQOW5vRTIwdGp0dEorRjJWKzErTFVQeS9BVExVYmlxdUttNnQ3MG96YlhX?=
 =?utf-8?B?YTliWURhMWZObWFMS214YS9yazRrUTF3L0lPYTBvRHVwRVVYNW5YMDllTFBz?=
 =?utf-8?B?V3J4WnlDR1hJcGdLWFhKRmUxbXJHWVVUZ3k2SFQ0cmVDekhOMkNWc0N4VTlT?=
 =?utf-8?B?Y3R5L1RyOU4xSDdkam1iNW1mSm1xbTV5TS9ieUhyTFdjTS81T1FndXRGYXpn?=
 =?utf-8?B?bjlOWWtWTmwvOXNBTmdkVStteXdCTys4ZmpWc1A5WS95T1gyWm8yNTQvK1Q0?=
 =?utf-8?B?MDF0TFZlcDQ0dEdGYWFscWQ1bnRmSGozS1BrcWVNbXZDM0JhV2NOT1FqMnI1?=
 =?utf-8?B?NVhoUmxyckQvL2ozYkxEcmUrZFhMamt5RzlBUmE4TW15bHlmbXFyVmF1bmts?=
 =?utf-8?B?RVdWWmRhanJrTnFTZlVFM0ErbnlXcXJuS0lKMHF6dUxwTGY4SWk3d25MUHN5?=
 =?utf-8?B?Wng3dkRyL0E1VFlpOTdDVUVmVS8vQUlDcWxvMzlpRkFrdkFBS1dNV0hsRm1x?=
 =?utf-8?B?QTNWOWdNZW1jZC84clVBZ0QrMGRRUzlnWEJPNWFLejM4QlJZbkVVWmhSVkMy?=
 =?utf-8?B?YlF1WHJ0UHRSRVg5bElLTytuSW9iUWRQck8rTUx4Z1YxMG9UOWtGS2JET083?=
 =?utf-8?B?K3FYaWg1UjNOTHVNeG03eVJUQStiRnVMdmg4emd3YzRwYzQ2cUpyVUFsak1Y?=
 =?utf-8?B?Z2pvWUxsV2hvbmFuOXZpc1ZHbmgrdzA0aVFaK29uSFM0bmUwOTNMTEFheUV2?=
 =?utf-8?B?MFpLVmtMN3pWUW9CandZTGs0aVpGdWtsQnlXcWsvcmlEcE5oRE1nbTlFWWtB?=
 =?utf-8?B?V1luVVd1TERPdXlxUGJvUkpXbE9XSVFDMHNDd21EWlh1NHprbnZKY2NFL3J0?=
 =?utf-8?B?QmF2QUhQM0hWL0NXRUFZWUlUSW51VTMvUXF3QkFtNGVzQUpFQ3gybkFEN2hr?=
 =?utf-8?B?RlByQ3ZvYzlxRE04WjZkbllZYUhtSmw5VkVHV01WTmxLbkxEbWROaTg4U2kx?=
 =?utf-8?B?YlJRK1VXTTZoeHVoWlliVFdhZXFlbzVhSEZCUUxtS3VIY3I1eHo2dTZpeU81?=
 =?utf-8?B?aWoycGtzR3JyQTRmT2JsTVFpZi9UWWJyWnRWb3JQdng3a2tVMWtNN1JrNGt6?=
 =?utf-8?B?b1pBZWhxZnovM1FhNDUzWUwyUnhLRnRSVHZBTEY4b1hQWUkyTjhPbVVFbm5r?=
 =?utf-8?B?UEppVlY5MG11bVNxbUNGbnVkL0lKZ3YzOW1oNDJXanhjbTZFa3hFMkhIdEhi?=
 =?utf-8?B?cTUzQ1NLc28rNFhmUTJIcmpZUWhiRnRkZmpPNVR4SlZuZ3dCek9YZGhyV2Nm?=
 =?utf-8?B?VnY1S2tHKzVsWC90NEhoRjR1OGxCRUp5RVI2ZGNmRGpQRVgwWDJaTTNjQ3JD?=
 =?utf-8?B?T09HaWlCWG1ROUJYQXRwZGhhb1ZlZzNwUlN2MzZhMnV5R2E3MEprckhPRko5?=
 =?utf-8?B?NmlvNmJ2QnFSTmdEa0QxeG5sbVo4cWdrb2taYzBDY2hnbE00TGxScldtdzAw?=
 =?utf-8?Q?NVfEiQp/gJzSORdg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b4bb55-1c43-445f-cf9f-08da12f8e391
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:29:00.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiSJ7dMPCEuxLz8UyRBj+W86aeSAXrFhrsZ9zN17P9fWlHCoQEiLr2DCIrAWZ3HT/mND/CSomaxH8LkPSUIxYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3112
X-OriginatorOrg: citrix.com

Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
hardware has support for it. This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one. The added handlers for context
switch will also be used for the legacy SSBD support.

Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
to signal whether VIRT_SPEC_CTRL needs to be handled on guest
vm{entry,exit}.

This patch changes the annotation 's' to 'S' because it introduces
support to expose VIRT_SSBD to guests by default when the host
(virtual) hardware also supports it.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Reword part of the commit message regarding annotation change.
 - Fix MSR intercept.
 - Add handling of VIRT_SPEC_CTRL to guest_{rd,wr}msr when using
   VIRT_SSBD also.

Changes since v1:
 - Introduce virt_spec_ctrl vCPU field.
 - Context switch VIRT_SPEC_CTRL on vmentry/vmexit separately from
   SPEC_CTRL.
---
 xen/arch/x86/cpuid.c                        | 11 ++++++
 xen/arch/x86/hvm/svm/entry.S                |  6 ++++
 xen/arch/x86/hvm/svm/svm.c                  | 40 +++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h      |  1 +
 xen/arch/x86/include/asm/msr.h              | 10 ++++++
 xen/arch/x86/msr.c                          | 16 ++++++---
 xen/arch/x86/spec_ctrl.c                    |  9 ++++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 8 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 4ca77ea870..91e53284fc 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -534,6 +534,10 @@ static void __init calculate_hvm_max_policy(void)
          raw_cpuid_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
+    if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
+        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
      * availability, or admin choice), hide the feature.
@@ -590,6 +594,13 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * AMD_SSBD if preferred over VIRT_SSBD, so don't expose the later by
+     * default if the former is available.
+     */
+    if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..e2c104bb1e 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -57,6 +57,9 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -114,6 +117,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 64a45045da..40ff28ecf1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -52,6 +52,7 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/spec_ctrl.h>
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
@@ -610,6 +611,15 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told about it
+     * and the hardware implements it.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
+                      !cpu_has_amd_ssbd ?
+                      MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3105,6 +3115,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( cpu_has_virt_ssbd )
+    {
+        unsigned int lo, hi;
+
+        /*
+         * Need to read from the hardware because VIRT_SPEC_CTRL is not context
+         * switched by the hardware, and we allow the guest untrapped access to
+         * the register.
+         */
+        rdmsr(MSR_VIRT_SPEC_CTRL, lo, hi);
+        if ( val != lo )
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        current->arch.msrs->virt_spec_ctrl.raw = lo;
+    }
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
+
+    if ( val != (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7413febd7a..2240547b64 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(28)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ab6fbb5051..460aabe84f 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -375,6 +375,16 @@ struct vcpu_msrs
      */
     uint32_t tsc_aux;
 
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only. Guest selected value, saved and restored on guest VM
+     * entry/exit.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
     /*
      * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
      *
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 72c175fd8b..a1e268eea9 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -385,7 +385,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+            *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        else
+            *val = msrs->virt_spec_ctrl.raw;
         break;
 
     case MSR_AMD64_DE_CFG:
@@ -678,10 +681,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
 
         /* Only supports SSBD bit, the rest are ignored. */
-        if ( val & SPEC_CTRL_SSBD )
-            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+        {
+            if ( val & SPEC_CTRL_SSBD )
+                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+            else
+                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        }
         else
-            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
         break;
 
     case MSR_AMD64_DE_CFG:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f338bfe292..0d5ec877d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,9 +406,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index b797c6bea1..0639b9faf2 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!S MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.35.1


