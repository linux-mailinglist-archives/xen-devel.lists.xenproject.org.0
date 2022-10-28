Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF3611001
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431985.684672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrz-000109-Al; Fri, 28 Oct 2022 11:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431985.684672; Fri, 28 Oct 2022 11:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrz-0000wQ-46; Fri, 28 Oct 2022 11:49:51 +0000
Received: by outflank-mailman (input) for mailman id 431985;
 Fri, 28 Oct 2022 11:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jk72=25=citrix.com=prvs=293452418=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ooNrw-0000Hb-Ol
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:49:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3b40e5-56b6-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 13:49:47 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 07:49:41 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5103.namprd03.prod.outlook.com (2603:10b6:208:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:49:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:49:39 +0000
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
X-Inumbo-ID: 9e3b40e5-56b6-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666957787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UzpYOEF47yweIqsogyxeHkQxw0+cB1pK+4B0T/d6abY=;
  b=R3/Om3Fuycf7wcReYv1g5PZwuRp1I4Z/0kaeO7X3nrG/gcvTxUob2fpa
   Vepw76AgCJctNwssB06/+Kw0sTF/jShth8A2BK1nhzmSK/+CpK5sxoukr
   WstccH7b/ACUkj4TL6Wr7WQPk9H8tDBjqmemai8w8dTXbkUBlg1RBjvgq
   Y=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 83317456
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TOAW9qDCfcN7SxVW//Liw5YqxClBgxIJ4kV8jS/XYbTApDsm1mQFn
 zdJX2yEP/zbYDGkf40iOt++9R4BvMSEyIdlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw479wAiJH8
 r8jNG4mVBCOvsKH7Lm5Y7w57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuuzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqSn12bOSw0sXXqobEZ2h2vN7umSr6W0DWD9Pe16xpum23xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJmUCVC8HV9Ugu+c/Xzls3
 ViM9/vrDzFytLyeSVqG66yZ6zi1PEA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pdEP/7W2+xbAmT3Em3TSZgs85wGSW33/6Ap8Pdahf9bxsQGd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:FpzfZKyS+ccJyBw5jC/sKrPxw+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHfuLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9Q1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr36tuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4DmE/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqS12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pUVFZol/1SwKppKuZOIMqjg7pXXt
 WGTfusrMq+SGnqIkww5QJUsZ2RtndaJGb3fqFNgL3U79FspgEG86Ip/r1iop4+zuNDd3A93Z
 WjDk1JrsA9ciZEV9MJOM4xBe2KN0fqfTXgdEqvHHWPLtB3B5uKke+/3IkI
X-IronPort-AV: E=Sophos;i="5.95,221,1661832000"; 
   d="scan'208";a="83317456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3728W8c6e4zdwg5TvAy+XBrHFvvTXudLmfzEK39LoOOkQr/tL1ttsWO2D8RK1SdXuwQosFUKjzapC+j5jI3iyTyAymTcbsko0Ge5LVXFMMXedRYgWjpYHeoZ1P4UMBFD6a38rWis+CAt8yTQzoLOTBcDXXbwV/d/jjVSTqvWYVSiStQXbT5Hn7HLOiVG60FhOsCKYInZdZyMShYRvPj+XPdCbkNlDojDm+hXl5KSydbbor2c5Kc4PN7OAgmcpp/D0YOYlMkANy++nMSjWQo8n14LOPVoN0QYHfx5UgkODRCXLTbTYDcpk1/HQ8oRG7yDIEDzglwm5KzYnvi8gln+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FD4zSusDD1nx/omYRwRbRuVZQkclT2SS5Qqf4UzDyE=;
 b=jcQBGFlnA79XbTT/tLrOOhXAd6HO0Xz1/UGMKGW8Wf7M5MPk9mo02R0PB3TSMVg5FVtCxxGjDsY+DO4FR7aZACbu4oNI+0WeOvu5AzyV93tKYoOjF8/JGQtfCeYQIWeRQTmxIFmM9kjBZMFwnOf5umXO0uudtzIIR2oQtaNJb4yhD4KoBxie8I2VtgXivhlNBS34AKa7I6h2o1fwlsQwp5qDWfzl/iDzngfd6vog22pTNZRLkbDP4LvmUv/6XDl0kwSUA98+cEsVATuklQ6klkwD9fSU3GJjRUt/chTEeDGEvLnv8zaNYWRk8KuOigM5+TzV8VrJ8wgayZTm2kjZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FD4zSusDD1nx/omYRwRbRuVZQkclT2SS5Qqf4UzDyE=;
 b=Vgotu/ZsLOxB27Dlb48OtpBNUyuaMTchtYfVW+WFPSySyXj4dTKKO8rF2bJr9Wm5brqoUjLX2WOr0xcJaTlNrZFM14b+Bzh1V4vV7ogOhaRnjJz2amvaGdgLsSC0RzFqoTvtHPrayZAuEFEL57g0SNttLrit6Otj/jSjb+FKGoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v2 2/3] amd/virt_ssbd: set SSBD at vCPU context switch
