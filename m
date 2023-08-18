Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E988780C4E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586238.917475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzEk-0003J9-2Q; Fri, 18 Aug 2023 13:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586238.917475; Fri, 18 Aug 2023 13:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzEj-0003HQ-VS; Fri, 18 Aug 2023 13:09:57 +0000
Received: by outflank-mailman (input) for mailman id 586238;
 Fri, 18 Aug 2023 13:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWzEi-0003Ft-IA
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:09:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe02::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865b0e53-3dc8-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 15:09:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:09:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 13:09:53 +0000
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
X-Inumbo-ID: 865b0e53-3dc8-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyPL3ayX+CxoicYUKASER7C/625HI/rVCs/zQk/pKA0QeikhAftTwLf9U9CKRAbZ7jmMVXQyQxFFw9YecQyEIoplUQLS9+Q3CdtW73TR73hWqxe6W88LZ7L3+QRUWRrw8kxYuD2xKQN3E4tWTK46/TywvfX+0UrMv7gCzwAeZCearhbd4OLSajmJSRsOKpoWCA6Dm/fgVBPoQ8/i+DYeid57CdfTHkUEq0FschPg5h05XlZn0suoOfi5Q9lOLSh2Muxchmi04Un9LSfVM8CaqIp8nrb27jh5XCVMnawGDa+bFSR6hqsMP4GFWA7MiHmKBAf4C9ay347D4FQcpe4xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1LM/jT00umJMn9afHr1uH4Vl1oTiJ4uNS+qha4bEfs=;
 b=UHE8G9CQRK8kdJYgYFL1p+F8KWadRAGhQg07d8wb4MwHXPrmBMUad/Xm1kXZPkdJw1lXKFUtRaU/7JuIAW7oj/5ZaRDcm6Et+vZERTfc2vATnmVIfTFZ89qA6jUinUZDeHlyCUeXx86NKu9cdnS13S2aJNehivIAeqNQZB6edHgFzS9BCUdZHBrU3c1fml1/tGX7vLajBt8v+4ovtB5HA5QH2+5RWSg+qCzX4AthmqqBULCSF8o1JP0IjEW18xiHdCEk6diDBCCdkfXqX5ooNdPthszIdfkIGZTahGx6qqpwjGmYsHzRV0le7m1u2R5fNrCzeEB6j1C3is+L6E/r2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1LM/jT00umJMn9afHr1uH4Vl1oTiJ4uNS+qha4bEfs=;
 b=bH11rGxzcnm1vDxMIcWD/Z7WFjzkrfH47alzGH67bVLCdbpMLSDbR26SH2ksDgnn0DfbDiJwqw3hF4R0a6iy1IwUBAV41x5a4QnUk07qLO45aK2PEQBstE3yqZDn7hujTrB0AjtotCOBf75wkCFjfUZsclP1FI3943rcu/GXkZ7mjUTAPzdz9Wg8jfcK9bBoyAvbP8dsp05yirEIEms1AnhONEvyFAmcEa+jVK5h/RPQS1bTku1dEl5xEea/UlJPxmC+bY5sxAVJjmTt2MaE536jBhBKek08FCt++f+O8iLKcvYsv5OCvWfrb7GsqlcE6YluKk+Tii9i0zBOGX81/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c5bc145-6e30-4267-547d-e08454a126a9@suse.com>
