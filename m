Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB20757C18
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565179.883124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk43-0003mv-6B; Tue, 18 Jul 2023 12:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565179.883124; Tue, 18 Jul 2023 12:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk43-0003ir-1g; Tue, 18 Jul 2023 12:44:27 +0000
Received: by outflank-mailman (input) for mailman id 565179;
 Tue, 18 Jul 2023 12:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk41-0002IP-Ur
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ffebea-2568-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:44:23 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:44:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6228.namprd03.prod.outlook.com (2603:10b6:5:35c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 12:44:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:44:18 +0000
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
X-Inumbo-ID: d1ffebea-2568-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hCgfqa99aIjybw0r0e16yWne8XxslcvUQBLlF7gjjSw=;
  b=QcYIFx4bjvPso54iDLpBPR2JYJX9wqvU5zDTojwqdBn/DPNqeuJdAGaS
   ztsAEl+cPoJcP0dgYkEVdqdIGp/ABoySOSHEEeyNuMMzwIlESqISWhUOp
   yBf6MOSWcJQijXfomONo9uu8LV9lomMrJQhomnhO20UPmVKoScrJ1ZmzP
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 115292242
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jKGBsqKlsknkD1m0FE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS1mNTy
 2cZC2+Haf+NMGXyeNx3OYrk804H6sDQyIVkQAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pXF0U8
 foVdAkgMDzehf7rh7C+aNFz05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv127Wex3mnAur+EpW82a5OxwadxFY+IzImU1eqvNCJpGGhDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mLicSHbY/LHEqzq3YHERNTVbO35CShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:niYq6qodJNnauVOIbxYIdX0aV5oUeYIsimQD101hICG9E/bo9f
 xG+c5xvyMc5wx9ZJheo6HmBEDtex/hHOdOj7X5ZI3MYCDDmE+FaL5P1rHD5RqIIVyaygc+79
 YFT0EWMrSZMbEdt6bHCWKDYrUdKbe8kZxAjN2uqUtQcQ==
X-Talos-CUID: 9a23:vEr0b2734+aYBOUAoNssqhMoQMQjfyHk4Sn8fk2kVCFrTZ+tVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AnGZT8g1GLnLlsU9jU3Of97iY8zUj54v+LAdWn5c?=
 =?us-ascii?q?8luKrBSp8Kiq0vBqYXdpy?=
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="115292242"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrOrcUCYGgBITWqHb5MiO8D2RjiZ5/TAPwfSdBLIEwGKXixFnAKbKXudDro36liAZ29023xrAKC1m9dXmYn6tzrlD8+YSPDyQqxPDLvy9I/MlIkQkPk8cXtsS+UVP7zBvM1B8Uq123bdjEgtI8bxiVufm/pRuWxzLgz6WNqpKMeM3RHdnK9OrLFScapI/tlR5+BO+6+V56Qkvf4DkAjUG8uFCOkj4lnyvkM1n3utw5qBdtyq+qwO4wFW25RtJofslftmR/VKkhCbAvT3+g88wwbpOpi1OQ6zBfoYCNUANSHoz/uSj0RJOAS+kyhdbZ8KocQgLp7HGMIWUaToVz4FjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iXg4dFK7b5fi2DFIu2Ng5SgE/oKjRZe5KO1fq6oWYI=;
 b=coNzYb5K0WPWz2eAI7Ay9BiCljd6BE+BUCjMAAEg4AS0qewq6aziMeF2KC/FcAuhPEk9+iHe94v09jbQZrMC5w13RRAI/wAcB+FCEKTeM0OvoZ4gEkcTNYksD3XovzuuOdI3z1leXLAfCkNWUeBYoNU/R06U9EQ7FR4jpq9wElJro5KGmeNpodlPjdITOQ+FL4wnl0CmaS1B1Gn/D/KPiKYZYpHwspdj+LBmkkMpLF9bdoizUJOBoiL8w9I3OfbSxORVn/a0ocLa8jgrO7HKLomBFmk74zoUTA24raWFVf53diXeDy3/Hj6F+6zgEURQo00SEzVmndY1hBNoiVQoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iXg4dFK7b5fi2DFIu2Ng5SgE/oKjRZe5KO1fq6oWYI=;
 b=plRniVmTRIOYiv0yfZQQ/j9If6juZ1dD2hW2A4fXREBNCgiHAiGHALTXaeKu9+Mx/A+TWp/YMScJ5rHiaW6K/4xcCY75/0TxIoELKs493aDh3BjccX8aEO2ZnM9AuVGHZM0ErG/156YYJ76zOa+06RUmfW8o7Tqb1XmLg4Cafxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/5] amd/iommu: force atomic updates of remapping entries