Date: Fri, 28 Oct 2022 13:49:12 +0200
Message-Id: <20221028114913.88921-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028114913.88921-1-roger.pau@citrix.com>
References: <20221028114913.88921-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::28) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c47ed17-b03f-4800-fb4c-08dab8da7e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XkUWIIMFrbLm8OFjE+NTuzvCyCdDMPTGLUUky+5PZHrlU4kI4BCiYI08ZuNS5CazgAg1La9z5zaRtEferIckDD+GJUqlNA3X1A+lLQBQvki1gwaPeGQ9XPNoVPTXO9ZXSWzdpuH4N0xWb6xThdw6X8p38gNjSWFQRC1twvudB5y8YVr5MSKWph882JFHW2KX4+F7a/3olAUey4603g6afOqx5+DEMZ7oJ7RytlbUtT5tDmpJsisku2wX9kpIj/cdu4JgEanWULoyijGxAH2wV8+mLj3PlKs3aa1XppGeIM5nwa2iGnJLe/N4aHCqesyuc660LrmoL34V4ycmzmz5BPEDVSWQZu0yxYa3Vw8CC/nFGo5Iz1mXqJ55YFyAUsthVWJYmYSwndtqSMdylZXzsy1bU66i/MRtu2k9Oj8SI3l61koH1AUiyp+pGFi50Twj7FkdNjvqwuNJFG5qmw3zH/G1l6x1xZzxG+cWI5wi8EtNeMhWDi5oy/LegqlDls3TjxMjvBBIN9ZM4Do3jiA6kp/2QOaVJ/pjnyopWCIoMLsAE9Clvr3f9bffo87fMPT9JSFHs5ndcM3AhnF01RZT1Olw82YwENp5JEHfaHNzhuRly7pIDA6s+22xDoDl0p7+PZW76WnlXGF4+pYYi7eWzaOwHGMoEB4KYAhyA5aTUd7pSwbSnPN0NPVhLSnOV5Y1+A52Cazk9FiKeBSRKByqPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199015)(1076003)(2616005)(83380400001)(6916009)(316002)(54906003)(186003)(36756003)(26005)(6512007)(6506007)(86362001)(38100700002)(4326008)(8676002)(2906002)(66556008)(66476007)(66946007)(8936002)(82960400001)(41300700001)(5660300002)(6486002)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wlc4YVRicTFleE5UNGtHVHQ5SHRoSmN3YUMwaTZaSVpocUovdERvL24ybFdD?=
 =?utf-8?B?d0k3Z1krS1h2cTdKaytCZjlac0oraWt6L2t1eEdDM2RlTWlCOUpTOVZjUkFq?=
 =?utf-8?B?M0xFWUZ2M0lqUG1yQjJxcWFqTGNOKzJZQVAyWm83dmZJbmRFdUpKMmh2dFV6?=
 =?utf-8?B?TUVwSTRzWlhxaFZqZGNESEx0WEVSWlA3SGFscWlxMGNmYzhDMDVYQUJDMmZa?=
 =?utf-8?B?T3g2QXRXM3VVODlkRkRuNWZBU1JETXVRSG1sa0xPazRuYW1Pc1AzeW5WYWRy?=
 =?utf-8?B?cXg0VWVxVUNudEdmSUk0MW4yNERZYUE3cHZWY2R0MTRXTi9ycVhad2tlRzRu?=
 =?utf-8?B?QUMxdDZheUdqVDVBWk1GSTI5aVNyYU9BRGFYc0hVR05nc0hmNktFblcvbmJB?=
 =?utf-8?B?bmxTMnRHVVpxMXhaMkFXaWxJNXIvc0MybDNlV2s2R0RWS003UlhNb01YUHN5?=
 =?utf-8?B?ZEI3OTRjbUVteTBiNWxOUEJZKzJVSFJnRjkvcS9iVldIREc5SXNReUFpS3JE?=
 =?utf-8?B?d3QzUFcyUlhQdStzK2hxWnBxcmRVVTVjbVJGTTZ2TXJrM3NIUEVHdWVaYTYw?=
 =?utf-8?B?OVhIdXJuckcrY29mSFFCVUxORjVNWW1YNmh0UUFtQkZmUmRmcEN2VHR4VUlw?=
 =?utf-8?B?M0NXeEt3QmIwekY4YWtCN2lzWVBDQ2d2RXVxODZpTGkxYlFPWnQvR0NWVHF3?=
 =?utf-8?B?d0FvRDJnbVB3eFFDYWxJaXlrd1I0aWNZOSthbGVXNUs1QklFaTNBSm5HRmtR?=
 =?utf-8?B?RDd0N2dPL0ZnaUNyaGZuZnNMSFljVDl5K3lyVjhxVWg3NzJ3eFU3VlpPNzRP?=
 =?utf-8?B?Um9sS0dUNmNMNGtjQ3lyWEF6aE1kMFNIY3Vsby9HdTc4SnRtSlZjcWNmTkls?=
 =?utf-8?B?QVdlQTl3OEY5M1huQ3hnRTVEM0g3Y01FeElqWjV4RkVXR1FYUUFyazlMQThi?=
 =?utf-8?B?V1hkTzJyK2VpQXpxQXhYLzh4MDlJZk42bTNoMlYxbllsdGFPcXkvalBtUXFB?=
 =?utf-8?B?a08rdTFHSUJibmh3ZEF4eTdDeW5laHk1OEpWSmFlSW5hUVcvS1JFZ0puM2th?=
 =?utf-8?B?d1FQeUUvNlhQSGNvYXVVaEFDeGZ0Y1VMTFZxb1pqd1B4Vko5c0hHS3hTcUFm?=
 =?utf-8?B?NHZUOG9tekVocUh5S3RhNjgxV3JIK1ExbmJ6MzIrTDM4WWF5allqYXRBRVFF?=
 =?utf-8?B?V3VYMUJPbzZzUThQZ2N6NTRxZ1MvNEdiTUd5RHc4Um1ma25BNUUxbERsRDM1?=
 =?utf-8?B?WFZMdDJDUjkxaTYwQnFicVc4UzJ1VTRQdXZSUkJDdWttYlNRdGdQTWd2emRm?=
 =?utf-8?B?Q0JxSGlMbzNTRmFScDhIQVJyQ05XajFpK0FacHR5MldCcEIyNTZOUkNNbjFu?=
 =?utf-8?B?Z3J1cUFpdmUvV25hOHEvcWtSVjV0UkNmanMyaXRLcGx6d2VhRmt1NlNkMFU2?=
 =?utf-8?B?L3BnWWU2ZXc3U1FGZENwYWtKcDh5WE5pMjZRbWVSTDdIM28yZDM5NnNBRVJ4?=
 =?utf-8?B?Z0kvOW1KTFEwV2RsWVBnL2IxVzE1bEJyL3RnWTNQaGlLaWMwQzFUY1NmWWZt?=
 =?utf-8?B?YlVWOEFtQzBIVnNDZ3hyU3U2dVBRb3A2aGJNcFhwUFZDVEpGM3h5bndNcW1r?=
 =?utf-8?B?NE9yYmlrQ1RSZHlUNXFqWmpoS0k5M0RMNThFQi92YlFzcFg5MDRiRWZhOUFP?=
 =?utf-8?B?MUNtZVFxSTlHbEZwUjhZQTN1TzlpZVNiYWRScXVTNzZZaHVjOTZNQ3RzUHhH?=
 =?utf-8?B?OCtkWXhNTldvQnJQTCthdkdka3dYSWdnbjJ6a1BuNlh3TUFjNHdrSzhiNWNm?=
 =?utf-8?B?bTJLdzFZdXJVTWhJb3RKV2ZjUXk1ZHRFOWdHVHRzZmhNeDZtb2tHZWwrNFpD?=
 =?utf-8?B?THJCL21UM0ttSkY5UmFHK1FhSHRoblFmN2ZNM1ZHZGJUYVM4Y0doSFlOdVNE?=
 =?utf-8?B?akoxSDlLa2k2NnpZNytsRjZOZ2JwdGJqNTV2dkFRNmc5TjRKZXJzNWFwQkwx?=
 =?utf-8?B?MVkwVk1IWVl2akxwSGRvYS9HYUloN3JYQ1ZYdW9WZlJWb0V1U2I5M2FPZWVR?=
 =?utf-8?B?TUJESGV0ZjNyODZsQ1htQkF6SGxWbjRERmphaTVRK3FFZCt3cFBqZjFRQ1d6?=
 =?utf-8?Q?biPAeLuwkR2uTKsQGQ+SdSvbZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c47ed17-b03f-4800-fb4c-08dab8da7e53
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:49:38.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3Vmqcc0Le3VE9P3WBYbzMN7KQHz7QnvLHego56+l5U1zfURG4TCDs4hEPV/jI9GcVj90x8oXXaPMrYnTwbSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5103

