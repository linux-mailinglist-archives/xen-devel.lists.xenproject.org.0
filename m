Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A120761948D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437508.691944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqu4p-0006GN-Dc; Fri, 04 Nov 2022 10:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437508.691944; Fri, 04 Nov 2022 10:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqu4p-0006DA-9K; Fri, 04 Nov 2022 10:37:31 +0000
Received: by outflank-mailman (input) for mailman id 437508;
 Fri, 04 Nov 2022 10:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqu4n-0005xA-KS
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:37:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac2d841a-5c2c-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:37:27 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 06:37:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6789.namprd03.prod.outlook.com (2603:10b6:303:177::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:37:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 10:37:22 +0000
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
X-Inumbo-ID: ac2d841a-5c2c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667558247;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6uM5MuBgcSX74kKGlxvVMqzionu1zYXoDgAaMi5MX2w=;
  b=GAGSl/UbckOnIDV+w8QDS33nHbsEE9miTWstpffpMrUHeNYY3RgnBmyc
   FxcRHkZQMMycyg1bxN6r2CIPimDCeT4/8qOBIEIvLtRarYj2kvt8w/Gkw
   QUje185uE5Wd9N1XvFD9v218e8CGETrAyYlK+PUyTL2rMaLUq5Iml5cFl
   E=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 84185760
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d/PTvqkzpjAVDI3OU6wMn93o5gxaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXW3QPfaLNjCnedB+PY/loEwAuJ/cnd82TQM4rCAwEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 adFBz0uZBOfveS/+5y1dbZ0uPxyc9a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+iCN9NSuXQGvhCiRqLm3ZDB0wsdWDi8Nyzply9SdZfA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml6qfS+RffOWECQRZIctlgv8gzLRQoy
 1uIktXBFTFp9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkRbnXttlVqmvgbXdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6jjg7RUqg5wJ9IYKgOYqh7AGC6e4addnCCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:nuV3e6Pd89oJ4MBcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNO6Ws19
 60TJiAq4s+P/P+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="84185760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSw3YaqHp2ySgxfjGXeOCkknR0efhCLPF0dtMe51sNq52LU/2co5WCodCcq3sGteDTsF/Ur/QY8VclXEX2iQG6ffbVy31TGsWGsmoCOEbzF6WjnXdbuHyf8qhsennHUxzJMCDosi347t3lvNfJMs1vf1CuyGhBav33NpJrFAByowjSOXCbApG1SOLUUVHIJyX4EqA4BPJKhjvj12klXkIBlNAI8P4PJp2SEDN1ryMNVwHugy+iISZlMf/Iz6xv1LomO3QGwkz7Rx2Xntq6Qglbz/rABiOO/AJUDQYC38T+UVcLr4/pg/uLhiWr+FxwEsHLHLy12NP2D3bU5K9Uet2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL6bfq7sT17nr7T0dMsMrmMaNYnURrVH0GqNGeAZC+w=;
 b=PO+3gdhIFrV1ezTMELzRMCCMK0BUyau1Ew7sQrn/o45JCT1YFLdnlyL3/edlixpL9fx92r8fHucPc3UUsYXzdiv50O0a6r4rB6MPX1s8D5oEZxOYAPa3pExC/Dwz9gAzPMIQPmtv4QLToC0Zw4H18DZgo0Lmp6UWjuCpl1TxNzimc3a3zZqjp8O5OZgFijM9uk5cuISwGZs/K4lu4SCRPVEekk0cgzF+HtPr79xVJUSb2E22FMoY2Gcrrelg4fsq3X4wSqBVNfJL80eUmkXoctdGMdqvu5kKjCO56cj8UGx4qR5+gSXFbtCruhqpQf1U7Z37PiEWq51ZU0hrlDBmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL6bfq7sT17nr7T0dMsMrmMaNYnURrVH0GqNGeAZC+w=;
 b=ZT/2oYrpw4sTe5sBGG9wPL7HYgeopxhmMJ09cCcAlG+bilRAFDIzXKHnkKDjOCtnJ7GIiHtcMUxjIKyKR6nVFJZstkwAj7PbS0oF8Yx5b3phbYba0k2Ctk9TqDxf5ucXp3/+NgAwpMTPonD1me2lKlVlubV7V06Pxi/rTCa/Mh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 4 Nov 2022 11:37:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Message-ID: <Y2TrXEufvbvuNG32@Air-de-Roger>
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
 <952950b5-33c9-6872-0cc4-6ebdf1e015ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <952950b5-33c9-6872-0cc4-6ebdf1e015ca@suse.com>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fa48b8-d0ed-4245-13f6-08dabe508e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/coEr7Rmha+ftjpYxx6cwmHjkHVi4wG7Sp/S13csuU85aMB9rvq8W1klw3NeXq+lkUhe8qLhyH4eHpsrTDseCwZAY0fn4eSv0NkJG3881eODYRzzjq8jUU7nvO/Imqwy1Hw/4baUTu1dJ/1aN9H/lhiui4cGdMd0KgOIq06+OZMoiHd1bHepjBKOuf9jMFOuRoM+lE3mKuPJJQ9lhDLOOgCotlU1Qeg6FAx7fbjnsPrcqemSvK7nHAtJk3py3xDt7W6paMNjDs94+6tq6CeTNX52Nw7nHrqBnTVCMua436Eu9lhnC/dqjd2zjm6AjAs1KGjPsztITvXNAZDj8DeZa5O+FiSWg+DDLsxaMExsh1EeSSCDaNc1Z2I9wWluV12zEhi5Lj82MXInX/ts/j0aEejMEcjWxaaF2KhOu6t8DTyRur0tjpKh8VBmCiL3KPd25n/gVE4Y25KCzc9v4eKFoOd+k5sGdVR3SmSaM6BiswC3aYkwXEjw62h84Fh2p//YVGA/12hXwU51yR8wgIHSpCjfwUpPWoVBk7ZAb1GKmEna87lR0FsfXZKwDVYZS8JTUb3xkgoncMIrkiKLXfN8VAXvcjx7EJdzrXSAsXlLAJAo0RpC0bxodxGRJVgWcdN5mMg4T2ejpJMvH6x2c7tBOEzg+ntBBxACc1y/XrAEjT5z+f8Kqo/F2ChcxIVvfn2g6+y5aP5MLF9BOiIE4vp4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(6486002)(478600001)(33716001)(38100700002)(54906003)(82960400001)(6666004)(6916009)(86362001)(9686003)(83380400001)(8936002)(316002)(6506007)(6512007)(26005)(41300700001)(8676002)(4326008)(186003)(5660300002)(85182001)(66946007)(66476007)(53546011)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCtGMlh5dFNBWFdvWUhqM0hlMml4dDlQZ3dCY3B5aDJIU0t3VFV2TzZpNnZL?=
 =?utf-8?B?TUxUU244MmZFcGxGVVJXY01lMEtXdUZ1WFZuejlpMlU5R3VWZ3hvL0N0Wkto?=
 =?utf-8?B?MlRRREFxSm1Wb1Q2TWpMdVBScjRhOTN5c2FJb0xiZGU0Ui8vMk56WWpuYlRi?=
 =?utf-8?B?WHk5K0NxcUtwLzJoRE5vUzA1KzBGcnlrTXVqZnUvaUtRYnJnYmVlY0JmRk5z?=
 =?utf-8?B?MGN6Qkh6ZWRQZXI1bWpQelJmSG9HcnAySis4MUI3ejAxM280Y1dnY0xkajZU?=
 =?utf-8?B?c3pKem1ibmZ0MU4wTkFjVHFRa0hQdDRVT3RTaGNhMEEyYzhaNmJ5K2E1Wmps?=
 =?utf-8?B?bUU2YUJnUDFNdVlENVF5Vnpiak1qNHZXQ01LUE5SeUlJWk42TEwwN2RyOWVT?=
 =?utf-8?B?MXJpbWJpK0tlOEc5eUNyazA0cDhCbUpza3U3bkxEK3hPSmhNWWxSNHBEdk95?=
 =?utf-8?B?ZDVDU0RQanVnV08wNGhQVUN6QUJSS0pLY0ZCMStnZTVocGxvVGJmS1FwLzNl?=
 =?utf-8?B?RkdUdnB5L29zWVFPNUVlamxSLzR1NXJ4SU1DZjVONlQrQkRLSFQ5ejVVUlJh?=
 =?utf-8?B?dXpXNEtRNVlraDRaNUgrWTREcllQU0VTamZIMm9OUUwzb25QeVI3MEdvMlVy?=
 =?utf-8?B?QTBXYmRNTDRMSVo2ZFBoOStjaXRpRC9kVEhJVm84eUo2VlV4UFBjRldHNVlE?=
 =?utf-8?B?YXFXVzRoRGh2VlIxaHY4bXkvWjRSQzBDV3hGZC9oV1krZDNaVGJFL3NuUDhh?=
 =?utf-8?B?eGEvOFVuR2U3RE4xRUVqOW82TVhOdE5teEdPRm9FYUpZNmpZNDF2WHRpOHla?=
 =?utf-8?B?WW5HNlhXTEt0eXNOQXFEbURQVEl6WUdtb0d5aUdJQnJuM01TazcrdVNmZE0w?=
 =?utf-8?B?SkZReWptV1hMSmhRU0JGS0ovZmRCSENJaFRtNFFJV1kvYWlEdStmYktmV29B?=
 =?utf-8?B?M2MxdVl6ZElDQ2JFekt5b3ZIUXlXaEpVZnJ6bTIwVko3QTEvY2dwQ0NTTERJ?=
 =?utf-8?B?b0ZsZWc5SmxjcnZsNWNhdUZFNENyYUZkUzZLaXIvUDE0dWJvdGF1d2czZXdm?=
 =?utf-8?B?UFYyaXZZSGh1UkducnBsQ2FJNVJYWVhuY2lTYnduakswSjA0NXBFVXArNnNO?=
 =?utf-8?B?QStMUHQrRHlpRnVPTHFaVHFGdGZOdlJvbVV2ZUpJUERncE1waHAvaUlMNTU3?=
 =?utf-8?B?Mmp3YXJhNGFYWU51aUcxeEpXNktJMDZRNzltUitlM2pMdnRrTkQzdG5tVTFO?=
 =?utf-8?B?MGFOZDY2MFF3SmllZTJZbnpyREdhTEdYZTVEUkFrbEZ1OC80RW5FUzFldjVP?=
 =?utf-8?B?VC9jc2ZFcVdBRTF5QllJK3FQei95TEMrMlZLVWtUdlVPeGIyY1Y4cUxzUlhQ?=
 =?utf-8?B?MStXdFVIV1NONU5Bd2VPVHVRNGNIWXIxaUV1U3FYYTJ1NitWc1RFNFZCeFRQ?=
 =?utf-8?B?VWtWTDRGazJUTDJTdEQzbm9UR0NJamtKUDFMaUlQY215ZXlxUTNhbkxOd1Ns?=
 =?utf-8?B?c0NVYmg4NVlER3hhaXF2SWVIT1JMaWJOSFc5eDVKLzROa0FrRDRRU0F2Z3N5?=
 =?utf-8?B?bExkZDlRRUtFYTdJMUxqaVJXbTNINnJ3Tk5TaGpCZnUwUkIxcmFGanJzSlZZ?=
 =?utf-8?B?Y0VzYkFoTHhqcVFGMFNhVkJrVm1VbHJEalZaZ2REcVNGb3VqN2M5b200VVd0?=
 =?utf-8?B?VlBFZDY2eVkyMkRRemc1UHE4YkZWM2Fldmg5YlVJaFhqUEluQStDZGxxMU9v?=
 =?utf-8?B?MkZ3K09SWVR3ckRoekhwQllYQXE5eTVqY0lwcGdNdTVrZTYxbW5BSGdXcjVr?=
 =?utf-8?B?VGdmRmdlckZkSXFGUHRDcXVVaGkzOE1Mc1c1VWVabWVrcWliTjdMeGhkUzZm?=
 =?utf-8?B?aTRMSHRaeXRwRU45ZE5TRzBKQkUrL1kxSEpJZjFQWmU1R25XczJnZ0lYUGNI?=
 =?utf-8?B?SHpFMmVNcW51S3lUSWY5SkZPam9HM1FBZ21mMkZzVHFWOW1Na01ZWXJVbUJi?=
 =?utf-8?B?Zm9aNmlmUHVZdUNPSGRsTkZ3MVdwcDFyRnhBN3FkVS9pbHpDRmlKZWZQRXM0?=
 =?utf-8?B?eGp1MWd0R1JtUFJ3Wmp3QjFBenFBenBLbFZJdnEwWWJIR1RDWnNGeG02OG9G?=
 =?utf-8?Q?+llGhxZ4vNG1/hx+xgkgOM52z?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa48b8-d0ed-4245-13f6-08dabe508e6b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:37:22.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS8Vg9MRlqtiByTKuU27OWCT0ZzFougXWNVtwE9xSTDN3KvtNdSpl7YGRQY0ONVMwTfoDiY0JOXvVwMfZ1l6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6789

On Fri, Nov 04, 2022 at 09:10:21AM +0100, Jan Beulich wrote:
> On 03.11.2022 18:02, Roger Pau Monne wrote:
> > The current logic for AMD SSBD context switches it on every
> > vm{entry,exit} if the Xen and guest selections don't match.  This is
> > expensive when not using SPEC_CTRL, and hence should be avoided as
> > much as possible.
> > 
> > When SSBD is not being set from SPEC_CTRL on AMD don't context switch
> > at vm{entry,exit} and instead only context switch SSBD when switching
> > vCPUs.  This has the side effect of running Xen code with the guest
> > selection of SSBD, the documentation is updated to note this behavior.
> > Also note that then when `ssbd` is selected on the command line guest
> > SSBD selection will not have an effect, and the hypervisor will run
> > with SSBD unconditionally enabled when not using SPEC_CTRL itself.
> > 
> > This fixes an issue with running C code in a GIF=0 region, that's
> > problematic when using UBSAN or other instrumentation techniques.
> > 
> > As a result of no longer running the code to set SSBD in a GIF=0
> > region the locking of amd_set_legacy_ssbd() can be done using normal
> > spinlocks, and some more checks can be added to assure it works as
> > intended.
> > 
> > Finally it's also worth noticing that since the guest SSBD selection
> > is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
> > propagate the value to the hardware as part of handling the wrmsr.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one further remark:
> 
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >  
> >      /* Resume use of ISTs now that the host TR is reinstated. */
> >      enable_each_ist(idt_tables[cpu]);
> > +
> > +    /*
> > +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> > +     * is already cleared by svm_vmexit_spec_ctrl.
> > +     */
> > +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> > +    {
> > +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> > +        amd_set_ssbd(false);
> > +    }
> >  }
> 
> Is "cleared" in the comment correct when "spec-ctrl=ssbd"? I think "suitably
> set" or "cleared/set" or some such would be wanted. This could certainly be
> adjusted while committing (if you agree), but I will want to give Andrew some
> time anyway before putting it in, to avoid there again being objections after
> a change in this area has gone in.

Hm, indeed, maybe "already handled" to avoid getting into the
set/clear nomenclature.

Thanks, Roger.

