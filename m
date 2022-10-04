Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699F5F46E3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415641.660258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofk6J-0000HQ-6B; Tue, 04 Oct 2022 15:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415641.660258; Tue, 04 Oct 2022 15:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofk6J-0000Er-3N; Tue, 04 Oct 2022 15:44:55 +0000
Received: by outflank-mailman (input) for mailman id 415641;
 Tue, 04 Oct 2022 15:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofk6G-0000El-VR
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 15:44:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7add891c-43fb-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 17:44:51 +0200 (CEST)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 11:44:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5069.namprd03.prod.outlook.com (2603:10b6:208:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 15:44:42 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 15:44:42 +0000
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
X-Inumbo-ID: 7add891c-43fb-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664898291;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=GxM3JauTJ5kpdlfkv1k63x6Ab+AQz1agpnsqWVvPhSM=;
  b=aLad+PJ0yQkdfaLUF7nbwK7VlU3ORH/1Wog8d7Xy5idfEVODZu+s9Mti
   BOhu8MT3Jz8JZFvtB/YNj6Mbr7VR2OxAklh6Zlf+2GLHtrphmA7bNpNU/
   YN/7J2ZtP9y+tHvDDJOlM9awBJ+7qv3LcVlH/VCex5ZJo6JENFP1ViOS9
   k=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 84475543
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ICD5UKLu/yT+BhBrFE+RKJQlxSXFcZb7ZxGr2PjKsXjdYENS1WAGy
 WcfUG+HPf2MZGCkKIh1Oo+//BwG6JfRxoc2TVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4G9A5TTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FdA1o7ZXDk5rz
 ONGAh0kPiq7hOSRnb3uH4GAhux7RCXqFKU2nyk6iAr/VLMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T+fFfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPlWbary/w3YcjmwvccoApSoaCp8c7jX+a4G1QBRkcEneS9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBByFrsbCTYWKQ8PGTtzzaESIYN3MYbCkICw4M+cD+oZobhwjKCN1kFcadsNrxHj3hx
 iGQmwI3jb4TkM0j2r2y+BbMhDfEjprDQxMx5w7Xdnm49Q4/b4mgD6S37XDL4PAGK5yWJmRtp
 1ABksmaqfsIVJiLnSnVGuEVRun1vLCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUqzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:/u+RcaoUr4vb539m2+aheWEaV5vEL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFmbX5XI3SJTUO3VHFEGgM1/qH/9SNIU3DH41mpN
 pdmtZFebrN5DFB5K6VgTVQe+xQuuVvm5rY4Ns2oU0dLj2DPMpbnnxE40ugYzlLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmX+zpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+78oAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKjQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgAdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfRsRLQkjQ9o+ao7bW3HANhNKp
 ghMCic3ocfTbqiVQGVgoE1q+bcH0jaHX+9Mzg/U4KuonhrdUtCvjUlLfwk7ws9Ha0GOuZ5Dp
 z/Q8JVfZF1P70rhPFGdZI8aPryLFDxajTxF0/XCWjbNcg8SgPwQtjMkfwI2N0=
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="84475543"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7ofW9gwG8Xfe9FztL+AFwhG0lZwrphGSme1sQA02FwASE1Cns/4uwyDv+XQLhejbVW6ZAGVmdX6qXdf3okYEo/mpte8rbQtv+PXBKV8IMaPpJ/ktfp5n82bGp+OiY2yfzjlDA9adBeQbwdj5+rbLTh5NCMEhSTGZBFBB2HqAOnQxJ8b8mrtlQzQTcU52Uz2DXvPxKZpVhmGbZDtb06nAmLcQcjDU/4irEHN7Yk9P3LU18qcNxlhX8vIgxeUswt5hSJ1LzwZhxHX9zjnx8Bf1m1R6N5VCoLWreUuFniEdw6/uB3zhQ8lYl2nrnMIBwtR2uNKiMvY3KZ3A9OiylelPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzHhUgUodl6F+UjPZ8S3zyC2KJRK1vQbJC/liYezVJw=;
 b=JtDaUjoHwKJB8siMXaQW3dcxu8z9CC3WXG1+elbOIoJaFAQZgLvn3TmgYMWmbjKYBsQgR1HdOc1DfJC9OBYIKZDbhwRGwcT2/QXr0Y4iY0zv6B+Gd7PxMX+5t5fzOPBIJCxHULIiTn8hIaOmL+A9GZAT5/UPuQ1L2lnDQNeZ9+MoCoIApn5SezPtQA7QsCG6H1hW8l3hfH+kaKXE76O7KbreFHC0gkLkBTjUi6G7jrKivZW0pQ+SG+T7N9v64ipSz0i3zMtzOrV/O0mDJK8rs/8bUz6YNyY///pV4KLW8E5TuBIooZupb+njUy4syPnRsHmMK+a1MmqJFucgOavQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzHhUgUodl6F+UjPZ8S3zyC2KJRK1vQbJC/liYezVJw=;
 b=ZV+c+d6puHp2Nc+sMUM9PluYcOTn2OWXgYGAUgJF4iOMRX4DLjk/qPEbe7utb8sqJ9QrwwNbsXnXlIqAW01+qvFP2ZN1eiU6uwQVsvQkkmm315VMzHoyRPhLMcRGYP6FQT6/K/83ode08LXdaFRvq4/1xbzoLwW/FfuiNr34KXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820 reserved regions
Date: Tue,  4 Oct 2022 17:36:45 +0200
Message-Id: <20221004153645.3686-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d90215-96df-4a21-2ec5-08daa61f5ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iI89q8pOOJ+ROKqvTi5MtcMpVh7gmHeYCHrKL25R0SRGKhhMQxWXKc/QKgzJmBUaEh7V0qNyCIHf8344FeQtJVVJI943l4cSXfNx94bhrISJjLvhrXBoipOfaJTYiWCLYqu0ahQMV4B/rwThAAOELuNbdRLijrPMjECaS6gcNHmf8J5J/a67oIOf4W8N/Z0Ib7ybmBiMGNh6eQjYqTXqkIoDMD9YYMDMbKnBqhC4DWvoE8DpFHRx4qqaoQ8t5zZ+5Hlqsk4Xsx8Q4rFPVhsVbKx0MTBq/+smjtcuu58dbTN/cVKzNjfOlOU5o7byiUzWzrV+7GYiXpzwP7j5v3P+Mzt2UP+pRFmUg48/3m5AkaLeT9oRaypJ6cOqJLJJK1zyJ4qeDcPQNVpVKidGffJI+L9x3vvX/Q+cqlvl3ZUIPpvdQUhVLHPm/T4kUd4Ihy5AE6v8couuTMiKf6Yx2e3jmde8Rh8cyMmiwoSuwCzZ018BRs5sT1A2O9rEmPQDfRxR/T7xusmXibAbsVV1voFN8zYZcHP1pboIrf/Y+P4V2cRxd+0mZ49OiQZfzgj9rOjSGXciGwFnfQ2IbT6sz3XYNPSsCdVrtSDNvm2PIJemD6hxssRC7q67hjUB/o2imjGtKHg66xWhW3hkAV5XAhl7BP0+dSqTjKqzsTmu3EFGB3pWgg8z6EdFHbIws2PQ1SYSsjtXZ9RGCWNIEtnASe3X7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(6486002)(5660300002)(38100700002)(2906002)(478600001)(83380400001)(4326008)(86362001)(8676002)(66946007)(66556008)(66476007)(6512007)(54906003)(26005)(6916009)(41300700001)(6506007)(8936002)(82960400001)(316002)(36756003)(1076003)(2616005)(66899015)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEk5UnhmWW4rcTRsMmd0RXVHY0lWbVQ3b0RtUWhmZU42SmZCUG1FYnVQUGtM?=
 =?utf-8?B?amxWQmNYQi9JV1NaYS9zVFd0YWR2SmJGY1ZTZmpTcnJUZlVmUzMwemN2VTlC?=
 =?utf-8?B?U2JqMi9sYjhEVXV5NG01STRxNzdzUkE1eGVxZzRwdHBnUHdrTDFRdXp1ZGk1?=
 =?utf-8?B?amd3S1YyZ3BlQjcxOTNOSDQvWmhOTzU3TVprbVkzb3VTVXFMMnFNcGZGWGc4?=
 =?utf-8?B?Vzdoa3JEZjFKMndrTHFrdnpmWVlRbUJLZjJNa0UzSWtrWllOZ0E4dlVCY1Jy?=
 =?utf-8?B?Q3B1ZVh5Y2ZFa2JhaHJWQitBOHJtVWI4b3NIN0E1dm1OUTAxYTFHQUFwSUVv?=
 =?utf-8?B?MmEyRVZ0dHgzODY3d1NsUGllalZmbE1uUzRDZXlBcFJ5MjhiaFVsRGxTeEZl?=
 =?utf-8?B?QnFUa0NsRnNTeXNGTkJPczNacW56anhSdHRtdHRiQThiZVNxZGpKUkRHU0da?=
 =?utf-8?B?NHZkbTVMVUYzTFdaZjVYYXRBQWRCU3gvT1VyQzExUTdDbHVPc0xvVHNxSFA3?=
 =?utf-8?B?bDM4SUlKeG9oQldXc0FiT0xNU29IcVc3VXpkczFaK0lCZ0YzTnljOGhIRnRa?=
 =?utf-8?B?bC9NS2JJZXJLVUFwSnprVGdiWG5Ja3lsYUkraTJGc1crTVY5MG85VTdDZC83?=
 =?utf-8?B?RS9mTTJNSEl2WlM1SWRpd2o2YTFQY3hmalF3R1BiRVpyak9ScUdldEJRTEkx?=
 =?utf-8?B?TnNqbThPWmRVTEk3Z0RrNXBod2dGQmFQemxuVUEzcytnd1ZtaU4xRVBVVzhD?=
 =?utf-8?B?ZktheklBOCtycXVDckVLd2NiRklMTjlkZnhib3hWMjV0L205R1JDcXFHZDBZ?=
 =?utf-8?B?NmZmaE5HZFFMT2pFOEU2L2s3RXUxUTZKOHdoeDJIdjN2K2FTSmxMRmxLMzVC?=
 =?utf-8?B?aDNCVThraXR4dzVFS2F4SnBEd0EydVNrNTRDWStWUVpwb1l6Nzl6SFFuVzRI?=
 =?utf-8?B?TzUxQmlPMlNkUjdoUWZWYlgxTWxmVlV5SzhlRVhMaGwyaUJ0M1RFUk5qTGdm?=
 =?utf-8?B?OHlZSkc4TGpmUk04eURKVVk4RHJTeUV0U1U2cml4bnp3MlJoVUY4bXF2eDdi?=
 =?utf-8?B?MzRIQXVDWmwzdnlTSlkxTkt5a2VzVVd1V3BXSFpNZ0p6SjJ0UitMd1B3V05F?=
 =?utf-8?B?Vm5rVE5zS3NFUThydWRrTlFvckEzZ1JxdmJ1NmVLN0ZMR1JUSFJaVnNMSi9I?=
 =?utf-8?B?WTAzeUNEckJuN3czMjN1MjNsR1M2K2ZJZjdHem9ZMHdLdWJrWGhqMVM5OGRt?=
 =?utf-8?B?UHc5SjJtZHR1NmdZN2FXb0pMSUFwY3FqRXRKMmpZekR0UFVDcmtWZ0x3dDhL?=
 =?utf-8?B?NEhjb3RCV2FBUmpWQUR2Zks5MWhNa2ljVHFtWHZid201OEwxOGc0UVcxWktK?=
 =?utf-8?B?S2FrL0tJVEZTVDNoTGJmOUpHdDJCNFg4ajlVR2ZTR1RkaHkrN041bDNiUE0y?=
 =?utf-8?B?YjR4cUhOVndwdVhYcFBUVnVZTXk4c0YwOHlBUVJHVFJxK3E0S09neXhweHpt?=
 =?utf-8?B?a0lNV09pdzlhcERLd1B0enFzMnkzdVFmYk1qZEIrVzA4NHZ1UGZtWGRNRGNP?=
 =?utf-8?B?SlZGbXN4dlBzRWlldlFQL3Qvc2x3QkI5bC9nbitBeld4MmF0eWpUbWxrWThy?=
 =?utf-8?B?dG81QStNUHYwK0h6M2tCbGhiMzA0REZENTVKNktqb01JNXl0djZDUlZxU1o5?=
 =?utf-8?B?c3VQZEtKajIrQmVONE41aTROekxUdVN4UTR1YjlUM2dvNWNrRjAyaEUxbmpx?=
 =?utf-8?B?Q0s5Q3EzK1gwbkRTRnlSNHlPMkJqeWkyd0gxRisvQVQzRks0bzdUaUtPdG5y?=
 =?utf-8?B?Ymd2TUtTeU8wOHdieGUzYkZzclplNVJObDJMZHRHQy9zbWlvcGZsNW85ZDRx?=
 =?utf-8?B?ZmhzSVpmRFZUaE5JTkpBeW1pN1dVUGV4MmxwdTR2L1YzTWl1bjNuTUc2MHFa?=
 =?utf-8?B?NlNpK3ZxOXNvTXJKVVF4QjNHWGJINXlkL3ZIb3FOd2Z4bytDYXh4UTJoSzcy?=
 =?utf-8?B?N3pTNDR4R3lyVE5qTU94b09RYWZFQXVsanZ4cVRsZURqTnpRVC9jRUdkUXJz?=
 =?utf-8?B?YzVRQlBTd3l0OVRsNUVhdUJHVEl6WC9Ga25FUFZYN2thOEJlSWFkV1hlbFVl?=
 =?utf-8?B?ckxjMWRiem1XeVMzSXppWjgxSXo2a1h1RVF0aXhUamUzakV5dHhhTm96c2hX?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d90215-96df-4a21-2ec5-08daa61f5ab2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 15:44:42.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb7t8+62SdOMWZ7QJmvAZ4VulFXcWwFycnxTSLYigjFA3ezGIOJkFIKQ2EenOUv/BWf6n+QDpdEfFhq7WyTuIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5069

The EFI memory map contains two memory types (EfiMemoryMappedIO and
EfiMemoryMappedIOPortSpace) used to describe IO memory areas used by
EFI firmware.

The current parsing of the EFI memory map is translating
EfiMemoryMappedIO to E820_RESERVED on x86.  This causes issues on some
boxes as the firmware is relying on using those regions to position
the BARs of devices being used (possibly during runtime) for the
firmware.

Xen will disable memory decoding on any device that has BARs
positioned over any regions on the e820 memory map, hence the firmware
will malfunction after Xen turning off memory decoding for the
device(s) that have BARs mapped in EfiMemoryMappedIO regions.

The system under which this was observed has:

EFI memory map:
[...]
 00000fd000000-00000fe7fffff type=11 attr=800000000000100d
[...]
0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map

The device behind this BAR is:

00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
	Subsystem: Super Micro Computer Inc Device 091c
	Flags: fast devsel
	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well

For the record, the symptom observed in that machine was a hard freeze
when attempting to set an EFI variable (XEN_EFI_set_variable).

Fix by allowing BARs of PCI devices to be positioned over reserved
memory regions, but print a warning message about such overlap.

Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/include/asm/pci.h |  2 --
 xen/arch/x86/include/asm/pci.h | 10 ----------
 xen/arch/x86/pci.c             | 27 +++++++++++++++++++++++++++
 xen/include/xen/pci.h          |  1 +
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 8cb46f6b71..80a2431804 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -126,8 +126,6 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
 
 int pci_host_bridge_mappings(struct domain *d);
 
-bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
-
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..c8e1a9ecdb 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -57,14 +57,4 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
-static inline bool pci_check_bar(const struct pci_dev *pdev,
-                                 mfn_t start, mfn_t end)
-{
-    /*
-     * Check if BAR is not overlapping with any memory region defined
-     * in the memory map.
-     */
-    return is_memory_hole(start, end);
-}
-
 #endif /* __X86_PCI_H__ */
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578..6920bf2168 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -98,3 +98,30 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
     return rc;
 }
+
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    unsigned long mfn;
+
+    /*
+     * Check if BAR is not overlapping with any memory region defined
+     * in the memory map.
+     */
+    if ( is_memory_hole(start, end) )
+        return true;
+
+    /*
+     * Also allow BARs placed on reserved regions in order to deal with EFI
+     * firmware using EfiMemoryMappedIO regions to place the BARs of devices
+     * that can be used during runtime.  But print a warning when doing so.
+     */
+    for ( mfn = mfn_x(start); mfn <= mfn_x(end); mfn++ )
+        if ( !page_is_ram_type(mfn, RAM_TYPE_RESERVED) )
+            return false;
+
+    printk(XENLOG_WARNING
+           "%pp: BAR [%#" PRI_mfn ", %#" PRI_mfn "] overlaps reserved region\n",
+           &pdev->sbdf, mfn_x(start), mfn_x(end));
+
+    return true;
+}
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5975ca2f30..64995fc68d 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -211,6 +211,7 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
 
 void pci_intx(const struct pci_dev *, bool enable);
 bool_t pcie_aer_get_firmware_first(const struct pci_dev *);
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
 struct pirq;
 int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
-- 
2.37.3


