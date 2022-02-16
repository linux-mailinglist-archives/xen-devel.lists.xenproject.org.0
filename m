Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D74B85CB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273928.469239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaZ-0006cd-EH; Wed, 16 Feb 2022 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273928.469239; Wed, 16 Feb 2022 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaZ-0006WF-5p; Wed, 16 Feb 2022 10:31:11 +0000
Received: by outflank-mailman (input) for mailman id 273928;
 Wed, 16 Feb 2022 10:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHaX-0006Q9-Nb
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be89e14-8f13-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 11:31:07 +0100 (CET)
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
X-Inumbo-ID: 8be89e14-8f13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5wpWq0tN4xgsFJ1RqLxQToz/62F/R49dfWtSuwedAS8=;
  b=bzGDrsmZ3xV7Bv0VNz4RvJjbwfupD86ilWjxlhOFM4SX7zqvZMLJNDhP
   kLSgxR9vIPI10uUkBE9zzjGLCgckHCAp7z5nUK1JDlvGHsxA1rWDyyCbN
   R5ZZgFE+bXd4UYDlK34JmABp5Dz5I/ZvStrF42sGGSsb8chqwzheWaFAn
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l9s/CC/67+Z/Ak4p6MqD2jRDxR9fIcFd+rrjm4ovNnX2CEqrU3XCTVQUA1uwUKyHfVAxTjtysX
 8hxjiVEr7eDNhSYaqLpnck90BasA8lGzNcrllV4v8r7fK0XP2/jE0fwdPQFJyiHmEYcrTUHya7
 AwEs9KSSy+qX12eSjWkSN7URZN5qLn5e0UIceCUX1TnNlzM0cqR+qUQkyee30jN7QrSjfeBTyU
 +sFvqnNyoCPGqE5blDUrSK2F6fiKPG8fsienlqeEPvEl9uHVmSdWbT8+wd6rWdbiyOdl5ijhbv
 NvNGDsCubsvR5fW+/Kd4agXU
X-SBRS: 5.1
X-MesageID: 64324541
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tKQDfa05+wtRyT7PM/bD5XF2kn2cJEfYwER7XKvMYLTBsI5bpzYGz
 DRNXTvQOvbcamrwc91wPd/k9xsE68LWn9JjSAs+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrBh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhlv5/7
 OVn8tuMWQINNa7HmfYWQwd5DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MDhmtt2pkm8fD2T
 ZcyUyZ2ZwT8aj5fCAgnT8kxtfyuvyyqG9FfgA3M/vdmi4TJ9yRzzbzsPdz9atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTWo0IE6aj3uV3m1DVzWsWYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VGW0bFBZAbtI8vcM7TDBs0
 UWG9/v2ARR/vbvTTmiSnop4thvrZ3JTdzVbI3ZZE01VuLEPvb3fkDrGYNhHIITyyeHlHBX7w
 DuLviMumZQM2JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmUMnV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BKL0e+yzMUKVJdPUUORS9jsYyjN5fK9fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUSpLVP09nWvnHr11PVoXKsYWnz67qXfTlUrP7FZjTCTNFedt3KWmMojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTZ3x8Zw35hCJ6PO5CLs43LvMKQFXuz8Q6pdZcR
 PgZYcSQRPNJTzXM4TMGapfh6odlcXyWacimZkJJuRAzIMxtQRLn4Njhcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQDKl/x9IVKKjDqiqNlKc87NhielCCR0
 BybAElEqLCV8ZM16tTAmYuNs5ytT7llBkNfEmSCteS2OCDW83CN24hFVOrULznRWHmtoPepZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GNg35BKlhL3+K2dh0mpdMnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSFQcOl1PYciz
 btzscIa8VXi2B8jM9LAhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZoUeKFQuL
 x+VmLHG1uZVyUf1enYuEWTAgLhGjpMUtREWlFIPKjxlQDYeaiPbCPGJzQkKcw==
