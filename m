Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683C555152
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354225.581284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o43E3-00058I-MO; Wed, 22 Jun 2022 16:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354225.581284; Wed, 22 Jun 2022 16:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o43E3-00055h-Hn; Wed, 22 Jun 2022 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 354225;
 Wed, 22 Jun 2022 16:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPuW=W5=citrix.com=prvs=165a25834=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o43E1-00055b-Hx
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:29:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c612ab8-f248-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 18:29:03 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 12:28:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5695.namprd03.prod.outlook.com (2603:10b6:a03:2d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 16:28:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 16:28:57 +0000
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
X-Inumbo-ID: 6c612ab8-f248-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655915343;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GzjJYwLpAwSxwE6bw01UwWSPMT6Rsv3F7iFHgKI0RFA=;
  b=QEK9g/BcnNXBF55pBbE8+lyB3PTPbrM5YUhceZ1UHUnVUs10/1ytOr+f
   F3eTN03R1vUmpmlt75zjXusHTPTGtIa+OMMhqHrBpRmlF4zxblF4g8nOd
   M87T8rldbe47AkOGfY8ZybAGxRp3UB9CXBQeRe7TlV4xngWAEOFnBEW8t
   k=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 74203292
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jvzh2q+rUtCZhuRy4dubDrUDDX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DZJWD2OOKyKYWSnLt5wbYW/9R9T6pPUzIBlT1FsqHw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZO/bDYoPvbrof06CTpeKjN9BK5P36CSdBBTseTLp6HHW13F5qw3SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvqMvIACtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK+fBvuDKClmSd1pDMDt3zY4CRQ/xbk2WZh
 D3m+kfZJUsjYYn3JT2ttyjEavX0tQn2Qp4IHbu0sNtjmkSOx3c7AQcTE1C8pJGRgU6kWslDL
 FQU9zBosu458EWxTfHyWhS5pDiPuRt0c9hNF+w37imdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hRazMigcKSklfz0JSSMM+dylq4Y25jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5eY10KG88UHCkiibjJHDRQ4o5S3aRmugqAh+YeaNa5Sz7FnH7d5JNIuDUkSap
 38AhtSf6+YVS5qKkUSwrP4lGbio47OJNWPaiFs2Rp05rW3yoTikYJxa5yx4KAFxKMEYdDT1Y
 UjV/wRM+JtUO3jsZqhyC26sN/kXIWHbPYyNfpjpghBmOfCdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:wu6acqp3O54NCpqSY86+JOwaV5tyLNV00zEX/kB9WHVpm5Oj+v
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
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="scan'208";a="74203292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKO4SN036NjXMxEqz1B912GdF0WLIBpvDyrE0w5q9wL3/WHkzkxQmahdWqS/vHLVX7nTlXMZM1nLCpGHzPwxDH4TBLcrj3dwfg/Z0ho+MlVuk0wQw0oT6a8+eJCBfEyg7+j4CQH6sA+gKb58Uv3ExAkrJCfaCMvFjawaBYK8Iou41rF1HIZvfyy9lr1lzHGFsCYmMkh/+HdH4HAbB18SyIqcWLC6UIinoXdP0iE025MnZGyjNgt0UGHdB0DRqcC80pnPu29yMbwA4zQ1D1hG74W5mN21ZuyLTIfhNxUAeNwcJ93Y1IfOQdV7c+oljXukq9J2eKklPqNPYBQbhS1Zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzjJYwLpAwSxwE6bw01UwWSPMT6Rsv3F7iFHgKI0RFA=;
 b=HaIjp5gCXIpVjIhb3pTCAIR5QXl8hAuSBi48Q93E6exuvKE9owdt423R4ANzkcBXSL0CBbM812cvAEK3Pm7+m8EiqbwukvrieZhIzKBZuz+nL2Y96hDr/+gmzBqUiLQAHP1Kk0SdgbmjcvCunt4h6syDLA2clsQbKtBfcFl+pY2+LbCOOXPFHFZaCIrG5Zg+hdO1htbIhq4sQLl9m1OiDS61wfS4tlk1MG1sTW3hWHOBrd1fS7WUUlB14+y21V9qWnWa7DXTFMwKnA9ikIbeDkCz22HxN3tNJuf/i91TW8ysyEIquETDQdUWlIi/vhFrmvUEISa4aByXt3qULVCnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzjJYwLpAwSxwE6bw01UwWSPMT6Rsv3F7iFHgKI0RFA=;
 b=pao1QdpMSrw5CtxzwLq7ETjQNJSHzzwX+hdQtQlnPw75Rn1EJ1Z23ETevyijkUar0vUXpthWVJ+wyWEjjFjKibtVqT8x/oEt+c6Hd5JpBv/fNyaw9TSwNikJXdNtHa3HyRrw+tnqpAbp4ta2hcLTF/gc/162x8rPe7ZlLxygffI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Michal Orzel <Michal.Orzel@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel Smith <dpsmith@apertussolutions.com>, Roger Pau Monne
	<roger.pau@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: XTF-on-ARM: Bugs
Thread-Topic: XTF-on-ARM: Bugs
Thread-Index:
 AQHYhWH1+fjNtvukV0adEqGEdTB7sq1ZxCsAgAAXIgCAAAnTAIAAf4aAgAD4xwCAAEImgA==
Date: Wed, 22 Jun 2022 16:28:57 +0000
Message-ID: <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
 <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
In-Reply-To: <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63aa44ed-a3d1-4ff2-c8a2-08da546c4e6b
x-ms-traffictypediagnostic: SJ0PR03MB5695:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB5695CD691AF70FDE1FE8CE87BAB29@SJ0PR03MB5695.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XgkK1twTqkGI3JQlHEPhC14AcSuv1H1O8DxpoBWM61nz0KAtdtx5rQVjd9km29WaoDhozcF/I883Sc7IVtLZrQDBNFHy7ryO9FPMOm2kvRuQSxc46wOFKBX5grxc1INORb45I6uVUdlceT/BtkSfwQ1BnRiFZic+bucg9EmU80I2rWzuCi8p79O+Zp2u7+9OWm4Jbj6PSzysKVEK6kZ5V1Iml9sjnhhVy9nMnal/+hEF28W3PVA7bPbNnHWDqkO9nj7EMaZE2N+nCExQNIiN5ux39CHS1UTxjYsd3M1E8ldlFpnhjZmZD36Xtb2co8G3Bi/OlE8XZ7yldiZzvvfMXPGePCUCYo9zY/ifJ1O0bH8yPH8DFJWfVdAl7DInbuw2nTz3x4WHaJnmg466he3MHnWN97Cig1WWIenI20yuPtsVY/cjlDto9XoeYQhxXfKX1mXsc3z1Bb2ZuvvgxFj6OPIIajyTmpnBKL1WNhPsEZsTNgBpj8oSC+I5wLIiqWhiA/PeJMzsu7rM4uiNLKCt4lIIRhlWramONfSjKRhfcGCvpacit90Er2PRnql7MZmm1bYrmX2lrCPnyf7gVgqz5cWfYnyDjkRbFxqwA29LQ7QFGaX4gcORrngb+rCXW9VdfmBSoVG0fP3l5yiIbs+1SuOx+/pFkYuAp1xJn0+7dD65DTLzxwbEKX8ZnC/zNucwj0dDwwt4Zd2PBGDfizx5NsG5QjAyLeMh/3OO9sKqu7lS7Zi8C7yVcG5uOqraZWGpWtO3oeFdINXpdbeoUkjB/EGCn1Rpa/5icZzjtl8n6hciX/LljL8Mr7aOHGVP3rAjEVmhTKHu5fU1AAv4/YZVXdolp2OSHRbrTUcDTZ8CenM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(6506007)(966005)(71200400001)(86362001)(53546011)(6512007)(31696002)(5660300002)(2906002)(8936002)(478600001)(26005)(82960400001)(122000001)(76116006)(6486002)(316002)(2616005)(41300700001)(107886003)(186003)(83380400001)(8676002)(4326008)(110136005)(36756003)(38100700002)(54906003)(38070700005)(91956017)(66556008)(66476007)(64756008)(66946007)(66446008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVY4dS9KaXdmSlBrY2E3VXdnY09TdFkvdElGMkdQOGZ1alI0N1A4RWNIOFdI?=
 =?utf-8?B?S25vRE9oRytWOE1Jd1JHRUZtNFVLUk1qaUVCeDhOMkdwVWxDekhHeXpLc09a?=
 =?utf-8?B?ZnJSaTVkVXVWL1RWLzdRWFJVT3VRS20xWGtpdkJ2cmpPK0o1VDhmS2Rzcyth?=
 =?utf-8?B?T1RRUVRqMkVBTXErRmwwdUl5NW5JL1VMTlNSbGJlM1Mvb1NHWkRlRm1oUUR3?=
 =?utf-8?B?VEJjT0FlMU5iLy9uYjRFUkxwNUpYVWhQUUNsWEtqWllZWFpaTjBFUFBuY3g0?=
 =?utf-8?B?Z2g5VFZxMG5qeTVId0ZPVGl1RkNwSC9DbzZsWU45WnY3WURuUkVLL2orMUlh?=
 =?utf-8?B?WGVSQjVnVjZTdHpaTXIwR1N2VXEwdHpXRlJLZ3pGNnVlK0syWVdwMWR4QlZ1?=
 =?utf-8?B?RVQyQXdscnhaT1FvYkZEVUN4b0JLM0hFaFAya1VKeW1KblkvT2RtWUpmYUk5?=
 =?utf-8?B?SEpTZG1rS25lNzg0Zk5nWXBWdzRKbnNGYU5jYUJRRFFxRmlxU25oR3Z5VXM2?=
 =?utf-8?B?Z0E1K1I1d01qNURuTER5RldPWDdRSXN5Z1JFV2NBN3BTeVpraE5NdkFEUmhE?=
 =?utf-8?B?ekJFKzFhMVZHOEZpNGc4R0pPRVA5T2lBR0gzUjI5eGxtdnVHcmxXZzdYUy9E?=
 =?utf-8?B?Q0tNa0I1Z1F6MGtFSFZmTzMzRVluSUd3MkEwTzA1T09KeXdVeDVFMit1TWMy?=
 =?utf-8?B?QTc0YmZCTEs2c2ZJNHlRdEZraTNDaDA4Ui9pTWUvb1Y1SWdFVVcvM0NMV21W?=
 =?utf-8?B?QTF4RWFTd0NZNFQ3ZVE5Z0poMVRXenkyM2lkMlFlK2FHTHIvTi82ZzlDb0po?=
 =?utf-8?B?aG5xRVcrd3VrSDFuTUtNUzZwZG5XRHZ3Vmw2eFBWM1ZMRkxlUGwwbWRXSmFI?=
 =?utf-8?B?YjR3Mk82QnlQV3ptMFNmaVozMUJTT3hVS1R3ZWoyTXVvTU9GWVluZ1NLTmo3?=
 =?utf-8?B?WnRmY0xna1lvNzRQMUpzNG4xSWpETnBzMzZ4NDhBdjZUU09qaitTcUF1eXRM?=
 =?utf-8?B?VFFnbDAxTWJmSzNuc0EvYTZXMTR3bHJyOWRZb2lmd2tLYitpNUJaWjIyRjlL?=
 =?utf-8?B?WlZEZitoSS9hdk9wZEsvSFVRaWRFWWVES2htVUcxRmhMYko1ekpmVGE1aXNN?=
 =?utf-8?B?ZWY5RHQxbmlpWk90Q3BnbmIxVzZoRzQ5TkMyVzFzV092bjZDLzFaZDlhSENJ?=
 =?utf-8?B?Q1lydE91cTVBeDdzN01TRGJPMHRzQmM5SFdPL1psSVZkY21QNzBmY3UydW1I?=
 =?utf-8?B?em5jcVZrbWQ1RHQrY0I5WDlmL2dCWENabG9mOE1tZUFYNnVwTlFiTTEwdmpS?=
 =?utf-8?B?d3VaaGQxU2txbG1tNHRrWFByclZhU0Y3RGszSkdyY2s4YUJBUy84a1VDWFZK?=
 =?utf-8?B?S3VxcUFFRzNBcmltNE5FWXc0T3BLYzgydXBsdnZIUnQvOGZXS1BEd3pGc0xD?=
 =?utf-8?B?ckRyVjlEdUQ0eU5yai9nYVQvOXhLQnRhUjRTUUdpZ2h1VHJjZlhpZmxmNzdy?=
 =?utf-8?B?R0ZzVVhqM3RkR3gxVEJNeTE4cEVDWTZpNnU1R1IyK0IzUVZkL2RnRGhjNHZ6?=
 =?utf-8?B?NS80eXJnWmNaR09CaEZsUjBZZkRNUUE1ZmdDcDhjTXVVRlBjTEtvMW5rbHMv?=
 =?utf-8?B?Um5lcGlnL0dJTktJb2NLSzZiMzVTaWg0aXZYOERBdER0N2Q3UzNvZm5VbklD?=
 =?utf-8?B?am9RU0Y4eklGZ2ptdE9ocHJlTHErQUZmZkRVd2JxRVJ1QU1DSTl2UjNrUUJl?=
 =?utf-8?B?M1QxZXg4Uk5ab0QvbnBaSjlKQW5Nc3ZuaXVBdHlUS3dHY0pSS0c4RkZ2Q3ly?=
 =?utf-8?B?S2JlOWl4RWJqQkdZaXNLckdQaEJ3TzNjWlJNWmM5azZSSVhrR2kzcTVRdTEy?=
 =?utf-8?B?Y0xIZURpQlpWWWh0WGZDTmVIWGNXcVdxOEFFYkE0MzNJTnE5NTdOZllZUGNv?=
 =?utf-8?B?MkFlcVQ3aU5obmNIb1l4c2wvWGQzSmV1Sm5FbFJIdEZMWm80SnpyRzZpOGJq?=
 =?utf-8?B?RHRCbm8zSzJOYWxsVkdpRm1hRG0rY1hwbUppNFhNcEd2NzVTalc4OVlKWUxY?=
 =?utf-8?B?cFJSY1pOYzJNTTlscityTklhTStyMHFUeXFONmU1WUxzb2hib1IvQ2NzcnhL?=
 =?utf-8?B?ZXdlekY3bDV4b3J3eTRUVG5tbHorampLR3NpKzdsYkVvN2NFMFQ4WDE4Njhn?=
 =?utf-8?B?ZStPTVBzY2JDbEVNaU5HTGJqMThtRk96UmhON3NKc252cktXYXZlNWE2VXBH?=
 =?utf-8?B?Q0xrKzVmeGtEemF6MzdIU3VTZ0kzVzRRY3Rid0lZamtYZk5LeHFJRFhGb1VE?=
 =?utf-8?B?Rk1TZmNkdFYyeXFrSEZmL3JTdnQ5Z09VU3dWcURSQVhOUFUra2JvaWhaN3V1?=
 =?utf-8?Q?KQOINnvq2TvpaBfA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B464758853244D4595F5AE7FCC1875AA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aa44ed-a3d1-4ff2-c8a2-08da546c4e6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 16:28:57.4609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vyQs3rrva8ZIUUk7MJB7cOfM0NIOLC1QbApecmxBdv4+KHAU2+tFnWxL38J5AiIpjjMdjUDJa9+PR3eN0U4hYlzt8TaaZ9VhPUFtHGBfs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5695

T24gMjIvMDYvMjAyMiAxMzozMiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gSGkgQW5kcmV3
IGFuZCBDaHJpc3RvcGhlciwNCj4NCj4gSSB3aWxsIG5vdCBkaWcgaW50byB0aGUgZGV0YWlscyBv
ZiB0aGUgaXNzdWVzIHlvdSBjdXJyZW50bHkgaGF2ZQ0KPiBidXQgaXQgc2VlbXMgeW91IGFyZSB0
cnlpbmcgdG8gcmUtZG8gdGhlIHdvcmsgd2UgYWxyZWFkeSBkaWQNCj4gYW5kIGhhdmUgYmVlbiB1
c2luZyBmb3IgcXVpdGUgYSB3aGlsZS4NCj4NCj4gQ3VycmVudGx5IHdlIG1haW50YWluIHRoZSB4
dGYgb24gYXJtIGNvZGUgaW4gZ2l0bGFiIGFuZCB3ZQ0KPiByZWNlbnRseSByZWJhc2VkIGl0IG9u
IHRoZSBsYXRlc3QgeHRmIG1hc3RlcjoNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3Blb3BsZS9ibWFycXVpcy94dGYNCj4NCj4gSWYgcG9zc2libGUgSSB3b3VsZCBzdWdnZXN0IHRv
IHN0YXJ0IGZyb20gdGhlcmUuDQoNClNvcnJ5IHRvIGJlIGJsdW50LCBidXQgbm8uwqAgSSd2ZSBy
ZXF1ZXN0ZWQgc2V2ZXJhbCB0aW1lcyBmb3IgdGhhdCBzZXJpZXMNCnRvIGJlIGJyb2tlbiBkb3du
IGludG8gc29tZXRoaW5nIHdoaWNoIGlzIGFjdHVhbGx5IHJldmlld2FibGUsIGFuZA0KYmVjYXVz
ZSB0aGF0IGhhcyBub3QgYmVlbiBkb25lLCBJJ20gZG9pbmcgaXQgYXQgdGhlIGZhc3Rlc3QgcGFj
ZSBteQ0Kb3RoZXIgcHJpb3JpdGllcyBhbGxvdy4NCg0KTm90aWNlIGhvdyAyLzMgb2YgdGhlIHBh
dGNoZXMgaW4gdGhlIHBhc3QgeWVhciBoYXZlIGJlZW4gYml0cw0Kc3BlY2lmaWNhbGx5IGNhcnZl
ZCBvdXQgb2YgdGhlIEFSTSBzZXJpZXMsIG9yIGltcHJvdmVtZW50cyB0byBwcmV2ZW50DQp0aGUg
QVJNIHNlcmllcyBpbnRyb2R1Y2luZyB0ZWNobmljYWwgZGVidC7CoCBGdXJ0aGVybW9yZSwgeW91
J3ZlIG5vdA0KdGFrZW4gdGhlICJidWlsZCBBUk0gaW4gQ0kiIHBhdGNoIHRoYXQgSSB3cm90ZSBz
cGVjaWZpY2FsbHkgZm9yIHlvdSB0bw0KYmUgcGFydCBvZiB0aGUgc2VyaWVzLCBhbmQgeW91J3Zl
IGdvdCBicmVha2FnZXMgdG8geDg2IGZyb20gcmViYXNpbmcuDQoNCkF0IHRoaXMgcG9pbnQsIEkg
YW0gbm90IGludGVyZXN0ZWQgaW4gc2VlaW5nIGFueSB3b3JrIHdoaWNoIGlzIG5vdA0KbW9ycGhp
bmcgKGFuZCBtb3N0bHkgcHJ1bmluZykgdGhlIGFybS13aXAgYnJhbmNoIGRvd24gaW50byBhIHNl
dCBvZg0KY2xlYW4gYnVpbGQgc3lzdGVtIG1vZGlmaWNhdGlvbnMgdGhhdCBjYW4gYm9vdHN0cmFw
IHRoZQ0KYXMtbWluaW1hbC1hcy1JLWNhbi1tYWtlLWl0IHN0dWIuDQoNCkFzIGl0IHR1cm5zIG91
dCwgSSd2ZSBmb3VuZCB0aGUgYXJtNjQgYnVnIChpdCB3YXMgYSB0eXBvIGluIGFzbSksIGFuZA0K
dGhlIGFybTMyIGJ1ZyAoaXNzdWUgd2l0aCB0aGUgY29tcGlsZXIgZmxhZ3MsIGFmZmVjdGluZyBh
bGwgdGhlIGFybQ0KYnJhbmNoZXMgdGh1cyBmYXIpLg0KDQpXaGVuIHRoZSBtaW5pbXVtIHN0dWIg
aXMgd29ya2luZyBhbmQgbWVyZ2VkLCB3ZSBjYW4gdGhlbiBzZWUgYWJvdXQNCndvcmtpbmcgdXAg
dG8gZ2V0dGluZyB0aGUgc2VsZnRlc3Qgd29ya2luZyBmb3IgYXJtMzIvNjQuDQoNCn5BbmRyZXcN
Cg==

