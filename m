Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45E44E7B3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 14:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225245.388983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlWp2-0000ss-6J; Fri, 12 Nov 2021 13:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225245.388983; Fri, 12 Nov 2021 13:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlWp2-0000qo-39; Fri, 12 Nov 2021 13:42:28 +0000
Received: by outflank-mailman (input) for mailman id 225245;
 Fri, 12 Nov 2021 13:42:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlWp0-0000qg-DT
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 13:42:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c92f7d0-43be-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 14:42:23 +0100 (CET)
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
X-Inumbo-ID: 5c92f7d0-43be-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636724543;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eZKhjLwJkuh0qvDZ4NicqjzuNzNEktNy1WoaRJC4Bvw=;
  b=U3NePRBOFte5bwmuVwbXXPTbfZAsqmSBjAGy2y0eDOXS3bzcsFNXMeMX
   uLBOi356QzWXv3otb8sNECOihfW6Xjsd9eFOhkTpiVsrECUgNLMSB5Hm+
   HCnfT2oHOcXGIpMDjMNMtFCYeHae5dCbtyW6fNGS1MAKWtDUahKYxd1oD
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Vgv/JxTyg6ABL1VNe0/1+zxqrCWK1vbDo/8lVPVpZTJZN2apbLMByXP79Frzf0T3+mU6ZST5x6
 jO0XtQQnLmMkFUGndGOtLbg+pHCrTiwgsMMCcuJHW+A1RZlJiEV4wQ5I5OqNSzHcU09L6JOexp
 hX7mStJ68QmAWKmcc9b9X4vhwj0+ok2Wd5Dhj9iUMenEA7W3q6WK0UfoINl/eysCmY+ZLtUrCf
 O6fHKzGeliNSynKvis9jSGNJexkAlngdb11igFQQZBik3lyYOGNad1d7G6NXZttKd+naLYWi5H
 9lgZi13hN+ozEVcg2McluQC3
X-SBRS: 5.1
X-MesageID: 57683304
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:poE3A6venrwFZP8Mg11fR0UXaufnVLZZMUV32f8akzHdYApBsoF/q
 tZmKTuFOazYMWX3c4pxPIyy/UIPvp/TyN5nSVRurC8wES4S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2ILhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npltbu9ST8zOoT1hsMGUkh1LCU5MadD5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258QTa2FP
 5ZxhTxHSzbiRDYVC30rFa1hze6rpmfDQj5WpwfAzUYwyzeKl1EguFT3C/LWd8KLQ4NJn0+ej
 mPA42n9RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+lyo3Z4z6DAkE9UBlaaY0Li8txSTYvy
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNnxorqp5
 iFsdy2iAAYmV8zleMulGrVlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 hGO51kKv84OZhNGiJObharrVqzGKoC6RbzYug38NIISMvCdiifblM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2Av6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:4RGFca60ERKCI8O+mgPXwVOBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbr3gZxAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nCdkTN9VLXPOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA8ciYhV9MLOA4we7rGNoXze2O/DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57683304"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSJWYYhUQ0NhL7G/wSB7P+HawXZaajUoZuzKrb4BtG8HWXi3prxmhkFCAy1kWZlJGJG1v2IwLJkyz3GwvrEn8PNJM1i8EVnG9JAOBprq3U1icX3dcd4Fok+SRF9u1nDwOXXh7MIaFF6DQVRC696HY7QhsFhNu0W2Agjca1ivKe9vvuraTmQgNlr6wx8egYMaWOPL24JGz7BMoWOgvqrsEWgSj4HgPb6TcjZjtAgMEIaiim4EKC9tM0A/6bq2CFLZAv1xQZH+8OY2RFkfMtZtZlQULzpyi3PHnJPK52wJD+Clhzw5rsI4ebIg6RjkVR+FvjmettU+/SIIuBnnP1uMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZKhjLwJkuh0qvDZ4NicqjzuNzNEktNy1WoaRJC4Bvw=;
 b=jnfl5lJJQDFC910TI3PJrxhhN5hxJAZu+zRyNdkCpYK4+iVeozV4vJxJqi++vSdax37JgXFzkhhVWO0vRaJHpY2VNWdxedomOpNjhHEdh6oCTjoasWPvnBHkCFqXUwDmJXgOosb38LSX+kLK7W2fXBOIra5sUN+lJQEovzYWmAY0wC5nUdG/+LzLRxcAy8xTmNa/sbn6kxXwDPgi88qGyhtv9Q1kEkiP0TSV2qjwAqFlpt+GftQuPKyqqCX9E4WRBvf2lE/0jczhS+v1gKFywymxnBpWoZeDJ8roZzVL00B1Z8dv/xu+EhXj24UNIVwoZOC+m2IiV/iw1AOhjcTulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZKhjLwJkuh0qvDZ4NicqjzuNzNEktNy1WoaRJC4Bvw=;
 b=AIV5pLGVb0/D/fao5e96oekBONC+jESFHBl6Ph83zhNizqFAB4M8exzAlF1vvKZH9hDfUDAQapeT4/2vuHDV9PqObdtDHCenmrGcgb7blT9fOnX0YamOC6/ubQRT03Q0SvEBqd7SvDHILEJlOpTGf8w133rW/qE0hurXh9wJ+sM=
