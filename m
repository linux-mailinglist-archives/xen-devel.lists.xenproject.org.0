Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D48132D4EC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93268.176062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoeU-00045P-GO; Thu, 04 Mar 2021 14:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93268.176062; Thu, 04 Mar 2021 14:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoeU-000452-D5; Thu, 04 Mar 2021 14:08:30 +0000
Received: by outflank-mailman (input) for mailman id 93268;
 Thu, 04 Mar 2021 14:08:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHoeS-00044x-S8
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:08:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99d0fd85-1fe5-4335-b703-154b7bbd7ef5;
 Thu, 04 Mar 2021 14:08:27 +0000 (UTC)
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
X-Inumbo-ID: 99d0fd85-1fe5-4335-b703-154b7bbd7ef5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614866907;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9kY1RiySxJVmmLrMh4G/PkrsIu4+mS6ldgF6SoRjiL0=;
  b=bd0IKa85ogjK6o/GWvziehUeSl1C/Zcr/BbwK6bqdADWpXXbMD+b4Ou2
   A6yEfv9B2WAEddEIedjJ8Z8MIv1lUUR6TwoCkaFIOys9T6q7v4i080FcK
   ym0Tc6tXfK4jj149GbQcRhU41pGdDIDf/FgoqEnYGV0xJ97sLR1JcBC2j
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jKOASyZRbuJvcKIjLWOyyETmKBNpP2RoSclQvuIhQ66R7/Y7gxJVULjJrwismzVLGcS5mis7yE
 4Be44oh5pOEtzkg1y0/rrqe0dQ2+Whav0YVG1M7eOdl3284bm49G4VnphbOepwRtidkws5zBdK
 jaFnxLcJhMc1v68asveIEqcfknD3NoavS3qOHlWAIqocu+JJujudV2EaFPa1fpGQO6EzbXF1kn
 xM/T6+AHbxCwDpdHQ6cbNwpy99fgFVcvzJFX7ZWJltQ9mNnunv5qYq67L7plZQEa51HBT1YoHv
 fkw=
