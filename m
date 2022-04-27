Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D490A511527
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314859.533130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD5-0002Xw-E0; Wed, 27 Apr 2022 10:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314859.533130; Wed, 27 Apr 2022 10:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD5-0002Q2-9V; Wed, 27 Apr 2022 10:47:51 +0000
Received: by outflank-mailman (input) for mailman id 314859;
 Wed, 27 Apr 2022 10:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfD3-0002LY-Rf
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:47:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a5636d0-c617-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:47:48 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:47:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:47:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:47:44 +0000
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
X-Inumbo-ID: 7a5636d0-c617-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651056468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gJk53F/q9++Yykf3w3/00zdaz/po9ma+zUHwq6eUR9k=;
  b=N2ce/Ltwa2UFCmG8uHh8BJoZzdb14cnWbQMxycjpba797bovQzWSbPTo
   lJilv6pQfFKfSyQlqYk0rTalPbDJGAQM6DDEn+uze++an2+TTkZGiscYX
   mo834jXkVKcQV97RGTYlx2sD90s/lVp/5yoyYEvBHkDvTr5QEen8aHVUL
   k=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 72483420
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OrmLmKK0Hh6ltIjpFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENSgzxVx
 2UeWGGBOfbYMWWmL4sgOork/U5TvMPXyN8xQAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ22YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NBD6KC+ZDsWAvfdivQ7UD5CTi9bFoQTrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2WjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SOjI2YE8gr9Sawf2lfZllVf2ZfWFtPOYdCAGv4Es0qqu
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLlazd5l/BAnBeF2YdLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:sCAOg6FcOh3nffhzpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+txKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+wLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfhWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrzXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MF40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIYLH45JlO61GkbKp
 gvMCmFj8wmMm9yLkqp81WH+ebcEEjaRXy9Mwo/Us/86UkioJk29Tpc+CUlpAZwyHsMceg72w
 36CNUZqFg3dL5xUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="72483420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAt4R7JdivKYP02Pfr+PP2bQYaU/8bJpVNg2l87fmR4wWyi8fg3vfAiNXH+Of3hW1B5WqZ+Y5oflAlFR2dmiVgT3K40NNz+Mon+cgGAXiM20jm68CNGMI1VAs1+3bSiTYx4zkScMfbbPGbMNWIjxQr48Xjo107itTGMuxkflG83fPkwSXr5rF6e/cVjwb5TMG5vEqgpMGTHgs00NF+LWWBArotERRcvcRGx8w/lqZi3Gy3p5Iopn29WcpDhWzvvXWeoVKCcwmajKBVLzw50WXcBUMSMH1up/6mcP4cUSwyzjWODrA+54uqUEA1I+StAKVk8VObVYCu+EPSvaBjMAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nJcqzCrAaZuoAasqr/4AZsjYRE4vPluffqUl2JGCbs=;
 b=ImE8XNoMUZp2Q0lI7TiwwTougptENsgf3RAyELoUEx7GlBxNdfkswffY8NIPKOIDhPsj27TPIx4byM+OSK/8ikMkwx8KJRfy5k/wDE4onjPd7gmGp/7hj5gkBFr7uxAwNMixdbr+PGaK9T1fxAK7rJkjh7jA7URZH9Xbtgzkt8X0TgwbZEd+96iIQsQ79zeRz5cQqk6n3PGuLsKhJRvNjnn++05GG7NNCmzGl4hZ7BRDIt+Dr0wkh8TUrRXW0ilRY4l7ZCeekhunpB+uHCB3jF9cY1ULE6tjVYUuqlMMXIweZ0xFgVr4WZvPYMLOH+dYPNtXmwKvcLpjhwgO9pXQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nJcqzCrAaZuoAasqr/4AZsjYRE4vPluffqUl2JGCbs=;
 b=L4YFGQ7A6/IUvNNkiIq9MZHsWvHKkPCb+1DwAZgY2Po5514/SPrq3uBt14zjIAflmNOPWKCpppFPfzF2bBH95bfzNYzX7Lc7w/40HJitJ6pttNG853fxLYmcrmeueNa6DfVljmAfBUiVlfFyhtqmbObcswSqmyfZ0IzqxPO3Ddk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Wed, 27 Apr 2022 12:47:17 +0200
