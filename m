Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2260CF74
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429877.681178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAg-0003k8-Rk; Tue, 25 Oct 2022 14:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429877.681178; Tue, 25 Oct 2022 14:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAg-0003ht-Oc; Tue, 25 Oct 2022 14:44:50 +0000
Received: by outflank-mailman (input) for mailman id 429877;
 Tue, 25 Oct 2022 14:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAe-0003SJ-S3
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:44:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 928cace9-5473-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:44:47 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:44:42 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5808.namprd03.prod.outlook.com (2603:10b6:a03:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 14:44:40 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:44:40 +0000
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
X-Inumbo-ID: 928cace9-5473-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DOkJEnD0h6trHJXhBif37jv2pfl7nFk1KQQXgU7n2N8=;
  b=ITdCE3bimAHrwaCxXV1Q9YieNySMc3aOeU181wO/crkbB6+zZ8XRjkBN
   V59GMnxGThWuTThYVLBGc0gAFcfTloowF2LLEC9hDsom5GJd/WI+jmp84
   /NvDJQeAIcD9/dcU95qwAEe29Kj+ukZ30Nv1gU53kITfvpHBrCTvllkYh
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 82566521
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X6ABna1BRykFQ35BaPbD5fNwkn2cJEfYwER7XKvMYLTBsI5bpzJUn
 zROXTyGaPfeazb9c91ya4mx80wE6MTSz9AyQQo5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlF5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUc5stxXkJr3
 sU5DzAnMxqhmry4nZi0H7wEasQLdKEHPas5k1Q5l3T8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7gzL4/Zqi4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWDYrCzx3LancSXTYJkvNry8x69TukTI/EZMWR8tXlSKrqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yyaUAHIVCAFIbtMOvdUzAzct0
 zehndnkGDhuu729Um+G+/GfqjbaBMQOBWoLZCtBSBRf5dDm+ds3lkiXEoslF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9fABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:HsPeFaEZY+5VymBSpLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkloJk29Tpb+CUlpAZxyHsMceg72w
 36CNUYqFg3dL5xUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="82566521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToKV/J6BjCbhqJKfpmfdeKTdUhCF67A3FTTifpiATNcFaV9+2AqG762hAdqnjjMZ7d7njv8vrRX3DkvRWS9bt1rPvzXDr7a04swA0yE+P98vAnqDRzZCG63/IByQn7jC/h2Bmv7UUy8ynpkQLCnc1/OJjN1bP9pZ7nRcHdHsDXC+6DMYIOEYX7Vig1h4nEBw6WQm3/t7VA2ginz1Ue+FcPsIpAq99dYYxIp1tEbmSLXNCjNH+R6NuVZ9X0Gc5IW7KIu8FgfENTubmFRWO4sslGk0IAJCEI7cRD1fck7GS73Ov8b3gjW1YfiX5Jrk1sSItAT8bhuFuiEWWEScEQbknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+gHaCnlEGM0dyPAS/K0/1cQ1iwF7mXhMFtAy5CGtoo=;
 b=Xcig0Ec5GNqxmoMTvVrqPXGdoo3dOCx0jnsxQCRrdpCftmVW0y1fdBvzcCp2oo+pX2uFda4I2ngHzNYhii2CBsE34GBlnlrh5YRf2+aIvlIHtmJivfGWgcEO9S5i2WlPdoXCJe2lmHmBfYqNYgPtzsgCgLMNFv20JFGW3/jRrrngnRom3lS7T6BEFD3vw++ShERN0TAIILe8pHseGziDM8CoKyarYHPIrNwdMhtPKxHjKWNWk3WaSSYVLjs0cTwqw7b3Oahg4VU139YRrpIbWWKvTYCdwAIKMwAPitngndKAq+YX0mqhtyd5PJ936Pjbn7MCDU+ASzn8LqBbMSig9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gHaCnlEGM0dyPAS/K0/1cQ1iwF7mXhMFtAy5CGtoo=;
 b=wwjG1KuVIr5XA2Bz7Hrbxnq2rf4ycBc/3+lQuNFCocPiaqI2kVmScfCB370GOs2POYT3wU/VdSf0ykB94NfD0hmmyw3TGaRwO+xWg0PBWwTEK2KLIPHTr69a00ur+EL5DxdWIvct+/7nKjVLi0469l/JXOC8Ah0XhYRi0MiNLsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.17 v2 1/5] vpci: don't assume that vpci per-device data exists unconditionally
