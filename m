Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B2729CC4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 16:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546078.852682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7d2G-00055o-ET; Fri, 09 Jun 2023 14:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546078.852682; Fri, 09 Jun 2023 14:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7d2G-00053M-Bp; Fri, 09 Jun 2023 14:24:16 +0000
Received: by outflank-mailman (input) for mailman id 546078;
 Fri, 09 Jun 2023 14:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iE2P=B5=citrix.com=prvs=5173412b1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7d2E-00053G-3B
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 14:24:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d0cad58-06d1-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 16:24:12 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 10:23:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6458.namprd03.prod.outlook.com (2603:10b6:303:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Fri, 9 Jun
 2023 14:23:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Fri, 9 Jun 2023
 14:23:55 +0000
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
X-Inumbo-ID: 4d0cad58-06d1-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686320652;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hOxvSz3e1SlP0IKgRLf4Inrz2ducAuu1a5g/FKTSyYI=;
  b=C1Yqkq4l7J5StxGWeajP62rjDF9wgyQYy7h6wyaVULcq357EMsB7vRIA
   kWak1XPgRf22qimZunHz5PVqRT6Jd8u/hW0rBbqWO0x+te59XalAZHPqg
   KUSwc2JxMmVSf54m+71OajjTuK9NMvrQmkxYqPkfqMDwPyb3E7IDb0Q2/
   Y=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 111546699
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LDuuhKxi86sgBdYyJmJ6t+cExyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 mYbUGDUO6qIYTDwLYsiaI3ipEsOusWEmIAyQAI/rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTxK/
 /sIBCsdUg2S2OHs6bK4RcB+3Nt2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aWwH+lBtNDfFG+3uZ6ggGL+jcLMgYtTWTn+ui1lla1ResKf
 iT4/QJr98De7neDQtDjXhH+pXmesxo0RdNMHvZ85hvl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9UnuY67qQ6y2/IzMeLWIGaSIsUwIZ7sKlrptbs/7UZtNqEarwi8KvHzj1m
 2yOtHJn2eVVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:g7nCia+aFbdlYPD5uCBuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:pvJfWG8VOiTmptP2BnKVvxMQEMc1XmbN8GrBfEziIGZqR5SHE0DFrQ==
X-Talos-MUID: 9a23:pQ/vzQYqydoCdOBTry/u2Cleb99S+J+2NxxWgJkao8KaDHkl
X-IronPort-AV: E=Sophos;i="6.00,229,1681185600"; 
   d="scan'208";a="111546699"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9zPsr48PByP78QFhW07yto6qGxYiVKx3fVRCfxKitG+8rZjInFzBgDVJz938wbLPrikTifiuqgbmD33K9ylJffSOtymMfI/05QHCRFdp9EXWLDuDZMGJ8NGHQy4xr6b1NtUpvfSxHqyuygn8MJkSTOSRoHpXd7HE7oSAafDqIYP/QaeGfvnISursyN3PO6uhD/9lW+cMMX+TdwPn9OwpJm89gBEWEdlbyO1nnUsAHB9t7rOYWAnfqCIYRwcozlvA1syKs5/VKqAikEqJWjW8KQF9kVsJ0FKyp1NEWrsUfMPoDG/w5J9jAeXTI7YvPy8xkd0rg1kltDSbNN7Cl23cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRwNSNm/3CDdAaK/iUyDSGKTbzYTMyRIaMq1Ol835Y4=;
 b=gztnMhqT4DPFjjT3pK5v5DAMHCR2+iI80Oiksb9YC/MTCaQz3HW+YAsFcbILNEybvi8uOAYPAprCBsncgCAWM1/a5XNrwvYZKP6W88B9vaLdjJBGmJBt4JH7NGKJ8G+kEXFB1HiXBtqa1F0FLMBPOqIxxQPUN1naNUC5AUSBNtmvLQ2G2dfsGIPfE7d9b7LlM9zC/mq1vW16mEg2W3xgZ+E0+2AWJRMSv+UF3fQftSjWFpBpkMAZ6LOdWqWLbXRyoVVAc73jdMYLk3DiZg7/qC3A4083RiA+KpC4NobFfY5YxQ8GeYNlnvol0LlloJ1N7wLV6uI19kCRrgQpcESFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRwNSNm/3CDdAaK/iUyDSGKTbzYTMyRIaMq1Ol835Y4=;
 b=CjBQuLb1XuOmvFiEWjLuyQFPLEcLyuJO8/fY6euL3lEdg0rccynmDVJcwia2EIBh3lnbMGCd1uZrrTNJT7ZHMVGhYJOLXt9WHKfWPAkD0uBEZr1ebf8qywT8GINewyinQjXd5ggungntn5z0l4ZolVEmuf1a3jtqPccaeJrPX0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jun 2023 16:23:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Morel <david.morel@vates.fr>
Cc: xen-devel@lists.xenproject.org, samuel.verschelde@vates.fr
Subject: Re: RHEL 8.8 and derivatives: suspend and live migration issue
Message-ID: <ZIM19KWEvck5yPXV@Air-de-Roger>
References: <ZIMyOmactutaE8h7@raton>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIMyOmactutaE8h7@raton>
X-ClientProxiedBy: LO2P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5685a5-4ef4-4d0e-22a0-08db68f5285a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	STSJ4k68wrCtt6ZHi7XBM42iX77A2SbHuf9OZoiZElYLfHPayU5cDhhArNRnde+Xsbq8vVTixBFR7ETONA1BRNCB491F4hi6yCF14dLzOfkGMTdy/pZVtPWxjX0eJvOHYB0WSch0BEITNvAD1P5WTfX65RHP5aCU4a/wnXVbW+fDdZDI/ZCvvx61lPtFjDEZLwpcNtqse4gO1tu+s94CaOjc0IphClNw+yGJ1XsSGFUssMIpvtOeZJC/ATp2hYtrYkqg0N0zkcAX+cUn+PMF7jeMaj9wt+uZ/U13j8dT7LdvSsYGFaKN9ANfkU5/bVXYUoXh50Crx57dBNLmXwsQTolQg1f81aYvnbc05OSWDZx9gFz1BtFKbpQweZf6bsKw3ci7hvXAoOTav/A2fecNc1VgmZFhB4DeMU9BqZI6xGw0kBdHtVZ7doe72bKIFgwpFfmFYPhyc8wUMtdm2nDiAyThaCRmxrkcCwwNj/Yp79Vu8xp2u6YHw5WVjAl1LV5Vwvff1OB4rg8Ypta9ES9ar0MCK/zIZ/LVZRRN9A23rCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6486002)(478600001)(316002)(966005)(66556008)(66476007)(4326008)(6916009)(6666004)(66946007)(41300700001)(5660300002)(8676002)(86362001)(186003)(6512007)(26005)(6506007)(9686003)(4744005)(2906002)(8936002)(33716001)(82960400001)(38100700002)(83380400001)(85182001)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VCa3N1Rys1VjVUY1pONG9hN01DUkZnM2NYamlTVnEzVytmdEYzeHdBTlp0?=
 =?utf-8?B?aFVRQ3lodkNaSEFLeWJ0QytiU1I3aU5SRDhCZVlXUnJGMUpTWFhZdWNYeDNB?=
 =?utf-8?B?VXBDZE1ET3JOYnljN29GQ3FRakxSeHNrUzluZzYzVTZWZ3lRL0FReXR1Njgx?=
 =?utf-8?B?N2JVUjgvZUdSY0s2ZWJHNlVobmNNSmNNZSsvYmR1dzNCVzM3aWQvWmQ3ck9o?=
 =?utf-8?B?VThiMTR5Ny9DaG5vUVgvZll2S3dKWTRhOWZqeFBtUk1kK3pZNzZSR1ZxMDV1?=
 =?utf-8?B?bFp6anluZTNTQkZEWENraXZrYkpnV1MrbC9lTW0wTVlMQ1RDLzhBUVg4WkRR?=
 =?utf-8?B?RTlYYkdJRXhZSW05ZE83cjY5dTBBdUdJTGprY0RyZlJMVmgrNHUxeThMRS9h?=
 =?utf-8?B?aWd4eWpWdVgyUXZMenVwMm91Q1psWEdlSHg2ZkZySkNxby96SXVjQVpmYndH?=
 =?utf-8?B?bkxJcUlSVzJaSG5MR0NvZU5VNkZWeXJZU3dDMGtyelluemY1S05yUzZBcGFj?=
 =?utf-8?B?c0lpa1p0Vy8yenNIMGpzNzJuclI4SDJmeWRrbGsyRUhHcFFtUkRqbVEyTk9a?=
 =?utf-8?B?bTIzRFNxd1pOMFM4aWp6TEJYV3kxWTFCVHRZRHMvZTlCR29YV25nZWNKdUlR?=
 =?utf-8?B?eUluNzl5eVlnZWk4RTRaOUxnUXE0Y0VVeVBrd21yUnRUTEFTUkdoMGUxYzI4?=
 =?utf-8?B?U1FOMks5c0tBeG1ESHNHQTFvSkZ5Nm9sa3BzNm5heGpBcy8wRzR2OHhOblFu?=
 =?utf-8?B?VC9LWlBWQ1podWtLNkpWelloNzcwMDdNWEd6TktvSndXcUN5RVJieFBaNEtx?=
 =?utf-8?B?TlplamJLOUY1UEVaRFo4dDc2aXQraEhidXhDcVgrOXNrRWpnOFRNMTNaSFNw?=
 =?utf-8?B?ejBnejZBclphb0J4bk5HWW9qOExveDJ4V1psKytJUEVxb2xBdHVsNC9TTXBr?=
 =?utf-8?B?QVF1THRpZE5oTWg3SUNZajBENzR3WllabU5OWHNnNTBNQlZlSm44NnNOdWRF?=
 =?utf-8?B?YzZGQVhJWFVncWJzdTZBT3NJRWc5UENHQjVlU3ZPdk9lY3ZmRk5CRmlodnRs?=
 =?utf-8?B?TlNHM0xSWTE4c09hN09uWmtPVU5YNUZmMXFTbXFwYzFRVHB6azkxdEw5VExw?=
 =?utf-8?B?aG5iNnBXYVlBYjlXeERzRm1yVjRyM2hydFhtWFhoN2RFZHJ1dlN4MkQ4a2sw?=
 =?utf-8?B?bnE5ZVpCMW9BbWU3b096a3BMVmFQZWJJMzNBTTVnVVNqK3UzQnM1SWNHNnlI?=
 =?utf-8?B?NG1qeU9CREJyZU9iWW1WQmpTcXhOVGlEKzNxMUV1dnhpS3U2dWgrazRjODhu?=
 =?utf-8?B?MEowNGlmeXlQTmE2THd3RXM5c1JBelNKbXAxN3BWb0VBTFBoR1ZISHA2L3Mw?=
 =?utf-8?B?WHk2bG5PUDBOMDlSMTBHSmRiM2gyd2p0QkE5Unl0OWVjOVlaUC9GRmtpNDhI?=
 =?utf-8?B?d1hOY1djNnI1eVZmYUxQQktRRkJYRStSUTdaeHlJZTNFaEl5K0JZc01VMVFY?=
 =?utf-8?B?UitsVithNlVtY2g0MWlZQVJ3UlhmY1JHandRQjRqVEQ1NTlYNHVNZUxwdDJU?=
 =?utf-8?B?UlZBY0l5Sit6NEVJUVdOR1MzaXBOaWtxTW0wa3QwOUF2WXduTVpTQjR1ak9v?=
 =?utf-8?B?c05ONjBRMXI3QWxEeEI3MXFMMXprbFNjVzNTTXNJL3ZNR04zaXVaUlJEOVdz?=
 =?utf-8?B?MEk0WTBqTWNPZzZITDI0SFJVOEhCT3h6TGd3bjZhUU1YMUVUbUtQTE1ITCtj?=
 =?utf-8?B?R2pOUzA2ZkFEVzVFNk8wU3hWSHRsS2gvMkY2TkpSNjlDQnQ2OHZTKzZmcjRt?=
 =?utf-8?B?eG1MOFNtakl3aUtCUlRrc3F3dzhVZjB3Ny9HS0dSRHRqdW5QazdGM0pJR2hv?=
 =?utf-8?B?VDI5N0g4UHhMTHZIeHRTS0hLejNpT1ZSMlhFeXJhQXQxVjlCSzBWaGMxOWRl?=
 =?utf-8?B?Y25helZRSTFhOXczenc4TWg4elNZTUZEbFBwa2w1NTZwd2hieXhqakVNWTdv?=
 =?utf-8?B?dUJZMFJzR2N6VTR0dk13UWRubjQyS3plREh6cUt4TFF2dkQydU1mRmh0Ym9i?=
 =?utf-8?B?aXFnbTMzM05RWEREWWY5bTYwQ2Q1ajMxMEo2SFh0MytsWWVOUnFxcU5EVkN6?=
 =?utf-8?Q?wYHpsGPSiuQlfmB63sH87H1wV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f/032z8cZNfFazewj/0nE77YQZSPviobHrKHk3BFE2BLQpmZBkVS6wFnrkTFzwgQaHqqZAX6qT++NHX969Yj72v3sd79YicrKsviIVJEaD27K36BRcayPou5eH+Hv/z7JKF5DhalLJhjNqM9otSPBJ0a87uuVI/poc7Mf13xEbJ+vOIteSl8VAmhY+nNTAntmO4pCvc1F08ICcD2KRAcgaJtedf60LG10FjIgDkn9cRG0CUPwLhSKnXfgBxtJ5NLUHeuFqHASIQ7dvM0vtyzNKWD5ENDeXSHmAqtFmNChVOc531EDXy/nodiNdYRO0E07BiB/qFV32DJF5x3cK/wPHbB7mUngA7VZmqYOthtl/CaksfiHkBTA5PZfVuTTGE0/3qDo7j9b/8mHxdugOYyA5jkASJq+MRjol1g73n+cTnn+ot6+xrbU5SiBzYQfJo0S6pBCUVDIYaMsv7f2sdi/E/jdmR6zYWlOHXU8lvTCLPeWz8cRBskfrEyTsp95+/9R1aTUaIY9kmhZvJVCGIPh5AezL4gczT8anpplHGh1seEK8X8xYhxFUksUY32oHCfnOJmxKHa5lFeFSvvsLoUUsjXhx2z5KPvxQvU2N+OkJCCJQHAwLAWAlxH0xsz5dThrWO5gkOrGmF5X99UE2PWK4KW6Q0PFk5A+n556XGdtGIY4ttb2tpvfoFdiyRjE3ymKzLTKZQEQGsF/SEbSa7Ia6Kz/KViUVXq4sygbojnRPI7ql5obSV0uvQH8/Qysy303HRQAW5Lhh93SCljfunilzA/P7onnHgvLZGI28wY+hs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5685a5-4ef4-4d0e-22a0-08db68f5285a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:23:55.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReCyps2qFhuYw9qdzS33OwuLai1jzig6XIl+WqWJFFkFMti9rrtnRk6yPj7ZmCWaMhWvQZiNWAyr3noDDZTR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6458

On Fri, Jun 09, 2023 at 04:07:54PM +0200, David Morel wrote:
> Hello,
> 
> This mail is meant to be more of a summary plus a heads up, I don't think
> there is any action needed on it.
> 
> A user reported [1] a crash when live migrating a VM running Rocky Linux
> 8.8. After investigation it appears to be happening:
> - for RHEL derivatives when migrating from 8.7 to 8.8.
> - on suspend/resume
> - on live migration
> 
> With a callstack we provided, Roger Pau Monné quickly identified the
> issue as being the addition of:
> - x86/idt: Remove address operator on function machine_check() [2]

No, the above reference is incorrect, the issue is caused by the
backport of [0]:

06184325a1cc x86/idt: Annotate alloc_intr_gate() with __init

Without having backported the mentioned Xen commit (x86/xen: Split HVM
vector callback setup and interrupt gate allocation).

Regards, Roger.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=06184325a1cce27a02a688d98740f90fe06e0133

