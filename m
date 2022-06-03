Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35853CBBB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 16:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341564.566803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8ZL-0003QJ-Ab; Fri, 03 Jun 2022 14:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341564.566803; Fri, 03 Jun 2022 14:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8ZL-0003OS-7d; Fri, 03 Jun 2022 14:46:31 +0000
Received: by outflank-mailman (input) for mailman id 341564;
 Fri, 03 Jun 2022 14:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOPF=WK=citrix.com=prvs=146533d13=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nx8ZJ-0003LX-W9
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 14:46:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d0c313-e34b-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 16:46:28 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jun 2022 10:46:25 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 14:46:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:46:21 +0000
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
X-Inumbo-ID: f1d0c313-e34b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654267588;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nGzKT/FJuZe2Z3k3KNP/6gffcayKs891FLMtAUAnmsY=;
  b=KlX6Fg/DDchpL5zTf5LXDY8+zxX0GqRq7MILzkBMBCY3MdqHfFvtYaQo
   zl+DCIYwWpC33J02pGmp6yS2QYBzsZyfvKlO1crPmwR3ySfIzTwKUH1Sj
   ZaoOStNXCIBb5Gau1LALzqKwKb56iFtCZqHXGSGis/YBNFRDPTDdzX5Ea
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 73212222
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M6nZu6AkrPXjOBVW/+riw5YqxClBgxIJ4kV8jS/XYbTApDsj0TYHz
 DcXWmuPbquLMGWmft9+bIq2/BgEvMTQndVgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Bh2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhM4
 89/nqa0VzwEL7/hhtQgA0FfHAthaPguFL/veRBTsOS15mifKT7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6h4B8yeK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7zy3yOlKWcwRFS9+Yom3TjU8A9K0KG9O9P5VfGJHeF2gRPNz
 o7B1yGjav0AD/SdwzeY9nOnhsfUgDj2HokVEdWQ9fN0gVvV2m0aDjUXU0e2pb+yjUvWc9BCL
 QoS8yknr6k3/WSqSMXwW1uzp3vslhwBX9tdFcUq5QfLzbDbiy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7gqpJi8cOjv+/5Qqf32/qoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:2l9iSKGxazE7x+yqpLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsOm9LmEk5nHfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wgK7VBaM0o9
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,274,1647316800"; 
   d="scan'208";a="73212222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R35LYOY3EV6uFymOmqCyCMB6/u0BAJOHr6VHLuZA5Vad+BBhkibn5DshnJjrBbDLM0GXp/lUalpPMzuCAD+xXr3ydIwvThsB8rPz0VfBF18ZKcNa/qNBBXmD9AiOor2sSqvaDaeYs+zucZEn79RkjUtIXoiXaejUwnGggTNsmtq3uGypJmeXP6kyTcMbiHygSQ1V8cnoZWhGG59PyDKuckBpkwe4Cmiy0LuuP46P6xXH/HNz6zHGEF3NWNpHBmFG4jiSbOsfEBjHg0vLVcoBgL6PHopYAGh9OZUpNFaXwNoVjTb4DWLmq3dvNR6kiHJj39hXiIdZbIsVdq0/tnuZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2rdynz9N7r99RF4nuN3SzI28v2vuLNHK2WstN8gwRY=;
 b=iQAoqb5QGBl11R9oPsfthhv7MfQCRZjtwdAKjLACmS1OvD+DAOI+1mXQzfuaKRVB9f1HWGu9CK7g/56a+yIBrOW2yFuwBD7zJNGdzcEWZLztnl54p8sQhQZUGZRbTwqV+B44yLbzWkiLBbohk7ZXHhjrqw0I+9GbObCIvjQNMwuCgWiBFlIPgfDyCksohOGy9UG1xfu8YJBSPHIL2UeOkACoy7JXQo9ocrJ2zIM/b0Ql9AEbs4koXVIMZiTEWunHRFpvxOk8dlIysKirIdLzWMwYwP11yrJu+T/iqXmbzKI994UJr7uuohAdr9FObSlNY99R3CK6DMPKYKYTsl4SHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2rdynz9N7r99RF4nuN3SzI28v2vuLNHK2WstN8gwRY=;
 b=ssVeD+OKb31e9YdL9stDddHLxExkimCnGTZ5GnB7+0E5m7xytTPdFOdi9/jTnFyPxFEwGqIFyxGTmfGMsQCbzj6s71k9kQieIAa44BJxPhNO5g9Dq7EHmbvOW1Yu/9vvrESI9IRti4HJF2RWMvTORW9u8RC6ZF//oN/5q7nPhoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Jun 2022 16:46:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Message-ID: <YpoeuOJPS0gobz5u@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b1729a7-5bba-4205-43d3-08da456fd30e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6778:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB677871CDC0AB07257C2EC0ED8FA19@SJ0PR03MB6778.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yrPb5E7JdTByWHASz2HlzBtmt/cXcZ5tOO/SVGxPLdgS4dnk37n2zqA09gW5QcALWTsZ8RAkkGRw+XZOq63yj9ArBfVsMJSzW5VEA2Vqjzcdg8A2IGqouSNG1jPlRTCxN+u778SZ/Ea8tZFlibfdFq+N8Mo2fWlF7fgJSeobODgsEggdS/rXfSNoczEOt+cCIYvxwO+vhpwMfwDNpTAMAsjz8DZFs0qWXR4bu47dEbqKcq1AtJ7twamCCSP4K+N0AkkhF1PCHvoLNT2FfUvGNPF7sf7A/ocxj3IiV0+zKl4XUyNcT5FE/w4xpqtOjDTrzudUzzY98ph+V6k0twkFHwAz1Phx+NvvFKj9qMz6w91EE67Ob21nrV6mBXnw010WbjA8AkIeud4z7rc7Tlk9twUkaa/x41qgtNPJ+hUNI2q585RkoknaLBmG18CvBLCaFIhcpTQ1OmfDRnAn5xL+pIginFMC+y0s1i4vp6I84+Cc1FD/4h/aKCvLBkmKXnejyor1XFJkR7zCfVO4KyvJ0L4ZoRgsPnB5WfhU0U0fKyk0aKVKsIDLAvH7V6LpWaIsQGRveO71PHTFSTH8khIWcYOdGxiHSGAOeH33LXzmlSSIsAS/T0ibzezfdL60pWxtFJpvALoE5KdLzGNezuo10A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(6512007)(83380400001)(26005)(33716001)(8936002)(5660300002)(9686003)(4326008)(66946007)(66476007)(66556008)(8676002)(38100700002)(86362001)(6486002)(82960400001)(316002)(186003)(508600001)(6666004)(54906003)(53546011)(85182001)(110136005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGhUODhzOGh6VXJhTWY3aEwrSmI2TExVdmNKbCtvSUN6c3BhZW1hUDl6Vi9X?=
 =?utf-8?B?SHZMWFRMdnZSS0hGQy9hc3Y5bFZRYnR6SFJlMDFGNUZaQ3Q5YWIzZisvc2VY?=
 =?utf-8?B?enBETjFiYWZTdFV4cU9RK3B3TlR4dGhoNjFzQUlBRFIra0FOOG16cFdsZC9V?=
 =?utf-8?B?dDRjTk1pN0o4alpvQjZRRkJmcXJOTXRuc3MxSENza2lISS9MaVk5SHZ0anU2?=
 =?utf-8?B?Y0dEMGU1eXRqUERWdFYzV09Gd2t3SVo4MXgvZlVjU1BBeXJJUmVKZjNkWm14?=
 =?utf-8?B?R095WjVJTmZMZ1k1dGdaRWJKdUsySzUrZmNtV1I2VzBRTHFyZGYvbGFBUFF1?=
 =?utf-8?B?MUJBOG5qZUdJOGFDSkthSTA1eFovZGRaRFBNSlN6b2tMbkpKY0xMaDlCUk1H?=
 =?utf-8?B?ZTE0Vk0yRnpYK3o5bWoyYWVYWDhJN3ZyUkFWYlNXdGcxSVRPTng1UWI2eDZq?=
 =?utf-8?B?VjVWS1VZYksxV1REQjQ1bWt3bjUwUy9KakRDVDFSMEhORWFJdjgzaXdrOGp3?=
 =?utf-8?B?R2VTcDltUWppcVdQTzZJNnByNUxraEk4MjFVNzZZYk9wUHc0eVYzOC9pNHl1?=
 =?utf-8?B?Y09KaytjUERsVEJFOUVSV0NLVmhmL1pwUzNYaHk4VXA2TENsVFBBNWJkbnRC?=
 =?utf-8?B?Q1VQVVpwMlE0QXlNMTZIVFhmZWVPYWQ4akc3M0IzejljQmdVaTV4bWdiM0JO?=
 =?utf-8?B?bkNoWHlhTWZTZklkN3M1QkI0S0RyVkY1ZWx6UEFsenhjeTV4czVGUzZyVFdz?=
 =?utf-8?B?YkNDdXFNamJHYWgrR1RGaEJiRmhHSmpaSUZ1bzFaVUJvMEdxRVNGaFhKa2xH?=
 =?utf-8?B?WENISTBqQmNMMVdDQTdBNFpqNzBlenhxMTlnUDRqNFFZMjBSVDhxbVpVaEho?=
 =?utf-8?B?NGRFUGptUGpPYm9QdEF0MHBvbGNrZk9GRWx3T2I1aU53ZGJJWWxWL0pUcTBF?=
 =?utf-8?B?eWVFZEIzcEFwY0FMRCtmREZsUWVyY3JPYjF0TEJGb1hGakRVVFlwdmlaNFIx?=
 =?utf-8?B?YTFPejU1RzJ2eXJhZW5EVDR0bXlBQ3VXQ3VkYlk4RlZzbEZIeUU1YjdOTjVT?=
 =?utf-8?B?ZVRNem1BcEpiNSszbVBUdDNzK01Cc3kwb01Ca2JBWXA2ZFordkdRbVhsZVF0?=
 =?utf-8?B?SWR3YmRoMlRiczZUQVIzNTArR2RFcVZIbEZneENPOFh4RmsvbzBjbHpCb0Z1?=
 =?utf-8?B?akVyNW5tUjZ2b2syYTk2SnlQNysySXY4UUY5YjNlRlluLzZBaSs2YWFQUUo0?=
 =?utf-8?B?RzRsSUZNek5qQWZZZm9DdXVwVjJhZC9pZ3J4ekhHbElzQk5ZZEl0VEVPRG5X?=
 =?utf-8?B?QUlYUnQyQ3RjaEZmYWxXelVBK0dwa2lXMHV0dE5EYmQ1VW9kRFJvVEhrMWNW?=
 =?utf-8?B?WGgzbGlsb0VSckJqd2IyS1dpamRBTEdQRk9LSnh0U2VXaGwzTzdkY1hvUm5Y?=
 =?utf-8?B?dGE2V3cwVUlTRXRMRHk0cHBrcE5sMG9kdUNrU2RkcXgwdTN1SVMveUIvU1Ju?=
 =?utf-8?B?MkpFcGxXNVB2NHFJQmhUUnFsS3VBbi92WDRvck9jQ2RCdW1YMC91UVBPUGRr?=
 =?utf-8?B?cmdFWmJ5cm1jMFRKS2h5S3lvOTdHbWZJUk53NEFXdnhLaGgvcTNoUEViVlNt?=
 =?utf-8?B?dEJhVTJXME1CamlPbDA1YnV2dE96b2NreXRiMFRicU9LbnloQjNHMkVBY2RU?=
 =?utf-8?B?VkZTZ3M5bmdtMkVWRC9iaUlabTJJU093Nmxlb1ByWkR4bFQ2Z3BBQXRab1VU?=
 =?utf-8?B?aWxWdGI0WnNvS0RVeG95NU5SanMzcGI0V2dkZGtMT1QzbkNGbGUrd28zUXl1?=
 =?utf-8?B?YlNoZHlzak1UcjlUUlpJMUdmV21yOXRkNVBOY094S1czU0lXYXRmWEdtZXNP?=
 =?utf-8?B?QlIvbHowTVMwVnZ5d256ZE1rY0duS3JReGhxbU9WM2Q0NHJVSXNTRHk4b2ZL?=
 =?utf-8?B?VVpab0IwazJxZmg3ZVNtN1hoWGdwMEd2dHFUYUpETWdyVHp3RXpQUHZMam9I?=
 =?utf-8?B?QThNeGFFZkp1MmswL0dJOXlDQXhTMmw0eEJ6REVBdXZtdXdETUoyUyt6dkVo?=
 =?utf-8?B?N2ZYZHZoRTBSQ0lRc0JJdXhaOTNrWEI5ODBhSGJIaVZTOEZyS2t6Z2VXRzho?=
 =?utf-8?B?V1FBT3F3aXQ1bGRWR3ZzMEI4RkY5cFk1VWU5bnJ0ZjFWTXdzVWdDNWhsRGhh?=
 =?utf-8?B?MlZrWklLTlA3L2puVTZFUDV2a1ZPYlU1ekl3LzZXbWJ6QmFMQzE4YzFLdnlT?=
 =?utf-8?B?M2V6dVd3Sit5bUpvb1dzS2FxU1p1RXRZQk0xTVl3eXVVQmQrNkcxTWs3VExo?=
 =?utf-8?B?N01xZ2JjT2RkbllTcGo2RTIxVWxGZUZZb3NuUXpzUFV5TXV2OFdsVkNqb3Rm?=
 =?utf-8?Q?+IHDrmI046I2KxaU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1729a7-5bba-4205-43d3-08da456fd30e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:46:21.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwEfc/O0XuCOmtB4uhZt+7sE6iie3KjEY9SCB7T0OnA7bb09/xFVYOUHJaBJe4hPfRHCebAvKlVZX7Ul3JKbvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6778