Message-Id: <20220427104718.81342-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427104718.81342-1-roger.pau@citrix.com>
References: <20220427104718.81342-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c19f4d-ef8f-4210-e66a-08da283b5c15
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3403953B1442249953D3DD128FFA9@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvqwvbdkP5cws7KFNWhMZAdGgfpuE9A04vLPGe27MKjmrka9hZ0RistC183jx6pOCg1MEbJ8dR2ixs3snUo+rWq6cwUJF/cI3mNNUVR2Hmr/uJU3YM8isJY+Ra8kTE4R47qyK0AOJ4dvp8rmAiBv9KfTasBpC0QZmUiEIq+nSOwdE+HW8s3v/zLPJYzliwTxuRdfVdxcg8rTbL/zMJs73TtblLsfSeMr472WsnA6jG2/i0Rycx8Yw+W9/SRID6WeRvFxzBtCj+JW1gmfSLkAr28VKL6VkLIMub+4JPYFtzGELp1+108FaqqanoJIKO6HMkBwVMQHBf+NxJcRtY2I8R5TtmYOE5gzY9+LIWuatBTD/HggV+eKGI+Y5L4hCbQIcy+xUY3swa15BF5P9v1I8b1F5EjwEK7zf/C2mG4UV02YA0EstTa+qoLsJoSTtCynJR+HFMeNFafzTq7Z607df9nqP0yY1d3Bj0Q9xEw0sOvjqwqxbmemGjJNNo/y+ZyvRQGo6YIMV5SjmmicOAvsettRw/Dc0wtFMYjkcAfw13nGHhxzBcx2gLI2+v8//fKI8gk6+XWz2ZwpoF0Pi6QegLrUeK0cYJkXk7FYeLOI70PwaPFKup0/bn1mLIfbwbYcT8ea/uUZfHdU9L4pYivPbtnLIKxdOMoMR1yA33JtoK4VPhKRTNU7Px2QBSO2iEot
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6666004)(8676002)(66476007)(66946007)(86362001)(4326008)(66556008)(6916009)(54906003)(38100700002)(36756003)(82960400001)(6506007)(1076003)(6512007)(316002)(83380400001)(2906002)(26005)(186003)(5660300002)(8936002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZHM3E4eXBoTWcyN3lGSy9BN0dzcVBOOXZOUE9qdGZZTjlUMFBubUlvMHcy?=
 =?utf-8?B?aElhL1dBMlhWd2Y0MTV5dThFZmJWMDJTSDk0akFUUVRsV1ZwYSt3ZTVTZWpk?=
 =?utf-8?B?ZHVSMU1NeVk2dlBSb1lrRWhydlNBdy9iMnpaOWNhUlB0RWxrZVlpSmNqcTJB?=
 =?utf-8?B?SWg4Undlaks2V1dhOXZzbXFzemVnS2F6SXRVdGJKNkJoMjVzZVQ3RllMNEVk?=
 =?utf-8?B?djFzT0ZRcGhWWmhyTWVCMXVVRkdhM29FZEt0U0JPNGFDbmlWNUg5VGVkM0hi?=
 =?utf-8?B?ZEVYV2E1b3FCb1RNNVljSjV4dWNJQ1k0WmVkRlhVT3UrSVhHUlFXUXI3Ly9s?=
 =?utf-8?B?THZUbEZBbWtXNS9wMFNpUUlCdHJrZzRrM0tXbGo3VlJ6Rm9kZUJsMDFnWm90?=
 =?utf-8?B?VXR2eHBjc0hXSkd3cFVzQmR3eldRZU5vb3ZNeHZmeW1RaGgyWkNmdEdnc3Zu?=
 =?utf-8?B?dWhUOW1lSHYxZURrU2FoVXd4WTA1ZVoxMnFVQXlVdHFXSEc2Z1laQlk0WjFC?=
 =?utf-8?B?YVQxVEU5MGZTWDhvd1ZVVCtZREI1ZEZpaklubEFSaUIvTHZIMGwwSXhIOTBn?=
 =?utf-8?B?Z1JyaVEzcnNrNGc3eWJkUjlyTVFsTDRwdFpld3pwWDdLVGdPcmRIdmtOS0Ny?=
 =?utf-8?B?K1liN09qRnhtb3VLekZHUU0zS3Y3eGVLSFp2WGE5VGFjcG9qeFkrdzAwLzM2?=
 =?utf-8?B?eE9uSk1OTEloVFhtNnM1Si91QW1pdGRjVFBUQVhIckQyRlY4QUdBZGlScHA3?=
 =?utf-8?B?anpzSWdDL0N4ZUtBT28yYWdSb1FJYjNyenlGYUJtdVE1WFJ3L0hUb0tRK3Bx?=
 =?utf-8?B?QTJMMDBkZlRrcG1idVcvM3c3WUZIdjUxV08xMVZBMkhpSm1abWdVNHlsYVJs?=
 =?utf-8?B?Y3FEM1VrbFZqeWRFdU02bU5MRUFxb0g1dWlzNEpsb2ZaT2hnRG9SY0FtcExU?=
 =?utf-8?B?UzV5NEIxVmFMUUVWZUFKOHc5dVo4LzY4M0hQaEJ5VnhwOEk1dHlkb2xLY0xp?=
 =?utf-8?B?NmNycFM5d1Q3ZHl0VnBEeXNZcWpjSWk2WTF6T0wxZlRxcXZuV2hKY2Rxcm14?=
 =?utf-8?B?VnNsUmtGRmFNeUVGdDNuSlVhc2pLaGVDVkhiQWtPVzlaNGMyRDdLeldIVWRs?=
 =?utf-8?B?ZVV3bDNyUGYxZW4yV1lBQmtnT1NQa2FBMFhGVlZmbTNBZEFHVk9WbnhWcUdF?=
 =?utf-8?B?MG9UeDZWYlZHazk2cmVJZ1hlVVk0aUZpV2tEZytuVmp6OXlQcUdXcDNBdGM3?=
 =?utf-8?B?aFBqbjBDQ2piWm9TMnlkZHIwdk05WWFxZndRMFBrVERjZW5IN2Q1S1JId0FH?=
 =?utf-8?B?dllsMEVjUWZ1Y0RTdnlEaFZkVzR4OUFsN2M1a2hPRnJtenVPZnpCSmIwVE5Z?=
 =?utf-8?B?Vy9vZnVwTVlZcC9DZXVJcTMyeUFpRjg3S3gwNFdjYitVdmZ6S2h1dnlzc0hF?=
 =?utf-8?B?WGplekhub3lEbHFJZjk2LzJUb2tSL0lYN3krbDZkRzNNcFY2VzUvajg2N3do?=
 =?utf-8?B?WFJRMzRpeHhFeTBrdkNLb2tjTDhuYit4YWc2bU5acDhjY0hyeU5SZlVqWVF0?=
 =?utf-8?B?bzZmNllkRTA3WmF2Q1p2bzQ0b2pubDJrOCsrSTZQUjJVN1FYVjVtUys0MWt3?=
 =?utf-8?B?cUplM0FVeWlhWW9kQ1FsV0VMNnNKTitzbEpubzlWN2ltamJwcVFuNUY4ZU9R?=
 =?utf-8?B?VnRjTDF2S3E1RE4zS0Jybzl6MFlRdS9IU1hnQlhQcXJHT0NGRGtVRnlTcU1l?=
 =?utf-8?B?MFpCTmUrVHRYTUxzOWhybHVZQzdPTnFvbFZWTXNLZEVMVVNwSkxBNHpkU1k3?=
 =?utf-8?B?NjJlSUdPNnYyRmtlckhTMVAxNXVTcHRNUVp0SzlRTk5YMWcvL0dpT3VzQ0Zv?=
 =?utf-8?B?Z1MxNDZHWUw3V0ZOejRmNEp5a3VvV0d2MHFrV21jNmJ6YTljeW9UaVJ2Y2k0?=
 =?utf-8?B?RzNaR29BNW9zK1RuN0NhazdPVWROTHBsMzRZUlJXek9sNXdwTTgrMGNWU2J0?=
 =?utf-8?B?UFZsTlZvL0dOOXBubVFDRnBUM1pqOHljTXZCdHovczN2dURGb2NCSzJXWHpy?=
 =?utf-8?B?azNtM0g0UUhPSFZ3ZyszTmtUekRwQ1FRZjNVNGYrWVNCeXBGR3YwODBMeThF?=
 =?utf-8?B?OHBsVXhCNWJ1TlFOdVVFQzNJSEMvZ1hJSG11T3FsODd5ZU1DeGd2dTdrcTNG?=
 =?utf-8?B?TmFDQytwM25SQ0NDeUVJa1c4elFaT3VLc3JWN0JDem1QenQ2V1cydE15STdt?=
 =?utf-8?B?V3RSeW9BQ2MzMCtjZ3FXVm0xZGZtZlg1ZTRWN2xMOFFYcEg3azFCd0dFQ2dC?=
 =?utf-8?B?MFZneTV5S21wTWZKZFRTb0trVEZ5YzVlQm9ldHhGTTZRdS92Mm9mYXhVUkNQ?=
 =?utf-8?Q?VFLr2lgNjJMDedlY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c19f4d-ef8f-4210-e66a-08da283b5c15
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:47:44.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGhaQnmsyibjR4xWwdvCx+D1vk4uazPcBynnb5L7R8H3qqqB1rLW9gtoDDrWMj7yjFMNwfkQ6sLooIZbcSPgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

Allow HVM guests access to MSR_VIRT_SPEC_CTRL if the platform Xen is
running on has support for it.  This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one.  The added handlers for context
switch will also be used for the legacy SSBD support.

Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
to signal whether VIRT_SPEC_CTRL needs to be handled on guest
vm{entry,exit}.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Always trap write accesses to VIRT_SPEC_CTRL in order to cache the
   guest setting.
 - Do not use the 'S' annotation for the VIRT_SSBD feature.

Changes since v2:
 - Reword part of the commit message regarding annotation change.
 - Fix MSR intercept.
 - Add handling of VIRT_SPEC_CTRL to guest_{rd,wr}msr when using
   VIRT_SSBD also.

Changes since v1:
 - Introduce virt_spec_ctrl vCPU field.
 - Context switch VIRT_SPEC_CTRL on vmentry/vmexit separately from
   SPEC_CTRL.
---
 xen/arch/x86/cpuid.c                   | 11 ++++++++
 xen/arch/x86/hvm/svm/entry.S           |  8 ++++++
 xen/arch/x86/hvm/svm/svm.c             | 35 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/msr.h         | 10 ++++++++
 xen/arch/x86/msr.c                     | 16 +++++++++---
 xen/arch/x86/spec_ctrl.c               |  9 ++++++-
 7 files changed, 85 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 979dcf8164..9a8c73f067 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -541,6 +541,10 @@ static void __init calculate_hvm_max_policy(void)
          raw_cpuid_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
+    if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
+        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
      * availability, or admin choice), hide the feature.
