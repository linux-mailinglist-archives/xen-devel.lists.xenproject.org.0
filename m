Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD436F66D7
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529612.824166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU14-0008NW-Dt; Thu, 04 May 2023 08:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529612.824166; Thu, 04 May 2023 08:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU14-0008KX-B5; Thu, 04 May 2023 08:08:42 +0000
Received: by outflank-mailman (input) for mailman id 529612;
 Thu, 04 May 2023 08:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puU12-00089f-OY
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:08:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dee8e1d8-ea52-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 10:08:38 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 04:08:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6805.namprd03.prod.outlook.com (2603:10b6:303:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:08:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 08:08:09 +0000
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
X-Inumbo-ID: dee8e1d8-ea52-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683187718;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rURzpHR8WrEvYtHltPsT9tGpCzCxO67WbyXQ7TTmH/I=;
  b=dkcprs1wlcHkl5+zAkccE6tG2TxoQtS893+rSDwpRn+xqVueZArtC4LJ
   AVdOl/oN7J9QgdEFD0aChsm+Docn9fnr4WQQEEKIavlKMAcQaUqpTdPsX
   K4/5oQM9PCxwcoU7uMNeiw12930BDx+/EAvY/B/o2h6b4m2zvbfapoNmX
   g=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 106583845
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iWvoxahs3JR9dEywYrlVDbYuX161TBEKZh0ujC45NGQN5FlHY01je
 htvCG2Oa/qJNmT3fNB2b9u28UhU7ZGGzoJgT1Q6rywxHygb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ2Iwkmainbjtvonquwc9J2quIMLpP0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXmq64x0AHOroAVID4mSH264tq5sHWZXO8DB
 hQv9HY2jKdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ/i0zJR9M6Sqqt1ISrSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodd3xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:44NbyapnSXnsq8nXJj8sLCgaV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwOE80hqQFhrX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YET0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dNT2CA5sQkDuRYTzrdnGeKjM2Y6bRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-Talos-CUID: =?us-ascii?q?9a23=3AVwvQmmlrrHok/5QRTwVsXCHrOhLXOVPW9VzUGhe?=
 =?us-ascii?q?xMDg3UbasckW83oxmydU7zg=3D=3D?=
X-Talos-MUID: 9a23:nOAn3QZzYNqxauBTlA/xojAhF8dS2IOpNRwgya4I59GlOnkl
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="106583845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSbaFnCo4eB8wC2GxG2Y4dgZC92A//05vtURnHtT/IzfUkh/pdXAGDH+zfonUWoOXZ5t0zrWLy3cpBkvS5OOzWg3BTPZrOjsyOr8FxMw2OgkpueQ0mnJfXCVcN1H9rv6bYmzMa4qpSr+Pxdu1jpIwCbRyMowz6iqa0EfIPVqBIX1/LONp/kgkNH0YDihMDbIZTcz6RKAwdtdPPO030XdnC9hQI4DoG3Ubfjw0BtYJX8tz77yzB90Hs04OhWBuYkbBCovHsiUPzhfDUYVzyl6EdnCIzyTLse7JjDdefcirBj66tO2lj42YHP892KbEkS4m3OS85hmNC4rRZsx/1bZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaFTPGTvNngWNE43MLLjvuWMkEaKHJDKYxMeBcTAGUE=;
 b=KQg+1fvi2IEFdD46jXEU+U+VHgL0UuANa5FDI8243gdHhiyiWzgQgdDZJiYodh9P2fAubZlPlZU1xICKq/76pnQegVarwl5u7bUa10Uhz7whS6gXeOWN0erfLjbHLfEQcHP4Rff86quJKbdlQOQe+UgYvg8DhR6rg/yO9jwIClS6Dyg5Y+IVhEiNu3H/+zjTHHz+ifHal+Il7q8BKfWcegS90eX/gjqPjOANoZmWv1lzIxYM31522HmeCFB3ByMZhZnyodBtbctn33mfz/zDK1lZ9DhkG9JyVB82QcPesjTGasIjbeLQZkA2XPhG7q4pwI6nLSPAonR4fYguBzv4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaFTPGTvNngWNE43MLLjvuWMkEaKHJDKYxMeBcTAGUE=;
 b=UPTZDqA2/9DDsXPNxAxYGdPsjN+85zRQn0bncABEd/RI5/byw2H+Gc+DfEfWQN6ejD8DNkgrjVOgJ+uOTRGTMbCf5SrXCJCKqGXehXzxgC21SQi/Xj+Va1RMApUR5L+g7t5cv54SVteJt1pUCixDZ7hgv4KssKb0pfcjVbHoD1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
Date: Thu, 4 May 2023 09:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
In-Reply-To: <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f82236e-b346-46ef-69ac-08db4c76b25a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q07bJRdyBQ2vcFGBGSoR7HmmV/kKQqQomfJYD9cwKwBOKQEsmp+81FdLOFHivwtW8gdcY33mVPBjLccb2dDtMjsFdTiRzxDNcyNFsrlRMO7dYi9WxSQQCghsidex4No0QYalSGQuh5/PTyCPno3XfjOO785b6+taLWPtfgNAIfavDoj/4WNrA42V4BHFZcEVrtY3Agm9KNa6YZH/liTLC6BcbhLHc5hBw2agnK/umaWyNDpm2FGh/mFFxwUQMiaFp2qlDh6juJzKbufV0LKSmeULvDTL4o6JmbTddneH9HXrZGJm/nw3WfiDsMAJ1aRc+nIHPNT5S0xuYNm2FxRMxAhTR0xNRq7AgeQ9iP3CRFZB52luJFi5NOPnit1GnZ3o2FNuIDZKC20zH7Yha2WvSXOIk67Qll0w6RbYaBbGz9/VczMQoNYa0VIIVud9cd7Uj0CEH9O4EYTT64LKRCaIb79eav8EdmhCpWOWN+4il39z54iPgNkiusgdJ8fw2KzL8C17sI3mZ7zNUv4jgOiOIf0WVY0D1XSdw2bfnfz3aS7a7+mRsxm0f0evprqFFNE2AleJclokAAtXDHCoTEldJ3b1AofCP+kP0HTHGMVX7KlihZ7PTM31C5WTn/yQ//IFuMCqYhNU5ElYHg/nqMbXFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199021)(66899021)(31686004)(36756003)(38100700002)(2906002)(8676002)(8936002)(86362001)(82960400001)(31696002)(316002)(5660300002)(66556008)(66946007)(41300700001)(4326008)(66476007)(6916009)(83380400001)(6512007)(186003)(53546011)(26005)(6486002)(6506007)(54906003)(478600001)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGNLcXRGMEYwMkVBczk5bFRrcGg2TWF3c0ZETTM2UmlKcFRmSU9uTjJLbFJp?=
 =?utf-8?B?Tlo5c3p0Y1Z6dk9INHVDeERXMHpYRFhhY3RsNG0rbXVhbmFOTFpUZWpOZWJS?=
 =?utf-8?B?VHhLRk1Kdmh1SFhNSk9TWEVNKzViUEFZZFM5SkkwQVFjRW93bUY4ZlNqeHJu?=
 =?utf-8?B?YVVhWC9FRFdEUHY1SEZZNjFvTTVpQUhHNk9TdDR1STBZakgzdkU3eHFoVU5E?=
 =?utf-8?B?bXdFdnNHZm5sMlhacEpJNFFmVDJXZkt3VXFjeVhLSzlGbmdEQkJJS0lWejNW?=
 =?utf-8?B?Q0RYSnZCc1RsWU5FSXh2cVVFcGZHL0NvM21ZSmZtMWVVTUxGUGxXcVNkNXBp?=
 =?utf-8?B?N2t0bUUxM3ZCZjIvZm9IWlZCVjMrQWFldVFMWkhNR0ZZdUhNUWJnb1dVTGtw?=
 =?utf-8?B?UDZlUXBIOEpGTHhZSjZCeU1NT0l6UGg0NVN5YmZTdUhFNVVMa0V5c0VVNU1y?=
 =?utf-8?B?OEErbHRXUHRsbVB2SXBjWWRkR1lwQmFmR1NVYWQzTkdDOUw4Sndpd21lTlZF?=
 =?utf-8?B?RUE0U1QvQXBmditXSVo4TVNXQU5NVldFMVFEZ3VDY3RQTGgyd0cvYmJKYW1v?=
 =?utf-8?B?YlhZeDZDcmhlZjVmYS9YK095TzZVNU5uT0ZyUVpUZ0QzaXZaRjM1T2Vic083?=
 =?utf-8?B?SmFTMlRNZUdyNjhJRjNmMEYrZlkvclpnQlFqaTZIbzUxa2JHWUI4OGVYTmtm?=
 =?utf-8?B?MzFhaGNOVS94WjJTMkYzKzZHeTRScEVkKzZGK1hCeWJXVVRzVXFYZEZ0TkVQ?=
 =?utf-8?B?cmhrUXU5UGdoYUpNa3luVHdnRnBqelVpZjA4Y1RIZ3R0Q1RXSUNnS0hYQ216?=
 =?utf-8?B?UElocFFTK21oUmdkSFNIU0VwWGlNOWUzejVZTVVQSGl2VkxOU0UyalgzL0lI?=
 =?utf-8?B?WFA2OTgvb3RiTU4rZnVlSlBqdmlxeGZhNFUxZE1zRUkvR2pKNGFTL3dvV3FC?=
 =?utf-8?B?Z1hKcGJlaGgzMUY2eGRsdWE2bUZiZEVVdnI2eVBXZEIvMEdlVFRqYjlMU0F5?=
 =?utf-8?B?Qk05VS9QM2Y1RmduYTJ6STVtMmMvSFk1WVpGb0VjSHA2T1RwMUR0cVMzdWlH?=
 =?utf-8?B?WTRmeXNVN1RNOFQ5TDhHeVYxMUlaUnY0MVJ3cHN1SFZ2QU1YNXNEV05JNnR0?=
 =?utf-8?B?K2pBWldyN0NHRW1RUjN4a1NhR254Z2RSUzVMK253U1pZWFhiNWoydFNEZ2E4?=
 =?utf-8?B?ZWtaUEhTeFNjU0hRWlQrYWw2T0s4RTU0Zi9kTEFEUUNqK2pBUC9pMFptWFZi?=
 =?utf-8?B?TXk0dGR1RWtHWC9CaEJxZG9HS1dyMk1lLzMzRlJJR2dZdC83aENLaFR6RDhQ?=
 =?utf-8?B?SWpERmVEM0V5bE9RQ2RaemZuSndqYXZoOUlJazVEb2xCcnYvUnM2YUNzQWd0?=
 =?utf-8?B?K09xNEZ6QUprTkFqVFRvUlF2RDV1Mjhuci9VWm90OWxrTkhYcHVrRjRGeHRC?=
 =?utf-8?B?ek9xU0QyZHRZVElDdmdqN2N4VThBdGgrSTlMRDdoQ2w0SHFUSlFpRjc0K1BC?=
 =?utf-8?B?OFR2NmdVYnJ1bTBIampjRkcrQWJRb2FsYWxVWVEzUXdyNEtGekxTU1o3NXJH?=
 =?utf-8?B?S3BNRmhZdER3ZElXczRRdlp1OU9zVDA4djloN1hCaTREMzNGYUFMVk5LWmx3?=
 =?utf-8?B?NFJtVUtNcmMyaTZtNFRndlBZUmFqSHkvcWdJQWFzOVJBYUluVXJrVmd6WEZV?=
 =?utf-8?B?Zlo2VTNBc05WWCt5czRITXorNENpcUswWG1VYjBaOXNRRjk5UzNuMk1RWTdY?=
 =?utf-8?B?N0N5QXNjSzZMUlFDczAwcXY3bXd5dmFiUEJKaEVPMkNhNzFRZVFpTk9tWXVN?=
 =?utf-8?B?cHVGeTRSa2xHWXBvNXNtVlhEVExlVGxjd1J6anJYSnRUSFMwd0lSUmtqZkdZ?=
 =?utf-8?B?czFTY0piV1ljQjlJd3E3Mk5zSTFIS3F2bjFUdld4ZDkvWXNoZ0YrN3dDZTUy?=
 =?utf-8?B?cGVLN0V3dzlkZ1RVdSt4c0p6bWVoRGN5ZWY5MHhienZYWVc5YnluZzRvVFBu?=
 =?utf-8?B?YkNSTzN4S2dZMGVjUEpIMGNSVlNMbnBIcVNKL0g5TWhnY2NQeEtOVzB1ZC83?=
 =?utf-8?B?ZnFOdFJqTUhxU0V1RUxhQTlmVHo5czRsOVFIY1crdnZvWmt6RDZnQlJOUzNI?=
 =?utf-8?B?ZHRGTThTenFjcGI4T0NmU1RObzZhMFh2RVVZZFQzVzZKOWFSZFpMUXJEVHBq?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gSx6qIXQNOA+yIk4oxeWKq6jKTWGO2BAelG6Ghvzmh8nPodMJIryIuaEV+573TdV9piOoZuE4jC9ckoBdhOuT/wF9H2y8l3gk2h9D6k18cx7k92Mjf9z7mWjsmYfetCIbvmSo4otUEgErEpjK0tUR7klbEXbJiyEPMiv2N3sOTYpakEqOi1vtzDJ8FhlQqavcLxehFTBJ6Tj9Z+szCZY6aexS3upfBgfOlQBdioMk3FwBq/nc1mGXl3MMGfkJ+DIh67wttbgAvenZQfoTKPrDfKYJRQsgvdfgCugXInr6KCXbXfuZzI2m3+obyQx5BfBJ4cgfOsUx7Ce78JbLS4mAkkpTGp5Vg64tiUCyrFK4q1xyIhGBjuiEJj/9LIGqjoFsVcDruD2ZiTL+NBCE5r/1+gbvn6XR09TF+De8azbKJ/9w+DgMk7OUeLvRBKUi8TsinsxwxK0pWsfiMUvSIfdNchxCmyi7Tg4X3GwBxSKe6LUlx6eNXK9MRdXKuU2k8bV9j7yWkYMGSS3eyO+IBht41uAYiLIqJYtRIRqAdoNRvFInz+ESZmARiOUlMcyM9du7z8NjtOaUXr57XQcdJ3nY8QqSwSJhGpIFm3sUDhmXN1MmSVQVkfZfPU+LcrVEoPu7LCr2bjmQ2JmCfPbsIHJQO6by7e8TuMTh/zUs4Nw4V9hDfD1eHHEkWWegrDFrOfcDDr6mRmzfHChZOjNnKA6yyeQ80oeY3csuSLDka2E/4AE1FHiDJSP3MuPiSUnctmHOiIo4cCitPZ3Wk8dfxjUGYLXxdDsLd4xkjpBB7O4B4UndSI1wAFVPxAkyOzn5wdJ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f82236e-b346-46ef-69ac-08db4c76b25a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:08:08.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VakSZSl3l3PoCeB5zJTT2r12xwxWDDtQddsZxZFb0rKByuDrtb76PDMtELmLd5IHZJzIMzQJUrJF+KBFI52KXa+PLx571xGGLsW2XwCXx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6805

On 04/05/2023 8:08 am, Jan Beulich wrote:
> On 03.05.2023 20:58, Andrew Cooper wrote:
>> Loading microcode can cause new features to appear.
> Or disappear (LWP)? While I don't think we want to panic() in this
> case (we do on the S3 resume path when recheck_cpu_features() fails
> on the BSP), it would seem to me that we want to go a step further
> than you do and at least warn when a feature went amiss. Or is that
> too much of a scope-creeping request right here?

You're correct that I ought to discuss the disappear case.  But like
livepatching, it's firmly in the realm of "the end user takes
responsibility for trying this in their test system before running it in
production".

For LWP specifically, we ought to explicitly permit its disappearance in
recheck_cpu_features(), because this specific example is known to exist,
and known safe as Xen never used or virtualised LWP functionality. 
Crashing on S3

>
>> @@ -677,6 +678,9 @@ static long cf_check microcode_update_helper(void *data)
>>          spin_lock(&microcode_mutex);
>>          microcode_update_cache(patch);
>>          spin_unlock(&microcode_mutex);
>> +
>> +        /* Refresh the raw CPU policy, in case the features have changed. */
>> +        calculate_raw_cpu_policy();
> I understand this is in line with what we do during boot, but there
> and here I wonder whether this wouldn't better deal with possible
> asymmetries (e.g. in case ucode loading failed on one of the CPUs),
> along the lines of what we do near the end of identify_cpu() for
> APs. (Unlike the question higher up, this is definitely only a
> remark here, not something I'd consider dealing with right in this
> change.)

Asymmetry is an increasingly theoretical problem.  Yeah, it exists in
principle, but Xen has no way of letting you explicitly get into that
situation.

This too falls firmly into the "end user takes responsibility for
testing it properly first" category.

We have explicit symmetric assumptions/requirements elsewhere (e.g. for
a single system, there's 1 correct ucode blob).

We can acknowledge that asymmetry exists, but there is basically nothing
Xen can do about it other than highlight that something is very wrong on
the system.  Odds are that a system which gets into such a state won't
survive much longer.

~Andrew

