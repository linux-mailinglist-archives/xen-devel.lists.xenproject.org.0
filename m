Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218195117AB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 14:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314981.533286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njh3w-0005Bi-Rq; Wed, 27 Apr 2022 12:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314981.533286; Wed, 27 Apr 2022 12:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njh3w-00059Z-OT; Wed, 27 Apr 2022 12:46:32 +0000
Received: by outflank-mailman (input) for mailman id 314981;
 Wed, 27 Apr 2022 12:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njh3u-00059S-FT
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 12:46:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d2703a8-c628-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 14:46:28 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 08:46:06 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3115.namprd03.prod.outlook.com (2603:10b6:4:40::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 12:46:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 12:46:02 +0000
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
X-Inumbo-ID: 0d2703a8-c628-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651063588;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C/xCsXnHU48xPDrrOzc7HqGD7bAkzzZVfEy+zRFi7I8=;
  b=Pm9/TG5rTSoEklFTsS2MHtvYp/aWYuznDzKUHSly5g6GIgX/Q6uzu33P
   dojq6VY3q4dHS1XhYskPX8wQf+h2lqCt4ak/Tn+oNerWL3w5w0OZIMjKL
   e7HVE2oL8+mxJAW5GkfBaYy1IW7O2Y+nEv4SnMK47WlImCwReHFto94Sk
   I=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 70442961
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:B+bkl6JHu5XElfBiFE+RppQlxSXFcZb7ZxGr2PjKsXjdYENS3zxSn
 DYfWDvQPfmON2anc4p0bYvk90MGvsLXy4VqTAplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NJQ77+yUS50BZySqKMUbwVfLHtBBpQTrdcrIVDn2SCS52vvViK2ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM2FGvqVjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGjL2cJ9gv9SawfzULwyV1B/7fUAoSJUPC2QOdEmWS5q
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLmqzd5l/DAnBeF2EeLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:kh0yfKmongfGZjjcFFsWqwHOGozpDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70442961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd4SpoWSAy5Blst4upFQLE/z0+XaEfvlnHzD/5ZZXmuX56XKvEXAAMPlDuOVArZjsyijHGsmo57CP9wke1zbo4GZO5WrfraEbj40G0fP7Hx0MmuM7+ha0mkrfbBa7dF5GykFwCqKAL+9RCppW4gvQEY5GruPp4iJ/Hxmgp2tjZ3XwHX2gsvHPekmA9xQfckopx5ESSHou0QBXGN1xuq3iSc35G/AqFeMVx8dMy6VX0rbKBGFYx6BhyX+idxPwemiPa0rKMO1qkuLjDM+Hfq0KUv7YxOPtlToBGeh9zaolzDjjbRjZ7Kd/FBomxBC9QXHvXj+IZpN8Z8rrA8zL9Xl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOwOXTimLWCWMUUjUw/YMFtiIYxCaNp6P297GhXxD0g=;
 b=Ol9GE2OELe8nFv+stCUolhBTY3t5rtJ2Nih4Kb4fnKE/lMxoRLUh41kztmNK4IP+F3JpVzmHFvxYLF4umjDAh7ETvhc/YMRYHP1NzuMtr5zGnjLaBftZGVh1l/CE/RSNdHLVlgvTwLxN7bByCsmz93l9/DXz3dqqVhfRDwBZNywKVjxsiRd70FSZ9hck+4n1oPlDpkV011TfvNDeRVHFV1qwUi7lLEbxO8gi6atGpAAf3u6YB7T8CHnDKlF4Q046/dix2JMtVX/b+m7FwD/Duj3GRw2WgRoPTI9NkVS3OlP5pbaB4lMnbagELVGr5ALNWsmDnTQZA8NPL2blf5JESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOwOXTimLWCWMUUjUw/YMFtiIYxCaNp6P297GhXxD0g=;
 b=VPFbTUyMu/pLaSITaXgNceCDJBuDce+PsntJj429imued39h++X3BuhrwYFBg1viupq5GlAMlAqjQ272NYbd1hWUpMnKNSj/Nvda4BAg9iUlyg6HsLoalkHF5qQo7YeHFvav/VkF7dkgr1FNOPmVloO63LjXe3KRtCIMm4xms80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 14:45:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Message-ID: <Ymk7BjXdyiMUGoc8@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
X-ClientProxiedBy: LO2P265CA0506.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ef08335-d5b3-422a-a232-08da284be32c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3115:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB31157B8DE398EEB667005F2A8FFA9@DM5PR03MB3115.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zaQEjrxzw/1hyiLSGG9LNmFzR1liwEVJnYu1o5IXgJE+qxXl4nLnBX/vCvVLp0bM5N24TvDkEsL3g8mw70V2BbK0gLzf8Cz25qmTxBgCr5s/I0c8b+XvihFRMIXgid1YlvPP9WD4W+dN7AXtzfxSlDUhtJ6spG1HPf9J4Zd7Ki8NKeqg/oUPYxCGnRlgaKHAOgwRspCCm01YWX0+VJFE5GLyIZydTj2hYxpCJY0MznuvRLKuMnpRLwNmWbRz5tF40Yn3RDSACdreMgB6q5svlz9NLWtTrLgbs7xg1kHkJhE5fWe72U5db3kpLhnZyz+5vJWfFJXCEaSRAuRNHy1F9eJEHV/PmWsUGNTqtJJpue/4Z8AN9uj0MYTl8/IinsHGO9P0A26n+t8g9GYoEd9bDsRKWZPEs9Gm/s4uPGNrGTWDcfoCzz9KOi3Xfz13SssHe9jLyJz/Vgh6B8JqHos9ND+mOcekzpea3Or6VCcYEKJ0ZpCrpBA4EEbRo71TG7aO2LnhHcW1pAzD/hmEavqDdp+A2GzPnxZJelNAGldvUeerSxfN/mdmSkjt3IUKEra2RUGQXdcIuvCxOkOMFlGy3BE5lJ6IUZA/oYthxD1hHyqM2iWBsfbb9v8OTdv/Z7W3alm3HQFkmAaabr5ivtNeIG7hSpkxR2Of5g1V0fX8r2F4wUR4Ld+96WRZc+Wf0h24qPth3Vlj+IxsjPyW+NlmTlQXpzeoov8uJcanF04JArc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(84970400001)(6486002)(508600001)(86362001)(9686003)(6512007)(6506007)(26005)(38100700002)(82960400001)(6666004)(186003)(66476007)(2906002)(66946007)(66556008)(316002)(33716001)(5660300002)(85182001)(8936002)(54906003)(4326008)(6916009)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2swOGY1dWJlTUdXTTRXZ3pqY1RnVnhKWGMraHpDcm9UTTFMcXZjVC92dWhp?=
 =?utf-8?B?K2xXYWxwdFUxQkdQdWlVODdnZXZwM3FySU0wb2FTQWNMbkEwSkRPTzhHREFu?=
 =?utf-8?B?WEVBOHptbjZxN3h1S085dU5xK003WVpIeHFNRlhjNjRxUjNpTHo5Z1hvRVZr?=
 =?utf-8?B?TmwvVW5YY1hLSUNyN0pPSzBFOG9lREdwYkNqT094dFdXWTdIeGxOdEV2OHVm?=
 =?utf-8?B?VmsyWFpLRW5TWS9KTlA2R1BjRCtrVnpLa08vSjJEWVpBZjZVTnJlT3hRZFVz?=
 =?utf-8?B?djI5dHFxUHJpQnVzdnBMeWhPTUxKOVNUNE5aNFR1YStQQUYrWlJzeFllZVgy?=
 =?utf-8?B?ODR2RlhqVzZ3Z0c2Ykp2QjhmZHRGRGhwdmZzUmdxQll1ZGJ6NVNZZVlNVEh5?=
 =?utf-8?B?SU5HU1NYTnFMS3M3TGlrc0hHQlBWTHdjMFRwbVlGWmRnZmIyM0FsVmRPZUhm?=
 =?utf-8?B?WnVaRzJ6c2RGdTIrazZrZEhPVGl2OTRZTlNvcWJvWHNsTlA2Vm5TcnlNWEhW?=
 =?utf-8?B?Z2hBbnBqM25VUEw0bkhzRU5MeWdoVmhvM0JIcTkzb21PcUhSN1paMDBTZHRk?=
 =?utf-8?B?dFZSZ0YwZERITmpPZWJsYVBsdmFpY2F0WEZObUszSGxSQndzYTBCUmV2WSsz?=
 =?utf-8?B?U2NkTllZWUljcTRGaTM5NnRiUXcyWnBoRGhHMEFWdm52V0h5RzJUeUNBOU9Y?=
 =?utf-8?B?Wkl1U0I5WG00U3Y2WGJOWXc1TTFBK3JnOUlCMVhpK3BPY05HUlFLYmxXK0Fz?=
 =?utf-8?B?ekpBbkVzd1V6TythU0kxTzNydXE1azhBNm9tcGloQkxwL3NoY2VEYkxmbW8r?=
 =?utf-8?B?SU9ISjd1L1JPSHdaVHc4aDdnV0hIcFNrYTRXb2lkUCtjaTBPWUNpblJReEc2?=
 =?utf-8?B?MVB4TUJyL1pid3k0NzJkTEtPRk9sTnpySkdNMlVVTGh0NFhNZzk3RXVuNGhq?=
 =?utf-8?B?V1VBeGcyaTd2ZHhxaWN3ZUhQYjU0T3lNZlJVSEQ5SFo4UjVUWjVJYzZBMEI4?=
 =?utf-8?B?b1JhM1dVOVd0WEU2M2xZWU5qRVMzQWdMNmd2Sk5obGt5WGl3NCtNWnRqV1hW?=
 =?utf-8?B?dFROVENoY0FyNklTWXlXOFpjOEZKeGx5aHMrUUhvMkx4MlRFT3gvWklYTnNr?=
 =?utf-8?B?c0N2dEFXVmdoL2lxL3BoQUdpb1J0U1VjMHVhYU1ZcVRUZGk5SjA5TVhDZ3hm?=
 =?utf-8?B?V3JMZTF1bTJEZGJUZ0Y5NHRQVGhENWg2U2RSK3ZCdFhWQnh5YUQ1c1lSUWl4?=
 =?utf-8?B?TEFFVXR2NlJPenNyVVkwbUYraUFLeENwMmtmMWNIa3lSdTZVc3FNQXZGMWhs?=
 =?utf-8?B?SHJWdkY2YkdXWDNnQTJ0SlRsZ2gwNkFhZVVDQUkzbUpCVWVWbVY0cTdLN2xv?=
 =?utf-8?B?S1l4ajdmbnBCcDc0WjU5Mi9BNFRRaTE2dWNXOWJ3LzN6RFE5dTA5bkUwNmcz?=
 =?utf-8?B?V00yMkxmYTZqbm1zbVlwSDJXb0loZVpVdVFGWGJUSllwSXdUK2dtcVRUMlRF?=
 =?utf-8?B?N0ZGQUZaNGlFVG5TdElrZmFjY2Q2MTBTcTBvV2N5KzBEeDJGd0l1OHlTTUNo?=
 =?utf-8?B?TXdKcnQwNmhUcWFSb2VnazhZSXRwM0lUSGQrRTRuZVhRdmhxYXBTM1BIM291?=
 =?utf-8?B?RUR5bkVvb21mZ2xFK05YZ080eW0yZXF6djJpZ0FuVGkvb0lQNVRsbGFoNkFi?=
 =?utf-8?B?UzJ1TDdkQ3liUm1FcGxsVU5MWGc0SGs0UXNqZG5nblU4SldSUktyN0xZY1Fi?=
 =?utf-8?B?NElLeXJsMTlYdnc4bDJZQ0xlS0xKMUxjd0x5T3p3U29IWTlReWN0bUp4Wkxa?=
 =?utf-8?B?WjhERXJlOW1tQTM2OU14NjJtMVJSQ24xN3hqK0dBYnhubHRWK0ZyN21MTkZw?=
 =?utf-8?B?RitNZFY1ZFhPMHJsamN0Z3kwaTJodjRuNjhoZW1qZnlwVXhTeEllWTNlbDg1?=
 =?utf-8?B?RFQxREtQcnRpc0JVVk05eXA0UEZjc3kzYUFrTEt5WWtNMUQ4UFYrSFhWYTdD?=
 =?utf-8?B?S0tjQUR2TDlkZjduNWZBKy9YOG8xSk5ITFdMME82VzhSM1c5dmRjWFU0S2lv?=
 =?utf-8?B?RTgrUnVXeW5YamdmenZXR3oyYzhON053QW1rdW93b1JYekZMTFBwbGRaOVlu?=
 =?utf-8?B?VDhUTk9MOURGNUtMeTNQemdPRkc5bnFXVSt5ZGJRR0VPaExDY0Z2aXpCOHVP?=
 =?utf-8?B?bUc5VFkzdDJXQzU3U1VDK0VvNFBWaGNEZUQrSXg3YmtyeXRSamMvc2t4dGNk?=
 =?utf-8?B?dGlZQzlBcExwdExob29PandjeUhsNUZSalo5VFpOMlJOby9VVTBkblVxSnpa?=
 =?utf-8?B?ZTdyL2E3QloyekU1aTE4NjBlV251Qm91MmN1UVpQQ0lkdFhnTnppZTU2Y1F5?=
 =?utf-8?Q?1uZg/3dg9DVQOE5o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef08335-d5b3-422a-a232-08da284be32c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 12:46:02.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQuSYPQIp+sN3opsKL/rCcJbdVlutDWv/dysumDokoom367XchjDdPExzGU42DE35cHsnK41XK9EruYrNyQyrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3115

On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
> exclusive - only one of them can be enabled. By default, 'intel_idle' driver
> enables C1 and disables C1E. However, some users prefer to use C1E instead of
> C1, because it saves more energy.
> 
> This patch adds a new module parameter ('preferred_cstates') for enabling C1E
> and disabling C1. Here is the idea behind it.
> 
> 1. This option has effect only for "mutually exclusive" C-states like C1 and
>    C1E on SPR.
> 2. It does not have any effect on independent C-states, which do not require
>    other C-states to be disabled (most states on most platforms as of today).
> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
>    reasonable default, such as enabling C1 on SPR by default. On other
>    platforms, the default may be different.
> 4. Users can override the default using the 'preferred_cstates' parameter.
> 5. The parameter accepts the preferred C-states bit-mask, similarly to the
>    existing 'states_off' parameter.
> 6. This parameter is not limited to C1/C1E, and leaves room for supporting
>    other mutually exclusive C-states, if they come in the future.
> 
> Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
> to disable C1 and enable C1E, users should boot with the following kernel
> argument: intel_idle.preferred_cstates=4
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6
> 
> Enable C1E (if requested) not only on the BSP's socket / package.

Maybe we should also add a note here that the command line option for
Xen is preferred-cstates instead of intel_idle.preferred_cstates?

I think this is a bad interface however, we should have a more generic
option (ie: cstate-mode = 'performance | powersave') so that users
don't have to fiddle with model specific C state masks.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- unstable.orig/docs/misc/xen-command-line.pandoc	2022-04-25 17:59:42.123387258 +0200
> +++ unstable/docs/misc/xen-command-line.pandoc	2022-04-25 17:36:00.000000000 +0200
> @@ -1884,6 +1884,12 @@ paging controls access to usermode addre
>  ### ple_window (Intel)
>  > `= <integer>`
>  
> +### preferred-cstates (x86)
> +> `= <integer>`
> +
> +This is a mask of C-states which are to be use preferably.  This option is
> +applicable only oh hardware were certain C-states are exlusive of one another.
> +
>  ### psr (Intel)
>  > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
>  
> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 17:17:05.000000000 +0200
> +++ unstable/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 17:33:47.000000000 +0200
> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
>  
>  static unsigned int mwait_substates;
>  
> +/*
> + * Some platforms come with mutually exclusive C-states, so that if one is
> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> + * Sapphire Rapids platform. This parameter allows for selecting the
> + * preferred C-states among the groups of mutually exclusive C-states - the
> + * selected C-states will be registered, the other C-states from the mutually
> + * exclusive group won't be registered. If the platform has no mutually
> + * exclusive C-states, this parameter has no effect.
> + */
> +static unsigned int __ro_after_init preferred_states_mask;
> +integer_param("preferred-cstates", preferred_states_mask);
> +
>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
>  static unsigned int lapic_timer_reliable_states = (1 << 1);
> @@ -96,6 +108,7 @@ struct idle_cpu {
>  	unsigned long auto_demotion_disable_flags;
>  	bool byt_auto_demotion_disable_flag;
>  	bool disable_promotion_to_c1e;
> +	bool enable_promotion_to_c1e;

I'm confused by those fields, shouldn't we just have:
promotion_to_c1e = true | false?

As one field is the negation of the other:
enable_promotion_to_c1e = !disable_promotion_to_c1e

I know this is code from Linux, but would like to understand why two
fields are needed.

Thanks, Roger.