@@ -597,6 +601,13 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
+     * VIRT_SC_MSR_HVM is set.
+     */
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..2f63a2e3c6 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -19,6 +19,8 @@
 
         .file "svm/entry.S"
 
+#include <xen/lib.h>
+
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
@@ -57,6 +59,9 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -114,6 +119,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2455835eda..e15c9754d7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -52,6 +52,7 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/spec_ctrl.h>
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
@@ -610,6 +611,16 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
+     * setting and avoid having to perform a rdmsr on vmexit to get the guest
+     * setting even if VIRT_SSBD is offered to Xen itself.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
+                      !cpu_has_amd_ssbd ?
+                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3105,6 +3116,30 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7413febd7a..2240547b64 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(28)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ab6fbb5051..460aabe84f 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -375,6 +375,16 @@ struct vcpu_msrs
      */
     uint32_t tsc_aux;
 
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only. Guest selected value, saved and restored on guest VM
+     * entry/exit.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
     /*
      * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
      *
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 72c175fd8b..a1e268eea9 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -385,7 +385,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+            *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        else
+            *val = msrs->virt_spec_ctrl.raw;
         break;
 
     case MSR_AMD64_DE_CFG:
@@ -678,10 +681,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
 
         /* Only supports SSBD bit, the rest are ignored. */
-        if ( val & SPEC_CTRL_SSBD )
-            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+        {
+            if ( val & SPEC_CTRL_SSBD )
+                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+            else
+                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        }
         else
-            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
         break;
 
     case MSR_AMD64_DE_CFG:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f338bfe292..0d5ec877d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,9 +406,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
-- 
2.35.1


