Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC955287F0
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 17:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329986.553291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcHB-0005Br-Kg; Mon, 16 May 2022 15:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329986.553291; Mon, 16 May 2022 15:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcHB-00058g-GN; Mon, 16 May 2022 15:04:49 +0000
Received: by outflank-mailman (input) for mailman id 329986;
 Mon, 16 May 2022 15:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LrNQ=VY=citrix.com=prvs=128f89ae0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nqcHA-00058a-0F
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 15:04:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 857808f2-d529-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 17:04:46 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 11:04:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN6PR03MB2644.namprd03.prod.outlook.com (2603:10b6:404:58::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 15:04:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:04:13 +0000
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
X-Inumbo-ID: 857808f2-d529-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652713486;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nmbswEJSrEKjqoojLoE4xTqWQwbrMQURlD61oj53w3Q=;
  b=Z/m0vkKOgVKVYNPOcj/QlyEdCKc0yfLbQk7xc0GCMnQQ8+jyY+tqKzW5
   xSfFpOaoD7vNfs+xk944SOLJN5gw1Q3Gk/YgFa4DiF+HONXLS7blfWrc9
   Rb57+lTdVEUYJBfCHzfWilasmLUsqsWc+X90EN7FVH+cyNqKBD78zDPIa
   U=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 70788836
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:64kGF6m8j80mWnlRnPqDlcfo5gy5J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWD2uBMv+JZ2P2Kt1zO4y39xkE6J7VyYRgSlZlqCozRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWl3V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRzkwIoPPidYkUQRlLixcYql66ICAGC3q2SCT5xWun3rE5dxLVRlzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXtZkBhGtYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvvDiDnFcvuFTrGNz7WOabYOtaomenr
 XL42DziBhI3b8PKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fXG2u+Wjg0iyHfdWM
 VUJ+zEGpLI3skesS7HVXQC8oXOClg4RXZxXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4db5p5oopgnSVdslG6mw5uAZAhn1y
 jGO6SQ72bMaiJdT073hpAibxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTWKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:2Xj9y6pWdiy3gPdDfw/Hx/IaV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFZ9l/1owKpuKuZIIMs60vFULM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsul6SR4IeMNYYDGRfzO2wGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="scan'208";a="70788836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEjWwVfJcCIBUTLsdRTR/42R3LhfNIT7PqFMbpYwYB+tNI3i8QQsII9Z24p1cirW49O86zqFMAp8X5/YQ6l7TY4DTO7/Q2oTeKzCJOyq9CJ/Xb4UvmFCcSspbpaWDk6WB6yi6sBYoFkYEuUWcIKr8HxcWWrlE173xn8zBFDDOOfkT57HEcByVU+KRO0reuwhvy27AI/xEbdaLellSeADLc/cSy6PLqk1oomhKruMgNIVFixxmw2HQvhTEwTYBrH0g73sO4zLpmOBc3k3y+kZ8VjoZLzKtW2YTnaZd+03rwmb3AK5b1i+tut75rmzdIUYe+GmvFwjyzmELzth8tH8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmbswEJSrEKjqoojLoE4xTqWQwbrMQURlD61oj53w3Q=;
 b=UKOD59oC88GejafjFkP/clBkyeBgg2tlyZfhgRylM4BhkYijEOevGd3mOPgOj56zy41dMXmBp81Vzr6SLmjf+fC4cCnqJzBLFnRFebxArtXbxNLjDRBR3xjj/JEtiPciRjVuL9ogBe1y71XxC+Wk37gRXaQ4QMsrely8BCLlxCt0NtHm+qKZ6Q1RkMSrY8K77wY2m6mAqdEA/WwqWXsCL3ny6ce8VIaCEi1926Ht7Au3nW+L5hZ6652NssnMhbOTNZvYTBjLrhmOo71ilIgl3S9AgfF6nxiPG4JXDznPV7eq6P4BGRDB6NzzryrByFi8CU3VNnUiZhzbbrn5Da/OSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmbswEJSrEKjqoojLoE4xTqWQwbrMQURlD61oj53w3Q=;
 b=Pw+0wxb4JDB4reTCFJB60lexdxKjaWzgb0YFUQ1s7pr6ux2RZ/WHO5Yd1S25d83RpE87vSuq09ZVKiwr6bj4Q3tXaVyBrvs5VEC4fwz9/Np9Y72tpVcyFlJpPwEUAcvQrfTaZQdbvwwH3RQ2KRugLbeXtmUNgKYZSry8Fp38kBI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZwibZ3DwtT5Ea5wKgBtO2ACK0hnruA
Date: Mon, 16 May 2022 15:04:13 +0000
Message-ID: <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
In-Reply-To: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5177a9bd-b658-4f0d-dcb8-08da374d56fd
x-ms-traffictypediagnostic: BN6PR03MB2644:EE_
x-microsoft-antispam-prvs:
 <BN6PR03MB2644DAC99AD5AE4343A99BEEBACF9@BN6PR03MB2644.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QiUdwMSf6xp4QwGNNUFqZR0fDTuLrjh68KGth0Ny4ihYAnt5pcNbESum+C5vyBWf6XfwwGDEyvYb0yxzldHmbOaQzP2aQMayurl1smQR9EaPXzCPKTJyk2JZBAIQayzOxMG9Zw3WTWJOyupBotYrGHtDieclfagtMnPQCBBy65wH4yFMV9gCbZZeuWUWcH3WLKIwTKPUt/4O7/Ot50OoOCSFSMtD6YJj51/yDwAXsi4fxA62f2MRN0wBS20sNRWYWi3wElYNTIh15QB1aykDaU+tZHY9BQFOJjQwxaqLlMk8AMGhduapPK9bHrHi0s3/43WxaTnCKP7NI1rylBqnNqOET6rj4KqHnZRM3zXVD3x2FDZLAFveF7nMOeifbkvbn2+pbgxtVN5njAGBKu8w23zLn6ER+BUrwrngYMpvpESnmMdEL/gtvXZ3GPbMKWMXvzxt8PNcBrfZv50xo+5rs6tVDSVwTRAetZ76DWROdXCuQSgxppmC2cSJ5FV306paV8Ja11hodNWg+fJ3C5/BjR7o9ziQWUyXenSgJ5B8aRXq4IZWux2bYX3x6WO9iwcXPU9jaNg4S1F4ryt6+2pnkg5QA4bh3LPaKqgmptzb9WccKajY5en4/9TmiK4CzjzDTFsqIAWryXc6OwPsXDrivOSCCmdTDyUdQt3KMmHq9f2bHEwGvnzA7YuukiltiKL+5vx30dth+xcYAkxHd77zVmgV6YC4WTyXD2MPk7TSUIril3w+xhJB2u4evQc9LKmHYYsRRHcb4Yxuh2gw3o3gZg0LIa3dmoFj+sOx7O4zpktmrvxfeIm7acoMWeS2vJtUttJi1deiYw83efqRdSeRdzFPqCWLZ/ln2cm+6G+/47Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(2906002)(71200400001)(38070700005)(508600001)(316002)(6512007)(4326008)(36756003)(31686004)(6506007)(76116006)(91956017)(82960400001)(8676002)(53546011)(66556008)(66446008)(26005)(64756008)(8936002)(86362001)(84970400001)(5660300002)(31696002)(107886003)(110136005)(83380400001)(66476007)(54906003)(6486002)(38100700002)(122000001)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1pmU24rV0RoRTlQYWJveVJSNlJGUmtycDQvdGhEU2FpZWFMTnVCMnFLQ0J4?=
 =?utf-8?B?eURyc3N5c0FsK0FGbXU0aVhTYmk2NHhJS0N6bkRUTmdqanp6TzhSQVBiQWY1?=
 =?utf-8?B?bC9yVytmRDR4Ni8reE5HTml2RzNxVWZXMlp3YlpYK1dscWdEWUYrRGZ0QVY5?=
 =?utf-8?B?MUI0NHdRekphUHYwQkRCcmEvU3JVTmlKeGZDOTNqd093UG1ESEZQb0FUTGpL?=
 =?utf-8?B?OXJDVUNvTWtlazNleUhhS0doQ3ZkVFp5aTZOVkNPYjNyTHMrcS9rQTJNcWRt?=
 =?utf-8?B?TmRYK0doZFVxQ1I4TDVJTk84MTJUZnJwVWYxQmlIVUFBNEZVVlNQMlFHOG5W?=
 =?utf-8?B?S3ozNkoxYmlkSVRjR0RwajhlclRGbUYxRGJVNFZSRVpQQ3NwTG1nV2xna2dQ?=
 =?utf-8?B?THpjTHE3MldvdzNmTjhuQUUrSFBWWDV0OElmR2Mxdkw0eHRiRlNMcGNjQ0dn?=
 =?utf-8?B?MU10QzgxME1XV3hiYU1Vc2h5ZWFOczltU2g0SHVXZyt6UUNoSDlFT2hmVnhy?=
 =?utf-8?B?YVJoMWxDWjJMZ1BadU12WUduWWpjRUtVNHhZWkZhOUhCZEpXN2xtSGZ6Vy9v?=
 =?utf-8?B?aEtFT2ZoUnJVWG9vZGVSTVYzUWhNVjZtUnJ1WkExRWl6azNiU2RONUFpVXVi?=
 =?utf-8?B?cHlzUWxyY2JpMGpLRDN1dDhpRWFJckNzQldEMlgvSUlWa3E0bGZxVkxydDdD?=
 =?utf-8?B?RERncis0dERiN1V0RlUzZ1lBR3ZoNmxhc2c5K0pqcVFNRjhEekYxaDBDMWds?=
 =?utf-8?B?dG9idXkxTUViQWJtdGFkbjdNNGxudG02aHlkaHpRVE81bUxZb0pQc3U2bVdO?=
 =?utf-8?B?YTU2cVNRTGJFZXpLZTkvZTZEMmxsMmg5S09JdUcyQjJTUUR4eDBma1dZTnNG?=
 =?utf-8?B?RGVMN0E2SkxxOE9uNE0zVE5WbUFIWUtoU3liS0NUQjMvdDV2OWpuNy9oWnlH?=
 =?utf-8?B?UURjdFljUmlHSG9ZeTgxNFgyV0lSdFlMQ2tZaFYwNExSUGtrTjVUdlFCTUt0?=
 =?utf-8?B?YysyRGIwQlZqa2NaWWJsT0gzTUQ1ZFRMWVptYlovUHVjcTJGYTVtV2JzWHZY?=
 =?utf-8?B?ODd6d215aXdnVTUyV29vZ3BjT2ZIek9YQnl5KzRwbkJxWXNKMXlyYUtKa3h4?=
 =?utf-8?B?ZzhiZHNBRE4vS3Y2cGk1WUJOY0JyY284aWFlUGRROFBOdjRVMDZzOExGcUlC?=
 =?utf-8?B?S2pvekEyeTVJUkYxS3c5a0JzSHB0aDFZVVZ0WEVQVXJqYzR6L3IySHU4aGFR?=
 =?utf-8?B?REVUK1lOVzdpSWtIMjBPaFVZKzB3Z1A1VEJQdEYwMDdhR05Ua3orS0laMFRU?=
 =?utf-8?B?OFdtUWo2bG1ueE0xWDUvcmJndHd6VnpSK1hoVGZMZ0l0SDNqazRaM2JIUlRV?=
 =?utf-8?B?R3B0ZUhGSjNvellaL0ZleVpCaVRLN0htS0lxbVNwekozdzlDc1JMMTgvSWVj?=
 =?utf-8?B?djBvTnlYYUVFdnZXUitzQTAybnV4alFuN2FJeUd3QnprK2s5c2JJeHBIYVpT?=
 =?utf-8?B?K04wQUFYZDBJSGJDSHJMZm5yNDlGNjlQWDkrWUtGOVFRK3Q5bXl0bmVYL2x5?=
 =?utf-8?B?TmN1Q0JTWFUrSFkrbVNaMnZHaG94MzllSXViY0dxSlFSaWVVTnkzeXpUcmd3?=
 =?utf-8?B?eitmenRTVHpIRE5VMXl2b3h1U2ZtNlh3MU5kZkcvcENnTkorTnkwWGtSRDBl?=
 =?utf-8?B?VlowMGR6WitiVzI5OWpUVVF2REl2UE1KSDlhazNGaFE1NXVKRXdDMEh3VVNq?=
 =?utf-8?B?ai9ab280RDVkcGxyZnNoaW84bmRjS0VFSTh3ajFIaC8xNEVwVEdNT09Jdlg5?=
 =?utf-8?B?aVo2TnZEQnF1TytOb3B3QWtCTG5IMkZFaUFPamQwVGpYN1RFODdweGhxN3Nw?=
 =?utf-8?B?ZGMvVTUwUDhkdEJjb3pGaHdOZXlNTjh4ZEZMc3JNUjlobDJ0NW82SVpUd3cy?=
 =?utf-8?B?a0Z3Y1JoVEVFaEZsTUhTTE9TcElhZmQ2MWZKYzRDZUlyUWRXUjFLZnJvMG82?=
 =?utf-8?B?cUpJMDBMRXFrc1I3all3SlowU3dJOFpRUWxaSTBaUGo1YVU1WjVkSHl3OXRr?=
 =?utf-8?B?c01hOG42MXZsYWNNZ1RyTkNpc0p3cUlmTGt2QVl5aWhVMWQ1amhOTkUvOTMz?=
 =?utf-8?B?bFpORDd4TDdvcitkeUVWOStNUWZSWlp3aXQrbmxTZ0VLdXd3YzdyY1Zjd2Yx?=
 =?utf-8?B?YnNLekNlUS9OazAyQ0llcGtxaWtRa0JRTWlJek9KNGxkaCtZSmpQV1ljaFBS?=
 =?utf-8?B?REc3SytNemZZbHdCUzc3OGs2a0UyRU9ldE5XNS9kdjhCVnhjNm4veE1zRXQy?=
 =?utf-8?B?aWpBSlUzV1dCMDVDbnBCTllvdU1lSlAzeER1eUtOejNWZElFMDZhQnJvUGgw?=
 =?utf-8?Q?Wagg0I8fW3mMVs+c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38019F762AF5C64E8E3471522DA10EC0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5177a9bd-b658-4f0d-dcb8-08da374d56fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 15:04:13.7208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTUF0T5jSBsn1bkwX6dhEzIOc66nz+mJDD1SjAOGtVUL4YedOqavo2Km65prs20yxw3XjyZLcCerF5Bb0aMVc9oDtFfPvWkSJWL736lzpiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2644

T24gMTMvMDUvMjAyMiAxNTozMywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gU3RhcnRpbmcgYSBu
ZXcgdGhyZWFkIHRvIG1ha2UgaXQgY2xlYXIgdGhhdCB3ZeKAmXJlIGRpc2N1c3NpbmcgYSB3aWRl
ciBwb2xpY3kgaGVyZS4NCj4NCj4gVGhpcyBxdWVzdGlvbiBpcyBhaW1lZCBhdCBKYW4gYW5kIEFu
ZHkgaW4gcGFydGljdWxhciwgYXMgSSB0aGluayB0aGV54oCZdmUgcHJvYmFibHkgZG9uZSB0aGUg
bW9zdCBvZiB0aGlzOyBzbyBJ4oCZbSBsb29raW5nIHRvIHRoZW0gdG8gZmluZCBvdXQgd2hhdCBv
dXIg4oCcc3RhbmRhcmQgcHJhY3RpY2XigJ0gaXMuDQo+DQo+IFRoZXJlIGhhdmUgcmVjZW50bHkg
YmVlbiBzb21lIHBhdGNoZXMgdGhhdCBCZXJ0cmFuZCBoYXMgc3VibWl0dGVkIHdoaWNoIHB1bGwg
aW4gY29kZSBmcm9tIExpbnV4ICgiW1BBVENIIDEvM10geGVuL2FybTogU3luYyBzeXNyZWdzIGFu
ZCBjcHVpbmZvIHdpdGggTGludXggNS4xOC1yYzPigJ0pLCB3aGljaCBoYXMgY2F1c2VkIGEgZGlz
Y3Vzc2lvbiBiZXR3ZWVuIGhpbSwgSnVsaWVuLCBhbmQgU3RlZmFubyBhYm91dCB0aGUgcHJvcGVy
IHdheSB0byBkbyBzdWNoIHBhdGNoZXMuDQo+DQo+IFRoZSDigJxPcmlnaW464oCdIHRhZyBzZWN0
aW9uIG9mIHhlbi5naXQvZG9jcy9wcm9jZXNzL3NlbmRpbmctcGF0Y2hlcy5wYW5kb2Mgc3VnZ2Vz
dHMgdGhhdCB0aGVyZSBhcmUgc29tZSBzdGFuZGFyZHMsIGJ1dCBkb2VzbuKAmXQgc3BlbGwgdGhl
bSBvdXQuDQo+DQo+IFRoZSBxdWVzdGlvbnMgc2VlbSB0byBiZToNCj4NCj4gMSkgV2hlbiBkb2lu
ZyB0aGlzIGtpbmQgb2YgdXBkYXRlLCBpcyBpdCBwZXJtaXNzaWJsZSB0byBzZW5kIGEgc2luZ2xl
IHBhdGNoIHdoaWNoIOKAnGJhdGNoZXPigJ0gc2V2ZXJhbCB1cHN0cmVhbSBjb21taXRzIHRvZ2V0
aGVyLA0KDQpZZXMsIGFic29sdXRlbHkuDQoNCldlIGRvIHRoaXMgYWxsIG92ZXIgdGhlIHBsYWNl
Lg0KDQo+ICBvciBzaG91bGQgZWFjaCBwYXRjaCBiZSBiYWNrcG9ydGVkIGluZGl2aWR1YWxseT8N
Cj4NCj4gMikgSWYg4oCcYmF0Y2hlc+KAnSBhcmUgcGVybWlzc2libGUsIHdoZW4/ICBXaGVuIHdv
dWxkIGluZGl2aWR1YWwgcGF0Y2hlcyBiZSBwcmVmZXJyZWQ/DQoNClRoYXQncyBhIG1hdHRlciBv
ZiB0YXN0ZS7CoCBJZiBpdCdzIHNldmVyYWwgcGF0Y2hlcyBvZiBhIGNvbXBsaWNhdGVkDQpidWdm
aXgsIHRoZW4gaXQgcHJvYmFibHkgd2FudHMgc3BsaXR0aW5nIHVwIGluIHRoZSBzYW1lIHdheS4N
Cg0KSWYgaXQncyBhIGJ1bmNoIG9mIG1pc2MgY2hhbmdlcywgdGhlbiBiYXRjaGluZyBpcyBmaW5l
Lg0KDQoNCj4gMykgRm9yIOKAnGJhdGNoIHVwZGF0ZXPigJ0sIHdoYXQgdGFncyBhcmUgbmVjZXNz
YXJ5PyAgRG8gd2UgbmVlZCB0byBub3RlIHRoZSBjaGFuZ2VzZXRzIG9mIGFsbCB0aGUgY29tbWl0
cywgYW5kIGlmIHNvLCBkbyB3ZSBuZWVkIG11bHRpcGxlIOKAnE9yaWdpbuKAnSB0YWdzPyAgRG8g
d2UgbmVlZCB0byBpbmNsdWRlIGFueXRoaW5nIGZyb20gdGhlIG9yaWdpbmFsIGNvbW1pdHMg4oCU
IGNvbW1pdCBtZXNzYWdlcz8gIFNpZ25lZC1vZmYtYnnigJlzPw0KDQoiVXBkYXRlICRGT08gdG8g
c29tZXRoaW5nIHJlc2VtYmxpbmcgJFBST0pFQ1QsICRWRVJTSU9OIiBpcyBwZXJmZWN0bHkgZ29v
ZC4NCg0KPg0KPiBBbmQgYSByZWxhdGVkIHF1ZXN0aW9uOg0KPg0KPiA0KSBXaGVuIGltcG9ydGlu
ZyBhbiBlbnRpcmUgZmlsZSBmcm9tIGFuIHVwc3RyZWFtIGxpa2UgTGludXgsIHdoYXQgdGFncyBk
byB3ZSBuZWVkPw0KDQpBbnkgY2xlYXIgcmVmZXJlbmNlIHRvIHdoZXJlIGl0IGNhbWUgZnJvbS4N
Cg0KTm90aGluZyBpcyBldmVyIGltcG9ydGVkIHZlcmJhdGltLsKgIElmIG5vdGhpbmcgZWxzZSwg
cGF0aHMgaGF2ZSB0byBiZQ0KY2hhbmdlZCwgYW5kIHVzdWFsbHkgbW9yZSB0aGFuIHRoYXQuDQoN
CkdpdmVuIHRoYXQsIEkgZG8gcXVlc3Rpb24gd2hldGhlciBpdCBpcyBhcHByb3ByaWF0ZSB0byBy
ZXRhaW4gb3JpZ2luYWwNCmF1dGhvcnNoaXAuwqAgVGhlIG9yaWdpbmFsIGF1dGhvciBkaWQgbm90
IHdyaXRlIGEgcGF0Y2ggZm9yIFhlbiwgYW5kIHdoYXQNCmdldHMgY29tbWl0dGVkIHdhc24ndCB0
aGUgcGF0Y2ggdGhleSB3cm90ZS4NCg0KQW55IGlzc3VlcyB3aXRoIHRoZSBwb3J0IGludG8gWGVu
IHNob3VsZCBiZSBzZW50IHRvIHRoZSBwZXJzb24gd2hvIGRpZA0KdGhlIHBvcnQgaW50byBYZW4s
IG5vdCB0aGUgb3JpZ2luYWwgYXV0aG9yIHdobyBtb3N0IGxpa2VseSBoYXMgbm8gaWRlYQ0KdGhh
dCB0aGVpciBwYXRjaCBoYXMgYmVlbiBib3Jyb3dlZCBieSBYZW4uDQoNCklNTywgYSBjb21taXQg
bWVzc2FnZSBzYXlpbmcgInBvcnQgJFggZnJvbSBwcm9qZWN0ICRZIiBtYWtlcyBpdCBjcnlzdGFs
DQpjbGVhciB0aGF0IHRoZSBvcmlnaW5hbCBjb2RlIGNoYW5nZSBpc24ndCBtaW5lLCBidXQgdGhl
IHBvcnRpbmcgZWZmb3J0DQppcy7CoCBBbW9uZ3N0IG90aGVyIHRoaW5ncywgcG9ydGluZyBpbnZh
bGlkYXRlcyBhbnkgcmV2aWV3L2Fjay90ZXN0IGNoYWluDQpiZWNhdXNlIHRob3NlIHRhZ3Mgd2Vy
ZSBnaXZlbiBpbiB0aGUgY29udGV4dCBvZiB0aGUgb3JpZ2luYWwgcHJvamVjdCwNCm5vdCBYZW4u
DQoNCn5BbmRyZXcNCg==

