Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F5778569A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 13:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589162.920939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlpk-0000wZ-KK; Wed, 23 Aug 2023 11:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589162.920939; Wed, 23 Aug 2023 11:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlpk-0000tP-HY; Wed, 23 Aug 2023 11:15:32 +0000
Received: by outflank-mailman (input) for mailman id 589162;
 Wed, 23 Aug 2023 11:15:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmRg=EI=citrix.com=prvs=59206e676=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYlpj-0000tJ-Ap
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 11:15:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cc17b1a-41a6-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 13:15:28 +0200 (CEST)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 07:15:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6737.namprd03.prod.outlook.com (2603:10b6:510:114::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 11:15:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 11:15:18 +0000
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
X-Inumbo-ID: 5cc17b1a-41a6-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692789328;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o/F9bkKD7/DO9J11db8imjUM0ihY77zWC3Jux0z7IYc=;
  b=MFxZhY7/V/7rYf2nSUfw21DaYh6VIF9F60fgSBHOaSDEDH/tID0zF+x+
   cS/eM1OgkJX+73y5hStiUDhYY8u3UgBx5yCDQHf2iArjqgp8FSIIi3erj
   SgFc4DdGrqxBLQawq9ZkxG/u2UTTTKj/hZogN4L6ibV7WDMo8t0nMbw1D
   0=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 123061752
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EBVCgKNpyDCpqK7vrR1ylsFynXyQoLVcMsEvi/4bfWQNrUp30jcOx
 zMcDT/Uaa2KN2f0c9F+YYXn8ktS7Z/UmNM3SAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5AdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u11Pl9+9
 MVHEjwQMh6gmNmExfGXZPY506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujeLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj33rGWwn6hMG4UPLSa26NB3Qyf/EU8SwNKDFnqhqKL11HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8ry60fy4cLmYAZCoNZQoD/9Tn5oo0i3rnTdt9Eajzktz8Hxnxx
 SyHqG41gLB7sCIQ/6Cy/FSChi32oJHMFlIx/l+OATrj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQQ3d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:8AEPZaH4qcTMm6KNpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AtLtJDWj++SL9ktAE+6W3LHR/NDJueX/i8kfRGhC?=
 =?us-ascii?q?CBXs1Rp6Kcm2Vu49KjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgYkpdQxvwQovahQ0oBgQfu1xETiaqK2MJR0mzMQ?=
 =?us-ascii?q?KgeCrdjIsYjXMq2+FH5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="123061752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilgySVASb8+3RFCBooJ2e87XybfHw8Zl+WeADUE2XToFciodyPj7mZ0zj1dEiCeBqr6aRAsuYtU8eSa6GvybZyD9vkKtZhMLYwp2bzf8ckvuRWQHEfOeFVwlbz0DskF1Gq/odcNtZ8rgwFTVKmeOxql4KOhsnhZyDp9t2G/YUzq62ssWl5LpWJL83QDq9qNMy3IdnMA/Jo/qycD0hIbM4eUj1Mp/GJAQKwrFLIV+uzYnHJiupLE1PTCtZaxKlzVsah/canLod7eoEYeOrBPvPwTQm/z+W2chnbg2BKQTxlQqinYaThtsjQ/b6sxSQLA2/Q4uOSny1BWoEyF7r+lQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJOSI1bfhk6CvcNHgIETlBtsvAZCk6pCYtSawyuL7E0=;
 b=KwvLhGGHgDYFc62zVt+cKtdJC6BEuNCalNI/D5FgFXhFPcKr3ihYXqhy+1BDNNm9CoKJSMriqNf6evBM00+qvWCkW4b1wgrDjlqUC9M+32RGxILU4nTTlEMml0dqQYH8J8HdlH0XRJjDt+iO5Se3gwuYya8GP3YMCONK7aIbZDCqD5OtYiq9vSz8CE48DJnrfIbnuGJKd1PcUnmUrpvXbjWsy0Wdzn2eerSyuLZbEVmuEJcuIoc/m5IfcIdAE/655BkAPtdPc+AZp98n0nas/UXww5UjRH3ARKzjxQcOhBswzL6vT9PVZ7GUkPK10o9gsNkeGpBzisfnc9M5aadTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJOSI1bfhk6CvcNHgIETlBtsvAZCk6pCYtSawyuL7E0=;
 b=l1NMoQqncHFjRYBnfGmKFzNa2ZryXYFhU1QdSSZGzGbMOyjWrDeCe1hRTd5FlofMroBjiHKwBVDbIi7/7iNzQUwc0emElCoQRAupVUBJkGNrjzXGa5evUwng+o0OOGSkxecLcsTzulRK0yBZ8BcOwn8GiQ6jQb01pHfwsOgu1Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Aug 2023 13:15:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before
 re-entering guest"
Message-ID: <ZOXqQrFOpofVR_B3@MacBook-Air-de-Roger.local>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc885f6-2ada-40a6-8b45-08dba3ca3bc8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dJuNDXa3UG6GG3oAkhCnhBtBz0s0v9+k0cnn7fXa2B5mhFSO51HPRfuSkkPhvccGZR7nRQrU2NFMIH98+HOrDG++0q9aBboj7m2g3InH4WaEUkwSC0pPII4b+4pW3zIDrrUFL9n3HlotTKUhjkpLYlJslBz6Xs5/VNwkKvf7r2L9rumUc3MVtLLWi89LCUbWLJ/r6PS2Oy68Q0qIvEJ00SZOUWAkPI0BS2toNuRrILw185swr+hKKJRS3f7pA7xxOTHUeszvOM7GqZLROqzP9BU0cC0rMQBRDSI5xtlTo2FXHk3pVYN9vgH5ORfb7OKs4IgkMv0tFciKXboahfWPGhI6uTeQWIwdyqZQCINq7a2bCUWShPF5halRAfraBexEY0Hq44Avap/cqPD0o7/m0Kvt/zEx+9LCx4YryRR5oehH3yetmHI/ZdrLD3mICX5Z3CnG39qZfFNx0q0edMq3ZuxvGXZIgY3bjFaGciK9lzzVHXnnN0yaI6Zl/I6NLoLKKjPjShIOrDid32EBTMADWojoFaQ+fNC5CHgIIRvq9FTVj1kIpsCI0baTsN4x4YB2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(366004)(376002)(346002)(1800799009)(186009)(451199024)(54906003)(66476007)(66946007)(9686003)(6512007)(316002)(66556008)(82960400001)(6636002)(8676002)(8936002)(6862004)(4326008)(41300700001)(85182001)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJyeE9OdHdaY2tRWHlPNlYvbzdlWDZONlNEN3I4TG9oVkhXV2JacW5EUFB6?=
 =?utf-8?B?RTJVanZLOHJyeEU3djNzNUFEMmo1aFdDclAwWHMxOGdZd2JCV016c2ZaT0lB?=
 =?utf-8?B?YlAvZUMrNjZvUDJHUkJiS0Z4YmZKVTE5UmJFYnllZWJvbGZiK3EwOXZQblhP?=
 =?utf-8?B?Mmx1RXN0RVVUVjI2c3pUZHIvMXpTNWlubGh4TEpuUm5FK3pYMi82RHorell1?=
 =?utf-8?B?R3lWbWQ1SHNqMGRIbDBlVDVWZnQyQWJzYklhTHlYTmNINDlyUWlvVllXMDZS?=
 =?utf-8?B?bFFGOXVPMUltTGR2Y0FHT2tjR0FLVW1hWHVjNm1JYzdlZ2ZiazgzaW04bWNX?=
 =?utf-8?B?bW9PcnZQNG1xRytiRkluVlRyOTN5VkNoYnRXUXFpWFF2eGRhelZPSjVtWmdu?=
 =?utf-8?B?aU56M0ZRL0xCeFYrNzZRWjVVYkFySjVyY0RweFFqUGptbWNxU0hDdUduMllD?=
 =?utf-8?B?UEI4cHBQOUxsTkFOdjM1bE5Uakt1SnlvaTU5SDhCOGx6WG14VElZaGtpc08r?=
 =?utf-8?B?RExNTW96ZDA2bGVzQ3pnd0pwUk1GNW14OWVFVWg2Si9HUXgzSytTL2VSQ2Ra?=
 =?utf-8?B?bWNlNXNra2RWTU9Sc3ZnQ3pMbDlRWUVFY3ZDNU5FZ0M3WHM4TTZQbVk2Qks5?=
 =?utf-8?B?WWpMUDgzOTZML2VaeW1QVVJ4M2F3bjhQVnVwOHl0UjFGUVMrTG5qcUVxWWNr?=
 =?utf-8?B?d2VZd2IyTldBTHFRN2s0VWRvYTVFSktuQVNqbENKYllRUmd2YXZwSjlOYzVV?=
 =?utf-8?B?a0lXWnFGclR2MFc0MkNyaUo1cUZHZml5cGEzcGExcGJkb2NkS0lOVkFiU2tS?=
 =?utf-8?B?Y3hObmp4ZVNDSy9RWGF0UmpKSmltd3FuckpGQnc0ckRmUEhXb2E1NEcxNXBT?=
 =?utf-8?B?RUV3azhJR2ZsS2N0d1ZKSDlCNnNzdmg4MmtuaWtncGZEb25lem5QV1FFTytT?=
 =?utf-8?B?M1pEbmJKUGxlZkRSNHNWVFU3bTZuamR4eW9QYUJvS0tSUFNTSWY0ZENDNXNP?=
 =?utf-8?B?VnNMNHRKQ25MQ3g3aW5lc1R0TFQwVjlUakdDZDRpbEpMUmVIVmR4MkhuZkdL?=
 =?utf-8?B?TCtxdXRKME4vTGxRZlFIem5BSm1mc3JnTEJ1WUFzZ0FESldyalAya2IvRDdi?=
 =?utf-8?B?TDRuUjRqL0NvalRpRUVxRVdnNEpjM01mOWVIbFVERzR1aXlGVy9qdXZEd3Ev?=
 =?utf-8?B?UmZzaUpuL1RMeGRXckVZcXdhYlhwK2dhS1FyWjRvQUIrQTVoMGFXM2VvK0Na?=
 =?utf-8?B?Q2JkQnU3akdJSks0Y0VxWDNnRzEzbUk0Y3JoSXhrWjB4QnU5NWg1a1ZoanBa?=
 =?utf-8?B?ZENoT2t3UnpXUnRxVW9JejM1ZTlBbHZkYnF2Y1B6OVZrdk55Ti8vczNXcnd1?=
 =?utf-8?B?aFI1bVhtSTExOUdUalNxOXFCRktlamNvOFJ2U1Rxb2Fna1lkblAwdDZSZGVy?=
 =?utf-8?B?TXNBd01mMXI0K0I2dmdFb1grK1MvUW1uYk9OZmhidjVQMjFvNS9sdWFlWUVh?=
 =?utf-8?B?R1ZCSE85OVlwM3hWbDRnL3Qvd0ZqMTFUalZvWk5ZU0xIMkpJWUticTRmYnh6?=
 =?utf-8?B?RWFFaGpuTlh1ZmZPYzZZS1lzZDdnTTZxUjBZcG1EZXNLTWp1aWhwTEdTL2U0?=
 =?utf-8?B?NHZ5Z0hMZkY1NU9sWUY5aXpoOG5DQUZCcitnSFk2Z2sxWGRBQ1RseFIxeVdk?=
 =?utf-8?B?ZFU4eXF0a3hsTXZTUGkyQjBGK1lMNHlRTVQ1cllpeTZXQTFDTUtxN1JScStV?=
 =?utf-8?B?c0hTRk0rL2dVck11OWhCbzNQbGZyOG9FQXFuRXRaZURzUkJEZWoyUFFOcVJY?=
 =?utf-8?B?QWVsOXJ5VWZqblF0Sy85ZVQ4QU9yR3JicDZsZCtLTHo2d1JZYUc5VDJHL0hv?=
 =?utf-8?B?KzNzWUEyRTlvd1J3WFZjQ1VVbTZVUWlFdkRQaEZYdjVJcjNzeTFjbnBwNmp1?=
 =?utf-8?B?Nm5ITnMvNnFQRXVuRmhtNzBITE51WUo5UEM2bW4wOWhDRG9FamNONEw5b2RE?=
 =?utf-8?B?R2EvMGM4RVM0cFZ3QlJubDZYbU1RSWFkaWt1UG9QWVlISEZudzByeUNsR21Y?=
 =?utf-8?B?TW9YTTc0a2pDUmJBMGNNaGluUGFNVThNQU1GMjJyNitWaG9BQUV3RFNwV2hx?=
 =?utf-8?B?a1kyNWFnSG04UEgvV3YySTJRR0RDcSsxNmFlSkR5UEV1bG1aeXR2RVg5YnFY?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nJ/4SAcYUZTtPGdEX4ICqajksFIs0zzhhFi7cc58J9qEEDEjijm3Cl1NkB4Rd5hmyetymMxqMLVnM/SZG1GYaOGvRC943MD4kPymRxOy+//Gw+ysa4axI6JSp+Zw6ljHFI611X8u3v/ENmOfOybAhyCvEPNKrG3Sb+VO3VZ9nHtZjAKnDxuLqLna9MhwiDBg45FKBdamQXlz3+Mvfi2dzpvdGwfqFIUkpv9FDKJqrBUxvV5J8/3FhVAWhxEGep4zsmm4ccAGAkADw0Wby7k0HpAzW/2IgHu8zhwxL7FVAY3AK+asnbPVKqgsvKzd4bAiEf5JNlaJ/Mgl72wz8dfGZAe3KD5gwiX4OGQQcO580CqO9mTMuXjDfYrV6UWjNoc8hBK8+mvvjMHGPLHn27azYQTXdI67gpMFy5JeqycKhO7qrFmGy3hgGkd+EigGM400tcEbMzbEdaDUAi6iUrfGcV8xrneooXTodZqlFd2qmLd4XvuLJELb69RNBZpi8E6CT6LrGrrDKT7E1KY4bkY9Jd3rjN4z6ksbyHshlckfNJ8UevSDlxFKoQ/fcGRD21AT6BUc5CIgcE59IugoIslCFX69uhMSdu1fx3Fk8WCgLxkWnU8wwVKJX8jJvwXMim13n/b7kviSTj/YVHwTu1FPXIrHzzusoLzzxB32BkTB7BSJ0ESsvpM+tWg3/ywKt0YFzjmQLOXuT8Qu5SkiDlKCvpZm9UH9Q0Xf2uf3UweayG0jJgQm1lMdaT9DPdFN4Z4DsAW525XKOtKL8Od+zD/44JaTGMX9vkEStV8FZDzZa5WgIu6d97XE8tstAMHYQHe2LaeASOA+C0LWzk4I8Od+Wa7JYXX5+CAuNxRVz0CHAK8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc885f6-2ada-40a6-8b45-08dba3ca3bc8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 11:15:18.8088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3RYZbfc+yKiuzx+pnAeFq169ydqDQj32lVQ5G+S07X/vz+Go2cK94WXRBMrEsUKR+J2kdGzpTcxvgucJirldg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6737

On Wed, Apr 05, 2023 at 10:52:45PM +0100, Andrew Cooper wrote:
> At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
> would load arbitrary values into %rip and putting a check here probably was
> the best stopgap security fix.  It should have been reverted following c/s
> 81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
> behaviour.
> 
> However, everyone involved in XSA-170, myself included, failed to read the SDM
> correctly.  On the subject of %rip consistency checks, the SDM stated:
> 
>   If the processor supports N < 64 linear-address bits, bits 63:N must be
>   identical
> 
> A non-canonical %rip (and SSP more recently) is an explicitly legal state in
> x86, and the VMEntry consistency checks are intentionally off-by-one from a
> regular canonical check.
> 
> The consequence of this bug is that Xen will currently take a legal x86 state
> which would successfully VMEnter, and corrupt it into having non-architectural
> behaviour.
> 
> Furthermore, in the time this bugfix has been pending in public, I
> successfully persuaded Intel to clarify the SDM, adding the following
> clarification:
> 
>   The guest RIP value is not required to be canonical; the value of bit N-1
>   may differ from that of bit N.
> 
> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")

I think the fixes tag should likely be "x86emul: limit-check branch
targets", since it's that commit that missed the revert done here?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