IronPort-HdrOrdr: A9a23:q0wYWap41C8zy9zz5TexIyIaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64324541"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsIM4EBCg7e5qfHeW0KF51iSlKyOnSlD8wJ9TO8+ub19wN7+/VrlUHHA7VSWhBd37EVBE6tK81mC+fBbZDYk24zf+dm4R81Us82i6vlItZNyDjLbkBDvwGAUEIP5A9YSvo47/Q92xsWtvCV5GWI4sNAjAdKAqTWk6mnO3iKel5Zela9icxS3PEgYzbiaP54Qs4ZAnAgUC7KDxNsmZFfpTv42SHY3UN+opRFuw5fL2lcVIPMkKkP0wdbGrUjEaBP3EvsNBxdeywJB7JR437FIH73zdecO5iVxo/sA0V1yj1/awpReGhg0WrF+g94BPs/HKSk/eZIzF2eFwOB8wc8waQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFQhQkphMi6Ap1Mi8N3n2KqtwVj5MU8P14jt20/cQvs=;
 b=Nxa7TfdIU2IVKfv0n2dfuFWNv3F72kb+IQEfB4DKBRU7AEDjta9wpsHSAo/4AjZePdXCUwWQzwpSFvEHWDgUrDmGyYD963o5T1e2TYgZaQNerg9JLGS8jeAc6fnLXltkAh0sOiU3kThDNpWp+ErHdaZCCCN0lho1+YBxJHhFutFyy6DxpfRf4jL2J20ZUyyUEK3qLBG5Reh933/WT9QrlI8QMSv0ZpPXy5SPE1b/klmiN4cwVOw1Wzl4wsQuW0Qr8sKLJr9wXvW4YOp/wIoRGjnKaBwMx1e4A7keHFcY0J2sZ2ygjqV0lFY1l8ai7y4xadEiOJI6PUTR1n4kZQzD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQhQkphMi6Ap1Mi8N3n2KqtwVj5MU8P14jt20/cQvs=;
 b=GSaHanj6KPwiXs4RuhFvwcczj4ifcnb/qt3SIFUJbUeIxrlcePvuxAqTC3NpXwEhterlc/y0HkQYxts/rH3NhmVPqZlxyVKKLzvcdS2HnL4HBsQ6uCGcTDrZO9J7VbDgFwiQPfIcV5NCUNON5LYnRMuFIjJ+idW/wGUAHLjBR2Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/5] xen/vioapic: add support for the extended destination ID field