Date: Tue, 18 Jul 2023 14:43:34 +0200
Message-ID: <20230718124334.36548-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718124334.36548-1-roger.pau@citrix.com>
References: <20230718124334.36548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0685.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d1e4a2-5383-4753-9cc3-08db878cb3c8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	clir5641M7Bu5qwJaOwC4H5kakyPAq9Gww7UN9bRviMzNt2Kp36CAefGRyuZeZpITBnN3hHJLyaU3CDb+6W4sh3tLt4hgd7z97mfRTo0kkMipnAxQxBJ+AxSgePYQxCCYA2RpRgTm82UMtV3DU4jzr5mKmH/0L1bObFNsV87untf/8Q8arwbZE6DvWpKvpuRLBQXnI1e6n3/p/+iktDuA49pGf4gGVavsO27lRWYJCxKJJ8jgOSb7reBjub+Twr+DWTnDd0LOovhQimnRvHjv2JeaX5aRKiQAuG5arXfMzNKIjSXhfutwGjWyqfXU88gcc8XcHS4HD2H6xnr6N6JGnA/CZkRtXHyXFpswoK/Vuvw6U0zZrqoDNOrC0mDM4iNLEVoTYm4LpK8UMcz4kdKR49PgGP4o06okdgmuqjEOAgY03ugNgp+CqN8hM5ZejGlbclKtQwGJspgWjTL9efUtxEBhuUdialg7Nf7NSItaaQQlO3jyyXmq7NU4xezT3i9p2ygLspc7T+J5GRd9/oPUVjg9lEqBWBub6ReqAaPhMdTAIZvZPHw4kzAPMT1ylQa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(54906003)(478600001)(6506007)(26005)(186003)(1076003)(107886003)(6486002)(6666004)(6512007)(2616005)(83380400001)(15650500001)(5660300002)(86362001)(38100700002)(8676002)(8936002)(41300700001)(82960400001)(4326008)(6916009)(316002)(2906002)(36756003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZWNm9JTTArOXRDbmwxdnQzMDlXMUJhZ1RXaDJvNHNJeGtsTmliWXRQbVFK?=
 =?utf-8?B?bStQaUw1cjlMNHQ1UGFxcmJMTWJGQjhSaFFhK3l5V1g2RCtUa29KNXc0dEJX?=
 =?utf-8?B?NTFXSFV3bzVvUjlGOUNlTkJpNFY3Q2FWTzNRY3JqZ3pJdGtxTUFGNWMwVFpE?=
 =?utf-8?B?WGhXNG5hVlpSSGplbkRZcFp0Q3daOFFmVTM1dnpiUVFlM0ZyWXl0VGN3UHo3?=
 =?utf-8?B?K0FTVlJ6bytCZzY3a1ZXbDJaa0M3cDVuMURvOWRSeEtZWGV6SnpaQjlUdGl6?=
 =?utf-8?B?RGdRTGVmejQ0eFV4L3lsSm1uR3RSYS9PYm5XOWhONTlzTUdURXFGWkNWYnVX?=
 =?utf-8?B?cTFucFBsYnhJOVVzT0dXR041SWUyYklXUk53QXozOFhjTGlFeWNNMGR6TzFX?=
 =?utf-8?B?clNZWlFZT1VmMHpwRm1pL2xrRHgvdG9tdzZDQ0tHbEVGUUZLTkxpUDBPTFZl?=
 =?utf-8?B?dzVtRWdyRXNWSGtHVFI1Y0tPYUh3L25TUlZaWDhSL2VPaERtUVl3STgvRW4r?=
 =?utf-8?B?TWlscm5yN1ZjK2x2YU11WWIrVnJmNWQrQjRjaU0yaXk1SXVpYXYxcGMxV0Z5?=
 =?utf-8?B?N05vVjkrUk5yRllTZERWY3kya0pURDg3V04yMDNGbnJwMzFHRHBIYkdndHpx?=
 =?utf-8?B?K3oyQlNVaGkzTExzdE4wQzdCRzEzVnVIS0tnb3o0R1RIRlJJV1YrTUVoZnB0?=
 =?utf-8?B?aXlsOW1sSk16Mlg3Nll4aUVnNzUveldOaGh2SVkzTkRza0FJMVFCRTEzZysz?=
 =?utf-8?B?bzM2dTFNejJUSjRiTG42cmdnUUdOY0FWbGJ6ckVaZDZHMmV6NVA0ei9iVThK?=
 =?utf-8?B?Z2VSSFZGYlY3bkQzaVBPdFpHV0ZObW1qaytGT2UzekJSc1Q1dWMxT3VSbXF0?=
 =?utf-8?B?UGNHU0VhTFNBTDZWUzFhdTFjSUFwZk1tQnZSQjVpTTlVZ3lkY0ZKTGZCb2VN?=
 =?utf-8?B?OVdaejM0OTFBTEUwQjcwdCs3S2s2bHN3MnNGaStQR1BXVVA2dTNjQW5oM2l5?=
 =?utf-8?B?Z0RTdzAwSEpHSkR2ODkzYWxZMW1iRCsrU1l4SmZSQlR0UU5hSzdVV2xpM1hi?=
 =?utf-8?B?L21IVk00R09sL2FRMGdSOW5OM0xHSCt5WmNrOHVoN2Y3YnNwcHc4VnNLTmJu?=
 =?utf-8?B?NWNwYjlPOE85Z0J3QkI3Z0J1cHNtUUpCaUhGZDdSbHU0SS9Sd1BhY1F6WDZZ?=
 =?utf-8?B?d1RLWGxPL3JtNlZTL2xRS3RJY09Wa2RENHZFR29WUTh2R1lXNUNPSzl1Qk1p?=
 =?utf-8?B?L1FCdEhOYUxpNUdORklXYWx3dUw5ZXdVRkZqR3NhU0hVWGFZY1RLb28xVnQ4?=
 =?utf-8?B?YkdWRlFKVnBaSTk1OGRoQmkrUndBSG5iakl2UmtlMU1ZeXZ0NEhVUFhNbnFK?=
 =?utf-8?B?TXM5UkM1SEJKZC8rUk42L1RFRmM4NHpoNnpzdFl6ckZZaGJLeDdOK1ZRSTR6?=
 =?utf-8?B?dW9UR2k2WlNWWnZpSTRRenZ6SXZKSTFXRFh6Mis1akovdjJhTkoyblZOZzc4?=
 =?utf-8?B?Q1E1UjVNdFkybDZOeGJYUThZNzl4c1FSckl1SGI5TlR4TVlBVTJEM2h3ZHI1?=
 =?utf-8?B?VDFlUERNaEtkYXYxUTNJOXJhNnVmMVZublRVUHdxVTJtcko3TDZ2SHViQzly?=
 =?utf-8?B?ankrS2VRQjdkTFBjaS9GUHRaU05UODVjS01hVy9HNmtGVUxkTDN3M2lHLzBx?=
 =?utf-8?B?czFqTCtvdXV4R0ZRNUwwSkdSY09iK3c3elFLaVN1VDRiQis0UU1YMjRHOXk3?=
 =?utf-8?B?TXZKNEUvNm9obmdWT2Q4b2MyNnBiQkQ1R3JTcUpZVTR5NjM4RlNITnhpMGR3?=
 =?utf-8?B?aUJqMi82cis0WjNsVHpBUTFLOWc3TGM5U2hSeTJyQjF3Z3NWTDVESThmY3pn?=
 =?utf-8?B?SHRiKzNrd214cTVmcjBCQ1ZUYThEcnNvM0JFR2tqTVFmUWZyeGhRRDRFUFl3?=
 =?utf-8?B?YkNHdG1QamdpTzlmZ1dKMkxXTlNGSlB0cE9vcUpBT3h1d3ZaczNDM1RpU0c1?=
 =?utf-8?B?c2dLTSsxU0dzWEhtSGNCNENNTXVZa1FwM0VSQzBRK2JteFpoQ1JLQkF0UlhS?=
 =?utf-8?B?czNZNUVHTzRPRG4wc2EvSGFmRzBHSW1KRWpmcFhMQ09Ia05vV1hoSkJvWnY3?=
 =?utf-8?B?YW8xT29PUzRra3R0c3BFU3VVcmtkSGdiQlBmUm4zUm4vbGRSelpiSDIxYzIr?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wvlfKmZZLOhhzHWXhkliD2b8FhziqGWK2ua6YTuVUptXUVONI6LM553JhZRH5bDrsBEMRhmjKu5rkyzpaolCUuPUZdMol0mSsO9AYYfkKCDHwSvvwxM1X3tvO5luCseP03AZJ8B7TadTtjIKr86IPtwKkwSsOrno7WiM9MXwxabW+07qtX+YOV6/sTlKxe6ACKT72zvVIT34VbBoyVt9T8pVCg0XZp/66PDFjaGa9BeDTxzn8TXnbFw2FA8/vQ8I112F5DOhim03s02yULkXQvofIj29Esa6c6bYTJoDDVAUfDcPd+PyZ9Rr6LHMoFXJgl3C9JK3MTNIkqqPz86MmJWdEpfnDE9qFVXoPGEhpQEBd16L4Iwhcx4GMCZwAI793NF8DIcr5P+WSVkXB8WGmAFYy5E2R4qA9WdPXTIRyiGLSawyPCEijZXoftW/8rBedki4NGlOTIFDXIEVbQ9siPvAcyNa9xgku31Vg0JPvynEAx9OQ/G5GJC3M1SF8uqvYHIGC3P4KlIlGAjeh7OiczcdR7WxdVyTcKm0B7RWM3h8OZ/+4tDsi93DomRJR/9RNeoiw/OK6/J3SBhBqlKucd7PvN0XeDWEeEFZ+WnZ90h5WBruYd+G2FFyXrMtabbnbXYjvmQ1x2axpwzpt38ik9Op9LLPNFpCZ/hx0DgQl77ksmjfdlK2cQlaWA661NcB/MUP9Iobvq3lVBleyB+zZP6p4VuJ8nZw4j8tpFKItf8s7+tBYszr1Ee9vIjl/5u59LQ9diQNVCiCXHqpqAlYSnwUofRqxWeIq9nni9yU3M29MvPOeDxxl9uf/E+ldqGC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d1e4a2-5383-4753-9cc3-08db878cb3c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:44:18.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6uYqf8IyT1/1AJPsvGibuxokpUwa2CnxY6hWhs9al6d2roggPrMYsqEZGGVoujtBGerwxkBOVYw1zrpqMWWZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6228

Disable XT (x2APIC) support and thus 128 IRTE entries if cmpxchg16b is
not available, do so in order to avoid having to disable the IRTE (and
possibly loose interrupts) when updating the entry.  Note this also
removes the usage of a while loop in order to disable the entry, since
RemapEn is no longer toggled when updating.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
x2APIC support was added late enough on AMD that CPUs that I believe
all models that have x2APIC must also have CX16.

The AMD-Vi manual contains the following advice in the "2.3.2 Making
Guest Interrupt Virtualization Changes" section:

"""
If RemapEn=1 before the change, the following steps may be followed to
change interrupt virtualization information:
 * Set RemapEn=0 in the entry to disable interrupt virtualization;
   device-initiated interrupt requests for the DeviceID and vector are
   processed as IO_PAGE_FAULT events.
 * Update the fields in the IRTE and invalidate the interrupt table
   (see Section 2.4.5 [INVALIDATE_INTERRUPT_TABLE]).
 * Set RemapEn=1 to virtualize interrupts from the device.
"""

However if the update of the IRTE is done atomically I assume that
setting RemapEn=0 is not longer necessary, and that the
INVALIDATE_INTERRUPT_TABLE command can be executed after the entry has
been (atomically) updated.

Note that on VT-d IRTEs always have a size of 128b, so it's not
possible to use a smaller entry size if CX16 is not available in order
to do atomic updates.
---
 xen/drivers/passthrough/amd/iommu_init.c | 10 +++++
 xen/drivers/passthrough/amd/iommu_intr.c | 57 +++++++-----------------
 2 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index af6713d2fc02..e276856507a1 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1417,6 +1417,16 @@ int __init amd_iommu_prepare(bool xt)
             has_xt = false;
     }
 
