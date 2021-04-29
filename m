Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFC36EB3B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120010.226912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Zn-0001hk-KT; Thu, 29 Apr 2021 13:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120010.226912; Thu, 29 Apr 2021 13:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Zn-0001hL-HA; Thu, 29 Apr 2021 13:19:31 +0000
Received: by outflank-mailman (input) for mailman id 120010;
 Thu, 29 Apr 2021 13:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc6Zl-0001hB-Sd
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:19:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c966840f-34e9-489e-91ef-919d71b1dcef;
 Thu, 29 Apr 2021 13:19:29 +0000 (UTC)
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
X-Inumbo-ID: c966840f-34e9-489e-91ef-919d71b1dcef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619702369;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xEgcVM+Nvzkld4Ycor3ZvY74UftrxJJGUnWGGB+VW1k=;
  b=NVSqaxt/bR6JcPTgT5v0MTLREyVc7EDTsPP4o+GBE2lM4Mv+hBOo87RD
   s6e8POkxxGBQ/lvKfjDszqEtUuowAdk2B+sXD08NqBbpw3dSah04jk/cS
   tbybCMsJcHbUViGi/LI3o0V/pIV01prwcbdkthqeAKZQWpmJZL/9W9tC0
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: axtOQswOmSNn1/UuQQS7fQIwFkMFrQgfkyMc77wAxMx03LGNJZvEespEilmomTdJyVDLctsiuM
 +v2FaiuphegE7fL3vtn4FeZNiQARmV6eIXZoxJO8446sSAWKJR9SO+WQZSlelb+vaAh0rh0Uya
 lV+X1hXbuwNrugOyMR/CsPPrjpOLZiXaM71eD+uR7HGI/R7Z1mZ4jB/pN66cYkRAuInClvkBau
 nOSkyYqd3eksrxjx0LNpbmfDX1/f2IeI4oNm9QFBVIMetpRV6Sd0/Ujrm7phEYUeyk+dLFKeBe
 OHc=
