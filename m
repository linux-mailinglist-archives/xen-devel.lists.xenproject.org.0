Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359C3F7831
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172487.314755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIujB-0008Ub-On; Wed, 25 Aug 2021 15:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172487.314755; Wed, 25 Aug 2021 15:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIujB-0008RU-LQ; Wed, 25 Aug 2021 15:22:09 +0000
Received: by outflank-mailman (input) for mailman id 172487;
 Wed, 25 Aug 2021 15:22:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIujA-0008Qd-2S
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 15:22:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52e92ede-4d78-4f48-9e6b-c4b0456df420;
 Wed, 25 Aug 2021 15:22:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-Sddo5FNBO92QYlfI8N-NJg-1; Wed, 25 Aug 2021 17:22:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 15:22:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 15:22:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.6 via Frontend Transport; Wed, 25 Aug 2021 15:22:02 +0000
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
X-Inumbo-ID: 52e92ede-4d78-4f48-9e6b-c4b0456df420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629904926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jamq7kIFPsK2yXCSnXY/MegsCtho4PXbPCRV8muJgU=;
	b=nL94HHCjm3m8wAu+/vT5oYTwPeMRV3/dyzVf31xiOyH7NS9mIhUhMxtSHLA99iJDstXgOW
	M7cleKybMVygc2daFLIGB1gz7ROHMMhtwqPgQyGYrBwzNFJFphB3de48vfW0XTZd3o0tzM
	DjbjokBhIkA5/YY3ouP4rdyONBYsf5E=
