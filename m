Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8864F999B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 17:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301629.514855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncqdV-0001Y5-LK; Fri, 08 Apr 2022 15:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301629.514855; Fri, 08 Apr 2022 15:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncqdV-0001W9-I1; Fri, 08 Apr 2022 15:34:57 +0000
Received: by outflank-mailman (input) for mailman id 301629;
 Fri, 08 Apr 2022 15:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncqdT-0001IV-2I
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 15:34:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f197b2a-b751-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 17:34:54 +0200 (CEST)
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
X-Inumbo-ID: 6f197b2a-b751-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649432093;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XsBwR9IM+pr6MsWv/5so7RDZ99JVO48kd6S6+KN/TPU=;
  b=FLkj0n2QJrqNOVQvdJcNyHUF8TUic5UODJ4V9DRlocTrSE6XdZcZQe2W
   UEoZaK+SHn90XTH3i5zDhC+qqFK+fpxz92JuM3ANcSyqW3hdstKsjODp0
   Olh/3qvr96ck3YU/uU8b3XuSI1jsuSiZWNV0JRuDI6kmDs/KQCjGWaiCo
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68395549
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OEf6qaBeeyMqShVW/wnjw5YqxClBgxIJ4kV8jS/XYbTApDkr0zYFy
 TNKCmCGa/rYamb0eY1yaoS3oRwC6JLXnYRnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg28
 tNNq8yAbDwsN4nFpqMDaRYJSStxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjGxh250STJ4yY
 eI+awBsUj7/PyZhK1AUDokclqSswSnGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSRo
 G7c7nn6Kh4fPd2bjzGC9xqEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixQVICTiARWPkdscYSTAJty
 GWGzonjCmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+9L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTZ1
 JTns5LHhAzrMX1rvHbQKAnqNOv0j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VILtMIObCT1NPYfj2eN5yICl/WI+TPNDK68UzazSsIpKF/vEN9GOyZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TWcit+5MKLLbaSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74lxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:74TVz6jakMSrw3xU5ltHr3Unn3BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="68395549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX9c/KEYwZSzgf1i2UI5t9w+XlF0tnKsPhZTD0wDaOo6zXrwKE8CiXcvQ3Y0GHp71HUI9XdFIakCaqe4MaXD8/kUbg6zZJ03+I6byznGHrHe2hdZ6bcu4PCISWC1IIhM/be51R61oPmOu91Ig+1WAbGwnoERHLp6a2+jdcLZxzkZaNCL6nd7XVxp77noTwQ/dXOYp7f3GBCmdVN79RFlfsOAmLODY9O2eTF8Q6rrIRw7tiJPOQYcyIB0zf5hdFWWdr8u/pR8TA/DBmoiNtMwE7ducKo6N1IC8RXurvnQpJYJR4rS01LbjYX5BM2YoeWYmTq7JBrauCu2cpwxy0lvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJN07v4BYiGlw6dV5abG68LwUphAwtTST69GxUOUivU=;
 b=Ae6+uuVs81LHAYtXCFSTcYah2h0pXyIxXzSgieg95eVA2ipJY9Jb8ATGOrw9jgabPSqfst5GRgDKgNOzmk4o3cOP2wJWMyVIeSPpsBap5NvqhQJXrgyg7TxERX6djP9h3tKbpw5/kWvzPaeg/yp/fZjnsz2DhL/YQtMAheS+tBTE9F7jnHvmk+rqIQwvLx8WN/EgtS87bogPTkzUz8XV5CJUlNy8bZzHa7xK5LM02g6OvWba+L8G8HCpS/Nvh6iOoO7CAAQVEHomBv8zSs73lBnzp1X0mXwABPhBrEuvlVwgrZmbcEYaOXTfqG5RtRsMjo5tEeNSkziwibDhbR0mCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJN07v4BYiGlw6dV5abG68LwUphAwtTST69GxUOUivU=;
 b=Nf/H1MyVlifBt/CmijPM4yHWiTNyJoEgPT2o3uj4sMe70bPQ+2L/Ikbc0bTEbJdKkJWLNMpJs8C+GUwD85vG8UJV0L5Pb7ymDnVo8cNGgAD7iyjTAT1RjnNKznjBMeFAM8YFSHdO7rt5eTl2qRct2CzypVy9/6lLiZN0IqX+n/E=
