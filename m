Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9721530C9B
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335781.559976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5Rr-0006MQ-Q1; Mon, 23 May 2022 10:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335781.559976; Mon, 23 May 2022 10:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5Rr-0006Jf-ME; Mon, 23 May 2022 10:38:03 +0000
Received: by outflank-mailman (input) for mailman id 335781;
 Mon, 23 May 2022 10:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt5Rp-0006JZ-Ld
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:38:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 699be87c-da84-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 12:37:59 +0200 (CEST)
Received: from mail-mw2nam08lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 06:37:52 -0400
Received: from SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9)
 by DM6PR03MB4457.namprd03.prod.outlook.com (2603:10b6:5:10c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 10:37:49 +0000
Received: from SA0PR03MB5610.namprd03.prod.outlook.com
 ([fe80::61c5:9817:f069:7366]) by SA0PR03MB5610.namprd03.prod.outlook.com
 ([fe80::61c5:9817:f069:7366%3]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 10:37:49 +0000
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
X-Inumbo-ID: 699be87c-da84-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653302279;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=M/poI189oI/8Wbtz8x/tDJDFP/o0qwNXuYj9zgEveW4=;
  b=YxuQKTnZti+YdwTQse98/X3UyzXvoWhjPe0w0S9taXm8AWRy8A25/noH
   7iQoooVoWr3JyHKN5rRF4JCnL622S0pDGcttLqln0k8FcKSAOee7+j8ey
   y4rYvfEh1L7hdBemgT4hR62jrHbAZFVzOMvi8ULXK1Y1ZPHOhjSC6jNgO
   M=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 71301426
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YXX8Jqh6ySHcXAogTZZHjVgCX161FhEKZh0ujC45NGQN5FlHY01je
 htvDTqCOfyONGfwKNxxb4S39R4O6pPQxtUwQAQ4+383FXsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnW4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR4MN6fThf1CaRJ/LWZabJ8Z/JzAH2fq5KR/z2WeG5ft69NHKRlqeKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuoQehWht7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvO/fNruTa7IApZwrvGE/PuI/OwVZt5gmiYj
 0fD9jjcK0RPXDCY4X/fmp62vcfOnyrwW5kVEpWz9v9jml7VyXYeBRsbU1f9puO2zFO9M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJS1e2W4q/d4gLcA3deSDdEMIwirJVvGmFs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poad9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:PtMSaKztg8tDsmDWUZpiKrPxsOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vr2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUpZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEK86JX/r1cop46zuNCd3B13Z
 W6Dk1WrsA+ciY3V9MIOA5Te7rBNoTyKSi8QF66EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71301426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXJqfJ+e/v6EFrP9iCYYnabWFatyJRaHIlp6y/KeaMc8CIVbqZfYHdC1daRFNDYUfka6O1JtCMkvdTPhEqjJKrTK47gdJx7jajT5w1aNSzvl8bHOGNJkCs1VItZ4Q6zzsWevWBP0BKWJqJzwpZ/6y46h+1HdZRi31uCdJivr5UopJg/aHKQ6/gMtlHabwVIIfE25ykniK5Q6ZEFex+AsxjAz7G/GsfoQ83dDkom2NqLsB+Ud/Ppi27X3ai0ArnhgFkufmRGDvel0L3YtMRjGEavuwmm4sT40pu/CtLSak6Mv0OywevxzsNwZw0ZbKXxcTU2E8v9TukMqNLidd5vwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvPiP3XIPhYMazso9R/CXHqNFQUch3dpHlo/Sg+grhY=;
 b=Ig0nRZzeIS8Kw1FBq6lhGD/njJ+nyRIjRrVPB0bRIUcYvf62ZluRwQBqmyZUvSGBPTU1L0i0ztwOOgR9k8K8Cajv7it7gpDzytUZr1bzKbQxLHNMExWRAnQstWb0boCV0244BzQtMWRmpLYthGMZng+7LK5VPEXAaVbqgQIryg53Ab0itet2FewV0QCws8MR1Ex7/9HHtS4O3P44P1nFdR/3gPqsuPHIUIY7u9zD1yW/kTIV9dCMgRHEWpPQXs0fIsyMNw8Kf0owgFJGAFcKK8ycpx2w50n6fWbrccVO8yScm1Pd6OtZtQaMiVFFEB4eVjctNWm6amGwVKcnrQKc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvPiP3XIPhYMazso9R/CXHqNFQUch3dpHlo/Sg+grhY=;
 b=U+vwJC47N/Z1gigZsesk11MxGnXyDfHvdMNaOnD/Dffr2hhAVZNypCHUYC/5r/+MwjjaAZDGeHEySKyaQpJjnQ0MV7TIl071qb5wUJkBOaC5IuRKdymCNTgBq+Tre8OgEnGBlGai1sLYY4iKbmx6RCXH94ZLWMrPVzmCX22e7qE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 12:37:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH v2] ts-xen-build-prep: Install newer NASM
 version, to build OVMF
Message-ID: <Yotj+JI6vIRmj5fx@Air-de-Roger>
References: <20220519105525.211344-1-anthony.perard@citrix.com>
 <25223.51335.932439.379210@chiark.greenend.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25223.51335.932439.379210@chiark.greenend.org.uk>
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81d16bb0-7941-40cf-d834-08da3ca84859
X-MS-TrafficTypeDiagnostic: DM6PR03MB4457:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB4457E4451C143DF878BDB37B8FD49@DM6PR03MB4457.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DSdkE+PXhPYY/atWjuEzPh3ck+2k9DoCxXrKpLggUZiIW611BPODuOcO7KBdPZTIBO1B4E286iIg8114dqpo0HApsXpATWungnuQ/imcgf7kPV05yXwQfeC33xOLsWVVpbELL6B6yUYFwACPuJ0I2KIM6ynwnoZaCuOB3xaFyRKkkXAKEfPU4ln57MaCaI7cJsaVY/qA3e+UQzrnOO+DgQkV6g22QasSJMsD3Nxdw7LYfeL47HNo7BLwXY7L84xTQxMVLfiGyQ891eJq0LHqC4cTVO4Lg2Wpi0Oomukdq/OrWK3GwdOJjtsKXHAuJUJRh5UudjdMn4B4etkIbKxSR1UKpRiCbYlLrxvpsrLeBBNFPHqM9LBKnYlQvDj4vQnFUIl6pupqYSiRatEMhDK5Ai8onSa2136upPZGGjsfl4w/t+PZRxtIOWmU/EFlwTWe1936mQDxvF4LRTTzzbB6L5JODFJ/RaGH2U03W3qHq7OEykLJR1RkBH20T/jxpuxXPf6xB3uImTV1J4l8WWHwyZ0RuT0fmhf+fKGS+nh/LtcdtrycGwpjet3i5PSm5QNFoXeAE8WiUc8VA0ceQwXGkMp/8lbsxtkBx92Se/tzMapbsA5opZf1HllvHnrAbWRI6JAU5q8v4LcsiOQAly4C8fYpYuKPlbhOvId41f/l1224un9B+aKxl2nkiQK7SvE/WDL5b3fTnH7cuxMqi6SyH5Pl7Cxl4k1iFFYNJN57E9L1oo9F/z9tq5mu66gmU7X88Yb75KlxRh3d+e/sAtMkAZi0xg9hWgktZgpyvCKfFds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(66556008)(4326008)(66946007)(83380400001)(66476007)(966005)(5660300002)(508600001)(8936002)(8676002)(6486002)(6666004)(9686003)(6512007)(85182001)(26005)(86362001)(38100700002)(6506007)(33716001)(2906002)(6916009)(4744005)(82960400001)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3dPVFZ3NDM3NnVnSzRPVDQ1YzBnN3krYkR4cUpORktOeWdzb0dZTlF2RlNJ?=
 =?utf-8?B?YmF1QVNDWWVWV1l1dFlaVVhsWk9wQkdlZTFvNFdadkZ0Z2FsWklpYnp0cWpT?=
 =?utf-8?B?UTNnM2N5S3dUK09tUWZwMHRhMHNXZHpuMWFyYnlDVWFMa3BvSVpzaVVhQnVk?=
 =?utf-8?B?OWJ6T3AyeitRVTlDQUZCdGp0Y1RmMDNMbk83R2doSjNTYlhFVk1PcTJib08w?=
 =?utf-8?B?VHRuRGQvLy9tWGZGbk9NMitoSGpmU3lrUS9OQ3k3VkgzaTh0cUM4cllCL3V4?=
 =?utf-8?B?Z2tKOXRFYmxyZzdkcFJVSFNIL2F0clRZT1laRDN0ZmpqR1ZJaFp6VDJEekty?=
 =?utf-8?B?NWxZUXRRVVJHS1NTa241K09zUEpaY015SzN3d0dhd2xveTRwM0pBN0pBakVY?=
 =?utf-8?B?NjNCT3JCTVJGMGRCVVBLMk5mZGQ5N2w2dktNbUJrZEpIRCtwaXp2UWUwSFBx?=
 =?utf-8?B?S3BMVnVLVHVXanF4NXR0ZUJuZmdmRHJ4QjJlWERLSmMwVXd1UzJuOGIzd3Z6?=
 =?utf-8?B?SVA0RUtyQ1VtSDZEUC83UmNyY3g2S3IzRWFOWWJWTlRwSnRtSzdNd3JqRUJh?=
 =?utf-8?B?Y1ZKcXp4TjF3K3YvdXZsVis0Z3BXMnVLV1dlWFlhaCtyS0JpMEp5WXhDdm11?=
 =?utf-8?B?STJwNXRMNDB1TTF5N29PakJnY2t5ZFI2dXBFc3lsNDFZaUV6QTh5RTRwYjhj?=
 =?utf-8?B?Y0tZeFBFTURZK0hqUEI3S3Bqekdxczd4UzBGemRFbnNiVTBJTlFOajFxQjBo?=
 =?utf-8?B?NUszUW9xY1BGUVRUYXR5VW8vcmt4NmpjZ0ZzS3V1R0tHWTRuc1ZoRFp3VW1G?=
 =?utf-8?B?VzJWd0ZXRmZlN3hubHBhSzY5VElQRGxPUnBSd1RlZkhvVHlFQ1J6RDRMWTBC?=
 =?utf-8?B?RnhCa3BZQWFjNEM2ZlM3azhDVTJ5WHNpU3hKU1N3N0hiZTcxS0Nmd1RiMGJ6?=
 =?utf-8?B?c2RSemJTVWZNbU1YSGlid1phNUlYOFR5UGR3cWtGZUI4MkFCQUdTYmp6d2Z4?=
 =?utf-8?B?L0VETE1IY3lkNHd1UzU2dXlhRlhHQ3N2Y0dDTHFsM2ZUMjJ5UCt0bkRJYjYz?=
 =?utf-8?B?TDQwdDA5RlAzMmJGR3dVTmRTemNIV2Ztc0xIWlp1WXJZYTAwYjUrb1lFTmxV?=
 =?utf-8?B?RjZLVm9hWWhHNkJNcDJCTktOdUlPMkRkTkpHUWJ4eWQvd1ZaLzdyaEdUcTNo?=
 =?utf-8?B?V3NrNVZnbGxXdlowb1dEOGxDeXg0TCtmNnV1Qy9rRWh5cnpnOElJb3hKTThm?=
 =?utf-8?B?c1JKcGNzbHBGdEw0NlMzVFk5b2JQK1B4Tm9JOGoxVHpzUGhQUW4wTkgrRk5s?=
 =?utf-8?B?Tzl4L09MTlg5SzlDWC81Wnl1QzJlUHN5R28wRkQ4N01yTzRPWlp4Ym9CRWM3?=
 =?utf-8?B?ZTFqZEozdklnSWNLV3dwS3F1OC9aYTZKQkZEVUlVTnduYnkrWDFnd0YxT1k3?=
 =?utf-8?B?Q3ovU3lVcFdUaWYyeDM4NXBuNHFHdXd0ZHFwdk5WeHc0Z3RKSzlqY050WTZ6?=
 =?utf-8?B?VStCazE2RlpQUWtRRWNXMk5MT3VsTGwzVW8zbThYNTJsRlZMM1BMcGIvOUUz?=
 =?utf-8?B?Y0djL2QvM2h5MThYNGtnTTI3MUxXUjZZMDdNbGQ2TlFaN3pUMHpxSDVheStn?=
 =?utf-8?B?dWFIblZ3LzBYb3JHZ0dXZTNnNVJIZ21UZHpHa1lTOWJhNkg1WnY3M3BVNXhB?=
 =?utf-8?B?TGdwZkVNR3k5UDE1UXFPalJXZVRhOWdZYjhRV1F5Y3FUa2FYc2ZWb2N2SXJh?=
 =?utf-8?B?QnNlSHpiMjVtUmg4WXkvN1dqTFFvQ1VkY3hGTEd6MnVCTW9hY2gzcVFnNlFz?=
 =?utf-8?B?TzRWOWlPRVZ5S2ZmTkNmL043N1llUSs1eldKdE01YnpNMHhYNDg0dzF2SVFm?=
 =?utf-8?B?dGd0cnNOc1FXZnVQM3lLUStGVU0vMk1HZlg1QlFCZ3JRN285OXpCVWJsNDBM?=
 =?utf-8?B?YnVnMDdIZGF4clY2M0dicU1ncU5waFZuUzRXeDYzaFpqL1hUNzJteWpmLzJy?=
 =?utf-8?B?ODJOOUpkRll6NzhqdFFIRzc5dTVQTzNaVFg4OGZndk40SElqZzJlSzNoWlNP?=
 =?utf-8?B?Nm9SSDNDYjhTWWxYNWp0SDI2K0dXcmw1MmptZGh4ak9BVmxoZkFIaWR2dzI4?=
 =?utf-8?B?OWdJZmNKcXlEZWhWOVF0VHpnR1ZXZStOU21LSW83WEh2N0wzaTFLQXJnaXk5?=
 =?utf-8?B?TFlBOEZmeFRpUkJzVFl1NmhBT1poSytzbFcwSWZUYlMwNmg0c1JJY3d6MktQ?=
 =?utf-8?B?SW02dDVpRk95ZERxdCtCd0pUdGlqWjFnQk9vZlZWSWhxNmhvTVo3NW5sV0ZL?=
 =?utf-8?B?bG01c2NtelIzRmNrT21QVTRZaTNIbW5RWlBaRmg1OEsyMmdkMExSd3hSU3Nn?=
 =?utf-8?Q?drr5LupH85naLvrk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d16bb0-7941-40cf-d834-08da3ca84859
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 10:37:49.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGTjle4XwKNG2JTZladf7kA61vLQc2pTrPWVeKPBrg/vP6AQ50mSCjtmAffIatmTUd+lFRaecEDgc8iQYP3/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4457

On Fri, May 20, 2022 at 05:57:43PM +0100, Ian Jackson wrote:
> Anthony PERARD writes ("[OSSTEST PATCH v2] ts-xen-build-prep: Install newer NASM version, to build OVMF"):
> > Recent versions of OVMF now need a version of NASM that is newer
> > than the one available on Debian oldstable/buster. They want to use
> > NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
> > need to use a newer version started with d3febfd9ade3 ("MdePkg:
> > Replace Opcode with the corresponding instructions.").
> > 
> > There is no backport package available but the nasm package from
> > Debian Bullseye can easily be installed on Buster as it has few
> > dependencies and are already satisfied.
> > 
> > [1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
> >     ("BaseTools: Upgrade the version of NASM tool")
> 
> LGTM assuming Roger is also happy...
> 
> Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Sure, I'm gonna push this now then.

Thanks both, Roger.

