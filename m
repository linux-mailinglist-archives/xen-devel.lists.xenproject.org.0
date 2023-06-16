Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE87331E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550166.859087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EF-00020h-T7; Fri, 16 Jun 2023 13:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550166.859087; Fri, 16 Jun 2023 13:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EF-0001xM-Pe; Fri, 16 Jun 2023 13:11:03 +0000
Received: by outflank-mailman (input) for mailman id 550166;
 Fri, 16 Jun 2023 13:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9EE-0001xG-Cf
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bd9a88a-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:10:59 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:10:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:10:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:10:54 +0000
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
X-Inumbo-ID: 3bd9a88a-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921059;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=65UCKKh134J0IWvzlgvq4hxcx/9Z3sMgmsn8JZkBqMw=;
  b=PyXMVNyHtV2MtuTTjP/h5g8aMtQKTVMxy0/piQjJIfqi4V5+UIeoBHCe
   ZdhM2DoO7nD/SFmqGesGGVBOmaVdi+jdFPF/sZEUlArFP3K7wIGVVj862
   u+HSHNG8ZYXpXxqc6lT/ILLghhm/klNHCZY6tC+IoBRjWsWYKD9Eh+R2c
   Y=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 113085852
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:brers6wI3+KGv1AB1O56t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkUEm
 mRJUWuDbPeOMDHwKdpyaI+09kkPucPTyNBiQQdr+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWNg+
 eYyNjJUVU2siu6UzoucTcQ2p9t2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFYZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137SXzX6rBdh6+LuQ2eN4umLJ3FYqCww5UXGqrNib03+OVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLnW0ophfGT9ImFbHviNTwQGv02
 2rS8HJ4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:Nhxm/anP4wJJl3+oViMwOzwOb/bpDfLh3DAbv31ZSRFFG/Fw9/
 rFoB19726QtN9xYgBDpTnuAsW9qB/nmqKdgrNhXotKPjOGhILAFugLgLcKqweKJ8SUzI5gPM
 lbHZSXCLfLfCJHZcSR2njELz4iquP3jJxBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:o41TMm8wGcBWB6tRz++Vv0w6FtoPbH+E9yr/LkOaB19OT5DPaEDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AYEDqpw2hL8BLjuH5tN5Ip7AhUzUjzLm8Mn9Xi68?=
 =?us-ascii?q?/uNirMQZhNha/1QWHTdpy?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113085852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6cZnlhA7TmtBDSwuzPqgjNylFz0An3j543m2ynIMvtsVvvQzzXBl1mrXrdK36Vo6eG6vIR6lYf4oWIwiZdRh62jtdyWYqoPSTehg8RLxF1idW6ezjMZrQpqxdsePwW7Lv0IJBLR+SDzJYJasEu8BbG4ECqrwDYF829QOTu7ucAVPDhiJpEyeFbD5rGtRFbX80MK4vINfZxaomCN+WWRbCGj7qfx5lfCSjAMIP9DxgI+q5dVohvX8vXuUu75FoZeYAz3W2Yx26H8Ult5sVNvacqjPsZkIq95+6iKKtnDapqdslwoX4kzLpCGrlHLgyPDjyhqNouttwIrDph+1CPrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNqSx622qdR/rT04RVhtSMuEjyQxLCiBxalL8rrQoxE=;
 b=IHKP7YLKCUhgQ8WTmt6NOL/NUpA+RpT9jBFMXUUoCW8WGMaYlF/bpH7QSM2LVJVaqgKNCMX3AY9h0BOhe483x+7cSHrgteWC3TAyu+XOLwhNjrrOHCZqTqFRa/ZymJ9kC1qU3VjCko12pEwBYhoL1kc8sSCPwRQAqctHjx1jX6jGSiIRO/VxUEmoDOtFOTT6SlNvdskPYvTzmqYCqZm6mpxIJrJaW5CQ2nzzwc3+Pl+iLB4HNsG/2PWMJc+op/c2zegl3TNMzZVqnubXRLC9X52ESppOL8u2PyRk5Z0BgD+tLkMkgYuhRzVzEmtaX7i7zuLm8NQqeZGTWbJlZTS/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNqSx622qdR/rT04RVhtSMuEjyQxLCiBxalL8rrQoxE=;
 b=ronw0CXijfVcMh952wRaZkhrfbCqcgrWSdFPrgvhep646XOvswNhJ+7caYC4wHuxItLYX8GM2B/UQhyXTm736RbT6cr04xXFIQEAENOLJ+q1wanru25bejNySIGmTglmCtbTF05dX+CXWKyZq4EbzflqnfU7n3VlUPcACV3NR+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 00/13] lib{xc,xl}: support for guest MSR features
