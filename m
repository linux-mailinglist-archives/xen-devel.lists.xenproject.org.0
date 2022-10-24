Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F6609FBF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428885.679484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvGw-0001VH-AC; Mon, 24 Oct 2022 11:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428885.679484; Mon, 24 Oct 2022 11:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvGw-0001SY-6t; Mon, 24 Oct 2022 11:05:34 +0000
Received: by outflank-mailman (input) for mailman id 428885;
 Mon, 24 Oct 2022 11:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omvGu-0001Ns-Rg
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:05:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c69eaae2-538b-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:05:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 11:05:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 11:05:30 +0000
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
X-Inumbo-ID: c69eaae2-538b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx4tswjuKJMlnTG6dMeR5Zn0Y+U04nYInz0zZ1iA3Q46ccUMmBb5MM/n/89FzGdsAub55DjQjmc8zzqUimxIkk5qd9djHTP005PkdaNT8S1QETSowpIRlNFCoUofsjIperXpXNAkBw92w7UxauStun5aQzyFsNEdUMrIdJJ49IkIE2jUez0GGip2pREw3eBLFtthK2PE0u/5fpcAIUw3KVcGRgosqc14lakJChCSYlyqYaDu8se78QKq0M9ro3XvFrjD5Cr5UrrO6DIvAsaYUzYQ9PpALS+34RzzZsH7F5T99pG2W9WVAx5Dtf6xWUvxp1bmD8ElYf6J01YCQkCuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlJe5/4D1oQR1HBU3dGXySyqrdEtIYFmOkx3OKuw93Q=;
 b=VO1RaaU2WahEiv2cGM8dUjcj15O3SzBhRMvWR3M2JfyYJY8WcQk6SKhc6yY1xTBeKceKH2j50XiBapT7wR29349Kpbp36223HGCMcAPtSLDSwQjYs456MnDKiZZYFBeySpym0EXBPGQbFRBIQFjnvhWWkR7EWDjKz4l/wpWNBjxvCNRepj30V44uv/ow7CkB/kc2uLMiIKp/mrR3MmXtUb7a4Xw1AZhnQC9MvL/3nsF62mLvH3chc8IT7ZqdrxDeOfhrZ1uaZe2oVeDpwb1W15cxkgUo5QeRynzgcUJVLKU1+ysP0cbd9VYc6mNIYOsNelcfVMGwnOqC61GnVR+q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlJe5/4D1oQR1HBU3dGXySyqrdEtIYFmOkx3OKuw93Q=;
 b=mTOksvQjN2i//S2S7r0L7ULfpiwVZvVaJWNXLZCE67Z8PuOENsDO8lVzeBUVjGPQ9blJqUkPh1BOUxHPRiRBF6j96M3vLMhGDC2afi3JF1yuREpl7sWS3nVbtIS1KMFPLeDu4NhkxG8+wwttFO4Q88V8upQDe2fdp3yuWOcn2V/G4M2EN/ehFvFAEhn1/NSMJuPaPCgdZk3mADrO9xi8ru+XUYq5jFqDf8NzheMANVIot7GEBsG6pobohe6oEQoih2LQUYXloC7ft0QiTegoj+et47xbV2uzMGGPxr1ukLvHZdKM4llAhwMZGAi+Fh6eH8LGgmB8YgZCDIWYedVM0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9e40d26-215d-eb1d-8a63-e0697c1ef164@suse.com>
