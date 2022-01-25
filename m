Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2849B6C1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260401.449807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8s-00035t-6L; Tue, 25 Jan 2022 14:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260401.449807; Tue, 25 Jan 2022 14:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8s-00033B-2g; Tue, 25 Jan 2022 14:49:54 +0000
Received: by outflank-mailman (input) for mailman id 260401;
 Tue, 25 Jan 2022 14:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN8q-000334-Ee
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:49:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f344251d-7ded-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:49:10 +0100 (CET)
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
X-Inumbo-ID: f344251d-7ded-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122191;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=KMpJGUIBSXddYfFxNqcd0W/wOnfRTDcTzg5wC0yTDCQ=;
  b=MQ0h/c5tuSOOR6F0eRKhv7NikvunjqghDcfqEXFfo/LUCo3rEr98OQwg
   MXkvoRTOQlUTkZkMcnDkaFtz3yk2BGLhO1GMeo3EqL1RKGl/N+Ad4Nf/t
   FGu7I5gPEJiJfr7PyMJOUatq3Qb0p7gFFUqpms7HTag88j9Hr9xkJJ4Lj
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UzYjpcgZNS1eNjFzWHYStGx/MHPN2GIl2c5hC6+TrY8EaOTFgBNcsKnQap5Ybi9/xg7oV7ZGYL
 i/X2Zy2AM07XAK2uoNps24gjnkPic/mBghF5wIGwYsaX4oA3cioFDt+ovxY8niR/cpR+RDJx42
 WQYK0A8efeMa2R4Qnl4U+C66X7B0Ki0rYsK+LVN+J54/5+VSP908rhoe0Xby/85Q929ZTqvBv9
 Evt63bPKcD+xn0kV+b0a616o/JoojLu/AcrLdMnlkjKqSEUJYOdrTm/bp603v7YqK+aXb0yyQU
 5LISE/KGLWelcnQGDk/me0SU
X-SBRS: 5.2
X-MesageID: 63124289
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nI60IaNFd6buvNfvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUojhmcGy
 zYYCG6Ea6veM2GnKtt1YdjjoUpXuJPQn9YySgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyuYttdwx
 /NHiZ2fQ1sbNKbsttZESiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvIUEhmdh7ixINdbBb
 Mw5awRkVlPRWBFACnIeFIARjfj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR8pPmV2Dj
 nnb5Gm/CRYfXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imT24PT4gm/DFQFYTQdWtYtlOEEHCUTg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpSZX1qvHfVKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWSxP
 B6M5l0Atcc70J6WgUlfOd7Z5yMClvCIKDgYfqqMMoomjmZZKmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6j+b2TCPLGN8tbQvfBshkvfjsiFiEr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5UHL7HYels/RjhJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXdE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:YOtjhaOKJw8dFcBcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KXHCWGDYqodKbK8gceVbInlvhJQpVYAUdAc0+41MHfTLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9t1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr3FtuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4Dn0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqU12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pSVFZol/1QwKppKuZAIMqjg7pXUN
 WGTfusrsq+SGnqIEww5QJUsZ+RtndaJGbyfqFNgL3W79FspgEJ86Iv/r1sop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MLOA5Te7rANoTyKSi8Q156Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="63124289"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjSGDzYdy7h1ZqIksrKGDsGKrf9qxgLtWF3dG3h/imvmwDCP/EEPItFkFEYIAZJWror3cNyrOiqBinvVlDdXMysJ9JMI30hh6egzCV95DpySyWEyrpRfa5OXuR0XwGy0ip7LmORSiAPDU5u1YM8SNJivbIAG8I1JPA7CPNGMf8WKayK13VVMdOOZKaEqcDeDeaOIp4xBFD7EdCPEX/kDk8kSpSRMr/ymgQSx7S2TdGWGe59UrkFAOGu4s/uZsg5ZmnYyTJOySxIn/srKD1+rF2xaTSfqstaBy6mqqOiV1deHaXM1Mxb1BRTMszDlkwwCPSSEmVuEoArpYX4aFI0tMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eru6pzQxOjTbx0wUbPSsxS8IroCkcvtDCCp2Q1k9dPQ=;
 b=MRMzGuLZ/pAyM8T7qQiioHyflVxogAiluyH3znIssjfa/4MjICOnGjjgmcLCELOeM7/mRby97Fr1rKdULyoEhAGHZ/adft472BTr2xcWlCyGIiSYr2VoTqzEEqt6piZ1Prd6w1XsQCD32sgA0SGVAgdZazkH4R8Vhs4F4RAGwT3i0VT4YkLkSAxKMt7/iJMUsMtZOrzk36h4LwR/VUhdfNr+80jUMRs3OtUjU9MQ98lrffFn11chhyKFNDdpVtYu/kEHzL6DbAcVCsXCPEiGcASNF67iS2XbRbD4iDbZqWF8zalbIPi7j4ie7kZAKXTtXfwJPCQgW9QX9rlartAHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eru6pzQxOjTbx0wUbPSsxS8IroCkcvtDCCp2Q1k9dPQ=;
 b=F/ZNvqyFrAaZTO7yjpfbMUpu8dZpbZ+QjDAWk0UOjJhGhicKmh8F9gsZa8Sz2RjnkiL52BCahBJFFf/KUpztV4jRQQRLM9oVf2hrt0tYDILspTzWjNcFsCYarllVEvHt+9Jf5JxZQeUkzeedcLpvYoDWNRSqXSfGNXeOZE67sbw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 00/11] libs/guest: new CPUID/MSR interface
