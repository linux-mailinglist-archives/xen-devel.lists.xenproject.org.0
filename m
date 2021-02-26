Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0432650C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90421.171170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfT5-0003z8-IM; Fri, 26 Feb 2021 15:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90421.171170; Fri, 26 Feb 2021 15:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfT5-0003yj-F6; Fri, 26 Feb 2021 15:55:51 +0000
Received: by outflank-mailman (input) for mailman id 90421;
 Fri, 26 Feb 2021 15:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFfT3-0003ye-W0
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:55:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a1a4ce8-5d0d-42e5-9ab6-fd419d9dffd3;
 Fri, 26 Feb 2021 15:55:47 +0000 (UTC)
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
X-Inumbo-ID: 7a1a4ce8-5d0d-42e5-9ab6-fd419d9dffd3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614354947;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hJo0c/nJuTsO3JgxsMpT8abuaPjZ57s6f7/I+Ms2B7E=;
  b=hQ5UaYDSHy69jqvmtpzd4qEyf6QD9X+cb7mmmT7IgyB71IWQzWbvLEwv
   V+AO1RqJVv390Tfc+rklgTZvEdfXzr1DIuRWgb958v0CkNBDEQ/B/SwLv
   9GY8ceTBght4lTkfuOJhs1BS7nOxyjsYaIac5aVRnOUzLGTvozAWmqi9b
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8wHP6e79kLa1tVYcmZrRqRVs/kDHvXEj8gM3B2aHXzMcwlENrIzUxkzPk1+Zu15M13jb9avYn5
 SdlMcMenshGkzhhGZI2GZgj9bDiBq3w7Memqlmq819IV1AVzmH9BZjYIjjaWFW3s9U2wlcE2nY
 JHpmi56iX53UZzdE1gUAf4ITTRnxYmxwE/lfwO1IJ557W3ICIQ0PWQsrnYUaUBN3tZwYevBCe9
 mesQIIMl8Zah4UykE1QstIcL3HuJGWe6vTw4r+cdlQjm3GnQUWnyiWjF79iymARG3/iZS1g/1B
 0gA=
X-SBRS: 5.2
X-MesageID: 38132286
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38132286"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htX/Opr//tpXCD4rQJFBsyDqsIjODgPoW9hA6SE6xp7IcVhFW+eMymoBk0RkJWc7uKvfejLHz+D4dL9Foy0/O3JXiBwG1NdM2k5H6KTsjpxflzd5jrDwpMzBXgZZl7sQzgCKA8wFVyKh/APBv/mXtw/3S5SW6EBladzBAj7sovvXS4qn93v/EbDlefZJD+l8qDx6b7epub70vrstTgRsmp+id5ZXqhuWthj1jwbZ6Mlf7WYIsEJo9jTfqPDtrFS5IJzUCn9p6uWfw2GPzXCyj+Jc+Y1bR5+OCDs5cFt56iWnRdm9XIZyEPzNudjeQRAAmwtLLq6jBdkXi358A090KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d97pyAgV5MagtV0sq9xH5n9k/J5bO4lCyXUNK6r1bRI=;
 b=ncevfVhZUde8aIPtCK9bS/l/1t4+ZjeIdQ3sHcen0R8NxnCZXBhQoBXhZGD/vkLDhiRyu/FyTOcPNlx6gLjexO8fXoTvfMJDPscKesDFxAucAP0RKwwTMteJx7VSbagVL5IlWTbjyI7ESVxRy0eHbQFcW+HZTFs3dOPtBu3iX95hdM6hI3THouCiMwNsv6yUdd2EUprSJBrWrfNDiScGu8PPJwnuEGisgrE02sNRtf+OECtEMN755S9557R9tO8aX2bsYnVEVbEzVJehC3RFwoE0nj+me7jMVQkVoUKem9VurG1k5MZAcSFRcmccRDgVDeEzKZngddGirudVWLm1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d97pyAgV5MagtV0sq9xH5n9k/J5bO4lCyXUNK6r1bRI=;
 b=UUvb8sBZqBugmlAfiYAfhqJzKvzAdXtPDC5DJkecXUu5lyv98GnKLIL6DB242ZzqMw9jLNuSp4uhDsGhPFKeBWqtqBDAE+uN0N422A5OKW8H1hHJ0LRw3UaGeHnXaosjY+mN7b4xo94RBbpki/MdXlsEw/gOT1exDe9f4eLeQdY=
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
	<connojdavis@gmail.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
 <0d58bca1-0998-1114-d023-0d8a5a193961@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c6ed745b-3847-b878-f683-2d1041be22a1@citrix.com>
