Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6540283A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180935.327836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsV-0007OY-V3; Tue, 07 Sep 2021 12:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180935.327836; Tue, 07 Sep 2021 12:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsV-0007MN-Qt; Tue, 07 Sep 2021 12:07:03 +0000
Received: by outflank-mailman (input) for mailman id 180935;
 Tue, 07 Sep 2021 12:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZsT-0007LE-GV
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:07:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7167cc5-da60-41dd-964f-0f0b7ed46926;
 Tue, 07 Sep 2021 12:07:00 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-sqoC9y0uOUmyMVzmjdz1SQ-2;
 Tue, 07 Sep 2021 14:06:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:06:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:06:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0063.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:06:56 +0000
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
X-Inumbo-ID: c7167cc5-da60-41dd-964f-0f0b7ed46926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfSrUDJsXrUgIa8eiGS6wO+C14mV3RvK021zMRjhrHg=;
	b=Zq8NCV1PhIRAR6RayonpC9+VvN4XjM8PkzIxG6ZLTq09Ggxv3aIn0GWpSISijyvN1/tV3l
	HmgsHSV/TaB8cXjkuQa49gI27c4OMmcMcp4XDy6wIa2EzsR1mQ6HOIfNsqpZmdRCqVWA6C
	v8w5wXZUFHxMnb2eLFFE8ubNwGIZBS0=
