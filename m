Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FD332BE6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 17:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95610.180557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJfAO-00068q-EH; Tue, 09 Mar 2021 16:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95610.180557; Tue, 09 Mar 2021 16:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJfAO-00068T-Aa; Tue, 09 Mar 2021 16:25:04 +0000
Received: by outflank-mailman (input) for mailman id 95610;
 Tue, 09 Mar 2021 16:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJfAN-00068N-Bz
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 16:25:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1238924a-880d-4357-a73e-7f672dc246dd;
 Tue, 09 Mar 2021 16:25:01 +0000 (UTC)
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
X-Inumbo-ID: 1238924a-880d-4357-a73e-7f672dc246dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615307101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fp/YStO+ktkcgHk+Zc8qi9P4yFhmoexXHn06iO9Y60g=;
  b=Z4r4neW+joiAQsA+l75yFdrtfmbnEdFO2aFUxLLnGaNUvtVEZc2h26ZI
   RcKmVq1ir/a/hGMu5QVPqXryHwEAya0/vC6OJJAmlzA0HvXUnW2F/XMZi
   N3/MPx82AbtY84cLwY7sD6eSxHAb8zSzUftgOInExg478tPpPRH7ObhQn
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fb3Olky8jubWGzKWhGDYEsB56sHo4DoXNvrb5mJKHNBjCOTyXK3cHrUE6jLm2O9ycrVTewRM/Y
 ioPdjAHT4fv7HbFvfeLkdHgKtaWWGzwb+3GY9Sh/ZS8PgxkBkIkmyPtICK/GYfrEauxGgMmCcX
 tH7mTJC/l5AeHQkGL2cdUbPneNXjHT916Sz3fMH2qrCaRo7K5dN8RPoRmGrgkxeE82uqAQKnfq
 nQUbwJJ+jpbwlk1Qt+5NSRGFLMB/G9CJDJqdYrIJfjpBzv1QU9GoKZBDai2pm8oKecCPMqRoSg
 +/o=
X-SBRS: 5.2
X-MesageID: 38870622
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38870622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jmv6bUbERCx9Z88EoLwQQnVv/zjfPry1oiRqCACktGmLVmjiCxiCZsG48pApjwMkQX3kVWVh2HKMf0Hg0fyYelagS5QkUJsTX5kN6q8KpqGCdn/TsAYwjBscVrckgR1zveQ+Wkk2PY9K05XSKtstjZyK91mkkXfVdL90AacQGIV8eEPBCLJa/awXwTE9ro2rU5p3sYGKY0Ws49kMvvoi1z7i7CUb2hIaKysKG685V6TIdlpsBFbAtg7bdmy7f2D7OQhWj5FsZPS/n0DmWJD4vxKvUNGoVsPOlI0/HITHWG+x3dmOghOt78lydkfebTZj0ODBZfWP67MLEMdwiRJytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO1ef3mSDffnRRp2Ck8LauB0yKia47IRx9JQnaqgBnw=;
 b=kgo/f3y1gKspVaXOiDExArBJnsOblBXwueZfC9mTbPA0mx9mxJ1UG9Nvo9xcpkdg31Ly+34mmQbhwQaGYxdHGjl+ZXHAo3mx/I4e31VmhfeG/ERt4eOnnyhqcfgE/D7sh5ppDHS2u9QG2M1DZRUuq+WQoLk1uDT0eikOa+fhgGSrNXP1IHSyueJmncpSVai6BBJ6Ah9NyaMsS8mIcf/OZwjyfsRwfvvpQ31mwDZ588xUS1+BvJsWaTf1KIDreIOdgcrlkAkpoEmOHGnk/1lqhePM5zhsMYJ7wQyWfShWtsGMpA2LOu/wh6vDphadMcfQN/BH1ORY5rScIqh60cav9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO1ef3mSDffnRRp2Ck8LauB0yKia47IRx9JQnaqgBnw=;
 b=uajTr+DGzoOYHi8ECiIpeUB3qQDkPNzwvYy1Qz9UCvrSrpfJ0Hol9FqGQKI/A6YxD7jE5gS4MQquAZE6xwqehqxGlxiQU+2Ag7Uo0jpagQ4VawXXc939kx6lKnkLtaeSWjLriHY3coYE216pTmYLBmCZFJHnHgzdW9ZDfsYzpGs=
