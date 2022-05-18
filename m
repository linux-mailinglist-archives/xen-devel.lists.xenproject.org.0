Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B952B67D
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331834.555437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGKb-0007sV-3e; Wed, 18 May 2022 09:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331834.555437; Wed, 18 May 2022 09:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGKb-0007qh-0i; Wed, 18 May 2022 09:51:01 +0000
Received: by outflank-mailman (input) for mailman id 331834;
 Wed, 18 May 2022 09:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGKY-0007qb-Mw
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:50:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03dff376-d690-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 11:50:57 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-nEJoR7bJOgmbtVTRDEU3Ug-1; Wed, 18 May 2022 11:50:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4167.eurprd04.prod.outlook.com (2603:10a6:209:4e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 09:50:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:50:52 +0000
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
X-Inumbo-ID: 03dff376-d690-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652867457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TiBq3rSKFwFoChy+0aeR/S4A4vPjUy3GMdBcTlrBRkQ=;
	b=NZfzgQRgH5z1W4//+rfjolxL9/P7sjhvA5oGzGGaWm3pELAwFAoR9LjF8CPjbszcnF/GXm
	5ME2an6/lHQwixY6Kb2FfGDb38Q9lcfGuB8vUfkrQ+BjGEhlGcsCYOJzkTiuqK5R28rbpu
	V/P+Fl2k2pTAya5K7UUH/dRRp9HuAIY=
X-MC-Unique: nEJoR7bJOgmbtVTRDEU3Ug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1ZSNsLS7bUNv7Q2lUMNIG4DmMOZfC4j+96PKA9ISgCB72IUgEidQyHALffaUeld37MbmmE0+bt4V/Z8lILjqKr1q6gX9Cf1LYho6i0wbcBb7ASCjXRMeHndhTjiTus7lRZwo7jI0DlieNHz3X1ckBgxLHH7xKB+saVmvqeufUpqxcjUrz1Wi6j47kutIuQAJE9mwTa9IPGuMItPBZ93hfqL6GXCKGqHuM1oltMJQ3zIaKlzG7f7Au6Eq/lE9YoTixfUOiA/CE+Kjo84WvtkFz6tCCrGDNdC5dijLeXzG/ao+ZVg5khcV/WtZ0fSkxAUI3BCMYwPzPEDUNriBpI9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiBq3rSKFwFoChy+0aeR/S4A4vPjUy3GMdBcTlrBRkQ=;
 b=hKL+EpCXz3XAJbSj5BI+Gx1ye/7qLH8YDHsE8Za7yjDPT66F81DhNqvyRc/1R6AB9Q1NSb6xa7W164k7X3zGN7yGwammp0uK2KTcs/onJW7K5VCx3dgj3T5TY7tmlWafS3CMX18a5EuENNKrA1yq39RSm4t0bCct3LYKyVq/ignNwniSo7RQOQKzpiRAYr7fnb69U8K1QEXFFAPJxMa4l6KBQ0SKqDBC6MSaJYN0v9rEGl2uwx/tCxPb90nHl4ixvBuLS1EVUtQ2U6kQ7NdPY4Hp5mtjjFPa7ttPH66SAq1ZcIBJy/JgNy2FYtswguen7kLSqd53E+cRff9UcFgxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c668df5-26a9-0c44-83da-a2d6081974ed@suse.com>
Date: Wed, 18 May 2022 11:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
 <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
 <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cfab4cc-d953-4a9a-0294-08da38b3e552
X-MS-TrafficTypeDiagnostic: AM6PR04MB4167:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4167EAB485C41FEA3C892345B3D19@AM6PR04MB4167.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZ6Vz1lo5ruITrtT3sy2su9L2cF6Fpm5bDg+oFn7B9hrBChCX4YLwjA+o/SyWPrJ7fRGR+moOpQZwNLDC1ZU5zqymdqyDG0L413Lev0WJYNedd/N2s6KAeWkoP0B/VRVGePiJVSa/xzk0FEEthGidYoOxI5vXY4oTWs50v91XjkChDQ54ML0LWoqyqJzmkwxYUkNxb0J19V91gzud28y760LlTgtiwedPoHrUqyfv6aDQPCFCv9s6OHvOMDZs9pCMlqoSDQuS4Rq6yyXjeS5HPnjBptdBupausvADJUvTLKmv/+ektH81BngVs+2rK0a4YDRIBb+Ida/lpiTz1WOIhX6VFwZ3O331HZUdRz6Z1yJURwop9QLfz3+ZnKIqCQsmZZ7XxuRKXOKVWgOufcIUvZfw5eZ0Xvp1A88j6QJMJlRnSf6qenLHWPsaM7T4CXvFnCgkyCPHrHSwTGXgPjJIpVNQinijle2Kku3zhCHemL9KGgjA9moV2/JCMaReifOg1sVa9YwEnvl0aGDa7xPyvBHpJtLTLSyXvYYiifgKX+liA4JpuGtKC7/6eK/eFi/gEzvcAcizOt0dAALBRyGP01XfeN51wZ692SUmtPOH5czMoU4bJ1+uf5CU1G2gYXCBmi1zem/+BQMg+CNj9f8zwpWCDghIj01QP+jIz/l0MyiX5QuwYfdYnufQ67UEFxnfziuoGRkZ2zYqmtR9gd141waFz1OqoeJJEG30QMYNY4A0iyRRA1dmLlafAZqpXdZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6636002)(316002)(37006003)(4326008)(31686004)(36756003)(54906003)(38100700002)(186003)(26005)(66476007)(66946007)(66556008)(8936002)(7416002)(4744005)(6666004)(6506007)(53546011)(6512007)(6486002)(508600001)(31696002)(5660300002)(86362001)(2616005)(6862004)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHl0YUY5Wk5mSllzV01ZMG8rQXcwSmZHRGJCcG5hSllKeXMxNGNXQ2tlQmNV?=
 =?utf-8?B?dXdTdkM3WjBJeHV1YTVGdzlUamNNRzVwT29oeWx2LzR3b21Fb2NacXVlT29l?=
 =?utf-8?B?OFJYVGMxcWsyM2hqaE9RUG5sYkxPcjlTMmFnTmtXUTlqRDhVd3Z0QXNDeVdR?=
 =?utf-8?B?S0JhNUFCQkZzL2N0Mnh2enpFM2J1Y21OR0dWTHBkVkdFK3MrN0dIczhjWUhU?=
 =?utf-8?B?VlkzZHAvcVRWbHp1YmdodUs0a2Y2NjdaaEt4NFpITWlPL3ltZG1Vd2RTSnNN?=
 =?utf-8?B?eFZ3Tm0rSFljeCtFUnlQL3phd3JKR1VlMUZaVU52VXgybGdQM1IwazdXNEhP?=
 =?utf-8?B?NWlPTy91Sm5YV25pWkx3bGJIcUpvVTBRM3ZRT21CaXlDRytoem9UTUM2Ui81?=
 =?utf-8?B?UnFxc0UxUkkxNDJlK3UyQjJGWS80aDc3UUV0blN1NzM1Z05OSmhFOG9neUpI?=
 =?utf-8?B?MHpOQTYvakhqNjFRRE1XUFhHcG13M2Q4SVJ0cWR1Q090QWphd1dKd2lEdm4y?=
 =?utf-8?B?Y2ZYdnpwS283RDJZQUtldk9zdFNXMnliZzhxaVFTTmNFODlUM25ieDdnUWJK?=
 =?utf-8?B?SHpnWmtKS2tOS1pWTDFoL2ZHbGUrdnowUTJOTmt0N3V5Y0l0aG9ockpkemt1?=
 =?utf-8?B?SFhqQ1REZDB4RjNRMUt4c3NtZnNRSkVHS1orTDc0TnY0TWR4QStQL2xxZnRq?=
 =?utf-8?B?OEtrRTdONE9mUmorSXdzdTE4YmJpUElnM2k4cXFKWmxWVmhHZGZFdDFFNUFG?=
 =?utf-8?B?dmNnSkFNU0kvRVBXbGEyY3V6MmFJVzl5MUZLa1U5Tk5KL01YUTNNeEV1K1Zn?=
 =?utf-8?B?SlZxeFk3VElhc1JEU3FKQjN4dXNTUXJ2Y2hmUDYrT0FUNTFvTEZQajQ2SG5S?=
 =?utf-8?B?VWErOXBsSXJhTkRXb2VDRUdwRFg5d1FSRHZHNTRJN2RuQTJTNTVtOGp3VXNX?=
 =?utf-8?B?K20zaDlnY0pFTi9PeWNWcWxpSDZ6eGhtdDdobjZQUElVK3poNVpvL2ZlUU1u?=
 =?utf-8?B?UHVLMUFNWEpGeEhHNGpMVVBROW52NFo2V0M2VG5BM0RpNC8ycEMyeGltL2Ja?=
 =?utf-8?B?djhIclRoNWZZcnVzMFdWeHN4T0pnZHVqV2pqQVJ6SlNHOW5tM1FSZXhzaC9K?=
 =?utf-8?B?ZkgvRDBOZHhXYU1PTm9NRlZ4Skx5TDNCNGtSRmRKZGtzLzdnelM0YVRkeTRK?=
 =?utf-8?B?UjJQd0tuVUFYUko1WVh4ZWtXcXRVWlc0VWg4VWpjR3V2MHl1TlRtc1NsdEVj?=
 =?utf-8?B?SkU1UG9HVWtxeTJwK1FvZnhIQmJjNXloOWZMY080Wm5PeDNQMjRzNDNISnhG?=
 =?utf-8?B?cWVwRWFUYlNYR2lyNDFST3lVOTZvc1M4M0NCTkNOL3lNa3R4cXdCWHlYS3pY?=
 =?utf-8?B?a0Z5alpFSExvamZISUlCUVIvTnJ6aFN5Q3hNWWd6WWlQekZlRWprdjdVUzk0?=
 =?utf-8?B?NXVRVk5QRCt5WGV6ZWtBTlY0V1UxQWhjZEdIUldCdGZnYmIxcFJnWFpkQ20z?=
 =?utf-8?B?RjlibGtFZDFGWnh4OHlsYytZODhmamZWSzQ2b2l4UEdELzdReVNQOGI1aUh0?=
 =?utf-8?B?S3k0TVJ4RkxzYkt3bjZMckZYZm5QOCtUZmNzWG1ucG9LV0Y1S211RFBpY2tn?=
 =?utf-8?B?KzRnSmJjcC8vUGRiRmY2TUsybjhkc0xxVW1sdXYwQ3RDL1MxcEdrVGp3VEdr?=
 =?utf-8?B?UVpLcEpFNzNtSnEvK2hWTG9VL3E1b1JNeXhvZGMwTFFTWUJadXFqUFBoVkI5?=
 =?utf-8?B?WTJMYkVZMzcwaysveEsybVdtQUhkRCtKNEJDK0J6a3hPZkJUNTk0WXpkVzBG?=
 =?utf-8?B?b0JBOWNNYnl4eU80MDBEWmVBNkpiQVNMazNQQlhKK0JvRWNmUlptOHh1c0Y4?=
 =?utf-8?B?VUJaVWJRY1ZEbXhzRmJQU0cxYXowT0ViTlZaVERZc1pUTmk5bUEvZ0hVaWg2?=
 =?utf-8?B?QllMU1JxQTFyc3NRWm43L3R4NzIxcytmZ3I4V2FDQ1V0QTdTL2RvN2Z6aW5a?=
 =?utf-8?B?eWRrWEdPb3dIQnFsUHYra3R4N2xZakFpanVDL3hCckdkRThyMVJmYlpQSlV1?=
 =?utf-8?B?eUJOTWtOTWhVYTNKUjI0eUFsTGNJblJlMm1EWUhzakNYTUNZbnVVaUszTElX?=
 =?utf-8?B?V08wdVlaWjZEVUhXOVVtdmwwUW1Md0ZocEJxUTZzQXh6YUZ5bGg2ZFQvOTlm?=
 =?utf-8?B?QzBvVEt2dlcrMEYrZDJHZVQzaHhpTjBoYlVxRXZDcnpRTmxHUUNsVVhGS2Rs?=
 =?utf-8?B?STY0M3BFZzBZVGNwSC9QaDZTWXdDMVVFMEpuVko4WFB6MkNwN3JHN01kNUtv?=
 =?utf-8?B?Sy9BOWhmVDdPWDVoQkg0ekh0b1drVkJuVlorUDZ0OUVGSGhBelh1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfab4cc-d953-4a9a-0294-08da38b3e552
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:50:52.5411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxXiSx7+gP/TWRJvW0Js8zH1F4cWFXrIwYx6G49jWSWLGd80bwmstWD2vuMBJQRKg0OLKn7xhZjdIEVCuiWzGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4167

On 18.05.2022 11:45, Juergen Gross wrote:
> BTW, the question regarding patches 1, 2 and 4 to go in as being cleanups
> still stands.

I would long have committed these (without waiting for Andrew), but patch 1
continues to lack an x86 side ack (which, as indicated before, I'm not
happy to provide, while I also don't mean to nak the change). From an
earlier attempt I also seem to recall that patches 2 and 4 can't go in
ahead of patch 1.

Jan