Date: Fri, 12 Nov 2021 14:42:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Message-ID: <YY5vMYpmqVJhqyL1@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
X-ClientProxiedBy: MR2P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f5b9680-3858-48d3-ea2b-08d9a5e23cf6
X-MS-TrafficTypeDiagnostic: DM5PR03MB2843:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2843243EF0520884224BE91A8F959@DM5PR03MB2843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8j9zcnzvWIjx/39lv9IhsiAwSiPUHLZGh9ZE8n+G2/Z9fTeYesh6XKThXzuci8HmicnP4dX8GPXkPN7Iz0xcb4CSr9HfeSYt7+gwPOolDSvSSCgmqUZDRyZlonuH5GS0oCirZ7ucms3k6XGUnPTQULhQ56lbXwC/wcbfXSmLtc2+vbFOljbcYQqwR+ywvDXwC0V6Dm+zVc2x/J2tnToVGX7sroK90VXBbGASy9bs24vab/cQhP/SgAvvgUpT3ouZHyNMhhtEOg8YyIJlTb3xn6NQuh5/5fc67rdG+iExn4xG9KQOvOgvSIeajP7p+JMz7fAL70QlT/WMpBGemrDAcarmrhN4eh22ybx+uIVeq2ld5sseHkHr46BrDpv1xRb0wjrexqNK26A/bfGnacrlfv2HdCt1VZd/y5IFsEi3xPXGd13dgeg8AvaTMT/cFwAS4DYzoeZrQLkRKtqNaxC6tDI1HO5/8FbjTKbL15Izrarl0+4nPt+Zz5lC4BSUlq47WNBY2HSQSWxl4fP1C3moQzVCoi9dmg31pQa01sNaCZeRLxmiKgM6tAz65foQyfq6WGn37H8uUSq7iDLj5HEsFOx+UPGN2b5xCarYRlzQfz7ClBQAQd8ecvlzRHNkdcBb5NHTPdcASySk43kTozBUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(6916009)(83380400001)(26005)(9686003)(66946007)(4326008)(186003)(8676002)(82960400001)(4744005)(6666004)(5660300002)(86362001)(38100700002)(6496006)(66556008)(54906003)(66476007)(508600001)(6486002)(8936002)(85182001)(2906002)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RDU0Q5WjFwUHRKM0tjdUt0UmM0VWxBbldveUdvc2Y0K2JrdXNkcWhrb0dG?=
 =?utf-8?B?MnZhT01JQXd1aURjbHAyeDdQQXQyTGdFUUdEUTVYNlZUdUJwOGVTbGpmSWhI?=
 =?utf-8?B?ODh4ZFJLM0w2ZDBnWTBJOW1yTzlJa3ExZDN2L3hJNWNERHBnUTVDemQzTXJK?=
 =?utf-8?B?ZjBIV2hVQmRPcWl3a1F0V3pMZWpnSmdCdVlzVk83SEZzbkRXMEdiWGRtTVNY?=
 =?utf-8?B?SUErSzdneVpIQkJzWWpKRThzRThEdHdDSzc4V3A3MXZoMEwyVHBOUGJSNkt1?=
 =?utf-8?B?aDRZcDMwSXNabGRHaXEweGkyeTVENFVaVXcrVUg5K1BXYlYzVStIWkhYZmkv?=
 =?utf-8?B?aXd2UHBScUN1WmZqNkQ5RWYzeERNeE5ldmsvdFFIbk5HRzdxSEVxWEhNUWlu?=
 =?utf-8?B?eHRQNlJ6dFNFQlZmMjhFd3JYTGlpYmw1aVp0emRRcU1FK3g1RGlZejBsUzJS?=
 =?utf-8?B?YkpTN0R6UmtySFI2WEIycFhSWWtCQUVsYkNMYnU5cC8yWGpUL2g1NmRiM1Zh?=
 =?utf-8?B?OGxXK0pMZFF2NURvaWtnYmZIbndnSFM4d29FSHJjbjY5TjJYRmJHa3V3SzZ0?=
 =?utf-8?B?eTRYaDJ1blBGZWNlclpSMTdLTXdXYit4VGhyaHlxd3dhZmhlcnc4UHdmZWZt?=
 =?utf-8?B?dXRzR2NCUTg4M2FRaFlGODRwaVAvVy93WFpOSGFCR2EycEV6TUJ0OStKejFO?=
 =?utf-8?B?eW9HUWRGWmM5SEFzMG5MZ1UrNmRsTmJ3cStMSTl3NlRwWkF2cVhFMDkrcjdW?=
 =?utf-8?B?dFlaZlN1QzVwK1J2bUovMzlnUmVGZ0VIQ1B2YiszSmR0dkU5UEx5WXpEb0Nu?=
 =?utf-8?B?Zy9aSUtTSngxMUJ3NEhpNUxXMHVHRjZDYXJLaDFDZVJCajYyeE1rOUNNMTQr?=
 =?utf-8?B?S1IxbWFMZ1hzVjRRbjhMeEFQMzB2dVJpcVZiS2Nqek5KVnhNZjFVTmpNL1Vw?=
 =?utf-8?B?NHZER0N6OVNlYXNtdmRxbFA0LzJkTDZLZnBRSExRTXBPZnM4VHM1TmFSMkhM?=
 =?utf-8?B?c3ZmWlFrMWpKMXp0UFNEUDhqNjdnbTRIRlRIUWtNaDZ4ektCK1JMbUNKbzFT?=
 =?utf-8?B?QVZ6RmVYTEZsQUNoV3U0WlcxcE81R3RyaWg0Rm5jR2pjMU9CeXhRNkNwQThC?=
 =?utf-8?B?dkozWkZkaXdBMGdtS1VrUE1pQTZaMG9aZ0hjWnJqaU1OMHRkdHJYWjFWTEx5?=
 =?utf-8?B?ZXg2MWhqL0JPUUk2Vjd5Y3VmRlhDT3Vydk9keHI5ZGlYR0FEOUZabWZoYmJj?=
 =?utf-8?B?Vk56MFFDQkZKN0wzaUppclFidXhDdStuTFJiZTUrb3RkMkZJT0JuSmNiWVN0?=
 =?utf-8?B?Z3YrZzVMNDlXdzRVY1hLVWJ1ZHJLd2syaTc0U21UdW9uWjVKU2ZpOGNrMjRh?=
 =?utf-8?B?Ly9oV0xTMW0zYW0rU1FtekpaRUdORVNSOXM0WHdieitNclA5eWRBNm04bDJW?=
 =?utf-8?B?MVJhejdIdjRlSTFnSkgvYm9Qem1Jay9aQVRzdlhiQ2ZHdW9NeCtlc0VCeUd0?=
 =?utf-8?B?ZEtSdE1YMHl3cGN0b0ZUMGVLdlhpRVdwb3Fzejh0MEdEaSttMElKbncwbTBl?=
 =?utf-8?B?cTRQWFBWaThCMjVQRk8wRU1VdTJkcjlwbGhQeWJRbWhPL1J0OUp4QjZOTHNH?=
 =?utf-8?B?VTVoSi80U1k5NWdLWldjVE5ZTWFzQlRrcFN3MytDT0lBNHRndlB4TG9zNmZj?=
 =?utf-8?B?U3VFNXFFdDFWRlB2eWNJVUJVYWxiWjJmVGo0bUcvKzVnaWdqV1BWMkViMmh6?=
 =?utf-8?B?UDBhek9iZHhSa1ErM1J6cGU1Wnd6RmMyZzY3TUx4Y2JKUllhTWRTQU9IdTFt?=
 =?utf-8?B?MEJicWNhdERqMWgxM1hrTE9TREtKc0htSkN4ZEFqeU8vSzlrZm9hYTdVZ0RU?=
 =?utf-8?B?UFQ3dS9rUXVxZVRjVjRnbUJFRXdLVzNVL2dPU3BCS0c0cy8zSnZCS25EY091?=
 =?utf-8?B?aUlLZlE3QmRRc3VJNWVSOXhyWWx5bjdGYVYxSUNMamZYa3NCWGloR1JGWmx6?=
 =?utf-8?B?amZwTUhUQ0tTdS9qeTMyS09TVlNJL045VkhpT0wvZ2VZNFppQlhlNHZkVDJQ?=
 =?utf-8?B?NVU0N1FWTHI3aGZuMlVtbGo0SlpMSnl4N3lqYXhZb0F0UHJpYStYdGNUTHJI?=
 =?utf-8?B?OWdpUnRzUElObUZiOFp6SEFQMG1aSEMrL0RZK1U5UVBVY3FyQm0xN1RxeDJs?=
 =?utf-8?Q?bG0O8+fwb6XsumMArfxNAAE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5b9680-3858-48d3-ea2b-08d9a5e23cf6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 13:42:15.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C289cJg4dKx5c/OjEkTW4IWaq8fVC1CP10EuJ7YNUCKduyNbkZZ8FxMQtb1gGY7bd309D2/UZN2kJvozUHuwfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2843
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 10:48:43AM +0100, Jan Beulich wrote:
> While domain_context_mapping() invokes domain_context_unmap() in a sub-
> case of handling DEV_TYPE_PCI when encountering an error, thus avoiding
> a leak, individual calls to domain_context_mapping_one() aren't
> similarly covered. Such a leak might persist until domain destruction.
> Leverage that these cases can be recognized by pdev being non-NULL.

Would it help to place the domid cleanup in domain_context_unmap_one,
as that would then cover calls from domain_context_unmap and the
failure path in domain_context_mapping_one.

Thanks, Roger.

