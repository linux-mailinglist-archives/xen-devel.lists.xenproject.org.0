Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF5759A70
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565958.884611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9hK-0000UU-JH; Wed, 19 Jul 2023 16:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565958.884611; Wed, 19 Jul 2023 16:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9hK-0000Sc-GZ; Wed, 19 Jul 2023 16:06:42 +0000
Received: by outflank-mailman (input) for mailman id 565958;
 Wed, 19 Jul 2023 16:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KnqJ=DF=citrix.com=prvs=5573504fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qM9hJ-0000SF-Ja
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:06:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d04c11a-264e-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 18:06:38 +0200 (CEST)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 12:06:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5186.namprd03.prod.outlook.com (2603:10b6:a03:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 16:06:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 16:06:33 +0000
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
X-Inumbo-ID: 3d04c11a-264e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689782798;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GENVvQZWeuPiNFMDhWJbVl9VbwXhyOoc7JxkXle6YDU=;
  b=GgKyYdw5Gc/jxO3HIC4Bo90Dcn25yE7jXJec+yzvn4YQnV5mGxWWqJbn
   lBMUTWMhE+NeAD2zhEiA72b/Rn/+0Ruh/lOODzsVSF1w5BBTtdSc0IZJE
   J395wVG6jQDXJnPA5taYK7O+0Q6oPZbt1HDNY9OV3RZJZxdH0bkhCf+h2
   I=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 116632608
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Il9uqKpVsnR5XUbYSAxfPmy5S7JeBmIKZBIvgKrLsJaIsI4StFCzt
 garIBnXP/zbYDGmfNpzaYWz8E8E7cDRnd83S1dv+y5mFC8U8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAoLRS+Zp86G+rimDfhvwf58K83kLoxK7xmMzRmBZRonabbqZv2WoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OraYWNEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtMSubiqKY66LGV7l0QUyUQWX6GmKSSk0GBXskCd
 xwMyDV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0QMjUEbCpcEQ8duYC8+Mc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:DKSsXaFDA6mG1391pLqEN8eALOsnbusQ8zAXPiFKOGBom6mj/P
 xG88576faKskd2ZJhNo7y90eq7MArhHOdOkPMs1O6ZLXTbUQiTXf5fBOnZowEIQBeOjtK1vJ
 0IG8JD4bvLYmSS5vyW3ODXKbgdKKTuytHSuQ4L9QYOcekXA5sQiDuRcjzrcXGeszM2YabRva
 Dsg/Z6mw==
X-Talos-CUID: 9a23:JG0LpGAaWlFUn0/6ExNh33EOOuwVSHfAi2bTZHXnDmJmWrLAHA==
X-Talos-MUID: 9a23:GheKoApM//Ett/DKIssezwBhb/9u74GTMR0miJo5vtLZaXxoCSjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116632608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+8SAMUVju0Ti7penZQRQh5E/DZm4Sp40O1Wcine6qk2yv1EF2tp3R0CQr8WskWzJyyWIMbonSDkbUkZNZM3DhRQ7oFhcwpHimgGBexM2gfM6X4jgBNGbeD+QkMtnZrKkxRoMK8n6PHdGKxzSJWMXzAF6xVq7GXnGuLZ3S8p9cShxXjzoOngG/AyrXsvE61DSajtKm4fzgOrvx5Iz8/tytTX0cuGWkj6UzI/X+sE1PugMr/USvdzaKGUbUH7EC5z1V0LYdxl+VI89mnxQd5/JMsMGYOlxdr1rKoiN5WBC6UasQ+sflh5xRVpLcAd4VSHCFLk+NQAaHWOPboMXJOagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32viBMl9EE/KLt7NqlmidMJwmBBTveQsFg2kp5PX+2g=;
 b=D4tFVEiq6grkyoOg3SRGZeXgAJz+0MEO/P+vciTw6lfoHYHoWHuQMQ1LVv67F1RrR9II20hdR/gVFGO/Do2cLXJafOfeSCECHw08Sr42pnNsEF8yDTh/tm5GyhxXl8e116zERpswUdjV0F+eIBilfgB0Bc2jq8VoGvtKfeAi0xY6PAxsNPXpG0ZKw9U0Bk4muCsr1yNhqUFHkK9G1/E8NP6pJxCaR+hAuI4X6RtsULLH/hdHcIMZMQDyZgWDoeOD05kMNr3AOtG/X319+2W0B4GZd314lujhhtnck7dLKqmS4goIaOshTNI5TXBw2leTrASHcskSYdpTKHCottjm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32viBMl9EE/KLt7NqlmidMJwmBBTveQsFg2kp5PX+2g=;
 b=eYCWMVeu6wqRT34HT6pKqfwk6TfJ4QrpUd2LGaWenjTN95ibi9emaXx1i2j+P+f+WjaO1cxNv7Iz+ue1gdYr5yvu/u4WRRMjZbUE2Bf2oFWkqoHpei3vGEa0LFtrHJgZvDeiWbGt3uAwTtFJKSBNbjNBs1NqraCbOGP5XEDx3xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Jul 2023 18:06:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/5] amd/iommu: force atomic updates of remapping
 entries
