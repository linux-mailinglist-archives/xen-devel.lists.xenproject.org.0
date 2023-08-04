Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7476FA20
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576886.903542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKx-0005ey-Us; Fri, 04 Aug 2023 06:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576886.903542; Fri, 04 Aug 2023 06:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKx-0005ca-S5; Fri, 04 Aug 2023 06:30:59 +0000
Received: by outflank-mailman (input) for mailman id 576886;
 Fri, 04 Aug 2023 06:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoKw-0005Xp-Hc
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:30:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77f071ab-3290-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:30:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:30:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:30:55 +0000
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
X-Inumbo-ID: 77f071ab-3290-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHL+forgOo8Jz3YB43ApbkgYBg2Ym6HtSRpB1xb5theZTI7WcXi0EMdMgrJUx/dGE7+ur4P6GWsACnfNszNGZVPFoglqOde7OzTyV2ZRAjSswpOzzTFueaAND2UtSURr2MMf6bW6CKV5PTfEjSE8qBAXTX6OLUBu9DzKGspD34XVkeuVi7fcJqKM9VPkdW9Ruc0fYA9SHJwVyzER5LX01A0dpTnzsyfVhpvDMhAnEh4YYKAtAKWEdb/541T+aKyX0K50sl+nAYjV7bQTJNanazVqKg9cqvKbZ/cTLBUxAwydX5HY5+WW7D2CsfYD8u+Tsmm8uWLlPhXZ5T1KfsMBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsniVDfE1jEbPDiRAa4YFhSNPmca1KwD931ycm8eIt0=;
 b=crTiQ8ONOTkc3IHEJZi28WmOQ3iy3mRe/vlktM8MaycHpqarVU5yN9XXjiSFJCgxrNKSQDuKFaj4KZ6wRBlKQ/qJ4pP36TIF7plZ2pbAulyhF84U9qi+IlaQzExuHq/NpdAbcyn67JmdTVY0RpzDVOLFasukq6MhTqh/1bYnes+1JXiwhr/t/tRQ6OGgG4F7bDxw7zMmX+Wa913bkjfvl8t5fRKoUa/4TK9IMOp+lrEGMq77JUVjAmC+YkKNjZWiYl9gYHgNjfiGOVf0pmnaGxT0ePjCU3g3B0yow6djbuPA5EUZOnjKqTFudLZaQ3BtQKXCWMs1wIvleWwIQBR67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsniVDfE1jEbPDiRAa4YFhSNPmca1KwD931ycm8eIt0=;
 b=gnON6k4R+Bo1aizJX5RqPtvVurC6OWcYFHsKWzkseCB7pRXVqfCAUUH2jN0Ms72Aje3o1DStulE1HnYpbTmgHyeRRZqyBA8xLFoCpd3oE3CoAAtckM8Yq6yYChH+9ia66zyT3zEsAju+TuRzGg86QYaM0YFRurBFcnqK6uu0w3tn8oA5gWqBOeClD9n1FmNVjXufhFl6zcouAKBHm/+Lx+qB+TFywO6auHOmG3g3cYU6DO3NT4qUaJr2fhkfPArFDVwm1CZDmBLLkSZ+T+g3pDBNVxJDWe5Ame7V0+dDEBBDSG2JXaXVOZo1ryiBVRjRup35ZbdvR3dR2slFDA/c6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2315f865-cd41-b0e6-524c-cee57e748ba1@suse.com>
