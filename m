Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1D7619FD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569697.890664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOI8J-00048V-6i; Tue, 25 Jul 2023 13:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569697.890664; Tue, 25 Jul 2023 13:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOI8J-00045n-2p; Tue, 25 Jul 2023 13:31:23 +0000
Received: by outflank-mailman (input) for mailman id 569697;
 Tue, 25 Jul 2023 13:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOI8G-00045h-Ud
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:31:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88617dc1-2aef-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:31:18 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:30:55 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6400.namprd03.prod.outlook.com (2603:10b6:510:b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.29; Tue, 25 Jul
 2023 13:30:53 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:30:53 +0000
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
X-Inumbo-ID: 88617dc1-2aef-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690291878;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cdt3mcnVdwfpZbidGPgv3fBAQZqFR4yEjwQueoTratM=;
  b=KEe31UBgW7RIp0+mFixqJ8OkXLLgoViGRu6hyL+Mji4VwfrtlYVUadkc
   AyJtiVHUnGQ9bsFgyogpcW4GtlDxDUp+aKz2+lwKgomsmvJf2HLE/yev6
   /pTx+K5j1SHpMm/VAYmQVES2zFiyZUsracY0V6qzVNFXUkAAtsG0LnePg
   0=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 117384354
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CKTwB62qSwWj8VyZFvbD5fJwkn2cJEfYwER7XKvMYLTBsI5bpzEAz
 GEcXmHQb6qIZGTxeNEiYIuxpk4Hu5OExtcwSQRlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGX8Qz
 OMWOD42cQGspMCzxYuQWvhIv5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137CUzX+gBd56+LuQ1vhW0G/PxUUoCDoxWX++uPuDjHzhcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS9wWl2qfSpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgAQJG4GICobFw0M5oC7pJlp10qfCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb1N+RENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:3EIqoqvJnY/Ve9kZT5Eba8ni7skDx9V00zEX/kB9WHVpmwKj9v
 xG+85rsSMc6QxhPU3I/OrrBEDuex7hHPJOjbX409+ZLXPbUSiTXfpfBbKL+UycJ8SGzJ8g6U
 4DSchD4azLfDpHZJ3BkW6F+r8bqbHtzEnPv4jjJhxWPGJXgs9bgTuRIzzrbXFedU1pBYcZCJ
 HZ3cZOvTymEE5nFviTNz0qX/Xju9aOr57tYQcHCxk7gTP+9A+A2frVEwW4whxbaD9Ewa4j/W
 /Z1yT1676uqevT8G6s60bjq7pXhfr8wZ94CMuAhtN9EESLti+kaJ59W7qLoTAyp/vH0idVrO
 Xx
X-Talos-CUID: =?us-ascii?q?9a23=3A1xowTWhsqSK89N7T4eMWqePhqzJuamOD9WjeM0G?=
 =?us-ascii?q?DFndGa5+QTGa76LJAqp87?=
X-Talos-MUID: 9a23:D5lmiwbuJI9ukOBTlznQ1AM+N+5T44OJBGQIiJc8vfvbHHkl
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117384354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4lIUoEkcyNIg8e8SZayu16/lUbCefrAw9uXbj8duYYML9cwB88OYE6btE8AW/dafkNxQRRZv4jX3NQi4Pcya15XfDj8n+tvJrub/BCIQMRROWNCsaufTRVLKCI4whi+v6RNDcn7R13lj+OV4yhmb5YLC9GVIRpkzzUzjgbtqVbz8QBa6GkxGBV3cCDskylCnsjN5rN/K4Wd4CKnZdxXmvPw5oEnhTQ/P+HkaJQApXQQ6TEWm7bx3sAdLhJ3fuD3/u6wjBD89mphJGoon5fq1r4a8fNSz/R3dzMnYBaCVHBvI6AI1uDkxQPY+55f8nYSjfILwROKHBtFQItSrwgfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkzvlS7YgjafCSIz40nYce5MrEYRCo9o9cp+rHpmmAA=;
 b=T1/TN2QaH/IqEm5oQT07CV8aUsNdUFKpg50RrEhBW40fUnp8vQefEPM3a3kjpodvvuY0tXg8mUi/t7sSZMvNmS4e6gJh31nGoFhzoIE/VBu88Urqr/5eDoWLIS0AgHQsOU1thRnC2ve3cBbud+ebOeHvi5ojFiiJoUZsjtBRZYlo8Cas6gXjptkff4q3EhIVKKp+5VxwD39KTwXD4KWfbfylpjTVyj73djm8F6xnsjUcrkv282qLpalIPmOUIG3rKvdjVpOfzN8TtoXd0hmOikkTqyfGMx/vg+I09lUo5nO+IZGwpLMbGqy2Z/xlCC7YC9MLwoMqRjh4g1W7Hn+EQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkzvlS7YgjafCSIz40nYce5MrEYRCo9o9cp+rHpmmAA=;
 b=Tky3GJP+lyCuE+brKCQFHbt6+SRIGeB8CjBfSwSpfsM1Yn0p5YIZXpaDblPUU9cKVOti1QiVv9txOh2IY3DTgFY3pFxAQtmKYebfKeoxWWVvnlmNsf/pPjMFKPmDNUbU2mS7IZEnLPVCdhwRGJ3Ot4wrvdnNbLKPonokG4oAof4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Jul 2023 15:30:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/5] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Message-ID: <ZL_Oh6S8mbNan-s-@MacBook-Air-de-Roger.local>
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-3-roger.pau@citrix.com>
 <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
