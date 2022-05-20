Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997E52ED47
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334160.558178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pf-0005z3-Am; Fri, 20 May 2022 13:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334160.558178; Fri, 20 May 2022 13:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pf-0005wV-6X; Fri, 20 May 2022 13:38:19 +0000
Received: by outflank-mailman (input) for mailman id 334160;
 Fri, 20 May 2022 13:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2pd-00056k-80
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19efacff-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:15 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:38:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:38:13 +0000
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
X-Inumbo-ID: 19efacff-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=J60n5jqdMwAAtpUd0Sb/CZ3lcfzBgmMhxbvEASQztDY=;
  b=FkDBc4HdQSZtbwzDE5HyrsU7/IeODNJYkrqzToymaBT6EWDqzVDNfuP3
   R3BqWJju3CHcL6zaiUVmPMSa5W/FIs6qootsH6gwLtESx+XafjgRBduVj
   vkW3ldggMkRTPApBqGt4qh6IBjD8NV4wdjzbOqVpV1GxLemK4Gsbr5goa
   4=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 71650041
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Uu/+oqI+0vddXpeqFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS1zdTn
 2IfWWqGbPnbZGSjf4wjbou1oEkG6MLdxtYwSldlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Qw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M0OhYGbbiMTB4bFnPsPCEhATgNuGrITrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2bjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SChLmUA9Av9SawfpDmPyyEhy7jWHteEReGUHe9zhR2Au
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLlazd5l/BAnBeF2YQLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:F/M/Za/N+YyP1c+K3ORuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 Ohz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlOl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QVEJgUjtYkid0w7heMAoql/lp
 r525tT5cFzp7ctHMRA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71650041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbJGrKihM0r4M17xmkPV/SEIjd4FyOAbocPk/LZPF9gHqy1NxUb5jtNw0KJVJBDx4zXrhv4eFT8RTDQmuwLmUYxJlemWrHtSwK5Y9WbQbQQYhWFgpzHRods8Vvwlw8iufCmze8xGzjJP4f8VqYk1oZkjbkQFEfEmieFcVxXnIqG/oGv/mSA/z96cq9t3gco2fhXWH4BP4NHFy+kc2oKjXbcj8uQos78kdkdUCYE9ZmRaNa7pjDrRVb7DdDpVjzbBzF1raMZeZq4PKLrW8qnbDvoGLm6H8oHBXKbWSO/8gVlDD0XoSE99SDiwy/BZ391362M7NkNfhNmpmrWmCdtGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb7AH61H+rViXQ6rYuunouCojzr47RKHvH4ITvQrb1M=;
 b=HnlQwv8ZZv6kYAuzvlJZeerFwrr+8R7vunmu/W2yq8numw3HTuWujb7ip5Jf3xijku+ON08BHKMViRO124ZHuFSqa6HJhG8v1bvKueHi08tJIAtUrtHSq/FmHkfv5Gok6KcYtUf1ezLmMlPe9JeTmh8C+Zbf/NZ07ALxUXQgQGRhwGyMHPwMVQaOdtvFYE2h3TroIbBMqlLtDzQLy1s9gxoLANEy2Nalb+2hiwGuhjGBm0EXtQbn1MXewTi777y2ykFMqt+ZpIv7B1bW2uI3Zx3msxHhq04A0IB19Gb1g3Uyo5Wg7Fn5j/d1J1gLzTRZQe0hi0zepsvtJxyaIjvAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb7AH61H+rViXQ6rYuunouCojzr47RKHvH4ITvQrb1M=;
 b=oXOgOcc9nxATnQSwCWHGdbHypyIm2jzuVBO5wuPbdyXjycxiU5Rs3G83cHQn+ggNxfI+TdGLSw4As4joJJlK6W18YXBUW9+9faV4rJHYJ3jB5O+h62puiigw6Gjc1mBbolV6rTZGUynZQrZTMcHIzU+IGZnOgXaY3OioWEI6uVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Date: Fri, 20 May 2022 15:37:44 +0200
