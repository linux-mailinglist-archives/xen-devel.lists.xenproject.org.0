Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01A53FACA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 12:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343075.568227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW3W-0005XO-Do; Tue, 07 Jun 2022 10:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343075.568227; Tue, 07 Jun 2022 10:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW3W-0005Uf-AK; Tue, 07 Jun 2022 10:03:22 +0000
Received: by outflank-mailman (input) for mailman id 343075;
 Tue, 07 Jun 2022 10:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7Lz=WO=citrix.com=prvs=1504b46c8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nyW3V-0005UZ-5s
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 10:03:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d33bb74-e649-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 12:03:19 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 06:03:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5529.namprd03.prod.outlook.com (2603:10b6:806:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 10:03:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:03:13 +0000
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
X-Inumbo-ID: 0d33bb74-e649-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654596199;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=a4a79oM4NPTFiMHtN1P2yssXZy0Fl5/x919PDQ1ra6g=;
  b=XQvjxpW3GqgPG2APqw/gJDmU/mN28EhNmbnKYL923cUDPZozhlAWfPxm
   4jwQssq7smEdukvAsgjdDq3rBMaDi+n6La41+73Qj82tixjiqQr+p3ZE8
   LEpc/pk+qG7Xh6Xt1lawdobMHrHp4/vvGAqlZ5IkQ/PLdNSuTF/T1nDTI
   Y=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 73028372
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xu0zhazYt8x8hRdlbAB6t+ctxyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 WMZWmiHOqqKZjTyKNonat7l9xwHuJGEmoRmGwo5rSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22YfhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrpCQUix0Y6D2w/0TVEh4SwRvPIlvweqSSZS/mZT7I0zuVVLJmqwrJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTuoQwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGUC+AnK/8Lb5UD8y1Z+2qSyPOOIRYyged5fuh61n
 kDZqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWR22pVDhQVXFm6pPCRi0iiVtYZI
 EsRkgItoLYz8gq3T9D7dxy+vHOA+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUENSkNSFJc58G5+d5oyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:gixSlqmz0BGiHPpdMgIvqN11mnbpDfO/imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81nOdkTN9VLXKOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mPryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idjrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNJd3AL3Z
 WADk1SrsAxciYnV9MDOA4/e7rHNoXse2O6DIvAGyWQKEk4U0i92KLf0fES2NyAXqAu4d8bpK
 nhOWkox1LaPXieQ/Gz4A==
X-IronPort-AV: E=Sophos;i="5.91,283,1647316800"; 
   d="scan'208";a="73028372"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQ3JThqEisiahtdEeYh3zttpXtQTV95dvBAT2pSP/OozZX67H8T6ckf98N3756ZalW28VgA5WEoBrba0IK1Qux+UCra7jATrl3GDP7Yij7EEK/YxTp22WjMUI+jwYtiMpDeBaCrPReKhjNp/PJw7D9Aw4Ph5yBCdJAE7kAQieH9ihKLE0y0/Rul2rPlt0Czoiwc82IiW+QKoKN1C+bLoJQ7Wxznv5bdgaAEJcs465Cc8P/eoZkW/HxKXcdC9/aFRr4P7nAlzEt+0+qQHLVdh4RMTlB5C2Wfk24MvhC8dY+HZ5FuIYdH4CmQrtVMofk8wbwcvhCZqNgxuc3b46od5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh1TNP0OG4TWHAc4H1wBDB5R+zLphn5Hzu+hEwe6Sjo=;
 b=dz7d+FZdvYS1p2bAYSNUka9nsTrziabi/tKVwLcMHEHTSmx379R5mta9q26hJ2tYazlOTKml/BPs8pbpEGGObZjkV2S0H5YY6Leqi2U+/jsBJF6h0IJKRy4SKWK6EXkUSf2kQyOeHGI71V+QOJdBnWySHRUIvLuGNA9bru6gMKfsEDjTVftVYl4IH5W3h8B9B5g46/HZ78nAhIY9IriVOz+W3TgmQxtJMPOi7hoFnQGIgMTpaXqiMrE2cLP4j8desjYNR2l/D8cVVZ5/n7raPPUDXT8S8vVWjyHUR+e7oF0ELRoHd5CB0vSBDXVkjeTM3OhljFDnixV/9fpa7vz9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh1TNP0OG4TWHAc4H1wBDB5R+zLphn5Hzu+hEwe6Sjo=;
 b=tGynxmAaWOZ0+W3YYDgXeyGfMBL/C17CVrB6AVmigfemjRs0WL0xVs6dGNwwXFB+KqusXN51Fcr0X9HFPCJrDbFDWT9uB7KCllmjt0u9bKRWzJJj+qgM1+pazEcZZ1W4dv5JkbcwkmEY17q3Tz99pqBcE1/J4vCSDg5gPZtkp1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 7 Jun 2022 12:03:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Message-ID: <Yp8iXWT+tXRB1wYP@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
 <3c8b0b72-0a9a-3dfd-bf5c-b6cc40a4ce3a@citrix.com>
 <fe0fbfb8-859c-7b24-89bc-d5c68c7b133e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe0fbfb8-859c-7b24-89bc-d5c68c7b133e@suse.com>
X-ClientProxiedBy: LO2P265CA0488.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02c0792d-6e7a-450d-daf8-08da486cef4d
X-MS-TrafficTypeDiagnostic: SA0PR03MB5529:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB5529F937A8EBDBECF131CDAF8FA59@SA0PR03MB5529.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HERhQqj7FXVZoBkn4+WZDiSSrBjVyJcGF+2JfwAQ1IyBzrhNZHOjVoQxqzzxukWR/MK/KLuTtIVnb5e8fMAxGlQRDHYBI1o4K9kteVgK5jmFjjrFnMZgmQajOrzhfKEfiaHmyXB8UPKTc/sMSUuELMXe77g5+apF49jtHGr0T+9MUnCYctpfgSKX3uMbaIpUz6dfG8PR/bU4Bg78v00nueMmjlT3h24xIalwqeyViIXMMPxHuXzjgkxd1myYCIhxL1CcpIqnmBlwpuLhhD6Te1nBjtpNotyjEKs17A560hNRTNXv7NTeFMLygdehyDdgfKq10zRcVfEzMAs2r1ixLrpuxNwwz525sZ5CMZTmQbXMKZEV8crNDt4+REHsvIJ9QCf8QDPxp8mKudOJNQS+DoTuOR4OvMya5OHvbQDGzQUWCPCQ76fqqM7+Uo0BACPS720ORzrk+trt7mNCaxyWOBgQU7IgAj2X8yysBIX9kJzwbvMWF+OkHG9uLqIe/NjYyfd05fWknui9hZOkLRyEOqdX9j9Xfb6zxtUQAHRwrHU682PJZXrMOnsqGEQz5wW0swp+wuHjB0BH402KS2Lb3dvPo4SonbKJ+ngsSF4TAGdW7wXdidUhckvnzieOS1DMLHiyQJamK5ZziwGWRs512yH68FphLzZ8n+oUT6uuBUlsh/aPYcYcvAjg/lAQAzfg/H0Tb8R9G8Mv0IhuGNPbSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(38100700002)(4326008)(5660300002)(8676002)(66476007)(66556008)(66946007)(82960400001)(6506007)(6486002)(9686003)(6916009)(26005)(6666004)(316002)(53546011)(186003)(8936002)(83380400001)(2906002)(508600001)(33716001)(85182001)(6512007)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTNmYVkxaTJreXFRWjN4Y3E2QmZTbWp6RzVZdHJnbjM1SU5WbW9aNjV4UTRV?=
 =?utf-8?B?NW4xRzllWlJZdmF0Q0xlVU1zVk1xM0NNaVRKUW5XdFROc1d4bjNCSW9tQXdh?=
 =?utf-8?B?TGNkRjFxeHZhU2MwK2l1Rit6YjVSRU5NNUJSdkJXT2NlRWx5NWdkSW1BVVFh?=
 =?utf-8?B?Y3NaeXY1clJHcVJvNVE0c3YxcnV2b2F3ZEl3YUIwQndtYWxTd243MEFRK1hv?=
 =?utf-8?B?a0p6SFIwTnNuaFRmZzduc05rdlpzVG1yeHo0WTE5NzBmZGNiYXl6SXZPVXJF?=
 =?utf-8?B?Q0hIK1RQL3ZJanpLc1RJMzM1dmlaR2VmV2Vlb2hkYXZIR0lNZ2VTODd0em1V?=
 =?utf-8?B?ekZ3MEFJai9STDZMYzRYeVB0UjFyY3ZNTkNpb3RxSUI4T3c4L2VUTUZHSEpz?=
 =?utf-8?B?cTFVZ0xoa1JkYks1cWt6OTBjelJsTWxjalRqTzRZQ2tEZlFkbjluRHpqTFNM?=
 =?utf-8?B?SW4xNThDb3NVd3lzZXUvbVNKclFwcHVrSnhZTkNTNm1UR1pnVDhuaHFQb3lp?=
 =?utf-8?B?Uy9LdFZMQlpjVk5EdDhyTW5UeW02VlllS0VYbEw1dTUwSDJDTDR6VW1jQUEr?=
 =?utf-8?B?UDMrcHY5NWhUWWpac2RYS2JaVjg3Tms4U2hKL09kR2RlUmtUZ0JuMkl6OWNq?=
 =?utf-8?B?QUYyL3BMSGtaMUdqNE1OSER0VFE4RldXTWp1RTcrZjMxeHRqcE5JOEtWa1FN?=
 =?utf-8?B?c0NpZzVSRVp6TURSKy9ueENtWUc5cXVlU21Ya2Y3eUpOZjVYMlo2U0c1WFFh?=
 =?utf-8?B?WHduWTZPcUlxd2ZhWXBhV1BUVXRzbWhQblBQajBiU2Jqb2hPeERSYlU5YTNh?=
 =?utf-8?B?cmFITTJPOVRPcVZqNFdiZ3QxRVQ2TlVhM1ZSVzZjNzg4R1JmYWRVejhkNVVn?=
 =?utf-8?B?N3cyRGtpUHYrMjJ6YnRpVzg1WCt3OGlZTnByQzQ3YWY5USs0U2hKZUkwK1Vh?=
 =?utf-8?B?YmJkL1h2SG5rRURFRXZsMFRRZGRiZjJsdDRXd2ZqaXlLSUhqTHFsZUEvSWtl?=
 =?utf-8?B?VWxRSHZXeFRWVjZ2cmdLTHh3NU5vaEIzQU5uZWFnd0xiWDZzemtZS09rWHRn?=
 =?utf-8?B?c2thWTg5VWRpZ1dHTjdFUmU1N2lYSm1SUUNPN3hSclF2TGhSQTBoenJmazVy?=
 =?utf-8?B?UEE3a1NRTG5IQXU3MzhoZ24yZGZoVHRtZEplZkxlMzM0eGhFYXBBYkh3Y3ov?=
 =?utf-8?B?UlNlNmFVK3BmL3dTWjVNYjUzQlBqelZBVlIrQ0RTUTZONHVCanFtWkNmd1Ur?=
 =?utf-8?B?YmovUDhkYXpDVTRndC8zWUNlSFQ3dTFqejE4bXNSOEhGQTdVbXU2NU1GN1ND?=
 =?utf-8?B?REJZejR4TVptNVhBbXp5NzR2SFliZmdvOHlPL1NidGkzUTlDdkNiUlN3cHJi?=
 =?utf-8?B?b21YUzdLYktNaGx2UGpBYWd2QkczREtsL2I1YnNhbWNDS3R0V25HRVdnWjVy?=
 =?utf-8?B?VnNvT2xDcGdwTTF5N24rdEkrL0pPaWdnNzkxRDBFWFo0WVJxUzRSeTZqaUZE?=
 =?utf-8?B?Sk04SDJpQmRkd0ZzR1Z2ajhKbVo0ZVJLTVNVMERmbG5rbkp3QmgzZXlHOXZN?=
 =?utf-8?B?N3pBb3ZxVFg4U1ZKSUZ5SHZaNkQwQzBzcEdWZVNDTlY1NEJQaWl2MDlWcTVM?=
 =?utf-8?B?NXBLTWlKMXNXcGlRUHRPc3VHb0RWQlFBNlJTRUpFL2xDazJmZ1NlNVU0ZzBZ?=
 =?utf-8?B?K250QzU2TnBXRUFmZkVUT3FVb3NUTzErU2hOdnZDbllCazdTSy9pS2VtVTBm?=
 =?utf-8?B?MXR4VEcwM0VIQjl0bkN2aWRpaUplbnFPdVk5eEN4ZjhTZDdtV1FGRG5BNjZQ?=
 =?utf-8?B?OFE1TkxWOXUzSEJPb1RtZ0Y3c2QySktqNXlTZ1VRazd6SnNwdHFqWDZDaVFM?=
 =?utf-8?B?dnM1Y1dadTMwVmRKaXU4OWt2YzBkeGZUQzArMmFNN0lhMHNJaWgyVXNSN1VE?=
 =?utf-8?B?TDBVcE1KUm5FWVdGV3pVa1MwdWNNSkg0ZTdvRDFYaFROM2lyYklON0l2N3JK?=
 =?utf-8?B?cnozVzNpZVJ6TFVad3BIRnY1MWpZU2JISFZ1dGZTZlBmVjUzSFh1aUdtWkxP?=
 =?utf-8?B?Ym1RL0xLQlV3VmhCY1NHMkgwSENnbzBSY3cyRVhuT1FBdlBhRmZCUi95TkJT?=
 =?utf-8?B?RzJLZi9HdFNySDYvRzIwNGRWVThVQjRsamhJQTI1cUNLTC9HZmYwUXFEcUtw?=
 =?utf-8?B?OU4xYjhkc1lHOTZTcXlyNVF1aUVScHEvWjN4dUJXUzdxMFJWc04rNGlNOWg5?=
 =?utf-8?B?WEdVODViWWQ2QU1ia1RmQVgwclQzdFNMWUZXWG54d09KV1dOQXd3TGwxeHNM?=
 =?utf-8?B?bXpmWWJLNHBSbGhQeXdXcnpvVXJjYjhHSWpoZVg0YjJXVit6d1g5bG5QZFBi?=
 =?utf-8?Q?QKVHY2+AbffQV3+A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c0792d-6e7a-450d-daf8-08da486cef4d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 10:03:13.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJ3fBaaD9uSPunu3sywYU26oIYsHPGDr4YkoL9wN5xBeu88R7eFAqqMM9hf3w8+qEk3SHcwQitQV1cugUHprcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5529

On Tue, Jun 07, 2022 at 08:54:15AM +0200, Jan Beulich wrote:
> On 06.06.2022 15:27, Andrew Cooper wrote:
> > On 26/05/2022 12:11, Roger Pau Monne wrote:
> >> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> >> index f08a00dcbb..476ab72463 100644
> >> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >> @@ -4065,6 +4065,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >>  
> >>      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
> >>          return vmx_failed_vmentry(exit_reason, regs);
> >> +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
> >> +    {
> >> +        /*
> >> +         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
> >> +         * exit.
> >> +         */
> >> +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
> >> +        if ( exit_reason != EXIT_REASON_BUS_LOCK )
> >> +            perfc_incr(buslock);
> >> +    }
> > 
> > I know this post-dates you posting v2, but given the latest update from
> > Intel, VMX_EXIT_REASONS_BUS_LOCK will be set on all exits.
> 
> Mind me asking what "latest update" you're referring to? Neither SDM nor
> ISE have seen a recent update, afaict.

After Andrew's request we got in touch with Intel regarding whether
VMX_EXIT_REASONS_BUS_LOCK is set when exit_reason ==
EXIT_REASON_BUS_LOCK, and they will update the ISE to contain:

"the bit 26 in the exit-reason field will always be set on VM exits
due to bus locks."

So I will apply the changes requested by Andrew to match this
behavior.

Thanks, Roger.

