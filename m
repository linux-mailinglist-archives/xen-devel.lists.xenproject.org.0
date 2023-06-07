Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B372594C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544544.850403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p4r-0002SQ-3z; Wed, 07 Jun 2023 09:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544544.850403; Wed, 07 Jun 2023 09:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p4r-0002Pr-1C; Wed, 07 Jun 2023 09:03:37 +0000
Received: by outflank-mailman (input) for mailman id 544544;
 Wed, 07 Jun 2023 09:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6p4p-0002Pj-3H
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:03:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d4c0336-0512-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:03:33 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 05:03:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7284.namprd03.prod.outlook.com (2603:10b6:806:303::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 09:03:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 09:03:29 +0000
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
X-Inumbo-ID: 2d4c0336-0512-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686128613;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JHxpHd7ywyA1TOO4ie5/qUEgsui1FR3Hpxle43ed2z4=;
  b=ZKg9DB8zfzJLSgMenszinltDV4Mt9IQ0Nsu3LJ7ELuCKZU854Ojeocjn
   gzoHtzxEfGjxEgeKmGb/mY9MdJOiixylcNANQR01lgeEFd7KLkzb4So6n
   0MPuDpTetrQcI3ykEyrL5HlUmABKOntaxxJ1bZARz8XgNn2HCIvqZl+MR
   g=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 112298142
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2mWKK61T7MV8OehnPPbD5U1wkn2cJEfYwER7XKvMYLTBsI5bpzdRy
 GNMXz+HbqyONzOmf91/bN6x/RxXv8fSztA1TAY4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHEtgz
 s43cAoxMxGNqvyZzfWrbrJWr5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13LWezXqnAur+EpWd/fh22UOwl1BLVgczaFuZgeGrqVaxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtR+FK+4iPXlFDe2x
 CqFxAAAgLEUgd8Oxr+M11nNiDKxpbDEVgcwoA7QWwqN5A5jeJSsYYDu7FHB9OtBN66QVFzHt
 38B8+Cc4eYVS46MlyiERukABpmt5vCMKjqahkRgd6TN7Byo8n+nOIVPujd3IR4zNt5eIWOxJ
 kjOpQlW+ZlfemOwarN6aJ6wDMJsyrX8EdPiVbbfad8mjoVNSTJrNRpGPSa4t10BWmB1+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:cH3vz6DmHCZXh0DlHejHsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBE4kHxKDwGeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iFnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjXuVm2Hqr8DVTC8zT5Mpv/MRTjLpr24b+P1s2q
 NC2GyU87JREBP7hSz4o/zFTQtjmEaYqWcr1cQTk3tce40Db6I5l/1owGplVLM7WA7q4oEuF+
 djSOna+fZtaFufK0vUu2F+qebcLEgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUmqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDnRHUx9upypH
 39aiIZiYZrEHieSvFmnac7vywleV/NEwgEkaplltpEUr6VfsuZDcTMciFqryKamYRgPiTqYY
 fOBHtoOY6dEYKXI/cu4+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-Talos-CUID: 9a23:CVwXuGNvlegbi+5DRQNJz3w7QvoZL3zT4Wn/LgioLT1TYejA
X-Talos-MUID: 9a23:0vqisAv8r1cXG4oemc2noTpkKJ52wPWSUB4XtKgGmemcJw9oNGLI
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="112298142"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+hIe3qnBbkIeOfgTJwcSDXmFzPGXAKzmDl5xgjwNOjqoYZntUhbg/1O8b8GKnzBmcOJOYC9AFlpr6AyM4BtmCMlBBvId40YgynOCb6QmQ8fxWP3N5tmS10MYJ16zY1wV4/zuy6rxWI9RepubCRKqDmnHNWnBVabpyvNm5RbVQy5wUtLuYxvvdZ56RGLBlaN0CJHv+vftndhM/2biMKLsUXmHWF9i6iYNUkB3qYFd1VqToNPDjOZ2vRuEz7aVAG1VMn/z0H7l+y3rRgmLV4lr9DXu/fcALlZsCcyxJs0KWwm2bVJEb5edpJ/z4hFKvijkJLcskkoCUTqm/KPWwv9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pVeP0uKucP8nRkF6l7VzLPXFFNp4GPvGtutR0D5kGM=;
 b=KzJYWSen/qZKffJ5NzHtAodF30ouwpcO0fxeq7eEkxv7tRldXBuwZnk46kwY8+Cenu37u4hzV7mbLBSnA65vvAfTSNYrEsME0GQupgkemFD1PB7/+Gly4daFZTWWutSlZIh1Fhb3O6uJuJ9Xv5xtIxvKzmCGTG2ND5jfaOAg7zXj2qFmkmaLIg+XIHZVN2VhEFv8gugWYv6wxoyi7ap28+kF1gAS7vV740ge/dBI3niC3pCV05njn33nQKhaHCx8+FpcI8ZQ3WNaq1iKUNFaoW51IybqWjnp0k4teAsbCmSzXmmCGI1DFghFFCr4Nycclj7ZiOf82Old2DAw/DqiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pVeP0uKucP8nRkF6l7VzLPXFFNp4GPvGtutR0D5kGM=;
 b=EBz1EaE3kdcIAZTj3w/ZxwI1AHlOlR6rvz8tonjElp4S7oXaVq2vhkd4PC8ECcCGDYHZIW6CiKbLXNan2rBNZswpzkxGMNiJUtI6VoF3QJWOjgUK02QoTtT22gzuYO+8YasETh3mngLxgDFk6YigrQgzGFX19YyfS8FNvt3/E6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jun 2023 11:03:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 1/2] x86: Introduce arch_domain_teardown()
