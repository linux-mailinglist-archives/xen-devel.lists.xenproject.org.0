Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5270748371
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559112.873808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zL-0000kP-W9; Wed, 05 Jul 2023 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559112.873808; Wed, 05 Jul 2023 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zL-0000ik-TK; Wed, 05 Jul 2023 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 559112;
 Wed, 05 Jul 2023 11:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFzj=CX=citrix.com=prvs=5438f3518=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qH0zL-0000ie-2v
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:48:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d5f01d-1b29-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 13:48:00 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:47:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:47:48 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:47:47 +0000
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
X-Inumbo-ID: c9d5f01d-1b29-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688557680;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=51gqjf1YS6obMPSOc6sxI7IlSPb3irKbpmSYuFSjz5U=;
  b=aepftzVY1cssLSLt4KIbKwpPReQoHI+lDzeevEWg2IRMfyhhLJURRUm8
   FDc08unCYkms30A8jTThSw+pyUVNHu/9vV0MtIYhizwjUpxe9gFuvvi5D
   /BR7fzcRl5zEMsgVBGZ+nnmhRQ0oUcKz0RaxtR7B5VZUxdvO//YYsUwIh
   8=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 114522347
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CujpBq0QQNZkAKBOK/bD5fRwkn2cJEfYwER7XKvMYLTBsI5bp2AGz
 TRKDzzUPPaLNmSgLo0jaYrn9U8H7cLUnNdqSws4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNmOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMTh+6
 fk7EHc0TA2Khbro+vWCG/F3v5F2RCXrFNt3VnBI6xj8VaxjeraaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6PlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12rKVx3inB+r+EpX7+6drpQy/4lYDCSQTV2CKgcPkqk6xDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8kN+pES0cLGtHfildSwIAu4PnuNtr0kuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:F//wWqpxWMj5Zo4oUs+zuAoaV5s3LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Km90dq7MAvhHP9OkMAs1NiZLWzbUQeTQr2KqLGSpQEIeBeOvtK1t5
 0QF5SWYeeYZTQUsS+52njeLz9K+rm6GdWT9IXjJgBWPGJXgs9bjjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTA6f9m2HX4MWsnEvpnumIj9aRALKhY74E3W5AnYooLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WW2wLRzGja6rVRgZ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf6ZWeuuybg3AHmzXIH92Li4UXwuwquneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBL7mjjn7dSgbWAkqqP0mwttrQcgtQ0ebWIsUs4TkWUrxjIVLH5PJlO51GltKp
 gUMCiV3octTbrdVQGVgoAn+q3QYl0jWhiBWUQMocqTznxfm2141VIRwIgFkm4H749Vcegx2w
 3oCNUbqFh1dL5iUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf3bAsYT+7rk57PyjPMVg9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1ALDrLSqAQlYzlNbImYRpPuTLH/
 KofJ5GCf7qKmXjXY5Pwg3lQpFXbWITVcUE0+xLKG5mYvi7WrECmtarDso7foCdbQrMclmPfU
 crTXz0ONhK6FytVzvxnAXRShrWCz3Cwa4=
X-Talos-CUID: =?us-ascii?q?9a23=3A0U6uCWju0OZcZmWrScpEp5yHOjJuQiTt0HLzGwi?=
 =?us-ascii?q?BK3tgSuXLcxipqbt/qp87?=