Date: Fri, 8 Apr 2022 17:34:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jason Andryuk
	<jandryuk@gmail.com>
Subject: Re: [PATCH v2] x86/irq: Skip unmap_domain_pirq XSM during destruction
Message-ID: <YlBWE8W9HV+zwMWj@Air-de-Roger>
References: <20220407145150.18732-1-jandryuk@gmail.com>
 <YlAYMrirDQUz8u49@Air-de-Roger>
 <b1478c94-3289-7fb9-5d92-84a2803388af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1478c94-3289-7fb9-5d92-84a2803388af@suse.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd3cff9-e225-4210-9c84-08da197550f3
X-MS-TrafficTypeDiagnostic: BN9PR03MB6060:EE_
X-Microsoft-Antispam-PRVS: <BN9PR03MB606037A0B02DF6B5BCA4670C8FE99@BN9PR03MB6060.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2GtCBlkSHLLYEdxM1umosDrRckGR5as8JLRQxJPuGbpnDJ0MxgDOkXh44v9CQ46JiGIFY52MG28PL8N/EDKttLsypEazzySxortH6yJohhDSvKyCzSpkj383Ljv+A7uRYJxV3yxbec8e/ghvOVvn5OqlDIx1uR+EWNir4qv91bV65q3TrN6k1O3pK8DIEM2WCS5qSDC+q+HfW/7Wv7e9MpTw1U3mQf7tgK6il/KJsLswlVS0xwqd5311/MK9qFp1Mab/I61ewhSuZhTrfwGhgiOnPzOP/8+Vy6t7t4Bqg6iOtIQ9s1s6+nTUvtAg1iWa9lPWDalDcQTua8Xkstn+flOZ/7qdNjg8obcjEnAsRl3ywyysPeyhno3OaAEvJrjUzAPKBgWw7rqQkzVqgcdAwCVF04gRqYS/EWu9y12lcJpUgX+zvpHJGm1YF7fhHAZM/xotN81C8iS9273b3Wofl+dYqFAsLJdhnoy5wqCN7I3+lgRU4VqhpeLrtgBhbhHIwerIv1iA8/3eo8KsZnY3cSHQRfY+TGAe/ec2rM5P648BHo6k9whG+D7EFlnjaxt8HNeAB5cT/XR4jtdi47oOvh/fZevFE3xzpL4Micb0TCDjj3aP2tNb+IPDNjYrjVDXb9jtuH8acs5biHgHbTHHLylPKMWxjLqegLrqvWprHqt9r8kTjaH1jnB//WHDgsGhsqbXCMnkNW6GqMr4LacjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(5660300002)(6506007)(508600001)(66556008)(66946007)(66476007)(4326008)(6512007)(86362001)(26005)(38100700002)(83380400001)(186003)(6666004)(9686003)(53546011)(33716001)(2906002)(82960400001)(85182001)(54906003)(316002)(6916009)(6486002)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VENUVVdjd3bTIzWG9GZHFvRXk2WHpDcXRQd1BoSVlVYXVVNDl5b0s1L2E2?=
 =?utf-8?B?Z2lEU3hXWWtSVThZd3lISStZTU10Q0hUL1RHQlU1em02SnJuOEk4K3N0TUNn?=
 =?utf-8?B?S25pbU9scGJ1MDlMclRQeHBGMllYVlNqU21pY1IrTUxHTkgvSkxwNjJzR0pq?=
 =?utf-8?B?QVJJWEUxY25CZzdtQkNDZUlNMThSZ0FITnZ6M3d4T0w1TFI2NEhkVHliRllL?=
 =?utf-8?B?cHhsSFI5ZU42b3c0VHNLaHcydVlRc0tyTUU1TklyQVUxUEVwZjVLbVFZeGs5?=
 =?utf-8?B?ZjRFdkFRUVFPckpDUTJGMS9JbWVlVDJXMFBFWFZ2RFlUSUY0T2UyNFpVOHJJ?=
 =?utf-8?B?R1ZwOVoreVZSaGZzWWxnN1d6ZUIvNWpIaERPbzQrbDJMVnMzbjhkNG9qdEhx?=
 =?utf-8?B?ZS8weG5JSzhUcnJwWWZOUzl5b2RudFhQd1FYODJCZ0NwMkJrMGNwWUxBUEZC?=
 =?utf-8?B?czV1cDlYa3p6N2pmWlN5U2RZWDRXWDRoUktrdFBkRWh1ZXFSSjhPUHNGNnhO?=
 =?utf-8?B?U2JTc0JJUlhlVGMrbHV3UXhZQWdFQjBPUmdRUFhLT3EzYTU5SCtwVEp3ZWpB?=
 =?utf-8?B?VXJIc3ExSkNMUHd5SmV2MUx3NG5MdEM2Y1RSb2xmZm91SVJkTUVWTzI5QWZX?=
 =?utf-8?B?SFlSUTU4eFgwaFBhU2xxNkFmS2J0YWVOeXR4NEd6dU9tY1poRTI2UjM5R2Qx?=
 =?utf-8?B?Q0JrdG1yOWM1S2lzcHgzZmc4UTljYjRpVGZQeGcxeVkxb1Y2MGVIaG54ZVE0?=
 =?utf-8?B?eDZndVhnVlVaQUF1TndZVldRNnVIQ2JpdzhRRVAvRFQ5dTFabWJKb2xBNnpX?=
 =?utf-8?B?NmZ3amlpdCtXeS8yNERWUVU0eXJ5d1JmOTlqZEp3QktiWUMwZXF4MDFjUzdo?=
 =?utf-8?B?S1hDZDJTYlFzclA0YlduTGtzTWlXLy9NVUJnK1VXWFIxVmozOXFuNWlsNTV0?=
 =?utf-8?B?YzFqYmNFUS9WcmtJNm9ZaWIwUGc3bkFYQlgzY1BYQmNidXFhL05BQ0d2N0lK?=
 =?utf-8?B?NUlHU09MMGFSSDdEVmgwazBtK1Q0NzV4THhNYUh0eG1RbFlHc0phZHM5OFVN?=
 =?utf-8?B?TlQ1KzFyRC9MaUFQYm1KV3ZYdlRPNXoxQmx4M24yN2lpNWwvVWFROVBQb3I4?=
 =?utf-8?B?WlNHYzhxcXdLV2lIYzdLQjI2Z3IwbDU0blFyZXY2YkFRSjVFeUhJSjhISkhN?=
 =?utf-8?B?RlJnd2Jtak03bm02VGVVOVdyUzczTjY5bmcxT1MydE1pVFhoTUpJdkhGazdL?=
 =?utf-8?B?ZFBYeDNsQVN5d1lycU91Y2ZyOVM5ODNsT0gyVlp2Q2E3V2tRaEJ2U1pSSXhx?=
 =?utf-8?B?REtWaDU5bkpIaFAvNHdHTEN5cGhnWFp5Vkh6VHErOFVTa28rQXl0ODYrQkl2?=
 =?utf-8?B?MEYyZldNM083eHpaSGlSeVV0ZDl3RHNQM2hWeWpSK2JHV2I1OTRqOTNFMWZI?=
 =?utf-8?B?UmhVdTJXb2dEV3ZjTGhtRnJoV0o3VFFWaGpybzV2N1RoWWFlQjhrZUJrdG5n?=
 =?utf-8?B?U2ZDb0h5anAzckN4MU9Ybml2Y3pzdTJmcEhrTHZZVVpiOWN1SUM0cEw5ZkRJ?=
 =?utf-8?B?ci9VeTNmTTJoTEVsRnB1QllWUVRva1hDY0JGUC9GTlFxTGNEVGpDMEpiUmJB?=
 =?utf-8?B?b2g0UGRlUGVMcnZQNjRCVnkrZm1zM3ZTQmh4QXF1MVNZaWl5Yy9FVzRSUFFI?=
 =?utf-8?B?VlhRZGl4Y2NHcFZKSDRGMFMzSUIwNkw3Vm5DMlFaUWE4OXdUcW53aC9uYUtI?=
 =?utf-8?B?cEFERG1uY3ZJaXZIV1JXbkVibmRBTmpZdnhwQ3BrV21IdzRaeUV3MVJTTnRR?=
 =?utf-8?B?RnhhblZBNTNhTk9GUTFGUVZ5ZVFuTUdQRmJQNktNOGpjZ0NQdEFFY0d3NXZn?=
 =?utf-8?B?Z2dndWtBNno4a2VFOHprMXBjNFBjSjhpRkNKSWRLNThQNjhLSWt2NGJVS1NI?=
 =?utf-8?B?aURJSHdwck1rYWVLYmlBTnp6TnJReGdhWUFkYnpBU3N1b3lmVys2MTZubE04?=
 =?utf-8?B?K1MrclJ5V2RVMUFVaGd1RE15YTFDdGtZZzRCTFR5TGlnSXRnZWN2Zmk3S1Rr?=
 =?utf-8?B?TTJOZ1didGQvbVRabjdTcWNtemxMT0NXR085ZUtZUlIwcDBqclBNV3Q1UkRH?=
 =?utf-8?B?OFJCTWRFbXFqUVh0NFhJbkUvamh3cU9TZGtIaTI1aFQzTVBjNktQWEZzbjRM?=
 =?utf-8?B?WHhGdThWNmxhVXNSbVJvcjcxR2VSbm5zMU5OcTgvLzJwMmVjOHU4QmRVN0Mw?=
 =?utf-8?B?SGZOOGtXUnJmZGdOUkdJeGoyVEh3T3dQdzhQVGMyditNSDY2NllvU1dkRWRT?=
 =?utf-8?B?RVM4SVdJM1Y5dlVsNkdkYytmM0FWRmU3SmVsbE0yWEhyUktXbnIzYXR5SXVU?=
 =?utf-8?Q?aT3r1N5+wv76Yhps=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd3cff9-e225-4210-9c84-08da197550f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:34:48.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c9i9DHjRUxSAsXIM4y5oEmko843a9rjPaj1SbUe2cJ0mP2PxveMhvucEHeXu1ISdz+rPyi1nZ+Yspr9K+lnMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6060