The current logic for AMD SSBD context switches it on every
vm{entry,exit} if the Xen and guest selections don't match.  This is
expensive when not using SPEC_CTRL, and hence should be avoided as
much as possible.

When SSBD is not being set from SPEC_CTRL on AMD don't context switch
at vm{entry,exit} and instead only context switch SSBD when switching
vCPUs.  This has the side effect of running Xen code with the guest
selection of SSBD, the documentation is updated to note this behavior.
Also note that then when `ssbd` is selected on the command line guest
SSBD selection will not have an effect, and the hypervisor will run
with SSBD unconditionally enabled when not using SPEC_CTRL itself.

This fixes an issue with running C code in a GIF=0 region, that's
problematic when using UBSAN or other instrumentation techniques.

As a result of no longer running the code to set SSBD in a GIF=0
region the locking of amd_set_legacy_ssbd() can be done using normal
spinlocks, and some more checks can be added to assure it works as
intended.

Finally it's also worth noticing that since the guest SSBD selection
is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
propagate the value to the hardware as part of handling the wrmsr.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Just check virt_spec_ctrl value != 0 on context switch.
 - Remove stray asm newline.
 - Use val in svm_set_reg().
 - Fix style in amd.c.
 - Do not clear ssbd
---
 docs/misc/xen-command-line.pandoc | 10 +++---
 xen/arch/x86/cpu/amd.c            | 55 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/entry.S      |  6 ----
 xen/arch/x86/hvm/svm/svm.c        | 49 ++++++++++++---------------
 xen/arch/x86/include/asm/amd.h    |  2 +-
 xen/arch/x86/msr.c                |  7 ++++
 6 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0fbdcb574f..424b12cfb2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2372,10 +2372,12 @@ By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
 when hardware hints recommend using it as a blanket setting.
 
 On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
