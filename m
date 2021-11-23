Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA8345A3F9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229601.397041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW0j-00063L-Rv; Tue, 23 Nov 2021 13:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229601.397041; Tue, 23 Nov 2021 13:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW0j-0005zt-O5; Tue, 23 Nov 2021 13:39:01 +0000
Received: by outflank-mailman (input) for mailman id 229601;
 Tue, 23 Nov 2021 13:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpW0h-0005zm-VG
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:38:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5d8fa44-4c62-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 14:38:58 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-myyWeEvmPUedwNXvR-SHEA-1; Tue, 23 Nov 2021 14:38:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 13:38:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 13:38:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:20b:130::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 13:38:54 +0000
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
X-Inumbo-ID: b5d8fa44-4c62-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637674738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G8kYQyS6pVo8D9mWsDVVuAw5dww1IukbEx6tDtxm1kU=;
	b=S3higBUoFGSjw4XAb4GJl0xcKz+RBc5OzPa9JDVjyi7F+RufTIaQHuLbOHrqBuBsvh2gF6
	7otduiy5UpLL8GMg9rVi9WxAAejMDURJPFkAoFEZRBzyHBoMnvUf112SbaCbBL8VOW+aaM
	kp5x3FSD9F/jXkeXRWLcyxRYO8f3V6c=
X-MC-Unique: myyWeEvmPUedwNXvR-SHEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePjKaTlKKnmx6n7tHb7x0Dk9OoJw3mtwRJoSyWEoH5jwClaca/k1CHWShiMpt29zj1iXyyQ86Vy7OaI0ABiDFi7aXWXj5wwxm0fPCrzyjEUTtTfd8jFmL+mFTJYmBNY0w3rtVYHnBc3I4nLqkxSseQ2WrMLwZdFOCDtOXHUigKBrdSqbkN/YIz70BqpLLQ2YStPSTaCuxjwedDMhL84jly0piwJ3tDtWuFIidnv+OiJftfN51DGf08hh4Nfne4NpEyKCRqRP26+n4MkqnSQgN00cbLQM+oYTyRAjvJRtQFiFRN3hw7yFBQAn7ND5h6VKJdx6XjbyX+fZHnvf/yD17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8kYQyS6pVo8D9mWsDVVuAw5dww1IukbEx6tDtxm1kU=;
 b=GBLHlQFynVvWfZovl/8F+KS63oT0CUYytmQKghHw6ajKVv4GLRLgFaEH4QrRUCuV1TlDEL9Uee2CE96fHai8RVFN+uLEZ3oUUG3ByhTOB0eQNihcv/hTxcm9CneIJfKAR+M9Sys3VeS9B3z0DFEziowXiAzQv5HZARO5/g4AJErkS47u5gWA+1fl3+5oS5sSlyPqb0rl07GDNZB9c3pdiB57D6WF8xZyM+WpcZRFzNmaHhU5q/hhfIznf6evs4vZd+DOaptJAn7awMhIR/4htEdtC8eNTE6UlChlgaM/HfPgFP+FGhtIzF1NYLduTFBm/FcRCK1JPgrOtefdJrl+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
