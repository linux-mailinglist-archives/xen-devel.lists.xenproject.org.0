Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8F74AEE9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560396.876301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHizn-00075k-DS; Fri, 07 Jul 2023 10:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560396.876301; Fri, 07 Jul 2023 10:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHizn-00073R-9f; Fri, 07 Jul 2023 10:47:27 +0000
Received: by outflank-mailman (input) for mailman id 560396;
 Fri, 07 Jul 2023 10:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHizm-00073L-5U
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:47:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b7bd35-1cb3-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:47:21 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 06:47:14 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY5PR03MB5080.namprd03.prod.outlook.com (2603:10b6:a03:1ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 10:47:13 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:47:12 +0000
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
X-Inumbo-ID: a5b7bd35-1cb3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688726841;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lgxhdogFgqufatXKVa1fXQGBLHfCZHklwMj7RCc+dRg=;
  b=hsVTGz1T+JjBbCcqwuREDvZeFpkgANthOvqPTROIqth+ZVjgcniVtadP
   DHczGxND4nfgzP31AuyE0dwkApbCk9OjSAfTNFZvsI2HncQViHM0vTb0a
   1HmCdUdhQ/B8p/XS85t+xJnAv6s8am636EFkAVJzAEEFbxzDiSwUTYTML
   Y=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 114770152
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zQ/26q9dohbTtHo0xR/8DrUDMH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2cdXm3Ua/uPZGCkLowlbN618h9XvZPQyYdjHgtlrSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqgU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklpx
 No2EAtKVimiuMPtnrTkRcZ1gfgseZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUuidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwXykANtPTtVU8NZHvwzNmEdDASQmdhzmk9r6lxHhdstmf
 hl8Fi0G6PJaGFaQZtvgWxy1plaUsxhaXMBfe8Uh9AySw7DIpQaYAmQJRCRIbtAOvco6Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxAA0iq8Pl8cN2+O+9ErenjO3jpHTS0g+4QC/dlyi6gR1dYu0fbuC4FLQ7etDBIuBR1zHt
 38B8+CZ6O0NFpiLmDa6XPQWHLqp6vCGNxXRmVdqWZIm8lyF8mS/cIVn5SBxLUZkLO4JYTbsJ
 kTUvGtsCIR7OXKraep7Zty3AsFzlKz4T426D7bTc8ZEZYV3eEmf5iZyaEWM3mfr1k8xjaU4P
 pTdesGpZZoHNZlaIPONb791+dcWKuoWnAs/mbiTI8yb7Iej
IronPort-HdrOrdr: A9a23:N/sUnKEVvXZbM4dRpLqE5seALOsnbusQ8zAXPiFKOHlomq7xra
 qTdZEguCMc5wx8ZJhNo7+90cq7MBHhHPxOgbX57Y3SOzUO0VHAROpfBO3ZrQEIcBeOldK1u5
 0AT0EEMqyVMWRH
X-Talos-CUID: 9a23:/e2/qm/UD5nkN1rAnm+Vv2klPO4dSTrl9VbvAhTmDzlmZ6SSdVDFrQ==
X-Talos-MUID: 9a23:PghtHgidYWKQJ94hVm0bmcMpGfg5vfqFWEk0obZB5vundjEvZBqEtWHi
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="114770152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsp540F7bPzO1mq+4jcPkbjodLsgbBmOx7jsdhy7Jxi8oaYQJCB5xN+1xcV0IGZCgpTntVTgf0locAxmcRb1vr9ri6JR9g6SNYOr4uqrqWsXPv15nNIWWVJ23L21KVfRfLZsGwKhaUq7gzvQeQlP/Ehbhhk0bgZ0Os1J+LtUt8fRzGX+v8j4s296giWmv6t6iH0rz1cBRhxlEx61mUkcMMESPujYxxe+Wq20ug2mAy9dfLs+ULXD+aZytnA/SVKZcOFpRP+abwYClxSkp4kDs6uHETX14oImw5P2laTpv3Z0221hiIA6JiAwRBBX8yfhql7HWAi3Eum5QeOtSVBUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS4YKMMBa4P7oygcmdaFuVE2nUEbBul3XPI341IHlmg=;
 b=PPGF9bh/3B7VcJNXRvFEjYgBmZuyI0z1hXVxbM9f9WwWxFGukS0PX56PZbpA4s/MAGZSV/r+N4pLKzzylnghSnRRCJmYscbZ16YS54fi8rPt1hREL2AsCdkUQ92XpaZLxw1ZGayGS9tsg9KJrgbyk1crq1kNa1p3dlZjHHWJhfJnOIC6wBal+SiHiJvKlbj8Sd/8QrDQGsTptTP4OFiClasc9QtAzHzavaiuusskL0WNxYKz0T0AbMbSDYtz11i/h+tpez4ZNX7ho10su7q9b6nAKN4XcEdTZHU1vXPsNlweYRiTUrT2dcVX7ic75+2RRBZ8x3WjjATuPtYQ2w71Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS4YKMMBa4P7oygcmdaFuVE2nUEbBul3XPI341IHlmg=;
 b=X9z3nNqcwxFpqu3BQhcs7D/V9jJEuiPK1M3ly9cri87d4ZQ+d4xwckz8qMp2Fwklebu8bYacmCk1vU+FQIwbJsjv6c/yk7lk058iZbBn3KDESLFW5xsWvWMBdRwlspxim+YNjxWQpgqPbJhLkGvmMDepzvCjJKEkRRTckf6JO4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 12:47:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZKftKtkjgFLWaW_x@MacBook-Air-de-Roger.local>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
 <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
 <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY5PR03MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 89afdb08-5152-4f08-80ce-08db7ed78554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpYk8BbrF79AR9PPG8mqBCVSQt0u6uwgzAjVSD4oaz2DaUQQs016TQmcoWUaj14fn5KLaMJx9VxMsR2abRyefBbD/4chjyUYpUR1ZyDvLSXeXgZzlPF3WwlBL2yrgZfKY/PhBIvkkBOPU2I4RHCYmE1lfF/j1dg90pxdqL+3q1d9G1cBuhkgaKjZbzuKHczEzaXZuVhosiv24cyQ4noKXfDwn8wrF7b0FVenrn7zPEQrpGChH8lcNHvZN1dOcDS0rYdHiNAHU3Nrvb6z3/s5IfVCB9Y9ArI98aX8VKL0qcBFxGBC9VY83R+avwXJidiy6ZY/ZKs1/znBbAu3lCdC+1jOIaOqywgQB9998d7qLWtJCOMy5uIVQz1LWTwxbblGXHL0XGjhcRhP2C7/+3PjGGi/9QO6rkmEA8BE+mC10Rnmf+uG3oPHtbE+Ecm0HYk/ldFv9adYKy2v/dqpv1HSi2K39HS2bYX1/BLcHsLLTHEy/jiUcXqdLZRA42x0LRRMIBAZQDB6OwudddMa5INFNtUhKhTODSgpI5XbG6TqulnX1moYmTO1eS2Z/zWVMHM6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(66946007)(66556008)(6916009)(66476007)(4326008)(38100700002)(186003)(86362001)(26005)(6506007)(53546011)(6666004)(82960400001)(83380400001)(9686003)(85182001)(478600001)(6512007)(6486002)(54906003)(41300700001)(5660300002)(8936002)(8676002)(66899021)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdPSldSbUNpM01OYmFHbDNTZDQ2eE13RTdPRFZaS0liamxibk5xM2pnMTVX?=
 =?utf-8?B?Y0g3K1dxamxDTjloNXBPRjhSbG5hVFZXNGNGNDdNdzMzUWFjQlJLUzUvMU92?=
 =?utf-8?B?QVpRalFwT2lDTWdOSWtxbklaN0lhSUdVajFRM1RXWURkcmc4cFBFS0xMeFV3?=
 =?utf-8?B?KzhHam1tc0Zva1kreWpTREpWMS9xanl1NHRkK1piaVhhTTF6UmViOXFNR21t?=
 =?utf-8?B?MXNoRlo0eDlLSUVNZFRVcEo3WExQNDgrcFc5bXJQZ0hsSFhmTGFRakl0dGVh?=
 =?utf-8?B?RTVnU1c2a1RXWDZSOXdDR1hFMDVTU29zTzZOR2hMdlQwK2VIbkxuK082eHFz?=
 =?utf-8?B?R0k4U1FQZ1BwVzgzVjYwUXhQSVBnRHBrdG1UWUR4cUNvSG50dEMvRWI1TTl6?=
 =?utf-8?B?ZmdVUTJPS1FGUE5YV3RZdzBOQ2Rjbk9tVURvY0syazFxNGZ1Q29QbkdPR29Y?=
 =?utf-8?B?Y1pMMnpsaXh2TE03NnFBY1AzNExMTUJmNHBIbnVYeTdpcEtSR25qNStSOE1J?=
 =?utf-8?B?MVlXYXlkaUtGWE9URHVGVkZjdXd6WWg5Q1IwVFh4WXF5R0ZsYlBTOFZuWUVj?=
 =?utf-8?B?eHNzVVBMUHR0TkFwRndWMzZWVEN5TEpQblpmN0o3Q0NseEVUV05xRHJub3RM?=
 =?utf-8?B?RjhMUHVZalBDdU5wYkV0eE5OYy94SWdDMCtrU3hIYWlVanRCWXpnVEtsYTZo?=
 =?utf-8?B?ZUJHTXFiL1hQWnJSWkFlYldQRlZtcnpsNDAvT2llN1JpQ0lSSFZwWXpXOTJ1?=
 =?utf-8?B?ZStnYVZPQ0c2RnNyR0ZIcSt3OUN5Q3l3RERXU21GcDN4MkowOXlLUGlGeEVM?=
 =?utf-8?B?WmNGeHhnbWYwbThGS0pYVzJ2cUpmUUZhR0d1SGlFeFl1dDEreWs5MGJKRTQy?=
 =?utf-8?B?Uzg2L2xZcDNQVGx5RWFSNWtBYWkwNlZNM3BiZm56elJ5bkMyOENTTGQ3T3lq?=
 =?utf-8?B?U2lBN084T2pUdDNVQ0s5TEpyVnJhRStpanN5cUh6T3FNVCtyQks4N1RYamkr?=
 =?utf-8?B?UEhUSk5BM3AvY0l3SUpKalF5Rk51Q0JWV2RZUWREUjdjeG9zTlpHT2JtUjBL?=
 =?utf-8?B?T1F5VC83Ni9jWVpDYTJLRWdEK3ZkRE9neWU3T2xIOXhYcUpwRmowRC9ZY3lQ?=
 =?utf-8?B?VmlFWTlOL0xyMUdXVDlLZVpUUXBGZE9xSE82N1hIZGdJM2FhWjlNWlZ2N3Ey?=
 =?utf-8?B?cFoyeExmZkdyYmhFR3MvWE4zdGhScWRtU3E0WkZ4L25tQTdibWdhZUQzN0Nh?=
 =?utf-8?B?a1g5NFR6disrRkRYeEJlOFJCTkZCbFova1pmcyt2WnlHa2xhYy85dmdydThV?=
 =?utf-8?B?NFhtdWRjMERwYVBtU05RR0FZc3NlVFdCL3YvaWF5alhDWFR5WFNlcXFxUjVU?=
 =?utf-8?B?Rmx4TDJkSVFnTXdZWmd1cm05Nm5wNnczMmFMeTh5YVQrU21OS0VYVFlkaWJo?=
 =?utf-8?B?NzMzM0hXcXJNMWRpY21WcUFTK0NvbzFQbG5tRTdGTDJESTdNWUFOUXNXQ1ZO?=
 =?utf-8?B?dHFwa1M2ZEhBV24xRzNyTTBUNUMzMkJGcFlFMEIycEFhOXBReXVxUVFWV3Iv?=
 =?utf-8?B?YWRKbUR1elpNOFZVZFZlMWd1TzBHUWpEWmhWUTh5aFVMeTg4UHNCOVlEeGRu?=
 =?utf-8?B?YUlrMjRyOWJQZTZUZzY0V01PZU1zbzNEcG1FMUd5akF2anBSWlpucm1RdDVp?=
 =?utf-8?B?WEV1SnJoNW9WS2pXSWxzYWEydnRJUHYwNk96MjlrWTZYcnduYmkzbTRqR0Uz?=
 =?utf-8?B?SysrZ3hjYU55b3g4TlR1MFVLVGw4aUF4QUNHVElHaDRXb1VTQUVuM0cySGJP?=
 =?utf-8?B?SU1MRUtBbnBjYTZYU0tGTzZidDM1QmRvRjR1RExBVXEwSmcxZWg0RkRqNVBR?=
 =?utf-8?B?STBRdnhCZXdSNGdUZGJBaDBHV2ZDY2hKaFNvblZ6bjBzVmxuRitycGxEMG5l?=
 =?utf-8?B?R3hST0RhR2c3L3FmVkl5eWkvcGRkZjR3S21OMTNlcmY0ZnZDUVhpQXl2c2k5?=
 =?utf-8?B?Mm9qMytIR3ZEREFxUXczYVFGRHEzbWRIR2hMZUlzRVVKYVVYQ0RzTUp1dTE3?=
 =?utf-8?B?Wml0VlVleE83UXBBL3RJNEhBbjkyL1RNcFlLVGhjUmtvREx0RE4rVGhpV0ln?=
 =?utf-8?B?b3ZUTGNUWHdVOHZseTg2MDZpbU00NXhXdGxWZDhheEZMaHFpeHEvYWZjanRU?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eN9njlcLYnsXJsgK8ZXnMYBaYNTzrtXEoE6Ryv6QueNnaUwxA6u4/ooZVDWDijnqv8kUIR7gjc9g7pMxEa8HdpexLo9VR5/CGf3HTy4DwWbpz+fz2bDyH5R9DPHML2DSY0ftMO8l+zIAtLBmsV7hYbC7jJxMp4LeCFeqDjfmEUr4PK9VFD/R1v2L4godCNzgXSK9rdYFyHoLFwdw1SLHK+xIzpHpKt3viVQOiudYJIpXN8XJ/eMR3UUlGw1V793k1MLPqJF47BBCQ8Heghdbp7v7QEmvAMuEGj6C6ikA7AK7BqhN0AzEK6vuE1l4QpEa9L+KEiQ7hKVhXfRmOO7Yg4Cui3LM600IfJaK8sRFoZ7bREeey0wMsvLNJRRfSe4OGGORv66spvWl4Tt5Q5LQCs5ovtrITo/Q1VlFXj4ZfbkHb5ftLA7eIHQy96GKOHm59J90/P5KVp9k9kvCzzeB2LFhlHFWogavazMKd0yAn30uz8XyFi8xD9tgBYtUp+k8oQ9XwXNxXwKCxl3zR6ag8+TE7SJEfGjKI2ssUDAC+PPcte4Ub1RVNiDeg0BCyoOMWsT4erlRYNDRNavu9F9RjWprv3wHfgNtGSRdMQ8ernH8PpthyHFLwkCE8vicRRk9hW6o1TpnkyOCLgVkK6JJp1A+GQgQhH95h7lrAVQgce1JHsDGbiwIaVfWhvH/iZR+sYukRCwwA3QBij5srcxJMZ13BQ107g083txeIpalmvZ3J+TIN9z5ZQ+gYpBXRJOQTdUElcmUFgjJ/pLhvthRoRViFt1P7asa+I/2TzJywp3FGZ0UHSe7Wbx7yFeXUM6bItEBspu26io+QfslzU0dl8JME4Fk8xnj8Lba3l+C3T/PjyNVFyaUFgwvyOgTfQ9heTDzw4O4ID211T7cwotsgQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89afdb08-5152-4f08-80ce-08db7ed78554
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:47:12.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdX4FS+48PNcba82vUFLiULISibZJVXk3Khz60jS3alOuf2crfOw1q5lgnIBt4h22/eQWvbNWnNOpCzbuT1/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5080

On Fri, Jul 07, 2023 at 11:33:14AM +0100, Julien Grall wrote:
> Hi,
> 
> On 07/07/2023 11:06, Roger Pau Monné wrote:
> > On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
> > > On 07/07/2023 02:47, Stewart Hildebrand wrote:
> > > > Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> > > > code base. It will be used by the vPCI series [1]. This patch is intended to be
> > > > merged as part of the vPCI series.
> > > > 
> > > > v1->v2:
> > > > * new patch
> > > > ---
> > > >    xen/arch/arm/Kconfig              | 1 +
> > > >    xen/arch/arm/include/asm/domain.h | 2 +-
> > > >    2 files changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > index 4e0cc421ad48..75dfa2f5a82d 100644
> > > > --- a/xen/arch/arm/Kconfig
> > > > +++ b/xen/arch/arm/Kconfig
> > > > @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
> > > >    	depends on ARM_64
> > > >    	select HAS_PCI
> > > >    	select HAS_VPCI
> > > > +	select HAS_VPCI_GUEST_SUPPORT
> > > >    	default n
> > > >    	help
> > > >    	  This option enables PCI device passthrough
> > > > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > > > index 1a13965a26b8..6e016b00bae1 100644
> > > > --- a/xen/arch/arm/include/asm/domain.h
> > > > +++ b/xen/arch/arm/include/asm/domain.h
> > > > @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
> > > >    #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> > > > -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> > > > +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> > > 
> > > As I mentioned in the previous patch, wouldn't this enable vPCI
> > > unconditionally for all the domain? Shouldn't this be instead an optional
> > > feature which would be selected by the toolstack?
> > 
> > I do think so, at least on x86 we signal whether vPCI should be
> > enabled for a domain using xen_arch_domainconfig at domain creation.
> > 
> > Ideally we would like to do this on a per-device basis for domUs, so
> > we should consider adding a new flag to xen_domctl_assign_device in
> > order to signal whether the assigned device should use vPCI.
> 
> I am a bit confused with this paragraph. If the device is not using vPCI,
> how will it be exposed to the domain? Are you planning to support both vPCI
> and PV PCI passthrough for a same domain?

You could have an external device model handling it using the ioreq
interface, like we currently do passthrough for HVM guests.

Thanks, Roger.

