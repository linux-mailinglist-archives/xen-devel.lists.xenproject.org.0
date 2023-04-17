Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1E6E410B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521781.810648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJKb-0003WN-MS; Mon, 17 Apr 2023 07:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521781.810648; Mon, 17 Apr 2023 07:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJKb-0003UP-Ji; Mon, 17 Apr 2023 07:31:21 +0000
Received: by outflank-mailman (input) for mailman id 521781;
 Mon, 17 Apr 2023 07:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLV6=AI=citrix.com=prvs=464b9e9d0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1poJKa-0003UH-FI
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:31:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6305203-dcf1-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:31:17 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 03:31:13 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6544.namprd03.prod.outlook.com (2603:10b6:510:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 07:31:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:31:10 +0000
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
X-Inumbo-ID: d6305203-dcf1-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681716677;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wDnaXqysAqoxC0OvRMTcf6nCobQtNHcHueqP+gPJmng=;
  b=f3LTLz6VBFy81yGrouBXfzz2rE+nzCKurhIUHmkL5IQ8so3zmjimprNK
   iOf1EVCuv4HkVZdn9L8RjW4xop/RKczClSwpxFODHFxABGCrdugwMgAoX
   ujAYPje5L2hkQpFGMxBEEW4eSAb5lpLMrccZwp7A6jwY2PEH1P68nq+TB
   o=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 105669632
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b8Kn9amnU2Vi7mdwx5uNsO3o5gy1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXmvQMvjfZ2XxL4onad6/90tVvJPQm9dmHgs+qSA3ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dshAy83bR6Ivuan/bikYNRpmssTPeC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHumBtxDSubinhJsqFPO6jQJITcIbgLlh6O1lku/ZdV7b
 FNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkrMg3QDYt2
 3eTkt/pDCApu7qQIVqe8bGOpD/0JikRLkcFfyYPSQZD6N7myLzflTrKR9dnVaSz0dv8HGiox
 yjQ9XBmwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBa8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:tyykqq0sJ6bd+6HB1EOkyAqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-Talos-CUID: 9a23:v6JZgWBPRNFQf7X6Ew5e31EuGc4uS3nM8X3PCXK9FWlZWZTAHA==
X-Talos-MUID: 9a23:xultngR4LvgAbBUkRXTi2R06Lu5C/Z/3VmZXnYkDuveDEWtvbmI=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="105669632"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MetBibDaQqTTTQRQ9IwmomuVDXwbtMBH6hKFhNP/R8QEdQNstMLHBnhhOZJm/uL3pbPYM1nI3OU6qJZniI9fYVFekeMGzbOnxvavx2eHqBr6/IaLkEP0WRmwHcXN7ZPXGcC4FRr9d/ItCV2XEB5RHIk5a22vlqsATtllQ5VOuGC0ZotMFrhNdcc9vYvVxsOe9lfuBSiDScf3F4aB0A3ugIWWc97yBSUr5hEURsSmFsVS8n/70eshFbWVJG50egDRp1fbonwhOwtrGQ2VL74FB2MN1xahWTsaSNlbJsvh2OudcWN95Xao5+EfMxdjY9XGe0NAQT7oSqaU7VDmzI06TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZn4kzEE6aP9fyCf+9qanmJfpDIZMAhoGwQkQL7qdVc=;
 b=hQUTW0Gv9BifnN4mBMGCkxlQgcKH96nJ5MgHnnV/NybieHuubXbAwkw5Z1Xe77kMbr9NdKz9uLf6mUZ1r7/oN5ewNNii7FmxznsYyWPrtr8P3Ktvi1NJ27Qf51QGNSPzey4BX9Fnks/jog26Db3m+ZmTFk+tyX7oCr7GhFFKA1q8g3nueFxdta0n2fohYtoJfgw5abQ4Vqfocc46hNB8S23MENDcAEPzSPZJyQYSuEX00460gR2AZNL5wrK5tbkzizHykYF6Kfdj0Gvt9nXKfAzMyO6clku6mPVpRH7xfO7j4ZQTy7w3I0B4iKe42ADOusmGUcAGq1j8XeuJRxOxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZn4kzEE6aP9fyCf+9qanmJfpDIZMAhoGwQkQL7qdVc=;
 b=RIabbAp1HytjWWRSJFF+zk+RFDg2+jdJLDkJyTmjOATtIdJKucecGr8Vu4UShqywWV6QwkzdTbKfrmEKpRvKo3D1rzDEyDAeHdZHnf4tTDzFDTHrsmjGGA8qyEKpaXkqowx8GFLqSmDeMCWL5v+woHg570DkLl0lydTTXsPoZA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Apr 2023 09:31:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] create-diff-object: handle missing padding at end of
 special section