Date: Wed, 16 Feb 2022 11:30:23 +0100
Message-ID: <20220216103026.11533-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216103026.11533-1-roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd3498a2-37f4-4737-ece1-08d9f1376d63
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB625660E309D2BF0D289B1D378F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkqpVYHhUxSDYLy3rTJyukU8sNMWcddPAhRN4TKmVE2Y7h9sDtA6UN/242WcyANkQXea5WM1JV3tO6LULh7qGL+SVYfn0bVEIHDjB60NGBL+Z/9Z9nCAIkvWAu9ye034UA/WEDyJShG4UsFlrEgX7+kKIOvxwynwVYAic1iRm7mIt7rDtivJqHeuPspMUkbtRkeyD5kOVwD/3/6d982sSO8OLmWsZkg1/x/7hh2lP58vWJHJRqFb6jY31WNlBKg1iwLYXXEmOyswcuVb5t5Mpw8nah/VTJx67OWPChzEbTWOFuvpGl1Dsz18uYQp/C3cDXw/XF1BesjdSl/q1EDjL9ywWn9fX9LwCE8yazyvIp3ZbJOGpv/4sNvDkYX5DQXKUyrvzpOZIOywzbmyRrezS4ksd9YyMVdhycr0bUEgFooy8X2M9ph+bMZ8wQ0imxpGMERjQ0ZZ/+ZCliEwCipvm26hb+Gz+KFhAqaODJxsnKMPyhRGAo34iEeHyrSGlmPo9w4ZHCqHgyELNO59EqcK+16Qi+qCve2NBSyR/MM5uIAqs/m9etBeIik7gKHj2qmFF5lowMOPg/c6j5pnFRBBIOATd5FlfFFUzM1S2P+mMrf9utof+afnkk1GgW9otOEMEab3aRVyQiDzmLtVnuD41cK58DmZ1626Z9dfH+SGW0geYbx1Wi4ti81/DK9JrATJJt6EkrQNYuCZqF1SrAGVmQPc5QyHjPy8ORoOHzi5Zpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(966005)(82960400001)(66476007)(83380400001)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09EbUhYSFU5MnE3MTAyU3pPbG9KUVdFUUpybjVLSk1BS3IyU010NXdUaDFi?=
 =?utf-8?B?VktnTWQrZ2hCNzN1azkyWW9WK01ROG1pSFdwOGpuRjRIdTRCQ3NGSW92NUV3?=
 =?utf-8?B?V2FiWWNHZlJabFhJbGE5My9sbXJCYlF1dDFSWFR0WXVQNDg1N1prTnFpaHMr?=
 =?utf-8?B?b01WbllGQ2FkMDluQ0p0NlVaa1NValNZbUxMb3hPRVhvRU9lc1JiK0ZBTEow?=
 =?utf-8?B?WU9rZnpnT29LL0J1WExmbWpabWt3K2RxWmFwR001UVpDNXh2K0t3WnltTlRu?=
 =?utf-8?B?ZGVPOG90aUlSMy9neVI5K2pFNVVTNzBQRkZDZEZkTTJ0NG5KMGduWmRBV01Q?=
 =?utf-8?B?MEdDTUdRYURVRUdQaG1GTUNrSlhZRDIyS1M2dW02UVFsQzJTaTJubzYyN0xl?=
 =?utf-8?B?Rmd6OHp5YkZLcDQyS255Y1pJMHhIQ3JrL1VjMzFBOFNya3RPZ2xrYm1vV1BR?=
 =?utf-8?B?a1pLU1FBdDJSQ3poR2loTHNnNDFPL2RKRzBlSlRSNmFHSFBZM1Jod0dGaXRF?=
 =?utf-8?B?NlBhT0xqTXUwajlVMk5QK3JQcjFFTzZkd211eENqdmNsTkRWemVlSWdzWEsw?=
 =?utf-8?B?QThHNnRPc1hlcTE1S1Z6citWWEJjTkk0Tkt4eXh1MHBLVHhJcmdsLzNFaG8v?=
 =?utf-8?B?a0dNNEJFU3pZdjhodlpTQlFQbFpUNlVLZERSSHRKSWdxd2tiRmZSS3VtQ3FU?=
 =?utf-8?B?bWhaeG9pZ0kwVzZzTTY0N3lZa29uTGozNEpZVjgxOG15ZGxOWWwxVXJIWDhw?=
 =?utf-8?B?QkxIVzBzckVvdnRNbStqVTJQTzJlUDN2cW11RFFDWXJzKzJBYnhWRndIelFC?=
 =?utf-8?B?UVRrZFNrU1Rxd2NRMFpPMUxGQ2VFNXVIcmpLNmFxZWtpN3RITGZBNVo0aytR?=
 =?utf-8?B?eVBRaURyZkdQSVNWMHZpTEtDSWVieUw2Q3YvR0piVEhpNWcvWnkzN1lEcjRy?=
 =?utf-8?B?clJ3ajliZjI3bGxYOHZXczBLRHA0SG5XMnJ3QTlXYzlndXo0NTh6eU42RU9u?=
 =?utf-8?B?Vm1heEROdHpMb3pmK0RudkR3RFRtNXJsVEtpWXpnaXpIMWJVVUUwa1Q2RHcy?=
 =?utf-8?B?Nyt4bUFvZ085WnhQQ3llcURvSXI2eDV6NExvaTQ5Y2VHUHo5YVoxYU5tTnFw?=
 =?utf-8?B?cXpjZloySzVoOGE4TXBSdmcyMHlacTJJZGZzeEJ6NzJWbXV6NXMyOWhWbith?=
 =?utf-8?B?b1JhMXgrOUdEd3EzdDA4V2N5VlNtSk9MT0U5eERITjEvbkwwZ3F0cFV4K1lM?=
 =?utf-8?B?aCt2QW00MkNGTjByTUJ4NDZjLzBvamFBNURqbnR6SEN6U0NUNSt3VlY3UEM0?=
 =?utf-8?B?b1MwbDJRQXpQaFFzU292Z3grSFFnaU1rR1lQM3NWdGdrcUlwOERiMVV5TnB0?=
 =?utf-8?B?dUVjWG1yeFUxVXRHcmkrV2tqamc2eHMwdUY2TjhUWFpCRkM3TGlQNUtkOTZ4?=
 =?utf-8?B?VzJRRWM0VHVKWTQ0SEdEbGMyVEt6L2hRZGdrVXNyVDZhL0ZJdldMUEg1c2Jm?=
 =?utf-8?B?cFltemRjM3YrZ0trZ2QyN0gwMTVEbkVzbWVuQi92ZFRhVHB4M0pEQkROUFpO?=
 =?utf-8?B?RXl2c2FHb29mdFhVSnBPL25rcUdBOS9JRGJycXNHQ0dyRkZ4U1hFL0Yvb0Zh?=
 =?utf-8?B?YVArZFg5Q3lGK0gvcnBWci9oRm1xUGlwNUo4cHVCUFlLeTVFNVl4UXI4bVVJ?=
 =?utf-8?B?emFFeklxSE0zVnFtVEI0Nk9IWGNzOXd6bFVWVFB5elowMTNDNHFEQ0tqcGZV?=
 =?utf-8?B?VGtsZy9ObnVBQy9kd0VEeUZPaWxLbzg0WmJuV0dtWDd0NEYxTmIyQkJYbm5j?=
 =?utf-8?B?dGYvd1lhSEE0eUc3SUVxdHFMZjdjRjNqQWJ5V0FuYjJsT1l0VmgrcFlsdnRH?=
 =?utf-8?B?WFFybk9HUFNoNVlJYzlBa3JaVEFFMWVnSWNxZ1FXeDhMWndCT1JDWE5Qell5?=
 =?utf-8?B?MzlSZkdtSDVzWlRneW1LV1MzVjNhb0wzcU55ejlTWDZQNXVnay8vb3J6eFBj?=
 =?utf-8?B?bG8wWHg3ZldjQUlkeU5mWDV1UlhOeU9xSGdiQ1luS2d3K3BnSm11L1BzTUJN?=
 =?utf-8?B?eWlBTFpXWUdkOW1GUnlFWU9JV0FFb2JtTWhRbW0yMXQ3MkNpYzNCdVZxS3pN?=
 =?utf-8?B?U2tIdG1Fbk96NVN0dFNvamhzNUI3eTRJdmFTd0RNVEh0TUx3c0hCaUlzZ0NI?=
 =?utf-8?Q?JTDlnVkPJxNjIxjscZVTYao=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3498a2-37f4-4737-ece1-08d9f1376d63
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:31:01.2115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2uxp29TvFaZ0eFye0mvPOHQV0+JON70DgKdeQ6AVypuzaaoTc2y/Rk4Zq3Lbot9FNGaj4JOnNV7iwsGBFOs+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Such field uses bits 55:48, but for the purposes the register will be
used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
in remappable format which is not supported by the vIO-APIC.

