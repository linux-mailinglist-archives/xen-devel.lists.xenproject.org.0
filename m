Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD82F7CCB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68103.121842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PHv-0003fL-2p; Fri, 15 Jan 2021 13:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68103.121842; Fri, 15 Jan 2021 13:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PHu-0003ez-VO; Fri, 15 Jan 2021 13:37:14 +0000
Received: by outflank-mailman (input) for mailman id 68103;
 Fri, 15 Jan 2021 13:37:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0PHt-0003es-Is
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:37:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c0424e9-a630-4b7b-b922-0212ec164da0;
 Fri, 15 Jan 2021 13:37:12 +0000 (UTC)
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
X-Inumbo-ID: 4c0424e9-a630-4b7b-b922-0212ec164da0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610717832;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DQyOiLCqpj4XvTUCJGL3do5dO2zwBO/cFPpX+tCA9cs=;
  b=UP9TME8NedF5fJvKDl7V3VoHyineTE60KuJlIdmjpYJ3/dYq9Sis7EVn
   YVRg9VfEmg7fuccd20WxP3pdLeE+DM2HQB7epnz0pDYAWMQ+7yl1dgolG
   a5LRCXxkz2tihT8POUdrk15rNCOdbU3DuW//bGuBn750tbV7VFcDfQ3+x
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KMIf+ZLUCIyeKt5lcl+CIoiqF1X1ds3FBFFox0bdSVLy+vpvcFIGJRn6EjXgTQhFCrMC0jmtSW
 hohBxpnFjj7ME46OiIO9ltSVPcror4foW6LEk0p4eU0Lx1CDGwfA+nnGvWI02e6V0ySQNdLnq8
 rNjH76i4RL+rVSCJMlSmKOxbeBLd8EfNPd6WpoST/KSpi4ypqPg57PWjNCaG+tRUNzLbozMv42
 pPbemjjlQlDoydtIg4r7ztto2hsOzz3kAhdlFYiC1FcbmQc/XS8vZsLigJwzBUqOc0/FvEN2H8
 Rvk=
X-SBRS: 5.2
X-MesageID: 35216073
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35216073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz7Fg5S9t18Qpx6//4x1Uw/UkRXTkSC1Ndb65WVVSJwIk4bQU2yTE+At4aXU7gtGtYijw8LIX+F8DLEbjJq+wBktxDGjS7Okw+GUcMkTcO0i5HovzpdmwKd+GYNxMHu6oM72gipV/nkr0C/DzRbroSlSaWPQbbY91jsj6idSM/h4CVYvJpgq6Q/eYOWBRuyEGeUCkdF9Z7JIBk8BSSODuhH85U1IMhHeIA2+2P+wIcmElTl8S/pDOnlalahSbLEKewoEIkCxS9lNELA64HQBAAObCUNOphjBDOZdtXp9ADaf3FGFn8udrenCtQauqmX0dLERQRhuv5MbtPPV2eD1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfC5CRAOFmpNXXHx+BZX4ecJNu8F8/8god9Zo1up7eg=;
 b=TYwK2TlaPnG5CZF0JLYp1an8n0NBph+g8TBUcysuEJqH8hUWj/aiSQPRJMiCXXt/plWeoTTc2Nxr8Qqa31vELsvVQzddaTLN+GQ4WQ/Z7zttJuQFY7PxYVPpZ0yPJ8o85EKFGtOkNYAX6AjfNZKbieWsc+BU+iMitcR2vuBobLe0BqYs8DWBmm5AYhG31AFim7OwYc4FPtwCAC1Sz8HDqSW9WZpAXdgKtLSJzcnhiY60OwFjIK67E7OcV+JNeyc5jkgOiveXcaSkWfKsfKBRzb/t3GlvUrXuEvbEXEHwbnDRHz62l7F+ZxMsrvbVv8ThEl/gY8LmXpaySjMHomccEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfC5CRAOFmpNXXHx+BZX4ecJNu8F8/8god9Zo1up7eg=;
 b=FD8poz6cC7og6lB1TqzUdY2b7OiRiqJtEYRvS2UN6yGa/wLnCQmvoPYEiExL7JPPtS4fgJ6/hLuR9QBvH/dzZFtFNPjZ5V9DEbZmT4IoT2ahU1AB5aXYkax59EcX/tn0gyttxv2Eg8hy1+FFtkBXCnUVYDQ+y2qLmDoxztffpF0=