Message-Id: <20220520133746.66142-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dbe4ca5-8e86-4749-6211-08da3a65fc79
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5755D467032183B5C6926D538FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D5ZuQ5twQWWZI6Q5yKWXfz/vbSX7YRKS+g7H9K4ZZUeo7QJxpD33/2qkJ6GN1uVz/x20DsmnM4XTSp+REPlR2/zgDz4Oqw62hQOfq8Eup/ftnWK5oUVZ6nN6p0tuwHfJnGOc8CDsHvrN4Mw1ywgFggYWPK/M0y5AEDUKIosUXntsSSlWl7MAWq7077/JZ/wg259K/VTZPOde6wlnE1fvbdz5iyb1Hx0ryuvBSpiF3Iixge7wlAULKO3709/HfO2+lmxEjN7uRtNgV6Uv0GtyzVrZY0kbdXDPXTNYIy3fmgmbeJI53u1tUybB241bC1wqyBnN0Dq9LVpnr68jBHkaA8fwNa7KOgOPJNoQc/YjTZH9eguuf0ujah1VcKaThf758FeFCXQmj1ZxqdyQE9uOvYFugn+NWDXSE7AKL874xUI25HH7W18CVuzzfNiOy2AQG/9MMKqAf/WDATPS/C6eI6isY5HbMTgPpj3AJzRalRgzLZSSlcC0Kcjk7aytHxh/3Nt2AcWEmI+GhAFjq1zgmySpKC/JTP8F967wGugz8qwSdtQpKampdlobqAPSgRsSA0FVQjYFClfetWXdcrNwRT7AT069QEq/oRa0y2Op1YsDGLLCZUzCmZpxaWxDBNDHeP9gSPqYxgcxpXrKp5HatQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2thc2twMGlOL2drY2xLVE5jakJ1Mm9MQVVaL0RzTlIybU5yenVaMWsrMVJM?=
 =?utf-8?B?cmpCTXIzNUdWSEJ4Q2daWU5hYkdCUjlGaGVUNlN6dCtTWjdnWW1RYm1IUFlv?=
 =?utf-8?B?RVNSMDc0VmV0Vk8zaDl0cDZKNTBOMi9lQUFRbURhWmdzZmM2QXVvSmNYN0Z2?=
 =?utf-8?B?SFdIdUxKdmRZc0FCSzJKU0RWY1ZzUUNtOGpqcU9jTkl6QWwwam5lbGphaXdI?=
 =?utf-8?B?NzcvRElXY0pJNXE2dUFMUWI5NzdvQm5MYWdZUVg3dC9nN1Y0M2dZRWl1UFpQ?=
 =?utf-8?B?RUptWUdYZzA3MjMyRWo3ZlplbDFQZER2VGt6Z0o2dGYvVmNBbExIL0QxU0g4?=
 =?utf-8?B?R216cS9Yamh4bWpnQ01oVE85Z3RtVWlmQWpLSXJoSW5rMzBmN0ZlUTVyaW8x?=
 =?utf-8?B?QlNRbUtEWjZEV3NNRGwwenk2alRQcjZIVHpGZ3JYQVp4NDYrWjd3Tml1Mjc5?=
 =?utf-8?B?WFpSdUtjNkU0RFNGdFViTERqZmFjb3NSUWo5UDZqTEZ3NmtoVExVeUdXaVRC?=
 =?utf-8?B?WFdjbzJESHZjN3lSNzNuZC9ReHJ6Y0JkbjdrUm5qRXY5bmxuSGkzNm93NmJY?=
 =?utf-8?B?UVovMGovQ0R0U05kTkVUTjJ1OGZ6SWNoVnBEcE9LOG1XMzNwbktsQ3plSWhl?=
 =?utf-8?B?czlYdGdjOGN0YkpOMG1LaGE0WFlGOW45QUxxMWhiQ0g4MnRiYSs4alJIQUdM?=
 =?utf-8?B?L29ubjlVZ0ZuYkoyOExCUlZDVXBzcGRmRlBoVEE1NnBab05oRUFpSWxhRWFz?=
 =?utf-8?B?L2tBUXN2enF2UlFVYUwyemNsZVpwM2NuellZOE11cGkvczk0TTVWcEhTY3BB?=
 =?utf-8?B?aTVVNnNBUzl2aXcrZVlCMzZZUnhQR0JCRzlyZUZEaHFNczJmenhQNFBvQytC?=
 =?utf-8?B?QUpYVE1uL0NzQlAyeG5vTzEzclVYQzJwRGJLVzhQaGF0dk9hZW9ESHFHN2lX?=
 =?utf-8?B?dlV3Y3NpL3lsM0QxUUk5ckFidGJBb3BWc0gwc21IM2h4Y2cwREhTWEE3WnJC?=
 =?utf-8?B?bnRRZWIxbjRHZlZnVkoydlZCVm5OMXQvcTlQem5SQktSYUNUVTQyZGdJY0Za?=
 =?utf-8?B?VlQxa1A1T25OSGFhaUlGZEpJaDFYZnMzakdlYTlxdll1Sm5zWnVOZVhiWHY0?=
 =?utf-8?B?L3FTOVdodGV3L1JZeVlOSDA2THBSUGRrZ3N6akt5YjFCREgrSWZDcFc2TDVm?=
 =?utf-8?B?YmRYclZPR01oMVh3dXM5VzFkZWEwenBJM0ZtU0NFWXdOU3pINEpyTUlZd3hJ?=
 =?utf-8?B?dFpscmhTUTUweTd6TXUxYlhMOEhxTVRnYytJY1k5Q0h1VE5qSXBFUDMwN0Z2?=
 =?utf-8?B?djl0UHIremcrL2pKOHF4aXoxOENBWHlaSFVmYXhyK0Q0RlBLdlFhNkl0d09m?=
 =?utf-8?B?RFJ5MUpzcHlpcjBHU0pqc0Z2SzFuaVBSZzZKK2xEU0RPNjlYdWlaQWRxR1Jj?=
 =?utf-8?B?cWV3SS85d0o0VWVpbHVtdTc3UGdLNVlJVzhXVTVUaEJ0b2tCOFpvQlRoVFR3?=
 =?utf-8?B?TkxJSTdUTWhlQ1krWmovdmg5S2FLNTlnRStNTzJWN1ppTmdWbVUwaVFOVEZh?=
 =?utf-8?B?Z3RXRWRvZWFxTnJxaTV5dkhQYzc5a21FTkhNc0FiNVZpSFBjakRzTGpDcGp6?=
 =?utf-8?B?U0hIUzZhTHdDZU90VGJPa0FQQm0xTXlSbFFDMk1aME5CRmt2ZXVPWHpNeVB5?=
 =?utf-8?B?Y1RMb2JNU3c2dWF1ZWIyWlVYNWthWmZSYTRLSCt6ZURuc3VsNWF0SHdDZWo3?=
 =?utf-8?B?ZGtMZ01LSUZNWTZJVVA2dnVvY09TeVA3T2tOL3M1S3R3bW1URklkYmw4VU9s?=
 =?utf-8?B?aDF6cm44aDhLNzdmbUx0QTRJVUd4OEpqdTlpVndyWnhsNFd3TWk3STBzZDQ0?=
 =?utf-8?B?cDIvLzQybUY1Tzd0ZUx3ZS94dTBnenl0OVBaU3NCVHlhblp3V2pjYUJUbUNG?=
 =?utf-8?B?ZjVNQVZnSW5YZWtSQ1ZLcmd4bFV5bEZGTzVtTC9zbHIxQnNCS2pKcGRKa0hw?=
 =?utf-8?B?aGp2WGVoUHRQME9LNjZvV3hKZityTXhhN1BYUVlJS212elE2OEpWQmNEYmMy?=
 =?utf-8?B?dFh0WmJEU1FseUg2UTBCbFBFbmFJUHRIT3NXZWRndkFGdkR3bTBTN3c5SWQr?=
 =?utf-8?B?SVB5dDVyc1NZUGlYNHFDakdGYU1wNDdyME0ybHJwMnUwTTBObWZRbTQ1SkdS?=
 =?utf-8?B?YTBVdm1kcy9mZXZWcXZuOHFkR1p5UU5ZTHV4ZnY3dTcxQWNIYTEvME5PVUpp?=
 =?utf-8?B?aXBzNkFjbEp0c0VHY0xSR2JFdmdLMXdBS1Z4QkVHL2F1aXJtRTNrRHFQU01h?=
 =?utf-8?B?Kyt3ZFlPOVQrdW5kdVdNTVhKVUhPU0ZwTGFWOWxMcnZnRU9FejNyMG0wUHpu?=
 =?utf-8?Q?9nRzTTP9uyiU98kg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbe4ca5-8e86-4749-6211-08da3a65fc79
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:38:12.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNNpOi8NGp+F6DbdhXUz9umrfUEqhjwPO481hSocSpS9zT1+5uyiJnsT+wBtHgnaloUewubdGK2Cx83rPEbupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