On Fri, Jun 03, 2022 at 02:49:54PM +0200, Jan Beulich wrote:
> On 26.05.2022 13:11, Roger Pau Monne wrote:
> > Under certain conditions guests can get the CPU stuck in an unbounded
> > loop without the possibility of an interrupt window to occur on
> > instruction boundary.  This was the case with the scenarios described
> > in XSA-156.
> > 
> > Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
> > if no interrupt window occurs for a specified amount of time.  Note
> > that using the Notify VM Exit avoids having to trap #AC and #DB
> > exceptions, as Xen is guaranteed to get a VM Exit even if the guest
> > puts the CPU in a loop without an interrupt window, as such disable
> > the intercepts if the feature is available and enabled.
> > 
> > Setting the notify VM exit window to 0 is safe because there's a
> > threshold added by the hardware in order to have a sane window value.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Properly update debug state when using notify VM exit.
> >  - Reword commit message.
> > ---
> > This change enables the notify VM exit by default, KVM however doesn't
> > seem to enable it by default, and there's the following note in the
> > commit message:
> > 
> > "- There's a possibility, however small, that a notify VM exit happens
> >    with VM_CONTEXT_INVALID set in exit qualification. In this case, the
> >    vcpu can no longer run. To avoid killing a well-behaved guest, set
> >    notify window as -1 to disable this feature by default."
> > 
> > It's not obviously clear to me whether the comment was meant to be:
> > "There's a possibility, however small, that a notify VM exit _wrongly_
> > happens with VM_CONTEXT_INVALID".
> > 
> > It's also not clear whether such wrong hardware behavior only affects
> > a specific set of hardware, in a way that we could avoid enabling
> > notify VM exit there.
> > 
> > There's a discussion in one of the Linux patches that 128K might be
> > the safer value in order to prevent false positives, but I have no
> > formal confirmation about this.  Maybe our Intel maintainers can
> > provide some more feedback on a suitable notify VM exit window
> > value.
> 
> This certainly wants sorting one way or another before I, for one,
> would consider giving an R-b here.

