Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E36FDB86
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532740.829033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgy4-0007dh-Tq; Wed, 10 May 2023 10:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532740.829033; Wed, 10 May 2023 10:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgy4-0007bs-PM; Wed, 10 May 2023 10:22:44 +0000
Received: by outflank-mailman (input) for mailman id 532740;
 Wed, 10 May 2023 10:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27j=A7=citrix.com=prvs=487c252bd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwgy2-0007bm-PV
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:22:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970a4918-ef1c-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 12:22:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 06:22:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO3PR03MB6805.namprd03.prod.outlook.com (2603:10b6:303:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 10:22:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 10:22:10 +0000
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
X-Inumbo-ID: 970a4918-ef1c-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683714160;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ciQGgL+VslaFbguJ8+J97XijTWMSO8CxLC0B3anWwMA=;
  b=Oink0Bu8MdwC4/VZI1WOxCIekIXKfE8uUuvTNw8WXou/Ni6bmC/RFK82
   LMBdoNSr4uJTHjIGUq9xW/EmW3bYKfVqN+rgFra2RcSophRcBCuT1Ry+y
   mzgo9tn4Boj626+Icp/gKbD9ews10sLIeiqUrLnNXGkcm8kKc8c0CB8k7
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 107266014
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fmb6CaKvd9pZi82jFE+R+ZQlxSXFcZb7ZxGr2PjKsXjdYENS1TQCn
 2AZD2mAOP6PZmPyKYtwaoXi90kH6pPTmII2HQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rMUJR9
 8IzBwofMBuont2665C7aMpj05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02bWRw3uiBOr+EpWq7OwtkgSdzVYIARI0W0KrmP+Z1GyXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OkXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94bRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:FsKRIqmessepF/3RfJ1a2wdhw5bpDfNLiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42G7j5vZZmxm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUapPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7TvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amCazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGQgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wgK4Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWnKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGCfIyEZ0Wv9ihi3ek6hlWlL4CbdBFrCWpe3PdIms9vQvEyAJ
 2ISdZr6/yKFxqaJW8G5Xy4Z3BoEwhvbCQkgKdEZ7uwmLO7FmTLjJ2tTB+BHsuaLR8UHkXCP1
 AkYB/fYO1902HDYA6LvPGWYQKgRnDC
X-Talos-CUID: =?us-ascii?q?9a23=3AMHhEhWnuwZn0P+M6zSpBDZ9IER3XOSHt72jSHWS?=
 =?us-ascii?q?XM3Q3Q5aMdlO72qNGsMU7zg=3D=3D?=
X-Talos-MUID: 9a23:7wzH7gT9vZS/FRFWRXT+niMlJp5m6J61AU8vn4wWgs+kaw5ZbmI=
X-IronPort-AV: E=Sophos;i="5.99,264,1677560400"; 
   d="scan'208";a="107266014"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzEBEi+Bev68dXdXS3AWdaz80g218r5IYakOqRo4m/m7bCRoZgUTC9tZnJ6z/nHj7NK8SKHWeDL5hJ4mS2rjG8Yr1owBZ/COMo2lyjTW6VN39iJU2Gsed4a33gzER6/ifYkgzuGxi7wiejg3Vc54vj//fcOWQQ1ho9T0aKdJLVFpx5smbAC+ThelBpn/88pDyZ8yUcOH6ipoKtw2YWyox8CYF/+w4Zs0SChu/J5vnQ6v+g9SJT2T8V4CABwrrllbeJTMn47l7+PICZeVUaM02FYmcVx6b1qCmLK7JRgq/NtU3R0WQswvWjSic8/dv42i9d4AjcZpr0LwkPBCncNf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkrqdmGVo5BkSV+xnHK6dPnnodz32UyrgXpBHX3ali0=;
 b=f4qenfT3LKI0haWzad2VFNqnGaMGrGDdOxj+LsQSPadsDDARLmTDp1sDDe49tK5qTNgJBDfTs4je1ZoOkk5DAPm0OssUsE8fn+cDxtl1I+cN0/ZiX9HAdxOU7Kh2usOa8oO7xr1p/kVbROxSMPuD3um8Y4dZxzp1q3cIruRH6k7H3g1LyHCFnLXnZrul4T4bGLgwZeUr/lbWTg+1aDTnSZDLYduRYT35kzkXSfQL8BX91n200UAMOb96M9iBb0QTjA5Alr6vGp5FkjL/1hQmgSF+6MW2iagzwJ2E89yxx53sq0a1Aw8tGsnWZU61K4WLOHcBU17meDq5D+d5fBbwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkrqdmGVo5BkSV+xnHK6dPnnodz32UyrgXpBHX3ali0=;
 b=aaOYCAp/JJ9SW03NB286KhY4xYDJJmhRjcCkcw9FTwv0IMjItPoJk/q/OgBU/W2jnSdDY8tX5Kfi0QiWhUFQl/151dZqpP7w5bbR23V5mje9boNpvYU5Xt9kbgWZ11BWG/7p3wo49NnLTvoJCmqnCGEjQM8/f4rRdBgrvpNhhdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 May 2023 12:22:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Message-ID: <ZFtwSjuZaz05DIY0@Air-de-Roger>
References: <20230509104146.61178-1-roger.pau@citrix.com>
 <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
 <ZFtVYEVsELGfZxik@Air-de-Roger>
 <5bde1d79-03ef-6f8b-4b28-8d7e6867ba18@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bde1d79-03ef-6f8b-4b28-8d7e6867ba18@suse.com>
X-ClientProxiedBy: LO2P265CA0385.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO3PR03MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3f639e-c39b-4378-1947-08db5140698c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	snOIvpL75OvmB8LT5cKYjufJV2BAzhUwybt1mbTGIQMXoyoRDcmC4ahJSDkzxnKl91Ybhqvulqs3VpofYbuY+aGZnIzr9QNN6eXagoyZ79rMwyBPOCbDGwRek0Y6J55FcrcqvUkZe6NMkLTQ+qfPXFQHueKLCKc0PTQAh9c6O1W/LnTZndV/Qlk+ZKhurTjJzr/MMLCg5WN9wpsTIsZiO4iyNFoJ6qY0xVo1slPO/7CYe0AgXvoPZa5qzIaab1mPZbXRRpm7KkHR8jk0t12SIkVkLwuiDNr5A+2uXRTN2OHbHoLsnO2V3J05w4HK1gCv1mRu8qoVmqiY+2dEiwMkPI3DHh37tGWgNMXnIRidZchW1UAYIIr8hE3wgMAzWTlj6pmeetQoAup9U5AMOCG+6hbCIzBfwA3lsds4xadv55AcCJgkm3SPgFBXg57vNICi34cmVBB5cD2ioUKl/6fUmkmCPZro/KyEHtvB/S1UMnyRgsfMDM30Y6A5a12sD+i5JQZPWsEF30Co4wfiI+CrKn5eitYOb4StcmU7DanmmVN+U0wN1KzPGFFNd0EtN1nT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(66899021)(38100700002)(8676002)(66946007)(8936002)(5660300002)(85182001)(41300700001)(6916009)(82960400001)(66556008)(316002)(2906002)(86362001)(66476007)(83380400001)(186003)(9686003)(33716001)(26005)(6512007)(6506007)(53546011)(478600001)(6486002)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkxmVmJqWGlkTUdxdnhvYTkwUnNRYWFpZThrdE5TNG5CM016V1ppcnUxNDN0?=
 =?utf-8?B?SzZUQXdGUFRrR2pWR3h1NndVYUZ5Q1RSQXBncTBsWHBaeC9DVzc4dnVrVkxJ?=
 =?utf-8?B?K1NWamx3NFRBNTBlUjN2ZVQya2JtQS81clI5QzZxbldYS2lYNXpCdnE1Tnpo?=
 =?utf-8?B?L3VYZzlsQWRrbVNmR2VhdlpOelFlbDA2dnQ4RGljNTFsYzZUV3NTKzB6Zloy?=
 =?utf-8?B?WElEZVFSMTlvdG1vbEhDalVqUnRqQisvT0dzcDVKNCtsUW1XbzRTNStnRytm?=
 =?utf-8?B?dGJrZTNvS3krUHNlSVBDWUxEUERQMVR0TlNoRFNLRlc0cTlGVFRGRngrT3ly?=
 =?utf-8?B?ZEI0akVhTDNZYUF0ZFJRVHg1OHE2cEFyck5wZVFlMFRDbnV0Tjd3RGFKdU5Y?=
 =?utf-8?B?SHRhTkZYL3BhWUpSbnlEQTM1VnJseUN6UmNRZzZpdjJLTTVTVUcrdmFDUSti?=
 =?utf-8?B?RDVKdUVMcm8wamhzZkMzS1g5TXR3OHpZV2FjcEp4ZXkrNldJYzJXZUFlTjlN?=
 =?utf-8?B?Rjl6TVZCdFpNMHRlMkN2bjZxVDMwZUExekxXZHdWZjFGMTJZamdhSzdPSFB5?=
 =?utf-8?B?b2lCNzdwL2pOcEVhcFBYb2tUT1phMko3dERvNGxaV3lNcUR6enM2MGsvTWhK?=
 =?utf-8?B?cEZncDBNQU1VUVdYdHJqS1F3RHB3eTBzYTMvNWRDMUt1ZStEcVBoYWJwWGVk?=
 =?utf-8?B?UzJ0UDNCOVFZaFJwb0FZWGhXTk5qMzlid1pqKzlBVFF2d0dMM25tL2EwT3Jh?=
 =?utf-8?B?VkpmZDRqSzJpMXlLMlZ4VEQrNUxnSGxwTVVlSml4UTMyblhZTVVyMjJBRzJB?=
 =?utf-8?B?WXFTeTZoQ1BValY1cEtDMDdHOTVsVW1WMzFjbkpjVXpVT0R2cDdKcDM3WmNv?=
 =?utf-8?B?NW9BS21Vdks1RGFEMW9YRy85V3g1dDdXczArcll0MDBQTTJPQ0xEY253ams1?=
 =?utf-8?B?anRvR0ZvSFJlQmRZVmNiNmxsWXpQN2dqTENFOVFGSlBUajhVckN1VWVDcjBR?=
 =?utf-8?B?VFQxVVpwdGtoK3pxbE4vZWF3R3FNR2JqZE9nd1FBS255TnB6dWRhcnQ1MmpQ?=
 =?utf-8?B?b0trb0wraGZwMUZWSlNOZHBPWHFYMFpXOURFdnBmVGdIMmNoZlRNZmZ6WW9t?=
 =?utf-8?B?ak85UjJiWWxBOU9OdUw5T3FpNlBCN21TbUpkU0grYW1aclFVYjRiRi9UMWNY?=
 =?utf-8?B?a0dmOC9uOUZZTG1ybCtwNWZ4NTRWbE4wQjRDV252Tk1teG9KOGtSRnhPU1FT?=
 =?utf-8?B?SE5OSDArNGFuUWhsbDlsbTZZMnFvSFpoaGNyTHlqcEZ0a0RlZWtzc2xOaGZ0?=
 =?utf-8?B?SHZtUjNiSnFnZWw0cjB2S2ZYeHhUSUJqbmtqWjRIYjJNajZJVVpQK21YdVdR?=
 =?utf-8?B?bmNLQzFuSUFzclBnNU95VVF1S2ppVXh3Q3EzbzhKMkhybnhtakdBd1E4RFRs?=
 =?utf-8?B?YzNDNEZqV25Od3BJbitZczRiVGsrRzc0NXA1VzJONTNGM3N4ck5lWnZydTVi?=
 =?utf-8?B?Mk9DMHJGeVprQW9BU2JQUEFvSkdkYjJuZTY1TW5xckN4WjYzdW5GSXhUZFVB?=
 =?utf-8?B?N3BQWnFTMEZyc3BlOFp1T1RjdmpmK1VkSzZSd1NSNEs1SisxbmdOeGw1cGNy?=
 =?utf-8?B?cnkvRUgrRTA4dnVreU4xTTJteGxvcmNNMnV2TWYvWjViTElEdFEzLzRGMHVw?=
 =?utf-8?B?UUF5ZkRMYXNpY2xTN3JmM05pUll3M2ZOK3VqWEFUTHptZFBFL3dGejRveHo1?=
 =?utf-8?B?NHBqalBuWStGSW1sL29ZeUp6dGYwZmpranVFa1BtM0Vmdkp2VENpTUJFM0Za?=
 =?utf-8?B?dHdDcXV6TEMweEVPRzhhV1gzNFhEUURYUDZka012SE11RDhVMlZlRzVOdUFH?=
 =?utf-8?B?UityVUoyS2szam85cjc0YTd2S3ZZWnpGL2JOMFpTV09VSWhyTDlQcXl6QlNZ?=
 =?utf-8?B?M3RheEFhSFpIeWdoUUc1aGY0QVliQjUwL1lQZjBIaytIWGtTRGM0RVBCeWFw?=
 =?utf-8?B?eEUrRXpVMXZ1eHBpYkpyS2sxZkpzYTlKMm55aDhXZkZVK25HVUhBN2JZS1lh?=
 =?utf-8?B?OU1JVVBKeWRPRzNTZTdaeW1wa2VQcnpCVE56Wk80MHhMVnRwTi9EWC9wdzli?=
 =?utf-8?Q?w6T2x/8gAC+oifdo5/Jb+w30K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LbhMGZn3Gsxbd85kwZzciOqknlAKLRsclpGoGs5jVPPaDZB/Y1WNKS3FYM1nJKGZfIxZJn+OS/nsQ0DbInAsgcfYNHqLEFu6nZYfOFmSEqP1RIQZz6iWh2hSCu/M9ScUI3zoPZGhBp0a9CXNVNsabbn/qSqjpPkpbhWEJuijknzWcKVBiw8pMczrdbWua9aBggjKrUgEqh5pEOeepR33Ue4JRwzV7m8jZcI4FruRInY/l9IZb8V2XQDCrPCZgm+VRgVetbB7clX9a5zF79g+Lc1BlS3MGmVxGfH5QMNe6xQMBn/ZqxXNPNstLUBIfqXxM9nTHCXI7WnIhR+WL2m2MjiuMwYKXtFXEWHSMeqipFa2Te5g7IDp+0vg/y3DujthSOqQYLPsugpufVAVpLCp0EQPZdRCOA/lD1HS2V2Vckn9Hpvzu9Bj7f1ng8UFh0LZqhgCaCVaSWINSCH041KEnta6dWMgmpw1KCzYVbtH/7a6VxkW0D3y4t99syNmWr0JavUkxBgXc09+OQ9jBF1ZMI+kBRcDMAbseDSAQwybXPR/6yTJibV2JUdjOkuFXUMn9FY87qJ5AXTYAmt0q25Vz5bnB1kvj/H+WBNIuiS9V79tS0zcFyf52SJDCKDFDJHVCyBCZBnUnwr4w0YamQr5PnevomSjVmEDRM3IR1EcGq2TLF8ImntD+yXUQEPly4yRcyRElotP05aa++MRS5/4nLU1kqLP4OYeb45c3VPLTl+MYGJpE4T3Q5T//RGayhk9/KbaJyjmMarnxbicjuHwsF8OwBcq2bFA3A3yZzJZKZWKDwsYjUmA6lW01J28t7iDFTDhxTroi5boa5rAHpzMCA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3f639e-c39b-4378-1947-08db5140698c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:22:09.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YGjRpqNUcT0FE1v9d21AOzDES/lelA+Y6a/Q5rWYGSNoFZhP3GhYfTxqsVPcOoru2XAGlQj4lU5UK9f1k1N9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6805

On Wed, May 10, 2023 at 12:00:51PM +0200, Jan Beulich wrote:
> On 10.05.2023 10:27, Roger Pau Monné wrote:
> > On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
> >> On 09.05.2023 12:41, Roger Pau Monne wrote:
> >>> When translating an address that falls inside of a superpage in the
> >>> IOMMU page tables the fetching of the PTE physical address field
> >>> wasn't using dma_pte_addr(), which caused the returned data to be
> >>> corrupt as it would contain bits not related to the address field.
> >>
> >> I'm afraid I don't understand:
> >>
> >>> --- a/xen/drivers/passthrough/vtd/iommu.c
> >>> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >>> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
> >>>  
> >>>              if ( !alloc )
> >>>              {
> >>> -                pte_maddr = 0;
> >>>                  if ( !dma_pte_present(*pte) )
> >>> +                {
> >>> +                    pte_maddr = 0;
> >>>                      break;
> >>> +                }
> >>>  
> >>>                  /*
> >>>                   * When the leaf entry was requested, pass back the full PTE,
> >>>                   * with the address adjusted to account for the residual of
> >>>                   * the walk.
> >>>                   */
> >>> -                pte_maddr = pte->val +
> >>> +                pte_maddr +=
> >>>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
> >>>                       PAGE_MASK);
> >>
> >> With this change you're now violating what the comment says (plus what
> >> the comment ahead of the function says). And it says what it says for
> >> a reason - see intel_iommu_lookup_page(), which I think your change is
> >> breaking.
> > 
> > Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
> > the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
> > doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
> > masking to remove the bits above PADDR_BITS.
> 
> Oh, right. But that's a missing dma_pte_addr() in intel_iommu_lookup_page()
> then. (It would likely be better anyway to switch "uint64_t val" to
> "struct dma_pte pte" there, to make more visible that it's a PTE we're
> dealing with.) I indeed overlooked this aspect when doing the earlier
> change.

I guess I'm still confused, as the other return value for target == 0
(when the address is not part of a superpage) does return
dma_pte_addr(pte).  I think that needs further fixing then.

Thanks, Roger.