Date: Tue, 25 Jan 2022 15:49:24 +0100
Message-ID: <20220125144935.44394-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31606684-6784-4f05-11b9-08d9e011eb8c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB45682D6CA3543546A006993F8F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8DVx+QTwUnbRmv2LaqWSv3vnP5Ijo/83bQMR6dWPLkL4oU0wB+lH//2XBdS15DDuc6GKKJuHUHCN2WEPdh1b80ziuC8AQ4pwqia5lAc2NrYb3P1QtxYZAOma72djHXlz7s65Txh9R6tyyOCyicAhdi1igg6wfgAbZjNdZ6xhk8z0tk4w6L6x6JzYzzJROGlIULSVzEWHqe4r5xB/IDGjIdv4mjyQZRPFbnqvlqpo2U+3S/dsiXbmWKrDVx3sZbzcPF0q1AceXDyjVgFIa1WO3arFt4lZZLRZA0Hb+N5udlz/bKUQ9QZMDoH4se7Oyn2t//G5+YFoLKNf/nWpMftlxuC0oyBI0u/YtEDoIsMUvh4RGXS+1rmP/Jf4gGzaK9GUzmynW9hwl/Qk7+SsCOmFl3xdSDoGU1fu2uJOmjVaaioiAZYhz/89G3Aw+8kgO34UttcJUaDp9O3AYgtTuPewoerWVZgdPyEoHaXrmmtA3JPCim2xPx0SiMW/0Guv4t10sZr6WKKxDzD8L1iFijSPx7F+SETyVupSVHARm09eDXMr0KEAEAiLy7n4nQbZyTl0IES+Eqj77Cu7WqcojooVBLQi4JVx4y4C1q20lcAZmpDAgLfJbIhIWQiFjJ5vW+BoQkBqBCLocI5dS8T/3BZBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFgxOFhwSmFqRkRPUVcxSlVma0hKalR0WUM3NzRLbnhPTmxaanRoOVBNUXYr?=
 =?utf-8?B?RVpuaVYwM1dLNUFVN2FjVkEyRjBpdEN0anZJUCswVVc4WEJERTRZd2JhMW8x?=
 =?utf-8?B?d2VHZ3lqOG1nODZrNDZhYTV1Q2tQNjNkK25TVFV5cWhYYzBXV2JyY3dzZlJG?=
 =?utf-8?B?NlExc3FheTAyS0R3OU1ReW0wdlM3Z245LzcvbTdvZHNYbHZDckd4cldiV2dE?=
 =?utf-8?B?SEM3eHdQenR0WHJUTEFaTnNEK3NlRFpDS3dHT0psa3lhak1KdWxLdXYzQW5W?=
 =?utf-8?B?bExHczNQa3NhTjhsSzBaVUxqeGIwS2Fsb1RnNmlLTzZ1dllUdFR6MXcxTnVs?=
 =?utf-8?B?QU1zazJmb0tXU0NrTWdmcmdRbW00a2lzdk02OG9yb2ZpNEt6WVFMOTVEcGFt?=
 =?utf-8?B?MEthS09sd3BnaElZcjFtdkk4Q1lLMzFmZXV4RlJsTUxSeGJGc0pLQWtlMGJh?=
 =?utf-8?B?UEt2eFVVRGRNcTN0Y2F4VUVsam1hdmIzcVdLSmg1S2xOM1ZFcGlIbzJ5Rzgr?=
 =?utf-8?B?cjNOaTdqRWNuUk10SitaUytoTjVYa1JOS1I4ZXExRE5qRTVLOW1UNmJIeW9y?=
 =?utf-8?B?SFV6ZE9kK3YxRVdIbXM2NEMrNC9kNEpFQVYrNXVlNlQvdXJtVlZNa2MweHhp?=
 =?utf-8?B?YW94MDBBS2diZGIwNm1CVUFaTjlsNGdaVVFINHo0UGdHUjlQdldXNnlMWENS?=
 =?utf-8?B?S1FaSzlSODdnQXFYN3ByZ2g4alpGY2JJTGVVWmJWQ0JockJPbzZUVHJBaDBs?=
 =?utf-8?B?ZE00OXBSU1pzSlRHNnFYNHZlVmZoOTR4aDNRMkJLSkxTYThabGFXVkd1bjRB?=
 =?utf-8?B?eEVDR1ZhK3dIakRvYVh4V0c0bGt6b254SWtzN2R1bWpuYmhMUkhWTFIrT21G?=
 =?utf-8?B?SkZ5U1R6cnk3SVczR3dsM2ppMGFXOGJxMXlhaWZqcFc2NHNhaDBzM2thZ1l5?=
 =?utf-8?B?Z2tmM1dGMVZLT2pJTWRDWU9MQmlzTEpxbGJFRllwTXVJUmlLZTY0VTE5Zmhk?=
 =?utf-8?B?NDBqRXc2ZURKdVdLMmIxVmdTNWlBbzAzZ29wdzlpNEMzV2JubWV1eE4yMis3?=
 =?utf-8?B?dnFyai9WRTczU05Bb3JkK0ZvMTlUcDFPdTlHUjRYZ2cySHc5UGUzOFIzZHZQ?=
 =?utf-8?B?OTA5Z2ZmZHhpVVArMy95cXNqeTRoMHFDQUcwRDdOUnIyV0RHSVVVbnpscFZZ?=
 =?utf-8?B?Ym12ajd0SWcvemwzYVQ4VmtpaWZmUlVnUHVxZHhpU2N2UmpFdXlDSTVXNlR6?=
 =?utf-8?B?a2R1TjlQOTRUOUtNL0J2NzdRSDlwMGx4MUFPbTk4SnI2NzB3NkFTUXFpelhk?=
 =?utf-8?B?RHh0bDdiUkp1T2NLN0NvSVVRQnNWNEx5ZytrTlNlZ2lRR2pjRGtQQ3VpUTFG?=
 =?utf-8?B?VndZbzlaSlA0MWZMM1grdGkxZzZ0QzJJVWN1MnFCTmNiamlZQk9SNXJYWFll?=
 =?utf-8?B?Y1JVNHRVWVF6a1BrdFIyYmVPVFlzbm1WaDluL3ozUEZqK3FqWmlWdEhPL2tQ?=
 =?utf-8?B?WWdLL0Z3SEJLSnhycG13TzZIN3kxRy9FWjZzd3lVVTJQZmRhd3Mwa1pCNFdw?=
 =?utf-8?B?ZUxBeTkrWFBjT0NPTXRYTkYvT3pDK25ha2ZibnRRRGZQOTJibC94Z09Raktu?=
 =?utf-8?B?UGE5TU1QSVZCMlJXMjBlR2dPemxlQlllQld0OWx1Z1BmSThzbnYzWkdDaEdj?=
 =?utf-8?B?d0FwRytZdlVBZFl2eC9MczN1N3Q5N2RBR0syWUQ5K29tRXZ5bm5WVkpQb0Rr?=
 =?utf-8?B?QjNWMUV3bkN2V0d0cTNYSUI5RVUwUXUrUVBuSHIySzZXQzhjRmpZbHpNcmpy?=
 =?utf-8?B?R3ArdUFtdUlqaWs4U2NWOWhiaEFicW5Sb0tsWk9Tekx4Wm9KMFlGNk5uWkdy?=
 =?utf-8?B?NVZEYjBDTks2eEQrdEgxT0pBOVVqcHdXUHFxazBXOEM1ZkRCdEQ1ZEZxd0pW?=
 =?utf-8?B?TzViRHhJQXhDTk9ta2tLbmNBOEhsdGdDUlZ2eHdCMElWSDk2N2EvZnFSTjVP?=
 =?utf-8?B?S2lCamVjUGZhQTFjYVdnbUp1b2o4TXByUjJIeENkTHFzK0szQUxJdkYwaloz?=
 =?utf-8?B?aWJuTzNOcnZSMk5UaytCREozU2NoNm0rL2VLUVhzTGZPbEhpaWVzNTVsOFJI?=
 =?utf-8?B?WnhpRmZUUVllaUVzdXZFZy9icy9FYldFNXMzdXVkK044SkNPUFFva0FqbE05?=
 =?utf-8?Q?p8OuHX4bV16IZ8Z3ex8jXjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31606684-6784-4f05-11b9-08d9e011eb8c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:49:42.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOe1wES9LEnnS2pfpwQY+HRHVljIseyJk3WccaSh+6pXi8gaa9rRsnEn05nxgLuz74Tj3QbJF8r4KFAIiUk4KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

The addition of a helper to generate compatible policies given two
inputs has been removed from this iteration, sine Andrew Cooper has
posted a patch to set the foundation for that, and further work should
be done against that baseline.

Thanks, Roger.

Jan Beulich (1):
  x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf
    contents

Roger Pau Monne (10):
  libx86: introduce helper to fetch cpuid leaf
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libx86: introduce helper to fetch msr entry
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h                    |   6 +-
 tools/include/xenctrl.h                  |  44 --
 tools/include/xenguest.h                 |  26 +
 tools/libs/guest/xg_cpuid_x86.c          | 607 ++++++++---------------
 tools/libs/light/libxl_cpuid.c           | 205 +++++++-
 tools/libs/light/libxl_internal.h        |  26 +
 tools/tests/cpu-policy/test-cpu-policy.c | 326 +++++++++++-
 xen/arch/x86/cpuid.c                     |  55 +-
 xen/include/xen/lib/x86/cpuid.h          |  26 +
 xen/include/xen/lib/x86/msr.h            |  20 +-
 xen/lib/x86/cpuid.c                      |  91 ++++
 xen/lib/x86/msr.c                        |  41 +-
 12 files changed, 925 insertions(+), 548 deletions(-)

-- 
2.34.1


