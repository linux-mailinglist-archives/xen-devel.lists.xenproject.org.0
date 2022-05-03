Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4B518219
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319398.539633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpUi-0004kB-GS; Tue, 03 May 2022 10:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319398.539633; Tue, 03 May 2022 10:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpUi-0004hO-Cr; Tue, 03 May 2022 10:11:00 +0000
Received: by outflank-mailman (input) for mailman id 319398;
 Tue, 03 May 2022 10:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlpUg-0004hH-Iq
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:10:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a32cf2-cac9-11ec-a406-831a346695d4;
 Tue, 03 May 2022 12:10:56 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 06:10:50 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB3235.namprd03.prod.outlook.com (2603:10b6:405:47::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 10:10:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:10:47 +0000
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
X-Inumbo-ID: 51a32cf2-cac9-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651572656;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TOPpMhClwRfKHfmFIJh2tGPy0dP3JDJ/VZ2rytOBuxc=;
  b=F9Dxcv5cKyxZzTxpizBSEIdM3Xm3ufiw+F8YDUN6vttXf3SjOtl0R/LL
   tX/uOyucAkCV84ivK8pLaonoW6a8ffPyk9xyYV8rZSevQ+PJ1HjSDkZVL
   y0lb2t1fUdI+zZSUNfRU3E2JEIP/+ZuYwaDXbM4ec6SOiV4l7IrtjpwT3
   4=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 70859036
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pBJAmK6+HSELHynP2SlH4QxRtEnGchMFZxGqfqrLsTDasY5as4F+v
 jNMCzqBPvyJM2P9L9klPou1pBsC6JTVydRiGQo9rng0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSPZyYKI5XAvd4QQgZiOHA5EPR72OXYdC3XXcy7lyUqclPK6tA3VAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YAhF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA+A/E/fFpi4TV5AFdgZ+0HPrrQ9qPd/tJnE+5u
 WOW9WusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRxSlpFaUsxhaXMBfe9DW8ymIw6vQpgqcWG4NS2cZbMR87ZduAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs37UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:Gkm7vqjfaa1pwg7AFfJOivmSGXBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeSWCQfkNIN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 D52+pT5fVzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCLa/fI8SjvwQ6Ce2sRG2MiaPLo18bAVpL
 PtFHtliE9aQTOaNSTJ5uwHzizw
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70859036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY+2/W175nW0WRBtOYpKOa0QmNVZinli8NInjGVdwT00KvNpc/PmNj0wfha0YUlvxhWxff/pkoo4XSgQcb9xpKVylp7YfntcgekFPxhnHnqLxPy8w57OISb0mcRZrLwDNIz7jkmZUi4Gq3cLTg8/viKi0mjMpy45e7ku5HEP0zQ9ODq41YqewDfIQg/NiWorPSpWtsiXvUYNRkGUMw8LcGy76nfYtr8t3JiThQTfgJ9Pc41iUrFMfMOr8q+vAXBqEpBxoH5wGdeHWHuTl6vJXl6jVul96UCtk9/ZwxrQT1tbn6WPO/nZYKH3eCf07Q3hsWQthgckS8Db9EVOWREjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROOFs89QgiNf7MgTSRV/8whKC9Rvw6o7cuRUEYQGDD4=;
 b=Y6gSy732MVl9nt0j4AKk55+p3hRsRAnOFO6OmNyVHIB7nPdaW+FP74Uf1RbHmebslmNW7ileu0c67TSQGE3sgG3CN78fzBpK1yhp3qsOpvu2wuTeWH1JSAQTsA7w44eJh1kvfETYX4SlkJ1NEwLxYzfXdh/PT4Y131sPMULGmygh4gfRkpiLiyuAHjY21c1iqzGbnLABGYcw7l06b9XNhqoG+APhHwGF9Z/fc0jSDzfFHChAy8G2TsJSYHC7okksSFpmvXbNPHQ8on/c3N4bOI7JKouyuak+6irpZJnas31wamv8EifXoO7Lrm8xosfmRPdFXxhUCx3d9Sv7cdR3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROOFs89QgiNf7MgTSRV/8whKC9Rvw6o7cuRUEYQGDD4=;
 b=iNpKSkjE1C9cmru1Q9SUVT6ywEE1icnGS8QIzy51MlHmxRn+pfbUXqcRJFiVircmWWWQDARfTXljgAVn4sWot1RDij6m63WLIvI1FmGlx/KwIScMg7cuKQPDy3lsYaBGkqYsuqicqrrzdHQ8K+cVIpbeqQThcN8wLVqtZSLNMN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 12:10:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Message-ID: <YnD/or3VoM1ZvnxY@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
X-ClientProxiedBy: MRXP264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c431f414-8429-48c4-5ed7-08da2ced314f
X-MS-TrafficTypeDiagnostic: BN6PR03MB3235:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB3235914E2DDF980823074C858FC09@BN6PR03MB3235.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CzuDeEPN67PIY8qXk/etGEmeNtxGK/v3nEClD7U2zL/OTdC0KNSOZuGjCXOpi+iAuk2gTc0glP7wken6lmgBe4wLghSeF4kxziNDyUjpfWK8XVLwJ4t/l7BZ7ehKW+6cwpLFa47ndPaP9D6OpyqUI71jZ0Q9lsN3uX0M28x/ti3wU3PK1zU2lTg9NPwnVK8ajRk59iOHjCrFlNFKECSNHcumvMmWmvxarOY5Gyqo5j/IKiB7LUdXX5AlOagyGyUWvosciZj3Zlc9Sac5yDTb/cPpikP9hlDHorKm2imFHaJpktaoxkhGlyYoQztj8/fF4AhBALpvwY7veNWvv/y7bYUEoL/15CkDw59iRFgZCXbtE/pEivBQ3zSzKaanXNtOinM1yeUGrfCK+u19v2i4TPu6PLCOk89aazKeiXTv3xEQx2kl9A+/Y/n8hV9FtzCNdLScKYgqoqsIk7BhQMsSkq4spfilH1jiY3gfwrnRG7FXm5Tq+tfGobp5Kr3CUJEmYV0zHXSL2pFp3KTsshSDqt1n05kHMANiER+5rX/xgqfwqPFn05CGQlHNvnWc24LWO7j109/Z47BQen5prSmVEghcKPbtRSxPacdVQfvFvCRjQnJCueTW6cjO6NkETbpH8LaesT6VdB8C2tbiF12Tcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(4326008)(38100700002)(85182001)(82960400001)(66556008)(66946007)(8676002)(6916009)(33716001)(316002)(2906002)(86362001)(8936002)(5660300002)(26005)(6512007)(6506007)(54906003)(9686003)(186003)(6486002)(6666004)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUdQeDd3Zm5aMnI0QUs5OXJiQmhvd1Z0Tk5FWkQ0bElxKzQySVAwUmcrT3lk?=
 =?utf-8?B?WW9tOGQvZS9lRXpYZkJvMnNLVUZHSkdkeHE2bHFnVUtDM0tENmd3U0k1K2Nj?=
 =?utf-8?B?a3E5NklxdVY4eDM2K0hKLzU5KzJuZzRjQ0RoY3VLNmRkMEtUQTFiOUdTNHVN?=
 =?utf-8?B?cmpPdkZGLyt3T0JVeVhTYWhxOVJZSnRkNVFTOHhjTFdXN1ZkbGhiNkw3aFdH?=
 =?utf-8?B?RUdMK2RWZ1c3Y2F4ZzJJVHRtYlpkbHVkdDFpd3VlN3o2eTVsT0MyTWtTanpC?=
 =?utf-8?B?Nk4xVGlyU0lhZE5BelhTVHlramd5RW42MXQ0Ky93QlFScjRTZE5HemU4d0Z4?=
 =?utf-8?B?V0tRMWRFTXV6Y1FvZjFzcTdMTThxYkE5UGpENW5XMzlES21sY2J4YjFhREFE?=
 =?utf-8?B?WlR5d0V0STFPRXNvSnRSbnlMSmozMWJJYlBXOERiZFhYZWdqUTY0bmZUREVZ?=
 =?utf-8?B?TnY2OExBR3JYZjhsT1Y0WlJZcUVKL244ZkdUeUVDeXJxZXU0MFR3NFJXSUtk?=
 =?utf-8?B?WlBweXd2dHRRVndBWWNVQkYxVVdWYSt2bXRtRGpid0dGczJFbWhIc0IzWTIx?=
 =?utf-8?B?TlgwODNuL3FsNnovblRlRDBKZnNKcVY0bUxnTWk0QXBCamtIOE9udnNkQTIx?=
 =?utf-8?B?dTBoa3ByN3BUNFhHNENRNEVPbmlGekhlK3ZISTB4NVc5U1VTVVFHQXlPaTl5?=
 =?utf-8?B?bzByVDdJd1loVmJLZTl2bHRXTlgyUjJXVTBnUm04RzZUYWtET1NrV0JWYk1a?=
 =?utf-8?B?Y0pOcVNRb0ovY3lIY3pEdXJleWFJRnN3VTJjazVleXFoa2tKell5Mlh2MWVM?=
 =?utf-8?B?Z2JYYlpSWkRwbFZWOXFaY1p4RmJKaU1wVkhnUmtiK2FQUjVrNVpCeFRONDVO?=
 =?utf-8?B?anBvY0dISDlVNjU3bEx1NUJlOURNY2pReVQxQy94RUtITG05dGtMODYrOXZl?=
 =?utf-8?B?YTl0aWRGK3MxcWtxSTJDU3grQmg4d0dOMjhQV3RMRldCS0ZZRjRBamhhWTQ2?=
 =?utf-8?B?Zm9od3RLbjJhNEZWSVlTZy9pODBNSTBjSXpwQ0dkL1JtRnR4U2xhbmI0UDNy?=
 =?utf-8?B?N0VFaDQwSFAzcFZJNnVYRDh3MFBpVE1DMWQ4RGJtejhOemtXVWo3MFcySkFx?=
 =?utf-8?B?R1BEN2ZNcGtIQ3JpdHFrZEhqclprSUI3MExUM2FDN3FVYTFqYWp3b3EyUlhz?=
 =?utf-8?B?R29MNGhoV3ppamg1ZDJ5R2d6dDFRTHNla25XMkxObFRUOEZGVzZlUVhlTkg4?=
 =?utf-8?B?bUx6R29BNVhObFRlVTRqWE1YbUhlUWltZnJ6bzBnUk90bEY5WVNQNFRtV2JS?=
 =?utf-8?B?TTV5Nlplb3QvZ0xXQU5ZY1lGbkxITFdwK29IUXFmOHdRaXpPYkVFV3JTRFEy?=
 =?utf-8?B?K1p6THFvVlNheHl6NGtXOWV3Q3FiZlBZdzhRMzVWa1JmZUEvYkRWUjhpOCtY?=
 =?utf-8?B?dWU3VjZDdVd0OWlXcnpUaVBkb0xRckZwOHBYblp6WGFTc3BmTDZOSEFFOVMy?=
 =?utf-8?B?NWVQRUFRNVJYL1JRNWRNTlNGaDBKaFNvTVgvRWVPUnN4VlliTzJ2MElNMlZI?=
 =?utf-8?B?NnpGQ0NJeFErRS80ZlpwT2h3OVJJRjNMayt5Qk9Jc2FSWHR1R29ZYk1nUGEy?=
 =?utf-8?B?MHhwVDJ0RDEvblh5eEo4eFNaQldPY29SVmpVY1R5QjkrV3o0Z0lWd1gyLzU5?=
 =?utf-8?B?S3JpOHIwbkZhc3NRNHdETlNyWDE4L3pmekJLOGQ2WGRDb3dvV0ltbmVjUTN4?=
 =?utf-8?B?ZFJwVVZSNlYrZkJ2RmRESTJ4R29mdHNHUU9sNkJVVWNGWks1V2JVZDlGZHZW?=
 =?utf-8?B?SkdpZ0c4RTVBU2trWFZRTE1sSUo1Mk43dXhrN0hjaXdiUjBrVllpQzcxOTYw?=
 =?utf-8?B?Mjk1bjFUL1FaMW9XS2JMYVUvNVhKYlFxRGVKdWVXTjFweVpwS214dno2QjA5?=
 =?utf-8?B?Z1hWbGFHNWRQQUFNcXp3TFQvbFpOQ242R1JIQ3VORnFGeHBLVkpndENxTVFa?=
 =?utf-8?B?dmxFRlUreldnVkZtMEh6SFoyZW1MVlFVUkEzRU91d1VyVnBjdnFPMitaWHNZ?=
 =?utf-8?B?eHVseHNRcEJ3SjZ4VVAwdUdkUzVHRTZpc25ERU1nUzVpQXBuRVpqZHY1dHBx?=
 =?utf-8?B?ak1JUUFENk1vcWIwZG1GaXd2eGJOWCtHb3NZYkFlcjFRdDdsejVuU20wL1I4?=
 =?utf-8?B?anorTFNab2VFeEh2L1orcks4cTlOVEkrWjBXNEx3eVZFejV0bzEwN2xTNHJB?=
 =?utf-8?B?T2VqdXUvOFp4b1RJZlhCTGxoUU50dUNWaTZHanpsT2NZR0V4REZ2dlIvZjVj?=
 =?utf-8?B?MitEZjJQSER2c3Y4eENNQXhtcVlQUXRkTy95cEFBamVBQ042c1FmZHpiUUpG?=
 =?utf-8?Q?+PN9oSAAToZhPh4A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c431f414-8429-48c4-5ed7-08da2ced314f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:10:47.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATgurlksNKe7Cg6fXRyAFughhACARDZKMH/whyX7hp7kLuU6HiSqayIlYIr5u8i6Mqj8KVgzjEwa9JDubNcEcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3235

On Mon, Apr 25, 2022 at 10:30:33AM +0200, Jan Beulich wrote:
> Recent changes (likely 5fafa6cf529a ["AMD/IOMMU: have callers specify
> the target level for page table walks"]) have made Coverity notice a
> shift count in iommu_pde_from_dfn() which might in theory grow too
> large. While this isn't a problem in practice, address the concern
> nevertheless to not leave dangling breakage in case very large
> superpages would be enabled at some point.
> 
> Coverity ID: 1504264
> 
> While there also address a similar issue in set_iommu_ptes_present().
> It's not clear to me why Coverity hasn't spotted that one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v4: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -89,11 +89,11 @@ static unsigned int set_iommu_ptes_prese
>                                             bool iw, bool ir)
>  {
>      union amd_iommu_pte *table, *pde;
> -    unsigned int page_sz, flush_flags = 0;
> +    unsigned long page_sz = 1UL << (PTE_PER_TABLE_SHIFT * (pde_level - 1));

Seeing the discussion from Andrews reply, nr_pages might be more
appropriate while still quite short.

I'm not making my Rb conditional to that change though.

Thanks, Roger.

