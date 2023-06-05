Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D26722AD3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543777.849029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6C0Q-0004uO-9s; Mon, 05 Jun 2023 15:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543777.849029; Mon, 05 Jun 2023 15:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6C0Q-0004rU-64; Mon, 05 Jun 2023 15:20:26 +0000
Received: by outflank-mailman (input) for mailman id 543777;
 Mon, 05 Jun 2023 15:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryrp=BZ=citrix.com=prvs=5133587e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6C0O-0004rO-LO
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:20:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b52d556-03b4-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 17:20:21 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 11:19:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5446.namprd03.prod.outlook.com (2603:10b6:5:2c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 15:19:50 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 15:19:50 +0000
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
X-Inumbo-ID: 7b52d556-03b4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685978421;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LngzvLf2RgQS8fhaIXBu4BEX0db3So4QDuu273c8QJE=;
  b=fwEDY7BENyl4X79bqMMqrycW1TEiC4A8yxLs7HIanha90f3CQMRSlZfA
   N3E7R0UNI49Y9P5p5bw8DR0/K4caizg5NqPy5CGWdX67MruNL/Vjk5BlR
   cMUPpmBl+WCVbP41S4BquHEH1KhYFdnh6EIn96NI6Mh0yt6vG+/LPg2AO
   U=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 111528357
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iYiPNKOquGy0GkvvrR09lsFynXyQoLVcMsEvi/4bfWQNrUoh3jdSz
 mNNWz2Ab/eJMWLxc91wYY/npBwEvp+Bm9NiSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNcXXgW+
 /s6Eg0uRTnajr6S64uFdPY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv127Wfxn6kMG4UPI3iyNBYiUTP/2coCRYnFniCrqLpqEHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnTMtnEaOzps34H3f32
 T/ihBY5g7IfnMsazZKR9FrMgy+vjpXRRwtz7QLSNkqv4xllfoeja8qt4ELC8PdbBI+DSx+Ku
 31ss8qT6vtIEpCOkCWLTOgXNLWo4f+fN3vbm1EHInU63zGk+nrmd4YA5jh7fR1tKpxdJmSvZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBJx+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:FWIP0K1yR8CVCSfWIebFVAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3AaJa1Mmt3po/ldb2UFpgElnA06IsgWSHElHnXAXW?=
 =?us-ascii?q?FKk1AEbTJbXSpxp17xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AD58NyA4LJxiV/Gxn40J35fgixoxYuZqAOkkUzaw?=
 =?us-ascii?q?NgMiPBG9TAjjG3Ba4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111528357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlR+EgknHeCoH4CQQGMbcsT4+cxt3ns982BupjHlhnAsCfCCtfZxvvVBd+krjoTQjFgEvxSrjTrtMRb3PtB2vU9CNKN9i7Dst+HN9Cx/GT/LggAMVNuP2trieUmwq0UUpVmcnJwkgSJpjHe7lIogan/LSFPRik8mH2YeVFb/lZGpwsVLtVXGVflz0R1dQDXbWTCzSW2OUOiDaNL9RvN0Tckpt0R06XEhuLIf2sSJwwjnpHDWesYsZGFm9PzQ3WQm4Vb/Q6LeiNbda8oVE+7KCW12FNEiRwKeAX/oLETzAETv7w9vawL8rk3DMJTf3TPOsl7RsBjf7+9lis9NcvoQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at3hdDeS1LxSJSka4aSHh8Kb5rYYYjt5Q9DUGQCnyhQ=;
 b=dvkWHnOlGd9LtSnLHtbqb9QvCDk1QwIqxXqiArvjJYm/i85SxprsTbQwmuLJBt+0AG6MEUAt8oQamD6hz3FONjbpxvw9Z+LCBtZ4zdkXQB0FC7FutzYr5PsPRniSBSLtXcx0rrB/G3Wufw5Dkq+VbXO04DqvZFrfwEEwtTAxxBQvEH8biVbvBbVcNml1otOkJgNL51uhtgtXEmc5wS+BZiZ+qdVTZUQZXxkqLA3+v2fNrteGnWjbC1mawyJXu0ckdce0tNdrC90p7I2Y/K6is6B3YNkOOQzCziKMPEDXV5QQ3s9BC8z+BeVM7LuiA13fmjJRNraZOa7vnC7IrWmM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at3hdDeS1LxSJSka4aSHh8Kb5rYYYjt5Q9DUGQCnyhQ=;
 b=m2sG7D/MIFmeMNIONkgEm77QUhiIHTbjmNaL1boIuuqtg+cqBKlKeEXx7osZSFSSfFnx32dsRl8uDzN/WND1COyu6B3wmdLFqrN113wgybrU49406S5B8oPbbSxmuvvsQNQM9o8sA60d3oBS3jW3hdiuWHOY1irlyp8E9lS5ePc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 5 Jun 2023 17:19:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 1/2] x86: Introduce arch_domain_teardown()
