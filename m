Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F43B5D6F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147815.272848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpsj-0005jj-JX; Mon, 28 Jun 2021 11:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147815.272848; Mon, 28 Jun 2021 11:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpsj-0005hD-GV; Mon, 28 Jun 2021 11:56:53 +0000
Received: by outflank-mailman (input) for mailman id 147815;
 Mon, 28 Jun 2021 11:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpsh-0005h7-Po
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:56:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 500a954e-20a9-4624-97ab-bf0cb6f41bca;
 Mon, 28 Jun 2021 11:56:51 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-220yQRYUMeiEJVDoSJgngw-1; Mon, 28 Jun 2021 13:56:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 28 Jun
 2021 11:56:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:56:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:56:46 +0000
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
X-Inumbo-ID: 500a954e-20a9-4624-97ab-bf0cb6f41bca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YG738T/83EKiBaXdAveT5Gkzm8IukkHl6rYHF+zBInE=;
	b=U6KQfDapRu8cEsb1EY9ayxQi+Za30QzA3S85UMwIUWXJhH9efZtE4+fSf1mDTj9kItLRtA
	v7zFZ4Sx2jv34YiLUX96vTdsKKCGLsMw8SCKUQkJXh6aeBp2cpm1/tRG5XwD8ixXlZQyrG
	aDBbEB5PTw4Mw2tGcWDcC1aQbNN/JBc=
X-MC-Unique: 220yQRYUMeiEJVDoSJgngw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpzwyAClYEEwG0h3aBnbG6XV7lYVyD1k7/U3nhHkilN2puREUnCu5weI0S8rgNJmb+vytUy4U8I3Rbl5NBysZVoSZoWZC27mxm0zr4/w3g3nzjMDVfo+efQmX2Oa9zOUfNn4JsV3mBx3ytcb7jnwIgIN2uCY2egL+rDxjaZuzV/E+4TuZwzp1BRUh24MGT2CPZa8xG9UDY+W8wmky736LtVoXL8+5hz5a4UZil37MhZMZRyxsVl/1VSp5Glg4we72cTvMxKF16y6qgdkjtqaKDbXYw/EnvnJKfscCyv2IQPVG2LZ71/VyvYqm59Z75lS7n7JhMheLa6buEvo20q31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG738T/83EKiBaXdAveT5Gkzm8IukkHl6rYHF+zBInE=;
 b=Gg9jOFaO43JASpinQgLprkeKoG1WNca1pf8LStVXm9OoIRvxmGJG5+cSWU5FXFKd/mNKqYkAeQk1BUGa9mai/aplLHkb8IJRVWzTMVTyfg2t369Z67bMwCq3UWJmvWj7ZfVxi1sDHkcRuz0rnhpTxTzxvHobyZm8olEBVVdfT1d6EineOQY9GshU5q+YawrKNp/qtgX+G/89LJlsnP3G+4ZoeDyfqLbiW/85rIVibideYr4YR2nmzQxH7vWeWT9Gw2OzB4iDtMfRSFpRejbvEu9LiBvs3z9aR5/tjLu9YRH9RGTbN+foLBgtaByqOae2Yc78bnB81TOJGu/N+1Gn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/vMCE: address handling related adjustments
