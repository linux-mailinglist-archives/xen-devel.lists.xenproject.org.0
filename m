Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E26DF014
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520078.807315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmWYM-0000i4-N2; Wed, 12 Apr 2023 09:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520078.807315; Wed, 12 Apr 2023 09:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmWYM-0000g3-Iv; Wed, 12 Apr 2023 09:14:10 +0000
Received: by outflank-mailman (input) for mailman id 520078;
 Wed, 12 Apr 2023 09:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SpRk=AD=citrix.com=prvs=4590bba82=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pmWYK-0000fx-Q9
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:14:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df577ba-d912-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 11:14:04 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2023 05:13:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4931.namprd03.prod.outlook.com (2603:10b6:408:d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 09:13:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 09:13:54 +0000
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
X-Inumbo-ID: 5df577ba-d912-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681290845;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2991Y1o0h26C9mYfga/O1VOH3rPvqbiCrW9xHOa9IfQ=;
  b=B34CwRx++heqcu99TsrhSr3RDYWq6a9bwOfaiMwVV1se8MzW6QBZuRmY
   VtEpvmPmA9Q+qaFSTGGWcQk7x7RkEWKzjPH41Kt0gW04jUbROgRVADFgX
   cwxCvdNW9hcmwFKl+sLHt/m6gUpFSWlYaquN7GKEZl7tf1tjfA8e+fy4j
   c=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 107631059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FLSQ7a2UyrwK8F7Z2/bD5V1wkn2cJEfYwER7XKvMYLTBsI5bp2MHn
 GQeWG2PMveKamSnfd4kYN+18B8Fu5CGzIcwTAdtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBnP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLHleq
 ewjAigxMEqK2M7p3bjjRsNwmZF2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kk1cZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rCRxnqjBdN6+LuQx+VJmQSh7D0oEAA0WUe+pqOrkG2BcocKQ
 6AT0m90xUQoz2SVSd36Uwy9sWSzlBcWUNpNEMU38AiIjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLv4Ubnh/JCNF5H8adjMDxGDz26
 yCHqm45nbp7pdUQy6yx8FTDgjStjpvEVAg44kPQRG3NxhtweYqNd4Gur1/B4p5oL4uHT1/Ho
 HkNneCf6vwDCdeGkynlfQkWNLSg5vLANSKGh1dqR8Ul7270pCXlep1M6jZjIksvKtwDZTLif
 E7Uv0VW+YNXO3ypK6RwZupdFvgX8EQpLvy9Pti8UzaESsIZmNOvlM22WXOt4g==
IronPort-HdrOrdr: A9a23:eWUF+6Np4prdvsBcTvmjsMiBIKoaSvp037Eqv3oBKiC9E/b1qy
 nKpp9w6faaslsssQ4b6LS90cW7L080l6QFhLX5TI3SPjUO0VHARL2KhrGC/9SPIU3DH+dmpM
 BdWqJjEsD3CVRgreuS2maFL+o=
X-IronPort-AV: E=Sophos;i="5.98,338,1673931600"; 
   d="scan'208";a="107631059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRI/DNIdat9Yxq9em9NW7+zqMf/zi9mgU/w7GjDei02GUaDGCgVLceNJZRbX/4pwaw3CNsnkh4kogxvnCBjyUYZMd3tTOGX0QLrCFGqd92fB154AV9o8lxkQjrwwE/jlR5CujZcXsiWcXl/Ti79BxFXYsJPmAcaNqYXnahx2xc1KylYamfO61O+FeO2UfdE0eYZWsFcMJ8w7iwiHT47ywZsGWCLzcyKelEYu4AhYvrwHEeHSyC7moV20Za+Y469VgwhW7qV65I4DATCb9nRje9wxsg1AUOQXpBgmEru8pIrmjUnY3RxxXpUM3nodgCB1Mk+/njNSiiDL1SugOAZK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK/G2jZPuDIzdh5segEY+bnvxm5SocI73p3sLSt9VtI=;
 b=cy+2WOhKdXKipqA+evdEDMNeh9KwuUqDgaX/I+DTvrcgqG7U7sk3/CasnZvA/qqCnh59Vy/os7ffDgBGK8n3ZBoetVXA1TSGfl9li0gc8k1SAWmOLvSQTQQpoEJevj9XrVVFkkOMgKUIp4K3us+QPadzPqmsmmUzHEWFab6zVWgQrOvnTnX9J6CFEl7iNxTIAOO4mftan3a1srmdaX8c7LLLIjS1KZaWulGEokpYOzZB59i6WMijhMy7CWzhE+eGq/L+HoCDSxaArP5PraagH6tAln1AtBNBDUDp4YmGGYor96t1t8dz9xJatsibn2iw4VRGMQ72XOcIJrffoQP1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK/G2jZPuDIzdh5segEY+bnvxm5SocI73p3sLSt9VtI=;
 b=wifTpD/GczYOpvGKSpQ5pRbinAQPtInC5ScuzjpVRYfPQlKMuH89ERMdMJllG0HYrZ9j87CvOdrXut1nM1lOqRg8j8DgNj3/i7AOTiDEgko4FSEVc4jp5OyosoxurimQo7GVEf2pMGCG15oIa/EGGCxDA0fOQCGA4Ql/rPaFx7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Apr 2023 11:13:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZDZ2S4OxP2e12oSX@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <873556xa0g.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <873556xa0g.fsf@epam.com>
X-ClientProxiedBy: LO2P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: c20940d5-8f31-4eb6-d1ae-08db3b363d20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LciPqFrnk0CSu/fNPFNSgD6E/JZCDw6TpwGdwbW057YH2CaPbSlxUc5p8XhSckvb85Bwomal9ykyZGQT+ZLknivfd8WnMKSMA2xhxdn4FlhVmn4C8wQYSuYfRlX98lnvRzSA5y8Ej/QRHqRllxba1VrYbcQ7RilmRZpj6bnkzhuHG61d8fluET6GiO6Qf+gldkXUmURKcVzcwc7M2gNLNbuCRY0Yr530qQ+TENoKfjHIV6e6KNOytyXUVnNiOFvUEWh4MXBnwboQK2ONStDWifnA1unstgy1MsdElRJMhSPXgyVtml6TTgcsDoNAER4yHAVJTRJk9yxKIghWY2QP5T+AI4PWBajBNuYQN7bmg5f3BbBG29vbnUc1Xng6Vcg7KCWGAcKaoKHnQrQ2b4hKutbsSVptDE2r9wWH9rlcS/CoO1/lfJqttas9ZhLOIBKT7FkAyhHBAaxxhFheP6OvxmgHGfOtZ3NHYGG3/uEvnE2ZdUyNZ4bpTHyMMBWNnmADnb5lCjMaIJxGeQ2a+9cjsIoGqS02uEdp6bzT515SohgeG1cxzDvVgu+Xk/CGjHNk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(54906003)(41300700001)(66476007)(66556008)(66946007)(8676002)(4326008)(478600001)(6486002)(6916009)(316002)(85182001)(86362001)(26005)(6512007)(6506007)(6666004)(9686003)(83380400001)(8936002)(2906002)(7416002)(82960400001)(5660300002)(33716001)(30864003)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVqTkJCcytOTklZdkFwMWc4ekdVT3dteHRzMnFIY29qSHduSm96TUpDYmlF?=
 =?utf-8?B?cUVYZm5lVjhhZklGc3hoSlB4ZGhFd3NaU1g0ODMzekcrOW1ESXpqMlp0YnZ0?=
 =?utf-8?B?VHQ5a1NyTTB6WDhncnhJODdZczJrU2Y2eDNPQnM0R1pESmtBZ0xJR21pc1hs?=
 =?utf-8?B?dzc2QTJCRUQrUXJISDg5UmJpOG5aQUhneXMydVpRcThEL1NsRVUzR0dsUjFs?=
 =?utf-8?B?SEN6VGJCaDR5czRNUyt5RkhkWDJNWFpMdkVWMzUvZHo1ZkpCRzBaalFQekw5?=
 =?utf-8?B?di9LNUY0L1ZKNHN2ZG80Y0pzeks3dldOUEtRRVRwblpVSUxHSFdPWkhaZktV?=
 =?utf-8?B?OFM2SUlXaXQxdGQ1aVFZQTRYYjBsYWdUTVdDRDJRajZ3VWpvYjZBR1RHaUZL?=
 =?utf-8?B?T05CRnoxNWdIQzVHTTRTL0xSQ29Cam9Cb3VpdXdkVURHU2EwQjFFTzFHYzFI?=
 =?utf-8?B?dU5aLzJOcWtBdWpoUUY0UGllR2c3THFiSCtYTlRmeklidmMrdkM1MHljMGg1?=
 =?utf-8?B?ODlYM2JMN1Jia1dmNjBiRHl3YkVSMnFzdDdVSmJ6VkhaSlYyRnVwdVo3NmlB?=
 =?utf-8?B?Uk9oaVRqRjdPaGdEZFlDdC84Zjl2bnBxSXBQdEh4eExIQWJxM2p1R0Vjdnp3?=
 =?utf-8?B?Y3VUWDVhV1IrSEVYRHY2clBoNkNVOXBHb1Badk1MZmpHSHFYM3ZtN3lYQUpV?=
 =?utf-8?B?QkxSVkRBcmY3UkJpUnRiazJUN3pXVmJuOTV2QlpsenFUenFwWEZBbEF1akpq?=
 =?utf-8?B?aGwwZEFWdEJ1Wms5STJCU3BwVXhZMXlzNnJVMUxWc281aDBSazZFa285eUZj?=
 =?utf-8?B?Tk4zQzJpOU1Pa1ZZRjhOaEwxcnMrMUJzRDhqWjcrd09iUUR0Nzd6cXVzLzJY?=
 =?utf-8?B?cHQ4dHpZU1VyRE5LWlgyN3k5bmZzaGpPemxpY040cktFNmpxWVpDOHcxY0Ey?=
 =?utf-8?B?Q0ppbnhOU0FsM1ZaZEkrLzRzaTNRSVR6WC9LV3VvUlNxbm01ZFdCNFE1b2Vm?=
 =?utf-8?B?RkRCZi9RUUdabjVDOE9kSmZ6dFQxRVhpR0ZqVmEvS0pLbWtjcFdyNU1TcVNa?=
 =?utf-8?B?eDJ0SnJOaXkxZEV3WXFJZUVTUHo5eDJVNmF3NU5KMXAzUHdDSkRjU0lqVDN3?=
 =?utf-8?B?UkorV2RqU045OHhFakVLUG9yVlhnVG1XZTMvN0J0c2s1ckkwOXk4cG1mazZv?=
 =?utf-8?B?NjVSMWVFYSs3VWU3ano3YVVyeXYwcStvOWI1V1Q4RnFnZFNOMVErRnZRQVIv?=
 =?utf-8?B?dkZYblQ1OVlQK3V0NEJvZFo3Uld4MnhlL2NFTnJHZHhUMDlOMElVU3RCcGVx?=
 =?utf-8?B?dGpRK0RWZmdVUEpXOWpJUTRXY1FpS09venFldHRJNWVWdnd4NmxtVnVDNHBu?=
 =?utf-8?B?bi9Ja0pkVmY0d0FoU2NhNHZkTlVibGhldmNybGduZ1BUODY4eWZqL0pKRnla?=
 =?utf-8?B?VWVJZldQYXB2dHZJY2Zha1pVM0pUUmU2bEhxeXN1YVU5MnViMDQ5bnlLVnBI?=
 =?utf-8?B?NndCNUFuTnhkd1JkNFhuQjErcytmdkRlRXZ3ZmZuN2c2UldlRlJpREd6Skh3?=
 =?utf-8?B?dmdLTXpGZDVuMFlJQ1RBQit3b3lnOUdlV09adWE3Rmk0bXpDZnBkWVJqZWpN?=
 =?utf-8?B?U3ZFN0dyczhwVWwwSmwvaGh2TzdTNGVNblgvb2pCNWUxY3p3ZkhmbDJXaDdm?=
 =?utf-8?B?NVJFTmdYZFZTMDBQNTlMWXl3cDJleUpJMmdZNmlNT2J0ZGRoNy9nc0Q4OFVW?=
 =?utf-8?B?ZWNJaEtXMmMwQUQxZk90TW9oYXJhbnc1L0RFZmNXa1RkelFjKzRxV2V1VWV3?=
 =?utf-8?B?STFBaS9PaTJFR0FESGRkYndtbUhITlozeDFIQ1ZxVVk2TzkrY1QycXZHRG03?=
 =?utf-8?B?a1BDejZRVEZ0dWx0RWpaWEhqV2ZLUHVoTHVSSkNqUXBxUUpVUUxwMW9FQlo1?=
 =?utf-8?B?bHY3UjNqVFFvbGtqQ3RMMHZkOHY2ZysrWGlCdERPaW5PVkNyZGYveFJFZmRo?=
 =?utf-8?B?dGpPcm82Q2hCaCs2QURtVFcvN3IrMjAwclBQL2x0OTUzK2JOVVhQb05RV1dv?=
 =?utf-8?B?RVM0K3V0b1ZZcHc5OG1ZUDRLR1daNi81UkNqQ2Jsenp3SVlnMGVsamNpRGd4?=
 =?utf-8?Q?ZmFqFsxIVbgFUrx8wTYTGJ/jI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ggj53bxZXMKKJXvysyvWg03wXUSK7id5DpJA1AGZ7hg0NYytihLy+cJyiDy+/H5FpTncx8vCJuOskqvlQ14xwbTcHO+RUffzbACviYtcGjkNpQlZ3Yk7UIoN5BmT6oHv2uaTqxsROCB5Ue1NfgrUBrV87Dfnt2Yai5uyvjeFUEZs6x20wJlgmjY/PJpPJWQlhy6WJkfP3yeW0K3s0NSmO0BcFeNbPvissh2D9rGufmAu+X4uw2bLZy0j6f1Gt648v1+Uy45OPFdRRGyEuYi1FRdlnBio3kn8u5K+DnpJKrF6hu4liJQAjRsF3sVVT525u84Nw5ml+Xko4hPWiFaYNOR8d/2uqdKS30pPeeDLQtPNrZqaHmjUlMRcX4tyPV33TqRdnavNXJuhrUpj1j/+z8MWK0/toTCEhbFOrMCiZYQrEE8+Uf2OXUJJ/9yNtBIWNqQ3qiDKUHR2rA96lfVdlaoPkHcgJXCOReYlEQW87xLWtLCGkDBwhsTGOPcQB3d5XDXYeKHoDnEwQa+f+lVGI07UoHQhugY5dQ6DfB/1CaL9vlkjwBIVLSwFUvShR1DRtGB3tRzI4BgiS603IfGtJHWB2R1Vv4ZPl0IPLE7n5pYJf+mv2TzkXjD9ggxRod/QMqQsbGWK277AaUN+17HzT5RiQqSUfvUgflQhh6PCR82IR3MTe9C8Zilqq560tLiZ+u4N+q4zIhxiNiSiOU7SAFNxN1RjC9Ga9QaPajzDxG9Ze8HL7HTDaXhZDaumbQjq278nV1oy8buR4p+HsoJBB0sWXOWCv3NPBuBwf2YTfPNfi/1IjNEaLDsiE1/FKkBOFy9VdbKHyM3uxowWUqtXpjnGCJFGQI981WVTUVjvDfFh1RsUSfRgC58fvgLkp/3eIxDpNbotO0o3JIEdUDJoQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20940d5-8f31-4eb6-d1ae-08db3b363d20
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 09:13:54.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxJo11qcy+ow6KJNBMWlRPbRVzykqUFes2mJg25PfQFk5qGdqsU+1nLw91PlBg68tFf88nGMIC3PUDK6YnTIOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4931

On Tue, Apr 11, 2023 at 11:41:04PM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> Prior to this change, lifetime of pci_dev objects was protected by global
> >> pcidevs_lock(). Long-term plan is to remove this log, so we need some
> >                                                    ^ lock
> >
> > I wouldn't say remove, as one way or another we need a lock to protect
> > concurrent accesses.
> >
> 
> I'll write "replace this global lock with couple of more granular
> locking devices"
> if this is okay for you.
> 
> >> other mechanism to ensure that those objects will not disappear under
> >> feet of code that access them. Reference counting is a good choice as
> >> it provides easy to comprehend way to control object lifetime.
> >> 
> >> This patch adds two new helper functions: pcidev_get() and
> >> pcidev_put(). pcidev_get() will increase reference counter, while
> >> pcidev_put() will decrease it, destroying object when counter reaches
> >> zero.
> >> 
> >> pcidev_get() should be used only when you already have a valid pointer
> >> to the object or you are holding lock that protects one of the
> >> lists (domain, pseg or ats) that store pci_dev structs.
> >> 
> >> pcidev_get() is rarely used directly, because there already are
> >> functions that will provide valid pointer to pci_dev struct:
> >> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
> >> find needed object and increase its reference counter before returning
> >> to the caller.
> >> 
> >> Naturally, pci_put() should be called after finishing working with a
> >> received object. This is the reason why this patch have so many
> >> pcidev_put()s and so little pcidev_get()s: existing calls to
> >> pci_get_*() functions now will increase reference counter
> >> automatically, we just need to decrease it back when we finished.
> >
> > After looking a bit into this, I would like to ask whether it's been
> > considered the need to increase the refcount for each use of a pdev.
> >
> 
> This is how Linux uses reference locking. It decreases cognitive load
> and chance for an error, as there is a simple set of rules, which you
> follow.
> 
> > For example I would consider the initial alloc_pdev() to take a
> > refcount, and then pci_remove_device() _must_ be the function that
> > removes the last refcount, so that it can return -EBUSY otherwise (see
> > my comment below).
> 
> I tend to disagree there, as this ruins the very idea of reference
> counting. We can't know who else holds reference right now. Okay, we
> might know, but this requires additional lock to serialize
> accesses. Which, in turn, makes refcount un-needed.

In principle pci_remove_device() must report whether the device is
ready to be physically removed from the system, so it must return
-EBUSY if there are still users accessing the device.

A user would use PHYSDEVOP_manage_pci_remove to signal Xen it's trying
to physically remove a PCI device from a system, so we must ensure
that when the hypervisor returns success the device is ready to be
physically removed.

Or at least that's my understanding of how this should work.

> >
> > I would also think that having the device assigned to a guest will take
> > another refcount, and then any usage from further callers (ie: like
> > vpci) will need some kind of protection from preventing the device
> > from being deassigned from a domain while vPCI handlers are running,
> > and the current refcount won't help with that.
> 
> Yes, idea of this refcounting is to ensure that a pdev object exists as an
> valid object in memory if we are holding a long-term pointer to
> it. Indeed, vPCI handlers should use some other mechanism to ensure that
> pdev is not being re-assigned while handlers are running. I believe,
> this is the task of vpci->lock. Should we call
> vpci_remove_device/vpci_add_handlers each time we re-assign a PCI device?

Yes, I think this was also part of a comment I've made on a different
patch.  The device state needs to be cleared when assigned to a
different guest (as the hardware domain will also perform a device
reset).

I think there are some points that needs to be part of the commit
message so the code can be properly evaluated:

 - The reference counting is only used to ensure the object cannot be
   removed while in use.  Users of the pci device object should
   implement whatever protections required in order to get mutual
   exclusion between them and device state changes.

> >
> > That makes me wonder if for example callers of pci_get_pdev(d, sbdf)
> > do need to take an extra refcount, because such access is already
> > protected from the pdev going away by the fact that the device is
> > assigned to a guest.  But maybe it's too much work to separate users
> > of pci_get_pdev(d, ...); vs pci_get_pdev(NULL, ...);.
> >
> > There's also a window when the refcount is dropped to 0, and the
> > destruction function is called, but at the same time a concurrent
> > thread could attempt to take a reference to the pdev still?
> 
> Last pcidev_put() would be called by pci_remove_device(), after removing
> it from all lists. This should prevent other threads from obtaining a valid
> reference to the pdev.

What if a concurrent user has taken a reference to the object before
pci_remove_device() has removed the device from the lists, and still
holds it when pci_remove_device() performs the supposedly last
pcidev_put() call?

> >
> >>          sbdf.devfn &= ~stride;
> >>          pdev = pci_get_pdev(NULL, sbdf);
> >>          if ( pdev && stride != pdev->phantom_stride )
> >> +        {
> >> +            pcidev_put(pdev);
> >>              pdev = NULL;
> >> +        }
> >>      }
> >>  
> >>      return pdev;
> >> @@ -548,13 +526,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
> >>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >>              if ( pdev->sbdf.bdf == sbdf.bdf &&
> >>                   (!d || pdev->domain == d) )
> >> +            {
> >> +                pcidev_get(pdev);
> >>                  return pdev;
> >> +            }
> >>      }
> >>      else
> >>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
> >>              if ( pdev->sbdf.bdf == sbdf.bdf )
> >> +            {
> >> +                pcidev_get(pdev);
> >>                  return pdev;
> >> -
> >> +            }
> >>      return NULL;
> >>  }
> >>  
> >> @@ -663,7 +646,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>                              PCI_SBDF(seg, info->physfn.bus,
> >>                                       info->physfn.devfn));
> >>          if ( pdev )
> >> +        {
> >>              pf_is_extfn = pdev->info.is_extfn;
> >> +            pcidev_put(pdev);
> >> +        }
> >>          pcidevs_unlock();
> >>          if ( !pdev )
> >>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> >> @@ -818,7 +804,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >>              if ( pdev->domain )
> >>                  list_del(&pdev->domain_list);
> >>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
> >> -            free_pdev(pseg, pdev);
> >> +            list_del(&pdev->alldevs_list);
> >> +            pdev_msi_deinit(pdev);
> >> +            pcidev_put(pdev);
> >
> > Hm, I think here we want to make sure that the device has been freed,
> > or else you would have to return -EBUSY to the calls to notify that
> > the device is still in use.
> 
> Why? As I can see, pdev object is still may potentially be accessed by
> some other CPU right now. So pdev object will be freed after last
> reference is dropped. As it is already removed from all the lists,
> pci_dev_get() will not find it anymore.
> 
> Actually, I can't see how this can happen in reality, as VPCI, MSI and
> IOMMU are already deactivated for this device. So, no one would touch it.

