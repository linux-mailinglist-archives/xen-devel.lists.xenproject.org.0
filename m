Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B4514396
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317002.536128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLZR-00011W-GW; Fri, 29 Apr 2022 08:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317002.536128; Fri, 29 Apr 2022 08:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLZR-0000yx-Ct; Fri, 29 Apr 2022 08:01:45 +0000
Received: by outflank-mailman (input) for mailman id 317002;
 Fri, 29 Apr 2022 08:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkLZP-0000yr-K4
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 08:01:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 947468a3-c792-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 10:01:40 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 04:01:06 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 08:01:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 08:01:01 +0000
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
X-Inumbo-ID: 947468a3-c792-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651219300;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OyGadDYn6zemyI5WxiYTOtgtE57hG7h4gq/cGghy8gI=;
  b=gkZ/CuKHs8p1kD7zsg+IlawG8imXGxsOgVoJgbjZw8kku9+nD7VOAHwR
   FGPp1XIwUpkmkNRatikqv3llWIOcdStTFJW2KZ2weiukh6A2b29FhND6+
   BXNjolGDD/DjuZCyBd5b+D42A69pJ1J9K4PDD/MZ330ulT9+bh8Zf1Jyx
   s=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 70616881
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FPY93aozmNirz/4KLtvYZe5z3NdeBmIOZBIvgKrLsJaIsI4StFCzt
 garIBnVbPaLNGb2et9/aoy18RtS7ZXRx9VgTgZkqHg2HnlB9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvR4
 4Kq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBO5XigbwwaytjSn9ePq5d9b7HeCicrpnGp6HGWyOEL/RGKmgTZNdd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgXFp2Zom8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK/fRuvTiDlWSd1pDtbdnTcOzaa/l2l2W8/
 j38xUvULA0FYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyLpBkHQPJLDvY3rgqKz8L86QGDB3NCSSVdcts4r8wnbTsw3
 1SNkpXiAjkHjVGOYXeU97PRpzXiPyEQdDUGfXVdElFD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zlyGNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:sVLBDa0gvxEsEHb/nwkdnAqjBTRyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4exoS5PwOk80kqQFq7X5XI3SFzUO3VHFEGgM1/qH/9SNIUzDH6tmpN
 5dmstFeZDN5DpB/KHHCWCDer5OruVvsprY49s2pE0dLj2CHpsQijuRfTzrcHGeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GHQMkHboUsTAjnZuBOlaDLY0LPErD5WMbs8uatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAdqqOYmwtXrQcotQ0pbWLeUs4jkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbPfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2FfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJW+wdVRCCX4GJff+raGjqCq9PllVdQ6duv1j2w==
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70616881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5peLV+w86OqGW35mE9hkx7E/vIkZ+07RbKqx1/ESh3r7R4+JnU4K1mwPO5uZCgrgl+asqdxeAjHFD1PBI16JwT4DKfW5xI3cHdXRL8cScZXJZEcffwOT3nQhbatZHdTCgeu8h4wCVQYtPX2pNu9JXbG5t2H/WHTfiX3mlgr8xLeif5V1e1y3rq660+YJ7p91GAxLXb6bkOW+QUOS1gbwh36j0ZayrE0GIAtpg+Qmy/GaSO1mNX9wmgeY4nJOTeQ4v6z88YPMvPVhDQkOBJvroep/lbqwD4q5YCf7Wd6HyknRWSggQj1Iga14LxLQVTsd9Vm7O3UCuY7b6IsSJqgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14SMqwalnV57Nv6T3dFcisW08hHEupf+aMwPQGT0INA=;
 b=HunJynxUEHxHoKtRt1sZavBrvqMAgAry6JvZPV5KR2D7YMw+kgTQ0fPC/6BHZXPKQpOkMbU9AqxeOfRg7576e9fwqJ1C2Ijyk7oj6u2nFH3YX3VPRYk+n4ASTm2ru+orMzqDv87LZGhcptWoaDLyZESopBHUnTBebCtGY3bwTS/ugQU9LePBjkx4j9GayRvttsV3JhIxklCuxfcTIlC+jhLTJEr7dFVL7+9FVtgejfl2iHbC3kggosYaqob+seif+6F8UD2qqrlrJtV4Nb3UOg6kTH6cOoryn6ounNoL1pNl3uSUVSV3LAlu9rGjKpoB2XuXxx1MG1CBJiSX1rezkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14SMqwalnV57Nv6T3dFcisW08hHEupf+aMwPQGT0INA=;
 b=rUe4bHMFUu14eZ/78/Wp/wZhEhzx5j4LxRbHR2aWwVl2D+hAjggOkwgTf34XwzV92goXSiAQCKx9r10Ia833lc9zL2yB+dFvJPlRyNsE0rgveKaAqR/a7N+JN9tVZPNG9jh2QPw0IOMXjKgNT8Rgks9wIuJ/IlbjZyX3LJ6lR10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 10:00:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
