Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA45EF46C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413675.657481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrr9-0000cw-GU; Thu, 29 Sep 2022 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413675.657481; Thu, 29 Sep 2022 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrr9-0000ZN-DB; Thu, 29 Sep 2022 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 413675;
 Thu, 29 Sep 2022 11:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRGE=2A=citrix.com=prvs=264d7c073=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odrr7-0000T0-O4
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:37:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 181cbee2-3feb-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 13:37:28 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 07:37:17 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 11:37:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 11:37:15 +0000
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
X-Inumbo-ID: 181cbee2-3feb-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664451448;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ycxZwFHCB931tFqyjgwca885edihkPfYOhlxs9d1eEc=;
  b=DtNXrDE+BQrjLXAZOKDKH4ti7L/I1hLCbFKpTquFP6NUfe+XGdQbIqWr
   YLIhlrJKf2Q+2oqPqvQYXa6bi5ihCAc1GLZmOBYUEAPoJ221HVyC/PPIc
   34W3s579unJueKB0N2XLSKAf3qTY3lR8sGmmGxdj7zV4gtkHVhjBzmhsn
   4=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 80737034
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0TkOMKyKMHD1oh+Ppih6t+cAxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 DNJWGrUMvbcZzDwLYsgb4mxox4E6pTRytdqGlNuryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFsMpvlDs15K6o4GJC7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4PduByZ16
 cEhczVcdwGOnN6Ex7SxRbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqi332beUwUsXXqpIEKOX2cd7oWednE1QAhgaRErlpr623xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU3313peZqymjfxccK2AqbDUBCwAC5rHeTJobixvOSpNvFfCzh9isQzXom
 WnU/W45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:nITTb6w4v9TXPWnzmx41KrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W1Dk1ZrsAxciYoV9MNOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.93,355,1654574400"; 
   d="scan'208";a="80737034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz4TSSKIyuzLxCVuyn4IN8IhTbisufBU9W3Yk9Z/Bl1CHgqwc3Snq0JeopDqVbYR2Iii8wmDTa75zN4WlXiRjkcLjO9twN5knfBZvWWU12y76kK78W1803P4QhvdJT+B/gXogO89P5i/4Ii8+Zbg6TgZ9I0u5/ZqcSKpksfuvvj663uMDwr8l4Uk3sOBALfMUEqJ7wF/NAVIY0W+IwBYMq1POEr6ZZGUGH1hCPRBfLFDETPCsrT22uATFQ3sCkYN+xnulNIRR4R9eOtzJJ/r+AeEyGOX9r9ax8CadkkuxOx5mXV9YjnHQqRiY8mXqnJ4j/MjLSZhBK1zjXkeVexPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCtmtNtTvmJofNZPAWpDFpE1cdKbChfHB56VffTLgGo=;
 b=kVJwFYr/JP/VxLuC6GHnUQNVtEWykpqnqD7v5TrqRnMzAX7XlphS0O8b36h0NAzvF2AsnlOK8sXj/xoXxeKmLNYXzvCLIg9o9Y/bPLwCaRjo3SVTOFYT6iViWBUcwDj460uEY9x3MRGBdSa9JvZHLBkkN9NadhKOsk80pxnFZn3k6fAkW4aMg5yFghtQwFyxnqa+laBMTR8IkYVVbEKUOgdRMmIm8nWetztb+Bap/hgUHvWAorWKhi9pTUFWziygumf0yHt+6nU1TQLczXUmuH8kfRkT6TdRBRx/JAPrQzv3LdVY/YMK/FjqtUipU8mEtoEGUm5Hzd96ikkdVD0IAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCtmtNtTvmJofNZPAWpDFpE1cdKbChfHB56VffTLgGo=;
 b=vtuxBkIy7HTNSM+V9I0vn9cxLOv63LcSxg7Aq2mpecbilUUVbYv1YeGO12XrSE9q7OMYAvAFxm8wn+GBlhcw25r17ThNxEyfRrnf6ZfBk2VQ8fpIvg2J3uwNxY9fsb4sUiLnGNGKfIFpyxEPTJ7Soj8aSW1Xaw38eOs/aogVnho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Sep 2022 13:37:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 2/2][4.17?] x86: wire up
 VCPUOP_register_vcpu_time_memory_area for 32-bit guests