Wouldn't it be possible for a concurrent user to hold a reference from
befoe the device has been 'deactivated'?

> >
> > I think we need an extra pcidev_put_final() or similar that can be
> > used in pci_remove_device() to assert that the device has been
> > actually removed.
> 
> Will something break if we don't do this? I can't see how this can
> happen.

As mentioned above, once pci_remove_device() returns 0 the admin
should be capable of physically removing the device from the system.

> >
> >>              break;
> >>          }
> >>  
> >> @@ -848,7 +836,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
> >>      {
> >>          ret = iommu_quarantine_dev_init(pci_to_dev(pdev));
> >>          if ( ret )
> >> -           return ret;
> >> +            goto out;
> >>  
> >>          target = dom_io;
> >>      }
> >> @@ -878,6 +866,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
> >>      pdev->fault.count = 0;
> >>  
> >>   out:
> >> +    pcidev_put(pdev);
> >>      if ( ret )
> >>          printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
> >>                 d, &PCI_SBDF(seg, bus, devfn), ret);
> >> @@ -1011,7 +1000,10 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
> >>              pdev->fault.count >>= 1;
> >>          pdev->fault.time = now;
> >>          if ( ++pdev->fault.count < PT_FAULT_THRESHOLD )
> >> +        {
> >> +            pcidev_put(pdev);
> >>              pdev = NULL;
> >> +        }
> >>      }
> >>      pcidevs_unlock();
> >>  
> >> @@ -1022,6 +1014,8 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
> >>       * control it for us. */
> >>      cword = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> >>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cword & ~PCI_COMMAND_MASTER);
> >> +
> >> +    pcidev_put(pdev);
> >>  }
> >>  
> >>  /*
> >> @@ -1138,6 +1132,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
> >>                  printk(XENLOG_WARNING "Dom%d owning %pp?\n",
> >>                         pdev->domain->domain_id, &pdev->sbdf);
> >>  
> >> +            pcidev_put(pdev);
> >>              if ( iommu_verbose )
> >>              {
> >>                  pcidevs_unlock();
> >> @@ -1385,33 +1380,28 @@ static int iommu_remove_device(struct pci_dev *pdev)
> >>      return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
> >>  }
> >>  
> >> -static int device_assigned(u16 seg, u8 bus, u8 devfn)
> >> +static int device_assigned(struct pci_dev *pdev)
> >>  {
> >> -    struct pci_dev *pdev;
> >>      int rc = 0;
> >>  
> >>      ASSERT(pcidevs_locked());
> >> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> -
> >> -    if ( !pdev )
> >> -        rc = -ENODEV;
> >>      /*
> >>       * If the device exists and it is not owned by either the hardware
> >>       * domain or dom_io then it must be assigned to a guest, or be
> >>       * hidden (owned by dom_xen).
> >>       */
> >> -    else if ( pdev->domain != hardware_domain &&
> >> -              pdev->domain != dom_io )
> >> +    if ( pdev->domain != hardware_domain &&
> >> +         pdev->domain != dom_io )
> >>          rc = -EBUSY;
> >>  
> >>      return rc;
> >>  }
> >>  
> >>  /* Caller should hold the pcidevs_lock */
> >
> > I would assume the caller has taken an extra reference to the pdev, so
> > holding the pcidevs_lock is no longer needed?
> 
> I am assumed that lock may be required by MSIX or IOMMU functions, that
> are being called here. For example, I can see that reassign_device() in
> pci_amd_iommu.c manipulates with some lists. I believe, it should be
> protected with the lock.