-option can be used to force or prevent Xen using the feature itself.  On AMD
-hardware, this is a global option applied at boot, and not virtualised for
-guest use.  On Intel hardware, the feature is virtualised for guests,
-independently of Xen's choice of setting.
+option can be used to force or prevent Xen using the feature itself.  The
+feature is virtualised for guests, independently of Xen's choice of setting.
+On AMD hardware, disabling Xen SSBD usage on the command line (`ssbd=0` which
+is the default value) can lead to Xen running with the guest SSBD selection
+depending on hardware support, on the same hardware setting `ssbd=1` will
+result in SSBD always being enabled, regardless of guest choice.
 
 On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
 option can be used to force or prevent Xen using the feature itself.  By
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 98c52d0686..05d72c6501 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -742,7 +742,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 }
 
 static struct ssbd_ls_cfg {
-    bool locked;
+    spinlock_t lock;
     unsigned int count;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
@@ -753,7 +753,7 @@ bool __init amd_setup_legacy_ssbd(void)
 	unsigned int i;
 
 	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
-	    boot_cpu_data.x86_num_siblings <= 1)
+	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
 	/*
@@ -776,46 +776,51 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	if (opt_ssbd)
-		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
-			/* Set initial state, applies to any (hotplug) CPU. */
-			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+		spin_lock_init(&ssbd_ls_cfg[i].lock);
 
 	return true;
 }
 