X-SBRS: 5.1
X-MesageID: 42715852
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+Rdt7aA/qRK/I7blHeg9tMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DajZ6OW298OzcLyimryQmp5rnzDgSC0n4lPQ9n7L8+/Q
 H+4m7Ez4q5tfXT8G6460by6NBslMLl2p9/AqW3+7UoAxHNrirtW4h7Qb2Fu1kO0ZCSwXInis
 PFrRtlH+kb0QKpQkiPrRHg2xbt3V8VgheIoz/o4gqRneXDSD03EMZHj45CGyGpk3YIh91gzL
 lNm1uQqps/N2K/oA3G+9PKWxt2/3DEx0YKrOh7tQ06baIuLJVVrYAZ4XpPFoYBEC/Q+OkcYZ
 ZTJfCZy/BMfVyAaXfF+kFp3dy3R3w2WiyLW04Yp6WuonVrtUE863Fd6N0Un38G+p54Y55Y59
 7cOqAtsL1VVMcZYY90Ge9pe7r6NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0Zobgv
 36IRJlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRYDsLTaIRDkV4oWdisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXBmIZVOETp9YnS3ODqs/GMeTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9oBW5YQKuRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbRlLsqk8el
 pCMKrq+5nL4FWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIlt8iAf3tRmF+KPAV2Qc+TMA
 M3nSU5xYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeH/ep05CZ4icLdrFRrCEiF0nQoCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7U7EuV6kvsEpTHsDVzuIWcqa6DxeAwZ8tx
 lUyesykbCAkTGgJS8ajP4jOFNBUmiRHYlLFR+IfolSh7DtdjxhVGviv03rtzgDPk7Rs2kCjG
 3oKiOZPcvGBVdQoVh0+Kfn+lEcTBTUQ2tALlRB9aFtH2XPvXh+ldKRbq2oym2Ldx8p2ecGKg
 zIZjMUPyJjz926zwSuhT6HDHkqr69eedD1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rnekRU+
 6TEjXlWw/QOqcM4UiyqXkkMiUv9yVhvvPsxRH/7G+3mFQ4GuHfJVx6R7cdZ/GQhlKUMsqg4d
 Fct5YSu+D1D0DaLvih4ovTZyRYKhzSrXWtJttY4Kx8jOYXjv9LA5LfUTH0z3lJ0xU1EdfsmC
 olMdZGyYGEHrUqQtcbdC1Y9Gc4jdijLEMktQrtH+81FGtd+0PzDpes47DSr6AoDVDEjAzsOU
 OH+yk1xYaPYwKzkZobAbk3O2JYdQwV72lj5vqLc8n1BB+xf+9OuHq8PXnVSs4WdIG1XZERpA
 19+deGgqu+cDf5whnZuX9DGZ11mlzXN/+aMUarAu5H89uzJFSKjO+L2aeI/UvKYAr+TV8Zi4
 1DfVEXdeJZhFAZ/csK7hQ=
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42715852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh5Zr9fz9/X9w6BXmEcU1CpGNKkPlSh7ArrYQ4m7yvaS8scnozTrM4e5D7wfxOXjk+8Z3HHflvJEh6QgreL/3/klN/d6jMLNfelHs2oJ7wHhgYQQbULdwv0gD7q4LWShj7HgwqWQtz1iqLJI/53pIxxdmQ1RsMbiKu2gTGfJQTaGU3Wu2TjWwg145mkItO7RJXyadTqh04fSyYzIsgHYOeqmkZK09FN29OUQrn0Zt/Z3r7/ohIYj8Yfucb5C76kViTNfqiGYw6CKjJJ1DTpwBDTjrAiTnYGkj9nROsglpcIbrm3rQza080M26uA+BSb9VMeSU/1wwboUq32KwSdVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEgcVM+Nvzkld4Ycor3ZvY74UftrxJJGUnWGGB+VW1k=;
 b=mPtwuhx7+XHf71oCUwSRQSs0HfSdOI1Lru9gIL36UgssPMYyUZ6gDgMS0Exi6w6cLSBkjnZmP8CdNcikjwVGsWYjUaOurZVlZZ9F/4dOSUH97dOIzHhKROJUgv1eUqW/dvV6AcMI1uhuCpjbkviehQREJZVwAnVaCCqhIwu0etaRkELTsa8fH/ewgrvKnv8zRErHXqUMQn/l96v2azhdNiQrPcMyAfEV9/7iQIoJsl9Jc6/eNJ+4KlGhtdvTPM9TCbBgsObpP/ouEuib6CX5KZjs4QKvHWSQkQG4l0L4fFB+cNAz9FfQH6zw9FqhvHDn0w7GfQQGzpyzZRnEeDEZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEgcVM+Nvzkld4Ycor3ZvY74UftrxJJGUnWGGB+VW1k=;
 b=B3XTBMJNvj9dF4VGrduSSwy2fiYFAUuXnKJdIqIDeoQfqAFpk4kVdU5cea426aMLYTPRQdsVGMymZu4EVCjypLfWhkjDFyQjdRgg2/85MPbghaCJN2DNPDgUZzMuoPKNwanCzB4sXuYJjOI9UGKlU5RagAq+kW0lIG7jPOpkaHE=
Date: Thu, 29 Apr 2021 15:17:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 01/12] x86/p2m: set_{foreign,mmio}_p2m_entry() are
 HVM-only
