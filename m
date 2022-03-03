Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C04CBB03
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282928.481798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiMT-0004Ol-CM; Thu, 03 Mar 2022 10:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282928.481798; Thu, 03 Mar 2022 10:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiMT-0004Mu-8T; Thu, 03 Mar 2022 10:07:05 +0000
Received: by outflank-mailman (input) for mailman id 282928;
 Thu, 03 Mar 2022 10:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiMR-0002Fn-NV
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:07:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac268b65-9ad9-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:07:03 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-x9RipL0rNwSbs3GBe4ORyw-1; Thu, 03 Mar 2022 11:07:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:07:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:07:00 +0000
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
X-Inumbo-ID: ac268b65-9ad9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646302022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0H0YRL04KECEnhSZHc0txOpsgQMjHkGgxeFv8W2+jqE=;
	b=NuJbbU0IMlhvAsnZdTALkoe5HCXfygXXg02tKC5tkeFXfRPQOnca4QS32EFLYB7VB16noY
	vYwWkTFUy2l8NcuM4Xsvxy+xWflofx3krfx6NdX/EJ7/dVK5lO0BvZhkZ/fTCITtHiOow2
	30Kr4WBB3UAKssdnLT64DTQ/xV3EzGc=
X-MC-Unique: x9RipL0rNwSbs3GBe4ORyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6SgIZsTvZXCcIpSDIrmBMtd5W6kDDHZ0YiUuDOFr5CntfUP41C28cqFxZ7QDTO1hPX32ojBvY1g1Y21aY1kADusU3S/oPorvP9kOwm5VItzNvN6UyLU6ZyuyvzVID93kbNp/Xo9PJQ0s062KEuG597o9U1+vj/OoOOKIvvRyqyk3nQYvXglMNcVcA4LViIERW2js14sKPbmE/accPYfzGMqGPkLqfr7ddJE9jW/acU164DcCXqw/wOEB1OUMhe8YGnL8IOkknM/0ILdxS1oXR2fIpOu8Hkeuvzz7WkaPxoil+cYkbf1rPj09WjcBraW6rt8/07o+VxQbv8oUz6mSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H0YRL04KECEnhSZHc0txOpsgQMjHkGgxeFv8W2+jqE=;
 b=DjkSOgdZ9TDmZeuR6EdqyvLJ79AYTZSnUHFvXHWanLZV1a5ZdJNBGXrJqcfitEJQ5r68Ri14Ri3MFF9wDYjZEWOMq4KgiVaZ/LY4l4rJyIDLCEx4wXhZSswNnyuuhmapCTn1+9F9ynr46dOyUde+l8NvLW8aBUd1vUsCNE6/oQgsrV2eRZzkO/Qf5e7inHwfY82F06wEaMvBnoeQ8YRrxqsKoJyMB9dKP1uE7p+FNfLMl4oAO+wdHLAWGY6OrKtHDdwaoth/jK7Q4aWIvab572bq0Lv443z4trdOBfySvvU7bsrjEK1QJvFodBSqXc+0kR4tb463IwJyHFydFywboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4daa52f3-2fbe-c218-a8b8-a43c1b23f803@suse.com>
Date: Thu, 3 Mar 2022 11:06:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 6/7] xz: move s->lzma.len = 0 initialization to
 lzma_reset()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf04b77-d9f3-4fd7-c9aa-08d9fcfd8eb6
