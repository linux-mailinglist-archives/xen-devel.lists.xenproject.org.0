Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9A629A23
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 14:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443947.698701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyW-0008Ls-Gh; Tue, 15 Nov 2022 13:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443947.698701; Tue, 15 Nov 2022 13:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyW-0008JI-Dk; Tue, 15 Nov 2022 13:27:40 +0000
Received: by outflank-mailman (input) for mailman id 443947;
 Tue, 15 Nov 2022 13:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouvyU-00083Z-E2
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 13:27:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44c05f2f-64e9-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 14:27:36 +0100 (CET)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 08:27:31 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6713.namprd03.prod.outlook.com (2603:10b6:a03:404::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 13:27:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 13:27:30 +0000
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
X-Inumbo-ID: 44c05f2f-64e9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668518856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=S8vX3VCUDfWem5EKpM+BWQyIehCHdz/guxow4oRJrXI=;
  b=HBVXef6piPA0wW8Z850A9PqY8Pos2zxLYOJ66AAe0GTyXuI+xCwGVJri
   KWYebBqV/5Eu6bIjFK9KvKOImx4SKJ028kXIz1dVqnZ3U7LnKuoFDX9C7
   CJlB9uFNcvvYYrw9lkfFP/tNhNFZ4OElWzoJWyr+5vGzcyr80jNP60+ds
   0=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 87387759
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N9CVyqy49C4ex4wtv1V6t+fsxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 jNOWzuAP/2JY2Wnc48lYI+390JS78KHzN9kGQI4qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPK0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVp23
 KMKIwAUVUmK2fmnyrbqcrM02st2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rCUzXykBdN6+LuQzP1hulGRm1EpMSIvDXanpsWwgBTgVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRHsreYVHac/be8ti6pNG4eKmpqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv42k+XjXjjTqoYLGJjPZ/S3SV2Ohqwl/NIisYtXy7UCBtKkYaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhkkTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:kka65az7cJ4Uo5TnwszBKrPxTOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vr2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJTIWGhI97wGKrDWwrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOCcl8QPLT3oqwCwIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKbQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8ABY3EdBIi451egbQrxNIhqA17I
 t7m0ai87ZHBxLJmyrwo/DOShFRj0Kx5V4vi/QagXBzWZYXLJVRsYsc1kVIF4poJlOy1KkXVM
 1VSO3M7vdfdl2XK1jfo2lU2dSpGk8+Gx+XK3Jyz/C94nxzpjRU3kEYzMsQkjMr75QmUaRJ4O
 zCL+BBiKxOZtV+V9MyOM4xBe+MTkDdSxPFN2yfZX79ErscBn7Lo5nrpJ0o+eCRfoASxpdaou
 WPbLphjx9zR6vSM7zM4HUSmSq9AllVHA6dhv223qIJ+4EVH9HQQGi+oFNHqbrTnxxQOLyeZx
 +JAuMnPxbSFxqRJW935XyOZ3ArEwh5bCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="87387759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUBvsY8hI8yhc3glMmkhueuHC09cv+2q1kCVJ/bmnvLQ8W/g/Jtc6MgNh1wURARLoJxMLjGE+hypEsIz6BwxygpazxCYRyDSKa+k3O+dYMRUKOcpjss4zZDgo3lqjMwj5e/wvqjlvbaQ1DghV3b24A7hVGf3UtdxFB47cloH6HXzL/vJWHSkXeYiaMDYqyucY1W6yyYksNk5QY67/4d5LilL3v2C3fm4hT0RHE5LDvhAeKtbj/HiZOeWYSVhBWP0rHyvFAtU7p4NASkUH8wM6MRpmtoF5YGEWFxRraSodefKrL5ms0kodcDyScdsjOEy6Qafp0BpCO169YoqMxFjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llNWAbVbQKPHFmbKIFdwCSdHk/qh12AMcSXIl4F0egY=;
 b=mKKqZGfOML2N6UWR2Pq6outp39LHRc7WD3upsxZB6fextTwUkNBPMDFArmvF3S6d/XaDHyO2Yqh6RnvUcCclCET6ZTdlzNPG4sRlSYhy0W+j8Ww7Pwu4xSdJJZL+7cAxeR98FO1fxg72LnME+GVcLUbVzizSj/yBOSLJ69j47J0A003jEAAf4iFha65TzUvO5Ctf8I/lecoC1oaG+qEOSbWUS0qhFsjAR9YUbGt2Q31XPrH/uRS+eRZLJ2LoshaUKx4nzxXX4WyX3/kBIRXeKLlQQvgWE7//fkcwZvkQcAe2LpfcRp3pwO/UyVVmx4r+M0Q8y/TSTGIuPLys/7v1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llNWAbVbQKPHFmbKIFdwCSdHk/qh12AMcSXIl4F0egY=;
 b=BxvdMRCtCQEnnmX7J8H0UI5KO48C0/Jm2qX9/xeKCGGgWKzFlvnFTpPWr8DN9wwR4iDv4wg0SeWjltOypBf849ebmsL+n9MVHBhTPh3pW+kQCFvVwWoJKp7kD8g8GOkWQEBpmEC+fYHXftob8nYpR3DfL/JntlHRJOJVRU5WwHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v4 1/2] amd/virt_ssbd: set SSBD at vCPU context switch