Date: Tue, 9 Mar 2021 17:24:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>, George Dunlap
	<george.dunlap@citrix.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Hit ASSERT in credit2 code with NR_CPUS=1 build
Message-ID: <YEehTbVVjWMaqjCV@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30ed278-f2cf-4c4c-674f-08d8e317dd6f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538C1A5191D3FB48A76AA8D8F929@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORkJS5A0EUFx1zMSP5H9XA0YJP8+d6xNVqP0N+ONKtOMDB65FVl7ifUcjRj0SxLQMfdX5LsGOx3V1BGayEBf14kHPGjbgpjmEcwKj/++jkaUXAc1iTU04YoKIrqvbMFuzQTygtsONS4+YapGrL5wXTJkl8USP8ovSAzu//o+1s71Stvezkjy24Ur1mF8te/Z6znfoVXHejqfWaFekCKJBVm9YE4JsMjY5oc8OOc9gXFoame3di4AV5XRnCKGGo42OSHYHvZ6hhu2ngnpsVa8N/ImT58/oL5UwQtV67eW/Ofs4GcDPf/gzAuFj0oeIdQBlMYmUQ1Ig1Bni/SZlIIuuNeSGxVzl/Z7yyH4uz2fQCpLCmK9lKwNGhoGuNFEIlji/dwAOKqc01Qvts+6QNwudDz1c2pYXoWAOGg2aLGmVrdQeXI9cyfFq9S5FysoYv34OYrq1bMpv5Lsn/CfWk5X9ZJU4NXr8Ghb8jfhkap7qggG2IFnmIo6But2eFJeX/Z0JhC0A0pa+fqF4PQTf4qC4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(66556008)(66476007)(4326008)(5660300002)(478600001)(86362001)(316002)(956004)(33716001)(8676002)(26005)(66946007)(110136005)(186003)(6496006)(2906002)(16526019)(8936002)(6636002)(85182001)(6666004)(6486002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dEgvS1RPNEprZ2EvZy9QTWNGOTVkRU9sczRmV1hRY1oxMUl5K3V4ZDF4bEVT?=
 =?utf-8?B?Z0lmSExxNkVhVVJ4THhacURIWTQwdjNyVmpCKy8xV3RZMUc0ckdDOVlwNjNk?=
 =?utf-8?B?QmVPQXp3R0IzR3RpTFFQRmJXRmtiZ0ltS2k0aVBIeXA4Z2NSN2htck9yNnc3?=
 =?utf-8?B?WEpJejBQTVMzdTRjb3JXdzRkSGdzU1VVWFBDbW5vQU5JN0tSZW5ITUNEZzVQ?=
 =?utf-8?B?OXcwbUVTdGp0cWUxa2hRZENYSm91QnBGMlpmWERxdVpaTEhIaENjUWY4Y1ZP?=
 =?utf-8?B?KzVEcXUwbCsyR1RHcGRvUzBIUWs4V3pyZWg0enNiRTgvcnpxNm1hOFNFVFlC?=
 =?utf-8?B?cWpPUTJuWWtDby90bXF3NzQvYlQwOEZINGF5UDh3MDhTaUNKektya3dDV3dG?=
 =?utf-8?B?N25QM3FnUUl3aXZEODdjMDNOUFV2WE4xQmFPcHNQSWUraXdwUjN6bkVkNzJi?=
 =?utf-8?B?UjVTOUhhVUZjcTAzOGhPUDEwdVhjQTNGbUYrME1qNkdJY3FsL1FvWXN5OUI3?=
 =?utf-8?B?SnJJS252dGlRUlBOK0p5Y2xaYytyUUwyMVhDNytMZXo4V0FGQng5YUV3L09O?=
 =?utf-8?B?VlJuTUdzVS8zZDNhalRiTFM5NFFiUW1Fa2YzaFVjcjk3Z0tWOEsxaGY0WFl2?=
 =?utf-8?B?MmVyVkxEUExLM0drQjNCLzNGemZkcGltVnVXcktYQUxYUEt2bnFIZURSYjYv?=
 =?utf-8?B?eTVIQm45SjdKYW5XR1BPbElKRGZOWkJlQVMzQWE0VGR6YU84a2hnV0tLSW5r?=
 =?utf-8?B?SGJwWmtJNk1LR0hqZU5Tci9rMXlZb1lvMmZSQ3oxKzlrVFhOQTJkUmdPenZ2?=
 =?utf-8?B?VUZlOXMxNUV4QzNPd1kzVmtTYVZEMHVYVzlVS2VzVjV5MnVoUjRuSGhKbHdZ?=
 =?utf-8?B?T0RqamF3RFE1Vnd6dmttZW5aUGdPSzZZRE9TQm50YlZMekx3bVZiQWljVWVk?=
 =?utf-8?B?TllVM2o4WkJSNHFYYWU2SW1zemE1N3BSTXpBNzl4WXpOOVJoYlE2VGYzSU5L?=
 =?utf-8?B?TVlWbmpEY0kyNHhsNFQ2TW5yRFpIalVTeG5hZk8rUkdXV2Z2QXlWTndDMUhZ?=
 =?utf-8?B?eGVjbHVtL3N2RUFnUVZWRGkzWG5vT01yUDd5Q3MxTG9Ga054MjZReGtoem81?=
 =?utf-8?B?eFlkMU9ybmJOMHdTSW9DUllxVHNUUlFJV081bWVyWGJRdHdnUUUxYWhPOFFQ?=
 =?utf-8?B?ZDVyWHFLNmVOaEgzV0VabG01Z0cxaHgrZlBDUFhBWkRkTlVMa1BMaUtubGxU?=
 =?utf-8?B?TmVVODZaYmxYSTIzVFA3MXNrK2FkNUFEaHNEV2tjcDA1VjVLaVdiRFZTY2ZT?=
 =?utf-8?B?UEdEOWttUEl2ZzJVZ3FqbGN2VEVMV2Jnd3hjSE1oQS9kK0NPL1pIWmtOcWJZ?=
 =?utf-8?B?ZkVEcmJaYWNjWFRyRWFEMU9mTjU4ZnFjK25OL01rZEVhTzlSRnROTTB0NWJ6?=
 =?utf-8?B?OGFIM0lscjJkT1hGbkEvbVV3T0hnSlN5bUp3NVJqR0w4bCthaklGWHpjMDdq?=
 =?utf-8?B?ZFFHcytVNGZJVU5veGpsUHZjbndRckIzcFRWYzBFNDdFamxHTlVib0h2RUJY?=
 =?utf-8?B?UXdhUk9Qc2UwUHRoNnh2QmVVV25SM0ZSTUUvc3BiWEVML1RXcTlOZFFzeWY1?=
 =?utf-8?B?RWxCZ1craVJ5NURJUENDN2s4UjFaR3dvcEJGRFFXNE1CYnV0YzMzSzdYNVM0?=
 =?utf-8?B?MzZlb3RvODBjc3EyMVJRUlVZMTlsdWxVa0tNRWY0THlwZWN5Q0VqQVlTcGJ5?=
 =?utf-8?B?am5jR05jaWh3MWVROGpXVGlWWWFZT0ZEaE1JTjZ6K3NsUTBSakhCSVRhZ29t?=
 =?utf-8?B?TG9GOWlTUlo2dmZIby9MQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c30ed278-f2cf-4c4c-674f-08d8e317dd6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:24:51.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWdyiRwB/ib1qycQL3XD3ThRbMihBnVOloBifzl+Buf1MY1bwTdsU3cgveh6gTBoq4UcsYvCH6yd+pIxVxQT3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