Date: Tue, 25 Oct 2022 16:44:14 +0200
Message-Id: <20221025144418.66800-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e955c7d-ab52-4a75-7a85-08dab6977233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBQaGP3AuzUPiCNJsQt5iIlakGRNJPSGlyUBLs9FgM5GRCY3EiczpiWIkmyh+x6nw97tJDjxGXgcsyNnTXU+Bd7ub+WQGL0CgfHdjIllNdKDLaPlOzbb2qPWC6czyXtOjD8hZ05Th0lKkQdGMWH3geNFIfYWuDShfPOT2RzLwqlBEUwCM0RSgZUyhW9VKxViRaLbmPGbIOD4FcJz+Qn1kLUNrs3CJJdFwYP6LSLRr1uNms/xihrBgEmKOVLfDmoEijAddg6bdkw1tXb5oco8JZUrM6of3uFMv8ajtTVyENwp3zS5qQ0l1HuR69UgyliGn5RiLZgh9aaSMtcPGWiebk71fQbpAubaKHOtpYJiqwrx5v8/zaKR+lGTDpJTxWjeL0XlAFEYDeiCIhNahXKtdUcYuThZdQV0rmb+P25UOlkr0HNVWQjG7QCnhn6U/b3LHuAfjFq8xJbVAt21VoJT5kKQkRxg4F931/PzihxPphwKonuzjGgQbq/2XwbVs15EbhUujlkmbgExcIykJ4lHBE8gGaiYUukqn5ImOVAQKpT88N3HUAVIVb2iE58PdODrc+JENteR9zsk9H8jcF+3S0yADnH1BidWMWnj6bT+JIJDU8OmdAK87uEPRFNWIj9cmAHUJsUHNjSAbf8TBwTHVxOsVVm4TIJgex9dbrdXKxk3v5sLTkw6FDJVDDobtKnIaqsE76vCdca4TmaXGhlSCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(83380400001)(316002)(54906003)(6916009)(5660300002)(41300700001)(6512007)(8936002)(26005)(4326008)(66556008)(8676002)(66476007)(66946007)(86362001)(6666004)(36756003)(6506007)(2616005)(478600001)(6486002)(82960400001)(186003)(1076003)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnpUY3BRdDdIUUNhSEVDeFZTOFNEWTladXZ0Rm94NmozU3pDWmovaEE2d0dm?=
 =?utf-8?B?ZXh4QUM0dVNSN3l4UFBnV05ZYUx1Q3E0VWFjZGd1ZlMrVURjOGpOYVRuTWMv?=
 =?utf-8?B?NkJ3aVhaQkR4YisxOHFDVUhYRXRSREtKVlBPcGdrV1Fjby9ITTcyZXVnS1ZM?=
 =?utf-8?B?MFJuSEZQamtzbUtRSmtzMnJhaTdNeDYyd1JMdnlZR25qdHpvOXFPMkkyRTZx?=
 =?utf-8?B?aUlSQWdiZ0UxZVVROUllaFh2czRPMWNuVVYzQ0E4bm1BYjlxUGV0S2VEVThj?=
 =?utf-8?B?R0thb0tYcFpSekU3UjJ0cS9IZTl5bUd4dkdzWWxveWFXbjNZWWtmTVUyQTdM?=
 =?utf-8?B?ZTM5K3JzeGhjS2drajZ0KzFMMmMyQUdPdi9FZlhYaFRCejNsTWM2bzlzOXJC?=
 =?utf-8?B?T1VQTUR2UFhEL2VHNS9uOWsyY1BjR3ZPcFQwUzQ0TldUYittWkdNRGVuZ211?=
 =?utf-8?B?cU5GV3haaXRTb3JCRHJJL3VBS2RST29MSmsyZ08yL0h4S0JtWE5rWGIxUTRV?=
 =?utf-8?B?WnZManlLWkp4UkhBemFvanlDWmw3eGdocTIrVEZ1clB2UGhpZjlsM3pGRVpl?=
 =?utf-8?B?LzZmV2dDMnBHOTlhUHFKcVdhUFdTamZReVQ0TVM3Q0Y4VXUrVXZlYk1uOTQ4?=
 =?utf-8?B?NEwwRFFMWkZnRVdmSS9PaVpnN0JXNE9wenpUQ05FVDY4eHo1cUM2Ym8rWFZw?=
 =?utf-8?B?UEhBZ2Ztb2NYZFd1ZDNzbm9kUS9yQUswSzhsdkk5TTRFNUViT2FhQitKWFRV?=
 =?utf-8?B?cFJGcGhvRDdzOGYwaXJOQ3plQW5kUlcrWksvVVlTSVpINFdsUWpZTE9UWjFm?=
 =?utf-8?B?QkFTaFdXWjRWa3cvdm1ReUpjRnhHRTZ6a0hUenNodXNuQVh6TU8xdGpzdlVj?=
 =?utf-8?B?TnAxRFZLZndpdFNqak4xTDduV2syOXd3aXl6MDAxNnZvYjBFS0E5emxaWnJs?=
 =?utf-8?B?eG1YdktuVWNEWFZleHBCOFUwY0pQakI0a1pkb05xaUQ4UDVrZGRxcHpNZmtB?=
 =?utf-8?B?VUVPa2V0QmxDaHNjWHN3T01WdnRKM2srQmRhWlFaajFBbGRjQWxoWFNFSEZ0?=
 =?utf-8?B?TDI3dGQ5aUxVWFErb0RmSnJqZDd1Uyt6aDEvbDFaR1ZuWXhSMHdhbjd1bHd2?=
 =?utf-8?B?K2t1dFRQUExvOEw5Y1lmaDZUd0EzTjFBdWY1VWxDMUpZcHZpYkVhZmJBSEY2?=
 =?utf-8?B?OGwvRXNPK1RmY3FOcWcvU3VncnY4aGx2WHhSWlg5a1hNaGc4aGZkcWc5OFNh?=
 =?utf-8?B?S0RZRjFYUVRxNjhKMGViT1FzYTNJUURrOE5sdElYbFhzSFdkUUhOclROalpQ?=
 =?utf-8?B?K3k5VlBLbEJiaU03VERYNlZnSnBFMTZjU1dlOEo1bU10b2xVd0Uxc1N6Um9o?=
 =?utf-8?B?OUZZYkFQV1dOZ0E5ZEVCSE81TjNEUzhqRU1ySUZTYVVMT0NvRzBpUElReW1p?=
 =?utf-8?B?a3FROGtCT2FmT0dza1hSZnk2a2ZWcmFZMkFHek1IdmgyMGR1YzFHb2dueHdV?=
 =?utf-8?B?TDRuOTg5R1pXZ2VTaGFLY2ZmcERGeWgyNi9OOGdvRkR2WkhwakRlQUtucWRY?=
 =?utf-8?B?amw4WkNEYjMzai92U2Z1Y1MwR21BRCtrQ3ZORDJxbVJEK3ovblBRR0VhdVY5?=
 =?utf-8?B?U2FTYWQxeld3Q1JSSGtxNlZRVVFjQkJuKzZuY0ptWEQyOHQ4VHVHc3hLVEVS?=
 =?utf-8?B?ZjFPSkJ2eUJvNDRIc21zTUpWY2Fhd3REbHZ5dkkxamF6Njh2cXNOUXhNQ0Mx?=
 =?utf-8?B?MnBpSU0ra3BWNXJTejZSZ2lXWjQzWW9GTWNqdGtDR3YwbEhWSWovU0tjUitO?=
 =?utf-8?B?Q2tMc1hIM2hzMTJ4Y1laUzRtRHYyUnFlQ0UwNDhMRkcwZnRhcHVxeXp1KzFC?=
 =?utf-8?B?cHk3b3d1V0twNzhJeXFEYnZLZ21RSTVJZzVmWHQveGlpazh6TTZvQmp3cGpX?=
 =?utf-8?B?NThBaDBMa1pyakhlM1pVbmlROHZMOHhaWXZITVBjYUxWbGZkSFVHdXRrTUt5?=
 =?utf-8?B?L3lKbGNPdldmS1dHNjdhaXUwR241Q1ZJVDNqT3lCNU5kQnBMUXpBZVdHV3Az?=
 =?utf-8?B?ZUJnUDZ0SDNycnFUQ2hKSzZaUFBuN2VkRzNVT2NJWEJ4Y0FGa1YyM3E4dXVt?=
 =?utf-8?B?UXFEdEo1aUZSbVF3aEJrOThKZlNYWEpHeEdpc2dRQXdBT0l4MVFSdmJ6UGg5?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e955c7d-ab52-4a75-7a85-08dab6977233
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:44:40.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ju/+8MQ+B2nAzHHq1+FIq8d2eYJ3HEALWhO+d8H2eHCBopZz2eQvAYeAc/KlT3kyUurpQGn3iLxuRzoJskXASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5808

It's possible for a device to be assigned to a domain but have no
vpci structure if vpci_process_pending() failed and called
vpci_remove_device() as a result.  The unconditional accesses done by
vpci_{read,write}() and vpci_remove_device() to pdev->vpci would
then trigger a NULL pointer dereference.

Add checks for pdev->vpci presence in the affected functions.

Fixes: 9c244fdef7 ('vpci: add header handlers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/vpci/vpci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3467c0de86..647f7af679 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,7 +37,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
+    if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
 
     spin_lock(&pdev->vpci->lock);
@@ -326,7 +326,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
     /* Find the PCI dev matching the address. */
     pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev )
+    if ( !pdev || !pdev->vpci )
         return vpci_read_hw(sbdf, reg, size);
 
     spin_lock(&pdev->vpci->lock);
@@ -436,7 +436,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * Passthrough everything that's not trapped.
      */
     pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev )
+    if ( !pdev || !pdev->vpci )
     {
         vpci_write_hw(sbdf, reg, size, data);
         return;
-- 
2.37.3


