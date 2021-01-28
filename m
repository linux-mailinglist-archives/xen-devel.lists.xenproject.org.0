Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6E307A72
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:16:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77215.139717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59xe-0002lC-NN; Thu, 28 Jan 2021 16:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77215.139717; Thu, 28 Jan 2021 16:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59xe-0002kn-KE; Thu, 28 Jan 2021 16:15:58 +0000
Received: by outflank-mailman (input) for mailman id 77215;
 Thu, 28 Jan 2021 16:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l59xd-0002ki-Ev
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:15:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ab2cc71-0d51-4457-a6cf-2372a8557f19;
 Thu, 28 Jan 2021 16:15:55 +0000 (UTC)
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
X-Inumbo-ID: 1ab2cc71-0d51-4457-a6cf-2372a8557f19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611850555;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zYtGYVHBV3W8cmz2Qu6bKGGHOC/8JYR8IlMft1cxwak=;
  b=AIwpC/TBb+ziY6fVuOtHVi/sNvN8ujwXVJy9x6gPx0YhwrIoD0sCs+mc
   ddn5fpKidkluNonwC87JCzOshkNyn42y4loiqKcnYss2UdoGAhSIhgjfm
   m2qxYEF2YhmEzXJ/b3IGjkEX03pvzYi1kxGMBOUuuR6d4UYmUYuBzHsAW
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7mrWWIlQ5UtNggwv5Qoh9nXYWnvyreLi51ZdW1GyfTepUfpnj60srZ9Re5OOLCguDFDdX9IYpa
 VYlg5VtDVHr0lpUQwFV5OAcCnG5FE+RQMiPq9e1blWoktfvyZPqoiNmeGzZ84j9/nf9hDUK2HT
 qkfkZwEfnfLtYVkcsVcuJH/AcQKpNTqRaCKfBIZwfX0Daq/HWULn+fxl2NatpuQpXFvIApMl5/
 5zoxlIUKLobcCbjgbd6MpwcLULEwSJ/6fN96/hFpGo0d+GF87trdBFZ/Vd6pwsgBFVqS46vPha
 oLw=
X-SBRS: 5.2
X-MesageID: 36039850
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36039850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWwCU7YMbaq9rAa+gz8fC1Te4KLXkjQ03e1gR2mOgMnqQgdMr+I5YAfxhgP42ZTx9Mnnn4+rrH0rvmqHERu6QZx6MRkh959VtN/dgC42dL6tPQkVDn+DKZGYRp8T7zsJvT2BOV57tfroUcN++O16d7T2om2L2gX585gcdIJ/oDDHnI5ds33Th2KkGVTZz2NE2UB5Ji7iHqm46Eicnqdu7Q35aJVwHrxkxO8Fqzy6ziMmBwF5MaF/vGILIueqLmgaGTCATo6PBU3bw36K+L7+6oLtJlw0N7u9Yvkk9QPp0S0xrTi/V+W8APdG8bViDxkoRJuHd3NDB5NJBXOuo7NA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQlIm+zieN7dyvA+VOX0ssXBk5xfaDJSQWuDfgFqbGM=;
 b=HmHdQWQYyegXnmIsefdVbfS96ysdyfSXzNrD6zqGaf6NnpltPTw5RcZpblVdtxUugvg47oBjtLxzCqPQTpJLvzOrK23exL5AZZNEa8sSxn4JaC5m5WBlH7zbxmY404LiAbYb0C+StB8aw4tnl+erjRgYJQDcblVoLdcR5rdUB0e7hNpqCIyC46YJoDkxsEG/n64QPz38aA16FFI35yAjsNlgKRM0TmMAjKWjJ75RrPqCE3CjSOePtHS6l+Zxl7L92V9qJTyvI92LAbjON3GSWMAZF6fjcJtJZ+Vlgn92RgQOBBtLzxZUlkUfzwqbOFcEB+r27aZ0W4js5B+D1oaEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQlIm+zieN7dyvA+VOX0ssXBk5xfaDJSQWuDfgFqbGM=;
 b=KRr/a4HF26OVSrNDKRcunKkK6F8d4a8oyD5p750YTZhlfS8BXncf9xTCaO4rPCGAx2Dc3/YkqPOrGi9aZqo0jZHn00VjxnEM9wvc4U0U869X+gsaZ8xjVRFmaJoXnaIApYwI/ZMGD1XT8SNPeklL8VhL6ko801Fg3rhdmTZwV+I=
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
 <f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
 <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
 <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
 <24594.53081.646632.583737@mariner.uk.xensource.com>
 <a9fe45ac-8503-7b9c-a8b4-bd8e767a11d3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3accb53a-9f6f-ef74-9e00-fb0affef9b8e@citrix.com>
