Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA04A6D3A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 09:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263871.456722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBK7-0004k0-Dr; Wed, 02 Feb 2022 08:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263871.456722; Wed, 02 Feb 2022 08:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBK7-0004gt-AK; Wed, 02 Feb 2022 08:49:07 +0000
Received: by outflank-mailman (input) for mailman id 263871;
 Wed, 02 Feb 2022 08:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFBK5-0004cD-D1
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 08:49:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f979f597-8404-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 09:49:04 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-ja2oO9fLOHGNsCmMcofMGw-1; Wed, 02 Feb 2022 09:49:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5111.eurprd04.prod.outlook.com (2603:10a6:20b:4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 08:49:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 08:49:01 +0000
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
X-Inumbo-ID: f979f597-8404-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643791744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ka3evPuYLhnNwNVZgIhb7VxqemjDCxXUOySBJWAlEGE=;
	b=aHfWXOantCSwzLeOHW61u3WqPeevVriuISsI/IrILYapnUGESBvDUTt9TV1PDVk+hp9Bps
	liVt4mPC+kdaTL8eo6UEoDwMIgwugNYV89WWauJ3oU+OWXC/plYVkfwmifA5c85kbQ0Sq2
	UVPG4eNK+mz4oa5jA034zWGPZpJcjQY=
X-MC-Unique: ja2oO9fLOHGNsCmMcofMGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1140+XM0UMagsZCPfwwXVfriaexr5Ux73awan066/412RqF5dETDN+xGcmhmhK4qoRC2dUNgKp/Nl5exTQtkEM8+OyFS1xYK38U8LmoSKiUzobH+VIs95gdJFcCSnY58g9zg5AXbGR9Dvap9V/4rwyGicm7v7oXuM8s/TnZE5DBTenJPFwLKPPEtcqHweEDP6NtvLYTBFRTcYgZ06ZZtEAArEPJ/9o8ZFXREIDHh8zyi3EYsbxiPIjbZSqJtSAJEm9AFnZSJa6L3AZmiYpFVGaf5ETRwofAmUR9M8Yf0guA6D/weeyknBFzy29kU5w2MFmzrxigL0UglZ6KnmMkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka3evPuYLhnNwNVZgIhb7VxqemjDCxXUOySBJWAlEGE=;
 b=bLMIwQkMNhmmh80HV7GxAePk87KMf1d0FgNKGi3tNCriAhUYbG3P3mOPrwtq5nVq1OcfpQ0qwmB5SbFn5RBwql2I44D8HvujyEmWDypwe93HqoNkLZu0AwyPhbjSF1F5xCji0CZ7JCQJ3v1agGt6UazS1NOwWk3xdFM1EG01GNgZeI/cXaa+Dvs0v0zGldJoczG0zPD23nRtd2mRnbvHKwUDzKHRwWgP8edsRFtWez0/dKNi1pdEj7cGS+6374ij0RuqqQYcWozbByuManzte5/T4mrZUeKEkhA7kguZDl46nL9YXa0PfEBVu+AQTmfhP/K6gTCcPP/NN0ZhxsM9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5be7a1d9-0d59-d099-a5ab-f4ca550de78c@suse.com>
Date: Wed, 2 Feb 2022 09:48:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] PCI devices passthrough pre-req patches
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220201162508.417008-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201162508.417008-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0001.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0665b915-dead-4980-d119-08d9e628dba6
X-MS-TrafficTypeDiagnostic: AM6PR04MB5111:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5111CCBDE8063278AB2F6B59B3279@AM6PR04MB5111.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gm+e80knnKOKt2+AagYd7k15ArkIrmqPu6oYVkI6wJ+p8ncyimfvv0NJOZQALDN0detdA5TspqRipSQtk3gYr91FTodzk7bC3lfNrXj9uNu+tnkC3jMwc0QfB0tZ6JyERJVN9NDXCWqKyyoNX+msaAzHRmM+lKxQCB2n1hhUZ5b49a0gd6iKr8+jYSR9OKBok4ZOSipC56X0HMWaU/87Ru0aovycIlDJYD5klDQnqnhr7VyrxDWZswx8DYg7HgxyRbjhMt7cfXHql70+qFFdiho1207WPfzEEmftHiu0IY7BY1S8tMuK5VyankIg/ekFTvX6RaA0Wuke+XAIlp/pQIJfDNl0o3hH617Bv1/k/epyWRWmw3s0IQwuOKrdwaCSii7vlrGNIP6XK9C93BKr9LYQ4JTTob7ofPssZMP0mkeV+/Tn6qShqC6VzuvohmJ1lJ5p6bopmvATyb5WNvD8WVyOFDoqcd9Oj4hfHO6tf/a22l3f9I1G68PjmeaELO+CjKCFVmg4QcED9ZcrGJWwGdtTxFAXACBs29CtxkA7fF8hLb17RLiKF2dP9oCi0YOjDG3pIxAW71zXfQh4XbY4AzC8LhYgd2Kh+WOu51JZf/TlwSiA2Z1+QrCFcwq8pJKeGPVQ7Okh10YxlyVY+1PWYPNxJQb7OpAvi4zg+okRlAO6WzsZVauXOh8z7L2UIWlWMVEvz8WpFm1G0F3S1haszmYfcVUCXvuDKafsHTwN2UhwOnzXTB2xoZv9q+lLcoKV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6666004)(6512007)(186003)(53546011)(5660300002)(83380400001)(2906002)(4744005)(2616005)(26005)(7416002)(6916009)(31686004)(86362001)(316002)(508600001)(66946007)(66556008)(31696002)(66476007)(8676002)(8936002)(4326008)(38100700002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTQ4Q3hmdStYQytLd01KM0hTWUxhRzgxdEtyS2J1b0NuMHFBdFVBa1g3cUQz?=
 =?utf-8?B?SmpjU3daRzJoZlVwNkR6VDJodDd6Y1l1KzJHcnlmKzRPbmdQemttZDdtZ3lE?=
 =?utf-8?B?aXU2a2o3eUozRHRURGdHdVgrRU8yRlBpMHVzZjBVKzJNOGtZYm81VWpjWUhh?=
 =?utf-8?B?MUJQcloyZnlZMWwwKzFZVVVJamlBcXAxMTFzakhGYzc3dzQ2c0Q0WDN2Qnlt?=
 =?utf-8?B?RGk1dUFJZHhMcWtIMjAvSGQwaFFRa2dBU0h3bnJieloxZlFMbUNITFhKQ3ZD?=
 =?utf-8?B?L0tPbktTZ1M0OExlNVAvM3VkYkc0NlhXMldrYldLMC8yWXh4cDFta0xnUjgy?=
 =?utf-8?B?cEttYmxKMWV5MGt5aDNFSGgzQW9hdDk4RkVxeGk2TEFLbmM1akpFMTgrSnVp?=
 =?utf-8?B?WTNrVzR4SHhqTW9sZElEU3Y0T1kyRENQMmNPdE5jaHRIYldsck5iOXk3dXd2?=
 =?utf-8?B?bVY1MWxzdmxuWWwwODE1dWNHbGp4dmxiVnBoRE5DRExBa2g5SGxXMGd5YmpW?=
 =?utf-8?B?WklZdjBORndYQ3g5S0hlVTNwOEhGQmxPQ0NBRjd6Z0ViTE9Ka2E5clNyMGVO?=
 =?utf-8?B?TnVNUkdxWWNZUGZKYkF3eVVuYTZsU2h4YVFXeis3eDRUejI2V1pEVEtvUjB5?=
 =?utf-8?B?VnJEWW1ja0hvbWFzaEtSRVJMZFR4WGdPL2E5UHY4a281ZjdsVVN3dkN1Qk5U?=
 =?utf-8?B?TzZBTForSmZUMERObnYva2duejEwbGJ1OVJIUzN3bFBEbkhBZ25KYWFrUDJZ?=
 =?utf-8?B?Y3cvM05SYjVpSk5HTTV4R2h1aWJqSGtUTmR4eUFxSk4vOWlPdHNZZ0xLYTFn?=
 =?utf-8?B?RWtpSXlmb1IzRUsydUxoYzlVeWRmTDR4eTZoNHFOOE85NlYxdlNVUXlqQkJh?=
 =?utf-8?B?bmRpRWx2bU9kTzlHRGNqbHdBQitMMXFOZVVDNGpxQ2RrQ0xKNUZVYjdsVUpU?=
 =?utf-8?B?d0g4MEY4dGw0UnFiL1NxVXlMUU50dHJZM2l0RWxhaWR2aWdsT3FWNXVQWVY0?=
 =?utf-8?B?TDkxMmpzNVV1S0VWbUxkdzZxSG1qcFdtN1N3WW5FclBpS0Uxa2xFR1VCd3Zp?=
 =?utf-8?B?MGR5bkN5eWYzbUZQQ2xnMHlWc1hUVzZQUjNmcVZMVFdJQWIycGs5UnV3dy9R?=
 =?utf-8?B?TnZwa0V0anRkVCtoOXJ5VW1hYmFMR2dhOS85YTlMaEJnelVsNVdpcXZFTGtJ?=
 =?utf-8?B?NXBvMjM5RWFwWWVqbzVRQ1NlYVNXaVVJTDJlRGtrMjRtU3VCazBDM002azc1?=
 =?utf-8?B?Z0g5dHV5N2FSMWVEL3grWU5uemFPMjNseHl3NStQQldPaktob05DQnhEQkx6?=
 =?utf-8?B?dkpaWjZNMnByQjVPMGF1L1RBT0NoYk1oUC9tMHYwRmZsWDRkcGpHTFZLREF2?=
 =?utf-8?B?ZmhCN2JEdnp6WHJsNi9qN24vTGhudEorUEVSVGZKWml3MU9OWlVyZHcrVFlP?=
 =?utf-8?B?WTN1blNaSjFzb0tMY1c5Qk5nUUJvamxEMkd4WkRHV20zR0FmeEtBQ3NBVi81?=
 =?utf-8?B?YmdwK2hZc0lrbmJBeDI0SUVCTXovR0FFS0c0WDZuVDZ4RE9SbGlnaThrdlN4?=
 =?utf-8?B?UVF3TlozVkxvZkxsMWZJaFJHQWd0RTN0YVVSaWlJUmx2R2NIZm1KdWpPbHRq?=
 =?utf-8?B?dmlZSzFDRGFGdEVjSmtQZWVxSnhUVHlaWHF0TEttWGk3SzNkT2dlcURvbDRt?=
 =?utf-8?B?VTdGVTRRYVpsclB5MzNpS3c3bHZkZnhGeXRJSHBqemQrUmFERzRIMmdZTWpQ?=
 =?utf-8?B?TGs1SUI5TEdvYjdXSVF0NmphRVBNWW42NDkwemtBNkFncEFrbTlrZWM2NmZm?=
 =?utf-8?B?UG43eGdiOXk0MWQxd1lQZHhiaXJ6cVpDeEV3RzFWT3pOMWc1SGZ0bnBqZTU2?=
 =?utf-8?B?RHRudDNIcEdCQWxiRWtGZE9MVWVIcFg3OSttMVVSRS9UR2dVZXVjWnBCVmRq?=
 =?utf-8?B?eDFCakxWWUIwNVZ4UHZyV1NHQlIyeWFzV3pHQVdZT0Z0eUhuRmdrWTlpZTMr?=
 =?utf-8?B?ZWhkYXpMTmVwZ0RRajFqUFQveE0rVUliZGZDaVZOaUViN09xZXhkbmZwYTdJ?=
 =?utf-8?B?RlpzeXpVSFNraHR6RzdPUU1ycWI2NjhHcUJZRUZjbEJkenFWR3JxNlZSdlQ3?=
 =?utf-8?B?eXR6Y25RRG00VzN4OWpvWlNBemFJQkFkMzY2eTU5VVp2SHBTaTFoQ0tDZklk?=
 =?utf-8?Q?MjQtqKcF/sMr6O/itIgMIZE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0665b915-dead-4980-d119-08d9e628dba6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 08:49:00.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMZ8+0ohnvIjSF1fBRRcnRHcWnlW0/dvQpetmRqLCADexxHvTY/mpIDOKpk2Pqj9bSnSH7qEs6FARs0GcoL6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5111

On 01.02.2022 17:25, Oleksandr Andrushchenko wrote:
> Oleksandr Andrushchenko (3):
>   rangeset: add RANGESETF_no_print flag
>   rangeset: add rangeset_reset helper function
>   vpci: shrink critical section in vpci_{read/write}
> 
> Roger Pau Monne (1):
>   vpci: move lock outside of struct vpci

Btw, while I'll let Roger judge for the latter two, for the former
two while I appreciate you breaking this out from the larger series
I'm not convinced these will want committing without a user
appearing at least in close succession. Hence also why so far I
didn't commit patch 1, which as per its tags could have been put in
already.

Jan