Date: Tue, 15 Nov 2022 14:26:55 +0100
Message-Id: <20221115132657.97864-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221115132657.97864-1-roger.pau@citrix.com>
References: <20221115132657.97864-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 3521d0b6-1024-4075-e836-08dac70d2524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yfuvDrP6VRYofAzjTqHSu51VBxskf0VogzFATNamuEXoxsueNPVRqZ2lPy3Ht3OSZpXgQhBxU/aQVBk1VGmFoHeZlRXDqtwoERhQhvttp3XPCnuRoxDqxyH9sS/z3wPWusEpJF8UL8SzGzpLU/04qnMIzyziM3JhtKpEQNu+BalTLERroplMvfEOnXKmZtEYRB7lRcBsOAl0/p5pTy09/MPB3XhMYKX6G4gZMI0/L0fQe7OrM7xFRW1ImramtMxcikizm+EhukRyJ3pMKpcTg/kELW74kSe8FM5NeCsrC/zSwYjLMCuA2b2JnD46wUzGPRBu6mgLlM3RqKfVXbLQyErgl7ktIW9pFXGMEeVfe8lgmvdyDmlInGidfF8HugzdhqGRDmtCvmnYoT7uTKNsDwQ21/e9ihS5153Wpc5lsdhveUndX2zXZ8Fl+uFERNThHFcRGSOzvW8Ck4OJFfuufHRk8+vkRDbA7Pk4hC3Y16wTJqcYriG0QKnM2k0ULwxXbpfWYwnjAPOfFVqOcQqdhAzCOG/mUURHutmd5f0iqtd20fYsfNOJspHYX0FORrmFm+PyWu2i+P3YcYlXf5NRGRNnxA0dceE9WWRLJu6NDkroSDM0+qwZcjv5RhLMdIWKU2q5TZxbi12whPLlWNwVmIp27QqfrDovOYGh8aFGIRiYbAOPSRgsYjwCkIeuLa6vRivrkd7r4oIQ+PcRscRIrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(82960400001)(2906002)(66946007)(66556008)(66476007)(38100700002)(5660300002)(36756003)(83380400001)(8936002)(30864003)(41300700001)(8676002)(4326008)(6666004)(478600001)(6506007)(6512007)(54906003)(26005)(2616005)(1076003)(6916009)(186003)(316002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFl0VGhveDhoS3ZUanZpZFVNMUhaSHRmbHpRWDZ2aDdRRlVpeVJ2WGFlbUpM?=
 =?utf-8?B?M0pJZURZa2F6bzZKWEJyMFYrM0JpTEJOcVhvOGFIUmtQaEk4V3pQQk9taW1r?=
 =?utf-8?B?bVlYbDh4LzIxM2JQQjBBKzBlQzYySzNKVCtIRGFLdDgveCs4M1BBdTRHTktR?=
 =?utf-8?B?a25LVTdFcU1VQUUzTmFRd3AzcTB4Ynh3YlBWWXpkZmlwNUN1QjRuLzlMaEZj?=
 =?utf-8?B?QlBNYk9sUDEvTitOTzQvRXpOTHR6U29uMDVoeG4rSFZDZlk0U3U1TFo2VW56?=
 =?utf-8?B?T2pYR0dReTdUc0hMRFVnTFRsaDFIT0xCVDdmN09SRURLOTh2Q3NsUHpQd1RY?=
 =?utf-8?B?TTlDaVMxVnNhdVdnR3FYdE1NQjNPOWlZM3NhSTdXKzgvNmZQaFNWTDk2bkdw?=
 =?utf-8?B?TitreGdNVVg0SXNTZlJVWlpOZXZIVlVJNUZraTc0Yk5SaEFxNndobjlBRzh1?=
 =?utf-8?B?bXdEMjN4TUJ4cFI1SU4rNVlyMXU5K2k3bmp2bEFuTWpGaEhZZThIRFI5Ym0y?=
 =?utf-8?B?NTdKTmlNaFI4dk41OGhFKzdFQm5hSytxK3haQjN4dEVRNW9PQUF1UmY5V0dE?=
 =?utf-8?B?QW9rcXVIaTFaeGEyeWFtZllkLzMwK2hPRUE4eFFGOGM1dXZzQUUvQUlSNmhG?=
 =?utf-8?B?SnNwbWZKcmFsQVBnaFhFNWE3MWQrYXJOdmpaMm5pTTJoNFlDN0tKeUozbUJ3?=
 =?utf-8?B?Nmk5b2RvNG9vb2pqcDBRZTFZdUM0b2YxeHFmdmlCRVovVE94RnJ4L3JvWmpQ?=
 =?utf-8?B?eDlxWVk3Z21NWXpzMEV5Q0UvdVNXeTNmblE3ZXdhTUdMYVZuU1RUZ1Fpcytr?=
 =?utf-8?B?U1BndTlLcXR6MXRIaDRLcTFWeXVockc1U3NLWENnNnVFelNmaDFsVmhNd1VX?=
 =?utf-8?B?d0hsOXA0R2Z4eVdSWWVVdVk4NkZQRzYyT1ZCOUpDbHlQOFhvdEJNZDZUaEk4?=
 =?utf-8?B?YU9PRW9VK0tZSitNMFo3anN1cUxlR3N3ZGY0clY0aGJ5NTBQUnM3SFRzNE1J?=
 =?utf-8?B?TTEvQXJzeTRQb2NNL1lHekR6SldCQzFBVm1NSGhWbENnenNiOVpWVjFDZVBy?=
 =?utf-8?B?N0RHUzdMV1VrQStjblAvR3NqOG9BdGR3S0hhM0t5Tjh6WUQwRFJMcm9xM3lR?=
 =?utf-8?B?c25ONTVaVGRnZWd4empsZUthNEs3VHJmM2dCcXdYOUhrRW1vYlJnblBCRi9L?=
 =?utf-8?B?WEVpVWYxcVlvanJmMjd6SXk4a3ZJbEZJMWszWjlDN3RoWk1xTU9Zd3NabFUv?=
 =?utf-8?B?K2k5WlBna0RvWWJrNHhEWmZ6OTMrUmgwTWpGWjM4bkhPUm5aLzdSVkV2TjYx?=
 =?utf-8?B?TVpxTGFBL2p4K3gzYm9oZFNLaVFZRDhQUS9rYW9JdTlFc1B1a3FtRE0yNW1O?=
 =?utf-8?B?WXR1K0xxYkN3c3ByZ2lyb1R5eVY5S3lESFMvbmRoTk9NczcxNTJwVitkMnZR?=
 =?utf-8?B?MnUvSExRbUpwUFhSU2F5N3htc2lIQXRjbUR5Z2hjWGwrVHZWbXBmbGhQZDhp?=
 =?utf-8?B?V0pDbitqanJKV2JyYUZqVzhzYlpLS2VSMUd2cjBBaXk5MEZ0dFJKeXorWFY2?=
 =?utf-8?B?WTNYVmEvQjI3R0ZQbmFqdndzYTgvU2xzcWsrNUEzVG9ZcnU0eDNWQnNXYzBN?=
 =?utf-8?B?Mmo5ZjBDRkYyRVNBNjljLzFZRWlsRjN4dXJmcTR3NS9KVFQzTTBSSmMrMWxL?=
 =?utf-8?B?ZHZYWlRRS1hydW5odm5HRnhDZmNNRk4rbTFkZnczR05wY2JrSyt1ekEyYWIr?=
 =?utf-8?B?ZjlhSUNUZDVLZjdnK2NleTRUTXhMV1l2RlFXM0grcHhVLythcFE5OTA5bytw?=
 =?utf-8?B?UWpVbTZsWjBuSXdxTUYzdTgvb2psSWxSWUxhelh4K0VXTHByTmpCTGRjbmZp?=
 =?utf-8?B?V2d3cVlQRnNnRzJMdEgyeEFONXlvbHhBa0N1bG02S1VxYnZHYllMUjRDN0Fx?=
 =?utf-8?B?MXd1V3ozK2Y3a1hJMm9tSDBVQ1pxUS9CUW56akpDN2hmQlN2MTJmdVBuSXJk?=
 =?utf-8?B?TDJNRnNqRXorSjdqWjZiRktJaWdDNjhHb2VmdDJvdzV6ZnZ1UDlJcUp6bmtw?=
 =?utf-8?B?aGdqNVF2QjdYaTUrdkhJTkZoUE4vMXoyUEwxR3NydSs0M285YzduenpQWlhF?=
 =?utf-8?Q?pggldquZUJ6E3rpkYk5SA0nvd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f+Z+B5EMF0ePOQPp8NukjjBoADpHPiGBtgbnhP+wAz61bl5e0QasXgwC7HjARzTmE9BuGdloDZ5M/BiQQeubjbiRSvlZslBcj/eyz+juWI7d8s8E9sIKl50srFpTGwDf6e9zzemJSHO5OSsWh1sDr+Q5jFGW0tJySwoBy70zBudYTXX2O/fZtX7gBh2t9I5t6xNt086eEr/f1IUWfm1NyHUpRP6DCxNwH7GFO1ntwIhpkxMQFltjq3LmlsFRWbftO5Um3ECaqpqGvFeU0UxKuQFk4llLO/USaJmu+InzoaZUA48j18L9SDSoNxBPzx3q1aaE4xDT5HOz76Q2HNqhW/aQNEh06tsAqQCwtptUuiqyhuFrZA7Jt5oIccwuZtnsjqL7Xi9gUCa+XvP+UtS5tznxbR+90myf2Wz0jhSpf5xfUESb83pweu39LGOXDYLfNbqA3iONeGbd1edmtx6kjnS2Hi8C4RutMf/c6S9CebUWqD5ZVO9Bs486091VZTp4GbSFi/OfgSzljs7nJIl2kCElY3tsYGjZ0mCQ2L45vrzy6k7QUXm6APXZh2cVD1LGT4MpXxo8TnRthg38Z4ec+CbYQMDeTdfiUYGq2S/IkP1X/hCBhpsTmAJO/wEdkhSDYjwKRct2jFOIY0bmy40Tilt64gD1a7paTPfJQJbuu7vlZkca8doiEwLro3qmjOMWj0LDN+M2DegO9PpAm8JQNtEpHAnf80bdn/GUd9eDymtd3oCEvZWdf0MiPqeTPPtmdDsJFlw0kM14rT2facaPeVje0Yk/8tsQ6gunk8jL7MB0/EHMjcFhbc33hjEaqAwCUYxMDTjlLQgu/+5Axycesn5jb6IaPfNEK2UodZp2CGwscGaUeE4MPpmZcLyarDyXxDV/a9PBqDWtDT/MabUqhw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3521d0b6-1024-4075-e836-08dac70d2524
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 13:27:29.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGoCWf0xapzWKk6fgxEeP055HgzjysiZi5eTCyMB0gfybrGHSFeiKWN0fNsCjtee7zgqGvR8+YOmk4lqtSbX2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6713

This fixes an issue with running C code in a GIF=0 region, that's
problematic when using UBSAN or other instrumentation techniques.

The current logic for AMD SSBD context switches it on every
vm{entry,exit} if the Xen and guest selections don't match.  This is
expensive when not using SPEC_CTRL, and hence should be avoided as
much as possible.

When SSBD is not being set from SPEC_CTRL on AMD don't context switch
at vm{entry,exit} and instead only context switch SSBD when switching
vCPUs.  This has the side effect of running Xen code with the guest
selection of SSBD, the documentation is updated to note this behavior.
Also note that then when `ssbd` is selected on the command line guest
SSBD selection will not have an effect, and the hypervisor will run
with SSBD unconditionally enabled when not using SPEC_CTRL itself.

As a result of no longer running the code to set SSBD in a GIF=0
region the locking of amd_set_legacy_ssbd() can be done using normal
spinlocks, and some more checks can be added to assure it works as
intended.

Finally it's also worth noticing that since the guest SSBD selection
is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
propagate the value to the hardware as part of handling the wrmsr.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Fix commit message order.
 - Remove msr.h comment about context switching virt_spec_ctrl.
 - s/amd_set_ssbd/amd_set_legacy_ssbd/.
 - Adjust comment about clearing SSBD in svm_ctxt_switch_from().

Changes since v2:
 - Fix calling set_reg unconditionally.
 - Fix comment.
 - Call amd_set_ssbd() from guest_wrmsr().

Changes since v1:
 - Just check virt_spec_ctrl value != 0 on context switch.
 - Remove stray asm newline.
 - Use val in svm_set_reg().
 - Fix style in amd.c.
 - Do not clear ssbd
---
 docs/misc/xen-command-line.pandoc | 10 +++---
 xen/arch/x86/cpu/amd.c            | 55 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/entry.S      |  6 ----
 xen/arch/x86/hvm/svm/svm.c        | 45 ++++++++++---------------
 xen/arch/x86/include/asm/msr.h    |  3 +-
 xen/arch/x86/msr.c                |  9 +++++
 6 files changed, 63 insertions(+), 65 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0fbdcb574f..424b12cfb2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2372,10 +2372,12 @@ By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
 when hardware hints recommend using it as a blanket setting.
 
 On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
-option can be used to force or prevent Xen using the feature itself.  On AMD
-hardware, this is a global option applied at boot, and not virtualised for
-guest use.  On Intel hardware, the feature is virtualised for guests,
-independently of Xen's choice of setting.
+option can be used to force or prevent Xen using the feature itself.  The
+feature is virtualised for guests, independently of Xen's choice of setting.
+On AMD hardware, disabling Xen SSBD usage on the command line (`ssbd=0` which
+is the default value) can lead to Xen running with the guest SSBD selection
+depending on hardware support, on the same hardware setting `ssbd=1` will
+result in SSBD always being enabled, regardless of guest choice.
 
 On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
 option can be used to force or prevent Xen using the feature itself.  By
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 98c52d0686..a332087604 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -742,7 +742,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 }
 
 static struct ssbd_ls_cfg {
-    bool locked;
+    spinlock_t lock;
     unsigned int count;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
@@ -753,7 +753,7 @@ bool __init amd_setup_legacy_ssbd(void)
 	unsigned int i;
 
 	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
-	    boot_cpu_data.x86_num_siblings <= 1)
+	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
 	/*
@@ -776,46 +776,51 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	if (opt_ssbd)
-		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
-			/* Set initial state, applies to any (hotplug) CPU. */
-			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+		spin_lock_init(&ssbd_ls_cfg[i].lock);
 
 	return true;
 }
 