Use the extended destination ID to store the high bits from the
destination ID, thus expanding the size of the destination ID field to
15 bits, allowing an IO-APIC to target APIC IDs up to 32768. A
description of the feature can be found at:

http://david.woodhou.se/15-bit-msi.pdf

Note this is already supported by QEMU/KVM and HyperV.

Introduce an option in xl.cfg to allow switching off the feature.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Expand commit message, add reference document.
 - Add xl option to disable the feature.
---
 docs/man/xl.cfg.5.pod.in               | 10 ++++++++++
 tools/include/libxl.h                  |  8 ++++++++
 tools/libs/light/libxl_create.c        |  6 ++++++
 tools/libs/light/libxl_types.idl       |  1 +
 tools/libs/light/libxl_x86.c           | 12 ++++++++++++
 tools/xl/xl_parse.c                    |  3 +++
 xen/arch/x86/domain.c                  | 10 +++++++++-
 xen/arch/x86/hvm/vioapic.c             |  3 +++
 xen/arch/x86/include/asm/domain.h      |  3 +++
 xen/arch/x86/setup.c                   |  1 +
 xen/include/public/arch-x86/hvm/save.h |  4 +++-
 xen/include/public/arch-x86/xen.h      |  2 ++
 xen/include/public/domctl.h            |  2 +-
 13 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..349e0b432a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2901,6 +2901,16 @@ option.
 
 If using this option is necessary to fix an issue, please report a bug.
 