Message-ID: <ZIBH2n8BhvIfYaUu@Air-de-Roger>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
 <20230605144331.1819452-2-andrew.cooper3@citrix.com>
 <ZH39EGVyUBIwWQ5t@Air-de-Roger>
 <18a46079-8fa5-5e43-9296-56a8c6457133@citrix.com>
 <9a34e419-ce1d-e452-47e8-fe220d600ab6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a34e419-ce1d-e452-47e8-fe220d600ab6@suse.com>
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: b7000155-6833-4d99-b5ef-08db67360f83
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xrC2CInwNgRLpURkJDOd1zQxgUyC3AUv6nAPgJu0a11mjT6BMvYNfrWTud47up/iLmwBWD0otchZuljMDUFry+vrpxUwqvBuqHWkaXhr3BeINCx5Ikf5GhUto5dF+KP2G2hOxwZYKmEGrXmX//ykSw0pZnfP7QheBMXyfMrUpvB73W+2Vp/HrZ2/ynQfET5wXVRjqQZoKfq3YB9hxHxfp6Rzx00LjStB+grAEsH52PLRsbDxMKxr2pe/ZxomKQoJa++sqWFRgvupXOejsoxbw+Awz2V+WkLV+HZEgnbLLV4Vc2NbxHQ1PPs7W79d8aiIwSl3wWTot/6+1zWEMoVWFzZHtqGOuBTLXHKrpz8Ga3pijpqmMDH7QXCebZ1mhSm7DDoitdvaPbxMkPJxl4jqG2HG+thTFCuKx6fa8hWwumSU8J/n+7iEneXqSU2Jtplm8JC2kmLXT4yjOwo4MtMz7i8EEVHNx0bQywdpnOJPrd96Cif7ARGYzz9Oz+XbOksQLFgZ27VUf7T9geDp+H+aXV7H0VRKsQnB+IViCTLqVbncWW30TX8ODygBu0AXauNVoH14gI7G7iynTN74v23gyasb+QTvqNlhywPIT4phRI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(2906002)(86362001)(82960400001)(66946007)(66556008)(66476007)(85182001)(4326008)(6916009)(26005)(9686003)(6512007)(6506007)(53546011)(8936002)(8676002)(41300700001)(5660300002)(6486002)(478600001)(38100700002)(33716001)(6666004)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djR5dDFBTGwxWWVHeldqK0h2b2ovdTkxL0VuSTFPeU4xbFYwL2JubFRaM1Nm?=
 =?utf-8?B?Q24xQzVDQ2JEZGh1QVQxQkhCTjVCdjBibXlyb2lGaExLaWZnY0JIbjBtZEp3?=
 =?utf-8?B?bEdwdVc2TDhKc29qWmNjVmgzVFNHOHpPSjBJdW91SUgyOUFLMzFrYkFpaEg4?=
 =?utf-8?B?bXNRdlp0ZDNiQ2wzdERyT2lFQkRLNzFEZ1NnZnFsQUhRU3lEM2xUMEJtNTA5?=
 =?utf-8?B?NDF6a2craTlDS2d1RGtYdFk0ZFhSeUtNRWJXTVQ4THlxUjZEcVZxWmZzZ25Z?=
 =?utf-8?B?K1grY0hOV2ZhdTIxZWZpUHd5SjlZbmtUNkFHeW9zelI4dHh5eFZvR05qUDln?=
 =?utf-8?B?dW13U2tjcVZlRDdsdDFtQjRPUGE0QWp2Z2JFb0pYS0VvYkcvQjdSZWZCL0Y4?=
 =?utf-8?B?SzV0ZDVaUHF2dEVLb3pvQTZiYXdUVkpNN0c4ZVBpWGJHRlhOMExBMW1MYTV5?=
 =?utf-8?B?SnJFc3RCa3BaTVBpMW5UdStVQ3lJNXQ3OEdBemdHcldrVUovcm84R0dHdFZl?=
 =?utf-8?B?cUtJUzEyb0RQb0NGcVZrdnFsRW14R2lJK3h1bTZvcVpQdGZhNmN0YVorSDBU?=
 =?utf-8?B?bS9GRHI4UjV5aG0yWDBVL0ozeUJ5ajRoVTJmVVo2cUJmZ21JWDFiR2V3Q2RL?=
 =?utf-8?B?MXAxM2FXTkZuenBvNlVGZUh1RWtTRlNEemVvaWx5ZnZPWEI0K25wYXJZR0Ft?=
 =?utf-8?B?T2t6THNWdTJnY2w3alQ4N1o2TFlwMm04aUVOOStiNkRSaEl5SjlyU051UVI1?=
 =?utf-8?B?S2tNSld5bXpVV3FUajlXeVY3R3FCWmZodTR1bUJqTmJLYnJJVmlyMWFYdmEr?=
 =?utf-8?B?WW1HNFp6ODZWSTViZ3ZVN3pMTmR0ZnNZeVZEaHlCdUhTQXRxYStnL295N0lk?=
 =?utf-8?B?VjBMbEdWWGxxZHFKZk4rWmZ0WEtLc0VGYUdqcW9zZkd3RkptdlBiR2pIbmho?=
 =?utf-8?B?VWtTTG5KTUtyaVl5K1RRcDFheTZvS3B1M0Z1c0ZhV3JxYmpjWmtrRTVLWCs3?=
 =?utf-8?B?bk00Y1BYbjZzd3R4YURMOUljb3RKWkRFWXhnelFaNkZqRWQwUmtZSjA4WGV0?=
 =?utf-8?B?bjNyV01mdkhjYXRpbFZxemV6TjZ1UFlUTmVaMkQ1SHRMc2xNL0ZycTlIMEhX?=
 =?utf-8?B?UVpkKzJ3V1Z1WDN5Szg2OEY0QkVYWGtaR1ZpTTlteXh6UlRJOXI5aFplU2pB?=
 =?utf-8?B?Y3RSTU95REJ3eXB1YTAwWkNWMkdrMkI0TjhVak8veFlKSWt1K2FzM0FCQXlx?=
 =?utf-8?B?RFUzK2R6YXJocVE2bDBGSXFWa3ZuSkp3RTlCUEZjN29HSVQwMXN3VUdZd0dk?=
 =?utf-8?B?OEVxWXpRcmRzcnM4ZlNhUEcrZm0xMXAvRVhtbmI4MjFTdTlkOGM0SWJ4UXBX?=
 =?utf-8?B?eWkzVmJ3L3c4OWZoS1BnaTNkTlpxVERGendyUkdzNm1CKzBwQ25OL1REeXlX?=
 =?utf-8?B?QmZLb3BzUnN6aXFGU1dSOHluMkZuUnNrRUlqWWJQYTBVNHdaZG1QU0V3MTR1?=
 =?utf-8?B?SEhHZTRpY0QyUXdNeExwS2xUSFhTcFc1aUVpQjB1VE5OZExkbVhEaHpLaElk?=
 =?utf-8?B?L0t6VHM3UVhFQ3k2Y295R1RESXU3ZzgxUkFsalFLZEhhSVhtcms1bEUxRllv?=
 =?utf-8?B?U1NmNDJueDI0MDlwQVBCNy9RcVgyUVN0UGp6NUFxY21OZ0NmN2VDazNCWW9J?=
 =?utf-8?B?UUgvanNNV25KSzFZK01YUGFZTDJ2d1BiL28yVWw4cXhZMEhFNGV0TGZyRmwz?=
 =?utf-8?B?S2NpYk1CNHlydWh4a3VidHoxb2JDU1ZUR0g2cmFoc0wxOWREYUxJcFVDYW9x?=
 =?utf-8?B?UDZxdEVZb2R5QjZ4b2Z1Wk51WTkzbG9QODlleWZBTWJibmoxdUtjVXBKQ3R2?=
 =?utf-8?B?ZjZKM29ITjAvMW42R21Cemo3aTVtZ1N6TUlVTUtEUnA5OEhHeUhzdGJMaSsv?=
 =?utf-8?B?SlZDeVg5L1UzZmJ1L1JvYm1JQ09mYTVoR0E4c2xwY01wUVdISUo5a0t5K1Jl?=
 =?utf-8?B?Qld5MCs5cFlnVWtFaGpIYkFBbnU5UW1ocG5ZeldBOFpmSWlBc0hsN0JuT1dN?=
 =?utf-8?B?bWNabVAvMnMwOS9rbkl3bWh2Rk9zU0RrZU02NHVnVGlNM2ttUXVFUmd5OTI4?=
 =?utf-8?B?OEpOOTZlS2ovUVhjZzFPaCtxVFRPaDJWdU9zWE9wUFBCaktlNmpLOGhJSnZR?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v5/kJP0P+ccJG4Mt6O7pZsUxI7OTtuxmTYJGdMLMDLi7U5iCsKpoPf/xnd9LHqzmxnXtnbPLauajP5DLLeGlKgkSepehS1cxqS63NbkebP4vu5tFq5HkphPAi9TFC1Is2XeaZo3SJfxsIUBJLSWcpCoId2LDmJShwvrT1j/InWvAb3BtA0Dqne/VE7iA9ky8vv0hDoLCZit+6SLp0JAyU5eHYiTFw/bh5XXpdbtxiTSbW539FAYlG+qlgmw30GD71jiUW9Og5bjuF1BzE7jqDxjizM8qUCAM1/Ui36Y60LiFIj998RzorhvcB49uTuu2ZqzfpKp1s7kxy0NwhUeIiEqMsm4hKuuP7OFOSTOvjmFjMvhE5ruanxNcVCnY3QExlldqTVr1nF0Ik8ynA7RItyYadOBfSrOG/3nQMV98PLQmjfJv2bUW09A09v8PQNVV96naNWgtMPtVLGosdtX5avdm+53oddsoUDgDGrsU1MklUKCbSDF1O7uk0H4OwR4v36uWy5ftSw/Gs9OPbH94MUyP0C8iJL/aSMEIlmHwRJf4NdCQi8JWKWOyAvzXCOEs2urGD4zdVmvtPNq6u113LJ4SVSo3j/fX5YK1LtL9kaCY2s1DKZBb9kS6a9AUsZJL0wCJD3n9Pk1X66r0nA17WbAK0yW1Yc51IftHndJ624A2aouo7uSlb3Xe3r7xgBWa6so+vARjmV8HMIgGY2k6Imf0icyAZbSGAn7HvNUOoWg2M1At/sNuBVJdMNejC+3NyQ6B7LjmcQxF9mZUCxhT9jgqMvZMFTRtXpVgTQX6/mwSkdsRoGoSezNGGaqsmQROBDverr6G2+XIXu7lDLgG6Jcb03lBk36ReOw9B5lSLy10/P/9FVHiDyTmEk+4H240AipwEmBXv6sctJ5y02iSCl9Z7E2VWNZsRQh+Df3itoU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7000155-6833-4d99-b5ef-08db67360f83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:03:29.1762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7pYXoRAimV5vFhvqIm0A1J1BEFopdxpSRIB+deOMo+geKtB0ryQvEnoIu873FWD6AlUf3D1rEFKRbul1pfSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7284