Message-ID: <ZLgKBKdVh_Z6i4e7@MacBook-Air-de-Roger.local>
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-6-roger.pau@citrix.com>
 <824bb5f9-7bf7-9482-ca35-e4d1019ea7bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <824bb5f9-7bf7-9482-ca35-e4d1019ea7bf@suse.com>
X-ClientProxiedBy: LO4P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b1a8d2-b770-4b05-312f-08db88721f4a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPStdQNB2a7NdSiSnRr/yBohFmX4MivfD1CDAnmPQHJ3AulZezlU+5faDXAEiCLPo3ZgWePHMDofOlpj9QhhocOwiypCArssqzFUdL+vOIUYCfpIuTK7bESv5VTkuSdbOJCHUTjQLebQHEPLMRBFHXyBVECRuQ/CJCcz8yLGsqNT+lpxe0YlgSmQnWNd0h5468jzNood20C60yu2DZurBBh8qT5NS8cTrbG8UfFtMaOzAMdg+Z8jUkStxdzBTLDo6PhD51omLVYc8PBJRjlkHCbBLB5aJUPRro9DVgwZrx8fVe2l3pLlWgmTNRspZP31Bjmjk51SNLKcCsXAQCzlmAarAe3BzuZ7W/5nROhyWmVJQ/jgVzmSXlHqTnp6QjpMOPOw1GzPnf7CJEZDq4bEe8gHgOgKoV1mkZJtwbRKjPwG5D5BC0dipEmAEfWRKada9El/JmKmPFi7ER4cHIZJoTVQZ+ExS9JLtGkXELgKrGrM5zP1ws08TZesLqVipWkmWRDSKYRhNYi8w3qmGBwMQde64C3tsNrOCZOaLADALO51tihI/fy3zMxoTXZ250LK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(2906002)(15650500001)(478600001)(41300700001)(8936002)(8676002)(66556008)(5660300002)(66476007)(66946007)(6916009)(4326008)(316002)(82960400001)(85182001)(86362001)(186003)(26005)(53546011)(6506007)(6486002)(83380400001)(6512007)(9686003)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25WK3Y1Rm9OZlRCVVlSbGtXVHdqUGx4TkkyREdjTUVDd0k4dDdLdE83cmpy?=
 =?utf-8?B?aFpRbzVwVzNvUFpMdVVnQ1BoTHBmUHhuY1VqdHE1Q1NKMFhlamZHQktQNVN2?=
 =?utf-8?B?OGp1U0ZzUWg0aTdUYVlNSmFENHJQZ1JMN2dmZ0ZyUkxKcDlHSFpxT3QzKzVZ?=
 =?utf-8?B?NUwzSnJLd3MvcWVXc2tZS0NUTnVpWnBiZ0pEY2hleGE0SUNQYjg5UlRqTVdI?=
 =?utf-8?B?S2JYQmN6aUZXMU83SjlyeExrbWVid0pFcndQMStPd0JDSUw4M3pqdVdaVFRN?=
 =?utf-8?B?RHQ2MDJZbHJsVW5PNnVBMW8wVVNMdlZEa2t3RFp5UmRHNUt1d0lnd3gzVy80?=
 =?utf-8?B?Q0N4K2ZXdTFOMEJrVXplOVZTdGgzOGlNNnloYlI5VVFGb2Q5cW4vTTc3eFh2?=
 =?utf-8?B?Nkd4cGhKQXFJYVhkenh1SW91ajZwci8xbmovRWJFbnVuYzBCQ1M4ckhtclhQ?=
 =?utf-8?B?U1ZITmRRdlVvdENrWlNBeWtteXJDQWhJNkl3Nlp3K2VTeGxaQzNRM3M0R0tO?=
 =?utf-8?B?aHhxYXB6THlEdzRSUzlZaFIxK29KT2VzTkhDKzhiYUY5Q3FiVzJUODRqU3FV?=
 =?utf-8?B?TjRrR1daZFFrODd0TmNtUFdCMkd1QnRTUVRCdHY0bUJxcEpLdXZTRnpyREwr?=
 =?utf-8?B?NkN1OWtuakdERHZwTk56cXVGNDcvNkdDQzAvWVZDbHBTbis0VlBiRzE0bFdo?=
 =?utf-8?B?c3Ivd2NFZXlqbi9WNFZ0WDB5dEl2Unl3NXZvZ0VmdTlKc2pDT1Jnc1BGWjBP?=
 =?utf-8?B?VHFEL3Nqb1Q0dW91RDJ1cjJ0VVNJZzhaQ1ViK3Fva0ttSWphQ3BkN2x3b2Y1?=
 =?utf-8?B?WmRhOERaS1lqMHdTQ05hYUlRZk5pQWZQNjB0THlpZFFIZ09rTE1kNWI4eHpV?=
 =?utf-8?B?L1QvdGFZQUtwOXQ1aHAxNWtWRTNrN1QxY2gyQVhyT1FWVXJhZ1FGZXVmQzRv?=
 =?utf-8?B?WDdHVUFvcWRlV2paektVOTRSUUVvQk1VdE5MSFBPcWZYejdTc3ZwOXphN0U1?=
 =?utf-8?B?QjkxaExLbVQ0RFRkVEd0L0cvZzRJZXFzbmU2ZlQwZHRHQjExaHkyV3JzUU1v?=
 =?utf-8?B?ZXc3SkhMSmR1RmRUT1RXc2VVN1E3Q1REbVkrb0czaCtMSWVtVnUweTkvRFp0?=
 =?utf-8?B?eDZDaisyc2h2M0JLNnhkektDbnpPMmFuODN5NjFrTURaU3NOdGZVVWpmak5y?=
 =?utf-8?B?cE1OanRjaDljVXlZdFFvWXlQRjRSRXBZZUx6WTlnNHVuTXFRVTdRYVMvMlBU?=
 =?utf-8?B?OWhQenVkZHp1MEJKSlFiZWVXemMrekFnSklzMWNZcnVUMkpYejZSYWpGVzNU?=
 =?utf-8?B?anJ0clhCSVhvWGJCNkNIa3RZc3FqT1RBT2JjbTJkeEkwT1J3cVU4d0VUVkF5?=
 =?utf-8?B?bmdBVTV5MjBxNzNDN29iSDNnZERuQm5WL0thZWFOWnRrRGl2TUY3Z2FYVEx1?=
 =?utf-8?B?QSsvV2Y3SGlvZjBXbVFmeklpWXdDdkJmMUdDTmZuQUhmdVN2S1ZhSkh1RzJZ?=
 =?utf-8?B?V3hiTDdOY3ozRGh3ekI5K3U3bmdTbnFhdFB3aFJxMDZwUk1oaHhYMVJNSXQw?=
 =?utf-8?B?U3hpYlBiVXVHc3ZhNWJBRCtLeDFMWC9PQzVFc25oakJ6dGtjeG0xVUdhaXUz?=
 =?utf-8?B?aUZZTjN0blhBNUlsQ3k2amhMRXl2amdMaGRsbVpBMTFNQVRRajJZMkVmNTNV?=
 =?utf-8?B?cHBjdGFxWWZJZkp2bG9UN1cvdDN0T0gxRGR3KzN2Rk9Pd1EzZW00b1lYRTBP?=
 =?utf-8?B?cWh3enBZcy8zdXI1emxxbDV0WEtMWDRIT0haaHFDYkoxREhiK0FYTTNBSWZK?=
 =?utf-8?B?ei9NbzhGZWxCQTVaT0pFdmJwMUNSWmgwYVF1VTdnK1RjZmJ3QmZuSWErMS9P?=
 =?utf-8?B?Z0cvR1ZBbGNvdlVKZUdseWl3dUpGRE50S0lhOEhJalNKVUFPUUdTVjFGWFBw?=
 =?utf-8?B?SjZLNFduaHlxK0FIRDV6Zi9VOGdpSmZlWHcwQmZVdDRxOUJCNzlOWTNZN01t?=
 =?utf-8?B?cVlUOGdRUUtSaTRKVjk3UW9PUUxrckFyaTVsUHN6M0ljTEFNbC9KMGJLZzY3?=
 =?utf-8?B?MTl1cXF1NHQ4Uy9CKzROZitzNFkwb0U0V2h4bDhZUU90K2NId0xEb3MydXpa?=
 =?utf-8?Q?rULkEza+tg231j76loqSOV2tM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5rVhgTDQrkv+IJbyT+nqwOhHcsxy989AANdrpcsmUJs9op5l6Uk4NEj/vk5Xl22JBC80Ji3bqwtMDmRjK+B+pGdOrIhsZasZqBsgh4I/0Zh7HXYi5PV0peWcV82cIDofk+Kl9oPTauugePRBLV/lWBzIKtinU+gurVMWprGjd9giEPlpZEx/OUDOcCxjkBBBu5NTQtijX5tWsyJj50OluYRL4bnTQO2cjeR3waLAW9vnWCIZ6JCIAeUSxUNxQMMcbIKguCtzLtyMy+T1qEuNcq0SZfyFRBfRXc3dYkFYhGnEnDWNd32Qr4O7DKAms2jrSbZelpfVgRTFsXhb6r2SwRMKLkQu/KeEzovcDPALVWdXOjZpE9GXpTGCau7a9XvvJsvAudWbtFzEu9+tlItDGIhFTwT/+W4fvTrIa3fFJMXKToJfdjLayGR+rMHUqOou46RlUgCVmGp5cDukESiZN4DUpxf73Q8MY9a6QnsZWa4cbwTctikSIK+8/MjNE2hO9NOAoAuS4qrOdTNuQTVYi8EF8V8b+9CnknT8dNoXv/DA7LTurdYGiCSZK2NH5rvQ/gcFESesUMtsVutUFyVUln4gk+NM5+81aGiM9uwn3EM4Qgag30DNou+QRi27kId++9Ese0Avu6vpdc+KIbgKjhRrheU3HDnxTtvitAaAw/a3mJSzqQ/OnCvVYCgmsb4muUsWPKBQlkZK72DGkXb8fo6k7MTtuc+1zAwmXWWM/ZwC6vQntNTDKGYPjFH/9aUdsR73zJkZgyv/fE61KhfmlilY2opKiOBD550abDPzZdk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b1a8d2-b770-4b05-312f-08db88721f4a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 16:06:33.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAxVsGeSJFzCC3IFFiJPcwk3CLAOVNd6Cd1Rr/R1sHXBL/PuZ9haciO8W/w9t0vVR3zL6wFP6NYJU602893RFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5186