Date: Fri, 26 Feb 2021 15:55:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <0d58bca1-0998-1114-d023-0d8a5a193961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f98b264-0e7f-495a-c531-08d8da6ef9ad
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57755014571C77F19360B28DBA9D9@SJ0PR03MB5775.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHLxogknrEE/ZPwjgqbm15MSCWcxcirmSxqb2jf4/BbSizcDWUmL7og/1FpkX+PMOyIwZoW7SXsx3esNAtFMB5EErn2b+MZX7ZceDbvPiTUUWaxbhKCPHnEIB1pY6rY+LoRykmIzjZeDvREWd1urIK8/+2H2pyJ3xjKjThOkrkMmSd3zrYdPyewjIHFBPiXfLYwS4djCE9luZCOXtsb/bfi23OUaFD8R7TVPqn24XM4r2b8Ld3ZJZSur01iz1amSS1JgQAtcJGSVTnwefjmZCsQ4dSZcLwQKoGpxgCPHTErsVXcMpNX1ula070ir1XKWZkm7dLkgmWYaGCIb3wf2h/kM6N+z/4LhJSxYgFk4HGTdvz3NFtBG8PZrOXkR20zUwNUexyeulJZQZJj/WGLU6pKRoAEX1kDlUHEdQpD85lkhJ1n/DBEWsaL6vetuCHoTLchLMxO3PaLz1rkO8uoW0VwRHTtpolcGfi/lawAOn2eZLfJFovoc2g2gBnh+YlSlGO7H92cBYuZ3CJaXoDKxExaO+hyzomkngVTxazCEC5pDsoKiZBHh+ZcBMtEPBXs7xLf6qfZOlgwud4QtpdmfxpkD0DqUXWl0AP33Oyo39zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(6666004)(8676002)(31686004)(956004)(31696002)(2616005)(86362001)(2906002)(186003)(4326008)(8936002)(54906003)(6486002)(66476007)(53546011)(5660300002)(16576012)(478600001)(66556008)(16526019)(316002)(26005)(83380400001)(66946007)(7416002)(36756003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVJBc2l3c0txL3J6SzV2VnZoekFocjNiczNZeUhFb1FaeU5uREhHWjl2bU80?=
 =?utf-8?B?d1B3QUd5TW1pK2dTdmFFNTlHakNLYWdLbVV4KzVScTRtWEtiRElEczk5VHJz?=
 =?utf-8?B?OVI5WlBldGJlV21jaDVXOElxb0h0NWNGK3E0TUxyMkt0Q0lSd1BNSUgrQmpp?=
 =?utf-8?B?aUlkRlJPWCtNVCt6dFNiZkxMWWlOMmFPUllGVVp4THE0VGZiTGZkbU9BNGtz?=
 =?utf-8?B?SVk0OWF4ODl6QlJaRkl6SXo1U0VRajhCVUp6SG54Tk5seXRxY1g1KzgrdGxq?=
 =?utf-8?B?OVdwNFkyL3dtalRieDFIaWJJd3NRMnNyd0dEdTludXNUS01xSVNTcWtJeEsy?=
 =?utf-8?B?c0xrVC9lSEI2RFFIUURRNUQwU3liNUVseEFSSFgxUzdkZGlMMGtPWjlad01V?=
 =?utf-8?B?bitwbGFMMXk5czBJcmZLcG41cGNaM2U4NmZQMUkvdkd4WXMrWnJsNzJkVytL?=
 =?utf-8?B?Sk5RZk5ITWw4Zjc0TzNBOEhaOFdwMkhaVmpwcmFVUGFMOUhOUU1FWVpMRWhG?=
 =?utf-8?B?WVhCRkYyNFZHK2UyU2h4cURJUjd5UnluMnI5cmtIOWUrdmNQRDFSQXNCYm41?=
 =?utf-8?B?VW5xM2p5SHJEL0NuRGtCOURCSFlaakxEV0dKMHdVbkljUmFlR0tKU0loSi9B?=
 =?utf-8?B?MjhCOW1YSWNKR0NybmpxZGhVbGJsODNVdUJybFpNNmRsWmxXSndud1E0Sy83?=
 =?utf-8?B?OTA4ZG1CWUxBbEgrU1h1d25vQUFZWVA2ZlF6MXNlNW9hQzhoVkgzbk12RGMz?=
 =?utf-8?B?cWIrL1Jtb1plVmRqZi9MNEFKMXVzYzR0NFdNRk9yenRRWjMxQlBOWFJiMGpW?=
 =?utf-8?B?Z0xmV3JUYW5kUzdVSkRheHBlUVRJbVZ2RS9hcWhIOVlMTGZlUlAxRlpWRis2?=
 =?utf-8?B?TXBXWU4vbVM1U3U1SU02bnA0aC9vZXcwTEJoMzJ3ZUhKZy9Zc1JFS25CQitm?=
 =?utf-8?B?K3h3VU5PWGwvNWdwbTJOQWNqcWdreGtQdXExdUs2SitZYStmZzJWY1h2bTZM?=
 =?utf-8?B?NXNTQk1ZSS9mVlhNUjZLNS9QMkxLSGpQMWJDMWVTR3paVHcrQkd0VzlrVXdx?=
 =?utf-8?B?U3JnTEdHRDdKdjJTempjTkh4R1pHc04rcWhTeEQ1WXRhMzZMaUtyZWdMVGpz?=
 =?utf-8?B?bm9vK29pTXZTK2V0djBwQys0VEgwM1BZQmRVdVZxWkFlV3hlSllGU2xSWFkx?=
 =?utf-8?B?c0FENDkrKy9tMnB5ZDAyTGNtMzE1ZEgwTlROZHFGNDMwVlBlczh4TDE1Mkds?=
 =?utf-8?B?cVBqNG5URUNBQVBhcVlQdElNMmVwYnQ3eGFuNHJmVllZMEZJM0tMRWFYSDFW?=
 =?utf-8?B?L1VEZ1g4aWRrNUZGVGlsWVhjelAybGpWTzVxZHdEdS9JcGxxYXRhdjZGY1lX?=
 =?utf-8?B?d1pQYzRBUENzbXZPS3Q2YlNWbnp0dDZhRU5BSmtSeVIrV29ieXJUR2dXanNN?=
 =?utf-8?B?ekhTVm5XMEJGUTF1eDNFSHkzR3BXb0JpZThwdkJ6OFpCYm41TXVYZTdXZUo0?=
 =?utf-8?B?bmg5a1dqVDdHOC9HZ0pVdjc3d1llTFY3OEN0TGZhZU96UXFLSWxWbHBlZVBn?=
 =?utf-8?B?ZmFnYm9veHJnSm5kQ3BwNkZ1RGhzM2Vya3JRNjRwWGs3RVd3ZitwOXp6U2pB?=
 =?utf-8?B?QmRJMXNoY3pBcDQ3NHcyN0NVZ2ZXVVlMOHpYeTh0Myt2bHg5Uy9ZZFBMK3J2?=
 =?utf-8?B?K3J1bDBLTUc0MjJVdnlDR0RJT3VCTGVOQjI4ZGI2T0tBYS90enFhcytPelZj?=
 =?utf-8?Q?Oms6ooZoLeenM4tcRVEv1cx9rpZyvLvhtf1BeUN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f98b264-0e7f-495a-c531-08d8da6ef9ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 15:55:44.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5pjS7b2J0IIs+RGgQqKWqzM+/lC6TdhVah29bFFixOP3BQ/KZOH1Vhjnst2PThk7J+m7/+8Xw9NwGFysZT18NRtfuTwRRXPDJJHoAZ3XNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5775
X-OriginatorOrg: citrix.com

On 26/02/2021 15:30, Bob Eshleman wrote:
> On 2/25/21 3:14 PM, Andrew Cooper wrote:
>> Well - this is orders of magnitude more complicated than it ought to
>> be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
>> majority of this.
>>
>> Do you know how all of this is being pulled in?  Is it from attempting
>> to compile common/ by any chance?
>>
>> Now is also an excellent opportunity to nuke the x86isms which have
>> escaped into common code (debugger and xenoprof in particular), and
>> rethink some of our common/arch split.
>>
>> When it comes to header files specifically, I want to start using
>> xen/arch/$ARCH/include/asm/ and retrofit this to x86 and ARM.  It has
>> two important properties - first, that you don't need to symlink the
>> tree to make compilation work, and second that patches touching multiple
>> architectures have hunks ordered in a more logical way.
>>
>> ~Andrew
>>
> I think we may have envisioned different things here....  I was under
> the impression that we wanted to implicate common, so that changes
> there that broke the RISC-V build would present themselves on CI...
> and to demonstrate which "arch_*" calls common expects to exist.
>
> It sounds like you'd prefer no common to start and none of the
> arch_* calls it relies on?

We definitely want "stuff compiled under RISC-V" to be caught in CI, but
that doesn't mean "wedge all of common in with stubs to begin with".

Honestly - I want to see the build issues/failures in common, to help us
fix the rough corners on Kconfig system and include hierarchy.

In light of this patch, there are definitely some things which should be
fixed as prerequisites, rather than forcing yet-more x86-isms into every
new arch.

~Andrew