Date: Fri, 18 Aug 2023 15:09:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] rombiosn: Remove the use of egrep
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
 <20230818125753.876699-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230818125753.876699-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b1f2ae-0cbf-4166-32ce-08db9fec6991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJbl9imcb7mErpEei64LftlN9jhEFx1tZySoP1bmo8ASUz7vQS1fh9KvEVRj1NEj9PKIjOc49NOYiUpNzyJe1xkx89ZUjUGJ4Zi2nOZ8EMVu7Pwb/e+p6EzSacJv/yl/4DnuoNdAEbqvdDA0LAPmEikADwvSaGrUHoLNfbB4P6dlbbThuqJ2UyokPh9nj8UyGII4heJzbLVf7gJcs7m8yz10f+kg5bNjjdkGgyZHXOLFFRxQVncisd25FiKOc6m47yReZCwdDhrQDmFEY6S3ypP4Cti0qPMNvYhqYVrHN3QpD6u4h5u3h2KF47B+V1sJ+LC+NFphpc8dwi1xUrjOculVf7HmLr6D50f/b+9XmbDVO3DMkdx9R2CcklBXE25L/hoIAoMlJcHESHEcDbSvuoxFOvatQoiD6tTKMGWvFH5RdX0IhcDN7p2/4YSzbD0f6apCiyfx+PF2NxDQabnS3LOM4g5DUmpPltAajyJWMdSBwqD5l37C39+r9IxHAQAP/M5seXxoUrM1p/2BB7tmJ/BXv3wOsrMM6HjRiHd5INgcmC9sD3eBHFIPhqGCP+Xwc+CJbTNAxMgmA9Pg+rCToM5+eO5V14WDXbztvzkc/805uzUOmXtkk6308ExxqRTtG/DlkFGlvf/4sXTqz2PnNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(558084003)(86362001)(31696002)(36756003)(38100700002)(2616005)(5660300002)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6486002)(54906003)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE9zSjBkNm5FSUh5cmxnbXk3NE85cFpGYUtIWnduREoxV2VzQnVDZlNFQzJF?=
 =?utf-8?B?L01mbkcxN2F6SmNjRW41dEY1RzFkakZnTXZ0cnBIZWFxQ3V3TlNqalMwTHVp?=
 =?utf-8?B?dTQ0WnZUeHNYQjZ6R0Q3Wlh2YnpqZ0N2Z2Z5dzdtd1Q1VmxUVWVZVktnRTRG?=
 =?utf-8?B?TUswMzFCbE9CUUZFYXhBT1Z2YTcrTVdsV3NPSkhGNnRmYy90c2JHQ3FWVG9a?=
 =?utf-8?B?azBkQ1YxWUdmODM5KzJaMUR1d2tOTjMxV1pwL0hKNWEzdEk0cjFESHp0VlBh?=
 =?utf-8?B?YVJIVFVlTjlsSUozUER5NmVYaERIN2ZYa244bkZVblpaMkZuR1ZvZGFObVAz?=
 =?utf-8?B?VE9Db0hRNEZQcFZ0OEczUGdabEtpT3M5cHdwTkFZVnNaUlV3KzBuYjhCSVhL?=
 =?utf-8?B?LzNOSVR1NitJMUdhOThiSWp4RWNOVGtMeWsvN3pkaFl1MlNpN2JCai9OVnpn?=
 =?utf-8?B?ajJmUDBkdkxuTTJackpSYS9ZNitXWENHZVh4ZkJtVCtFR1luUGJpMGZBRWho?=
 =?utf-8?B?REl5VzdzL2xjMUk0YlgvMG5DTk5iLzJUMGd1K1JNMFFuN1FqcFQ4RThEb2RJ?=
 =?utf-8?B?aWROcmdJR1grTVpxL1NKTTdSbzRkRDhmNWJ4OEowMjhsY284T3VPcHJtQTdl?=
 =?utf-8?B?eXgvR2dwWVNxS0RIQTZFR0h2TWFhSXVqcDdDVlF1Ukx5Z2tjaDF1bDlhNTFM?=
 =?utf-8?B?NlNVeDJldnplZHI3aDFGSnhmdGJ6bmNlaTd0K1Yvc1M4aSt5UVpLdW5SR3cr?=
 =?utf-8?B?bHZmSFRXY0Y2SGpvRldnMnNTbnRHTUUybFhHU29WTDloNVhWR2orMGVtMk1I?=
 =?utf-8?B?RXFkZGxUVHZ5NmkxV0ZoaGtHaXF6SjR5NGhHMEhLZDBWNWpLSU5GTGdkZ2xn?=
 =?utf-8?B?WWJiRWZQaEltUHM2bjUwd25pSncwRFAwaEMzcERwY1VGZFJVclB0bkozU1RV?=
 =?utf-8?B?Q2JWZFBZWXc2dGtlNHUxV1lTczFCRlVLZXhpQzdkaTB0RTJWQzRVbmpHWW8y?=
 =?utf-8?B?VEpuY09OSjZkdGpVaEJVbXB6cXJQRjdZNnVCSm5icll4V2x1TlJyYmVPdlVk?=
 =?utf-8?B?K1lGai9CcEVWc2ZMT05tTHJDSzE2L3NnMkVGaGtxbnRaV0RFcFdMa2ZBZkVs?=
 =?utf-8?B?c2RwTU5xZHhiNjJnSUcyMFBSU3pKMEt4N0VaTm5HM2FXZmFQRUFpVzhtN3Fy?=
 =?utf-8?B?V0RyR2duOGp1ZmdoWENKZm9ab1dzNDFtRmo4aytVZ2tESjM2cC84U0dLV2Z1?=
 =?utf-8?B?dXY2VWhvZEsyWEIyUUhYcFB6alkrNmtRUStsbFF2WW1nS3laZ0Rub1gralA3?=
 =?utf-8?B?cVROWGxBQzMzUzlpR3dpcVpVUldvS0VRb2sxbnRGaExXdFdnZmVQWlRxQnY1?=
 =?utf-8?B?OFgwaGx4OFBnYmRTNGxKd1FFdTgzSXIwQWhpNFM4WUtna3VKdXJqU1h4UGY4?=
 =?utf-8?B?U0JVaVNjWlBpSmhiSUhSVkpUMHE0T3R0OGlvYmFlaVJObEN6RlBDSCtMNFp2?=
 =?utf-8?B?eFpHU3ZjMGJMTnJZR3YyWEZHMnJURTNlWDNFL3IyZ1ZQV2czejFDTXA0TytY?=
 =?utf-8?B?VW1id3BpMnZqQzhDSVlUdnh3UWpJaUsyemJsMHhpQXJ5MmVLU0dYNzNBbTFD?=
 =?utf-8?B?UkpEaFJpaGVHU05MTjM4UHMzRXZnZElNZG1MUUhsV2ZJbTI0c09lV1hweFph?=
 =?utf-8?B?UGtabUxWQ3NCZDZWT0d1QWdFMTk5UlpXSkhRUHcrSVdVNXVvL1NSdnZ0K25y?=
 =?utf-8?B?dENaZFlaQU5peHc2eU5SZFFTdnMyNFhQSktWK1JzYVJJaFU4eUp4L1VhUkJ1?=
 =?utf-8?B?WGNPdVdLa2hZai92M0pFN3R1ZDl5U1g3am9UbW83c2ZQeVl4WGdZSGlYbDZk?=
 =?utf-8?B?Rkx4aXpBVjgzRm42Qmt4bmltYlpEbnEraWpVRE5CWjRROTU3aVRiLy9POWt2?=
 =?utf-8?B?cWNmZmdXbUFlOWsvMmErK2JXOExOZjJpeElQTjRkaUpkQmdyRVN0YlFtc0gw?=
 =?utf-8?B?UW5hVjNoVmJGNElRdlhtNjF1THVPZitiUVZqd1d2VnlmOXBqcmpWT0VHSmFR?=
 =?utf-8?B?bkZFeThXOXhJNDQwbnZ6S1dObHpEb3NDUDBWdWJHT0lHZGd5YmRNeXRaZmJJ?=
 =?utf-8?Q?XyX5Gy8/6r9j0aYL3oUmN37fz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b1f2ae-0cbf-4166-32ce-08db9fec6991
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:09:53.6688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4X73IAsX6brXSjUdIKtlCC5jbueuReHpc3NR839GeFNbbkSSgwz5ihOU893wiNhhnGLd7M5Cuw8jvldloIWxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429

On 18.08.2023 14:57, Andrew Cooper wrote:
> As Alpine 3.18 container notes:
> 
>   egrep: warning: egrep is obsolescent; using grep -E
> 
> Adjust it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