-/*
- * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
- * that relies on exceptions as those are not expected to run in GIF==0
- * context.
- */
-void amd_set_legacy_ssbd(bool enable)
+static void core_set_legacy_ssbd(bool enable)
 {
 	const struct cpuinfo_x86 *c = &current_cpu_data;
 	struct ssbd_ls_cfg *status;
+	unsigned long flags;
 
 	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
-		set_legacy_ssbd(c, enable);
+		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
 
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
 	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
 	                      c->cpu_core_id];
 
-	/*
-	 * Open code a very simple spinlock: this function is used with GIF==0
-	 * and different IF values, so would trigger the checklock detector.
-	 * Instead of trying to workaround the detector, use a very simple lock
-	 * implementation: it's better to reduce the amount of code executed
-	 * with GIF==0.
-	 */
-	while (test_and_set_bool(status->locked))
-		cpu_relax();
+	spin_lock_irqsave(&status->lock, flags);
 	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
 	if (enable ? status->count == 1 : !status->count)
-		set_legacy_ssbd(c, enable);
-	barrier();
-	write_atomic(&status->locked, false);
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&status->lock, flags);
+}
+
+void amd_set_legacy_ssbd(bool enable)
+{
+	if (opt_ssbd)
+		/*
+		 * Ignore attempts to turn off SSBD, it's hardcoded on the
+		 * command line.
+		 */
+		return;
+
+	if (cpu_has_virt_ssbd)
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+	else if (amd_legacy_ssbd)
+		core_set_legacy_ssbd(enable);
+	else
+		ASSERT_UNREACHABLE();
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a26589aa9a..981cd82e7c 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,9 +59,6 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
-        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -131,9 +128,6 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /*
          * STGI is executed unconditionally, and is sufficiently serialising
          * to safely resolve any Spectre-v1 concerns in the above logic.
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1aeaabcb13..fa73257203 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
     /* Resume use of ISTs now that the host TR is reinstated. */
     enable_each_ist(idt_tables[cpu]);
+
+    /*
+     * Possibly clear previous guest selection of SSBD if set.  Note that
+     * SPEC_CTRL.SSBD is already handled by svm_vmexit_spec_ctrl.
+     */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_legacy_ssbd(false);
+    }
 }
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
@@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    /* Load SSBD if set by the guest. */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_legacy_ssbd(true);
+    }
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -3116,34 +3133,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
-/* Called with GIF=0. */
-void vmexit_virt_spec_ctrl(void)
-{
-    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
-
-    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
-/* Called with GIF=0. */
-void vmentry_virt_spec_ctrl(void)
-{
-    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
-
-    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index de18e90b2e..3eef1dfb98 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -378,8 +378,7 @@ struct vcpu_msrs
     /*
      * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
      *
-     * AMD only. Guest selected value, context switched on guest VM
-     * entry/exit.
+     * AMD only. Guest selected value.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 95416995a5..cf46b18aa6 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -24,6 +24,7 @@
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
+#include <asm/amd.h>
 #include <asm/debugreg.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
@@ -697,7 +698,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                 msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
         }
         else
+        {
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+            if ( v == curr )
+                /*
+                 * Propagate the value to hardware, as it won't be set on guest
+                 * resume path.
+                 */
+                amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
+        }
         break;
 
     case MSR_AMD64_DE_CFG:
-- 
2.37.3


