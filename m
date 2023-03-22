Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF076C455D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513194.793852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuB8-0007Mo-Vj; Wed, 22 Mar 2023 08:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513194.793852; Wed, 22 Mar 2023 08:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuB8-0007Jy-ST; Wed, 22 Mar 2023 08:50:42 +0000
Received: by outflank-mailman (input) for mailman id 513194;
 Wed, 22 Mar 2023 08:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7Yo=7O=citrix.com=prvs=438d02f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peuB6-0007Jq-P9
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:50:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b1eabda-c88e-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 09:50:37 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 04:50:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6440.namprd03.prod.outlook.com (2603:10b6:a03:397::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:50:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:50:26 +0000
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
X-Inumbo-ID: 9b1eabda-c88e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679475037;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pY8exfx1IZjSKD7cLN9qpvZqQbbY4izfJf0/6noi6g0=;
  b=ZCwOGbYkyG53Wv9pCc2PtNqvZF5oYJrlbVWv+dpe7E0A+JWsOLTroGZs
   bqN7WBjL9zAlxVivPFjQTIm/d1yigdLkhEhqk4NawfXC4fXAYPtA92VLZ
   /2w50jevA7vyXzGY2GAgKoH1eOPa4UOpN+GACjDsx3dSRyOhw1+h64jLd
   E=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 102245043
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2gFKMqhueWY5p6EUHMs75D2ZX161lxEKZh0ujC45NGQN5FlHY01je
 htvXW+CPqrcYmr0c9F+YYq2/B5Q65XXztAwGlQ/qSo2Qnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQUNDchaS25pd7q7+KhYbA3iJQnLsbCadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXirKI32AHIroAVIDk4bQKrvfK1sVCdQd54C
 14d5jEjj7dnoSRHSfG4BXVUukWsshMZWvJRFfM78wCHzqfI4wefCXMARzQHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTTQNSBYI55//oIA5hw/LUv5uFrXwiszyH3f32
 T/ihDc6r6Uei4gMzarT1VXOmTelvJXKZg8z+ATMX2ih4x95ZYiqfIih4x7Q6vMoEWqCZlyIv
 XxBkM/H6ukLVMiJjHbUH7tLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfUvC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:HLTCXq4Z/zxNWfEISQPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HnBEDyewK5yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh5ZgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5am854Ed3AUV0gK1XYdNu/0KDwQeOALP+taKH
 LKjfA32wZINE5nJvhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbonthrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBKlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpL1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjvkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ2yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBTaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg1HwqV2GLHbQI/xllt1EUuWWfsuuDcTDciFhryKYmYRdPiWBMM
 zDf66/AJfYXB/T8MhyrkvDsqJpWAojuf0uy6cGsm2107L2w63Rx5rmmaXoVfPQOAdhfF/DKV
 0+exW2DPl8zymQKwrFaV7qKjzQRnA=
X-IronPort-AV: E=Sophos;i="5.98,281,1673931600"; 
   d="scan'208";a="102245043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwpmqBYxMUxVG7j19eXDsIRNVG5KAjjTjW7Onbr4YlVHA8RwuiVVSEITBKxcJ2REu73tyOX874Oq66rwjxuoe8yXpnRmhYrA54GaPT7BC7QPeITH5lPD/9OKUFSSj4C2zvFV3S/GMiR7HPK9ClQTvs2B8WI//BxJZxiU4sAL/4LiodeYesDg2unbxlpxi/CZtt4OzxK1yNNN/0lyccI238jq977kv7Ha5t2eXXV4jVIz3pFxG1f+vmZKECwXaSF3U68Iy6vfX7xHjSa7WnOfxXpPndHg50gHxbtY2aOfCwvoTXdQwYi2Hv60eCegqvbh2zJXSrR32rhjBah7+3Msfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pnfW6tg+autIO/0KDNhKos0hxzEv5nQYLdeAXdUE4w=;
 b=CLdvC4AFbHqKK2paf7DAD5HcRwkR8ZGPJnldtTJJ8otz+2UcC0UlDQK5U20OUkFvVlI19SdfbUBU1kaiHAEEJtx79q6YDYvT+wMmtka/EQFD7UqIFISzlyTyINUkljQh4FCdsSXGvjY7K8nc3lHHQwQeFp/uDcUvFC6/Iwp9H6MiBFIU94+OUPDWxLcDQbEacsupRj7bZ1tfPryIR7S/vyGb6YyfnGVB4U5Jv2kQ0dhUidei2FgBE/l8a4dNJmErN9RDslt8hkb88YlKGimKUOHD/Ds9BHxtVksC0MVq4IARsH15622mdfxbk+u8oHJ+JQi8qSSHssu+HjevfTdtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pnfW6tg+autIO/0KDNhKos0hxzEv5nQYLdeAXdUE4w=;
 b=O82rBspQYPiomHWsUJ0FguSdzqGjNHVS2XK/9wCb2dMW/n5a5Cm3Y/8rUcxWHSENJL93evDicC7Y/ZrFGGuBYQMfOjzn7iYZv22/6zkShgmTPQcow/qMeDUReMi0PX+SwS32TIoYjwtDUP5w6hOuQOHyDgGr74xWGup88k5lrZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f8498416-ef2d-19a2-ca4a-521d93eb6be6@citrix.com>
Date: Wed, 22 Mar 2023 08:50:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 4/5] Build system: Replace git:// and http:// with
 https://
