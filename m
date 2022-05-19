Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517C52D660
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333063.556845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhPJ-0007oS-96; Thu, 19 May 2022 14:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333063.556845; Thu, 19 May 2022 14:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhPJ-0007mH-5g; Thu, 19 May 2022 14:45:41 +0000
Received: by outflank-mailman (input) for mailman id 333063;
 Thu, 19 May 2022 14:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDN/=V3=citrix.com=prvs=13146dc80=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrhPH-0007mB-NB
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:45:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57962362-d782-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 16:45:37 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2022 10:45:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO2PR03MB2326.namprd03.prod.outlook.com (2603:10b6:102:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Thu, 19 May
 2022 14:45:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 14:45:25 +0000
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
X-Inumbo-ID: 57962362-d782-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652971537;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2BRMicQzuF5aLdNlVH9RaEGorNx4Fir7qDpArhAAu5o=;
  b=bcpuzRAXa0Ev8nN1/qHQqsgZj6NhlacjZef+6rZGS6nh8+MKwVP4u+D1
   g7kvXdqymflpGkicnAMkVo1VqUI3jOQ679e6eaXJJedDzk3iPTBZm8swu
   HQduOoRYDQWamyBUWVqL0Nv5RKgqaDsUu6wx5ptoPlWB94G/WfsWEAhPv
   g=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 74215243
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UjEmo6vs/KTZIZeGoqKTczXQkefnVJRfMUV32f8akzHdYApBsoF/q
 tZmKWuPPfrbazT0f9oib4yyp0pUupbUndZmQQM5qyFmFCNG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8kH4TQuNY8FCB1AhlcF6dU2oXqYmeW5Jn7I03uKxMAwt1IJWRvZcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5o3aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3J//NquTSIpOB3+KPSNcOEe/6befRMoRigl
 mvbrifBJzhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU3313rWJq3W0MCscL24HbAcFSxcI55/op4RbphHCUNdlVrK0h9vdGDfsz
 jTMpy8774j/luYO3qS/uFzC3TSlo8GRShZvv12MGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWB6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:9ePEga3/vvU2orl/IHn6dAqjBTtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMUj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu15Dq
 r/Q+BVfYp1P74rhJJGdZk8qPSMexzwqDL3QRSvyAfcZeg600ykke+E3JwFoMeXRbcv8Lwe3L
 z8bXIwjx9GR6upM7zC4KF2
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="74215243"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV5dUxXncp2NVJjImYUCgoEy3nnRCPmphzBTq/5ITD/GpAK1tZaNFEGf51azZ77NYdB6lsvgV5XUj1T46IsEMxszoHC76C8fYg39D/U7+FXdLCJ6jBz9Y/oBKseA10t8W8FJAcrsNN/2C23a0fDTVMcl3uBefoZBIIrgWs4EA3mh2jm9DKy9qUu6EYJCgYOQ90Jf8Ii14PjVCw4cJuBAoVbZMmUbHAwHJ/S/G48g19KsyrwgefGjrlpX7r8wZ6yLDTwpPdaV89rwJuDWYEq8EfbNj+Ewj2x89PjvJQMFx1NeMmbkeugPKqtykLmgZyYHIGu1bJtm2MXgW9mClneD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ESu5xGfl/aC4U/R27cvs98qrOCW91AnVEnn7djkdbc=;
 b=jNhKTuUce1EL8BYl2mreooNeu1lMGzScIBacDg5e0rcFp8qwETRQcMSZ7nc8Ly6dKf3Zmo9pyhUNEHWJNeXg+UOIKS9FBavtlXkFc/8tFNGl0GTe3Iwsxp0jNazPPYdYkO5HJuzr0F+ukEY1+0OJOujSKfMBN1keuLKO7qCazjStKBRhk6hVa1w3Fznb9fd5zszWfZJEEfNSqF1Wk3GfuXeAFmyj4+6hvWqJ9PMNqJvNK92aM8aSCGBi3209ZyXrLkL8ceQXq2n/8AcGmpMCsEjMQDp5q0zWTc7Et87sNZ7o+QuCgAsL335RNdWS/Ek4xCHrMVyZ7hbKg4cucwsF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ESu5xGfl/aC4U/R27cvs98qrOCW91AnVEnn7djkdbc=;
 b=PURyxy7cpwAYZIyKFNlNFl4OMv0Itv6qOD4kMRTgvRrCjNSg+P95STj/zxpYNTS8ykJ2G4h01uWRGDx6mImzuajjfti1iSZqiyu1Ec4V/aUbb3o/XlJPmYkj9idl2Ry3JR79lpiWGPfxeZSGndR3cs1bvxTsHmhDjrukb2hS7SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 May 2022 16:45:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Message-ID: <YoZYAAG5YbHMyxMx@Air-de-Roger>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4d0d2c8-3a7d-4f77-6e4d-08da39a635a6
X-MS-TrafficTypeDiagnostic: CO2PR03MB2326:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CO2PR03MB23260591B505F095AED169E48FD09@CO2PR03MB2326.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0kVkz0/OmPRwhxzomB8fLq3rxeGWyBy43stE4lGSfmc8dLah3RJT3EuJR7joTnyuEkoHxVuw+ZaPURAT7bC7CSawU1eHkG89riKquH1Y+OT8qoDcGWwOTIZOzlkr0HSFPyzf3gpQJMCZ2ZT2yLS+jE5TYVhVl9RKXRcOvFArv5bXFWloT4/IyuGThdaaCeq5atOq/RO7st4Y1ICtRHjuigpLQrkM2U2f2bmQJ5mQm0TcQHwe5vTGdWzrCY01ip/oeIhGgeFVNgbxiIN1GRqQHkmrHOnKARnt39PuQkAElEuZ1g7ItXwwOy8JaaVyJxP3eVnTy5rermbujQwq/rAH7O+yKjMjF/VlT7wY47zYkPao1jFUwG2rQzhX1q6Gp7Gc8Yv2zjQxbqxHT94K87C130G/La1DKf+L5Cel1nSyBtHhsBpm/m1chNPdMutw1tBpbaFo+LN9ltRN65TBI3/S/VJ1zEzEUg8N+ABFLJekkVrMWIO6bPAkTmoU2aOmjqDBxb0BBEXYlTAU9Rfb6mfw36nXkkG2wf80Ab9ZxCXeA1lbnEhFf4STn+v1M5YYhnyODucC/ifoLUv3bY0n3kQQhHPqKXVb78VsOK/o8HmE0figs5myMZx824j60w1zBGpXUbVLAI085NBY8n504wXgig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(6636002)(33716001)(83380400001)(53546011)(2906002)(186003)(66556008)(6512007)(9686003)(26005)(8676002)(6486002)(5660300002)(86362001)(66946007)(508600001)(82960400001)(4326008)(66476007)(38100700002)(6506007)(85182001)(54906003)(6862004)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3FnOHBxRmFhQmM0VHQwK0I4NlZoMWxaMlFpZVVtVlJHQ1Q4bjlJNk5PRFp2?=
 =?utf-8?B?Y2FsNVFLck1nZHZJK2ord0hVUzA3T2ZSV3lMbFIyS1ZISzAxdVh3eXB0VEt2?=
 =?utf-8?B?aUlkUWFMNWRFT05VMDBkdWxtK0hDK2V3Uy9mSGZZN2dTRW03VzFCSE5CbXdE?=
 =?utf-8?B?bXphaitWQjRnOHJudFl5eGViWTJibVdBZklmRHVzTTJ6SVFXVFVZM3Yzd0JK?=
 =?utf-8?B?aXhnZHJIRmR4bTcwY0NURFF6SmEyVW5tN2ZlRU16d0hMVmVkdXdjSitUbHlv?=
 =?utf-8?B?cis2R0pRT3AzSVB3L2ZQVUR4ZzBmVnpSQmwzYXd5Rk85V2g1VVc0Y2RyR2s4?=
 =?utf-8?B?d09DRkJoOTk3MzVyckRlcTBRb1NpNmFKMnVwV2JXS1VHQ2tHcTFVQnkxSkR0?=
 =?utf-8?B?bG9RK0c4TTFreXN3bHVGRVZBby92MnZyS0x0OWI5ZHo4Z3liYW5rbXl6VjhJ?=
 =?utf-8?B?RmJ1Rll6R1pMdlhIcS9QQ3FEOHh0SVVSWDNjK2F3UXBTQm5XV3hJd2UvNity?=
 =?utf-8?B?cFRmVVBjOUpUK2JGRXZQeGh3Nlo5MlJIMUJ2dXRaa29RaHJ0QnkxeWltQm1Y?=
 =?utf-8?B?ZGh2TmdPUjN0VWxqbzdUQ3AyZmR5ZEZWMlQ0L0dTVSt1ODl4WTU1OVpOaTFt?=
 =?utf-8?B?c1BwS2E5SG12QS9zd0dRMFZETjlpa2RlMjZYNVBIdVY5Nm5JVGkvNWpieGVP?=
 =?utf-8?B?Tk1QNGtOOTJhSFVMY285Zk1kMVhkV1FPdXovS3BkTm5rUy90elZwcHhRSlVW?=
 =?utf-8?B?UnRoeHgzT0VHei9NSHhlU2ltZmVMZlh5ZW1UWU1veFlqTEk0OG5pRklmVVlV?=
 =?utf-8?B?SkFOdmg3RmFHN0tOam1McEFWTThvbzBNSTFoM0hKeWx1cStDNk9lOEQ3dDk1?=
 =?utf-8?B?QkJobVZXeExyMFpkQ0lXN2JydGptQnd6VW0xcUlKb3h3Yk5TTzkwY2RPRW5y?=
 =?utf-8?B?Tm1rNGNEdHd2MXlOWUJwTDVLYU12QTZUcko4NFpFWVJ4RVpsMGNjdEFoRHI1?=
 =?utf-8?B?NHZFaWJHdW0vcTVHMEIwM2FMdkc3dStxVUJzaTlrRjBBakQySHV5dWNjcThL?=
 =?utf-8?B?cFNNWlFBL3UvMUlPb2NwK0h0b1Nudk80d3BaNHV4V05OMlJMc0F0bkhqdlRs?=
 =?utf-8?B?TEZscHNyNkZSVGh0QXQrRVdMbjVkclNXTmZnR3VkWVJ2aUU4OUhrVUpnbmd1?=
 =?utf-8?B?YTFUWkVMUktRRElFQm81TmdiaDlSTHJJMWFSV1g0bHo0MUFIa0NoV0taRytr?=
 =?utf-8?B?aHBEV3RUd0JqZUZNODlvQTcza0ErVWtvaEVvMFZMajFyTU5rM1ZVODFWNWxY?=
 =?utf-8?B?ckxGSmtqWnRpdm10VnVpVTJVbnNFVEZSL25BS1BOakN2SlRwM1luWS9kODhP?=
 =?utf-8?B?SUhqL1R4YWkzcHhKOVhCZ1loU3RpeURtbjBlUktITnY3aVNEeFkxeGdtZTBK?=
 =?utf-8?B?a3RUL1hLc3RiT3kzL0FBd0ZxbGVEb2I2UEZJRExHM28yenFBYUtqY3hiQmEw?=
 =?utf-8?B?ZWxpYnM1YWEwU2U0MllvVjlPZitIVkllL3JKckREZ3NHYkY5WkgwMkMzRHYv?=
 =?utf-8?B?WFFNa3BNSGlORUlRRGRWeXJZZmprTEUxbFF4WUlvWngzQWFFcGZna2wzSTFz?=
 =?utf-8?B?QXFzWTQ0SXpMb1E0cjA2QWM4bmhJeFJCVEErSzVQaVhsZGlrcDB6QlhqcHFn?=
 =?utf-8?B?ZFNEYTNDL3hGQmJ5cDN2SE5PL2x2bnB5VmFUUzlDRlhDWjhBZTkyOThVcTJH?=
 =?utf-8?B?QmJrRGRsd2dnazZaQnA5Z2I5MitvRE9VN1VrU3R2MHQrYXkybWE1enlzZ0ha?=
 =?utf-8?B?N2Z3ay9EVFlYeW5peDR0SGt5WFJXTlcrU0FpZk1HY203VTFEODZBMVZYamNa?=
 =?utf-8?B?ajlKV0IzK0hic3RqNGJKTXBKcnpmV0padzk4RHViWGhBeUFYZFUwR0k5a2tn?=
 =?utf-8?B?Zng5aWFheDdXMjdtYUhYWWxmbWhHbTFFKzNGR3hJOG5MSVZxTnhJVWQ0dS91?=
 =?utf-8?B?bVdRYzBqRkRXUkI4UDhFSFVTR0syMnJBOWk0dExmeFc1NWFzUTVxa3o0RmUy?=
 =?utf-8?B?SjNSYzRmT1VsMDdNTldCcWxsYXJiazM5dHlDYXVLTGhPcWxRcTIwa2pqL2VF?=
 =?utf-8?B?alBVSS9HcHMyWFdpYjBTd1M2eUNRTkxJQlVBSjN6L2xxRzJuMUsxaWVSS0M1?=
 =?utf-8?B?cEhta3FvQjBLeDNGRkNOV1dIRXh1WWo0Zlg5bDJHRnU1Rkp1QndEeW5vMHJN?=
 =?utf-8?B?VHdYaEtUL0k1SGl1eEM2bGRlZ3A4ank5YjEzMDZlTmtPb3BDZUY2anpJOC9p?=
 =?utf-8?B?MEhqbEFrcWhpUW1FOUtnN1JUaW9vbWtTekhpTU5hVTRTcGNKQVJQaVNnWHps?=
 =?utf-8?Q?7rR5MKJotLP152c0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d0d2c8-3a7d-4f77-6e4d-08da39a635a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:45:25.5675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0xYpmNaq4wWPBpuxE0zvY2Zg/IJ5LCSLFATF7tQh6euBH2XyQ62hrEXQmaLHSxf1Kwnj3YFl0jtFGYDDNBr1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2326

On Thu, May 19, 2022 at 12:10:24AM +0000, Andrew Cooper wrote:
> On 17/05/2022 14:21, Roger Pau Monne wrote:
> > Under certain conditions guests can get the CPU stuck in an infinite
> > loop without the possibility of an interrupt window to occur.
> 
> instruction boundary.
> 
> It's trivial to create an infinite loop without an interrupt window :)
> 
> Also, I'd probably phrase that as an unbounded loop, because not all
> problem cases are truly infinite.
> 
> >   This
> > was the case with the scenarios described in XSA-156.
> 
> Case in point, both of these can be broken by something else (another
> vCPU, or coherent DMA write) editing the IDT and e.g. making the #AC/#DB
> vectors not present, which will yield #NP instead.
> 
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
> 
> TBH, I read that as a get-out clause for "we have no idea what to set
> for a default window", and it's not a decision reasonable to defer to
> users, because they have even less of an idea than us.
> 
> All CPUs with Notify VM Exit have the TSC crystal information in CPUID,
> so I'd suggest that we trust CPUID to be accurate, and program for maybe
> 10us?  That's 1/3 of a default timeslice.
> 
> 
> 
> > It's also not clear whether such wrong hardware behavior only affects
> > a specific set of hardware, in a way that we could avoid enabling
> > notify VM exit there.
> >
> > There's a discussion in one of the Linux patches that 128K might be
> > the safer value in order to prevent false positives, but I have no
> > formal confirmation about this.  Maybe our Intel maintainers can
> > provide some more feedback on a suitable notify VM exit window
> > value.
> >
> > I've tested with 0 (the proposed default in the patch) and I don't
> > seem to be able to trigger notify VM exits under normal guest
> > operation.  Note that even in that case the guest won't be destroyed
> > unless the context is corrupt.
> 
> Huh... There's nothing in the manual about that, but obviously hardware
> has some minimum safe value if 0 appears to work in practice.

Got the tip from looking at the KVM patch submission for notify VM
exit implementation.

Seeing your suggestion above to use 10us and your reply here, I'm
unsure whether you are fine with using 0.

> > diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> > index d388e6729c..5685a5523e 100644
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
> >  static unsigned int __read_mostly ple_window = 4096;
> >  integer_param("ple_window", ple_window);
> >  
> > +static int __read_mostly vm_notify_window;
> > +integer_param("vm-notify-window", vm_notify_window);
> 
> Part of me is loath to keep on adding new top-level options for this.
> 
> I was about to suggest having a vmx= option, but I've just noticed that
> ple_{window,gap} are wired up to cmdline options on Intel, and fixed
> constants on AMD.

Do we want to make this VMX specific?  The problem affects both Intel
and AMD, so I would think it's possible for AMD to introduce a similar
solution in the future and hence we might want to share
"vm-notify-window".  That however raises questions as to whether AMD
will also allow specifying a window, and whether it will be in crystal
clock units.

> Thoughts on a suitable name?

vmx and svm would seem fine to me.

> > @@ -1333,6 +1338,19 @@ static int construct_vmcs(struct vcpu *v)
> >          rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
> >                           VMX_MSR_GUEST_LOADONLY);
> >  
> > +    if ( cpu_has_vmx_notify_vm_exiting && vm_notify_window >= 0 )
> > +    {
> > +        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
> > +        /*
> > +         * Disable #AC and #DB interception: by using VM Notify Xen is
> > +         * guaranteed to get a VM exit even if the guest manages to lock the
> > +         * CPU.
> > +         */
> > +        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
> > +                                              (1U << TRAP_alignment_check));
> > +        vmx_update_exception_bitmap(v);
> 
> IIRC, it's not quite this easy.  There are conditions, e.g. attaching
> gdbsx, where #DB interception wants turning on/off dynamically, and the
> logic got simplified to nothing following XSA-156, so will need
> reintroducing.
> 
> AMD Milan (Zen3) actually has NoNestedDataBp in CPUID.80000021.eax[0]
> which allows us to not intercept #DB, so perhaps that might offer an
> easier way of adjusting the interception logic.  (Or maybe not.  I can't
> remember).