X-MC-Unique: Sddo5FNBO92QYlfI8N-NJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/oDtUOPVQ3oRhnSNabd4cr7KiuTB+Jlg/fUR3kseZAfofEezGBz+/jhWyRBFLII0e/eoVzkJ+tsac4FALPssoQtUBfZ9dCq/ck2XQE45bv74DVuVbZRgxe++aBEdad8sRnjkYaZ7Rx/o3I+Wd90X5/QeN3pMwCALED5gIhbxIIIDYUFLJ+antt+fCFUZPEo5l8a5qoM2UbhgP2lEOQpZb1aEqrTaNEGOVrfz7ivn01ngSvl+oLUPgYwc4dWFv3Y0FTGyFrzUAUo1CrCp86KQUGVV6RENr5ZPVhp4srxw4N3o2JDO67PPR8vknWENyF+1lNE3O6r3sg3imn+RJONww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jamq7kIFPsK2yXCSnXY/MegsCtho4PXbPCRV8muJgU=;
 b=Wb6p58TlyacXsR72TvO2moXo+bX/QreoEAjHIUfLgoxyTY0yEyXQ+/8SSuUGYHabKkMBsPCHKSCdaNCG7FXx9sVYD9/LQUrRMtti+t7YCuvBqB2Z/q3Dz1PlqlNSOWwzE7FBOURWlWhIMq2vV9fRE8D4UqigvCVeKYvC9LKnhj9F65+8zZ1U7NYXR0oG6BES3USdkTjEF/quTYKffbAtW6KOEjUFyR9TCD7ON/NCIuonKJ5y64N3VwpiwuKW9pZMweGB80kvFoSHS30Mla32oWjDz2Ws0rPQ2+aFFaYEbf60Mb1tNzcQQnTSlRJ+bvyw7SH5//htFBIx/uw2MRL4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/7] xsm: remove the ability to disable flask
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa55359e-cf96-ce3e-b1bd-a7af4397d4a4@suse.com>
Date: Wed, 25 Aug 2021 17:22:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210805140644.357-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe93a8d5-d537-4a26-e996-08d967dc175f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902DC3832CD38EBD518F832B3C69@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZgVph7lChCDwvRjlLwGCphYzkfcD20Dv7PbjT4+jJwpwJbYDRzB3BxIOxFZxfiLJB3EbRIq2+Q8QEziOf5WEn1Lx5VI9cLZ0IytdTBTPJCzH1Od2wM7Ta1+bUyGkXQbE/3vhZszRmxXMG5rqQPpsB9bb4V1Q0/6Og66z2Sz2FTJyUHKhEe4Lbz1bIwX+PvcImjvLuEZ6K4tnlW0gwuhbeAqG7l5/fiJIS4/+xuFDRKTblG0/B8I562Madp+mJm49BvfFyMlhoT09aMS8zDXCO20wg8JcCkjto9azfFNuxxsF/dRIG2an9kfvcBulD86cnxIxepjfmMZz66GZJwHWeJ6N0iCPaBaGiITcpUw3LcbLPyM0XuMDBY59HG3V3uAiUL7acWDiZTXNhyfKlJr06HBbmBHR+uWfgguo1hRREOqGNkCqSBsnWyKnMo3tMvRBm2rhmdFt1prhOHwGxAiWnKQ1sJR8cUlOLY9MkZLSXEO/R31cqFQRghDantL/hpX+RSuZNHkQe9+DeKj/eJc9cBCqreG7piVLSaLFGjZVq17U1eN+O/8AH++mOgyMKnSi3CEaQYKzIXFJZRoyjrucdi+KWMXX0W9Ga8UfEncVk6ie6uRkNKeHfzAm3NAHU1pOcxDfkjHSh82tFnscEqTVP+cnlT/noa0Xq+QXn5n/a2bRjq5JQZXh+jTuItf79hdhEns3KuLzIUIqa0UUuerbJfjHznEaWGU+PhX7qY6NRTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(376002)(366004)(136003)(396003)(956004)(31696002)(2616005)(26005)(66556008)(186003)(66476007)(54906003)(2906002)(66946007)(478600001)(86362001)(53546011)(83380400001)(5660300002)(4326008)(8676002)(6486002)(31686004)(316002)(36756003)(8936002)(6916009)(38100700002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a09RWUVidkx1bGg0SC9zYUlDWWRaNE5mRXdyNVNVZFFnSGRjQmVNRVJuV3Vh?=
 =?utf-8?B?eWNheWJ3aU05cnBCTklHVzFXZW9nUGMwUkVyZ3kralJ3WEJyL2g5SWUzYldR?=
 =?utf-8?B?L1N4UWpJNDFlSFVRQkpHNnZQVUQ1RlNHbHNnWDBsNlUzWC9rdHEzdHFoRmNh?=
 =?utf-8?B?MkVKdVZRZkc5WWdXOWprRGprcnJ3aGtNL0ZJMzZRczJqLzlWODJFNGdrNHBt?=
 =?utf-8?B?Yy9MSVB2UlBScTBOVjdQUDVrbGM0cDhqOWk5Z1Rpa0dFeXAxclVBVGZQeUNX?=
 =?utf-8?B?NnQzd29ha3kxV1JMcVhlU2sxdlU2WDFuQnhGTkRmMnhWSklQMnAwSWVpazVN?=
 =?utf-8?B?M1pQcTV1MkJLaGhmMm05cTlOS1l4NVVkemRKL3grQjFpZkhFWllINFhvMm1G?=
 =?utf-8?B?L2VYVDJvVFk4SkIyVWZ5bHJwZnc2cHQxK1d0dURlSzNuOVhFQ0syWTV5eTlr?=
 =?utf-8?B?L1ZRU0daZTZQMjQrYTIyLy9WT1JReXlUMDNZTjUwem5HU0lnVGRablRONk1o?=
 =?utf-8?B?T0lWYWFKMXhTeFVzODk1MmJBV2s4bHRXSHJmV3c0M05OTlpQMGRwam1wRm5t?=
 =?utf-8?B?eFQ4czBkV05VeEhCMzc2UjFZb3ZreXVpN0I4NjJrd2ZYc1N6cjB3S0h3MjNm?=
 =?utf-8?B?WnVhcXRuZzUvUUo3QWhJeVRFZnJUdGZadUlkZVRpQW41VXdnUjhMMG9FRFE0?=
 =?utf-8?B?RkZOQVBnL3FIWmwyQm9YeGJVREVQSDZSUE5XSEtCZUZkenFnekJ0ck1qZWxU?=
 =?utf-8?B?VkcxQ25LaDZxWGY4b21ERzQ5KzJtdklLUEhYUWZHYVJKNm5qY2dDbEcwRi80?=
 =?utf-8?B?b1BobEM4Z2dZQmFjTWlnMVpMdy9UM01SRlhNK0szS3F6dEpyZVNjOWVCSzlO?=
 =?utf-8?B?dmhsb2QxdUpTSVArdExHWEFyOFQxdVJyWEp4OUtIdU1TNzZIamUzUDgzeEti?=
 =?utf-8?B?SGY4WHg1UkF3U280RVJTT1ZQM25MdnhOWkFyUHBNOUVNREJvakNrZXhlNFMw?=
 =?utf-8?B?R1pIbXpiQU4wZll5WVRoNndIZloxSDM4TktVRlRzYXdUcEFqUXZZQnRJQXMy?=
 =?utf-8?B?eTZmUDEvYjZIQVE1Q2tDaHIyV1lhYThyL1FnWGV6TTE4c3dkTDNZUXdzWS9s?=
 =?utf-8?B?QzNGd1h3NXZzNkFQYlpzenNoUEx0ZVpUYXZobFVXV2NwZlFQM0pGNjlMWktH?=
 =?utf-8?B?T01Zb0owanliMnFqY1lBalFyOG1TL1ovVXVTT3d3ZGpYR2NhRmZOdFQ5eDVB?=
 =?utf-8?B?NnlsUHdzOFYybkkzOHZzdDVjUTFVc1FxdnppM2ZyQndJMzFuc2hVUFQyUXJa?=
 =?utf-8?B?L0N2bERtVGRybCs0SmgvcHA5Ly8rRVJRbjNFbzY1NEk3dDBVYnhROTI1bzVC?=
 =?utf-8?B?d01qTGg4eUltVllySEp6TExIa1cwMU9MZEdoRVpVSDduNG9kOUFIeEpRbSt1?=
 =?utf-8?B?VUVFTlorNXJLenJiZEFPUDlnS0gxYUxOQTF6M0MvU0tOYXVlWjNQNXdYV0Yv?=
 =?utf-8?B?K2MzcWg0aXp3bEVBR0tSNy85dml4SE94N1NDMHpPMFpwU2VmZXBjcms5SzRv?=
 =?utf-8?B?emJkZXg0NWMwZC9XTDUxcjZWZWM4dkE5b2Rwc0tjTXBpa2YvM3dqYms1cFZv?=
 =?utf-8?B?MFVJTUxjOE03R0c0ZWNWMEdiNytwV3RGVmlTYzV6bnlTMTNRUVBPOW11SHpP?=
 =?utf-8?B?VUpPV3c0YW9Nck83cXhjYTFwNTh5QXNLQStLcHBIZFVwS0RrMEltV2NBUkVm?=
 =?utf-8?Q?U75IlEMaEh5h1ozPyFjLgzAKDtSxgBI6XOWOEnx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe93a8d5-d537-4a26-e996-08d967dc175f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:22:03.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0LdsDNlmPDdidhM5fCBgedn9n/S3CbjlIoansDe6oGJ8ozx6+B1z4RNXH1IN4UuUorKeJITCWbf+z7qOxLtdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 05.08.2021 16:06, Daniel P. Smith wrote:
> On Linux when SELinux is put into permissive mode the descretionary access
> controls are still in place. Whereas for Xen when the enforcing state of flask
> is set to permissive, all operations for all domains would succeed, i.e. it
> does not fall back to the default access controls. To provide a means to mimic
> a similar but not equivalent behavior, a flask op is present to allow a
> one-time switch back to the default access controls, aka the "dummy policy".
> 
> This patch removes this flask op to enforce a consistent XSM usage model that a
> reboot of Xen is required to change the XSM policy module in use.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

The primary reason you remove this is - aiui - that with alternatives
patching there's technically not really a way back (would need to re-
patch every patched location, or every hook would need to check whether
state changed to disabled and if so chain on to the dummy function).
This became sufficiently clear to me only when looking at the next
patch. It would be nice if description also said why the change is
needed. As it stands to me the description reads at best like something
that people could have different views on (and initially I didn't mean
to reply here, for not being convinced of the removal of functionality
in the common case).

Jan


