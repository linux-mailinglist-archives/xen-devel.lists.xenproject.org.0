Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F153FD5F8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176121.320568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM0E-0007ZY-TR; Wed, 01 Sep 2021 08:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176121.320568; Wed, 01 Sep 2021 08:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM0E-0007XF-PS; Wed, 01 Sep 2021 08:53:50 +0000
Received: by outflank-mailman (input) for mailman id 176121;
 Wed, 01 Sep 2021 08:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLM0D-0007X7-4U
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:53:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dc88f39-720a-4c56-b075-d83fc9c3a439;
 Wed, 01 Sep 2021 08:53:48 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-39mDbc8ZN2C-TWNKzoD8Lg-1;
 Wed, 01 Sep 2021 10:53:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:53:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:53:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 08:53:44 +0000
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
X-Inumbo-ID: 2dc88f39-720a-4c56-b075-d83fc9c3a439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630486427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQb3lb36j6E87dv80nGPY//1dizzbRcvuL1J6kgjH38=;
	b=ex3eMQDxbRNo8vHqSXxuYGJrsyLvj1Mmh/7rGu7y8Y4hoAvcu6tNUJtI1ygKG44F+IrwG8
	l0rG5kPxlLdse9sLk7XWeyT4fSiWsYqvcX0jNBJuWlrAsSRoCy4wsYGjgOrd/Y56lrlBoz
	yAbFb2kMx8sIxpSQF6b5e1OwiogCuKE=
X-MC-Unique: 39mDbc8ZN2C-TWNKzoD8Lg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4dzlHzFyys8qyCTkFUK+XwBQUjgKRHIuqIzhW0K852SqRbf3m6ZSLyUMMzMyDmdfHTa29FKOAG+n9kcnuYfFp4Tqq6o9r9eABKducresqVyOQ29egu4tnzh2NmltVRY+FRhFlL+aFkYPhhBWC1Z17mdeLic7yBpeNXGVZJaAyckg/4aG/H5cLAcixNLtOe5vvgShxcqyzjSvIe2vSpEA5hdjKVBmCIrBvnrVkoxUAL6BlPDyMaSqh4gT/SKQYyYOXApRu22EaD6sg+0OYdVA9yjsOgxoxhcduUjC/jmRKxidFbq5rjPibfY2OqhiCIZhDRO5t4TSc8w3L4mH2YyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQb3lb36j6E87dv80nGPY//1dizzbRcvuL1J6kgjH38=;
 b=iLXVU6OnweTr+7K1JVNjH7p0ti4CoxZhkMYzaKVB175QQqURLT+/Vy7DQTsF3MKFSFMSgRHp6ApMkeJG6/M4/j33J5FGf8ykaDw8gwlbqO/wL5zUDmj4+5QXdF2ZUMvRKLVBlHrhTBEtobJ8Ralcu30OHWzDOIVy2V3hJeaGOqagZn2Vl7hIPdKLvopxISIvNMq7FQbjbBdGJitFlPWd3i9HBMiOjm+aT30tts5Ipq9Y0yn0+EBV3lxwGuPkHe94BjyiJBm5ECjZ2r1wHwSxJqHSAE/+X5phJoWFk/l59rFs3wvcInwHjT/oxRNMqAuzDzMCZ8l2isNy2Inx2ZujJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
 <9FDBB4B2-9025-4F75-BDFC-0BECBBBEB7E2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <175ce359-6ec5-6847-ed76-9aeb51705fe7@suse.com>
