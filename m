Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779406D5CCC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517798.803633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdeM-0000iz-2N; Tue, 04 Apr 2023 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517798.803633; Tue, 04 Apr 2023 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdeL-0000gU-V9; Tue, 04 Apr 2023 10:12:25 +0000
Received: by outflank-mailman (input) for mailman id 517798;
 Tue, 04 Apr 2023 10:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjdeK-0000gO-H2
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:12:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f2b7090-d2d1-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 12:12:21 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 06:12:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5758.namprd03.prod.outlook.com (2603:10b6:a03:2d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:12:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 10:12:15 +0000
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
X-Inumbo-ID: 2f2b7090-d2d1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680603141;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UFz2JVkAVtyrZ1xbzG59PK/LiPSeghCsIzW9wX9wibQ=;
  b=IIwMwk2mD2gqMO5VrcN+HgI6dyGaXHRUJTX4/1YUGg09PlWG1R026BLx
   aJaqqJfoPjJFSUxF/KSBKjovDS25PkpPIMpCW+UgBtxCdefygykByrhpY
   wc8zjImYwLJtk7YX1aTPnYV4mXvZKHs180NsJFSNHjmAb5qytqWg47vSY
   o=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 103615075
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Asrj+KvuNbpgxrEJ3IfbOPlfHufnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWDQM/feYzb9eosgb4m19EMH6sXTn99nTlY+qSw2FSpH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCT1SfBuFwLKP27u1QPB0nIN4b8jXBdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANlMTeDgqaMCbFu7/3EpGgdPSFyA+8Kyt0mQQNQBO
 3FT5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uXSs45SfbsyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:TQutO6xlArgAKiQ1wctdKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103615075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN0z6NogvqAaI2zwHlEDQacuH1AVq4OoYovgnv8nxAFCM4+ZosOa/2wzxJBtFILNsobh/QxpIzzgTbUfoqVjnIW6w7z4+8axSNPDPpAzwV+T2BWe3xW7Npsl+0bL7mCjr0jWnOLTGe4wXvBuKxzAtOonUnKBw06T2TnlavqIZjDtd4bVICQFcfyR8M6M89VEc5ZiDAju2dcXjoTiFg+UVID0uOe0r8qM75TiVetWqxd3C+DzgqMC3mtANKN5qx2Rq/plvufVLlhGnHr6XXNB8cauJHwqgqsJmpPlR19Au3umFEr55R0uXa3EmFIn6OjQZr8a5Q32NCNgXEJ4DeYIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mi0rYFQH7+37FCBieDUcO9QBZVqw+Q1snS907vw8ow=;
 b=Zb0v37uzNp7DOAMQZMyvsW487UneIi3yPTYxt5a+iTBJTS8Mm2rGny97khpbHvyxLXSkUJL/mLK/PJZzvrxt0Q9aKbMe4+06g1SzMxkksKjYyejbIhpWrnTcwnbuy9BsCechRyYBoOSMKbTMg6DQS2L6zU4yVfpGMBbkj1o8r2BICuYSLDJNCnwhxfdCGP8rKBtO4UGZfZaLi5VesyubFFhlkYphWNr7Z43ZlZgnJUtZVkxaqmFHRgvon4yo14px31yOtyLP8vtrF4bL8qIWhpG7FuoZH7JDsGdmsfZa60eqp3MM5tE9iPNNB7dKUWLVZrm5K8dTUYoypys/uEmOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mi0rYFQH7+37FCBieDUcO9QBZVqw+Q1snS907vw8ow=;
 b=LCmkkGPHTSZ9+3SZ2q4ekZ+dBBpqITWs40VGuErnX8LzlSiH0OixwZqLTlnx8T0n5quKZy+P/4sQnfodWnhI40i1t7o8Zht1Xh0LllbEezcP/dd2TxRPOXcJKmwvk7F1H0/s+JtkBebagAwmQi79vyA7BFWsEYaQeaZdwKVCIkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 12:12:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZCv3+cpzJ52Y679G@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
X-ClientProxiedBy: LO4P123CA0435.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7babf69e-4352-4220-091a-08db34f510a3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E+RlM9xKusNVh3+08goIXUsfNEYShHNiXXcyD/CZhizqcnsOjnCp011XuNmDWtjtReYjzBjaktwc3NcIxqTYKs9Au6bcCkzr4LS45gF/iFKFGK6uT3ZYJILizcnE1fcZUYZqTm4dHAapO/0JKRMUYkfnnb9i+EWKekNuvDJVQcM/BuI6+1HwHr0IPGI14qq3vQD7uOlzpEe4IK1tTWbr7xvyrVWG/solotKuF1k5hRItxvk6hTbGeSht4uSWmnV8uy4iC4I4S8SNHBfnh/bZvk6r/stHt3lqRm5bgCmxj6N+U390+5yNfE9DYZxUjdNbjXBF3E94s25jlufFOZd5oLGcLOm6yu4rzXbAQsDNFsz7V8SLXWIHUgP5xRZPOrVS1vjUBuL4IiOYlDXYzgnl5EXYGJO2YLGBn8+pH+y61mcyoi12sSdifcaHNCITQEHCLCLOZ/pgeFIna9VaAciNjPYCW3qx1Vuifmw54avpGdcEDZtORyNFuTOaGtKbdWVBcM8Xa25COP68ckztZweW20l5e0Xl5QqMpHtchPE6KYkBx3R7Bt1PfHHtLJBIe4IZ0gjQVfI0fPB3ScXzxu/lDK1NTRz7hb/fO+YLtsHbT6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(66899021)(186003)(33716001)(26005)(6666004)(2906002)(86362001)(8936002)(9686003)(5660300002)(83380400001)(478600001)(66476007)(66946007)(6512007)(6916009)(316002)(54906003)(6506007)(41300700001)(82960400001)(4326008)(85182001)(38100700002)(8676002)(6486002)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXpUZUdRVCtoV3F0QzNRZE9meDBzaHk2WTYyNzJTUXBFYVBkOFFnUFpMMHRp?=
 =?utf-8?B?M1d2cUJabTJLdDZhY1Y0UXhCb2RwUUpYNGhqUC8xUkJpNlZUNzZ0b1czWi9O?=
 =?utf-8?B?cVkwUE1xRFZjUVN1cTd6VlJLUWIrOVYydDhHKzZvY0tiYXovTGVPRlNwVUkz?=
 =?utf-8?B?aGJmcFhyanMvTzhJMkcyOXFuaFBpYnpSV3QwRm5nZjFlTTdYeStQcmdKL3Ru?=
 =?utf-8?B?TUtHU1dHWEJaTmJtOFZzeGJQNmU5TzR3d09iRGFPTXVVcFM3TCtoTWNZZytn?=
 =?utf-8?B?L3VGU1g1d0thM1RpLzY3UDZid2FXcXFWZ2NjcENnSVZVUGpSaUZEVDFOR01l?=
 =?utf-8?B?Sy84dys2c04xQWxiY1lmV1kwVGJ2bFVCdThKSHFtZ1VWU05pSWgrOXF4K0Fz?=
 =?utf-8?B?U2g3Y2NOaUpZc2tHMSs2akJ2WkwraVkydjFKRTl3R1JYakJLYkRYT0FLSjNV?=
 =?utf-8?B?K0lUd1B2WlR2SVo0dzh0ZGhxbDFzT2ZHdnJWaWtxMDZYc0d0ekQvK214bEJQ?=
 =?utf-8?B?NFRDT2MwV1BJQWtaZ0lab2lKdzFEVCtNZVRLOFlYUlJ0SnduclFIL0hMZG9q?=
 =?utf-8?B?Qzc3STdzVVRuLzNOODh4bDl3T0ppbzhnRGxjbks3ZkYvdHRuSVI5MDNka1hJ?=
 =?utf-8?B?RG41c0E2TjJmajJYVnhjUUFFREc0a1ZHK2NvdlZPZWhmUThPY2VjQWVobll2?=
 =?utf-8?B?ckFqWXAycmFQNWxBaFcyWVVyN0srZVFrcG5ZaW5tK2VNVXpla0dWR21CL01U?=
 =?utf-8?B?Rzc5aDUwaHVHMGlqQ09nTHVZQXk1amFUeGZiVFNzY0k1U0RLTW5sUzQ2SVVZ?=
 =?utf-8?B?NmNHMVRWY1d4bGhlRTZBRmdnaWtSQzJRRHlmL2NFT095OC9EaWF5MkwvNUs5?=
 =?utf-8?B?TWMwakNGMmdRMDdETTA4UzhZYWhOcG8ySllEZmg2TUF6U1NNZU4ydzFBNGF3?=
 =?utf-8?B?K0ZtOW1iVFJoSVNOMnp3Y0k3bmxGWlJVaVRmYXZyNzM3NGtvTDlXWE1ValM1?=
 =?utf-8?B?YjBha0lreVlnZkVjdnpMNkZGSDlsclB6dlgxYkdBcVZVYk9WUDJSb1NabmRY?=
 =?utf-8?B?dVJ1ZkFzODVqYVdiMDdXOW1XNUdqUitxVkZCOEgwK2V2bHZSTDFQZnFHZVJF?=
 =?utf-8?B?c3MxRE4xQWZYMHIySGJySk9CbFU5RTZxQnRrbHZoWUVZVEpITzZsY1Y4QnZP?=
 =?utf-8?B?bVR5ZWMyYzhLTTFySEIvTEI3U2ZKQlFmTFJsRU15NWxrRU8rSWNmY01BUW1j?=
 =?utf-8?B?THppeUhLcFNJeldSTUJIOWduM1psSW9Jb0JaZmU1S3BZRzR2NHc5ZWhXUENF?=
 =?utf-8?B?Q3V1UExCWitCdTdFR0pwUFh1RmVPMUo5c3BuZ3FiRVhHQUVEaDBObytHQkNS?=
 =?utf-8?B?ZmNyVjF3OW1FTU5MNHdiWFo5OTVHd0JySUxCSkhkWmcwd3dnWmNFeHJ2aW4y?=
 =?utf-8?B?TmtuU2JLaGxYdXJDcnB3cHI1cVZxckcrSjBvb2NyeG5HaUtRc1FMRENWbXVw?=
 =?utf-8?B?SjNkcFBIUHIveHcyTWFRWU9XSzZ6NVpka3NaQ1grcWJiV1FiVnBRYmQxV1Bn?=
 =?utf-8?B?eU1mRDc4VXZxM21Oak15MlA0eTJiaXVLT0pUYXJYaWx5UFJPV2dtbkgvYzZw?=
 =?utf-8?B?N1V5dFFSdFBUMStCRDNFWG0zQnpJLzh4NlRJSjZKbWdSeXFiaEI1aDJTZ2xU?=
 =?utf-8?B?enVUell1Y1kzRythc2taMm1BQWVqMXR5eXM5dWtvWDU4dkNlWGprcTlGdEpZ?=
 =?utf-8?B?dFd3SUhiam4xU0Y5VzlsbkxBR1ZtVG84RUlhOG9tbHRKT3FRa3NLQ2JjZVV5?=
 =?utf-8?B?bDd4QjJ1VUZVcHVSYWhYb1Z6MXJ2dWthR3p2MWZNVTFnMTZMNTY0ZFpSTjJQ?=
 =?utf-8?B?OHQwYTJrWkEySmcrQmZIb0JJUkRqbmQyZVRYc0tLc2I1QXU3NEdHbHdYNjZk?=
 =?utf-8?B?bXBiN292Sys5Z0w3WFVhK0ZjVWJ5YXdCaFFJYmNFTUhXSGozakJjT1JCLzB5?=
 =?utf-8?B?MU5uV2ZydmR5KyticTU4NXpHZ2RzOThmNWdyRUMxeVJrK08yOG9Wbi92c1Yz?=
 =?utf-8?B?MHhER1JxbTlDUFBsV1lPcXM1cHFIbVVnUjlhTm1vMTg4SHZlc3ZMYUEyNks5?=
 =?utf-8?B?aXNMSkdJdVo0NmdaNC9udVpNbU81RmQxWTBCUGkxRTFpUmYzekRhaDZ0bDNr?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q6FoNrjwNIEkhIWFJxjG+8HWe510D91Cjp9k59PsYFgz3lsV4YYepULB4KEUs452N+X2RcFQFaG14ZN/2M4VPPjOMhPCu05GVurrczlPKv/DjsPoTCw6zokwdtJhwsKyq1lXiDkRzFKhWnSAB1SlG4uwqTLBeBTIcNDxT+X/AqrjJjaITGucbGUJeu0SC1aMHT4TcwR+AUGc0du6hATEPawb+rBhhvoJXODM0Egv2bFOLDasPwHXOgcFqjZyjdop/mKqW8THVvBfhBHWkHx9W/LVN1t7es6n08GbVOVead+cElmBMn8fOetDY4jXdYjUatfwZljarbnwg3O8iRKt1GNDzrbPXZS8+6tzMreedztCCwr4wipDjtzeMc5R8sbDT/pvMBBXGZUf6HJ/lPgD7KNfUBodcPGOCKK75Zv6WDJFlwQY0+F1DGVjlXv7h93ZbX8d0i/MGUMxdCFhANSELomz2Advh+MKLmDHycgS7AiV6iTmesUI1jQ5BD9yMGB2FO4VS0VvzLYPHEmorkMWu+xSY33k1sKahiJtq+ZofLvJflR1fOKiBxAdIzIm4nKO4DO5s/5R0r4B0+cOHCWjKrwgRTWX9GB0/YQbMOZ0krU4l2qwFH6fXoq8YSp47UUNz4E83uqt2v8OZhU+hF18LL6xzKzCQx3YPLPO9xoyqgM2WcYTzXa95Zbg5ygboj3ElbvbYGKGqpY0NQ5DnhmbvW47liVTazH73PHqbFbNIZAEBVmKcO2pmJ/nLu9hHHmd191iH7f041lUOlbfp4ZZG0TiXnizW/ryr6fMP8LNq8VUXVqnoID2gcP9fXKMuUdE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7babf69e-4352-4220-091a-08db34f510a3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:12:15.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VskyNUKOAj7TYbTydjRfeNgcmcuZo8vBy1gpw3DTXdJL4lEkaMgr0gcsTGGk6D7LirKXy8LubR4XfmA5L+f0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5758

On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> applies to guests also when run on a 64-bit hypervisor: The "extended
> CR3" format has to be used there as well, to fit the address in the only
> 32-bit wide register there. As a result it was a mistake that the check
> was never enabled for that case, and was then mistakenly deleted in the
> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> CONFIG_PAGING_LEVELS==4"]).
> 
> Similarly during Dom0 construction kernel awareness needs to be taken
> into account, and respective code was again mistakenly never enabled for
> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> 
> At the same time restrict enabling of the assist for Dom0 to just the
> 32-bit case. Furthermore there's no need for an atomic update there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was uncertain whether to add a check to the CR3 guest read path,
> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> be converted to "extended" format (overflow is possible there in
> principle because of the control tools "slack" in promote_l3_table()).
> 
> In that context I was puzzled to find no check on the CR3 guest write
> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> of the low reserved ones) could observe anomalous behavior rather than
> plain failure.
> 
> As to a Fixes: tag - it's pretty unclear which of the many original
> 32-on-64 changes to blame. I don't think the two cited commits should
> be referenced there, as they didn't break anything that wasn't already
> broken.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>      unsigned int   partial_flags = page->partial_flags;
>      l3_pgentry_t   l3e = l3e_empty();
>  
> +    /*
> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> +     * understand the weird 'extended cr3' format for dealing with high-order
> +     * address bits. We cut some slack for control tools (before vcpu0 is
> +     * initialised).

Don't we then need some check in the vCPU init path to assure that the
cr3 is < 32bits if we allow those to initially be set?

Or will the initialization unconditionally overwrite any previous cr3
value?

Thanks, Roger.