X-Talos-MUID: 9a23:++gRMAm9YkXNG9UivKq1dnohOZ5pxvWCLHodkKwDufK1FRYtGzeS2WE=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="114522347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjqyACE4Rm8HnL4tfzwaRdeeq0cFBxxcxGja5sb+C8Hr3NqIaIa8AQ6GTlDEsUEDw8GPU0C1T+lU1Jl++XDDP0jyT0T+jC5OnfyPN1v34ylIjtNCuwSbQVZ7yE9S6oLM3YQGxguHocEFoGksLv77f2nnkisoXhx0tHBh63kS7QOdcre8ckK0pvX7F7l10t0Db2lK879dzHbYCusOavFhb37dMuFJL9BrSZ8mXC7dbXDjJfbD+F9NLh3MPhGv3R4NT+vDSl5w2E1VIX45OuRr3BsG4KB78KgLK3g23ox/3V8NIonbexJ6iPIlv1PG0uPl3qTmo1osKMGkSVtN8DeuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH8cZ+Sn26CIH1jKYtqzqcmUZfi0hDkjTz7umGx38vU=;
 b=bvfV8bwrQxZCy1hFhn9x49G4Fz/bInCoJGb//SbhCbaGp5BAwPWly8RbxKjGb8+LPcP/aEQ3aOwo6++MOSY7198ct7RJ4sAnPNHNiPs7JxnGdrKRXJAFjBPlyUU4lEc3ESn08/0H4D8EE8fXLTgfbAhbek4qoV/kAUYEhjtBZq1hQ5N7RlQG/hFGTC193UisZT4Lb5iK9iHO6Gnk8nYKKl6M0RuC0HPFSUvOdgbgDIpsgr87BgK3XH0npCQbsG15awbtnviDJopvJ6qVvvmvYDc22za4+V1Blhh/Q45Sd1+Lu7lIu708tJoIhhvWyZSgq7a9bLKUY6IunhlbCPKQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH8cZ+Sn26CIH1jKYtqzqcmUZfi0hDkjTz7umGx38vU=;
 b=ieatkynIOYW5uAw1LmXFeJfUN0k2DrccK6a8GAIoMIQB7hvTur2BLrlYVa4rsaXH7cyp+3uQ9n7nSB1czUGnDSDzk0wQgBOuS4MyI/WuObFcwyXvgtIVI5zvHiZSfUdvn0lDqdbYtn5qr2JJiql4x7y9zyKvEgCYTwfyUHwJkCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] x86/gfx: early boot improvements