Date: Wed, 1 Sep 2021 10:53:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9FDBB4B2-9025-4F75-BDFC-0BECBBBEB7E2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abe0983b-96a9-4a1f-b57e-08d96d260140
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46070313F34A8270A2E202DAB3CD9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iLrw0glNYC6MoVr7R7vA/7Qj7zjZmcMGQDOfqEZlsrrneW8Dzbm4eFqvndLAC9HDQKT1uSJEWtWqjFE78oOfEnicnhjxL10ZgFq/aJteUNhkfYLgqPXBP9jjbHKKIDFDMW7zIYzQ9npRXz1ByvmszOrnml4lPTErP0bPK3Kwkx6ojSzF6SYSnVcJBouSb3nLTF2Wiksdkd+kwJ378QqJBSAsqbGTa519rKup8V0ln+PyICLnCXkfJEr68TvM/VJ9asUU9DZLiCrr2HA4uqjVxnhqzOnkX5Q6sc8V3MUDKqDHm3AwUOcfgxw1KqAFGRnyRUVofeDaxmNvvP8KdBusMBYtdJ1m8ekLfiyN+IAbaBKPN1PYn+RkzR48V0TFHYGxvlYVv83Ihr0nSbjQXbVU2Uu5n8FszFYywM67mRTfeYgsakgf3h+jqX1/XTW9WmSVh4AiBtoDxKw0mFeJu6TqzbRrED7h/NdFdSUyiywVwd3ARpTQGuvKFeoFL9Jp9SUJOkMtUoCXAld1olY1KZLxx9e7Zf0fV14uDo7XupKjI6RzdFuMnYxF0JcTRwh/jQhXcFcItBCa4Q7ZZTEuS85zahvvYDXxlR6bWYfzMoyq6OSc9Vw3GKJsaWZ7S0ttGZgZ8eUxfolY8AHkZbJtz7/P1zhicHCV+JRV1+W4+xMaqDBe06FWFCNZ9lRJINbOr+r73U0pM9r8WDGx11gEqRCMukemZVDoO8cANs8t0XRnk8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(5660300002)(4326008)(2616005)(478600001)(86362001)(38100700002)(6916009)(186003)(31696002)(26005)(53546011)(36756003)(16576012)(956004)(66556008)(8936002)(54906003)(6486002)(2906002)(8676002)(66476007)(31686004)(66946007)(83380400001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTRwNVVJOGdBSGp1Ykczd2NzZ2d5OFd2cG5TTzFVQ3Blbnlrc3NNbHY4dzM2?=
 =?utf-8?B?R2hwR2orWVk3ZWJzc3pkVFN1MWswU2hvc2ZXaGc3dEVPVXNxMS9GTVNuQ3ll?=
 =?utf-8?B?NVNlY2tONEduWFloWFBEcHprL1pFTUtQaFA4bTBSbFFYRjZ5UDJEM05nOWRN?=
 =?utf-8?B?SFJuNnI5WXlqek1jSXVkOXNBNS9ZYm5UMjNWZ1h1dTRKTVJQelFGMEhVT3RL?=
 =?utf-8?B?ZGZkN294RXhyQWtQTjJpc3EwRUZNVFNPSnNoSksxaFhoMFBrTm1XaUJYeGFh?=
 =?utf-8?B?MElBTnRYaFU5SEZNUml0ZUswZWNlTEwzVTZta1EzOTJkWXhxRDVHYjNxTUV3?=
 =?utf-8?B?UXE1NEFrYVdFQ3hGV2UxTzJSb3o3RllGeEl6MW0zSGliTjA1OEdOOEdmSVRU?=
 =?utf-8?B?eDZHYSt5SU5UVm5QTXZGZG56K2JQQ1ZWZEdWWGlYUUlKZzJGSDZ5MTlreEc3?=
 =?utf-8?B?eGZuWFR2ZXUwZytWMHFTL0Yxc1JiakNxOE9ubEZSN2lnMzVrRVFMOTQrK3Jk?=
 =?utf-8?B?WGc5Tm5hTGFmL24xMXQ3eHRmSWY3eGMzSVVhcDBZMXNpMmpBblNxUUE2clV5?=
 =?utf-8?B?QzNRRjZUZnJNSWZkeGZFVEZnRkxXa0RTTVhOMVBSQnNwNklNWjJGSnNHV3Vu?=
 =?utf-8?B?bnp1R1hXTkVwR1drV0ZTZzA1OW44enBSeGdTU0sxYXptbDBZeEplVjZ4L09x?=
 =?utf-8?B?M0hkRkNHUlV3TG93aGNCVnk2T1Ntdk1sd1ljS2N5eFZvNkFHN0hqZ1lVOUFC?=
 =?utf-8?B?OWd0MTBKYXJGMjFib05XY2ViUWkvbXFnbjJWK0VIeWlVVXJnYmJrN0RTQVRO?=
 =?utf-8?B?WXN2ZG1rVWxGODBlOGhzNXBJME5SZFIzY2FUMHdsS3h3LzNydWVhVjlpY3Jo?=
 =?utf-8?B?SFlOcm90ekFKVUl2Z25EYjNxUFlUaTIwM1ZnakF3WUFNbFNaUzJhNnBBV09R?=
 =?utf-8?B?cy9rVE05VVM4bmYrU2VZWUVWdFFiZk1kVGhvZ2RQb3FMNzJrdGhNejBqQUxs?=
 =?utf-8?B?OHRlT3BTaitNSm9IZGIzOHcrVGM3ais5Z0pWWVFjQXFtM09TTDU0cUsvMUlT?=
 =?utf-8?B?WEhwU1NtdWNCVXJnS05uaEsxOUZtRXZaa1ZWV1BLaU9na3g5dnJGMElwa2o0?=
 =?utf-8?B?S01Ucm5KKzNSNE9TQ0hBb2dWSUJpamt4UExSMlNWV2VDdHFhTERacnFRZ2Z3?=
 =?utf-8?B?ZEsvMmZaclljZVFyU3FsN0ZQREwwdEI2SHNVUXdVTXNmOUdwaGt4VmY3Mk1H?=
 =?utf-8?B?OFhpVzJENWxFTW04QU0rL2RCNXJraExyZVFsZmRPcmVua0t6REhsb1VPTjhC?=
 =?utf-8?B?aFZGZnZUL2VsS1BMTjRDTDlTcElYM01EdWd6N1FDV3FSQ3pzalc5NHBlSEJC?=
 =?utf-8?B?NGxDUFlyZGxMM3hPU2wvSTBsYXhZdE5zUGhLTEYxTmQzYlcwNU5kdnpqLzlQ?=
 =?utf-8?B?TXhteWRadVdsTDJlcVlrSytRRXlTWWd2aXdxdENRMTVVRDJTMmZhZ3JtZUZW?=
 =?utf-8?B?TldEU1VRVDU2bG1aUnBybXptVWlNMndBeFQyNnhZelhrR2Z4c3hkNWg0enVS?=
 =?utf-8?B?TC8yc2k2NFRUTk5UbVRZdnJkWkNCRXlyMEVOWURZZ3pySzh1WXZGREhraU50?=
 =?utf-8?B?QWJmclBVMW1FWFFWNFloa2RGTERER1JTUFdrVit5bFV5cFczME1vZ0pyQ2oz?=
 =?utf-8?B?dStobkRNY3JoRFFSQVprM2FPOVFoTXNiRHN2N0llTHNzUndCUXlDZExhMnRS?=
 =?utf-8?Q?LbqmOieTHixu83akT8+a1Cot7mk9OKB0BnxFZV0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe0983b-96a9-4a1f-b57e-08d96d260140
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:53:44.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeuqzVBo50/U2wtXHBykS4FMQYqwkm/6/2bd+2n9czGAu1XP1bFMp17HO4JxvzQctOHwcb4QbOePFuRNQEEPwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 01.09.2021 10:49, Bertrand Marquis wrote:
>> On 1 Sep 2021, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
>> Commit 806448806264 ("xen/domain: Fix label position in
>> domain_teardown()" has caused Coverity to report a _new_ supposedly
>> un-annotated fall-through in a switch(). I find this (once again)
>> puzzling; I'm having an increasingly hard time figuring what patterns
>> the tool is actually after. I would have expected that the tool would
>> either have spotted an issue also before this change, or not at all. Yet
>> if it had spotted one before, the statistics report should have included
>> an eliminated instance alongside the new one (because then the issue
>> would simply have moved by a few lines).
>>
>> Hence the only thing I could guess is that the treatment of comments in
>> macro expansions might be subtly different. Therefore try whether
>> switching the comments to the still relatively new "fallthrough" pseudo
>> keyword actually helps.
>>
>> Coverity-ID: 1490865
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> A grep inside Xen code show that we have occurence of:
> /* fallthrough */
> /* Fallthrough */
> falltrough
> 
> Should we actually fix all of them ?

I don't think so, or at least don't view this as urgent. As described
what I'm suspecting here is an issue with such comments living inside
macros. I don't think we have too many instances of such. In case my
guess is right (and hence in case the patch actually helps), we may
want to change all in this much smaller set, but as you say ...

> Anyway this can be in an other patch.

... in a separate patch (not the least because we still need to see
whether the change helps in the first place).

> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks.

Jan