Message-ID: <ZH39EGVyUBIwWQ5t@Air-de-Roger>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
 <20230605144331.1819452-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605144331.1819452-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: a76527aa-a9db-43c1-f1f6-08db65d84dd4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q4CssrcbggcteTvrZg6kEXXwH+s7o79EOHO55aKU8FiA31ix+lKYdNcgngCyjKLiQ4Bg8xfC8iWwN9iTXEGdsCF1e2G3cvKX3kmR/Yw51LUsrdT4MlE1SOg0NYGoGjYYRTf0paCe1UiwBLh5D0eJI1c2T3Twz7pdWW2GNmkHdOHaoB/Up8wekudXgBHUXT53FmA917JV+o7hLZ5fDkKXh0+Gn8TjV6gua2dMwhTwkGnz1h0ZM/oKspBFZDd4NGhl5TOhfQAN3I/q34uI25Jq68AdZbWehz4b9BHCBZIOrgaiYfC6TwfKvD7WXBk+VysDcAAFI8VOrjwoKvkobyBLbJM2Mo+WjyMiyyzG3h1BO/8PwJhhYobnxc8JfFgDRS49tA9Jv6xk/GOxPooEJ0N/Qz947845YcDoz3Pckii7EeVRUUZZVOLDLoa7KluqUIHxG3S42LzL/RWGnxiiwGhh9QpVoesX+/XyaqscD3K50qAVugI/vCFLMKRJN4Zd1J2mkmWu+7NltVPRTsQflkAX/jTjsiEB8ITTDdmkNleqxQn255/0NkAUtVmqyuRABokz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(54906003)(2906002)(85182001)(33716001)(478600001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(6862004)(5660300002)(82960400001)(316002)(4326008)(6636002)(66556008)(66476007)(66946007)(6506007)(6512007)(9686003)(26005)(186003)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWl5U1VCVkgrczlCZTIyUUtCOTdvUEV6a3ZjcVlHRlVjLzVqQVRaejA5NDdH?=
 =?utf-8?B?Vlp5NGtTMTJjVTUxV2lhcEdwZmR5WVZxMHA0WWVjYUFjbUY3Rmd1ZHV0UGVs?=
 =?utf-8?B?dW80WFQ1blcvZDhGTGh4LzVSckRnd2ZmZW9SeFNKeVIraVhlajFKY1RCRlYy?=
 =?utf-8?B?a3lZUkNweXRmcmtkMFYwL0xPQTBLcUhOYUhIMk4rQVN3VjV5RHg4b0N3KzhE?=
 =?utf-8?B?bFRJa2JFMEt5QTk2QUZoQldXRk9vT1l5cW5uWEwrYmR0cVErVzJNNWpoOFBP?=
 =?utf-8?B?eFhNLzMzMW5DNjNZWnU1akJiQ2w3MlVoNmNDVGZXT0EvZjM0NHh2TWZLcjEr?=
 =?utf-8?B?WFpiN0VsQXBZcUFETnNad09wS0FPOWdFMnVqeTc3bzRVaEw0QVlZZkJvbFFu?=
 =?utf-8?B?b0tBejI2VXNjcGRJVWZSRlNJd2xvbnM5Z1QxZHl4SzFyZ240ZDFSZHJYNFNG?=
 =?utf-8?B?bDg4TkdPdWYwb05LczBJb29tY2IrY0xZczhseGpwRUNqYWFkN3RraEx6MTUz?=
 =?utf-8?B?SzllZ0IzRUpSLzNKYXpJUEF1N3grK2RLc0N5cU5UdlkxZklhS1ZDazlDUFpM?=
 =?utf-8?B?UWxLWlVaM05XM0pMN1lVcVRUQ1lBQnpMLzk3WmdxUDJjb3FKZVhnbU1CVlY1?=
 =?utf-8?B?RFQ4RmdqbFpuc3VsMkhJRnNCNE1EcExlNDJwKzIzMnJnTEhFeno3Znlwcyti?=
 =?utf-8?B?QmVWTzQ2QjdLdFRZeVJ6TFRDUk9VcVZLVkNJbEp6OVJhTVpnK1RyOTNzQkJT?=
 =?utf-8?B?cEkwOWtGRWJzSFRWK3Jsc2JIbVZ1d212N1dLL2Jkd0wwc3dMOXBLMWM2bDh4?=
 =?utf-8?B?SDJGY2lMMTFRb1BGSy84SmZyU1pVa0lOZ0tuNHVjV1BsazRrUkpoWW5uaEFX?=
 =?utf-8?B?TGxvbnF5KytBWk5WTWFqY3FxMDJyVWh3MndmRDc1NGhNaGZ2Y3BYQnZDWHp4?=
 =?utf-8?B?SjFyRmRJUWdrS1V1NmNJTG1wMjZPM2tyM0JPd1VhY2lMMXpuKzkrT2FZQzBv?=
 =?utf-8?B?UmkyYmRIcW5lalJUc1pXVEhFdUpZeGhkOVpTSENjYisxcXlpRzIyTFdPaGZx?=
 =?utf-8?B?cnRPUkpzcFBuUGpyRUlENHlWMks1Zmk5ZDFJRG90RHBzZWNKYmcrU25TL3NR?=
 =?utf-8?B?d0graytkbUdOTkwySFE2dXBlbU5iZjZOMEZMMU5td0djYlR2ZXJXM1dyVTdC?=
 =?utf-8?B?MVNlWkRzMjgzVmdmazBrYnF5cHU2Y2M1SW9NM2NlcU83NFhrWS8rUjI1QTg4?=
 =?utf-8?B?ZHFOZ1IrOTRucDhxRVcvaGh1d2RlTCtlMlBFVmE3RzNPZjJtK0luWllTVlp2?=
 =?utf-8?B?eUhET2V0ZEdZQVhzOTVkZTJaamZld0tDY2Q4bHRHUU81cnpzcUMxYmhYeU5P?=
 =?utf-8?B?bkdSQkR0NEwyM2tKUjdEWkVLd0Z1QnNzVmovR21xV1YvdWdWWnJWOHpLTWwr?=
 =?utf-8?B?d21HdFdweFIvaWVPZDdpMGVFTHhwK1NJYTVLaUhDcDlwR3JBTThaandPZitt?=
 =?utf-8?B?dGVaSlNDK0Q5cmFLRU14RnIwZ05BbEc5WHV2VGwrVmpCSXMxaUdZeVMwbFps?=
 =?utf-8?B?dkdJNUtmM3BrL2YvYW1hSGxMTGNXdlc0L1UwTlkxOEJrc3BheEd1dW1XalhY?=
 =?utf-8?B?QVppbmNZVmxnRVVWV0ZMeFArQWtiQUgycE5hN2Q0NnZuZHJsTFlGckdKZTJR?=
 =?utf-8?B?YVpPbU1ib2ZWYTBYRDVPcFF3NWQ0WWhuUTMySkdhSW1SZjFQYXQ2cExNSkRQ?=
 =?utf-8?B?dlowdnczenpPUjdZMTFmTUp3R0lpWU5wWUw1UmZKbnQ0aU5pQXVIQmNaN0w2?=
 =?utf-8?B?MEU2ZVVVdTRkTHBGOER5WXJpU1ZjWEd1QnR2Sm1mejRaY01kcWk3NU9lVXV2?=
 =?utf-8?B?UU9UZHh4cGRYNmhqTDZ6NUFiVUxveGtoZHJoU2RBY3phbnVHWXl3U3dmU0hS?=
 =?utf-8?B?a080U1FKN3oxWW81RlhQcGlLSWV6TUlIeTFXYm1kd01kaC81Y1dyb0g5YUFO?=
 =?utf-8?B?NWlXVHpVN2pSbDU0ODZqOXk4bFpwNWp1SCtxTDlzR0dTU1J6akRva3h5ejls?=
 =?utf-8?B?Z0JRTVVObjRFRmV4cnZmSFV5VFU1QlBFbnF5SXNBQUxLbmxLNmJ4aHFtdDBN?=
 =?utf-8?B?Si9kbkcwZlhGRnNudDFoTVhud3g3V1B3em9DMXJLTThnaGJuaUtLNTc1K3lB?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iG8DR3LW88VC2m5+n4b2EYDtV01bqQBHgxr8wOlkkCsaGn07t8Xl52nQMegPVwoQGOevlGM86e0X6l8kIIoRiCedPhtEmWjEmQk3sQdLWJcMp7r2wukmkfaU8V2+9poREPx8/bPq6rD9ciuL9+SljNPZJIVXz1xh00mqGjsUay+ahnC16zsvx1NffsCraXO292tr2QV86GX2FmjtUfe0nAqgidevVuwuBvx6KXfSPBj3A9fhitN2zVOX7nYLV+tT0axtP8VuM5JqjG/wOKy68CPGfU4yLZaWx0ijGA5iiVAiE8pgAlmskojI9GocoT3j6Cac8u3Ly53RT/YZ//aQ3PsNfZChOd9i+AdAhQhnPgQ3wt8Rc2A+Oet9NuoHwgR6C2fhyeaYZLyrujGm/giRR2D3bRtnMXBkQYFxWHB09BcdW6irPk7J4SJRA/SHllqiYn9zX0cPiKv+Gk0MTBM278OIlb56WHznmpBvLi/iF3cmEaCVkTPAxp80drqhfilFgHnJtfqmGtZi9b6hP5qbXyc/od11ViyhoRbTXeWO7mh36gtOfoBYW0BSJPcvHgSd+pPqE6kiAdarMfcTcL1OSfJqYarRDS8G+exUWl0WWKbIuQNy7sEIhSFYQPuN53Lc34Qr0Y9lhiA2Ib8xY8qLiXf+3UPZqxaR9mtoEamRU6NJR4MxUHxEAGaLt0eSO5j0YoRso1fR+vxit0E+t9vdTtfaAse2yf7PFKkgTVjZkUuZ9N4FRqbrHxkaga5Lny1diGKhmaqZafvJgnU0SodEwiH0MjmqVXYmJTJ6lvUiytYGyQPOrG1JtFKa0+MBo04xyDL0lIzZdLaIp7FJSK/BCy3G833qdsV9l2t1H5Gs9EyNJe3YuqinCKTN85Pjp0frNr2z31zX3UQJcsnQb3foklSYOxYRm4/tq/JV4m6TQx8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76527aa-a9db-43c1-f1f6-08db65d84dd4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:19:50.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FskzBNBPCBMzOwcsNYWb/THyOfxd1J9nYYHPNnMfB9vo3Ib/O6pBaDBTMWgSjLVUto9sf9qwC6g2Npp2jbOQVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5446

On Mon, Jun 05, 2023 at 03:43:30PM +0100, Andrew Cooper wrote:
> Plumb it into domain_teardown().  Provide arch_val in the teardown
> continuation information for use by arch_domain_teardown().
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/domain.c    | 5 +++++
>  xen/arch/x86/domain.c    | 5 +++++
>  xen/common/domain.c      | 6 ++++++
>  xen/include/xen/domain.h | 1 +
>  xen/include/xen/sched.h  | 1 +
>  5 files changed, 18 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index d8ef6501ff8e..b3981d70a442 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -750,6 +750,11 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +int arch_domain_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  void arch_domain_destroy(struct domain *d)
>  {
>      /* IOMMU page table is shared with P2M, always call
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 39c215316546..5f66c2ae33d7 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -888,6 +888,11 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +int arch_domain_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  void arch_domain_destroy(struct domain *d)
>  {
>      if ( is_hvm_domain(d) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6a440590fe2a..b0d850e3595b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -416,6 +416,7 @@ static int domain_teardown(struct domain *d)
>              PROG_none,
>              PROG_gnttab_mappings,
>              PROG_vcpu_teardown,
> +            PROG_arch_teardown,
>              PROG_done,
>          };
>  
> @@ -436,6 +437,11 @@ static int domain_teardown(struct domain *d)
>                  return rc;
>          }
>  
> +    PROGRESS(arch_teardown):
> +        rc = arch_domain_teardown(d);
> +        if ( rc )
> +            return rc;
> +
>      PROGRESS(done):
>          break;
>  
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 26f9c4f6dd5b..c3348c90748f 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -80,6 +80,7 @@ int arch_domain_create(struct domain *d,
>                         struct xen_domctl_createdomain *config,
>                         unsigned int flags);
>  
> +int arch_domain_teardown(struct domain *d);
>  void arch_domain_destroy(struct domain *d);
>  
>  void arch_domain_shutdown(struct domain *d);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 85242a73d374..854f3e32c00e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -589,6 +589,7 @@ struct domain
>       */
>      struct {
>          unsigned int val;
> +        unsigned int arch_val;

While I haven't looked at patch 2, wouldn't such continuation
information better be encoded in arch_domain in whatever way is more
suitable for each architecture?

Thanks, Roger.

