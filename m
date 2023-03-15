Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F86BA8FA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 08:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509915.786658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLUq-0007jE-Di; Wed, 15 Mar 2023 07:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509915.786658; Wed, 15 Mar 2023 07:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLUq-0007fo-Ai; Wed, 15 Mar 2023 07:24:28 +0000
Received: by outflank-mailman (input) for mailman id 509915;
 Wed, 15 Mar 2023 07:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcLUo-0007fe-O8
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 07:24:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ac9713-c302-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 08:24:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7573.eurprd04.prod.outlook.com (2603:10a6:20b:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 07:24:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 07:24:23 +0000
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
X-Inumbo-ID: 69ac9713-c302-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNaNuoY4VM8ewDmseUKih7nXLwWLmmGS1BLb/6rL09JRY+OGWyXd/kVgoOwx5z0ABqYb7VgFXxu3c+eLxMfntZAbzsz0NwXg3XQtxr6/fbdtOBAiGFOE5LLJjRLi/YUmHXmwfZRTIdP7h5EUVSBq9U+Bzd1xy0m+gaYHWnevj1w8gBGe5WMrK/LJSYpjmesCULsEPex64ZgRJUWlE1y+JU9iHUY7cyZnfWnJw7fRTxZ/57V05Yfg/bnwpAUtudaM73/PoNxs1zvSJ0mlg/EeAtLw0Ld6Bv5eAzww8usmQY/eliXlLus/dZ+QETYmAjTugwEq6brFQuERMo5pvGn6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy43YTDBLchV6lc1Ez9wzpmHlHRHzwz/MU0HLqd7/t4=;
 b=HNhrZ6F9+bYF7eITvxpawp8bYSmzrKj1YTOQS1LUZxlEgeoFvZGtaRejC6ssZlakvPL6TljwOHPDm0XFe+QTp+NT6z6vv/NuR/P2SvhrKhtMx5gazNVX/e+TCn0qqo6lT9YB4mOYpcO2m1KBddUnntZg9Fbk++SxQ3peg+p1zZr6TnSl8dfxRCXvl5zR/DEsNq21ph/r+fpm+oDplWqWWXGpSoM1UbvLhgvTppmy7RjOHxtRJfKOVxzjlpif7Sn6RW+/oSjXUdHd9W+IhT+iIQetU+xwyrhgwFPpSWuze3woCWFG6YnWCW1NasC6n/PzXJ/edKR/C/iCaoqDWUNaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy43YTDBLchV6lc1Ez9wzpmHlHRHzwz/MU0HLqd7/t4=;
 b=P3G9VoHWW2nSBubaySN+OeKiMne756Bnx5PzeYwMLcAPvVUEKxjvm3++QR6kE10a0qrEzdNSdLYN8tHvz82Du5Kql3y/ZUTjRKUeR78yFQG475mF/vwEJHJQVO+7UM5Xc69msaMSdDT6xx2gEt54kygQKr4ARK6C/JnQUq4G4xkGdA5f4QFLZMc4+c4JBD3fEkA7l0ExVNlAYYftojY5UJoIXLEFN0R0yCkVTXsbAiM0tn7W8cI7Gn944PZusI/tqw9keWGZ2rkDnLFcsEcOugaWFNxlGLOleKwcjYQrI31kwv/CgJ5+p/B0qkVZgo8GADdCDSaLVnYIgF6fb/Ohbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5aab97e-08d8-c5fb-0898-6f414fdd7a25@suse.com>
Date: Wed, 15 Mar 2023 08:24:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] console: use more appropriate domain RCU-locking function
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: dceabed2-55a0-4f4b-b3b9-08db25264cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D0uaYYemXMCVOsaY2DQwlitx7oQJjUMKksS7oWBhhtGaue64spvJMPVuKgLRgletmcuaP0yMNeKovom2nSZANwRnNIi48pShF9FGrxbplgvOZpkNeRiv/yEP0xsVYAuBiPvloakCFdyiCIqT0/4c6VRxjsJz1TTXE6ZPFclzWcTuqXZ0IMajvgL2kESkiEoOgOcF1nHgk+wlW0EDDAqgRuhdwwh0t11HIIHdn1DRoCmZ3DQE0AB7RPgPtzfjsJQlHaxSJFSSrRjelZJS8DHwCNjCujRItNMR19gq0YLms6wnf1XkiG8NKwS2/iDkACdBogzpLql9Vpu54m1Es3bwtPuTLM0njCPdRqLLp0/K81w7FSnEMJQOcYHLhMbNqNuobZlCrMU7p2St4/hbEFLKwtNBYEDSUpnnESX44WX+kD0PT4UpXZ4SViVs4lMqYsSdBwYuwACLIeIuEQs3M8Ft/2VhYMzAtkj960kpTmzOcTg7DIDqp9y5LxOcnA+TdPtTDjp0UqDIU/fo9c6Mbp6qlsLUi4RNDckrza+vz/hTexm/vJ4CpNi+wAmE6g9dEsmsYQyDVoUNdqjGKzDINRZ1rhF07szhNHgh4IIuJXDIppD+rTc5TnX7u66fe/QZ9YSTkf0G5y6xjNaWr/iN2P2E8aGOmJhpAK/PnfDH9TnMYYp1oop0ydgfA9a6eRhoq6jBqCprp1oGxP97/7yHcFTurX7BMWgS4CfPC4ho/66epvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199018)(36756003)(4744005)(5660300002)(83380400001)(478600001)(186003)(6506007)(6512007)(6486002)(26005)(2616005)(316002)(54906003)(66476007)(66556008)(6916009)(66946007)(8936002)(31696002)(4326008)(41300700001)(8676002)(38100700002)(86362001)(31686004)(2906002)(66899018)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzl1MzQrZ3hYS0lRRVZxSWlGVmxMRC9rc0lzazBGVmp0TjdRaGV0Mng3WGIx?=
 =?utf-8?B?cmtxdEwyMjVZQ3MyV1I2dlQ1NkdjZDZaM2w4OEFaYUo1K0lKSmhtRUJpblpI?=
 =?utf-8?B?RTRLZTd4d1BOZkY1a05TZmdrZU0vc3ByMTJRanJQN0xRRm9hVHdxRWRDalRK?=
 =?utf-8?B?ZEQ4WTBFeGJRUSt3eHA5TGFLYkpOaTB0Nm9seWdMbTR2Rk1YTFZoQ0pHRUwx?=
 =?utf-8?B?SEFpY0JneGcxWDlVamZLQ3VyNEZFTERGWlloTUxaODRJcXd2b1BIbjhCSEJD?=
 =?utf-8?B?ZkJYNldhNnFOR1Q2QlFzWHYvQlJ5U3JOM3RSSkdwaE01SWJLaUhPKzdncVhz?=
 =?utf-8?B?TmxBdWRXR2crV0Q5bzI0MnV4N0ZaVmU4VGRQWllQQzk2S1FEL1UxUjZQNUts?=
 =?utf-8?B?M0ZmcERIN1dpT1JHdC9JT0thTWFNWHdpRkN2ZGEybGM1T3IzVlZJZnZBRFhi?=
 =?utf-8?B?dkRLSG0xQjNmbFdNK2pYaGUzWTdOK3N2N3JsZG1hcHZQWmFUT2RnSFhyUStG?=
 =?utf-8?B?ZktaQlRoN1BhN0xQaGtIOXZxQVVZOTNWT3lIYlUxZlc5TjRaSDdyVi8wRGxu?=
 =?utf-8?B?YytsVUlTWU5vMUpMU0RlOVpwd01CMSs1YW5jNnRvZ2ZtVkttK21DK2w5SHZ2?=
 =?utf-8?B?NGFjeFZNOExDc1V2aFljUGVaRXg4VHM4elY4VXNRMHh5SmVVQ2xTVDhnSzRk?=
 =?utf-8?B?TCtDMnV3Znc0K3JSVnlBK1UxWmdxTG0zNFg1bjdPM0tONjlmMXpUMHdqaDBR?=
 =?utf-8?B?T1Nrd0NBVllGRHJGWVNmQWZFdGREMFFhWDd2aEhla2pZaFB6ajZZRmZNSUY5?=
 =?utf-8?B?enJHUlV6Kys4Y1J0eEhZU0lNeEQwWTBWdVhsc0pZRjFWaW5FOWt2VEJpYlcr?=
 =?utf-8?B?MG1tWXJSVUxkWjU5aElFUkdDNWU0VENkMk1IbFpaQmY2L2VpMXRCM1dqZXI0?=
 =?utf-8?B?SytsWEE4dVQzRUx2bWx4YWFZN3htcXBkTHFaeWxUVVBzY3dHZWgwa3Q5QXFO?=
 =?utf-8?B?Y3k5S1hvbjBiSWRPRlYxU000ZFdYcmRqQnRSU3JkN3loOW40UG52SnVjU3Nq?=
 =?utf-8?B?eVovMEVsUFNrZnk1ZENqbk0xeFRWc3NmMFBOSnh5dmEybkpXN2RtV2JoUlMv?=
 =?utf-8?B?R2xkUEdjSUxLRGFvUGRya1d6Um1vT3cybC9tanJSa2E0K3dNK042MmpJZFdM?=
 =?utf-8?B?ZWZ4MWFvN01kY0NhWU1XZ1kzQTkzeXFYaXlMb0VoTzk5RGtpUTRhOFNsRW9Y?=
 =?utf-8?B?STU2L1BUV2JveUpPanBDbGVGREl4Q3hTYkwvZlRLeGxXZHIrQThKdEZRSkFK?=
 =?utf-8?B?T2ZtdUpSRDlqYVlIQUxYSGZGTzVKaVhJbHNMSDBYNjNRb1h3TEpEKzNwSjBM?=
 =?utf-8?B?dFcvNERMOHJzWFoycDJjOFV3S2RDTGtoOFlJVmgyZFo5UERrNkJoQ1F2YmlE?=
 =?utf-8?B?VXdkWjhJaHg5c0VlTzdKSVhSRC8zSHhQVlBGOVNieDl6OFZQOTZiS3Bpdmg3?=
 =?utf-8?B?UWZpVmFFRW0vbWxFbFhzckFKYWhBdVNBaTlaa2VtRC93bEx1SmJPN205OGFP?=
 =?utf-8?B?T2F4YTNSSVRJVHY1QlZ1ZWRLM3duOVo4azBodDUvTzFURWNqTGpWMk9kbjdZ?=
 =?utf-8?B?c2ZjY1ZadENTRUVJNnBqSEVKcHMxeWZsVmo4QktvclpaWnVFMEFmWUFaQURI?=
 =?utf-8?B?ZEczOFpvMEFUa20relNrVUFaQ2pRTG5DZ0dlVEVNSUZ4MTFscTRqSDRYRFA2?=
 =?utf-8?B?RExYdzV4ZllWaHAydkNvQm9BQkp4SVRDaTNJaGFLSTVCRW1JYVhnR3ZIQjdY?=
 =?utf-8?B?N3B1NlpPeFJDNjhhZnIwOElWR28yOTVYaHhLeGcxQ0U0bU16Szl0RE0yVStI?=
 =?utf-8?B?Y25QaENJS3Z3Qk02RnE1dXZ5R3FrTlB5d2tDZW5MVUJtZllvYkRDRDdPWm8v?=
 =?utf-8?B?VDhUN0hiWXgvV3d2QTkwanJTTDYrY0c4VkdGdTNXLzJocFl0QnljRkZvcU11?=
 =?utf-8?B?QnFQanI1Nm5QdVl0RUF1clorUitIRzV5STNRWXRHRDZhNVU2eXpwWU1EbSt5?=
 =?utf-8?B?aEF5YTFodnVtZEdpVG9mRFk4dERPS3NycExWUFpoOWJuSElsVmdBV3RyMW9R?=
 =?utf-8?Q?t38S2p4harn0ozvMAYVCKMoRC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dceabed2-55a0-4f4b-b3b9-08db25264cdc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 07:24:23.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mahzIxcqnMqwYo3vF5vWWohDdRpWv+9aYkFc7IuzLjKSDFwUD4FFSg+aAhM7BXwCRy2DguFJP1w+ID2pyXEVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7573

While both 19afff14b4cb ("xen: support console_switching between Dom0
and DomUs on ARM") and 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used
by DomU") were part of the same series (iirc), the latter correctly used
rcu_lock_domain_by_id() in console_input_domain(), whereas the former
for some reason used rcu_lock_domain_by_any_id() instead, despite that
code only kind of open-coding console_input_domain(). There's no point
here to deal with DOMID_SELF, which is the sole difference between the
two functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -525,7 +525,7 @@ static void __serial_rx(char c, struct c
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     default:
     {
-        struct domain *d = rcu_lock_domain_by_any_id(console_rx - 1);
+        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
 
         /*
          * If we have a properly initialized vpl011 console for the