Message-ID: <YzWDZcsziR0SDGBf@MacBook-Air-de-Roger.local>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7086bb55-c01c-4286-4ad9-08daa20ef551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LiP/byPlsnxHDnkorsvz2q0NkwkmSbs25UiQXTQyqfd561Pe70HliwylLoLSxYcSH1KQGaC+K1cCvWthlemZDLhKIUDuppMDMTRY7eMnwEj8zmSVjTDjgovZjKaQj5jCZnHIyVIGatY8Lbd/rDuwt7lPuH+nToy7WEhdh8fJEopcjJ4Ch6bF+afA/NGxF6nlN2UN7FFuVsyzX3flyOBfsEclkXirF3nDuAXF7zVWEIofbX4r3k+FnWGlk08lIfjuo7tDQg3tY6v7bR1+v1RSob03fCeLl13D47FjO30COaOuCZnYSlGaXYwSBJSC79F8e2jQQ/BSXfNk6oDBsy/n0xwPpVBjA4zB5R2Ec8bXAUEmtKzaJa24xhqi3aR4Yu1/YrtYkTWElJ/1yvvCFVYkJqyOUbxavIhDI1q8YtujfZ5t2o16VlyZwuwVW/AKYfueRNYgZoZBtPuC2vsSWFPSTA4Wv5oJL4Q/0rEuA4EZelOh+Kjkqhg5nK0qsRthgSbqHew0NUc4uhC8xIgsOIRUrNgGpkoszDleyG5z43eW9Snydyiscw/2loDGu4TOvry7NfQETvQ0OlgN0z5vDm3bjJ8wyJeM/YS8mWkB1ImVw4tJS0oiPxK0xLQVwOtpQ86BWCmDtdSWSmcJEzn48TO6teTZNL4eD249lF+Cp5XJSJ+RrPjf4LJpMuM9kxaPAb974tXelml3+rg9/N1XNCmz+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(83380400001)(186003)(82960400001)(38100700002)(9686003)(6512007)(2906002)(41300700001)(5660300002)(8936002)(316002)(6486002)(478600001)(6506007)(26005)(6666004)(4326008)(66476007)(66556008)(66946007)(6916009)(54906003)(85182001)(8676002)(66899015)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEJxK29LTjlFRW81V3JPYjRmVFA2OGwxNTVCTytHcnhtTjVySzRqSTlJRWlJ?=
 =?utf-8?B?U0ZiOXU0Wnh4QVZCY1RTUVVrK0hJdm11b0JkdVlKdFY0MHNLWWg4N25xT3Q1?=
 =?utf-8?B?MVdESVc4TjFhTkdGYTNWeGhtemQxcUJJS0tZSzJ5dFIwL21rUzVYQXdOaEty?=
 =?utf-8?B?SmljdndOeXFnS0hkMnA2bmJBWngxdUpEODRnTkVjamRMQWgxQS9HZzZqSU1Y?=
 =?utf-8?B?dEZUaHpCUG1abHJCK1BLejVwNWRuWW01ZFNhSEVQanRsUXkxY3Y3NlJVWCs1?=
 =?utf-8?B?Y2s1SXNxZHJ4YjUyVjFBREVPbGxVTy9TRHo5azBiSXltM0NMZUVYN0ZKbnVp?=
 =?utf-8?B?WFpxUnR1MHluMHZQU2I4dGRzQzB3Y0RZLzkrUmNIVzdrQ2hlVnltYzlrRzdX?=
 =?utf-8?B?c2loeHRCWHNqTHB5aXM0U0did0lHcE94OXZzSzkxbVdreHRBa3BOa3daUVlq?=
 =?utf-8?B?UXJJeis1MkR5RW5tNkx2ajFOSHFiWDZsaW9ad0RsM0xLUFlQdmJtdnJnUU00?=
 =?utf-8?B?TWxjWmNVRlZaM0dacHBjWkZ5L2pORUFzK1F6UmlUM0RWcXB0RnV0Zm1IUkFr?=
 =?utf-8?B?azFzZ1ovUGpyMnFIQ1lqZG1hMWF1L0JDSDVLcURsNVRPNEpLalZ6UG01YjA5?=
 =?utf-8?B?WXA0TE5SL0lzVHJiVk9JTEVyWTYrbVVicytCMW9nOElaRlZtNU42dys4ZHNn?=
 =?utf-8?B?eVpHRHRwcGRFN2t1TjlSZmpxREs4Z3lwczBYUjRhY2ZEQXJwei9HSy9NQTM3?=
 =?utf-8?B?VDk2cDhiUzB5aGdxNmpxN3BIQ2lKNFYxSVJBSmkwdVgrR3hpaEErbHJlV08r?=
 =?utf-8?B?MENBUXJvRmUrREZua2dnV1ZUNkRLK3lhQUpYQytoV2tmS3BwUTh0dDRhcWwy?=
 =?utf-8?B?aDFWSFpCN0didy9wQ0lNYXpHaTczejk3M0hSK0VPQWllcHhNZlZ5eG1pNzhL?=
 =?utf-8?B?WElIZXd1Rk0vVWRHWVFDMmNtQWxrUk5BbHgvWS93YXJDYkI5dkZCUG5CVEFn?=
 =?utf-8?B?TmNoV2h1RkVJMkI4RU10MzBlYk1VTmJSdjJsSnBGYXZhaUlSbXZqamwzUTFQ?=
 =?utf-8?B?bVJYUnZCRTY4RGlWY2M0cVFOd0Z2OERndzNBWndXZUJCT3Q0d2hZWEhzd2V5?=
 =?utf-8?B?TUxvVHNIVWRMYjErU0JQcmtnQzU5VzdHYnh1eTI4cTl4NUk5Nm9YbXJBS3hj?=
 =?utf-8?B?bmxibnFUSFR2Y2VRMktlNVNVVDB1QlVpbmU0ektKaXI5cUE3TGZKUTc1VHFZ?=
 =?utf-8?B?ZkhWd0pvRkppbTFBSklsaWJwVHNGT3Z6eUhHOVp0YTdGbmd5L3RxcGdaTCtZ?=
 =?utf-8?B?d3lqcytZZjI4R3BrSnhUOVpJTlRrdGs5WVp5bXViU0JtM3BPS2puN0luQ0dR?=
 =?utf-8?B?UGk1MFFya3ljeXFWZGRtUkRQbXUxdjhpaEFuKzl2ZFI1WmwzZFZxTGNydTQz?=
 =?utf-8?B?U0tCdDZGcHJCcENZdEQ4RldlTG5RMVRiMXRlUE94UmNrd2Fmejk3dTZBVitJ?=
 =?utf-8?B?akY4V3RHdHB5dThDTExxTnVoZkh4dWlkcmlqalhkSjNNVFhBSW5HRTlzT1p2?=
 =?utf-8?B?YlhKaTVRcnpaSGdRYVdIVW5ialF6VENkcWlJM1AyMVZ6YldCL2UwVVhEdEFB?=
 =?utf-8?B?cVlyYUpXZTE4STRrdEcxcmx2a3ZuS2JzTmwyQ0ttWE0xSjM2WmpGeGpFdEho?=
 =?utf-8?B?YVBCbDZDaGNlSWh2UGNBaEFJV2pjeWI0YkpRZXRQT3hWZGJBM3BQWTlCUllE?=
 =?utf-8?B?K3VVM2JyL3hoeWh1QnczUnRZVkgzdDdTM3lWeUVrdC9vQjloYThXNWNDZXdS?=
 =?utf-8?B?Tk8vdlAwdENGSk42ZWd4S3VjZDZ4MTlWL0tKY1kvY3VmN3UvYVlKeTFtY1Bn?=
 =?utf-8?B?SHpLbG94UExhQjlLaFYvS085aHU4UGtJTTRUTDg3NjgzbGxqejhoSmY4dmNG?=
 =?utf-8?B?ZnBPYXVvclhUaUFGU282NUNVUGtyS2JBcGlPdUd5YXNYZUxLNGMrZlhRUEdo?=
 =?utf-8?B?eFNnamE4TUxoRW5GaU9VVWpDM3B0dStjK3hSaEdOYi94cG5KVHB3QWNoaHli?=
 =?utf-8?B?QVhoM2JSZ1k3d0RiUDRZcXEzU01XR3Ztc05RMjZqOWc0cVZ3ZlN2dVo3WU5W?=
 =?utf-8?B?U2xRTG5EeTVvOGRSWXl6cDZPTFcyRTIwblEydURJQ0g3a3FtRGVRWTBMWmpa?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7086bb55-c01c-4286-4ad9-08daa20ef551
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:37:15.8158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5qGK1usX3EfwcsdTFqD/itkVei0i3qsMEiQ+GA3qUe3FlYEBXbwK+njzxozoK9MC7XzlM6rk80vzsEZh4GoXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6964

