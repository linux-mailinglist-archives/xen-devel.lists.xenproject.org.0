Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EACA4D8AA2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 18:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290376.492427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nToIu-0008Uq-Er; Mon, 14 Mar 2022 17:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290376.492427; Mon, 14 Mar 2022 17:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nToIu-0008Sy-Bj; Mon, 14 Mar 2022 17:16:20 +0000
Received: by outflank-mailman (input) for mailman id 290376;
 Mon, 14 Mar 2022 17:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nToIs-0008Ss-Bu
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 17:16:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a44297-a3ba-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 18:16:16 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-evL1bKcDMMiSPLiwLWf1Jw-1; Mon, 14 Mar 2022 18:16:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7611.eurprd04.prod.outlook.com (2603:10a6:10:1f4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 17:16:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 17:16:12 +0000
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
X-Inumbo-ID: 74a44297-a3ba-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647278175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2+j6yRR5WwWJnlRNRwOWZfqK9FAiUwmthpUrg3fdSbk=;
	b=HxYMmIAAc+cutWIt/1TGOVj/B4vS6OWUS0lFLzOHRyCRoUx2wQM3dH8fHzLkxxay1j4PPr
	Wm3iF83z3dm1eAW21CORGUUB9YXPQ8ikuuBY0q8CwcqvE2HUzR6U2jOTTOuHaoC9jG3qAc
	d/ly8kTzSMdsMuExJleNdx9++sONK5Q=
X-MC-Unique: evL1bKcDMMiSPLiwLWf1Jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHdk3NP1ggcBtk+s5zrpXOETUqDUnDjnDJjmeqQpQ4OfkZzARJA9Y5yGD9dDun8dXaLh57Zbvroxuh1j8UPrdNv3XMmBWyXmO+yzh5pyF7Lj7sG9AM4+heoIq/eUXp66u4ALS8XCQQbF4t+R/ORaleNdihEQG/Ue6e3XLh9TyPtVJkfgEtA33zc0Tkk3a+Ow8uGtPVuStGkVjy2Tlu5nqMUE3PSHsxS+QfHOM8wVVxNylILYZKb62NTahlc4TywcUA6FxOECyxhhOkFzxH7/bTc2KB4bGZGLqG1/DodwsbXaaqFwkmiC6zIQ5imx/AFCmAWnOZKgJQD385dxSyxfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+j6yRR5WwWJnlRNRwOWZfqK9FAiUwmthpUrg3fdSbk=;
 b=OurIAN2woBA1AIpH/S7yS+/M/ah5xcpdFqjYlwdfaD+mbXgD5tguoVtCI1Mo5G5z9pB4VoSVAEaZ2Ei4AGyYFZsYeXaMjAHWef1Wvq0eywvCCqsD9FDK/ahTlcdmmEdLc8ITL68dXwF1SyAyBYk4x8+9bJW9F/5jdpDpOVe5cR0yU5f9FEaBwijsA7Pfzj43OHxApRT/4hWGWvdN7mtU51F5g2k8cqaQcXX0rMXUdroYOuFSDYvJvvl1B3pKYrfHdY3Iau/6OnurrxE+bWUj0Zg45iN12ED7j4RNVM92YzC6ZqnUuXSkBHACZNdLLoauzsgq3wteMMuOhPbUE7RScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c39e5c3-6e9e-e009-177b-495d80b6ea62@suse.com>
Date: Mon, 14 Mar 2022 18:16:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: arrange to have linker script honor dependencies (again)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0031.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37381e14-61e9-4960-3d57-08da05de56ea
X-MS-TrafficTypeDiagnostic: DBBPR04MB7611:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76111D959D78BDA5E5CEF06BB30F9@DBBPR04MB7611.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zM9EJ9uKBPpUy3hkZAyMu6Oh/YeT34E0Z218fpeLKHQmynL24MNYQOzKG/rY7kJW2juDSDnohPJs0+QPLLM3hvNVQTvnSDEC1PZNF7Dj73IDQdH46QlOu7MoTP3/5pZ/dkXO1p/kjVxJM5GAxi+7JqkR+BT1qGKySmaNZWWe6cH37yZ6JRrrK6SQrKaZT8gL9cftksUNaknUvhkx6V7IGU4620lkehBsYbhPZc1brpZFDmjDoYH+aJPRFw8nlu7ebuigK8jNh0b1CZFJ5sznqMaih2UMjgTT4H85MVkeFCU1Rt8KkHmN2pX7j0ELCdih5Gm8m6PMEi2ljKi9JjkEjU9wZSn2xQBLVUFUorjO8Vt6yLnjuwh56Xk7pP3IppehZQwt6pQEMAXXg+0KLa/gZ89UGa123VDS5Y2xtBoYX3NAQbC0dVjjjYnRBfLi4/btHHGwt2Efq0sM0jG03uSJGWulpccib1kAp8Eaf79q2FQmZdhWt1PeMYIZ22KbDZpNmeyU1ULwc27UkwJjijoznuwggtCN0B4rsDhfMeSFIi2QB15HiH9bi/9UFhV7idS/6JV3KFEK9uMIhMDBBrzdAR6JThE2Q26b8bvMq213BDZDizozqgAFWb+tIH4XIvAGNenrOI8IQtyK04ZncHm1s8xVHHfoyIgOJupAUH+7/H//jqLU1Xfpj1Ja+BxNqknT9f+uIrUnkJuLJNHt0QT1gp2/cWNLUmPfFo1a9Wnmvdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(8676002)(66476007)(66556008)(4326008)(38100700002)(66946007)(8936002)(6486002)(54906003)(6916009)(508600001)(86362001)(6506007)(316002)(5660300002)(31696002)(31686004)(6512007)(2616005)(36756003)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2dhSnZFSHN1U1Fjalc5V0dHbW1TakxLWmw5RisybDFvN0svbkJpdTRDY2pU?=
 =?utf-8?B?YnJoNklTRDFNZjVTdFo4dkcvNDB5TXdPa25yNWtnTE01VkxGNlFpcm9GWlA2?=
 =?utf-8?B?NGtCN3gxeHFkcGZsOCtQa2lBcEJwN2N5VVYzRG52Sk1LZ0VUeXE2bnFNdnJZ?=
 =?utf-8?B?clhidzEzQ3MzK2g3UnVjY0VwV3JGMGVLWlVmUXJWdENEa01FTEU1WFo3YU5V?=
 =?utf-8?B?bDMzRjdYL2ZWRERvRWJneENqTjljazhYdXZuSDhMRDBPM000blFPdWRZUXJF?=
 =?utf-8?B?ZlRNbER0R09XUHJhMVhwaE9vSE5EQUlQUThGZVRqV0lMbWVIRENNL2VvclRx?=
 =?utf-8?B?R2hmL1JaMjFuOTltcFFKaE1qWXlaT1NrS1BGck9ZamxyQm9GZXR6WXg3aWlj?=
 =?utf-8?B?anN5cVQ5V3g3dmRlU0IwZk9QaWJDQ3FFTDM3ZFkwMjFzeGMxOFl4NXFVOTg0?=
 =?utf-8?B?MWl1aHlKRVQrM2QyVkdzU1hBV1lTSkR3OHl1bE9IVVE2bjBhd01KdStMbERu?=
 =?utf-8?B?NVh5Qkp2dEF1dkxPWFZhQkJwUlkvL21FRU9wVzRNcytRUWpGaUN5M0hpVVdZ?=
 =?utf-8?B?SjhoVUpEMkdBUE9UclYzV244TTJrR3BZM2hqL0grRldGZzhJSVdTNExEaG1u?=
 =?utf-8?B?L25Lc0VjOXR0V0FHTXVMRWtGVzJYOVBER3NJT0N2WFFQMisybzBOc2RVNEJn?=
 =?utf-8?B?T3JHa1U0YXk4MXYrNm5BZzM4NE81c2lmN1pRUVBpY3EyMWlIdTFRa3VaVzJi?=
 =?utf-8?B?c2pFSTRqdGpvTWFuZk9LM21YV0lMc3loQ3N5dTJsSmhKdmhHb2xmcFVCQWU3?=
 =?utf-8?B?U1pWNjdZd1djUU1Gc2o4ZFRxc0VObkhhMGVuQzRHWkc2bnpXbzhEZlNTWGt6?=
 =?utf-8?B?RkNDeEZMS2I3aGFhckhGYUFndEVGK0xMa3JOVnZFM0E4UXIvY2puWGZqK2Ru?=
 =?utf-8?B?dEVuNk1vU2NaZG8vcTNGWDhsc3Z2VEFCQzFNWW1XMEJPMmliUnNxSHpEb201?=
 =?utf-8?B?M3J0cm5YNGNWWm05Qi8rL2JhSlluTis2YUJieW5kUjJWUlROY1RQbW5iZk9y?=
 =?utf-8?B?eldWZ0UvbkpUemdOS1RoTG1NU3Zsd1o0TUlJWDNsSlYxeFY0c3VGd2piRUxZ?=
 =?utf-8?B?c1ZaNTI2UW1KL2xyd2lsdU9RMXdmQXFJd3p3anFZZG1vYjV4YWU2bEhsdkpF?=
 =?utf-8?B?YnBOVSt3NyttTWhuM3JSckJHSTc2UHo5M210Skxtc2hEdE9ERjdKbU9DbUdN?=
 =?utf-8?B?N3grSkhPcUZGQWl6UE02dkNuT051NllSNmZPbmpxQWNYMUN6V1B6cE1NejR2?=
 =?utf-8?B?QmZCeGM4dlphYzZoMmMvaFpEVTFQRkhKWmxQUG1oUTgwWWk4alVzVnBjMzQw?=
 =?utf-8?B?OVBES00yTjdCek9PVld0MlUyRzRoOUtWSWtkamUzc2tWRUJiL2VVS3dLNFQ3?=
 =?utf-8?B?Ymp6bURiN0FNdkhzNm5vcFgzWlhwVFJFOHJ0aHdNWEI3TDRQcmxQdnFIM0lR?=
 =?utf-8?B?R2VqZmRRTDZRV0gxVkQxYmZqUzdHQjFacmQ0MnNNSEowem9wbFlXbk1Bam9j?=
 =?utf-8?B?VFBTTVB5TkluSGJVUmJyQ2tYbnZ4VG5xS3lEd0ZEOFl0U05ENllpaXFmTVlD?=
 =?utf-8?B?VG9NVXRCMGJVRFlJYWt3bjF6azNXSGd4V2MrK3B6NERBUU1YOEQzcEZpSVMw?=
 =?utf-8?B?Lzc1eEc2NkZZRUkxM3E1S0dSaWdmYUN0QS8rdnBtcUcvY05oMWFXdXFQQjJq?=
 =?utf-8?B?cVRpSjh1OC9wTFhMZWJPL0htbmxHbEJGQjdEVWpLU3ZQWTRJM2lpTlphc1I0?=
 =?utf-8?B?VUlIL1JEOUJDdEwyN2lMNGk5ZXpTY1NEZVRmT3hqbXR6Q3ErOHAvWXhzLytr?=
 =?utf-8?B?TWVkUzZQUGVWQkppZlVkOXF5SmpaclBrMUxqN2c5MDhZQVpGTkZwdEk0ekVY?=
 =?utf-8?Q?WPPPnfUf9JldhACiafNxiENhryIx9fMl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37381e14-61e9-4960-3d57-08da05de56ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 17:16:12.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vZP4GMAwHV4kn1owav3UAQzUdqNTRFkpSUlZEnAwbpIH/5gHAZYMPGNg1A8snaapCFt/4P4zUDdi+vK29xVQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7611

The if_changed macro leads to dependencies being recorded in .*.d, which
aren't loaded anymore. Use if_changed_dep instead, like x86 does.

Fixes: 06ef696c85a7 ("build: introduce if_changed_deps")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -112,7 +112,7 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(o
 include:
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
-	$(call if_changed,cpp_lds_S)
+	$(call if_changed_dep,cpp_lds_S)
 
 $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 


