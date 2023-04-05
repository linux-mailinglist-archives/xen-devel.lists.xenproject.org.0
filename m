Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F46D77A2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518341.804771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyzf-0003xt-Ju; Wed, 05 Apr 2023 08:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518341.804771; Wed, 05 Apr 2023 08:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyzf-0003vR-Fo; Wed, 05 Apr 2023 08:59:51 +0000
Received: by outflank-mailman (input) for mailman id 518341;
 Wed, 05 Apr 2023 08:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gxas=74=citrix.com=prvs=452091250=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjyzd-0003vH-55
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:59:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34fad4a4-d390-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:59:45 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 04:59:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5837.namprd03.prod.outlook.com (2603:10b6:a03:2df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:59:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Wed, 5 Apr 2023
 08:59:37 +0000
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
X-Inumbo-ID: 34fad4a4-d390-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680685185;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YpNTfqkBcnMiVI9kFXp4pH2yoyKhgC8BFDB1sYVZMWk=;
  b=YR2ntzd49fvj+kj7f1iYrAottPrpr3OwVO9sj/8i5B6VR4TFVzDYFwHg
   hlPjiHvUHToh0osF/9I4p+EWKdY04DggGqMfrnh1zbi7AlYVnu32uHLz3
   PJG6Z79FqemAwk2V/j91B0x8SGt3nqlMuKc652jrRzJ78W/waeimZ+SNP
   A=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 103749612
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1gSm+61J+irmLNdJ4PbD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2YFx
 jQYW2GPbKqJNmb1e4t/aITgp0pQscPTyoBgHlZqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPCJk9
 dgELSAxaDuqhN/p/reFabkxmZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1IZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rSQwXKlAdh6+LuQx6FDnAW0mGwpORQpElzjj8e51WX5YocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBEw0M5oC5pJlp102RCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:X8veiKwGZp78MOn7J6xfKrPxLOgkLtp133Aq2lEZdPULSK2lfp
 GV8sjziyWatN9IYgBdpTiBUJPwJU80hqQFnrX5XI3SEDUO3VHCEGgM1/qb/9SNIVydygcZ79
 YcT0EcMqy+MbEZt7eA3ODQKb9JrLn3k5xAx92utUuFJjsaDJ2Imj0JczpzZXcGIjWua6BJca
 Z04PAsygaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA+7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1cwKoVKuZEIMvJ0vFhLA
 BcNrCb2B+QSyLCU5nthBgq/DVrZAVqIv7JeDlYhiXf6UkpoJkw9Tpo+CVYpAZByHt1ceg22w
 zJX54Y5I1mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94KIfzY9Frd1CQqZ4hKcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbfBGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7YLHCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8W7ssrPWCzvCFL5LYdznFrIoufow36V3w30otWg=
X-IronPort-AV: E=Sophos;i="5.98,319,1673931600"; 
   d="scan'208";a="103749612"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC4GSn2QRqdmiVeshQZMsQwrtI6/t7jzzGdZkF+qJc2DXze1FrrpUf2h4LY0SqwczGgwwFymAsdbgQ+AT+bmJHThNIyWlkq+d0ioy6Z6K2mdZCt1VufEt9bCg/CzwGPwB27EBAe49WmOf2H5Yk0bmkjY72Qw0uIHS6vMI6DYZ+lREd0EM6nphzXbfatY+RkfCGL5BIKQupOSuNyWqSRU+6m2uuEdGB4YmbjnKvNmbe2vO0j306/Dql+3NP9NtWxqp/HwAXBjdc97Pe2aBKmUFJltOoWYuA0dBB2KFCpv27ulEc6KNK3SgsxkOEALspmqn3JUb7O1C3rZQovyxmuv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaRUamhn11nMvnYnVK64rs9/zrMUREZ4KwHbmPGqQfI=;
 b=FsmQGRcFmP/48s0/6JD8yxcW6oLrWdb54HXptGKcCpJNUQhenGVU7iNqeu8nzgoRdXpueOa8Gw7jro8OWCD7YuinsEXA1c27tS3TK+jK2GdGwxoPAoXcNrNoYkCjyIQUmsWfK0avhdSlBi12celpDv9flokdQ85/v4mgxuvJpElcblKbvIgIosfhx0fSot++y7h0Uba7DyCF5vNC5RfAo0witg1MoNK0vHSI2wSPADjKZdB7sFP+Lb5etn87L2nBT8X+Fde/xfTi3mSZ9pn5OLVq3asIcnwDNk1P8aN6UU9bsWFr4iL9MkWa8/qt/QHzXAJNuddCg8OwzoW8+Eo8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaRUamhn11nMvnYnVK64rs9/zrMUREZ4KwHbmPGqQfI=;
 b=N2QYFLEF0MLHZwrQjW0syKr7ko/YMlXwexRW8io3r/9c2717vkxE9Q3laqqXTNWU77CjXrSORnoLRzKTsfgwBNjZSQvwNWz0FAtCS+I7zri9hmkLgcwy9JfZ291iwNcTZAZUbtAHFf+CIe44ZASv3JvMNRPQ5rqwb3QEfGLY5Ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Apr 2023 10:59:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZC04cu9sXVeephOf@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
 <ZCxI18gb8zK5X+nR@Air-de-Roger>
 <ZCxSooPqPwpGW6yv@Air-de-Roger>
 <5cda250b-57b4-2833-99d3-84ae8ca32059@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cda250b-57b4-2833-99d3-84ae8ca32059@suse.com>
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bca9d47-2567-44f9-bf3d-08db35b41527
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/n+KX3JYJoF9OOZLreIZmXVhfwGhzNIKInhhegUZj9k+w1d8dXYAF4s7k4beDWAgETq+EbdfBvSxUahHjIJahHbfqFJjOzLERA96FHxhTYY0WRvfnsd58Ev6HJKyhNPiu1ZoPp6b0wxSKy61audd5OeVLNG8/4/0YgeoHqjg1i+TMThPAiscQVWW/twC2PxZNh+fd0k3Lf0OPoxiYXuorRhTLAkdU9mfGp7Hn5Zcvqt1ojfQh7a9JV5UxttxhkzCGiZFGyPQO0hCXcCL5//siOz5eXHR5ZF0E4ovCJCf6lGHxIHL9GGE/u/kWV2RZDzYSQfUkrsAIclyzaz/jwJlRJ0ayYJr4lnojfj5MXogAOvnlfcLE3apjXkyEZolwGrIvZXV7c0XVTRfy9DDFOGpXRnHAQdQB5orXnfSnoUvgEJSjprIVzPo+rXCYyimhWf6C9By5GwxVcIsUfw21S56REI+xfQPbBShmyaYeXFhDSwB75wHDEFV0SOeAA6zTCsl2EXqmgxKxigIw65dAwbqBSPhlwgdMigt8vDFOVTJBZzcLm9qxF41lE0/Y9xT62E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(6666004)(83380400001)(66899021)(6506007)(53546011)(6512007)(26005)(9686003)(66476007)(4326008)(8676002)(86362001)(66946007)(66556008)(6916009)(38100700002)(2906002)(82960400001)(186003)(41300700001)(54906003)(478600001)(316002)(33716001)(5660300002)(8936002)(85182001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZ6WW1LL3B3OXc1OHhjcXlGaUJSZlhNSG81NUFtR1U5MnB3dmRQNTlVa0hz?=
 =?utf-8?B?L2w2cVpkcnVDSlYwSmZBZTFWOFF0Mmx6STh2VjVpNzlOaE9IcjE4ZFNxM1NN?=
 =?utf-8?B?RUViZHNsYlcrVXdKcWJ4ajc0M2RZVWw5WVdPeWY2OElrU2N6cG1CdmRZeTlq?=
 =?utf-8?B?dGUwOVZOUjJOODkzNk0rVzNmcVg2VEQvTFFGUjhCMnAzZU9wTi8xY3hTTkpO?=
 =?utf-8?B?VnRvMjZMdHF0NUZ5TzJBT29uSXJ6aEg5S0NzdlNLOCs4LzlwbUN2TXlLSEF2?=
 =?utf-8?B?NWQycFFDQzJTbDNNZHpDL08yVW1JaHdJMHNYZDhQRjVUdkswOTd3SUVVSUpO?=
 =?utf-8?B?U21xVHZWakloUGc3eis0VVRDYzVHaWNVWFBBUDhkTG5VdWhQMUlzcFdvaWtZ?=
 =?utf-8?B?dVRZM0JSSndLK1ZkVFhwdXNoYjdmZ3VoSzFEanlJRjZqMnkraWIzR0xIYUxB?=
 =?utf-8?B?WjgwOXJGYWorQlRPdmhRcFZWTXRueVJUSy9RWFZycTFERTZQUlZMZ2RHSEpD?=
 =?utf-8?B?SWw5Y3NrdnQ2YjRDUE5IbVdkOWZoQ1A2YmJlaHlLVFpuNGJNdy9KUHpBU3pj?=
 =?utf-8?B?NmIxRTZqb3MxU2xsYnRyWGxMVnZ1K0publdPYXdQNDRadllYK1NNTVlCek1S?=
 =?utf-8?B?aW90M1FmY09ER2lDVzEvQSsxbDg3K013Z2lFYmpsbUlBdEZIUXRxQmtMeCt1?=
 =?utf-8?B?Yll6WmlSN0FRWlJkaXRGUE1WQ2txRzUwSEM3ZkpRRWdrcmdQNEhYVHk3VVJI?=
 =?utf-8?B?Q3FVRUcrTDVxQ0dzQVBsc0Nka0pDYnhGYVM2SkpIQkF5U2pFQmpWdStlSXBv?=
 =?utf-8?B?S09LaEZWUmFzMERFS2VrWUZnUlhHakdXb2dOa0VvK2N4TWlYdFR2UGgvSVRQ?=
 =?utf-8?B?ekloanh6d2lhWWpYa3pmenBpYkJnSCsxaXhjeWxuYSttdlpjYlNHUFdxTnhH?=
 =?utf-8?B?bzZNeTk3VHhMTWZjZGwvcG9kelhCSjByR01wUm5pY0R6dFFaVFhzTmE5TXJZ?=
 =?utf-8?B?a3Ywbk53cWVVWm9UM0ZpSUtFQ2ltVHg5Q0gwaytxRnBqWG9QMFVDemFTdzh1?=
 =?utf-8?B?bkdaWXZCOUtwSFdlMFdTV1RsSnQ2YzR4YW1xVlhTRUd0eG9JOGE1czNZSGJm?=
 =?utf-8?B?aXE2L3ZLSVpvV3VTWWdZVjc2dk5JMmF4Vm12bllwZkt1VFROczRzUTRQUUlw?=
 =?utf-8?B?ZUVpTUN5eGtLVlkzY3NYV3NZbktZbjBKMENFY1ZIRFEzR25sR2UvQ0J5WVh0?=
 =?utf-8?B?ajI3Zk96TnVsWnVnQWhEb2h1a2JXVkZmYjcrYWpBbzNKcklhdTd2dGtmSlhC?=
 =?utf-8?B?RmF4TlhneUc5MDZlbWdLZlNYcXZMWGplS3hPQnJ6UlNXUExIQXBXTWRBWHk1?=
 =?utf-8?B?OGh1NW5QcUJIRVZ6cXF0cGI2ckkvc3F2d2dmbW8ydUNYUUlUYURPRmJpUGd6?=
 =?utf-8?B?R3FkdXhGNFFDbmtjK0kxcndtcmRyVVdPUG5UQXBCTHU1RzlUNjV1dGVwUjdU?=
 =?utf-8?B?NXRNT09BQWJPVm81OGlvNkYvMlVzTmppZVVZbWlGSVg0UU9qUkgrRDQxNDZD?=
 =?utf-8?B?U0xEaExoaTRkSjMwdHNkbnhhRllpeWs1YTZHV09Fa3M0Zkx1WCt3UllzQjU3?=
 =?utf-8?B?dm10dUpiMHNYZ3EzQUlnS1BQK1dkWUxwcFVwVVY1TnMzVXo0bCtqUjU4aERv?=
 =?utf-8?B?aW5vUmJBUzF0QlJvUG1KbXhyZFRxb3hPdDVyVzg5c2NpaHFqbDRKdTJKd3NQ?=
 =?utf-8?B?WHdqUjV1eWtGZnA1ZTA4ME9RaWZjNnhIcG5jdU8ya3o5VDd2REJUK3AzSDRv?=
 =?utf-8?B?QlZaRG4zM3hVMFVNVWw2am1CS2N4S2V1eERaNkpQSlgxRU50d2Z6STZsL2FQ?=
 =?utf-8?B?c0cvMzAwRHZMNnd2c1duWU1IeGJnWFcxdTBlR1AwcEpVbjNjeHI4ZEpzWjJl?=
 =?utf-8?B?ZnRuSUo4alpPMlpvd3g3UE43TjM5RDhBNFFkVThmczdVM3kwNVkrZlBBTXdH?=
 =?utf-8?B?STdoSVM0d0lhZXZBNEVVVUp5Z3dseTJiQVlFTHcrWW5UVmdrdWYrNVVhN3RH?=
 =?utf-8?B?SGZGbTJUOWU0d0kyZzJGcWFmaFRwY3RoYUJYQStoYi9nWjQwY0ZtNm41ZGJM?=
 =?utf-8?Q?7eX//ufk+ZVX7sHymFfXvVC8F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ci50GXTPXoH02XtwmXZtnzFQiZfNQQFN0jBFfPp0/5u9VGE6G9cA5if7LY7CaigEEPsM3ZQhc1vMteS7u9WkEGH83Ogci8c9Hgtv79mIXlFia8/gpb39jAFuyiGJCMUK2D186NuUNTtUm6XIsoIGVZaqNWM9MgZrloV9XY0ofqAkQQHwL31S24uFISzYTnJtye7VJw8DzNomYvDMKkb5465DlK8oNgsLibZ1PUfmZGjG658mlkNJ3JFM2nVGcovxUY8ladCcvA4MMcY6NlVJZOP1GcH9K8i3ssbroj0wfUk3PmolZk8z6AFuoDsF/T6yjbxj4ZFvBDhUF5DgVlgKJ/zjTxFy3HzobuTNjl2HJKU/Gtc9/7Y+JKF7uDjC4x2RtvNYYGoGufh+qEoXbHg8I3jzXdfRk4KbiFixmw3IVf+Bs46Yd6ZEw8m5MiL0HMrXh7xFIOIoHMuv9tBsZKzJXP8Xuw0s6iLVc9mWskWub8WRg3ItxICPAu/EkYnYL9bWszUrR7mYFy7WPT0A3oBp/JZTDjr49R3KEFKr6/gc2Vk1nfodTihRlIDWjxQPm64mkJjCLddLZrW6WVisxrxJJMRIsDn89IoQRFHKkYuC6dvqWoEM89vot2AnyCcM708bSOmyV4cVr/o1CU3are3+GXx50b+UCYILr1Ymov560Ss3mochgQmqoi0bKrEBk0m4MsBJmXrnY0gqotdW7bJ3g9F47FyxQuF2Datn5ojUfK5jtQtDMFawob7HYoOQdy1UqE9RULZRIzUHO8oWifWaj9y4raq0HZ0RHZDPUT2kXkwhdWKhom3WJPkPTD6Y2civ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bca9d47-2567-44f9-bf3d-08db35b41527
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:59:37.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdDNWr2C7zqEqGOEseOrp7+yd5y4JoMOov7D3UObHPJ3IIVrMgPf4xRrnWry17hbuL+Si3xpdJPWj6MyoSZSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837

On Wed, Apr 05, 2023 at 10:11:30AM +0200, Jan Beulich wrote:
> On 04.04.2023 18:38, Roger Pau Monné wrote:
> > On Tue, Apr 04, 2023 at 05:57:11PM +0200, Roger Pau Monné wrote:
> >> On Tue, Apr 04, 2023 at 04:24:16PM +0200, Jan Beulich wrote:
> >>> On 04.04.2023 13:41, Roger Pau Monné wrote:
> >>>> On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
> >>>>> On 04.04.2023 12:12, Roger Pau Monné wrote:
> >>>>>> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> >>>>>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> >>>>>>> applies to guests also when run on a 64-bit hypervisor: The "extended
> >>>>>>> CR3" format has to be used there as well, to fit the address in the only
> >>>>>>> 32-bit wide register there. As a result it was a mistake that the check
> >>>>>>> was never enabled for that case, and was then mistakenly deleted in the
> >>>>>>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> >>>>>>> CONFIG_PAGING_LEVELS==4"]).
> >>>>>>>
> >>>>>>> Similarly during Dom0 construction kernel awareness needs to be taken
> >>>>>>> into account, and respective code was again mistakenly never enabled for
> >>>>>>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> >>>>>>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> >>>>>>>
> >>>>>>> At the same time restrict enabling of the assist for Dom0 to just the
> >>>>>>> 32-bit case. Furthermore there's no need for an atomic update there.
> >>>>>>>
> >>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>> ---
> >>>>>>> I was uncertain whether to add a check to the CR3 guest read path,
> >>>>>>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> >>>>>>> be converted to "extended" format (overflow is possible there in
> >>>>>>> principle because of the control tools "slack" in promote_l3_table()).
> >>>>>>>
> >>>>>>> In that context I was puzzled to find no check on the CR3 guest write
> >>>>>>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> >>>>>>> of the low reserved ones) could observe anomalous behavior rather than
> >>>>>>> plain failure.
> >>>>>>>
> >>>>>>> As to a Fixes: tag - it's pretty unclear which of the many original
> >>>>>>> 32-on-64 changes to blame. I don't think the two cited commits should
> >>>>>>> be referenced there, as they didn't break anything that wasn't already
> >>>>>>> broken.
> >>>>>>>
> >>>>>>> --- a/xen/arch/x86/mm.c
> >>>>>>> +++ b/xen/arch/x86/mm.c
> >>>>>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
> >>>>>>>      unsigned int   partial_flags = page->partial_flags;
> >>>>>>>      l3_pgentry_t   l3e = l3e_empty();
> >>>>>>>  
> >>>>>>> +    /*
> >>>>>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> >>>>>>> +     * understand the weird 'extended cr3' format for dealing with high-order
> >>>>>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
> >>>>>>> +     * initialised).
> >>>>>>
> >>>>>> Don't we then need some check in the vCPU init path to assure that the
> >>>>>> cr3 is < 32bits if we allow those to initially be set?
> >>>>>>
> >>>>>> Or will the initialization unconditionally overwrite any previous cr3
> >>>>>> value?
> >>>>>
> >>>>> That's not the way I understand this "cut some slack". Instead I read it
> >>>>> to be meant to cover for the VM-assist bit not being set, yet. Beyond
> >>>>> that it is assumed to be tool stack's responsibility to constrain
> >>>>> addresses suitably. If it doesn't, it'll simply break the guest. (There
> >>>>> is some guessing on my part involved here, as the original introduction
> >>>>> of that code didn't further explain things.)
> >>>>
> >>>> If it's just the guest that's broken I would think it's fine.  As long
> >>>> as such mismatch doesn't cause issues in the hypervisor internal state.
> >>>>
> >>>> Did you see a toolstack setting such entries before pae_extended_cr3
> >>>> is set?
> >>>
> >>> To be honest - I didn't look. As said in the longer reply to Andrew, I
> >>> think it is more logical this way (the page table root already being
> >>> validated as an L3 table when vCPU 0 is inititalized, which includes
> >>> setting its CR3). Hence even if right now the order was the other way
> >>> around (which I doubt it is), I wouldn't want to make impossible to
> >>> restore the original ordering again.
> >>
> >> IMO I think it would be better if we could already report error at
> >> domain creation time if the toolstack is attempting to create a domain
> >> that the hypervisor knows is not going to work properly, rather than
> >> allowing it and the guest failing in maybe non obvious ways.
> >>
> >> It seems to me however that we would need to fix xc_dom_boot_image()
> >> in order to setup the vCPU before creating the initial page-tables.
> >> (->setup_pgtables() hook being called before ->vcpu() hook)
> 
> This might be a possibility, yes, but it's (imo severe) scope creep
> in the context here. All I'm after is to restore code which was
> delete in error (and which was, when it was still there, not
> properly put in use in all cases it would have been needed).

I realize the check was wrongly removed in 218adf199e68, so I guess
it's fine to restore it, albeit it would be better if we could remove
the weirdness with setting up page tables before the hypervisor has
the full information about the domain capabilities.

> >> So I don't think this is strictly worse than what we have, but it
> >> would also be nice to get things sorted out so the ability of the
> >> toolstack to shot its own foot is limited.
> > 
> > Maybe I'm confused after all day, but isn't the hypercall used by the
> > toolstack to set CR3 the same one used to set the vm_assist bits?
> > (XEN_DOMCTL_setvcpucontext)
> > 
> > At which point we just need to make sure d->vm_assist gets set before
> > attempting to load the new CR3 (seems that way from the quick look
> > I've given at arch_set_info_guest()).
> 
> Right, it is this way already. But that's not the point.
> MMUEXT_PIN_L3_TABLE may (will?) come ahead of this.

Oh, I see.

We should likely move the setting of vm_assist to the domain create
hypercall, instead of doing it at vCPU initialization.

Thanks, Roger.

