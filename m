Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2304C6566
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280241.478105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nObyZ-0000tc-Sz; Mon, 28 Feb 2022 09:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280241.478105; Mon, 28 Feb 2022 09:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nObyZ-0000qI-PD; Mon, 28 Feb 2022 09:05:51 +0000
Received: by outflank-mailman (input) for mailman id 280241;
 Mon, 28 Feb 2022 09:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nObyY-0000qC-Kj
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:05:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cef33c0-9875-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 10:05:47 +0100 (CET)
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
X-Inumbo-ID: 9cef33c0-9875-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646039147;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hXUX3ogSgr+uWXDjRyYtFEqLy0Ijii3Rs+mT7X/SVpE=;
  b=Yyt/iY1WIjSKjM1T0PuwdDYer0iKfUYzr/GMiOnLjxJ2qnDv19FNSQjc
   rusxne+RHjabAxavXSgE3dBZpT+f8FIXbCVwe2IesfbhVs7Awylh8Eal8
   WLc6jzBmtvZ64AfLbo7I5x6Fw/bucxvFIMFqUppsOyf8u16aB0wkQIY3v
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65110200
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K510lKLaGGtQQ2fCFE+R6JUlxSXFcZb7ZxGr2PjKsXjdYENS0TACz
 2pOUG3Va/mKNGajf94jOt+1pEgEscOBzNQ3S1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O9qlaaNQBcCArLJlbQ9FBpGDQd9IbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt35kWR66GD
 yYfQStVLxGQcQBiAxAOBr84oMOqnGfPTxQN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTWp8WFbC+3u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LQZIkIeoQGK2yqiRoGOSfisLM0kBeTBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuqzt3N702wcH83wdG9KFoSPLkWd4umwWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5C6GEMYMXPsYpJGdrGR2Cg2bKgggBd2B2zMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+x/UFzrqTp
 yrlMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F+rYSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:suvc4KnlmPiQHSpqPPPySoRHH8rpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65110200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLGm5RMT/g/6bT/8OFzTaUbQd/NnR8jXrdoqEizTJShe+Clg74+qdaNcBl+uDXu6tKk8vBREW0h5ZOwtgT7iywvgkj7pYq+nUsRTc5TkYlFVEveUD3PFXOKQ4c9h+uzF/hJHYpEAzom7bYOX6n03BpBxvzN+y67bObnOVfJQMP9YiqMB62x4zpAyFKvVjQtlXSaQ7FVVhwwWRqviznF5Q/Rgh1VzA7B3ZB73NY4y+sPuGotBMooFGCFhtYuXLqWv+l1aphTmipcVrclN7hotjtuvda0rnhK8jxwts0Y0E+Lpf9f2DLRI6uuco52+fC1DwyXVlj+Pe/HB2B30TzewMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc512v+N1e9+TYq6gaRrUt/eJWWCxP41BROPs5SHyhA=;
 b=UgaMHLpBix+kBNkyDppjNEMkwErrBFdcceO39z76IP0R/8pH9Oup9cJMkO+W7JfN7Awh+zDvEv3oild4s/S7H9X8E12lAtwtKHHyYFh4M1wHXZ3a7fJWXAWBL8WBkt4e6ubfc5vMGjMAAeso39mcTRPgtTdOxyu2bEf45SR4p7Pi8GTOQv6xl4BATHahLJDIx0yDtJYc7Dij9obULdc8F/wEO0rKSnUBUlZr8J9tM4eaXa4o+6akA8NWd8u9gqaxgDkcJoxrAbyMPU8VwLOuqemelELEXIYqqfBpqrhlfB9K1i5b/6IWxqmulQ/PYPzFbJDBgLrCFZSjL0TByafKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc512v+N1e9+TYq6gaRrUt/eJWWCxP41BROPs5SHyhA=;
 b=JFz/XuxesowsWQZVgVjWuEgBjF6j1QIPCB1Ad1BqfGBf3ahPXk6g5b3duvN4GRO6iPBrgZIrEL2UbchM8ieyGfBBDJMeadCgTtM1egLxYNrEI/ED2RVyI/A8spSz+40C9Q3/ntdgkPdgmRa9r7zNt6WRLBgU/R3haZcUGt7lYnU=
Date: Mon, 28 Feb 2022 10:05:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] codeql: ignore Kconfig
Message-ID: <YhyQVqTOCErd7j8+@Air-de-Roger>
References: <20220225151931.99848-1-roger.pau@citrix.com>
 <20220225151931.99848-3-roger.pau@citrix.com>
 <8b7dc698-3fb2-3ab4-0998-ecfd35935183@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b7dc698-3fb2-3ab4-0998-ecfd35935183@citrix.com>