Date: Fri, 4 Aug 2023 08:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 6/8] tools/binfile: switch to common annotations model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dd9fa7-a0de-4629-c9fe-08db94b45b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZBOa+k3szAVW0vsxBeYTgdpoulw0YQT3Wd9B4p3m9kXbf+S5duWzFR3z6uFx13WcBQMksVTJhj/TC9B+osz/biRN8Z6CAlMa50a8c8K3WIrpG6besplM/NECCPt9Le+smvoVcbMaM0Z4mwHMX3T2PGIEJD/RaIFZPp8IKsH7DtPuIW2TChrvbm1M4/x7xjxDRVgW4oi7KW59XGknmq7H7p+P8MXW0lhYuQ/c9mfQjN8JL5yrzVeUTGQIcDRbSmfFIq6n9jLE8ABv/7jltIThjblt+pYBX8zx3s2meU4hGLtX/s2JVKh742K29SLIlv6o8xEplCW+GYKO09ECRnW7ojE3ECr4+diUIA8mZ8SuiieEZscYdUnXf6Cat8zPL0Y5zQMJN7yIlA5oolGF0rQRYDfLomrQrkSBvxZ09NDTEnuCeUC/SZ+7b/5TFWYc8cJW/Br+0yef2p2tA80VI3JVzx7tw5m6RD659i7X2fjlGY9pe1rngjtMfTrUOYs+UAfCA7G5YqJd7X7513oGHA3tZIVLthKjTlhitI6lIM+BzPf4nqYxnJeUZ2iEvgQAtQQWoKgou9pnYu1o0ReKvvm3cpN9/g0ZAlc2MDcmHg4KT4zH+KX6ki1+c68ZfK4aqPSU5+ImLO3w2h2K6aee3+/2Pg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(4744005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlCR01iZGl4MTVUNEVaR2hHc0pVai8zOE5VSEgxcGs2b2xCbVpUOUJCVGQr?=
 =?utf-8?B?RGlJVlA4dGhFdmU5dXAzYUZ5WXFrQkhpeHlxb2pXNGtsVnVTLzdHZURXZUpj?=
 =?utf-8?B?MUwrSnhKYm96cisraG9sd3ROUkVHWHFOakc4NU1lRmU0ZmNWamJBSmkzMHUr?=
 =?utf-8?B?S3FEdzkzWXJtVWJSZUUwY2lEWDVvOFc4T2pERm5FYlBoU1V4Rkp2TmJyREFx?=
 =?utf-8?B?YWhsUi95NXVQMHU4Rjcxd0JsOWJ6bDNmb20yUUUwUmV0MGZMcFkxTEpwVmEx?=
 =?utf-8?B?MU40djg4R3l2dFBzNldMWVF4czFKamxMSS9qUXZxUnNoYkFsaHh3MklZMVFY?=
 =?utf-8?B?R2lESVBmeTRGT0NRdkwvWERlYU1rdHNUdVVFOE95c3U2aWhKdnFIMmxqYW8r?=
 =?utf-8?B?MWlIVC85aDI5dTBtRlp5b0txTlpDazVNQm1zeUlRWTdLY0lHZURGZWlxdHVS?=
 =?utf-8?B?eUJ1ZWNkRWRQZ1k3MUlMSHhML1EzcG5GWXFiZnl6bXR1VU1OT0R5NXJrMklK?=
 =?utf-8?B?UFU3bUpqQVVNWkhOYi8xQzhUY1ByOUViU1FoeDZ4a002VkdWeWc0SGpFc1BD?=
 =?utf-8?B?bEZ0RHBaaG1FNFh5K3dlRDNockZOQ3NtN1pLNlFMMTFQWGMyTVAxelF2TFY2?=
 =?utf-8?B?TXBnYVA0bDdZdC9QemgwbXhNRWJISXlxbWVKSWp6dHA0STlUbm9zZ1g1VmRJ?=
 =?utf-8?B?dGRIU2FUc3J5NEh1bm1UREpXekpKSU13QUV1YTB2VUV3MDIyYmFnUHJHeEJ6?=
 =?utf-8?B?aVBHdmxkQUhlY2RPWTkwalczeUtwekZSREpBa2Y0WnBXRVpQMzgvWmxGaFBR?=
 =?utf-8?B?MnVNU0pqa21uOGpUZW54aFB1SHRQeHdTQVcyK2lWdHE0SEtRMW4xK01qeFY4?=
 =?utf-8?B?WStYUFhOcktxT1ZGbVFndTlYY3ZMVXNjc1JDT2phYUpuZWdvY3NBY2VpTWJV?=
 =?utf-8?B?UUVVbkVmdW80dk9XQVRDdEhJWERIWDRFRFphV0lpU2RxQXFVcUpocytpTWlv?=
 =?utf-8?B?TEhqQUwrbzdFcmd3RDRCM041Y0liWDJ3b0lHdWtTQjVWTUN1ZHNGaEZNTmFV?=
 =?utf-8?B?NHcvUDJXT2Y3aVR4SGl3dnFpRHZqbjdjbXlXNkV0MkkvZlo1NFc2UnlmazZi?=
 =?utf-8?B?SUxDaS9OZXNTbE5yNWRFWGtCUmRHZm1NRGw4YlZ2OFFHaU1TZzFwa2tvUGpa?=
 =?utf-8?B?TzFwVGc4dklkUHNuZlo4T3hTSndkM0xacEJmSi90SXJXYVNlUG9FcFlWOUFD?=
 =?utf-8?B?NmtTTWZNdG92aWllQndPcmVndTQ2ZzJoRW1uZ2w4Yy9rTXVyb2Z3eXlSN3Np?=
 =?utf-8?B?aE5JdWFmbUs1SEl6NlcrSndrY0JDcnJJRys1a2NUa3AyUXk5ODM1QmFWVmhn?=
 =?utf-8?B?Q3oyWXE2TjdmcEdXTURtZU4wYy96MXVVWndtTXJNMTFlMG5ydVJTN0NsUTFE?=
 =?utf-8?B?QTdNakg3RVlNWER5L2txR1ZjQ0s3VktTQ1J5SXQyWndGRmdYR1VHME85T0xi?=
 =?utf-8?B?NnJwS3RGRFNWK01mWnJIN3lmV0d6YUVjRE1aOGFodU1Rc1BsT0RpanlFckpC?=
 =?utf-8?B?MlJ4ZUJXdGwvNlplSGkycW9XaDdJZFA2NVJ5Rkk0STBDcS9SQXhuWEFxOHZR?=
 =?utf-8?B?ZEIxMW5ZNTAveFVuWkpna0Y3Um5EMGF1VUlEbGR2YjJ6UUI5ODlrSzhHTWln?=
 =?utf-8?B?ZVNjT1NrQUMvMWJoSUlSdmxWZXdaQjdlMGpzaC9UeGJ2ZnY5K0liSnZ4S3Mz?=
 =?utf-8?B?N2QyLzN5UjM0MDBSS2ljb2IzMXlOS0RzUzREMUhBOW1WMGJLZEtMWHlWeEVX?=
 =?utf-8?B?RTNocmxZc3dUNzlLL3QvN1pZd1MrTlp3QW9WS25qTTk1Z0pEWmFxanBRYnZj?=
 =?utf-8?B?cDFBRDF3K3FHOWdYVGZwRFlKZmk0Vi95MXFUV0syakN0QnJydnhVNDl0Q2Jn?=
 =?utf-8?B?VmhoYnFzUitpNnpvM1BFSGFUeDRqY29yUDNpaHNqamtpTG43Ynh2ZDl5eGZU?=
 =?utf-8?B?YnFZNDRZcnBzYnFlckJQelorcTZHS1ZIWXNMRERvdEhhZlJObjl0S3lmWmUz?=
 =?utf-8?B?VTFLRUd3OG5FK3llZUZ2aVloZ2RHd1lSSk9HekxLSzJxVnB6S1R5ZHcrVjc4?=
 =?utf-8?Q?TC69JRv8Zdtch22N8ciWpvQtE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dd9fa7-a0de-4629-c9fe-08db94b45b53
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:30:55.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ3tJZ/j1PebHfYc38cvRsyiVCRR/i+/bgZogqMyL1uX0us4EupZkz/HK3EBhrw4b1dMQkoTX9xo0o0Vo6JOwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Use DATA() / END() and drop the now redundant .global. No change in
generated data; of course the two symbols now properly gain "hidden"
binding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -29,15 +29,10 @@ cat <<EOF >$target
 
         .section $section.rodata, "a", %progbits
 
-        .p2align $align
-        .global $varname
-$varname:
+DATA($varname, 1 << $align)
         .incbin "$binsource"
 .Lend:
+END($varname)
 
-        .type $varname, %object
-        .size $varname, .Lend - $varname
-
-        .global ${varname}_size
         ASM_INT(${varname}_size, .Lend - $varname)
 EOF


