Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91184310C8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 08:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211674.369307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMOD-0001Lf-AI; Mon, 18 Oct 2021 06:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211674.369307; Mon, 18 Oct 2021 06:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMOD-0001Ic-64; Mon, 18 Oct 2021 06:44:53 +0000
Received: by outflank-mailman (input) for mailman id 211674;
 Mon, 18 Oct 2021 06:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcMOC-0001IQ-IZ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 06:44:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4b09a42-2fde-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 06:44:51 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-FWnEhckuNryUibQ5kxIpQQ-1; Mon, 18 Oct 2021 08:44:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 06:44:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 06:44:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:110::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 06:44:48 +0000
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
X-Inumbo-ID: e4b09a42-2fde-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634539490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I1lOxkcSWLuK57F6wf4bdXAcbJ7aLZKAUAaOcQ62Src=;
	b=enoLkLHVFKb5wBUqRdM310ds7U4LS0TpB3W0Q0O3UP/SLd281N1iGYQ8QvfHQt0O7mzqMY
	WaBs8jt5M05k3AOURvVfjFV0ny+16j8TL3BEcnmxyB15ULqyzAgugxlhnx4PYGJnfqlhu/
	u8w4SOaB+BCE60hQyiMGwqb6SsuTgoU=
X-MC-Unique: FWnEhckuNryUibQ5kxIpQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9hgpWKG4uNpDc2ACZa9x70uGyRpLpzrUvkF1ZZiIm8yj3nPNd/xnSiTda7NSzINr+10cWTTx9u8nc7Z2bVoFXrPngD/AfQKxqBrTz/fFLiXxta3JomxXqExj3k35+b6v+uPw0YdYbsVd+nP0wCSu+Pg4DKZymZkh0oLO4aLG6Qa/rooLbtqyBs5JzwXbflzDj3OKnyEVcAL9+2E8tK4/X11n4wQXlACuniwoj6GW5ynZAji38LST44FqUpOH/sZGU4V7BoWyg4dmuEJh3qnDIhbaa5CkopkAq7KdB4V0MHfvC71H/dQVDpBKyu2PBMVSZV/OLfTAjAlyOA5nnuP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1lOxkcSWLuK57F6wf4bdXAcbJ7aLZKAUAaOcQ62Src=;
 b=LwUrEp0Pb/AXjkNuP15rnyp3HwuDNI0nMTyX++IQWtn4Z3nDE8u8oTOHUMDTBLiDxjBuhJL0CAvRM6P6O8v5K+5udRatmCwdGloJmeKgrDcMJcl9pYnYJZCO0jya0j3KUt8c2bePCrypDtiePJwf5i9Gkail9Lr6iHHiWN8wwOzzzGKGmr0BLkUiIgeq149MQ/fh6IWDn6KnVkPZkgbP/lUtqh3jmQvHGCkMeJjt7CfAAriyP2hzcMMObp0v+mklK8kmypuCBjuDJf/uMMyoG7Yl6GMHQJBYMNApUO8pZN9NX9XmUBrnYc1K4gIirXddI72AslhHuRXqh7wYEKHvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: make a local variable in sh_page_fault() HVM-only