X-ClientProxiedBy: MR1P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 746a4404-ed38-408d-1718-08d9fa99789d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3963:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB396307FB71A8FE7C1B869B0A8F019@DM6PR03MB3963.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKMEdMY2JNC4XFjanSSg0V5sQXsgq+tz4fxA4DSfwrH453iaS+rjxPGCU6+TT07zaXbG+0cWSLRVjdtukIyPQ1pe097Su2C52yknmjh8Qgn4X7zvEbIkcVzN1kvRas0yNurEdgROIiwW6iWR+05xnSPeGRtlovWuWFP8hwXlv9tpfBL+Y2Xt793MV8/fymlLWqhqr4P+EZAGp1QXjEN9yWhvUqFhWuE22if1xO8EEOJ2RfGQrdsY/jVwfpTzLa2q1UiQY1oZJo0cCFgRl6mhi0fuWWe8s4hHqzQjQYL9OprRafduiuZIasEhPO+tI8zFfTlxKo6WOlzZuoMmOvmXsjR2ZhnQqO8NLpMklM8y56XUsHIzVKQkb51lGrtha76vL5AwYwOrnQ+e+LjJSxPfaVxv/8sNJsHS3doh8O4Oe1apUnwXkuy2b4rn6Ws71jEMuKMkN3LvXhz5egOi46ayQhBfq9ubVQhQ04JmkXao6Pc/5TWDS2oNDrJaWhghZE61AOC+6m5NwhK9JAwJBj0Nom+HL5ac5rli3VLgilSZgpMLM9T2uIZqHnIBNJuV5VDHCNUYz6tVGeAedirm/k7pRD4RwB/emr04c8WU3J2pXsIxIXQPNPLXm+oGdRWnVm/K9noLJHqXVfO1W9lunC1bYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4744005)(26005)(54906003)(6636002)(83380400001)(186003)(38100700002)(6862004)(86362001)(66476007)(66556008)(8676002)(2906002)(66946007)(4326008)(9686003)(316002)(82960400001)(508600001)(6506007)(33716001)(5660300002)(6666004)(6486002)(8936002)(53546011)(85182001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JmYTc1c1p2aHBlYy9TN0J1K0swRjc1dDZXcDhGRFFCWjIxZEx5YTdwZ2xB?=
 =?utf-8?B?OWdYQ09hbTlqeEIyNXNzT254cjE0MmlPRmVyalQwd25FTG1PWlZ6N1JTOEdQ?=
 =?utf-8?B?YnlKYWdZZTdQR3UyRWNmRm0yRThjeUNLa0ZVdWc4QjhQNFJaVzFJZWJzMjB1?=
 =?utf-8?B?WGtibkozMEZmMTVpUG92bUNtRzRnL29ob2JDZ1o0RzNCOVlVT1hIMmt3SHJ4?=
 =?utf-8?B?NnRadWZQSUJ6bUhoK1FaOWlIZ3dqTEREVWJZS3p5dGtxQ2lrUDJmT09kUm9k?=
 =?utf-8?B?WmFmUmpFMDFVb1V0bVBtMlVGKy9CVC9zNkkvQXJCTG5FSVRuR0NXTXk2dDRv?=
 =?utf-8?B?cmtPYjNDKzN5dStreHh3Ry9xYTZGTmwweTRUQUtSZ0NZa3ZIUEpOaHJLWlRr?=
 =?utf-8?B?UFZBRzI2NmJycERPWEsxOUxjU2xQcWVGd3Z1NUVUaGRUK2N2OUZ4VSsrSldl?=
 =?utf-8?B?eGdNeEZBZHpFNUNaTlFpMmJpOGp3Uk5PeHZ0Z1hGdGlWWG1JWkFiaGpONjR6?=
 =?utf-8?B?TjNXSkc1TllXbVlwMGQ4cGZDcUFIZ0pHT3hLMm5mSXR0dkQwT1NsU3JzWHVs?=
 =?utf-8?B?VVZUanZiSGRtMTZwVUlDMmJsK3NuazRkQnZWSzNyWEJJRDlDVXltam9kTEVJ?=
 =?utf-8?B?WTc2VnUzSmpXQlNSaVEydXpCcEdKUTFySXE3SWlDQkVVUkFSOFNuOExleDlH?=
 =?utf-8?B?d2djbVBpeFg1bDNoQzVId0tlZElQQ3pQRnl4ZmIwdUM1OWZYQVZreHVRTHNE?=
 =?utf-8?B?a0ZaVldjNllRUjhyRDJaQmVjemgvMDVrdU9pZVJEY3AzK0hSaDQ1cGZ1T2Nj?=
 =?utf-8?B?N0k2UDBjbFBmVDI4YWFRODlaODRZM2Jic3NQOGlDMWc2MW9INTFSOE1xanph?=
 =?utf-8?B?OGRlbjdhRmVnZEpGdE92TUVsdWxteFZzZHZ2emFTUmtPMFAvWllKWGVBYmdT?=
 =?utf-8?B?TFdkcHZRS2ZUbDRmUFFGMlFsTkgwdVlvdEhiSk8wUm12VEFiOWVBZDM3Wits?=
 =?utf-8?B?YmJSOWRiYkVFMlY5ZmFpbnY5V25yaUJ2dGx3MFhPTDhUSkNpd08yWGc2b2Js?=
 =?utf-8?B?YXB6WFpXT2wwZ0hIUDEvZkpleTdPZlAyYmJ3OHlFdlU5NWlSM2phWjR0M1Nj?=
 =?utf-8?B?NWdCTWZVRU9HYTFUT0pweVVpNkdVbWRrYmY0ZmxwdXFlaVBuZHNhR2R3anE0?=
 =?utf-8?B?K3kveC8vaDU3Zk0zOU9JcklTbFFsV1lIL3Z0MUZRTER4WW95R2pCSkdZOFEy?=
 =?utf-8?B?NFJsck9LbVBOa2JmcWNtL2c1cS82ZHU5aTBPWmc1Ri9zODBoQzVOaFprdWZ4?=
 =?utf-8?B?VTVLckdXQ0puNWhrckVScFZzVS9VaFB3T0VHb3hBeUVUOUJxN0lJajBscDZu?=
 =?utf-8?B?ajVEV0ZWWW5LcFN1dEhPaHdTQVMyUmxFN2IvNXZKV0xCcExBd0VyN0tPTk1E?=
 =?utf-8?B?NmZxRXhQVytNNUxCZ3JlQno5MS9BZ0c0MmJ6dDZIUTFRNUx3SnF4M1d5eWZJ?=
 =?utf-8?B?Yk1GYkJYbzYyVklEZlFiWjV1b2UvN3JSL3hFL29VMFRmWDhneEQrSnJVWmQy?=
 =?utf-8?B?REl0c1dISnBHUzdlanA2NGZmZ3JlZEx5WTJWVUNFU0FvYnhMR3A5dUVrZ0l1?=
 =?utf-8?B?NzJ4RENRWGxtaFpEZ05HbldzY3Z5d1lia1ZEUnZ4ckQyaVVJQkNWbk1lL3pT?=
 =?utf-8?B?ZWk1M2wxVnJIUXM2OWtmSk5yTGEzcDdIcG9VVFdoZUdid2VoY3gycEtLa2hk?=
 =?utf-8?B?SWIwZTAzZmNsaUF1ODNQS1VSOVZsYlViYlZQczZQNzQxLzQremhweGRDZlNs?=
 =?utf-8?B?NkJ0M0psWmRxbE40VmVCQlBwUVFkUzBlRnZveVhHblBXeGlmTUFYZ2VMdGRl?=
 =?utf-8?B?Y3VQb2VJOEpwMHRVdlFoTW5zS2QxS1dGYzJBTUFGdEU2WFIyRUZ6blByK2NT?=
 =?utf-8?B?VnhsNHFYY2FFY0hmWWMxcCtGNmJrelM0M0lNY3lrNWNjb3N0Y2Y1eXlWSFda?=
 =?utf-8?B?Rk45Vi9TWGtaTGIwTzRET3RxdE1NTmpvOXdJWDFaQldwQjhnM1lLVC9oaDFy?=
 =?utf-8?B?OThzT1FyaU5JUTVKOUdCVDhnV1FQNEhhaDh2NThCLzV6KzZlOVNhUHJOdXc0?=
 =?utf-8?B?ajlWb0FWZ0pxY0xYc3VDNncxSGUwZ2dnR0d4bjM1UkxYemo3dVRNRnBVKy9B?=
 =?utf-8?Q?1iIsnisVhLftMxLPWvQ8Eag=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 746a4404-ed38-408d-1718-08d9fa99789d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 09:05:31.1230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGq3H6arJ4LH3G7vGH2umn6sUe34qVKxfWn4gAbwLWQZfoKUr143qOpDvnS6XgUIMBH6qyaweYpOsxp5kkjJag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3963
X-OriginatorOrg: citrix.com

On Fri, Feb 25, 2022 at 03:39:22PM +0000, Andrew Cooper wrote:
> On 25/02/2022 15:19, Roger Pau Monne wrote:
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I agree with this, but it looks like it wants to be folded into the
> previous patch.

Can do. We also need to add
tools/firmware/xen-dir/xen-root/xen/tools/kconfig/ in order to prevent
Kconfig from the shim also showing up.

Thanks, Roger.