Date: Tue, 23 Nov 2021 14:38:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] VT-d: further small corrections
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9151d6-0a03-4180-1edf-08d9ae86980a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532560D672B7B1F947F7E676B3609@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SrNbP6XV14q04ombJRiBj7rU5xLAW4ZYPuV1zmnpv8DpUhiziyCxoFsR0mhC3dPv00+TCuivQwt2rgP50caGFnrcplHitgtXDdFAI7qxA4/vc9cMJbV/Dt+kxwDzJqnv+eEBPZ0d++alQbOjwYYD9jt7ittu58mStQn2rBHABdJqd6OQqLtJxFRW7Sl46e3dmof1Nft2mNW/11L8zR3dz9rhUWHo/MDQbRUgfBZIJ8DfneGwB5eNu94VPIkmTFOjtRj3r7b/3oNOeh3BiGuamQ3WPcZWAOX7PXPs5Lul1UZffuf22+iLLB60sWFwWGpAjoKhsZOW6IwD0XKYbXRf9xmPMRav88gbh7G0v+LSqk+I0Z8wcwl/gKVeBtJsC3QVoDjGz/5rImyJSHIIpuAst7MqE6Zdc4AeGlSFmYphx5cRlGcP8o7xZSWlwtHHFG+jQb+59+GI3T1bD39kIObsC6fMnbmPD0MABbAHOYCCgfHbp+yR3wgFwZIUJ3u4T2QkpS7To3fhqPwLBt1DgcJd250TyoU5NkfrZMkty61c7Ist6Jwh7aa7i0+kYnzeE61JpZ8Nghc2V5NyBWe5tmWveYNbbWIv651VwG/6n1x1kuksX2468abU7fZaWCtXzJbkNAxvAqbQLfVZpChuwM9RK9CfD/xSMks/zyo4bmMzC1mVgWiPseVbS4QvQ4o8I6CZce2t+UkIy2jLL5AjZvFZdNSyzZY6afFAGCl6kW0/Lhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(66476007)(4326008)(2906002)(6916009)(558084003)(36756003)(316002)(66946007)(6486002)(186003)(16576012)(31696002)(5660300002)(508600001)(8936002)(38100700002)(26005)(8676002)(66556008)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2NFQUJoc2lYNlMvK01iMEpXRmZUNFdheXIvNGZFZmxDcEoyWTNHbVNCTldD?=
 =?utf-8?B?c0xOeXdqb0Zwa1l3dnQxMUVFNTJTTUdMVklCekU1NnpDNWtieHF6ZzhDUnVM?=
 =?utf-8?B?Q3FqWFhTV3JXWjBITHArSm4raGRwUW1TUTUwdXhhajJ4Rjd2cUpJNWhJRXNm?=
 =?utf-8?B?N2p5dUZ6cWtHL2NSVUI2bmUwM3lJYjRQVWhEblB3OVFURnpjZFhNaVhtNWxB?=
 =?utf-8?B?UTZQWHpEMVVpeWJPdldNV3ZlbldhWlpvTjFjOEVRV3BvOStsOW9vbndsaWhH?=
 =?utf-8?B?Tm96YTlObmZsYzJjNnE4Qmh6NndpdGVVRCsrSUtXRXI1UlFWTm11UytobGt0?=
 =?utf-8?B?SVFyejg5N3pBN2hLOVU5bmVGQkduMmZSQmtvaTB6TjYwd3JJNjcxNmdCMWY4?=
 =?utf-8?B?MFladkpFa2J1ZGZnYTlZcTRWK1ExaW5ydldDSThNUDUzWFhycmpLSUc0ZEJk?=
 =?utf-8?B?cjkvT29UeXJTcWdySjMxSThZTW9wOTNScTVGZHBrSElEVG43ZGxPZW9ST1R0?=
 =?utf-8?B?Ym5ITno4OUFHMWd1ZkZxM3dUdmZoNHRsbmVnR1lsNWtndTUvbWFjd1Axb3hZ?=
 =?utf-8?B?UWRzMkZOTWVLWldQeHBuRm9qUHJ0YXFnQ1dEbXlJTkthWW5zVnozazY3d3du?=
 =?utf-8?B?U1ZrcWQ0L0ZTaXVIa3RaTk9RSUwvSW9YQzNNMVRjVGhMcVlTU2F1ZEtUb3dS?=
 =?utf-8?B?bUREa1NVK21vc3llN0w2MllFbDBIOFU1TERFZEZLYUlOZjB3K01FbGExamFt?=
 =?utf-8?B?a1pQRjhhZ2g1S2l4ajdKTUZNeGxnUEtWQ0swUklsbmZiTE9XeXJpNmtxQjJG?=
 =?utf-8?B?akxSYlM5Z3d2OG1EZkdOQ3Y4d2ttM2owZTFZV1Q2N2tkaHZJMnkwQ3ZnVisx?=
 =?utf-8?B?RGpWOVpDV21WVXZZRnl0eHRTTEFTdnpCckc3dDJVaTFWR0pPd05RK1lhUGtC?=
 =?utf-8?B?MVZtYzRKcGZadzRiNnIvMXBsSkVoN2drUUNnOUhUVUlYcjdWVWFjT21Pam4y?=
 =?utf-8?B?dm9ZWm1KWmxqT2QvSzRyV0NVR0xOb2hPRnlTOHYwQ2xpSHdYbjRPNCtrWHIv?=
 =?utf-8?B?MzJIamxUQUF2OXR3aUlSWkIvbm1oMWdRKzc3ZHdZNGVudjNDQzFwTkhCTGhB?=
 =?utf-8?B?WFNlaDB0UVJuc0MreERXV3MrL3NVK0dkNGhYTmNuTlhXVU9lUk1zamQwd1ZN?=
 =?utf-8?B?TUNwd0xONDNXS3A5MWJMdzJSM0lRS1NwU0tTQ2RJTnlSY1JRZi90eUtRcjhP?=
 =?utf-8?B?c0RrUzR5bDk3T09xU0lGandtdEx1a2JLeHVHd05reEJPZ2hVanFmVWRVak04?=
 =?utf-8?B?VzRwU3BnRGptSUtkM25HRE9ESEhyVWdGbnhBV1I2ZHBTSEcycUt4c2YyWmt6?=
 =?utf-8?B?YnY2bGdnT3h4N2xXYS9IMlpBaFlSOHZsb3RwVENjVDF1b0NXdjBiWDZPY1l5?=
 =?utf-8?B?ZmNNZEloc25FcmxVR3QyRU53czdHTHovT0srS2FmcjJwVEs5eUt1b2htSU9u?=
 =?utf-8?B?ekJERlFjazhvSFZ1VUFSUmIxWHZvc0FBemxhdXVYenhobmFxTFJPbnRPWTFt?=
 =?utf-8?B?TDVrTjdDeUszaWJHbEdXajlPdUFjcmF5MC9ZUWZHaXFnNXJ4NThycWJyWE5w?=
 =?utf-8?B?TkMxM2lTTXM1Q3NnU0JhV3ZKREgvUHNHL1FacFdsazBHUFYzL0wvTTQ3bWhF?=
 =?utf-8?B?VE1nOTVLN2p6SnVBMFZkYUh5cEhFLzdYcHpqMm9MajBENVdCOHF1L1o2S2g0?=
 =?utf-8?B?eUU1QmU3WGx1Wm1mcktERG1nbXdDRkY2bUJrd2ZwYXpXazN2djJxWEpQS2dM?=
 =?utf-8?B?OEt6VGczbTJ1RzE0WWxyRnp6UkFENk85RkpJWkZHWWcvZFVZYzdpRlZoNk5G?=
 =?utf-8?B?S1lhdG44V05vM2lRVmUvUjZ6NFZmNVVLV0RDVVp0TS9RemkydTN4WUlzY0lq?=
 =?utf-8?B?SGlVK0R5Mkl2V1dpQjVtOG95OUZMeXZuS2FEemcwZVA0b0VTYWFRRkRSdld2?=
 =?utf-8?B?dFdONCs0emhsTDhzeTVxc2NNeWhHZ0l6NEtaRDczV0hWSnluV1VGbTViMVV4?=
 =?utf-8?B?Mk9xbmFBVW5XZkw5VGRHMThYQVI2QTJJdU1nZVF3SzN5SHFzb3orSlhoNGVI?=
 =?utf-8?B?YVZjQlIyMXE1c3ZZRUYxRXFMajd5bm9JNDQrSGNwRDVHY2VWVDZUV0pFZjRB?=
 =?utf-8?Q?G6e0aoFSCaXZ8OA+Pir0wFg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9151d6-0a03-4180-1edf-08d9ae86980a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 13:38:55.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFXXGI7HZb2bPoTkE0cECK9FOZmaIFNTrrV02TTDk8LNpEr22sEI7GPKV8FpkYMow7rdyHWKstgK9CQ+QQUw7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

1: prune SAGAW recognition
2: correct off-by-1 in fault register range check
3: conditionalize IOTLB register offset check

Jan