Hello,

While looking at the NR_CPUS == 1 build I realized I could reliable
trigger the following ASSERT by creating a guest (note that dom0 seems
to be fine):

(XEN) Assertion 'i != cpu' failed at credit2.c:1725
(XEN) ----[ Xen-4.15.0-rc  x86_64  debug=y  Tainted:   C   ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040249399>] common/sched/credit2.c#runq_tickle+0x469/0x571
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d4v0)
(XEN) rax: ffffffffffffffff   rbx: 0000000000000000   rcx: 0000000000000000
(XEN) rdx: ffff83086c62feb0   rsi: 0000012774fba66c   rdi: ffff8307e11d5d40
(XEN) rbp: ffff83008c8c7cf8   rsp: ffff83008c8c7c68   r8:  ffff83086c66d6c0
(XEN) r9:  ffff82d0405d1218   r10: 0000000000000000   r11: ffff83086c631000
(XEN) r12: ffff83086c6437c0   r13: 0000000000000000   r14: ffff83086c62fe20
(XEN) r15: ffff82d0405d0320   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 00000007e130d000   cr2: ffff88826910cb38
(XEN) fsb: 00007efee038b780   gsb: ffff888273400000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040249399> (common/sched/credit2.c#runq_tickle+0x469/0x571):
(XEN)  ac ff 75 3d 0f 0b 0f 0b <0f> 0b c7 45 ac 00 00 00 00 48 8d 05 6f 7e 38 00
(XEN) Xen stack trace from rsp=ffff83008c8c7c68:
(XEN)    ffff83008c8c7c88 0000012774fba66c ffff82d0404ab4e0 ffff82d0405d0320
(XEN)    ffff82d0405d0320 ffff83086c62feb0 ffff83086c643760 ffffffff00000002
(XEN)    ffff83008c8c7cd8 ffff82d0402f9234 ffff8307e131e000 0000000000000000
(XEN)    ffff83008c8c7ce8 ffff83086c62feb0 ffff83086c62fe20 ffff83086c6437c0
(XEN)    0000012774fba66c ffff82d0405e64a0 ffff83008c8c7d58 ffff82d040249eb6
(XEN)    ffff83008c8c7fff ffff82d0404ab4e0 ffff83008c8c7d18 ffff83008c8c7d18
(XEN)    ffff83008c8c7d48 ffff83086c62fe20 ffff83086c66d620 ffff8307e11d5d40
(XEN)    ffff83086c66d620 0000000000000000 ffff83008c8c7d78 ffff82d040253752
(XEN)    ffff83086c61a000 ffff8307e11ca000 ffff83008c8c7da8 ffff82d040255d8b
(XEN)    ffff8307e11ca000 ffff83086c61a000 ffff8307e131e000 ffff83086c631000
(XEN)    ffff83008c8c7df8 ffff82d04031edd6 ffff83086c61a060 0000000000000296
(XEN)    0000012774fb8f84 ffff8307e11ca000 ffff83086c61a000 0000000000000001
(XEN)    0000012774fb8f84 0000000000000000 ffff83008c8c7e38 ffff82d040255e37
(XEN)    ffff83008c8c7e28 ffff83086c66d620 0000000000000000 ffff8307e11d5d40
(XEN)    0000000000000000 0000000000000001 ffff83008c8c7e98 ffff82d040256844
(XEN)    ffff83086c61a000 ffff83086c62fe20 ffff82d0403953d4 ffff83086c6437c0
(XEN)    deadbeefdeadf00d ffff82d0405d6e80 ffff82d0405d6e80 ffffffffffffffff
(XEN)    ffff83008c8c7fff 0000000000000000 ffff83008c8c7ed8 ffff82d04022dc68
(XEN)    ffff82d0403953d4 ffff83086c61a000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff83008c8c7ee8 ffff82d04022dcfd
(XEN) Xen call trace:
(XEN)    [<ffff82d040249399>] R common/sched/credit2.c#runq_tickle+0x469/0x571
(XEN)    [<ffff82d040249eb6>] F common/sched/credit2.c#csched2_context_saved+0x27f/0x284
(XEN)    [<ffff82d040253752>] F common/sched/core.c#unit_context_saved+0x56/0x84
(XEN)    [<ffff82d040255d8b>] F sched_context_switched+0x14d/0x161
(XEN)    [<ffff82d04031edd6>] F context_switch+0x15b/0x11dd
(XEN)    [<ffff82d040255e37>] F common/sched/core.c#sched_context_switch+0x98/0x1e0
(XEN)    [<ffff82d040256844>] F common/sched/core.c#schedule+0x216/0x2e5
(XEN)    [<ffff82d04022dc68>] F common/softirq.c#__do_softirq+0x8a/0xb6
(XEN)    [<ffff82d04022dcfd>] F do_softirq+0x13/0x15
(XEN)    [<ffff82d040318176>] F x86_64/entry.S#process_softirqs+0x6/0x20
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'i != cpu' failed at credit2.c:1725
(XEN) ****************************************

This corresponds to the following chunk of code:

    for_each_cpu(i, &mask)
    {
        s_time_t score;

        /* Already looked at this one above */
        ASSERT(i != cpu); <====

        score = tickle_score(ops, now, new, i);

        if ( score > max )
        {
            max = score;
            ipid = i;
        }
    }

In runq_tickle. I'm afraid I have no clue of what's going on. FTR
using a non-debug build with NR_CPUS == 1 does seem to work fine and I
don't see any ill effects. Obviously the ASSERT is no longer there.

Thanks, Roger.

