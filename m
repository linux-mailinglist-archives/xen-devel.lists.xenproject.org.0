Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771A2F6095
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 12:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66956.119146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01FO-0002AY-4h; Thu, 14 Jan 2021 11:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66956.119146; Thu, 14 Jan 2021 11:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01FO-0002AC-1S; Thu, 14 Jan 2021 11:57:02 +0000
Received: by outflank-mailman (input) for mailman id 66956;
 Thu, 14 Jan 2021 11:57:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l01FL-0002A6-U0
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 11:57:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e4df052-72ef-4541-b39b-721df266f526;
 Thu, 14 Jan 2021 11:56:58 +0000 (UTC)
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
X-Inumbo-ID: 3e4df052-72ef-4541-b39b-721df266f526
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610625418;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JDPT4Ck3SYFsRb9rzrwZJobmABrxh4ntyXjdA60dtMs=;
  b=EQfsTdRZBJEgE/scjzGnEVtFIoGlsXG8zMVOQ8ryUj/FFbMfyIEjxDI5
   NIDqWxzFj/1jtvKNVjI6MgWY9eJl9mCV7a3JmlnVQZkr0pR50DTKUgijk
   tLPb3QCmL0tpEo6vX6tFbvitkT4MG2lfhCWoPeAvd/+jQ/0Yz37iKXAPC
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OU2TDyjN2t/6m81rpGnTZDk+9XkX4k/TN2nI3IKEoImilYSRqyElTJ6sWOeRY9pOy7ygw0n5JR
 iyRKbbuJiqT1elHLF+BEzOWlWOjyNqVIrPzHNNBGIIzNpE4AoZwWt+P/9rkt3YhWhB1TrbWdXf
 YCEqLr1Xrq1Bn1EgyirnCqt0q2Rhj63icBHCUWcYZE6+rhYHCPcvIXzJwwfa7Y+Jq+ryGrQT2a
 XCpWDHnJ/5eADcs/AAu3znVRKBl5KBfpaKtDl16ClKGnIN5LmXqk96/cQF1bArv7V+UIZZmA0O
 TlM=
X-SBRS: 5.2
X-MesageID: 35075027
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35075027"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSGgc8hN6G6pj7OywPQoWW9IQOf7O6AQWXyjQATpRyQXyipVBFJyK5BNSt+fD65bmEiSy0aHNb2QeQUQJH7bJqdv+JxPcAPfa+0tAXCzY4JLo6m8f++auOoPdvsoC85Njz6x6Gxrf7uChx6tvylnLRLC+wUb43e1/xWmk54spZbKpKX8fueU8J9enERJogeknUp5oUaS8NgvhuVvXDoxMCg65nZpHJ9uMPRXckXcaUJW/Bljocm6dnDNae7rpzyCOnZtcCm3JFpaO1JK0ZR5qbleO//vEppO5HoPeL5jKlBVLQIUIGBIBjGcqtsS64t3FH+RzR5rKR2QLAkbALlWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I0aBHGsvhiX0jkNOConRrUVACa8tdamPU6Ieqfo81A=;
 b=cVC2c8xHv9TqcWPvBNUhrQ5FI8kAnXQGYkpjLGvWyZl6XWeXHTFEtK4WcczCLF0/VAOtblcmbjCR3hfCffQ5nmE3HRJCAdmJKyYQYOBND6m68soMH4Nhp3ZL+DSlo9/Ucwp6xyOMPU8re5zteyBiWTA3AaSVs2ew4S9Gu5UF7e/sPbI1gUnk9IxvcsGJbqH77plDw8MAdzqyPV3kTFd8JgxHYSjzpISIts72jnEgcLKbL/zYMqHuoD095akJJxXg1cJ1I46K/y0qnggCAI2Di1hRhdU8O5MU/n2MT17fWLMjj65iG+RfWfut8z55UDEVIOh8vXCnatWDCLQ/80J7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I0aBHGsvhiX0jkNOConRrUVACa8tdamPU6Ieqfo81A=;
 b=Fexw359/I8FSww95BA1DdotGq1vYAtqF+ePrR2xBXU7MVQ0le0pMcsTmJL5exEteqWiWgWfCtTTfoCpdbqSwv7H+SYwZqVwHV8bl6INURa4Mwzh98WSB88EJM/vZOemWpxwxHRgy9k8uYoOYQ4V3q1holuCIy2kPX3q0ljaeLdQ=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, Wei Liu <wl@xen.org>, "Tian, Kevin"
	<kevin.tian@intel.com>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8da05add-656c-0e18-793b-38ac468b6ed7@citrix.com>
