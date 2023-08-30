Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5878D7EE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 20:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593234.926194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPd6-0001c8-TX; Wed, 30 Aug 2023 18:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593234.926194; Wed, 30 Aug 2023 18:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPd6-0001Zh-Qh; Wed, 30 Aug 2023 18:09:24 +0000
Received: by outflank-mailman (input) for mailman id 593234;
 Wed, 30 Aug 2023 18:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbPd4-0001ZL-MH
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 18:09:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 560c40ad-4760-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 20:09:19 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 14:09:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7122.namprd03.prod.outlook.com (2603:10b6:806:338::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 18:09:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 18:09:13 +0000
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
X-Inumbo-ID: 560c40ad-4760-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693418959;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=18C9mQ3oPcOZLlKEWF87W2U1jA7o7oOhgi57VFTQ4+0=;
  b=LffmSZ9kwghZmNbBaNBt1mTBVlu5MU5sZPVRg/R2l9nwvf4g3gIqrkLs
   h3y3yh3eQG/ZOSgFZu7eyjAxtmhSRnR/jdKXNvOF/+ilZXAxg/XRU3IFW
   LuhkI51yOoJFfDyhF/wUTR0QubTj8Kx0e6cJFXnVKDIyosDT2oePqo0uM
   Q=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 121584895
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+MEv3qiizrZOMdFxmZhc9PauX161fhEKZh0ujC45NGQN5FlHY01je
 htvXm+FafiJajenf9l1O47l9U9UsJHWn9VlTQo4/i09Ei4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7ASGzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tREGRoUQi+koNjszbvjDc4vreAKEvL0adZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluSwWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuTlpqI60QD7Kmo7BwAaUAXjpeSCuFekAfVmN
 0hI8yt0lP1nnKCsZpynN/Gim1amlBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGMHPikNSFNf58G5+N1uyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:AowHj6xUIob/P1oVksYzKrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxedZjLcKqweKJ8SUzJ8+6U
 4PSchD4abLfD9HZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-Talos-CUID: 9a23:JJoWJG9Q4G2Gb99RKKWVvxIlMNkJTVr69i3dKhf/LiVCbJSrckDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A/dYD/A6J6zm0VbDL8lxRF76rxoxn/qirVhgJjK4?=
 =?us-ascii?q?0otPeEhVsP2uUjW6OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,214,1688443200"; 
   d="scan'208";a="121584895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDoE0z0SGK7oGbbeNuaaXgQxojbTySmFH/rlMh/G/Gm+DCBT29jNtYJ62C+sTQfY4SrZ13BxnZmb9n4TFbUnGQsY+CCrzRRL+/cQmdXuS+f1IxJcMk/ggKQVbSZ47Qa8thWGBj5TS8A0vZ9QyB0ih6Y8jHfO3vt+ir/Rv1ZdM1hcZmLr0X2UGKNNGfqvsW1BtEiY96rtvEUuB0EfBnRRPGzaFiD5DHgO38bFEA1sOkqkiAaSLqXCPEOU3oyVx9tkp19CPZFYFY0Gy+Aj8+jZ6VK2u4+h0abJb8aNJhOD7GudmdqqGseiYkpwUSjOC3uS5CFbjVsxG6+0IEGyyZLDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18C9mQ3oPcOZLlKEWF87W2U1jA7o7oOhgi57VFTQ4+0=;
 b=VzNtugEH3299YSp+2P14KPSIADUcnO2i9dfc2jVRCvqTK5D+vVKWkhDThvrcG+WS/UItKWMm45BfZCJxDWDQeA5dYx1WYhYgbfbiynHr8+daZR+Qp2dpMWaMIIUHygUQYR+n/tLo5cG3c83p0fvnktpTbgUCn5dHlvbYhmDLb62Z5RZQau7q+yF0P8TuNLluOZW1cFKqRFsCQ/fkIIgLyZQT80nf/8iFXScX6FxqQbhF4pfU/4yb2LRYs/sV5PLO6JkN1v8Nfo18q4SVRSQVz6YtEZpIp1HlnsNJmKrh5xBaFnvI+3vGMVVtT/kGF+gLVnMF0O1L5BOMgqLIHyp6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18C9mQ3oPcOZLlKEWF87W2U1jA7o7oOhgi57VFTQ4+0=;
 b=J3yIDMHdVnUBgdy2mP7/gAHgrhZ2PcqVry9UmjupKbak1AKk12qpgOBp1SDxHYdZdGTZc9c4+ks5/WqlHe4Fd7Q7ouHn8EOo0PZ8hNHC44l7TVIwJSOzWLd3Flb8xVm60JBbg5Cs7mx7Ypm44CobPHvqp3eyj22/CNhrquCJJmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <93b3e5c4-19b7-9809-e322-f0973924eef8@citrix.com>
Date: Wed, 30 Aug 2023 19:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: correct hvmemul_map_linear_addr()
 for multi-page case
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
In-Reply-To: <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0388.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: ce326d0e-36b4-4ad4-b522-08dba984370b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s77tHLv/NZUFRMjzOdZai5qFQwmlKltxWQzT3LH1wEZnjFNrMjfy9zjqgNV+lJ6XE/85o8LGn+2u2tB2nBJW5pukvUY5Q1CJdFJhLNhV3HtPMT4+s1swMTqCNGU7GI1iOfdBwiwB611UQlhzy3YSBE2lep+CInQrqZ/hozhe6V9oPJyO94F+3JKVmxiXGXvfOnZ3DRT/4zuCTHKD6Pcc70lcnzMPisiRYSsVcRF5laEz7pm+8OWOYZDrltf3rDKjZ+vwF4j8Ray/iywH0OmZznhM+QEQxxnNJA7L1nnRn7fKPwiP//gJ+ykyrXOfW0PJwTapHxELG1lYVOoXG7bGu7YcdhE9H4amvBMo7zT+9DTMh8fmSqshNSzHvBY8KMz61NPMuSKhmUuqa/HFqZG+Xkd5ZKkTj4gkPbN5McmZ7AadxaRuJ4oA0W27iFNa2dVj18j3oYjwf5AR25XahxDOsjX2JuMR1T6eDt3i6fP6kSbKhRGIE8Ij944bf7YYBD5ShLz1oZW2yQwBUJRvCpqnITN03lxS7thKUSQj+lH394Q8X2ei/WmmnvWIAVAy/SgtnDfckvr56FtyQ23KGm91gkHeD1/TfDJGe+sOg/iEA6Pl+EiLv0ub+ray9JYN6ZVMnhSOYEwuZHzxmAxJpvgTOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(1800799009)(451199024)(186009)(36756003)(31686004)(83380400001)(8676002)(5660300002)(31696002)(86362001)(41300700001)(4326008)(8936002)(53546011)(26005)(6666004)(6486002)(2616005)(6506007)(6512007)(107886003)(110136005)(478600001)(2906002)(38100700002)(54906003)(66946007)(66476007)(66556008)(316002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZRNlYrNGpFeWVycHdLOVpTc05MTjNOT3NOa1AyZjR6Sm9MVllqMUZpeWR3?=
 =?utf-8?B?aVNaWEU3enRRTGgzaktkTFo2SjhtS0Q0MVZyNThRKzR0bzdDbnJyMWppa0Qy?=
 =?utf-8?B?SHFyKzg2L0J2Z2dEUVowZk9pQzFkb0gxQUJ0STk2T1pncU9iejJhQWR0Uk8z?=
 =?utf-8?B?M2Q2eldOQWlzcVR5emxONVJqdDBuRkM1UVhoQkM1SGdCam9lbngrMDBCM2ZZ?=
 =?utf-8?B?WkhtaVU5cUZRclRNMkl3YmJmdndpTEt6cmtVemtZcllzQllMdkdiWDc2YWRi?=
 =?utf-8?B?cHZTTGxucUlobllxLzVoS3ZnblJvYmdLaDNwd1E4NHNnOG1aN2x5cHRSUUt5?=
 =?utf-8?B?ZTR0UkZsZng3NUJiZSt5dkdEbGlrUDBFNjFqcHRvbGpNWk8zcTlmeUk2U2k2?=
 =?utf-8?B?V0ljSEVUTjI5QXVoTUxCcndaTXdqS2VlWUkrTS9yczlnanAwMXhBYS8zaFlm?=
 =?utf-8?B?V1N4WmYzUHpQVDJRUGlRNlZHeTRLOE95Y0ZQMlYrUk5mUXljZ2NUVDE0aDBU?=
 =?utf-8?B?TWxxMVpNWXp2SmtKN0NLMFhZMHU5UWFlY1A0NmNSUEVCdE1BQkhzYTlQNUZJ?=
 =?utf-8?B?NytZTHh0NDNjN0FMc1hGMlRBcC9BMTVKaWZJMWtmTFlaWU5rOVc2TEJlOHhH?=
 =?utf-8?B?VGhsYkI0ZGd5TEFPV0FJQmsxdnU0SXVtMVBXanhVdEVobllBM0pUa1dUcVgy?=
 =?utf-8?B?TEl6anQ2Yi9ObzdZci9CajlhZHhJVEJxUnM1NjcvYUNTY1RYYTIwTk55YzNC?=
 =?utf-8?B?UVB1aFMwMFFvczdkN1lrUS9uMnpGbEwwTW1lelFiR0toOS80dTBDaERId2Nt?=
 =?utf-8?B?VWxjYWNnb2p6MXdKNHNhcFN4Ty9JY1FVQVhzTDJQbGpWTktYcDJhdkhKMzM2?=
 =?utf-8?B?U2ZvN2VBNVRncS9Kek5UYTZQUG9FSnQ2LzF2bXlLMG5jYldHUzFSNDhxVTBo?=
 =?utf-8?B?cDlCM2VLT1BhcnA5YWZmOS9nL2VGcnpSdTBSRnE4Y3MrL3JVc1krRzdhZUQr?=
 =?utf-8?B?KzZoSXlpaUdyTFpmN0NjUDVQd1YwL2JEMk9SMmlIWGdkczJUMWtuZkJ0RXFG?=
 =?utf-8?B?bzhrRlhsTDdTK0d1TGI3Mk0vNkU1Y3JBdWtQcmpxSHVCbnNyenRtNjEvcURx?=
 =?utf-8?B?VXA3aGtqWE55ZEIxK3l3NHVKV21qeTNVbm4ycUMvNmNqZlk0RVAzYWhBRFRV?=
 =?utf-8?B?WUJWc3JHM2NiNjdBaEhoU25iUksxOU16ZGM5d1krWUp2R2djQXZNTVhHaFI5?=
 =?utf-8?B?UEJJVWhaTkRtU3JZaVFrSndMRXA1anVPRktZam0rNE9PeCtpRzF1d3hoZnpy?=
 =?utf-8?B?cHo1QmJtdFl0R1kydHhkSC96RDl4YWpqcHRHbGg1bGVGUFYwY2VZSjdtTnRL?=
 =?utf-8?B?WStURU9TNW1PenNmTEZYditLejNQM2FBZlozNFc4R2MzSGxqUXNlUWdSQWJL?=
 =?utf-8?B?bkFnWTZQY2svdFdtNyt6R2hLRk85Z001azBNNWtsb3VtbkF0dFRycTU0T3I1?=
 =?utf-8?B?bUE5aVdPZ0diam9JU1I5TkNKYnZTWlRhbFV1ci9NbEN1RXN1Wk1uU2IvVTQv?=
 =?utf-8?B?czF6YTFXUkp5c29nWjArL1JpdW84c2lqQklvWk1aNnhEZ3AvZ2EvSnk4YWhC?=
 =?utf-8?B?YStaczRsSGJjaXZUUHp4US84d2l6RXJSOWlRRUhmeHpRNnVack9XMWhpWVl4?=
 =?utf-8?B?WXlyRUJwbHlNV0I1UkJyOGRtaW9PeVRtSTREY2hWOEV1cTkxMlRZSWRaS3Vy?=
 =?utf-8?B?RExvV1hpQm43dkNNUEFLNUFtVUZYdnZmMzdGWUQ1Q1VTMk81bjBGNlI1eERR?=
 =?utf-8?B?Um5xT1BlTUU2SmJubkduVERJRm55YWdsWW44d1R3Z2RMb2I1TVZYZWZNN3Fu?=
 =?utf-8?B?S3YrK3FQeC9XejNENkkyekdTcUc4SmlBSDNUUDR5MzQ4azVYRFg2ZXMwTklq?=
 =?utf-8?B?YWNNajYvam4walRBNmNzaEhZKzFtUmFRZXlYdFJLS2JyM0VOYWN2TFZWbEhj?=
 =?utf-8?B?ZjRCTnFSN3hHSC9hRXNsTWdjdjQxVm92UkJ0RjRIcnlIdUJFbEVkVzVxSGVv?=
 =?utf-8?B?U1haR2NGQklyM0NxTzNBaUY0NTlRaUtkTWxuZEs2NURJeEEveE1pMmplU0Yy?=
 =?utf-8?B?U2JDcWFreEluTGNrWHpiRWpmdXZUcXRGNCtKM3MrbXY4MHFRRlYvQmovTzd6?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gpCjlG0YmwE9L9lAKm/YZodYwz3jaH4kBUbq0ex5nHWr/wLi+aSVGC71avU3xcLyeZVevPNlxL6HCaJ2S2GtxsVfb9lRgROpAEBnPHHWmi+Ej8U4isv2Wmi7zbAelygv792YmOiahUe8YcHH9xdPDYhhlXGlsMK6uZvtdyVlW2rKHtvcE/pBByZDsbeCwuAtSgUrrP+/xC1wBBJc6ykafhPSehtwNuZzA/MIuRyGRVJceBYVRbdYm1UYWfhUKZP2dWHghN9j316wQlYCH6jcIFdxvfRJsd/WllHPH7LP05tdY/GTnkUzKpBzHBVcvS5LqocmTsxTMgMhEkE+xdvZveEB+MKaNLXyD5T5jU/CraKefXEBPPjkR31+QJbeoS7RrKw/hsJfkCvK2T6/vlRSXEoxISqZAC8c728FSb0pJpehmQT2QuO81FDwlJmBaSXB4QazdFsUUv/2DwVVoe9bk8yzhgQQOWAhVsS7mqBCkgWKTzLRgq3za3C1eUS9I+c6LywH324/vq5X0dbpN8+AOMAqBtp49r9MREI27FR76deQURvlu6Iz6L7CQL38tf8lFYwLYnKmrstmqA7gc5t0ihVO/I/BBEpD3pK9SOSpjNiuRSHCrzpgnXp88qAkekmn9vqIxHNulrREbsvEKw81sWmulZ7KHymAkM6ZTZdeiVxwtr/KZIQz+FCYUtTQfP+a4JuXx/cR+VKnUCOIYEzOGoiwCqxuYX5dg8U+ZJzugk7pvq6UYpSEvYZzZj5dnSU3JF7bS1KPp9+5bRsQoculQDMPQR2GqEb6KVQxwzdQxM0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce326d0e-36b4-4ad4-b522-08dba984370b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 18:09:13.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqh4llOJH3/dGi36cj3iyevMuqueR7NCJlJZE1PUIUcclvGSbcVW+IKn1bXpg44dzZnSdJrD+ix+iLtj6c1mHKYacUqJv3mYK1LHg9FKGrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7122

On 30/08/2023 3:30 pm, Roger Pau Monné wrote:
> On Wed, Sep 12, 2018 at 03:09:35AM -0600, Jan Beulich wrote:
>> The function does two translations in one go for a single guest access.
>> Any failure of the first translation step (guest linear -> guest
>> physical), resulting in #PF, ought to take precedence over any failure
>> of the second step (guest physical -> host physical).

Erm... No?

There are up to 25 translations steps, assuming a memory operand
contained entirely within a cache-line.

They intermix between gla->gpa and gpa->spa in a strict order.

There not a point where the error is ambiguous, nor is there ever a
point where a pagewalk continues beyond a faulting condition.

Hardware certainly isn't wasting transistors to hold state just to see
could try to progress further in order to hand back a different error...


When the pipeline needs to split an access, it has to generate multiple
adjacent memory accesses, because the unit of memory access is a cache line.

There is a total order of accesses in the memory queue, so any faults
from first byte of the access will be delivered before any fault from
the first byte to move into the next cache line.


I'm not necessarily saying that Xen's behaviour in
hvmemul_map_linear_addr() is correct in all cases, but it looks a hell
of a lot more correct in it's current form than what this patch presents.

Or do you have a concrete example where you think
hvmemul_map_linear_addr() behaves incorrectly?

~Andrew

