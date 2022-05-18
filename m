Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387252B69A
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331868.555480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGcO-00036D-HB; Wed, 18 May 2022 10:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331868.555480; Wed, 18 May 2022 10:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGcO-00033k-DW; Wed, 18 May 2022 10:09:24 +0000
Received: by outflank-mailman (input) for mailman id 331868;
 Wed, 18 May 2022 10:09:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGcM-00033e-Fy
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:09:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ed934e-d692-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:09:21 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-phaPU4NtMpioekGm-fc6_A-1; Wed, 18 May 2022 12:09:19 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 10:09:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:09:17 +0000
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
X-Inumbo-ID: 95ed934e-d692-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652868561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wkgZtXx6a+UcBAE5MEq2ynW+KS4zJPKx1gWljVIDucg=;
	b=XMOsu7uF/8/Z4CKKj7EmNBGfQGdPO/ZyIF0/c/3JIa9gEMWrIHUVWUWJdMlK0POnKHoTe/
	QbJc9exbm3iCapPvGMvNQCmODSHr8uLJ9qkQBIkEYr7ZKIB6W4rcsZnDer5F3MGSKoNX9l
	UGqGgt9tcJ0w9XGNXYv59yqsfWlBdfA=
X-MC-Unique: phaPU4NtMpioekGm-fc6_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ydc5AAVORM+XvrV149e1kwPzF5adXGNH+6IdIWWbFPjgtMIyyAdklrWuIsAjXHADDVFcfk32q1k47FOx2LX6LW0wFp24P8Iy6hGkMas6qfJZKXnQL3r9XxFJX7SHxvVpH44GghXz0NmuvDtDnniamz+/dTlEoyZ2ESFiIdJJ2tVbG8ougq+ng6ofD6QB0InnCDdi9k/I6NioMDoK4Qsaqj+orpnYsfCR4ZvlVpBGgImjRPA1l9kSDGx4/kquannNBFbC7DgsqsQMDXAB5atBlPlEshvB2C3bEqlK33jdWKrEt/zd/fYeBWdhv0SrWBpZ18GrbWjHsBITYwBHWEXEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkgZtXx6a+UcBAE5MEq2ynW+KS4zJPKx1gWljVIDucg=;
 b=cHdR8+Od/aciy5p5xX1nuucMZk1qpdeDIRCPuiBx9OPolzZwbFxhGB4Bxr7Hjx3heCK0jD66aomhwRl2Yhxr56NauW8yoSD4Fcw7XtfcBzwJNRsfO9UX8vU9uLFVdyblrNJbblh68BKIQOSBhQW03bCfpupiBg329CQn0yjn9f8A2I3e7UTBEqpcBQ2a+4iHAnLDGOdVXqpCf0/EzFeuHl0dSE7BZdAIMhezYAVshUU52DqW9XoI7fxt9jFSbey9iIywi/0uREnNTYX/y/Q5EukMzZBJJhln8N1bNsxJ96z2kBQvlWXrQg0Y+4Yxagn/t8//L5BKYBBf5QxyKuVbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17f8215c-7b8e-1c10-350b-21a9dec64d82@suse.com>
Date: Wed, 18 May 2022 12:09:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Liu <wl@xen.org>, Community Manager
 <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <6b5362c8-2a41-d2c8-b25e-2e9c421d6da2@suse.com>
 <AS8PR08MB799171E2FE25B734B6331AFB92D19@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799171E2FE25B734B6331AFB92D19@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 815bc73f-eb54-41e8-53d3-08da38b6781d