+    /*
+     * Prevent using 128bit IRTE format if there's no support for cmpxchg16b
+     * to update the entry atomically.
+     */
+    if ( xt && has_xt && !cpu_has_cx16 )
+    {
+        has_xt = false;
+        printk(XENLOG_WARNING "AMD-Vi: x2APIC not supported without CX16\n");
+    }
+
     if ( ivhd_type != ACPI_IVRS_TYPE_HARDWARE )
         iommuv2_enabled = true;
 
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index bb324eb16da1..4c6122a099f2 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -39,6 +39,7 @@ union irte32 {
 };
 
 union irte128 {
+    __uint128_t raw128;
     uint64_t raw[2];
     struct {
         bool remap_en:1;
@@ -221,15 +222,16 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
                 .vector = vector,
             },
         };
-
-        ASSERT(!entry.ptr128->full.remap_en);
-        entry.ptr128->raw[1] = irte.raw[1];
-        /*
-         * High half needs to be set before low one (containing RemapEn).  See
-         * comment in free_intremap_entry() regarding the choice of barrier.
+        union irte128 old_irte = *entry.ptr128;
+        __uint128_t ret = cmpxchg16b(entry.ptr128, &old_irte, &irte);
+
+         /*
+         * In the above, we use cmpxchg16 to atomically update the 128-bit
+         * IRTE, and the hardware cannot update the IRTE behind us, so
+         * the return value of cmpxchg16 should be the same as old_ire.
+         * This ASSERT validate it.
          */