Date: Thu, 28 Jan 2021 16:15:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <a9fe45ac-8503-7b9c-a8b4-bd8e767a11d3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83f39917-91c2-43c6-13e1-08d8c3a7f998
X-MS-TrafficTypeDiagnostic: BY5PR03MB5110:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5110634B4BC88458434B78E2BABA9@BY5PR03MB5110.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1COMPDM8afN0AqrVRciiNrtru5sy4QzdcB9o8jMF23jkvLPLDyewf3M5UXsQesxFmYJSXrJSEO72IStpuvzIxLkvVPMXs/ngzlMekLDiZ4D1oY/ufWYZj76s4XPMllwvrVoqNoLn3wYryR4DFn8lr0EZ7z2/wtTYL9QC+UJg413EgTvamYrrQ7yjLEqCpRYh0k8SNIkhJ4grOmR3RvEPmXEp/OIFqCCuaOc7IIIAvAKZz0rUJc0La7pI0VocuPASJkzYUCc74I6nMjhFNrLo8eeRuCBKQV0ylMm2OB5mEfQbJh289F/Zmo1gr1kh40ktuf413nNTWFDf52i88JbCGZb4uKUnh8hmb/o2bHm5WqHzAP8g1JJ9TZsLDNOSdHGVQjFGOCH0HywIaSrYFNgOTJpAqS5PCEWt52SN8ElYGq00hsf6RXJz8LUmMFdWt/UECXbFsAyRGUAsrN/X4TcgvCSHHQ9ND+pRqrLFRYqWtjXaVRGd4sqXlL8pwBAxWa4mFsCsCa0RaGd7Ae6APe4iWBPpv40SYEywWfTV01eRorhaBnivqBwm4/QOAx/P37uOo70xl8xnZlLMQkvzWLLfhBEKnt0T+OrMyNPq15EEhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(86362001)(26005)(54906003)(478600001)(6486002)(36756003)(110136005)(66946007)(2616005)(5660300002)(316002)(66556008)(66476007)(186003)(31686004)(83380400001)(4326008)(53546011)(16576012)(8936002)(7416002)(16526019)(4744005)(6666004)(31696002)(2906002)(956004)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SFB4UC81ZGM1dWptaVR5cVd6MncyQ252REQvNGh1bU51VkxvVWV6QVhoaVlV?=
 =?utf-8?B?ZEZFbEt3azBXQnYvcVZIbzE1ZFFwYk9zTmM2cWFDQ2N4VkpnQm1TYk5CWkRR?=
 =?utf-8?B?YUt5OEo5ck9oUTlWRmNLOW94ODhId2s0eWRQREJ6Y1kyTXZDOFMyeEN5VkFO?=
 =?utf-8?B?MXhNNGZyOHg1bU4ybnVocFRwV0k5ZGI4SEhWQ3VhMTVhTDlKRjc0b0xzRW9Y?=
 =?utf-8?B?Z2cwQWFUZytDbE1rbFFyV2V6c2lRODZqbk1UdUcyZ253eEFrZWRqeGtRMGgw?=
 =?utf-8?B?andvbzhOWUhUTUM5NithWW5Fc2pmZG05WG1DUnkrdExWbEdQcDFZVDVPa1c0?=
 =?utf-8?B?KzI2ZWsxZndLK0RzV0dqUWpwdmlSdnl6elNzK1NyYjJkQjBNS21ZZXE4Ymo1?=
 =?utf-8?B?QlIzWFNsRWhGeUErdlRYVi9maWhsYkozMkpEdzQwQUpmVkoybGdWbUwzeDkv?=
 =?utf-8?B?YjVRZlEwQ0x1bDB1RkI5eHhPcHFVVUcyd3Y1Sk8yejVLbWFMUExad0tlL2ZI?=
 =?utf-8?B?R0Vlb2xvS1pYMGFWcEtDM0Y1aG9uSXNVVk5IQU5nNWtkdkN5bGszMDVxOGVK?=
 =?utf-8?B?UnRuanZHNzJRVXQvaFZGSUJWY0dSOUlDUHRCM0tRMEZ1b0trSDEvL0RveEJO?=
 =?utf-8?B?SzgvV1FraFpBdHBkRWxERkozcThxY3dpL1lqZFVGVnJ0aXRVVGxucS9DWnpJ?=
 =?utf-8?B?bGgwVnVUUEo3N0ZkRjZIZ2dzQjVreDJjYWhzQ3RlSU5rWjA3eUh0dW01RG5u?=
 =?utf-8?B?VVFIbXIyQnBjNzRScUptOGZ4Z2JEMWlYU0hXaEdZZHN0Tnp4Yk8rMHRtVzlY?=
 =?utf-8?B?dXdyRWE3N0dSNEZjdTByOFo3VU1OY3BaQk1EdUgrcVVwWXRwL2pjTjd4bXk1?=
 =?utf-8?B?QnVrUWpScVkrYkdCYjBDOGJNK2d3T1RrZDRVRzFONUdCN1dXRUUrL3ZkU2Jp?=
 =?utf-8?B?dDJJS2d3bnVQOFJ2OTgwb0I2dUlERWw5dmwxVG14YTVtL05OVU5KMXNtUHdm?=
 =?utf-8?B?NVA3RkVNMkVLVVFlUCttUnlkQm5zZTFEQVVXL2NKbG0rLy9EQVlhYktodTVY?=
 =?utf-8?B?OFZPRTlVQllrSjVUMk1zcmRjbDZybFZCODlpZFdiMThuMU5mZUhQOVM4dE5W?=
 =?utf-8?B?WG9CUFlxYWlDQy81NzJMRTdGQnFRZHBQUFZ6ZEo4aklSN2g0dG1CeFYzRHo1?=
 =?utf-8?B?aEpTN2k1WkNUa0NHcGg3UXlWdGhGc0FvWDhFT3A1alM4eDVNaTNoa1JrZjdE?=
 =?utf-8?B?NE9jcGZ6Z1hCd1AyaDFGRkVqRDVudjlNdk55YjUwMy9QRjdCMEtwYnpQblNR?=
 =?utf-8?B?TUtIWGc4WkVnVVAyRGd0TW4zQUo4MncvNVFNU2RyUkR4ZW1Wc1VIajMwcE04?=
 =?utf-8?B?WGxBQXM0U3JjWFJmQ1VsMEFMYUNXSy9pcWgxSWNiVjFjUTl5VDhDanBKTVlG?=
 =?utf-8?B?MDZ4VmtQUE1RbFVrWFNSbnpHZU42MGdnRnJYY05nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f39917-91c2-43c6-13e1-08d8c3a7f998
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 16:15:48.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGnErcIPfdD/F4e2YMdhhgUIlWuuohGi8pwbthJa38gcmm/BKVeRlYE+j296keTVDneeJZbsY1Cnma2ChmxmR1v+/utcf/pQ1+qddXhx4tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5110
X-OriginatorOrg: citrix.com

On 28/01/2021 14:54, Jan Beulich wrote:
> On 28.01.2021 15:51, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu"):
>>>> Removing entry.o or asm-offsets.h before building doesn't help. Any 
>>>> other idea?
>>> No, I'd need to know how exactly to repro and then try to debug.
>> IMO this problem is not a blocker for pushing this today or tomorrow.
>> Unless someone disagrees ?
> No, I don't think this is caused by this series, and Andrew's
> reply of having noticed the same supports this.

I agree.  A bug manifesting in exactly this way is already present in
staging.

~Andrew

