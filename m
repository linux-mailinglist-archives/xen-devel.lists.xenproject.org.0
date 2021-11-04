Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B85445152
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221401.383095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZK0-0002EC-Cj; Thu, 04 Nov 2021 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221401.383095; Thu, 04 Nov 2021 09:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZK0-0002CF-9V; Thu, 04 Nov 2021 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 221401;
 Thu, 04 Nov 2021 09:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZJy-0002Bq-TE
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:46:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06a04a9f-3d54-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 10:46:04 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-Wvq8sCgHNBiaR0Li0tIEAQ-1; Thu, 04 Nov 2021 10:46:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Thu, 4 Nov
 2021 09:46:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:46:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0008.eurprd03.prod.outlook.com (2603:10a6:206:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19 via Frontend
 Transport; Thu, 4 Nov 2021 09:46:00 +0000
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
X-Inumbo-ID: 06a04a9f-3d54-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636019163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2PeWNDLm6SE87C8u2uiwmZqcYXDGafiYCkUQakxIKk=;
	b=gW43U3C61DNESHrfHCOaA8106LWewIWkHzdZBKZ7VGO3UpHOx378PJg5CF5RtqE0nbrDjx
	Z9z3/2Pauxp0QVeArx7VZmfcBbDHmyrPpZeGRiYqkwi8dtq1Quvyr2ONUrZRf+A4lYczoM
	O+5vx45QFv1eUilTqziPpNdmZS+glqw=
X-MC-Unique: Wvq8sCgHNBiaR0Li0tIEAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAtdQ9J6rJs0Jh2l3F8lmQPFNPaXowvP2Q+XA+0b+p9LCVWn7Avv/L48mkCwUrmlNB9lLpCCa/jzaWoZrRBb/dipDnSI86hbDStXElDucmqMHfnMETEUp2x3D+yqIYj3jKrtbLhVAquwcb/fkvM4AKJaaeA2b3UgbMtuowDin/pVArMrHMhYyCxxWNIxuzcndjJ4UVcxffJIn9jtcc2W7A+0UFymaMiQkb4TvJiqjDCY+astrr59H7956zNWpywPHdJTB+ocYVjcH/y2P/izZ+PWqp9K8bjXl6/3KqhgVH2F230WMjvzhqIerF8XS0wnvT083nGxzWjvjT2MBIvoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2PeWNDLm6SE87C8u2uiwmZqcYXDGafiYCkUQakxIKk=;
 b=b0ku0VdfeMxC5mNP6yrNcDwJ+puT8Ck/gqtGHOzH80n8UMczVUf0DJBpbd5a9yJcbgcHwFywPXf++cslmGGeASQHPFXdVo/i24tb1mCF+nsRqhWpMZmgWlst2cS46dxI+Yrn+oQ9yYu9gYZqyGZnozMUnMVbn63XdkoGU7SAtpFKCJJZSP4+et7et8jB42Xg/mXK67E0wswD2NCNwKe2N3yPv79gI2A4UWQC0dIhBMKETZHrkfGU8dNX/CNtXchvq0jkDXqSXpZWYcjeuVGJYinZ4iscfGEKhrrQUdBwS0Nf1B8B2I0X6LnBV0H2olrfEYtWHZJcKvUqEQztUd+CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <770fdb92-123f-f33a-3b8e-4d251093844d@suse.com>
Date: Thu, 4 Nov 2021 10:45:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Ping: [PATCH v4 3/3] unzstd: make helper symbols static
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
 <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
 <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
 <4a083cb0-9131-adbe-9be6-bc1ee3028eb0@suse.com>
In-Reply-To: <4a083cb0-9131-adbe-9be6-bc1ee3028eb0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0008.eurprd03.prod.outlook.com
 (2603:10a6:206:14::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d59024c-eec3-4757-90e2-08d99f77e8e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174C2AA48E4DDF09F3DB1C0B38D9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ELIPzfBpaEAXkDVhDnpiq73FogUyaYagvCypn9NzAtMBhgqMd0chm8KlIyCGVp69qGlfpY1MbvDbG/y522r0MjCmwUfG/FVI58LaE7Nxlw40UO2x3lPxKri8sqvShFWCj590ara9asSsli0UMqgncqe+oMy9l0I7F6GT4SH+bDQUlpuAAFDYKyJfQJ3W7Tg46ICIUcH8jxKFU78fbMtG1DyfLZiZm6SA5A5EAIJ9HB+2dr5tPc/PxzGknJDzZj6+dRZ6T5S4ApDQ1tYJKx0XRNsXMkbE8rGHFPp1xmfJ4qUPVuaXobKv+cDkBmEhfl+QvKHHC+q/Cb0PLB02EH/pgLv8nagkBLZGIn660GHvPOjPpBoZsuyOuSs70atKQ2KHw+3RT3HBJtTESbr4G1IqtCqwhIQx42j+fuRDlXUz6I0NJDaz8GgElE3NntZArtqY0aSQRY+RC0tv86l31/N2LSxUe0RbjfgV8HzxmZ+5rlHToNFP3KCDZRlnsIkDUKm8Cid9RJcJsYFxVE65vxUqkUvjfuIpX/D7ESQKIf8aH1jQE6HgnSUa38gkiEVZjnqPwjtMatSFd/U5/HFXAwcHIOdOE4U12ZtttcRhaZDqV5lnRC+3Z9DqPiWpxuALvyLWGi3abWu5/MXtdlLZjJovYiowG+k9VxK2l3IJHKCMhZxFj3cf/+A2itZgwBm1YojmqMYJTuRDfzsd7iSCJnLMWHF/VevOPeBU0qX98d7FjjNOoPESwNV6w1nS3ST44/mk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(8676002)(2906002)(38100700002)(2616005)(83380400001)(66476007)(66556008)(6486002)(26005)(36756003)(186003)(316002)(8936002)(53546011)(66946007)(4326008)(6916009)(54906003)(508600001)(5660300002)(31696002)(86362001)(31686004)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vkw0ejdVYXh6TktaYXpXcUphd1VCVkpzamxianYxVEV4YU80KzJqT1dJNURC?=
 =?utf-8?B?VFo2RDhtVmJrYkQwdDZpUmhyUjBhT3l2bi9HTVI3cUNwWThHN1crVlV3WGxx?=
 =?utf-8?B?Q2haRytDbkJCRkhWbXhVK3J5OGpnQml5d05ORDYvUHd1VFR5ZEUweXIzMFA2?=
 =?utf-8?B?c1Jnb3h2TWNjb3FDMWVCL04vbVhWNmV0YmNrSjJtVGp3dEJsK1BIclFKM012?=
 =?utf-8?B?RkU0U3VMdjNoNWZzL0VBc1N4cnkvcUxaNjZwZkREQVR3RWtCYS9hME5LVEg1?=
 =?utf-8?B?SkhDeTAvTTllVGxzM2pSY0Y5TTFhSE1iaFdBc1ZoYksyMjZRYmRyVENIN1hy?=
 =?utf-8?B?RHZPZDYxTjFjOXR6RFN6S1Yvd0d0cTBSeWpYM1VBQ1YrRmxSTlRWUmtQeVcv?=
 =?utf-8?B?dlBQeGZCRUEzOGEyZm5oWStPZkdYVUdNdjhXUmFkRGNDamtwR1J5Wm1lbFZn?=
 =?utf-8?B?UTJqYmJLa1llYTNTT3V2Y1Y0ZDNKOXdaTW0zdlFySkNNcTdhOU5PVE0wUFZS?=
 =?utf-8?B?Rit4SzBuNjVVbEJUWUQ0dzZCb1dIVFp2UGJvMVU4SmNFcndDcVhHc3p6aU5j?=
 =?utf-8?B?aUNPaVpyWjB2OHVaa2Vyc1dQQzk3cFNzbVBCNDhDcmxSUUtnUkFGTGNrWUJF?=
 =?utf-8?B?R20xQSs4YmlPcjhjQ1pKdURtUG1MOUdtMWFsR2x2c0tSeXk3SnRSdWdZRisx?=
 =?utf-8?B?bXkwSVdvUGtTbnAwYXZBOVZNaGRWNmFlYWJ6NmVvVXQ1ZmMxL2RPZ3J2NjVJ?=
 =?utf-8?B?RFpPRCtMemFrMEt5ZlN3V3Q0UGVyNGY3b2Q5eHllbU4wOFdaVGEvbE41UXZs?=
 =?utf-8?B?OTg1MWdFYUxVOVE5bElWL1FLL2UvSDlLY1RYWVA0dW1LeGRISDhRelRoQ3k5?=
 =?utf-8?B?dlY3Z1p1QU9CdGhMQ21HNzRzRys0MzI2UCtNUk1HdDl2cnB2dXM3L29XU3FN?=
 =?utf-8?B?c2p2M2J6MVp5dTRNa3RwWkROZlpIMFFZWHpGdlBGTGJpNkNCMWhoSTRsZmYx?=
 =?utf-8?B?eTVGWDlxUlkwcGNJZFlXSUp2NGkySmNaL0dPb0JzSkw3V2xSS3hOU21CLzF2?=
 =?utf-8?B?dkVaNnBOaWdmYk5EMVQwdWdPSnZqZ3JtcW5zUXBGZVRIQklTL1ZFMVQ3c0NH?=
 =?utf-8?B?bVpSTC9qWGttSFJqcnVDdy9NWjJHUHBxUWFRM1NGQ0tmRUFMMzJHYkpzbEVK?=
 =?utf-8?B?YlJGWExYV1hacEV5a21kUDYzTWtsNjgzeWZXbTI1WkFJYzJZZVVpVk1uQ0Iz?=
 =?utf-8?B?d0ZrVGptbG12VHNRWURKTG9ZYzdtY0syUXRRbEhCWnRoSjRyVHRlN3hzUDJI?=
 =?utf-8?B?blJMT1dYZUZlbjdFRStESGVyVDZ6TnFOdHptMmw3dlFrT3A4SUk2dzU3cnhF?=
 =?utf-8?B?dWpEUDdEcXpPMG5ZYVllNFFOa21KUDc3aEIwNkdwamNjNmZGU1BBTUhzMWJs?=
 =?utf-8?B?cjhYSTB0S251Nkg4d2JOVllybExVbnhPVHRhekNJRzArWHhRUlcwU20xYSt4?=
 =?utf-8?B?b1pXSGRPSDI2cmxIc2xtbXZTU2wzY2duOHM1TWVMbFVuYVJ2cDd4SS9VeElX?=
 =?utf-8?B?VjBmV29DbDdmSGxTUUFGcUNsVWVscmFpRkROVkllekVVdjRGb0UxamNuTTdD?=
 =?utf-8?B?MXpiSyt5OXcrVms1Y0dLdXNmZjcyd0Nldm1kUjFwamRJQ241ZlN2Ry9XUkpm?=
 =?utf-8?B?b216a0hVWEJvRmFvNzJBaUR3SURNdDBDSkVJZnZEMDNWMm5DRmZIT1VpMWFo?=
 =?utf-8?B?WGRnMWNzQWlENjFDV2dEZEhUbUhjaEtrRStsTmZrSk5FWmNDOUgxdzRIeEQr?=
 =?utf-8?B?YkNIK3BFSHYrWDJOVEFsZXVJQWhrZjhOb1ViTGE1aklMQjRiNGx4RzRhcGhH?=
 =?utf-8?B?T2dBS3ZiVVptU2kvRkhHdXRjcGd5QTFrWnRuS3NLeVRTeCtwcmdPa2dYa2tr?=
 =?utf-8?B?VTM1eXh6a2UwUEdlZll3c1ZiOHF3VkEvWTVybVlLWWtzZk45NFcwcVdBRU9z?=
 =?utf-8?B?anN5QmZVem9hT3draE5CUy93ZHFXZU5KMGd5M0ZFRVQ0NWpNY0VJQ1pxZnZj?=
 =?utf-8?B?ZXJCRXk3SEtxUEhETE9oUk94MTNKdS9QRldYMzBlVmlZSWZmZWNnSXpjcW0w?=
 =?utf-8?B?Nk9iMVRwSkRHejM5R0tiVVBER3JRdHhBa3lvdFpMcnk1aFZ2VXJQM1BaYlFw?=
 =?utf-8?Q?UOHl0f6PfuYQSz8Kt8EKhUg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d59024c-eec3-4757-90e2-08d99f77e8e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:46:00.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuC7+deoRhd73JJ4UUa3N0BB9B+SN4FO/YRKmHsW49ZW3LUEX7tpbLjgWlDRNgTM6v7USRECHP2sSXkv41NBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 30.06.2021 09:43, Jan Beulich wrote:
> On 05.05.2021 19:35, Julien Grall wrote:
>>
>>
>> On 29/04/2021 14:26, Jan Beulich wrote:
>>> On 29.04.2021 13:27, Julien Grall wrote:
>>>> On 21/04/2021 11:22, Jan Beulich wrote:
>>>>> While for the original library's purposes these functions of course want
>>>>> to be externally exposed, we don't need this, and we also don't want
>>>>> this both to prevent unintended use and to keep the name space tidy.
>>>>> (When functions have no callers at all, wrap them with a suitable
>>>>> #ifdef.) This has the added benefit of reducing the resulting binary
>>>>> size - while this is all .init code, it's still desirable to not carry
>>>>> dead code.
>>>>
>>>> So I understand the desire to keep the code close to Linux and removing
>>>> the dead code. However I am still not convinced that the approach taken
>>>> is actually worth the amount of memory saved.
>>>>
>>>> How much memory are we talking about here?
>>>
>>> There are no (runtime) memory savings, as is being said by the
>>> description. There are savings on the image and symbol table sizes
>>> (see below - .*.0/ holding files as produced without the patch
>>> applied, while .*.1/ holding output with it in place), the image
>>> size reduction part of which is - as also expressed by the
>>> description - a nice side effect, but not the main motivation for
>>> the change.
>>
>> Thanks for the providing the information. I have misunderstood your 
>> original intention.
>>
>> Reading them again, I have to admit this doesn't really change my view 
>> here. You are trading a smaller name space or prevent unintended use 
>> (not clear what would be wrong to call them) to code 
>> maintenability/readability.
>>
>> At the same time, this is not a code I usually work on (even if I am 
>> meant to maintain it). I will leave another maintainer to make the 
>> decision here.
> 
> May I ask for another REST maintainer's view here? If there's support
> for Julien's position, then I'll at least know to drop the patch. Of
> course I'd prefer it, or a stripped down version of it, to go in.

FTR - a response to this was iirc supplied on a community call (by
Andrew), requesting to actually delete the sections of code enclosed
in BUILD_DEAD_CODE conditionals. I've been pondering the request for
quite some time, and I've now come to the conclusion that I do not
want to do so. Hence, while I'm not happy about this, I'll treat this
patch as rejected.

Jan