Message-ID: <YmubOeYPqW5mBNy4@Air-de-Roger>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
X-ClientProxiedBy: MR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25cda98d-e31e-4e73-7f81-08da29b666ff
X-MS-TrafficTypeDiagnostic: MN2PR03MB4990:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB49907C4DDA5328C6613C79D18FFC9@MN2PR03MB4990.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HbAAQTqLMjalbFKBlRFN79Aplm7/p04kHuTBLCHo5Bk11p5iecOuC89CNwESDunTHBsek9+4Cpbj5VIKOjeTh5p309zwfbPn4omtILV00+pfLMn5ICfLmgxw9BiEiDvIxmn5JT07M3+xubuEeO4VeFJK4gJ6lE/hXS8nJc/QDZWxfO7Lv41an1kl//poR6xBXfP1h59HauxG+gSXLR7LtZ2IltXkIAYwLVb+FggD6ZSXavCoqY8/ZkkrVHydVGCpZv9K4WkdjFoh7UGwE+tD2TLoJlY0R/5yMrTREUzBfUfawWB5R1sMN8M60Fr0u93zSaExVgswitP7rCJsXqaPYA/Bynpz0tYzOv2EuUvsWkVDa7/Ns64ZCr9CrPPvgiieRl9h3R8W5sIuy5qd+eSlonOmp0UwhO8yVgBbMiVbR7V6GAp8rV2tfHDRRfJTstgxKBKKfiztCzVbB1WjXAMgU1JG4rZRIyI7UvlEKz/ZEhppFh3zYFTBhsW4PYPO4ksIwaRTVz6xk+3+eH06kPRdZNnzBd/ufjTNXyY0oe7Esmsa4tpKByy9s62gn8S2SbaAl/RwmkDZmQN4Xxl3+qpq1BLIV/a0BJltKQHoqm1Dtag4YEQHq6U3O9J/PS4xkIVZ7sbo/cr6gAFfmBSa/9dJ3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(6666004)(85182001)(8676002)(33716001)(4326008)(66556008)(66476007)(5660300002)(66946007)(508600001)(82960400001)(8936002)(6486002)(6916009)(2906002)(83380400001)(38100700002)(86362001)(316002)(9686003)(6512007)(26005)(54906003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ci9mdUIxV1Z4RnAyb2tvMUtOT2hPNmVOUjNiYm5ZdTk5WDU1MWdybUREK3J3?=
 =?utf-8?B?bSsvQUNkNS9OaDcxclBERkRFTHVPcUtHYmR0b3d3T3ZxcGdNWVlUMTJHMXky?=
 =?utf-8?B?SWladzVNQVVwSGZPS3k0UHlVNVlyY3dxUTNtV3o2WnJmRXp2REFCbERXWTVz?=
 =?utf-8?B?QjN5eG80UDVXL1FqQzhCTU92eXRmSGFYejhNbXRBT1l2aHd1Q21INC9wWS95?=
 =?utf-8?B?QWIxdzRucE5RUlhKUWFWVkJsbGp0YjhiUW1JMW5GNkovNExEbkhJUHRSMGlv?=
 =?utf-8?B?dnBJMnkwb1ZrTCs3QUNNZDN5YXZuQXhIbzlWWllGK1BXL2QwSWt3dWloa1gy?=
 =?utf-8?B?UHhiTmJiSU8xZlFQaFlrRzRTc2VpZnZQTXZLeDBGMUY1UlRYVytJbjhpT1Jt?=
 =?utf-8?B?NTJqZVgrbmNWRTlwY3gvTGVWZ0FQOXFzeDlmb3JMLytBTUgzOWErUTU2Zlc2?=
 =?utf-8?B?aWhnZ2svVWJiMkhqT2YyY01pckorSEFOVTlZeW1ncldQYVE2L1VzTVYvU2g2?=
 =?utf-8?B?bGN1cFBrejRKN1IrZ3JSb0hvS2k1NlQ1eGhCWXRJVVJsOFpJTUxBLzh2K3Nl?=
 =?utf-8?B?MlJTS29Od1dzL0JwUG5tMjdJb29CbTRITVZUbndNSmljOUU0bTFKQ3ZQcFlN?=
 =?utf-8?B?Y3NmWWpNUmFQUCtFckFibHEzUEZVcWd5TzY4cW8wZk84cnNXUjZLelo2Znl5?=
 =?utf-8?B?U0w2dzVoc3RJR0xQREtZZkZJNGsySGpackJnWEFNU1IyY3dKZDZpV1VlV0Fz?=
 =?utf-8?B?VDZ5eFNuMk45Z3RpT2d4cm14ejZMV2hhdWFhbng2NUJCQUxlZzYwZHk5SnFV?=
 =?utf-8?B?bWFWU1N3L2dxNzhjTDYzaVp0bVF6MU93RXU0MUlBVnpzanRnTWd0R24wdFAr?=
 =?utf-8?B?SjlLM3N1dk93aHJ2dHU3MjBSQmZxOFBXWHYxSjRmazRuZHNpai9ET004Q3Ji?=
 =?utf-8?B?dVNmL24vUEtNZUdxeHMzUVlIRWFOb3Q5NVd2cHVPVGozRHpZd094ZS93aDcw?=
 =?utf-8?B?akJXU2ppSGNzQSswRUhGcndQMlhPeDFvUWZSMERjbVMwTVpERFZCcXJBd3h1?=
 =?utf-8?B?UVVnYnZhZ2crV2FIYWtSQmllTXhHUXhjK1hwQTF2UWZENE54QzlnSXVGdTQ4?=
 =?utf-8?B?SmlNNCtzcVMyM2RNRXNQZURyYWJqcThrL1d3L2RqazhyeW1PWStIRGZTR0VV?=
 =?utf-8?B?cHVManFrb09FKzNQbEdwVDJZYTgyTmlRWTVmMmlzYTBQUU5qRHdVZlZKVmM2?=
 =?utf-8?B?bW96REZUUVR0VjZPSmFJZmx5YzhZU1F2a0hXRm5Td3h6Q0p5WVNjdlhVVHpX?=
 =?utf-8?B?ak41T1J3R1JYRm1yNXRhVGw0RHU1R3VlRzg5VEpTM05TNnJRWlUzVytRa2Ir?=
 =?utf-8?B?U25QYUQ5akhxTytwQXZTOXZsaFVDUVZBalZvaFRJZ2dtRm5YcWgxS2psSW1O?=
 =?utf-8?B?UjVOZkIxRnd1OE5Sd21HOGlRY2JnQ0JVUHIrYjZGQThTbjJMS2t5SllwSGdK?=
 =?utf-8?B?bUpnMGlOY0pjTFIrUHAvVXN3bmdnRVVvY0ZpNDh4TDhVc1FlMDlRbjVpcXQx?=
 =?utf-8?B?anM3SzExOVI4YzEzbWw0d1g2QTM5K2ZBVXNRNnRuZ2dGNEJTVG40L2I3K1NU?=
 =?utf-8?B?WUcrUC9yYU5Ud1NOQUFtNUhpTGNXOXRNTUFIM09UWGp5ZlNseEptOUxyMHhB?=
 =?utf-8?B?QjZINUhSa2RsMHUxeXpwT2dacm1EUXVWRUpYbWk2VWlUdHpoY20vMjVPMTRn?=
 =?utf-8?B?dDNuTWxHSklOUlFtQ3YvMGcybWU2SzJWaUJFUERadFQvOHB4QVdrU3Q0SzZl?=
 =?utf-8?B?RkRrS3VqbHBDSzhYb0Fkb0JQa1RDSmUzQUVYN3dNWDNNMng1Sm5WdmQ4Wm93?=
 =?utf-8?B?VnpzclRXMS8xSTI2SGNuTUtUU1JrV3VVVGlJTWo1UlVzM05tMnplTHZ6T0py?=
 =?utf-8?B?V3c2cE04Y0V4anhTTkRMWnFHaTNkV2ZrNXhmdGlNQXBIVmhOUTBmZmI1R2ZE?=
 =?utf-8?B?Mnc5Skd4RlpXRks1S0VRSTVaUVZKemRlOFlVNXVITDJVenBJL2RaR3VCUSt1?=
 =?utf-8?B?eGJTSHhkM21sdHJwR1BsSDJtNERuV1Fkd2FvRzNGQWVlOHE3NEVxblVTYTRl?=
 =?utf-8?B?SWRsZ2YzZmRUR29kNjRrYXNJOERUQlFqREpVTGgwQ2RBN2ZVQVk3VUFzdWFq?=
 =?utf-8?B?TEcrU2lVSWJDdGh4eGpEMGNxcks5RUh1MlIvT0QrcDV4aG1lQW1jYklYaHc3?=
 =?utf-8?B?OUxOV1J5dGJHcXU2d3p5OXYxcEN0ME4zRG9OVVZHd0tRMUhNT2dTY3NQUWVo?=
 =?utf-8?B?ajJma2M4U1hRQU9NaDVwZmZvWWEvUGpQL1kwOEVOQXVsc1lldGZuMlZ1SzIw?=
 =?utf-8?Q?SIgHsoBxkhqFm5Y0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cda98d-e31e-4e73-7f81-08da29b666ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 08:01:01.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWkLmOCV2txPKZOyZACCvLWZtKde3egO/DBipo1YVIJkxPmHfLFuwvfyeZ1DA1+Akt75hpYZLokxIUg3scfK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990