Message-ID: <ZDz1tw+3BiWAmEGF@Air-de-Roger>
References: <20230414151933.53851-1-roger.pau@citrix.com>
 <1377fcd2-672a-687d-468d-ddc6d5b4be70@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377fcd2-672a-687d-468d-ddc6d5b4be70@citrix.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 4935d6c9-10a0-48b1-cc99-08db3f15b6de
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GG2TyqDnzj8wVYdlaPUrn5JXSplZKPwVMhNbfyzwVpBk0Zh+KMFCWUCsjAP6IKMKvvpPWMNyu5RmAnH0i0jjeX22vIT7BF116cjR+fxElwVAQZ98muraKE5aWr1vQRM3dUxgxusUzjlajWUxYWiz1d4lNbgU+w2H15bcgRsszJcd3e9uRTr38VSf3kop18/+oQlAyTKXRs60NE+qaVAhYzb5QapJ1BP39xAB+xRSZAlMM8Fn0zYVhdviGWgLjdBm2j5r8nc5uwnJMdDffovO73RjUgKnFwwmCNo+EB56qjQYQdz5yTB+lumNqMz0Y1wmYGdgV3CemYkk4t7c86d3O5NSeXYY1viQ1/vDzP+YI6o5W+y3pw5AIl+8zBHlpv9kqSkAUM9fKYV2fU12TqPr0i39VtvOUapL1KRDOizat/IFMpuDMVkctyl8sRnq6ME6ui5WFcltyXu+h5j82ioK9GBtWO1+RZMwTrBqYAVxFK7UfLAv165xS1c5d+EzmAm/C1v8S6qk6l9odusdRiEjitvzBrvBedORZZFGEkROu21LOSNGQy3hzFuFcmJ0yusYb5pd9kRVtPAhf81BLP3ATalSyq5zVS2yZ2pWqirKR4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(26005)(8676002)(186003)(9686003)(38100700002)(8936002)(6506007)(6512007)(53546011)(6862004)(478600001)(316002)(6636002)(33716001)(86362001)(6486002)(85182001)(54906003)(66476007)(66946007)(66556008)(6666004)(4326008)(107886003)(82960400001)(41300700001)(5660300002)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkRqV3FBSk1xMjdheGxzZCtnZTNxVVpBck1XblJKWXpuclhzWnBiR1VxSnFP?=
 =?utf-8?B?U2cvN2J4SUdUNEdPRWV2bWZ3Si9HTU1ZeXE2ZXI5VUNCTjA1Z29TQUJoTS9a?=
 =?utf-8?B?bURieE56VGVWNzdwUGliVVVnUmlpVlZwYzNnQVBYcFFITXRBME5sanBrcXA1?=
 =?utf-8?B?STZzd0docy9HR0VTVjlxN1FJbzJVV0VyZS8xL1FvUE1DOVczR0J4cFR3MUpJ?=
 =?utf-8?B?MzVFUFZ3eklWaXZ3YUUySHhkeWxQdlowRE9LS2s1QktYQ0FTc0U5bllyUUtw?=
 =?utf-8?B?d1gxUGpra3p4QnF2S092MldWR29QbDhLbysvTVp5V3VKcG1wTUpQbWVzYkJU?=
 =?utf-8?B?VEZnWFNaK2pBL0wzaHo5UzRZL1hrYVVpQzRKT3R4WldLZGdaL25PdllwU0RS?=
 =?utf-8?B?Sjg3R2tGclc2dndtS2daZjhYMmdwRG1VZ0QxQ3ZTZ1VRdUdkQTJ0bkZNWDV0?=
 =?utf-8?B?RngwMHhxNU9kVUNuRGNMM1JESXNiRytyWWM4TjRMOVhyaTh0SlMzcGtNZXd0?=
 =?utf-8?B?bTZYbkMvUFJJdkN3VEwwM0ZSdVFkaGdvS0xjNzVIZENORVExeTVuU0ppbHdL?=
 =?utf-8?B?MjY4MVJXb2JPSFB2bUU4Z1gyODBGMlpJcW83eHVHeDZJSmx4aFJGU2M0VDJ4?=
 =?utf-8?B?ZE9OTjgwNGpnSCs2NHo3NUl4TzhDMGtiK0J6UUphb3c2NDliV1Y2V1BtTVNj?=
 =?utf-8?B?WDlBRk9UdDhMbVczN0Y1RURBeXBYaXhET3l1R21TQUttMmdBUnZ5YlY4S1N0?=
 =?utf-8?B?NXB1ZVNNYXVOMmpSY0krczduOTJiTUZVR09zZFcrK2V6R2JjYzUrREJjQVJR?=
 =?utf-8?B?YWlDQ1p2TXU4MERjYWx4VW85WnRHWWFkY1hGWFpDNDUwSld1b2RnMktrN2FZ?=
 =?utf-8?B?RWVIdmtJeDdPT0xOdUJyajVoYmsrSDBYZnIrcFNkTTR3V09PeWcxZHo2RGhp?=
 =?utf-8?B?OU5aOFBXcG9MQlE1aUQ4eHNTaHhQQVdQSmFUaGxkVVc3cUJWNzU1aXNpbmxx?=
 =?utf-8?B?TVVUaURsdWJrN1RhdWRGOWZtbjV6UVFKU3VQV2wySjNqWmRoL1Nla3RvWkFM?=
 =?utf-8?B?SFd3MFhKTDRuWVlHQnFrQ2wvQ3ovMmFYL1dqOUhzMzkyOGtneGJHcmlkT0Vv?=
 =?utf-8?B?L1hxV3ZZemYrYnlkNGx1aURyNnpwc3crYjdIU1VTZzBlQU1WZ1haeWxvcFQ5?=
 =?utf-8?B?ZDV5R1BzWFJScFZiOVpGcTJtbXRKSTNkNE40QnVvSDdzcEUxeUVGVWFieDM3?=
 =?utf-8?B?RlpLQnFDV1JkaWpCYkU0Y04wVkN5R1ZJejJzTXNubWhGN3NjRXBLcVR2OG9q?=
 =?utf-8?B?Yy95TVc2bUhYZlFFSzJSRVlmQ1hDd2xhSFdTMGJNbnhEcm53K3lsY0FWek9t?=
 =?utf-8?B?bEoybXM3WHhwT2tzOEs1MlkvM0pETlpNeWZqNTlyVXJjZGRiT3BhSE1ONS9J?=
 =?utf-8?B?UERvNlNUaW44WFlTcVZrVjMrYUIyczhCTWMyd1c5RGRWYWhXWlYxdEEwdEN0?=
 =?utf-8?B?SzNCOVR3WXAzU2VZZ1FKZzJ4aXE0U3V2a0c1eWc4OXhJeWMrckw1dGtab1ZR?=
 =?utf-8?B?OHpUUVBWZG9MK25TUERSM3NFNW5IWkpreFdXb2EyeFBFK1ZxK1gwMHo5Nm12?=
 =?utf-8?B?UE5TZ2dOUUQzenB2cmFxeno0aG1ZaWxCU2hVVGxsWnJBbXd0WkxDREU4MDBQ?=
 =?utf-8?B?b1hTc2xhN3I0MDNNcEJHalEzME1leHhyWUlKVVlQeWxDS1FwbFdFeTdLVzln?=
 =?utf-8?B?NkZaRjQ2RytvSFJQanEyVUNXOGRGbFdKYjViTlhhNmRIUVB3YXFrc000c2w1?=
 =?utf-8?B?UDB2ZklOV3pXNzlyWnBTOG9kNE4yRlNHWVlMZWVJemo2TlhUVmVCUFRNRkdG?=
 =?utf-8?B?OUZ3RmdnYlprU1ErY3BBaSt6NStQME02My9DdEtVUmlLaWxjTnFONkt6eCtw?=
 =?utf-8?B?OXFNcjlvQ1o0cHNRWG9ZanZZRUc4OXBCWGswSVZTV3lleGNQQkh2ZFNhaVZB?=
 =?utf-8?B?Vm0zZ2RrcGtBVVB4bjVSVGVrYmgzN0JqdFR4STdMQ0plamNTODJxYTRvcVkv?=
 =?utf-8?B?R1o4M2lIaWRxNHJWNDYzRW5CTW0vT0tRN3FPaW5BbXZySU42LzV5VnRzSWlC?=
 =?utf-8?Q?n6kYdU4MocjQ6DXzN9eMKG9oB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Nd/NSlB1sx9l9QA9yTOy9ttyE017/rJh60It6BCvuMhfGpOTpcSiNi0dOzH/E3Rv+ckY8U+HwngpM0kticCI7RcL4wFvis4s2N84DNraQhFyOQtDJXFmt43W5LmakGXQnvcEi0Av8oOQ+qkc5e1oSuVwzVCqkplG9pr2TBmUWBS7IrmRTwTW98NgPh+fdnUsYZWb667almqFAOH8nSrjZCMbN9UM73WU00Eo7+qIk9edw3yMm7C4QJIsGLZH+7JyidU+TmgiEhQoSA2eL+QavBdTQpAFPRnHW5tD/7PkOwNXSoy4nOhDwVuO+Z2Z2WRWR1nk83YKU+XzJYcGCJwVtO9OgB+w0Q62Fb4Pt9InuC9dfN5UogVZn95tnBw1yapnEMEGcxR9sf2I3VpqTgdx+DvzpT/IJxpvz8XAA2hcu9lStvXS3SIC2sW7SuctUZ8lx2ETylwmTJDDkesd96/CW6IWwRTBsTJIEM2fwruAVai17s6FMNv3gyO0+xpdW37fbQMBdTTyJhg6KS6rOypgP/Q03f5OZLynIFRacQ6WZDlRK5m0LbZN5hXjYrMdhOJitqZ7ctya7jFiNkw/qEmm7WQx7LSRqvND9qBjypRgCmSKi5JdwFcPW3V+PGgZa5VjBNkDgUcFTimDu59KwKgXH+csRYjbYGv4+qQe2v+b6NX601ucLvKNrreO47F+Y08ykGyNvYc0fkzA0l1+S0VwRhBNYizRjYBXVYspgyA+l8/PlBV7lWAEENvX0bmv0TjliZqxIffl+/vB9dAuOjh54Ckxz5I4q7+zWIvtUyMjyI5hEp0Gsje/fvBnAYrzGZhGlVzja+VeI2YHYk4f36V7A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4935d6c9-10a0-48b1-cc99-08db3f15b6de
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:31:10.2849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf2QJ48cc3l/18/REOqbl/imWddU5hNdVhMzq6Tz7xmN4eC6RwscWMEcVggkWvD1b6KIV6nAh4prkcx0iDvD7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6544