Date: Fri, 16 Jun 2023 15:10:06 +0200
Message-Id: <20230616131019.11476-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 3beda851-de65-45a5-d751-08db6e6b1dc2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K+vB2+7KR2+FN18xU1fNn0aTF4RoGWNlrl17KQxl3lgBgUVsG2Y/FKh873nLmiJujfWGj36iIXfWym2p920uIwIOljikZUYywduQZfuklxvkp6Rf9M4pgIMJcmbavVl/E/6cLMrheIOIw4ex/EkNLZtyliBiC4ZMvNITOYKPbxeu5dtReYqpoLNfVs8wuHdXfGqf9qnEJ0lX2/iyS+3bJTgPHIBMXRGE5CZsbSfpvHpcY9bpVjEBKZY+AB3CgjBQWOfm+A85E6S4F2UKq79IpB4vmw+avzLaBwHvLTW4Tv94abDxxTL/fDRAnmrMokxvqxDc9u1ACFxOaJ5YeU/oz3QJwf8F3O/Z/aAlxreZuRQx/klVA61dIY7iKOFE5J7K34AVn459EHgHGtBbn+P/hYYfbySzsUllcBXemZbVjT9AKIIiafSPq02gW55xzYPFi7WEsf5TlSQwxS3WyjZRfGvAzWjBqpaEBINWW09W/rwPd30wu8DSJC95okrwz0LMdvVxERAGi3crKo6Xz6UvaCY34kTmbl7sfYB10iOHKH6wU8kuZTeYYeRUCh4oL4ko
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(107886003)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1xV3NNeGxsNVBrN1NOVUJiV1BWWVVqeXdoUGd1SU1zZVlHWG5mQTVja0Zz?=
 =?utf-8?B?aGYyWE5iVWtDbXJ1TlRicWoyakwzcWxTQXpzMy9iVGlIVldXMFUxOEtxR0Rx?=
 =?utf-8?B?MmpDekt6enl4Ly92Q1dBMzBWWWhwVHE3dEU4N2xVSnJMeGVvaExDRElrT2lh?=
 =?utf-8?B?VkFpcEk0Z2JrSTUyUlU2YWF6SFM2VGhZZXRzYi91QjM0Nm0xK0FjSjd3OWsx?=
 =?utf-8?B?Z05mOXg1azBTTEJZdHR4UTRVU21SVjZUK1FlNDZzV2dYY0gwVVlHajI5U0NO?=
 =?utf-8?B?ZWJnNEVGb1lBZWJRRVRhV3R2YzROV2JWY1JrQWJiWS82MEcyS0xJMWJJOHZD?=
 =?utf-8?B?dHFtRy9ZUXdaSC9BeFVmS1d3d1I5bmV1NjJmY1RaTjdUN1NYTTdaem16NjVa?=
 =?utf-8?B?RlRTMnUvY0daZndmN09ndXgraXgzck8wa2ZhV2kzYy9YYUdvOUkzTm5nOGRZ?=
 =?utf-8?B?TWJCSG5pT0h6b0IySGJXWWc0d3o2aDl4SjBEUDV3Nk0vVlRKc3lic3hlUjFC?=
 =?utf-8?B?bGZQNnphLzQ2UHZUazNWNTlGblBjdWRxVStyTWRqdXFYM0FlZndmMnZYdFRN?=
 =?utf-8?B?WWZYVlpZZkVOWDF0OHR4bmp5a2FXRG40cUVWTDROeTdtTUFKbHo1OWVrY3dC?=
 =?utf-8?B?YW54NHRnSmVlZ0VQUFNvWTA4MWI1Tjd5QnJUKzR1TThMOE5JSEFtdVVmdExl?=
 =?utf-8?B?Wm5xdHZ4NllnOUNNZUUzRXgxSGpiSkdsSTBVQjNRVk4rMExBVStPQ05hNkUx?=
 =?utf-8?B?V1lFRlc0dFZkaTFlS1ZrWndOcWVlRlpNYTI1dzBnMit5OFZZOFFCcWR1VHBU?=
 =?utf-8?B?bDAzTVVVQm5UaGN4OUc1NnYwa0ZiN2ZDQm9FNU1DaGFqZEJaUlZYcWFRNGZl?=
 =?utf-8?B?VCtjVXNRc2I2Y3pSeXd0d0NGdTl5MVJ0b0VxWTBkNXRZcGZtWGNSdnM0Q1Mv?=
 =?utf-8?B?ZVlBZ0szNlphdENkQmtKV1g3ZzFGTDRXai9Db3hDUVN2RjlKNzdSVUI5MlVh?=
 =?utf-8?B?TTAvUWM4TUYxYUFSVEFNTVVZc3JBVEVvakV3aElCZ1E5cjlSaFZTdjR1bnpD?=
 =?utf-8?B?NTd6WUJQb05DaGR0aGFoVDNUYXI4cmMyQ1ZZQll0WXNXQWxIMXBOdWE2MXpV?=
 =?utf-8?B?bnozV2VGL1R1ekVHbzdPMXJuUmhaQU9RVTZHbHVnNGMzZVBlRHNsakRxWFdu?=
 =?utf-8?B?dkRGWm1jeEY5NU9aZW9EaElpOXF1NXNyUUVhc1pUVkxMRlYySDRLMUpKeDJC?=
 =?utf-8?B?QVpJMlVpOHUwWk1xZ00xd21BNDdISUIra2o2WGRrUzVGYUgrbVBiV3I3TWl1?=
 =?utf-8?B?ejI5eWN6RE51TmxlRzRXSWtSSUdEQ202aW4xS1I2b0ZMaVRlZzdoY00rQ2ZD?=
 =?utf-8?B?eHVCck9zektITEFZbmhNRUxTK1h3QUpPTEFDeGl4QVhrOWFHQzBKL3NGNU5t?=
 =?utf-8?B?bjJTTnN2dHUydHVUbzdhWEFrekszenZRbzg5SURtOGE4V0hGUm1pVWN3TFZB?=
 =?utf-8?B?bG9UcDIzQ0svUkphTWtYUkRHTzJ0MjlQYlFNcXFlaXpUQWhkcFNrNmdYMVly?=
 =?utf-8?B?N2FiaUVUT2NrRDk2c2svanBDMjFaM1BneTJFREJmanZVU3F4eEY1TjBJMitY?=
 =?utf-8?B?eUVnenUrQmdjK0NxS1RkZ01hY0dBNVE5Y2NsbjM2dFh0cVd4Ty9MNEd2V1d1?=
 =?utf-8?B?Y3V6NEdUV2t0UjBvcDFKdmtIaXkwaEJZK2JET2dqR096dWdUbkpHUDFwVTJK?=
 =?utf-8?B?ZEN0YnRueDlTY0s3a0xlSS9HMzQ0NnJBck0yNG5hMThqRzMwUzVMMDlPanEy?=
 =?utf-8?B?Mld6SFE0OUF4T0JDOU9NYUdveGN5WU5ZR1V0eTBhV05tMjRFb1k4ZFcwUFZK?=
 =?utf-8?B?c2ZtZWhlc1VRRFdSWlYzN0xQeHJSd25YUCtYSEJjcFdDM2plSzkvV3c5Zmlx?=
 =?utf-8?B?d1JVVTcrUEE3YXV6RHNlV095b0hBVWd4d2RmWW5OeXNnNUtJL3Z2bEpxNXVQ?=
 =?utf-8?B?L3FOS0VyRG9IMXBuS2ZaNG0xK0I3aGFRMmR1cmVUd3BQZFFZQmNRQWoxTXNQ?=
 =?utf-8?B?dXE3cWQ0OEs5azNOUTd5KzQ2RjVidHBpMFB0RHhMN1dnZjZEbDV4V1dMRWZk?=
 =?utf-8?Q?hKrQB5g2fAno0dAWqcG3fylSB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wIFjyQAvYXCe/EwDVTja8evRdYqvD8hWs1d3aUW5wmQyS7Wy7lgPceA8FjoxnJJTuOuvmyUHzA+tGiyg1XvM1FIPe8esBKLIdvRU0P1CcVtwufvcDldHw72eFbjj8zOovScdl/FhEHFFeS70EX07wxpyr+zMbV02BavkbyQpbIy3fMHioFjYAUIjZ4bCKVhdoFskNulrwN7vhcOKlx426CPpuUO8JTchxluVYWu2YOla04QRz1OVBvytXixNHYOlBPENuUKQQ+9ysRX19x2WljRrbXtH62dLLyJk+lceFW80v/nRP5ZOl0R8KkNkxFfHEHvUz8AHMWZPq98PCMywW6syIRO0FWS4cgxD4QwDZtHzsETcNi+ecRp281Z9om06+qPbzhFmXwEdFML9fuQcPgXIIfCwZePVeynwKRihuQwatTpQyHLtLTUoVlmTA7FplPrr/YRXlP5foBPx+mXx0ko6J8Qvw77VnEqDNDXJMeorlKKaz8D1xZcu1SB6qLGY4nbQ3SWZnp7XbipoVwt36uXUgb2u2Gv4d8CmNiDTHLC5JdAU0r2kdNTznlku7bNLnVQnwsmLt0bMiMRldOxa/9QGTLsLtjmKT83Y/J5a1eBG1m6t6eE2kxFWivBIOFF7NxF9f85/oyO8591kqE/bYGxktRlTTe5etTdSXkjpeAc40z9sGBUqfWpv6eNf+8essS9ySPAeRDHpfu6wx097aIANQAnjUnCGH+m5H1XrBb5hWlCpWWJl92xdymS+FTXezekFpxdfp7AApZPXjlioBrn/FP8FzRuyVTrXztXcqBYQIQFJH3fr5QzF+IulN112
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3beda851-de65-45a5-d751-08db6e6b1dc2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:10:54.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0acbXgfHETsqDXCGiDvgJzguRGFADs7h7O+3BhrZuHa5v5ydSRC1E8f8FeWU3nPh5w9Mx+lnZaFGRSDnEKh3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Hello,