Date: Wed,  5 Jul 2023 13:47:38 +0200
Message-ID: <20230705114741.11449-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 007ea356-0412-4a29-0575-08db7d4da728
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j2pGQzZunpx93JfEzfGfRaeJSMr25XIzDrKO16kbG9z2NroXEAdHNkjldFSOv2Bb5EEttNCIZ5DJaF2GFa5UEEKUP4czKXm9mGgtD5ikqygLPeJ0bWg1dArw7YqDiiKPY7IsGHTONm9TAI9XoCcHDZ4fLywkw5K8ebCfxRItr3k3ysF+82OYLruuUkTBWPTRFlkvBD1gfEb4Wuz6/QQD6e7HW0QEHy9khi6glh0ez3cNoQ1notUrl+fdVZ7Yj1q002f67ckFax1q2hcNvAhOrJahA0W0EYoeIGnFaQ7rx9QLmSYjYYk8v6tmkuFWDSqLhlthN6PCVjzfeW/Xra4fm9S1EO76usr3tpjdqnRVFnJSJAVm8GRDC4aoHAPPp0ceT2oGmRw4IauGUzyjHDtrYPT0wdQ4TCoB/aJyogDbW8WwPtokZ4zOaObE66ElBIXkcR4yOdtJ7VYakSoMAhym3CxJ60PtMJroTUcybREDZyZL0ZVr1m9dZTyQ+GGtFVrcJj6PU3tyGJ6jPobxNuFs1MwaI0F+S7FrnNniM1TlYZaYgebwGIb6t8qKzk0knMho
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(186003)(82960400001)(478600001)(6512007)(6506007)(1076003)(26005)(86362001)(2616005)(6666004)(316002)(83380400001)(54906003)(38100700002)(6486002)(66556008)(6916009)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002)(4744005)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXQzNm1PQzJabGN0Nk4weFNFVEF5VmpPNVl4K3ZESjFKeHVRcGo1VFk2SklT?=
 =?utf-8?B?TEsvZWpCcUZ0NVlybU9DbEFKdUM4OUNJTjFwYVFPV0VkU3ZPTUtuNDlwa1Rh?=
 =?utf-8?B?SlpnMzB0WWNJU3hCQkhrb0tLeFdrSXdMSGpGb1o2K3lwT1NXeFNrc3lvdStE?=
 =?utf-8?B?WUhEM3loS2k0enpMOFcxeVp3Yys2eWJJS3VqTzh3cFBvRTh2cEhTeTdpVlhm?=
 =?utf-8?B?RUUyV0Y4VU5PdCtqc1JFdEU4Rzl3Y0QyTWxmaVpEZTNjV0pSSWRMMWErSVdK?=
 =?utf-8?B?Z3BDOU93TlRIN1BBOFV5dEdudGlxaVdwd1JwNkV3RWJvTmdZZm4vTXM4OE1S?=
 =?utf-8?B?N0NlcWJoUEJURU1pcHpJdEt6WERLQmRrZjhub1BJcnA3RzJVNWcyT2k0bUt4?=
 =?utf-8?B?RUpUZ082aFpQcWZpVE5MbnVzL29MVmdwVTcyMTl1ckxUUVVYNkZnUWQzVDhi?=
 =?utf-8?B?em9Id0hWV0xoK2YzNWhPQndRalRoaWg0Q29LRmJ5QmxITFpNc0xMaTVmVmgx?=
 =?utf-8?B?ZkFwTkJZbTNpbkpDVmRpL29KUWhvSE9SeWk3Q2dMNmk3dXl0NnVaMXBZUXIr?=
 =?utf-8?B?UExWRFNRRTEwZXJuK1VTdTAyNVpqcUJPb0VxRE13MXdlbXY3T29VN2NlWjhY?=
 =?utf-8?B?UEJKSXMzK0w4ZVozamwxOWxmQkFqblVHUXMzZ3d2RTdSMFpCYS8xRkZWMTNy?=
 =?utf-8?B?bFRmdkE4RnBhNzl1R1N3ejRxM2YxMVQxVVY2aEpwK1NqMWpodTEyZXExV1ZD?=
 =?utf-8?B?WWFEZ0Exb0JZcWtvN3NmeDZudC9kRXFMU1NlTEVKL0ZqdGo3RDB5QlcvaU1n?=
 =?utf-8?B?S2JiTS9zWStVRWpSUWcxc05weWtaaWVwem5VYkNuL1BCeVNONGh4dmtLa2JN?=
 =?utf-8?B?UVRmNDk0WnVaOHMyVk00SnBVNXg4UloyQXlHUU1sSXlNZ2ZlNXNwM21NU1Nn?=
 =?utf-8?B?eVFjVDg1N1prMDI2dFMxTVoxUDZ5cWRCdi96cW1vNy94dUVsYlNnL2pzVnk0?=
 =?utf-8?B?S1VseTBoTHNvQVBxM1plYzV3NzJCTSt1QnFkb1FGMXQzMWhsL09MZ0pFZ2g4?=
 =?utf-8?B?SjVlaU5mcWt5RDdHQmU0ZTl2RU82bkxZQ0tzZkhvYmxpS1EzSmFCa2NaOTZW?=
 =?utf-8?B?bDZ1OGtiaW9KaGlBdlFYQVMwRHl2VCtvSGJiY05vMEo4Z1BoZnFYT0owemdU?=
 =?utf-8?B?cGNQb2M5SzhDWWxDNnlOLzNIbm1sK0pUVU4zbzFvMVpiUnJ5YnFVM0hrQ3By?=
 =?utf-8?B?R1Z1RUlPVTZKNkdRQUJOcDN1Nm1WWHlSSGc2cGIremF0ck9YNzBVNmFxMk5y?=
 =?utf-8?B?MUs3TVo4bU5RcHUyd2lCVHRjUFNBaE8rMzVoTW91Y1h5Zys4Y2Q2bVdZSG16?=
 =?utf-8?B?c1l1ZG1GOWFKb1A0ckE1eXJJQXVjWHBjZTJvRVkvTmJhYWIwWkxIeStsWkxu?=
 =?utf-8?B?WVdnSGhwNFFoMDJ6RDZFRHZnZzU3cDlRNGJ5SEZWVEQ3UFYyKzhJb2RtV21W?=
 =?utf-8?B?QUJnVDNyVFNBdE9sL0M2bUs2cmliem42c1hZc29GZlhIdFZzL29mRGIxbEhX?=
 =?utf-8?B?ankzOExYSEo2cXlwUTR4YnZGMUtiMzNUYWhvRkxhUFlQN2ZWRDBYaVhkUjhO?=
 =?utf-8?B?ZFFaM1hLc2JwaVJZUkhxT0U4NHZKSVlFODdDOGlIUkRRV0Q5M0gyQzNHOExp?=
 =?utf-8?B?RFM5d3FOWWR6azh5TEVSRlFTZDNoSlVvaCtQYVhmME92UzdRMTFCSHhRSFFi?=
 =?utf-8?B?OUxXai9aWXRFcC9CUEtpOFdWNVM5ZWtIUXpxN3dyT3d1SXNMbVFNNU55VVFr?=
 =?utf-8?B?SzBhSHltQVRIb3FyanNVUm4rNmc2dkthREtlV3UzY0dsODdCZ2VpcllVZU9k?=
 =?utf-8?B?VzVnUTVpOFZwSXNEN2lWYllMdURnaHFqMVRDWTUrQ2ZsWUpVK25QeXpwSWpW?=
 =?utf-8?B?ME9FbDZ6eXpJSU05UzVSNGNHN1R1ejJqcmRCamhaY282MjVQVnp5aE54eVFS?=
 =?utf-8?B?SHF3U0trY2RvSTJnZ2dQVkJneE1NcFNOTTBVQ2pnOVF0enJLditUVjZoTkp3?=
 =?utf-8?B?dTZ1N1M1L2Q1OUNoY2VQQ2ZGVHlMVWZrWWwrVEEvdW9VUzN0SkZMWTRuUW9H?=
 =?utf-8?Q?OtZsAykWWra7m8yu9MUrwH2yP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rFeVNNAxyQL2PQt0sEs8uKP2EzW2DTYDpDtM/uBgx26YgJw8dlB+h/4Cwx9Stw5aiVR9UDaVZfJnPhtqSe+a9vTVLVYeNZ0z0fjWW9IyfPbphpYNOa24N9++8rT9WSks7EbJaRxPG45Mot6Yb8rdeKatJxIkvKaS9Ku1NOzaE7xeOr0aT23x6RlvC25HgTeFJDs9Thh/O8Lam5gwSiATCD4f++pnlihvhcpQO2VYQnJ/0z0B55lVZydCUULWdVYM9VJBScwwCLepsmk54V/MAo9QSKu0+0MTDnT1s2IoNeNiwi4dzsR1vh/DpKSgBBhtiUudvcUUUXon9X+AgKkgCi2qhN1Z9oOC+13is6xJKIgF/XSYJKVFhG0bjZUw7nk3eybwksu9udQhr4D1gkW9xHkPXOQS3YLwOQ3gqVzuI1Qz68MJMkSM4BmQ78z7XCdmXHf9NpdYlcUkpYX8ZvSZ/hAkEB+tvuIOSyaOaWcvgkSAYCwQ2PXXilsiwC0vQa8u3NrankElyJQ3dhVw+vbtUUc9Y/SrWUlsCnIyYhHo/gEz6o3JUJ3nuNgz58b219Gz275pE3P2mcCX+hBw7EzCnrZkxdTTK8hp4kEyZXTzFX4yNGNJTz0Hpki7BCMtTX45t4P9bUsNenRI1XvJT9zSdCxdm4B08RXKnCgSWlmjZbqZCtnIZ+EtKXbl5a4V4khhXJ78dCw3Dc1jmTe7rQy9wcGspMRbaRPbJqZutSGyTJrM8cqe/4NV9mcB2EseGsSb6oXWFJqWJGDIomNxRbk4P32EUb2GJ3X7tRJfxJ/HKvgEd2UBzEuM41mYHysnG7Lc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007ea356-0412-4a29-0575-08db7d4da728
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:47:47.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7ZWDRj4sDlqIYvXCStWCuBoHHrZaTwJb8RCfPgDnIa74fLRgqtJPOKX/lfgjISIDX8YxlzsoPP3/wyf8DoR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

Hello,

The following series contains some fixes and improvements related to
graphics usage when booting Xen.

Proposed patches fix some shortcomings when using multiboot2, like the
ignoring of the vga= parameter and forcefully switching the console to
the maximum supported resolution.

Thanks, Roger.

Roger Pau Monne (3):
  multiboot2: parse vga= option when setting GOP mode
  multiboot2: do not set StdOut mode unconditionally
  cmdline: parse multiple instances of the vga option

 xen/arch/x86/boot/cmdline.c       | 83 ++++++++++++++++---------------
 xen/arch/x86/boot/head.S          | 13 ++++-
 xen/arch/x86/efi/efi-boot.h       | 82 ++++++++++++++++++++++++++++--
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 4 files changed, 133 insertions(+), 46 deletions(-)

-- 
2.41.0


