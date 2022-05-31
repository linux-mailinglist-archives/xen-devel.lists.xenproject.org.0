Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A45394B5
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 18:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339859.564770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4NU-0007Md-5b; Tue, 31 May 2022 16:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339859.564770; Tue, 31 May 2022 16:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4NU-0007Kq-0z; Tue, 31 May 2022 16:05:52 +0000
Received: by outflank-mailman (input) for mailman id 339859;
 Tue, 31 May 2022 16:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw4NS-0007Kk-GH
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 16:05:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897e0c02-e0fb-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 18:05:49 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-i8juIK0JPfK34o7iLT-K8Q-1; Tue, 31 May 2022 18:05:46 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 16:05:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 16:05:45 +0000
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
X-Inumbo-ID: 897e0c02-e0fb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654013148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXFilAsXVY1I7q6k0txm2ejLetW03uIyctVCES+Ti9E=;
	b=hDBszHxdFCJIbXudTprhN+AqXAxdyQT7ybOsjlrlexwxhJVX2izcKMKLB7QNDmXyBi+aQZ
	IFhWKZBtp5LmyhcMfhYQN3GR1X/Bw4mXFgVfQ5/uVvaLg8dfKQDrx3lOPxNoCAFGNKyLEt
	2FsdmMsSyq4GtnoV3LxhlkReOCm5tPc=
X-MC-Unique: i8juIK0JPfK34o7iLT-K8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA9pnhDjJkKu9XsJM361iVutVqnOrbQiwVvvPf4ytTvBjCHZ5jZGGYS48XQdYT8cNuDhv2yRt8sr1G+AoC0ZSLYqXunb/k1zvSFwodSlT51aUGdpYmcJnpmlZfMv6yWQg+ozEi+OFU1lKZkhI/Q8/+v081TuF3BG+6ZgDONkzE7rV/ue0qt1VbjUrkz7ujkJ8K03BbKOLcRx8hKaQViE3oXzE4d6+fD0abclsG4tHSDlKTc8LgZcmR1WZkvs8XsnhxoVMAgWuXn/fiMKrs5psuyzIObeSnO0PJeq/m7k5Om/HK+0usF2vU2DVK3U4XYa03r9G4FWHcSme59ZvfWUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXFilAsXVY1I7q6k0txm2ejLetW03uIyctVCES+Ti9E=;
 b=ZPfw3erQLEHw7/N751XE1BnLn6nBlQjg447M6hh3ySU+lYKZgKMk0sIHu7duvOVnwidvV9lKtq8SjsoAbz5E+7uUTtLKGLNDM6RPi98J/QTxMEahNnrPe0pO4cTXhESBpQNSbXMepq5oCryCRdQmbHFHI0y71TQCwPmk/CRTXhkKb3ih0iDbsEwQvWhOGLM2okH92HcUyJsr9cDLz0lzFPgo9+PJmbQqf0txSmKRM9Kf/Mw6xz2V1h+DSuyl7vvDQMQrWBQHllwQcK/nwpYQDeyxEcqX9ZydvG3ru0lNu8TAIOITgLrdvRBa78bS14fp3QBiBak6TIsDN7ge7fR2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53a64002-5369-26b9-cd30-119983518cc6@suse.com>