The following series adds support for handling guest MSR features as
defined in arch-x86/cpufeatureset.h.

The end result is the user being able to use such features with the
xl.cfg(5) cpuid option.  This also involves adding support to all the
underlying layers, so both libxl and libxc also get new functionality in
order to properly parse those.

In order for such support to be as transparent as possible for existing
users of libxl, both libxl_cpuid_policy_list and libxl_cpuid_policy are
modified, so that the libxl_cpuid_policy_list type is no longer an array
anymore, and libxl_cpuid_policy is converted into a structure with
two fields to hold both a CPUID and MSR arrays.  It's my thinking that
current users of libxl had no business in poking at
libxl_cpuid_policy_list, since the underlying type (struct
xc_xend_cpuid) is opaque in that context.  Also the format of the array
(with a terminating empty element) is not documented in the public
headers.

Some of the patches had been salvaged from a previous series of mine to
introduce better cpu_policy management support in libxc and libxl, and
hence contain some version notes about changes, or are already reviewed.

Thanks, Roger.

Roger Pau Monne (13):
  libs/guest: simplify xc_cpuid_apply_policy()
  libx86: introduce helper to fetch cpuid leaf
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libx86: introduce helper to fetch msr entry
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: replace usage of host featureset in
    xc_cpuid_apply_policy()
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: introduce support for setting guest MSRs
  libxl: change the type of libxl_cpuid_policy_list
  libxl: introduce MSR data in libxl_cpuid_policy
  libxl: split logic to parse user provided CPUID features
  libxl: use the cpuid feature names from cpufeatureset.h
  libxl: add support for parsing MSR features

 docs/man/xl.cfg.5.pod.in                 |  24 +-
 tools/include/libxl.h                    |   7 +-
 tools/include/xenctrl.h                  |  21 +-
 tools/include/xenguest.h                 |  13 +
 tools/libs/guest/xg_cpuid_x86.c          | 383 +++++++++--------
 tools/libs/light/gentest.py              |   2 +-
 tools/libs/light/libxl_cpuid.c           | 504 +++++++++++------------
 tools/tests/cpu-policy/test-cpu-policy.c | 220 +++++++++-
 tools/xl/xl_parse.c                      |   3 +
 xen/arch/x86/cpuid.c                     |  55 +--
 xen/include/xen/lib/x86/cpu-policy.h     |  37 +-
 xen/lib/x86/cpuid.c                      |  52 +++
 xen/lib/x86/msr.c                        |  41 +-
 13 files changed, 821 insertions(+), 541 deletions(-)

-- 
2.40.0


