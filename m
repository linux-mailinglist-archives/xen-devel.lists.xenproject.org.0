Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D17B563B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611673.951225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKp1-0002eW-1F; Mon, 02 Oct 2023 15:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611673.951225; Mon, 02 Oct 2023 15:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKp0-0002dQ-UQ; Mon, 02 Oct 2023 15:26:58 +0000
Received: by outflank-mailman (input) for mailman id 611673;
 Mon, 02 Oct 2023 15:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKbH-0001wY-Pj
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 235d5713-6136-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 17:12:45 +0200 (CEST)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:40 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by PH0PR03MB6680.namprd03.prod.outlook.com (2603:10b6:510:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 2 Oct
 2023 15:12:37 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:37 +0000
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
X-Inumbo-ID: 235d5713-6136-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ISEr4708eEwbI3KjLaRXRXqE7bGvsZ1eF/8NLrTQb+w=;
  b=huMNTENRjU57cQQW1AMrils2MTHUbL3gWoRqQbP+US/WARSMXJr0iPZ+
   VgHCRuDMCljiTLzo29Z7AXaovmGAaGSlbxNmJLz8cRcmxH78JpMx1CfgK
   3RH6n2q8sI/sJ4haJcm8EfTeIrNbS7lc/JIVS8AcWzoVjqKLwxTg1MydC
   Y=;
X-CSE-ConnectionGUID: EThC2Pw1SM+Pq+xJ5JBmVQ==
X-CSE-MsgGUID: bcCHyozXS4KaOg4WvcpTGQ==
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 123016651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XVvm86JGMkjTNITLFE+RCpQlxSXFcZb7ZxGr2PjKsXjdYENS0mcCn
 zRMWj+GaamJazD8eIx3boyy9ksFvpPTx9ExSgVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5aPWFlr
 8QHcQsoLSiaxPKUnZCRT9dV05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj33raRw36iMG4UPLez3d57h0+j/TAwAToZCWSlquGFpXfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAEQzhbeZo5vck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcdYQcUQA1D5MPsyKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfD0ohUd4wzWWiev6Fp/bYv9PYiwswCHsLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:Bhuvq6NHWMNAzcBcTsWjsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ+VBbAnwYz+wyDxXw3Sn9Qtsp
 uIqpIOauEY22IK6PrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3A8hRE6GnzKgGtZc9ay+adNyhAc1LXOVDhzFyKG1D?=
 =?us-ascii?q?hMkMqcKTWWX3N2olhrfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AK4lArQw3M77h7+Xaes4WGthnBwCaqK6lI2Acloc?=
 =?us-ascii?q?2gJWnPAt/ZwiDhyyLbbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123016651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6kI5LCSU2srIB1HfXrjCwMEFt0JS9nLmfA1cIRT+6xhDABP383HQxmxSxIBdhaM6DmqSNOTom9+bxwxgB3K1awH46/52wU3fkzJWTxKsbAnmK8HQ9QeuPYDj3YZCa4eGNrvw0CdMSGIq4KXKypRDLkFNbfCv7IvL6fc8qOBUBhJB8bcoigiB3ZqyCEx0Ha7rA304Cp3potgLgh2SDOH8314FY+uE6/phbMwfqXHpN1pz6ny3qJtc+qIYzcI1ya7tTv2Xav0aQAAi52TKkhn7da5MiFTQ59ZkhGAvKEYz5I/C8iL/zJ3evPiEn/uZumyUmAVF0nWjQSKNFxoTWNhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m2lah6wFlfwWH+A26m4qMx9JvqC1q31TDTiVbHZVwE=;
 b=JhK6fpJM+kTBKRt29lBa9ROx2IP1RZ7LSji2ioJPzDfmlAZ2ENl6FUHLEezNwJZjvq9LeBf+4w15i79gQJAV8qbur8SEKFMoGW179RtxnZJYGVdOVSUiThyCoKXygRaX8kMDn5w5nDC0MdyRmNGe+r//qQQBQ8BIbwZidYq6WvD5zFJaDrE2ARcBlXqxb8Sr2o1LfmHe6n12ey0bTyRgFelAlWdWvPp2aabeMC1IPKf7m0/NfN5C4lLANqtWcSbF3qgqeOT9L9uvYFH0xsOkyC/VcT0tIgycplRUIwvobrIxjpSw+qnL2+qN6KjDed1QLVMxpk6Eoog7EBjvh8FUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m2lah6wFlfwWH+A26m4qMx9JvqC1q31TDTiVbHZVwE=;
 b=sIWT0N62ft08A98pBrp+A/jb5otBpQgG4f1t/qdf+lcXKG4X82VmOGlildttBJPiId5ribSoCiFyssKMBcmbA/4ncLKVFxCRfiCux13XmdznJfrJT9mkNuQAKX3CQvNs2XjN6K26f9oQgj+WbbqSMTdUJfyzvh8C4RhWCP0WWX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 09/10] x86: introduce GADDR based secondary time area registration alternative
