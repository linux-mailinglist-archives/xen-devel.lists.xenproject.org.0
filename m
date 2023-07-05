Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84A748372
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559113.873818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zN-00010W-CQ; Wed, 05 Jul 2023 11:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559113.873818; Wed, 05 Jul 2023 11:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zN-0000y4-8X; Wed, 05 Jul 2023 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 559113;
 Wed, 05 Jul 2023 11:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFzj=CX=citrix.com=prvs=5438f3518=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qH0zM-0000nM-BM
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:48:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5a6f32-1b29-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 13:48:03 +0200 (CEST)
Received: from mail-sn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:48:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:47:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:47:58 +0000
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
X-Inumbo-ID: cb5a6f32-1b29-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688557683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=AKU486u+7V2Xni1iRq+MaEEwYMswYGdyLZUMhihfHfI=;
  b=GVBp9L7pWqwFDxpXfQ1XYJS3WZkMw7lEX2pvLAhjQgElunGgGU6RXXJe
   Cu6TSWCvYn//uGT3mb1URYIG9tQ/Snybv0loE7GcmE876Tnlbb1s0TFpG
   qrSACrYgiBmy8E7jkafS2YI6DGNSPBgiPOn/+8i4GGXukFoZOJOm+I/07
   w=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 117786678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5pvWsawrgW9FfL6YxIR6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkUAy
 GZLXz/UOamJZzekKtFxbo6180wEuZ6Bm9JnTVE+ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTto2
 NcyA2sHVQLZnv/v++K+ZLZwmMt2eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFYZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137CQzX2lB9J6+LuQ1sVqnHS2+HMpNCIVbEG9rKeHiEKSVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GIDQCFA0M5oG5pJlp1k6VCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:OWV6oq9mjMz71UJkHcRuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4b/LfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 OhDo0tnUvSRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qm5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPTi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gnMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6ExR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r3NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx99R6vXM7zM4HR3yGGOfI3kNg6dj/22pqIJ9YEUfYCbcRFqEzsV4o+dS/Z2OLyvZx
 /8AuMQPxbZFxqfJW945XyBZ3BsEwhubCRsgKdcZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:4FgshmDqOli8LQb6E3NB2WU+MZsvSW+H1WqJGB+9Jzl1VrLAHA==
X-Talos-MUID: 9a23:xGrbzAq67zh82se2SLQezxFZNNtBxpqxMnwykqwcvcTaCy58FzjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="117786678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7Xuq6eGwamhDmbLx/4tEZKg74Y4e50w2ihqYo/dl0FcVBC6VdZt/+2kw92LC8Duw8slymrmHq+PUvA2o1LJD+XcWB8L2YH04Tbvdo4hIgjVddzKPWy41boJI0NzcSzymq9x5lPUS2txUSr36SXc9+c9Nr8zM0j4QpXJmiOEqhh5sL3o7hXdnAj+Lh8V1d6yylSbsbaey90+WNuPpUogbEYmqsJKDauE95iIF38/xWe2uLCazZQ17KlPeeBYFQV39iQtZMccG9lhCxBjairdKuUm40U0MLSCC6hS7k0jHou8/1AslCYEmLoamBHvLFnTnYe/feO8v5PK+R4W1L5RPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8YvMDDpI8T971tJbHPd1tPqKr7FAFvy+J0vBuvNH0M=;
 b=Yf3ZS/gHweAnZwu0ozs3exFprFZ495m9olHaMOwaIpi8XJDYyFLtdz4ndhaBMuzt1xnp6X2osKqwN/2JnEeB/p19SuEOgV/a5mk9fKV/gXwSoygkD8V3XICOXvu9YEcVpQ0Wnk+z7D044zuEjiF7em1eV2fzodQ7zSgeiYxQAOjwrXKIv9a14EpTLNrFJtDiKhIibmB5zLNgLe84X6j3V0OCdSQV7DivEe0CSLxC3EcB8fHiyb56k+daDb5p01gaRhdtb8KtCcjeZI0MKXAB+p0rlvSxkdJeElH2XMJ/zOhNw7v8pYD1j3BA4yni1f9/Heejy8KoPkRFFZmS1ao2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8YvMDDpI8T971tJbHPd1tPqKr7FAFvy+J0vBuvNH0M=;
 b=Rd9fQfwcBFCnVb7424nUOGpy18j4kjEk1jZBbXnR9OBEpCvoiDo1gFMqLir1DeLKImJsb1NWfzHICjiszeuHEAzed6KYeuSoHIoqIfTBZzSzmc5Y9Rwue/qtJDZW2pPMGW+dVw38G6mtuji322XjeVDM8XWOj16ulJ8vVZsFF3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/3] multiboot2: do not set StdOut mode unconditionally
