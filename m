Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7206BCF59
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510555.788395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmf6-0007iv-MS; Thu, 16 Mar 2023 12:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510555.788395; Thu, 16 Mar 2023 12:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmf6-0007fF-Ie; Thu, 16 Mar 2023 12:24:52 +0000
Received: by outflank-mailman (input) for mailman id 510555;
 Thu, 16 Mar 2023 12:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcmf5-0007eE-Mq
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:24:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a8bede4-c3f5-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 13:24:49 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:24:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6012.namprd03.prod.outlook.com (2603:10b6:408:135::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 12:24:43 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:24:43 +0000
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
X-Inumbo-ID: 8a8bede4-c3f5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678969489;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cvHdYvzfA0pI0YgnJRrlXPYtN9PhxjTx626M75DD7Sg=;
  b=FI/Az81/y4lPgaLPjGm8k5z09FEl9DTMbgq8H8IL9tRqJe4Z0P68CMF+
   sLOuqPey2QawIiafM1IBV1NH8/44nZfjlaLhv1O+3QbYMfgW7v/ynRswV
   oSaVhrIPCb2BLB3xAkvSfgXPkvp6yS9oLs7l5wj9ImCOGvVjNwzlj3RBD
   I=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 101517349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d04PP6gIEZqbFl4KDtpQ6FpcX161VREKZh0ujC45NGQN5FlHY01je
 htvDWCObK2NYmTzKtt+bY639h9S75CEm9FhGlRl/ywzFS0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waAzyd94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQhLA1SdjSI3tu//729eOIxxZwCJ8LkadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAd9LS+bkp5aGhnWc/2AuLhs8SWKj+9eirWC3UvNfC
 1A9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BXMDYAcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGiqx
 yjQ9XdiwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:vsMFBKAddAI+WWPlHel+55DYdb4zR+YMi2TDgXoBNSC9Vvbo7P
 xG+85rrSMc6QxhIU3I/OrrBEDuewK+yXcY2+ks1PKZLWzbUQiTXedfBOnZsl/d8nbFh5RgPM
 5bGsAUNDSzNykfsS+Q2njeLz9P+ri62ZHtrfvCyWxgVAR7ApsQkjuRyTz2LqS1fmR77FYCe6
 Z0L/Aomwad
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101517349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNfqpTfVB8oYQcLmb2l0EF4YfrtOD206WHfDCJ/laGZwbP42AHWeU2WY0bfeQ7BCId6vLu4giA54MCH3zWOaOQeJRrHm9qSDu7ELLBXv6mlrflnsTVGLwU8aiwathanInWCKCCNC++XEubLQsph4KadUlpSKP8tr/7lL9Aqz+gsgc4Ra7O0DJoCG5yHTcJjR6sQGcXY84M4mWeUcnuV4SQOO2/LJ0RdBwuOr+cimbPbKe57f4pNJ0Lvy5OZbRGLqrnH4+I1C4osfMAZ+t3wbS2iIMvRelu8YOlEtChfj5ledOe8/M+Qrc4aN367hn6MgQHJag9UFzmizhUYhRiHVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM8NgWBwfHC+G56WpuxfhxSzR2byFzQqIoYtntZyTjA=;
 b=BclxDexCcVEYiJw7YkFdiWRDq/JsvqaoHzCxqFu9XgPVuNQ30VDtQY8x9oclxR9Iu1Oxi4PpCdi6dovoqWuYiT7gC98fja5gMcVxcI2LdEilo/Yotk26D6dC+KKRElj2iytXxtG4ciGtpFQU1MxIQtPYS4jxaaciTG5l9lk9XRlV8GfBsUOh8xAC31KXPf/En6ZHZagbybvdPIQJkqcvm5cbDOv5pJg6eAbfTQoG0XVObGZlErFS1azZJMDjRL8KrbX8SGL4lLufxGjOZZ34Nfe7pl0LOId1dphrr91hPR5kp6oq3lOAGsgUSR/Sq68YF/+nMpBkCUt+mDWiJ/WIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM8NgWBwfHC+G56WpuxfhxSzR2byFzQqIoYtntZyTjA=;
 b=rkVrSKjJXuW1lhUJ7sEug/hUN5reNjUoGzIOTT2BDqjxovEZuRNMzdXK43lPrMYhr6ygx+am3fE9wMqAFsfmYMjAtcL0mf0pt6kUonKic2A3YzdDSCD3qp029zhrfGO2JqhX+iHp2FyL6THpAnuf4eGoe1Pkv6vntp51CxV/usI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 13:24:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 1/5] x86/paging: fold most HAP and shadow final
 teardown
