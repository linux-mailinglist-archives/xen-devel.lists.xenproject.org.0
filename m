Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6956338F0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 10:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447046.702906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxPsD-0003TN-1K; Tue, 22 Nov 2022 09:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447046.702906; Tue, 22 Nov 2022 09:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxPsC-0003QD-UZ; Tue, 22 Nov 2022 09:47:24 +0000
Received: by outflank-mailman (input) for mailman id 447046;
 Tue, 22 Nov 2022 09:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eX1q=3W=citrix.com=prvs=318bc7703=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxPsB-0003Q7-7U
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 09:47:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7511804-6a4a-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 10:47:21 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Nov 2022 04:47:16 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6120.namprd03.prod.outlook.com (2603:10b6:208:311::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 09:47:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 09:47:15 +0000
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
X-Inumbo-ID: a7511804-6a4a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669110440;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Eet2K4HA2p4b2alsskA3RB5poZhyvxZa3rI/wBToWJ0=;
  b=AhZaXSpkEO+7mg822NqU1NB3zpk4ZXxch3tKltrhWCiSu8NcqFsQbq/b
   7emJqXY7dPka3lrNd/PpQp5eQ6gugsrbAPSEWQg3NAkr2k75eE9O/XdXI
   DY9UGwJ+J8TrWNjJtiZnzFeQUJkNFgcjuwhqFbQSDRGLjqFiCAA2l9mMV
   4=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 85317572
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Pu4vta6Q99ai+BPtm+gpMQxRtBvGchMFZxGqfqrLsTDasY5as4F+v
 mQYXGDXM6uOMWv0KN52Pozk90wD6JbUxtM1GVc9rCFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 c5JJzBcQh25nf+X7IKjaM48md4DM5y+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Nkkoti9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+SxnqkBd1IfFG+3vtW3wKU9n0tMycHWmH8sMCTjFW+Ut0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsrKPTmmG3qyJtj70Mi8QRVLufgcBRAoBptz8+oc6i0uVSs45SPLuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:s4Hml6/A973Hqq98tyJuk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.96,183,1665460800"; 
   d="scan'208";a="85317572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyGMiIlr0MJnsiXNxnYlZ0uM2Mk7scfmhLUChBcSyLdViBXHbT1CHj/1wNJCuB4OjI/SZdTANMrkigaU0wqhndX/JLzWHjFcg7r6R6eZGMGb7X0vAScG5qqTNn1k9F4Y5LNsComQM3spBH6kfIqfVAXOWSeeGGZlUz00+cxCWG1Z33Hu9Ikeqxz/iX3tZGkGj9cVP8wnD2zwaeDrAM7lW6BLeetxd3x6JV1Z3x85atc+RKewo3p/Dh+rk5a+KQNEG5kjl5SyfTgqcvbzw1XiSqIhsFvDTCPn/d3ke59c3VxjS8EPRIzL1xOFOtNxukLTvyjXD8jiek94kHwLtkiyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzNgKsvmxEG7MU2AdrR/ACp7s33x3ImYCR9I6zf4s+0=;
 b=mWNSPwrhJ7u7VgM0tHQ3hoZuaTofduF/0hLrKagPEaOpVUAJti63p4KSWCxkI/0YIbyw0yj3fNvwU8cUvokrE+MA8aCbnoIxZ1QWtq/3kUMKG06X7ySOTWhAhN84USPJzQXmWTMrQPUyJNbLyKN4g3dzh9f6Xk8p+dYhGJFj0cSxdfNDoGPCMy6RS+8sGMX8ceuFx4kUc5gV60YpUHHa9IoF6UUR9J3j2mn+7/8AlBxkd1dDRuQHnFmt1tU5NZcxJnyi6wz7qYN0YeDmkABMUI/wuZoZqndXiipcPPnbA15N+vLIZyp7SRd2PY2wqI6cYkIhMNJFkfvkT7dv/9IA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzNgKsvmxEG7MU2AdrR/ACp7s33x3ImYCR9I6zf4s+0=;
 b=uH3DXGR+RA9tJxpbyYNpKgKxOTe7GOcRhK8gdf9y8rOp2W1IZ8YMiOEv/OLVA056uLFEkyTxW6XVODMSEazVDyvFoLNyIJPcQWuhPonxPr5fbhahZaumlw+mq7bDjz06FzDJkOC8vht00/Hdmc9ZmBOTKSIWHJqwQsGs9FdLUs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 22 Nov 2022 10:47:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Message-ID: <Y3yanWFrRpPg4bKW@Air-de-Roger>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 33947344-a4d1-454f-ff28-08dacc6e8951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8PkyCgQUOEhrqXgsj7VC0ofEVxinCyZil3VJL0Ep9L5Lppui3UBMIVLW/qbTIAu5Z1ApjldVTHENaKMmKpj343ryBwOjEqf+8OZORpRkWPjtrHM8pdzrPv4LQVGRfxMXHqaPg83AfnJwH9mkVXJkGBHnaL394hU02BfAxPUbohxl5Cl3b7ZMWXp9tKM94lrPl5WVyyrIN9Ochi6mrrH5APIQEhNCufZn3sXZuvRkMVv1r77pyBcF1Ii/IwlEJTsKOWZiyN8vXUws91trtavZ3R2b3Cm/l73ZVwI3whXj6lvgVF5h650zAZkUK1OM3Le+212vMcjk45OqD/aDBR76+m8Cip+0cUfVGGTj7ZlJDODj/+8If/5qeAqUUYRXKgbUOw0BJjXw/dmU0oCbxi3GrIBPAH4Wu/nbowN4pmLPhHF0Z7arX5+HuF3fvI2yOrIBZZnm6lC/Qx58+QGT5GSUB0JXd0B4XhsOWqs+dSoAV40HH5DIBfaD12bkiB5ksnv8us/dNMyHOiI6+T97NzSg5JWP/EbIsSXGe+Ka4mc9Uw2TbW/EsKzV3IZDnNtow1MeqTh8zAOBT9JlE1KPcKRU5/7aTwwtsg6y+lzyKV8YPL77ys22PYu72wQ7bhVHLq8wCR2dWS3+ygxR291RXObwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199015)(86362001)(85182001)(66946007)(41300700001)(186003)(66556008)(66476007)(478600001)(4326008)(8676002)(5660300002)(8936002)(107886003)(6666004)(316002)(6486002)(26005)(6512007)(9686003)(53546011)(6506007)(54906003)(6916009)(82960400001)(38100700002)(33716001)(2906002)(83380400001)(66899015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUVUQmx5RmVUQU5RaFBNMmRGUkJGbVhVMUtUelE0czBDb2xqb1NWSHA5RWhK?=
 =?utf-8?B?TXR0MWsyRi93T3Q4OGRuN2ttdlBMUWg3dy9aelh1N0lDYzFZcStPSzlZdSt2?=
 =?utf-8?B?SzBybklIY3I2M3ZpUFRxUFNNbUxBZlpkc3NvSXhrcXgxT2FWc2c4TUdGUGhO?=
 =?utf-8?B?bVlTNEFHeGhLdnlacG9GQXlhM1ZHZFM5NDdqZ0ptT21WK0JJU1p3S1NxRE5L?=
 =?utf-8?B?VnVBb20xMEY1WGJJTnVKa0Z6ZXU3RlhLcjc3eEs3UVlNaXIyMHFjOGZJZkFa?=
 =?utf-8?B?U1MxaHo5WlFLYXpQayt6NWN3USsxYWZoNXlrMm1mZ1NhcUVKYTFKZFltTENp?=
 =?utf-8?B?UnF3bkVJeTRZT1lzanZDRndnZVhNMldYMExTMnBMbnIxQUJSd2E2ZDhxNnNt?=
 =?utf-8?B?OG9TSzJLb040VkNxbklReG9nTW5hNlprK1R2d0RlclR4eU95OG1ZNmY4RjJL?=
 =?utf-8?B?RHJwODdFaXJlSGlJVHNYRGYwOGdOVXZmdWZGeU5TRVVzR3FnR0M2eW1CcVkr?=
 =?utf-8?B?MFluSGF4aGJJNkJMNlQ4Y3hNRnh3YXZydng1YnFLQWx3VVh1eStkdUtQMU5O?=
 =?utf-8?B?NkJpK3ZsbXFxV2szMVNySlFBWFhkYk0zWGprRFJBY05UaElWRk9Xa3MydjdZ?=
 =?utf-8?B?djVIZkd5QjhnTXdqYUFxSzkyMUlBZy9EbmFwYjc0N3lRVjM1V21jeGdiTVdF?=
 =?utf-8?B?UnFYV0hBNGlHSm0xNXNUT0xMbnZxZG4vc1h3azVLeVRPdnh5QWh4SGVmZW04?=
 =?utf-8?B?bThhaTVFSWdOSlJJY0NubzNPRmdjS2JaV3ZIem5LeWQ5TytNcFRqOW92dThl?=
 =?utf-8?B?NlZTdXI5WURVV0RnV3BzV0tiSE5Qd0RycUFnYkNLb3AwMFpGUEM0MmRMWEVq?=
 =?utf-8?B?TTNSekVES0pNQ2xPVUZKeFB3U3VkS1JLR2pTdWhuczk3ZW5FWExGbVEza2RC?=
 =?utf-8?B?bDFBd0RTMldNRkVuMmQyNVhVRndZenRSY0ppaXp1dDBkOXpnbTJ0T0EvUHFF?=
 =?utf-8?B?QWJneTJ0dFR3QmZwT0FKYzNDZ0x1K2Z5RlB0aWRid1kwTTdIV2NMV3B4NG1m?=
 =?utf-8?B?bEZxTmR2aHVHNXhrWlpZS1J0cVc1Q2JkNU1JeUd5eEFJaUxUY0c5U2Z4bHRO?=
 =?utf-8?B?ZHd3MjdkWExLZFNBUmRjLy9qSnRKbHVoWUhhMXV0Mm4rZkhCR0xFOUhMZSt6?=
 =?utf-8?B?V2NxbFA1YzhKZ2JhcWk3UTE5bUN3cmNyVm9rWDk2SXlSS3dERHl4WElYcnBa?=
 =?utf-8?B?bkpISGxtTWo3eE8wazRGbG9TWURmYXQ2amJWbHRjZE9HS3BLM2NYRjljaTA4?=
 =?utf-8?B?UlNqMnBYdkZSS3dvTjlTUE5uQUJJNnFENWZtNnQrYlFWSVV1Znd4c1F1azkz?=
 =?utf-8?B?N3dRRXdVcW81UWRwQTBSYW1PRHRDck1ZSGI2YkhURFVuV1JIa2M1aHFJNnlL?=
 =?utf-8?B?MFdBaFdTaXZxQWtTdzFCN2JtZng5Q2s0QzMyYUNxWWQ4TEhCNUpsTmozMzRY?=
 =?utf-8?B?d1lpbjNuTEx5Nk9pOUZDSUlYNWx1NUtKTW9RSXd3K1QyUjBjbjFUTkRRK2ll?=
 =?utf-8?B?dzNRd28zL1hOak54RXhrdGJ6dWw3azFZMzYyUy9HN0ZvMkROZ0VLakhXOWxG?=
 =?utf-8?B?NlF5WE1RV2dZTUxVdG9qV0RCRWc0VllyUTRQQ29jejVDd2RLeFNJUUsvai83?=
 =?utf-8?B?K2wrWkZzeFJtUmFkTHZ3NHdoemcrRTRsdWdpWll0UDd5b3RhZDgyUUVzR2dL?=
 =?utf-8?B?Vi8vTTVIWjUxbytrdm5kM01mUzQ2VzdOVHZZUXVSUFljaFRhM2h0NGV6TVZV?=
 =?utf-8?B?ZGJQckkzbWhGTFd4NnMrQkdoK2xoWDN3RlNObmJ4L2RXOGNwVWlYYXlYMjMw?=
 =?utf-8?B?aDlYcmY5NkFzMkp4anh4cVhyRW9EcnIwRmM1T1FONFR4MVJ1WWFhZVYvaUtN?=
 =?utf-8?B?VnJHc1Q5VUYxanVaTXl1VHp3ZGVkcnF3R2VRSTFqcGRlaE9FUGdxU0lHdzg2?=
 =?utf-8?B?VU0yclRWUXRqYys2RFZXOVZ6cW5RWmVMWmppclpIQW1nb1oyd2N6RnU1T0sv?=
 =?utf-8?B?NU1LN2RIYVpOdTBWdEVvYWVrZkZENWdDL2FJd3VNam1FZVFyVll1bkMvLzVj?=
 =?utf-8?Q?AATAzCfLesVyEURcZWslnxbqD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lh1+HuUKFG4rV+1FDCjwR70et0V+UU6hOeatYXqFUkdwLlQYpXW51RbiVFPvsk+qwpWE4tl75K5VkyA4tGs1YhYzedR7xmtbRq66VNJwD2fAHwMUNkkYHj6P7dQ3Ir3FtyHCLDoaH7vViam/R+kYu7oEAupZWwTminM47hkonpAqgy0Bd7BvperXPg8j3HwK64CuWnumZokMC+8lC5Nr0DtxtC9LClkHuX1p1Uc5x4zTVI+kw6GgAjdwHjqq9SpVfNZcx2tZxgNHYtcthPomo2lAydVXSb9Mks5Mte+nvzmiUg+RpluFM/wEtpg8VHN1NHwUzYmAdkCjL5t1EMMUr17HbdRfwpCzD8ziiQXdHLKV3FdPX0CcbatM5QTraLSOyvloLxLi0z7EwnqfSoELXOFuQnjiNbzrKcGL3IAuJFahqn+fp5JFh7R6ORPeMkv5gwIELwZ8KVGpaRSavrjqiXlSB6Sx35HZwVkI0QXJv1Dty1+DCynGnFksdlKLCKo4lKD5sT+u3k9rmFbutsIztPos5oSMRDpSA9/NeJxQPhsBCSlN6d4fV+xttLSk80FAAI8Wk1GfWdteD4/uC1Fbfse1SDgGJ/8t3qbpGhivYS0xM17MEovdXOQUxA6JO24HMVysQQavlX5TSHPsEIlULKljStBXH2KE27dzShRenhHLKORHA6ZfihnKrwLneZmBiNuajfLYStzgnpjaC2vTXizrB33MXUCLo1POSNms4OX7BOehUCLa7Pp17yx4hpvZMPGUJEUJcSmvrf4QIOjJ/lV2bLqR+Hrn1S26NEVvMrvi2t/rI9X+SOIGLg4wfDpgBaX95TW7+B3NjgPi3Q4rWA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33947344-a4d1-454f-ff28-08dacc6e8951
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 09:47:15.1635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvawfs1gNL+2+hE/cP228KxrS0PKZrMJne9qny8b/h5j1WOaaItfEGwOmY2iGUljFe2O4Z1XC6dmFjYt8TK32g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6120

On Mon, Nov 21, 2022 at 06:01:00PM +0100, Jan Beulich wrote:
> On 21.11.2022 17:48, Roger Pau Monné wrote:
> > On Mon, Nov 21, 2022 at 05:27:16PM +0100, Jan Beulich wrote:
> >> Hello,
> >>
> >> on a system with these first two EFI memory map entries
> >>
> >> (XEN)  0000000000000-000000009dfff type=4 attr=000000000000000f
> >> (XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
> >>
> >> i.e. except for 2 pages all space below 1M being BootServicesData, the
> >> -mapbs option has the effect of marking reserved all that space. Then
> >> Linux fails trying to allocate its lowmem trampoline (which really it
> >> shouldn't need when running in PV mode), ultimately leading to
> >>
> >> 		panic("Real mode trampoline was not allocated");
> >>
> >> in their init_real_mode().
> >>
> >> While for PV I think it is clear that the easiest is to avoid
> >> trampoline setup in the first place, iirc PVH Dom0 also tries to
> >> mirror the host memory map to its own address space. Does PVH Linux
> >> require a lowmem trampoline?
> > 
> > Yes, it does AFAIK.  I guess those two pages won't be enough for
> > Linux boot trampoline requirements then.
> > 
> > I assume native Linux is fine with this memory map because it reclaims
> > the EfiBootServicesData region and that's enough.
> 
> That's my understanding as well.
> 
> >> While the two pages here are just enough for Xen's trampoline, I still
> >> wonder whether we want to adjust -mapbs behavior. Since whatever we
> >> might do leaves a risk of conflicting with true firmware (mis)use of
> >> that space, the best I can think of right now would be another option
> >> altering behavior (or providing altered behavior). Yet such an option
> >> would likely need to be more fine-grained then than covering all of
> >> the low Mb in one go. Which feels like both going too far and making
> >> it awkward for people to figure out what value(s) to use ...
> >>
> >> Thoughts anyone?
> > 
> > I'm unsure what to recommend.  The mapbs option is a workaround for
> > broken firmware, and it's not enabled by default, so we might be lucky
> > and never find a system with a memory map like you describe that also
> > requires mapbs in order to boot.
> 
> Guess how we've learned of the issue: Systems may boot fine without
> -mapbs, but they may fail to reboot because of that (in)famous issue of
> firmware writers not properly separating boot services code paths from
> runtime services ones. And there we're dealing with a system where I
> suspect this to be the case, just that - unlike in earlier similar
> cases - there's no "clean" crash proving the issue (the system simply
> hangs). Hence my request that they use -mapbs to try to figure out.
> 
> And yes, "reboot=acpi" helps there, but they insist on knowing what
> component is to blame.

Well, if reboot=acpi fixes it then it's quite clear EFI reboot method
is to blame?

Or they want to know the exact cause that makes EFI reboot fail,
because that's quite difficult to figure out from our end.

But I'm afraid I don't see any solution to make mapbs work with a PVH
dom0 on a system with a memory map like you provided, short of adding
some kind of bodge to not map and mark as reserved memory below 1MB
(but that kind of defeats the purpose of mapbs).

Roger.