X-MS-TrafficTypeDiagnostic: DBAPR04MB7256:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7256CC72AAADA1AC446AFD63B3049@DBAPR04MB7256.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6StS2Kb+UZgIr3Oxh3XP6GTSNqPQ8FTCb6mMsvm8csGmiBbMLMkkik0F1ILe+QQWOPqpP74zJ4w2JS15Wf4NcVRX35fvnVccCC+uQibt7aZsRYpaLJjb2SKYHaGBNEtf+ZZCWv5ZHz/s5AOispz0wwt8TfC99a9akCKvRaA+Gi1EwMhl95jUm0DF+uF4QflIJ6PwZpp4aoh+5kbyrMFFKz7xxq+F17qUuyCkUBsWt3pzzXqVnTB76o+uNWr61kQMWyjhG37XN1DjjxJaVcy5KtZRoYb9nAryUmCIJ0nCxlS3L8jPLVw/EkqEqYkZsoyDMZvb0rIbPryeXx4UciSguDmt2A3tr20dCL2nXoLRRmDPJ6CMEOYQcTTlrQRKQFSHpDru0ghNY7g+adfK5uGoAdXwIqOYMO4qPG6OJntV6qQBZs4BCxFoZhY6al4jg17nLM4h5Z6dtxVhNK2HgKW4E5jwVD/W2bxT2mEbvDuwJISrGV2SikJEK/Z4/Cbc+jlfIWILfKURNF4hIt4OLx2naXdOCD1KUBBpLILBSEjyPci5uNuxzF8efRGePEvYERf/3/5eJrfc+OuW1wbc43LNIwOmptD0zNt6XXf9CUPG7okwaM/LMDefbCTBEcP+RVjXC5ezQ/oAdZPjPsrV0nOE+7CsZe2hsvF0B08k2STwCTAa++tBhp3/LW5S2Us4+5m0wiU6Yz4/T9YbFMgZD/N7ixn536tU+QM8Jl7bZkO9VXECldtVnN7svHNQ6kUIe+4ltXKpGqWiI6T0NOYY+R0k7ZrgWD60ShcOGBov2MIEiClizZbaKMPiwt8qlkZUrhMImJU0l1audur9E33VQsJ5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(5660300002)(26005)(8936002)(508600001)(54906003)(6512007)(6916009)(38100700002)(6506007)(966005)(6486002)(86362001)(2616005)(66556008)(31696002)(4326008)(66476007)(8676002)(316002)(31686004)(2906002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1ybkFkakNiVlNGam8wRWVWdjJrK0pEOUpuSjFzMUlCV1I5TktUbFpPV2xj?=
 =?utf-8?B?ak13d3Z3STNkdzY2Z3RkYW1mSmNvTHEybktZdm4xTVlYeUZycXB3ZWRiY2Z4?=
 =?utf-8?B?MzJSVEdOMXFvU0tIZmNZWGFpWVFxSGJ5dXR3cXMyalc1c3FJb1U5TzJhYjdl?=
 =?utf-8?B?Y1c5eWFqT1d2anRpcGtSSHR1eDkwN01iTDBUdXJoS2pocU1vMVlkN0NpM2ZG?=
 =?utf-8?B?b0dWS1I3anV6ODBqZ1k4OVVqRTIxYkNEVGNiTUpWd2RLNDhvendabWd6em4x?=
 =?utf-8?B?QkpCcmpONDJ3d2lTMi8zTVNTZi9UYkNyN044bUJsNGJ1VmFCS1Y0aHFwNS8y?=
 =?utf-8?B?UUswSk5XNncvdzhsZyt1Smx3NG5IcFl1a2VuOUdJdWhEWnFBY2l3QWNjbUlM?=
 =?utf-8?B?cHhKbXJkQk9SeWZCeWhCSWdhUlRrS3RrNXQvblU3VTJNdEFZVVhPZmk5NmU1?=
 =?utf-8?B?b3FVMVNOOWt3NmRiczZ3T24xOEhBOEl1OFVSaE5IbjRIVVh1dkxPYmc1aktK?=
 =?utf-8?B?OFcrSDZmdEF3SVVxbXVHVm5QTVBNV3lCZkZDekxaN3d4a29tNGE3LzYrWHJ1?=
 =?utf-8?B?eE9weXNFdkVhNzRTRmdTazRZM3Z2cUxkYnVzOWV1SVdqSGdwZ3dYeTNrQjhN?=
 =?utf-8?B?dkJFSHE5dFowamgzYjF0aFFHbkwrb05MZjVDa3pHKzBSWWRKblpQeUVGamhE?=
 =?utf-8?B?V29Zc2pGcElZbnNNV1lEbFlWeWltaDNXbUNIYUJrV0laZEJ0M0IzVm5aMlVG?=
 =?utf-8?B?YkJ2emVIbEE3dE52NXJoV2VjOHR6Ykd1UDR4UmlSUHNHNG1IK0xjOVl4cHZt?=
 =?utf-8?B?OWdpaDBUZ1dUVGdjNWU5TDd2aVRiS3NXZUY1RWU2V1FoNFR4alg0cUtKdFZW?=
 =?utf-8?B?eU1UUGxNMThiMjRjQlkvb2F2czFWTElQajBDT3FHTVo4c1lFNUMwdktPR254?=
 =?utf-8?B?aVgvWERJM01NY3hlWlA2RHhKN1lOTUFXTGk3R1h5SjdyNWQzaUtPRkhkOTlY?=
 =?utf-8?B?ZlpsSjh5ZEFCV2RsOFhxVEgzbjYzS25JTDkwV1NtTGY0N002Nk5sS0tHOThx?=
 =?utf-8?B?UzQ1NVdNa1E5SUpkWndrUHZDaTFjS3VJMW95UnlKektFaUtCM0Z3WGtDU29P?=
 =?utf-8?B?ZUxlTUkvNWxMT0c1cG13eGZFWEh3ang4bGVDRXdZdHRTeER2aHN6WEwzQ0Iw?=
 =?utf-8?B?ZkRSUy93T3U1WEkwdUkxZk5PQmVFM2hiRUMzMVZZWXIyb2lIdnZjUkVwcnkv?=
 =?utf-8?B?Tms3cW5KUVllYW5HQUtuSUdJRnY3S25RemR4SnBtZWVxTWpjaXNCcExCZzV4?=
 =?utf-8?B?TWxoS1F5QnhyemN3di9iRUJ2Q0hUM0VyZTRoejNtZGJUWmw2OFoxdVp4a2lh?=
 =?utf-8?B?bHp5Zy8rNy95c0J4Mncya0tkbktsdEFBeEN5OHRJM0d1RnhzY2E4L2pqdHRk?=
 =?utf-8?B?Q1NzczZZM21XN1VDY2k4SE9DbngyTUE0NTlNdWMzemUrTVAyRHQyT3ZBSnBa?=
 =?utf-8?B?Sy9rcER3N1g0dU1lbitQQ1RtVGMvT1dUZUhJU0owNjlGdVI3eDh1Y01Tc2F5?=
 =?utf-8?B?SVYvb0ZVTVU0ek5jUldpOElDTWE2dzVaWFJBOVJWWVExc3NpaVgyemJrRHpL?=
 =?utf-8?B?VmFCRndISWVHS2ovYjdWQk1tM3RpWWl3d1dkUmdReDU3bEhQcHlqWjQya2VD?=
 =?utf-8?B?anNGNUY2cmVaaW80ekFBVEpZRmR1S2h6SjFmOGVzSU9qL3NKZkdWTnFKYnNt?=
 =?utf-8?B?SXhGRjRwb0Jmeis0RE1hb1llYzlOVGFWcGNDQXJrYkdBaTVpNC9JVDRLYmk5?=
 =?utf-8?B?bzVwZlExQW53djVRNHdNNS9xQVFjRWF1alpGNlIzU2sxblVBVUswNHJqOElp?=
 =?utf-8?B?eVBDUnlSenJvRXBTQThHdWM4SU9Hdm9UNUduek5XemVRdUtIYXl2dFhidm5S?=
 =?utf-8?B?ZTZyN0oySzVzcDFuaEpUc0FVK2t4Q2ZIVFM1aG5QQ2NRM2hPZUN0UjZ5ekRk?=
 =?utf-8?B?Y0tMS25UVXdJcHptYjFKcE5oc3piTnJtSEFPMExIaUlJaXdHanpyU3MvbXBU?=
 =?utf-8?B?N2R2R0d4ZXU4LzAzZkk2czVrT0JKM2NBMU9jaVB2TGhBejN0cy9KK1V5N21P?=
 =?utf-8?B?c3diMTFKenJBLytrNGFuMFFIeXFrMHpRaU9pWThEUjZxQko2bTNIQjltRkRx?=
 =?utf-8?Q?QhQot1DctxbE+n8InwI6Hrg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf04b77-d9f3-4fd7-c9aa-08d9fcfd8eb6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:07:00.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gejgE7lqimsycoa2V9GYU63g0/EbFS/7GS/zAWm3JzH3I11wZBRJiGzH6agFx0RkbCL3lrslEIR5nQYMskdwOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

From: Lasse Collin <lasse.collin@tukaani.org>

It's a more logical place even if the resetting needs to be done
only once per LZMA2 stream (if lzma_reset() called in the middle
of an LZMA2 stream, .len will already be 0).

Link: https://lore.kernel.org/r/20211010213145.17462-4-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: a98a25408b0e9b0264abcc3dabfafd9ff2ea1046]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -791,6 +791,7 @@ static void __init lzma_reset(struct xz_
 	s->lzma.rep1 = 0;
 	s->lzma.rep2 = 0;
 	s->lzma.rep3 = 0;
+	s->lzma.len = 0;
 
 	/*
 	 * All probabilities are initialized to the same value. This hack
@@ -1174,8 +1175,6 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 		}
 	}
 
-	s->lzma.len = 0;
-
 	s->lzma2.sequence = SEQ_CONTROL;
 	s->lzma2.need_dict_reset = true;
 


