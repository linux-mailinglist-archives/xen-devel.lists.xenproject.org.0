Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9476B8FD0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509532.785439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1qd-00052r-3Z; Tue, 14 Mar 2023 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509532.785439; Tue, 14 Mar 2023 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1qd-0004zq-0G; Tue, 14 Mar 2023 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 509532;
 Tue, 14 Mar 2023 10:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc1qb-0004zY-Nz
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:25:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd6dcb3-c252-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:25:36 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 06:25:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6470.namprd03.prod.outlook.com (2603:10b6:a03:396::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Tue, 14 Mar
 2023 10:25:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 10:25:30 +0000
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
X-Inumbo-ID: 8dd6dcb3-c252-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678789536;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MQXZCq8/FHj0ddqO4rLav/yKjO4bFZzM8xarWewQ1gc=;
  b=Exz+8ExfxYhC9aK6n+JiPoF51EZrzH4pZb7S6P12ScuTgUuavLCcrfPo
   tUnOJZauSpT1n2YPncjw4d9FsqwvJfS1GS+R8g69ROZp7UzTV12vVncwR
   cBVBSTfZym6ZrxRsg9sFG6Hc7ydypePHy4QVTr0Xv8LUPQpUykmq9/Qhi
   I=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 100663552
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J/BsKKkiFu31KQS5QuBJALfo5gxPJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXmiPOf2KNDSnKth3btjk8hhU68TSm9QxHgQ5pX82EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eApAT8fTRGyvKW/57uqdscxge1/Fta+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHujBtxJSeDinhJsqHm311ArFTNHbgG+5sCj1FH5ZI8cd
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4qjJ5weUAEAUQzgHb8Yp3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRutPQAFIGlEYjULJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7sCIQ/6Cy/FSCjzfyoJHMF1cx/l+OATrj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQQH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:5H8016MFFn40tcBcT/3255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztCWEwAr5PUtN9uxoV5PwI080maQFqLX5Xo3SJDUOxlHYSL2KhLGKq1OAak7DH4hmpN
 JdmsBFeavN5HdB/KHHCWKDYrMdKbe8gdKVrNab5WxsQGhRGtVdBkpCe0emO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dl0awTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dYyxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbU+15uEFFvUnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzYhB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3NQiFXtuYcw99R/Bmcca+a
 hVfYXhDc9tABanhqXizy9SKZKXLy4O9yy9MwU/U/yuonJrdU9CvgAlLbQk7wY9HbIGOtZ5Dr
 f/Q+pVffd1P40rhZYRPpZzfSOBZ1a9MS7kASauJlTrfZt3TE7lutr+5bkv+eGmEaZ4t6caid
 DIVV9CqHQ/YF3jEtCfxZEjyGG1fEytGTzpxtpC+phlv7GUfsuQDQSTDFgqn9C8vfkVGMvSQp
 +ISexrKu6mJW7jAptW0wbjQJw6EwhjbOQF/sw7U0mPpcyOIIvsuezUNOrJIdPWYEsZc3K6GH
 oKRzj1KoFa4kSsR3O9nBjdMkmdBXDX7NZrEaDA/+8cjJYWLIZFqAQIklHR3LDsFQF/
X-IronPort-AV: E=Sophos;i="5.98,259,1673931600"; 
   d="scan'208";a="100663552"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEP9SIyFSODo3zvQ41UK1qxfTVHpBsvHYtOju51Vj6J+L4DVWy3L8R9ogWeuUVz4iQ3YpL8mrM8xY3YXypz10kD8ADZX9fpFc1WOPVLT4MkRHyEWpZF2kL5Wp/YM39Shd5QNccTJ0Oqga3lg+N3tNdPS+YwnpDvxdkrC5IAbK3WSF7YsKas1BU9NzQ/WmHoCqvYLQWLZB9RkvjhNqzMQKAq2tgZS7wjfpFdsMIk416/yPbU2qmhtwuE5uxaz7oJu+kVb8RgbbSwI8Pe/LoTdVeEUlihIuq22KYXULxrmQ1YwLa2+WMYetsD8Mxkcx4zDthT26PEieiclZRsmrJllIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12AfplvstDKmBsUf1KmcFEKQBX03GJILkEZfyKxsbgM=;
 b=ToIHSB9HpmbUWyQ52+IMbVvvq5Z73uEkKxuBTHePEhM8Gqo8HynMh340ln6V5yn4snqwFzDmlSCk3byWlUUYHYxDCRULxprmI42/i+wbiSVTrI3XG2NQbw3Om6Pvx5vBh0vSVXgMMN00pgTttP35qQRwZsnTG9b7WOmibCavWn90U3T4UTeDxLUMGBo7cgQsTiJgcsn1UxyWY8n1QyfA+L/OR727GkBdA02BmCZm7LtDX6eQ5QPHO9RvlsADqH6+jNKfNPDVQWmuXclqtwVVmqQgr7ShtwD4Rl7OHt0Wey3tYyxjII9XYX+luPE3myYmra6C/ko+kyQJG1c56DbPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12AfplvstDKmBsUf1KmcFEKQBX03GJILkEZfyKxsbgM=;
 b=tv1LNB77PyV3ssb/Q74Zf0WrPoI0X16tSmOeypaxo63ht1HBM6GEQfAFmLMfxkheza10d2PExmgpfYu9H7rihvdq3MfXilCXvOXhorYM4kgmJFQG4jyGFgDaPYtFgBi246u2R/h7rCjw61Dol/80mfO67zE6NfmNpYCGhgUfsiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 11:25:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/grants: repurpose command line max options
Message-ID: <ZBBLlQZLfkRltI9R@Air-de-Roger>
References: <20230313121632.86789-1-roger.pau@citrix.com>
 <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
 <ZBA8yORIxXRM3RkO@Air-de-Roger>
 <04bfee08-53e5-49f2-3fb9-440b6861e3f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04bfee08-53e5-49f2-3fb9-440b6861e3f7@suse.com>
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 0568932f-5efa-424b-97be-08db24766fb0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MBMqGSSvZHLy98DuQlwFtY0QXX6K/Rb6dJgmmRUJb0tU5AAnltKCSIGB9YAcEdDubMOhz3D0/k3XEEpw1asqYudDnWb9LYboV3oW9CkyOAZ5RBap0T3XoCxuVRn/fJPKIpMl6dObyNxbc8nyTfi7QtPLJ5ANeOlmQlZGCz234kwB9hDuNsALy6bz5El+aqVLZ7ofRxu1w2DzTQ2h3I1zFyUeDfiPkQsgs22e6GvAra9lZSqHNfd8xLapPTPNwDyZ6ZVilH7jkkE0hGQt2WBpP9BR1cCZaTivQP0YtARyXATlqxkdXgpw4YqnVnJW8sEFMl0GPH+nSkoWz2C67YdkZVbhETuOSG69OFIrS5jc27pImUy/QunHiQRm0eiwLDAv8VcDftKyAHOVDkTCe4MJ6znNBFgCtZ4CQkdYNP3RDvKUVHoTlyjOdTkkHaFeVlCvfGZZhIqvb7sYbFjKHfODs598ZgLUvAVeY8O7r/CbIp71J5PGECvK8urxf1GadgekSNNG5jU9jH8g4ThZTW223b4vkhlGCSKYqYoM2xdXn0+D4sUlsxRkAh87e1zLQuxHXChUXT56Mn2XOD9FzfhMdN3T5UUPXfx0RNuxpeCFhSR5m5xNCotcYA9/daAkV65LlKygwK21LfNyvkKFvO6Z9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(38100700002)(82960400001)(86362001)(8936002)(2906002)(5660300002)(33716001)(41300700001)(6916009)(9686003)(4326008)(26005)(6506007)(83380400001)(6512007)(186003)(53546011)(316002)(54906003)(66476007)(6666004)(8676002)(6486002)(66946007)(478600001)(85182001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0JFcVFmN2tKK0grYWtCekdYNGpXUnNvZHR3OXZUQXJzM3pnblNUbkRyZ3Ew?=
 =?utf-8?B?V0R0NlBWekVObFlJaWU1ME9VNmZzby9GTlJlVjRjM2s3ZXVKM2V4aXVhNWo1?=
 =?utf-8?B?S3MyTXVlNWNLRlpQS1JUM2k3cS9oa0FBaXNTdm5LYXBmVHRpUDB3WTNEdFVh?=
 =?utf-8?B?ODJVVkJzTFVKNkwwcC9iT1VSWmJOVzRPdysvdGNzT0t1ZHZmdXZLanVIbVF5?=
 =?utf-8?B?MkI0YWhYZDdRNkcrdlRCVW44WnhMbzhUejdsQ3VBVExsVEVXTmVGRndEaDJw?=
 =?utf-8?B?VTJlNm5ndkR2dVhDdThETzNzMmVpMTl1YXg3SWV0b3NkVmpuNXp3WTRuL0VE?=
 =?utf-8?B?L3c2bDJDT2lNOGFNTC9zdm5lOWhvQkhHTkZOSHFNQW95RHVMazd5RGNxWlBM?=
 =?utf-8?B?dmp6MVJUV0JCTFFXNjgvbUhTdTdzSlYrakdocXRhR2QrWHkvRmhXemlLd3pT?=
 =?utf-8?B?UHcxcE9PUlc5VTRMK1F4ZnovT0dPc2FLbHBRZWd3c1FQNldZa0RWTHFvOGtY?=
 =?utf-8?B?UVVIZXl4VkJvRHNhN2VSOWlVR25GS2VWTHFEWE94Y3AxREdWRFFXY241LzhZ?=
 =?utf-8?B?RWhvWkF3dzZrS0xacVk2a0prbEdxSS83Q1JWS1Z5aCtKQUwwTWhPRGU3Uldp?=
 =?utf-8?B?M0k2c2dvdkR0cE4xaUpNc1RnRGI2SHZia2thYkpCUTVhbnZHS3NwbEJLd291?=
 =?utf-8?B?S1JEaFlpTW9WaEhrakRRd212bnZacDRKMzI4aHFNbjVJTEZ1U09jOExZWGdm?=
 =?utf-8?B?NnVNbWg0aTZ4TVFqU0xrN0hlbWQ4c3V4TjhNaXl4bVZacG9qVzJIRUMvdFV1?=
 =?utf-8?B?N1k2SUdmU1Y4MElKODhqMnE2M1U5YURCUlZJV09RMlNXd0lUT01OM1YzN1JC?=
 =?utf-8?B?LzJOU0djRHcwQjFoTldBbk5Xa0hHSGtaeHY3SEFNVDVxT3dmbnVSZmNCVGhM?=
 =?utf-8?B?RHNPVXZQaGtMTnJjdHoxT0JMVTJYY1dQeWF6QzVmMnB3VVcwNmlpdW9UUXV5?=
 =?utf-8?B?bUNoTmZOclNYQmZzUUtrK1V6UmppMUo3U05zOC9MUWJ2NGNVeXhvQUNKTGJ4?=
 =?utf-8?B?eEIxTG0zVW9WOU4zZmcyWG5keFd3eE9vUlRaeWYrK3RxQWtpQzNCb2t2dHl4?=
 =?utf-8?B?SFRjTUJhY0duZGZicG4waTlwNjBWRzlWekFsODkrT29qcXZXdGd5MFNQTDlD?=
 =?utf-8?B?WnhGb1c0TVRuL0tPVU1IRlRUcnFDUzR0ZmIrK2RnZjRNWFJTYk5nWVY4bi9k?=
 =?utf-8?B?Tmh0SXpNVklPZjRJYTBmcXRvd3J0K2RPYUJITmc0STFnYUdUQWZVTW9tZ0R3?=
 =?utf-8?B?U1h4dm9IVkQ1RU1NaTgvSEdjOElPNEZrRStXVDNPQTZwNnpNRDZHSU1jRXll?=
 =?utf-8?B?bTMzWk0vbG52Qi9SeEZGSEEzOHcxcnVmNDFRWTdNcnJpUG5GMmpiVnkvTExZ?=
 =?utf-8?B?WnpUejd2MXM2S0dhS3Y1UGhQUUM4cFAwbXF0SnNoK2p1amFMdHJaU1lORjE2?=
 =?utf-8?B?RXZibVlzWElBakZabGJhUDRaYks3cVN2Mm4wQTJiTGJsa1JGb004OFBtQm5K?=
 =?utf-8?B?L1VVL252V1BvK2R0RUlBQTBGY0NjeHlJTDgzTVpGS2VGNkt2V2pRdnpUd0ZU?=
 =?utf-8?B?MiszQ3lyNHJzWXRYTGxscEkzVmF2Z1VhMitHVkxBZkxkR3Z6TzNZM21scEth?=
 =?utf-8?B?SXZKSHB3OVh1b3dlTG92VTV5TDhqNkhMYnpvR0NBbCsvZ011ZnZhUU5JaUh5?=
 =?utf-8?B?LzBhTFJXeFAvRExtYzJmbUwzbTBsMmNoZ3ZURnNWQm1rZ0kxZ3Jhc3UrNzFN?=
 =?utf-8?B?aXhpb2pWMkZhVUljUG9pMGFZeHdETm00YVZyZlFMaEhPOVg5cCsxcE1iM3Jt?=
 =?utf-8?B?MHRVeFd6bkdoV0dJT0wxUHFHNno3dDdFcDJ5eHVHNTIzRXowWWdLWGxFNUJ3?=
 =?utf-8?B?TjdnU2Y1RGo2TmZYZSt2VVYrQjlEZkJhdjVlUUdPbGdkSlVOaEFUSm9sOFp6?=
 =?utf-8?B?a282VFZtS3dqR3pFb2U0UVNlV1pyRmtTSXoxVkM5R1lHWjhWU3RsWmp6TENC?=
 =?utf-8?B?WHlyeXhYanBvZUxhdGs0QWM5bkQzVEx2V0dDSnUxbWRhSjVUNkFGSGdOQjZS?=
 =?utf-8?B?dEt3YjAvZDVkOHpVaHQ3YklSeVBVTnc1ak9RaU5XVmRCQ2tPRTJKTDRjdHlK?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/wKq22kq4n6Y7/mZTNwaiE+JqIITtbEA8bUHukedxhbo1FtmH+OATA76us/JQFYSz81GlyP08zDb2lyG9/4mQDY0bfmj636KUidcmY/1MDEXRvxeOoBgfN5XQw2y5d2yN9DrvbjcTla8Xxt618P8eLjSoIqRz50d88NFC9CHP7WZgGuTnYTkgeimuOWWEKnI2T8pFZSrgqn0ORFTZzFkCGbRMm5Yk5J8tJu08KaeXh8Zo4TRqMax3b2+PSpQuhRjTDuy2XC3+qed97EjcaMD6p6WhAhlz1moV7liJVPIeTcbQNpmjnNr1C8iLDZUZgcs9vsQgS3yJh4OfwcCIibgUEN76JynkrMA+OHcsPiZq4hwV9GXxlfQPsbQSCn9HAQElvQfFuVCK3OowOOvWCVygASqgd7Tz0OQ9NOt8DI8O6t8F8um91lD8amfM/aTYMyCukm8HcLCSHbgoGX939uTKU0KnoPAE+Rg0NG1ZKExwGuxabK31I3fZVTslzeDVT6c7Nvqcto6ZS7d6vHSJtRHYy7UHlZgP3l5dDXdProeXxE/K90qNkur6B+MiQxnnUTsOsQqgdfZ3L3xTJs+L2CYMBC2rdQ0dx7G8idrZYNBQDG4gV6wzehPWCM5t/M0HxqY0+D4TKjjvdIPpAPNl1zMJ07Zra4Dk+4nZ8SbWzh6qtxtsKVQ3Tp0uB2eug1pBa/W1NAnNypokeNJdHkj6mbhMmVwtb8rpEiu8kxekbz4Y0IBnLxeHKnfG2rlnF4Orv265BklmZCtHAOlwrTg1eW9hqESG0Ihm3aTN0TzaqC1BQb1GbPDU2wIAsQvhOMjMQz+JeS0q79A2cs8r8AegMbjFegilg0wH7ZGXCzFJ87q6bo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0568932f-5efa-424b-97be-08db24766fb0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:25:30.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3ILbV8pz2Z7GKnWEySaCn96KXwUeU20einRql7gItfOqRE4c+QaXP1270kaR+R3Z3SgB2y7rQBCm5MkMpBsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6470

On Tue, Mar 14, 2023 at 11:04:21AM +0100, Jan Beulich wrote:
> On 14.03.2023 10:22, Roger Pau Monné wrote:
> > On Mon, Mar 13, 2023 at 05:55:09PM +0100, Jan Beulich wrote:
> >> On 13.03.2023 13:16, Roger Pau Monne wrote:
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
> >>>  
> >>>  > Can be modified at runtime
> >>>  
> >>> -Specify the maximum number of frames which any domain may use as part
> >>> -of its grant table. This value is an upper boundary of the per-domain
> >>> -value settable via Xen tools.
> >>> +Specify the default maximum number of frames which any domain may use as part
> >>> +of its grant table unless a different value is specified at domain creation.
> >>>  
> >>>  Dom0 is using this value for sizing its grant table.
> >>
> >> dom0less DomU-s do as well, at the very least, also ...
> >>
> >>> @@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
> >>>  
> >>>  > Can be modified at runtime
> >>>  
> >>> -Specify the maximum number of frames to use as part of a domains
> >>> -maptrack array. This value is an upper boundary of the per-domain
> >>> -value settable via Xen tools.
> >>> +Specify the default maximum number of frames to use as part of a domains
> >>> +maptrack array unless a different value is specified at domain creation.
> >>> +
> >>> +Dom0 is using this value for sizing its maptrack array.
> >>
> >> ... here. And even ordinary DomU-s appear to default to that in the
> >> absence of a specific value in the guest config. IOW at the very least
> >> the info you add should not be misleading. Better would be if the pre-
> >> existing info was adjusted at the same time.
> > 
> > Aren't domUs already clearly covered by the sentence:
> > 
> > "Specify the default maximum number of frames to use as part of a domains..."
> 
> Hmm, yes, my attention was caught too much by the Dom0 statement. While ...
> 
> > IMO dom0 needs to be explicitly mentioned because in that case the
> > value provided is not the one used by default, but rather the one that
> > gets used.
> 
> ... explicitly mentioning Dom0 is fine, I still think this needs wording
> differently here, because Dom0 doesn't actively do anything with this
> value (and, as said, it can't even obtain it other than by probing how
> many mappings it can create).
> 
> >> I also wonder about the specific wording down here: While the max grant
> >> table size can indeed be queried, this isn't the case for the maptrack
> >> array. A domain also doesn't need to know its size, so maybe "This value
> >> is used to size all domains' maptrack arrays, unless overridden by their
> >> guest config"?
> > 
> > I think the wording I've added already conveys this meaning:
> > 
> > "Specify the default maximum number of frames to use as part of a domains
> > maptrack array unless a different value is specified at domain creation."
> 
> Well, I mean specifically the Dom0 related statement.
> 
> Also to me "default maximum" reads odd (and slightly ambiguous). Would
> "default upper bound on the number of ..." perhaps be a little better?

So what about using:

"Specify the default upper bound on the number of frames which any
domain may use as part of its grant table unless a different value is
specified at domain creation.

Note this value is the enforced upper bound for dom0."

And similar for the maptrack option.

Thanks, Roger.