Date: Mon,  2 Oct 2023 17:11:26 +0200
Message-ID: <20231002151127.71020-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0612.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::6) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|PH0PR03MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 64533fec-d3b2-4872-8c6a-08dbc35a0307
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/nFX61vIBpa8OF5B51IvTc6x5Q0bxZiK66nBTbZZCU5BWhcbk/pRi+X1n4LhlWK5AorC1MNjpWVHivSqKeDbMFk0iFXOlqzyNZfC5R3LKO0AQ3r6SSsSqVRHROd+8uOexGOVvKgMBmTPXoUh4mzWAAkcMHyRaO7Ui6STVH3zXK5rAL3PQNQjEz1aJZ4utH4dACFppcdYuySD/5aNBUUE/tJjlfioyfAwZyW/xbshGrh0VTRMqblxzkpLPnif9JdTfdoxg+ksIglEv9YKpDgJBImP7nNtDiVpdHykNWH8Y6hJ6cWYY5C+K2jwD5Q4l89ZJIAr1ApqlH6Aw80z/jzObP8dmGIul8IDBfGQd5sOWal1vmaoKvVyvD2T1e9gIe2k+wAG9tc2ckGFvY9AZ0uPgd6KZUDlTSIvXJVJ4ei6W0vCDhFHdM2VlqeqLjqoK5aJQTmgwYS1e1Q11MdyxguHBhX0V6wXYLPPwDXSJgr2LjXWBS9aY7UaL40wtjgicoGoyS8c3GfVBEkh2b6KdhOkDyp7t03/qv1p9A2cbTyXA/DtOJZ1sKGhFciCd9/19dtt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(2906002)(26005)(478600001)(4326008)(8676002)(8936002)(6666004)(6486002)(6512007)(6506007)(83380400001)(2616005)(1076003)(41300700001)(316002)(54906003)(66556008)(66476007)(66946007)(5660300002)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2NkNHpqMjRMK1RZRnlhQ2t4aHdEbFVFcVEwKzlkRmY0ckNJNmNuVXZtdVh6?=
 =?utf-8?B?OGNLaU9wMXcyWEdia2k4QUFpZ0NEQXJ6dVFnOGJFZ3R0MHVUY0QwUWxmbkJE?=
 =?utf-8?B?d0diaEhHbjcvS0E2WlJMWEpNQ3JzU09UeStGZVNOU01GdHBDM05Xd2c0UEZt?=
 =?utf-8?B?Sm84R3kyV3N4V2NnVFk4UmltaUJTK2ExYm9INTFFTlJLaXlNMWg5WG5HNWx0?=
 =?utf-8?B?Sjh1VFhteEk2TEJ1NWhXbjVES0p2QmhVY1Y5UDhXU2lmK01YVFZDRnBPcDg3?=
 =?utf-8?B?bnE1UjRLcUtndDdPL0xTU2lrb3RVaFdyY05HcDhCN2t1NCs4WnBBNVNOS04z?=
 =?utf-8?B?aUhHSWFBcUJQRERRbnVDKzFkN011YnRlSFppSVVGbTVZNGJhbVdsY0VJdHJk?=
 =?utf-8?B?a2YzVjBZR0haOSt3QVpSaXFmS1NhbTFsSlBsY2w0L2RUM3crYmpNekZlVlBC?=
 =?utf-8?B?T3p1Y01ERlMralN5RUFaODZoZldCeldzOWNkSFArU25nTDlITlptd3VzZkQv?=
 =?utf-8?B?YUV6Qy9kVkltdzJWOW1kUGJuYzN2bFdZK2EzakZ5NnIzU1BPOEJxajVSQlg3?=
 =?utf-8?B?QzF6ZzVvOHEwc28zeXhxdU4vUEgwWHVnV0ZwT1hkZWt4OFNqM05ZQkI0R25U?=
 =?utf-8?B?VzRkcDlTdkxKUzVlM3V5OUpyR3JrYXBRMFBBNS9Id0FLWUszNHQyVktKVFNp?=
 =?utf-8?B?VlZRcWZEZkNYNFpUYXVwMW13YUgzUmJGTHRXR3l2WnNzUnF3aGNkTktoYzNU?=
 =?utf-8?B?WUdMSmlhNkFFb3lDaXNxVHpnSUpWdUVvRU9acmpWeTZCejFnL1oySGlvbVo3?=
 =?utf-8?B?Z0JuRnlTSjFmc1haV2tMSmFUQlpLMDVobmtHSExDQ1d3QWhkRStManZGTzU0?=
 =?utf-8?B?Y0xYRmFsZHRjMnlmdjd2STNXNVZmTkQ0TWZqbU5ldGtrL3JKOFpPa2poVll6?=
 =?utf-8?B?VkRaMjRXdng4cFY5NHNCVHFEdG5TZ3oxSnhaQ3dvd2ZpQXVyTG5FZ3FsRDlk?=
 =?utf-8?B?YXdlTmIvaExvWEtPbzRienVHMDZub25WaHozQW9qdkpjaEVISncwNnU0SmNv?=
 =?utf-8?B?L3FUaFhic3JCaFZORmE1UWpuT3dMWDdMUXh4RysyM0NCVVo4QThFSmkza3hB?=
 =?utf-8?B?amovallFZzZyRnBaZCs4L1U4SDZzQ29TMWd5YVEyWkhsVEZhYkVjWmRyTmFJ?=
 =?utf-8?B?K1ZCUy9VVCtFN3hwb1BlZW1SK3pDV3EzVENsVHZvU2NkSEJlYjlrVEx3S3dU?=
 =?utf-8?B?R01jU1c0UXl5MVRMeldETWI3SHN3c0orRStXdDY1MXFpeDA5VVJDWEh1OUJi?=
 =?utf-8?B?NXJyd1JDR1QwU01MOWNZT255YjE4LzNBdTlQUDg3S0RuYms0VUQzQmVLV0dv?=
 =?utf-8?B?d3Jqc3dJR2ZoV011T2lDKy95L0h2NmM1OFV0c1hZbVVDVDE2SlBnOXo5eHdG?=
 =?utf-8?B?b0JXUTYrdjQ2ZG15dHArUUxvN1JMZmkyTm9lczhDTlV1ZGlmd3BvWTFIbXNJ?=
 =?utf-8?B?SkRLTG13cW9DQW9KWGhVWld1NUg5cWxDZmJYNDN2ZXhZRmF5UGxoa2xMbHU1?=
 =?utf-8?B?cnp2UkoveGlCZTFTSTU5dG4rVDlBelNDMnY3RElQbm53QllCcitHMFJnaHdR?=
 =?utf-8?B?RERmM0x0bXB0NHlvMFpmbmxIeEMvYm82emVpZ2tCQ1U0U0E3b0tMRE8wQUd0?=
 =?utf-8?B?RWYyTS9pbmxCSnZQanRSeTJHY0lPdENKdTdlQUFIaGRIVTNYV0Q4YitxbHNT?=
 =?utf-8?B?a21ma0dnNXc2YVV0L09VNG1sQ0xwb3RFdzV5MUxyUDVXdEdwZWx0ZmVpUG1w?=
 =?utf-8?B?SHo3U2liQ0hpZ1BwSVRlVVlJWExWT0ZtVTJjVkNQaUgxL0o3NGZ1b3ZlVW9l?=
 =?utf-8?B?TGY3RWdYK1lYS2hhdTRLbFI4d0N2aXlsSGVHZmUxaFZhdEtSbitMLzM0ZFNk?=
 =?utf-8?B?SjVaQm50dzhhS3ljbElMTkQ0Um9XZ1BpTlJRbjE4azlTcW43dnpld0FEemJ5?=
 =?utf-8?B?d0VJY1g2UWh6ckkvc3VwTmtJTXJ6KytQUTVXZ0RESEM0aEF0YVBFTnZ0ZzFD?=
 =?utf-8?B?MFFQNlo0OTF1dTlPdzFiMC9nNEdVWFQrSlVUbGIvZ3FTQzM5ZmozM2ZSdzhB?=
 =?utf-8?B?UkhmYUkxeG5QMWhoRmNaWW5kMFE4cy84d1hoeG15UEUxWDdhZmRHZlBlaFE3?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y9nBoyHWajCiTn9EZ3PIX/lCb2YF/XDZXan2x4PdTMIMDfR06hOKYt3u6xaYdmeUTUjxAUKXPzRa98FYjg+QjiVyJVjL/gSzTFY8N0XV0ADJXJa6r/ZnNOaemwC8d1rZ8j/yY2lSwPpL58RewNWl5/t/nfBUXCx5TtRM150WlL6V3EHOTASbsb183Acffaq+aRJnJzj5XJC3CVUsHd1GoVtRlmHcBZookppVCgq6mAoizsHX7eGOOFfB+sPY3g7zCBPIpuoH0qdVEilE8orbifRmddMKDGbAbxNYvz6Sx3WLOTkYCVLGuTvMhdOS3F4+z1AMZ1hpn5HDCGCgl5Ql0bqIkKtAvNVzU7eQQI2LuXmg1DNiVwbxNbMn0ynqfYtHeTXHdfG1s2pFuFqJA6Rh8hllcad81e2rH7VrH2ND+PVq6fxFt67CugfWWC6bQ8UfMSmAqPnA8d8FquEbbGpphTWcbJYb/YrYAoHBkveTFtKdcccuhrFPhb9sa1/NFZz/bOQ9Ka2z4syvUNKjV2n7xl9pEj1Muns2RWMlzvS41RYcZ6JSb9BnsAJbHufY2WTsDdXmkhdLRveXnCR13x6I1HCzpIv/iiuUuzQpfUSAeZ6hXanV9KyoYDnMu09KkhOqc1wRkXBey1eOk6JPUkXIPB36wv91Cv10j9hoI+rN3kT5fsgHjyxENhLpz6l7lwthmSaIfBSOT5d73HuX67k14kOkR/PkL1QTVI6ya1WB7xrltWqeMDxFMTvwR8M3VhZ1jNBnQ3P+/cvKeBf6pGnIxXiUaX8CwX9nmw9YDXEU3GwpjJwUokOaMqJDUwwaIyrzmqb+1FR/sUMS6wlpEpwH+aREPOFcej4BtAAoagcbdhIazIcrb9rYS+QD1buBxs87
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64533fec-d3b2-4872-8c6a-08dbc35a0307
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:37.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9tow9Svx7jXfQE2ndqbaUEWA1ca68dugLABnDYk91/hrfHf7oGIkvxnlGjfNo5XZzjTDHzL40mtsl6Fa+/V9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6680