X-MC-Unique: sqoC9y0uOUmyMVzmjdz1SQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWmrHmi+ZMHC3LYMtzJur7+Dw2pd9sVEpZFYIwzl1En8ZFIaMuvsyXDu46b6O63Xri3ktnl3NG4vEpo2X1NCj+edcilG4n7L8fqrFK3Lg5sPwvvpcEMleoMqsRQXf7gTN8ZR++aOFpoLKWzvFe9WvldIB01WEOVOJOdTLjOGdylsdinh2m88P3Tl9a/wlaN2YtVK2NODSaULwDrGCIaYxaio5NoXg2GOBP+MiTWza1oKNGCbWILjuodfrE0lZsuuVPuT52OOpILXMXlCIKvXLYjOe/8WHc1ruEmLs/SzzlU7GgGNdiOv5UQHlxhqVzNDXXf5vRl9yoShbaCeJwWAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yfSrUDJsXrUgIa8eiGS6wO+C14mV3RvK021zMRjhrHg=;
 b=csNV5nHeNahFGwpU/LYDwy+AT9eP940y29k4YQXmrHVGKLzZG69WDnDPOUtKSLNFRJ45kWRZrH0F0tKhvqFWP9Gsrp4ICQq+I4bxESlQjOfXueGoE5RwmJYVqec3j7dn/11Dj0zuVRnhY4QFIkKGzmwn0A9lGuHrZ7XIwIeQROa9Bou8FpTAsbUaV6ofOsK7OJmI7XiCvHYaqMoQjaS1nHXO57rVItI0QfbN60php0A5+IxAU4M5U93Q6uQmwG8a5AVDmocy4GggdRzdWAF1JbOttbCBfe5hGS26QOEhdyL0HlDQHCwTaYetM3+wE5KmZB7f0hfHMq98EbjQmgqGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 07/12] swiotlb-xen: drop leftover __ref
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <7cd163e1-fe13-270b-384c-2708e8273d34@suse.com>
Date: Tue, 7 Sep 2021 14:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d92d3fb-5473-4882-8cd6-08d971f7fd10
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23353A656619E82E11D01D10B3D39@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X+TnSCKrSsUpHDy62Y4a7n1mHtJ9sHiN2ncLWbETlk/iczTyLciNrb5Q889LTvUlcTFTCatHa/e1EqPzGeQDQpSD+Y1AKhG6Hm24253horOclA2vhn884oXNKEvO9qcIIl8MPmtoatQAbIBjnu9cJRRtb0/ej/lKc5QCx+RcL6RZOQ7+ftwD762dJdvnoSSOeijFyC4Kk6njhHLs+2De3ZLT1GzhybjWv9hupmX9FDFWnRRm7x3D54pT57k3nQt9MqwL2td8mMaX8WPZ8Dpgc1XX2K8BaXZtRu0aMHtBzu8bxWFxTMZUPKCxTZUpqznBthXzUJQ36AdPzD21Jp0CSFz6S+ppSSinkIpVQkWttj+vYttUyddhDV23uNXZws1qy5f6FeLi8cuIrDaxOQwoUFgs4b+X2DYo05kJem9wJeERmpwUMo+GDleGFRqFDXVCbXDug2mEqhBXxifoahtCFOI286Ufw6W7W0+5zytY4VE0bRuHgrAz8LkVRydX3GYHdDIaCxURPWCuHzzbglGi1C5KDTxAXt+qd3q2Qdyp/3wcPAPQOFtloxJJnpeERFIcSVwbxX4oqVJnbddgS61tY+iUGPZZkgupsx4wQ00xAa4Od43WB168COO+sKbqmoa+Gglbu7X0GE2BBtbihFP17xWyzSH5cQFcpVdmVBehNxbioptTeRvXZggT+enSjf2d+31gIvnt7Mi1uN+fqZO0uDIs6NavEMlbVuKnX9ygZ+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(2616005)(8676002)(5660300002)(38100700002)(54906003)(110136005)(956004)(66476007)(66556008)(66946007)(4744005)(26005)(316002)(6486002)(31686004)(8936002)(16576012)(36756003)(4326008)(2906002)(478600001)(186003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1c2S2NncjAxVDlZdG9IcmphQXFJNUFlcmlBOW9MT0hCNUJ5YlhVOEJwTkc0?=
 =?utf-8?B?OTVXc1JUQ083RU5Dc1JTSEd1Z1Y2eG9sZVdEQ0VGTTkzajRlbFgrSXJOM0pt?=
 =?utf-8?B?dW13Nm4vWHp3R3NLZUl4L0taRTExSE51bXN6NWxQLzljV2d4Q2E3NWUwWVJY?=
 =?utf-8?B?aHFFQkVMNitXSzdXRWUvRE9RdSthSHNvSURNNXNmUjVDamM2aExKMTVSMUF0?=
 =?utf-8?B?WXVvUVFwd01pc3Fxa0ZYN3E4MG5ldUh5bFdMM2JqYmNSNmVZUVFRamNoaGJK?=
 =?utf-8?B?VVA1RXFNa0FlRmcySmVQeWg5YVlpQ2o3dFJRcENoUStsaVhCMXdaR2F0SW0z?=
 =?utf-8?B?b3FaK2Y3SWxGeGUwMk1zTkl1czNOcGFJZEN3YzNGclVTY0h2eHVONGVOQlE2?=
 =?utf-8?B?VTBWa0lRSjNKRFF0K3RNUnY5TytRMFFDYXF0c0JTTVd5UmZmK3JRL1IrQ1pZ?=
 =?utf-8?B?NkJMdVJVcFE0akFBaDNjcWFIazI5eXVEMDlEWnJwMU9kQisyMzNQdlZudGpC?=
 =?utf-8?B?OTlGZkdlWnRIRDRpdk5ZQlJMSUJid2VSNlhTd2M2RGJzVisvNWRDMUlrTlNR?=
 =?utf-8?B?ZTBYakxpNHdGUFR0cTB3QTVpMzFxRGF2NWJSK0pSb09aKzdKZG1ZakNjQXF3?=
 =?utf-8?B?SEFWV3BwTGdwd0Rjd3RsNzlsUFRHdlNSbjE1WUFRMFNpUzBhMXczY3V3aWo0?=
 =?utf-8?B?bk1KTUl4TGhPVGZ0b3MvTEF5Y1dDbHdYNFFraW9yeDRTMHVEZG96TWFUcnpH?=
 =?utf-8?B?OGpBTVFRb3VjWWQwQ2lyN2I0a1d3WnJFVGtqSnFRd1B6N0xVY1MzVDdrblVw?=
 =?utf-8?B?SWoyOS9VcG1kWUk0bHpvcmc3bDkrYTZxWis2bzcwZGU4dk9yQk0zbmFVQ256?=
 =?utf-8?B?Mnc1bmdZZkNJZzZuRVpvT3hWUnFUTkh1KzlxbGk5YXUreHlERDFWdVJpRUtX?=
 =?utf-8?B?VitiVlRCOXRuMkV1SU56ZTB2RnFkYnZHK0k4NUJCRkxmZHE3dkEvclVkcHpG?=
 =?utf-8?B?a1hqK1QrN0hiOGxXTjdqUU1TbUJmNzBwUjQwS3ErL2htLzd4ZnRZbmMxbkVV?=
 =?utf-8?B?SzZjR1NDb1Z5Uy9ZTm5PQzZDTmJXWmVtM0tvR3lFQWdFMDhXNEt2akl2ZmhO?=
 =?utf-8?B?RWVoNGFKY0lnMUdHN1VGUFBsV2FndUFTbzNINjk3NUdueStkVEdVUCtzdFhO?=
 =?utf-8?B?c2VPQ2xsbGFzV01xdURxM2lXaWVDVXNndWJlYWNaejdVR2N5RDRQYnVROGRJ?=
 =?utf-8?B?bXNGcUIrSU1ZbUxWazRWNkRlazFDbkduL2kyUmVYVGpGS1gxaXZpNlRqVEFy?=
 =?utf-8?B?SXZMS2tseHlDVnIxa0t0Z0R3ZWpUa21hZlJJVkIzekp4QnpYN1NVc09oWnk4?=
 =?utf-8?B?endjNlQ1RUNibWxIOEQxRXRoazhTSFh0QitSMGdnZlFmaXhudUNWZXlka1dT?=
 =?utf-8?B?ZlBVbUpEcmxsNzJ2eVA3T0YyNERpdUZtdnlzNEJKSURSYUFMNFU5SkNlSC9i?=
 =?utf-8?B?S1hhTW1OZER2QjlnemEyQkQ3NkN3MlltOHY1UnM1WmV3Z0Z2U3E3aEZXbjEy?=
 =?utf-8?B?ZG1ZZWJWR0gyek5wenM5V3h5YnQreUM3RmhnZ3hLY2hJZTVKZWwvK3hESWxG?=
 =?utf-8?B?dWVLR1BPc2RtQ21LMWFrSWRvMGl4WGlMWHJueTFWcDdWOXFWdmxqMkJ0Vitu?=
 =?utf-8?B?RzY4aE1vTGRmTG1zSXM1RXR4UGhqVHhBajNVaCtvRDFBdmcxejhWbkc2MXpU?=
 =?utf-8?Q?6zpueodSA9C4Hs9FhhGM1mnSgXSbmwbylLEBmaH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d92d3fb-5473-4882-8cd6-08d971f7fd10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:06:56.7266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3JjegjrSVa7Eyffa0vq6FD1jmgD626Xg9ETA8SXF6JHGDsF+T5u/SkYZ9MAPiV1vclz+c5K8UFXntF15X7vlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

Commit a98f565462f0 ("xen-swiotlb: split xen_swiotlb_init") should not
only have added __init to the split off function, but also should have
dropped __ref from the one left.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -154,7 +154,7 @@ static const char *xen_swiotlb_error(enu
 
 #define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
 
-int __ref xen_swiotlb_init(void)
+int xen_swiotlb_init(void)
 {
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
 	unsigned long bytes = swiotlb_size_or_default();


