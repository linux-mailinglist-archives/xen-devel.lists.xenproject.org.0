Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881B6D5E76
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517832.803713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjeMs-0000gf-Dp; Tue, 04 Apr 2023 10:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517832.803713; Tue, 04 Apr 2023 10:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjeMs-0000dX-AS; Tue, 04 Apr 2023 10:58:26 +0000
Received: by outflank-mailman (input) for mailman id 517832;
 Tue, 04 Apr 2023 10:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjeMq-0000dR-K6
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:58:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c79f845-d2d7-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 12:58:21 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 06:58:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5201.namprd03.prod.outlook.com (2603:10b6:a03:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:58:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:58:02 +0000
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
X-Inumbo-ID: 9c79f845-d2d7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680605901;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4mz0unXIACTtoxSLUL21K62e6alLo+uDYC9SUOBOSVI=;
  b=WCAxC+yuCPKtvtaXw+LgQ8tKUva5Hu1DgmGTk5LzNJ/H1AAPW0ES0KOP
   Ph83nMh6pqvyv/QeVt1H6xiFDHTnddmDWUwJkjiCVcefZRB8yHN/bBS0c
   reM3y1fMVa1D3OUGl+D6HIeSRFPdEL7YKUSgHPto5VVZJFWcyY0gZDQhY
   4=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 106678214
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D0pY9KBwgkrLAhVW/wXiw5YqxClBgxIJ4kV8jS/XYbTApDwl1DMGn
 2FMC2vUaKrea2P1ftp0Ooy1/BtU65LUnYJqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9P0nOEtHp
 PgjLC0hSiGuuMSOzq2jVbw57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXw32kCNhLSNVU8NZUx2Gj9kEsVCc0anGlhPiJkl/uasJ2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5b5dDm+dk3lkiWFo0lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9b1gbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:SrPFtqpjmyfz4juBdpEtU2saV5oaeYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnEAtjlfZq/z/5ICPgqXItKNTOO0AHEEGgh1/qB/9SKIVycygcy79
 YHT4FOTPH2EFhmnYLbzWCDYq8dKFHrytHMuQ4G9QYLcT1X
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="106678214"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CasEe4vu2Md6j80QG3j8w/nIChUVnmf6vVuLsqlAOcktGSfY1CD/4zk4eHTqL6Mp9Tx0AyKSDMt3m0gIuNiGYuwTMDgYw4KfC7l7dMTCuGM41HWt7BRB5xIQA/2+41IEqN1pxzAXAA6tE1fthjunE2jyyAUGmYUl0u4M9PBY440DYSx6jz22pk+yYHFa7dw7yctg8PRUcQSTS1pg+zod6FSgDBQMoiIRYzg7QSatNRDN+pUF8wZLW99DIv0JwBgdY+KW0+Cqs73oMq92n5vEqiEm2DVFcjnGSvkcSCxkV0LuFxNoZi2roW+SNEvN7Bn4p4dUekNHqK1lgjocsOwwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mz0unXIACTtoxSLUL21K62e6alLo+uDYC9SUOBOSVI=;
 b=FPe4ZsdLxNtXl1RM2Yivnwf0x1LIVmmCBEiausksS6aJTvIedegfIBuhql6qqSfpzv3PAH5rtxliaKVmjjnnM11DLJ6ERWIftWPNoGUJ/itL0HL1+clRymP9u1LTsANadtRdxtdrvzEJ5CxrPSFVUhH5qJXbOPQ1AfQZYz4WPgbUpgmGZUy1eX13nYr9RvF9BEj/blZRGXBUvQYe3omXLYJ1RGDjFdGSL3o+7dOsvlY/rrb0uvMkPQ3iYEyiMvfVbsBI0ArUZ4DuAhgW7EFcDd6kNYKlJEcSLBmnXPultw180JWyq6HW36+1xviWodLp4b5USkmY7n+M7AL3FgjEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mz0unXIACTtoxSLUL21K62e6alLo+uDYC9SUOBOSVI=;
 b=g/gLeAZISZkMpECLErU/rp6ertcTiki+RNslpVG0oAO/YH7n+1KITBOZPKyZMljQL2BrtXg2/4xsstJoI6/eemNru26C9M6DwIHgDMeExDiZVV9DTYzcRGCOekTYJsq77bbkx+4mBPAhxbxEblBEdqBWCjUatr0c91KzkUCtbsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3d5c84c4-d7f4-57ba-ef0e-b190ccadae14@citrix.com>
Date: Tue, 4 Apr 2023 11:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: correct AVX512VL+VPCLMUL test descriptions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <558b1cc5-e294-87b3-676b-68d7e55065f5@suse.com>
In-Reply-To: <558b1cc5-e294-87b3-676b-68d7e55065f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ddafc0-02ef-4a3f-7178-08db34fb75d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tz77qLQlSePRymeXuCOTy7zKlvONRckHqyqkz+OfPRsDzYLYxBT7xSqsnSrY0iVFHAntNQlPmHkAQGMTMO4TnTK0NHR1bUXUsqni1ait+G5zTP8iZ/wiK/XkWtWMCPg4srFURy7LNhcB2ArslaNWyTxdwSVAmiTzfY8F1dKQ7iOfu+r8nbGI3WcCBh3KkxiYhiZSu4/N88+LxjHey5uQBCiedf7mMzmYKHMS8BQ7zhoO1mz/dHxUVXbQLpkkhMc0Wio9Jfd/VgPYGZEk2jwLRAqQBez3mg47EEKcllcey9uUWRdzjxdKtHBt339MVOHavRSmw0BqdPIC2UvV5+0dioLzuZIUB64gKaZR0q61fF9P7FKCIU5ap3RpnHwsRCcz3ovApDz1tw0DJAaCZjzmn7i4AwQb6nu1/IZ3yT2scSqwDPLaHxClqHhAKyVaKW2TIZgzf9M0tek2MdvarU6yAenh4ijsgRxR8MaThhnWl/cmM5DCQj+1C3g2yMVhcaLWLQy3Rw1XXoCiIED2+6g6mQH7ejNFMnf6qhMZg+GOLrt6zOKkaL5E10CTJcxdCpppzBNRs3fQ+p2Z706T6PrbvxW3qhG/vi1ELVr7FECcF6kWW+M/QjDzChid0Ci+aUwhZ/lGob3hpZYbWEKg9A5ChA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(186003)(6666004)(26005)(107886003)(53546011)(6506007)(41300700001)(4326008)(82960400001)(2616005)(6512007)(316002)(478600001)(66476007)(66946007)(110136005)(54906003)(38100700002)(8676002)(6486002)(66556008)(36756003)(86362001)(31696002)(2906002)(4744005)(8936002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjE4aEdEN0RQWnJlSHp6aDlQSy9ucFdlcC9hbzVxQ2ZNQnNMNmt5RXJubXNi?=
 =?utf-8?B?RUpnVkducU13WTYwUnh6ZnhQc1V2WktaZjMvYmZNbzJhUFBYMWM1aGErOXB4?=
 =?utf-8?B?ZGNCRkFrUUg5bW1EWnFHeDZFMEVpQk9uTWpKUFM4VjJnRnl5akJPWUZSWjBN?=
 =?utf-8?B?QmNuK0NSUFk2TVF0cC90S3QwM3ZZdHFnWUlTb0Q2a0Vob29hRVI5cTdjOSs0?=
 =?utf-8?B?MURETWxpVXlUR1N0YW96Um5ka0pBTEsrZ1VydTM5d1V2RjQxQXJETGRrYTVn?=
 =?utf-8?B?SW96V1JHcVlRQXRVbDlOblpqUU95L3c5ZlFBZ1M5SUxpRjJ3dU9vTVVsUWFY?=
 =?utf-8?B?Y1l2Y2FnMmxLZEpJQS9rL3NJZWZFZEJPOG1LaGk4RWI2Umd5dEoveStxWUow?=
 =?utf-8?B?ZlNFR21GNmxqSnFFWUJVSWZSRDVHTXJjeHMvekZUZW5qd2NlSWhBaEtjb25I?=
 =?utf-8?B?eFdrd3JpUjlYSk9QcXE4TWswSkJLcm9yWGp4Y2VxN3UwUlgzYVpkRlVmaVE4?=
 =?utf-8?B?MjJFSXhxK0Yzc0ZiT0RHajltMDFTUmliWVIrTUh3WjlRcnpHWlBrOHV5dnJC?=
 =?utf-8?B?NHhtc3M4MHBsb2wvams5TG1WeU45eWYwaHF5WnFwWFRWYzA4ZGUzbEJvMWVj?=
 =?utf-8?B?bEFxYnRXTXZCT2NpZlZuazU4V212TXFvdmVjSWxROVVOZVJSZWlaSDNRL1lw?=
 =?utf-8?B?RzFJRjQxMlBZTVhxZXlORkFwNEpUNzh3bjBrK2dXdENYMU1mUHNKT0RWa2p3?=
 =?utf-8?B?M254bnUzWnU1UTFzWXJRN3FlaHRSVGx0OEpKbHROM3hyaGVxTVVZeFdKRzVh?=
 =?utf-8?B?RzlmS29ESUZDSGlrVFY2QlMyZXdaVnBnTktGdlp4R01JcmVOYjRNREZnMTJM?=
 =?utf-8?B?Vk9CYnV6RFdib08rRXc0NWRuVlZQa1JzWHdxNjZ6cWhBMS9Ha0xxZjBSbjly?=
 =?utf-8?B?bjRoRnpXTm5HeERBbjRyejYxOUxpekZHVnQ1ZElWck9mRXVsbVcyTEEvUnlq?=
 =?utf-8?B?WkdhTXA0SEpia0pVTTRHQkRuell5b0c4TWV1L2tWNDhqUU1aeFA4SWVBdVJ0?=
 =?utf-8?B?K2tDUjhkRENpWmU1dGVPOXpxRk40bWpNNjBrdGVPaVFPNXNLeTlzNDZRNUtQ?=
 =?utf-8?B?TVVTc0RMOWx6QnlqVmEyN2NvWWtCQ3dkL0N0N2thTDRXdFVIYVZkdmNpNzYw?=
 =?utf-8?B?L3pBOXRlZHBOZlRjcExqSjFKWnhxT3dpbUhtU1N4bGxMZi9FQ05KL0RQYk9O?=
 =?utf-8?B?SEhrcFVkTExOdU9zeWFhZEZRSXBCamhjWFlvWFB2N2k4SWlORUFIN3IwQ3pP?=
 =?utf-8?B?ay9EMzJrS1J4cUQ4ZjRYa0c0eDdoOVU0dnRKMFhjcFZGTnY3L3NCbGRXRFZh?=
 =?utf-8?B?dERGV2psbU5Va01IZ0d5OUpEMWdJbkFCNFBYWW4rUXdXLzdyY1pHRFFVTU9L?=
 =?utf-8?B?WlBUQ0lISkI5NWx6a2V0NGM0aDFWMk5ITlBTcWxkbnpRQ3ZtVGtVekdJNmhX?=
 =?utf-8?B?Z1lVQlBkVHFKZG5lTUk2dzdLK3Z2bzJ4a21PaXNtV3NKcG9JWGd6emtDVzRs?=
 =?utf-8?B?SFpyYjZZSUZmRUY2ZzVGSkp0OGFXaDcxMTlaU09Kbm1SSEkyNkNDOUlaMWRF?=
 =?utf-8?B?QzlCOFZFeFR5NFVQSTdDcVF0UnVqQTg2R2Y4bEtxbnFpUitVazZrTU5IQ2hx?=
 =?utf-8?B?aVNtLyszOW9ZbzFibTZFb1p0NE0xeWwwbWY3bStZdmcycGpvMVpNU3A1WTl3?=
 =?utf-8?B?WVFpV0pMSVhHMk5rRzdoODNXdXJKZlU5eW1MUmpWQVU4MmF3cG9LR0VuZGtI?=
 =?utf-8?B?Y1dRL3RnV29VMk1Wb3JXOTFYdkVmKytjMnhTTlJBZW9QVzk0QmZYR3RLK3hU?=
 =?utf-8?B?TC93YnpZTDlKNnFGL2kvSXFqcytETFVnam9IRk0wYTdaNFg1MW5rRys4cFA4?=
 =?utf-8?B?VWNwYTFEOW9taXliVTQ4QVQ3cEFJU0pza0szUHNScDdLdzR4Y0l0TGtMMDBs?=
 =?utf-8?B?cCswYXo3c2Fia1NrTG1lMFZMT01lWUdEcVpZNllnMXNFMEdmVnE3eHk1VG5n?=
 =?utf-8?B?NUswMmZSR1ZxR0lmK0loTnMrMytXdFpJeVV5V0ErWkpOS2hmZVZXS1NmN29u?=
 =?utf-8?B?eElpOWJrNWVzckVncnR2VTBKakZCR3pMVnBxTVE5aWt3ZDRGRS9mcDdocmov?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gUPU5qttekrMU/QjceW2KvO730NOTg5IQL0bQ0knQtQiF5rPNYL0+8e2JhwuIa51WEeYnKDyfEp0kRTgR5vRR+UU7vWxWE5d6y+CljRVPhgiL9ulKLSsoHTM06fpPOrxTLS49WlqA32quQb/ft73DGU1vnKA0alb17dba04aWdG6F8hyg7ooVdLLmxSOBCaozz6QEB8BkZCID6BQnY2S+9gxSUPexuvXw+xaqrg9eMiZid4BYxksnjWhpOCNCI8xKFnI4i8cnvj6sp3wscE+fMv+2gh4vSBJftdJszhyIyZ91mKO0zz7YydzLDfWF35eKWj5TezAomowkaP7bHDJJ6h8g5DfiKVSKSZfZAOroO5vEmgFVzO7c05FBQNHaPr0C070Z5WsfUz/0AAZhJ3+5GeZ22gC1BwrPWaLg3uaAQYGs6sINUaCuhVvex3m+h6OgGAIZgpCyRrxx5YpJKd5tHF6dd+4mAj1pHTMoJxKuuhdAznRnrKmFHxQaJDbzePoXtD8tYw+5BdRN0pqrA41HEEncAdD8tG+QrPdA9W2sQsbAI5Zx/3rIEyHoiBbRIaxaVedeu7vNlCEWwiQLMx90u3R3qTkMRMPBSCp+rLUnwuf5621uQfyGdX9zvPW8pcnU+/JU+W7KH76l0dR5QpEltQasKZbm8ErKC5BTcaYwzSQSo1sn3rA7ttKvYZRGNdBRCA0Lz6TPx1N3xrRRwdWGpd75fC7GaXcsYK5agDMzyBg/yA8TWT1Z4zVqKKZ2LFcvHYY3SttoPNxKkjpnYn458pD0W4SHiE0/1e+SEOplLZGhG2ptE7zLOLbGsNe9XDF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ddafc0-02ef-4a3f-7178-08db34fb75d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:58:02.5100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkX+JXjAxbyiEfKPxqo3kqf4axYI8eoRr8/CGBdQSmIVluUCwxwfRlP5Vb6XG6lM/WE7KzlKq6HuXKUJmohMz4JC4VBZoEG6E9NvqJy5VPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5201

On 04/04/2023 11:48 am, Jan Beulich wrote:
> The stride values (based on 32-bit element size) were wrong for these
> two test, yielding misleading output (especially when comparing with the
> test variants also involving AVX512-VBMI2).
>
> Also insert a missing blank on a nearby, related line.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

