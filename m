Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29D52D258
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332899.556675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf9Y-0003AY-QO; Thu, 19 May 2022 12:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332899.556675; Thu, 19 May 2022 12:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf9Y-000388-MS; Thu, 19 May 2022 12:21:16 +0000
Received: by outflank-mailman (input) for mailman id 332899;
 Thu, 19 May 2022 12:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDN/=V3=citrix.com=prvs=13146dc80=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrf9W-00022A-9h
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:21:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2954d26d-d76e-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 14:21:10 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2022 08:21:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 19 May
 2022 12:21:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:21:06 +0000
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
X-Inumbo-ID: 2954d26d-d76e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652962870;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R7jkYktH2zw72lBR2KXCu8hpkmt3VPudGnIsZArRlhE=;
  b=KPrVt64FTdGWRZWikhZ+jbTF+iyAMz84IlWNZnjdmTbX8JqCJJOpznbC
   Hgoqg7pFDDMbK3gdBz8At3zuQHdTF1Zvgjz5Z4n+0vp466gNJjAP1pDer
   d007fvNCk/sMm3VWTxHrf6H7rivjPImsTzjNF3QOz785osRKg1LKWyAem
   c=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 72083973
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9h2vM605PqY3hbouCvbD5clwkn2cJEfYwER7XKvMYLTBsI5bpzxWm
 mQZCGqEbvjZMGr3f9EjYIi1/B8BuJfXmtMwTAU9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1sm5DzUQIWMpb8mb40C0lYGgBDGPZJreqvzXiX6aR/zmXgWl61mrBFKxhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82dBfyVube03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrialK20D+Q3OzUYxy3Txyi16jqHyCcKWd4y7ZddOw0G9q
 VuTqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7l0j4XdtcI
 k4V/yMGrK4u+UjtRd74NzW7rWCFuFgAWtNWO+w89AyJjKHT5m6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU331y1uPhTa7OCxQJmhbYyYBFFIB+4O6/911iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:tuoSu6v2vFyGmj1or36R2b6X7skC/4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVeUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0k9
 gsfJ4Y0I2mdfVmHJ6VNN1xP/dfNVa9MS4kEFjiV2gPR5t3ck4klfbMkccIzdDvXqA0570Pv7
 mEeG9klAcJCjfT4Iu1rdB2ziw=
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="72083973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqHiDNFYBv4J5fqaa6MLBVKED4e/WcTMfj2iYxutM5kJW7LZ1l7G7xdmK20B/rrJl83+VdIqTRngBuujqJTflYUhZ1A7bJ8KvePIBLKq2asowfGJAoXJps2Me5Wvg1nOSC3RbZt0ub+vgPWuqw6QNfdqZo8y88zH4vxYSfpJC24+/yVzuBcedGOufwzX/wHX6Gs0gYzhoqPi8EhfNzHB1TOTCMtgrsGFw6yU8E21PmFdccjUedSmwpIK3xPu7bkOo0uKHMx2NVXLKnb70rjPKEUISPgCT6lNoknzHr/J0PDl1B4L+dh0qTlwxhkERqlKg+8jR5itzJtZTgaGMP5RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9bvXr78t6uo5huIrtNfrwELMwIeizoRIZf2M6XyVjk=;
 b=gP4GenPX3FXRG4wT4Cit/CuCY50OdlkxEZiVrVCUip6phbc6aXAaJkc0I9Kj+NvSeegpK/K2RSnOUeYf98rCSsDGMABFy/o0IOzG3r9OrecICnEwFIOus84mLOlWe6gFtDcRvaGPkt0QZ02i5hjNu7Xg9cSo06UXpMXJEvR/t2FF/0rAVqcbjGs5lZpNhW18jqbTkqYuw3Ymfvde9rmQMx25DmTJAwSMvXTv1T5OaAy7fF14qZ0ohl+2IwfxZf3zTf5glnZo2J2n3B7phck25UVNJwPaFxJkry7s/LztXdpO9ROmFftuCykD4RW7aV+aiE3IfM/MybED1ahMqaUdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9bvXr78t6uo5huIrtNfrwELMwIeizoRIZf2M6XyVjk=;
 b=Pjo7MtB9h+xHyyZPnnXruwZ6Y2VM5umd4I9jMWEWXOkkJWmdihBsosW4wji+chHi3TRYkf/5PHF7VwT3sOr79XGq7zBrE8WjOithBO4e2ZLGkBUee5AAxD20/yFulYDigCQQMC+Kt8cEb1UBcIHHR3tvp82oC/grKtRovf4Mkzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 May 2022 14:21:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/vmx: implement Bus Lock detection
