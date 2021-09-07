Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC58402835
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180921.327814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZrY-0006EB-9o; Tue, 07 Sep 2021 12:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180921.327814; Tue, 07 Sep 2021 12:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZrY-0006C0-57; Tue, 07 Sep 2021 12:06:04 +0000
Received: by outflank-mailman (input) for mailman id 180921;
 Tue, 07 Sep 2021 12:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZrW-0006BD-A7
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:06:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7f0c699-b15d-4fbb-909d-2d8db2c1a257;
 Tue, 07 Sep 2021 12:06:01 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-5mGp0lRPMUSPJGnZU8v3Vg-1;
 Tue, 07 Sep 2021 14:05:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:05:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:05:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:05:55 +0000
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
X-Inumbo-ID: a7f0c699-b15d-4fbb-909d-2d8db2c1a257
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjKaEaYjLVTnjJRE9LIByPoKIietul+QbtKOuyICMWI=;
	b=cUwoMCB0JoLefXLknZuXXBQIJi2/XEdAFclZm/Zcllba9pufqDSwOkqt7B6Z6tDzIFr9Wo
	lY8bLPEjAe8CE6xWUSU8qbz1dTLBNvcB7o7MgOAiwK40kEPiH7dRZ48efHrTxDjmoJBBrt
	NrUWPAdnctsWyXyBt+auDKifvhMtPbQ=