On Thu, Sep 29, 2022 at 11:51:40AM +0200, Jan Beulich wrote:
> Forever sinced its introduction VCPUOP_register_vcpu_time_memory_area
> was available only to native domains. Linux, for example, would attempt
> to use it irrespective of guest bitness (including in its so called
> PVHVM mode) as long as it finds XEN_PVCLOCK_TSC_STABLE_BIT set (which we
> set only for clocksource=tsc, which in turn needs engaging via command
> line option).
> 
> Fixes: a5d39947cb89 ("Allow guests to register secondary vcpu_time_info")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I have concerns with the notes you raise below, not sure we
also want to introduce a (broken') compat version of the same
hypercall wrt v != current.

> ---
> Is it actually correct for us to do cross-vCPU updates of the area here
> (and also in the native counterpart as well as for runstate area
> updates)? The virtual address may be valid for the given vCPU only, but
> may be mapped to something else on the current vCPU (yet we only deal
> with it not being mapped at all). Note how HVM code already calls
> update_vcpu_system_time() only when v == current.
> 
> I'm surprised by Linux not using the secondary area in a broader
> fashion. But I'm also surprised that they would only ever register an
> area for vCPU 0.

Would be better to update locally just when v == current, otherwise
issue an IPI to the remote vCPU dirty mask and force an update on
resume to guest path?

> 
> --- a/xen/arch/x86/x86_64/domain.c
> +++ b/xen/arch/x86/x86_64/domain.c
> @@ -58,6 +58,26 @@ compat_vcpu_op(int cmd, unsigned int vcp
>          break;
>      }
>  
> +    case VCPUOP_register_vcpu_time_memory_area:
> +    {
> +        struct compat_vcpu_register_time_memory_area area = { .addr.p = 0 };

Why not just use { } to initialize?

Thanks, Roger.