Message-ID: <YIqx3LahSx1bmgNo@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <4b842581-e24d-6b74-eef5-7ac48f0ff0a4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b842581-e24d-6b74-eef5-7ac48f0ff0a4@suse.com>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 266b1be1-03c6-419e-db0c-08d90b111f40
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50652959CCB112F8A13EFCE58F5F9@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjN5E+nZgeqUdVajQ1Kgkrm42kv+LBJzVpnZTLA4X68jfh4bAhle20MGsKRQ4Q/Wye44mStjErqYUh5MapRvGzos830+7uhvJECiHot6YjjXmFHUDecXp8EAn3q3yGTreqx3TI95b9IszwzBmS2CnEyzXLRWxGI35ESToI4djXuCjRKqWvNKqymhK530blFPYkqoH3fW+LxicReCn8HDNCQETH6ch1XC1Ku5RRDaIsk/cLL1IloTHug7PxJ1jpOEneP1E1RiFgCRZDR8osET7wJ/9HZatzXwvPx2E75hUZ6kW900vMVZdGuuuLzJ3DlpW3LmyhVjnkgvkpjE1d3MqYkTjoVcyj0GwwtnBFRs/nSW9+l7t2Gzwy5DsBALE7t4lwCvwGm1jznMzV0Ifu3JF63JBAZnGjOE984LiKfhXawJox9MHSWtG+6EToJGEjBd7gh69jp+SaX8GPYcWOro5W/Hpcp7BKkLktzzO+BjowAYmZ0+pMfJW3ibx6bMVuIeZuwjTJaA0FZPXD0p39QmT5mOjCtZAcCU1z5trI1EWMXwO+R7YxQLf12EhCFXiHdgTvQWRAWk23JwkeZnCgnYiJoW7f7Te6XEINft2aBF+bMIHjGTmXq7+Na1P6FqJVf7EMdkBGgQuuDYpYrG3MGqTqD+jXFZpRhCQkD9XhEdlg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(66946007)(66476007)(6496006)(16526019)(316002)(85182001)(54906003)(26005)(186003)(5660300002)(956004)(33716001)(107886003)(478600001)(6486002)(8936002)(86362001)(38100700002)(6666004)(66556008)(4326008)(6916009)(2906002)(8676002)(9686003)(4744005)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUVsaXB3MHJvSkpjempOVERYVjFhRUdMQmhzYUxnMGszQW5DT1JkdmdPMHp5?=
 =?utf-8?B?ZzZSSTEwakVUYmRkMVFxVW1iRjRhdjRXNmZBdjRXYmlUSUhJa3JEQ3VYMnhT?=
 =?utf-8?B?SEhSSDVEWVFvZTcxc1o2R25wTExIU3MyUnBIbmE3T251SkkxMVQxSTlJNkNJ?=
 =?utf-8?B?bndQSGgyMUovNTBPUVptN0dGTGVrRGsrbmJtdGwvWmdaU2JISmRVNi9EN0Ji?=
 =?utf-8?B?Qmwxa2t0TFZiOG13dFFrOENZbHNwR0ZsUnpGbU5qMlM0TlZMdVF5OGtNa1J5?=
 =?utf-8?B?SC94b3c3SXoyclJJYi9vZTllRFEzbVhlZFNlVUptTE81cy9YZ01nTnFNZXhj?=
 =?utf-8?B?eDUrdDV5aEVORW5hYXlqQm5qMkxTMzRyL0dOYTJ5Nmd6YVUyN3NrbmhPcXlN?=
 =?utf-8?B?Wm9JdmsyYXVkVFBhSDRBVWFrWi8vcm5QRHZqRDI5ZFpDRE9pZzZ5YTZvcFJx?=
 =?utf-8?B?eW1CK0l3R3J4dXdJR21mNDU5dXVTTDl4RlZXQkY5L3VUVmx3dU1pWWlKMExK?=
 =?utf-8?B?Ni9nMzJGanBoU0sydi9HVFh4dS9tR2VaQWU2U2QxZTYwR2lvVktlbzlmQ0w2?=
 =?utf-8?B?LzBpUzBzNzRjQnNvSFMzOVlWZUhVaitFR2dLV290cUU0K1JrQnhiTEZKUWVq?=
 =?utf-8?B?WVZycXVyL1lpUmJnblVHdGhQajB5TjI1RnBrUFh5TGlLL3ZzTDZoS3NPVGE2?=
 =?utf-8?B?bU0zUTVoaHR5b1VWdm50ajFTeU80SnVGalQ1aysrVnZrWXBSRHRxYlJmSGdr?=
 =?utf-8?B?V2c1NWxXNHpzUU93a1RNd0NlNHljSHlSMW9SMjViYXNJMWhJWi9YRHg1STVk?=
 =?utf-8?B?RFFVQ290UnVuZ3ZhQWl5R0VHMUtIalJBWHVHRFY4d2dXLzM2UTNEa0Y1TUJy?=
 =?utf-8?B?dU5XeFl2cmVzYkVpZXBneE9kRm5Pd3hIZWxDc0xHMnBSTTVmN3lzQmk3NWpn?=
 =?utf-8?B?bHJ5ZlJNOENrcDJHMTdoSzAydjdiZWVrR3dvRHBRWk03bTRvdUxlZHRqd0dm?=
 =?utf-8?B?cDIrb0puVGVyd1F4Qnk0Q081eW5ZeWY5T1BDU1RFSmFudDFld215VG5oaE9V?=
 =?utf-8?B?dEM1bmpCekg0YTRCdzJOV0Y5R2tGa0xnNkRnWk9WajYrdnRleXM0clRuTnpH?=
 =?utf-8?B?ZU5QL3VzdkdnRFdIMHdjTzNtZHVsWWtralNsNUI3YXJDN0FVczB0dnZmMFBS?=
 =?utf-8?B?U3VubGc0RkRNMjhsbHI1RTkwUDA0ZjY2Q3RLaU9IYXYvbC9wWTlUenI0ZTZi?=
 =?utf-8?B?WW9Ld2NNKzUrN3lleGZOU09ENTVtRUJ4cDI1V2JkOXVZZFZWZGF4TUdhdjBs?=
 =?utf-8?B?NWczQUdSbGJtMzhWVk1jU2V4UDZBYmc3b1VBRVRMM05zWTRRcnBEcDVBQXZG?=
 =?utf-8?B?WEg3ZHhCUXEwSHZ4SVlLYmRQN3Z4L04zR2ZCZVR0ZlplWUVyS3crbzhiQ0Jk?=
 =?utf-8?B?WldES2p3RzJTV1JKR05Ld2ZvUGprNFZkL2JBZENBTVIvQUxmYUFjVWNsdWVU?=
 =?utf-8?B?ekw1SjdDYW5pd3JmRS9Mci9wU0c3WUpSWVZDc0l4WGZlbmMvZ21DdTdMRHA5?=
 =?utf-8?B?RTVGL3FYei9mYzE0aDlWWDlKcVhpRTFYbUUxSzUvelJ3Z3drZkZQUW9BSmNo?=
 =?utf-8?B?ZDNCUEFoTUxUemRhckNPZG5Zc05FbWFtRjBZaEp0NjNaeW5UVVEzZEdJcytp?=
 =?utf-8?B?djN0U1R6bTA0LzFMZ3hYZkE1OTNPcDBTSTdLSVZiaUFmQVJFUnFVNk5UVlFM?=
 =?utf-8?Q?8IcDvtI/w9yK67NxtGXW3q0xo8xRZf8+kqBuPin?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 266b1be1-03c6-419e-db0c-08d90b111f40
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 13:17:21.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aj7RDryQeLY+9xPr8xx44c5MwFaRYaOEuvBU0SRoRo9PjIJ2JK9+E92dmArK9QtbsXQrEXOSYuiAS2J6ZU6D5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:05:41PM +0200, Jan Beulich wrote:
> Extend a respective #ifdef from inside set_typed_p2m_entry() to around
> all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
> check path.

Wouldn't it be better to also move the prototypes in p2m.h into a
CONFIG_HVM guarded region, so that it fails at compile time rather
than link time?

Thanks, Roger.