On Fri, Apr 14, 2023 at 05:17:42PM +0100, Andrew Cooper wrote:
> On 14/04/2023 4:19 pm, Roger Pau Monne wrote:
> > From: Josh Poimboeuf <jpoimboe@redhat.com>
> >
> > The paravirt_patch_site struct has 12 bytes of data and 4 bytes of
> > padding, for a total of 16 bytes.  However, when laying out the structs
> > in the .parainstructions section, the vmlinux script only aligns before
> > each struct's data, not after.  So the last entry doesn't have the
> > 4-byte padding, which breaks kpatch_regenerate_special_section()'s
> > assumption of a 16-byte struct, resulting in a memcpy past the end of
> > the section.
> >
> > Fixes #747.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> >
> > This is commit:
> >
> > c2dc3836e862 create-diff-object: handle missing padding at end of special section
> >
> > In kpatch repository.
> >
> > I've seen the .fixup section get an alignment of 16 but a size of 81,
> > which makes the error removed in this patch trigger.  Overall I'm not
> > sure why the original alignment check was done against the size of the
> > section, the alignment applies to the address of the section, not its
> > size.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Seems like a clean backport, so FWIW
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> However, surely we want a correction to Xen's linker file too, to stop
> putting out a badly aligned section?

AFAICT that alignment comes from the per-function-section object files,
so that's before the linker has assembled the xen image.  And the
address of the section is indeed alignment to the value, so it's all
correct.

Even then, it's my understanding the alignment in sh_addralign applies
to the address of the section, not the size, so I'm confused as to why
create-diff-object was expecting section sizes to the aligned.  IMO
it would make sense to pad the start address so it's aligned to the
section requirements, but not the section size.

Regardless, it's indeed a clean backport from the change upstream so
we should take it.

Thanks, Roger.