Date: Wed,  5 Jul 2023 13:47:40 +0200
Message-ID: <20230705114741.11449-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705114741.11449-1-roger.pau@citrix.com>
References: <20230705114741.11449-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: a7950b4c-759b-4c1b-a8b1-08db7d4dad8d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JZ3urN4fzyyu1MCxL0kMBauazYdnCPSj9J3zkY9AL4vXHepHqL2ond9WymrtRTQYEW98XBjqXwzn3SxtRRmL2jeyfvyEZ6cWkbJ4chk66HwgD4GS+iCNsCmZoDfzERW+XRkUKjV4GsqCMYPC5Ej91A8a26sHl4wHgIvb7mvKvBLkSouNKvqgIA31NOeHTuA7eHwg3ipZXgQZ+rtMoxqiwd9xIFjguGwD8FaFudSq+h4mxVosmR0jFvbRTnyU+7PBrB16z2lCtoD7OUjE5kiIevy9lCeceg8nBNQ21T9zcHnp9pbzMwDox5XOw6ogRhCSRP21mg0QbvrQvxm1FefYF9+d2amxtCwl7QVk5Up+ZIFdTq2jDwJj/jJD8/l28iiM1s+lsqIvYK34uwB/HLKaldbc5ZgFWQ0V4qle0KOjOfAJDCmicbt6S5nt5I61lqa0v5ZmSe/AydgVo0ABlFEegVkZOOVQomm/ymoI8dalBa8cIzYv763jKdVszh5r1s15F4ykXCTreyTegFv5bxCGbkmTsSdd4IyIg8IbxO5mnKP668X1XrjxvVk9nkWNRYNl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(186003)(82960400001)(478600001)(6512007)(6506007)(1076003)(26005)(86362001)(2616005)(6666004)(316002)(83380400001)(54906003)(38100700002)(6486002)(66556008)(6916009)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0t6L1hVRzFTNmZrS293Z2JlZCt2Q2I0eUcyaXBqTFlqOEhKMVVRRDZ4RlFI?=
 =?utf-8?B?b1VsM01aNzJCRHhSeGxoaHh5RHNqY1JJL0MzQ2xIVEx0a2JMSDUzd3JqNG0v?=
 =?utf-8?B?MXFtQ25mNnJNRm5FdU1DZS9MTlF3bm16cnorOU92R0JRVk1Pa0NIYllyRmtR?=
 =?utf-8?B?OHVOZEJHQW9LbW83WXpQRlE5R01IWXBQT1dtdUZsVlFKbm5hWEl0SlpOU3ZX?=
 =?utf-8?B?cms0c2h0aW5JRVdJTlpQZk9teHd5QWYxaEVPMithbFBHS3pGa0tVRVVHekhr?=
 =?utf-8?B?MGVHbDUvV05lbk1hRUxEL2dmbmorbWxCV0FYeldVUWtNZHlnaGpTd2NiQVRH?=
 =?utf-8?B?Vy9Zd1hQcFg0YXJaVjNlRE90WVZOWi9hZ3NQWGlrK2Q4NHRiL3Z1WW5VSmcw?=
 =?utf-8?B?eEUzdTdwa2NRTENSUENVWGtnd3ZsUUFkanBRcDZrZnJNQUhOQ0Q1ZkZDTWY1?=
 =?utf-8?B?bXZzUFloekh6Wmw3QVB1RGdEbXBSamR0ZEpGR0JxWEhTZStuU0VOUXM3WVd0?=
 =?utf-8?B?RG81YUR2TFREOEpzakhoc3JlZ1FvQUZ0ZTkzVVo3RlBRak5FUGJ1N3hpK0lY?=
 =?utf-8?B?STJrd1hkM1RHb1pRdWZLeUdoSlRNV3RhbDJkOUx2b3FNSVNLWGlYWFdFUFlu?=
 =?utf-8?B?S0NtSkttdG1oRi9uVWlub2R0Vlp3bFhEUko5QXdNTlVvdVBwTDBYWWpPdEkr?=
 =?utf-8?B?cEhENVZmZzFBZjZqdE1OeFNnMkRPeVBhd2lMMXp4aWtUV2FWYVQ2azVSTEFm?=
 =?utf-8?B?VnN3UzdzWjk3ZGs1STAyY1FJTzE5ZVB5ZmtpanZlZTVyOUY4NFNFTEZvOTNP?=
 =?utf-8?B?NTNsQzJhK3cyOVRyMnV3Njd3SWFDZDJBZ2lGMnRIWHU3eGxYWmFieVc2ZlQ0?=
 =?utf-8?B?bDlCSkJUNHJPakhPc3lmRVRsOWNUOGhNdjdOYW5NcWhQUnJTVWtJN0x5VkpJ?=
 =?utf-8?B?eDhvWURvY1NkbGE2amVFNjBMYXR4RmpNSzc5QmlucnFoQlhoR3dvTlN3S0ZD?=
 =?utf-8?B?b1h4Z0tQWFdtSWoydW5nU0REczB6TExCU1ZwT2dKajhrdk5aRjhNeTRMUkxB?=
 =?utf-8?B?NjNnNCtBbHlQQmt1QkV4YzRPZlY1cjMzWVJWYkN0MFNXSmlXWXltTVlJSlgx?=
 =?utf-8?B?Y2lPK0FPOG5ZelYwVWdnWFJYcVZpWEwyTTZ4UGt5ZjlXSUFRcVBINWZuS1JB?=
 =?utf-8?B?YldRekl5VUlkWm5ON1FITWsxUGc4RmovUGVNR25kbVZtWElHM3BWV2NxWGth?=
 =?utf-8?B?S1VyQmZ0aXZHN0p5Nmc0Z1F1cXlVNXRDZEdibXRpMHVCRXF4cUVGUE82UXUv?=
 =?utf-8?B?Z0F3SmZ6NHRVSGxVdUJ4OFFHdzcyeTlXN0w3SDdpMzlRbWhINGVTWEI4MEhB?=
 =?utf-8?B?ZkR3d2IwMjZ0Yzd0MXpCdm1PTVI4dHcyQ210RzllL2wwQzhsZjlhSCtqeHVC?=
 =?utf-8?B?TUtVMU9PcVRKY1ZSS3Y3alo1ZndJVHZWU2R1ajhpVGEvWnJYVUNDc2czMldr?=
 =?utf-8?B?aFpXNFdVbFVIa3JBL29Fem5CRzdiWEtGMHFHRjl3K243TkJwLzdmNUZob2pP?=
 =?utf-8?B?QkZ4UkFrTmZIYU5Tb0c1QUdrMnN4NXRWRkN5ZmJCNkV2ZmVyYUI5SVlHWVVR?=
 =?utf-8?B?Y2ZHbEF5TjhQVXliR1BPc0hPTlZWVHlGTnhLcWM4UzdVVng3aTNHRkdZWGtD?=
 =?utf-8?B?d0M4SDkzbmJibStSMzVHUXhaNFRQV2dIN00wbk1sdkhmak9OS2UyVU9ZUEdz?=
 =?utf-8?B?V202MTFKVkFKM0pBeHZJZi9vSFdKaTY0bW9DWDNOdXZrSlJuUkpoM3ZVdHJK?=
 =?utf-8?B?SlJXK0JQeFhoSjhBczIzQlVTQnBMTmZqZFcrcmpDY3BleHBNRFIybUpQMDFs?=
 =?utf-8?B?QnA0L0Zoa3R4SC91eHZPRW5XUEtiN2VEWGo4NkQrdmpQL05qb1hvcDNVNml1?=
 =?utf-8?B?RTllNHh2N2t2dzIxT0JxYm85eDdRODVpcUxhcGlwaDVvejM5M3ExeWVIYUE2?=
 =?utf-8?B?eTUzN1dVSituVzVFTHBMTHNGNWxNTnZGaGtNS0JVbGlJWnF6WVdzckRGcjdL?=
 =?utf-8?B?VDZkU1V6UXNNdENBNUZYYXdzTjJYUUpIZUROTnZxeWYwZ2FvakFiWGl5cm1t?=
 =?utf-8?B?RlZzdDJ6dGQrdjVqM0VwVjJMMmwvc0Q2VUpUczlSSFI2L2ZrVWVrdGFjbkEw?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5nsFbaZbWqCJUEKLMhPCTt7B40ul1/wTfNnTjHNvfkfDqRIY/eY9LJlrrRZjy3rNdk+P4esHJTTNupH1qkL4oOlzqEf68YhI5Ob/aKhIJZMeQQ0zUqmLVwzOqrzQ1MfDtsJ96BN5nS/S/PqitIr7B5XhQvopWA4JR9KlgBIN5UUmHOP0dB6LHVSGy+21kuBikJds4YhrovWOPlm2IUM27HN3wUfjblpGhRrtNo20tv8k3hiZdE8KQJ+rmBedDB6sy8gEQEr/k72bv6KY3ygqlaTPt/+eg2BXnKR6qNCKuyc63c0chAa33+s0VEuGKqKb9uXv7S2karSuo0DKBAqjhAwaX1KrAdmDeCl0KKf8VeQLNazc5U5/T/48L6/dWT3kzSiF8C5fEbNtiksXZ3kOSJRC8ly7/Qiu0pGL9Sbu38yqyTWA5Y7wx+YBK5Ln6sYzwZPeaniOYkwEDYEZZSC+L0Z+vHSmRVJe8oFrlU0B+WJDYUzlqR1qbrfbKyBdYH8jYZIyl4KOPi0KySU6cGo3TDx31aLH7ZjoaoAwDa9VNh2yeiP9kFXa1QHqTmQqm1Njayl+wWPs5HpnFVBItyfsEY/SBRqdeh3IEkaZM36arpWC1oKcrTXxoKZsOHUyEsDxzOYWND7E6qPaoYPoNAFI0svx4tLfZdND0aUNUbroxYw1E4OpUjB+mKPkmFL3ecc0rZbTGCF5K3F65CaWFeBGcWcdznitucEZ/qTDrJeoexPbDVKKNgSD4dAikwiyid2+7FuXZZ6UhrrNREgEQ6dGN/rO4HvSSWdjxPXQ1oYBkVTL6R3fWUtLW4ycuFrQKtmR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7950b4c-759b-4c1b-a8b1-08db7d4dad8d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:47:58.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12M+438blw2Y6ptahfLZpiE8scMhS4A2fLCbdLa5PJh1AdxEyoocOvEYtaO+ULOugZZT1pl1rS4Lh1B05B7IGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

Only initialize StdOut if the current StdOut mode is unusable.  This
avoids forcefully switching StdOut to the maximum supported
resolution, and thus very likely changing the GOP mode without having
first parsed the command line options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Use approach suggested by Jan.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/efi/efi-boot.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 4394c7276aa3..a13a335d24a9 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -829,7 +829,13 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     efi_init(ImageHandle, SystemTable);
 
-    efi_console_set_mode();
+    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
+                           &cols, &rows) != EFI_SUCCESS )
+        /*
+         * If active StdOut mode is invalid init ConOut (StdOut) to the max
+         * supported size.
+         */
+        efi_console_set_mode();
 
     if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
                            &cols, &rows) == EFI_SUCCESS )
-- 
2.41.0