Message-ID: <YoY2LLyaXhX9aJQ4@Air-de-Roger>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-2-roger.pau@citrix.com>
 <84ee0886-9ed2-97ad-e9f9-c81e8a3885c5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84ee0886-9ed2-97ad-e9f9-c81e8a3885c5@citrix.com>
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d449f77-42fc-409d-e7cf-08da39920c24
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5455:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5455E85E7F8A5C963DA25BC18FD09@SJ0PR03MB5455.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//M2Si1dFs2qreW/EH3qf3yejeed5J0TwWYkxg0H9RpLSy+8Wy3UavI6wbgJ6bv1DtnfTIUE1VIliG+TOLhDyLBkN6FiPlYcz488dwnxONdQ3tPyzP/XWNL7BkIPovCuGXPz9/UL0zxq5OtBbIpeAuBQn5htmYQF2XUA7Xu4kj3ZrAhd0mdE8rxa6pqNcT++xqI/x8/8/fe76hDqcAk3zcZHlSA5lMX+8qD4ZNwgvgeIuuS9OJaipNUFEC3Jji6e6KeEScbG3ORp/KA9MxQfwzv1Q7ihqKXhlH82Psy9PF/cFlrX1nIaRXV5ksPoLAsehhq0/0mZPyYjPHHEQVolPeb+JtFrLliLVIRkPgpraQKF/w2Xidb5pCOHYsdKkPRmN7wDutG/UUbk+ndzvw79q9FNGkOLfqkWabD5LBTAv2EEKVimTIVDjGIQjmPukvNyGA9P/eBypQIoDMonlp4QdEyJdD+JHn7rXCinPOeIQBIb3EeADlmJw7RVlANPW6Cd+XeXMhUc5ZwarxCVufC2vtNx/wFPB1LrnGvzcOZV2lxt/J7vJRseSeRAESc5U+quqrL/O9ILKGo0ONejPuPh27gOjEFXq5UM3BzBBVrU/U57/lOitaILmCYSqn/x9o8cuOeuKuTbjj/lT8D8bZD8iA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(2906002)(86362001)(6862004)(66556008)(4326008)(54906003)(6636002)(66946007)(33716001)(6506007)(53546011)(38100700002)(9686003)(26005)(66476007)(6512007)(186003)(316002)(8936002)(508600001)(85182001)(8676002)(83380400001)(82960400001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FYL090Nm42YUgvbzlVVThTVW1CdlV3UzVWeWYrTE8xUnVWRkt4S3hHVEJm?=
 =?utf-8?B?VzcyVmVpc244MytYelRUMUdodWJqMXNYc3lNTjdNOTBLcFJXTERZdGdGeFht?=
 =?utf-8?B?VVdPOFRVZmY4a0luQk1scGcvQUNDaXIzQkN1N1Fha1k1bEFEeEZySzZsWEVU?=
 =?utf-8?B?T1dCUHFtYkFUbktla1l5UnZsckNxQTlCRTgzN1Vhb1ZaTHZ4czYzWDhTeU0z?=
 =?utf-8?B?OWJNbzd4YmxoSm5JcTVpeGVuaVVHMlBJWlNESzMzQXdsVDVDRGxDOEgxdWNJ?=
 =?utf-8?B?dHNtZk5YcTJnbUxXTCtXTm0rNXhva0crOFJMZGJDQjlZUTFUTENZWTB4U09u?=
 =?utf-8?B?dXF6RHQvZVFSblA2V3hKSW5XRitsK2NKYVF6aEJPNENueUZ2bm01TTJWQWUz?=
 =?utf-8?B?b3ZPNEw5eEdrMFhNYW9yajhwSVE5VFVmMnBtdzRVVm5HVmFkQVNzaGFOa2JS?=
 =?utf-8?B?YU10WjN4N294bkx2V3lFT3Fmd2x2TmpsZU5KT3p3YnNnaDArZlNPUys2aUxi?=
 =?utf-8?B?NzRDQTFvVEFibEF3K3I0OUtxRlB6UEJIMXdUMFVXb1ZtMlVCY2tzRXFMcDFn?=
 =?utf-8?B?WllDcTBjRUIwN2taVEowS1ptVkRxVWhSNG00UE9aSSs2NFg2bmUyYXg1TFVD?=
 =?utf-8?B?enYraWhkallnMDNZT2NTS2RwY3U0cFNzMGR5aERBNGN5dkVUTER6a1NBV0I4?=
 =?utf-8?B?Y2Z1cnl4bDU3NFRmZDFJQW9objI2MVNRU2lodDE5bmoyYkhST1kwc0R0cVdX?=
 =?utf-8?B?VXZLdXQwQkZjRm5HN2lEYmFwd1o3MENiV0JmUmdPTU5kejVBY0Fqd2tKekNT?=
 =?utf-8?B?MHJBWW9CbU5zT05jOWNMdjRJdDk2N2Vnd0M5S1p4TU1JMVpBY2o1SWswbkJT?=
 =?utf-8?B?cGNHcDcrMEREaFFNRmVpNG50YTNZNkg4SEhwRllBRm5NYThTeno2YnQwNjJw?=
 =?utf-8?B?anJOVVNlWjdTRlg1djRrazhGSWZBcGxDMzk2NGlSNlcxaUlwcXBxTUtMVUFD?=
 =?utf-8?B?R042NUY0QzNTVW1vdENzY1ZlalFaN0lPTEo3NFowVXJoUFdQY3NMMHA3L0lw?=
 =?utf-8?B?WmRLbWt6UVViU093Mk4vMHFuOE9STzNQay9zakl2UE5KMktyc3hsdWhBclR2?=
 =?utf-8?B?Sk9IU21tM2RsUDd0MHgvcGNYdHdSaDBHY2FKQ0VSM1Y5dm9rNHYreUluVmlm?=
 =?utf-8?B?cjhEV3hDMmVCTWxnZUxlbis0TkNRcTc1TnZrWlpma1krN1pwa3FFeTZRNkFU?=
 =?utf-8?B?OCt2Y3hzdUFCYit1MGJYY3FRTVNsN0o1M1NrTEFZcllRTnByOVUxSmVRVkNl?=
 =?utf-8?B?ZUI5MDVNbm8wMWt3SXVhSmszenpyNjNKVkdJd0RhYnNuOXdHaUVuQ0NXNmVT?=
 =?utf-8?B?WXA1TTZUS093YkV1N0NuK2xBaWdqdGcyMk5FTzB3emx3VWlVcVFXYlpyZE5u?=
 =?utf-8?B?UDRhelZ3Ujl3OHlrRWxqRWhHOFlpaHlkQjVnTTNmNWhhM1ltR1BKd08wNXRL?=
 =?utf-8?B?am9tbkVlSDJVL0psZjJrNUh5TzE5Z3lEZlpDcHJKNCtXNVluVHNGQ3k4dklF?=
 =?utf-8?B?eW83TWplZXQ5YVpxK3NEZElCcm9kaFZKZnRGQTNVeVRMV2pFV0FIT1JjclRW?=
 =?utf-8?B?TlBMY3lDM29DQjF4aTE0VGoxd0hjVUpHbE5lUVp1dDhYcnQ1WjJBSUxDd1Fl?=
 =?utf-8?B?ME9mK0xCY01JYkNaR1dlL2VPZ2UzalA2Q21TSHJ1NTM1RmtmajZaZ2NqS0xY?=
 =?utf-8?B?bXpIK1lXWnlzZXFNeHczc3hYOEtTa2xuTzNxc3NUR0orNmE4TWFkV0ljVkxE?=
 =?utf-8?B?WHhWZXdlY2NSdkI2MnlzM0d1RWx6emRsQUVuZzEzTk5WVXBqQmhveDJzaWVQ?=
 =?utf-8?B?UWdxTG9IeGlQVDhEcys4eCtSdU5oMldQdnlzdHp4WTV3YjZTSDN2TGp0aDla?=
 =?utf-8?B?SGZ3OEFGT0ZPeHZtVDBNcDlubjk0Qythbkd0bGVCWkI0eXZFK0hQa0phMysz?=
 =?utf-8?B?WnB2S3l1T2RNKzMyVWdVWGpEWUFvWDAva1B5NmhHTndFUFM1MmlGdVByWVVY?=
 =?utf-8?B?MzI3bUVzYUY4Q1lYUGRuMkdFMjBoUTRRR2tFcVMrR1RGTUwzYlUwWEdTYmRz?=
 =?utf-8?B?L2VYdzhJREpBTkNRSWRyZWtrYVpKdUV1WUdBSlN6Q3BldzNmN3BNT3RRNmFy?=
 =?utf-8?B?OWhTNUp5d3Y5UGxrT05qNHpBRG5MeFp5ZWt6L3lHKzYwdXNONXIrTWhkenB2?=
 =?utf-8?B?WlB4YTVnemVPU3FXYkJiNlVDMCt5SHNXN2VMMHZnckphWUpKMTY5UnBaeWFT?=
 =?utf-8?B?dTVMZjc4RERtWUpyTVg0cG5hNHNiQ2JNVjN5dFJsRzlGeE9XbEF5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d449f77-42fc-409d-e7cf-08da39920c24
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:21:06.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZTQTF3kHf6KCnNTVychTcIqcfn6V+0H+pLH+pkx4R4YIa+zWV2F9I/DhQvrIc3254ZgD9+wCPnAJzk90qkf/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455