OK, will look into it.

> > +    }
> > +
> >   out:
> >      vmx_vmcs_exit(v);
> >  
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index 02cc7a2023..9c37790c36 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -4567,6 +4567,30 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >           */
> >          break;
> >  
> > +    case EXIT_REASON_NOTIFY:
> > +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> > +
> > +        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
> > +        {
> > +            perfc_incr(vmnotify_crash);
> > +            gprintk(XENLOG_ERR, "invalid VM context after notify vmexit\n");
> > +            domain_crash(v->domain);
> > +            break;
> > +        }
> > +
> > +        if ( cpu_has_vmx_vnmi &&
> > +             (exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) )
> > +        {
> > +            unsigned long guest_info;
> > +
> > +            /* Exit was incident to an execution of IRET that unblocked NMIs. */
> > +            __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
> > +            __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
> > +                      guest_info | VMX_INTR_SHADOW_NMI);
> 
> I am saddened by how irritating it is having the UNBLOCKED_BY_IRET (in
> the first place...) but moving between the exit qualification and the
> vmexit intr info fields.  The constant probably ought to be renamed to
> lose the INTR_INFO prefix.
> 
> I'd suggest a prereq patch to also break
> 
> static void undo_nmis_unblocked_by_iret(void)
> {
>     ...
> }
> 
> out to avoid opencoding it in several places.  There's one other
> instance in our code (general fault intercept), but we're buggy on
> PML-full, APIC-access and EPT violation all of which Xen handles.

I don't think we are buggy on APIC-accesses, the SDM says:

"Executions of IRET may also incur VM exits due to APIC accesses and
EPT misconfigurations. These VM exits do not report information about
NMI unblocking due to IRET."

> I don't think you need the vnmi check, because the bit is 0 otherwise.

Right, the bit is only defined in the Xen case if vnmi is enabled,
because Xen requires PIN_BASED_NMI_EXITING to be set (NMI Exiting set
to 0 could also allow the bit to be 1).

Thanks, Roger.

