Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D2733A2F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550393.859446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFSP-00033d-Md; Fri, 16 Jun 2023 19:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550393.859446; Fri, 16 Jun 2023 19:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFSP-0002zn-JK; Fri, 16 Jun 2023 19:50:05 +0000
Received: by outflank-mailman (input) for mailman id 550393;
 Fri, 16 Jun 2023 19:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAFSP-0002rW-2w
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:50:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb1c3449-0c7e-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 21:50:02 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 15:49:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5330.namprd03.prod.outlook.com (2603:10b6:a03:22b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 19:49:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 19:49:57 +0000
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
X-Inumbo-ID: fb1c3449-0c7e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686945002;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VMeB9siuI/9soxWItzzypKL6K+3eEMdra3skuHSX+ws=;
  b=PoNXNK5kAJdhVI6Lkrd6hM7aF6C8pBR/IKK/12komO6NvxnWGs68/NAl
   n/mKLMcwTwiHLAm6b+X3RM+PonJj+xPqIVbEAaoS2d2a+uIy3iKTulIdP
   f3UQUGHxoTcoaGcSh+Bc5piEfz6c70xoR4GS718RsF+ZXgSMGdcnKFwdV
   U=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 113519986
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gFEyB6h5rSQF0BO8f4TZmdc+X161kxEKZh0ujC45NGQN5FlHY01je
 htvC22OPq7eMGb8etx0aYnk8xsHsZHQzII3GlRv/ypkRn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaAzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRHMxY2YD+T2t6Qxb6+Evlv2eg5CdjCadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1YLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTjq6c70Q3NroAVIDswen2J+uWctkrgYoIAB
 kMu9G0hkpFnoSRHSfG4BXVUukWspRcaUsFMGvY77ymXw7LI5ByUAGcFSDNMct0gu4k9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt/8HuqZsoiRTnVN97DKmvg9v6GDf9z
 iqLqid4jLIW5eYA3r+3+l3viDu2qp/ECAUy423/RXm55wl0YIqkYY2A6lXB6/tEaoGDQTG8U
 GMsnsGf6KUEC86LnSnUGOEVRujxt7CCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUKzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:YOacmK5/n2rqg/ZEUAPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: =?us-ascii?q?9a23=3A3b/i1GttCgY21oEGS8Tun5JX6It6aVvmwljAfnO?=
 =?us-ascii?q?eDGpsEK2WFnOK3bJNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeBlQTQ4/etUD3S6bVFWzMMn4xoxOxYuIOhsRtKk?=
 =?us-ascii?q?C5fDUagF/ATnagwuOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="113519986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0kfYvniVJiLI/sUTcAFZSeg1mYyor4wDmFAL5KTeeYl00hEYFnh1oJYFXhQ2CDH3oR+Xotr2V4OkzSfrZDziGiJtxLl196UjL63Qkh4fXakNbHeq1imFqNnzL2EEsCMaYjHE8qHdIWZ3U42FfcuxO57FrfHE1hubEFTXRgYBpalFStNIpQQYtsN2FVxgNXsTysH062rrmOhX4HNeZTQqrDlkCpafHtsJn1W6PfOnUO14IZkaBy+7KLRysDuxWbQGOo19XruXXs6924DY9FfcaB8eKiCdoQ4mFM+BGSoDpwou9qa7py2LNm6g1FO0oMWVkmWXbVqpKdfJvX312bNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMeB9siuI/9soxWItzzypKL6K+3eEMdra3skuHSX+ws=;
 b=hhEi1g4+YeKX9C3DyMUkgFT35wk9v20a2QZYf5AD949XuS3Ni/+WY27IZ8JR+KAGctUk0v8RDng8Qv8Vvp8mkrkUMeb0dpFd8MDVwe37aUic7nkuXg2UB76l19LwdvKR1AaslJE0IqQapY7VjjViGj0bOhoAXGX9hK7eSIixPaV3aFGC8IS02GbipbFtc953NoeKzQjrhB62qv5Kvkqr07vJT0Gat/q6RSmqDhyShIIvrpGRhcfexFSfhjzaw2VV2iHTz5dHwR26HPKGxkKRAY3KIW54Wp3ucASV2X4YVDny5+SMhiLuv8xXaUHD+q9lO68f4vAv6/GvSjpz+o1Kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMeB9siuI/9soxWItzzypKL6K+3eEMdra3skuHSX+ws=;
 b=hRWDm2ZzE/n41WfdopyxG2TJbCB+17k9W0wTYzzauSMogCI1IIDVq3NG5/7zuZavttlf/aq2JFgR+WR11bgBgkE+hKhC3XKuYhbPoYSXaGAlMC7ZHYwz+2E05iw9LAnqW9CJUUNAifN6u4TZFeIkjenXYroRoCWGKITBEWLoN8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <89f3e9fd-9cbb-1263-a8ce-c671b52a8529@citrix.com>
Date: Fri, 16 Jun 2023 20:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/4] automation: Add container for ppc64le builds
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
In-Reply-To: <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ca3d98-6623-4b6e-465f-08db6ea2dcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5cPj3PBK/wfOIEzasFJgorD7kt/AjgOBKIaRw5/GxuXqk+rnu84ru8yZRga3kQ7lAUW6OEj2mOinKvdVzwKBSN1bjRxJpC/EpKu7Qb3hlKqj3xEPHcPPagk/beP5moRkXY0DVO+AJbHB5KescRt7qcVnOs86ylwnuPzabZiIc/bMeP4h7IMR3cxLHmkbN6ZlVqXpAW3uiPjie9STAfznKQRREuxhwOqMDzmDTAfvn0OROvff640eQPhU5KV5/PM+WwZ4v2vGrNU70X8Ug/6hMA3TKHAy32kJju1FMaBpVLJxEtdMuUkgKAzi3yqjSEkGlMqu8g9rrAMiasFshCGnxoCOFLPKQcOeNYym6YU1XvqcmZMkOodC5P1+wa14lfrJOg08wzLwayKVblGSe0u34O7sB4hjzOUGARchv5Cjhya7V57Q+9OHFcCoIuirmfyakH24hhBfnwnJbG7qH1WP2BQCCbqvDTc4cf17qORtNrAQWVMCt5+x6IOFvMkFeJaOda8yk+INXiKab3sz20pg4IXKkEI/ddchfSLJZvYVQACrpO9uSmhjlbFob7HSYbT2BIifIIXGRNygA5QcWzifqq2yw4GZzfwVCx36i8dHS0Jt994LdYcTAZ9j4PT7x7GrsESzWcdq2zbHOuI0iDx5hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(4744005)(2906002)(2616005)(86362001)(36756003)(31696002)(38100700002)(82960400001)(54906003)(8936002)(6486002)(316002)(8676002)(41300700001)(5660300002)(478600001)(31686004)(66476007)(66556008)(66946007)(6666004)(4326008)(26005)(53546011)(6512007)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlVrQzYzbGd4NjlkdlNRRDJIT2dqRW1lVWZCeE1WNkpUVUxIdGZIZFhMemcr?=
 =?utf-8?B?ZnpRRThtMzh0UHM5dkRJeFo5dUZFaDBIZW5Xb2t0YWZUNncxbkl6bDd2OTJw?=
 =?utf-8?B?a3Qxd0tWcFFKT0dLT0hYUDVmNWJGeTBNQkZ5K01xM1QyNndLWFhFRUdCRUdq?=
 =?utf-8?B?L0Y2ZzhHK081YkkwUktXMG9CU0QrTk8vd3BQcmJZdkpDSmRLMXl6Zkc5VG9x?=
 =?utf-8?B?UkdmL1lubzdZOFlaMzZyR1o0Z1ZBUHZtWmkwbXdzbHpnYXAvek5ZVjZ6L1cz?=
 =?utf-8?B?bURhOEZGK1pJd2k2czd0ODBhLzc0OEs3RC8rSXZ0SHh3R2dMcU0yU05rbDJ1?=
 =?utf-8?B?U3oxeUQrQlNaVlJZdm8vdDY3clVrZjNUV0RPYzFXUEZtc3VublROWnRjUDBw?=
 =?utf-8?B?NTJzNjBFTVdlWk1DNUoybkZ5YjlHeWRlUkdXcGNyVi9mbmdzMFIzSk5TMXlk?=
 =?utf-8?B?REEzYWp0OGxNejY5TkN6ZTZaajUwTmo4akRva0pGVldQYndLbDRIR3dBWXBl?=
 =?utf-8?B?NHI0T1JwU2wyem1CTk1UUlJZRDVwK3ZFUCtLWnlrcXRMWGI5QTJmd1dZZkJs?=
 =?utf-8?B?YzhGR0lGcGhLNVNrblBZLzBuQ2JQYlVlRHJJNTZPenl1RGlPZlFEWmNpTUg4?=
 =?utf-8?B?YTVDUHltS3o2TlRVSjBJTDN4VkxsZ1I1eHY2V3hIZ3RoWkc4WW12UEpuK0dj?=
 =?utf-8?B?b2l6Z01VTys1ZXlINEhtT05vSThZZjg0WDZobXkwTmQyYnZiWjhSN2N0VDJn?=
 =?utf-8?B?amN2Nlp0c2loMUZpU2ZjSnhCV0NPVU0xK2l3SXloeDJmNDBQVG0xSTF1a0Ry?=
 =?utf-8?B?dy9JR3RkN1hmbGVzc1hBSTZyMk1tL1A4UDNndUt2aURYUFVmQ3h5U2dlRGFB?=
 =?utf-8?B?cnBKbXI2WVFsQVlTQUhJQWNlVmsyYmQwejl6aEpXSXhzR2ZPWnFCcGVUYU1W?=
 =?utf-8?B?T0o0Tk81NE9yRUJWOUhBYzcyVm9DQnRPRXNXeUJJR01NZHhtWjkwNXk3NXFn?=
 =?utf-8?B?NEhITVNvWUJlenB1ZEtTem5icHk4S3hnSFBLMXVFaWc1ZmpQQWhBZjNZS013?=
 =?utf-8?B?cHUxRnZuWXd5enplWEMwdmZyUVowYkRjaUduZGdVRkRxZFN6RjJtQm9zTHJD?=
 =?utf-8?B?OFkvdW41UXQrVmg0MUE1R1dBY2RXRjNNYysxU25rbms5Q0VlSzRFUTYwUnVp?=
 =?utf-8?B?UGxjV3liRGJnUjhNcXZRSE5CL1oyeEJWdTYvbzFQVWxDZER4Qkk4SEgwRjY4?=
 =?utf-8?B?ejhBWERxd0R4N2Y5R1N5NjMrb0Y1S0tEc2pSWEZVRUJpcWphUWhGNHFqdzdX?=
 =?utf-8?B?bU1UbHFLaVVRckx2RW1GLzBtY3FvdGJYcldzVTk3NVBnaTRKZ2ZjOGV1UmRv?=
 =?utf-8?B?ak1HQThUVkgwYUNLQWlCQ0NRaGZ4NStNZ3VnZlFkbTlXY2o0bm1pQmc0ZmNX?=
 =?utf-8?B?dkNOMWJHRXhkRVY5aUtELzhqS2tveThITzNtckFDR2xOanFHNnZkRytHcFkr?=
 =?utf-8?B?ZFhBaU5EbUNWZUVpWGpIV1NGVldodzRkT0VYVlhsUnFQeGNSSXhhSjZDNm4v?=
 =?utf-8?B?ZDIwd2ZBR1ZidzdpOCtER0V2Uldob0dtNFVBbHlvWEdWOXRxTnp1alp3akl4?=
 =?utf-8?B?MDE2aXV0OGVGYXFzWG00L1ZUNXJhYzljTjA1SDlqV0JScGZNOW1WV3hDZDhU?=
 =?utf-8?B?SGZZR2JqWXE4cXVzdE10dXAwRUxuVGZyekZMWWR2bWxWbGNzOGRJRCs0bWhi?=
 =?utf-8?B?NXV1UHV6d0syL0hMc2RGZGNOU3B5MHRVeVVuSEhSUkFvamVuT05zWnFxM2Vy?=
 =?utf-8?B?YVd2cmJJcVRuSW1xWWw1KzNNNmRtaFJZMEVnb3Q4Y3BDYXZsVFR5L2tYUGwr?=
 =?utf-8?B?WVBmN282TS9oSTlqWGdpNTV0V0VGMm1RRWpDckVuYktNSWtnZXNpS3JNSUFG?=
 =?utf-8?B?SGtlNmZEQnhhYVZPK0IyWGYrVFZVNGdveDM2SU03eVhpZUd1OGdzT2lQMXlI?=
 =?utf-8?B?cDhHS0MzcnY2TE1yczVtUFJ5VDREeWtkZ3ltUkdDeU5ncWF4cUt6K2FyUm96?=
 =?utf-8?B?Uk1hY215U1hmZm9PNXhmVldacFhtVlNja2NGTGYvZmh1WDJDcHVESVZrdEs0?=
 =?utf-8?B?amFpL2tSeDgyc0R3NEZBVkR1NHB1MjkxNHJvcStTM3crY0w1T1dSTkZTWVdj?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ti1mcHykdV3f/5mTfC+ykVuGBFQ6KKLJ60mVy21bU54OcbQrPYMHytpqmg1ruxr6kY+NgS+04kchdORv/FXpX+V3+p8pkia69KoqDiMz4CdItYCIR57j3f5AElAYDhBliN37yoGidGiqE99yRdGYcYt44ZOwG5hvNIq8p9QqWhAT4ec0tj8nEwUHvynTL/JMujpbePXksy7AjsyTrc2W4xBfQ6zRfZukPZXLBGg5jZzgHSw9SSnoNqHv7xc1K9A3WBP4xOaG5EH7xdfFCeCc/LNT5oP72i+QlurrUJCx0CLHfwG5NRZqyitqLgUCPPz7XPz02Qlt2jiiLlYYtMpgD1CVcPK1qaT9AcQex3LYbPY/ROruL7J90Nra106HApvA2N2JZztsJHe9RBZoDTZPBrfcxhLzsJA8eCQhd9prDdW/yWKOWPVdmbUfCwBVVE9fqP+h/K6psoVI81jTVXFXzFcLCQGxcgR0rAexBprVIz6SmP95ygLlx1cdHGG9wAYRDxqkqzqrWiBL/UV6oGF1sFtD1OQC8lOp87u83W+G4shE5F33vkkv0p3thoLz6AdYn6PO7Sgpqrv5PrkB/eDLp4/qQ+gkSZIt6cCBix96SgfC1k5krpoNUJ2MaPsmgsUNb5FkL5ky0eTyVrKUI2+6SZdakXo71V7j3Au6Fhke4R9wbvQ1kXBf9wnHRU3C435HF0Bh2KP+ifxnde6aEWrHGG256pG760XXrH4m9//pfHZWfwYRhIHExFT0j/6EWLyTB3v2i8Oi70BKtqKHUXOZrR62pM0G6/Mkxfh7QDJyhWntXn6HOMKRv/pbHwH7ej5FSCbKj2OKO8Sz8WDQXFYnX8AlbK1oUAz8InAhR+Un5ILpPFHlihqPAxE4KugI9AzYTWa88VgKzFw6NIBvlb5Jgw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ca3d98-6623-4b6e-465f-08db6ea2dcbd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:49:57.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnqJ/ZclWoqsdzlUgF64PDfBLNYUbh1zjRPru8xiTWdZDhMb3TeI+q8qdtzTmEbYb6xwhtuje9wu4FyKpbmazg8ET0C5y3vh6IfPXoep1cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5330

On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
> Add a container for cross-compiling xen for ppc64le.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Just to say that I already committed this patch, when rebuilding the
container.  We likely raced given the time you posted the series, but
you'll want to drop it as part of rebasing onto the staging branch (if
another series is needed).

~Andrew