X-ClientProxiedBy: LO2P265CA0467.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c228b9-3a7a-4339-47fd-08db8d135e73
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VkS+bIvVMe6NhIDQHUrfsKTom/BMsD2twb68GohwyllH3Jw8k85mSPK7qE5pDGI16kobYwgoxPNGWpDDlg3/9Ej8wvRssbCzhTbK2NjtuwyknBpbW/UeVvwaL8CkZ5dINzJc0oABVVgxINntJx7+6nZM1LYysVvQMmBVCaC4hTEJrfrDOZCTAYJ/9LOcih9n1EIcRotyknGupk0r23Y2+HJxoYecxqbIvYElh0LWSBBtC2Fr+KsUxHLMOHCluSn2JIs8ImYUldj6eraSxmWaKQi4ST6fXlWsUN85LVwAGsODcKyJIp8pYs9pCtU98urd4IH8KV5Nr2pG4poPgiE9i8JR+IbrQbC9hOYEzROeby4aVSXw0EC29k0aayEedgAKzfwRUQ9uSDuz+NQ1O8dcS6dx8vRjadwFQUb5Z1nQmgW4qi5DqFDfCv5B7ma5sYUyfmZaXo5PxZgKHuFGVw/JNZ/l4pjWK8FWmg2Dx8OhXs8I8FrkPRFBneA3GcFc8uUZey5bllu+azNMFMZYs2WAhUpxFHau8CbVAfEL0CuIMep59XePdwWMb/mwYPp1IgTu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(54906003)(6512007)(6486002)(478600001)(9686003)(6666004)(83380400001)(86362001)(2906002)(53546011)(186003)(6506007)(66476007)(26005)(38100700002)(6916009)(66556008)(85182001)(82960400001)(4326008)(316002)(41300700001)(5660300002)(66946007)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHFRMGkwK3FDM2s2SkIzRWJGaEJtSmUyOXB5akh0bHZSd2xZM0EvbEIwR0h0?=
 =?utf-8?B?djdadHI2eDR5ZnQyQmM1cmVocjk1cGhaMEFlREU0enRUTnFHYjRVTGNYbkR6?=
 =?utf-8?B?N0VNNEZDdlEwQ1VLRXltVlE0ZitwQTFBQlptUzdsb3o5Y2VFa2VLSlNJNEdW?=
 =?utf-8?B?eGFJR3VQNmFmbTI5K2JXemNpckhjTDY0UlZ6VEpyTlZwWldmbDRRdTZpQjQ5?=
 =?utf-8?B?K28zRjk5ZVZobkFyVEZHV2Ftd0ZqSkh0NUFEYU1TaHBqWEg4Wm5PU3Vndkha?=
 =?utf-8?B?eVNEOGNXK2dkbk5lTHlMdVAzYVpIZzZWelFPWXRkZmRYOWl2d3liSTNsa0Nw?=
 =?utf-8?B?TGUyUmplWForYWR0ZjFLcm9YZHlBbU0vV0gwMUdsNk8xaWU5MUdSMk5OSG11?=
 =?utf-8?B?WnNTWDA3L2d2NmczNVRkSEtlQ0JJOWZWMHBOWFhLMGRodjZqTStrZGR1L1ZW?=
 =?utf-8?B?TnBNRktUdjJCUlYyRy9Pb0RwemRpTGg4Y1FvTDFtc3U5ZWJPYlZkaGVhdnJM?=
 =?utf-8?B?VENPZTdlenZYV3o5SVFwM2cvZjhveFNMWWdRYklYTS9ySVRsVGNxcWZqTlJC?=
 =?utf-8?B?QUtuNEVjSGRaaUJoOTF1ZGJxb1NCYmlzMmZTMWNmRUhMUlp1QU05bWIrRmRG?=
 =?utf-8?B?MEdsY3VQRE9pREdobkRGUEFBQmZDVGw0WU56VStpS2VRL0dqelU1WUd5K3dN?=
 =?utf-8?B?cmdkWGdybE94c3NQeFU3cE1HVFVuRDhhdmNZcmhJK1FndkFJNW1nQVRyMjJ6?=
 =?utf-8?B?YlNZNkNRNzcycmZ4dVNsS3d3QlNsaFJZRzBlaEw5cEVidTJVcXFEL0g1cmZG?=
 =?utf-8?B?NVp4bmdDQ21oTXJHZ2ZXckFVY3U5ZllOaXRYNFJMZVRpWFJjbEZCWDBkM2pt?=
 =?utf-8?B?WWZMMEI1MndiYzdTeUZ0TVFjcHM0ZkVvM2NwaFk1NzJFbXlDUlZzYXY5VTFh?=
 =?utf-8?B?NzNlR2ZDWXNRbW1QSDlTeWl1ak9SOHNqUVRNc1QybVAzM3kwQ1FOT2tZWGpz?=
 =?utf-8?B?RlFZUjc1R1ZRV2paYklrc3FXVDg2T1FmSE0vWVVUVzBSdnBIdVBIRFFFcnFJ?=
 =?utf-8?B?NG4wYnJ4VmxFenZ0QnhDRGZtUkM0NWlFdkZqTnFTRlBsVWxlNVRYWUNDWkZh?=
 =?utf-8?B?TVNSWGZtK1gzOXlZb0VCVDY2Z0V0SVQ2VXNxNWxkWm44UHpOQStWS1M0bWhO?=
 =?utf-8?B?d3ViNkFlU3c3SXBkMWxBcEpBWFMyNEtlK29VZTg1amNvNGFxeXdXZFdoWXhB?=
 =?utf-8?B?RGQwdWVzdGlsYzNoVWJpWjRIVkE0RG5rMEdoMHJhZWtzY3M4K0dCTXpsMGtx?=
 =?utf-8?B?enNvZU1aUHIxcEd2QWpsbWRyRmhqZ3h3UHN0YmxLOTBGMmxiaDdUbzVTUmpC?=
 =?utf-8?B?ZFRoc3pONGpVRWJlTlAvKzVxRXlvV3NvNS9zTE5sYU9YNDlxTXFZak54dmFt?=
 =?utf-8?B?R1BBakc5UUNKNTZ0cHd3dnRod09ROE9sZC9SWHc5U2FRNmQ1ZWdCZmlBYXAz?=
 =?utf-8?B?ejlrOGE5YmJGbU9XUWk0REk5MUhCK0I2U1o4K3lPWHVxVnd3MDNCZTY1dzBY?=
 =?utf-8?B?RnVKSFh6Z0NQL09XakY1NlJlMllSdmRNQUYwZ3kwbjBrU0UrVVFoTnE1cm80?=
 =?utf-8?B?MUo1U2ludlZhbk5YRmpzeWdrSE1aOUVKb1UwNnh4TkxZYmdTa1ZHbXMzWTU3?=
 =?utf-8?B?NXUxQUhhaVpycWNzblRSSTg5SU90ekVlTytQeUtua3d6KzZFYkR1a3hQUG9S?=
 =?utf-8?B?S2pZVEFlNXRKR1gvUVR0WmRLVWZKSzRVMitVL3lGbHAyVnZoYWpHb3dHZlZS?=
 =?utf-8?B?U0pEYXAxNThvMlFMREpEQm16SU1qeFRwblQxQ1lDMWRpck5qRis3QUd0bTA4?=
 =?utf-8?B?Qmo2dC9acDJNRlhtVnl3QUVST21rbWZRTyt4MWxNUjdnbUFjdklDQ1NZKzJu?=
 =?utf-8?B?ODE1UGVhRTY5QncrcTVEaXgrRkQ1b1NidTBwQm1qeHlQMS9QRnN5Rk45WWVO?=
 =?utf-8?B?Z2hlTmlqVTVNNTNMaWVCWnN1LzNoTkltUzlMWFpiUDJGWjB5TCtuUEtoTDFH?=
 =?utf-8?B?VDdZNjBscExyRzBPZWhpMkNIQzg0MUtaVnVTejgzT0lEOWtmOXlKRzFIeHJJ?=
 =?utf-8?B?QnFpd1AyVlJlcnNzOG9zYnFHR3RsZ2lhcWNRYjUzaERkQ3c0VTJ1OU45K1Y1?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6WCgqpskf7OS6+znFXw/pnmqFx0KVxthfwphBzPtNWRRjXxLOtX4F2k4I87PAHer3jda/dwZ8MwGTwcFSpmbzo1uXj+sAnrw53zerDTlK1dQVtEesgb3iyGa8uF5jL3WZd6kJ/0vKX5HP25ox0JUgBw+tzHktODuDg4WWrHmMcSzNKQgkVPqs3pwKQrJnnbW3vQq9iizq4GCQ7Qjk3GAjdBZvr7Thf5RaevSbSziYVXTVpB1xExhOgXaatTncsvNAc+sQ5TQxxduS74y9fcoEUDPl/bmTloEHl6pmdLeVklKD59EDmQu1oHL98XLjnDvb6CEQUKMwvI0RVmvbKGGJ1xpemAVbzePbUfcs45NTQJVg6mK4ix8sv9+eJTzMAtkT9nJ+MF7LwPyp0YAn5rysPXKULwvQNnVrQ3v3LowMwe4xA4x5p/oEszhbDoD7cNEdrCwnMhEa6rjkFBnN2NttAUasLswtfMuip90pkT1yeVp907dlmYtp4XWxF84UKVIEx7OJ3zz8/tQcfITP7q8OloN2wOt7Nlr9SwssDHHMXhUxPYzEQHzZN6Qax5GTubuuVmIyDfDwxoqUfVreEkAL0SyRG1Cx/xwWVQgfC+PrjlxGYEvBnlWoYJakh/a5mL5d0yS5P/CHSgocyox0O8hGOGMruhaRGySbw2CVtP12RD9Fymju6vm6PZyOHyCYki1DqpXv2npmhYwywTstp0ZuDOF7JtuAkMlOk73OQkbxhmNS9kFF/aOcYhxzayIBQdSWmPGJAbKuLmD7SRAsgzN4pLYI9N/PhGu89kVfpWaIxpfT/3B4PGd9sqGWL38CYoK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c228b9-3a7a-4339-47fd-08db8d135e73
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:30:53.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYxLhdREceaXLC9uaQ6UlrBURx8/NP6mWSrO9B7A+CDa+I/U9UxfVGe9y2dYmSErkDBeHtA0PDMv9WQPZQcwoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6400

