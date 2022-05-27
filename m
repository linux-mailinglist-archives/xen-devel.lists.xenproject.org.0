Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F774535D2B
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 11:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337888.562593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuWAc-0002mz-75; Fri, 27 May 2022 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337888.562593; Fri, 27 May 2022 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuWAc-0002kh-3l; Fri, 27 May 2022 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 337888;
 Fri, 27 May 2022 09:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPF9=WD=citrix.com=prvs=13986a4cc=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nuWAb-0002kb-80
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 09:22:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a1c3c19-dd9e-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 11:22:07 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 May 2022 05:22:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB5985.namprd03.prod.outlook.com (2603:10b6:610:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 09:22:02 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 09:22:02 +0000
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
X-Inumbo-ID: 7a1c3c19-dd9e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653643327;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Y7cnfL49MxddWrHgfBeUq8LqIlaN9rLv+4akuf/mndg=;
  b=ftIk2OtF+qLOCk4bGOaK2eYL9crLD8kJUXrwUNpib3O0YOaDmC5lY479
   PfwkgR02krx4HHl8pfqQ3BOwLe7w9hWnzKOmbKoU9StAfydzMYnruLh/7
   L3qgCmx7Yjn944HXHCgJMqb4MrZClYPuADs0IhQQdto3TEDmm7T5OUtn0
   Q=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 72710212
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k4VWMKoymdjey0MQcCZUTFgCNvVeBmIUZBIvgKrLsJaIsI4StFCzt
 garIBmGaf2LY2PzLo92bIqx8ktSucPRxtY1GgNtqH00Fy1D8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 4yq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPPXTxtYHdCNhLzhvF7EFwJaeHVa0vpnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2Z0m8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//VuuzKKlmSd1pDdasjHR4SjAv5eh0vFq
 E3b3FreAj0VYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGaNoxo0S9dWVeog52mlyafK4gDfGmkNSBZAbsArsIk9QjlC6
 7OSt9bgBDgqurvFT3uYr+6QtWnrZnVTKnIebygZSwdD+8PkvIw4khPISJBkDbKxidr2Xzr3x
 lhmsRQDulnatuZTv43TwLwNq2vESkThJuLt2jjqYw==
IronPort-HdrOrdr: A9a23:bMrMfai31jK5basUEcwJtjPz4HBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJvhSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lwdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNMN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 D52+pT5fVzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCLa/fI8SjvwQ6Ce2sRG2MiaPLo18bAVpL
 PtFHtliE9aQTOaNSTJ5uwHzizw
X-IronPort-AV: E=Sophos;i="5.91,255,1647316800"; 
   d="scan'208";a="72710212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIS1UOhZAfDTBSzwYgvmdQOK4jj9PTBbOBtYn22mt3EsX/B2LVXr2mm92M/X2uJIq1P762/gzEK9/A3NVDe2N+qilDpzhZGBixkWB1G24Y6hJmglbnXXygLaBWsQN16a2W/6rzHKJyvRMftNLmb0rKfRf11XDvO6tdyKlBZ14XQ/ynBXERFXztC/cwKSwfq49OhkBY2xzzvRyPUWsuT0DbATrNHocnACI1hKyo54qP9MnIpUJrzNJzlpVU4nVovXCO9UG3U8hsiGlLNsKhwuOLOssdN1nm/P7gLr2bCrR8O3fSZlT/hrmxpwHHm5FatqvycY6xz+bRNhIveRz71vUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/c0EVtgr0egF1R26PpifX+1MWhvkpqtba00TRrCMDM=;
 b=kHjkX6tRPdoraIT2ixNnuYz+0m1+BKwotuelXP0v1VFq++dll/RwEb4i8LfqzoTFv7IeCMlG9Rcv4xwd+WwmJNo2qesH4Ip7Saz9J7W8w1blLlnDUxykJqr6NNtaNheCvIskp3Z/m3N8PMae6z2c041mMGOws2NTpHPCZrDLfSsrqIxUbTszu/FtvUcjhYfceGgQISI1yevBlzxi05q2MDRw3nGsjZcovWgK9s7LExEbQkBaqH17xXJBs2rQqwrbnWWjq3fjJUgBOFDNFjT23i7o+GtCBnuCz9hq3fVr8p6Wn66PzNYpSCNgTiwALWV1doxon6CE/wcDV30+qxwD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/c0EVtgr0egF1R26PpifX+1MWhvkpqtba00TRrCMDM=;
 b=b+FO/xy+s7RlQkJiThbd8uNUV8gUmCl2s6cCCOM/LKbCRXCJmd4kjruFB/xMBO7/d6jHYVP+LGwfzi7JNVGQL+MJJWe9hehKdwBHiACkHeFZ/6wkcpNN+bE1lXoVabn2sQ/LbiEkjIUVFJAZn+6qSE5wDdxON/cO9rdJNGWrIHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 27 May 2022 11:21:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Message-ID: <YpCYNTpo1ssAW+dx@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
 <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
 <Yod3vjK44nfgvw8f@Air-de-Roger>
 <bfe87358-db9d-7c9e-d691-aee33f07bae7@suse.com>
 <91536f56-a94f-273c-4364-cfd5a24078e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91536f56-a94f-273c-4364-cfd5a24078e2@suse.com>
X-ClientProxiedBy: LNXP123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 233512b0-4dc5-44be-40c6-08da3fc25ba4
X-MS-TrafficTypeDiagnostic: CH0PR03MB5985:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CH0PR03MB5985B8C77A237B6C93E5D4138FD89@CH0PR03MB5985.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ozf3vTKBjg6dns6et0wXwIiRCAbR8A5b3+iC/d9uQlgjZI9OCkDCapZXPXXeYAe246Cq04Nun01rdZIVGLJGL+3FMhCsj9wQQw6NMLaBndILlqhhfPEO7OjdUg9IQ4STkDaDSRw7IwCte6pA9+HrOuaVfvJ8Fdcgc7yJBPq+MlZc07XlCoTNd5rio+0kS9XrvlGm3eAo+K1sKpCD0//qKyiIsOFcKd/ITByHM7wghTP0wwFwkc6wrcJlZiFkxsBTxQvL748qJJqYZz0TTAbhPwmgX4qvJN5QYOJOufB8u5IR34Me6gubUrYRhHXnWcp9HbCS1EGbIsyh6SNsHwkZLCfYZu0UhvAWEFzdnieIYJJ+XaYDVdVZb79SyIHfhuFNY5GxMB+2vbq6t3WYuq93aBMV7m2Sy28VL36tBjgR+g6Y5Gkw/tlWPRP3RbqaqAkeeGMbagGydT3m0IYFD667AkNxMXnmKOb69NabhAJRUTcT1e39pElFBp7LntghmnyOACQI/bxFaL65FMxhKSeFvSeYrnZkz1Qk5zwdobqHxUZFDVJBAhRAwXlbdPP4W5Xh3qJKzSvh1/t1GIkZMBaQceuln3irgerEnVsvbR+RkH/MeHzSs/O97FP8bIux7CGZRRCezIulSnsk7fC6nNkNMlNNIKx3VrUE2WGAeBFp47GX5J8MrYJ4/xeDBsoom6PBpYeMc9XnsAiVIfsnMcnIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(2906002)(82960400001)(8936002)(5660300002)(86362001)(6486002)(6666004)(38100700002)(53546011)(83380400001)(6506007)(26005)(9686003)(6512007)(4326008)(85182001)(186003)(6916009)(54906003)(66556008)(66476007)(33716001)(66946007)(8676002)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmNUckNLMWxoUmlsY2F0MlJjZ2NobE5ONGRCSnF6cllZM2owSXZCUm9tSDRH?=
 =?utf-8?B?TUcxaDA3OFpEcE52aUpDbVVRWDUzNTQ1Mnp2dUpXcjZyOVZ5aFZ1T3k2TXZT?=
 =?utf-8?B?NFhhK0sySjE1OG8vZ2tXb0VSNi9ISkRIME4vZVZDZ0RLY3NnRFY1eGlxcDN0?=
 =?utf-8?B?U2tGeHlJMVVkOGc4clE5MzJ3YTB3emV0bTRkMjYwUUlMZGxuWkh6cjdnOXpS?=
 =?utf-8?B?RjRLL3RDVTU3RUZKclN3WGtMT1N5UE8vVW5qRDNieVo0QUVIZWVMaUxwZkxo?=
 =?utf-8?B?WThsckh1QjJwaVZLOFhXaUk4NjE5M1Nad0dkUkxpNkVKajZwM1oweUc5Vk1X?=
 =?utf-8?B?WnpMTkpJN0JUME04WDZYS1A2LzVhUDFEMWJsZU41S2cwK3VZOXZVaVp0SHRK?=
 =?utf-8?B?cjBMTjVBNE5iVmZsODg2UC9XOHN6SEZIakJsdE1BYjRjTjVTUTM2ZnZ0dS9w?=
 =?utf-8?B?ZFdTdTlRcEE1UkVSQkJWZWlWL21TTk5wOHZLeTlpanhxVk52SWEyNnVDUzly?=
 =?utf-8?B?VWdXaUh2cnVkUVhaTTRkZXk1aTNyb09va2gxaytqM3Z4bVZFOHZqV1g5bUhh?=
 =?utf-8?B?VytNQi9TV2xIbzhpY29PSzkyNTNheExibVlsbGl5WlNGZjkyYmk2cXA2NjlR?=
 =?utf-8?B?RWVlZ2tOUmJVeHdYZFgyS1Q2NUVoN0hic08xWG9Ha0VIZUVtOGxGTTkwcndH?=
 =?utf-8?B?NG44RWx1bXpWV2UxZHptazh4cEo2aUxnQ0JWWTVaQ25mZEtobk5yNTNvcTg5?=
 =?utf-8?B?WkxzMS9FNzYvQUs2WHVSS2dLc1NuYlpoVlBQbStjcUtrVXhvdmV2SXVxWVhP?=
 =?utf-8?B?YXpESUNVY1p1K1lLU25hcG5tV1hQUU1yb0pqcWNtcU5lSy9nVzNtNEtzeEpz?=
 =?utf-8?B?WUV1WFV1eWpDOEhEL1ZwUXQ5V1oxWjRURW16ZU5meEJNcE5obXZsOWRzdWdx?=
 =?utf-8?B?OHJLZjZmcHp0dmxSRUNuSSs1L3RySHUrUGhSRDNzUzFDcHcrQTJWLzBrdmxx?=
 =?utf-8?B?Ym85K1p4ZWM2L2dwRUlrYzhyd0hKa0RUcEVraXMwMzl3L001dUxrOXQrUUlU?=
 =?utf-8?B?MjhoOFZ0b3UrcThtVGF5OTB4eFpUa1FseEFBb09XRUxnRUd0bjRDaEdscTJ4?=
 =?utf-8?B?OWY3ZjFjT2xFMW5ORVd5WUVZTkpEaFV0WmNxUU8vSHRrS054TUFwS3M3a3ho?=
 =?utf-8?B?S0EwUTB2SXFMNUl0a3B0Rjd0L0ZyK2J1ayt6OWtGY1lVNkdReHUvZHRDVFVj?=
 =?utf-8?B?NkduTkViVE1aVWdBMXR2NnI4MnBIRG10c3UrR205WVBDV3F3bnRkYmREbklK?=
 =?utf-8?B?eUZFcitzcjNyemlHaXZNS3QvYW5BcThhZGdJcWVVbWRBN3RuV3VTb00vMWZL?=
 =?utf-8?B?bUtxSFZRMW1jamE5TG4yV05WZC9UMTNtYlpOdDBpb1hGaEtObHZHMVA5aFk2?=
 =?utf-8?B?TWpranIxQlBWNHgxMTRJRXBDL3BxbWQzS01pZmE2Rmgxc2xtbEJVVi9obHdB?=
 =?utf-8?B?b0ZuL1lSS0kvRklWaUZlVEdsWVowdXo4OENSRW82U1FLVWs2SFpyVEhSOXdM?=
 =?utf-8?B?T1NwY3daNHQ1bGlBZ2Riam1sQXVKcjFqNTJJTjFXM1RjMitxM1o0Sms1Snl6?=
 =?utf-8?B?SWQ4RWN0Y3d5TGkxUXJlSlRSUHU1dkxLNzhnVWJ2Mlg1R1ZCblVlTE9saE1n?=
 =?utf-8?B?aUl4M2JhTnQ2R3owWVd0eEdjS3hqUGxLVGhFLzM5aVVkWHhpVUg2VDl3WUFm?=
 =?utf-8?B?a25jTHpkVjNuYytqYisxRmtoNkRqR2JlOVNQaytXY2JpRzNFZkJaUjNGaGJF?=
 =?utf-8?B?enhyc2NBRC8zVFZZWGNlaWhVTVRpZ1NBWEkxbHBHUGZ2dStuRk9TRUlVWGhj?=
 =?utf-8?B?YlgvQ3QwVUxtVjJScVhqVnlSQXpUWHdpREU3RXBjOURYUXlRMllnbVlSaVVO?=
 =?utf-8?B?Q2ZIQWRSeDAvajZlaFJ4ZWNuRkRCMlJSZVA1NnMxVHNKbnU4UjVjTTJzYVFu?=
 =?utf-8?B?blllUmFIT0l3aTdYZG11RVpvOGdyWUdPTHNWQzJlZEo1KzZyTjJOWVdqYXUv?=
 =?utf-8?B?alFsT3E5UDZtUkU4UG92cHFPWWRjbWlnNVlZMklSZDhDaWRsazFYblR3Nkg5?=
 =?utf-8?B?K0pqQ2ZzOUptZnBjbnJPNERCOVlmUzlRd2grbWFtZUVyYXNDamUrSXZveXlD?=
 =?utf-8?B?VE9RY25jQWxkdTB6ekJ3VjdkMlFZZjc2bG9nR1V6RkkvdEgvbmdxZHpxa3Zu?=
 =?utf-8?B?YjB6eSsxSEM1ZS9SVXE2d0g5YnU0REc2UXg2a094TEtjOFlkeXhLSW94MGtT?=
 =?utf-8?B?SVZjSzdmUzZ1Q1o5VzdvNG5JcE9VN2UrSWMyZGlQb2Jram50blJ4WUVvajA5?=
 =?utf-8?Q?2MAGZvyZh/HrJwTQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233512b0-4dc5-44be-40c6-08da3fc25ba4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 09:22:02.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKTz0HT3HWz5KXW7KmUI5LAtkU2bz5L5W2kBW+ZdLZglDzkBSN6CWZ3gFnqrMU8yDMSJ1+eb4rdTEgHgYS+kKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5985

On Fri, May 27, 2022 at 09:53:01AM +0200, Jan Beulich wrote:
> On 27.05.2022 09:40, Jan Beulich wrote:
> > On 20.05.2022 13:13, Roger Pau Monné wrote:
> >> On Wed, May 18, 2022 at 12:26:03PM +0200, Jan Beulich wrote:
> >>> On 10.05.2022 16:30, Roger Pau Monné wrote:
> >>>> On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
> >>>>> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
> >>>>>  
> >>>>>      old = *pte;
> >>>>>      dma_clear_pte(*pte);
> >>>>> +    iommu_sync_cache(pte, sizeof(*pte));
> >>>>> +
> >>>>> +    while ( pt_update_contig_markers(&page->val,
> >>>>> +                                     address_level_offset(addr, level),
> >>>>> +                                     level, PTE_kind_null) &&
> >>>>> +            ++level < min_pt_levels )
> >>>>> +    {
> >>>>> +        struct page_info *pg = maddr_to_page(pg_maddr);
> >>>>> +
> >>>>> +        unmap_vtd_domain_page(page);
> >>>>> +
> >>>>> +        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
> >>>>> +                                          false);
> >>>>> +        BUG_ON(pg_maddr < PAGE_SIZE);
> >>>>> +
> >>>>> +        page = map_vtd_domain_page(pg_maddr);
> >>>>> +        pte = &page[address_level_offset(addr, level)];
> >>>>> +        dma_clear_pte(*pte);
> >>>>> +        iommu_sync_cache(pte, sizeof(*pte));
> >>>>> +
> >>>>> +        *flush_flags |= IOMMU_FLUSHF_all;
> >>>>> +        iommu_queue_free_pgtable(hd, pg);
> >>>>> +    }
> >>>>
> >>>> I think I'm setting myself for trouble, but do we need to sync cache
> >>>> the lower lever entries if higher level ones are to be changed.
> >>>>
> >>>> IOW, would it be fine to just flush the highest level modified PTE?
> >>>> As the lower lever ones won't be reachable anyway.
> >>>
> >>> I definitely want to err on the safe side here. If later we can
> >>> prove that some cache flush is unneeded, I'd be happy to see it
> >>> go away.
> >>
> >> Hm, so it's not only about adding more cache flushes, but moving them
> >> inside of the locked region: previously the only cache flush was done
> >> outside of the locked region.
> >>
> >> I guess I can't convince myself why we would need to flush cache of
> >> entries that are to be removed, and that also point to pages scheduled
> >> to be freed.
> > 
> > As previously said - with a series like this I wanted to strictly be
> > on the safe side, maintaining the pre-existing pattern of all
> > modifications of live tables being accompanied by a flush (if flushes
> > are needed in the first place, of course). As to moving flushes into
> > the locked region, I don't view this as a problem, seeing in
> > particular that elsewhere we already have flushes with the lock held
> > (at the very least the _full page_ one in addr_to_dma_page_maddr(),
> > but also e.g. in intel_iommu_map_page(), where it could be easily
> > moved past the unlock).
> > 
> > If you (continue to) think that breaking the present pattern isn't
> > going to misguide future changes, I can certainly drop these not
> > really necessary flushes. Otoh I was actually considering to,
> > subsequently, integrate the flushes into e.g. dma_clear_pte() to
> > make it virtually impossible to break that pattern. This would
> > imply that all page table related flushes would then occur with the
> > lock held.

Hm, while I agree it's safer to do the flush in dma_clear_pte()
itself, I wonder how much of a performance impact does this have.  It
might be not relevant, in which case I would certainly be fine with
placing the flush in dma_clear_pte().

> > (I won't separately reply to the similar topic on patch 18.)
> 
> Oh, one more (formal / minor) aspect: Changing when to (not) flush
> would also invalidate Kevin's R-b which I've got already for both
> this and the later, similarly affected patch.

OK, so let's go with this for now.  I don't have further comments:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

