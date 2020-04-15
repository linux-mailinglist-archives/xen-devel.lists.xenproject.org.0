Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF101AA915
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiU9-0006Qw-Cp; Wed, 15 Apr 2020 13:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zknx=57=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jOiU7-0006Qr-7A
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:53:47 +0000
X-Inumbo-ID: 867f6f86-7f20-11ea-9e09-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 867f6f86-7f20-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 13:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0XloKhgyJoYarf3pKXfViHYCKrm6pcVE0QvsgFpnAgqArVWjgnZYVVuWwkG3HJ3i3BKBQUO1qdbhT7+6rtSzLgH8O5N93IBfR7zMpOYEO+dL+/jBhKyQd3kBxmXRpjh/hAVIc05rWSP8HXfcDE4m1rwdP7FRZH0OPPC3x4LJaJaPJvjVL1Nfed/7vVTAU7fNLNT3ShX/koVubgxXfmqbwlVYo6Y3SGKLon3JgMJj+8IoqDghfhsPLDdXnromMPAHqqLwYTXkgaj5Y2WjcURQpeke7QOu4X/NvGHM+E+zZR+q9MFFlcZwUdjGywXpVkMW1+zMLN9i57BZwMZoGsv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4180LYiPiOhhVr+svEZcXnmuH9MBiizU+Mi/jYhOP74=;
 b=KuZTbROSOCA64djSqvEs3GMAgzzoYkFsb895+IHKOQT9Ns0k8hmjyCvhR0mrZycy2jKHrqTuULnZpLikYMIvHKClkLwAJFVCkZMD5kZA7es6Fuqf/XBaNCnIb8TBk67TcVs2m4N8k9jxLImCkKtFbXdPaPJeCSlgI0VfHrrn1mzYZPpTT5LCotcjiiii/SBWnjP3lCw1zsRwvMX+q92VpMs81jP8MP8VjQiVJP6t11luQn4cmpbqpCRRmQDuaABTKq1C9c5E0P12HNuudnpo96PHGzb/4XGewwftp7UuQRuEbXufEhIDsTUvBFPUTvbsWYBZ0ifzdfzVIhGhhIle3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4180LYiPiOhhVr+svEZcXnmuH9MBiizU+Mi/jYhOP74=;
 b=H4uOaUXN30iKSOoUvGM0mMbNJsKTvv1cazs2v1k6lKGq5DawUFA+Fa9R4FHQcCJrNkNg8mmwoBMZgm1/NhE6W2SIoFTkjUChqqp0gt5y+f2D+nVM4zG26k9hhdIB0jJsRHrV3TcZGuXkP/LrMNXLygLAJ7DjOmwhe/TS3HoSAd8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB5496.eurprd02.prod.outlook.com (2603:10a6:20b:ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 13:53:44 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 13:53:44 +0000
From: Alexandru Isaila <aisaila@bitdefender.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH V1] Fix for Coverity ID: 1461759
Date: Wed, 15 Apr 2020 16:53:13 +0300
Message-Id: <20200415135313.12886-1-aisaila@bitdefender.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (82.77.232.39) by
 VI1PR09CA0157.eurprd09.prod.outlook.com (2603:10a6:800:120::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 13:53:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [82.77.232.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a70daa8-9878-419f-2ccc-08d7e144695b
X-MS-TrafficTypeDiagnostic: AM6PR02MB5496:|AM6PR02MB5496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR02MB549612352EB90AB1171FC6A6ABDB0@AM6PR02MB5496.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(376002)(136003)(39860400002)(396003)(366004)(8936002)(2906002)(66556008)(66476007)(66946007)(1076003)(86362001)(478600001)(52116002)(316002)(26005)(4326008)(8676002)(186003)(16526019)(5660300002)(6666004)(4744005)(81156014)(36756003)(6486002)(2616005)(956004)(6506007)(6512007)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1xtp3QEfY3uAG6MwGkbfxBCngqN2nkiR5ObGaE9EM5CNoxnkE58cGAEdwjNf+A2i5OkKIzmEFpFVHLu4FPcsyYSokWtZJUQ9N/DxSuJ1fxgi9vae0vuRm78fdYOi/A+BJNTuOQipcEdzP0UFZB38PO8VWqMTAjFJUC4FJ01BhS5pak5gMkJeudpGRxI1hM2jE4hEx1VjiaYy0oBM2pk5Je/0n9yXZyp0c1fBDv1jeFonVAfl73yCoP1O5ONpLtyiHTCiryKrLwPSSETzxifa8DzPdjTA3UbPepGRAWtSZYCDrOxDPj+X7tO7QIidtvYqe4SHlgce43siZmtm7V4yEeTliDLHZ7yEkZNVc0bXfIaNHIP2FgbayYZmiOHTiMSljXqYQuABuOn8DHUomPFAoQe5jzgVfNIy3mxVRiZdhkGl59dA4wggVCJwhEKspJE
X-MS-Exchange-AntiSpam-MessageData: 38QS8tS6cMnqb72f5YysB9IVRCjs2l6Umc65OXWXBLFSzHhQw9cL4csZj6B9y++k7cwbtWIelYKehlLZXyYxcHXz/sMIxb1tUlpM9AbtlucNSlb/8PdhidyySfnKyepZAQU82rSOWyhB+r/YA2Dhhg==
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a70daa8-9878-419f-2ccc-08d7e144695b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 13:53:44.0151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+GFwz0q2nq3uQnlACAMx/8gvPOWQq2VKHtvovAAbOZJpFcHwDTybe8t1mCYgzVsqt+ifSffKIS1T0kWafr7RElSB5H88wvr0/1TUfSLEGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5496
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>

---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6f6f3f73a8..45959d3412 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4798,6 +4798,7 @@ static int do_altp2m_op(
         else
             rc = p2m_set_altp2m_view_visibility(d, idx,
                                                 a.u.set_visibility.visible);
+        break;
     }
 
     default:
-- 
2.17.1


