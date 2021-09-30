Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1541D99C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199807.354080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv0Y-0003sp-BI; Thu, 30 Sep 2021 12:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199807.354080; Thu, 30 Sep 2021 12:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv0Y-0003qX-7p; Thu, 30 Sep 2021 12:17:50 +0000
Received: by outflank-mailman (input) for mailman id 199807;
 Thu, 30 Sep 2021 12:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv0X-0003qL-9c
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:17:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c70553a-21e8-11ec-bd4a-12813bfff9fa;
 Thu, 30 Sep 2021 12:17:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-G1tPMFA8MW2IYg9YuyJBTQ-1; Thu, 30 Sep 2021 14:17:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 12:17:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:17:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0046.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:17:42 +0000
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
X-Inumbo-ID: 6c70553a-21e8-11ec-bd4a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jj8pjeS0x7GY4bohbvuUA6qEPFJfyqs2go/BOwB/66o=;
	b=erQoTiFQQ7lZIT/mDXn89ISLmBA/09g2nITSZUK2yN6eZe+M7tmOnFobh+iQ2VAOeuRGmv
	off3+vTUAUdv3PDaYahHWU1PKD7KAHs4HNcEQ1ZwlW4/M+IDnp1bpSDCzWmJEhw1wVn7cu
	RRswFdn7BvG25WT07kUpwE0GPX9iPy8=