On Wed, May 18, 2022 at 10:50:02PM +0000, Andrew Cooper wrote:
> On 17/05/2022 14:21, Roger Pau Monne wrote:
> > Add support for enabling Bus Lock Detection on Intel systems.  Such
> > detection works by triggering a vmexit, which is enough of a pause to
> > prevent a guest from abusing of the Bus Lock.
> 
> "which is enough of a" is a bit firmer than ideal.  "which Andy says
> will be ok" is perhaps more accurate.
> 
> Perhaps "which ought to be enough" ?
> 
> A buslock here or there is no problem, and non-malicious software
> appears to be devoid of buslocks (hardly surprising - it would be a hard
> error on other architectures), but a malicious piece of userspace can
> trivially cripple the system.
> 
> Forcing a vmexit on every buslock limits an attacker to one buslock per
> however long a vmentry/exit cycle takes.
> 
> > Add an extra perf counter to track the number of Bus Locks detected.
> 
> extra Xen perf counter.
> 
> Because other hypervisors use actual perf counters to emulate this
> ability on current hardware.  Maybe something we should consider...
> 
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index d03e78bf0d..02cc7a2023 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -4053,6 +4053,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >  
> >      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
> >          return vmx_failed_vmentry(exit_reason, regs);
> > +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
> > +    {
> > +        /*
> > +         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
> > +         * exit.
> > +         */
> > +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
> > +        if ( exit_reason != EXIT_REASON_BUS_LOCK )
> > +            perfc_incr(buslock);
> 
> I'm pretty sure you can drop the if, and do the perfc_incr()
> unconditionally.  You won't get EXIT_REASON_BUS_LOCK |
> VMX_EXIT_REASONS_BUS_LOCK given that wording in the ISE.

I though the same, but got a EXIT_REASON_BUS_LOCK |
VMX_EXIT_REASONS_BUS_LOCK fairly easy by simply doing a xchg over a
cache line boundary.

I think at least on the model I'm testing it looks like
VMX_EXIT_REASONS_BUS_LOCK is added unconditionally, regardless of
whether the vmexit itself is already EXIT_REASON_BUS_LOCK.

> To test, Intel has PENDING_DBG which interferes with most easy attempts
> to create the condition, but how about this.
> 
> Load an LDT, misaligned across a cacheline boundary, and set #DB's %cs
> to LDT[0] with a clear access bit, then execute an `icebp` instruction. 
> The atomic write to set the access bit is a 4-byte access typically.
> 
> This should cause the #DB intercept to trigger on the same instantaneous
> boundary that generated the buslock.
> 
> Otherwise, LGTM.

If you agree with the above I will modify the commit message and
resend.

Thanks, Roger.

