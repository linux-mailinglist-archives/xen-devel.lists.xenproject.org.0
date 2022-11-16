Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1A62B6FA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 10:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444242.699237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovF7M-0007sc-IM; Wed, 16 Nov 2022 09:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444242.699237; Wed, 16 Nov 2022 09:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovF7M-0007qb-Ez; Wed, 16 Nov 2022 09:54:04 +0000
Received: by outflank-mailman (input) for mailman id 444242;
 Wed, 16 Nov 2022 09:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NgR=3Q=citrix.com=prvs=31293058e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovF7L-0007qV-Ct
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 09:54:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97742e07-6594-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 10:54:01 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 04:53:56 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6759.namprd03.prod.outlook.com (2603:10b6:303:179::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 09:53:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 09:53:52 +0000
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
X-Inumbo-ID: 97742e07-6594-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668592441;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XYWPmw1RL4CgnVWmb7qGvK1guTZhy/u0zr6RLiVdNeE=;
  b=YAEw2sOIA1aT++OnkIzi6TSaL1ToKUgOQYb66s6Rv8oUS4+lKb8rHwBV
   DhbkRBQcghx69LL7SBhi7FGaQAxcz/cnsSxUbDsi/cUBqgUX7f19duCch
   BrCJkvGucmqGbDJLoczghpMvKjIxhmFpJlif+sFPxGmsjk9TH3u2XEcw/
   M=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 84946636
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rKFgu6y9H0n1MMxD5356t+fsxyrEfRIJ4+MujC+fZmUNrF6WrkUBx
 zRLWD+PPquCMTOme9EkbYW0pE4BsZbRzIJhSwVl/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPK4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU0V+
 c4HBXMsVwG8tsSZ75eZF8hQu8t2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rOewX2lA9x6+LuQ8dItkXOr1DcpEUdIDXyBu6SbmBCjVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRHsreYVHac/be8ti6pNG4eKmpqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv42k+XjXjjTqoYLGJjPZ/S3SV2Ohqwl/NIisYtXy7UCBtKkcaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhkkTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:RDkJF6k8f1yvpIkErReT1oaXVdTpDfI33DAbv31ZSRFFG/FwWf
 rPoB1773LJYVMqMk3I9urwWpVoLUmzyXcX2+Us1MmZLWrbUQKTRekI0WKI+VLd8kPFl9Jg6Q
 ==
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84946636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReoFBBtCN2r44imbOccYO9cSQIBY8HAZSCtfuUNiEr/XoI+Zzxd7M6xr87NPDioeJOsXWx1ECaJAIx4GuUlBm6vFNfDEdvoQ33ipIFebFq58+bSoyKt+xN9HhVNdZYsBAgIEEHCQxJLsLTJxqiGBlGXRtbmm7TyvTBVxF9fKtoasZHxoXXLqWrsMuIwedVHJ3v8sK7C9+jtfbaPVI9uOnVci7IBsCH7auPAQ2oTUUgNhKJgpe6wRSFW2qRWedVPyqAaIp2QQYoWqFmMIJxAiFZrD+cuGbUgmpbgkllmLuPpKqXr/8q/58N+Ai+2oSe5SpJpV11hrjnDEHC3zvPQVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7xp8/z9qJ1911Wz8xxNNdV/aliKN4iBFIKwbEU197w=;
 b=J/Du+snAwg2SQpGTbc/B16Pb5aZdsL68kpPIy9qxRwYm/R54qhUpQ3Qu6Pm8U0g7A8bv4WyCPQSKBTy1S2PmF25GEONgMpP17YLOtccwV/jHjRELJcPfENKNEezT2dVEiJfeltqnropnoOG+ApU8adfMa5cBy9vb9Jae8UDba3JM0LNNEviUZ+X0WBNnRDddMqXPzlAN/7wUp7Bdj5QTaNOiZUiKQFnCkRJBq0finr33Q+hJg+1NYTELd4lVnO17QaVjrK4g5Xd0H3ZfcFFk4tZdjZ3DzWL/vH2jFBFu9l/3a9fHe7Y3ucG+9MUfaLn3wLtkWUXgJQo1f4WikNWYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7xp8/z9qJ1911Wz8xxNNdV/aliKN4iBFIKwbEU197w=;
 b=FwWub7AuFTUXUCMnKoHU+jbi2mugJ47LWBajS0tV2bV5oUeQ921gKc8KfjURNk5ZBIesUydBn/bIoTwz11Cgfh5TdqGB+TPvN5r3k3jSVADJfpLBxW3cgS6h2eh5xor1NztEEmPWcl4WqcdQPcsi4RuSBgImMtC9j2iCUzg+MkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 16 Nov 2022 10:53:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v4 0/2] amd/virt_ssbd: refactoring and fixes