Subject: Re: [PATCH 2/3] gnttab: consolidate pin-to-status syncing
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <5e84b80d-4b6f-118b-c2cb-071e6e774db5@suse.com>
 <7a3e008c-58cb-8bdb-ed7b-2f3a724f0358@citrix.com>
 <9e4c7449-d59b-b81f-a8aa-9565c76fe8fc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8b214df2-42e4-4e82-7968-ca878856d351@citrix.com>
Date: Fri, 15 Jan 2021 13:37:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9e4c7449-d59b-b81f-a8aa-9565c76fe8fc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e8fc815-60dc-49fa-7a9c-08d8b95aa7a3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB551838137BEBA6301D3291E7BAA70@SJ0PR03MB5518.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwJvVaWfQVgrllerryP1yoQjBsYVMB5N42iwsc4JjX/LFAUXw4VUFrg0NF2irF3EZGvJcLZ4e4RSL8HHD+umvJ0SlqCQxuOt8Xf3mHX6vuXnS1IaveioXFKb9qAwHsochWPjx27Uyxv1ACyL12ig0lkniPYdgZTUG+f8SJnIDBBN9EYjc80JbWtH4NgEVMNPEuQdlqfbkyMozMchewtEfunjLuXSBUepnM0c0Bnyb+IKs85kfR2EQkJ5hc+4ylmmyDQEuqPUnVCQ4IRLa8nUh/tH4OYRUHtyAxOTq9fl2t3nweP4bwQUUq7QvhQrF2SW80auXFlLKqdM+ukBKf3PFot/YkPrr/0u2kQHGwx14fihLba59tYRQYjKqRja3kILUKCs5kirUZsAYafC3TGOYNBKm9TLuBKqlFrtC83jhr0k3irJ2+z5aHjLzyv/kUUCaC9C5Lzu6B04tOe95jqFKeGGs1CMZVIZxDx34fzgaQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(956004)(36756003)(8936002)(5660300002)(86362001)(6916009)(2616005)(16576012)(6486002)(53546011)(8676002)(316002)(54906003)(66556008)(66476007)(6666004)(16526019)(186003)(4326008)(31686004)(2906002)(478600001)(66946007)(26005)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cjNIUWlTeXdibWFXS0EzSUlZLzdzSXdYU3hjSDVoN1JnaGVWU2lia0tDS2Ni?=
 =?utf-8?B?YVNXT0dCSmpBaVhiVTg5UFB4R3I2cXhiUTUzSEthYjJ0bnl3eVdlVStMWWZY?=
 =?utf-8?B?MitqeVdsbXRUUUxlaHRIQ0pnOXRuelVYS2Y1WWNmS1RPYmVPdlhRQW1DNVdo?=
 =?utf-8?B?UEpteE9od2lxbURIVTM1T2VscHZ6SzZ3dHJLS21JcU43bjdyTkRCVFJPZm9N?=
 =?utf-8?B?TnJ5dzMvU2V5VWhrcjFtcDNCcTc4OGd2N2FJSlNvblRmVmFCU0pmdFU0Ym1p?=
 =?utf-8?B?UG5sWVozMDVmdE10c2VLaFI5VkVTQVZZV0dsUllYL253VFRiWWlKRUdGR3Nr?=
 =?utf-8?B?WVdVUGo2U3BtVlNkMmhiaTdIQTNJaGlxbmJXeHNGdHNVcFVOTTJlaEFyZVBm?=
 =?utf-8?B?NTJFQlZWQlBueDVaN3JiZmVGZERtYm9hRFJkdU1VU2ZFOXZyU3RUODg1bnJI?=
 =?utf-8?B?V011T0ZkN2Z0UVBYRHdEZEo5NElZYThGZnJMTkJkUHNmSHY0S2lQUUprbjUw?=
 =?utf-8?B?TWt0WmsrL0tJOHJ0S29BUm5VeUlQcVF4dE5aZDZvSGYxOVArQlJNOXg3M3RJ?=
 =?utf-8?B?QmhJZE5ZbjFrUUhZdUJ0cjFJQmh1QnVwaTFaUWwzQk54b0hJZmNTWDBZUkpU?=
 =?utf-8?B?VjAzTFllMGZGZTRodXRnUVBKQ1pVeGgzajhSNGg1bDBSaXY0TVJoc2VIV2N6?=
 =?utf-8?B?UjN0Z0Nvb1dxN09jT2VXS3ZSTHJjaDZJYlBLK2VyNmtDSy9lRGJOWGd6c1Bv?=
 =?utf-8?B?a3Ftb1RYdWhmU1MxUFBWcXY5ZnloM0czS0JWNFF3SzBUU3dqN0VaeEIzNDlz?=
 =?utf-8?B?UEFQYzJ4ZElKRlQzcllTc0l0dm9qaWFoRCtGdnpPVWNKZlptK1ZGYldFeDBU?=
 =?utf-8?B?cFE0M3hZYnkwNGhUdnBISXltVVVVcFEyWExGYW1UcjBFUnVnUEJjeHZSNVlv?=
 =?utf-8?B?UmthWjFRTFJRWHF0cjlHSlI4eHVkQkwrRmRpNExENjZvWDFBNkRRNWkxSVJ0?=
 =?utf-8?B?UWV4T1UzWjUzVjg5RzlpUVVCWGg1M0lwcmdUK3pSMlBoOWNPTXlOVkpuNzhJ?=
 =?utf-8?B?TlQ5c2NtaUI3dW9JYkFvbkFsSCtSMUthZTVVVmxMTmZsTS85dktpZktGWlc4?=
 =?utf-8?B?SUNyOFdUbWt6ZmZNKytLYUw2T1k5N25qYzV3VFNaUEsxUTFBT0krRjN0OG5w?=
 =?utf-8?B?cVRiMFoxZlNnQnVSWmM2SEZTUUNma2RCTkZoMGV3dkZRUEhIT3pMU3hielh1?=
 =?utf-8?B?Q1Q1WFZIK2dlME1hTG5rSkJJd0UvUzV2Z3NrVk9wQ1hZV2lDVEpOTGg5cTJK?=
 =?utf-8?Q?IwogW+99FinZjI2VTGO1yYGYgAZCOf161/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8fc815-60dc-49fa-7a9c-08d8b95aa7a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:37:08.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45s5U0xONWLRSaBMY+KSFpVKn2eLEGsTRqjNCzE178zTw3ItCuCGC41VVOEI77Rs5K3ypc1sTpmpaRlxun8lFtEyjmI+rfE6lg141mL4XV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5518
X-OriginatorOrg: citrix.com

On 15/01/2021 13:33, Jan Beulich wrote:
> On 15.01.2021 14:25, Andrew Cooper wrote:
>> On 14/01/2021 15:23, Jan Beulich wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -908,6 +908,25 @@ static int _set_status(const grant_entry
>>>          return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
>>>  }
>>>  
>>> +/*
>>> + * The status for a grant may indicate that we're taking more access than
>>> + * the pin requires.  Fix up the status to match the pin.
>> This sentence isn't correct.  It will only clear status flags to match a
>> reduction in the pinned references.  IOW it cannot be used in the case
>> that a grant goes from unpinned to pinned.
> Of course not, hence "... more access than ...". But yes, I can
> replace "Fix up" by "Reduce" if you think the wording isn't
> unambiguous enough.
>
>> How about renaming to clear_status_for_pin() to make this clearer?  I
>> don't think it is worth trying to make the operation more generic.
> Hmm, this name would suggest to me that the function clears
> whatever the present pin count requires (e.g. acting on the
> pre-update value when the post-update one is [going to be]
> zero). Maybe reduce_status_for_pin(), matching the suggested
> comment wording change?

Sounds good.  My R-by stands with this change.

~Andrew

