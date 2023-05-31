Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E0717A06
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 10:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541641.844593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4H8g-0004H9-8X; Wed, 31 May 2023 08:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541641.844593; Wed, 31 May 2023 08:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4H8g-0004F8-5G; Wed, 31 May 2023 08:25:02 +0000
Received: by outflank-mailman (input) for mailman id 541641;
 Wed, 31 May 2023 08:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXUc=BU=citrix.com=prvs=508c705fb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4H8f-0004F2-Aj
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 08:25:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eb59896-ff8c-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 10:24:55 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:24:53 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5636.namprd03.prod.outlook.com (2603:10b6:208:297::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 08:24:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 08:24:51 +0000
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
X-Inumbo-ID: 9eb59896-ff8c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685521496;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=L4R79u4BlALJ+FAofgd3gJ5bEhmSY7WnvzozR7U4ZW4=;
  b=HpLXLjkWy796uT+oX8RhmT/m9mb8IejZE7q24cYL9RlLoJ8a78U4A2oy
   tVioORcxtHWEDZwBPoxVbvtHqldoEawi636WwoU+c8H/Cr+x+CJBlSxaT
   RkAX/zTh1NO282GbTuqaONCi4ff4ody+bqaDksuy++ZyJNoC1TcmDMCq6
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 111057348
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Lbua5KkMonZf7kUKQHeqx7ro5gyhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUDqCOK6DNGb0L4wna4Syox4CscSDm4VrTAFqqnhmFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5waGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cUhBBcBM1fevciZ/ZKbQ+JWj/YpfOC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqiAN9NT+HonhJsqGGq4WkrLxgtb3a+5sSdrxadcY59d
 kNBr0LCqoB3riRHVOLVWhSipXeesx00WtxOEvY74gWA1qrV5QmCAmEOCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptPl8Ic6i0uWSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:pqvo/a0QO0KHFXOYDshBHAqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:3Hws8mF0j1ekQfpTqmJezWIzFp1iL0f340rwA0azM29bQu28HAo=
X-Talos-MUID: 9a23:cPuf4wWuDZPCEtPq/APVozRaE8JT2YmrT30ptM0lkZWmaCMlbg==
X-IronPort-AV: E=Sophos;i="6.00,205,1681185600"; 
   d="scan'208";a="111057348"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHfy70HlftIX/eFF0suSOGRhyvesKu9Ln0GZrHM5AMO+uiB6OgWysOsYPpFd7R5KYLRbde2xqUP12V7thPBzKVfdnT5568jJNIKeMBlOhJWzl5FFmbnDP7LuBPOqyR4MNRY72t1WKonQufp9wc2EO1JV5vMsQRkoHt/FkhqAD0VPeqULHHys9gBZnUxrvho16jxXUiUH/Y56MPDkr5k7ntFbRs2PQi5v284Rhxr7GVmHteneJe+2kINEnT3jSoOaYN0JOm6ZGl4D9zWojE12e91meUapHwdfxUqgsvLEwtauH9sFUIBiaQNjHvQO5xZCsNNnnQRQalFa4BRy3DljHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yizvWieGBDbXFQUkBN2ZaXU+JT+BHn5OSwneDCy93s=;
 b=ZbdqQF5JEf17WZMbd9m/ILdQLgyWrZe1kvKEHRJl4v3q6BgBdFQxZoMCwBBI6ILkNXfT1t2bsOhrm9husizkKe7Nsj9S1ZsYIHmwXbWpFcY63zagcbVMryU5nWmCXb1skuDfm0Phqa9woIraA+r28wSMHU0EmP6ssAGtpplK4Kfw3O5vNwYI0NvkKnh0qt/CQjz819pMDgQI4leuPUpxKzjnwytRWpWmHCYlLQYlghU84xWS1DcWDoJPIpiktCgU5TBPjEa94Ik5qoJOor3gwrjLqP7Rs35go7ZDTPHjW8z7rGc1XVtZLRs8FiDiT23fO+xeviCLw+tiGcISrxblGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yizvWieGBDbXFQUkBN2ZaXU+JT+BHn5OSwneDCy93s=;
 b=rsJDCEzskwS18CrzdQmSJsIU/yyk0CGMkNqvSVEn0WnZqrMfoaFH2gxrjPZsyPy1w9dILczIjQ5FQeXpxzhqLg2rYDfMM+Wf7exOMX04+3D5lxb6VGjALIzKrauhFtzDppJuAIwcujEaPtPMiyh7N+47jLw8KZtMoxj+xS3qxsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 31 May 2023 10:24:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: HVM performance once again
Message-ID: <ZHcETJZThCdr22MW@Air-de-Roger>
References: <ZHb8DBbRuklAXhCE@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZHb8DBbRuklAXhCE@mail-itl>
X-ClientProxiedBy: LO2P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b08f38-1004-49ee-6218-08db61b080f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y/2+0v1i1NpMYvAMptZzwkzPAnsm/9427m0L97rMdl8PAXETOtgM9jbMcw3FhCtarOy54Sc2Clw/zzci3Bb0LicgOWLMdcLYXzGGAEysC54Zh1vCRGQQuIaoJEYYRcqubqvfdgn90tZF/XPjuXiGXKsXLeGiqw5hgGMC+tyvbl5q28FuSid8fFF9LBeucIggyMSTN7csNywF5Ba6qzdjEeHF+VmuKo/jjcOqkRBRoNVBTdZX7yo5XlDthqlDK0lbw5b31XxZ4mRdRQqf1I5cVz6qXSS2uLzKRpZIdvp0xgUobH78/5j8b4ccLrzgP7KdT0XGsFl7F3BK04dOuwnmTDhhrUwgYvCPAn2tGbLFFi/HADqbhY4+xL2+dQLpFzRFkpi03afapc8KoqRcBbEE2p/kSCbye6VobbbvV+06gsN6iUPZwY/ys65DByxOeiyFeRCKX8AvWsVkJWXs2B8KnVwNI3h9rCo4wF8papVq9Y+tC9scq7sEZYqJz3IpzsOl58cCCqyOAwbUNSCVB/3aHwydCB4um8904BFNSpJ9/6Uwt6AQPsNMxdHw0OcObc/I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(6512007)(316002)(6506007)(9686003)(186003)(6486002)(8676002)(33716001)(8936002)(41300700001)(82960400001)(6666004)(5660300002)(26005)(38100700002)(4326008)(6916009)(66556008)(66946007)(66476007)(2906002)(3480700007)(86362001)(85182001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0dvQTZTZ2dZbmV5TjA0WEp1cm5LL3BTZENXenpYbFF6d3hFVnY0N1Jmem16?=
 =?utf-8?B?c2ZWSjZON0NRYkVRU1RPVkNFb0s0TzBGbU9vTVRVRVgvZUJmVVYyNXBZa0Fz?=
 =?utf-8?B?MnY0Nm9KbXpJWkxYOEFkU2VZOGdJdWtDdWtMcFlwQlluemhMQmc5VXk4WjZo?=
 =?utf-8?B?N1YvdXplaGtJd3VrSFRtQ01qcjNqcEgvOEZFY2Z6ZmlNTHU5UVY1ckVvYXQy?=
 =?utf-8?B?OWc3Y0RNaDNJQmFyL2NYZ3VwWkNzM0QyWmNneEhvbFZPeC84RjYvSFAyWW9U?=
 =?utf-8?B?SGtnNDVqbXZJSVJEVlB0MEowUEhhSkVZMitleFc3UkZqT1lSK1E5V3Q5NVlz?=
 =?utf-8?B?bVVhOGFac0cxSktMWnB0ZDNqdUQxUExmR3pFWWhxNkl5d01OME1Ld2ZxSVEv?=
 =?utf-8?B?c0xxNmRKM0xiaXBZalRJMUdKK0o0RTNHMk9yNXNNQXpRMTMvUll4SXEwRUQy?=
 =?utf-8?B?WkV0ZituOFFxWFJwejFvUHVvVEI2TUhzRjRGK1VpWURDMExLU1AyN1JlU0Ns?=
 =?utf-8?B?U2VCOFRZY1pFbnR1ejV3MThFN3JaVXZ6TVpXbWFEU0thT3ZCdmFSK2FiVnU3?=
 =?utf-8?B?bDhRNHJjUG1ZL2tRZWI3NEJFUVk1YVJUMUwyQjNNaER6VEFqRi9DdFZZUm5i?=
 =?utf-8?B?WHR3eHgyTHhkMXdEKzFwMHF6cEpncndGa3BTMGVrTU9jVFlyRWV2N3FPN3lr?=
 =?utf-8?B?RXBNWm1EM0g4RXFmMTBsdVpRUWVGQkc3dHVSYWRnYUh3N1FzVzdVNCtrbVRu?=
 =?utf-8?B?MEZLVlRIMjVjM1BXNnVHQmR5NTdud0VtTUhnVFYyR01sVlBsOW5KWVV6bFh4?=
 =?utf-8?B?MTdQYlZyS2dmcCtWQ3Q0OC9VbG42bTVEQVVxNmtNcDAxQWJsSE1HbHJpdFNq?=
 =?utf-8?B?QzNFR3VLN3RXMitubndQVTdPTk9TOFd4UDU2VkNwenNYMG9YZGNyaW9sYk44?=
 =?utf-8?B?UUR4Zk1FbG9qa0JpWTVON1hyN3dURVVtc2VNREZwZHI0WnJPVENXRzY4VXJO?=
 =?utf-8?B?bWl1bVRoRjFEWlZnMEJJZzJMOUlrZmZOVTJLUktWajZqbnQ4ZzRJcngrczVl?=
 =?utf-8?B?cWx6WFQ5UlhsV1ptSEpOcDJXclZXK0tJWjFydVFmU2NWUXVkdDFWZ1RReFJC?=
 =?utf-8?B?WTViRis0bTNxeGZhY3BSQTV4MHZJVXF6TVJVSThyeEVSK3dmN3c5c0hTMXJn?=
 =?utf-8?B?YkxGSDk4cmhtR2lUUEdOc0J3a2oyZ2hZQWpoNSthUjNZUXgxNkI4d3NIMkZQ?=
 =?utf-8?B?VzllYzk0RS9laHU2NmVmUTF1U2c0a0ZPa1R3UXJYb3NZQWo5N2xrb0pxMjc1?=
 =?utf-8?B?c2JmeVVSREFoSDBJWTlXZmRiTmsvUHEreW82NlNwYWNSZjhZUndqa2wyVVY0?=
 =?utf-8?B?LzdZWXZvVmpNa2Y4SUIwek5RUUVhekhDVmlkbGpqR2xuS2ppSzh4ZjRLQWNH?=
 =?utf-8?B?MGJYVjUwN3lJNmZRQlBPWExZY2RuVVliWkRBUGNOQWlwc1ZzVDVjbGpJMHRF?=
 =?utf-8?B?Y3ZBWkVWUW13MklMemhqalZqVmVNb09HR3lrb2lFQUtKTUl2d1JPYmVXT1VR?=
 =?utf-8?B?SXBNVmhHa2ViMFcwTlVXd1BJbUdzbFdHK0tod205cGxYcGZaeE5PeXpPUTN3?=
 =?utf-8?B?Qm40a3B2TERnS1M1d1JlSDdFb0JrNVNjYWxBWDdpNFJXSkI3Z0JuQXRTZEhm?=
 =?utf-8?B?bHhFLzBYV0ZPcURRL2JNNURFMU5tamtYWlJmY3dMVWpvdDhPV3kxQ2dBdzVw?=
 =?utf-8?B?M1hUNFZtbWFjVHRNK0c1Zko4aENDcnVPRUNzaWJBL1Z0WW5wTVFOVVRlWkFL?=
 =?utf-8?B?RTJSYUhQUi9sUlpLQ3ZTVlcwVVB0b0NGMTE5WnNFUVlDUVVjRXNKRUdoVnBM?=
 =?utf-8?B?cThYOFpXMFRSYkRLdTcxc1dKellwQlFTbDZFMmw2L0ZSWWhBVlRKQnJsYWdT?=
 =?utf-8?B?R056MVZGVmw4enRYR1JtV2tlVFVTRmViS1MwbDFLWXo4YVVSc1hoUVlHYk9Q?=
 =?utf-8?B?RHZ0QmNSTjk4aitoamtMT3lYa2JxT3BmTmpOejUzWWpBdURrMnBvWGxhSGFJ?=
 =?utf-8?B?RTRGd2EvejdZMnpCVmVDRllENTN0ckUyMTd5S2xJZjdPUTNSZWMvSS9rc0ZL?=
 =?utf-8?Q?ggtev4e79aWK64B6NitgXPF6+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0yZ9QjfcTZR5b0xxZtuh2coqoG/tvttVynK4yXM+ZPj2vc8PWAOdIWI1K+o5ddN/f0KY1HCDdAqso8PZsEU2rhE2CsXlKOsS20LqkVrkx808bGM3XeYB6kqm+9P3B7WGl+LtHSxUWwHOKqaH9x23ynrYTOLSHQ4Mpu1Ldod3zO+BYyfpHspahJqtoarsQN3ic1Hg91v93XCsEBqQbid3BSLb9jVpqKhslvVwDLwqlu0j15VbCAaU913y4POJFmQocJ4k7cl/aHqlOtGqHOBsdb6CZxsAaJJjwe/fOWgzZSXDvQ30FkhgsVZNssUn1Fno90TKYX9Xs4jkE2XX6yGKwBlpbtpl5TfnScyCUVJQwPyDE74Fo8GudIe37lAGGFIRoT6oK/B9uEbuMcOvsig8hgkhihvts3W8XZehzStYtoHRvy11rGRFmHgDnJaHyAMyuGyghhiA+TDuBbrRhZafxq9jKUhsaR5Y5V2vbAI8X/0mky3YVY5paQNRedDPU+uik8FL2TJpJpb327up2KEVBiEfL7JO3e+0c4dBWaHJ+LxmUAJJ0EMBoQZ7DjWV2ll6jii/L1JxBnkphJ30LIcT9IDo5GDTCxifZVM5FaVZReISq9aRW4Z1yWyBxI58erQo7p6Q1C6hBLNclMdfBICsYrel/CiYdm/oM7lzSSe2o66573JJaHa0A4v1Z4/HELCw6n86l0MJh1OP1XXqmz5gTM25lmAYFlPHhlO05trVL0xZ9Weit7iH2lX6SKQKua2CBbCMxwPOfSXu3YBaNChHogKcEXZ3ycZWmaePJNAk06bU5pxWNK3ivKdg7Q6C6LNvbeatr+VQzk//xZHmwcT5pw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b08f38-1004-49ee-6218-08db61b080f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 08:24:51.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIMm4XAMvol7LThliFQJVROKR5aLy5BR48D6Z1/AvUVYUD/NeC/08qbdTVGyPOmpF4pmfRo9wgTlwdCBbZGCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5636

On Wed, May 31, 2023 at 09:49:32AM +0200, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I returned to HVM performance once again, this time looking at PCI
> passthrough impact evaluating network throughput.
> The setup:
>  - Xen 4.17
>  - Linux 6.3.2 in all domU
>  - iperf -c running in a PVH (call it "client")
>  - iperf -s running in a HVM (call it "server")
>  - client's netfront has a backend directly in server
>  - frontend's "trusted" is set to 0
>  - HVM have qemu in a stubdomain in all the cases
>  - no intentional differences about HVM besides presence of a PCI device
>    (it is a network card, but it was not involved in the traffic)
> 
> And now the results:
>  - server is plain HVM: ~6Gbps
>  - server is HVM and has some PCI passthrough: ~3Gbps
> 
> Any idea why such huge difference?

Just a wild guess, when domains have a PCI device assigned the memory
cache types from the guest are enforced, otherwise it all defaults to
write-back (see epte_get_entry_emt()).

If you are not using the PCI device you might want to play with
epte_get_entry_emt() and see if that makes a difference.

Do you see the same performance regression when testing on AMD?

Thanks, Roger.

