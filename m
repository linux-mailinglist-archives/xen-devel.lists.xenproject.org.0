Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD93511442
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314603.532744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdsT-0000Ay-Ni; Wed, 27 Apr 2022 09:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314603.532744; Wed, 27 Apr 2022 09:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdsT-000087-KE; Wed, 27 Apr 2022 09:22:29 +0000
Received: by outflank-mailman (input) for mailman id 314603;
 Wed, 27 Apr 2022 09:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njdsS-000081-GI
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:22:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ccc1ea5-c60b-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:22:26 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 05:22:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5674.namprd03.prod.outlook.com (2603:10b6:806:114::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:22:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 09:22:21 +0000
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
X-Inumbo-ID: 8ccc1ea5-c60b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651051346;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0P6WrWdvHZjEGxpZdcQgIZ5XhEUQWQHcHZS+IAWsPag=;
  b=F0YwqU3E2WLZEJNPpxv9LWBX/qrRlWZhA7JYYHFDshqKGPa/5CFD/+Hm
   e66rAYyJlN1v/GWvshp7Qx3SV2NiVONwT7HuLcDWnEvzATuaikiojTxtB
   Ill94YxhG9Ha7VxEGWam+nUU1TtvtzeqndF9BQgzAdaIHUjOUJxo8Pk0i
   o=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 69423072
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y9oIpKnF8YGL/6MRS5QGbJno5gw/J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZX2CHP6qDN2Pxf4xya4y19k0Ov8TRmNVjTFdp+30zHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV3V4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSyIMIaDUs9Yma0N2T3B8IrQXxYb6GC3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGZYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUG+Q7P/vJouQA/yiRP3bbwPvXbdeewTOFvwxekl
 EjP2m7QV0Ry2Nu3jGDtHmiXrvPGmCrgcJ4RELC++e9nhBuYwWl7IAEfUFKg5/20jEGvVtZ3K
 koI9y5opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLiIMuihPCSP5zHajzicf6cRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzrDATxU85wHedmik8g90aoOja4Gyr1Pc6J5oNJ6YVFKIu
 HEOhuCU7fwCAJ+AkiCAWqMGG7TBz/SYNnvaiF1mHZgk/hys/WKuecZb5zQWDERkLMcCPyPoa
 Un7uAVN6ZsVN3yvBZKbeKq0AsUuiK3/T9LsU6mMasIUO8AgMgia4CtpeEicmXj3l1Qhmr0+P
 pHddtuwCXEdCuJsyz/eq/oh7ILHDxsWnQv7La0XBTz+uVZCTBZ5kYs4DWY=
IronPort-HdrOrdr: A9a23:Z9wKSa297hoFJHJjDL2v+wqjBTtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMUj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu15Dq
 r/Q+BVfYp1P74rhJJGdZk8qPSMexzwqDL3QRSvyAfcZeg600ykke+E3JwFoMeXRbcv8Lwe3L
 z8bXIwjx9GR6upM7zC4KF2
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69423072"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8nwkKQV9RMjXKUEpj5KmJJLjj2X7QNYxSxzgJ1qKhb/KPafP2fXkJ6qaRMkdKFoHSpwndxDAECGziYGoahXPG7yI0CoeILWi5ZCsqVx2xy0dDZpFcEB9RU9HLfy8yYs72BhPA3zINqdr/qHSxn43nhD6vO7QlHpGvYPmegqso2q0Jb+779/+d9QlE8ZY6iW2wcFibWYydSNSWkpwF7jqwr0m3jShnJbQHSTKoUTVOjTtsDF/c22PCSODM9dMOEe5476QW/ygte63HqLcGGrk+aC6eRvqGelkKW1pkNd5v0eL6ujZi6+3zR7FZKfXfJ0wC9/zbQBZHW6KrWkKvzoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnlJQZcjgUTUpsRsT1TXqVmTTBHXsxQJSZtrXBDpBrU=;
 b=f81erv32yU29M04QCFWC/vu4WcXyYVuu9MpNFBwLb2JSgbukiDrWQn3F7P/QQ26otxSW15MrbRW9JorYOuH1ppQMa8igqXNpPvCdBvB1724m6cueq02BxCa/v3I8zBd3uvcvRf+OYwHzlv2Pvgy1pdL0RiLysOnYyPwy30fDaiL5HRGp1e3At2V06yX6w3/lWDcY11nFMqU83TjwJVEI/rcqrckTnrxOUWZlu7Jh5sBPmhaIvppvyG1gk+idssYQdNbQkk8AJ0YQRp1JqSwQddt8anMHzVy0eMgc/ZkJKfE6CpEt4p6jRpZ/viRARQmw3o0vXhFL0f0t63Bmjt6nxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnlJQZcjgUTUpsRsT1TXqVmTTBHXsxQJSZtrXBDpBrU=;
 b=SSFlBy+UFPv7FbEt2/JJnhRMSMZGlJOoqZVzeib+mqXOJHH5UohNXPPY/6f/Ec8asxtwXVvTE1xDovOfc3C0/njv4eXs42HHekWC1z8/JuQwGtyR+efodvLehU+3x/+wctrxONRjK4yLaWqeEsuMAilQaOYMwX30AfRGK9BV8Wc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 11:22:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all
 vmexits
Message-ID: <YmkLSclSQtKVhfb2@Air-de-Roger>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
 <YmazAdHL4LWOdDDv@Air-de-Roger>
 <CABfawh=Z1_88p14ivkqrBAUKbfw39f-frXN9uNsdVt9BDp+4bA@mail.gmail.com>
 <YmeyDRYcwfgg7mwC@Air-de-Roger>
 <CABfawh=gb0_oyjqq9DwioaVZfnrkbbFLJi14oyN4o5njrK9xgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawh=gb0_oyjqq9DwioaVZfnrkbbFLJi14oyN4o5njrK9xgg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0283.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1213a7-cbc4-4f74-cc6a-08da282f6ed1
X-MS-TrafficTypeDiagnostic: SA2PR03MB5674:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5674958FF3DB058F45589F938FFA9@SA2PR03MB5674.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fthgtOP5bi6QLN2q5NO89m8rC+nOm6iMrV7uQs8spAZ3yYs1w6XAdvGHsr7HU3q9wzeWTFAZOGcDluCuXn1iDqthkWCmjIl4hpwQee3afFbge921ezWnIHIRQTRhEwdQIhsFhdNbPccMO2aZHDR9sLE229m/FVKkiTo5nWOAaUO8aYbGSWzzQML6oVpWyZ1MN6Lu8YupP+UvggKBi+AHR4BmM6T2beGHtKHzPRlMU02xc3m1HzsRxzyxL6JAtMYRR9zycF45Ow9iNiP8fQhnJO7oelUiNwQn6uGDHd0412482y288i+YSLbiheKHSsTVwY2z4V/r4+on7fqdjbWqz4FHdaGl5MyGeP4fydhxchVfCkI32kDrk+njCA3yQ+Ko2IxwSwTpQ0z/Wr01WWyurZ3c7wCP8ED89QZRzhueTaJqOX8/vcmjT1oxgWDf46ukSWk9cSG5G7cv3llJ5RPB4kSqc4ppve68P+/kog353Osjo/j/yQDaLx33Vlc7ikvN4jkiVIixQMlT2zZDdmvK8yrwP3+9Z0EuYDfL9Et6vs1iGW/xtvT3ooFgpyQTBC149a+xg+PZsdbKbeqQfAWkxZc/PSmwymiSJfpNk9QllJGsbVO6+Pna+nYZYLZH23Jdf2wUPCID1NO1T080/53+Rg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(5660300002)(6486002)(508600001)(8936002)(7416002)(66476007)(66556008)(66946007)(26005)(82960400001)(8676002)(4326008)(6512007)(9686003)(86362001)(53546011)(6506007)(316002)(54906003)(6916009)(6666004)(186003)(83380400001)(85182001)(2906002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1Bqa3E4MFF1dWUveDA2U2VSMjNwTVd4V2dtYkhkcTBNWUZNdkVYaFdkMVQ4?=
 =?utf-8?B?ZklFcGVrWjNJampVcktmc0VWeUxGYlpwUXdzbzZoRjYxV0RxYTh6QzhGZHhI?=
 =?utf-8?B?NDJWdHpoQkd0V00ramVQMlFGMUlDUzVCbjhNUXIvclpXK2M4b1dmV3lQcHU0?=
 =?utf-8?B?d3pNZm5BU1J6YXhsaG1QbkdVK2NCSnl3ZW5kWkJWK1B1Um1PZE9ISGxUbEUy?=
 =?utf-8?B?UmNva2w1VGthMnVMZjFVOXAwLzA4cFJyam1VZkROem55VlRjNy80bFE2eUxm?=
 =?utf-8?B?djZ5a3Z2RDJ6a09nNGg0SjVybzBQN2FMVzljRGE0SEkreTQ0eHJ6U3cxczVw?=
 =?utf-8?B?cUhXUUNxVzkyOFZVbVRsZW1Qa0YzTEdKVmpUZnAyditmbHVoU2R2bXFhM29m?=
 =?utf-8?B?WGFqSFRrTWhYUFdqaDBaZlNvRlo3dzk1Wmoxem5RclhnbTI4bFVwTmllYmZX?=
 =?utf-8?B?aVhxaE9ueldzZmRQWnNraXF2QzlKSVVkWTFQMHVJVzF0VHg5UitFeGdwemgy?=
 =?utf-8?B?NmtaOE0zUENTSHE1ZGNmU0JqUU1IeXlOWmtXUWlMcVo2anpHWXdQOUZtdHNk?=
 =?utf-8?B?WUtDNkJSZlJKRVFJdmdjT1NZS0lqaE9IcGxheUtBUEQ3em9UdUxkZnlBanRW?=
 =?utf-8?B?NTFpSnJlT0lvS0ZsbHVjb0dtWmpGRnhnRjdPajVQZ1NSRnAwY25SU1hVcG9I?=
 =?utf-8?B?UnBZN2N2clIvRi9kZVZqMDVSMkVKb24rdngwb1BFMWlkSTJrUlo3Z1pCWnhF?=
 =?utf-8?B?SzkwdFVpM2haejFpME1MVkZnSGVTMm93QVE0NWFGN3ozUDJLeTl1WEhlTVY3?=
 =?utf-8?B?ZWRUWXRLL3I1Nm14UUo2U01jTDNsb1BtQ21FZ25XejhmS3ZwYlMwRHQxdGE0?=
 =?utf-8?B?cStFSTg2Tjd2U0d2T0FkVWlhc2IxZHV5N0VMTWVLSnB2aXF0V2djSk9rNFdr?=
 =?utf-8?B?Z3hXOGpEMFZMdjFtb0ltQUxiQTdQbTMvSmt5ZFQ5bUlmS2JRWmhEUmRTVm0y?=
 =?utf-8?B?ZjJiNlUycldjUU0wNDUwcjhia0YycVpPVEVvdlZ0d0JINE1LVU9SQVpycjNl?=
 =?utf-8?B?bDduUUZXMVFpVlF6bjVVWTI2cVVOc3RWZUJPLzlHVUZJVGVaY2FXb0ExbE55?=
 =?utf-8?B?RGQ4aU9oRlU5WXMvZkVDZ2ZGOEVkTEFZN0lOVlJ2YzBmekZxS1pwdmFuZmJr?=
 =?utf-8?B?RVdETHkwT0pxYjZUNzJKUjZndlN4Z2RwcDMwaUFyUDArRDFLZ1VXeEd3Wk9y?=
 =?utf-8?B?b0pnOFVTaElMRFJHTEVEcFN5R0pDSVNHbU05NkxYQXJrR0lZYkk2N28rSXd2?=
 =?utf-8?B?NUVOWkE2dmFrYmNkeDlJRmNyVVI3TG8zQkZtNzY2ckhxN2FtZ3JvMWtBN0pP?=
 =?utf-8?B?WXAyaFNjZmNMWUFhdGc3amxWVjlDcHN3OTFHMHNKSFlUdG41bVp2UWI4L084?=
 =?utf-8?B?VmpwSHgyNHNON3l3ZEEzb0YyeEthellHVmhsWEh5SW1vTVVBUnpkUCt5TDVp?=
 =?utf-8?B?ajdiTE1BY3FvNTJaVTk4bDlNbjB6QUpsMXpjRjh6aDhOR3BObkNWME9Hc2tE?=
 =?utf-8?B?aHFHalg1Zk90NXBIeFc2WDJwdS9SaVNvbGpiaEJHd0U1bHhUVlQ3bXRML3hh?=
 =?utf-8?B?Lzhwd1h6TWJaUjBqcXRhVEpVdXpSZS9LejRxOXpOQVJCS1BHZmQzL01Zc2JS?=
 =?utf-8?B?RGVUR3NNMldCTlVBU3Q5blIrWFlZc3o3TlAxR3pKS3FyUUNNaC82Ylg2Rm5K?=
 =?utf-8?B?REtKZzBNR0U3eWxoM2V3K2g2SGwzZ3QyTmFTak5oNlJtSkpXd2pSODdkVTRx?=
 =?utf-8?B?TTRFU24rVzNVdWJqbHkyZWJ4alNMVGYrbk1BaWJwS2h3UktQT3RvU1JBV3Yz?=
 =?utf-8?B?UXRCdDJwd0lPbW1YY0xId0tRdERpazFBcGZaMjlXcnEyVjMxS04vV09lWkxI?=
 =?utf-8?B?WmVaRnYxSlE5c1BLRXJsekVpMWdxWjRpWFR2cDVLdzlEY0pOUmRncHdvUXM0?=
 =?utf-8?B?eVJiK3duY3UyeTdIbEc5WTN0OXJNQnlpa05lS2k4LzNPRVQvaVZ3NXNvV2Fa?=
 =?utf-8?B?NG81T0k5eU1hRENsOHMwVTB6eVpIQjU3MGFsNDV0QlRiTkpQSUpXT2xPTjdI?=
 =?utf-8?B?UzEzVnhTWU41Y3Z4eFVCUURocWh6bG1nbWRPdUFBWEF5S1d3RUVZc1pJNXVF?=
 =?utf-8?B?NmJOTUZLdXpDNld5MDRYVWVLaUZ4Y3ZpUVFwMGZPY2pwU3I4YXVUMkQ0QnVm?=
 =?utf-8?B?bzIrcGxJWitnZytuY2pTbmhKay9tK0ZoM2V3QnRZQzA4eVFTcVdpVm5MRGw4?=
 =?utf-8?B?d2dhM0xObTczRWNmUi9BUWxuUHNsdWx0YlZYaE1IcVdQUGFDdkMwb0tWWmpm?=
 =?utf-8?Q?+TFpkYmZvJglPeC0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1213a7-cbc4-4f74-cc6a-08da282f6ed1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:22:21.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3asx4UONpa6zT9y8zYfBjoeoMURtdQeNo9xzNq0SZDPswQyVzRBbl7cbaL/2PwYJduv6Sb6oEOqvJjMORtur+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5674

On Tue, Apr 26, 2022 at 02:53:54PM -0400, Tamas K Lengyel wrote:
> On Tue, Apr 26, 2022 at 4:50 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Mon, Apr 25, 2022 at 11:40:11AM -0400, Tamas K Lengyel wrote:
> > > On Mon, Apr 25, 2022 at 10:41 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Wed, Apr 13, 2022 at 09:41:52AM -0400, Tamas K Lengyel wrote:
> > > > > diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> > > > > index 3079726a8b..30ca71432c 100644
> > > > > --- a/xen/arch/x86/monitor.c
> > > > > +++ b/xen/arch/x86/monitor.c
> > > > > @@ -332,6 +332,20 @@ int arch_monitor_domctl_event(struct domain *d,
> > > > >          break;
> > > > >      }
> > > > >
> > > > > +    case XEN_DOMCTL_MONITOR_EVENT_VMEXIT:
> > > > > +    {
> > > > > +        bool old_status = ad->monitor.vmexit_enabled;
> > > > > +
> > > > > +        if ( unlikely(old_status == requested_status) )
> > > > > +            return -EEXIST;
> > > >
> > > > What about if the requested status is the same as the current one, but
> > > > vmexit sync is not?
> > >
> > > You need to clear the currently registered event first, then register
> > > the new one.
> > >
> > > > IOW, I'm not sure this check is helpful, and you could likely avoid
> > > > the old_status local variable.
> > >
> > > It is helpful on the callee side. Usually the callee needs to keep
> > > track of the state of what events are enabled so that it can clean up
> > > after itself and if it ever runs into trying to set the event to
> > > something it's already set to then that indicates its state being
> > > out-of-sync.
> >
> > Hm, right.  I wonder if you should also check that the ring is empty
> > before changing the status?  So that the callee doesn't change the
> > status while requests are still pending on the ring from the previous
> > type?
> 
> No, that becomes tricky because really the only way to ensure the ring
> remains empty from the userspace is to pause the domain, which is very
> heavy handed. There is nothing wrong with asking Xen not to produce
> more of a certain type of request while still being able to handle the
> ones that are already on the ring. For setups where the two should
> happen at the same time is where the toolstack first pauses the
> domain, clears the ring, then disables the event. Both are valid
> approaches.

OK, so we rely on the callee to drain the ring properly when wanting
to change VMEXIT events.

Thanks, Roger.