X-MS-TrafficTypeDiagnostic: DB9PR04MB8139:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB813929687D09D4AF8A2B55B3B3D19@DB9PR04MB8139.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bq6AaOy7U0VqHZY2eK9aGbtIDaILKLOLA2fNUwWsxyQrwfrzdqAwBB582YjKtkpbGj1oAfAsk+70SFBmSKC0JzGH/x1k0GnLzd+0szWRTx8zoazxuWUtbYfvxF/OMnMVSta+J7CfjRlO0jbi2s4YGpcZF/PJT9k6N/zqBh2n8xGuwBs7ACEHqe1DQgOF1FrlLTMgn/yP+rIzBAHVajhJjeqIDl7BAt7nndiw25FjiUBbtMyhZzPuMGxhkAZ8L49uNL+AEHSbZNhYK15RDe4cndgE1cNuMLtLBVwhrDUO8aOBZ9DW5bj3QQmqGSngk21uje1q30nmNUdSNKZWQhQ5SkBRIx15+Vo6hoDcPjAsgNIM5y7f8FoAyQQqTMGSF4iQYHCGzAnK3Ag4DoMrr90cRdnLqyWgqhfpPVab9AXgWfThg0gLUOzcpuXTVN2I/3pNFiZFf/zSQpo/9/gO5lUO/nx1iMWqXMZIsJWMYx0jh74G6FIOhmn0q6dhtXjCUArU/dPtRyC6m83eWdJn2ES+CoGN8X6Ag+1qROB+ODnXj9ODQJ+voU2ItxB9VQU08Mh//hFg5MiMGFVFjL81Vrhoadm/QdXs1H5EZUFIF29kUI7eLnS+qdvq7GR422NUQlP881CUvb3qxMO3glqlBLcmP3EPKzeQK/hU7c3rBEeEP2olPEMw7vHLdLxtkt6zKZmnmqGPOuY7DJm/NGa8KSKtPycmtJoObr3z39Z1UE8QXa+FgkSmbS6rAmmWy/Ga2Ta6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(4326008)(66556008)(66946007)(2616005)(31696002)(54906003)(86362001)(38100700002)(508600001)(66476007)(6916009)(26005)(53546011)(6512007)(6486002)(8936002)(83380400001)(36756003)(31686004)(5660300002)(2906002)(4744005)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNhSmpWS2U5d2Y1VEsrVjBNWE5yYnUyUEpqcHl0Zm5IMkNWNHFJTlhIVEZQ?=
 =?utf-8?B?RnFBMlhkcHZmbDlzZE5pUEZhRUl6WVpYTkVJelI1R1kvV3hWV0FBcjNLYmZq?=
 =?utf-8?B?WUorVDRCVXg4VW1mcTZuUTdGQ0FKUWk3VkF3RzlHcnpoWWRJdStoTWRwUHhW?=
 =?utf-8?B?MDJDeE1zbExlTHRVdm8ybkx3anNVcVlZN1FJRTUzc244TUE2SWEyNWJNWWtN?=
 =?utf-8?B?cStQTFVscVA4MmV5aFJaQ1JWUGtkTVBjTmM0OG9Sb0hFdFpkbHhmWitkR0Jk?=
 =?utf-8?B?TWs1aS9pd3VSMHRzSUxwaXVLNi9CbWlPM2gxQU55L08xL1NyS0x2NGFoZnFl?=
 =?utf-8?B?bmxVa0xMRUNKOHE3WlRoT3BUMFBRL1ZZOFV1TVc2RU1xN015d2FNOUpQSUt4?=
 =?utf-8?B?eHJ2MDc2cm5NOTYyZWFOV1RydWc1VGo1ZTNCWmtRZkVUTzkwcDdvaloyL0Zi?=
 =?utf-8?B?WEcxNzlvb1lkWmt1aWlxam92NGdFblphVGN3YzRlMkQyQzFTbm9vdXo5Q1lH?=
 =?utf-8?B?UWFKZElYQlh2NlhPbkdUUE5hWXVYb1dYMXRUeExxME4yK2hiUzlnQzNhSmtS?=
 =?utf-8?B?WGM0Qk5zdmFQN1dIdy9raVcwa25SazZXS2czUERXTkxZY2I4MExQWnFsOUo3?=
 =?utf-8?B?ZVBQZEZiVHFrTWpCUStmK09LYitVRktTTHFzbjRQRGJGYm5RbXhvWWd1REVt?=
 =?utf-8?B?RFk2OVh2NW9CRVNqeSt3YkFXS3Bhem1xaExyd0svSXFCbGRrNmJpQWZLYkll?=
 =?utf-8?B?K2tTL1FTaGtscmpBMll1WFlqRmV5TFhRQkxjUjBucmgwNitUUXFVV0xVYlZx?=
 =?utf-8?B?VjBTb0VqdnV1TG56THRLL3lJSTIzcVVRQytlN0QvUkpMWloydEZ4M293czBm?=
 =?utf-8?B?bFZITmdLYnRjcC96MUFYZEt4YXdkdFc0RmNZYThEM3BGM04zVWhBclhpMjJH?=
 =?utf-8?B?NXV3Qk5LNUhTRUdDWDQ3M3FpRWxkVWc2OTV2V2RLSW9WRmhaQW9lMEd0WWIz?=
 =?utf-8?B?Ymx2T0luY2tnWHVOYXpFWElJSWJnUEdTanlYSGgzTjlIV010Vld2Mm9xdndh?=
 =?utf-8?B?VUhiQTNOdG0wK1NCUFUydUt3WjYrYUhHOG5waWJrekM3NDhJZGVMZmYvVzdF?=
 =?utf-8?B?SnIrVW5hTENXYVJzUjR1Q0ozRjlJYkx0VDJhZ1d5OFBka0d6OVpKeW01dytZ?=
 =?utf-8?B?NjAyTGt2WkkzbFcyZXYwMkY2NUtBUzJmeVVGYlQ5eEgyMjc2SklFdkM2cGV4?=
 =?utf-8?B?SGNiOVRRajhGaEprbnBIVndBT1JGTHdrajhOZE9Yb010R1JadEJFcGgyQ1Ax?=
 =?utf-8?B?QktRaVI2OXZlMFZYQ0xmeXk3Kzd4bklLT2tDaDh1U2NOQUJGYWRmY3p4R3o4?=
 =?utf-8?B?VEZYa2pjSUQxUVdKZVkxTlB0b1BoVXlNd1BsWVcwRVBlbHFJdi9HOWcwU1My?=
 =?utf-8?B?UXNITFZMZWZXVi9QT1E4SkJZM1dpVFJ3ZVVCakhlbmhiMTR1UnlzSGZrVytE?=
 =?utf-8?B?dkpHYzBaVjMvKzNTQ1c2dnA3cjl4ek9XTGpWelV0NmlVaWhUYXBIRVNrRWow?=
 =?utf-8?B?b2hjVDRocXFZdVdpM2Y5Z1hnWWcvK2ZhWUROSHRDaDZWdUNCK3ZHMEtDa0Yw?=
 =?utf-8?B?K0Jsa3Z3TWkranVkK3ZpT2F5SisyNUNFSkZnK3RBaG1uQjlYeXhXMmJzdmlP?=
 =?utf-8?B?cElmRkRzMzdraHU4Y1JDaHRBbzBtWUtWNSsya0trWDM0dWM4NEFwSlFLR1Ux?=
 =?utf-8?B?b3o4anNiKzlINGhyTjZDZ2Y5WEMybGRCczB3QkJaRGFDdzlvSVArck05NUk5?=
 =?utf-8?B?bmw1V21kWVovUXQ0REhSRmRpRyt0enh2aUd5TVVHemRuWFJGQzBxNXZBcVZi?=
 =?utf-8?B?aVI0cFBjdS9xcE9DblVkTDZ2YVozQWYycnREZEtXQjFDOFp4amZYNGVmOGw3?=
 =?utf-8?B?S1M3L0lmOEpwNGlXQ2V1RGoybWs1bnh0b05mSlhiamtldWJoUmZ0b0ptZHh5?=
 =?utf-8?B?TUFGcXBiNUdNSlE5WE01L0dyNGE4U3pibkw2T3hJaVVxVnlEdVFtM0VYUHg4?=
 =?utf-8?B?R0cxNUtWNmFPV3Rtc3gyTllzbUdEWG9oNi9WZkliWXR3R0NEUDRBMUNJSDNL?=
 =?utf-8?B?K3g3RDIyYjZGZ1RKZ0QrUTVoUzkwL1lWc3NRSXI5OUxVZlY2N3VIbEJYczlU?=
 =?utf-8?B?WFZUbHRhQXpSWEVFdDhGMnM2c2NyRlZwVk1kS1BVNGJTbVJNR1JRYVJxRnc4?=
 =?utf-8?B?US9vbFpDc3NCWGgxQWFUMkxRblRDclplTjJWcGs5YTlieHEzZ1NVUWtsenJQ?=
 =?utf-8?B?VmtRTUVPcU9BNnRLRy9qZ3ZoMzRETGZjZEVwM3NvWGJKTGRIYWcwUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815bc73f-eb54-41e8-53d3-08da38b6781d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:09:17.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTYK+GpHcLkEeMsFgDUIpmoN2W1kvKhUoHUqKS20J5cXb+hO89aGI/PbeUSf71H/EM3HugTdQULYlvRf4msieA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139

On 18.05.2022 11:51, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 17.05.2022 17:31, Roger Pau Monne wrote:
>>> Roger Pau Monne (3):
>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of
>> SPEC_CTRL
>>>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
>>
>> FTAOD, while besides a missing ack for ...
>>
>>>  CHANGELOG.md                                |   3 +
>>
>> ... this addition the series would now look to be ready to go in,
>> I'd like to have some form of confirmation by you, Andrew, that
>> you now view this as meeting the comments you gave on an earlier
>> version.
> 
> Not completely sure if I am proper to do that but for the CHANGELOG.md
> change:

Well, no-one except you actually can ack changes to this file, as per
./MAINTAINERS.

> Acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks.

Jan


