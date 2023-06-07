Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BA726508
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544887.850978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vPD-0002K3-Q8; Wed, 07 Jun 2023 15:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544887.850978; Wed, 07 Jun 2023 15:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vPD-0002HW-MS; Wed, 07 Jun 2023 15:49:03 +0000
Received: by outflank-mailman (input) for mailman id 544887;
 Wed, 07 Jun 2023 15:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6vPB-0002HQ-Fb
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:49:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cffff296-054a-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 17:48:59 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 11:48:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5321.namprd03.prod.outlook.com (2603:10b6:5:22a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:48:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 15:48:48 +0000
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
X-Inumbo-ID: cffff296-054a-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686152938;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qZoO84QhpTSPnGhVHYEKFRHg0aN2tknsrJ1yoY15YAI=;
  b=QHwAbR/F18mZuZ3GTdJXwta0ebQaRY1ZLQtJn3uoZ7HxfIiUdq2+0tcN
   h8U/Gaou3gcWJAjMcbPpHcBnZa+QxcThnJzTmLCyB3IWCtY0Vz/gOsBSE
   D9ou2gRw7nJq5c0qLKZdyOXBrqvg685rTkh2dg9COfmNUROxjU5qeoMPr
   4=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 111261598
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:22auzKCHAP6gIxVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApDsi1D1Ux
 mJKWmCCPfeJajP0eI9za4u1p0IC7MWDy9FhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3uVmA3pe8
 eEkJiEIVE6Pq8/q/bnkc7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxHmlAd9DRNVU8NZBuAWY3kkWEiEaFkuQ++uVqFe0AtRQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEYwlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:8VQ9Walg9m5vTV0GNS3Lhcks4FbpDfM4iWdD5ihNYBxZY6Wkfp
 +V/MjzhCWUtN9OYh8dcIi7SdS9qXO1z+8T3WBjB8bfYOCGghrlEGgG1+HfKlLbalbDH4JmpM
 JdmstFeZLN5DpB/LzHCWCDer5KrbXpgcPY59s2pE0dKz2CHpsQlzuRfTzra3GeKjM2YaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njOsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqg9jIDPr3OtiEmEESotu+aXvUkZ1REhkFznAib0idprD
 ALmWZnAy080QKJQoj/m2qT5+Cp6kdR15al8y7XvVLT5fXjQjQ0EsxAgp8cXCf4xiMbzYpB+Z
 MO5nmesZVPCxPGgWDa3PjnEz9Xtmfcmwt7rQY050YvDLf2rIUh97A37QdbFowNEzn9751iGO
 5yDNvE7PITal+CaWvF11Mfi+BE8U5Daytub3Jy8/B96QIm1ExR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY/vY1a9DC7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSo5el7oC8eJwJpXmyq9ClmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+6r/AWEqTgKo
 COEYMTB+WmIXrlGI5P0QG7UZFWJX4SWNZQoNohW16V5sLNMJDjsebWNPbfTYCdYQrMmlmPdU
 frcAKDVvmotHrbK0MQqCKhKE/Fawjg4Iw1HK3WltJjvLQwCg==
X-Talos-CUID: =?us-ascii?q?9a23=3A1wPJsGtmgHw2Q/TB2tFRnlDX6IsBcWzf12fUPnO?=
 =?us-ascii?q?2GGNTFrG5ZAOt8/xdxp8=3D?=
X-Talos-MUID: 9a23:TiDmnQaqKuKXN+BTnAe0jylHMd1U7+e+IxofvbcfsZCCOnkl
X-IronPort-AV: E=Sophos;i="6.00,224,1681185600"; 
   d="scan'208";a="111261598"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu/R4EnV2IodtKaDGeS3eYZwgBX+ndAnrXrvw0f7RVR5e6xdI3O7PrMT8AEaIOwzFEvDJTJbHaIxOGZgsUhVsF1V3quO7/Z5iPVibU4H+PkJm8Dfv4m2RskWcoLCs4WpZnik5vYXZQa/jEasZudlWqlXqTwTojwrQU+TvUj6qYUOOBjIC+chqvuHJYF+u9XqeyFDY04EuN5Ff/fs1Y2vTkZTwoGFqz/SKbU4k9xHPYoxyH9Jiw6KeatYso77rbm3WYnwnMmYPgetpviFQNZknZwJpXFOdi65pPtIY8hUCl1qxKPR9nAVcuSdTIdEq8PjSmlTJqVT0xFngHtcmaczSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtwyNaqKcRRK4Ez0+YYUwPrhpl8Qdy0sMv26mhKpbDg=;
 b=SvqdsKBeiJGRtgHhFFX1SiDd0rxmBBhF4iDm6rv11l6J1sgWbuC6dYQCx574lztuHCyzg6oIwb7oG0y79k54Xu9ptZMX1FyTZpJr2mXX7TVJoY4/YzCekVi5JdPw+grn7f3OP2alPco+XvWYyBgFG2NzQljmFAK7KG17CT+94o75KtDnhoeyDkAiNMq1hbTsX9s/NlDYbe2xEQcBcOvpB6w8YZfmJmlhzq2wb3xzvXGHlNu3CohhANavaBOG63h/DpQUfbS6B8g00YKOqZxHzeC4gwMFRnCzuchFH5XuU1DnFvqbPOhj0wYcisZ5yvA01KqP0Of97uzRyFIiR7554Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtwyNaqKcRRK4Ez0+YYUwPrhpl8Qdy0sMv26mhKpbDg=;
 b=L0WVleM/lpKu0yhgLFNbDmKDPkidU9OIZjIt8yxq6ZIg07GYv4doVRFJjZ5oF1Kn7hu4GFn/jkeaQ5TcjTLv35WQW5U/Norx/X0YBHyfupRv3pVJ97YWnQchWEc5aGYcmNWyrlm0HtVq0+oFF/1roOp7wpwNoxFH5wDodubq+6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <728efea9-2d30-fa55-473f-df3a18742ace@citrix.com>
Date: Wed, 7 Jun 2023 16:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230607134638.53070-1-roger.pau@citrix.com>
In-Reply-To: <20230607134638.53070-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e952ab-6ca2-4dcd-575c-08db676eaef6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ErM4cz9fsLYzgBZQX3e5iiv2C0bhczCglzv0WHKG68w0rS3tng8yt7aoCzxp7cvPf3+iGOV1mzZK6xf4KnWYvKyhVGfU+nQuEzTrGsDmOJkQH9eFUgPfSYbkBvCbhTs6GoC+eKa2wDP4yMmaHKyS4eLssHaO61aQI0YRLT/QM0sWnzW/W3W9qJts7VxlSaV4uPyQfb9oulh25u2smDPlTqPI29gZb4DiliPHCceaSBN2PqN5WRI5AjGKWlmUxxsVlC4RU9dl63GOm9b1UQryBaCINx1njEbFox1A/kwhW/PLkQpzZwLLbSQow6iwwCOfv4SG5FmYGznDIJJK1kR7PzRHGDTJ676+74Nz7bvb6vVKHQaF7xU1gJlSGtmaGaM00oWThSCmsXPeomD55JG0SF2tHGxIWCvJQgsjpDLly/MDVyMw0mLUB87Ww7T88uYAwC+Rol6+C2J67lCwb5Ij1sjyF4tZ6bb7AUdqUPKQcQtTIHzolVfXkAaq8jDHyi+5tz3VVKdZR0/YasqL1lSMxaPvtDMF+RX7yqegkxKBNI3xMxKNNEsF+zzZO8z5dukVWKsAYc0OjET1CN8LioMTL1fvel1ODeJhcwP5D+CiJEe6Y66ZDTmRvyJdAhl48GUIQTtcHT+2mtE3uiq6S+sbGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(86362001)(83380400001)(478600001)(8936002)(8676002)(316002)(41300700001)(54906003)(66476007)(66946007)(66556008)(38100700002)(5660300002)(4326008)(31696002)(6486002)(82960400001)(6666004)(36756003)(2906002)(6512007)(26005)(186003)(6506007)(31686004)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdsVXFTQWxmYk1PejIvZG5tTncvY0xMQ0JhVHZYSWlPRnNmbkNieHpYQ3pW?=
 =?utf-8?B?S3NCajRHYmtpNmR3Z3U4N3FUbU1RRlNlQ2UxTlhCTm9aZmZ2MVh3c1NOSWVK?=
 =?utf-8?B?elQxZzFDYnMvdjRMVDdkZ0JNYTJsMG5YOVlvaDdRNUxDNmUrY25zUDd6TWha?=
 =?utf-8?B?dUhtWHFwSm5JbzJhSE55VTk5SlRjdzlnSXNQc2tqdVVidSszYUYvdm5IZlBR?=
 =?utf-8?B?QmtsRXZ2d1Fna2prRUFzYnRCMkNwWkttWXpVL2k0K2k0dFB2eDhNOEJmcGlv?=
 =?utf-8?B?UWNJbk1VNVRNMUNGdDhLVFNRK3Yzd01Qd1I5alBFNS93K3lZNlFQU3hXd0Vt?=
 =?utf-8?B?VWhYclFZT3h0S0JNc0g5Q1hmOVR1a2toK2lwa2hRL0p4NFd3T053aDM5Q3Z3?=
 =?utf-8?B?clhsK2orV1FxMnVqTU1iUVc2d21XTThQZytQVmFBWFNFTFhtYTBSd3BJbUpB?=
 =?utf-8?B?clRySGVUcXBUSDZkNXo3elBEbFBBeVplUS9Qa2wzVXZ6SlB6empiUWN0WGln?=
 =?utf-8?B?ek40S3Y4T2hGYW5QWloycFlhK1lIZzg4aklsc1pFaG9IdnYyeXYvRktYcVo2?=
 =?utf-8?B?RGhTWHk2ZHk5MnFjYjBudzFkT2I0ZjlGRyt4cGpleGRDdVZ1cjNJaU90RE1r?=
 =?utf-8?B?YXV4eHVPMVhab2tWcmxVb2xWUVdoTzUvYWlqaGJyeWJVVjJNdE00b1IvSVhu?=
 =?utf-8?B?SVI4UGIxOU1zazIyZlNZMFRYUFJrWWNBZG9JUE9FQXY1dFRXTmFMMGpBcFVV?=
 =?utf-8?B?dWs2c0pXOC94eDhyZ3poL0hYV01LYXJvM2poQ1l6bkhGU2NDVVpRc1hvcnBB?=
 =?utf-8?B?a01KTmZOc2I1aUsrY1FIQ2RQRDlUT1h1dHlRSjhGUSsvWjZhOGlKTG9LZ0wv?=
 =?utf-8?B?dlV0RUIwcm1iNENXVldEUUpTcmtyaC9mYWswT0VZYnN0RUd1VDBEYVRaS09M?=
 =?utf-8?B?RnJCb0FySHQzaHlLV3p4TzhFT2d4LytsQlh3WlYyMTNtb25TM081S04ydzJT?=
 =?utf-8?B?TXZ2U0ZDeHhCQjdJTXh2aVEreHpWbm00VGlxbzdRc3dpNHVzTElnN3kvUSs2?=
 =?utf-8?B?Z3JNUFozdjVwNmpwUlhBbjlRMjVZbTBzeTBrcWVJNmlqU2tmcjR3bzVQUFVi?=
 =?utf-8?B?L1RiSUFhSkJndkRibUMyTC9hODRpSEVpYlhnV0IzWU9sN09pMEI5OXBkMHNu?=
 =?utf-8?B?Mk9TS1hMQ09zQllLdmF5Q2ZRN2oybXJjaEZLSEYxc3RUQTRRbVpGV2dzMjRt?=
 =?utf-8?B?ZHorK3piQTFSUDc4aW1tQklIV0dRV0tianhrYU1EYnRabSsyeHhTSjZOK2hM?=
 =?utf-8?B?N0xRWitMZ3pNNllKSi9UWTlPR0dUYzNTQ2Z2ZGp3ZHY1MXI2VjZ4bitiTHdH?=
 =?utf-8?B?dWxJV1o2U3lXaFg0MHMrdzVRZ0xQWXdTTzdvd290NHphbENqa1AzUm92MGs4?=
 =?utf-8?B?Y1J6Nmo0OEZMTHkyNzNwbWFaNFBHb2R3Sk9nS3JFOG5hejU0T2FpSklvR3Fx?=
 =?utf-8?B?dnRKTUMreFVXYlpOSVdVYXByME9jWHphWmhKeThjMXhnS2FnYzdxNyszUmhI?=
 =?utf-8?B?clVMTGlWRk9MQUJta1VZOVpoL0dicC95cXFwNzJKZU95Y21tZHBrQ0ZwS1gr?=
 =?utf-8?B?SURaS1V2RHVFajBZak9HNkY1bS9kZnNaMzhjdnpjMXVhOTRSRk1IU0JMYysx?=
 =?utf-8?B?Z0k3OW0yNHVTUklsNmVGSDlLbXk4aXh1SlhZVVBMQTdhS0w5elloT285bUQz?=
 =?utf-8?B?cFk5ZEJZbTlJMzVRUnJ6bkY1K1pZaFJya3FNNXRVMHpWNFhhc0xWRUVYRU85?=
 =?utf-8?B?STgvaElrR2dNYUZuVEZGeThyTmxZOC80NzZlU2dkcXhHNEhuTDUzYmluZ3Bz?=
 =?utf-8?B?cENoTDBYYjc4d0JBWEtJNm80SW1laWc2SVJ5aENJOVh0b1VUMXpJSU1OTFVa?=
 =?utf-8?B?aVVpb1lGdEMzOUxOTWdHOURlRGVqU3RDOFlONDJLSDFVSHZTWmlWd2dybzJO?=
 =?utf-8?B?dHcxV2JnS2k2Smw4aEFFWE5JR2ZTak55WWY3VVV3MDE1anNvaXN1UGdQUFFo?=
 =?utf-8?B?bkNFM0VYWVpTM1VrT01vUXhRa2VQMURhVDhZdHVCUm9YREdGaCtuTGFvcUZl?=
 =?utf-8?B?OG1CcDk4NzV3MmoxMEgyUzZXcy9Qd2FvUSs2Z1ZhUDhsVmc2elBReTlUTUMx?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JGj6JRNs5wpak6iAu+k+dxMqWfWkSuSf5sffW5vH8cn+v4YShoe8ZMVrp0qzdbs0bgWQ8jvH5+eT/tmPEkejRCXjCeDbyTZYf5IYitsoUld2Jy5u9YvaP1P0sTFrk6/bOaJVigWhEeFfnUniSwDvGkh7xyLKnkRIW87UsnSj09V4wFOczeGnOgmXKNT5Ky1Z5NeHNvpfSuf3XvQu67Whl7Ad1l4JRvVRj0lsjBuxn3TfW2ueLozsPdTIv88IXaOEt6ierEJOd6ckgNSGNgsm+WWumTm6uNoPjcxxB9aD5oENw00Ssh4JOHrCCHLy4bJzoeJfry/36jOCsMQH7SjdLeRJB7oYdtF84DNtTcUM+9h95LXmoNCK0ZJkEiEGkDpv6O74za51rPMmZPTXw2bj3CrHbuHiWHNwcFskM9DsYLNmZMgoSL+Cdm08jWravOz/49Q1cx2MHz5u2spu/+uV9xSyvJE/g07mFpxPrDpUBO64Cg5nN4N92tFgrxBGOMjj0fxWcIPUqbzbeWe/1NnsJGVQ4/FVzF+QlPFGl29ZjxH0l13tTKs2aK8O9KY/GAg+9zwklhS4VnvXCjzsiB/wuXG6zeEH4gj0/5YdQvdGf7fEA79kBQaUYUMFEnM3Msv6LSvepVBN0NqUpAhUNMK74DVJ6/s9Oa6INoB26REr50Za/UYvyBcsoWGOGAbacBg3drabTrJ4OLNpntG0dhyDpjNY1lqddSQbU3dqA6MkqdU/STQpVjgagH9QzXpP9CLpazGomL3LX4nOptr/OcSULRzHlgJ9Gi4io1nzPnIqefDRwq1J6Pq5kroUS2gBehm+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e952ab-6ca2-4dcd-575c-08db676eaef6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:48:48.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzsN9QNtRiD4F2qlplrAznnbXkgGCTpIiUertYY0XnoyB9ULJKv06PLSwNpj4X2xPJfOV1cnUEgihdT4gSmIPZNPImXcHyoch/BXC8Ze10w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321

On 07/06/2023 2:46 pm, Roger Pau Monne wrote:
> Some of the current users of hvm_cr4_guest_valid_bits() to check
> whether a CR4 value is correct don't print the valid mask, and thus
> the resulting error messages are not as helpful as they could be.
>
> Amend callers to always print the value of hvm_cr4_guest_valid_bits(),
> and take the opportunity of also adjusting all the users to use the
> same print formatter.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/domain.c       | 4 ++--
>  xen/arch/x86/hvm/hvm.c          | 8 ++++----
>  xen/arch/x86/hvm/svm/svmdebug.c | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index deec74fdb4f5..8951230a9f52 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>  
>      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
>      {
> -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
> -                v->arch.hvm.guest_cr[4]);
> +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
> +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));

I suspect you want to call this once and store it in a variable.

It's a non-inline function which also isn't marked attr_const, so it
will get called twice.

Also, if you're extending like this, then you actually want

(valid %lx, rejected %lx)

passing in cr4 ^ valid for rejected.  It's almost always 1 bit which is
rejected at a time, and the xor form is easier to read, not least
because it matches the X86_CR4_blah constant of the bad feature.

~Andrew