Date: Mon, 24 Oct 2022 13:05:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 4/6] vpci: introduce a local vpci_bar variable to
 modify_decoding()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-5-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221020094649.28667-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 409c6032-9a83-4cf8-6895-08dab5afaa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DcW807AVH06+N6n2tYUlkRnTLxyVYUs4EHMDb8u/9abKNriw0Z5uj/qFTcGnCZyv8P+AN9VQS89C4pKkRzSJt3nMf8IWbkXSzXClbopG3lWdLcGMIN9QVSQaRsH7xfWvElGOBp9Y/OVO7Pmlxx/7vmuSwTFtmB2sF5bIY6yb2ByWdMHwcLLn8u5W4gww5Fp4Nrfq58ozweVtdJoL3GB6ejS0x0p69NkZ3R8HdT4gAsbwdX92NO8p9JYo21uWnlI+yGdZxsKrF+KVKtU5Vbxdr4bGHvsb0M2Rb1gn2eOnoREEBpsS7SLV7/whNG4Yj+70i/62577ZhQbk++cfwDN5o1MCAoByW8+G1Bcj0H4KpW1uDygPDKPNErMGFFr0gIRBmecpZ53bIgLRCNNzeUqijc2YEbxSU4w5ZFSHzhqqMyld4Wog4bXzNlQiOfyq4Cl/rGO1uFRGVRRSlahtOiqSjpYZOmuZ9ptsj79Z3zJBKIf4ZGqF3I/dF5lTPgj8KJ7vIT2/WAozvdr8wjGB0AlOCKdRAjokN+ePaeWyCcDM1ijW11AtCzjFvznKPoFM1Rpk3ebE+Q1d5ZOXmavvb46Qxl4+fkykmF+iJHxXmxIAoeT3j/AxSDuNGTOJ/n1K5hPUwb//38reinyRrndLVQo/lRr4u6pxVNC6Awv7yDGcEN6/vLDXYWyurZPgWbGCOczwnUFPhb77g/VwqDglhl/2QG6CcbBCFvdxAT3WrFx0WGQFwC30w3mDN5x9RdWFgVgJybemWmSfTyjCDaE6Ogzcmi6hgj99F0ZG9J+c46OLIPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(38100700002)(31686004)(478600001)(6486002)(6512007)(8936002)(186003)(6916009)(41300700001)(316002)(36756003)(66556008)(86362001)(53546011)(8676002)(2616005)(558084003)(4326008)(31696002)(6506007)(26005)(5660300002)(66476007)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZktlRVJ1QW14MW5TQXJaVHFHZHlFWHJrVCs3aG5INHZVUzlKdlpZY0NNN0tq?=
 =?utf-8?B?Vmk1ZlpMWjBuR0N1dUlQcGNKZFRQSm5GTjdJY3BpOGdGaUJRb3FVdzd1Wklt?=
 =?utf-8?B?T2F2bFk1a2UwL2MzT1FWNEtrSktXVGlnellzTGhTSGYxRGdRbEJwRTdacytH?=
 =?utf-8?B?QWRUdlBVVTBKMmpGSnVML1pDd1RFZzRWQUdkYXQyRVducDh5dUUya3EwY3BC?=
 =?utf-8?B?YnZvSWluNHFNQlo4aXlFTmRxMUtFKy91WDVvZ1h1WldOaDI5RXNoWVVhS1hh?=
 =?utf-8?B?cFNJTlpSMXBMK3pOVThtVzc5UlphbnIrbld5Zy8wZFAxQjVUL2wvU0tIa280?=
 =?utf-8?B?S0N3REFybG5aRkNxb3EwV2lNd2g5aWZxMXJZV0lKSTNzR0RVUUkvaTg4M05y?=
 =?utf-8?B?RlVwcXFJSE5VMk9ZRm9oeWUzazJ5cXJGaStUOTVoVkd0ZXVyb2Q4eHp4UitZ?=
 =?utf-8?B?QkIrNjZnWWlZSC92clpRNWQ2UXRUQXJiMDkxcW5MODl1aFFoMHRITDRJb1Nt?=
 =?utf-8?B?ZEdPdDVvTGJDVDJudlVIbHlialRTV0gwcWtkZ1JSaTFaNk4zWXlYSG5NcGhZ?=
 =?utf-8?B?TTFrdllQN292cnZjWG1XU2lYL2V0bUdLVU9uSXpleVVqejNvb2VGOEJxeWhi?=
 =?utf-8?B?T29LemNqVnV4a2NwMHU0RFlBVmxNYnY0cHdocUxwZ1BnMmZHc1YzTWNJa0Rp?=
 =?utf-8?B?NCtrMWtkMTFOcUVrNDU1VU1TcDYzZnBWd1RhTGMxdWwrUnhMNXdUL3dyZEdp?=
 =?utf-8?B?SEdFelY3TUV6TGV4UkZGMmI4WjJ3TFQ0ZzRvTkNRQXRURjN4ODQ4WTJNV3ZX?=
 =?utf-8?B?KzU1RHpzZzYyV0dmc1ZUWkVqQzE0Wmd6T0VIaXRkaDVwanZhOFVHNDVjVUti?=
 =?utf-8?B?Qkg0YUpkcGV5czhKMEdZRTNXRGRObndoM2ZzMVlIMTVvdVVnWFE1MThkTVFv?=
 =?utf-8?B?enljcm5iT25QcVBWQWd3Uzh3Z00zbmlQaDNLNFpQbS90dmgrNkRKQ21nbWZD?=
 =?utf-8?B?bkRmYzJjRHVFZDF4YnVHaDN2dC9wN1JERVlsT0w1eDVBT2R1OWZ0WmxyOHpF?=
 =?utf-8?B?NmNqdEJTNHA1K2xiZkNWY2RMdHo3ZGJQZ0tQNmpmWEUxUUdXbnpBd01OSTJn?=
 =?utf-8?B?K1UxcFA2RFZvTm1TOEJESHkxOFM5ZWd3b29KUlk1eld1LzZsSHg2N3ZOOU5B?=
 =?utf-8?B?MDhPNXdRbHRXaHBLRnRaLzU2U2I5VU1oM0EwZVFmSHBFZE40cXd6U0N6SWx6?=
 =?utf-8?B?aFFaMzAwclIzbS9OR2VUTzZUc010YytZYm1YWWczV0JlQXRTTmtIOE5sRnVy?=
 =?utf-8?B?U0M0elV1YTFnS2x2U1Y5Mi9FbVhwanE2eDNLZzBvY2lJNUkyMFU4aEVYRFFu?=
 =?utf-8?B?Y0dDQWcrWTZWajYvdlNDcDRjOUc0UW1WSFJxWmdSdmdYVlN0N3dRMm9yYUl0?=
 =?utf-8?B?Z0wveDZqT0dRaXp5R1hoU2lIODk0MHFCMDdrZXo5RWZDMy9rWkl0NVg0M1Ev?=
 =?utf-8?B?bndXQWtjY1MwK2dKZitWZUJUMWFSanJLK1dPTDk1Y1JhTmtmK0hNVnlwY2p2?=
 =?utf-8?B?Q0IvU21PbFNXdXZtUENxQVBVcitZNjhyVk9hU3FLeitGc2hEU3loSGMvcG9k?=
 =?utf-8?B?NHVJZHBFOXkwZ2RLMHR3UVdEbXdXNWZ5c2szdUM5TXowb3RKM3FZTldkZFpq?=
 =?utf-8?B?TGJhcnNBcGs3eFBDS0s1dy9yN05FQ0JFZURJTS94dldBbENlNHZBMzdiSVh3?=
 =?utf-8?B?RHBkdmJvRkk4Y2tTZHd1YW04N1VCeUh4cm9nKzY0SEppQ2Z6eVBMVjlQTVRM?=
 =?utf-8?B?blNFYWhUZ1NBSVR4bllhR0F2eGtkMEZnbHcvQ3RmRDNCWk5uZEU3VTFjUE9j?=
 =?utf-8?B?a0tyOEtvK3ZYV2MxNktrb3ZOayt6ZVhnWXRlM0gvUXB0RFNIZTUvSzhrT1J2?=
 =?utf-8?B?blFTY1lKeU41SWZXZTVINFRhREhPd0p4V0xlbnk4elAvQUZsUGNJWElBa3BJ?=
 =?utf-8?B?U1E2a1FibjhUTXlrQkk4bnFUWm5zT0c3VDJWMGtyRUE5NVMzQjRoejMxZk9z?=
 =?utf-8?B?K3dXbVFDUjdXZGZ4OXIxTEtuK0ZXQ0c1V1BBQlFGVkg1M3dNUVhLUElaWDVZ?=
 =?utf-8?Q?dFZpa4Jh4zzbmSaacMsfPv6bh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409c6032-9a83-4cf8-6895-08dab5afaa20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:05:30.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1YYn0Rl9QgeVWeLxoCVQfjO/T31L5QRZNNKU/4ijcm5alFhtKvRotjEBHsgUWoxI+QAi9UoFbApLD2dE6c/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On 20.10.2022 11:46, Roger Pau Monne wrote:
> This is done to shorten line length in the function in preparation for
> adding further usages of the vpci_bar data structure.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


