Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F164954DFDE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 13:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350553.576935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nVU-00050U-5a; Thu, 16 Jun 2022 11:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350553.576935; Thu, 16 Jun 2022 11:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nVU-0004yk-1k; Thu, 16 Jun 2022 11:17:48 +0000
Received: by outflank-mailman (input) for mailman id 350553;
 Thu, 16 Jun 2022 11:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOxQ=WX=citrix.com=prvs=1593354c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o1nVS-0004ye-B1
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 11:17:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0da7b9-ed65-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 13:17:43 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 07:17:36 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5403.namprd03.prod.outlook.com (2603:10b6:806:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Thu, 16 Jun
 2022 11:17:34 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 11:17:34 +0000
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
X-Inumbo-ID: ef0da7b9-ed65-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655378263;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wu/9Co5rzH0ThpwvTIlsLkn3euBDv1tRxBq52rfnP2w=;
  b=L9pYc+wjed8qxhQ0EXtZkJI4r6GEoKcL6diKV5i9CpgtVKD622sK8VMC
   LTbIP58Oe+dx35JAk58c9xqy2y27B/MGxko32jRUeEYFWhfTJ723rCpuN
   Nm6HdqGmmpW6Dd1PoawNl68dV1SKuKzFDHy0pglsARlEYCIfJfqkjFZm3
   0=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 73597070
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+6FdD6N2j62yMtfvrR1VlsFynXyQoLVcMsEvi/4bfWQNrUolhjVSx
 jAcXmqHPq2OMDPwL410YIzi8U8H65GAx9BrQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Aw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 5JdmLi1bEASGrSQsfpecDNBORBQBPgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHP2iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33SSuLGUH8Dp5o4IquGrNkSV92YS0LeOWXOfaXOxLh3ix8
 zeuE2PRR0ty2Mak4SqE+3W9j+iJmSLTWYQOGbn+/flv6HWQy3ISDlsKVFK9ifi/lkO6HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQC1
 EKNnt7vLSxitvuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bpg3LZsZuFuiylNKdMTPtx
 XaMpSs3hbQWhOYK0bm2+RbMhDfEjpPJQwgk50POX2uj4St4YpKoY8qj7l2z0BpbBIOQT13Es
 H1ancGbtboKFcvUy3TLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCHCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:2v/R4KDhFzEd64blHeglsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4J6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ1yHtycegB2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB26ffueChPaHbzYfJt3SU7lmtrQ3Igfwt2MVdgh8KYS8a
 6xJW+w81RCNn7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,305,1647316800"; 
   d="scan'208";a="73597070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QM6z2T6JK6u+dRb8KSyjiUAYUoGKqnv9m6y7W/cy3YhhsPoLIch10OjKnrao7xP21ACK3YDW3ZQ9QdIOyxlu1SvYmGNPgwqjVK62jGghWOecdE5pE8QKAIM0CnbWi+1RYHcM4YJ75N3iTG8Ptg0yTLOUS4qwNLOvMsOek92yCYaJCCrl0RT3H/xo8fYfkzbZkABBdhgL/EYfkpAyhQxD/l2sVJeY8Or6Gh2gXzMRtXIpFYPzbIFLR7pFTM00Qe2fB+qIZBtUA6YhnqEpEUET2NxEV5i/2OpVDdTvhn78z7zZQx4vVoyKKbuL73xcSa2xpdv8UKOksZl+gjepwZ7UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jH1HBwAj15WT5WAef5LD5xjcQGRwUX4vRGD4OkaMjRs=;
 b=OIA3fvwrYXHDo2BGy8Fgre4c4nLXXQu3EkqLx7JvHB/yICAUYEMzPnuW0NMJUXPH24iq/D1T1fM/tSLOwxRl6L7gZ+dkbLPdhFnLQz03r5oytEFFEu38Cd2XbK/4sqy/WqoscR7XNe9bnsEdLvulOa1pxqK8ykXd8bdSw2TrLwr7HHKWNtPkO2MGlNYPGtTIn2tlmF0OVshyJr3nEn5oJtt96lxR2NB7O0IKPH4xwATUxHGlyjd0AvuK2NDO4+kIlKn22ilcEYFzMqYKMcGuG0SAFduM6XgU9Nvd8Y2CByQHL/GZnUxztUoJFUsg2DLK3U2nbmscWFaEIIZWTS105w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH1HBwAj15WT5WAef5LD5xjcQGRwUX4vRGD4OkaMjRs=;
 b=rCAqm09DUYfRxnmKckhn+vQ6RpKdHsY6fpTH92v6zApwah9Mktf7a/y3I9BswEuSWSOHqUQPvgdeA2VupwDju4kJ5e68MRLoh+YpWMNpnxpuP9sybCAdjaOAC3V16srtH4YjDFNsMe+CYvJT/Wz8fhrU6frjJzg4k7FPUsiJedw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Jun 2022 13:17:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"Qiang, Chenyi" <chenyi.qiang@intel.com>
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Message-ID: <YqsRS8jRvAL2przG@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <BN9PR11MB5276B16CB69514120B7E0E318CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <4f2c4d5b-dab8-c9d2-f4c2-b8cd44011630@intel.com>
 <YqHGzuJ+D0WjaW+6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqHGzuJ+D0WjaW+6@Air-de-Roger>
X-ClientProxiedBy: LO2P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3a7ad0f-3150-4bca-a5df-08da4f89cfed
X-MS-TrafficTypeDiagnostic: SA0PR03MB5403:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB5403FB694133A9CC4E5B2BAA8FAC9@SA0PR03MB5403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dM9SdDcez3BoDmT1oijBaqfraduH/ongkLtpbFZ/u6ccQ7p9hJH8G2Dsvez1ZD5WW0aBm2jXYou220jBXqKqcMW9mj8Ie9Gruo6vkja8Zrjtoz/qBr5zkZ54P2W7q19dIgzTwFHewX9T3urdk0tHFxBI3YAGJ52UHMEEc+PkG+9aCwqSouF0zbF1G9WrGyPG8NJZ0nvEtgOCtwIKst0ILKyafz9HbKEHRjh/LmvaoMYoFxAtEoN6xe9ne72EjmkHc7JkjTlP2Alkg6hLJMv/WtgtlmfqzyifnP8sTMv6lGlB7zrm8Lz8qOio43lrfTeN6vOlPXj5+YjTSN6tmw2comqlkQcJBe3lAdU9zJp+6znR2sCoF9DRPHvx87LB0j2yxah40h+WctzwpSwKo0GfVS3tNMT4j5vF0BaOEtsoHcpJaDCy6zvuqnG2Abx+CAg52BS8FywMa4LgZObNMluIPY2XR10jguYul/uhH82mTSmkeEIq+Y0fCqZTaNtKgdK9Skdhzp7v40pWbzy+MWMvZomljssjw8MBgn+qU6TQovNdAHmGw69D4UzprwChTcDksm47E/r5g+zCSCf5+AMXYnXFco5zalBuWOwOZULmpguaTLS21i/s7cHvcsfo8BXa1OwIi2uk9mlkpmUKsgZ9hA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(508600001)(5660300002)(316002)(6666004)(186003)(38100700002)(33716001)(8936002)(85182001)(83380400001)(2906002)(6506007)(53546011)(6512007)(4326008)(66556008)(8676002)(66946007)(82960400001)(6916009)(66476007)(86362001)(9686003)(26005)(54906003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU9vdldPY2VtUVZIUllHeWl2Rm0reU03SngzZ0hRc0FSclJoTS85ZlMvK1h1?=
 =?utf-8?B?UWQ0TjJ0TmQvank0TDQ3YWF2T1pwWmV1Wmk5dVREVVVSWjNpRmVZMWpGQlRm?=
 =?utf-8?B?NDRYcTdNVStjNmFxTEVzK3o1RHJ4ZTRVVks5NEdVenRDZnRaMjFmNG9FbVhE?=
 =?utf-8?B?ZVNNN0EzV3EvREF6Wi9kbjB1M0ZKMzVUQm1QeVZpeVp4MFE4UGVKVEVFMWtJ?=
 =?utf-8?B?Y3JaL0lVYXcwOXJweGs0NUdNeitudmlJb0tlZ0VkMzBZczl3NXRoOFprTUNa?=
 =?utf-8?B?S1l3b00xSEZQMGlXcHZidURWNERJNGZOTE9kU2FRQzRTQlpDdUQ1NnRiSmFS?=
 =?utf-8?B?d3dhd3NyWUdMMEpyNkVjWEVWcHhIV3hBRnBrc0Y4SnVmdytXQXhVb2tMS2dS?=
 =?utf-8?B?bVd4VjlxcndMQ1lNQUNjdGNqVFpqVCtzUkVib0VJUDF2MFRHbjB0Z3hIcVov?=
 =?utf-8?B?WUxvOUsyY0hMeFpJR00vNVdNL21hcVBPTXNLaTcwc3dCNjlKVStoOXkveHd1?=
 =?utf-8?B?MDR2ZUtxZjIxdWpIQ3ZONERONm13OXJ2QU1NOVFqQTV0bkxsdDBwNEtPTjFF?=
 =?utf-8?B?UndzcTRUNHhYUjVHNjQwWGptV1NpczVWRXFyeUNZSWhVY3dvdkY5REZQOGg2?=
 =?utf-8?B?V1JwR2tmL0h6V0YyY29SLzA1QWpnZTJ2TnRUTnIreHg3SllqbkVZaUtXTTFB?=
 =?utf-8?B?MTlqNmIyYVJ6Z1JkbU1XVDFJZ2d4RnY1R2lEUVhURWV1MTdGT2laMG91bkRK?=
 =?utf-8?B?MmFHY3QvTnhDUzBqL3o4NVYrTkN6QVM0UUxXQkZnWnREeFZzb1cxSEg2eGU1?=
 =?utf-8?B?VFZuT0dxc1E2T05LMVFrSmtIRWdKZkhGSjBuRzMyVTlzTTlGaERBdU5ScW1x?=
 =?utf-8?B?TUd6cWVjTWp2SmFEc0d0OTRlb1VqQkhWUXZ1TFVLaHF1S3ZzM0NSQnovYUs1?=
 =?utf-8?B?SEtjOG9teVIrd25OOU15dzI3WTI1SlhDVWNLeEU2bFJmQzFtd1ZkaE92RUU0?=
 =?utf-8?B?NytXdG9IVDZyTDlkeWRGbjdIcTJHYTY4NGxFTXpGZXNPc1gwK3h4Q1NZbHF1?=
 =?utf-8?B?eUpDUE9KVUs4YUhXSDB5Q0hvdjdNT2RVYmtMekRSNnQrRWxSelpLUG1JOFZL?=
 =?utf-8?B?V3htVnZEdWhTZnVQWXVKczBCYlNxWjFSQTYxY2IyQlk0Z3psdHhLczJObTZI?=
 =?utf-8?B?b1F2Y3FTdnM2MkZGNmFsMVJlZFhFT0J5QWdCZ2ttNndUc3dmTktiSUlRME1o?=
 =?utf-8?B?Q2pnaDdKOWhhcStFV0htTEE2WUdQTzRtdHJnMjlIZ2xIcXNWRkJQN0w3b1Q3?=
 =?utf-8?B?akxXUnEwVlQ5NXN3L3dYMk1sQXZ3bmhhM0c5SWVLRHVZZElUazErbTdMckVo?=
 =?utf-8?B?eU9QYXVhOHlXV29hNUU2U1orZnNtQVFrb3JFN0NxVUFyaWhSbHd2dXNKZmhz?=
 =?utf-8?B?cDBMNUUyME5odUU3OEgza0VvYmZUbTU4MFJhakhSMWdOSHRIRzVXV1J2d1RW?=
 =?utf-8?B?bzN1cHRxdHJXbmR4dm02NTNaRGpHTHgzM2ZBZVlkK0ZiWTJ1aUZ5MHcrSEk5?=
 =?utf-8?B?V25TUWVic0QyYUkyUUlHL3dlMlF2WWd3WHN1Z0t2eitDWk5UQ0cvck00RVVi?=
 =?utf-8?B?aWpoVTZqRkwxSjI3M1FKejVJd0duTVBCdlpPdUt2U0lDQ0pFdWlYMVJYLzBB?=
 =?utf-8?B?eGl6MXVpZWlKUGcvYTVKRVJZeE0ySmptanFHVE9COVZwdU9FV0hlT2tRZ0pT?=
 =?utf-8?B?RFdzYXdvclllaDU2TlhNTnJEVnJyTTluVVRjbkx4K3dqUEhnTDF2K3ZIeEZQ?=
 =?utf-8?B?VmliZ2d6b3dNOHRPVDduak1jUWlnWkYwU01taStVKzVTS285SllpUU9aQ0M5?=
 =?utf-8?B?MUpjTUIyaGxqb3Z6RExQdXFQdDN1YnQ5aDdEelFnZnlQdElyYjVFelB2Wlda?=
 =?utf-8?B?bDlLMEt2dVpQS1JpY282OGd0ZTNXekhHWVF1WDd4Lzk2V1ZJakF6eUFER2xY?=
 =?utf-8?B?Q3YwYjRNTUJkY2ZiT2FOQ3pCTmFTVVMzSjFSaDR5anlVL1JZZms5eFp1MTYw?=
 =?utf-8?B?YXYxNUwrUVZSWHh5Vmg4YUhxcFJwUWdKbDBENDB1NE9aS1JkNDFQWmJDZFdY?=
 =?utf-8?B?S2RWT2xDVnRYbkxCZURzbUV0NjZrZWxtc1d1Q0svcnJ1Q2d2VEU5aElHVVYx?=
 =?utf-8?B?UFFQQ3FvR2Y4UUVPZUNoQXVCTUp3eTRGdHlkMTZ3MDF0QWgzYWZmRDEyajFz?=
 =?utf-8?B?emgzaDU3V2x0UzZBNUtuWG9YaEhxMTN0Z3IxVDY5U05yS003NEhuV01YaDQy?=
 =?utf-8?B?bEI4RW9DVlhWMWhXOG5hNTdnL014a3F4UCtwSWNZQU1UaDZFcHJ3Q3ZtT1g5?=
 =?utf-8?Q?nJB+8kSvMVq0Nnhk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a7ad0f-3150-4bca-a5df-08da4f89cfed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 11:17:34.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6gaLU6Eedf6xwiPtVRmF1ubojtm2tV76kTWbtwAppxCHyvmSvRS3dUrGMxo7z9rtSzou4DFLgBZK/TMJB3prQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5403

Ping?

On Thu, Jun 09, 2022 at 12:09:18PM +0200, Roger Pau Monné wrote:
> On Thu, Jun 09, 2022 at 03:39:33PM +0800, Xiaoyao Li wrote:
> > On 6/9/2022 3:04 PM, Tian, Kevin wrote:
> > > +Chenyi/Xiaoyao who worked on the KVM support. Presumably
> > > similar opens have been discussed in KVM hence they have the
> > > right background to comment here.
> > > 
> > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > Sent: Thursday, May 26, 2022 7:12 PM
> > > > 
> > > > Under certain conditions guests can get the CPU stuck in an unbounded
> > > > loop without the possibility of an interrupt window to occur on
> > > > instruction boundary.  This was the case with the scenarios described
> > > > in XSA-156.
> > > > 
> > > > Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
> > > > if no interrupt window occurs for a specified amount of time.  Note
> > > > that using the Notify VM Exit avoids having to trap #AC and #DB
> > > > exceptions, as Xen is guaranteed to get a VM Exit even if the guest
> > > > puts the CPU in a loop without an interrupt window, as such disable
> > > > the intercepts if the feature is available and enabled.
> > > > 
> > > > Setting the notify VM exit window to 0 is safe because there's a
> > > > threshold added by the hardware in order to have a sane window value.
> > > > 
> > > > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > > Changes since v1:
> > > >   - Properly update debug state when using notify VM exit.
> > > >   - Reword commit message.
> > > > ---
> > > > This change enables the notify VM exit by default, KVM however doesn't
> > > > seem to enable it by default, and there's the following note in the
> > > > commit message:
> > > > 
> > > > "- There's a possibility, however small, that a notify VM exit happens
> > > >     with VM_CONTEXT_INVALID set in exit qualification. In this case, the
> > > >     vcpu can no longer run. To avoid killing a well-behaved guest, set
> > > >     notify window as -1 to disable this feature by default."
> > > > 
> > > > It's not obviously clear to me whether the comment was meant to be:
> > > > "There's a possibility, however small, that a notify VM exit _wrongly_
> > > > happens with VM_CONTEXT_INVALID".
> > > > 
> > > > It's also not clear whether such wrong hardware behavior only affects
> > > > a specific set of hardware,
> > 
> > I'm not sure what you mean for a specific set of hardware.
> > 
> > We make it default off in KVM just in case that future silicon wrongly sets
> > VM_CONTEXT_INVALID bit. Becuase we make the policy that VM cannot continue
> > running in that case.
> > 
> > For the worst case, if some future silicon happens to have this kind silly
> > bug, then the existing product kernel all suffer the possibility that their
> > VM being killed due to the feature is default on.
> 
> That's IMO a weird policy.  If there's such behavior in any hardware
> platform I would assume Intel would issue an errata, and then we would
> just avoid using the feature on affected hardware (like we do with
> other hardware features when they have erratas).
> 
> If we applied the same logic to all new Intel features we won't use
> any of them.  At least in Xen there are already combinations of vmexit
> conditions that will lead to the guest being killed.
> 
> > > > in a way that we could avoid enabling
> > > > notify VM exit there.
> > > > 
> > > > There's a discussion in one of the Linux patches that 128K might be
> > > > the safer value in order to prevent false positives, but I have no
> > > > formal confirmation about this.  Maybe our Intel maintainers can
> > > > provide some more feedback on a suitable notify VM exit window
> > > > value.
> > 
> > The 128k is the internal threshold for SPR silicon. The internal threshold
> > is tuned by Intel for each silicon, to make sure it's big enough to avoid
> > false positive even when user set vmcs.notify_window to 0.
> > 
> > However, it varies for different processor generations.
> > 
> > What is the suitable value is hard to say, it depends on how soon does VMM
> > want to intercept the VM. Anyway, Intel ensures that even value 0 is safe.
> 
> Ideally we need a fixed default value that's guaranteed to work on all
> possible hardware that supports the feature, or alternatively a way to
> calculate a sane default window based on the hardware platform.
> 
> Could we get some wording added to the ISE regarding 0 being a
> suitable default value to use because hardware will add a threshold
> internally to make the value safe?
> 
> Thanks, Roger.
> 