From: Jan Beulich <jbeulich@suse.com>

The registration by virtual/linear address has downsides: The access is
expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
is inaccessible (and hence cannot be updated by Xen) when in guest-user
mode.

Introduce a new vCPU operation allowing to register the secondary time
area by guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c             | 28 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h |  2 ++
 xen/arch/x86/time.c               | 10 ++++++++++
 xen/arch/x86/x86_64/domain.c      |  1 +
 xen/include/public/vcpu.h         |  4 ++++
 5 files changed, 45 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9d352defa25e..8e0af2278104 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1529,6 +1529,15 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+static void cf_check
+time_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.pending_system_time.version = 0;
+
+    force_update_secondary_system_time(v, map);
+}
+
 long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -1567,6 +1576,25 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case VCPUOP_register_vcpu_time_phys_area:
+    {
+        struct vcpu_register_time_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(vcpu_time_info_t),
+                            &v->arch.time_guest_area,
+                            time_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
+
     case VCPUOP_get_physid:
     {
         struct vcpu_get_physid cpu_id;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e0bd28e424e0..619e667938ed 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -692,6 +692,8 @@ void domain_cpu_policy_changed(struct domain *d);
 
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
+void force_update_secondary_system_time(struct vcpu *,
+                                        struct vcpu_time_info *);
 
 void vcpu_show_registers(const struct vcpu *);
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 332d2d79aeae..73df1639a301 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1628,6 +1628,16 @@ void force_update_vcpu_system_time(struct vcpu *v)
     __update_vcpu_system_time(v, 1);
 }
 
+void force_update_secondary_system_time(struct vcpu *v,
+                                        struct vcpu_time_info *map)
+{
+    struct vcpu_time_info u;
+
+    collect_time_info(v, &u);
+    u.version = -1; /* Compensate for version_update_end(). */
+    write_time_guest_area(map, &u);
+}
+
 static void update_domain_rtc(void)
 {
     struct domain *d;
diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index 494b0b54e64e..a02d4f569ee5 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -115,6 +115,7 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
+    case VCPUOP_register_vcpu_time_phys_area:
         rc = do_vcpu_op(cmd, vcpuid, arg);
         break;
 
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 9dac0f9748ca..8fb0bd1b6c03 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -209,6 +209,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_get_physid_t);
  * segment limit).  It can then apply the normal algorithm to compute
  * system time from the tsc.
  *
+ * New code wants to prefer VCPUOP_register_vcpu_time_phys_area, and only
+ * fall back to the operation here for backwards compatibility.
+ *
  * @extra_arg == pointer to vcpu_register_time_info_memory_area structure.
  */
 #define VCPUOP_register_vcpu_time_memory_area   13
@@ -235,6 +238,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
  * VMASST_TYPE_runstate_update_flag engaged by the domain.
  */
 #define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
 
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
-- 
2.42.0


