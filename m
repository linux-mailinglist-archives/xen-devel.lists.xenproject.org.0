Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D776969B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573014.897280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSGA-0006jY-8B; Mon, 31 Jul 2023 12:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573014.897280; Mon, 31 Jul 2023 12:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSGA-0006ht-5M; Mon, 31 Jul 2023 12:44:26 +0000
Received: by outflank-mailman (input) for mailman id 573014;
 Mon, 31 Jul 2023 12:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyhG=DR=citrix.com=prvs=569984122=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qQSG8-0006hn-LO
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:44:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f867b180-2f9f-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:44:22 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jul 2023 08:44:15 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CO1PR03MB5842.namprd03.prod.outlook.com (2603:10b6:303:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Mon, 31 Jul
 2023 12:44:13 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 12:44:13 +0000
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
X-Inumbo-ID: f867b180-2f9f-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690807462;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=emVDaaBqIiaQjKRu3X1nnwThapZcw7c8p021hUKDC84=;
  b=JNN9whZmaDgw4X9ozsuhrEjPhjvV+bHEx9RrFutWcbpk2dVTnStPyQpm
   4P7ZMRd/8jvkoY0fCaqEnIiBPT39ujpaJ2mrkHEZGtkgEEjpjH2JdTKKq
   zL8nH/KbkoecB68KA/tYUEtJi4AoJLMwBPJctTHnQXvPbMcyITudZYJAL
   Q=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 117999542
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3pp8saPxYnJZa6TvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUp31WAFy
 mQXCD/UbPiLYmXwKNhwbtyyphwOucOHm9I3GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5QVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rcwMH9Mx
 d0IEitXc0DSjsK40JKZSuY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwnKqCd9OTtVU8NZ6w0ed9lQjGCEfVGGGhfSk03SSBtxAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBSBRf5dDm+ds3lkiXEoolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9b0gbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:/+At7KHIyK+uOCB1pLqF7JLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhdotKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuJD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoR8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K8uZj1kIMsjgY1q3M4iFXBuYdI99eXBmcQa+d
 xVfYLhDTBtABSnhj7izy9SKZeXLwkO91+9MzQ/U4quondrdTlCvjQl7d1akXEa+J0nTZ5Yo+
 zCL6RzjblLCtQbdKRnGY46ML2K40H2MGbx2VipUCPaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXLhfRwg1jwaXT4WS6oxtBV5pB/tLG5TL33MTebQFRrl8e7uf0QDsDSRv
 72MpNLBP3oK3foBO9yrkTDcogXLWNbXNweu949VV7LqsXXKpfyvuiea/rXLKqFK0dQZoo+OA
 pwYNHeHrQx0qnwYA6HvPH4YQKdRmXvuZRtDaPd4+8fjIAQK4wkiHlntWiE
X-Talos-CUID: 9a23:xb8xe2NH5jS9Ju5DCW5W6kwkO9AfaSfAnCbZA0GoKURpR+jA
X-Talos-MUID: 9a23:GYhdwQaww6PseOBTp3z2igFaBNdU6qWUNWQAjMw8l5SKKnkl
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="117999542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdWa7fvBnA+Uypoccfsc6BlmPmSCYH43i1gKvP434zvPxzVcp8fPEEDoB/uRvGQK4FnFk5ARApjKDs1yvlK9oh+rQJwfAaPYUq+ZVvsMcO4UatWf9T/nLeXOt/ndtJzOp+hCwvPmk/ek0o1FuGCxib6rE1wVJuKeGrTHFbROXISkoUInlBQaDH/K8RkJ1D1gh77TlMqbB82ZA7h3otZw0NEvLQcSuqIBHGDKct85vukAszQz/ZeqcnRTRaFQI9VJ1vCYcJUrjiCHiuJIC70l3Kr7CNhL2i7yhlO/l3Bjf3yQoxYMl9vfB7FNQ6y3hBp6uuazdRO0xlx3P/6Pg6a3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3mYORBVnl9GVHjSnNYRrpVzPeNQcXTJFnKSyKmMH80=;
 b=EaDFa7Hh2A+gYP0wTCaZuGtiSo6wK6LLG+Taq6iID797FnCB6KievWJ2hAYwiIPYgty2EYhUlKXWO1s25EVYlzNFdSiWQn3xazRLY5ZdGp34D8CLc+TGgBp5Ywqmavw9x6k7DhSbTDAKyrd5CHaJeuiiMNCPR7oLsi5briKBHr0E/3GYQOmIsdaqtNiTWnzX4OalwMw1vUfto3iqoNvMziqirYyU7prNyw8IoP7cZmGR96jXsrTi2cIM3CcMAdkH7tVD7ySpRsks5p/znv9iP48BgC/GDpvLO/j0pfUcHzqRX35wVXRQ/E30oqJT52JCmaB6V3AKlb9sS0mWssqnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3mYORBVnl9GVHjSnNYRrpVzPeNQcXTJFnKSyKmMH80=;
 b=H1S9SFcyk58mjY4sG7jI6ypJ25ztiTlBJyQJdXLOZ1LK9cHSBAE4Y8++KcgnAwsZR3pzW0QW3nTW/9AH+jvcJdNwLyrngwP792NUoAMt8yWIee5D/BDv8NplDJApYB1L9gziS/4mJDcHsiY5EmjeKlYANfX2pplzMskxaxxZm54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <564767f3-73b4-57c2-0ae9-fb606180bb78@citrix.com>
Date: Mon, 31 Jul 2023 13:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: Fix DE_CFG truncation in amd_check_zenbleed()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728181730.3065977-1-andrew.cooper3@citrix.com>
 <de599aa6-f266-8720-71eb-a5425f9d098c@suse.com>
In-Reply-To: <de599aa6-f266-8720-71eb-a5425f9d098c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|CO1PR03MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc7c0ab-3cb8-4669-360e-08db91c3d7df
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tXlNhvbB5ARPC6Ran3kC5LyC28FgYK5kqcX7RkOl5XRPu/7/Zr/0V9cCp3Kqzz3MFeOF1IqG5foHDmZT18i/2mbF1ABGNN0agLG5/l9baNgrBhiKH2fjMn5zDDA6T69qxr/vBjPTKcvxsD8YI+b3T1ErpHhdpJBjFO0T71KBKifoKKG8OeMuAoHlKiEGp0uAxMIFQoxa9lCqgGtL+HuioN7OsxtqVe6Zg5ABnans2j9GDwM9xN7TzyXmr5JmYkg02g589AGHjKvDKNGK6olZvkKMwx49JbCVXQ/3/cJtICw1eUyz/BFbJHJUftxWAOdG1Zc7/g8Qdgjz5g3BI/F31fEJ+KmAsJBK9UXu0f5sD0S+56KJWNa0rqtgJZuCdLZlNZEVleam2bLZMvg7lHDqcT4cnmgCei+61icZU7GUNN2odHpEbhprquqQXBb4x9TOR/Af6RIHB4Lt0PWFmRi3JsM42/arxAQdFKdZLD2fJSilgamz0MvgS+7ete4m2TkV+MUjlRcS9dj4I+cdonH+/JpwyFYCxcj8jQW+Ao+CxQ3V8HIVSWtjlESo+VU+UUw5hToPnncW7Y5d4LNIzgLAuhMMId4f5xjrJJIAlEF606LTCtMglHsJX7z5JvhFbrG3pC832O+WbU44La1vzpuyVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(31696002)(66476007)(86362001)(31686004)(8676002)(8936002)(316002)(6916009)(4326008)(5660300002)(41300700001)(66946007)(66556008)(54906003)(82960400001)(38100700002)(478600001)(2906002)(6666004)(36756003)(6512007)(6486002)(6506007)(26005)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lEbkpsaVVrNWdsZW1ZbVFKMlkxaW5kNFdSVnBBUy9SWDhFQ2hzVHN2dkM3?=
 =?utf-8?B?V2p3Z1lGUExpcDNNM050NmU0SVVHS1hHL0xwejhlcHZrdk1VUTFHR0M3ZTNY?=
 =?utf-8?B?RVIxdmd6cGE3ODBnS0tDanVESU1lS2Q2US9lOEpyZlhwMmlOS0dJLzM3Vldr?=
 =?utf-8?B?KzJEUW5uRU5acGpxSGVCMXBRUnZqSllrTXlSb2VWM0QzM0hKN2x3U29oLzRr?=
 =?utf-8?B?ckliUTZnb1Q0RnBNUjBla2s2NXNKa1pCUXJWTkFhQUFCK1RDV2NRT051L2xR?=
 =?utf-8?B?bTREclE3eXM2dVhtRU1QcHhmL2c1QTgvb2huNm9PaTRqZnpGdmFwQmkzZGxj?=
 =?utf-8?B?czNhb3l0NmNuQlpGelVxcmVkR1JVaXBIcGJCT2pjQVR1Tlo2dlB0cTE2dS8z?=
 =?utf-8?B?WTQvRE5VVDFXRFVtckhrd2hRbTZxQTh1TzlUZEdmZm5hZE9weGRrdEd4Q0w2?=
 =?utf-8?B?b0c2by9SWWk2R0sxS1V2RFlHZGFWSW5pQ1NLemhnaW5LQUlPMU9seG1qOEhp?=
 =?utf-8?B?b05DQmM2K2p4TUFLMGp6aGMyV05qaTlDT1gvRmxTL2tYbm95MFlRNXZZc0c3?=
 =?utf-8?B?ZXpEUkgrM24raGFZWEZWTzJEaW43aGlwckVodFBMWDBNN3N2MUlJUUJaOUY4?=
 =?utf-8?B?b3Z1WEdVcHpCaktwb1VMRTRneEJuNzN4N3pXVzJKdDlyZ1R2RGJ4UVRFVGZw?=
 =?utf-8?B?T1d1UXdWY29oWS9Qa0RtaE13WW9vMTJMSDUreTBQK0NMWDNJNTZlTXdhb0d3?=
 =?utf-8?B?bW94QTBpa1IrekFVL0VLOGluYzMrWTZIbG03d1hqU2MzbjZIV1grRkg3dHpX?=
 =?utf-8?B?SjRKYmM4VWg0VWFJVXVyakd2QWc3MEQ5VVhtbk01TGdIb0NQMDMwSHpKajBU?=
 =?utf-8?B?WWh5eFpWSzViT3FRTkptYjAxRkxUcXFITzNxSCt5bVFDeCtibXV4SS9WYWlr?=
 =?utf-8?B?T2JqcTJBeEViUmlPQTJ0anFSblZXVko5TFBoWWxrN3JkSTdMZ1k2aW1pL2x1?=
 =?utf-8?B?NjJKRE8wNWJtSEF6MWpNRGpRem5HdDZwSEtyRTQ0VWtBbzJsd0JycVg5SVFy?=
 =?utf-8?B?ME1zb2NhODFJdjFBNjVUWitmcGZQNHYzNENmRTJwWml5WFFXZWVFQ2lZeFZU?=
 =?utf-8?B?QUMveWRFRnNKMmJxYmc2MDM2U3Y1QnlOS1JwT1BIdHBoMi9wQ1VwWHZJQW5z?=
 =?utf-8?B?Vm1lNWNPdUpIckx4T2M2SjFNUUZVTG5scnJsZFpMNGxlYWVCa0ZYQmxRZGV2?=
 =?utf-8?B?QmVpTFNkNHIzbmY2aXVPUzUyWE05aUgvM0R1YWhsMWcwQlhKVGJNUjgxb3E5?=
 =?utf-8?B?Z1dXc3hIeVk2My9MWUttTkpiRHNObGVsZTFpK0lYTmx4WXg2SmRxUjBHTWY0?=
 =?utf-8?B?L2EvQWJRaXVEaFpubjVucTR0blE2Q1IwRTc0RGV0N1AvZkNmUGdzdWZQQ0lW?=
 =?utf-8?B?TnlLNHR1cHlTdlJWbGlqRHZQdXFEU0V3WU9LOS9DeFR2aUpBZkJmQjhaZkY3?=
 =?utf-8?B?T2VHMXl5bEwrVStxL3ZaTDF6UThJQ3lNb21TQWorNmJjZW04NSs0OC80RWNh?=
 =?utf-8?B?aHRUU00rSUtPeFc0OUg0eDYxQ0k3V0V3WUFyVU5uYXZJVCtDckUvYVo3OTRN?=
 =?utf-8?B?S3QwaEtjdmhuQmk0anV5SnJHTHJvV3dpUFR6Y0RLV0gwamxyS2dlcndFQUd5?=
 =?utf-8?B?endsOUtRRFVYOUpWMDdaMEZmamFJWFdrb2haR0pST0NMRFpjUXdmU2RVNnNN?=
 =?utf-8?B?UUUybVJoUlJNN2RKL1pXTGk5KzRyOUt2V3p1TFJlU2N2TGtTcXVuQWl5ZDZw?=
 =?utf-8?B?bUo5bk4yT0Y1cEUzWGozUmdla3pPaXdrUWVSVVhyOFAyM0hsRGlVbnM1MUZy?=
 =?utf-8?B?WE0wUVVkaXJSeStmakpscTFHNlFnVCtiUnE0Y1cycVFVRVhUWUVhT0s2Tzdi?=
 =?utf-8?B?RlhLV0hxRWhvVkdIYklBOHYyTm9qakZObUUwdWJhbUtoSzJzbkpsMnhCMVla?=
 =?utf-8?B?UTl5VEtTd3VIT0RpRWlVUGNiSHlDbTJWdnJQbEQ5ZkcvNlNBTG9wYThDS2Q2?=
 =?utf-8?B?dDZNU3B4YXllQ0Q4elNaMnJNNDl3UHFJa2xEUm5mbFRTNEc2bFpmV2NRWE5l?=
 =?utf-8?B?SHdSUU0xczdvZWtDTHBlcDhOWU9nU0hRYkFkbzJUTmJmT1hNdXhWTDdSZEhl?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cvMC2R2cWuB+UuTWvfFzJghmtYHTdzUEkjIRU4WRorAFHmaMcnIyW39J75OgjirYxE2u8JJYakLX81DVSlR6ypREJaS1OWmr3LzeGymPTyOwtL/I9t7cpPTZxJi5xoleMqQrBYSK4zeQsSNeBbMsuMPdv/qGxYdFBGnGAJCHM/iLUs7UBfZXiPI2Dy1X5FNydUZZ0Au3NwYc4WOHQHjL5j8Rcxmrn5r/r3Anlyq9L7Ggy2N1w7DcyHX3F07ewzwmtdd3guqP3DddMc7f5EWuSoc4IJDOhizLjVMNVi8FBh9ssxrWOEKuCizYwivzUytrnzScOyye0Vsyl0oS8OrOAF6EBKQQcRrDEtD1/dikLPwc5HEJ30YjN86Rsd+W5lTIljdoE343aELqd2Xlm/st9W5kxeEF54Dqe/Zq4aiD9B/wdyrKhMfLjVksz66VZJMdgIin1HUEiraJLi6v4goAo6PNWAZA2gnqilJqhhgOuj6GQm5nNmHNGLB7Mk29X7/HuHlhHixM0CDKDacP9djj+4RMI2rBL0ju/7+qEyUd8b6zW43kPtLZYn22B9Kr5wbRoMHugnyq4llPwqrwF7Ug9w8NRON/bOSr/o8B5Ez7Nml2Gz1UaJJ9YRJ0Xszz48g4ChUQfkNd0LNlNJlhKO9YoXsEcAoNwVwpss7UY3G+aaW+8uJJumbwHiVHu4wDLmRUURU+O3mcCicnb6iRWYZjzUJgi5fva+RPvBtviDB6dZr6G6Wj4TQvGHQJdsz4IEgvRUgYlfrdXOy5kqZskl99gnFmDg4Cn+B18ulLAsJmhrqJQg85e86p9I4n3uXz3gHkrI/xt2BfBm8RQdWligG+tQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc7c0ab-3cb8-4669-360e-08db91c3d7df
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 12:44:13.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEhA4nw41f/UZWVYOzy+G/1cTLpq9N6aRLrR66M5GaozFRib/drc90RDxkFeRW5plvHXsrhMOlZB88c5zmIx/x5CH99VT1Oi++1MBFc6BME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5842

On 31/07/2023 10:02 am, Jan Beulich wrote:
> On 28.07.2023 20:17, Andrew Cooper wrote:
>> This line:
>>
>> 	val &= ~chickenbit;
>>
>> ends up truncating val to 32 bits, and turning off various errata workarounds
>> in Zen2 systems.
>>
>> Fixes: f91c5ea97067 ("x86/amd: Mitigations for Zenbleed")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> The choice is between int or uint64_t.  This is one case where the insistence
>> on using unsigned int as a default data type is genuinely unsafe.
> It is not. The (unsigned) type should have been wide enough. From a Misra
> perspective I'm pretty sure we would be better off using uint64_t. But in
> the interest of getting this in without a lot of discussion I'll leave the
> decision up to you; either way
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Roger asked for uint64_t too so I'll go with that.  Thanks.

~Andrew