Content-Language: en-GB
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
 <cb23cf003905fa56119985a4ac9a84e9510ad235.1679412247.git.demi@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cb23cf003905fa56119985a4ac9a84e9510ad235.1679412247.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 49eabae1-903e-4e7a-1a87-08db2ab27b04
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1LB/Q1pSIq3HeRPC+71+gXEBxqVKd/qMX57NVDgAboSS69OaXTHwIBO1yxpjopa8TLZoE/vV5TJ5xDC5TIFPJ0XdTVh+eYIrfhenDRA7i8CHfYO4F6uZ8ZonvWi1/NGbPbgIUGV50Cx4adS+k5ydloOxX6vCCcB4f2aG8z9vlfVC6tAfbR/yBLPq9fNp73uNlXCdJNf6UVVeK6DnHrPk0lee4Y7ETQ5bW5yayqaTKDE0h7E/7wklwTJIbW9BDTDMBksEUldhccLMEkVnuJSA8FjoTzhF3bk1jol7ZobJYCq6Cv6dwyaPYCCmMYTput7+ljSjugYS6JK+qemjRr0qSqlT+MQli5tEGCxmLZW8PVfAcS3Txx8aB4+r+1mCFEm4GSWNbcxWqjNBwOeGHSlFc4uX31rLLMuhYzIVrTw6IPS73VPn68jFJqskq4BTG472WEr3a9IHvBSRjSK6W5vLjA7zOiKSbvwaJqp6f40CC8joaJBPlmlA4AgA3W9wJzwG6BxQj2fdBggznohRcbUSEMMABzRWRCGE9QWWBKlMZk6HIm+9dWvMWdr1IU7mLtlk3FoPf+lp0R8zyHkRtZdq98TOwfBoANm0TKyFnI6eijAg3br8WDMMSYtdCP3Yap/diEth48LHVVkaWM2n7b1R+cjApADrDsJVag+Tx2ogWQ1DPDGF+Lnt3jJPXroHua9jxyN1qpPV1uK6qIv97GZ1s4aDWfV4t496M7dLKfbQP1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(31686004)(2616005)(6512007)(54906003)(316002)(6506007)(26005)(186003)(4744005)(6666004)(53546011)(478600001)(66556008)(6486002)(86362001)(31696002)(38100700002)(66946007)(2906002)(5660300002)(4326008)(8936002)(36756003)(41300700001)(8676002)(66476007)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODU1WGZhbGNhMVorb0JINGFjUHVFSk1idDczamgyR2VQVDJzWlZ3Z3l2UExu?=
 =?utf-8?B?dFFjN2pmYWsyRzFRVHpOSkg3Q3UxY2ltY3hzZjVxZSt6dC9tTWpYbXF0Y3dW?=
 =?utf-8?B?eDVGbXVHemJEelZveWo0alR5OVNBVFQrSmdzYkFsdHpqeTRRVGp5RDVvaHlw?=
 =?utf-8?B?YXJpUzNUQzhMMkVYd05zQkcvTFk5ZWlyd2RoOEFGMk1FWDVqUTFaVkdQZFNv?=
 =?utf-8?B?YWJ1YjRBSmwxZzFwM1drU0dwL0NJOWM4cnNWTTk5b2xLdWVTaEJHeTRBcUxi?=
 =?utf-8?B?UmE4OGlmaEhITnIxRzBZUitJeHA0VzZaL2VUV3ZqcHFyMWZVcDlSa1ZpVVRJ?=
 =?utf-8?B?ekFiUk5DNkZRdCtXUFpWcGJPZ2NyWU5lTTl5cjBCK3JWSlAwSmlSWEQrY051?=
 =?utf-8?B?U2NOc0p0Q2NJaE4yMGIxRllSSkJTL2wyZnUzc2JEa3lHbmNHU2lCU1RzUVRz?=
 =?utf-8?B?YlNZc2pTa0JhM3BJVzAyaFc4dDd6M3FSZU9IVE5zNVdYeERyTy9zZGdiakx6?=
 =?utf-8?B?MnFpVW8wWDVuSFpxWEVPbVFsYWJkbjFpTUJsZnVjcEpoVHN6NlpYbndhSUdU?=
 =?utf-8?B?eW42K1Zoc0ZDaWEyd3VENE5Ra1dFbGJwSWl2cWhhc1FJV1FnUEkrcmgwdWpN?=
 =?utf-8?B?K3M5T2ZPZmdRMU1GUG1wZnNPb0FDVXVUaUdDOERRTGlYc0JxMlV2Z1pGMit6?=
 =?utf-8?B?NkNyT2QzS1VmM25HRWdUTUg5eTRIQ3I1anU4L2RPT2k3a1BHL3grQkhmbHl1?=
 =?utf-8?B?T0pFT1doRDRsV3kwUnprNHpJdFVzWnBpL2RxNWlEc1psWitmaTVQN3ZGU2pR?=
 =?utf-8?B?L2pnVkRkaklMZlB1aGpjdXh4aWhqZ0w4WXlJWk91ZGgvK0J3eUZrRnNmNllC?=
 =?utf-8?B?WVNEaVF1L2FsY1BlZ296Znk4ZERKNDY0Z2ZWdlptZXFMTXc0RkZ4NmlKOHlF?=
 =?utf-8?B?S08rM24rMUlTTzk3WWFXcFFZbGRXOWF1Z2F4S0FPaDdWTlZDNXVUaE16SUhE?=
 =?utf-8?B?dzlYdTJQWUVmdW5sRTRkVk9LbG00YkFLZjJKWTA1QXFJblZaRkQzTFNRQUJT?=
 =?utf-8?B?cXpGMkpRZXJRVWd3Q29GMGR4M1lpNFZaQjJZUmZwWTdVQ2NXWEsyM2pwanVZ?=
 =?utf-8?B?Qk8reGRTRjlKWDd0TldDeE1IQjdiNHVvYkl5Vkl3dXllL2lVcERXZ2JnVGVL?=
 =?utf-8?B?SkdiUk5OOXNVRlZOQi80dzFtWGtIWXIwYkhqd0hHU2J3cnZnVXBxdUthTFdS?=
 =?utf-8?B?VGdHUVVIUnpiZzBDVmtvbE9Gam9WcVpwNEkxcS8wd2U0WWwvNm1namtVKzN2?=
 =?utf-8?B?bFRiMWduKzlvQjhEY0RMaXFsOG1jT3hWRmRsWVo0bVBsQUU3RUxvWTJQZkpH?=
 =?utf-8?B?a2JEYXovQVIrQ2hDZFg3Zjd2YllxVnpnOGtZeFcrcW1JSFgrcCtOQktQRnBX?=
 =?utf-8?B?ZnVwejVkVS9EeEIrSlQ2YnpqeUpHMkhJK0ZudS9oSkJZWEROMXd5Z2Q4UTlV?=
 =?utf-8?B?TzY0RHl1UHNoenBpdU92bkpybkVTMVlzZmNCM3hhVVJJSnd2SER4djBzTlhB?=
 =?utf-8?B?Sko4QSsza2dRSWZIU0FyWTRnNXNIVDAvY0l5MWhjVnh0WmszaUxXS1dBVjNu?=
 =?utf-8?B?aHByUGp6aDZlN0JvVVhaa1p4YzNYUEJEeDJBZ1FUTVNjK2tKOEJUVXNlT0Va?=
 =?utf-8?B?YXRBTU1oSG1DRmpSQkRNUjRaK282Q1BMZ0lqMlFHRHhRbjdRNUpDVHhWbkEy?=
 =?utf-8?B?Ulp0YkRZRkFQdmNZSmtQMVN0Ty9QVWZ3UTVNeWtYNGtRSkdYcEhkY0c0MFJ2?=
 =?utf-8?B?eW9YMVBNUGdBRUxTOXdDd3BycFdrc1hRdzl1c3cvTm0zOGVBT25pSVhJLzdE?=
 =?utf-8?B?ellJNGJETnA3RUN3QjNnWXhsOUEyczIyK2dKbnM3RnM4V3NyQVU2bkc2Ni82?=
 =?utf-8?B?a2ZVNGpCbkxYL2FKVTByalF3YVpSU256Q3VuMmVibnorNjF1Qk53V1k4TUh5?=
 =?utf-8?B?UU5MYXZuUnhQS2dFOGZqWTBwa3RFMm5sc0FpemgxRnhqOGROM0ZFT2xOVUlZ?=
 =?utf-8?B?SmVBazBibS8vanVuY05NYXR0NjhQVU9uT0w1UFkvYU8yOG51ZlJ4bGZpMXN2?=
 =?utf-8?B?S1N0NnN6R0N2TVptTTU5OUUzbXRiVmdHOHF0Y1RncUxFek1ONDF0Mm1sRDhZ?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	444LXPouWsC/auhb83HqEugmW1+5cCxZRtb495BSfRu7a87DEI4R/X7FkfZ/A4z0vGBKU8/+Vxes1Ql77o5C7CgXAwT+BAV+8pi72sGL7dLt70ze7oN5ghUgHIvNJi3k8vc4Qh9EaWvp77sjFC8XHh/BG68gGN4RjisUXykdY+aCcfiV68wvkHMTOqckpACsmoqmK1hUByjRQuc7IX/FXcpgnUVnvTsOdP/wFaE0OCDeSjwbVNxmDP9DQd2Zhe3Fg3hHaSnjV4IkQG0uyJXrQm63mJuLXAMSglw0E42G6gfCIzeTw1w1nHRK/lw+kPvG7pdhusfqM7B1HEKdEwX4YHH8ISOrca6qRJUg15Zu75nvxJMXUIEzG9rB45akBAv/VdccVpenBFwpXHRA+Q7QvpRiQyQkM4592yDGfZNHWSnyammwrGkzL1vQkSJIyqHlAsk7PLq89OA+T+B3fZemF72aABQxUmGwyIj4EAQVafnHo5rIQQo+JmrnxtowFPSJKoJ6KtIlQDsbqaXP+5nGPYQ8hwY4YhIBJQT4T8bn6gbQfXsBCcMPVG+ntH/XAq0iw9yiqZRQBtFxz9Lx/v/6BW+gzDzmym/2UUEQ/7yZi3Zg5igW1MbT3PSVoJR2o3mzfeB2eItXBmuAgzt1vExVl+YW00vt85qO0ICLD7JDyXHu7ozN4DFhfOKqSw1XmQzesCT9AF63TTKLfei6G8oUkMX1rP4BuUByHmFuSInyB5nY8+WJlMnEeaIxh/4sT5OBHHl2SkLQgTaW6OtIO7vJeKFmHd8uRr9w57Ko1KkwVswaBDV1nzkWWlvLuVcd7VP2usOKsD1klxilOIpFGGAvfJUWxr08fPwcoYGLnzNsZL3ZHzgsgH29239Mmod5LfN29rET+3/ormhMETMzMZ8DUA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49eabae1-903e-4e7a-1a87-08db2ab27b04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:50:26.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //1mRoYcKfisG3IPPgx4tp9spdhGehfmlTlpSnGJBGc3/jGkIYA1fk3UP/6QDdgOAxcUyU5MViNvqLsZhOFmq4BYpxjPl3Oj1IEQffFLpe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6440

On 21/03/2023 5:33 pm, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>
> This patch enforces the use of secure transports in the build system.
> Some URLs returned 301 or 302 redirects, so I replaced them with the
> URLs that were redirected to.
>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  stubdom/configure                 | 12 ++++++------
>  stubdom/configure.ac              | 12 ++++++------
>  tools/firmware/etherboot/Makefile |  6 +-----

This drops the final reference to GIT_HTTP.  As you're modifying
configure anyway, it would be preferable to drop this option too, for an
even more negative diffstat.

(Probably ok to be folded in on commit.)

~Andrew

