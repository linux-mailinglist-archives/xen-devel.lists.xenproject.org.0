Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7327D1086
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619785.965433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpZN-0001Lx-NU; Fri, 20 Oct 2023 13:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619785.965433; Fri, 20 Oct 2023 13:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpZN-0001JB-KW; Fri, 20 Oct 2023 13:29:41 +0000
Received: by outflank-mailman (input) for mailman id 619785;
 Fri, 20 Oct 2023 13:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUGB=GC=citrix.com=prvs=6503d4fc7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtpZL-0001J3-DD
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:29:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b56b311f-6f4c-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 15:29:36 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2023 09:29:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7494.namprd03.prod.outlook.com (2603:10b6:408:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 20 Oct
 2023 13:29:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 13:29:17 +0000
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
X-Inumbo-ID: b56b311f-6f4c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697808576;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=M7kc8NhzohTBu2fEv9NcljSdCEWt5GwI6urlMkngxxc=;
  b=actS2DBSX2bgYuvlezC47P1SUMxfMna2fqNWDtUJkj72tyYsai/WlI9R
   JBRsCjx0pjsBHcOBit5hJnrrT5wmi58Wm5RufXmYk4EslvwWXv/u+BkpG
   RJpUS+e0MiIWHRL27OEur1UMiJ9oTBJQ/6zSqzBrP+7dlTRz3kNCunFsl
   8=;
X-CSE-ConnectionGUID: 9hVjPvQ5RsuFii/qoSfArg==
X-CSE-MsgGUID: boBm3/ANTkqbZOEEx1s3Ng==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 124779082
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:haWq6avBURcwH9KYh4v1nCNq2ufnVLNfMUV32f8akzHdYApBsoF/q
 tZmKWiDOq2OMDD1KotyPdu0/UJXu8eAmtVlQFNr+y1mRS0W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeEzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweTAzbCidvr+M26+VS+grn8MYIuDxM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5NS+zgpqQCbFu7zGs5DUZRfH2HouCzuGmTdsIGM
 Bcy9X97xUQ13AnxJjXnZDW0v3ub5DYdXdRKGuE34Q3LzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEuZzhXgMzoALNUQqYAhhRYYekY8mi7wjd5PMZdoKBFADf7
 D4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsIFcFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:rLSCWK+6fjuTV4Vzz1Fuk+DbI+orL9Y04lQ7vn2ZhyYlFfBw9v
 re+sjzsCWftN9/YgBCpTntAsm9qBDnlKKdg7NhX4tKNTOO0ACVxepZnO7fKlPbaknDHy1muZ
 uIsZISNDQ9NzdHZA/BjjWFLw==
X-Talos-CUID: 9a23:4Kxh0m4E2g8IMss48NsspU4qGPg7SyDn12r+Ik7/EGFSRpSPRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3At4LFggzlyb3JqYIAjkbghzbUywaaqK6pIkVW1rw?=
 =?us-ascii?q?gh8qdPx5XFhqN1S/sZIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,239,1694750400"; 
   d="scan'208";a="124779082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JONCBdlMpVVYmdLbSRjTbv9gsYk6SWnSGJ35TafVKMKCaS2UeY1fnVGJkTBvgn5mw0nsZBKOiHIFz7EcvO3v/rrWjTJJ+7E6mxzlTCAyVznh7CJhD3vC24+qwuhnkTElKlJqqdW1zPEect0Mmmss0urHJEC3JplrZ1FyODiPodbMV33YbIcUB48L9U0So2+kIrWfAIMec2kgMr8yzhq3hpX5kZ6K6mRWwJEDTSxuMCd8swuypSOdtf3jDYk2ITmdvr95uX9oby6jGwZ0V3yy8nfIFsn6IyEO88isiGTa20ACGZtFr5D4AGOxIiOcNI8mVFmQ4bVKMKw61p1w8gChRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZY9UJZzhWkYlJGnK3kQBhSXKCrMAcRkA3g4h7z8Ipec=;
 b=PMsq9EayDzlDIq3yIo609f6EJEkNmUuwOyl0F7VQWTePLHH0lvM6EV0GWhGAjPVW0X2BNuTNX96rQB0vX52+UhRAmp5rC+TYuciyJ0w11xBgfHMtpvywjyFnI7vF25YuRzKviM4P8md+THoB7L2QYWi+ZLKaM14L+S+lj7uFFP/cxcoXG66grYLfw3l9JDjJZqsma6LzF53ha5cK8o+sj84YZw0H9F/plFi1+XufhAmKJ167uy3Xw0mrmfgoMSeVUFy7RP7h2cgfTyitGXkRvlmK1a0zwqMsM38eNmxOSwiMk9znuxTYJ2D5kMbFqluuhwyaiNo3lsSy2+bKTJpLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZY9UJZzhWkYlJGnK3kQBhSXKCrMAcRkA3g4h7z8Ipec=;
 b=P+dGrlGfKJqitOWPlVlm8kL6N4JsaqcBCgewMUSO7ZeOEwuQbwSk0e3rJMgPJd/D58aMAfwQG1C4dh47/rAS9ikB4voBuKwRBZGpFIGp7lniRzQa/qcczBdt0qKEHis04vBGV377hXGGSqrsKbi//P25EhJnhAc7U8v78c/3hVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Oct 2023 15:29:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Message-ID: <ZTKAqBILUBNelYCS@macbook>
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com>
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: c49a362e-0861-4ec2-3ef9-08dbd1708f25
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fay6p7xt0ZNh5J3bwrC7oSwuvBGQDAC6UcvgAgWYVVpRjdzF9m3Mfe4OyAqwlJq8G8lNS72PEj3eecQtvV4tidzhb/QWbSlGkiqUdtE/sV7z/wHzyeBBI6U3UYqkVABZS9thE26mLsE4aMWqI6S08RzxCur/MC9nRpkmH5Cq1bWwBwqR+Yw8jiVc59QypZyDxbqHBhzPNQxmuXgA9pJ+wfkuS3+DCmOG1EPTPpF01sC2sNQPznptZ3iz9xNs/81MErAqM85iRah2alTuMAlEP340IesNPyU2laOsmaKRF1q5LmBk199LyiLfRAMHF+OQm7eVEvKurzAlqLaD23pGVYvBSJi12wM36B+YcM2mdC1maBl5SymofdFhnf5FOi3XCwA7zY23Wgggc6jRD8cqZvPldyUyfJ9Re2HZ8qM5u7XVgUyqzhlzoKgsF6Ih+9PXp8AQfHHSbNboyS/oJR5a769ZdYIQ+KNro2m3ZsHDNWvIL/cma5Oty6KsmqfrQimx6sIE1iIWwcFtpStAAQFCHr2uF36wIlvBhb/QigdaUfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6512007)(53546011)(6506007)(6666004)(85182001)(4001150100001)(26005)(33716001)(82960400001)(86362001)(5660300002)(38100700002)(2906002)(9686003)(54906003)(966005)(8676002)(66476007)(66556008)(6486002)(66946007)(41300700001)(6636002)(6862004)(478600001)(316002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWtaclg2QU5BRVdhcVRSdVJoalpOZG0wdkNNNkYrRms5UmI3OWt4ajMrMmcz?=
 =?utf-8?B?VG5ha2piaHhTYm5SQ2RDL0hiUFA2MnQ5RXVyWTE5U3pydzNqSWNNdWhMWFlo?=
 =?utf-8?B?L1h3Q1Fyb2N1V2dXUWdUWStNZldRaDRrZHJnRlBjRExBSkE1QmJ2cE1uQkhO?=
 =?utf-8?B?VVFLQXhibi9hTjNLYWxmcDhBOUMwWU1kQmhvVjlhdWlBN0R2aFVKbXVjNTdE?=
 =?utf-8?B?RU42ckRML0xNc3hDZzMxR1NNc0NKcmpDU0kvZVUvbzA2RHgyNnloZ1JsQTNu?=
 =?utf-8?B?dElDcGFLclZmWnAzdlh3S0Y4NTFUMVlHa2gwc3ZkK0Ftdi8vMVFvZHJiQkY0?=
 =?utf-8?B?bVVtMHpkMTVnSGYvaUt0QlQwenBwbkZXeENjMytCOE9ycHh0MlIrK0o1MGl6?=
 =?utf-8?B?bTJlQmMzbWN3ekFlU2U1L1BBdlJZVjJkNGxWaHJtYjh4Yzc2dlhiR3k4UCsz?=
 =?utf-8?B?aTdld3BnL3RzM2RBQ3RqL05QMzliUi9EN2s3bldFK2I0MVRnaW9zeDd0Q0hO?=
 =?utf-8?B?UDFuQXM0SitQeHdjSnhwSFJlV1RiSWFLQTlWUldqbnpnU0dpaFFJb204cTZB?=
 =?utf-8?B?MEZCOEZoTU0waGpoeFRGTmtIT1VKczl1RWl0d3FySXdKTVU5RHdrS0ZxQmxp?=
 =?utf-8?B?cnhkMSt1VkE1cmFFbWg2T213cHNlZGV4RkpvQSt1cEFwVFUxNW96UGFpS2xI?=
 =?utf-8?B?UW9VUW96aDh0UDd2ZjFsMDgyZlM5RTJpQ3pxNXhxWmhqcVoydkh1YmhzRHJS?=
 =?utf-8?B?OGhRVDJhOGNDU1NuV3Fnc044SzlEVERFVSszZXpSMndEakIwTG43RUo1ajVl?=
 =?utf-8?B?RzRRb2RtUTJZc0hIUE1QcFZ5WE03bklaVXlYTW1ySUNXckIvVzAwL05JVTRI?=
 =?utf-8?B?bnplRnAySHFvVm03U0ZBY1gwam5PTVB5NjhwMlIvMHQzSm9EaWNUdC9UTHB4?=
 =?utf-8?B?VDdNWlMyRmN0b0Vsc0NuSXoxZUxLdFpBbWZFT3Y2MnJwSkJHT0gzVWVwc0pT?=
 =?utf-8?B?aFNDWHU3Q2lrMnQzVm56S3gwdEthcGxieHVScXhHZDE4TWNVQy95QlY4L0FN?=
 =?utf-8?B?YlpTOVpIa1B3VUwvNldVQWR0YUhtVlNwN3BtbFdRNmVWZlJ2cDJNOEZGRHVz?=
 =?utf-8?B?QnBXeXZvaHRPSU1teWtoMkx0RHdYQk5Wem5lNHh4L0xLSjZpUC9tWHJibExy?=
 =?utf-8?B?d284V0lDTTNTVzdkUmRwT2NFZjBBdS9EYU81Q0F6Mm5MWlRXRnZtVlZIZWFV?=
 =?utf-8?B?TTlIdkFXVXpxZGhMV2hWL2FUcnQ0VTZTTUMyc1VrMTc5MjA1RHh3VXFIekdX?=
 =?utf-8?B?RGJzSUpuV3ZZMEgyaTFadm5xM2ZTMjF3S3pmS0JnTk5PWkZMZWY1ckJ4V3ky?=
 =?utf-8?B?ek9QSnIyUytlVE9jMk9ZOVFVUE5uTVI3QWdmUFRJbEFKa3dIbUFHR1Q1Y3Z1?=
 =?utf-8?B?azdaSWF3dTVYMFZjVWh4TVJibEVRZ1JiSS94eklybTJrcGpwV29mbXZzV1cy?=
 =?utf-8?B?UnoycnptdzYxMDJnN2wyWHBkY0cveGI0WjNNM09vdmFtOFpudEVwdTMvRG5I?=
 =?utf-8?B?bisvOEdzRGtxdXpHbytSVWpIcms3djFvOENsSk1nSXFhb2hHLytRZFQySkR0?=
 =?utf-8?B?NVhuNHJURlcvcHUyNzdNNksyQncvZE0yN2FoVVFUeDJ1Wk9IVTdSOW9GVTRa?=
 =?utf-8?B?WDh5eWJoQnRkWDNPd1dGVG5aM0wrOUxVSDJsd1R3Q2FwTFVnYWhwZVg5QkNS?=
 =?utf-8?B?RjlJblU2bndNVDg4cEJrTXczaldoYWRSditqSkVjZGJrSGEvOG5JekpraEkx?=
 =?utf-8?B?TGJiRmRnc2lVZTZjRTB4QzBpZGpJZ0RUUHFWSjZNZVBpZjFnZFRxWjlMeEY0?=
 =?utf-8?B?T1Fkd04rNmcrRm81UlphTmJCL3dLT0pkSElSNkN4T2VkYlBiVWhEc2FpN2Z2?=
 =?utf-8?B?VGd4U0ZpUXQrWGRCZUJEQ1czeloyaEVsSkFKM0pyY1JuN2twOWdqUjZJWVF4?=
 =?utf-8?B?UkMzWEJ1dzAxTWpONDRnSTZ5UDNqdHhsT1BhSmJ0NVg2eVVxQmRMMTZ6Znoz?=
 =?utf-8?B?Sm05cXJoamFnSWFFc1FhUnZ3NHExaTdJTzMrTFhYUmVrdmdYZnNVMDh6TXQz?=
 =?utf-8?Q?G+B8jhpgrpkt4X3ooGTMDCGc4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xODk8qo1InzWzTcQ6N8aM9UJh+taJXjg4P2wa2HaJtPc9P5/vy9qjqby1pg240tK8H3Fg30RscgfMUFSC0u6HhAvTBvTZCVg2x1XWPAuwofxqfkR+HkKoTsTge087mvLHEN7e2vsDFPv9D2gMvfyPhNaV+fGk+F31tDNeLYwkpNinLuQ8fk+TkY1zSocErWaAXpr/01oYsKGbNJAfaIVzE9DB9uDQAg+GWcs5jnYPG9Yl7HUOJ7XtZcDYob5kdHoifDhnifMBNeWY4uiMsPxy0puq0FPFUZSMp5AsZM3zYLOba4cCkwit4M5g29DCwV9bve32AEd6ATrvDXf3DmWMLRmdDFeG4853znypLjoSIyMX2BANs2lnASrRzOP6TOsIfyGyYkdYY9Rkd0QDyXZi2IR052FPZ7dhK7IqD1z1ez3RgUk5Gr4lttiTmIiMBoaC2wyZ31ntMjjxs7a6O9ln4O19Tym4yUlpy1hcy8pcVx0B14eCQn5duWHiuKdmd6yIPDO69DAG4QFGH8wrXr6CHE+74nWzd8f+igHrUtAhRVSMuKlZ/LIAMeU4Khu0DoMjquaX91YFPV73bYkRMPv4Wrf2LAuGbD3ehassV+1KMVA1IcpW32TZQw/qFVyYEZkJXRrQNdeYFeqQNTBlz+FWmnAxUHfgUTYTW9iInCPqrX5OtZ0jepj+1rOEfs1xgoAsC4VjF4VwrtG1R/fNfOxMTToJRSVYkoQy+wdhs0L/YYPKJCl616CMFKikFuddfknwZ9duQCjFGP+EQqE2PaE7cwQNnd8jY99RVDXTGPWo9/QMwdIs+jQlvLMQ5CVrKo2CrR95Fkz8W25sVEnJbVJXZWW/XBJZJudeHIVPe22iJOhdsN+Abc8plqUAK2Xn99Wp7xdKd1bge/FSr0nVxzfmA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49a362e-0861-4ec2-3ef9-08dbd1708f25
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:29:17.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBeGPVw/NPenPEGJDk0R9beC16IB94xlP3X1pmKbP4+BJe/ZC6xHd/iJ25SFeNKoyX5V75BPR6eYtZ5RXALc8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7494

On Fri, Oct 20, 2023 at 02:25:35PM +0100, Andrew Cooper wrote:
> On 20/10/2023 11:29 am, David Woodhouse wrote:
> > On Fri, 2023-10-20 at 11:14 +0100, Andrew Cooper wrote:
> >> On 19/10/2023 5:21 pm, David Woodhouse wrote:
> >>> From: David Woodhouse <dwmw@amazon.co.uk>
> >>>
> >>> In shim mode there is no hardware_domain. Dereferencing the pointer
> >>> doesn't end well.
> >>>
> >>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> >>> ---
> >>> This is about as far as I got in my abortive attempt to use the PV shim
> >>> without an actual PV console being provided by the HVM hosting
> >>> environment. It still doesn't pass the guest's console through to
> >>> serial; that only seems to shim to an actual PV console.
> >> There's no such thing as a Xen VM without a PV console.
> > Huh? There are literally millions of them.
> 
> I'm very prepared to believe there are millions which don't overtly
> malfunction when you don't fill in the HVM Params. 
> 
> Which is very different from saying "there's a way in the Xen guest ABI
> to express 'you don't have a PV console' ".

FWIW, Linux assumes that either the console page or the event channel
being 0 implies no console available [0], so I guess that's the ABI
now.

Roger.

[0] https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258