Message-ID: <e469f3d3-ec0b-fce9-5fdb-5939970fdc6e@suse.com>
Date: Mon, 18 Oct 2021 08:44:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aa6dad9-3041-4868-c4c1-08d99202c793
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590481AC84D997FE12A45233B3BC9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wG/KfxkwbjME48e/mPkaNDfE+x4wcHUj1bLKXywAdIC6yGA7rjniKIV7EdJuDN66Fbrov6rYGY+uX5bp1lXlu/QYu/f6lOYLGouXZjBzRzseA6mBgt6ngTa1qdQwiDZBryK9O6EIzbKwp9uXXfUYw1aY0yF7ijTS4x8VFKtoWaZmbQ5ageK6+vrPEG5h0SuIxXk1b/U3ok8BJmwm4zUdSvjKxKGMS5F/KSt70ox6iMqz776z6b5Ng8P5NLvFt5NjVlEccKPjpQAe9lKW4IZ7DR5HNnohJIbVsmC74H/Ehr6BoyT6oBvcotX0LGIYh+PUz8YOWHiTTNAcAfMFN6HYHs1haGIh5lk7neTmqOMQi4AYvK8KcAeeU/c11nCJO9DWIfk3ot5mh7MhN8u+RFcoG0a30rnMuBe4Iy4uN39RNCYZf5Z1hilfwaO2+qggcNUUGai2m27sBKfnHavvutqXrLCW10TSwMwg1GJCHfBYAwqnAOVHqYsic9e5O6s7Y8llGlVItOLSze/BEiKZhLBgAuQUYOXkdUwgkTBTuP+aUellMvz6jLbNs5Fupd5BqGheJfi/JiP4Yl4TjIy71lBxeen3JIQpvW3/vYvSAZygJ4Sw4gH6dRZ/qeLVdY2e9T/a+NmxNa1MVY/jpAzmV1UBbnoBMw2HXluN36I5QnObxyB0+tju6qE2vyVbedUg4Jnz1swaiJJVNL/77PyIcyG/rTlUg4nfr4AOeZ6tsMMBmiw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(6916009)(4326008)(2616005)(16576012)(4744005)(54906003)(316002)(66476007)(66556008)(8676002)(86362001)(36756003)(66946007)(508600001)(5660300002)(8936002)(26005)(6486002)(2906002)(38100700002)(186003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNpc3Z3SzY1dk5saUVJeVNHU3ZVVC9PRTd2NzZGdklPbENoNnRFSzhQWWRH?=
 =?utf-8?B?amVXRmt4VUVseG4wcE1qeDB2U2toNGxFeUNlekxEOTJ2N3hldFJaTjZ5Zmlo?=
 =?utf-8?B?WjJScXQ3bkpXVk9KK3FWS3Jxc3VJZTRqZGh3RlBPK0FseTVjN2JHR25UT0JC?=
 =?utf-8?B?K3lqV2FadU1KampTK2o1NmFLVjIzbXBTRzd0dGtXbVVXczB4NGZxRUdkUHI1?=
 =?utf-8?B?aVNoSHZ0LzJyVk9ucjh1UndEZjZ2Ylk0dFI2RFBOb1AwbENVbDM4cFBoSytZ?=
 =?utf-8?B?aFhGRDJOV3duMHJldHlDUGdFTytCeWRrOGxOMVpSMzBBOU9xaE1wRkxMMWRB?=
 =?utf-8?B?RG1ubTArWmlsOXhJVmJ5Zi9vSHRrTkRwZGZ6MVlKL3RDTzlrcHEzQi9scUVx?=
 =?utf-8?B?TzBvak5sUGdCSmxxYzNSMStlY2lKRmIzOUJCZGRyTXk4dDhMUXRDUnFRTlB6?=
 =?utf-8?B?K1J5WHYvYkdPcXhCNE1GWm5sRkliY3NCL3RBOEszS2h0NEdlK25iQzVRVjBs?=
 =?utf-8?B?SWRNK1dYL2JaQ05vdDM0aDdWcHdUVEw1R2tCdENVSE1tK2JqSEprT0Q5Smsy?=
 =?utf-8?B?M1p2NmRKSzVOeXdUbkNOMURrNFB5NGttc2Y3OVRKaEJsQ2hvVUtHckQ5a05o?=
 =?utf-8?B?WHZXQXo3Zkt2eXZJN240dGxyWXVGQ3VpTjVwV1YwczREdGsvTkYrZTZZZEN1?=
 =?utf-8?B?Q0dxU1FibnRrbjRJVmNHcVJFZ1JoaVhrQnhvVXRuR0NGY3pqWS83WktGd0xv?=
 =?utf-8?B?Vk5BY1o5NWZoRUxyT3JSNWhlRDZ4aE1MdHJpblZkVFhYcVF6SEhEeEJUNUha?=
 =?utf-8?B?R2Ewc1h5cUtxMmY3ZmptRm5hVFp2clpnRXRJVU52bThyejcrZzMxWFROVzVl?=
 =?utf-8?B?Rm02UWMxWEVLMDN2cjA4TmMwZmtOU0tISk5QRCtJWWVXK2N4L2ZsV2hmS1hB?=
 =?utf-8?B?a1ZCMzkySmV0RmRuVVgyTHZGVElwWnZpWFBSZlQ5YTdUcGtjNFZ6aFN4Zndy?=
 =?utf-8?B?ZHBZeDlZYnp5YXZUK3JvZGpkdWVNbXpyc292enpMVFFoMjR5OVc4NE1kY1Jo?=
 =?utf-8?B?WlVXK1g2WXh1VCs3Q2lId3pYeGZYckVTVU5GZGNXaEpUMlM0bS9lbG8yRThr?=
 =?utf-8?B?WmljN0h4TFRVeUUzbkhtNFR5ZEwwVThveDdTK2RSdWtTcWswR3hxUXgrZDFp?=
 =?utf-8?B?R2VxcURNdXVoVHFmcldpTW1mL2lsVE1FUDdBR1kzZ1B3Q3M2aXdEQkFuaHlY?=
 =?utf-8?B?cjh5cVJkenRST2JndWQwdmlvZDFDMnl6ajR1RnlQRUE4T1JpeHJYdlZ0djgw?=
 =?utf-8?B?VWFZZGg5eGF2SGRtR0JqYVRSd1hPKzJtZDc1b3Zrc012VEw2d214YUpaQVI1?=
 =?utf-8?B?UStMMDFVVEtZajB5NXhVTUVGK2M4SnBPTGNwa1YzWkJhalUvNmNkSnZtYnZO?=
 =?utf-8?B?dlpiZGUyRnVhWGxMRWtnY3RCTEdaUU9pYW5LeE56Q2Jma1pORjg3SjlBRUhQ?=
 =?utf-8?B?RDVJTFFsUDhUeXJmZnFnRTdTUU5zV1FEeFNRdVhsOU80bG43UkY2UkRUREdL?=
 =?utf-8?B?Ulo0OXBHblZ5UnN6dGQ5Z2R6YzI1Z1U5TzN1b0tZdkxJQWFvemgzdUcrRUla?=
 =?utf-8?B?MHlWM2Z2bmgyZ01LVUg0TSttZzlGY0QvNStwQmg1Vm5QYkZYNVVkdVBhWVhv?=
 =?utf-8?B?YjgvWVpJdFhvM0tVMlI0SUZVeW5JdFB5UW02d01UWUdKaExETHFCN2RnVnd3?=
 =?utf-8?Q?NpVoDGfC4mOm+oCmL0TSVQw6P7KPr7SytP3DrOe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa6dad9-3041-4868-c4c1-08d99202c793
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 06:44:48.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P9XNtzRvmu7lMmGimtTDYj7ep/nbgWwcrJhuQoUryO+NcHzpwpU58s0sEX8jYcFrDChT4hKK2oodpMhBOVjfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

I recall checking that "r" would still have a user, but when doing so I
failed to recognize that all uses are inside a CONFIG_HVM conditional
section.

Fixes: 9f4f20b27b07 ("x86/shadow: adjust some shadow_set_l<N>e() callers")
Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2155,8 +2155,8 @@ static int sh_page_fault(struct vcpu *v,
 #ifdef CONFIG_HVM
     struct sh_emulate_ctxt emul_ctxt;
     const struct x86_emulate_ops *emul_ops;
-#endif
     int r;
+#endif
     p2m_type_t p2mt;
     uint32_t rc, error_code;
     bool walk_ok;