Date: Thu, 14 Jan 2021 11:56:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3acc5de7-cdd7-4cbc-2797-08d8b8837c9d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3416:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3416AD90A95BA18D9CF3088CBAA80@BYAPR03MB3416.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/CqwIPngyRxyBt1BYVpoqr3OnOSKTm/DfuypKBPKvoAEoeQhueLluHC1+6RCR7j7cI0l8hEcIJSNPGLE/YsSuN7Um9fn+IIEnUm2W6OV68lyR2TXxpOIUqrlr/kv4JyKWYOKrn8t4D6vpaYfXyUKavV53WPDqOYNK/ON5SbVDt1P/1NKwj69ojEpjp1Q8jchCw7LPZurpP4PBDMuexH7AtvTOLNHP/yZfEAJeHDdE1WqN2qRUSel3fly7FMV+Ls/DdMhMw9UidGkmqvoCaWRu8QBmM+ldKGjqnp/GVSHGD/f5yrwqCbI2+yKwxL6zobf8WgnqUlGODRUpQxlwy1/x75YDVOOPjLk7CkkIDJ6kZf5y0hvcD7mcfArrUS12RI7A0jCvSb1iXEqhM+Od+F3i7Dvv6o0fN+yvW0el630a/MaYrhyUevwq1faTOLgdPhALRYrB4T6R5C1trBbcVXvAddl4PE5W+L7PWQwLxtjLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(110136005)(316002)(54906003)(4326008)(16576012)(66556008)(31686004)(8936002)(86362001)(6666004)(186003)(2616005)(8676002)(53546011)(2906002)(26005)(16526019)(6636002)(31696002)(66946007)(36756003)(66476007)(83380400001)(6486002)(956004)(5660300002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHQ5S0RHY1VhZ0hlbFVROS9FaW15bm1tSFdHbmo1UDd3TnMxZGY5ZjBIZy9E?=
 =?utf-8?B?ODA0cnFOTGIzanVKOGVySDlGVlo5SFpSWDZ2SHlEQitPc2ZIYng5bGxleTZJ?=
 =?utf-8?B?akVIOVpucjIza0l5Wlg0MFVpRm40ckJXMWI5M3B1aU5HTmc5SGxQcGRJVDQ0?=
 =?utf-8?B?aUhJYS9Ic1JmTVNOeTgxWTdHUEpid0JHdlc5bklEUXZmRC91WVEyekp2SlJh?=
 =?utf-8?B?QUpab3hkVFFDUENMQndhSHdGSDlEMlNNT3ZBQnp0c1BuSFJNUkNGMW4wZWxL?=
 =?utf-8?B?VnUyZjdPUFh2OG5zWHBSOVZESU80NWIzNFNFVExIVDJJOWFCdjhDdTNhY1Ur?=
 =?utf-8?B?a2Z2Qy9wTnVxcGtOTmw0NmI0d2ttUTF1TFJKZGxJY3VhM3I3a3gzd2xsOHZF?=
 =?utf-8?B?a2VWWlE0QnpQN2w3WnlEMXV1eGI3MEU1b3FTSlFQSUc3czNvTnNjS2lEaXZM?=
 =?utf-8?B?WTM5U1kyV0JLbmI4aDUrK2VkTGZUMStDNEVpNmtIaHBIOEw5ZVVXdm4rUkd3?=
 =?utf-8?B?dlo3b0dGNTFrR0dmeEx2UCthMFRPTTlOYnYyTnZQeXNTSjg4aGI0MnpEbHdj?=
 =?utf-8?B?K2JYNmh1QmFHaklZZ3oxSTFrOC9MbUdQZnEvQWNZZWdMVHhnbk9CZkZiWDA1?=
 =?utf-8?B?eXFuU2xLLy8xVGswK0ttY3M2ZCs2YVJPN0FoUTFrVHlZRzNwRThYZkhUeWIw?=
 =?utf-8?B?aDJPOFUzNDFCQ256MUwwMnBad2trL0RiRldGRFVaRVp3dDZaVG5TY3ZSWVFO?=
 =?utf-8?B?ZTQrRXFReFMwbmE2VFJyeEpiWmdCK3B0L0Q5ZGZ3dnlvRmpiSWsrWHpnMFZ3?=
 =?utf-8?B?cjYyTDFoQkIyL0t2VSsxOHR2Ylp4YXVuYm1jdmxUWFBoQmdCc1Y1UXk0Wnla?=
 =?utf-8?B?SEpIZ0l4aWJCNm1aL3F3M0N3RnB1UUF4a2lWcURYWUZJcTdsKzZwVGNyODlM?=
 =?utf-8?B?RWZ1aFJuT3FkSXE0NlhEQ01wNG5FaGh3eUQ1cWxzZE5SeGVsYWRqS2ZmVit5?=
 =?utf-8?B?MWNRTjUwL2RSTTF0elp4b29vUEQwWDV5RGd5K3RXS1pJWUs2NmFwazZBektC?=
 =?utf-8?B?UzErU1RaV1lRYjVvVlhFcEoxSWtsSWxvSm9yWDc2eDFyeXZ2WkxKSUJxa1or?=
 =?utf-8?B?bVhra0tZWFpBQlpJZWJtR0x1VTFCRFpUdGdJZzhOZHF4em1WZDMwaEdJQzdT?=
 =?utf-8?B?SnExdFpLU1BVYnNFT3F5Y3V4dnF1NkFuUHo2YzB2VWNkbVc2OXZHUzdZd29z?=
 =?utf-8?B?VXNvNE1OQVltMDhkL0IyTnFSN2JheWVmbEsrVWQxUkVPZFJJeFEvU3k5ZFZ2?=
 =?utf-8?Q?jNspCOQHxGUFQz3UlRsYYrQPbFaLam7jUe?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 11:56:54.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acc5de7-cdd7-4cbc-2797-08d8b8837c9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RZ8NXrQLtmSE/YqTo6UaCkEAnI3Y4F/PqyHLUocnUlPNA3vCxwCLn2BQRx7z0v9L/zQGK42idKYzYWJl4dN4oOTBEgcUtPu0fNs/eOgnzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3416
X-OriginatorOrg: citrix.com

On 14/01/2021 11:48, Jan Beulich wrote:
> On 13.01.2021 14:11, Roger Pau Monné wrote:
>> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
>>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>> As with previous patches, I'm having a hard time figuring out why this
>>>> was required in the first place. I see no reason for Xen to be
>>>> deasserting the guest virtual line. There's a comment:
>>>>
>>>> /*
>>>>  * Set a timer to see if the guest can finish the interrupt or not. For
>>>>  * example, the guest OS may unmask the PIC during boot, before the
>>>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
>>>>  * guest will never deal with the irq, then the physical interrupt line
>>>>  * will never be deasserted.
>>>>  */
>>>>
>>>> Did this happen because the device was passed through in a bogus state
>>>> where it would generate interrupts without the guest requesting
>>> It could be a case where two devices share the same interrupt line and
>>> are assigned to different domains. In this case, the interrupt activity of 
>>> two devices interfere with each other.
>> This would also seem to be problematic if the device decides to use
>> MSI instead of INTx, but due to the shared nature of the INTx line we
>> would continue to inject INTx (generated from another device not
>> passed through to the guest) to the guest even if the device has
>> switched to MSI.
> I'm having trouble with this: How does the INTx line matter when
> a device is using MSI? I don't see why we should inject INTx when
> the guest has configured a device for MSI; if we do, this would
> indeed look like a bug (but aiui we bind either the MSI IRQ or
> the pin based one, but not both).

When MSI is configured, a spec-complient device shouldn't raise INTx. 
But there are plenty of quirks in practice, and ample opportunity for
races, considering that in a Xen system, there are at least 3 entities
in the system fighting over control of the device.

I suspect the problem is "what happens when Xen gets an INTx".  We don't
know which device it came from, and therefore we can't even attempt to
filter out the devices we suspect are using MSI, in an attempt to avoid
raising the line with every domain.

~Andrew