On Thu, Apr 28, 2022 at 05:53:17PM +0200, Jan Beulich wrote:
> Hello,
> 
> in the course of analyzing the i915 driver causing boot to fail in
> Linux 5.18 I found that Linux, for all the years, has been running
> in PV mode as if PAT was (mostly) disabled. This is a result of
> them tying PAT initialization to MTRR initialization, while we
> offer PAT but not MTRR in CPUID output. This was different before
> our moving to CPU featuresets, and as such one could view this
> behavior as a regression from that change.
> 
> The first question here is whether not exposing MTRR as a feature
> was really intended, in particular also for PV Dom0. The XenoLinux
> kernel and its forward ports did make use of XENPF_*_memtype to
> deal with MTRRs. That's functionality which (maybe for a good
> reason) never made it into the pvops kernel. Note that PVH Dom0
> does have access to the original settings, as the host values are
> used as initial state there.
> 
> The next question would be how we could go about improving the
> situation. For the particular issue in 5.18 I've found a relatively
> simple solution [1] (which also looks to help graphics performance
> on other systems, according to my initial observations with using
> the change), albeit its simplicity likely means it either is wrong
> in some way, or might not be liked for looking hacky and/or abusive.

I wonder whether the patch needs to be limited to the CPUID Hypervisor
bit being present.  If the PAT MSR is readable and returns a value !=
0 then PAT should be available?

I guess we should instead check that the current PAT value matches
what Linux expects, before declaring PAT enabled?

Note there's already a comment in init_cache_modes that refers to Xen
in the check for PAT CPUID bit.  We might want to expand that comment
(or add one to the new check you are adding).

Thanks, Roger.