OK, so that's pcidevs_lock being used to protect something else that's
not strictly a pci device, but a related structure.

> >
> >> -static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> +static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
> >>  {
> >>      const struct domain_iommu *hd = dom_iommu(d);
> >> -    struct pci_dev *pdev;
> >> +    uint8_t devfn;
> >>      int rc = 0;
> >>  
> >>      if ( !is_iommu_enabled(d) )
> >> @@ -1422,10 +1412,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >>  
> >>      /* device_assigned() should already have cleared the device for assignment */
> >>      ASSERT(pcidevs_locked());
> >> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >>      ASSERT(pdev && (pdev->domain == hardware_domain ||
> >>                      pdev->domain == dom_io));
> >>  
> >> +    devfn = pdev->devfn;
> >> +
> >>      /* Do not allow broken devices to be assigned to guests. */
> >>      rc = -EBADF;
> >>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> >> @@ -1460,7 +1451,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >>   done:
> >>      if ( rc )
> >>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> >> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> >> +               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
> >>      /* The device is assigned to dom_io so mark it as quarantined */
> >>      else if ( d == dom_io )
> >>          pdev->quarantine = true;
> >> @@ -1595,6 +1586,9 @@ int iommu_do_pci_domctl(
> >>          ASSERT(d);
> >>          /* fall through */
> >>      case XEN_DOMCTL_test_assign_device:
> >> +    {
> >> +        struct pci_dev *pdev;
> >> +
> >>          /* Don't support self-assignment of devices. */
> >>          if ( d == current->domain )
> >>          {
> >> @@ -1622,26 +1616,36 @@ int iommu_do_pci_domctl(
> >>          seg = machine_sbdf >> 16;
> >>          bus = PCI_BUS(machine_sbdf);
> >>          devfn = PCI_DEVFN(machine_sbdf);
> >> -
> >>          pcidevs_lock();
> >> -        ret = device_assigned(seg, bus, devfn);
> >> +        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> +        if ( !pdev )
> >> +        {
> >> +            printk(XENLOG_G_INFO "%pp non-existent\n",
> >> +                   &PCI_SBDF(seg, bus, devfn));
> >> +            ret = -EINVAL;
> >> +            break;
> >> +        }
> >> +
> >> +        ret = device_assigned(pdev);
> >>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
> >>          {
> >>              if ( ret )
> >>              {
> >> -                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
> >> +                printk(XENLOG_G_INFO "%pp already assigned\n",
> >>                         &PCI_SBDF(seg, bus, devfn));
> >>                  ret = -EINVAL;
> >>              }
> >>          }
> >>          else if ( !ret )
> >> -            ret = assign_device(d, seg, bus, devfn, flags);
> >> +            ret = assign_device(d, pdev, flags);
> >> +
> >> +        pcidev_put(pdev);
> >
> > I would think you need to keep the refcount here if ret == 0, so that
> > the device cannot be removed while assigned to a domain?
> 
> Looks like we are perceiving function of refcnt in a different
> ways. For me, this is the mechanism to guarantee that if we have a valid
> pointer to an object, this object will not disappear under our
> feet. This is the main function of krefs in the linux kernel: if your
> code holds a reference to an object, you can be sure that this object is
> exists in memory.
> 
> On other hand, it seems that you are considering this refcnt as an usage
> counter for an actual PCI device, not "struct pdev" that represent
> it. Those are two related things, but not the same. So, I can see why
> you are suggesting to get additional reference there. But for me, this
> looks unnecessary: the very first refcount is obtained in
> pci_add_device() and there is the corresponding function
> pci_remove_device() that will drop this refcount. So, for me, if admin
> wants to remove a PCI device which is assigned to a domain, they can do
> this as they were able to do this prior this patches.

This is all fine, but needs to be stated in the commit message.

> The main value of introducing refcnt is to be able to access pdev objects
> without holding the global pcidevs_lock(). This does not mean that you
> don't need locking at all. But this allows you to use pdev->lock (which
> does not exists in this series, but was introduced in a RFC earlier), or
> vpci->lock, or any other subsystem->lock.

I guess I was missing this other bit about introducing a
per-device lock, would it be possible to bundle all this together into
a single patch series?

It would be good to place this change together with any other locking
related change that you have pending.

Thanks, Roger.