Message-ID: <ZBMKhQWl1pZppgSj@Air-de-Roger>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ca1fd5-f445-464b-d6f4-08db26196c24
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vxIqY4utKBsD41HqW2BLP2L8i7fIA4Fsny78bl887RBTskAnIFIGuXFkGGaUaTTO2MQTcQjRwAziNuCBFaRTrXiEuitQ3M4gWBG9EfLb+0vPglpMNnunS9QYtsb3AT+9Re17FeeaiUu6lshuHHaTM+oWKWIsTFAorehPUNwvjbJEbDhOjHFBOjF53wXrg4cGxC8psdcXLBUurF5rIATSQNyULfzPKfHEGvcdFhhOo7NIjrXDbZaKD5zvmFc+qFUv8ig/adz9xL1uNaFRz8kAsAXlb6quj4X1J4dvzld9pYGsdbGaASbvxBjps5/hiROEtq9W06YUgcQOmKYYceFWrin6eftkiCRIJWJsP7rfQ2DRcSd83fXQ6s2G0d27V1QJ1/vXQ7NXOAb8PWtoEAKBR1Svx8PYao3E94/xnS0SC/ubocDzf6MoPk26PefHmIqWZOMz+491ROj42IqIhhrUw3pI1ZyoVF9u/UrquWtNJivTpICUwypBiYszLOEm9s4La744Pa9l40b7En3Ml3jqsCrBy2a0GO/1yU+S5LHwFGlrS2UUe1eZvyCWn4HYoKJ97iOx5mtwcQzJz+LdSvGsBeUlD1waz3QgzLHgksfNs3hqffv2gtVq8QmvaoLAs5MN0YQ76mD/70+Vy2NvBsEbVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199018)(9686003)(6666004)(82960400001)(6486002)(478600001)(83380400001)(54906003)(316002)(6512007)(6506007)(186003)(26005)(2906002)(6916009)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(8936002)(5660300002)(38100700002)(33716001)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUFJS0t3aGdLL1pKaE9LTjl0L2dZZ0QzNU5MT0tLYS9MR0lJNGlqUzlzTnBF?=
 =?utf-8?B?b2RwNTQzK1NmZTVxTnNsNVBuTG1JSjM4c2xuU2Y2bmFOdDB0akk3eWJWV1hj?=
 =?utf-8?B?ZUFJTVZiazB4TnlCajlobi9rZ1Q3SmNvQ1hDdHBCa2o0M2VLS00zUzFzV1Rl?=
 =?utf-8?B?YnRNQjNqbDdaWCtKelgwZzAxeG5YT3RMejFsc3pSK3d3WGZRRXBXUWE0aWR6?=
 =?utf-8?B?OXM5WU1aN2ZoZDZwRSthVWtQNDBxS2YyNDNmaFNjYXNkbzVZYWNMU0Q1Wnpp?=
 =?utf-8?B?SXJCUERXTmVDb04yY2szRk85NGNLMHF4REkxSXNabFdwOGpqQmdXamhzbkpU?=
 =?utf-8?B?SHA1V0JRYTk4KzMyNFJ5MUc3STB6blNvYXJhWDFxaVNpeXJHdXQ3NkQxYU44?=
 =?utf-8?B?bFk3SWxYWG4vZmhGM0NROHBGbTdkcmFXZmRQTkxHaHZwWTdDcjBkZTVleEE5?=
 =?utf-8?B?OExDZlZmejM4b3dzaENqRDVGbmtCaUZmMzVSNjVPN3pRdXVIeDYzOWtRTFJ3?=
 =?utf-8?B?bURvYU1NYWxZM2JDN29PUm9OYkhLMlpCUlp0VnR4cUtlQkdkeDhoS3lubi91?=
 =?utf-8?B?cS83Y3FiMXFxbG5xd1JpNDF4aG54OTAxQXRvT2sxekYxV1JVTEVmY3RHRHZS?=
 =?utf-8?B?V0t5bVZZNEY4em1JVXNXQlBLZlp1Z3I3b0NQUEp6THNLUWtuQ24vUk9JYm1Z?=
 =?utf-8?B?Z1h4b09EYU5IanQzcm4rdEdxTXJMcTJEUjhjYnVJdUpHN3ErOVQzRy8yck8y?=
 =?utf-8?B?UGhielBuckdXOU5UdnFOazRJRFd1OHlvU01ib05RanFmUEJrNHNlWkY4RGk0?=
 =?utf-8?B?OS9kMDA4V3F4WVNRSDZhWityUCtaczZsaGlaRCtmZFl1eTF4b1Jqb21KR0RN?=
 =?utf-8?B?SFgyNlFHNGJ0bDY1RWxXeURoT01QY0UvTSs3TUgrUVVMZHJTYmNvU1p3NTkv?=
 =?utf-8?B?eFJkNXliR1pCNFdNcmNndEZDeGxDTGhtM1NYNHh4L3V1anFZN1draUFjS0RG?=
 =?utf-8?B?ZnYzTUVwRmdYSWFONVVPZ0dlMkY3dWRKVUEwamwwUWZnVUZ4K3ZEcE1scUxl?=
 =?utf-8?B?biszRXhadlVLMEtEYWMyUGtxdkFjSGZuTDV0ZEVmOStLZjZyS1AxWG9xajhp?=
 =?utf-8?B?QWFGYUJoc1NJS0Y5TGJsWDFod1RGNkdtdTJFWHJZMzRGR1g5STdpMSszVU1w?=
 =?utf-8?B?R2hWcHkvdldNWEhlNVJzaUpyUXdpMFIzTVJ1ZFBPU00wc2VVUC9zQ0w5Smwy?=
 =?utf-8?B?SEtaNWxTaXdZTkNKK0JrOTNRM0RsdEZlTTBqOXBKV09kU2hRUnJrbi95djg0?=
 =?utf-8?B?cElqYTRCdjI4QTlEZ2N6UUdOSlpETXNkZHVETEw2MVhvVXlPNEwyQXVGMXdZ?=
 =?utf-8?B?UkgvdG1BU2hqOEsvVVJWZTN6YlZ2dE1nK1ZUb1lmZjk4UXBDZUxuMW1wTXRx?=
 =?utf-8?B?c0EzcExXUElzeHVpOXg2NXZnNmZkcGVteWxWa0xBK3d1YUpqS3NLZGNlTHJ2?=
 =?utf-8?B?U1BKTGplUDFXVHFhRTh4eGJuT3VicSs5d2NRSFE2WWRIaGg3ZTFGejZXU3RO?=
 =?utf-8?B?QXREZ3VTQjJjZE9zQjE2K0paUEQ1S3J1RjVYOExHdWxEbnJaTHFONjZkYWQ5?=
 =?utf-8?B?ZDdHOXk4ZmU1WE81K2NkZXgyMllmWFI2SS9OV1M0eDIxRDdaMjRndEI0cW9Y?=
 =?utf-8?B?Z3RuOG94ZGxVSk1wUVNOclV1Mk9WZFVhWnRxV2RPSXhiOWtFVlVYNVhaZTls?=
 =?utf-8?B?ck5CNzdhRTVTOEVzVEJuK29uUFV6N2VMNmtOeDRXbGV6VkE2dlB5L0VidXFV?=
 =?utf-8?B?NWtSS1VEbW5YbFR0NGtqSU56Rit1ZXB2eHFYRXI1K3pHOEc0TXc3ZTFmM0N2?=
 =?utf-8?B?eXlzN1RwMjlEV1dDYzMzTjVDd1B1K3A2WDYxZzNxeGhqMEw1c0cwdEN1T04x?=
 =?utf-8?B?a25UZldhL2NTKzVKTkNZWTY0eUpxZmZLb0l1eTB3cGVFeXhrczd0eHkxM0NH?=
 =?utf-8?B?d0pGNXZ2aGt4QmozNlp6SDkySmQ2cUVOMGZrZ2Nac1pBWi8yRVJPWjhYOVJM?=
 =?utf-8?B?RGRLSmxaRklOcktqRVBnYlNvVEhXY1BVdFk5UTZWM0cyMHNLVzNtc2FTcGIy?=
 =?utf-8?B?Y0VUS1ZneXVsK3VkTWNpUHF3MkJxK1h5MHNlbTVtcjJua201ZjdkU1phMDRB?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EnmkrDtJOi9gMVAkCrx/Vc70UeHeI1rUV9IYYszfOp1BCUhDTepZHk1K/wQ8R2HHF8ri9MNk2A/Ep2LGB7w1gPCGl6fPHRLVr0PBHB/IgSt/Or/jNWAQ27HZQ3fi0MwezJB06zTzAy1IsJ0NL69Ruvd8h2M1BERx4alt3R1RayZim8SGsuAz0FGkuCD7p1LBB2VYEo6e2xp63VYzSCyCCWERf2AHTmzdRB+z6R5lUjqelp4DQseI2QGJ9A3GGgCMjsVzv61MzbVllQAaP0/FeVXtIa1vtfApboIBfaaI5tgmuUJdUXMiogNPmXbeyWhymISIpDmPVuyrq30QTENgt1IoBngFemrFIZJnbNMJEUgu30MgTzPOTB+eVgErHHljkNQxLqvCjXc6s3aDwZLOJ/VnNL1NBo+KnciBxCBoLbkBpCJso9vXzrvZG7kYDddu8wbNSk4sWU5yf3+No8Ibm3PW7fuv2twHvsrzjVbdl3r4ntYAJnf7d0glQdnEwF1oI9C0oc3t+YWzQTP+0LzfJUlzLMCC4wA++AzG1LvdvzzwiXvs8uzlstYtuMgoBggsZ1vTSCRjHf2DJrSIx1tdbPTjs64khCH7IRfxAsvyaO6PYDD98VeOWuPcKA5pQHLSwfumYZSvklMupNEGs2RSUv9d5JZ4bmm4TxRC8/hRvDW1oeZrKZRj0ZMa5+Pat3tjq3QB3GIzeERk2kvK4riRK/sPH5F0wVI/ZpQzlvn8m8ChPX07csoDpikUfvq4mNxqp0SkERXghMEOuRZnHfYyJ8YEeIOxf7/oFnneDlDwuFcUsWMsZ4I+ymXD5mZVIqn4VQzIbjgZ14LKS262xKGnZg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ca1fd5-f445-464b-d6f4-08db26196c24
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:24:43.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vjODLYRNAK51hVmIZlLp5/5+Qm/tU4vYiJ5tqanZbxP4dEYAl7Ima9ZuBkAR/S5J2inu3oLcLLM8RsCnKe/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6012

