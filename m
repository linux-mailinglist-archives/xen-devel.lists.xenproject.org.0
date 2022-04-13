Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6614FF468
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 12:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304030.518539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZt7-0003xL-LS; Wed, 13 Apr 2022 10:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304030.518539; Wed, 13 Apr 2022 10:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZt7-0003vP-GY; Wed, 13 Apr 2022 10:06:13 +0000
Received: by outflank-mailman (input) for mailman id 304030;
 Wed, 13 Apr 2022 10:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neZt5-0003vJ-SB
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 10:06:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e10aa5-bb11-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 12:06:10 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-fFAnIoFoPLqj9DPn8_m1sw-1; Wed, 13 Apr 2022 12:06:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3967.eurprd04.prod.outlook.com (2603:10a6:803:4c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 10:06:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Wed, 13 Apr 2022
 10:06:05 +0000
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
X-Inumbo-ID: 57e10aa5-bb11-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649844370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScROnMGFOghzfgaHul/WGZVWFYTuMy3CnbAr0Y5DRmE=;
	b=dtNgnNS7smJKiDStqNlR5quFCEsZ5ecnuYISWctYq7lb/MJe0G3OgM16F18z+ZuSthaqjb
	JYvlKxCus77NjFQ9UYtvaRKYcJbFXLEX4ZsJMOpIMIPX2kwg/A/tyzEMqmGInGOgaTztLg
	UFYfOtvefSDzSolcopexUmwkqcFsvPA=
X-MC-Unique: fFAnIoFoPLqj9DPn8_m1sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg+3McMnlA7+JOEYjXazYkwuDGGRHgthW+ryw0eCOusKjlUAE33N80vWI7P7bLvhle24IjGW9AngAOlzt6ipSpj1dtgs9Fy2218R+vVUlEz/6BpbGVixyoJZ8tXBlzswDFCDoPD4eNnxWrXFj7I6+C6iIdxOxFs2PQfe6AEjJJhkUkU305HV+no+vSgVXEDgVWIRA32NjxE9suEr5vbUklDilBKYUp6w+r6+6hpl92UWSvH7DeoqOpfpkHTJuVsTEOwUKrg7fW+X+4KsbARCAGCSlOrBhoQAMGV02ANyfVKg0GNO6sTPrvkLXVlNIRk+xiiol+yemxu6FYvV733HjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScROnMGFOghzfgaHul/WGZVWFYTuMy3CnbAr0Y5DRmE=;
 b=frsl41Ffbgz1DpOOR3CUgM4TDt4ugwI4bOtX6pH6sh7g0iBbaeg4bwZY0LB6LpNkAKQbnWVJ8VOWsYkvQhUpZzCcESVHfphA9GAypxZxds+aUZhIOwdijULYknW31unf6Y5+mqD42Y1k6N4WtrZQKdmjLy73Zr2yfDCsktbnvrBpOIQL/gWhBvqvOrtjwKooKM3RZjdinZkBKiSQqlvIjlcKgdX1yLhNq2JCkxM2sVPCeulkdc/8UyUu6H7jvguM/eTztexlJGZE7p4TvbAo8Y0ebP73zHRQwV1DAD3pYufSaMk9j1730o9BQwLV9V6gHgneolp4K2toqHYFSaXfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <047a60f4-5737-4bb8-ad83-aff3e56be213@suse.com>
Date: Wed, 13 Apr 2022 12:06:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
 <46feb71a14c70d24e894311e7ef9390064d6f437.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46feb71a14c70d24e894311e7ef9390064d6f437.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0038.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f2b08cd-e716-4e31-cb1f-08da1d3538a3
X-MS-TrafficTypeDiagnostic: VI1PR04MB3967:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB39676272AE1D4F83848A0612B3EC9@VI1PR04MB3967.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cfh5yPHkq63X7Vh47kwbIiqjjH8SlZcb9yD90Dtn0+646WO4Coy2htRBBa82StcE7WwkPRp2+7UYZAsE8TxbBt4qLOMunXG0BZtJv6xSGK3NT5jQg8E25P+VuOmg/bidY1dqeeIsS/yjDPLZwoU5eGNpd59iXjQpOOAiIdLb4tB+JeshAlM6sbah16LXeC4BsC9wMCZj/mBU24MtbEK1UL8CDV6GxZkggeHNHCgBnsKhibo8oDuqnUVyhVxqr+/VKw0jjw3N7AjRqHTSdCjwkLaBfF/q+iNfp6O9HDAbzFWCKL8OxtChjwFDD5bFxVUAXchKxPv4F5qRnt2aXMrPJXvy3u5FGaxSqWAp1igf5EbfxW1rrygpCvq+e0JWUSypYKMaODMCPzdXYKg16AhIif9xsr7FsHujCt21nigKGwT3fbpHEqhxsID3CIwhd9DAvBUzdG2T/PqTUTy9VCoJ7nQhD2abhm+WeskL3OrM0+jS1yHKB8+dT5xDSCsiCCF9tQo+1x3h+By7HbG/T/RYkFaPEKm1qCuUS9oWL5JT5WYT2RC3wzmAauZxLuFKwCw+ylVsMWxmrWeiygiyeWQElq429cBP1Sdvb7ozNqsTkXmJ834jId4b9O8jEoRrmi0q3VP57V/pSl3v65XmjOPU+pq7/REInkP5l9gNi1bbvNtirjeKoE4TQhkA4I+/4nJoIXd83Hwwquitx6VM5LLgDQjzs6EqvlNZah6PV2XNyjA6re9hHWYVSGTGNPR2p61y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66556008)(4326008)(66946007)(54906003)(31696002)(6636002)(37006003)(6512007)(6666004)(53546011)(36756003)(86362001)(83380400001)(31686004)(66476007)(8676002)(6506007)(6486002)(2616005)(38100700002)(316002)(2906002)(5660300002)(26005)(8936002)(6862004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1VKytBT2NTVm8vVmdZUWxtc2JpZDVNRTltNjZWMGduVUY3VDRNRk9ScXhS?=
 =?utf-8?B?K3RBS1IrSHh3bXF6eHgwZklQQ1oyUWdTL0duSldqR2RDeHF4bU5vMkVuQ2g5?=
 =?utf-8?B?bExTVUIzdHVXZmtZWjE4aUVMRk1VeFFRcjRYelBWL0VGRmRvcmI4enQ2ZmpD?=
 =?utf-8?B?NkQxNzFYYmMvQzVtZXBZR2pMVFNOTldLbzllQktjVnB2RkplNXhRN2UxUFZE?=
 =?utf-8?B?SVowWUh6c2xURjRlUzlFYzB4K0RkSGFqdUZscGhVNVlabGpCUk9EdkpjTytv?=
 =?utf-8?B?Y3FRRGNxMlpHMGRKOXp3cXF2ZEJDZnNYRmJKWVlXcWRJOUlTNzcxRGFBdERv?=
 =?utf-8?B?UXA3MTZUWXVzV29oM1JrOU1GWnZSU3BoZ3ZGc0JOd2FFZERIbmNJTGNPbVlG?=
 =?utf-8?B?TFhEVUpWQTBlS2loNG8rbEJnTHo2STZGSSt3b011SkkvbU9NZDU2VVN3bzdG?=
 =?utf-8?B?aE1DaVE3aXpTYjFSUjRQVDVQRFhqYXRVNlpqeVk0cjF2aDVPdEhkN1o4b2NL?=
 =?utf-8?B?bmxXL29ycDNoS0ptOVNOdWdraXo3ZHlxazdWZmZaRjY3TGo2c3JqbFdKOXVl?=
 =?utf-8?B?djJVT1VQR3h4d2l3WFVEV2dQYWxzS3FxaGtVQUZWeXlTSStGQTFjdzlRYTBY?=
 =?utf-8?B?NEg2eGVjaVlyMWM4NjhKMW1OaWJISHJMK0FzVC9DcjJpdVhBRUdzWk1JN0Q2?=
 =?utf-8?B?Rm1jZDJOUkdmdGlZUnlLNjVCdEVEVHJaQ2MxbEMrdjVJNkg5a1hnemdkMGNF?=
 =?utf-8?B?ZU4zZnp5dTFsV3ZkaW9CSDdhdzEvVXNJYnNLcS9iQkhRQmtSZUdadS9LYzZY?=
 =?utf-8?B?OTJWWlJhNXZVNDVOZCt0TEFzOVZ3UkxRMHVHYWlYTyswcHIwV0t6dWc0Ymt1?=
 =?utf-8?B?Um52b01xSkFhY3NOR2k4UGpBM3lTU21IMG8xTDZheTBkR2xVOUliQUZFYndE?=
 =?utf-8?B?ZUlDVlJFd0toaXVuN0NqWnBIbUZpcXRIVWNBN1UwU2N1V0M0Y3BCNkVOTGl6?=
 =?utf-8?B?TVo4TmpXWEhCZlZONnk5WWRwODdIZlJCS29QVjdzV1JwdmlqTUF6UHpsQTQx?=
 =?utf-8?B?UmtTWFV0cDkyR1dMNnBOYVBXR2xVUlU2T2YvT3BBVWNRMWp6RWh2OHFTYmNu?=
 =?utf-8?B?UngrbklvQWtaWjFzN0xDSDBraVBkWkNJUzFNQ3RlaUZxN0JNVFRPV1VLZXhM?=
 =?utf-8?B?UkpLbFIrdWg4L3prT0VlNmpKallXdHo0Ni9XcVpRUGk2S2ljYWlyV3plUktS?=
 =?utf-8?B?VytDK0xZQ0FCckRPZzVaRTNONUhhVFlGdk9uODA0cVZxc1dSWVJLYTlmRnFz?=
 =?utf-8?B?WFZIQ3I0Wjloa0xBRVZlTzNDeis1K2p1NzRTZXpNa1dxaEFvSzdKY0oycWcz?=
 =?utf-8?B?Tjh6QXpVajh6T2VWWjU2THFTTlliU2RUT2sxM0xCbWRJTVJqT203YlgxakM0?=
 =?utf-8?B?T1hybkhBVi9kM0FCTjgrbEZMNWlqNVp2OXpEVDlmTGQzOHB6dXJhNDhGaWdB?=
 =?utf-8?B?Mi91R1lpRkV2OEtUdERZMklaeExiSFB4UktxQ2crYkVKSHN2YUphUVlmWnlK?=
 =?utf-8?B?cTFvWEJVRTU2aEN4d090M1M5bHdHSU1uSnk2VkFSMk95NUZpY0NzYzlKZU0y?=
 =?utf-8?B?YmhrQ3E1R1dPV21vTitwcTYwMUJweUFWVGRvQlE2YWRGcVN3VU8zZ1BBUzhY?=
 =?utf-8?B?T2dXZUpNcjdZSGkwdzRBUWtNSC9PV3NvTFdzUGVkMUZPVnlsSlp1N2xuR2FI?=
 =?utf-8?B?NjB0QUgvb0ZJVUJSaXJhNWZCMFZJZDl2TjB2bnlVVms5M2RKaUN5K0NvSWc5?=
 =?utf-8?B?M1VabWc4TWttYTZpLzdmVytVbE9zNEY1T3VXZjlPa3IvMWpteUp6N3lZSUxZ?=
 =?utf-8?B?ZGZubm9SaDlRZGkzdUdCY0dxU1UzL3M0MTgrTno1MmNvWlFUbkFkbW5YdXly?=
 =?utf-8?B?cDEzYklpbDZmTjNFaU1sdEtDaFRobzZaNlRnK0tPcG9pNUJ6NkNSK201RzR2?=
 =?utf-8?B?VW5aNjZIbXRvcTBJcU5wcDF6cExKVW8waHlvQ2hxeGFyYldFc3Q2dTZmUGhw?=
 =?utf-8?B?MXlTOU8xUG9WTW1yb3pHb0x2QUZFVTQ0eDZQKzdEbHFWejk0aHVOMlZ5V09k?=
 =?utf-8?B?bWF5cUdNbm9vdi9FdjNFTTVobTVNT3REMW1WT3QvMndNODRtVmVuQXdIa3ZF?=
 =?utf-8?B?OS9mVTVCNnpPbW8yaXhTN1FtR3dhWHo3YnVLV2hCK09sQUoxczduLytid20y?=
 =?utf-8?B?dllIQVc2L0ZwblpNZDd0NnR5blNMVlVNV2VsY3hkOEdtQjNKeTluOWk1Z1E0?=
 =?utf-8?B?NXdyZkNKVGt5aTlVbllPbXBGci8xdVJJanRXYnBGMWYyU1VUOFVxQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2b08cd-e716-4e31-cb1f-08da1d3538a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:06:05.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ7tEkj/4M06WVZ2mdMeLjsw441IcbGpVxqovxYryxV6g1dxvQB647DbiWr2oB+P8MRArlCvlC7tt6lvPYvE8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3967

On 12.04.2022 18:14, Dario Faggioli wrote:
> On Tue, 2022-04-12 at 16:11 +0000, Dario Faggioli wrote:
>> On Tue, 2022-04-12 at 15:48 +0000, Dario Faggioli wrote:
>>> On Fri, 2022-04-08 at 14:36 +0200, Jan Beulich wrote:
>>>
>>>
>>> And while doing that, I think we should consolidate touching the
>>> affinity only there, avoiding altering it twice. After all, we
>>> already
>>> know how it should look like, so let's go for it.
>>>
>>> I'll send a patch to that effect, to show what I mean with this. 
>>>
>> Here it is.
>>
> And here's Jan's patch, ported on top of it.
> 
> As for the one before, let me know what you think.
> ---
> From: Dario Faggioli <dfaggioli@suse.com>
> Subject: [PATCH 2/2] (Kind of) rebase of "x86: make "dom0_nodes=" work with credit2"
> 
> i.e., Jan's patch, on top of the commit that unifies the affinity
> handling for dom0 vCPUs.
> 
> Although not technically necessary any longer, for fixing the issue
> at hand, I think it still makes sense to have it in the code.

I don't think so. My suggestion in this regard was only since with my
patch adjustments to affinity remained in sched_setup_dom0_vcpus().
With them all gone, I don't see why vCPU-s might still need migrating.
In fact I would consider making such "adjustment" here would be
papering over issues elsewhere.

As a result, if you think it's still wanted, ...

> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> * Changelog is so much RFC that is not even a changelog... Jan, if we go
>   ahead with this approach, let me know how you prefer to handle the
>   authorship, the S-o-b, etc, of this patch.
> 
>   I believe it should be From: you, with my S-o-b added after yours, but
>   I'm fine being the author, if you don't want to.

... I think you should be considered the author. It would make sense
for me to be the author only if affinity adjustments remained in the
function after your earlier patch.

Jan

> ---
>  xen/common/sched/core.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index dc2ed890e0..e11acd7b88 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3416,6 +3416,7 @@ void wait(void)
>  void __init sched_setup_dom0_vcpus(struct domain *d)
>  {
>      unsigned int i;
> +    struct sched_unit *unit;
>  
>      for ( i = 1; i < d->max_vcpus; i++ )
>          vcpu_create(d, i);
> @@ -3423,11 +3424,20 @@ void __init sched_setup_dom0_vcpus(struct domain *d)
>      /*
>       * sched_vcpu_init(), called by vcpu_create(), will setup the hard and
>       * soft affinity of all the vCPUs, by calling sched_set_affinity() on each
> -     * one of them. We can now make sure that the domain's node affinity is
> -     * also updated accordingly, and we can do that here, once and for all
> -     * (which is more efficient than calling domain_update_node_affinity()
> -     * on all the vCPUs).
> +     * one of them. What's remaining for us to do here is:
> +     * - make sure that the vCPUs are actually migrated to suitable CPUs
> +     * - update the domain's node affinity (and we can do that here, once and
> +     *   for all, as it's more efficient than calling domain_update_node_affinity()
> +     *   on all the vCPUs).
>       */
> +    for_each_sched_unit ( d, unit )
> +    {
> +	spinlock_t *lock = unit_schedule_lock_irq(unit);
> +        sched_unit_migrate_start(unit);
> +        unit_schedule_unlock_irq(lock, unit);
> +        sched_unit_migrate_finish(unit);
> +    }
> +
>      domain_update_node_affinity(d);
>  }
>  #endif


