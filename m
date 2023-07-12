Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD2750CDD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 17:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562609.879358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbyv-0001l9-Sc; Wed, 12 Jul 2023 15:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562609.879358; Wed, 12 Jul 2023 15:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbyv-0001jP-Pu; Wed, 12 Jul 2023 15:42:21 +0000
Received: by outflank-mailman (input) for mailman id 562609;
 Wed, 12 Jul 2023 15:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65J3=C6=citrix.com=prvs=55084c2ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJbyu-0001jJ-PJ
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 15:42:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf36a00-20ca-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 17:42:18 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2023 11:42:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6037.namprd03.prod.outlook.com (2603:10b6:208:309::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 15:42:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 15:42:00 +0000
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
X-Inumbo-ID: adf36a00-20ca-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689176538;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=06yPJ4cqjP/zHQjGZG2AEE1mboBtpf1ZrVOqnQEbrqo=;
  b=FuoRTA9Q36KH0Tla8laFpphoOSDa3SDPnUTRriTiBON6kJMqm3tMadP8
   8K6dng13NJGgzyPGeExqwPc6TSwgW1zJGPM2ux26fqh/JzeiDwuxA83rK
   PhrDYuTVgBgMIrL+CrGyrpfT4aTDxRym9Qf0SEmUg+8GaRNWEO2KjOVe/
   o=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 118569263
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CVwKSqjopMKLEfHfo8w44UPjX161RhEKZh0ujC45NGQN5FlHY01je
 htvWW2DP6zeNjegfNx3Pd7ioRwAscTSndYwSgo9pSowFyIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waEzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1EWs/QUGC3Nmk0e6KFOQ8254jPs3SadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1abI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiCN9MRefmrZaGhnWTnmUpGU0QeWKYsMOB1kGDeehiI
 HIbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A79y9pog210rLVow6SPfzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQOzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:J86FJ6q2Q33ZIAFCXkHXZFgaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3ARPVLk2rvZH6/dJXyAi2t8p7mUe0cKU/ynXaLGF2?=
 =?us-ascii?q?pVVc3Re3IE1+C/Joxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A74u27w/0pBIovNT1h2iOuA+Qf8cw6p6/WEYhqLY?=
 =?us-ascii?q?XgfHYOhFSAQqWsjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,200,1684814400"; 
   d="scan'208";a="118569263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0Yoc+jFwM7A3ZMVBAZDYqyp4MggeRSlBqk6tODErs5iTFlB1d/QBiRYohd8xYjPRwnoNvVjZAEq2QtP639U1WTXIxsSl/VeSEWH95IFUzRTgmXWupX8op4HJLfSAJSwpCpk+mm5OmfblqPz+arcubEwPBRK0ZfAuSpmAJJnzeYDIRP+HNVRlzFa/oHdxjJFgiMNpZaiMnzre0PdzuhiAzi2YEQbBIVvJkwLnbMzlTdrU/AamzNLamN6SjcBo+v3UbZ3kRQ8H4KPZbkjeQQQe1yS71sRUDSRJa3O9OkPTiszccohqrybdcvEO3Z8mBoHkjMzHi7173idp9yPAAdmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/IRc1XeWGs0W6e4UVFb3G6LChKbmKKuFcLi12nb4ZE=;
 b=F3G9SNj6sEAqAikU/Y/yCYoT0ZQtuUAzYc59D/uOBOfchMsu7vcr5Ulz4qFw7s3aZgrcCVnyW12m44awKgitWxsii/nRUhiIT+5OUjJvVjeL3LXk3M1BkwLub02jtLKqxgzqsIEbUxOpLAVIkJDnPXjVXOrgvu2Dx35tqIr3rTTlfwApP3zOw7uykH2TSlIGXvD9kdAQyP1/o0ZWKImeVJxb47FsfcCR1cY2xQZYz1vE4APrdPYdbLVku1QgKI/O03Z+93p+EDmYp7gBE5oVv+IV1RE09cif72U6/taS4GofSugY0otQ2IE0RFtHRwl3bYWRvH+78N5XxZvKhAjXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/IRc1XeWGs0W6e4UVFb3G6LChKbmKKuFcLi12nb4ZE=;
 b=pRMZ4bWfcXMjHvRWY/P8MZW9jmkcDN7STPRV+mfZqBsFQtXVfwlr47M+w3eR2pjR20JyayUc4Ck4GEFbkdy0qZ1bOmhhACHsuhr1bd/TaQk9jxT3Fk8rklo5qe2R3H8BaRVjjZ/qkz+0YXpvzVv5ltm1ACQBxbMCeU4ghtjxvbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Jul 2023 17:41:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1f79e4-cbb0-4805-d843-08db82ee87c8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpfEEkxD9LYAkhs2g+hi1MwlFw888rJDHY7gfMi+PXw7eG/pE3XgfsGy2oL1TrwXggg6CntUtkuGfINs/sOKvem/HCRTmKCgyKEBd0G13U/qJ/59YZWUZ3kt90rY9R+cel9d//qRD/RaXreyPuaaUA2+XbW0FIm0FM328R8yWhNRyJ3/+qtyXT5sAuN5tRIrl8qQWFZL/wYaMeq2tCEa5jp54x7tsyojZTQJYSjFPpJuT4QNRvrFDruOV46zC7M9GgiEZoexuu9arTeZpJiHsgIhvUyEy3I4Z9IQsNb0oc4PkqwiZuo/CaQA+662wTwcl0k+H1vgMT0Wz5pPoX+tr23LnXjRr61bLRtTiLDC5Cskz+4AwzSy2fIHoSlrGTdOleKxpSNJpAw5vvvs0NSMKS5cbp0Ce7hm/zJ3RFkoOoLIQLbkHd+I9Ly80vLdW/LTAMJZSE9tVekalw3xkL2BQARogAlw7hWntMxd3PzCmmIuu3pIpKm5tKX4YXyrEKIq04a7H4vwSyWDtc3iBtg/3LVMRjXZDOV/z4HVxOng2TdXNrEhKV9vCG02hrI1Runc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(54906003)(82960400001)(38100700002)(66946007)(478600001)(4326008)(6916009)(66556008)(66476007)(6666004)(85182001)(316002)(6512007)(83380400001)(86362001)(5660300002)(41300700001)(2906002)(26005)(8676002)(6506007)(8936002)(6486002)(186003)(53546011)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm9UbUJMV0hXeVZ6bEk5NExPd1dIVDljeHY4a3VZSUVNaWtxWEJqQVdFWTF2?=
 =?utf-8?B?eUhTT1JUbnNQMXdVYWF4bHkybWVLaEdKTnFUVlpHQUFGY0tZc05DakFCSFV2?=
 =?utf-8?B?VjZWNDMwMnpZa1Y5QjA3RmNHTGd2OHprbncwVFFkRkhWMTc2T1FCTmEwcVZY?=
 =?utf-8?B?RzB6UUdaWFAvTG5MMEVRK1hvTHpaZVdkdVFUSDRudWkxeGlNQnRRNExnYXJo?=
 =?utf-8?B?UUt3b2ozVkdiVTdFNHcvRzFtQm0rd1ZITGRTVWYrRFpMcDZaSVdnQ2dFclZ3?=
 =?utf-8?B?bFFTdHdyKzlZR2oyQ1VYMWhrYTBVMHEyQ2lyeHlGZFJzUXFRejdabU1KejRQ?=
 =?utf-8?B?blJlN1gxckdibjg5Mkk4emFpU0FjbXZWR3kzdXZxeGJsNmFCL0paMVhWMGg4?=
 =?utf-8?B?SkE0ZGNZYXJWektIVEpab3BYZFFZWFpXWVZDbHR4VVZ4SWpMUE1mcFFxejlB?=
 =?utf-8?B?OU5ZWHlPSmJxY2J6M1NOdkhnUFFjcWt4THNJVlFranBUZVRtckkrQ1krV0Vp?=
 =?utf-8?B?Tk5QN0NFcVdFMDlRSzFoV2xLVFJ5RkN6VEtnSUlNWEJ5TXVpMHhCU2pFTWVq?=
 =?utf-8?B?K3dVK0JpWnFta1BtT2l5ejZSZ2s5UnlSZC9sTVczSzdUZkFidWV1QlhqN2o0?=
 =?utf-8?B?YTdJblJwdTJGK21wZythOWNodzlyZTRUNUNkS1Y4N2NhMlRreVRGNkdRLy82?=
 =?utf-8?B?MTU2TTBwK0NiUjhtK09oSjc0ZFExMXphRll5MjFnZithc2I2VmtGajdYQXBF?=
 =?utf-8?B?R2xoelVFVGxmUWtDTm1Hb0E0cEVBbUkrT0RmQWZReDIxSzcyNWdDcDkxLzJ4?=
 =?utf-8?B?TWcvN3pQd29Id0cvTlNDcnk3MVhtR3lRdzY5TnRMNFMwdTc1L3cxcGpFMXNR?=
 =?utf-8?B?UWo1UkdreFpZemxPdy9ydDJEbnV0dTljeXF6VjdQeWlxd3Z0ZSttb05kRkpR?=
 =?utf-8?B?RVlWMXhWUlNFaXJFbzI4Nno5UUMrUVlNNjlFeXorWkZPVmdRTEswbFJxUGsx?=
 =?utf-8?B?TVcyaHBvNlNZa1IzV1A3UktHcWlCRFI4a2RRUSt1MTB6ZXNCQW5NcDh0VlR6?=
 =?utf-8?B?c3l5UnJnbk5GNnkxbVFlMXpucWxVMmg3YlhBNDAvUUZKS1laRXRhSkl4VG1V?=
 =?utf-8?B?ejMrellPOXNlSVVJRm1IalJrUm5TejQrQTV6ZXVvVnVuM2xpSlhBOXArdERZ?=
 =?utf-8?B?aFhpVjRhNVVpMWFXUDJWV2tDZlBMSlUrRVhzaG8yVkVOY1F4a25Ic21rTnpD?=
 =?utf-8?B?Qi8wT1hvZk1Vek5BbHU2UkNRZU5kYmtUYXBUL1QzRWwzWVV1am1YKzJPTzM0?=
 =?utf-8?B?YXMxRmNCenUrYzVsb01FY0hpOElhbmJlVUhPQXB0MXpQOVJCODFtMmZaK0VQ?=
 =?utf-8?B?c3Y5RTZHNGpZVEhISG84MUZrTlRmN0VaS2NKbVBoR2k3aXFQSERqa2RPcTVI?=
 =?utf-8?B?anBMcjM1Y3lhRkhlZCtKM3hFTnkxNEFEOFZYamUzbzYrQWpYQ1RRdWxEbnpp?=
 =?utf-8?B?RlFPUVdLb0xOUFhuT2lvaWF5WC9zUTRhYUErZXBLaFdmQks4amRxRkRpY1la?=
 =?utf-8?B?c0JBZFV1WE5HZDdsQld1ckJKaktMZEhmbC8rWm9JV3BsL1RGcFcvRDFZSnRG?=
 =?utf-8?B?dWtqMHpWa0VRY2ZlZHJOTlE2dCtQS3NocXNGY0ZnZnRrV3lwOHBwS1gvdnVy?=
 =?utf-8?B?WGpOMlZVeE9nYi80NlJMVGdscFl1ak4zQVNMUTVtbGk0ZDRWY01HcURvQ1Fm?=
 =?utf-8?B?OVZrS0hScDhINktLazFYMFFIK0d6dGtQcUtDUVhhbC9CWkxCM0pnRU9UQytG?=
 =?utf-8?B?eGJyTXJWaCtxWFh6SGJhUWcxbDgvcHNTOXFBWG5nZ1pWTkZadno4a3pyL3Y4?=
 =?utf-8?B?eGhNeFpIWFo5OWtLVk5zZlZSOUFvNFFWZjVMaUgzNmdpTjNvVGdpdVZGWGQr?=
 =?utf-8?B?UVYraVJkUURFRnFobC9hR0xDRGpUdy9ZUmxqRGtzOFZXeXJiUzl3ZXRDTlRV?=
 =?utf-8?B?REF5ZG1VcUJnVGl0ZFRvZW9kSkV3YVRUZE1vRnoxbS9GemovR2twSm5hUUk3?=
 =?utf-8?B?UnZlVlJvbmE5djZMZG9QUFdpaG9aa2p5b3k2UVBkTHBkaWNWK1RkVFdjNHpp?=
 =?utf-8?B?YmFqb0IrQmxKaittM2hIYjdmR3Y0RXRmTmFJdTRmdTZKRTQwY1RPaHZibUZu?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	546Ex9LbUKCdt4btaGeuEe0BVz4jf+2nWIWNk8v1fdigRibB0bgUyWdDSFyRjxNubKUgPeqtvanvuAKoPb3Y3pJ/0CzDeoWxHIHXN01P6Yk+lzAvaK+2r/bkZow86tz50wpM46ZnPuP8jRjhxuF9YAkMEO5KsjTCxMpnsg3jfzVvh9r8E62EFM+ldyVgWP+z92rykYF2ik4l22kL7Kvkfb111rEYX1a5it8eARSwPRFfEdOubGLLyW+EdmM4tdKtUTP8KL9uvm0yuij9nizS/SZRmYxeph7qmkWuKkAJMDjsKh5262Fd6uPsCxNXkvNRjKC+axY6oCk8NpNKKyfU/Ypk+CAAzHUGj5KeQPvvb8wrSOUFrm2rqMEq3JJayFxalLN7Re54CDeJIcsq5GtHk3mz9qz/m4zqkYcMp4fC1CAqIor2lGj38tsERes5BYdsP6yGH0PrYlqteIoOGqj9nSpKDNiuFZKun676UorBahWGVzRG6q0Jk5kQymJMnMHlAp9+aw+vfPaGWNXv+ZUvlQhAny3+KJ4Bx9ze0Nbj4gJhWEOc5u8uGoLSRB1R5TZiUB4BVGR5wSvPQ+GZ0CQJaFeKIJdC7u1zu4wdBc7JMgl1QKbKG0YJentRx5/kJyhv4ncxPmFpLDeBPYsHBEHz6huYoy0iG4QOosFmHX3gg3HqRItbx4P5R0Ui7RCHSZE5nOdUJog+TwMN/piqbKYNcVPOCAWdKgnVU1d6l1GekrqBVm5YabBBmOO+Sq0thk3EOx2xnnMYOJ5VByKu0qgDRk6JVTB2BuRIU2i7j93AF6gqobh2hJMjcFs5rnF2qA/Z
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1f79e4-cbb0-4805-d843-08db82ee87c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 15:41:59.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSedEGBBsgp3B8cMuK3S3WlnWxet7Zui36dXyoCr2AxMysbD+Or6vhaC/UKIt6dfcYjZypPwPiB08NVH4rhJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6037

On Wed, Jul 12, 2023 at 04:50:34PM +0200, Jan Beulich wrote:
> On 12.07.2023 15:53, Roger Pau Monné wrote:
> > On Wed, Jul 12, 2023 at 12:07:43PM +0200, Jan Beulich wrote:
> >> On 11.07.2023 15:02, Roger Pau Monné wrote:
> >>> On Tue, Jul 11, 2023 at 12:53:31PM +0200, Jan Beulich wrote:
> >>>> On 10.07.2023 16:43, Roger Pau Monné wrote:
> >>>>> On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
> >>>>>> On 07.07.2023 11:53, Roger Pau Monne wrote:
> >>>>>>> The current logic to init the local APIC and the IO-APIC does init the
> >>>>>>> former first before doing any kind of sanitation on the IO-APIC pin
> >>>>>>> configuration.  It's already noted on enable_IO_APIC() that Xen
> >>>>>>> shouldn't trust the IO-APIC being empty at bootup.
> >>>>>>>
> >>>>>>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
> >>>>>>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> >>>>>>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> >>>>>>> APIC is enabled periodic injections from such pin cause a storm of
> >>>>>>> errors:
> >>>>>>>
> >>>>>>> APIC error on CPU0: 00(40), Received illegal vector
> >>>>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>>>
> >>>>>>> That prevents Xen from booting.
> >>>>>>
> >>>>>> And I expect no RTE is in ExtInt mode, so one might conclude that
> >>>>>> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
> >>>>>> of course there's then the question whether to change the RTE
> >>>>>> rather than masking it. What do ACPI tables say?
> >>>>>
> >>>>> There's one relevant override:
> >>>>>
> >>>>> [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
> >>>>> [669h 1641   1]                       Length : 0A
> >>>>> [66Ah 1642   1]                          Bus : 00
> >>>>> [66Bh 1643   1]                       Source : 00
> >>>>> [66Ch 1644   4]                    Interrupt : 00000002
> >>>>> [670h 1648   2]        Flags (decoded below) : 0000
> >>>>>                                     Polarity : 0
> >>>>>                                 Trigger Mode : 0
> >>>>>
> >>>>> So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
> >>>>> connected to.
> >>>>
> >>>> Then wouldn't we be better off converting that RTE to ExtInt? That
> >>>> would allow PIC IRQs (not likely to exist, but still) to work
> >>>> (without undue other side effects afaics), whereas masking this RTE
> >>>> would not.
> >>>
> >>> I'm kind of worry of trying to automate this logic.  Should we always
> >>> convert pin 0 to ExtInt if it's found unmasked, with and invalid
> >>> vector and there's a source override entry for the IRQ?
> >>>
> >>> It seems weird to infer this just from the fact that pin 0 is all
> >>> zeroed out.
> >>
> >> As you say in the earlier paragraph, it wouldn't be just that. It's
> >> unmasked + bad vector + present source override (indicating that
> >> nothing except perhaps a PIC is connected to the pin).
> > 
> > I can do this as a separate patch, but not really here IMO.  The
> > purpose of this patch is strictly to perform the IO-APIC sanitation
> > ahead of enabling the local APIC.  I will add a followup patch to the
> > series, albeit I'm unconvinced we want to infer IO-APIC pin
> > configuration based on firmware miss configurations.
> 
> Hmm. The question really is which of the changes we want to backport.
> That one should be first. While it's largely guesswork, I'd be more
> inclined to take the change that has less of an effect overall.

My views would be the other way around I think.  Current code already
has a comment to notice that IO-APIC pins might be wrongly unmasked,
and there's also logic for masking them when the IO-APICs are
initialized.  The fact that such logic is placed after the local APIC
has been initialized is IMO a bug, as having unmasked unconfigured
IO-APIC pins when the local APIC is enabled should be avoided.

> That said I can see that Linux have their enable_IO_APIC() calls
> also ahead of setup_IO_APIC() (but after connect_bsp_APIC() and
> setup_local_APIC()). IOW with your change we'd do the masking yet
> earlier than them. This may of course even be advantageous, but
> there may also be good reasons for the sequence they're using.

Linux calls enable_IO_APIC() before setting up the local
APIC LVT Error vector (that's done in end_local_APIC_setup()).  That
logic seems to be introduced by commit:

1c69524c2e5b x86: clear IO_APIC before enabing apic error vector.

Might it be less controversial to do like Linux does and call
enable_IO_APIC() before the local APIC ESR is setup?

Thanks, Roger.

