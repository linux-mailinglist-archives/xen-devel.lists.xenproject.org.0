Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C0493B1B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258855.446284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB3A-0005ZM-Ru; Wed, 19 Jan 2022 13:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258855.446284; Wed, 19 Jan 2022 13:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB3A-0005WW-OS; Wed, 19 Jan 2022 13:30:56 +0000
Received: by outflank-mailman (input) for mailman id 258855;
 Wed, 19 Jan 2022 13:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAB39-0005WQ-77
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:30:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b9eb3b-792c-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 14:30:54 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13--e8eXu-vP26_6m-DtWlc-g-1; Wed, 19 Jan 2022 14:30:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6953.eurprd04.prod.outlook.com (2603:10a6:10:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 13:30:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 13:30:50 +0000
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
X-Inumbo-ID: 06b9eb3b-792c-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642599053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEyUfoIuHdydQaGGNuOQwpqGavMjO7GL7rt/7KqQCEo=;
	b=BPIZ0g5IeWY9lxm+iMhzBiD8XGyDJXkgg5XngSzeAe4Z1AqUJStC2KuVqUPFFmUdlMFTdz
	vmHetmdhMeIfMCkDmA5vpDwvsAA8D87ycnfD6z2cBiEdKIW/vhi1SMsFBHl9gYElYOrGmS
	IsoYisLo+S2HQXiGGQPuaOdaNG3+OCw=
X-MC-Unique: -e8eXu-vP26_6m-DtWlc-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0G6OSwJ341hp7rshcaSX2XaEV7HRGXBGFPGrG/f0hZKLO/MemlQhSP3K2Nue21Sgm2JuQa/rCL/ontTU+SO93H8L62AkSTcLHnjDG1b4QtQkj3pLuLnYzZdSK/MUATJjXNjPmd9QkNdi2d147aV+APZdPubYoli4N1r05rBeKm/i2d13vNpJuLa64dD1A+V0nAEQWrHG/cAyqaY6YG63RUtpkkgmG6jZ0KZQ9LyF/rr8WejGQW0fsQDmkxeAMi00GSmwFoB8YddSqBjv8Z7VV8+ylQFR2+QAE1/H5QYuW1vVuLQ5WWGVF2Vygy4UgUmA6WvKRfd6AIQOoZZYeYZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEyUfoIuHdydQaGGNuOQwpqGavMjO7GL7rt/7KqQCEo=;
 b=F2g2k6cULL/6nuPeoJIh7v6qShsM5K+G/mSM0JiVDY224MWHRsXDk/hKUmFTzs+ducnK5pPuhE4zE3VWrDCSqNmYmmVYAOo5olJFgGocVFs8wr5GHggRlZ7an/7njwmDNyK78ygt4SbX7UAQ9nFXuTBFxFnErgbEY/C2Cmd5Ce5to8DdNJK7vYXsPM+D9TpOOhpW3QqK7wRjZR7yjytjryJDH7f2P9/zLasZsAPN4r83QtF8o1sam0gLVGzfqSmyjwHZpuJKQS9bL328p1ojGoezKExOVWiEsCMpZiZ/LL8kAVzS0Tv2SezVGp2Blin9BhHqvn+v40Rpx76ugFH3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7aec2bdf-efcd-2b26-5c85-80b3226cf1a0@suse.com>
Date: Wed, 19 Jan 2022 14:30:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] x86/msr: Split MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117183415.11150-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0106.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4add454f-7fe6-4dfc-d18a-08d9db4fe8ac
X-MS-TrafficTypeDiagnostic: DB8PR04MB6953:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6953E2772FCA93007CCA794BB3599@DB8PR04MB6953.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IC6Y0yTUqT7D7pXbTdiGWra7zspvqmeCtpEJiqcjQqgKF6deyKKfvkeenE9MdlH9576IRg6wt8O0mhiMIuuayEzJk55K7Ducpw6gQknJqjWrEcQXRfT0tn/FjRAPEEUqpZTpbbBiGeMonhF53HhSkasG7fAelh1l4Y/UnAdslZ9/r2CA7bOViYQkbWv3fieJIvmEGAwsI2KQoUQhhwfBoJMqwE5kOiBPQ/E700IZbgWdAg+E3mlJs4OHxkMPt6y5qM0+vlA7QAPiYtkeEnKSMW6wHW2slsq5z17j8JnMpTl19SoBVLMJrexqahSkUBrGKXTZIgtxsXafRz5xa8BslvMhjfpJJNL2YFg+sfDVi8mPSzxuac84UsFlo9VOgOc0zB2Wlh9FEEMG6fPkHWjNiIp4gYacjZTAn6bE85N9VTxPZGxb8GkcdTu6yJOiQX9//GgQMF9Cd+EnJdt0HMWIB9yUQRmCMfWW17OSyDSOOChu9zWfzMpxLEsKJllV/Up95baYKZKDFBUt8Jn1VjHDBaA+otbgCaI1obKm2NaUSOA/pSsxxTUGzKXBKRQyVEgAwP4h97JGqqpfX3EhV6vhvnVWLzrhltQeZxi/m6hMjJANY0R8HFu/MT8uXVfHdLNrlk9ZMG1dur0fIReX3NmkedAS02c8cXsN1H5airzFWs44+aYdBcXAL3fRWxaIwlt26FvdLm/37IlKzCXlwObFaMLEHGDhlQf3cbiYKyvs0yfKNL+d1Qwn3SCIT8SxJiiX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(8936002)(26005)(8676002)(53546011)(6506007)(2906002)(6486002)(83380400001)(36756003)(31686004)(6512007)(4744005)(5660300002)(31696002)(2616005)(66556008)(66476007)(66946007)(86362001)(54906003)(316002)(38100700002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnBidnlUWHRmckNmM3pRT3FlMzhrRDVpZ0JCM212NUJJYnVMQ2pPekprVk5F?=
 =?utf-8?B?NHJUbmw4UTFFaXNpLzhRdEtRUCtBU1BydUFNZkprbnllU2xlZ1ZuSy8vV3oy?=
 =?utf-8?B?RVRPaU5qaEh3YWlqN3I2MFVKdS9LblJzUVAwMEU2N25HZ0pPWFZ2TVlIY2Ry?=
 =?utf-8?B?dWxYNSsxK0JuMWRTMlVjdmFtd2RDSUJtWHlvYnltY3ZKcHVibDVmNHhEdDla?=
 =?utf-8?B?UVhmc0pCdGYrdnlPN3A4WVVZekNFaHg1YVdCcng4Z28wem5kdm10VjltN3Vm?=
 =?utf-8?B?YWJzMUFzT3ZmTUNnVkdoVlVnamVxaU5qVDRyampjcXdPazFwSzFvRkp3YVV5?=
 =?utf-8?B?cWJBNzAvRzBGeWYzNGRab1VBSDg4VGtXbjMwOE9EWnMybFlrRjJGYVByNGpX?=
 =?utf-8?B?bHZ3RCtOWkZvQ0NvZVZxTXovZ3g2OEdFUm1rVnFLVU5aZzMrWnhsUHJ5ZTBO?=
 =?utf-8?B?Q3lPVkZ0QWk1QUc2TVQ3anYzNzhGRGErd3B0Mkk1RzJmVndkY3M0Vy80dHNj?=
 =?utf-8?B?VlN3TW9uMGtFNzBncWxvOXdjbUdjUEh2c0dDWWVVMDh4TzZhemNpMkxicG9q?=
 =?utf-8?B?MjRDSnNyZnhKUE5GZUNYR2haaVhaUnUyQVVlbmsrMXF2MmtsVVhEeWpkRHFW?=
 =?utf-8?B?emNveGlZdWNEV0FwTnI3SjR2MHlCUTJtRGNBN21kU2FlQjNKQ2ZKRW0zTzJv?=
 =?utf-8?B?cUJWUWZ2Y2E2TDNYVzBpYjNLRno2RkV1VWFCeks5dTFKZ0hKN0ltWjF0dEFa?=
 =?utf-8?B?ZmtsTmVpc0dkbnlVVFd4K2krMi9NUzR6eFVqNjBEd2V2NkR5amVXWVllaHJE?=
 =?utf-8?B?ck5CWVlaTWpjbUdTcEtRVUZxSHJ1MmZJU2NWSVFwcjFKZkg1N0h5SGZIbjlD?=
 =?utf-8?B?Q0srOC8vWXJBUlVQeWdReEJFWjY5ejBwaDg3QWR5MzEwRUpTVUprQjNpbi90?=
 =?utf-8?B?NkhNM2kwK0xYOEdocndVRmpONVNPbVNjNzZUeGxkSHJPQUxIRndCOElkSTc5?=
 =?utf-8?B?NUJEZFFuZHJzSXRsUjN4QktkMk9vVlEzZzRGMnRaeWNxZlVoU3ZETTF0N3dl?=
 =?utf-8?B?bm4yTVlCSURNaTZEdHAyaEFmWWI2S2hNTHFnL2Y0OWhyWmFhdXRnSHhtallz?=
 =?utf-8?B?ZWdUVmtwa20yY095eEplYjBBRDZydWVSbjJ0Q3BqdXlSdHVDWk9MWEFHNndm?=
 =?utf-8?B?YW5sV3duOWtnTE00RzlQR1QxUnlhM2lmZ0EyYWFGM1RiSERXeEljT09WNjFD?=
 =?utf-8?B?NnZJRk53eS9nWmxtdEJId2w2N3IwR3Y5UU05dU9MVlFyOXVhbnh3K25ZQXVF?=
 =?utf-8?B?V2c1TU1rRkNMRTliZkE0TjJnTFZDeGo4VG1IUXRyZHlkNnlFSGwxell6TUYx?=
 =?utf-8?B?UFNWSFJBMTZ0U2FaSkdCNGM5d2pNYmd0VDBhaHRVN1FGZVBFWmhJQmNxWElB?=
 =?utf-8?B?YVRib29mL292QWdLdExoQ3FQQXU1VzVpQ1BiMzAvM08zZW1MQm4wTVYvL01p?=
 =?utf-8?B?SFl6Mm5vVzcweGpCM20weGVVbUZWaG5BM3VqSjNrT2FJTnpDTHhQcHRFK1Rx?=
 =?utf-8?B?bTNSWTZXRHJqUTVBbGZIVUljRHFQU0dGeDNMNnMvVmxWVTZDUU44UzNCNzVS?=
 =?utf-8?B?VzlKcHdOdlJxOUJIUjgzbkJxSSs2bmpVTEM0WGdpTERhZmZmR29JM3JZeFVw?=
 =?utf-8?B?YXlISFlHUnNrSWsrQ0ZZQUNqQlRJNWVqM1RVdTB5d2ZTdEcwZEljZDR0cVdv?=
 =?utf-8?B?NkxXS0pJUXVlbm4rdVoyVEpjSjZuNkxwQkNJNUVwUVdTTlJJYXl3MHJWcnhl?=
 =?utf-8?B?TTZKQXZVMW9zM0RWTHBFMXJOKzdOMStMRkY3L0taK1Vwb1kxNmRUUVNpL3lx?=
 =?utf-8?B?eG12djZOMmtaRW1BNzVFOXRaQ1F3Z0xaK3ovQjFPZ1VrQjg5bUJ1WmNLTmE5?=
 =?utf-8?B?U1d2RWdkTkc3T0RHenFIa1BoR0czaGpTak91bFVBbld6bXRVQ3J1cUVRdGFY?=
 =?utf-8?B?dVJoenlabUk5dGlieHB4UGYraUdLNzJ4cDQzaTFUbnloV0t4N0ZTRWR4d3pk?=
 =?utf-8?B?SHRTWjJkT0I2Ulp1eTQyM0syb3VRRWhTSDh5QW1vclRJY3lwWGI0dkczd0FS?=
 =?utf-8?B?Zjl4MU9zNmRlc1FIV3FpdmkydXZvZVc0eXh3MlZ6TFpLbmhVb3ZuZ1FmSm43?=
 =?utf-8?Q?tVbrSxWnCbZOdpcPOXp1MgA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add454f-7fe6-4dfc-d18a-08d9db4fe8ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:30:50.4104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06tJhLPkYauMKQtJrW//dS61sDbFnDEoHe07v8hpU1JMZ7GKsDvkPyVGA8n/U+KnYdo0QpJEXBdb1pMS7RK+Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6953

On 17.01.2022 19:34, Andrew Cooper wrote:
> In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
> MSR_SPEC_CTRL handling into the new {get,set}_reg() infrastructure.
> 
> Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
> The SVM path is currently unreachable because of the CPUID policy.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