Message-ID: <Y3SzKDXZN7uKVFMN@Air-de-Roger>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <463e03d5-7a07-f26a-de24-13c4a12e8c20@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <463e03d5-7a07-f26a-de24-13c4a12e8c20@citrix.com>
X-ClientProxiedBy: LO4P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 7698159e-501e-4918-4656-08dac7b87694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMhXh82NGvyx3cRaOQi4ezYwH0ptN0OlD7na2Jk7pLfXrbA4bDCfVxhl07cTwt3w2HixMchCMeSRXZxK+/glizyTZmbuTfDEmTsWGJTYjrlmCqLcOIpVcFmdNT1klJM5gTifZwz1lCdnLBVZxyZDuf/1y3Jj/wIqrF9QlE+yvF+q1jBuxrdqFUJv/WnCBjcPQKc6TEeiIVhMJe5IbIuZMLWqGEkuQfMZoTz2BuQ/lV82UdC3Sb+eX0ChayTok0UnE18553oyqRJcQaWBo+pp8Ifyh+VxJvONfSa60yYPw+EYV6UuysuxfJ5Yn1iA/dQp9bUXlWSdGInQ8a7I2UmnGHinCFezBfSLi1qK2ElU88rbzFCOUDVuyVocUALYYxdq4i0sBcDVvF3yDeDt08z3w1iltXCTddTtYvF6BtFQupdYIFNQUj1tV+aTNGSKTgo1m3B02oGNozs2vGozinpBGQARz2uUZAJbIYA/BRvS135wD+zZ0XQ+rL+nE98LT79BuJL3uP8IO4Th1U0oNnimijWL12ymUPZXY/01xeoxao+6onAhhpgnBlSm/ysh4TrO7bs59XAmdq15kB676Ehqk/fG7a6xe/0T3mouo71whdhL8Th9WDdKjO3iaSEPN1YHFdPHohuLrIYRPUwWDn8cyw4Hf1Mw9s2HCl3Lm9hN7CfUs638jfOpl+l85YtCD3v5bsyQpy0jbsHbVTxNU8xh0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(9686003)(6512007)(82960400001)(86362001)(38100700002)(66946007)(66556008)(8676002)(4326008)(26005)(41300700001)(2906002)(186003)(478600001)(5660300002)(83380400001)(85182001)(6862004)(6486002)(8936002)(33716001)(6666004)(66476007)(66899015)(54906003)(6636002)(316002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlyckUyMWFnUGhubHNwQk5samVDbEd2M3J5dy96SjRXMXdCL1FFR1J6dUV5?=
 =?utf-8?B?a2dMQjZUbzhTVE5hK3Q5c3FENEw5b3NXZHoxY0pWdU9QL2hhZVdYMk5UaFMx?=
 =?utf-8?B?NVR5QXBMNFg5cXJTbHpiZ3duV1M0ZUc0L0hMQlFwNUwrdmNDNlhJUUVObG5U?=
 =?utf-8?B?ZExtTnJFTDYwcm1CYm9US3FzMTB5RGl3ZXV0M3E1NjRJbHVORXhvL3Zla1di?=
 =?utf-8?B?VnowaVVjQjlsb2FpSVdTOXg3clBjVzBHUXJhNmVyK0JuSkU2WUIrTkR6VGFm?=
 =?utf-8?B?ZjVweWFsbEJJcFdzaGpUbXBpUmZDb054TTZEZmdKMk4ydkltSTdBM0hGSndQ?=
 =?utf-8?B?NDhhRVJNZU5CUTNHU1lXZUs1aEZvamRJdnJReHhvdE9IRjVOTlhMOFNkVS9P?=
 =?utf-8?B?d0x4VjZPYktyQXNKTjdiQXF0bUpLWk53YUZlaDZibUt1V1NubFZiVFJ6cjJa?=
 =?utf-8?B?eWpUY2FHeWhPV3hIOXM5b2g2M0J3QXFvYkRhNDE2ZzFXZExTODhkbVR3eVJT?=
 =?utf-8?B?clM4SHZ0RGcyTnpuOW80b0RTRFpGTlQxRVRPYXg0NEw3MlpBcG1rcTlEMWM5?=
 =?utf-8?B?cHFOMjgrY2o2V3dGUkk5OGVlRitXbkpoSnFrejhKdTNkS2RjOHNjMEFmNnJK?=
 =?utf-8?B?SGpaaWYxZEcrMmV1a2FLd0hjdkdTanV6NWhDM01yd0VsOXdxT0E1TGVmUW43?=
 =?utf-8?B?RzQ1aG5nYlZIQkMweXBFcjROUkUzbmtKRklndHcrZzUyOTNxMTBTV3Y4VUQr?=
 =?utf-8?B?WnRuZFFYTTJrSU1EdzI2RGh6V3pSelpEdkVOWUlaalNPR3VzdlVkZDA2TjRQ?=
 =?utf-8?B?Rmx6cUxjUzJhK1hFeWJzRys3N1czaUh5ajR6N1pqSHNBZklBbnA2SWxhUlhh?=
 =?utf-8?B?YVNacUlQUE1qbDlFekRybWhVTXFHVi9LTU56d3JqdjhmRWtXZ09RU2JDN1RN?=
 =?utf-8?B?Sk5GNmhYVFNZMWw0VTdDR1Y2NkEvYk1PRlZpdjRaS1AyMGRuNk5kTDdOdjZ6?=
 =?utf-8?B?Q2tQb0J2OFUrd3VEZkFMaVY1SEtKeVNadWoyY0IxUXB0TDhjQWxwTHdVSTg5?=
 =?utf-8?B?WklwRGVBamFZaFJlbkJ3a1RoU2FrNnhiR09HdlhwcHVIWXd5QlJaWEs1d2Vk?=
 =?utf-8?B?d2NzZmJYZSs4Vk1OZ0Z1TElERHd0Q05ubnAreURuRkgvM3dCTlZweHdDTGxL?=
 =?utf-8?B?QzdSNmlWWHBiK01iMm80VUJyRW5HRkh4dVlkMldSWGRTekRJeEJ4M0tsVGt6?=
 =?utf-8?B?SjlzT05tVU1DSGxzYlI5VGFsOWZ4NHpjaUdZeEhKYmN0RStIUjh2TEltV2pi?=
 =?utf-8?B?alBDUnZnNkdNQ3lLZ2tYc1BSYkdod3MrQ3Y1TVZ1S1VzYUtKZXJuaGxjS1NW?=
 =?utf-8?B?RDNUUUZNWUhQME96VXFYUmtJUlYyUHcvWmp1TCtGcWNsUlY0VWt1L0ZINXMv?=
 =?utf-8?B?QXloQnZDZXVJZkJNMGg3akFCbjBDS1doSjc1M21QenVHVTAxd1JkMndVSWFk?=
 =?utf-8?B?RGYyeHBGRmF5ZWgwWWkyVERoM2N1MTFsMlltdTJrTGFZZExLUGVXVEhKNWkw?=
 =?utf-8?B?TERqNWxYbW1VUVRkS1dhQ2lKSG9CSXZMMEJ1MlRwdzlIS1U5UWh5S283TE5N?=
 =?utf-8?B?S0w1cWJsTVA1RE5FSTJOVDRDYmpZQnNiQWNySnN1WXUxSXByZjhXbHhFY1M1?=
 =?utf-8?B?cmtEdWQ5UzlMSWdZZHdDUm1JOGlIbVVydlpOTXpYd3JPcVRmR3VoWjFBM21E?=
 =?utf-8?B?MU92amNKVjFLeVFyZXFpUFkxZGZ4eldkaFkveXRKZTV2cnNrUnJ3VS80RFFX?=
 =?utf-8?B?dHFuQ0pmQXFIQ0g0bzJpMTB6ZEM3eWdDV3NEVSs0U2RQT0gvaU5HL0hBeFJQ?=
 =?utf-8?B?R1dSMW5vdzc3c09BVnhoVUlUSzRMK1hsb3pobnc0djV0NzhlaXdyY2hGWHRu?=
 =?utf-8?B?YTl4cFJlWEhiUURabHNjWHlpMHlqYUFxNU5abE9PWkZ6NXZ4Y3hFNkI2SXc3?=
 =?utf-8?B?Szl3VXJlNVkxSm03M1FqMXNsSlY1TktpUitFSDFnV3NhSW5FblQ0ei80TGtC?=
 =?utf-8?B?YXc1LzRiWTNvSi9ka3I3MW82cm5Fdy9Qa0dDVXNHUVNjcGtLdFZPeHVlVGZp?=
 =?utf-8?Q?1YTla3IWmVU940U8h2BoZcrfs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tK1j9UP+RCmHZgF0nGGTInlr+XgsEYYCJRATiHJkxyu0C0Zzn/op87jDLI1ay6gDqlc5UICtRZEcfNAKpBZ7uuvKCE2kwWDV9jTc/ftSwVPKDEMZd9pHw/BaGH9RdcCfayWuV3pWG4tXf/wNgEqTIluSo/mS7SyRu28o64phlkhLOETQEgCwID7E+mpatOnW987KgwsdibTG0sPz2YWQT6mK3b4BL2W8RjmesTMoj48UxN+1IRGp11WGTWshzoCC/x0+++01YLMuTJrUBHpKdra7OaV9lzSLlZ0UT/NPHWrtLb8SdhiYOpDve198YqeOzQTKi2S26DZLsKensFLNmrFw3lDNTdiUJ9+7uyzzjiDPLpPjagXyIkj8VmXWSiYRH7TwcKoLbf1TBECEuqWwxnQ7na0Jut+YRAZEvxQXCtLlSl6/388hDEqHnqJTvZTxnc48bYLTZsYE8fiHUw8n94b339IRkmEEbiH7ZPUorSNffF3JoCRODG7dj1I5Tcg5E7Vz2uKQIGcRHeqsTA0FAuOuydJ3ELUx+fKGWpXbmPxbuSUW0BMtPCflidg+keCeaQtRVpA42diYJZkNFZzzDX3mNH977ch/G2z0R5NcvSaSFIgGcAfLmjnElpLuS55vqYAVReFZN6HWPETNgnrtKCQE47NPOql7K4Jy3257cUAYid6PCrlzcew1lDzs+C8PxvB+N28zbLElY5J77hDXIhxZjfJLgPsohWLQdRjQPQNaTv36ErURjEKuvoycmyCXP064RE8zU2pshz4K/q0hRCn/1GOxN/QSKaz1I3fr+tIirmsr2vWqYVV+u+SXdOOGS2NWv94yh5wWjLCz/aeP6D70nqDC9hEzR3irAFrgp06RgssSOmofTnL+6JjoABy2zDJ4hsLYg78PJqiHEEMwJg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7698159e-501e-4918-4656-08dac7b87694
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 09:53:52.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NR03p8aFXzhHsO0835Mnks7V+Smi8i0Yh/pbojlOV0Om4K050DKqshPChmugTftm3kOw7Ld4IPdC6p3a0R5hCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6759

On Wed, Nov 16, 2022 at 12:27:29AM +0000, Andrew Cooper wrote:
> On 15/11/2022 13:26, Roger Pau Monne wrote:
> > Hello,
> >
> > Just two patches remaining, and the last one is already Acked.
> >
> > First patch deals with moving the switching of SSBD from guest
> > vm{entry,exit} to vCPU context switch, and lets Xen run with the guest
> > SSBD selection under some circumstances by default.
> >
> > Andrew has expressed reservations to me privately with patch 2/2, but
> > I'm still sending it so that comments can be made publicly (or the patch
> > applied).
> >
> > Thanks, Roger.
> 
> To avoid a further round trip, I've committed these patches with some
> minor non-functional adjustments.  In patch 1, an expanded context
> switching comment, and in patch 2, an adjusted commit message and
> movement into __initdata.

FWIW, I didn't expand the comment in patch 1 because I though it was
likely to get out of sync.

> I've also closed out #90, which closes one of the release blockers.
> 
> All other bugs can wait until 4.18, including the totally bizarre one
> where using cpuid="host:virt-ssbd=1" in the xl.cfg file causes IBRS to
> become hidden.  I confirmed this was pre-existing behaviour, but haven't
> investigated further.

Hm, I don't seem to be able to use cpuid="host:virt-ssbd=1", I get:

# xl create -c tests/virt-spec/test-hvm32-virt-spec.cfg
Parsing config from tests/virt-spec/test-hvm32-virt-spec.cfg
while parsing CPUID string: "host:virt-ssbd=1":
  error: first word must be "host"

However using
cpuid=["0x80000008:ebx=xxxxxx1xxxxxxxxxxxxxxxxxxxxxxxxx"] does work
and I can see both virt-ssbd and ibrs present in the guest CPUID on an
EPYC 7543P (Milan).

Regards, Roger.

