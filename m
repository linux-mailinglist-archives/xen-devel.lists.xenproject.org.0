Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0F7AE778
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 10:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608339.946756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql36e-00018M-Am; Tue, 26 Sep 2023 08:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608339.946756; Tue, 26 Sep 2023 08:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql36e-00016H-7Z; Tue, 26 Sep 2023 08:07:44 +0000
Received: by outflank-mailman (input) for mailman id 608339;
 Tue, 26 Sep 2023 08:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwzO=FK=citrix.com=prvs=626a79b17=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ql36c-00015B-1P
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 08:07:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fe9b82-5c43-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 10:07:38 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2023 04:07:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5663.namprd03.prod.outlook.com (2603:10b6:a03:27b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Tue, 26 Sep
 2023 08:07:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Tue, 26 Sep 2023
 08:07:24 +0000
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
X-Inumbo-ID: c0fe9b82-5c43-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695715658;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oL4s6sW1c3zsJr77M4JeAGqEhamLmYBl6/nR/m+DIWc=;
  b=Lr1iUIGxBP8fZs/ZcJwCq4++PU+2pyUtsLbbLzI3jW5vKBtHMngUYKpr
   rAfY2OBW6HI/AfXvDjdWQq/iV2KFKPK4j1RUkYTDTd8rtSNKisreb9JPA
   /SJWSPDuJtwp7anFz6yoKI7diEirvKGFWEQ9e9ZQ/aE4mTb4y0Y2IBl6W
   g=;
X-CSE-ConnectionGUID: 0dnnyvuhR46oIRAxdGQ0PQ==
X-CSE-MsgGUID: ZH3XBF1CTi6Ko9hN60Xt2Q==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 122436531
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IiUnh64TFBHN/M6Gz2GLWAxRtAHGchMFZxGqfqrLsTDasY5as4F+v
 mYWWj+DPqnfZ2ukeowjbYSyoU1T75PXytcySVRornw0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPaER4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 fAeLiETcxC527yx4YiSWuVDv5wbFZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3mnA9xPT+TQGvhCsn3I9kY9UTYqVAWYpqi5rBDma84FE
 hlBksYphe1onKCxdfHmQxCnqWSY+B4dX9ZdGfcz7g2lw6/YpQ2eAwAscDlFb9A3sd4schYj3
 FSJgtDBCCRmtfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WAqng4jrBK1MoTjfzlrRbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:MqNPFaonTdveKkdLwATxx/MaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AQRU+AGs28crJtMLUPA+KFl0/6It9fnvb3WnNI3X?=
 =?us-ascii?q?kV2FIcpSFRXCpoJtdxp8=3D?=
X-Talos-MUID: 9a23:tgGm7QuPQtZ1LJgLo82nthE5BO1Guo+SCR4ulsQGnZfcBTAqAmLI
X-IronPort-AV: E=Sophos;i="6.03,177,1694750400"; 
   d="scan'208";a="122436531"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZyeEheATva5uMifQusUn71+gNH7nfQzNYHSqEZJS8lfCYa0vfDvOkdfU9UmjN7z9wOR/sE9ugeEmjfNnceP1eT3ujGSm84vwUBKXNl7f/qr6/r0pR5mGQKqiOzu0sY/H/hZo6wXCP0YRuDz/Rc5QdFbqchK8jQhFJmp4T5K+5+0+6VHWH98PcDTepTIBjzxmo6ax4Ii4Nc/n223Pc7SkJ9M14iEcR2Rr6IPOuQux88lx43AMdPiWKtKpGaq0m28zqD6rJE43R8BBcH6vM1MG4qkIfFNfll0sgi2ZFLD8Ty0ZFEQnA3gVewHFDftxLh1RTUpYXxncgqnFtFU4YFcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKa+SgYxuSDaqRyqNRXaqUFSchhp53xlW8SIFOJVU6U=;
 b=JdmfM85Q0Ki6/4niRFTvB3Bo4Q4rPr5KrrsHPrNLJeeiO2ZyW9bBGkMZenREA4WaWch+Xu0ySUzaiGCyT6nMhbHEzbZNVoDkGvi8NBHBz3zu6YKIhO7OJBehoaiv6SDSydElz1qIN+rwsfNYrjRehfM1zDcg16Ax6wMnRsfgmUvthQsLK25D8FkK+2h7atPBga6ls6wiYDKsykyIOAlgYmIw9Noph+tzl+84eCTOkVhEFCsU+hiOxDpCBJR+RD1gp4uzv9tXZokGBrPx/b5LIr59zJ5dgluqj6PFfsiHyaQLFfGylCJb1JDuMcz98bJltcDiP8wQRQ5P7nWhA/2L0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKa+SgYxuSDaqRyqNRXaqUFSchhp53xlW8SIFOJVU6U=;
 b=T9o2i6Z4p5SyVNl+lT3s/MvOH/lWiy1xHzeogg/DmJtRlNBFzKWXns2D7kcsWFWLa6Yhh+a6qooLQPfOJjUzIVIGJZJcuJUQWfem5Vj17EsdFQ98GgZQaeO/bKY0xjrRlVhDjEjgczddsLvSqy6pVuWrWUPW5niDowhhK5nynHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Sep 2023 10:07:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Message-ID: <ZRKRNcypuvP26luu@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
X-ClientProxiedBy: LO4P265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ab58ef-e5de-4b52-82c8-08dbbe679def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ls/KqzwltDXYj+VEF8yppxHDndne+vDvtPwGiPBV1la9OE1NiF6KvaFO5cLJGOFiRpeSJB2CchzTE1F5a2hd4b6KY3FmO505K8hVYkCWmH76nIh5xW1+KaxDIEOowg5ZMFvij+rYCWhY4KkYmTlq6yox+7Y6dJP8kdMCvhRr6VujLF5YFcGogJIRI28Kmzl0mR89dwsFzqTX+Pok59kWhJm07ExR7S6JExTtyhS8b9sclB/a2lBwUokt/y8fTAFgMG9bV1kYc8tksVbog/jshMFfdGPDrT0p3ygGx9HHu6E1fSyOOGZQAtSyZsNNVhJN7lYrAPx0mOxiqb5YtmyVYwKJUonG9n+v9vnTMX9klny1FZIiBfs8hlSgqMTyXHRY8qSXCXeWWc/5zthtetctn1K+67K6UYEvC9PUuJe3BaL9Q2UEE6hUyaMiB3/WuxO1TRkRWuGb3Sy2aF/F2LLniKclkhGq09NlovjGpm/u3JotyLDJBEhS10lLJPeliYUM3nAloOLUqMDcx2SV0S1CNBNvv4SQbg34pI9LplLrgKFerknjg+iTiQ0m6q1imyJA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(2906002)(86362001)(6512007)(9686003)(6506007)(53546011)(5660300002)(33716001)(85182001)(6666004)(38100700002)(82960400001)(478600001)(6486002)(8676002)(41300700001)(4326008)(8936002)(26005)(66476007)(66556008)(66946007)(54906003)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnZobE02c3pScWx1RHovSDJlQlE0REE3NFdtWm0wK1VCWFpZWnBsVitDUUJv?=
 =?utf-8?B?TEc5NVk4MlVRb0tUWktVcEcybkt4T3MwUi94b3ZTZmpBL1RGeEovbjdjNExH?=
 =?utf-8?B?VkwxcUM5ME9sdFQxWnhlalJqTmp0QXJWbGJKOGlLaGtzWjgrNkwzcTk5ek5J?=
 =?utf-8?B?VG85UU1ZOFZWV1pzaUtxaU1CRWErZGZ0amYrd1RMTHJ2aHlGdy83K2FFUGk3?=
 =?utf-8?B?TFFFdlRHckJsZkVwVXBkbnFUUDdPSWJvN0w5eWIvQ0N1SDhRSWNiREhYNHVx?=
 =?utf-8?B?aGFwUCtBeldGUDJnME9ZdmU1RjM5YWtrM0dITTB5Q3ovVzVxbWRFcTVwRGdh?=
 =?utf-8?B?VGVtc2RFb3NVU2RleVh0Vy9GRVM1RHUyMUxNMytKa1RzL2N3UmRpK0JraThj?=
 =?utf-8?B?LzZzRlhqY3ZoZm5TQUt0L05kV0ExQTNQa1k0bWVKeTV0TUwxZzM5UFBqVjBU?=
 =?utf-8?B?YWRCRnRJMStvRGhFamJsUjVzV2VLb2hKMHFPWjREZjN0Q1pKa3pLWURqUkI3?=
 =?utf-8?B?SWRFaVZlNjhRVVpmUC90L09zVFk2RitGbU82OFYySnJZS1VQendNWFhQSjI2?=
 =?utf-8?B?VVpJSjVSL2JoZFBmZ250NkpsUCtXS3k5TWJ3S2hTa3V6aHhuMkVJbmZGZi9I?=
 =?utf-8?B?T0U3Tm9WZk5QMHdRUXRTUUJodzY4eUZzRnRuNzg0UHpLaExmRW1RWElpejRs?=
 =?utf-8?B?Y0dhb2wxakxwUms4MlFxYU1lS1pNZFlreTRmU0JXTXBQc05MdkFXWEVqRUo2?=
 =?utf-8?B?QmhTYXd2T1VHdEsrcnV6OU5kZlRicm0ra3N2ZDA5Z05zMk5GSmVUOStYbGtF?=
 =?utf-8?B?OWVQbzZsWDFyTEN5ZTZuaUhneVNLWnI0REhtYjl4VHh3ZzBrNTU5dTI4N0NH?=
 =?utf-8?B?eUI1OTdnRGpiVmg4djQzK3pEa3BtcVpiVm94QVhRWXhnYkk1aEtaVFl1Nnlx?=
 =?utf-8?B?Y2ZSVnpGK1laWmp3cTE4VTdYWTRJbnJKTDVpQm1pY3RGdG5ERGFQOHBLcHZw?=
 =?utf-8?B?U0k2RmhCUWRPL25sWWp1SjVMV3RhQ1pQcG5OSnhGcmtuYWlCeFdibmV6Ri8v?=
 =?utf-8?B?S2hpdXRIZjlYZm5kYUx6Sm9ZOTBMN1pwMzRJUmY3bHpRSjJVYVhsZ3ZYcE11?=
 =?utf-8?B?UGxUVVdKaEJ5ZytGbkhiN2xSaUoxeFhxWTVZa04rUlRZZHFQREVZUmw5Z3Qy?=
 =?utf-8?B?VEZiR1BxKzNZSDBXbEd2VmE2N01wM21mSmNpNkJhYmdDeDlrU0tKQkFjQXBW?=
 =?utf-8?B?aDk5cUd1YnhDL25oaFlubTVOVnp3dkxPc28wWjg5KzRCZktvcElTekZkc0VO?=
 =?utf-8?B?TlJqczRXelFVTUxucUw2bE95VjZla0crd0hlTnVWbytIZlR0Tm5oNVBvWDJk?=
 =?utf-8?B?dHFzYXlRMEZyQWg3Wm1ZMU9kT1VNRlU4YStPSVhpUkRnam1JSDFOY2ZoYlYz?=
 =?utf-8?B?bDRsVEZGTEZNa290cGRsWWNlVGZHUnR2Z3c2RkpxWkFhTnFwcnFlRnIwaVRM?=
 =?utf-8?B?azZwVVBXYkYvRHh4TTlOUFdrMTFzOFpOUVdpdlk1VTRldkNXK0tMSnhmbDVw?=
 =?utf-8?B?MTR4MEszamZ6QlEzSk9VN2J0elYxUEEwRWVxU21Fa1FqWVlocTBnSlRicGh1?=
 =?utf-8?B?dTBvNXEzeGNyOWxVcldvcytlakdMMGhta1EvbkVGWWRSTGpEWXRSWEd0VXVi?=
 =?utf-8?B?UUMzT0FWazBaQjZtekN2dHhBMldYZXpWT0NldG1VT2dhMkk4UUZEaTZsWVBx?=
 =?utf-8?B?ZXVxQ3l4a1RxVnUyc2N6d3ZiTHBFQ2ZIeHNpbHdsVHgvT2R3VXpid0d3SUFB?=
 =?utf-8?B?NStUVXJ5Y1RpZ2RZd05KdmFjVU5HWkt5VkkwTC9sQnJLT3dlOFdYYTN0ak81?=
 =?utf-8?B?RU1hYUhYUlovZUZaUGJHSWtWUWRKaTFQTmtNYm1mYnlueG1RWWtodHZRWlFj?=
 =?utf-8?B?c3R3amtvbC9mV3V2SEVGMkhOY1NtcEM3OUp0ekxmbkx0WUVJclNSaldMVXlJ?=
 =?utf-8?B?TS9BQTIzVkJseEJHMmZzVEFtRmJBNnFnTXJrR2lOMVI5VWNOaVVpNXZPZzZL?=
 =?utf-8?B?Vi9ER1FFOGtaanBzc3ZPNWttQjRhYzFGZ0xYWStmREYxYjNrQkltQXdrM1F6?=
 =?utf-8?Q?1ThQXs83YwoMRhK/EdaGZHECS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7/M2WAvWa+su1Sf50xw0jFHPkb3MS+ooA04TK+HApGWRgdN0wqsP+H9181yWx97U9eWfnho76Vocl5MHwHsW9fYK3Giyxzl1lTjhRmoIznnbvLQ8iP5Yo+ka4FjySUOv841H6PEIl8Q/XpiABm25hyxGya2Fu1UZ5sfbXZvuqcKrxE1ROrQ8vc+S0Td5fzIcJTdo/lf7uD5kSp0IAyYp1H8sGroeYrVI/pVV3F+bSdPUvy5cksNFw/hdBBJPC3S/1UyYJYDaC0XUV46Q0uornkgXzckrOdfjT+caGPxJXJLjKfSxUMahjaXG/17nqrjJXPth1fn9jU/aZIFnkjXjfZeG6LrdFrdG9oj12G3TDG9ypctRESHj5AAbl6SrHRMbwxeXv2ZtGSX0E6yqYhmRcmZpf/vhyZhFMJ23Mr/N0raHo0XNxGPwBdZZZiaFVwLFfo2Pg1xrh7CIi7Zs0rASJ0Kt756P9c2+2DIccmwpGYmL2M4UmuUihgql+REFFFJeaHUeeYj3hM+wLz2MF44WopZc199HF4fpju4CL3wxio8shp7XAkwTiDucvuLwDqVyNFNk1F23m49VGyVq4gJA+woW8boBN1jY9gd6pbOFjaazR3UtdmynKBrrehteZFctJapFwww0ASPD/JqqGAmzboRPX5eRiHHaYoUNQJ2Nq9QQShHui4n+bHkIxOOMWx0KtCjeRlRPBgTSYwt+yAQIC+KFr8nEbkP+Zws+r8sANOz9qqmCT5cvyZg0d3SUmoP2OG7VAPxxKMuY9zOOKwykh5wgnk1fQFa3jJKydNdn59dFjq+q9gdQHT5xfT+ElW39
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ab58ef-e5de-4b52-82c8-08dbbe679def
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 08:07:24.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt/Qv5029PT1U0Kgb1rJcXcZIkKci9eBgGe3pFtHM4lqXyNRoPoKhkN4hQUbrAWqDNtycjT0Gu6xzq96STZhJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663

On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
> On 9/22/23 04:44, Roger Pau Monné wrote:
> > On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
> >> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>
> >> Skip mapping the BAR if it is not in a valid range.
> >>
> >> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >> ---
> >>  xen/drivers/vpci/header.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index 1d243eeaf9..dbabdcbed2 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> >>              continue;
> >>
> >> +#ifdef CONFIG_ARM
> >> +        if ( !is_hardware_domain(pdev->domain) )
> >> +        {
> >> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
> >> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
> >> +                continue;
> >> +        }
> >> +#endif
> > 
> > Hm, I think this should be in a hook similar to pci_check_bar() that
> > can be implemented per-arch.
> > 
> > IIRC at least on x86 we allow the guest to place the BARs whenever it
> > wants, would such placement cause issues to the hypervisor on Arm?
> 
> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
> 
> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
> 
> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:

It does seem to me we are missing a proper cleanup of the rangeset
contents in some paths then.  In the above paragraph you mention "the
old invalid address remains in the rangeset to be mapped", how does it
get in there in the first place, and why is the rangeset not emptied
if the mapping failed?

Thanks, Roger.

