Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13660D0E9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429928.681287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onM4o-0007sB-TR; Tue, 25 Oct 2022 15:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429928.681287; Tue, 25 Oct 2022 15:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onM4o-0007pw-QR; Tue, 25 Oct 2022 15:42:50 +0000
Received: by outflank-mailman (input) for mailman id 429928;
 Tue, 25 Oct 2022 15:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onM4n-0007pq-Dq
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:42:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf90c8c-547b-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 17:42:46 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 11:42:44 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 15:42:42 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 15:42:42 +0000
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
X-Inumbo-ID: aaf90c8c-547b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666712567;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fWBhQuieNEHH8UlwKzAgP5MXhlATVcGoZMqweFSPHUk=;
  b=UmYweLKOCLEwfEroZSEWaLpoyqxQAybUrcXPESmQK1IZoyGJBy3cjW/C
   IhIWc2zGOBrNluZV35DHRJI85WNxfqeyxlKdH1bpEjr5Vt0J8onmnqgDP
   lqMO+aW7ijauHW8eFjT4xT6Ro5FHZAaj8Gye8jVHqQCFspnuW/ITUTpoy
   s=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 83466138
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YUThK632W7jTpwaeI/bD5RBwkn2cJEfYwER7XKvMYLTBsI5bpzVTn
 DAbD26BOv7ZNzOnfdpxa9uxox4A7ZCHyYRhQVBqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlF5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUqp81UGXh21
 McXdg8zcUmshOGP8rKkH7wEasQLdKEHPas5k1Q5l3TzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NpswA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wrerizy37Sf9c/9cK0VG56/39o1u2SKhWUyOgUdDmqE+cDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 Tehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZslnOL64iJvyAz6Y/
 tyRhC03hrFWh8hb0ay+pArDm2j1+MiPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:iM9PN6n9MpPH4o+SsIe4jA0U4aHpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cFzp/8tHNxA7dg6MLqK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83466138"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXaRcXc0r9l68ehayzgacWkDoLRFVKPVEu4IHvc+URNvFjmrbGAWz5GJ/SDmI44e8dGH0g7C5fO3msK1sS51HyE38JZ8ef5wBcdzyYzlksk0B/fC8IM/0J6ePFLBwQ8BJY0zh12n4D0uaWm+mMM8kEonzA72usBFLF+DuvnfeNREsnvxdBUlUOza1vXFY+Ax7pA1VrDYxh9neQcG/NYLUvJuQ2hu0zdQb803vWqPX82s80nCpy82K1orxstPNheJtjsKKYiJOPOC6S9RlujC+BWFZSN0IFtWxuB8QTQW5AczWWMjPS/vKzfUTA6AlWqmFZ2tDHxMiNn6OoZ/kJMetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzDEh4vH7z9yL9N9dgVx6VvWzaWaDIFkoSiaLBZVvbo=;
 b=VTPcLmCtwZDbC4VUB0L06uoNhPwYQksU2UrwEhdLZ7/L3QpqunGWhtqypkEK7P6tdDWUNdE6q86EjQU3kh26LRfUstgvL1mEtYPRNJkp/p4C2XGbZiHe/ZhyXXba1nI8IEBrGX27R7r/ZmlMCGywZP8D5uYPM6LbCEK4bYD4KFUW1fipOdLKJuwQnUzqO7XgsV3oJ3UKwrRArX2WtOXQIAzU2Bs+osDczlLqqAbIPVmyA+8EZ7Y+U9Hzb6UcPLjQzoB9PQLTSuUlC3/Hrgsc79FYofSgOf+S3wDi3x4i+CDhZCaXjBT/BqsVP3JQjS9gO5dlINxg9FBykGwPduZXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzDEh4vH7z9yL9N9dgVx6VvWzaWaDIFkoSiaLBZVvbo=;
 b=CueGFcn4GqhFKysGwX5/W3NAmaSBiJ7W8zRuQ0S+sBYEB/MAPS/VshCZIQwA+9jeqJjBc7EMkJ2/gxg8cOk7sATk5eqzPb0cpe3ktKTEzGga2hFdAYmG1q/QQOvaOxBuN7MQOr3OEJFzZuRYd5ih0e6ShORzLCI3xsIGkvWXPJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 17:42:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] common: map_vcpu_info() wants to unshare the underlying
 page
