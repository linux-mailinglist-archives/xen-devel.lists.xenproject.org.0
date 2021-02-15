Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7331BBBE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 16:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85267.159872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfMz-0001Gz-Ca; Mon, 15 Feb 2021 15:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85267.159872; Mon, 15 Feb 2021 15:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfMz-0001Ga-9K; Mon, 15 Feb 2021 15:01:01 +0000
Received: by outflank-mailman (input) for mailman id 85267;
 Mon, 15 Feb 2021 15:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QLJ=HR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lBfMy-0001GV-6G
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 15:01:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e256dcd2-f978-40b6-90f2-abb3be25828a;
 Mon, 15 Feb 2021 15:00:58 +0000 (UTC)
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
X-Inumbo-ID: e256dcd2-f978-40b6-90f2-abb3be25828a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613401258;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dgXGA8O4xw9D+ikICTiinvDUGkt79fMsZa4zjuKS3WE=;
  b=PonEcvRZv+JV2Zi4qcpsBU48f18/zdw9ROEqSV3/tgWAOt/iQAtO8jUk
   5f6cMSR02cBX522O8tvDqqZh9mIfh6l/7lKyhvhQSyxg2QiJ8edpRaZfW
   lKgOGjaN8HXUD//vtxwpufsMmFrl9Vnvx7CZ+5VxcLHSeAUXx90OsdeR+
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G5Wja4U7B6jo0nSIg1yIRyAoEbPLnG2TQCKh1gLdu9BQa5qA4B4PowvQTaEVd2zKZRHMN+SHH3
 39FdOrUuUVPFU/T41oEYU62oDp7Oo+auV9RrKeQnafukA7k/8DwfRIm4Eu4K+6cX/C2Ez7MfF1
 pRp4BqO/Bt6qJpDNifxleP+PZV3nBOdPjb4CB+WUKzbu2fatpXwXWEDk6Dz07ce5qUU0LRCTWY
 Njdrptad+HDgYOhqopd4OGk0LnI/SxCvd8qZg7aQXCOsr/FNZlpkLf+Z7LapO3s5jITQ0DbJXG
 pxY=
X-SBRS: 5.2
X-MesageID: 37201565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,180,1610427600"; 
   d="scan'208";a="37201565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVYMuzu7QhwGL3OXKWcr/rysyJjWRsolhD81p7gdjXtWOxcKLwgwsOxkXRs6yUuT5ru0ofp2kzGlYK1nZZXEk8CFimlUWBT1LcWZDESwXH5Dd1iofdF3OkF/tVvKkgcZEWoFVcxFF2A0oH0xL/CQL/rB5OFG3wsTMl9bcatfKmnBmBqsVrCBC3nBURwmSsbv6gxJrxV9OrYL2anVZ6OdqNfWNWcdALkMnPkVq/vwySYgG1x2Z0O1HR3/EFhOBeSe1fSYP3H+ERB54qChZwvphZ2Y7yvPaIapu1JgmxJMwzxdZbQY54mFBcFHGFactl9FWRNoye5LvHSDlPXrzZaq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxxANHvwZGVlFMZK1QmL5U5xQvz2wmhp4Z3FsK4LR9w=;
 b=G9+JluSKmX6CHYYhx6VyES8WRUrFFzKqMZXHHg3/kziPVUOmkY1kn54ehj4J0wKTIWe2Zixj2Bfvk1k040by5ETNNyB1Z26OHbo+Fg4Whn/47+ANNSqu8mvg0bn19vSOV/1EfoKAJprE2AuCX7nIlI3nosNvtkhztGuAF4g9jDLBi/ElG3/GcScCxyQjgNkMKdQqbdDzM5+N5NFQsb54wYzmK8LR8wga/IvAfTJqK6RsPDvB8NZqJ3cJoClw2jcyhl2AVKDed1D9KM+mfiLHZSqEYn302e5fPhZI5wTNGnR8yWPlxi268zmkws1A+VqfgztxqmTnO1CANJYBTfJOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxxANHvwZGVlFMZK1QmL5U5xQvz2wmhp4Z3FsK4LR9w=;
 b=HaoS/u7CgJuHLe+/TDKgSibz16FCsPPMxzwDFB+hOGifQN/Y7vkBTpKEqMj6jyjvqlMkIMpUfFwV8hk7mUuIlWEQ7Esrnfu+TvtNgCvP/c/xE82SHImgfFcJrGdU+uJ7QTIY+MaCol5TRek7ruz6n3y0mpS+iHUIL69DNS+S2q8=
Subject: Re: Boot time and 3 sec in warning_print
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
	<anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
 <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4c5e236-b801-27af-d519-204943aa32d4@citrix.com>
