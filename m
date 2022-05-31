Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A953944B
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339828.564736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw49u-0003yh-8I; Tue, 31 May 2022 15:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339828.564736; Tue, 31 May 2022 15:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw49u-0003vR-5S; Tue, 31 May 2022 15:51:50 +0000
Received: by outflank-mailman (input) for mailman id 339828;
 Tue, 31 May 2022 15:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw49s-0003vL-Sg
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:51:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93c295ab-e0f9-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 17:51:47 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-crvH-rB3M_6uebFOCQUaGQ-1; Tue, 31 May 2022 17:51:46 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2563.eurprd04.prod.outlook.com (2603:10a6:203:36::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:51:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:51:44 +0000
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
X-Inumbo-ID: 93c295ab-e0f9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654012307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+gb4sJ+/ewSSupf5o5IjWHAiGlAUe7ETcuOmm89aLM=;
	b=kx+rvLuph1sACVD2LUhTsNugVWLiHZhZt93gt8fKsEatY/PX+WCApHMzcwIIcjSbnfTjL7
	bcBW+Kr8Xv4+taT6u02Jdr8baVEudSaBe2wxxsgObIePuR3cAhACN+nyPJV9+dsF3Rulxb
	9KqKwOyNzn/y5cw0qBg6wRLuNG4nlNk=
X-MC-Unique: crvH-rB3M_6uebFOCQUaGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFsq7NfsgiHloXfKCTYk2qsZQErNYRPYbmT6I2zvKE8yJel3fad9qmXTFWtLYjJdLSZ7Yk3SxdjWEVrGqeJnympJZP446S1Cx8ce87BG12fGoyqvC+RSE9tIZUIF1w/aW20G+zqhdWg11fZxKFJ9jd2wTFZkINO06z2JzhqbkF+ZPBDLADoEPhP6Ww89EmFv5NEzTLzYrIlUMgEzYlSVcd9gmzp/+8/Z8A+F2hu5WepVdBxQJ0kOmDQ6ENt9J0VztUzstwwfMSijP0AADutXbqVSTE5nFK6LXDhQlf7MSLPgIKJEkdmsSmXhKdhCcP6IOMdfUd35P0oO3nl97HPomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+gb4sJ+/ewSSupf5o5IjWHAiGlAUe7ETcuOmm89aLM=;
 b=oSYDg1XQAA6zuaCEYjRcYM58hOlp3QnVP0O4av0pHObueOyKKAnWuGywepst1cwG2aHByFiWZ9ZENZN6bHT0DHRQm9e9e2BzUNeYP7RZ3sEPyRajO0dNm71Uw4nE9HjcjWTuSUR6q7FmkVfRm+8XY/hwV9vNeKM7X+y43SDAFJdjNEN4Qu1mHY+9iWUMnXZyoPZw8cXx1Uet9IVYoSCJG4KFeFvw+lUozVCzz+YgDT61hTm0+1nikAVmlyKo4lGpSjQq1T3JLK1ZK6KhUcdEyv8P3st20xwApy42IIKwJOosOlencPVHJo7j3eOpLbpli6GT0yLbOYo8RAaAc+93pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1358771f-32ae-8a6b-9894-980014d7112c@suse.com>
Date: Tue, 31 May 2022 17:51:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531150857.19727-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5641874e-c3ac-41db-3136-08da431d762a
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2563:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB25637B5971C18A59DFC28F92B3DC9@AM5PR0401MB2563.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zLJBZ9ZgVHkJtZXzHobLV5YrtoCecdH19GTPUox7Gf1SMovH4/nqhbY2W2RFYyvXPei5e7gFhnAcbBPBQffPEY0sJESMAb2JRc+rVGar8/EeaR7EigRhbu8MoAQzPvMB/Ry+OTR7VZ5iAvzzp3UFpAdzyA3YMY9+xweJe1Gdi3DhKizX43IiqrR4L6pxH8/C/zeaz/84fpmKaHwxcp4xZx+YwXWvFQOzRqCCwW9b5HRrTyOYTonKKRA3XKhKF3yegFUJoCxhLbeXF7umuApxixKfi0bYNRYygsPE6SqkxOGvJ4wy4Cp4S33fmiHjICAtfl6oS3ZlnUrIFfoP6OAxmTwBaHN25SdlNAAAfkXA0oKocACRm3eu+wLu2YlEbnb2PkQUyJDMW25H3oO6Sc4kiMfp5u8Z1WaGFnS5VN1+MgRLm55CM+whj/alpLjjaTxEdE4eW1aQp3AA7of3yFnbenNvFPIPYA0wko8q3vnapDGhwrxZEVPFCc/dyVfBS+C0TgSR8Dng/Dr6A+XaZJ7eJcIbF1klQkrwQe8/9nazye7JSN9ciYngxR0RMydk42rz569rfFo6s3yknDZXcBhwFewB5TX35qGaCVC5B5tDsw3ia/j1P6csJ7Y3+x+iIBcSPY+uuP8mAZiteQOYv3eLRt4RBL0bJcxGvT198Uq962Ij3BY0Qmz3r4sKz5ZwPoK5CerAc5iIGXKzBTprodjhzh/zfalOYdOU5x3zmfnPfXHBloYPyYzFohbDWAIr3kKu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(186003)(2616005)(31686004)(36756003)(4326008)(8676002)(316002)(6916009)(66556008)(66476007)(66946007)(8936002)(508600001)(31696002)(6506007)(86362001)(53546011)(6486002)(5660300002)(26005)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmV2cm5LdnVFTy81bGRmb0ladk92RFZZSUV2T2NEbzlNSGNYVDh5M29JQTZ5?=
 =?utf-8?B?Q2NqZ21pOExKUHU3SFc4NGM3aWlVWUUzRkVYMEJyeHZhOExMYW5ZVzUxU3Iz?=
 =?utf-8?B?Q25nZXZtZG1RTk1kVkJ2TTgvM09JWFJtM2ZDSFprbGhzMS9ZeVgyMG0yVFpQ?=
 =?utf-8?B?SW9kYWZNRWhtRlRXSUs2UmNLRFNnOFFLSFFubWlTVVhjbDM2OXpBczRXWjdH?=
 =?utf-8?B?ZGE1T2l0aSsreTJUVlVVWDdqUkt3ODlnQTg3TmxRaVlRYWNQMHk1ZGIrYjc0?=
 =?utf-8?B?WmhaQ3BIV2hraDdpQ1F4Mm84NjdjZmlVaE5xOXhWaFFWazZ1L1dVeVVFd2dT?=
 =?utf-8?B?NldLdEEwaDFYYmRyTzM5cTBkRi95eVZQM1RiU1c4Um9QWXBmb2c5dU03UFhq?=
 =?utf-8?B?K3dTOVEzc1g4Y0NudGJJLzVkVnd5UHhEbnpTamgyVFYyMkphT2JNa3hLTVJD?=
 =?utf-8?B?MWYxdzVaWHhmaW5yZVBwbndtQjdDUDJDRlMyNEVKMG54d1lmL2wxVGNIVmVY?=
 =?utf-8?B?cTRsd2ZVNGgzWnMzYUxISnFmS010VkhSaVRjcSt5UGtsOTJ4eWNiTEZhSytm?=
 =?utf-8?B?YXJOc3RNL2duSFpMT3ZEdnU1SjFwc1kzKzExbU1WYWs3dm1SbEdkSW1rZmR0?=
 =?utf-8?B?NjArcnVscHVOMmZVZGRwcWs0QjRaQno0MWVPZ0dZZUZQbFJtNkdzOHQwSWhh?=
 =?utf-8?B?UmY4b2ZNVm9Cem1aNGtnbWNkMTNubmhWM1hkSm5PNGNBL1dZd2IrVWVSWDhM?=
 =?utf-8?B?eGJFaVkrUms5OUU1WElWWDZzdGp2VEJHMTc0RDFadzNUblIyeHlKZ2pPM3ZV?=
 =?utf-8?B?ZXYyeUgwUzRFbkVPVnI0NGhVK0VZWW80K0tGSU9CSUVFbVJscXEvRlIxTFcx?=
 =?utf-8?B?bjByRDl6UnAyeXk0TkNpaWJ4eFRqZkJWNElXNzBaTUc4dGo5VGZJT1ZGQ2E3?=
 =?utf-8?B?NTFMYjM5bHRUNTFKTEc3UHBhbEtvZjhiYjg4R3E2bkZJdUtaY0Zhb0FuakNr?=
 =?utf-8?B?RmhsUDNEZy82djI2eFJyU1preDIwek5ZbEYxZWc5b2gwYWFEekJKVTRwUyt0?=
 =?utf-8?B?blZGa0ZCbngwSVl4eVZZTFNPbTFCTFFQL1ZYVUhURjBxVXJrZzRPblEraFcz?=
 =?utf-8?B?d3FsTmhDSFlpU0dlV0VSai9lTE1hTWZiMGpQUXJiQk54b2c1eXYwaVdibkRw?=
 =?utf-8?B?Uncyb1M4c1NUenJCemU1UHV0akJ4Z3lRVmx1ei9VdGsrVm9idlVYV3R0VTlz?=
 =?utf-8?B?dW51enoxd1ArWE50a3JCYU5GelBRbkFuY1ppVnFNRTNvRDViM3dRcEFFSnR2?=
 =?utf-8?B?dEZCd2dmZVRvU2UyZWs1YzNUYTEwTTRMZFRyK1I5aWRhd3VMdXBwNi9IYTFz?=
 =?utf-8?B?U1AyQ0FzeTVMRGpnUWg1dGI0cFJaL3l6ZlRjLzQvS1RWYW9lSWdYQ0JOWmdG?=
 =?utf-8?B?djNCU2FvVDlJVDBMblcyTG0yVzNNbTB1VDZnZnVkOTdhZzdJa05zK1JTeDU1?=
 =?utf-8?B?dUhFK3A3akxDSnRmNm15WHVLZ0RSeUl6amRnRUlnczN5bTlLZjhFN1o2bFZO?=
 =?utf-8?B?ZXNKcVArL3RvSlc4Q1FHeFBjUzlnVTNWZkxMMm1lSUVqUTRJOW1WY3dGSi9J?=
 =?utf-8?B?b1MrckltaWZYT0FkUkZhUGNwOUhyUmk1SzU0T0lUUHp2ZGM2YmExRFR6UGZy?=
 =?utf-8?B?dytUdCtWTWVtbmVyRk9pL3FCWnVQSGVtZEpXaHplS3h1WGdzTm1ydGxUczdI?=
 =?utf-8?B?ZVV6Z1ZUTVU3Ump2NXQ5WWg2cW9Temg3UjlpSDBOZXN6Q0kzU2xyeFZVMmhv?=
 =?utf-8?B?bWRnWlBpM1Rqd2prZkhacktMVHR5ZkdiMzRFeUM0NW41SWRYckhFVm9pejBW?=
 =?utf-8?B?MWN0YjBKTVdWQzRFTWhMdlM2eDJTUS9yS1FXV0FEZTJSZzIrbzRCaGM2Y1pB?=
 =?utf-8?B?U1ZWdVdrNS9KamVvOUhYKzAzaTVCM3hWTVpaRHR3aHp4N0dib3ZYajRDN1RY?=
 =?utf-8?B?elorT3pGSFpBMDNzQ2UvT0xNd2J0aXppMEdpYXhFMGFiZ2l1eUdNOHZwdzZD?=
 =?utf-8?B?YWFpdnFUaVo0cUdaRFB0VUQwNng2dURwUklrdVQ4c09KT0Fzeng2NmJFK2dL?=
 =?utf-8?B?OXdVSUx3V0QrNnBNdXJSMUxIR0hnL3Zpc0daWFo1VXcra1lMaGx2bkR5R01t?=
 =?utf-8?B?MWlrMlhwRVFNZlRaZ1ljMDY4ZDE2QVdubWxGeTNpSDkvZ0RyQXJCWW1iQ2FJ?=
 =?utf-8?B?akU2Z3YwMC81MlRaK09rQnFGOXRHdG1EYlpWN2R1V0M3aGZ0enNsYUJlMld5?=
 =?utf-8?B?T2xDZW9YZFJQU0duU0hqUDdvY1hVNGtVMUNlUVlNSWsvTlBGb0IzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5641874e-c3ac-41db-3136-08da431d762a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:51:44.3185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLKLOGYZrY8Xu43FHnQD/iqgsygUTP8i54VExiJ/Y8A/3r5b1mR4M685VwmdGsyLDc2SipAuZKDVpWeTUUcV+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2563

On 31.05.2022 17:08, Daniel P. Smith wrote:
> It is possible to select a few different build configurations that results in
> the unnecessary walking of the boot module list looking for a policy module.
> This specifically occurs when the flask policy is enabled but either the dummy
> or the SILO policy is selected as the enforcing policy. This is not ideal for
> configurations like hyperlaunch and dom0less when there could be a number of
> modules to be walked or doing an unnecessary device tree lookup.
> 
> This patch introduces the policy_file_required flag for tracking when an XSM
> policy module requires a policy file. Only when the policy_file_required flag
> is set to true, will XSM search the boot modules for a policy file.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Looks technically okay, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but couldn't you ...

> @@ -148,7 +160,7 @@ int __init xsm_multiboot_init(
>  
>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>  
> -    if ( XSM_MAGIC )
> +    if ( policy_file_required && XSM_MAGIC )
>      {
>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>                                          &policy_size);
> @@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
>  
>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>  
> -    if ( XSM_MAGIC )
> +    if ( policy_file_required && XSM_MAGIC )
>      {
>          ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
>          if ( ret )

... drop the two "&& XSM_MAGIC" here at this time? Afaict policy_file_required
cannot be true when XSM_MAGIC is zero.

Jan