Message-ID: <Y1gD7GmclguLZCM8@Air-de-Roger>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
X-ClientProxiedBy: LO6P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfe936e-0ca2-41ec-a96b-08dab69f8d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5mQoeZZHbjAjBbm9JEWYpfyiy1elD1W6PrtLxPTcanD4LMUOfXGaDsWzgR10OC98jO2YL4IV0vEHIsnbgFCXrpMLkvP2SjUcjYzezkmtUX1oJl7cfqDlyyX4GPyRQx98pzz9bnXEA5+CKQ6TpsboTPhPIlHhT0kVO6SUbxXukAp318yZ3s/H5OkL0PWrnsxDo6EQ9pkcZtlIDk90NS70cnfmsnwI0Wh4kZFfWncXl0cMRLW68YHlOiQBQ2iYnwcjg3eUiw1387gBfld+4fmDxXBm8PMZH+Ngb4WcVUcY3uDsVS8W2qmOdHlpYmnyZbIepcnZNL0ywUQWPk2UOyHGjdQVMUfNo5NFYelWp5eLDlFhpszoJqqHF6dcFWZD0l0JPC8y8LHAtxbtHDp2YNLWbjD675+1SZQy9oHEanh4tsnItlXpASY0njE5Zih4IJlzQ7vd24y75D0dpxknsvqhAbpJlcJZ3j8Ff23NAdHxNXUCU6LYhqcI/jnJGImtfa6YMBtxJIsTMcqh4W/xwRypAr852rwAGbjwTHY0SS312JLGP6YXgSVKQaaL5hew7DtCKaspdDsuYsnfKqAPht4LBFfo/xIlgyCdMrWqDwNzi95NdmLHtoyHDo2oY70HeFgfWjz+1e0xhKBlVC83R3qw/s1RNF2cB6oKHuknK+rOIFWbE5Z9Cv2PuGmvSmrkFkUKWeiCzVU9Ab5WjE02oGEnvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(85182001)(86362001)(82960400001)(6486002)(41300700001)(38100700002)(33716001)(186003)(2906002)(6666004)(66556008)(66946007)(316002)(8936002)(5660300002)(478600001)(4326008)(66476007)(6512007)(26005)(6506007)(9686003)(8676002)(54906003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2NEd21wZHdGUFExY2tOUk1JUzB1eGhDaHI4cEFQNTB1VkQzTC9JTGVKZWFo?=
 =?utf-8?B?c0hYNmtuaTdFd3ZNYXVyVU5hOWQ4bitUbjJ5VWRCaTE2YW1YZlZjMzVXNzA0?=
 =?utf-8?B?dVpsUU5WK0QzYUo3RDUrYU1nNWQ4OXFobXRFZWVUQWFGaEQvcWc3MU9BTGlT?=
 =?utf-8?B?UmI2NVJhcFd4SE4xaFByL0N0VXpURHpsdVRBdmw0UFdnLzZZa3kyOFkrWmZz?=
 =?utf-8?B?RHlXTGpGb2VpNnFtamhHZFFGVnlyMGlROCs2SUFkbzFadmRWK0EwYnJpNDNN?=
 =?utf-8?B?WmhONU5jYTVaWE11YnJuTkZPMzhic0Y2aUxkeDJONFY4cUtkKythSDE1TkYr?=
 =?utf-8?B?TFNMUXNwdDVVTFN3b2s5cENGUWNVS1I0SVo4UWY0eE1lWmRFSWRXbllPVFRs?=
 =?utf-8?B?NDliMk9VTk1hQ05vWXY3TFYwdjhkOUtyUHc5dU1jbTJ2QWlSQzlrc0haMS9B?=
 =?utf-8?B?S21ZMU1LNFBZOTB6TlI0d3NmOWl0cjE0ZEVyQ1FSdWpFeUpQNHowRFBTaW01?=
 =?utf-8?B?KzlpZXhYc1NFUzZ2dVdNcmI1ZnFjeXpJenB6eExQSlBZZXpoUFRBcVZWZWs4?=
 =?utf-8?B?bXRUWHZnVVdCNU0wQnVGMW1DS0hTdXJrR0Y2ZkwySHFpTFVNZllaalZ5Z2dS?=
 =?utf-8?B?N1ZGWVNwVTNuTlRyclo3TENobUF1TEFZTUFCSDRWM0FGNzQwckx5bjhweVZx?=
 =?utf-8?B?YmJlMkFQUW5hTEUxbUVyT0RuWHlnUWVBZ3Q2Ky9MeXRpb2JyQ3pFanVWRlhH?=
 =?utf-8?B?bmdmNVZKdWFVNTQzZEwydjl4bXhUc3YzckVrRGtGbWp6amZrbW9aSklaaTI0?=
 =?utf-8?B?dTRjcFBYa0FFYStoNllESnh3SW5OWitQMGhKVjU3NWkxSDY1ZnRGdTVKN1Aw?=
 =?utf-8?B?Qk9EVDFQN1UvMmZuZXc4YUYrVXpXc0FBbFZvVS9nMFQwOTZ6dmJBMkFESUZN?=
 =?utf-8?B?cG83Nk5jdFRjL2s2S2xtWXY3aEFTaUd5RHRlUkpMOThPZUpXM3RYUUk0Z0lB?=
 =?utf-8?B?dUFudFduekt5b2pDd2RBdmlzT0pYTHA2S0Y5OEJjdUI5Y0dLbU5lbStYMDNT?=
 =?utf-8?B?QmJCdC9TTHNjdmdPRzM3eXpOWnRGeCswUGZMVTBuL3l6SExxdmFDZHBWTkcr?=
 =?utf-8?B?ZjdZZC9ma1d5NGhMWmJ6Wnc3TUJSTlpLU2p0ZjJzUkJzeUF6M3FwOG9aOFhL?=
 =?utf-8?B?VW9MRW9mRGFxK0VGNlVyaVN6dngxU0lZSHhPUXNMMlRVRndnVi9nWVdHV3p5?=
 =?utf-8?B?SmJhWjlNcTdHSEVhWW9aZU9vSzM0dHhpYUw2SDRBZmZLVmh6NmF0emhqUlY4?=
 =?utf-8?B?T2tCRWUzajd3eW96eFp0RkQranhqZWdIMG03MGhRN3dFQTU0V2tuZDBlZ3kv?=
 =?utf-8?B?Tm0wQ3VvQVFKZG9tc1hDTCtXOXNKLzBrUlh3cnRjYjhwVHU3WVNzVVc3S3lH?=
 =?utf-8?B?aWt5Q2l1VnZoYlRxR05jUGRhZW9MenhhZnkybHNhR1djdnBtaDBjV1NiMmpX?=
 =?utf-8?B?b0J6N2RCdElUVjV5U1hSODFTWUl3MEd6WVB2TDVPS2Y5V29Za1lBekpSbGls?=
 =?utf-8?B?c0F0M1N5cDNXZ3luWnROUVErVW9tV2lkTncwMEpNTHVxdzlWbkpYR1p4SE90?=
 =?utf-8?B?cDQyZUZmbkNoQVBDK1FTUVdtZHpsQ3VlVEZJVnFaN0s0ZEwzRk9lZUtlZ1ZO?=
 =?utf-8?B?eTFpdmxEbGJlcnNwekZhM1liQ1VPSGJ2UUVobTVXejUycVRDemk2WC9wK0dL?=
 =?utf-8?B?WlhwazE5UmpBS0Q4UzRVME02RXhhdTNWS1hEcmVHei9YOWw5M21NOTBsLzBU?=
 =?utf-8?B?LzhmUjJ4c0liTWNlZ3FLQTVLakJreFRuRjAwb0dJTHJQdzgzR1JnUUo3R1ZI?=
 =?utf-8?B?QnQyYkZyNERxMStuTkE1Z1UrQnpnM0JtUzl0c3NreWVoWkZlSDc2OXpNd0lC?=
 =?utf-8?B?SjlKN0xWcUw5czZkeGU3c2NjdHhsQlZpcGFHYWNWbEhjQnRlcUhodlBEdHNv?=
 =?utf-8?B?MWtzM2ZIbStreldPOTdNNTFTczU4Y1p0ZjRRYXJ0SjljUlpseVZMbU41aDcv?=
 =?utf-8?B?UTM3L291RXBaMUJuTnNHYzJaeUJsT2IxSmwyUFNReFQ5RWpOZDZyK0szTVUx?=
 =?utf-8?B?dGVmQ3pQaXR3bU5zSnF6VnByR2hJQUdYdmZ3NUU2TVB4REZzOEY3eHRPTGI5?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfe936e-0ca2-41ec-a96b-08dab69f8d7a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:42:42.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHmFVFAXuGMYVQnl9iEQrq/RPwIagZ8iY8EfGiysFgOEnfr0i4smcY2c3dzP5kiWJISxR0U2sxPfvlMQkN1aQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6192

On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
> Not passing P2M_UNSHARE to get_page_from_gfn() means there won't even be
> an attempt to unshare the referenced page, without any indication to the
> caller (e.g. -EAGAIN). Note that guests have no direct control over
> which of their pages are shared (or paged out), and hence they have no
> way to make sure all on their own that the subsequent obtaining of a
> writable type reference can actually succeed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Really I wonder whether the function wouldn't better use
> check_get_page_from_gfn() _and_ permit p2m_ram_rw only. Otoh the P2M
> type is stale by the time it is being looked at, so all depends on the
> subsequent obtaining of a writable type reference anyway ...
> 
> A similar issue then apparently exists in guest_wrmsr_xen() when writing
> the hypercall page. Interestingly there p2m_is_paging() is being checked
> for (but shared pages aren't).

Doesn't guest_wrmsr_xen() also needs to use UNSHARE?

I wonder if it would be helpful to introduce some kind of helper so
that all functions can use it, get_guest_writable_page() or similar.

> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1484,7 +1484,7 @@ int map_vcpu_info(struct vcpu *v, unsign
>      if ( (v != current) && !(v->pause_flags & VPF_down) )
>          return -EINVAL;
>  
> -    page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
> +    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);

I had to go look up that P2M_UNSHARE implies P2M_ALLOC for the users
of the parameter, it would be helpful to add a comment in p2m.h that
UNSHARE implies ALLOC.

Thanks, Roger.

