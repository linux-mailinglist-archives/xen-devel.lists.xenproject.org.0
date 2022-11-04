Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F385619CA4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437755.692218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzHO-0006gz-H2; Fri, 04 Nov 2022 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437755.692218; Fri, 04 Nov 2022 16:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzHO-0006dq-D0; Fri, 04 Nov 2022 16:10:50 +0000
Received: by outflank-mailman (input) for mailman id 437755;
 Fri, 04 Nov 2022 16:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqzHM-0006dk-Ac
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:10:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c672561-5c5b-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 17:10:46 +0100 (CET)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 12:10:33 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6155.namprd03.prod.outlook.com (2603:10b6:408:100::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Fri, 4 Nov
 2022 16:10:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 16:10:31 +0000
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
X-Inumbo-ID: 3c672561-5c5b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667578246;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pzPHuvT+gFToZPLxFRYmd8AHyt5tNy7Nam6SS9PwgXk=;
  b=AbX4CaO2y+Po39+xIr4agEhGXjXeappTR9jtN8Www1dpIYkv7yjVgUN9
   Iz5wWI4tB1E6SJaO/IZyzPB0JOYBVLewdcuUxaM95c441cjAUtdXGxnbF
   XiVT5f8dB5IPpT0htf7MxQzjAlAywjRTmTjwuXzMNDpHZcj3WLvIQZ8+1
   g=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 83273738
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6LEugqCVc09j4RVW/9Tiw5YqxClBgxIJ4kV8jS/XYbTApDhx3zFVx
 2NKD22Bb/3bZGH9Lo0gYYWxpxlSuZ6EyIdnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpA4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq7tvQnhT5
 +0jGQsIUEqFpsuk7u3lRbw57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxrvAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WreqC332bSf9c/9cNxPH63p7+w0uVKK6WpUBwIxf1Spj+bs3yZSXPoac
 ST44BEGvaE+9UmkSNj+dxK9qX+A+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vJCDp1ofuqQHSS3r6OqHW5Pi19BXAGTT8JS00C+daLiIM5gw/LT91jOLWoldCzEjb1q
 xiIsS54gbwQhMwK0qyT/FbbjjbqrZ/MJiY26xvWWCS57wp/TI+je4Gsr1Pc6J59wJ2xS1CAu
 D0InpaY5eVWUZWVznTRH6MKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCN8ebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:29Aakqp/RkYMZ64xCfE2ft4aV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2z2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iFnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegw2w
 2LCNUsqFh0dL5nUUtMPpZ+fSKJMB29ffvtChPkHb21LtBwB1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="83273738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8goVjkEEh/ARnzoHSVswX75anaWS5jpaD8VNLAPGr61UAhT6NepAOHXoa3/fBfaDEXichs5t3ksCc7yroonsNBy6QEePSbCvD8ZnFXQvXcX8Kq1moInCi8nWsZCHp4fHyVsiVBOsmnGg9a1/SSYSKon2b8ZCADt+YXPsMKPyuKrie4bTBFYrOothPeFUeA+752RAzUxuMZjnxNk2PbE31Cn2WzyrgqEguL5jmq0YGFhoh6rPI1kkvzISl/Zh51IpLEMYoVqK9HSgXRrMiMD8j9FAy+/DELG/3CaGGENeow1BZI5fIzsJeu0wT+irmNCCy2okf1cTuIkP8kdKT+Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asJu70y7I/TL9/w7H0BuAYOVE6i616taxm6hGN/k5d0=;
 b=nZYBysQmum2RbkwAjFcOkImaB5AG3ThwJfLWIxKqpqVJnEnUHZXw4gr5vxw0K49f/djA62WEMx3WU2li3Y/yZvvU2ElO4AEcS3BczYJXRJj3of8x6WB9edYKviN2d2Q3kFLDkTYSRlEoX9qSOn9E9Il8OJivRZpk3jTmkdnpAZmxa9EFHzpFMdkWZ3M/jW4z7K07yZjvYtsB6Hjj7OYHZcWoTiokLZ4w1dSQy00Eru24kOdiUeWj6gCJGSFJ6hC/5q6qcMSpavuxiIkgw3fAcXcJINbimoMh6DwK/eqaqrdAPJi1FZlk9TeEio8hGEcipSCa9ur9aEzuZ50rj9faiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asJu70y7I/TL9/w7H0BuAYOVE6i616taxm6hGN/k5d0=;
 b=NBaHs+/vjhTaJ0xiwKiTtX/4p85nzsYyf2iDmKfep3YJd8qSEzaxvLlECykCRQY8rgK8j5mI9FThFEvyvlOTIi8sCDuuPvNbVOLnzIp1OhplFBF1OGRiNqUqrY7czrcl9I/2yZ48BALwBCGMpRmxkMkQGTduYY8DCLfpjJ2YEx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 4 Nov 2022 17:10:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <xadimgnik@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y2U5bmp2rsUy2C93@Air-de-Roger>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-3-roger.pau@citrix.com>
 <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
 <Y2U3Zf/nCv3PlTxa@Air-de-Roger>
 <9a505567-57be-a7b4-7cab-d1d737172db0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a505567-57be-a7b4-7cab-d1d737172db0@xen.org>
X-ClientProxiedBy: BN9PR03CA0857.namprd03.prod.outlook.com
 (2603:10b6:408:13d::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ea3564-5fd5-4123-ae0f-08dabe7f18bb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	etRd1WAW2u0n7U6Dz9CWoYE/p9iOZKxYXegtjxCt8hLChxn7NaR6twC275cJ+k1b0iePW8YoYkC9+/CeBEG1I3aNqpVgfeb27GMVPVLAE/5zTIr6uGT4kWGvgHuh4C64C9eyNI04qrcm39s2zXy+O7d2dLdn9BgSUpJQ02DZY0ZY4lhOLe5VZbEVKNY4L4GI/XLN84QzIXGPLDMXKX+zw6iG1keuq6v3WG+qecNTHfkkNej/IORCJjV+WdBLxe+IBpAVGthVe+F61FLDQzbxwB7vQMFYtco5iLoNMXqOmd7+5iwwGpcQXqVPXkU6ek/w4LRVMrh/vvWO/erbe79+5i21PiwzUsxM1QUsTmlgSLrN5d282szthZEgQwGkZnKiTLq7W4y4FsospgimAnKYtHugcqlVqSPDKaSd7YWRemLO5T8liGEESPoc/pDvkA/NFoqLcbVwxz19/u7vPQBY0PWhGcAyNGQd0d8U5PYUabaB+D1goEBXVdnhmU3jMeZMg8sQkrrB4qRUV20grFD2ZyTKalxpD8WpH2tP8GaU5TD6GU3j5z7ayOM0YuaCtNvqa8CvGR7lWZ/cVbwy2sBews/cnMR9mT/0XyKJ/Zs6J94JanrwmIrCw44/Nva/H8ZxC7U0sh0bScgfJqFqKW+mDPo7C+T3Toa6CZbRy3P1wLpwj94Lma3nbn6pg6OX94WOwJeBRRNagciMwAvnlZY0rQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199015)(6486002)(478600001)(33716001)(6916009)(38100700002)(54906003)(6666004)(82960400001)(316002)(83380400001)(8936002)(86362001)(6512007)(26005)(9686003)(41300700001)(8676002)(4326008)(186003)(5660300002)(85182001)(53546011)(66556008)(66946007)(6506007)(66476007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJnZGJBVTJsaEFKelhDQjVxQVNWdlQva0Z0cWVDVGU2Z3dJcVExbFZvazFZ?=
 =?utf-8?B?YXNtVUkvWXlRcC8ra3dBN01jOEtEWFJOcjl1WDV6YWVod1QwWmltdWVmVGVs?=
 =?utf-8?B?T0tuSDZLMmhhTWFXWCs2WHRkYk1zL0dQYzRmL243Z3pNT1FKYWR4Y2hBdkZ3?=
 =?utf-8?B?M3NFY3YveTFjSTBjL0pnVkN6R2Y1RVRZWkJmc0YzaDRSNGNjZDdLWEI4Q0JE?=
 =?utf-8?B?QXF4emkvaTlqZnRTUjFlY2F2b0FKWnBNdHgyQUt0NXRNYS9semZrUi9EKzVZ?=
 =?utf-8?B?V2dPZ29ac0p6VzRqNE9RaUdMbDBPOUpnS0ZXVE9BUjBHTmpRdFhlTk9LdHV4?=
 =?utf-8?B?cVBXU0VZUFRqdU94WitvSUZldytNTlFSUitXNWh1R2pUT3JsQ3FWOE5nTDlZ?=
 =?utf-8?B?Sm81Z2JSQ2lpN0JxRkcvTGVpdHgwb0FGYlhNOU40WnZ5b0FybksrYkc5WTdQ?=
 =?utf-8?B?Q2MrR3B5MCtjYlJjeE5iQWszc3pIdmd4czNCaGtZSzRVbFdCa1MzaFBCb1lZ?=
 =?utf-8?B?RC9nTXYzeG9MZ1ByZlowOVczd3VSVlgzdFF3SnVXNDFubkswVWwzSmJBeW44?=
 =?utf-8?B?UWlBaVJQZ0VyeE1IeXhtT1dtZDVkMy92U0NZalRzak4rVUtzKzdqd1BwMzZ6?=
 =?utf-8?B?SG5VbU15Y25FZzBZYmtKaUh3bjc1eVFDQkFMd3A1dVZhRDZmNXRqZUY2eVhW?=
 =?utf-8?B?cDRCNmRpN3UxbDJMVDRjMjdnSWNnWWlsMjFVbUdyMlhYdlVVaVBhbjkrK2Zp?=
 =?utf-8?B?SGRoREcvRHZXNitWdmFIOFVoRnZmcDVvS3lRU29yTFlBcDdiTnRBRWgwYkxK?=
 =?utf-8?B?cDlwMUhEVzN3MkNUQWxTV00rSURwd1NNUjkyaHdSTjQrWU91cXJ6ZXM0cUpz?=
 =?utf-8?B?NWt6TERoeFFyRXoyQlFhV0VVQ2Q4a3BjVmM2VVRkLzFqaFZ4SEJNclNleSt5?=
 =?utf-8?B?cmJGWnZ0KzZHY2Z4MlVnZmw0aUdTbml0VHRQZ000bzN2R0JDS28vM1FJS09W?=
 =?utf-8?B?anFFV1lTOEM5bEVGZXlQM21VOVh6NENyK2JJTzZKQVNpZ2NkQVBBMUdERS9p?=
 =?utf-8?B?aXNaZkN5Y2U3d2l0R1dvNjNDekpBLzgwb1JOWFhuVkFMK2RxbW1EeVVxTXpM?=
 =?utf-8?B?ek9pbTF0cVZtYlZqOFhxRlp6encyOXVVMlQ2SU5URW1ZbExQMEcrZ3RPbysw?=
 =?utf-8?B?Qk5QRjh2dytXU2xQTyt2VVplL01oNlgvelNsWXFhOExIRDFkRjR6U0w0RFcx?=
 =?utf-8?B?OW9ncXNWaFg0R1ZadW1oRGJmdXVYRmhDL3N3WDFHS25uRzZKRXpGSnJYRXdl?=
 =?utf-8?B?OE5UT3hnRGNFUVhPNE11T0tyZXBLY1JNTlA2ZFdNanlhdlRuandoV3VqQ0VG?=
 =?utf-8?B?SlZnVzJRbUQvOU1jSHJVNUpyM3pQVCtibmhEMllHb3BUVFp6b3RHNkY0NGx3?=
 =?utf-8?B?cEpMd2VLMVJFaDNhWUVBN0Fvc1UvbFlNZENHZHlETGVIMnBUMU4vbjZlS0wx?=
 =?utf-8?B?elRmTURDWlFqWUp5OGhLSHFTamZyODZxc3dDRTBkZ1pjOEFOOTdzVUo0c0Z5?=
 =?utf-8?B?SkxPc2VrWWx3UlVQRjZ3VmlKU3hIR3BqZGF0ZWNSMDB4TzNWQ29rNFo4ZFA2?=
 =?utf-8?B?R2VETDZhczBRSGgvTDhMekNsOUR6MVIxZWkyeklwQ3lmVzNtSFpEc1RyR0M1?=
 =?utf-8?B?RDc1bkloakE0bUk3b1h6dVBja3FRb3E3b1JaR215OStLSDB5R3lDY1JYTmg1?=
 =?utf-8?B?RVdoQUc2dlZNWTVmcmZrck9jUGF1NWNzeDdHbjFEUlFPVEZ6b1ljcTZJUlpz?=
 =?utf-8?B?cndCaTNoWEw0SnVlUkI4THd5N0ZsUXIvb3BmeHdqWnpVZTkwS3dlOWM5SUIw?=
 =?utf-8?B?RkcrRzVTNW0xUnl1Zm5ZYmFSbFllNFUxN3k4M1dUL2ViQUlwZVF1WFd1bWk5?=
 =?utf-8?B?cGpMdy9VNG8zcEZSTzVtdlRJZ01IK2U0WThRTmg2UkFrWHp4TXBtREdsUTZK?=
 =?utf-8?B?ZitpR0NXMVQ0VjY2TkNEMFdqODJzOTlYK3htUlkvVnFlZ3B0eDRTODZxTjhl?=
 =?utf-8?B?a1p4QlNiTVpkdXYxRkNvbm1JZk0rSGpPN0toQXMrdTFTUWRRbG9LVzZDSHdh?=
 =?utf-8?B?YmFoQ2lLR0FocmYyRlE0RHYwU2E2MTN6elZHVlpBVVRUdzYwbnFjS1RGNFox?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ea3564-5fd5-4123-ae0f-08dabe7f18bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:10:31.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooBHr9u1a3v7BnsFfMYC++7617Y418IZN+yRJYUHZtTqCdWKmn2ndmBg06+M8asX4+QsXtaXUtixMepK530M4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6155

On Fri, Nov 04, 2022 at 04:05:05PM +0000, Paul Durrant wrote:
> On 04/11/2022 16:01, Roger Pau Monné wrote:
> > On Fri, Nov 04, 2022 at 03:55:54PM +0000, Paul Durrant wrote:
> > > On 04/11/2022 14:22, Roger Pau Monne wrote:
> > > > The current reporting of the hardware assisted APIC options is done by
> > > > checking "virtualize APIC accesses" which is not very helpful, as that
> > > > feature doesn't avoid a vmexit, instead it does provide some help in
> > > > order to detect APIC MMIO accesses in vmexit processing.
> > > > 
> > > > Repurpose the current reporting of xAPIC assistance to instead report
> > > > such feature as present when there's support for "TPR shadow" and
> > > > "APIC register virtualization" because in that case some xAPIC MMIO
> > > > register accesses are handled directly by the hardware, without
> > > > requiring a vmexit.
> > > > 
> > > > For symetry also change assisted x2APIC reporting to require
> > > > "virtualize x2APIC mode" and "APIC register virtualization", dropping
> > > > the option to also be reported when "virtual interrupt delivery" is
> > > > available.  Presence of the "virtual interrupt delivery" feature will
> > > > be reported using a different option.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > > I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> > > > don't want to rewrite the function logic at this point.
> > > > ---
> > > >    xen/arch/x86/hvm/viridian/viridian.c |  2 +-
> > > >    xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
> > > >    xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
> > > >    xen/arch/x86/traps.c                 |  4 +---
> > > >    4 files changed, 24 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > > > index c4fa0a8b32..bafd8e90de 100644
> > > > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > > > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > > > @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> > > >             * Suggest x2APIC mode by default, unless xAPIC registers are hardware
> > > >             * virtualized and x2APIC ones aren't.
> > > >             */
> > > > -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
> > > > +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
> > > 
> > > So, not sure why this is separated from patch 1 but stated this way it seems
> > > counterintuitive. We only want to use the viridian MSRs if they are going to
> > > be more efficient.. which I think is only in the case where we have neither
> > > an x2apic not an assisted xapic (hence we would trap for MMIO).
> > 
> > I've read the MS HTLFS and I guess I got confused, the section about
> > this CPUID bit states:
> > 
> > "Bit 3: Recommend using MSRs for accessing APIC registers EOI, ICR and
> > TPR rather than their memory-mapped"
> > 
> > So I've (wrongly) understood that MSRs for accessing APIC registers
> > was meant to be a recommendation to use x2APIC mode in order to access
> > those registers.  Didn't realize Viridian had a way to expose certain
> > APIC registers using MSRs when the APIC is in xAPIC mode.
> > 
> 
> Yeah, I think they predate the existence of x2apic.
> 
> > I withdraw patch 1 and adjust patch 2 accordingly then.
> > 
> Cool. Thanks,

How does Windows know whether to use xAPIC or x2APIC?

I would assume CPUID4A_MSR_BASED_APIC only makes sense when in xAPIC
mode, as otherwise the registers are already accesses using MSRs.

Thanks, Roger.