On Wed, Jul 19, 2023 at 02:46:49PM +0200, Jan Beulich wrote:
> On 18.07.2023 14:43, Roger Pau Monne wrote:
> > Disable XT (x2APIC) support and thus 128 IRTE entries if cmpxchg16b is
> > not available, do so in order to avoid having to disable the IRTE (and
> > possibly loose interrupts) when updating the entry.  Note this also
> > removes the usage of a while loop in order to disable the entry, since
> > RemapEn is no longer toggled when updating.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > x2APIC support was added late enough on AMD that CPUs that I believe
> > all models that have x2APIC must also have CX16.
> > 
> > The AMD-Vi manual contains the following advice in the "2.3.2 Making
> > Guest Interrupt Virtualization Changes" section:
> > 
> > """
> > If RemapEn=1 before the change, the following steps may be followed to
> > change interrupt virtualization information:
> >  * Set RemapEn=0 in the entry to disable interrupt virtualization;
> >    device-initiated interrupt requests for the DeviceID and vector are
> >    processed as IO_PAGE_FAULT events.
> >  * Update the fields in the IRTE and invalidate the interrupt table
> >    (see Section 2.4.5 [INVALIDATE_INTERRUPT_TABLE]).
> >  * Set RemapEn=1 to virtualize interrupts from the device.
> > """
> > 
> > However if the update of the IRTE is done atomically I assume that
> > setting RemapEn=0 is not longer necessary, and that the
> > INVALIDATE_INTERRUPT_TABLE command can be executed after the entry has
> > been (atomically) updated.
> 
> There's one additional prereq to this: The IOMMU also needs to read
> 128-bit IRTEs atomically. I'm afraid we can't take this for given
> without it being said explicitly in the spec (I've just gone through
> and looked at all occurrences of "atomic", without finding anything
> applicable to IRTEs). If this can be resolved, I think I'm fine with
> the patch.

Hm, indeed I was taking for granted that the IOMMU will read the entry
atomically.

I was also worried about the IOMMU caching only parts of the IRTE, and
thus even when doing an atomic read of the full entry it could still
get inconsistent data if using previously cached parts of the entry.
The text in INVALIDATE_INTERRUPT_TABLE seems to suggest that IRTE
fields could be cached on a field by field basis.

I will raise a question with AMD in order to try to figure out whether
the IOMMU will do atomic reads, and also cache the full entry.

Thanks, Roger.