Date: Tue, 31 May 2022 18:05:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/3] xsm: consolidate loading the policy buffer
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531150857.19727-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0072.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e1ab0a0-50da-4e3d-c11f-08da431f6b76
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB30895A7EA836689BC105B562B3DC9@AM5PR04MB3089.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qCtelB7Tiohw/22kGjZ8+F3cHSeRzN3wyAvgJVru3NJOBVVSg8NwfLvoaXA2Rr057UEzql3b79NP8zLFOsjELvfFJ5+6fv0am2U9Yl99TCihGBzKGnXsuyW+PjPM2+0s76+mA+tFAPafIeKCH019YE5Cinzkhf9XT3U9K3lstprAWOeotZdRvXciT6ILcJnYgkZ7lwiSSjjqRPUXLOd/uSG2gTe7YPELMQE9S6XWk6xrX2xQdE7PWx3nCXHH3A55v8di7HONR0DS2mMpvuabvTetEkXrjKZCn5MyDCGxvsz5kx/giBLu2GzjRLTlj78yGRD8TJwAFSBDrDcb4TcG5WTLO1i1pRX8gLKZYm9UHDA84Of29vi1Tl/67bsSirSGoiUsX9V9LoQWqJtPz+H0wySuoFWpDjTNODhBh9aJn23yLFLJtz7lY+HlsJx0MtnQQ9lvYGQYlYNrQaJj2o0itzuTpEYCmXVHW5nMUiRi/uEuXvCkxY08Qje7EA3bzFkCghR5fTz0O6CFRXfRLBZhmtMGI6BNiekHHGTxvRR0XC0hl489oEw3PgV+13eLGtjreyVxlRbKZ5RCMWbGKuCoSNsQHv03zR+knp69rI+A2sWFb4Rmxh/Wd2ipbv+yZJjMmqqVg9pCozVZJn7hRqtj4SltNAKl6C8ZuOoqNreC0g/MAqESGIxpQIUaDoSljie4KDAgAGu8NVE9fFsFu3fvTFi8zoR9O3PmhzYl9GFYQ5TE/IjBNbshdV7+92xe1R8f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(86362001)(2906002)(186003)(2616005)(6506007)(5660300002)(83380400001)(6486002)(31696002)(38100700002)(4326008)(66476007)(8676002)(6512007)(66946007)(66556008)(8936002)(31686004)(53546011)(316002)(6666004)(6916009)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blM1dWl5TytjRVZqSm54MXFjL3c4N1FtRWlwTHR2b3NXdGlyK2lnL3hoZzUx?=
 =?utf-8?B?Z1RoUGtvdysrR25WelhXaWJoTHVWRUdQSktMRlo0bUF6K1VLU1NqNlV5SDVN?=
 =?utf-8?B?WFd1eTB6RGQvSGxhemxUdG85UUNZMW9JdGFYQmpLQiszMERRMC9ScDBHQXpi?=
 =?utf-8?B?K3N1N1BEcG80bEJVUkZsdjcxN3YrUHhmcHk3dnhGTTdEVzBBUk1DTEx6Q3la?=
 =?utf-8?B?bWh1N2R6c05kV3RGb3FWUHRqNXNJeXlDcXVWK2c1SS9GUEJTRHRLSEUzL1du?=
 =?utf-8?B?VnFFZFFzMzl0bjhnMXlrTWRISlljckhZTnpRUUVxaTZBRjFIRFFWQnJrUU5v?=
 =?utf-8?B?MGt4VmZ4SUxHb3NobzRsUmdITldJOVlxWHk1dVhCT0dHbng0d3NaMmVmMDBq?=
 =?utf-8?B?MEtqMEtxUFJzRmR1Mk9XelpKc284WFpyTk83c0dQTXM0QnJUOEtoVXh1VFV0?=
 =?utf-8?B?ZXM4ZlhzQVR0bE1aQ3R2ajFYazFSRVBwenZRS0ViTzRPN2pUVThRQlJES240?=
 =?utf-8?B?QmZCSGpQMnB6cU5rUnpkczQ4ZXB1c1BIRk9CM08rQlNiMkpGR2Vwcm9SZG82?=
 =?utf-8?B?QVpYVUpxNTU4TkVnWWhJTmUvdGc4dEpuSVJnU2JSOXRxaERiMUtsZFk5eWoz?=
 =?utf-8?B?a2dQYVVaNjdOQmMwWk1LMEdhYlMrbGd3OUZCYkhvNUUzTG1LUkE2MXhuaGJ6?=
 =?utf-8?B?QldsZXBEUnBzdnRKWGZUWGo1clZSL3dxd1V2UnY1VEg3MElnKzJjSzlDRkxz?=
 =?utf-8?B?WGJ6T0haSkprLzdEdk9xeFM4RFhjS2Z2ZCs1QmY0U0N1ODlDWXZLWHo4eHVa?=
 =?utf-8?B?YkgwQWtkdXdVM3hYM3JybGd5Y0o5a3RoSWpsc1B1dU95R0xXczR5TEtPanlP?=
 =?utf-8?B?M0VnY2ZKdmF1U1B2Qi8yczRURVNUKy9BbC9saSs5MVpvOTZGOU01OTFmQXVO?=
 =?utf-8?B?SkZGN1RYZFhhaUwvc0ltV1gvc2V5Y1BHNGs2cE1ZNXpZbWFTbGw2T3Z3c0ZE?=
 =?utf-8?B?RnNFdXg3dU04TlNOUGZ5YW1KNkU5QzM0T293N1lwaE9idDhjbUpNZStMTGxS?=
 =?utf-8?B?Q3JtVVhlaDloNThrOHhsSWFHdkI2aEtrSUJlQnFyZ2ZMSVpPSlJ3NXh2dFpv?=
 =?utf-8?B?UnZBc29HQS9vSE5mTnA2RWFLa0J0TnBsV2tvWWZvS3N0WkhHeHB2TlloMkI3?=
 =?utf-8?B?K29sWmN4eHJRV080VjVPMjg5NlZpVXVKTk1pWTVRZG1oZmFVLzVZNWFRb2Vl?=
 =?utf-8?B?NDVNUDRFRmJDdmg2aURWdVpGVTFqQTVKdWJxK0p2SDI0bTJVTUxuUERXZTN6?=
 =?utf-8?B?OTIwUG82aHZBQy9DYkx6NkZKWXJhZ29mcXBHd1FiY1c2dlpmOERIV2VYaVN5?=
 =?utf-8?B?d3ZucS9DZ1AwTEoyNXBsMWJWMjNSbkZBMnBCYnozZnNvWlVYd3AvcXNkalR0?=
 =?utf-8?B?WlErdHl0Umk0RFpaQ21ONW5YUVRISlJMaGRVMzl6NFVoUXRVRFBYS3UyeEtU?=
 =?utf-8?B?V3V4aDhYYXNVcXd1Ti9CZ2JGYzZ2d2FPNVhjQVBFNVgrM2phU2dKK2tWSVpK?=
 =?utf-8?B?SVY3dzIxWVZVRURIYWFGTFBHVmo0TzZjRTNBUHhveERxMGlCOGtVZEJjR3B2?=
 =?utf-8?B?aC9xK2FabjRZQ0tTWVFlcEptNkR6Wnp6UWUwdE1DNEIvKzlQK2hEdGRna0lE?=
 =?utf-8?B?NWZEZVJrTXp6aStMSG1pbUo3R243U3pKdFc2OVlCbnN4TWsyYzdhYUtoYiti?=
 =?utf-8?B?YkhycFZtb2t2eUpmRDZwZjFObDRNQS9pWWszNTZUU2hMSVphaEpMVEZRdlRX?=
 =?utf-8?B?VWxYcXJ6NDVtVThGSlpCRTllYXZCQjNGcEhGelBJWUdsWk9MQ3JnR1FjWEVB?=
 =?utf-8?B?VzhadGdJd01mZ3psOGxVMVdGQ0V1ZnBzQmxXczR5dW5Ldy92a0g5SlA0RWFu?=
 =?utf-8?B?K0x5aWJTMHBXYmEwM3V5SHpLbjN2TDUzNWt2SU1FanFyNlBQMUxIdWQ4MEZh?=
 =?utf-8?B?RHYxcUc0dENDZTJQbnYzWXhwZTNjdTYyZFZKQjcwdXFmZllrRlBnVGNxMlZO?=
 =?utf-8?B?MFU4TzhBclRRald5MXpOWEJhSm5aT3lLRUpXSGZ5WjJJdnRxbmVkR1ZmRDVF?=
 =?utf-8?B?OGszNG0zLzZweDA3OVo3bXdsNnpDOHROWlI1U1B5MnZiSWdUSXQ3MkVSdlBR?=
 =?utf-8?B?eG5vMGtsYjY3L2MzSmFkY04xN0lkNU43dCtLd0tUZjhEcWV6VEh6eDlJS0I1?=
 =?utf-8?B?dloyZkZRQVJVRmdWNTU5anB5cFBvSTFCNVBpdHNZWlpGMDNNSmsvM1loTnNs?=
 =?utf-8?B?K2psMGRvR3lpQjBTYU1ZTklJTFNLYWhZa0RJWEV3Sk45VXgvQ0JQdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1ab0a0-50da-4e3d-c11f-08da431f6b76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 16:05:45.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UL2NSFa+BU5N2VOxQ0zK8G3/xmfwiMs+wKoHovdShPZXCgfRxj9hgmcVc0zBzBVT/lKCCuyQOohfg5Qbn1pow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

On 31.05.2022 17:08, Daniel P. Smith wrote:
> Previously, initializing the policy buffer was split between two functions,
> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
> the policy from boot modules and the former for falling back to built-in policy.
> 
> This patch moves all policy buffer initialization logic under the
> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
> message is printed for every error condition that may occur in the functions.
> With all policy buffer init contained and only called when the policy buffer
> must be populated, the respective xsm_{mb,dt}_init() functions will panic if an
> error occurs attempting to populate the policy buffer.

"flask=late" is also a mode where, afaict, no policy is required. I can't,
however, see how you're taking care of that (but maybe I'm overlooking
something); inspecting flask_bootparam in generic XSM code would actually
be a layering violation.

> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -775,7 +775,7 @@ int xsm_multiboot_init(
>      unsigned long *module_map, const multiboot_info_t *mbi);
>  int xsm_multiboot_policy_init(
>      unsigned long *module_map, const multiboot_info_t *mbi,
> -    void **policy_buffer, size_t *policy_size);
> +    const unsigned char *policy_buffer[], size_t *policy_size);

I don't think we're dealing with an array here, so const unsigned char **
would seem the more correct representation to me.

Also - what about the DT counterpart function?

Jan