-        smp_wmb();
-        ACCESS_ONCE(entry.ptr128->raw[0]) = irte.raw[0];
+        ASSERT(ret == old_irte.raw128);
     }
     else
     {
@@ -298,21 +300,12 @@ static int update_intremap_entry_from_ioapic(
 
     entry = get_intremap_entry(iommu, req_id, offset);
 
-    /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
-    {
-        entry.ptr32->flds.remap_en = false;
-        spin_unlock(lock);
-
-        amd_iommu_flush_intremap(iommu, req_id);
-
-        spin_lock(lock);
-    }
-
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
 
+    amd_iommu_flush_intremap(iommu, req_id);
+
     set_rte_index(rte, offset);
 
     return 0;
@@ -321,7 +314,6 @@ static int update_intremap_entry_from_ioapic(
 void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int pin, uint64_t raw)
 {
-    struct IO_APIC_route_entry old_rte = { };
     struct IO_APIC_route_entry new_rte = { .raw = raw };
     int seg, bdf, rc;
     struct amd_iommu *iommu;
@@ -343,14 +335,6 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    old_rte = __ioapic_read_entry(apic, pin, true);
-    /* mask the interrupt while we change the intremap table */
-    if ( !old_rte.mask )
-    {
-        old_rte.mask = 1;
-        __ioapic_write_entry(apic, pin, true, old_rte);
-    }
-
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
              bdf, iommu, &new_rte,
@@ -469,22 +453,13 @@ static int update_intremap_entry_from_msi_msg(
 
     entry = get_intremap_entry(iommu, req_id, offset);
 
-    /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
-    {
-        entry.ptr32->flds.remap_en = false;
-        spin_unlock(lock);
-
-        amd_iommu_flush_intremap(iommu, req_id);
-        if ( alias_id != req_id )
-            amd_iommu_flush_intremap(iommu, alias_id);
-
-        spin_lock(lock);
-    }
-
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
     spin_unlock_irqrestore(lock, flags);
 
+    amd_iommu_flush_intremap(iommu, req_id);
+    if ( alias_id != req_id )
+        amd_iommu_flush_intremap(iommu, alias_id);
+
     *data = (msg->data & ~(INTREMAP_MAX_ENTRIES - 1)) | offset;
 
     /*
-- 
2.41.0


