Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76AA7B5639
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611655.951204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKm9-0000Iz-9h; Mon, 02 Oct 2023 15:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611655.951204; Mon, 02 Oct 2023 15:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKm9-0000GX-6v; Mon, 02 Oct 2023 15:24:01 +0000
Received: by outflank-mailman (input) for mailman id 611655;
 Mon, 02 Oct 2023 15:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKb0-0000iK-TO
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 198510d0-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:12:29 +0200 (CEST)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:25 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by PH0PR03MB6680.namprd03.prod.outlook.com (2603:10b6:510:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 2 Oct
 2023 15:12:20 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:19 +0000
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
X-Inumbo-ID: 198510d0-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Wmu57Iweb823GQ+wLjFQQNOvbip8ENNcd7NtaI7MLwQ=;
  b=aI8rct8KLy1qSPrjQ3Ao32aMqGT6Dyu4IhzXADtJU6iwFrmCrTQp7QsZ
   F6DdYsW2McBgig5NOdEfrYnwrUKG99Bss4rdt7hHVgFq1Bc5fbEPLRUF2
   lHVz4IC3s+JjxicZjoPR+adaMg0C/U+WbCoJmOj8mReJwkiwGgR6JetEI
   k=;
X-CSE-ConnectionGUID: 17r7I/A3QciTLPErLc/vrw==
X-CSE-MsgGUID: Y0x82eQ+TISu8fIK4QEFhg==
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 124817032
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Q96Os6pC4yEPYum1KkbfKLXgU1heBmLuZBIvgKrLsJaIsI4StFCzt
 garIBmFOK3ZMGTwKth2PYXipkkE6JbWm9RmSQU+/ClkRHkSopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzyNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGlSdE+iwMvt+bm6ds1Uq94HJ471JpxK7xmMzRmBZRonabbqZv2QoPV+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeGrbIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5CTeLgraQCbFu79zQDWEcbbBiHgMKk2kCfeI5mB
 mIU9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM87QyY7k
 ECAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty8XqpYgopg7MSttlH7+4ipv+HjSY6
 y+OhDgzgfMUl8Fj/6em+VHKhRq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJmRtp
 1ABksmaqeoIVJeEkXTXRP1XRO3wofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:vjMu6Ks04Z9IIHlevf27gO117skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-Talos-CUID: 9a23:DkldGWCjkBtp7zT6E3A47hE1Xel+S3bc8FPoDlWcAiF3UqLAHA==
X-Talos-MUID: 9a23:rpP3kwlfC++2O4zE68F7dnpTbNc4uamXS3wsqohWteinaRVdFTeS2WE=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124817032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijVBSAH1E9YQm/+RCyuPbs9r4A3PfVJK6X/TQLGxd7jMFFhWSu0XvDX02bCHpKM9JHEyagfdUedlb69SaMcBz3PRwy0rLR01/UBQZ8pX0+qcpHuES7dvoDXguBWMWVA2EAzBzV2v6/qgFVJq+AM6jqJ5XfE6Z3c9RuMlyWT+p4aGaCxqE1g0bxcNcUVX3YO44h1tPYjEf3Rw5CHtFiXId1JMbr0IU5C80xCFGYUP72lhYQVSyc0O2uHFR2J18perd5fPPfG8vK/SfryzdcfFuFETLo7+dT1LJgrCLyl0tXpzWoVqBZrT6QuloQPK8CgDpLEizSTVR4aX8zBNAiC+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvG7viCgQSkvoHQeBIteDFdRPqHhGGdm2eXXhEsoH1M=;
 b=F1xlt7C10eGaajsY+JSCnVRwUBX4DCKUW4xsPzSz8IeJI365bHfn3uwSfBluPkUn8rwuoBRAikJld8Lqu3Bf5h0+Ce10McXOxQPW5AzU1p10qiiKOTsyWIKm9n99tEZL+ZVtVs4B6XGZrkloTI3l4AvCM/eJxRixDpfz/SbI9ZjlH9Bk+gG3aSKxtvckSILYBXMY0fVdapOIa3E4heLKCB+/awb82prxq+9pczC4uNeulRVvVksCE4qVbcMs1xDVkoTnxYmlZhBOrr8QeZ8qUusUR4H4PRiVdbdzch8QJS2q9dm5Pkxf19UKWo/6e1ViOsk3Vyo5z0FZO2OCdXI0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvG7viCgQSkvoHQeBIteDFdRPqHhGGdm2eXXhEsoH1M=;
 b=EjX48Uk6vz3+maFxMsbIzx6buFCGHFxQwehUB9iNLc0oKzYuwBHJW/a/h/FzaUh/CJ77FyXAJxEKwxvx9NYS7BJyej0in377R7d2SnhqDMbE4xMffesJiA/FsyJduEMD0ATqWm/giOXelQGza6cTSp/sqa151yqLD5KhSUFO09I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest areas
Date: Mon,  2 Oct 2023 17:11:23 +0200
Message-ID: <20231002151127.71020-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|PH0PR03MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 048fe6c9-26a6-425c-3660-08dbc359f871
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o0aZu6URk6qrBrXCnjvk0o2cgRxkoHQ7WLTEXSuXT4G/lxOvxW3so3DXGwsQ8OQMZ1eDUuDsiXAwHK0scbuleeSasBJytL/bX+TBfGjPwjvhhbNWOuKLNbde9FsHpYaEnnJQ7REIzLn0reeNBGmVPNEdih/yQidKVZxkiFYdB033oLQ9fdaYh/lDnCg4qt0/smNtaBRDkoXpCI7GKaA1Yijj3eu4y+8iFmCQsuk0WzA7BqAeLM9d/DdUiVVouOzk0olH+BaEXZeisat4rA+ol4+kexAsIPnK2W/hVcPUcYHWlknTkVtI9uCHAhA2p+Cv5dNFOYXqqPkRwM8Wdf5NARjBid9kKd0weKnK7kmgqtIF1jLYXpqOZwxtzara78YeRoonLxFtnp5tUbZlLF2/W/mFxKMWa8cMwMNHSFyXSYCvQ6yiuENDLXT8TyQiZE12Hr1DBoPLU1eAXCEl1w5yP1RLgT9VRs74VmviAct6UmIjKLz6AvId7UE9F5PopDtxoqPgGudDAfcrkuBSDKl0wso4KiHYg1OjI/55adM/bFlfo3MdC6PJ5Iop89iwEOUn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(2906002)(7416002)(26005)(478600001)(4326008)(8676002)(8936002)(6666004)(6486002)(6512007)(6506007)(2616005)(1076003)(41300700001)(316002)(54906003)(66556008)(66476007)(66946007)(5660300002)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhPNEhYQkZiUUxtNTZCRzZSKys0Yk9jZHAwTW9BekVXYWMyTjUvM2dVN2ZT?=
 =?utf-8?B?SUc1Sm9wT29MK1RtQkxDNjBBVG43MUNDTmpqNExPanRMSDhEZjdpSVVqNjZx?=
 =?utf-8?B?QWtiS1RsVHhiZnAwcWVvdVhod3hFNXlUcVhtN0ZncEJ3Tk1JK1VkQVJCK0to?=
 =?utf-8?B?YURsdTdjY20rQXFtOTdQRWM5bk81MDRBODlJOEpuYU1XR3JMMFRJMDl4MStW?=
 =?utf-8?B?VmZRdDlheXNTa05FMjFIM1ZpY28wK01GYlJ3ZFhBYXN4OXZQSW05dkNXMjRq?=
 =?utf-8?B?K2lJZ0hXdERONTNIUXhEdFIzNTdJN0pvdkxpck5FbjBMeXBVek9acVgvREdE?=
 =?utf-8?B?SUh0SVdESTExd1R3V29oam84cnZJUWhHd2lUeURha2RQZ3FYNnBxbkdPMDFy?=
 =?utf-8?B?bkNsRkRkZGUzd3RnRCtzNnMrT2ErZzBkbFlrbEkyeVFRV3ZMM21tNWc5RUEx?=
 =?utf-8?B?RmtTY0lsRFdxQXBMK1R1N2NKL21DQmxlS1VRUkdpR2pUOFlmenRaQ2krUCt4?=
 =?utf-8?B?ZUx2VytDcWNJcVh1b3FwZmRURWNvYkU4ZWREYkhHeE13VWljaE5hNzRiS3RQ?=
 =?utf-8?B?M2h4VVBZaU0rVmpsRlltTEIyMDllUlUwK2liVjFvRkFQem9wVHhOMkNyQTEw?=
 =?utf-8?B?blJNTFFPZmhXM3RZVzZSSVlZcWxITjVXN2NWcVRjcWJpRlJxN3JYbGpaM3Y2?=
 =?utf-8?B?ZW5BQWRxMTRVcUsyQ1hDM1RYZWpFUXdwNjV2M1lrQ3NNR3cvT2lqMGZoR1Rk?=
 =?utf-8?B?NHpSbjBnOUptcGJOS0c1UzdDTndGTUtWQVdmdzJOVlZ6NEdTVlZOWVM0NUJT?=
 =?utf-8?B?TWUzOVQwK0d2V1VKRytLaGNiTStnL2ZKSGJrUUVJUDcyZ0l5QWQ1aFM4VG5V?=
 =?utf-8?B?Q2NWOEJaTWhiN2RRTjcxVm5sVytmL09BVEdibTI0ZWgwK1U3TXJwcFFyWlNX?=
 =?utf-8?B?VG1QTER1Z2VuMVhEOHk4cy9udlc3eWVoQkZIQmVlUm5FWXExRkh4VGVYMHVj?=
 =?utf-8?B?RC9EL2VwV2x1Wk4yeThOTUZNU1lzV2tmMzZSZm5xYjhaKzJrNlYvQ0FwdUVB?=
 =?utf-8?B?TWlEZHRGS1BqbkFKSjFqa2w0ZXlsTmgxamhuSlBpYkVhMUpScTBtbkxqcVRE?=
 =?utf-8?B?d1BBTlhPS2QyR3BxY0VVMU1nRjh4bWI1MFR0OFlpdWlKa05zUGxuRVc0Qll4?=
 =?utf-8?B?YXJyWnl4blF1YkVEM2JSMHpyNGdiZWVMcFphbWx3c2V1TkRlVlVVb3pvaFhr?=
 =?utf-8?B?U2FCdjRPTUlGd3RlU21OeDViQ2VzcEE0c2JYeTJDWmxMWHpYS0xyUzlHZ0Q4?=
 =?utf-8?B?b2ZGN3VQTUlwNjZSYzZEMVByM0x0K0RuTDFJUGdhelNucWREU0tqWlZOa2Y2?=
 =?utf-8?B?akIvSnYwdTU5Z2Z6RzZhcGU3S0htTkYxZzlUbnVNOWd3RFFUbmdzS3h6K3hK?=
 =?utf-8?B?bVhFVnh4TUhpdGhmTW0yL04xUmNDVTJRbFdRblFIMkVvRFY4UmFyY0I0S0F5?=
 =?utf-8?B?RVhZcEtXSXZLVTZjaExleFJrenA0TzZNdTVlMElJcG5rUVhDWW14TzJVMDN2?=
 =?utf-8?B?OHZhakR6K29ueHovMkhwTHE4UnBQWGRjZGhUcDF1TFBZWHRzT09sSVdOVjFt?=
 =?utf-8?B?ZGg4KzhDOTJzanBWdjVhMWJkNnI5aExwK0VVbkNhdHJZeEZIOS96MFAzcmdK?=
 =?utf-8?B?MkxDaXROSjNBSmN4dk5zSDJTYklFV25hOGFmNzZlMEo5dnI4cmpRcXFkdEJJ?=
 =?utf-8?B?VnpBRWJqWmVrZGtXeTA5bFZaV25wWWMydDRkdnlOSFdiQjRRYlgvYy82T3BH?=
 =?utf-8?B?amdINGpYY2xZVVQ4U2U1ekFzcGxQaUx2R1lzYi96bmlLU1pFc3hoSm1ROTVo?=
 =?utf-8?B?cGtNYXoyQ3hIeStDM0lGbXVXNjRhSnZJYXZmVzVmMjRzL1o0ZWVYL0lLbFhl?=
 =?utf-8?B?cEJIbmI1clkvZ1BwdDFsQXBnSlZSSXhibVFYODFFMFBVUG1Qb1VhL205Q2lv?=
 =?utf-8?B?bzhSZ3Y2aTRSZFNzdVR4TS9WNkJyRTNGYW5pbTRTdUsxbE53cHZvNFFGMFRD?=
 =?utf-8?B?cmc2WGJtY0VNcXBuSmFaa3hNVEdkZXM4TTBZaDFhRXhNOEF1blFWRkJ6Z25C?=
 =?utf-8?Q?6LgVfRVVgbZuUFCxYptpJIGfl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0sR0FkxPL30dtLdZMUUerZTSSjwWvza8b4CdnVpbP0uZYTWtZJD37d39OuYKZtsWdMCKcP04vMQ9QkQwnnQYUGDVS8v00GUZZbsvxdgs0ATy+9vz5Ayp3f4na7eZtT6zdkcLuoPrDKRh6thQ7Tn8v0ynyHfkfG2vTXjUUSBKyjynXKDNb0wkQ9lRPIDjZpYF0UR2ggTqDVkUno8kppbxyu1HfV0a/NEfHUhn7ua5m7qoJfbXcfxJyMmYP7B7SYLEr2+P3jPleURGnA2bEPae6inSEF3kkIvGH4cvX/lgo+64Q9EG3G8iwlC/ebVdShZs08VjY4chfE3FxewH2ReGq+sZis6vJzSKzQ3MEato4SPAldbn4uYmeKHEiLENE43+OTEWLpP8J9hxqle8p1k2OQnK4NMj/R8xwLRnnTxMz4KoddeyuCJztDOscjurxVgJUmOm5b3KrhL0S/seT+bwjpSykCYrcMskGIv4NdL3rHm1ITkdSMTTpk3I7iDyfyk6+NcUy54LsOdbBZNOnumzgeu7BkB3krMtf+8m4KU8O+u92YYKONCzIZeW/gRDHrDNXHVCRrxoWffBASSKnWV3K2XRcsqYL6w7XX97j7w80lhYMT3lnfeHq0IDITLvjv0flFxBrn2oDmWZt79iFwwDi+s9qUEPniYazWl/Rzr6CFiMPeWfCr5GitfAggCSfGWv/8Webf8Dz9LUpDBJ8K4D2OqfGF4tk9WcYra+327EuvfLFYfwEdxrQHqWSrVMDjcw5DJmOfBl9Nfq7gedsVNs6kVWiXKaynUbEy9qfE9pLFbcsXcR54VR4C8sCmd3tgWgbwsIwnEz+BZaTgyjIJMe/gTmxllhghY335wdRhLPSyuNGsbv0MTYMICwNpZjhJ75oQZbF7GMnzNdcUV9FT789cHa+sXBic4uct1XEAy5rBM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048fe6c9-26a6-425c-3660-08dbc359f871
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:19.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul2ZOnIbcaYNCp/oRCJoS/UtestZo3QuqEcgayIi/Gc2xT7xAFIes/XeZrCkKZMm2bWJYh6jRpg41FIx7+qnFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6680

From: Jan Beulich <jbeulich@suse.com>

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rely on map_guest_area() to populate the child p2m if necessary.
---
 xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
 xen/common/domain.c           |  7 +++++++
 2 files changed, 38 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5f8f1fb4d871..99cf001fd70f 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_guest_area(struct guest_area *cd_area,
+                           const struct guest_area *d_area,
+                           struct vcpu *cd_vcpu,
+                           const struct domain *d)
+{
+    unsigned int offset;
+
+    /* Check if no area to map, or already mapped. */
+    if ( !d_area->pg || cd_area->pg )
+        return 0;
+
+    offset = PAGE_OFFSET(d_area->map);
+    return map_guest_area(cd_vcpu, gfn_to_gaddr(
+                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
+                                   offset,
+                          PAGE_SIZE - offset, cd_area, NULL);
+}
+
 static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 {
     struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
@@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
                 return ret;
         }
 
+        /* Same for the (physically registered) runstate and time info areas. */
+        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
+                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
+                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+
         ret = copy_vpmu(d_vcpu, cd_vcpu);
         if ( ret )
             return ret;
@@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        /* TBD: What to do here with -ERESTART? */
+    }
 
     domain_unpause(d);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d4958ec5e149..47fc90271901 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1601,6 +1601,13 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v))
+{
+    return -EOPNOTSUPP;
+}
+
 /*
  * This is only intended to be used for domain cleanup (or more generally only
  * with at least the respective vCPU, if it's not the current one, reliably
-- 
2.42.0