X-MC-Unique: 5mGp0lRPMUSPJGnZU8v3Vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNH5CqiSQp2WP6YKX8CS01lPsyYKYZT7W5c0oUP9S5nU8vKEtvfKQLRsQBoz7OMNWFWiz6mObGWAbr6J26UOBx5OrdEebihoh+kiAhdSz/NhDUK7SZS978VbN3Y1l+azXLJqgivXL2N/WcsiWyWH72DqZvj8AD2Xudo4VcPxQyVTsFTkEfN+zTfrjuZNmU/dfeWarcNsjWkjOzDozapymktu+CyTRKajKP4lXanUY2r4CjxTJV4G7XAFcyrhKBPs5zVr+QTyQVMi9yP6Mc7If81xBOqpk6e5kQ7VHiyZ+d0Q8cs1nyqVM9ia3jxcUwikI3uElc6m8bUOftFU6i4uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NjKaEaYjLVTnjJRE9LIByPoKIietul+QbtKOuyICMWI=;
 b=Nys53cUyRC4XUlRou/gwDBTvIY3i4CX8U2pwSSON9XCInlyMsBEGQj9YeSpo1MKluf09GQxJvzjxvbtcMCR/Zp6Yl+kOV0hHphSkcwySrlozoJvVq4g/gfQhjj5dC2iY1QgoUgM390KQG3oML5vbCHA4ix95aPI+U0+rLdwEDbspS9ZQleRwtKsDnpQ8sIwq9L8gGtKjY4JJddUn6HcOM+tzifnuOe8MoCUCUOeoDKBHKVtcE46N3yaJ0MKO5gUjXoJQcR3FVD4lqFa0PewzidXcmx9SpVq/M7fk/v1kcq+sMHnLds9ppVZHfI85nlj8boDrfGXDOn4SA2moeAMApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 05/12] swiotlb-xen: suppress certain init retries
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <56477481-87da-4962-9661-5e1b277efde0@suse.com>
Date: Tue, 7 Sep 2021 14:05:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f04244bf-cb78-4275-9e76-08d971f7d90e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23351E1C52F90D85F485CDEEB3D39@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+XXOKh8+bG+9GNKJSyR8gXikRgeL++Ny28srIttNOVOeijUGZBfzPwMh+z0MLJBFgQQ7kgTuADnedHnaBZL5ahrRWrzf3Wp2r1paBEBVQutU9HOHLX6S/e6DBWJWKyrRPM5KFUY7ihst2GiruxreH0bHM9VWvZUM4QT+asbyJtaRUWZHNNSgrP3IYAEQVjVbUBXWUs4QyNLEU9OhF8i7fuUtQYK2ULLbpG95a0oAaow87Q1aeS1BmXDCB7CYwRN/tpT0fxYGN0jN/HiZ0EZqjF3F9k0PPacX7myFAglxZPcq7/mo7r1sdKTj9XgAHnaSoXewSUYkJOsxf7v184X+uJEhg2j5fNYsLxkBqhmMwpYvt5Xu1O07KxQn5imA6LAIFlQlNvcUqdF1HuPeJ3uZuEqP/VwIVi4glJ8kieRBKFxRxFohcLd/BUhkwE84aQ/AFy6gaAVWAniYnVhRAzvMLbbgLZLuNri2iGsf+pLcuLiXWtR3946qFQKidWdrjv/eD5SAyOCe8ihKlpLQR9cf8Mntt3ktVG7aOK+fH+AURt7gb2KNbFiUFGUEobDyDufRv0pUMbgQHa6sVfZtw7ZkjHQrlqLkn74guDwBDxjsJRn98l850b6F1Cghc9y4XmYCMuEmR+1qAMQPIMTJA+m7d/ANDqXy5tv447enrN1fn65Cdx+jZ1iyIPBOE8TXD3Q/ybzo/UbI11Yog7LitPVnhOtvoFcZtxEiNpmGCzPfnzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(2616005)(8676002)(5660300002)(38100700002)(54906003)(110136005)(83380400001)(956004)(66476007)(66556008)(66946007)(4744005)(26005)(316002)(6486002)(31686004)(8936002)(16576012)(36756003)(4326008)(2906002)(478600001)(186003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWJRN0wydFlEbjQ2T2tyOGpBTk4wQnBEOEc4dlBtTzIyZ3Vqa0szVDh3ODZz?=
 =?utf-8?B?ck1rVWpvTklNVXFPbWwrSUkvN29MeFB0WkVvNUg1MnFOc29VY2V2MGdjV1FZ?=
 =?utf-8?B?ZzJ1cmZ1RnBnR1lSTWNhNitwQ3p6c0hvRlJHTnBlK2JTV0g5VnhOaWxoZXp3?=
 =?utf-8?B?clNSSVdjQ3NZMS9MSDh1YzlwRFpQQkZpU2ZnT2xIS081cmlzSHllZjNjTUYv?=
 =?utf-8?B?VkZ0N21CUlBoamRHcDNzS0dtbHkyTTRDSmFjdHJBN29IM0VMMGR3ZE9kV1pE?=
 =?utf-8?B?bktYVDJneFBxQjNwbkZLR3EzSzNDOFArN2lLUnFoRHFyNXdJWGhKVEhrZzBR?=
 =?utf-8?B?Mjh2WDZjV05oWGVEWEJrcCtla1dFZ3VHL3htMDduVU5mcy82Wlc0MnNvUmJx?=
 =?utf-8?B?OS9UVWlOVHQvZy9Uek8xSXZYVUdQaHBTditXdGZjbTdIV3BZTTJJaHg5RVJG?=
 =?utf-8?B?UjhlOWRnRzlvcTNlOWt4Z2Z3OWdyVkVvNDBURnluWXVmeEhZSGc0NUdRdUhB?=
 =?utf-8?B?ekhFckxZZDNNeUpzRHo5RUx5NUFhNFN4djV6bmxiTDBXTmJHOXA5V1NDQkZE?=
 =?utf-8?B?NjVKUmF6QzBvMVZ4QzdITlBTRDg1UHRxcHpGNTl6QWR3bTk3Z29DM09rNTFU?=
 =?utf-8?B?V2ZhZlhwZG5lNmhDN3JndVFGY2lFelJGbW4rRFlraFlsbFRvdDRnOWVpbTVY?=
 =?utf-8?B?c1J4MmxzMm5OVzdxcE03K29kcEUvY0FBcGlIRjBZckQyVk92MGNDcDlLWTBL?=
 =?utf-8?B?Vjk3SWp0UThENExzby9uNVQzcXNhSTgxSnRDQUwrS0swR1Q3NzRpSU4zWk83?=
 =?utf-8?B?Mlkya1B1R3R1d3ZJdU5wQ0cvV1RHZENYZEhDeXBvc20yN1I0UkQ4bS9UM0Zk?=
 =?utf-8?B?YzFFZjV3NWNxbXBpVVd0Yi9CNWFhTW5PSU0wd0VLbmdXWEd6aXNzNEtwcGg3?=
 =?utf-8?B?YXhiRkc2KzZOZmxZeG9rT0J4WGZ1bENwRkd0SWFmTk9NMnJmcGxDRFdrTm5t?=
 =?utf-8?B?UVJUajZMMW03S3J1Nkw4VmozUmFlbnVRak54cmszc0Ria0NJYUZaS2pSbzNF?=
 =?utf-8?B?Uy9XeGxZVWlFQWNGNlVRQXJCK1U0cGNRR2JoTWZxU0xIcjZqS3AvUkozUFNu?=
 =?utf-8?B?ODk0YjZ0NkxrRmtha0hhNk9JeDQwOUpzWU1YcGxyYTZhMGY4TnZXSzBWcHVH?=
 =?utf-8?B?ejI5NXllUHZzNzZIWG5zSUZJTytRdjdnUHdiUEdmM2paU2JrcG5jcEJoZWlz?=
 =?utf-8?B?L2dQWjBPVDVJa2NWZHA5L2svY1pYZVdEcitTVEZzTzRHRHlnVGIza0E3bUM3?=
 =?utf-8?B?cHplZHVSZ2RIbHdzUmVXWm9xSDhwbmhoRjdnKzByL2U2WC94d0lGUWVXR2Zv?=
 =?utf-8?B?cVp2S3BUT05xUm9kQ08wSTBDTWw0V25VNFdlczN2dlU4OW5uRkJNRFREM0FX?=
 =?utf-8?B?OW9KaEc0eDgrOS9YNklCQlFOZVg1aDQxdCtMZG95WVMzVGVXYVphcUZZZGFa?=
 =?utf-8?B?eDZMRnJlb3djMzc5Rlp1RDZqNDVMSjk1UEdlYTQ2SVJsUzEzZHVDWGZzUFZM?=
 =?utf-8?B?MlFYRXhFcnYwZ1dPR3E5N3JSbGRtNENPL2p4aVZIVjNUTE42NUlPTXJzNU5z?=
 =?utf-8?B?Q2FLWXl4dHEzbCtBMjV0M2NwT1R3bzR0Zy94S1Rlbm9VMTNoZVR3MjVUbWRt?=
 =?utf-8?B?NUlvRTNMNDdVanV1RHQ1V01qMlYxcVBIU1BLckFoaHQ5bW5waDBxWWE4YURQ?=
 =?utf-8?Q?I3Wn8j4IwfjvVvww4WJllM1ljpGL55qNYjwmzUi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04244bf-cb78-4275-9e76-08d971f7d90e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:05:56.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aanrS8Dgx2smsMpI0qTYptKbqhrbXgSx90Dq+sCf5bekkXCEYkwfljdlYZqNb2Whgr2xX0DrgEcWMDg0QGCsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

Only on the 2nd of the paths leading to xen_swiotlb_init()'s "error"
label it is useful to retry the allocation; the first one did already
iterate through all possible order values.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not convinced of the (lack of) indentation of the label, but I made
the new one matzch the existing one.

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -184,7 +184,7 @@ retry:
 		order--;
 	}
 	if (!start)
-		goto error;
+		goto exit;
 	if (order != get_order(bytes)) {
 		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
 			(PAGE_SIZE << order) >> 20);
@@ -214,6 +214,7 @@ error:
 		pr_info("Lowering to %luMB\n", bytes >> 20);
 		goto retry;
 	}
+exit:
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
 	return rc;
 }