On Mon, Jan 09, 2023 at 02:39:19PM +0100, Jan Beulich wrote:
> HAP does a few things beyond what's common, which are left there at
> least for now. Common operations, however, are moved to
> paging_final_teardown(), allowing shadow_final_teardown() to go away.
> 
> While moving (and hence generalizing) the respective SHADOW_PRINTK()
> drop the logging of total_pages from the 2nd instance - the value is
> necessarily zero after {hap,shadow}_set_allocation() - and shorten the
> messages, in part accounting for PAGING_PRINTK() logging __func__
> already.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The remaining parts of hap_final_teardown() could be moved as well, at
> the price of a CONFIG_HVM conditional. I wasn't sure whether that was
> deemed reasonable.
> ---
> v2: Shorten PAGING_PRINTK() messages. Adjust comments while being
>     moved.
> 
> --- a/xen/arch/x86/include/asm/shadow.h
> +++ b/xen/arch/x86/include/asm/shadow.h
> @@ -78,9 +78,6 @@ int shadow_domctl(struct domain *d,
>  void shadow_vcpu_teardown(struct vcpu *v);
>  void shadow_teardown(struct domain *d, bool *preempted);
>  
> -/* Call once all of the references to the domain have gone away */
> -void shadow_final_teardown(struct domain *d);
> -
>  void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
>  
>  /* Adjust shadows ready for a guest page to change its type. */
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -268,8 +268,8 @@ static void hap_free(struct domain *d, m
>  
>      /*
>       * For dying domains, actually free the memory here. This way less work is
> -     * left to hap_final_teardown(), which cannot easily have preemption checks
> -     * added.
> +     * left to paging_final_teardown(), which cannot easily have preemption
> +     * checks added.
>       */
>      if ( unlikely(d->is_dying) )
>      {
> @@ -552,18 +552,6 @@ void hap_final_teardown(struct domain *d
>      for (i = 0; i < MAX_NESTEDP2M; i++) {
>          p2m_teardown(d->arch.nested_p2m[i], true, NULL);
>      }
> -
> -    if ( d->arch.paging.total_pages != 0 )
> -        hap_teardown(d, NULL);
> -
> -    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
> -    /* Free any memory that the p2m teardown released */
> -    paging_lock(d);
> -    hap_set_allocation(d, 0, NULL);
> -    ASSERT(d->arch.paging.p2m_pages == 0);
> -    ASSERT(d->arch.paging.free_pages == 0);
> -    ASSERT(d->arch.paging.total_pages == 0);
> -    paging_unlock(d);
>  }
>  
>  void hap_vcpu_teardown(struct vcpu *v)
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -842,10 +842,45 @@ int paging_teardown(struct domain *d)
>  /* Call once all of the references to the domain have gone away */
>  void paging_final_teardown(struct domain *d)
>  {
> -    if ( hap_enabled(d) )
> +    bool hap = hap_enabled(d);
> +
> +    PAGING_PRINTK("%pd start: total = %u, free = %u, p2m = %u\n",
> +                  d, d->arch.paging.total_pages,
> +                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
> +
> +    if ( hap )
>          hap_final_teardown(d);
> +
> +    /*
> +     * Remove remaining paging memory.  This can be nonzero on certain error
> +     * paths.
> +     */
> +    if ( d->arch.paging.total_pages )
> +    {
> +        if ( hap )
> +            hap_teardown(d, NULL);
> +        else
> +            shadow_teardown(d, NULL);

For a logical PoV, shouldn't hap_teardown() be called before
hap_final_teardown()?

Also hap_final_teardown() already contains a call to hap_teardown() if
total_pages != 0, so this is just redundant in the HAP case?

Maybe we want to pull that hap_teardown() out of hap_final_teardown()
and re-order the logic so hap_teardown() is called before
hap_final_teardown()?

Thanks, Roger.