I was hoping for either Kevin or Jun (now moved from Cc to To) to
provide some guidance here on what a suitable default value would be.

> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
> >  static unsigned int __read_mostly ple_window = 4096;
> >  integer_param("ple_window", ple_window);
> >  
> > +static unsigned int __ro_after_init vm_notify_window;
> > +integer_param("vm-notify-window", vm_notify_window);
> 
> Could even be a runtime param, I guess. Albeit I realize this would
> complicate things further down.
> 
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
> >  
> >  void vmx_update_debug_state(struct vcpu *v)
> >  {
> > +    unsigned int mask = 1u << TRAP_int3;
> > +
> > +    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
> 
> I'm puzzled by the lack of symmetry between this and ...
> 
> > +        /*
> > +         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
> > +         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
> > +         */
> > +        mask |= 1u << TRAP_debug;
> > +
> >      if ( v->arch.hvm.debug_state_latch )
> > -        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
> > +        v->arch.hvm.vmx.exception_bitmap |= mask;
> >      else
> > -        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
> > +        v->arch.hvm.vmx.exception_bitmap &= ~mask;
> >  
> >      vmx_vmcs_enter(v);
> >      vmx_update_exception_bitmap(v);
> > @@ -4155,6 +4164,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >          switch ( vector )
> >          {
> >          case TRAP_debug:
> > +            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
> > +                goto exit_and_crash;
> 
> ... this condition. Shouldn't one be the inverse of the other (and
> then it's the one down here which wants adjusting)?

The condition in vmx_update_debug_state() sets the mask so that
TRAP_debug will only be added or removed from the bitmap if
!cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting (note that
otherwise TRAP_debug is unconditionally set if
!cpu_has_vmx_notify_vm_exiting).

Hence it's impossible to get a VMExit TRAP_debug with
cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting because
TRAP_debug will never be set by vmx_update_debug_state() in that
case.

> 
> > @@ -126,5 +126,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
> >  PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
> >  
> >  PERFCOUNTER(buslock, "Bus Locks Detected")
> > +PERFCOUNTER(vmnotify_crash, "domains crashed by Notify VM Exit")
> 
> I think the text is not entirely correct and would want to be
> "domain crashes by ...". Multiple vCPU-s of a single domain can
> experience this in parallel (granted this would require "good"
> timing).

Sure, thanks for the review.

Roger.