Date: Mon, 15 Feb 2021 15:00:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7990e63b-0bd2-4874-1474-08d8d1c27aaf
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3623979DF80F93E42C708662BA889@BYAPR03MB3623.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZH7VwgR0INGU8EGuIbGvPk2wpRBc4oL4c2N/U94eTVUbsQpcXFm7iTHqcABV31xh17ugGX0jIztOhJMmWXs0JnKVFACFKwPWkjoCfL2c6/nsk1Jrr25RUc2qOMvCwRvKC43aAJiwHPRQzGd3Tetjh1vdoQmAmD6JV52O4Lhkg5NzBUrY9ClFrfuxsLbMhbN0PeI+xULl9iwNpGnM9I+Y1Y5dyggySP3ZXrVaN2AwalQSTJdecBOJubyKLP0qXZn+auuX8z26Hw3DO78iYB0YtQdgcqnbjaZmR7FE2zh7jVlz3VGp3qPxK3KI79y+J8ULL2ufM23b0ddZwWiupOQ3K6eBZyHaP4KvfdH0L2JIH4WdUm4DchHcs/mO6L+IugNkBdFt0tmO/4lQef1wU9pvrp7sA0jypnuh4a3FluqZ3AOypyEUuzwZdS7ONoVbCpsl3fwghOT+SukdSj07tgPAKooiSFK9Z5ZCmJHwp7kCC5MfulvHruhHQzHzpxaEmcCgrnAwAB6ZmAiYWQSPTNOXFe0TWD8A2WwwK1PWP6t9LnvTnk7/eu7cycHaRS7olep78J5jfbuM4z9z1oJmtVW2n40tpCPLU0XtCbwUcSu7Rg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(2906002)(26005)(6666004)(86362001)(66574015)(478600001)(8936002)(2616005)(6486002)(31696002)(186003)(956004)(54906003)(16576012)(316002)(16526019)(110136005)(31686004)(66556008)(66476007)(5660300002)(8676002)(4326008)(53546011)(36756003)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YjFmK3FLSnIyNXRocHVmSzRMcTFLckFpOFBxY1NmNi9iT2Vnc05aQldnSkQz?=
 =?utf-8?B?MndPUHdHZk1UTUFZMVhWazhrVGo3Si9qWjN3ZDhZWkErVnRpd2R5azZUMGVD?=
 =?utf-8?B?U0dxbjlrMk9qS2xKS3VkSXdGckhudVcyNG9nSXlHOEFEem5KK2YxSGoyNE1P?=
 =?utf-8?B?djgxRjRXWThmM0xQUTY2U1cxK0svQjZVTmpYVnpqcXl4SVhpcEplS05BZGZx?=
 =?utf-8?B?cnFqOXVobHFmMUYrcnozdklqRFNKL1k3OWtMREpIWTRld1NscXgrRGpkemZU?=
 =?utf-8?B?TnhGWW5EK0RGZDJKT3Y5TlF3N3J5dmZ1ZFFkMW1oUXp3QW8rWi95eFo3N1No?=
 =?utf-8?B?bWNUbWVjS2ZpeUFIcktOOWY0VitwNVV3WncvOHdlNURkQnZxSFJ4VE1nK2I4?=
 =?utf-8?B?b3Y0cHF2NnRqWkxVbWlhWTFiZklxZTZNNDU3NVd2Y2tteXZnc0I3SGNaaGt2?=
 =?utf-8?B?Wmc4RFZuQmJuMHNza09wRjRRVTVSOHRlLy9PT3ZGdUpWUHBtaFNWZXJmVDBs?=
 =?utf-8?B?cGM5YlIwb095eG9oTXRmYityQXNmLzVEbzNmaGhOYmVhOGNTYzZUKzRlZzJC?=
 =?utf-8?B?eU82MnFEVFVBbktIQ3ByME1XR2Y4Z0tOaUxqaG1xMVBSNk5oM2xxYXNMamxG?=
 =?utf-8?B?UDg5ZTlXY0NqMVpOQWxBRGpISC9hM0Fha0dJeHgvOSt0QW9UemZFNlRxOXh4?=
 =?utf-8?B?VEI4RVF5UkV2NjBmY1NUcmdaQTY3MDRDdmJVWXZkQm5VUkxYaDk3UE9JT093?=
 =?utf-8?B?bGdwQVhaSjNaTCtWRVhGWkJpdzJmOVZHck90U0xsSk4yZ0pHWkZPRzBvRmZu?=
 =?utf-8?B?TkZIN0pPYnZWdnZVUERibUhSVnVnYlhYSWh5SWVUS0RpU0xWK2xsM1MraWVK?=
 =?utf-8?B?dmpNRUN1VjhlQ2RkaFRvczFnZFlpakRESUE1SWFORXhxSnlTS2U1MVp1ZUF6?=
 =?utf-8?B?ZmloWXpaT25zTG1UbGw2bDNRRU5zalU0cXNLNjJNV2UrK05TVkFsNjV2dklE?=
 =?utf-8?B?RzVqMEJKMHR6ajVycDdWNzRZS1VVd2QvTVpHcUtkVHVzeXRZUVhaWXlEVW1Q?=
 =?utf-8?B?Ylh3RWhyZ1JyRXFQZnV6dFdHUW1BQndtcWsxRjJjWmFWTHpOVG5SRlVUbmJV?=
 =?utf-8?B?NUErdUVuSUxYRkl1ZnhJUk5WWTd1UlpFSGs1RUN5eDNIMWRuNXpMQkJvUzFh?=
 =?utf-8?B?WDhzaWhtdGJBQ3JERE5JSEVNdDVVbldzdjUrQm9hV0FSMlJyemZBd1VUMmhk?=
 =?utf-8?B?UFp3T04vaWc1VXV2ZzM1d1V6SVQ3RkJwYlM3WVpLcS85UnpPdU9mcklHNlZB?=
 =?utf-8?B?ckt1dU9uUEZyZFIwVzVpWFczbEwzNGdRM1YxeGFrRG5lU3FpUmJZanJGNThK?=
 =?utf-8?B?ek42L05RZDZLTWVEb1VXWDFKcVdnYVlYWGllTTlhTm9peVdMS0VQR09OMWFC?=
 =?utf-8?B?SS9qSkp5amZZNnNOMGRvMXpXQkd1NlByWkhGZkcrUWtNM1pidkw0N1owSGRL?=
 =?utf-8?B?MngzUlpWTEIwSEQxUlA5TzhtZ2RCT3NNbEE0YmhoVW8rcExEWGhscUhZQjNK?=
 =?utf-8?B?KzlBc21MUDM1RDRKOTdheFdsWndmRmtVd0FtbzlsNXNpN3hHcjdPcWRiYUhH?=
 =?utf-8?B?cmVXSmJBOVdWcDAwUGhwUG5qMTduenBOYkNCNFVEdFhyVzdMN2h1YlFSSHpp?=
 =?utf-8?B?NUw1V0dGVHRXZWlyTG1rZ2lKcTgxZHZvSHZNR0lDdk1Cblg1bGhSRE1RZyti?=
 =?utf-8?Q?Dg6+kZks6PqKfixjYhvRyGzWg3WbxG6TYnPdTmI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7990e63b-0bd2-4874-1474-08d8d1c27aaf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 15:00:48.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAdASi3tH+jpCm9g3UNxZmJYD2tDxTxb2xPT38Y2Tjk7g9GWyMuizOCd2iq0i5RRgLnrez6S3lliRj9xI1H2DtWUXtP3DXYDqPzvR6FYkpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3623