Allow exposing the PDCM bit in CPUID for HVM guests if present on the
platform, which in turn allows exposing PERF_CAPABILITIES.  Limit the
information exposed in PERF_CAPABILITIES to the LBR format only.

This is helpful as hardware without model-specific LBRs set format to
0x3f in order to notify the feature is not present.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Seeing as we have never exposed PDCM in CPUID I wonder whether there's
something that I'm missing that makes exposing PERF_CAPABILITIES LBR
format not as trivial as it looks.
---
 xen/arch/x86/msr.c                          | 9 +++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 01a15857b7..423a795d1d 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -316,6 +316,15 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = 0;
         break;
 
+    case MSR_IA32_PERF_CAPABILITIES:
+        if ( !cp->basic.pdcm )
+            goto gp_fault;
+
+        /* Only report LBR format. */
+        rdmsrl(MSR_IA32_PERF_CAPABILITIES, *val);
+        *val &= MSR_IA32_PERF_CAP_LBR_FORMAT;
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index cd6409f9f3..5fdaec43c5 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensio
 XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
 XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
 XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
-XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR */
+XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR */
 XEN_CPUFEATURE(PCID,          1*32+17) /*H  Process Context ID */
 XEN_CPUFEATURE(DCA,           1*32+18) /*   Direct Cache Access */
 XEN_CPUFEATURE(SSE4_1,        1*32+19) /*A  Streaming SIMD Extensions 4.1 */
-- 
2.36.0


