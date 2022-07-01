Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE256343B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 15:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359011.588417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWl-0001tk-0q; Fri, 01 Jul 2022 13:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359011.588417; Fri, 01 Jul 2022 13:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWk-0001r0-SE; Fri, 01 Jul 2022 13:17:42 +0000
Received: by outflank-mailman (input) for mailman id 359011;
 Fri, 01 Jul 2022 13:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ipL=XG=citrix.com=prvs=17451e3f9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o7GWi-0001Gx-Ab
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 13:17:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e244dfb-f940-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 15:17:39 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2022 09:17:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5693.namprd03.prod.outlook.com (2603:10b6:a03:2de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 13:17:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 13:17:27 +0000
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
X-Inumbo-ID: 2e244dfb-f940-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656681459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8A6mMpiAtEs95ebuuIuu3RfOnwZwU0MXepuodOMBbbQ=;
  b=e+ULIG6lvZaGwERNvUKInyDrz0Wn3dV8WpP+9EidCOsdcuPuoq0ZNpdp
   viNAfPukG3j2BhhV7cfr4y71zXsKxV86s8cdLOQBSOdFanpY0aa6es0lc
   kO0X0axb7Ye7KvD/IakPurvST6bnyFeaR9jnwUA1UnxuYGWkHXix/vdOl
   I=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 77459733
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gBjWUqM1GsVv/pjvrR2/lsFynXyQoLVcMsEvi/4bfWQNrUpxhDUAz
 mBJDz+AM/jeNDPxedhwbty+pkJTusXcxtY2Ggto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZm2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 8xCnpKZEQwTZKzvvrwvDgJyNn8gMvgTkFPHCSDXXc276WTjKiGp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaHP+iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32SWiImID8zp5o4IF51Tt4T5o1ITdG+jsIsO7fpRuv3aH8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo+S/zEi3WNtdK
 kkd0isosaU2skesS7HVXBCmoXjCoh8VXfJRFfE37EeGza+8ywSTC3UATzVBQMc7r8JwTjsvv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fCITfWkLYHZeSRNfuoa55oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr+hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:fLfXIqrc3R4zDwMcR4h15OIaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFm7X5XI3SJzUO3VHFEGgM1/qH/9SNIU3DH6tmpN
 5dmstFeaLN5CZB/KHHCWCDer5PoeVvsprY/ds2p00dMT2CAJsQijuRZDzrcXGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSLOMB2qffvtChPkHb21LtBwB1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.92,237,1650945600"; 
   d="scan'208";a="77459733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSRklMghoq9XNjdSoQhX2hfgUq/lsn/ps0vXfh+8298O18fCdElosb0kDaEln354JAZ/QKZH8R7jXSyrueGNh3t+werTQY27Nej3i5eiirP5MkM2CtuNZbLwzSQi0ejxGSMs10O7rl7Yr0dgN1Y8U3m6fyXo92+oijCHwGeL1h81a2006Lovk67FIMyyJopgfgRg0jP8S4bVJ7Ejxi+GArDM6fxbk1rU0CK7JtY3Ie+XOOrJf+jRjSsT4GpVfpSDh0hI5b3a/ySoQQ2X5v3XisT/YhqM6AptAL9GsmbD72UmdEwv/cb9PyRY9OmX6X1Da2jpIg/E2D27VryWpSFHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5TihX5txPM3x8yme1vJvTud7aZG2W6LAevjhvIeRU=;
 b=K1kEbnZh46kM8EYn+s+VUNZYORr5D54G9vnHf6K0UgVzjvhpWyQWlpH2eQuHDlmGMJAOHycckNHKzohizxS65Dp5Sepv7IaX27zIgmUH+jUu/jNLs+4w7e20azwNG5pGxgn/b99sy1OqFYauFlWhAfyBh2EPuu640cc/c1STSAtO7cHlfYGoLOauVUF36gIW1+7xSwQ/sH7KhzBSXtpEDGYgXddgRczmLeWcWV+FrLP0Uk7d4fQ1K/+pWQLIpxkqob/qUacAApg0jbUageL2R8+rPCsdK6iKNomOseZ9eMdb2hdyGyGkI94IuLGfMZ2PooqautLDHM7dAhr38YFaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5TihX5txPM3x8yme1vJvTud7aZG2W6LAevjhvIeRU=;
 b=LOPbLXpVjDYUx2W2bX8z18PnCqrUfY2lmyKWa0+5d5fc+9gKM2Tuoe50Rej5HXWufeHCHY3zIZyb1pXNN8XZp0DIgSeLob1DviuVKS9Dwj24lJYFQMwbHIpMG4VKQCD8HF5FFZod078P62B517Xw/atLBTI2llZtxDxM6Te9PdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
Date: Fri,  1 Jul 2022 15:16:47 +0200
Message-Id: <20220701131648.34292-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701131648.34292-1-roger.pau@citrix.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01d7383e-26f5-4033-feec-08da5b640bba
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WREmhcfegOPbmLOyDUhQyQFBNdf7lofqAdzrad4OM89LT5+ZnErxbfg3jk8RLYSte6tuX8XxXS0I/WoUx3zpVY3OaUuGuWtKtycXlPZETaZenEKTibu8bELfDN9XteQLgEpVD/7TYAnIl6OmpJx1gN0De2p9zzaSzWq2A4mdNkupydNnNK7rCLuWmapZkpZB202VHe8HnWoQoDJxFyXur3xzm9rv5olvphuva5LBRZKg4Twz3j9nDSXUa80mBSYpRwod4+A+AprLi8LM6ngMtBGGQRVxeKJ/LKjkFmmqUvj6uk64J+pOQ39MPqlicUVS8voIRhjXpRg3XruqIKQARDLQfBmXFCbKJULhN6w5ngh3OJmbQQoMiaxZKJKv4NfFWD1wIPPTbPlGAA5q6U97BiVV7/FFqOpH7LVO8rS2gamoCCQ9j3Gg4qrU00NMIvb539erIVlqt/3YWDHdWY3SYhUwnFD9/238Me0FgIeHjaHrcLco5p+fy7wTRb6dQM8RmNGqPZujckiuvMbLvUgTP1SOmQC/XpeZemeYciYDm9znAW1KFp0q2wi6xY0bscdNm6zuUcPM+DphIjGjJRq33TvpmgKT711j8r2vOhqlEMBTvnisRUB3gUJWphQ9UVOCg45AEf/LcC4TEKfMVBMqx2JgHMqFDK/68biNqK1DNVr0kY0rL5eRGwAoAMh6ueCSSarG06YyiG7UFpBVza8BB7FPhRq7w4U26ayl80zysSupiBBg4eJL0xG0YcOI4LKj/MbC+b8EIhYaG/XiM7H3eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(38100700002)(66476007)(316002)(82960400001)(54906003)(6916009)(8676002)(66946007)(4326008)(66556008)(2906002)(478600001)(6512007)(186003)(41300700001)(6486002)(1076003)(6666004)(26005)(36756003)(86362001)(8936002)(83380400001)(2616005)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWI0QjZRczVBTXp3b3RjWmE1RWJzbitaSWp6bVAycWpyQVBSVVdKcGxPdVov?=
 =?utf-8?B?bTd1eWwwUUpob3JaMkNHSVcxdzFCcSt4bzZNMzBobmFDblFPUkdlWXYveEZi?=
 =?utf-8?B?N01XTmtZZ0FwdC82SytvTnlTZjBFaXhING9SMmdCcjJtUnNFbDNhRUxTdGJ5?=
 =?utf-8?B?L1FjRGJXWmtvQ0p1aTg0dkZIZktjdzNnV1RvWWh2TlorKzBjVUpZUFpDenY2?=
 =?utf-8?B?S1UzOTFMc3hkMWFSWkxuVmdCZlVKeFkwZ3NKSjdPQjBZbGtzUTJ6SldVYXlY?=
 =?utf-8?B?blVJNU5KZmFFSGVROGRmRVFqYlI3c2dFMDZKTGNxdkJYZ0t3dlBkaU82ZVQx?=
 =?utf-8?B?akQyV0VjQXBhd3B5QWdnTUw3S0Nab3FEdnJkWTlhV1pidHpEMHFEVXdaUGZ4?=
 =?utf-8?B?RE9RdHpJa2dXRkVxNndnY1Rhak9Hbk9Ob0FZL2RWTTBPVHM5cVZPNTRrdnp2?=
 =?utf-8?B?K2pGMUFWUnhYcm9tb1FBYjhpcFZzRlhDQngyWnhrK1VSZWZkcFlFSEgxN3pF?=
 =?utf-8?B?WW9rajNRNC9jN3JCSlptR0dMQWE5TmpMQUdJZ1RnZVNVSENlaVpvT3MramRz?=
 =?utf-8?B?OGd4TGl2SkJaak1ZNm5rZFRVL2k0QVRvS25lSFRvTi9JYU9XUWtCdmM5N2dG?=
 =?utf-8?B?TzlhOGJCV2JiSHVrelpWZVNSNjlTNzVQWUJvZm0yNlNEc3J5YjBENEV1SVlH?=
 =?utf-8?B?cnpIazZUN01Da2UxNHlXUnl3STRYQUxvLzdYbElaRWsvblo5U2FCZXowWW5p?=
 =?utf-8?B?a2F0anp6Vjl5V3hHV3FsdEdURlQrcDl0eTl5c2VJb0tDSG1EaTZrR3l4cHkw?=
 =?utf-8?B?cElGdEQraTdqbHdrdjY1UWMrcmxCRTREd1ZQUzd3Y0o5S0dWMmQyMDNrZ2ts?=
 =?utf-8?B?ZmZoc3RySnpCQi9QdDZkUVJ2eEY2UFlkUFJJbkkvWVZhT3YwRGgybTN6K2lT?=
 =?utf-8?B?b3YybW5pZzdhZmNCaVlwOE1HS1NvdGhnUVU1WWl1OEpMc05EeVloWExGdFN2?=
 =?utf-8?B?ZkU2bGI4VmRzZk96NFNlN1B1K3pXcXVhTWZIN0Ewa1BEdy91QkRxZHBrSVFh?=
 =?utf-8?B?ajR2TXJtMUsvQXB6Y1R3VDVKVk1TQS94djZaYWFiQmtEN2N2ajh4eTYzalVX?=
 =?utf-8?B?UXBmWXRNR0N0b3dJMG1RWnkzS1N6RDM2M1U3UmFMd29tY2gyNnBKN1VzOTdQ?=
 =?utf-8?B?YTRQR3htRVd4QTJxSmJMQi9ZT1U3NGFUUDMzVVBwdE5KNjlva2JXMXRuRk4r?=
 =?utf-8?B?VDdaTlVCcTdJNHdzVjBjZGRuWUlFRjJiY3UxOU1rMmw2eE51Qm5ocmZ0NVh1?=
 =?utf-8?B?R0V2YlIrbFJYMXBjd0RPTnBDdHEyTFVqNURNc1ExanpQSEVXbUtYTXQ4MW4w?=
 =?utf-8?B?R1VaYnA2NEQ3Q0NIOEZvdG52OHZGbHY5NzU5ZVpYeVd3dnZ6MTJvdnhPdEds?=
 =?utf-8?B?Z1Y1d1Bobll6ekRkSFJXcnF4MEt5dDhLNFNFZUsyZFd6bWhaTHRxR2pHMW56?=
 =?utf-8?B?NlFoM0t6bFRBMXhoZUJaT3RjcVRYbDJOQTg3N1pscmRwWkIvUkZQVzQ2OXNk?=
 =?utf-8?B?aGpycnFDTG15VUNKd3dpWElRSUJ5aU1tOE9TWUZ5dENuQ0t1RDJSZHBvbHBN?=
 =?utf-8?B?UHdxR1h4bG81WWhteTJremFGbVV0bVJTZmJmN1JGY1hDTGszSlBqSVJ6Wjla?=
 =?utf-8?B?WUNZQXFadC8yNXhsaWF3Y05TanhTT2cwTEs4ZjFrbGwwb2VmK2UvMHpJSFIz?=
 =?utf-8?B?ZXZ3Tzlzclk3QlhSUUlydU80NjB1c3FTNldqYUthdVdaMFhkZ1RhM2RGV01j?=
 =?utf-8?B?YW13Vmc3R01XRjg4WDZkRU51T1h2RTRzKzc4ODdCb0owV1ZEUE1qZGp1RFZD?=
 =?utf-8?B?b29QcU5PMUlUS3dqOUU2UERCazlZWWcrM0FWRlFrNGcwQy9RV3RYcmlTeHNP?=
 =?utf-8?B?V2tQQk1oNk5OUHZqNHk2UWtYZnNnQWpGU0pTc0d6UjZ6cFczd3hBYUtrc0Vz?=
 =?utf-8?B?dmdEaDdrZkpLWVZ0cmZhUFU5dC9qc0pKU2dQdHB2S0NXLy85SDFOOHh0ZTF6?=
 =?utf-8?B?WnBwU0RId0tsZmFXVUhsVHpUbkZvaGRxKzhVUXhGQXo4Mi9CeEJ3VGlTeHpC?=
 =?utf-8?B?bmJiMkw3YjVERU84Y0YvdkMyNUlyKzNzbFYxR0trZUlUU2pCZ0Rxd2dtMUsr?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d7383e-26f5-4033-feec-08da5b640bba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:17:27.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4RpMVSrWOsPRxZiwrBa3RXqECwOxU0rNiXUQV50nEqK7lYnFhqodEVBXMY10xXid8xt+IAm/9NVXbM0QoLK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693

Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
unblocked by IRET case.  Replace the existing usage in handling
EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
and page-modification log-full events.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vmx/vmx.c             | 28 +++++++++++++++++++-------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  3 +++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 853f3a9111..d69c02b00a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3935,6 +3935,15 @@ static int vmx_handle_apic_write(void)
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
 
+static void undo_nmis_unblocked_by_iret(void)
+{
+    unsigned long guest_info;
+
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
+              guest_info | VMX_INTR_SHADOW_NMI);
+}
+
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
@@ -4134,13 +4143,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         if ( unlikely(intr_info & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
              !(idtv_info & INTR_INFO_VALID_MASK) &&
              (vector != TRAP_double_fault) )
-        {
-            unsigned long guest_info;
-
-            __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
-            __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
-                      guest_info | VMX_INTR_SHADOW_NMI);
-        }
+            undo_nmis_unblocked_by_iret();
 
         perfc_incra(cause_vector, vector);
 
@@ -4506,6 +4509,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         ept_handle_violation(exit_qualification, gpa);
         break;
     }
@@ -4550,6 +4558,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_PML_FULL:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         vmx_vcpu_flush_pml_buffer(v);
         break;
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 03995701a1..bc0caad6fb 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -225,6 +225,9 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 
 /*
  * Interruption-information format
+ *
+ * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
+ * field under some circumstances.
  */
 #define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
 #define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-- 
2.37.0