X-OriginatorOrg: citrix.com

On 15/02/2021 10:41, Jan Beulich wrote:
> On 15.02.2021 11:35, Julien Grall wrote:
>> On 15/02/2021 08:38, Jan Beulich wrote:
>>> On 15.02.2021 09:13, Jürgen Groß wrote:
>> What was just an "annoyance" for boot can now completely wreck your 
>> guests and system (not many software can tolerate large downtime).
>>
>> So I think we either want to drop the 3s pause completely or allow the 
>> user to decide whether he/she cares about it via a command line option.
>>
>> I am leaning towards the former at the moment.
> I'm afraid I'm -2 towards complete removal. I'm at least -1 towards
> shortening of the pause, as already indicated.

A 3s delay on boot doesn't even cause most people to notice.  The
infrastructure has failed at its intended purpose.

Therefore, we should consider now to replace this largely-failed
experiment with something better.


Personally, I think ARM is abusing this in the first place.  Adding a 3
second delay for someone who's explicitly chosen hmp_unsafe is petty. 
So is adding a 3 second delay for anyone who's explicitly chosen a
non-default configuration.  In retrospect, I think the delay for hvm_fep
is also wrong, especially as we also have a taint for it.


The *only* way to make users deal with the warnings is to surface them
very obviously in the UI they use to interact with their Xen system. 
That is XenCenter/XenOrchestra/virt-manager/etc, and possibly the SSH
MOTD - not a logfile that approximately noone reads.

To make this happen, warnings need to be available somewhere which isn't
the dmesg ring.  hypfs would be the obvious candidate at the moment.

~Andrew