Message-ID: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Date: Mon, 28 Jun 2021 13:56:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84dfb57e-9d53-4eec-bbdb-08d93a2bce83
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686405BBF4AF10F30A2AB26CB3039@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xijpiWrO0bl0A42rfZqcJ+cAK/ouHUpjzaHm9Qft8QBB6M//BkfgYEs6DEVf5tQI6Yokacj8zMngh2NkPZn1oaGStZeRuz+zRwwPIxovtqtM85WHA+fS2HHqofZwKvwjx1m8QYFyUNgyo31wQ2MmUTdlrRRcNtH1ehBIB9vZ09Qpe+GxizfE0Er5RoFDHa9o+b+C4/G3VP0B6PImYmDohgITLUi1n00Nwwjsyo3jtfi77yN2iJYwmKrA/HlY5vjR+LNGhJ+9r5Fy2g8lgsubuSxQQmrrJICComyc4knG2gMVHzRReKXs/4jzhyRb9U4B1AUkQQOF0wv/5gKQbBHr3sZ9KPspao7BDoZuRPVrnUXn1VA7IU0Tq/yclqU6JW7KwKjG4hvM/7dqy2VYGFqqbVFlQmFNUNTdfeKS0e+O6AUTvAH29Y8V9LuDaJuhH0T17HGftdVES25PxDFSS5EOIh8FIPE2zaqHvciMSJyrRs33Gpqnjt0OZ0rDM5JSjVw3wNPcmN61I3qwrsnpKNUscCvygK4t1IXoyTzUvQCw1/nw1GPl6gYawikljF/6CiA0GPbGiDynu6yiTMwFoUyUXGNignZNNMZY6SeaLr+5ZHFPb2c3K0AMAP5eOqCsJBLzV7Nwhdj7Qf1zbJmureVH/itefHPDLxGxuYuqC6X50a1qLm+sWs+Upe2/iS9vT0cwv5X6xJsXanTwCL3L8XZokjsrYDfcJTWwCA2v4IfgUdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(8676002)(8936002)(478600001)(26005)(31696002)(956004)(31686004)(36756003)(4326008)(16526019)(83380400001)(186003)(66946007)(16576012)(316002)(86362001)(38100700002)(6486002)(54906003)(66476007)(66556008)(2906002)(6916009)(558084003)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtWUVZ4UFp6SVphUzFGM3dDdFpsNm5QZU4yNWpPb0M2cytBZExoSXVyUmts?=
 =?utf-8?B?RDFPZS9PdlppMENKWGVldWJJVUlaLzU5VStFQ1Y3MHNvZkpJLzRad0MwTCtI?=
 =?utf-8?B?SFlxL3BrVzBDTjhnbk8wUUJHLzhYR1Q3b0N0elNsSVJsbGo2WXlQTlBMVlVR?=
 =?utf-8?B?WUN1aFE3YkNVSjN5b29QQ0Q0YXZEeGM4aEQzRUFhM0FYTFRlaTB6T2xtdGpE?=
 =?utf-8?B?VXRaUFhaRXljK0hMTHJLTlExdEx6NTd6Q3JMT01ualVzUFBibWsyV0Q5VUVj?=
 =?utf-8?B?U0ZyYndXYzNBd2FRd0ZJbVBudUxMdXVhT0ExYWpBcGtRdVQrZktGaWFjQUU2?=
 =?utf-8?B?TTdKcUJ0WjcxZWhkWVVDWlJSN1hERnQ2NTU0cEpLRUF3Z2k3Ymg2d3RZSkUv?=
 =?utf-8?B?VTBoaXFJMlBoUGZyWXArREN6eTkrZ2xNK3JIN3FXU1EvVmNtY1JCZFdBbVFJ?=
 =?utf-8?B?dUVTMzZVZlF0SjNhM2VhN1dDMWlNUXFHOEkrQlpBVm9jQ1BaVkpyMC9WVkpU?=
 =?utf-8?B?R2FBNDR6RlBEQnhNaXJXcktUVnc4UjlzazJ5bVhSaC80ZTlXN0ZaVElJREpo?=
 =?utf-8?B?anpYNFRJWXgxMkZ6YWhPSjlxVjJVNFA3aWhjZ09Xd3RtcXg0ajE0VGtHVVJW?=
 =?utf-8?B?VC93V0JEL2Rkc3g2L1ZVQ2N2NVlYRWFMbTFjbmlaSDZVTnMrQmo4VElIS0M0?=
 =?utf-8?B?U3BLank5MWU1NEhJb2tRclV0aGVXc3pJeW1pTDhORkdGbEhIVUxkRklKNTBa?=
 =?utf-8?B?cUpiQ2ZIYmpVZEtVT1pnZXIxcGRqY3J0MzBsaXRiSlFlaG90SXphQm5WcFBX?=
 =?utf-8?B?T3drdHFtQjd2M0tqcVF0eWlGcCtudjFKaU1vdWZqZkFGZ2w4RmIvUTZKZko1?=
 =?utf-8?B?Szg0SWQyVS9kcVpHZ3NQdFREU2xyQi83Yi9kUUdhYXpqTmtWeHAvaWRMWVFm?=
 =?utf-8?B?SzN2bU1zbU1GSDNZQWZiR3dPSnRPNDJmVnV2N25iWGxIcnpuZzk0N2s1a29E?=
 =?utf-8?B?UDhTbEZkbU1TQnNCajk5N2sweEp4ZGM2dTdkUHdudll2UjFxcVJ0LzZvNzFj?=
 =?utf-8?B?UXB4RWVTZ082cjltVjliOSsrU0RwRmpnb0Y1ZCtrc09ncjIvMnk2STR1OHVN?=
 =?utf-8?B?UVJwQ2lyd09mZHFldHUyNWhzQ2greGpQQmRCeTNYK3gzaEFYb05OSUFwMVVy?=
 =?utf-8?B?UjdaeFNWMzVSUWlaZEdNbDhrSXR2WGJWT0JhQkhSQzZYQURGMXo2Znhnd3lI?=
 =?utf-8?B?cWt6Y2dNRXMzZ1BwcVlJT2NXcTdRUjFRTVZTeTRzZXJod1l2ZnpXUU90R0hy?=
 =?utf-8?B?THBTUmtoc2RHQlJOUWlscEV2WUpGMUcrZ3ZPTUczUmtmSkpGb2JEUjFYcm9R?=
 =?utf-8?B?MzJWTmZXdlhoVGRReUJSZlhYSnMzREkxMllEZWJlcUxBYTlwRDNza2h5YW5E?=
 =?utf-8?B?WURLY2tLUmZUTHVOZC82aVMzeVdvc0xyaUtIaVlaYTdwU3V6OHNsaC92aTNE?=
 =?utf-8?B?S2g0bnd3YWQrcmMzemhMM2o1VHZHVWtMTXMzcGQrUUtzdi9HazRDWHVWdE5n?=
 =?utf-8?B?RnFuSEpVK01mZkpkTWpDbFNUTEQ2UkZvODN4blpFaEtrRlVBSUt0S0ZpV0FS?=
 =?utf-8?B?b2MxOGZMbG5WZU56ZFpoM2NJNmhMMDc0blZhOW50OVVFb2pVdnlrM0VYTjNm?=
 =?utf-8?B?WnFUUzZDekhxRlkvYS9teWxoRFZVQ3lUa1RteEx6Y1c3MHdoNW1xK09hU2pj?=
 =?utf-8?Q?6/xTZHfI878DxWqgUBzJ8aYLilu9U3LS13A7Kr9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dfb57e-9d53-4eec-bbdb-08d93a2bce83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:56:47.3409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1q6tmhRKOwh6ha8njWiGJHJwiiN5XYQvj5voxjNLOt3x2VfKu+cnfVRIR1gKf1tHLFJmJf+7+EqI+QdNKwpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

While going through uses of get_gpfn_from_mfn(), I've noticed
some anomalies here (but of course there are more left). Patch
2 is specifically RFC, for altering the public interface.

1: adjustments to unmmap_broken_page()
2: change address space for incident reporting

Jan


