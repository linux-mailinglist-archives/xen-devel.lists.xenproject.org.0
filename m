Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD36F56AF
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 13:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529115.823141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAD6-0005Zb-NS; Wed, 03 May 2023 10:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529115.823141; Wed, 03 May 2023 10:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAD6-0005WG-KP; Wed, 03 May 2023 10:59:48 +0000
Received: by outflank-mailman (input) for mailman id 529115;
 Wed, 03 May 2023 10:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tguP=AY=citrix.com=prvs=48085cdab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1puAD4-0005WA-SF
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:59:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bffbf91-e9a1-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 12:59:45 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 06:59:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7433.namprd03.prod.outlook.com (2603:10b6:610:19f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 10:59:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 10:59:39 +0000
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
X-Inumbo-ID: 9bffbf91-e9a1-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683111585;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6RWwbk5SEKauqK8nsuOFdhJu82y4KomYtMURf7L1qLo=;
  b=Ht7CZnw9xqwtrZOi6zoUqaYMoJhnu1ePqRMrWQjFaWSI0kZKiRfY9bSa
   jdl69jaOxh3hy0AFhshmoPS1tpwrtmHs/bW1rwEuc+zUaj1b8uD3oqFU/
   MognUM4QVDzgt95W37ONSIlGqZUa3zE1EMY+CP3bRMUdYsvJ4hfdOjJpF
   o=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 108104179
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dgedVqM8IBHZRmrvrR0hlsFynXyQoLVcMsEvi/4bfWQNrUom1zAHx
 zdLWGGGMv2JYTbxc4x2YIjkph5TvpLRyYIwQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uF1E39op
 P05E3MMYA+y2rqRnbOaZtA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr837eTxHyqMG4UPIWZ5vJ3vUzI/XRJAVofc2uj++i602frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O8037hucjJXd5QmxD3IBCDVGbbQOv8gzQCEs1
 0OY2dbgAzVgvae9WX+b7q2Trz65JW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv42k+XjXjjTqoYLGJiYl6wOSUm+74wdRYI++e5fu+VXd9exHLouSUh+Gp
 ndspiSFxOUHDJXInirdRuwIReut/6zcbm2ahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:NsTmwal+0o1KkjCV5pE1VCV4g3LpDfII3DAbv31ZSRFFG/Fwwf
 re+cjzsiWE9Ar5OUtQ5OxoXZPrfZqyz+8T3WB8B8bFYOCighrSEGgA1+rfKl/baknDH4dmvM
 8KAstD4Z/LfCBHZK7BkWuF+r0bsaC6Gc6T5ds3uh1WPHtXgmJbgzuRyDz3LqS7fmZ77FMCeq
 ah2g==
X-Talos-CUID: 9a23:bIz+i2/EoNtwm+4Iu0SVv0kWCN4DI3z89zTRLVCJVD5OFby0ZWbFrQ==
X-Talos-MUID: 9a23:ltcYBASKJKQxBHRGRXTUpSFuKfp5uJ+2UklKmLM2o5OVNnVZbmI=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="108104179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxZ3/7zv6RX6YN8Ziz4xBdR50HNBzdunqDCzWnXipIgzdnCImQsRD4qTrfgMZw7teuQnjEfk4u3qLIDFL1B/fwaRi/WISIjsqOYzj9tOteiS2Y4j0AMgvgPgzqfYYkpPkye103biQ0fbGWcwLgJhzp2K5FvBlO+TmfdUjbia6qrEf4iFvziDY9qp5JGsK923GBy/AzobxbXMjfK7EMrujjydOK0PKBH4DA/JrOFbb90VYz+zB1hUAeJ3uZdTymec6QEcbKVf7QfGLSYKCVKHIKDI9ONB1MLGY378j/QEiNODGDJ4PgFMMf8nDIWXTc1vWYw/rXoKfFsEcLjCtjlhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1WAO9qDhaUZ+sqChhfahS0xja8lxmtg8lYiM5KDuO4=;
 b=FptxSn79Q4ffQXiK8i7+2SP0UtZVEUf8RLoq+D4wLHVV5ufQ8R5Xw0Y6k8OTLcR53P5og9ZpfGo+iETbDFuiFtOs4vJsOcIqgV77pTdTwhkvca407wEJZmJGqR0XxtPLUsgi6XEQ9W6pxIhwcMpHTuWr5exaCjvfFK2iMGGdsUo0qW4Cb8z2wC/6oRD+b+ED1P7F7OBDkiex1hHp3A8Hg6vL/9ffkCSDSX+1vId7BS/ik+RQDhWkj+vIk4V6IFZH2ECAX70Mczwxn2NnqQMBMzWRN+xdcAKA+Fa9XN796Pmk+4Jr6l9udVAjl5MBAR3fbjcg8yDcPr8JR6JW2+N7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1WAO9qDhaUZ+sqChhfahS0xja8lxmtg8lYiM5KDuO4=;
 b=luGhlknKHK0I95pyLVB5TGzwPOD/CFMB3p3qspFRFv/gS0eVT1zW8fmQFW5B6JoYKTHhhX6d2jsFSPdAJOwLiwoC9Dv1yyA+wUKYPF5PSL2rehAmN31bcPZH/IEEXOE2oTkpBgrh5HFQg+I503i3vn/3Ds0dzn6IE0qugqOM9Gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 3 May 2023 12:59:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/vcpu: ignore VCPU_SSHOTTMR_future
Message-ID: <ZFI+lJl8X96BtzqK@Air-de-Roger>
References: <20230419143155.36864-1-roger.pau@citrix.com>
 <0820220d-a500-7920-3630-eea074856e3f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0820220d-a500-7920-3630-eea074856e3f@suse.com>
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5e9566-3d21-4ecf-bc09-08db4bc57d77
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBFskLXDcSLMokwjmRfUYvAW0wQCHcknYjKu6kKoVQTrxDXwWsmFDKdVpePqec11G8AQGTXWONZslFBnjggXmUmvw7YM2T7Rb6+lHNtd3EbdQCaATTHp1Qt6v4XA+x/QwLWr5lBNt5gaR6weQGQCZ/37qXq7RkWNwY3vyQd7EMlmb9WDLrMN7a4Iif9k9ARzyVEy0aHP0eLZsXpb9fUYBI7Sm/OOr+00g87b/2Ifp70wyAw6JudXp+fAGoHICbJXZ0p5h6P4JnnCa37QoDUCl7mxu4eAMzZgESmQ95BK2LCpa2zEfwJCbuMc6eOBbPbuRXsALKiWwNxxH2JWJ3txH0RbkOd7MjBb8OPaxvJiwnbv6xHN2YydJA8kxZgU6r9h/jTmp5OEdboBxGLi60p6XMEClV/xpRB5I2xbCnMFNjtCdUsy8IypgE59lK+NviU4mrFOZJP6WYarUmt0TCjb0KSJ5Wi+/ZY9cuCoiM+evCsaBZJ6sDC2rbEg2fA1G7wPkRRVgaLtS6pnrFCF/BpcnEHZd8AKiQxfYKWNpsy8EVnUINUpi9VQKa3MA3IREwaeHKFwVciBM9qV153TgYhw1f2FZaj+JVH7BwaIS9fZWec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(82960400001)(41300700001)(33716001)(316002)(38100700002)(4326008)(6916009)(83380400001)(54906003)(85182001)(186003)(478600001)(66556008)(66946007)(9686003)(6666004)(53546011)(6506007)(6486002)(8676002)(66476007)(26005)(86362001)(6512007)(2906002)(5660300002)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3NzeWpFQUM4NEFmOGtpM0dZK21MRUpIdW5ZdE5VWmVhZ1FPdWZSYW85Unl3?=
 =?utf-8?B?d1R3WFZUdXZIMEZ0c0dJb2d4cG9UL3JuaWhsaFZ3clVvUDlkWlcxU1A4N0Ex?=
 =?utf-8?B?OHFDbU1iTnB5aVVYNkJFTS94NmlQeFBsV0diRHcvQjFiWWJKcHovbjRGSUU5?=
 =?utf-8?B?REV1RHEzbGVnb3VIU2IxdzdsdXFkYXlNUW1vL2djdUpNb3lEaGVMK3M3Y2JK?=
 =?utf-8?B?VlN5UzMxVFYzMk0rUHErTVBuV0JseUhpc0tsQVdyN2xTQUdWOHU2dkZNWlR4?=
 =?utf-8?B?elI0UFNLZEtTSEE4MVhoek4xUlhWeVR4L3NvTzBRaVUweFA5RE1ZalgrQlhv?=
 =?utf-8?B?eXVYQnVLaUUwNnBYclRLY1JTRlVaNmhkQUVFbEkyVkYrVWd6dXA1M0RybkxZ?=
 =?utf-8?B?S2JMbnh3N1B4S2ZxUG9VUjBkK3JjVW5lTEdmR2ZXOThOVVVMZnA5QkJXWnlG?=
 =?utf-8?B?YjZiYTlvaWVQckptMWwrMDU3ZWg5VmF2MTZYS25QUEwxai9MZVo5OFRCeUtG?=
 =?utf-8?B?REFPRXpPTFloRFg5c2d1OWVtTENMUnNVS0dMN1hFcVVteHNkVmdTbVhuYjQr?=
 =?utf-8?B?UWVwa3A1TkJ3Qy9MYWRYSTd3Y3lVVklxTE9wWVNuR1NYS0VncWJPTDJvbERt?=
 =?utf-8?B?akE4Lzg5c01vR1JIc2o5Vko5MUZVQk1JWjVReFU2QzY1Sm9YeHdHQU5xYVN5?=
 =?utf-8?B?YlJDcmtTeFUrTVk0MVFCRHc3SnBxQVlGYXNMRXpXby9VSG5udFFMWURESFQ5?=
 =?utf-8?B?WlNaNWc3akk1T1ZmT3ZPTVVSN2MxSEtLL29vd2drVWFPbVhoWHRxeDNmWURG?=
 =?utf-8?B?OGZ4V2g3eWdDazRWcmxia1hrblR2Mi9UYi96QzRnRGRLVUVKVHJpay9vWFYz?=
 =?utf-8?B?bDhCRTFqc3JFM0paaUszSFZuNmlyNys4WmFQRjVRV1ZlczB6NXh4QTJCQnEz?=
 =?utf-8?B?NmhBOUhIa2Q1cjBtRGtHK0w5a05ZellXU1RyK0FyT3BiSGlwL3YzbmdVOXNt?=
 =?utf-8?B?V2dJVExmSjhiV0JRZ2xrYWdlYVoyTnh6K0xmSTNuRnR2ejRVSk9TRFo1SkM0?=
 =?utf-8?B?T2lDSThDME5JNDNMK29peDVYMTNEOHpQUkNBRkdWR0xGajh0cmh5bUZxSWNR?=
 =?utf-8?B?Q01jc1RldFdCUUREUWFYQ3ppTGZxMitXYjdIODVyazRtK2hESEdGYUt4bndB?=
 =?utf-8?B?aGs5d1hMODlNaFFRbi9WQ2kxZmJKb3VUZWhTTThTU1NlSU4rN1J3SlJXblJl?=
 =?utf-8?B?akUyMVhFTDZYb0s5QXVBZmRFYnpoMTN0M3hZTGNXM0VaM2YxU2tpSkxmWDZ2?=
 =?utf-8?B?R3FDWHVxTHh4QS9uR004TmxLcVRYNGltQi9UcVl4aUpqTTNsNkxHTFhDSzB1?=
 =?utf-8?B?Njh1VXUvSlFNNEFNUXpLRTZKdVVicmhnVVpsc3FrSHkzdTd6S0doZlR6TnhM?=
 =?utf-8?B?VGcxcGVQekJqSmlLeFFPVXhZSnJSdXNUQnoyMytUcnFLa3Fyc2ZnM3Q4WWQx?=
 =?utf-8?B?bUFHUENOQUxCY1FpWGFMUGxzb05qSThoVmduZk5LQkN1eHpLQkUxMDA4UStl?=
 =?utf-8?B?T2RNQ2EwTmtqQUU5Q0RYTXBxTkkwWjhrdEZLbEhTZlpHTzJrbEJ1VThxa2tn?=
 =?utf-8?B?K2lWK2hVa0loaU5RZXZyUng3SHJxUHdkUml1QnFZYXVFaHkva3FnZ1FwNUdZ?=
 =?utf-8?B?VlY1cXFkbUFBTW9qb1dEcmU1cUdPQmdyeU1QempibEdZZm5jMHMraXpzTitN?=
 =?utf-8?B?aXkrdEtMc0tUejBiaWllcHdZOGJiK2NzWFlFMngzeVFBWkJ2alNEaXhvNEJ6?=
 =?utf-8?B?bXhXMnQyTEMzT0pIU1NSZWpWcGE2WnVuOEYrS0JCYUdXUm91NHRpVzlJd0xl?=
 =?utf-8?B?MG5kT3plejIzay9Id0xmR3BlMFhnMG1UbXZLK21rZnIxUnhZVld3OWxROEFk?=
 =?utf-8?B?elpvcWVKWHRkMEpKS00wUW1XRGxBTDc4MElhVzNUSE5HdjU2RGp2bDdDUkZ3?=
 =?utf-8?B?RkdvWk96UFBxNUh0bHpuRnBoQWs2UXZDVyt1RTg1Vk16TGtCTEJjblA5emNH?=
 =?utf-8?B?cDBDakp6SWRqOEFQSHlqR2t1Z1VEMGhXbG84dXFSZ05mQlRpOVQ5VzY0c2pJ?=
 =?utf-8?B?UmZKbk5WSzRMN2pGc1hzRDJubmwvWVM2M1VrUTdFNTRKaDNxUXRtTENxZlN4?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CpYO7J0DkI3U7dnB42GwPEmK0+JoepzdLuMvKHxC8fRjcwzR+/Tw+/ytMvlHFsXV4Pd9f4VfO4abCPBrLNSLAMSEfekTDnXECU18+KJTwWtcHMw65+I8nZ6N/TnWwWRTIeldyFrd16lm+mxb54DCOE/NbueK5QXud8H58wdxww4ZsVIphBheGNk6ufetyU2jU7EcjALvtx+vT6ourWXvMcFdDuh7m7SLGSmRXmGLOArIQDo74m3kFjaoo+LbxNoRReGQzTkhGXPwjMruMiTnti9dzOeYm0JLx8GolyOShjENYz0K8LQMrnZAbhJfAZP54XhzKntYHu3h74cf6cNBE20RAwCLS0Dw8iDCtWxYe7ipiehNKhYnlzLloLs5fvqauaqwXjEI4AumLsuL5VAOP8mDwZEkHxeoDblk4yNKZcvmdyjroOtsBS89BdSdfROYVQF2T35e3ebkOo4D7Ms0oLF5jGo8UY46Vj1h4RD3eZ9aN+4zsH2CU00ifgyO672LvX3JbrTmH9XaUtxMj5LQVIdwrZeqrvwF23KlS9fBaR7s5p3is42tmDZFmJlAElyGOWQnkBG4GcSLEnRkyKqNdJ+V5xL3BhYp2SoGET/f4CzPVNaNekxsqbiNTiMAL8NURCyviRyRTlBB4lm8CAuBUjZcohKQWcwbiTRPKQczP6exsDWy9hDz49lZIovjhAGtyt8eLqh+2el6053JGUxL+T/AIl5DT9G90yfkkkLq/GcSqrk8wcjzl03XuT+63Gu8XwTDMT5Whb4VGoYeloQwmTcuNh90fcKTzTMPX5oBjvEHmh75lqG2Zp6ucsOqq7lk/FZHvMJPURAyjgfcwvohwehTgJSnEyKD+7SxaIJ8XrxSb+7pI8ScasbYsSc1JqPuwKcJbT9tCbgnVCjFJ9wUjqMwMbC+yPy4q2QLRn3p3DM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5e9566-3d21-4ecf-bc09-08db4bc57d77
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 10:59:39.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLpPyJdsMW5etHRUzOyF4UqssSwCwtn2C7JjaiB/OXhGWvJQE1hk/rbQzh7viNA4FnmmbZK4+KI0VosYoGgG4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7433

On Wed, May 03, 2023 at 12:38:59PM +0200, Jan Beulich wrote:
> On 19.04.2023 16:31, Roger Pau Monne wrote:
> > The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
> > When the hypervisor returns -ETIME (timeout in the past) Linux keeps
> > retrying to setup the timer with a higher timeout instead of
> > self-injecting a timer interrupt.
> > 
> > On boxes without any hardware assistance for logdirty we have seen HVM
> > Linux guests < 4.7 with 32vCPUs give up trying to setup the timer when
> > logdirty is enabled:
> > 
> > CE: Reprogramming failure. Giving up
> > CE: xen increased min_delta_ns to 1000000 nsec
> > CE: Reprogramming failure. Giving up
> > CE: Reprogramming failure. Giving up
> > CE: xen increased min_delta_ns to 506250 nsec
> > CE: xen increased min_delta_ns to 759375 nsec
> > CE: xen increased min_delta_ns to 1000000 nsec
> > CE: Reprogramming failure. Giving up
> > CE: Reprogramming failure. Giving up
> > CE: Reprogramming failure. Giving up
> > Freezing user space processes ...
> > INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> > Task dump for CPU 14:
> > swapper/14      R  running task        0     0      1 0x00000000
> > Call Trace:
> >  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> > Task dump for CPU 26:
> > swapper/26      R  running task        0     0      1 0x00000000
> > Call Trace:
> >  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> > Task dump for CPU 26:
> > swapper/26      R  running task        0     0      1 0x00000000
> > Call Trace:
> >  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> >  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> >  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> >  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> >  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> >  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > 
> > Thus leading to CPU stalls and a broken system as a result.
> > 
> > Workaround this bogus usage by ignoring the VCPU_SSHOTTMR_future in
> > the hypervisor.  Old Linux versions are the only ones known to have
> > (wrongly) attempted to use the flag, and ignoring it is compatible
> > with the behavior expected by any guests setting that flag.
> > 
> > Note the usage of the flag has been removed from Linux by commit:
> > 
> > c06b6d70feb3 xen/x86: don't lose event interrupts
> > 
> > Which landed in Linux 4.7.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG
> 
> A little hesitantly, but since no-one else appears to show any interest:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Roger.