On Tue, Jul 18, 2023 at 05:40:18PM +0200, Jan Beulich wrote:
> On 18.07.2023 14:43, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
> >              dest = SET_APIC_LOGICAL_ID(dest);
> >          entry = irq_2_pin + irq;
> >          for (;;) {
> > -            unsigned int data;
> > +            struct IO_APIC_route_entry rte;
> > +
> >              pin = entry->pin;
> >              if (pin == -1)
> >                  break;
> >  
> > -            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
> > -            data = io_apic_read(entry->apic, 0x10 + pin*2);
> > -            data &= ~IO_APIC_REDIR_VECTOR_MASK;
> > -            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
> > -            io_apic_modify(entry->apic, 0x10 + pin*2, data);
> > +            rte = __ioapic_read_entry(entry->apic, pin, false);
> > +            rte.dest.dest32 = dest;
> > +            rte.vector = desc->arch.vector;
> > +            __ioapic_write_entry(entry->apic, pin, false, rte);
> 
> ... this makes me wonder whether there shouldn't be an
> __ioapic_modify_entry() capable of suppressing one of the two
> writes (but still being handed the full RTE).

I've wondered about this, and I'm not sure how often can one of the
two writes be suppressed here, as we modify both the low (for the
vector) and the high part of the RTE (for the destination).  It's
unlikely that the same vector could be used on both destinations, and
IMO such case doesn't warrant the introduction of the extra logic
required in order to suppress one of the writes.

Am I overlooking something?

Thanks, Roger.

