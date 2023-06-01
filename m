Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7871A2E3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542659.846769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kRb-0002o1-Q9; Thu, 01 Jun 2023 15:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542659.846769; Thu, 01 Jun 2023 15:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kRb-0002ki-N5; Thu, 01 Jun 2023 15:42:31 +0000
Received: by outflank-mailman (input) for mailman id 542659;
 Thu, 01 Jun 2023 15:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4kRZ-0002kc-CK
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:42:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e87d0a1a-0092-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 17:42:27 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 11:42:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6009.namprd03.prod.outlook.com (2603:10b6:408:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 15:42:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 15:42:22 +0000
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
X-Inumbo-ID: e87d0a1a-0092-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685634147;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=g9IlkNFI+IQzSNwJVA+WOSizVbuvOTDfmd+6767ZHd4=;
  b=IUa/dIzVcBfQh5wpY2qSF83a4Pzdsf1AZew4kuQxIh3Ji2KoAreDyDzd
   KJIpRcyUcdHsCQ2txz1aihy4Q120ydFMvkMY8UjZpOvWuT5J18YJUGhC/
   /XWiPFmGz+ybu1zTmIRnophbordHWnSpeC/SgZe90BJJ5qR93NQhwQOGP
   w=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 111263211
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yv5S5qlouiB0dsElYGKMDzHo5gxgJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWTiBaP6CYDT8KtknOoq/80xX7JTRmt4xGwE6rS4wRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5AaGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dIYFw1WaDecu9i78rGaF+Vq2+8SNvC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iee3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqiAtxJTuThnhJsqFmd9nRPNR43bAW28cv6llWBW/Buc
 UNBr0LCqoB3riRHVOLVWAajvHOfolsVV99RFcUq5QeV0K3W7g2FQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAfIHUefyYCQU0A6sP6vYAophvVS5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhj6Vf6agbo2srFLdvfBJKd/DSkHb5
 Sde3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:qBzPvaGwIz1c64o6pLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-Talos-CUID: 9a23:MvUFbW+t8sbjRu7djSeVv2AUJf1+dFrC8E3dEUyZVGpvFZakU2bFrQ==
X-Talos-MUID: 9a23:tSvEfAbHu43gWuBTszHcnG1fN+ZRvan+OgMRiqoGmfjeOnkl
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111263211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0hhEAZ2i2BeBkK4AxJTeKJEFDvCjOwC8IPdluBg2XsAOlDIH9i+3yKA1CUbz/jLknAKTgoIOUSIjumf63wlAUHjGTxgEKGvzfG/doO1AuGyvL4Ooe4YwUeo9gFq8fONogtaFDdn3qPn7klB2DjGeKaxVgnkxBErlfCvf/NkBwlvxyinT4UfLVFe/LW+aXyjKmQPwaGlDM0mjYN5k3cQYRm6iJbT9UDh8IlDRtnSlq15kJk+Hv5ES7BQZ3EjRrZuZKDZCJfwUrbiX5qg4h1LH9+0J3chK5Cnng29cu4ler5NCScAQfe+xTFAeVDvmjLGz/SpVuCqVQdkNrqPfq1kcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg5rDJdS7bIEO8PJ3knkH09wu6bNH/wmHA1jfhy93X0=;
 b=lcRuyl7T8IK4UhZC28y1WUFD/+nG82LSm1/4oXcNYXdbPFiyM3o+Oo9+xxXyp13MwMmHUA8sUkIjrISIesHqeZoWSGfASMEZuIyrhHrkRE8+lXDi1WwhyrP8X5VZmuMIx81kIdf7kuk9mJyRvrMMggPCbRMAgKpLFXM2l5bvHVanE9/v7UwVuWbbXOCEOJpn6j0773+Qq5iiJxx81aWby6vynZyatWw8Q87wa1uYsfwCl2YfTH0cheTrhu2XlVH5cZdRXv3OWk8s5R2EynX4ZJ4y2i6n+b/E+mAuUVGxjzJJece7rOctTLu4Yhn8mnDMqzK+Ryuh6djweefB9D6DHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vg5rDJdS7bIEO8PJ3knkH09wu6bNH/wmHA1jfhy93X0=;
 b=K8OalYrPWfa1K/YQueudqYvB6zEmx4P1i9cnfMAecrqK0ILZ/jfUT9L/eZ8bbIx0+y5L1GxeuISYgtkHqsw2QDdiPP9sJ8Rhh+oyJ2G2KxDqBUT7qfzbfzAdG9XKfQXLPH4SEFpksZ3mWLHSFjLqx8xVddk8L7Pb4SoEiV1jmr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 1 Jun 2023 17:42:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [linux-linus test] 181063: regressions - FAIL
Message-ID: <ZHi8VpVHcRzk8SxL@Air-de-Roger>
References: <osstest-181063-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-181063-mainreport@xen.org>
X-ClientProxiedBy: LO2P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::35) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aac741f-67fe-4585-3c31-08db62b6c9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJpR62V7zhrtuatdFP8usQAveb/3qMOd157arARCCvgyCVDET9cyW2c2BHQ8yMmy1MKcKwxaeKnMzxgcAa00pyXg2JvfvfPNRc7Y7eKz9FEqzhbWIm2udUrRpJnJgnQnWRdrRtWQohDoijxTxzvvoBgXdhl+WmsMamVV/ooy2U80QTPkvxUMeOJojaN72wJWoixbuKBwuwm8an+mRZMcVYHW7QDsf9H0hONDayu4LaPGKEO0MKLGxN4yeLnO5duFeK7UBqebOC3kwW4kEkPCBeEETDF7tCMr6EtQt7w4e3o1Ww8wVWUrFz1axGqsPKAMp9tMK7SLxvz1RHyERyoryN/OlrB5xapgRos6cu0XOPdXkLog1BX6NZ8pLgaFG2afO81G3j4sqrvMgG6rN/OSeJpmS9to09I8ZGe8C4JvJ0U2rx/UMr85DgBcWPOUcyvn4mIQfit8s98NGCwViCcIyFeAvoWudwz5AR8TaByGfSpwsXi7Pg8NAwI38K86t/XfCZbbMUC9jvC9Xjc8FclI3UGOs4iriM+mcdJvNiaJjUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(6512007)(9686003)(83380400001)(26005)(6506007)(186003)(82960400001)(8936002)(54906003)(5660300002)(8676002)(478600001)(38100700002)(4744005)(2906002)(966005)(33716001)(41300700001)(86362001)(6486002)(66946007)(316002)(6666004)(85182001)(66556008)(66476007)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDRuSE5HU3pKblMzbzEyekM1K05sSkV3RS9abXN3TDBpdXVjdE5DeDFqNlo2?=
 =?utf-8?B?S29xQVkwT256cFpDcWFoWjhOdkRLNzhma05oeG9GZ253QW1EQnJUUWtVTFZQ?=
 =?utf-8?B?ZnppT2FhZVptbGhGZTZNYTVjZC92UHFhMXNaZFd2akU1NTVKc0lQK0o3VGE5?=
 =?utf-8?B?TGswMEF2amhjd2ZvZjk5NEVhVzEyVTZZMldwWGhyZnVoV01pVUpSamxjbmdM?=
 =?utf-8?B?YVZzd2sxRmRrYnlmTWxIVDFXTjczcjBiMHFRWEhuSVhFZDgyeVZnTWNSR2hZ?=
 =?utf-8?B?T0pydVB2MDJnTXNhbWNBWjRtUTFJUGFscXI1M3lQR3YySU56Z2lQMSs4UjZi?=
 =?utf-8?B?aGhoazcrWlFXZ1Vxc2xic1RHR1Z2a3M5VFU2VXp1N3FQWW81TTJ2N1QzcGZx?=
 =?utf-8?B?aHVJR3RUb1kxVkNsajlmdWMrNGVacnp0QVg4UzArS202akhJTUNKMHJrRzg4?=
 =?utf-8?B?ZzNyd0ZKc3FIVjNoU3loLzAwbXdpWStDUVVjSThrcHZJakJmNXFMSVQ0UjlO?=
 =?utf-8?B?Z0tuS2sycVYxUzRmUGphNEdQQnNvSmMxUkdJZGtjWHhlTFZWRWtYMG5SMTcv?=
 =?utf-8?B?VFRiQTU2WldzajRNWXJyVTFhMkNCUml1L3BKY01pdzlWMDZtVWloTUlBRnhk?=
 =?utf-8?B?cENXd3pUWkM3V0J5TEpPN3d2TC9Ub3hISEs3bVNQQ2kxcTN6d1hyMXduZ3d0?=
 =?utf-8?B?NXdXU1lQd29JL2FGaEpqNEFrdEpnenUrRUxUNThtRVRtOXJPWVRzQXpsQkRE?=
 =?utf-8?B?dHhxUDV4VHZLY0R3VWlkM2s2M3BaN3gwd2pQQkE5di80UHA5c1pHTUc3eElW?=
 =?utf-8?B?dEp1czJibHc2dTNOOG9KbVFVQjRUWEk2czhrajNJSlpyeFZiNy9OU3ovZGEw?=
 =?utf-8?B?ajdHM09FLzEwMVZabS85UnFMNVpBaytxVVFMc3JUOCsrSkNiQndwUzRXMng1?=
 =?utf-8?B?Rk5MM0YrcVdjb0NrZGVvS1JTVjl0eGpVY1VWa0QrSmQyVERST2pza2hzdWUx?=
 =?utf-8?B?Z3NIYWk0eXJMcE5Ubng2bUp6akxUNUp0YVdyRVRNZ01WQ1NFY3B2VHhDOWtj?=
 =?utf-8?B?UlkxRHFVLzhwTTdsalF4NWtHREgvSGsrMXU2SUkvaFh6UHJKSTAvbkZWUjYw?=
 =?utf-8?B?T2FwNStzWi9wamE5MzZLc0RLK2FDUm03NUNtU0RkcG16K05mdUtvK3kwM1JQ?=
 =?utf-8?B?a3hQQ2h1VS9nU0VIcno1WUYzNnVjTThQRm9GNDNSSnN6ejBPelRkVk0rTnRY?=
 =?utf-8?B?dFMyZ0dmeElyZnFHejNTaC94TU5CRXVoTUc2WHF4dlhnWngybHZ2bHRQSDlX?=
 =?utf-8?B?ekREUzBkQ21tTk1rcW1ia05KTk5mMmFCdFFPd3V1eHJwVERCZmFFUmc4OEhB?=
 =?utf-8?B?dGp3NHZ4WjF4cTV6K01ESFdyWm9CcEpwRTlyS3UvZ1MyYUQ1bEZJSmwwcEg4?=
 =?utf-8?B?b2w5ZWNaZjNFUXZHczI1MHZnY2RubGxqK1F1QTFnaWV5ZEpJUStRMG5Jemtx?=
 =?utf-8?B?M1RqeWM2NlMrVW9jdHlVdHcvSk05RW42TUZtYlJBQm15MWNpdUdTdWZ5TmRy?=
 =?utf-8?B?aVI4U1VCMTdScDUvalJHR05EQm9XUVBCSVpRRmw3T0szY3laY2lIRzFkYkJk?=
 =?utf-8?B?WE9SeUpKZkZMNkNxWk9rWWtjK1ZVb0FvdTlwWnhyWTV1aFVFNlZ3NlljZUYz?=
 =?utf-8?B?RHR6Wmd2NjAxUnJhS1p4VVE2QlBGbHRJay9hRjh5TmhZVDZLbEkzMndDKzVV?=
 =?utf-8?B?RGZIUkloMlpWMWx5THBQWFM4RjRSd3F1SDQzeGtQRnZtdUUvMzQzSUVUcWl3?=
 =?utf-8?B?L1h2bFBPT3lkM3Z0cmFyZW1sNFJGREluZy91RTY4akJ2RUFOUXhsdTNXVEdx?=
 =?utf-8?B?dUtkeUcwdzZUZVVPK0puNmxybnpEM3gyV0ZxMnNaQmZVNWVJR1VQMUtsWHJT?=
 =?utf-8?B?Njc2clhqcmk1TUR6ZGc4RncrZFgxQUFaaCs1STJrZ3B5bi9HeE1ZQjJpTnh5?=
 =?utf-8?B?Q3BabVVMWHJ1VncrVXR6TUZPdklQQnZDMU44M3R5VjBtOW1pZDBUZVFSanJy?=
 =?utf-8?B?U0oyOEpMTCtacEJ6aHBlSzhSMEl2ZUQweXFUdk94R3dtdU0xSEZHOE5wc0dN?=
 =?utf-8?B?N2hMN2pnS3ZERTJDL3FKYVhzTlAzQTNLU01RRHR5ejVmYlRjZ0xHTE1mdjlh?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ypyESAMKbFDDsGKSOWVTscjAh2fGFG6tMK1Rc2ap0ssEwfMMmFIUux1h+QK2OODUonT3iVNnLDqsbNT4/jH7cHxmfyzFTMKIHOIeabb7XAkJMsn9c4Im7NuuDOLcY8RnPdD7fXcS7+dAh0fk0FY+aWFhBKcOox5ST6fMnsFUreiqu4rZKJCU4KOxHmulnjvoG0PqUgrXwkj5DnarwIyKBoJSFpB7jIqURPRNTT/vdb/PdaDVKUvhGdH8sD1/GJY/OaTZfuMXlTQtvIdWoFDPRfzzQpq9CQXbKNkgtCDOLTPrTZmilmH5kyRu4rt+zmW3CCTOIVB3Z2/2AMYcJSXr/uOhhJWeE4Y42QOtJnRfW+sBg18CTsBHitLBf0ljS+9ZMGAcQHG8kF75kM5AoCN0Uu0WYtaP0qWAC0RoTE29BYcw0Phb1pXCLtpD3RzD3FoI73pQuwetj8cZ/J9tq1Ov2+8UASwHYy7kzDT26C4dtGmBFeMWA73tjaoDvq8GRsM3x4ZW5YQ+6ar6WPUw5IO0DK8uzdi2StPhZHr1WHALTGJBelS8WPnxFz5Q9oZFrYKOR8FjuiaiPV7xfNK79LNfl0bMyRQTP9/BGag4DHKqT8WrHeFkhsb+Rc2Gi0hhlqEbYFFqmFHOUO7CI6k+z06rZLS6SkfoEiKWJw9ur2mtVJ7UUmBncyeiWGOhXu1/W2pQ/CTWk1+Bl+FsaJ6KBi005KXHOO/MmDxFM1Z0jSWZCYK6uYV3vyCFOuxhLqgQyZMF8H/mqe8xr8FJW1QZKNI/uAUWrvibPRYNJNsAndiW3u37/dGdwDHbvgiBIQN7O0rvkUaY0h+hHX+XrsB2JPfE4DgFT6yfvUPnfN81cU7Vk6TWUav6tb4I/l2jFmrNJX2D
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac741f-67fe-4585-3c31-08db62b6c9c1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:42:21.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8GW+TsyfawUbHzccGzHjEvDxCh+XCghhDIhKfSPHpA3N3w5MTidrhbITc7ugkomzViFte8Rfi991ZMMTtFYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6009

On Thu, Jun 01, 2023 at 01:20:26PM +0000, osstest service owner wrote:
> flight 181063 linux-linus real [real]
> flight 181077 linux-linus real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/181063/
> http://logs.test-lab.xenproject.org/osstest/logs/181077/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278

History for the test:

http://logs.test-lab.xenproject.org/osstest/results/history/test-armhf-armhf-xl/linux-linus.html

Last working flight seems to be 173462, that was using hash
9d84bb40bcb3.  First failure is 173462, which is hash e8bc52cb8df8.

Roger.

