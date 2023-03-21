Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD96C34E3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512782.792987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedQn-0007ge-1b; Tue, 21 Mar 2023 14:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512782.792987; Tue, 21 Mar 2023 14:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedQm-0007dj-Ud; Tue, 21 Mar 2023 14:57:44 +0000
Received: by outflank-mailman (input) for mailman id 512782;
 Tue, 21 Mar 2023 14:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pedQl-0007dd-IO
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:57:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9614777-c7f8-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:57:40 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 10:57:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5002.namprd03.prod.outlook.com (2603:10b6:5:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:57:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:57:36 +0000
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
X-Inumbo-ID: b9614777-c7f8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679410660;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n5r1Rg6ECGApg6dW5Clk9HVWQDsnPP2TRwow5d5vmgU=;
  b=KHdMKQdOeM/a5ZxcXwaiqScERZyeSJeLlOE6hIjH9cz9+jb5YKXIF0sG
   78vGcivsl0LiO/D60F40mR5TSQtfUS+PS2i/eoQZZgZFgWSJsU3jP6Nov
   K5x5b7g5uRGZogQGsP8U6F7Z7hSOQG0NMqDF4ym0sI2j0abkEGGNjs5Dm
   Q=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 101723558
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4a+YEKt3gTDwAunArBi9L3AccufnVHFfMUV32f8akzHdYApBsoF/q
 tZmKT3QPvmIN2f0KdxwPIzi8h9VscTUyYI2TgRu/y9gFi5A+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBwtRXzvcismK/a+3Z8M9qs84MNP5BdZK0p1g5Wmx4fcOZ7nmG/+P3vkBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/6xb7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAd1IT+DlppaGhnW+gS8UVSJIBWDirN/is1C0WNB+d
 24tr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A+N+6pog21kjLVow7TPHzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:Lg6Sca9+hqkFi5glwNtuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101723558"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcuCTJxfihyl5e+pnQm3C00seAruN8oFsOJuiN0WKSY6Kf+SoNZki1mvbMax5r77KH1PKCldzncHv3+gR1wgHBoEDBH5LfsL8LdGrT75ruHgOco1Rgc7BxULb407RQdKb0l35k5F3pEbylah26Pye1kdo8vQuvXmJpB20t8saYrqUfgSazMmDTF+RHb5dac5vt+1hQN6C6HGHe4oED+BKfYDKKk+iQpkbqJYeMWyTkgZ0Vn9/xWmSQzkCkjYeMMEd1ax3YYn6Z97hydi6ngGoxwib+KdeC6NU33WBhnw7cTfYCGLkb7o5iufZVydGX2cF75QpZZZLV5W/TzdahVqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D3X3/MDsPLqMzyhX7sxgf5gZeJBVXi2HUp0s1RMPvg=;
 b=iUd5Q3KIaJaq2o0PD47vGGRVL7pJob84I0jXECqXDRbsySV56PUuyXARVPvQZt7ysMgU3DWVbdg9/UCZ0BjHE5DhJVoKBv7bF0AWSfHkE++jQDYTGq3XhYBfaF9LtZ8pLM6jFwxP7qvWHot7xtxb1XRh1fBUwhusIU8+Ntgu/93CtDsEoZJX/tm+E7eGyTwxzXx1ib2zLzYlfqzgzd+wX2XXT0xQewCqq+fjkPJSrccqgP27X6tqL6iXc3n39z4/fMJ4Zl0Qr5OKFq1BE0nNOTjKZBXBdiAn1oV/aID3qZe17Kg9lbArhPOdjWca3g8P4CvOaF7Bub8l2L74V6xJkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D3X3/MDsPLqMzyhX7sxgf5gZeJBVXi2HUp0s1RMPvg=;
 b=X7aqytIrCl4VcVo8bNQjwxxW0YzqjFAeK34ROJ5UVOgXCPeto2N10z8U1j3kTKe7BbM9Ek4/XwBJ/ecU4BbXMP4cNzK8esZFpfBpBC5natGCTC8sn0K2xlKawVSEgxiaIKQnVu3u8SEvZliKrRyBiGYamhOdVdTHbUebZjKqsZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 15:57:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <ZBnF2oTLQjJtfZiK@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b951bc5-3d7e-4e3d-df8d-08db2a1c9b8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eKMJVVp34KhMlY4SvucHCPbKQfyHURGM7R1UJ29bvAfuMnaPJSqf4/Di7x2kpcIZGcAAU+u/KOeyQmL0Qo3GN+hkyIp/6SQL/GMsNYIXCA+NRpsk7l7e+LcDiQQLvuuLb/+/0a1mmKkJbxJK30korsDDzjgq0FcdMC/vhhHpNNfdCSJOSwk4EGyzvp8Tcuhe/sHSFIUKQxxF0H7SgVc85jbncrTzQo3JHU65nrqhea1fyzSKsKGd1nUwKAFZHqId93PEXOULRWChwDAb9+Ei12qEcgFlMnVp6xqqSiCu9seZfsqKvzUcOLTmPiwklMdHjG7HjlHszO8ai2BQBRKY8EJqV1SAGUcAkvikYlEZPlzmISa6UzQ1rdkNj3rbd7HxhIeTfsspS5Pax8CSBSSL/M0kDYxMLtnhfeE9YQ92AsFfh3gG2+VGARTlqby1J2HyQQNw/9G4HYAfWM9JAzakvngTj0xrP3C9wLhT3WrATwc/3prPIZBpzbkCqMAwtN/IjBcNW75aiEl8Lc9KuvJQTuki8mTWFGRzgfYgZAK2trMDMLEPW+0YW+e5YOebh1FYFTZC1NYd26OQ1OJShI2+sG7gF1KXaEFQByOVCaq+R5NhIYkDkXd3IHQowGBobIh2g8h46DGSmJs9GcI1q03oOp1tsJpcDlzWzxjRmbc3ujIxu25+RGIMt7V1J7b5nXqpddVQ61ahbZp9PxRAIMARwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(186003)(6486002)(4326008)(6666004)(478600001)(66476007)(316002)(8676002)(6916009)(66946007)(66556008)(9686003)(6512007)(6506007)(26005)(53546011)(54906003)(41300700001)(8936002)(5660300002)(38100700002)(82960400001)(2906002)(86362001)(33716001)(85182001)(16393002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtiNnFFZnlBME8zRE54WDI1TGt6MXVVYXQrN3FZWnlVNm9LU1Nab0ZuWkZw?=
 =?utf-8?B?cG5BdS9LeGhZcDJabGlxY1FPSjExQUZ0NmJsUE5MYkNxSkI1QnU2ZXNiVlpj?=
 =?utf-8?B?aXZ4OUVIWkUwbG5Gc3BJcFBJdnN0bTUzbnVPUHNicVJVcXlkUEFXVG44eVJj?=
 =?utf-8?B?YzhRR2lzeVAwTlVUNk5MeGsvVEtKVzJRMUt2dVdiWHRRK3FGTGN2UncwT3Zs?=
 =?utf-8?B?cnlQOVVaTDN5WDVDMHhhdWNIam5pdmIzQlFGNy9xb0pwSkk2SnA3VUpjWlha?=
 =?utf-8?B?ekE3OWYrN04rV1cwZ3YzV3NneFVaNHppOUdpdFdTQ09xSmRCaHJtZnBiVDBB?=
 =?utf-8?B?N2JiRkFHTHo2MFY0d0FnMmN5TDc1Y2UxOXFrK3NhQjF6RTZQRklyTE8rSFYz?=
 =?utf-8?B?Y2lGOVFJWncwLytxMFJiMG5XRk9OckZ6NDRYeU9GK3Bpc28zRDJITFVLU2J3?=
 =?utf-8?B?Z0hBTkdIM1ZhcHRMOFlBSHlLdEVMNjJJaWRMZGpFRUZmRENLQzdSTExmNExk?=
 =?utf-8?B?aFE5MGpPV3JXc3RQSVFSRkNydXJPNlNDQ0txN0hFd1pQNk94N0pBRkFpMFpS?=
 =?utf-8?B?R3BSbzI2WG1jOFNhaFR1VkJsa2NCYlRKeFYvWW9sWFNsSHpNaXM2eHBIdUpP?=
 =?utf-8?B?RzdqMmhFVlE3ajFUdVVYYzROYlJKKzNDd2F6UjFRT0h0TCt3MFoyWjMrM0JZ?=
 =?utf-8?B?ZmtDb25hcmVweCtLWEFJdmk5UWQrQmc0bkxUV2tka0pSbEtkNEU0RGNaQUNu?=
 =?utf-8?B?bTlRVEwzaTk4WWlwRGR6bnNqV09ybXN1L1FkT1QzZjNyOU9nRWNCNGIvSUtF?=
 =?utf-8?B?d0p4SjdFaDdrQlQ2Z0NFaHJNbWNJV0FiQ2dwT0Q5b29yVkJFazZGTE8wV0N2?=
 =?utf-8?B?UksrOVk5Y25VSG9iUmI3VnVmb0JNREdZVEpDWVVEelNjN0M1N2ZxVjh6UDlB?=
 =?utf-8?B?ajVpVEUyVDdRckRRcVNWVU5qVE13d3Y1S0ZnZWtjY09iOFJ5VDhCTm1yRHhj?=
 =?utf-8?B?Vm5LUDZpZkd5SGhOSko2Y3FTWjluQ0VvU3lvaXV4eWVUOHlYUjU3aTRyYnE1?=
 =?utf-8?B?NHFxZG9BUHNZWC9xdE1qN296UXlPVmgzdXFTcGtBOFpNY2o4Ly9SQyttc0VZ?=
 =?utf-8?B?V3ZiMFVuQm8yWnFhd0tqZzdvN0VPOGNoaDdseG1sYzJqeFNsUmVBVWZxWFdG?=
 =?utf-8?B?SUlOQTNjRVEydVB2NVJQNVV2bmhsMkJITmxuV3FsQi9LcWFtWTFVYUtJVmdn?=
 =?utf-8?B?aUJHRUV5anBBZFRLbHN4TDlKS1dENm5rSlg4M1p5WUY2ck5idDd4a2wydHBF?=
 =?utf-8?B?WWdleVV6Ukk4Nm9kVXNSUkl4L1kwRzB1c25yOHpSS0krZC9MYzNzblZtV3FV?=
 =?utf-8?B?WUpGdlFHMEZSRTFzS2FYRHFlbVc0dkVtMWhyZUdiZ0NLRm5jdXRPb0ZsNzlx?=
 =?utf-8?B?WEsrd3duekJ3N2lGVll3eVRnZ0h6VE5MRSs3VVFyS2JQZk1FSzdmOGNac3NI?=
 =?utf-8?B?UGRkSHJtS2Q3Y0w2RTJpNU9wQ1pZTGs3elFXY1NETWtraTlxdldEd051T0dz?=
 =?utf-8?B?VVo1aERqTkRrR1RMOVFWTDIvMXlORzVJY1Z4MUNZR3JzTnJMZzV0K3BxQnJ6?=
 =?utf-8?B?Y25XbXVQcHZNZVgvaVdLQU54M2xTdUR6ZEFUZXc4bVIxMXluTU9nT29pQVZo?=
 =?utf-8?B?UHl3VDE3TDIrcFVHeS80WiszY3VldWp5Z1haVHhPYis5blF1ejcyY0dVU2JX?=
 =?utf-8?B?TzBtUGs4T2wzTGFPMkdGZHRvcTg3L21qV1RWQWVSb2Y2SU5iaXBNZ3RxQ2hN?=
 =?utf-8?B?V3d5dFlQR2ZhdkNQKzNBMHk1cm8rMWc5VUhsMW5IM2l2Ni9lb085aHVUOUtP?=
 =?utf-8?B?U3puaEEzclUvOUpuWXo1R0JGczhBRW04WFkzb1ZDbTY4RThrV282b2ZmTCtk?=
 =?utf-8?B?Nk1lQ3JaYTFsdG5nYkVQbitXZW1FVVYrNmRxVkp1SDVqOWg3SUUzN29HT3dD?=
 =?utf-8?B?M3hyTFNkcWladTV3NDhteGxjOXlldmZ1TEhoMmNsbnFQNk9HRTZaTkM4WWIr?=
 =?utf-8?B?cjhxSUhnaG9pelV5a05xSlU3M09kRm1rUjBqZzZPMkI0U2NFdUNEUm5DeFJx?=
 =?utf-8?B?ajZDdlhPTUNaZENpaFA4aVYzT2U1eXYwbVNKM1l5UEpzbkE0dFVjS1dCcnM1?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/95Xd2lfcYlN8OAnQ9zmcQbhKtDcns0SwnI5p4w6ZZs/TlSMVOo9YOQQVQbWM7IbQNEPtL4kRjqf/vzRBVNPUvixPMk6rEz1kr3G4iF92b1UF6MpLflLM54QtMRJ6AHHIYF1MX4Ao+PyU3sDh/fbRAfgZNCzYZt1CAHCmQUOsIIeiAlMfDtLzqOL+7WWtRBpP/3XlUmcG/9Bo2zrrSywMXgtVvpsONxe9y+hMc9iYHs2N5yZhfBWkogiFj+fwAMW8WAXMD0T5yXRvKfdFBEaOr3G5XSpKp2CvVbzcNAwY9xtB3ZJSa47/vU04rJgsKwG6xI0MB5KHXJJJOzu9S6QosSSv+iRRW5ZJL5WT+7AF51Gm3G/NlV4Y2UPy7nbicF/dG2S2eh1SLOXU7yUSDRQ50ugoEa5w6JsKhmNTf+MH6xHbUsoP0THUIPEjLfDJxtPN/K2PEV649F+QeJJefGN85mQIQVvXlUtDI5fmBd2sFwTLwe9KMn5Ijwkt8XMi2fG35ZUIvnScfdE4a2qN/0nAkwbgoFXP72OBAr0nVZUSsJVfU2p5KFAPahg33vRMf2+iw1g2k4UCnvcltOoyQAgwmQPNaMKtvZFwD0HXxeVJMmJLyY/owednMeZbeWaQZVI4xndl8b0/v9Xk0RcfY2g1rcJ7LLRloNszXE0Cstlbl8Rs3kqSPuiz7YN/QyGbFp4eyVWonWihc9JQjVxgIZ/3GPrf3LXDjkvPsnRUfturTcOrNvhmoYXIi62xId41AZGZdufpm/mF7iTbCO7t/0kdfb2xA50I2RWF3GEqn+n1Z0KYGsUxOo24aN2Ttjt2Sgs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b951bc5-3d7e-4e3d-df8d-08db2a1c9b8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:57:36.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyqYzTr+Own3sw/s0A4RTeu8bq0ka5800WUC/zYQAQEo95G0JS/imOb0xwucVMfUBR++co2oGExIkKm4HN3NGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5002

On Mon, Mar 20, 2023 at 10:48:45AM +0100, Jan Beulich wrote:
> On 17.03.2023 13:26, Andrew Cooper wrote:
> > On 17/03/2023 11:22 am, Roger Pau Monné wrote:
> >> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> >>> This is faster than using the software implementation, and the insn is
> >>> available on all half-way recent hardware. Therefore convert
> >>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
> >>> and use alternatives patching to replace the function calls.
> >>>
> >>> Note that the approach doesn#t work for clang, due to it not recognizing
> >>> -ffixed-*.
> >> I've been giving this a look, and I wonder if it would be fine to
> >> simply push and pop the scratch registers in the 'call' path of the
> >> alternative, as that won't require any specific compiler option.
> 
> Hmm, ...
> 
> > It's been a long while, and in that time I've learnt a lot more about
> > performance, but my root objection to the approach taken here still
> > stands - it is penalising the common case to optimise some pointless
> > corner cases.
> > 
> > Yes - on the call path, an extra push/pop pair (or few) to get temp
> > registers is basically free.
> 
> ... what is "a few"? We'd need to push/pop all call-clobbered registers
> except %rax, i.e. a total of eight. I consider this too much. Unless,
> as you suggest further down, we wrote the fallback in assembly. Which I
> have to admit I'm surprised you propose when we strive to reduce the
> amount of assembly we have to maintain.

AMD added popcnt in 2007 and Intel in 2008.  While we shouldn't
mandate popcnt support, I think we also shouldn't overly worry about
the non-popcnt path.

Also, how can you assert that the code generated without the scratch
registers being usable won't be worse than the penalty of pushing and
popping such registers on the stack and letting the routines use all
registers freely?

I very much prefer to have a non-optimal non-popcnt path, but have
popcnt support for both gcc and clang, and without requiring any
compiler options.

Thanks, Roger.

