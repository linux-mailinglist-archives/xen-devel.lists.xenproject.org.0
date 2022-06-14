Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C854A9CF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 08:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348581.574803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o10Q1-0003do-FN; Tue, 14 Jun 2022 06:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348581.574803; Tue, 14 Jun 2022 06:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o10Q1-0003bP-CR; Tue, 14 Jun 2022 06:52:53 +0000
Received: by outflank-mailman (input) for mailman id 348581;
 Tue, 14 Jun 2022 06:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1me=WV=citrix.com=prvs=1570496fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o10Pz-0003bJ-WF
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 06:52:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 998cad5c-ebae-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 08:52:50 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2022 02:52:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA1PR03MB6484.namprd03.prod.outlook.com (2603:10b6:806:1c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 06:52:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:52:44 +0000
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
X-Inumbo-ID: 998cad5c-ebae-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655189570;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=99rwY7P/BOwRjRx1dI22FroEI9lY+3IeTpziGVT1+ho=;
  b=iINrzshOhXkw0YK4Un91ycI+fs4GoMXGqbVCI/g1GTWljUd0Md1UvFb7
   z6UcO4tvCk7MhF0jcxtsz0YKqmPC1qKaBf7AsPlJXAur/orgWfAg3bPyD
   FK1lKvzGc3AlGRrL59duR33G+aOCS8VbDluHwJqNQqls4F+ofpZoUgysB
   I=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 73530969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hmI92K5U+1ZBK6dzAoxcEAxRtCTGchMFZxGqfqrLsTDasY5as4F+v
 mIZCzqAPqmDZjamfIxzaISy/UkPvJXVmN42SVBqpS5jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YbgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTvYjYOGpTnpd4kWjxgLDtyYPFiw+TudC3XXcy7lyUqclPK6tA3VQQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiVo4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2ID9QnN9PRmi4TV5DMrzJH0HufPRvChfO4LlWnD+
 V7r1k2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77m4ODBwbU3OrrP//jVSxM/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jYDX/JAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3rKdrDf3NS1LK2YHPHYAVVFcvYmlp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:oeWyRa9jHCbd6q+5UmJuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,299,1647316800"; 
   d="scan'208";a="73530969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK70YvNml8eu4djKKfuzLLrHQra1dTjH5tjcjGm1AOagXpNHtR/nJDE4YBgX3qNHEMRqdFFADxuxuDmJO6iF39XGtvIKWpQ9cAGcWBxog3LJlOVriYcMrn/fBJ9lFR8sNK2qKkThGlRjqDmz+STds1aaNoZCncN9/mpYSTL/amcVJhqSkHinkAeVuHHLyUL4uAMTty+WFToUPyeQbvtdPDBHMX4F8PuWPa/jLJ+fVzMAq+lYSedV2Rm/AKmAIFk/DjgOoovvunsKXwSF0+hSPsZ5ucDdj7BL46rPTni91E/zEPW1utlbXEx+tm86SR3Zt+mCYeETOyjLANbEOo4nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6/zceBK2aOiZs2VKBxjvIiclJwdvrigCbkhfSLPj0I=;
 b=cSniaMzZ/7EELz79AJx3aaPcGmc+excu6dWRCgcNS0Y0EedmtPeBjrLbFR7f3LATIr1e+mVThgfgzRS9nvZW5eSeJqrbgyaQX980a+nMffHXUrQe6Mv1WQxH1xLJDopBkNHrnHrJgqBAmEY4VBQ2l6KScaiZUK5AAJOe9wZo+L/6k7YTmfoC5y7Vrg66W/Zt064REp+TcVdbjXgMPvCIVmH33S4o4rPJfjXc87r0fXRm6BrCsuKrW6BmolTcVQaGkSfmw84l4KQp9hgQNsCWjoIZRZRNZwRVQPG9kwwoZ3at4ETPM+H4rKQ4ddv82yXlaR/dxGsnruOSdeHiBRRvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6/zceBK2aOiZs2VKBxjvIiclJwdvrigCbkhfSLPj0I=;
 b=FHfSKfuTT3A0RMVPuod9GeApzv24zhevWGS8MseIXi8c/NMbKHQgqTe1HGS1CVQOiRwLq9HRz22J6FSaKyuMeAgskm8A1a9cDwVzngQbXUIYCA1uIdi3fmmInMRz88RYgSX+coBTc0mc8+6Gjdmu9VK4wy1E4s4h23foi8AYvfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Jun 2022 08:52:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqgwNu3QSpPcZjnU@Air-de-Roger>
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
X-ClientProxiedBy: MR2P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02088108-9050-4026-c091-08da4dd27bd2
X-MS-TrafficTypeDiagnostic: SA1PR03MB6484:EE_
X-Microsoft-Antispam-PRVS:
	<SA1PR03MB6484520C135719A5A870A8D28FAA9@SA1PR03MB6484.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i06CeeW3P3G8Nz7PFnoFTcNr/8IJQZ2EgljO/qOhMGxcJqwNF1Ew9oJfQIvBLIaKVtCTIUE1K/irAUjfbqmDTYyHv+aETXI2VKS/5XQG0aY1PRjh5k0tjdiLV7px117Ts6i2TgJXL6yuYRF+qA98Sl7qsdNvoClmPUPi+fJ+RvHpqkvtc9SoEkciAkHO+u1bFeRN9jsv3EjHcGEbYacWcZcalGQ6IF6L0LMVX0aIJm47POs8xZ/sdOpvXJ91z6BK/guL6+qKpXADG/gSUi9lUJKQIBHouogM5IuD28E0aTM/x3gUHMFB32BObjaoSzZk3Vxs0Rn+LMtDs069FWScgja4c08l9QG29pdU4dkeJvw5ZYx+kXN4HUZuKI+DqzQg8AfxOCtU0I9Qq0OC2Q5YoDtK83lTkc7UmM0C3MWdkHMTX1s2wQpWuPPLjTBQcnzXo26Hi07+EsxbRr8gEZYfROeOzQdBPBh6bv9QUOEgVJnzhiKnRM+eHu3K9DU30ePeVSZXXvQTb7dtgJJAIaWV43986iiNqrjymj/5mPvXC13GLeI3/CShLh3CrKMBDTRcYPLUWggtVCSVQ7gpHfplT33vyaTl85MyHuvv6MEN2FOebuwzOOQVOWz5xZkK2yEezvRADlk9JVuD+IqamNE2vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(38100700002)(83380400001)(8936002)(9686003)(6506007)(8676002)(54906003)(6916009)(33716001)(2906002)(316002)(85182001)(82960400001)(6512007)(26005)(66476007)(5660300002)(66556008)(186003)(53546011)(66946007)(6666004)(86362001)(6486002)(4326008)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1Dd1JUZVFvRUdySFg3VUNEYTUveis5dkhMSldtOWQ1Y0RVdFR5c3V3TldY?=
 =?utf-8?B?b3R3cTdSWS91dm9CVFBkQ2ZTUW5Yd3ZHeTVOa1lKcEdpdTBNTzU5YnVSeTM4?=
 =?utf-8?B?WG1ob21KaG5PZjE5T3RiQWVOTmlxT0NuWHZsK3pZdElNcHR4ZTUydyt6STBJ?=
 =?utf-8?B?QzZPZ2JpRmgyWGkwd2NQRUNxNnZKL0R5empBQ1dwdGpWdFVFWlNPVit6MzZX?=
 =?utf-8?B?dFhVTkxzWUJ5b20zRXJGdGtJbTdMQ1dlSVFLSUxvdGovd3g3VlA4SWNCZXQw?=
 =?utf-8?B?bEJqckhRN3JXNlNGT0R2ZFZWeGpmUEtrSEFhTitESFlsRjdKQy9BU2xVeFhm?=
 =?utf-8?B?K0VyMVVTM2JTN1Vjdms0OEpUb0EwdTMzT0xJOW5qYWVMUUhxNzExZ1A4d2Ja?=
 =?utf-8?B?bUFLbE0zcUg1RmFLWC92c3Q1UWgzalh1dkZmQmFONzFaOUtLTSt5emdBWHd0?=
 =?utf-8?B?aVhvZ1hoSCtQWHdVa1Q5U09LTThjdUZqWm5LdkJCQkcrQTRkdWhGejNRRjAy?=
 =?utf-8?B?Tmo5Y3FXck5CWnQrVk1WODRDTDR5Q1g3QVFmeENyaWtscXA0OU1yQ0RIL2ta?=
 =?utf-8?B?cUJnQ0ZtQjNmQmtwR0dwMTFaeUEwdndjUVc3TG9kSW1ma2VoeGFCVVRvekRs?=
 =?utf-8?B?WWhtT1ltK1BmbCszeVpVMFlNNFVya3dqdW0vSHB5VWNRcHNWbHRCY3ZjODBO?=
 =?utf-8?B?aFNTZnA2WVUxbFBQUXRUMHFBTUlyaHdFSWlOdzlIV1BaSldqdUlUL1IwYy9W?=
 =?utf-8?B?bzhmQWxKb0tOQzVIckNLOG9RN2wzdHJ6OEVYQXhaVC9KcFJzQy9ZempuN3VK?=
 =?utf-8?B?ZVIwK1VaQjJEdG1lUEd0U2hsNmt3b21aVEVqZlFYN2NyUklwbzlYOU1xd0VH?=
 =?utf-8?B?L1FRUVFrQTNxTkZWZk1MeG13dWFSWVg2OUhPSmo4K2NUT3QxRkNtQXMrdEVI?=
 =?utf-8?B?djl5SU4xek83WE1ZVkhPNVZ2MU9mN1NZVHB5S0JsQnl6RnpzSkYvUnQ2Q1VP?=
 =?utf-8?B?U05tL1kyOHptSS9IVnhCbGplSlBPNjkyc1pDdDdYbkFuQUdERjAwSHJMeEZ2?=
 =?utf-8?B?OVZOMHYrSmQ4d2xuam1DVWJMVnVwVzRTdWZwckhvUzBIU0ZlTnhJZG1KbW13?=
 =?utf-8?B?U3hmZzNCbnNKblBwWVFhc29GODFMOHdBcWp3Yjd6UjlNMHJFSnNEbGJ6UGRH?=
 =?utf-8?B?ZzE1R2lxL1JPOHhMa0R6RThHS2g1Rmd5SlkvZTFFenhqSlhoQnNGZXlOWlpO?=
 =?utf-8?B?Um9idkxHOGhJbjhURjZmZWxZSDlZMDhvc2FEWDlpQXg1Z3ZOK1BVUE51bzBO?=
 =?utf-8?B?Q0I3WUdPNmx4bGQvOHg1MnJCeCtSWnNjSWRkeWkrR2tOdzhNZ3M2ZGIrZGVN?=
 =?utf-8?B?TTJ6c1JlY29kT29oQmdqNE9kYnUwWTA4QktXQlVVM0FMbEtqb0dWbFNYeTZD?=
 =?utf-8?B?dFJQTFNoaGs5elcwdmJwOGUwNjErNkJXOWNETWtLNnJVRVpZM2hnSlVlUmxa?=
 =?utf-8?B?UWhZbkFmaWNXZHdBNlFlVHJoYm9lckJtdDI5VlFZVWJuWG5pekpmU0JGcFFt?=
 =?utf-8?B?VUJ6Kyt3UjdUQlJDQlhkVXpheThEaTJqNktnVGFXK2ZyV3ZqOUEvbVNWaWtn?=
 =?utf-8?B?NXBCV0RYRVU1RlBFYzVrRGxmUFdqdmtPUWpUSUhMQnRWblRLNWVTQkFtaFJ6?=
 =?utf-8?B?QTlQMlVmMW5XM2xuY0VWdGdHcDZUZVB1L0h3eFM5aDRLaE9sOVJIYU1HdE9E?=
 =?utf-8?B?SG9BSm92REZtekFOZGJURmRDNlNPUDRQU0tLSWdDSEpQMXhra0NCNWtYZ0VI?=
 =?utf-8?B?Wnc2Y2t4eGhWeUFmcE1yb2wySlhSdkJ4UExDUWlkMEtaOHF5dUNOOEtGNjlY?=
 =?utf-8?B?Q1ZWcFIzZC9EeFpmcXlnSTFpMWcrWXpUdlJTRmVWclN3Vi8xcFNqVEdPK1FF?=
 =?utf-8?B?K3FXYk9IdnZkTmxEOHlqZi8xUTZWOWlyNHlmakhSaHZnWGJnYVNOdFVZSVVI?=
 =?utf-8?B?RUNNMmFzSnlBRlV5ZUNYTU1RN2x4bnRYUkttaGhWaTZ0cEEzVXJheHljZ1Jm?=
 =?utf-8?B?KzJxdndaajEyRWl3SkVpNWUvdjNCWTdvVUJNMmhnb1hCRU44S2ptMnY3Nk5j?=
 =?utf-8?B?VDNKcy9HR3FUOHNaOXFuZFVCVWF2M2NENnpVdEZYL3JpakVyQm96czBNNW4w?=
 =?utf-8?B?cDR2elVTcWRKajh2b283aTYyOHl1SHJFS2hWSWhab1QvbC83eXNBVHdpbFN6?=
 =?utf-8?B?dkVhTUhWTC9pbHlEN3JVS250YW50MkRyMEZvUVV5aEZrTTRhMmhwYkRJNmQ4?=
 =?utf-8?B?NUxEN0xnSGUrVmpxQS9FSEJER1V3NnFXV0ZlU2JjOHIxNjV0Snpsdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02088108-9050-4026-c091-08da4dd27bd2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:52:44.3476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcNN94ob2YX1yGiaHZ+iOqR2bKcFxiw8ZRqf1N5eDgzPYWELDwpUorVeydPz31xKfK7MdLpER99OWJnle33S+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6484

On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> On 13.06.2022 14:32, Roger Pau Monné wrote:
> > On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>> likely important to have all the output if the boot fails without
> >>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>> other guests).
> >>>>>>>
> >>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>
> >>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>> Dom0's kernel messages?
> >>>>>
> >>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>> this request is something that come up internally.
> >>>>>
> >>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>> triggered) output shouldn't be rate limited either.
> >>>>
> >>>> Which would raise the question of why we have log levels for non-guest
> >>>> messages.
> >>>
> >>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>> levels and rate limiting.  If I set log level to WARNING I would
> >>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>> above.  It's still useful to have log levels for non-guest messages,
> >>> since user might want to filter out DEBUG non-guest messages for
> >>> example.
> >>
> >> It was me who was confused, because of the two log-everything variants
> >> we have (console and serial). You're right that your change is unrelated
> >> to log levels. However, when there are e.g. many warnings or when an
> >> admin has lowered the log level, what you (would) do is effectively
> >> force sync_console mode transiently (for a subset of messages, but
> >> that's secondary, especially because the "forced" output would still
> >> be waiting for earlier output to make it out).
> > 
> > Right, it would have to wait for any previous output on the buffer to
> > go out first.  In any case we can guarantee that no more output will
> > be added to the buffer while Xen waits for it to be flushed.
> > 
> > So for the hardware domain it might make sense to wait for the TX
> > buffers to be half empty (the current tx_quench logic) by preempting
> > the hypercall.  That however could cause issues if guests manage to
> > keep filling the buffer while the hardware domain is being preempted.
> > 
> > Alternatively we could always reserve half of the buffer for the
> > hardware domain, and allow it to be preempted while waiting for space
> > (since it's guaranteed non hardware domains won't be able to steal the
> > allocation from the hardware domain).
> 
> Getting complicated it seems. I have to admit that I wonder whether we
> wouldn't be better off leaving the current logic as is.

Another possible solution (more like a band aid) is to increase the
buffer size from 4 pages to 8 or 16.  That would likely allow to cope
fine with the high throughput of boot messages.

Thanks, Roger.