On Wed, Jun 07, 2023 at 10:43:24AM +0200, Jan Beulich wrote:
> On 05.06.2023 17:23, Andrew Cooper wrote:
> > On 05/06/2023 4:19 pm, Roger Pau Monné wrote:
> >> On Mon, Jun 05, 2023 at 03:43:30PM +0100, Andrew Cooper wrote:
> >>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> >>> index 85242a73d374..854f3e32c00e 100644
> >>> --- a/xen/include/xen/sched.h
> >>> +++ b/xen/include/xen/sched.h
> >>> @@ -589,6 +589,7 @@ struct domain
> >>>       */
> >>>      struct {
> >>>          unsigned int val;
> >>> +        unsigned int arch_val;
> >> While I haven't looked at patch 2, wouldn't such continuation
> >> information better be encoded in arch_domain in whatever way is more
> >> suitable for each architecture?
> > 
> > Well, it's filling a hole here on 64bit builds, which it couldn't do in
> > arch_domain.
> > 
> > And it's contained inside teardown{} which already signals it as fairly
> > magic.
> 
> Plus why have each architecture duplicate the field? I expect none of
> the arch_domain_teardown() instances will remain without an actual
> use of the new field, mid to long term.
> 
> I don't want to override Roger's concern, but from my pov
> Acked-by: Jan Beulich <jbeulich@suse.com>

Oh, no worries, I was meaning to reply I was fine with Andrews
justification, but forgot.

Thanks, Roger