X-SBRS: 5.2
X-MesageID: 38452962
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38452962"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvFj4TWZevPa1/zBdke4C4RditX4s3wjEGkfw5r5BezKe0bvMrtkxSjUboQAmZv1VOR6ihyu7aNNb68YuqtkQlgHni1aXnfdWjJ8hf0m/9QnzDHKJ2CPfZMZrr30iTaPNIbbrvgG2FPJsdFuJ2yXgJNl2hNsWkh+8lBpYbkDNC9auO0cvwbkUN8ClG37v5o5rmWLNyQsh5nek9KfcXhj03XdmF21JGIukHU38DfyaAxb823/SH0GaKisI9QOfjAWXsK1PatCITC80SlRbH3TJXY/oLw5vM2Yg+AHw1JREHyhFtC+ti4yR1whC4Z738oodJBT278yFrs1xEAMb/W20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kY1RiySxJVmmLrMh4G/PkrsIu4+mS6ldgF6SoRjiL0=;
 b=dTxJJ5ft/SctA2hprj257n2zafSCyGtcjWWz3qHiyXqFp9Wb4fWCTqM6kJtfRa9pGh+JC0c/E6nsn3GJOOoSyCZ5PIfYRfmpzKqcQZ2ZBrTNaTMh5zAMRwitoTaJjLEyVxrK8tnSNvnj1irWkm9h/jeWvtWfIufOd4AcEalSIhvlpy0oUqAN4dYBPvHbcMrtFwih7cUA4PBy8C1nb4je5lDT6fyjZY4VHIUyOVvfSd6g3LeU8GlwQpodjPVYwXKARcHAxUWmBr12vradfu706hIw6mYrQ8w/n0V2J7nZRBGKAkDLh3UYk2itqpmfS5Oowwunf9GZcbnsMc2Z7l5dPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kY1RiySxJVmmLrMh4G/PkrsIu4+mS6ldgF6SoRjiL0=;
 b=hRWes+xGolaS7wV/AdCXAHibCfFnV5zrbQ8Fuli80QTeSPjnOLASRR/TS1HDB4jvrjxGIN3Zsas6pzZtvsh3ELVZbTU2hUJxeU4g0o8gwR9eVBZ/zLvu5WgYqF4STg9xQCJYZmaqiW9N7urt+ph5SptnJj2Jbe674zrB7il4lfs=
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <ab081f2f-265d-78d6-0af4-21eaf2b9de4b@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ca3c4ab0-3bef-5b9a-550b-b38dda63db30@citrix.com>
Date: Thu, 4 Mar 2021 14:02:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ab081f2f-265d-78d6-0af4-21eaf2b9de4b@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45aaecde-6ab7-4a0a-57f2-08d8df16345d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3429:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3429D05A82591CB2FCF46E1DBA979@BYAPR03MB3429.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDqO4W/GqxgpEkymOCb0VbA7cKbNyYzlApa/LFOQ2CQRgVL0I4lGyD8bAo8J2GwKD4HdPFC2sUzoCAU9pG0GmdQRvILYeQJbSm2W7bzcOYP2sjMxL5qhzMmkHSSo+z1blrp+Z9A7g4AWUYsNw9BjG8UGHGWjtl1v1DVYGwjVO8mQtLszOH0Vb9gA4P+bzIZuVntzS22892Ey9pMcH6h4qJ300LkyEm7x0yj2mNlwYhdls8xo9VMieQWtzk2fcK6izIfwXdmso9MqD9HTaO02GZCdEGsT12TFCdmcaurLSk6f5YEiNK+taAgW8WbYgF+A7P2QXwFMVFPrDsT6E+VIwEdPC2LFKqX26Qhxwf5mYTBHo6tz8rZqRjNzoKNN3wQZfMn1JEKq3+QKldwhZN7jCCtYiF/RNKUGkMRh63wRoXt/NUcfKd6L1Kdrl9u0zLrdrkOnZzQJ3QWlij5YFjU47Fv2lI/LfT3JEWM66s9wFTDvWQDnHxhypKME5sMZp/L+XjxrzP3LrkRXBwcviO66rFgaU65/JatUFgrGDn5pkt1GNGl7lmzMtK1qRPBInTu3PBcESN5jjpWKZC6jWL4KlwBSqYh8LKs1cAVUnvVhRUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(5660300002)(2616005)(66556008)(956004)(8676002)(6666004)(6486002)(110136005)(66476007)(31696002)(36756003)(53546011)(31686004)(4326008)(8936002)(86362001)(316002)(26005)(186003)(16526019)(66946007)(2906002)(478600001)(83380400001)(54906003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enNIenhYbWRZdnJpTDdKdDBoRzdoVm9OT2VMOVNXYk1XTS85QnlzSStpTmFY?=
 =?utf-8?B?T2NzUDJEVkZWTERUazR4OHFmelZKWU5kOWs2YWd1ampmZm1ndnk3VDhPcGl0?=
 =?utf-8?B?cUdIZXp5S0sySm5QNXJWdDE1QmYxTktPeVQyRHRRK2hYTU8rVDBHOWY0L1Jz?=
 =?utf-8?B?S1BhU29XZjM5cmNFQjFkUG1RRmV2NXJLQlBibmtHRHk4bUZvd2N0cFlxWms4?=
 =?utf-8?B?N0xtaXplSlFJWWlFNy9lRTRpSTFMa3VOdnZFamtORmJIUWRiL0pBR2lrclhO?=
 =?utf-8?B?SjE0MnVFQ0VLVG5vdzd0YTdpVk1NSE1wanZVdk8vZ2VxbnVBb2tJMFZNSGQ2?=
 =?utf-8?B?cTRqYlYwUE5OR1ljdUc0b0pPMHJPTmxaR2toSVlzbU85NWk4K0V5ODFpbnMw?=
 =?utf-8?B?OUo5dHRQWlRlZ1pjSTJyUUdwWHdNbXd5R3F5MHpHbzVCdW5ocEdsdlJFNVlN?=
 =?utf-8?B?Yk5GZ1dPVElzclVRQk5nK0kvSGFOZ1gvTnBTNHlOZnErcmxibUZ2MFE1VHlV?=
 =?utf-8?B?TDErUUNRSmNGazFGQUhIZHRybTFjKzU3TzA1NHBlWVlvTzdCM0ZiMEhPL2pI?=
 =?utf-8?B?S21HdnBQcXRnM3hYY25OcXh0UVI0ZFkvUWtoT3d4M0pCb1BFK2NLV2Q4clhO?=
 =?utf-8?B?YWw3YzcwK2MwTWtjeEIzcERmOWh0RFBMRERQdndGWk04eGZwRytoRTBFbU1q?=
 =?utf-8?B?UmFXUktRdHVBcXJHY2NWWGZHWGlLTkhqcWJqOGdKTmVoeUdZOC90NWxnM1Qy?=
 =?utf-8?B?RExLSmVWMk5MejVVbTZCQWxnRnJ2UUREKy9GU25JMW15RDBNVnVFUnNNV2Rj?=
 =?utf-8?B?VUtlQ0Q1aWVWNzZRd2dCZlR5R0FOUktNVGJHNVljemxaMENEZHJXdWFoQ0Nw?=
 =?utf-8?B?aEg5M1lla05WY0pNMld5eCtKcjFLeEhibmJuT1ZsK2E5NWxIZ3lpMFUvV1NF?=
 =?utf-8?B?dkhlK09ES0RJUHh3UFp5RHk2eDZwalZZZzF3aFkweW5iTFI0dE82dDNxSlNj?=
 =?utf-8?B?Uy9ORWlPZmFFdFJMTTkwZGZ6aTR2aC9TUEhMTG9FRml6WGpSTXNIRlB4MDdr?=
 =?utf-8?B?L1gwY1BXMTZVTm1VZExrdWlCREpDOE80d2NmTkVIQWFhYm45eDByUFlnaWVN?=
 =?utf-8?B?QUNUSW51K0lnWEpLMEVzbWREUGlXQlNGNnB3cHU3anlYdnlkc0QrSDlyK3RV?=
 =?utf-8?B?QlozcGFOajZsSXZHdWpFdm5wMmxzeEs3NWN5ZW02SG9FRGtXL3ZOT3JpN3hy?=
 =?utf-8?B?N2tmVWtURTNwbnpXZlUyUWZpa0ZuTU9tRDlmNEpmT093WWdWalpYYkpiL0hN?=
 =?utf-8?B?N1czSWE2cnlSbzlsNS92ZTgxdlF5TktHYjhXNzZTYlVRd0ZHQXFlb0RYem1Q?=
 =?utf-8?B?ZzdlVE56SXdBcnB6aG9abEd4ZVZkRkdWcUNEdzRMODQyWC9OK1RzTFNiRTNw?=
 =?utf-8?B?TFlGSnFOZG04NlRVMXgvSTFKYWJGMmQ4YjhUcnZFdmpvTG40MmRlVnJubjVz?=
 =?utf-8?B?dm9Fd1BLU0hRWEU1dCs5RUVhcmNXcndjTno5ak9STThzWTN3RXE3b0FYSndi?=
 =?utf-8?B?T3RwY3E3aE8xVklHV2Zad0QxWU1BUDV1M0hMaEZyeDc3OHVKQXhoTUFZdXQy?=
 =?utf-8?B?aUpQYlhqQ3BCbW54NFRDL1JJa2dyb2N0ZXBNb0wyOUtYK3Jxa2ozOUNEWXJv?=
 =?utf-8?B?R2k0cHVuZ0IyVlhCY0tmUTlvaHhUVXVOR0VPellMc3ZwMlJLM2hzOHkrV0pY?=
 =?utf-8?Q?9fz082DfayDpRlKR2lBPYqS3zwvMRFV7mEG5oPq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45aaecde-6ab7-4a0a-57f2-08d8df16345d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 14:02:54.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccqnGI9sMDR/E+ZMaKmVYfU7dkGakV2EVqnn2nZs44I5gBxE2CyQJwwben/RTuKeW56H07ZFkmqak3dEDoz1jTCUDSSb3725rYIc0igv1Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3429
X-OriginatorOrg: citrix.com

On 01/03/2021 19:33, Boris Ostrovsky wrote:
> On 3/1/21 11:23 AM, Roger Pau Monne wrote:
>> Introduce an option to allow selecting the legacy behavior for
>> accesses to MSRs not explicitly handled. Since commit
>> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
>> handled by Xen result in the injection of a #GP to the guest. This is
>> a behavior change since previously a #GP was only injected if
>> accessing the MSR on the real hardware will also trigger a #GP.
>>
>> This seems to be problematic for some guests, so introduce an option
>> to fallback to this legacy behavior. The main difference between what
>> was previously done is that the hardware MSR value is not leaked to
>> the guests on reads.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>> Note that this option is not made available to dom0. I'm not sure
>> whether it makes sense to do so, since anyone updating Xen to such
>> newer version will also likely pair it with a newish kernel that
>> doesn't require such workarounds.
>>
>> RFC because there's still some debate as to how we should solve the
>> MSR issue, this is one possible way, but IMO we need to make a
>> decision soon-ish because of the release timeline.
>>
>> Boris, could you please test with Solaris to see if this fixes the
>> issue?
>
> Yes, it does. Thanks.

Really?  This doesn't stop #GP being raised for RAPL_POWER_LIMIT
AFAICT.  Or am I mistaken about how the bug manifested?

~Andrew