X-OriginatorOrg: citrix.com

On Fri, Apr 08, 2022 at 02:04:56PM +0200, Jan Beulich wrote:
> On 08.04.2022 13:10, Roger Pau Monné wrote:
> > On Thu, Apr 07, 2022 at 10:51:50AM -0400, Jason Andryuk wrote:
> >> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> >> complete_domain_destroy as an RCU callback.  The source context was an
> >> unexpected, random domain.  Since this is a xen-internal operation,
> >> going through the XSM hook is inapproriate.
> >>
> >> Check d->is_dying and skip the XSM hook when set since this is a cleanup
> >> operation for a domain being destroyed.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >> ---
> >> v2:
> >> Style fixes
> >> Rely on ret=0 initialization
> >>
> >> ---
> >>  xen/arch/x86/irq.c | 10 ++++++++--
> >>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> >> index 285ac399fb..de30ee7779 100644
> >> --- a/xen/arch/x86/irq.c
> >> +++ b/xen/arch/x86/irq.c
> >> @@ -2340,8 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
> >>          nr = msi_desc->msi.nvec;
> >>      }
> >>  
> >> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> >> -                               msi_desc ? msi_desc->dev : NULL);
> >> +    /*
> >> +     * When called by complete_domain_destroy via RCU, current is a random
> >> +     * domain.  Skip the XSM check since this is a Xen-initiated action.
> >> +     */
> >> +    if ( !d->is_dying )
> >> +        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> >> +                                   msi_desc ? msi_desc->dev : NULL);
> >> +
> > 
> > Nit: I would remove the extra space here, but that's a question of
> > taste...

Er, sorry, s/space/newline/.

> Which extra space are you referring to? The only candidate I can spot
> are the two adjacent spaces in the comment, between the two sentences.
> But that's several lines up. And I think we have examples of both
> single and double spaces in the code base for such cases. I know I'm
> not even consistent myself in this regard - the longer a comment gets,
> the more likely I am to use two spaces between sentences.
> 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > I wonder if long term we could make this cleaner, maybe by moving the
> > unbind so it always happen in the context of the caller of the destroy
> > hypercall instead of in the RCU context?
> 
> This would be nice, but when I looked at this long ago it didn't seem
> straightforward to achieve.

Right, I don't doubt it.

Thanks, Roger.