+=item B<ext_dest_id=BOOLEAN>
+
+(HVM/PVH only) Signal the hypervisor whether the guest should be allowed to use
+extended destination ID for interrupt messages. Such feature allow expanding
+the target APIC ID from 8 to 15bits without requiring the usage of an emulated
+IOMMU with interrupt remapping. Note this requires guest support and might not
+be exposed to the guest even if explicitly set due to other constrains.
+
+Default: enabled
+
 =back
 
 =head1 SEE ALSO
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6cfac..35329bca50 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -527,6 +527,14 @@
  */
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
+/*
+ * LIBXL_HAVE_X86_EXT_DEST_ID indicates the toolstack can signal to the
+ * hypervisor whether the domain wants to use the extended destination ID mode
+ * for interrupt messages. This is done by setting the libxl_domain_build_info
+ * arch_x86.ext_dest_id field.
+ */
+#define LIBXL_HAVE_X86_EST_DEST_ID 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 7499922088..66ecfbdf4d 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2330,6 +2330,12 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
      */
     libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true);
 
+    /*
+     * Do not enable the extended destination ID for restored domains unless
+     * explicitly set.
+     */
+    libxl_defbool_setdefault(&d_config->b_info.arch_x86.ext_dest_id, false);
+
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
                             params, ao_how, aop_console_how);
 }
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2f7d..bbfe218c48 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -648,6 +648,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("ext_dest_id", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 1feadebb18..68f4de7ea9 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -14,6 +14,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         break;
     case LIBXL_DOMAIN_TYPE_PV:
         config->arch.emulation_flags = 0;
+        if (libxl_defbool_val(d_config->b_info.arch_x86.ext_dest_id))
+        {
+            LOG(ERROR, "Extended Destination ID not supported for PV guests");
+            return ERROR_INVAL;
+        }
         break;
     default:
         abort();
@@ -22,6 +27,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     config->arch.misc_flags = 0;
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.ext_dest_id))
+        config->arch.misc_flags |= XEN_X86_EXT_DEST_ID;
 
     return 0;
 }
@@ -824,6 +831,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+    libxl_defbool_setdefault(&b_info->arch_x86.ext_dest_id,
+                             b_info->type != LIBXL_DOMAIN_TYPE_PV);
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
@@ -880,6 +889,9 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
      */
     libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
                     libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
+    /* Force Extended Destination ID so it's part of the migration data. */
+    libxl_defbool_setdefault(&dst->b_info.arch_x86.ext_dest_id,
+                    libxl_defbool_val(src->b_info.arch_x86.ext_dest_id));
 }
 
 /*
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..b609b76779 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2761,6 +2761,9 @@ skip_usbdev:
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
+    xlu_cfg_get_defbool(config, "ext_dest_id", &b_info->arch_x86.ext_dest_id,
+                        0);
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..9764f42878 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -685,12 +685,19 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags &
+         ~(XEN_X86_MSR_RELAXED | XEN_X86_EXT_DEST_ID) )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
+    if ( !hvm && (config->arch.misc_flags & XEN_X86_EXT_DEST_ID) )
+    {
+        dprintk(XENLOG_INFO,
+                "Extended Destination ID only supported for HVM\n");
+        return -EINVAL;
+    }
 
     return 0;
 }
@@ -862,6 +869,7 @@ int arch_domain_create(struct domain *d,
     domain_cpu_policy_changed(d);
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
+    d->arch.ext_dest_id = config->arch.misc_flags & XEN_X86_EXT_DEST_ID;
 
     return 0;
 
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 553c0f76ef..a02bd16b4b 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -424,6 +424,9 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
+    if ( d->arch.ext_dest_id )
+        dest |= vioapic->redirtbl[pin].fields.virt_ext_dest_id << 8;
+
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "dest=%x dest_mode=%x delivery_mode=%x "
                 "vector=%x trig_mode=%x",
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e62e109598..83a1608212 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -440,6 +440,9 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /* Use the Extended Destination ID to expand APIC ID. */
+    bool ext_dest_id;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 115f8f6517..4aaa6ebc07 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -782,6 +782,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
         dom0_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+        dom0_cfg.arch.misc_flags |= XEN_X86_EXT_DEST_ID;
     }
 
     if ( iommu_enabled )
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..253dc89a04 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -376,7 +376,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t :1;
+        uint8_t virt_ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 7acd94c8eb..06d64a309f 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -317,6 +317,8 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+/* Select whether to use Extended Destination ID for interrupt messages. */
+#define XEN_X86_EXT_DEST_ID (1u << 1)
     uint32_t misc_flags;
 };
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0..31ec083cb0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
-- 
2.34.1