X-MC-Unique: G1tPMFA8MW2IYg9YuyJBTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbxZpEUsDAdXvRQ7u7cs0XjXCHpZLlYAstjkIWokH2Uw2HpmXwLCgre5MCiSHrYswACwVCyX3OaqImew6WzuG8932/ds/6QFbLIx31kYsP8n5UoZN4NKcQ4d1htk2Qb3GPDHxIxTFuqFrvUJ+JTnrfnGdi9s3l5xDEyJAOUtbUCQzKjtmwyJw3Cm1LeWlgmQgfJ3ifFDpyuO07+VJaWv0wJrZBm5P+2o+yNpzxSxYB6y5VinvZpP9GMJ1moARkpI45HLmksUMgU8bb5t4WMY6v/uqOHWj1GlyEFnLBTZxw510iaOyRqXsIzWO6btzmJ+teO/8xty2DtWGsphDG12jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jj8pjeS0x7GY4bohbvuUA6qEPFJfyqs2go/BOwB/66o=;
 b=GRNB4Ttas8nqohJVyWXNL7BwKR0m+O/QHHbuL19QldlXGAyxuAUUO98Q51VgRLfAtjwskKALqKZC6hd+LGVx11rYFqJjMVL9rTZlqmtvchYzpwGApibDt3UQaqBaAAU7uApEGD32s5EtnScE19/MC8j+OYh72N40OkR5QuRfsk6Efv53Y+YT6rfok9YW8dXsfdvVNYQ7emkcTSIUTSByBduR1pZ/6AHAg8g5THahGYGYSCv1FugGpTGy5yO4A2x68VuGzZc/zG6MOrxJMM1i/CAA1WLl5XE+Ps6ScTCxOE4sCPwNIJxEdmPz05cYME5tfideWtjHwi+0cjTIvk/MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/9] xen/x86: make "earlyprintk=xen" work better for PVH
 Dom0
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <4fd89dcb-cfc5-c740-2e94-bb271e432d3e@suse.com>
Date: Thu, 30 Sep 2021 14:17:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0046.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 470e41f3-34f5-4da3-c49f-08d9840c4df2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038C0AA781435D480EBE6ADB3AA9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Z41bVlnytrFRDAc2UAQ0vwr9ncaX4vNdRDM85qp6xJt1yeeUqLLhaPoIHBSahTy6W/d43yTef7GErIsnG/vdVT9ZemeJcYjQG9Ry9sTWsHIR8ntzhiokKjiQ1wdjpYN+eviPToDFfsgvtaWhzH00vNd+YlgQwXWz1ql5EbeTbGXFk1KhDQtrp/mUabjJqlZoo0DfHqXlsOUmxnHwcSPXP60Adlt2Lq4a+vUsexQrUf5f+WOnh7nxC1fNt+2WIC7tSSUTwp6zJr5wV3jJHRjEYvnQh8poZyCMekW3jKnOLoVCQipiDv4uF5SfsQbG4blPff+8zWtYEPRilZN38ArZ8wwIgrUsS036G7nsvjotY1ZQ9MhWeiSVo6Ldl5+w0/vF9xcu5KN7IswPZ7rnIA8xSbhchTh7s48+lxJQ8wb9ezs0QdsTLwH+aQfBBtR6wUbpX7t0zlyMtPKXEPySDZlfdIOn1Tp1glLjxMZ/j5UNMb2sGwnSnotGFDcWMQtSd3uK7cug3DeSTUzR30wPdpxa6sHuD8kY62WOoGMjHNK9XO23qXc4IdUjp9hwIFNV7yBGtjBMT1W0crGRVwFOOIciMRbkVqWMBlKVF82yhWr6GNgBE+WXlNvy4IbqNQ3R6ORwhmUQMqGwmUg9xkmV1+o6W9Yo53O8vlFYQdV5+dwIOxP7HUMglGEA2uF9bUfJmmOAhgMA7rY7ofm2tkDCk3v9pC7vCVgWgIa6Q6TSpwF4lcy59c1tNl+PQpYCkXKNp2o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(8936002)(31686004)(110136005)(2616005)(316002)(186003)(38100700002)(26005)(5660300002)(6486002)(54906003)(4326008)(8676002)(31696002)(16576012)(66946007)(86362001)(508600001)(36756003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2l5Ui9veDJHZjJsaU1YcXNKQ1NCUWl1b1hjRXFUUTU3SmxzWTZjZCtLTW85?=
 =?utf-8?B?bkhWMnB0MkdVUkIvNmN6QkVISmRqU2FES3VNWm1VaTcvd1JMVGpxRmtDb0tL?=
 =?utf-8?B?T09kNmgrYzJLaGlJNS9GMEFESVVqYmFrVFpucE1aTk9RRjlvOG5ra0xVeHQw?=
 =?utf-8?B?THp0V2lGZG1uTVo4UGNZYW1QMnBYN1BBWnl2KytEczVFbzErNTZiVUJzUVdY?=
 =?utf-8?B?d3FBMi9Rc0Zaa0JEN2l3ZUhuTVk4ZEl3WHR0b2xhalVHZXhXUFVWMUZVYWEx?=
 =?utf-8?B?M2NVcU9MRUZ2ZFo1MW5CcE1aRnNCSGFEaU5VbnhjeW1KNmY0emdZZWY0Q2xi?=
 =?utf-8?B?dUtRd2krL0dSUVUyV3NkNHBUU3pMMXNRNUtNbnM0ajM5TzkyekRBNDk3TDF5?=
 =?utf-8?B?VmdKVWMzWDNYdzhvcE8vdFVpQ2lHU1M1Rldsc2RrY21UT1lOb2xSdzNiZU8y?=
 =?utf-8?B?YWhlbzBjNFdDVTRJaHhqellIUDlOT3REeTBDMFlOWjZIOU0ra0RXVDhiN0RC?=
 =?utf-8?B?TCtDcHRIdFNMMkdjWG8vMG1XeEt2Z0FUQmtCb2daY3hxbG5BT1BiS1VXK2lm?=
 =?utf-8?B?ejJacTMxS2EzUTgvNUdYVXhUNHZaWXBpNVRBeFBxVHdsdGU4RjVhRm9KK0Ex?=
 =?utf-8?B?SkFzWlUrRERDOEoxSTZWdjdNNUdpYzlneTNLdlZyN0Y1MHF4N2h3VEZkMG5w?=
 =?utf-8?B?eEYzVXRvQ2ZqeEE2MGVKdzNvL1p6R1VwNldPbVdhTnVSTG5ydFNLNExIVGJN?=
 =?utf-8?B?ZGI4MWg5aG5tcWh6NXBEYjBMWDdtU0pFNmdjSkdlazlGdTlIVVBaSTNTcGJu?=
 =?utf-8?B?aGdnNGlXMVJ3UFlEd2tTVndTeTd5R2ZxcjlsaHNScHBjSkJoMzYreXNZZmxV?=
 =?utf-8?B?VW5lM0oxSUoxeGpoR010OFpEaVU5blhGQUxWYWErNHRtYnNWYjFXeFdhQXlI?=
 =?utf-8?B?aE1yVTE4Kyt6RTF4Mmd3cng5cDl5T3NVRVFCOE9vNEpzbk85RzFRdFlpK1BW?=
 =?utf-8?B?R29SN1BIZTYxcnE5a1dHR0xmZThIdFJXcjFsaS9hLzhyczd4aXZEVmduNmlz?=
 =?utf-8?B?Z2Uvcm5hdjJIQWwrZU1GTk0yVWN2VDl4YzVvOGxZRjVOaXpxQ0Y3QkVHeWMv?=
 =?utf-8?B?clhZd3VFRENWQlN2dk1qNU1NVTVDUllXV3JmTjVDbXlLZW9JOWNLL2hCbGlC?=
 =?utf-8?B?WHBoSVBiamdUVWhEZ0ZPYTcrZFFBcEJlODQ3NzRwUW51eGxyMU15cVFJR3dm?=
 =?utf-8?B?TkpVbm92NlFsTEJ1ckhvdi8zUGx0V25QK1RwSy9OT3pEa2tOZmJmblZLaEZD?=
 =?utf-8?B?ZnpvT2tORVNPRzF5bGk0L21tOFd5enpzOXc1REl2RmdUNVZPdmFYckVIQnBk?=
 =?utf-8?B?czNJTHJnUWRUSTNCaFlPeUxtd3ljQzZHVWRPWjZQZi81ZTZjdlNCb2JvWDEz?=
 =?utf-8?B?a0NXSE12WDhrSm9iOW9wendIZlRvV2ZWME8wMzVYZ3VSSlMxaVc3T0JPZEJ1?=
 =?utf-8?B?Q2Z0MWJ0K0tCTGlSSDBUZGpodWtZZGFUTVI4VVR3Y1kwbk52bE1MeWNWVTRq?=
 =?utf-8?B?OXhGKzNTaUhGT0gyWXVsRXl4cEIweDE3WnJRcmJJT1llVVVSNENvWmJpQVdZ?=
 =?utf-8?B?WFpaVVJtSXRtU3VrL0ZxdThEZTRGQ2FicFZmOWozMzVoVmlDeVFxcUUySTZZ?=
 =?utf-8?B?aktuVnBoK1VWRTJ5UWNiZ21zbjdTS3RhaEhPQ2oyNCs5bnRXZUF0bGE2b0pR?=
 =?utf-8?Q?oxCC5HmGvDaL6Bxq2SsRm47MlhXV05bdknJeo/5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470e41f3-34f5-4da3-c49f-08d9840c4df2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:17:43.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFadeeFoNL/7Rb1Q+XP2lyTmtWaR1GHLFxRSjCxuQFlbBOBsfkCJp2t/4s7/Uv9e4J6Rb5RdE/atFnGkhO0OFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

The xen_hvm_early_write() path better wouldn't be taken in this case;
while port 0xE9 can be used, the hypercall path is quite a bit more
efficient. Put that first, as it may also work for DomU-s (see also
xen_raw_console_write()).

While there also bail from the function when the first
domU_write_console() failed - later ones aren't going to succeed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -632,17 +632,16 @@ static void xenboot_write_console(struct
 	unsigned int linelen, off = 0;
 	const char *pos;
 
+	if (dom0_write_console(0, string, len) >= 0)
+		return;
+
 	if (!xen_pv_domain()) {
 		xen_hvm_early_write(0, string, len);
 		return;
 	}
 
-	dom0_write_console(0, string, len);
-
-	if (xen_initial_domain())
+	if (domU_write_console(0, "(early) ", 8) < 0)
 		return;
-
-	domU_write_console(0, "(early) ", 8);
 	while (off < len && NULL != (pos = strchr(string+off, '\n'))) {
 		linelen = pos-string+off;
 		if (off + linelen > len)