-/*
- * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
- * that relies on exceptions as those are not expected to run in GIF==0
- * context.
- */
-void amd_set_legacy_ssbd(bool enable)
+static void core_set_legacy_ssbd(bool enable)
 {
 	const struct cpuinfo_x86 *c = &current_cpu_data;
 	struct ssbd_ls_cfg *status;
+	unsigned long flags;
 
 	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
-		set_legacy_ssbd(c, enable);
+		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
 
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
 	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
 	                      c->cpu_core_id];
 
-	/*
-	 * Open code a very simple spinlock: this function is used with GIF==0
-	 * and different IF values, so would trigger the checklock detector.
-	 * Instead of trying to workaround the detector, use a very simple lock
-	 * implementation: it's better to reduce the amount of code executed
-	 * with GIF==0.
-	 */
-	while (test_and_set_bool(status->locked))
-		cpu_relax();
+	spin_lock_irqsave(&status->lock, flags);
 	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
 	if (enable ? status->count == 1 : !status->count)
-		set_legacy_ssbd(c, enable);
-	barrier();
-	write_atomic(&status->locked, false);
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&status->lock, flags);
+}
+
+void amd_set_ssbd(bool enable)
+{
+	if (opt_ssbd)
+		/*
+		 * Ignore attempts to turn off SSBD, it's hardcoded on the
+		 * command line.
+		 */
+		return;
+
+	if (cpu_has_virt_ssbd)
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+	else if (amd_legacy_ssbd)
+		core_set_legacy_ssbd(enable);
+	else
+		ASSERT_UNREACHABLE();
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a26589aa9a..981cd82e7c 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,9 +59,6 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
-        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -131,9 +128,6 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /*
          * STGI is executed unconditionally, and is sufficiently serialising
          * to safely resolve any Spectre-v1 concerns in the above logic.
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1aeaabcb13..b2f147c11b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
     /* Resume use of ISTs now that the host TR is reinstated. */
     enable_each_ist(idt_tables[cpu]);
+
+    /*
+     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
+     * is already cleared by svm_vmexit_spec_ctrl.
+     */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(false);
+    }
 }
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
@@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    /* Load SSBD if set by the guest. */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(true);
+    }
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -2518,6 +2535,10 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         vmcb->spec_ctrl = val;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        amd_set_ssbd(val & SPEC_CTRL_SSBD);
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
@@ -3116,34 +3137,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
-/* Called with GIF=0. */
-void vmexit_virt_spec_ctrl(void)
-{
-    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
-
-    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
-/* Called with GIF=0. */
-void vmentry_virt_spec_ctrl(void)
-{
-    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
-
-    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 6a42f68542..81ed71710f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -153,6 +153,6 @@ void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
 bool amd_setup_legacy_ssbd(void);
-void amd_set_legacy_ssbd(bool enable);
+void amd_set_ssbd(bool enable);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 95416995a5..a4c28879bc 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -697,7 +697,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                 msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
         }
         else
+        {
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+            /*
+             * Propagate the value to hardware, as it won't be context switched
+             * on vmentry.
+             */
+            goto set_reg;
+        }
         break;
 
     case MSR_AMD64_DE_CFG:
-- 
2.37.3


