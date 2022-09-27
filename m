Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7B5EC62F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412688.656103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBdq-0006fD-Qm; Tue, 27 Sep 2022 14:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412688.656103; Tue, 27 Sep 2022 14:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBdq-0006cc-Ml; Tue, 27 Sep 2022 14:32:58 +0000
Received: by outflank-mailman (input) for mailman id 412688;
 Tue, 27 Sep 2022 14:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odBdp-00058c-82
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:32:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44f4994c-3e71-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:32:55 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 10:32:52 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6172.namprd03.prod.outlook.com (2603:10b6:408:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 14:32:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:32:49 +0000
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
X-Inumbo-ID: 44f4994c-3e71-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664289175;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Rjax2pG+/yf60tM/y9mg88sQ1fQaAxJyRAVjWfirX5g=;
  b=HbNrANurTe01PmXKPwZRDWH/NNXQFJgk946+E4ltUfEB7Go4+OGf6ePt
   VjLSdvRA8fvM2qfI3DhsS5pffydad3N+/OdGqJfHdi2uWN6343zpO946p
   1ZKijrAtUiZxa7ssw563amC8WWr00e+Sn9Om1tNHFWUGnJUvxgpmx1ub/
   s=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 81452165
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Am7v54aPehYnR3zXvrXNrnJbmzE6nJRDYMBhcA?=
 =?us-ascii?q?peMyHXZr8wC29aueOYaDEMozobXot+C/f1qyJFR2vrPfGl0f9FEt/cnDBAui?=
 =?us-ascii?q?mzt+Blf5wePG8oER9RPa26gCeC51s+c5RdU1JNi065oR9lYFiwQjs2IxpquH?=
 =?us-ascii?q?EgFqQJi+nOGfyl1tj5zHOJES0VuyLHMNDxr1ce9QonkXygeq4ME6s8qqChY9?=
 =?us-ascii?q?izYIipGHUnfYyjak+fmkCAZbFNUMvn+FHMYuveo4k49sFUug1uNfcH7yykbm?=
 =?us-ascii?q?uROLDBZJTtXJG9nMs8ksKRQxql+bI+HnPsfoHthDCO47XuyAUzSHmN0NpKdJ?=
 =?us-ascii?q?ghIjqe5s4xFq/0kHLXt3GCzb/RZy/+F8H0pDi9xMf7FNhpQ//YIiUg6vwnvq?=
 =?us-ascii?q?IjcbZsjoxP57MEpT4G0/YLwbxzAYMgQqV+N9RuqR+iVHtHw64I6jDmoaYo3j?=
 =?us-ascii?q?NQHjY5v96IjJgNZqMBkFgi5X/24UjfHU1nUse7Qncr6+nrqUspw9hGHHZBF6?=
 =?us-ascii?q?8FzwP8dluGD5rnQqfj/O6GAEh6DxKAFcdirmo2sMSiFphcHHdRwRV77Zy0n4?=
 =?us-ascii?q?7UzwwGRqTVnh9meBnPGaay63y4/9ODqb6b3ENInf+17hw1QAXHI7pI5vxo9R?=
 =?us-ascii?q?iqG/fiVGZI0VmgbOYI5vr0+iRo90Hl939dRGDjO3EamfP6P4LIulEZqbsarn?=
 =?us-ascii?q?q5Uj1mnnpDiJ1qYl/4gVIgmF8BOdcAtdTzSmpFF/6qlhAxypBYkl0hgcUYyQ?=
 =?us-ascii?q?9A/ck4VbEDdTaiTCpQmN5fZIFn3803kLgQXjd1kpw02/8oSmwDt5dt/VU5tP?=
 =?us-ascii?q?laBh95e/oD2dy514WSoFiXXmy71frj1p0mxifehyjSrKKdvXVIXrQ8z411V5?=
 =?us-ascii?q?sPo19bNJsO8P9Or5WHpSmrYT2brk8M8+5Go2pvY9cHUWqyW01CF/WSqP/4Fo?=
 =?us-ascii?q?bDswU8k8chODKmZfvX6adrHWwjrKO2tdmtSqVnmJb9Ao5JNAmUobcJMVDIji?=
 =?us-ascii?q?pmcmDfsSmekgdDWlCld2TfABmgZeGsvPKFkGgypkZHbc3RFc+SCXSamPZ3es?=
 =?us-ascii?q?QLLNERQyqaRYcKs5XZz+7XwJs5oj0N8toLEvMa3gD7v3E+eK1AZhjttKodPo?=
 =?us-ascii?q?FZHL9ymk3VPnrScyDJrvlMibK+Tiia1gzMLrwP+ifV9uegRvRZYm8xT4L1/3?=
 =?us-ascii?q?WUZT9pOF7xpm5a9k+vu1UOJR1T/hV2wpmyyZSftC6zH3H1rRA0LASQZ0HGYq?=
 =?us-ascii?q?2Tt+bNN/VArSuSnZioCr5id2S6bfO6UxnKzTjd6O0mjQp6ScrAgs9vy15bqm?=
 =?us-ascii?q?X9sjDkm6x+1tZ3aoLPkbYRFh83Tvnr9xnq8BIxB/4O9nYWsDzGlw4gwXqRc4?=
 =?us-ascii?q?SeGOeZmr0gBCsI20us4DsWXSdLyAN/oeUdl33y10ExqXsYHL25fN7jC3Qqbb?=
 =?us-ascii?q?t22Wpg28wB/6HH5i37skv5hTcBwRHUPV0m/eemLQEaF3yOqJf9vP52Pbkebp?=
 =?us-ascii?q?yaAX0ojULLpMx9VT+/RSsYhiSFzXJ3naiW9D11J1rPLt2xMAq5xZ3T3n7jdA?=
 =?us-ascii?q?xscyzLuZmP6AJQvVYFSse1EZdO9jkTMYVrMQ5JENxXDJPdg2kYz44+eKjYIs?=
 =?us-ascii?q?Cdz0EjNLqinIj0jvd69YpyH5VmbcAumHFVFr1TSRaJ90kMYmdtJwp3IJH47Y?=
 =?us-ascii?q?n3bUyz1glQhWwYRiMHmojMJiahf6UupxxzAeGDnfhFrRmJ6OPQa4/WDoWAes?=
 =?us-ascii?q?IFIkKJPpdzAWB85xjVw0FJalfs1Dm23g72OC8cVTluNtMH9vvyAb9NFe7Xd1?=
 =?us-ascii?q?9I5TjrZkPo6i6VEwpaGQvCt8MzMXs/0bMKU6ddNnZdviYkfpz2kxnQ/EBZd0?=
 =?us-ascii?q?yjHpNhADGsa5/6w2Hfv6bUV9l7FuzAnV24t1f4L1FcGloV7F3m9f6ZSt67Tk?=
 =?us-ascii?q?FNtTKk1j60VmodG81rAAMHG69ZUGZIqEDF44LOpC3TEJuwUUtBz4BpzSagnY?=
 =?us-ascii?q?yEzSnVz0roLz+7U0f3aFWVl5Xx5XunzUAzZyLSg/SD83qXGjOwxc35KLpFrH?=
 =?us-ascii?q?zZR0V67bgpl2a5vF3Vgn4uUjRz3KbT4U4DVm48EbojOo7oQ9kQeZbm7c48tB?=
 =?us-ascii?q?ymaFSesUJ25b6CZNjJqcOwkPmMoB37My3+h4Q5dp8XQ/zfdy8tQrRmgvKruj?=
 =?us-ascii?q?wuY0SI8t5koR+pi6Zm9XvMKrlnEQemYeZlAkP+2jb+hwoRKB7XzRcFGeJjXU?=
 =?us-ascii?q?ftAjQhc3oEQfUPU8UqyGIdWYqCYuzSW/Mqpb5pQd2XGCENGMwlIDa/pbvO80?=
 =?us-ascii?q?baFrXaKQv2VKKLGgzAG1I3nwZzUNuL9J245qBhNXnlc976mYfAgh7yXV5PFn?=
 =?us-ascii?q?rFnk+Neah766rXGiQwXCVqEEmNzMrU4bJZWDr5KeAtbP0UBZaf6XjG3rBVmk?=
 =?us-ascii?q?PER1nU=3D?=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81452165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB7f4pj5zLjAgS9XA+tCaMAjjU3cweKIPY6XOcZ460AzeKZqm3Q7YnQXujS14yDrnu9gDEMhfnu8Ocu0DyKBT6/2/EMlcZoiGrQKg/MKeOnOd07PUOFa6d5Qudp4PA0BnatJ7XLCEkPqqSx28h2hWkd0mBaPnlOsWcJ+AfRb9BNfgMRbXQpEXvxFAH1aMOn+euEBNZCFy2/ZMQRs/c5YJCnHJlcN6wMeOkPcvGvSMo+QyM6uFBrMV1MbF2Lh7/sKbSS31q4s3bboUwQD6R6CdtnkV/a+WIbS2FamdmQSBX40GNZjmvwjC5UVOZEhlP5Gh+3T8RXnfoPESb7GLHN4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKpgd/uqhjgVwltKXRhN4PVYUyUCgwjzL12ncQ4bOBM=;
 b=oCBRolu9M0hM9J33JUPx2XYX/SOseBnLLZ48frA39Vx37fW8ljs/6vg5u59kSucY20McVgVVzo2ujbanYnaM1ENQ6KQjRGL+xNtICXJQP7Cod9qfYtukzMrWxEVlbuEXrDBbCisjuaM3z8FyrF73vYztcHcCMXxz1aTE37ggCGbLkvIRorW2tiVLFwIub21ljzMpoYm1lIygF/4oqHJc/PWfcT7Fz66h9oWm+CDboPrZq4e7BlxuAApqLRmj01GM+NR8/CfEKe37E1+hWGHraaN7D2IdKYjxvgtLTTZRIo6vaK6BFgZm2n5OzNrSVQxi+Bh8iPynJTu9SgkDdCVqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKpgd/uqhjgVwltKXRhN4PVYUyUCgwjzL12ncQ4bOBM=;
 b=sheOe/95RiYL10f6kXnYoO9e4aEHckQgnXomvzVPqDPL47kGBH7FQQ38gPNW7mUPO7tfcTFki4K5PeliYhQc/mHAfmtp9Kfz4tk3L55PGb0T6be9Xh+t6z/wc3i9/b3XZzHWsosr6B8jxUkOxlpHgoqzpO9QYTJn+tLyL571FQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 16:32:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jane Malalane <jane.malalane@citrix.com>
Subject: Re: [PATCH v2] x86/PVH: restore VMX APIC assist for Dom0
Message-ID: <YzMJi3q7fNIiWL8P@MacBook-Air-de-Roger.local>
References: <59767cf0-8b1b-4418-db31-6b711518c044@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59767cf0-8b1b-4418-db31-6b711518c044@suse.com>
X-ClientProxiedBy: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b286c9-14cd-45a9-05b1-08daa09526d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Muw74U2tRGf1bfRLCXk0scv3rMdEm8NWRieyMPfgVS8vAOidc7z7PLYWUCi5DNVXIvMHxOXlhE/r1+aDyzMo1ZqHGX4N/uDd6gweEOnmDMq18NDNwD/RLQ0oX07Ot+5S+kN4BcNDKV4Ge6+UTYbFZbXRnJun7VuITDH3mF2RkYitlOIqQf4PlTU8BQ5NVz+w79X9PjaMEmQErSnI0pqNSjPKuYqxoVzt5sNQJLL+jRaUZEKXYUmfrKUiMvWL5w8//hBlVGM3ok9dTWT8Ag6tpHJ7gcA5J2+xaBF41JaHlY9wayDVWutUWMh9krujLBTbzAqtptvJ/QGWDeOa3VNJ9BHkfGFr5PDOHlmOUe+RGc/gF6QADSCM+rNZt/ZKkQ2qdL4YQxuRSWBpYvF0QH9FGz+VGO0ERchD4h2UkjOEwZ5xMoBr0x+FOk448yVDSY22RBVvWKWUmzU/S/jl6tcIX0r25Zqm+TiHeCL1DfZ2MZHzmthr1KahFLvLLM7R2S5wS/B2VYxx5jgM12pKhTaDVIV8uWfPhrjR8qDpUrQaovEGtR/35b8LQt2fCzJH911N/yIp1OfoUOalQTQ7Gl0kvzE341+Crb/sxGPVfou0XcEQdJlWLyWoPrERtQQJMtkYGGQLgxyQyTXhicATbA8qm5ASOjnxNGbYF6K85Grw66YFV5VPaaVZ95nAR2zNENMzoI3fpWwrFH0CHp3h8hGzcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(478600001)(8936002)(85182001)(86362001)(5660300002)(6486002)(9686003)(26005)(6512007)(2906002)(186003)(6506007)(6666004)(107886003)(316002)(54906003)(6916009)(83380400001)(66946007)(66556008)(8676002)(4326008)(66476007)(41300700001)(38100700002)(82960400001)(66899015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVhVTnJmdHJoZVlya21zbElCN0hPRWsxSjNPVzRvMmV6NzlHZ1o4RFNYTlJk?=
 =?utf-8?B?UkJRTGtEaXMyQWN2dklvaTM1RTRVWXRIWU8rRithUDhEaVRmTFNPSTNxVkN3?=
 =?utf-8?B?Q3Jlc0FxUXlNMk1qOUxkYUpoeWZ1NEx6aVdvai92OC9BdEhJK3d2WDgxTUJT?=
 =?utf-8?B?UnFuUFZGUm5Ob3FFZTMxMlFhVHgxcWs3Z3h1OUNUL1FxYzJpUm1sV0FVWnk4?=
 =?utf-8?B?RGRFWGRHQS92Mzh2TEhIelRRejVNR0Z4UTlIdW5iZUYveGlNRG9DaEoxbHlH?=
 =?utf-8?B?bmhwR0tuclZQUGpoTk5UZkM3QmZreE9la1Q1RTNTdmZ4ZmYrZEw2WVZidW9x?=
 =?utf-8?B?U0g2S3c1SE9JcHZKblBzS28zSEt5QUFPK3lJQ3BVazd3Z25qVVFFc21DdU0z?=
 =?utf-8?B?a0JUYm16OGNadHR0REFrUDZpU2VXM1VMMHArRDl1elBrelM5Um04ZVhNNE4r?=
 =?utf-8?B?cHRhZUQ2UXZxUGZJbnRmdGwxMkwyaWVXRGNuL0lpYlpGTmRsSklkdm1zeEFL?=
 =?utf-8?B?SEt1ekNKaTEyajRmTEJrU3pXSDVKekltd3dkaWZsQmZlQXkzOUcrcnFqQzhy?=
 =?utf-8?B?NklrZktZK3lNbHBRZVowL2t3KzRhN3BiamFFVUZNNm1ZWlN2UUpEL3d1dlMv?=
 =?utf-8?B?eTVxbE1kZWVUYWs1a0NhM2dZTFdQL3lZME9MRkdWUzA0MmdYOGlIeURiaGJY?=
 =?utf-8?B?TGhyL0dhN2pBK0VMbzhQTjFoZytEbm1ncHBHU2JSUW4ySXk5WHF6VUpMandO?=
 =?utf-8?B?VjZ1Si8xMTcvUUxjRHpMaVozRHRrS0hKNlUzRjNxS20yWUtUdnRDcUJteFQ5?=
 =?utf-8?B?T2tGajd4M2ZVLzhFZWdqWVFoRkRTSmhRNEtQVVRGNTQveG51T1gyL1ZnWDdv?=
 =?utf-8?B?TTZlc2RmR1JIVENlRmFHb1hzMDBDUE5KanlLQ0hEMzM0eWw3M2dOVFgrZlFB?=
 =?utf-8?B?NUUxdzZmdHFaVkhmZWlFZW1BbitjUkFYMXE1NDVXbHh2UXdVdERFZ1pZOHpl?=
 =?utf-8?B?cm9WeEwweFFWMTNBdFU5bjBSOTZaNVhBQkdEaWpUK2k0ek50RGF3a1k1OVRu?=
 =?utf-8?B?dTlRdGlUTHVsV1NYNUtJcnB4NVpCWFNnNDJrZHVxUU5QSzBJVmRMZnZrT254?=
 =?utf-8?B?RTB1cVp5TFpLVU93WExETlBxSDd4WHFxSVY3SC9rQndSUHVMMlNpYWtLZTU2?=
 =?utf-8?B?aFZPL1h6NEJRRFM1MmIrdUV2THk3ZUJMZ3VZS1NEQkw0L3p3TVlIa0o1UWl6?=
 =?utf-8?B?S0Z0a3B4NjlHSFJSS0dMZVRxODJTcU1aMXJLTGVUcVVRYVBtQnQyM3BXYVVw?=
 =?utf-8?B?V1hwNHFmdmVqQkJzSGlXajFCVkViWEt0dmFQTC9HZEozYWY2THRNRHZSdVQ2?=
 =?utf-8?B?TjJpUVJoUjB2cHFkVGg0WDF1b1pVVCt4ZncyUTd4SFRCYkVGcXRwaTY4enU4?=
 =?utf-8?B?SVorempkUGZNUXBoZTJkS3V0SmlTeHcwZS9TK3pVa2V6N2dIMkxWQjhwd3NY?=
 =?utf-8?B?RmRoaVd6VUNJcWVWY2tNTG8zSzFpYzZ0V2toUzAvR091VUx3Q1NSL0JUTTgv?=
 =?utf-8?B?eExjdlVKUjBHdGtUSVFTMExac1FBSEhHUkxkNmNjd3NNR05NeUpxOFRZc2o3?=
 =?utf-8?B?MG5EZ0l2cEhEUU02czFybkloM2ErRjR2UWVpOUhGaW5XM1VHeWdhcFFYZXh3?=
 =?utf-8?B?QUlxRWp0Z0p3SmlmZkZydXpNUGZsREZBcE9hY2piUzJlNm94dVFCdkdvYUhl?=
 =?utf-8?B?b3N2Rk9kaGNRZ0wya09RbkpmTHY0WDdOMXhJN2pDWnFxNGc1UUUycFF1TERY?=
 =?utf-8?B?ekRjUTZmNEw5S085NUxVQWU0L0ZmdE83bEtnZFoyWHI1U3JNSG00R0JnZCtw?=
 =?utf-8?B?UGZhOU0vVnVyNWdhMVNyUFY1elJlMVdPVjJ6dUJVeU1MQ3dsWlVnbkVnazRj?=
 =?utf-8?B?WVZOc2JGM0dTNzBpTWFjaFI4RkRDMit2QUJCOUcwNzJHb2R4QnZOR09TK1li?=
 =?utf-8?B?cmpjNFoyeTc2TDBha0hNY0plZU9ITHJCYkRsWGRDbUMzSmIvUFpNYXhuZkUv?=
 =?utf-8?B?anh4Q0YyQ2dMNUs3bmlnejhBU1ZNWWh5eEkzOUJVbFB2ckpxa0hRUmlCUjFD?=
 =?utf-8?B?cUJSVDlRVysvM0lkY3FpeE81VlVUTld3b3UyM0ZXRGwxTWxqYTlzMG1PQ1ZG?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b286c9-14cd-45a9-05b1-08daa09526d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:32:49.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x91WbHQ8jNp1bmC6PjLzB//fZ9S82gCyGfxnXoqlOKNVR3XY8M8morN3qIe197hJAoB++7jcFioY0ipLDPRy6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6172

On Mon, Sep 26, 2022 at 11:58:34AM +0200, Jan Beulich wrote:
> I don't expect it was intended to default PVH Dom0 to "no assist" mode.
> Introduce command line (sub-)options allowing to suppress enabling of
> the assists, paralleling the guest config settings for DomU, but restore
> the defaulting to "enabled".
> 
> Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Guard the setting of XEN_X86_ASSISTED_X{,2}APIC by assists actually
>     being available.
> ---
> Besides the issue caused here (the manifestation of which appears to
> correlate with the other fallout Andrew is trying to deal with) I'm
> observing further warnings, but I guess these have been there for some
> time (perhaps forever): When parsing AML and encountering the objects
> describing the CPUs, Linux would find entries with the original APIC
> IDs. If those don't match the ones we assign in pvh_setup_acpi_madt(),
> the kernel will wrongly consider the entries to describe further CPUs,
> which it therefore would deem hot-pluggable. This again results in
> warnings, this time "NR_CPUS/possible_cpus limit of ... reached".

Hm, I'm handling this differently on FreeBSD AFAICT, by using a Xen
specific driver for the Processor objects when running as dom0, which
replaces the usage of the native driver.  The only function of that
driver being the uploading of the performance states in the Processor
object to Xen.

I think we ought to do something similar in Linux and just use the
Processor objects in order to upload the performance related data to
Xen, but ignore anything else.

What happens on PV when the number of vCPU available for dom0 is
smaller than the number of physical CPUs?  Does it also consider the
unmatched Processor AML objects to be hotpluggable CPUs?

> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -767,7 +767,8 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> +                assisted-xapic=<bool>, assisted-x2apic=<bool> ]
>  
>      Applicability: x86
>  
> @@ -828,6 +829,10 @@ Controls for how dom0 is constructed on
>  
>      If using this option is necessary to fix an issue, please report a bug.
>  
> +*   The `assisted-xapic` and `assisted-x2apic` options, defaulting to true,
> +    allow disabling of the respective hardware assists.  These are applicable
> +    to PVH Dom0 only, and their effect is limited to VT-x.

Explicitly mentioning VT-x here is likely to become stale if AMD is
also updated to support the options.  I might suggest to leave it out,
albeit I won insist if you have a strong opinion about it.

Thanks, Roger.

