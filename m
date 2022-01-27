Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA149E4B4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261488.452831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD5rO-0001NO-Gb; Thu, 27 Jan 2022 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261488.452831; Thu, 27 Jan 2022 14:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD5rO-0001LK-DT; Thu, 27 Jan 2022 14:34:50 +0000
Received: by outflank-mailman (input) for mailman id 261488;
 Thu, 27 Jan 2022 14:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD5rM-0001LE-8q
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:34:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4634991e-7f7e-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 15:34:46 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-53OY9-E7O9qVj1UqI6QNOA-1; Thu, 27 Jan 2022 15:34:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:34:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:34:42 +0000
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
X-Inumbo-ID: 4634991e-7f7e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j6uvKqA9HgHe7EOgU3bZKcgbjXHaT84fxzLyjZIduUg=;
	b=bfAyJblr7ZmuMuNLsqXo0H8TzNBMWSMeFpQACluBqTsPpHQHPJUwadrjSbUTLX9Gr7YODa
	CzuIOJ/Nk+QkVVXC++M+gqA8aaVKy2vtayuGaY/mHh5YvSBd77/ZZUDwqOGSmaIurEXmwA
	mPFQdOITccHrG6z4YP+N8ZOi7Ew5yFU=
X-MC-Unique: 53OY9-E7O9qVj1UqI6QNOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahlpuid3CepbKN+EbaKk3EwnV0dHrFTUV1l+qjfSUoP8LILdCXbhKsBF+ijVbVoRhXjhpf6jv0J6J+qArmcmUt6DMp0GwOwEQ1bSQVhqmqInW0akkp2m3VTZ4fkLjaAdBl2UGVfnFBOnIeMSxeZdvDunSxNcYjtLEj/qw0nT6/rGbxHRbc229HWYjHjvAk4fpYrYAODnXxszW0odsJH+4Y2lGlfLpGYj6tKS7dlnYwrAfX/ZFauhQ4p4pgjbCPiHAs221MXWy3fURHkBwhsdhBOYHY1RaEWadGioAlIHcdG9QnvvwWs05eQYHGgBqA55wz9BZaPEI1zF6OccSv7gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6uvKqA9HgHe7EOgU3bZKcgbjXHaT84fxzLyjZIduUg=;
 b=IZ5tgGFPGmNGrBt1xb2UNKdzwnSrXMsgS28Wrg+1EAv8+PZtMd6znCiWW+lbNzKGB0NT9XN3tSMVJEpbBfTptR+DjARQnN5bLtNuVYAKBZeBIgM0QQAW3Y5qh6i8kTKAgr6A7d4U4dNgHRZBjSUowkWQReKrR9MxF48MpeesB9ADLXcTWjn8oyMwlclydqz10GvHe3eoUQKXYGmipRxR8oy/HLTkGdTOL12Pqru+ROkGbVBKX8V/05Us0v/Mok9aCrS5SUMv4EJbZCUjN53uwlVLDgPSPyyMnb+foj5C5Rl9DDNZaO8kC9yN+Snb21/HBt5eVABj7Heu0tw/+fHdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
Date: Thu, 27 Jan 2022 15:34:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] lib: extend ASSERT()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689f41a8-4362-4bdd-0252-08d9e1a22837
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590174E6E91EC0E50483C8C0B3219@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kBbEbVApIsCPmPdK5bJC0UfceIHxjNlSL3nw5vUgMqtUed7kGV3zXubODlQM6q6lB+1bAaQ1g2FaZOLY68W6OAZDzG3igS3wwDKSA9RvhLdDTwGhFFFS3jkxRpH+NtADIXI2+k9g57aKakQjOIXnDnJEaUuaGYn6NKABeM1cbdKWVAKAl+umDG35T483BHMRpVBVzs+JyYRsgEd/ipQpGDMx30RyJrX13qyuT3vTnwuS4kbFrlKrVkMad1vb8EegduXlu+fVs5JsmIUrNOvGVWgc5EwpHp36rIkkCHQXwMEMUYNRWjQkqdEH2zV+gj1+e4sawVs0MjuuO4NsSKQpGEKt3L5dpcDnmHEy7MDVqQZWk6XeWJ3fN85zs7rsDYi2zFaiw6+THI4WnEKY4wUHaSu6vkm11/OdVoV/dkwL5ePbd1V2UHuf/MMI1cXUtXUKWLlY5v8L8fU8oEfvoGXdPU02Y/1oKUplkWipnXrVbaVSHv4pe/a1E0SiwnlPUuVWnnpSrw0ngu7zryga1YzLL2ItBtlN0bShbVAH12mhaayMF9RLTtdJ5xqYszJ9HPgPwgLArra2MmhSlvw6L3dDhJ78K46oMKbsqzRhHx23F/IVBalGfwvZPEA29tpyrcV28LoE+ROl07htXEa0VHazedhFAr+T9j6mRarRSumiTSBJIT8txNWXYq3sn89RmLGXKao2VuyNvz9cMz5f6Da8Gk4+OcM8ORkWtlIFz1otxsTFyC0azTlkVw6XXoRxljRT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(31686004)(6486002)(36756003)(86362001)(2616005)(38100700002)(186003)(6916009)(26005)(6512007)(316002)(31696002)(508600001)(5660300002)(66476007)(66556008)(66946007)(8936002)(4326008)(8676002)(2906002)(6506007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjcxRFBGL21qOC95RW82amhrWXFZYy9aaUc3ckdubHdxa3RoSkxiT1BSYVdZ?=
 =?utf-8?B?K2Q0WTBZSXl5aXdTVHNqcVRod0Vjb01Tb3d2UU5JMCtXb1VXZEQ1TkU2TlhM?=
 =?utf-8?B?L0plRmd1a0JwN1JOTkJnbzNXbXcvcVdRcUZTaGpOK2ttSEs1M010K2gydDdX?=
 =?utf-8?B?YncrOVJMVzVQcS9xZ0VJMUlPMm01aWtldmFzb2c1RzJBcllpbk9IS1NWdkZ1?=
 =?utf-8?B?UWFMRWZOUTdEQzZnbTRhaDljMjZyQXlaaW5lcm1XektGaXBBT1VsMFBqVkNo?=
 =?utf-8?B?NEhpNjV1SzZpODIwRDBmb0V4MEpkU3U0c05HakUxVDhjaCt5cjBlUENiZ1Mw?=
 =?utf-8?B?UXRnb0grb0JkakFuR2NJT3Y4NkxqcXB6c2dpcitDd2UvNHo5bEcyc3VYZ2pw?=
 =?utf-8?B?Vzl5aC92QmFKY0Y5ZVhObjFadUtONFdaZzkwQmFlb3BPYVU2bmFSSXBpMTNI?=
 =?utf-8?B?OGNCajBWK2txZUEyZ21oUytGL3NZSGZsRzNoU2FWTGxHS25QR0NPd21RalVs?=
 =?utf-8?B?WEM1d2w1Q3pxbjdCaXhBTDk0QjBYMFlZN2lqeERzVzhOSmxnOThZS0NERms0?=
 =?utf-8?B?ZHdoSmpvaW1lMTVocEJ6WWEyOHJhOTR2c3o0RjFhVzhySXU3Yi9nYThoUzBk?=
 =?utf-8?B?c1RLNzZsTnlFUkZyNHYxWVZtQzFNYkZ4QmdDYWdqbjZsNW1VVFlqNWRHcW50?=
 =?utf-8?B?RTR1V3l4T0Y5ZTlRcnVlQXRBeXVxVzRvNzE1dHVVVGpCQmVXZXVHNjFMNkNi?=
 =?utf-8?B?ZlhCS1NxWkZMSklOc3ZIYkJ3aGJTWmVIY0JJQ2M4RmVKUlQvbnVrZnZvOXVi?=
 =?utf-8?B?TFRvcG9aVGYweDFTTnFlb3A3SHBlUHRLZWRxcEsxVno5bTRqNVordkRMSlhL?=
 =?utf-8?B?WEhBazNoa01oUnlIQUtZTzVieU1DMERZN2NMYkVMTDR4ZkxOSkNwblVkeHk2?=
 =?utf-8?B?Z0UrM0hLTE1CSEVmQXZCVjJYek1FMWcrUVBVVUlxYTJBZkJqVmxYSlhOU3Iz?=
 =?utf-8?B?NnhTSGxlZ3M0c0RYd0dWcmljZnZMdGZXZ1JWVkZETHpDZ3U3b3R5bmhJcWFu?=
 =?utf-8?B?OXlwbFUybWFvYjRSdzhWeWEzOTEwK2plS0wwOEsyalFaQ0Y1N3NUQXVuenJk?=
 =?utf-8?B?MHVISFNlMmwxcUF3TS9tT1ZxL2J1VndRWlFGbzJ6enk1VFhFT0hTMXlEWVRN?=
 =?utf-8?B?Z0t5MmNHbUJVZGV1MDZKc0FJQlltSDlMeEs4bUsrRXhHSlRzbmk5SVNYWFV3?=
 =?utf-8?B?d2JkMHNNR2NWTXNsYnk0V0V4VGwyTlYwdHRGTHNEcHE0ZFRHeTV5Q3lMRzNr?=
 =?utf-8?B?ZXJaU0ljT1ZsZjZCZVo4TTl0dTE2MmpSK09EZFZiR0hJaVB4RFFueGlhQ1hq?=
 =?utf-8?B?OU1oSWI4TU1EeFYxLzhVcC91a1FHUVZYcEZGTFhEdEFMSURiTDhHdzhwME12?=
 =?utf-8?B?TzZkYllmMEJQTTVjbmp4S1VFSjJzdzBVRWE2RlVxUkZqQ2ExV0dSWUZtT1dY?=
 =?utf-8?B?Sjk3K2JaVy9nMXIvZ1BrZkQzR0ZWNktyZ3BrOUlZRHptN1Zzb0piWWdFdmJm?=
 =?utf-8?B?aGRRUVd2N1BVOVR3WVJ2UTFOTjBJYTJrcG1Pa2lsb2JsNzFuUGh0YjNZMlhZ?=
 =?utf-8?B?dFQ4UjJlbEkzV29Uc0wyT05BZHIyR1hwMDlMbUtoWkphVHV1cGs2RlRNeFFj?=
 =?utf-8?B?Z1RCOGw2d2tDdGFaSzFNR25IVkpGaG5yUllybU94ZVBxaHFlSUp2M0pSalJL?=
 =?utf-8?B?QmdsYUhjczlqTXhuanJEUktxQXdHbzk1OFlWNkxhNHN1ekZiOHZrZ1puZXNy?=
 =?utf-8?B?dWdWYlF4OWdsS21sUHMyWklrZEk5enVBOUp5M2ZNSEg5Z3FPeHVtcVJMcXpP?=
 =?utf-8?B?ZWJyT3lsVlI0M3AySE5ka1NJQ0E5Unl5ZG5lS1JVOVU4Wlk0NmpWRy9Dc3ZY?=
 =?utf-8?B?Wkx3YjlFa1dscmxJMzJYMGF4a0xncVpFYnUwcEF3b0czN2hCR2VaSzBYYThK?=
 =?utf-8?B?clg4dWxXVTcvWXhQNWhNcGRNMjA3K1R5VzljWDVnRWdFcmVpOUtNSlRSdjB1?=
 =?utf-8?B?Y04xeG0zQkYyMUZpQWpuOHFaQXAzOWlpbGJWSVJSNUplT01vNVFtVUN4NEVS?=
 =?utf-8?B?cUxrWEhqMFBKUUg2VSsydkJnK2ZkU2JZLzcrYUh6UlJ2NmlwZi9Pcnp5b2xw?=
 =?utf-8?Q?Wqr4TwwiLNUbGIY+IvAO+/4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689f41a8-4362-4bdd-0252-08d9e1a22837
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:34:42.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTw2tv5WX+C93hh9nOpOuVm4oawU2ZTpgrQPuo3kAfRcGECu1/5iuPUyjK6DFXsjXF4UIUi5SnZc95QMfluI1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

The increasing amount of constructs along the lines of

    if ( !condition )
    {
        ASSERT_UNREACHABLE();
        return;
    }

is not only longer than necessary, but also doesn't produce incident
specific console output (except for file name and line number). Allow
the intended effect to be achieved with ASSERT(), by giving it a second
parameter allowing specification of the action to take in release builds
in case an assertion would have triggered in a debug one. The example
above then becomes

    ASSERT(condition, return);

Make sure the condition will continue to not get evaluated when just a
single argument gets passed to ASSERT().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Rename new macro parameter.
---
RFC: The use of a control flow construct as a macro argument may be
     controversial.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -826,11 +826,7 @@ int xenmem_add_to_physmap(struct domain
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
-    if ( !paging_mode_translate(d) )
-    {
-        ASSERT_UNREACHABLE();
-        return -EACCES;
-    }
+    ASSERT(paging_mode_translate(d), return -EACCES);
 
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;
@@ -920,11 +916,7 @@ static int xenmem_add_to_physmap_batch(s
      * call doesn't succumb to dead-code-elimination. Duplicate the short-circut
      * from xatp_permission_check() to try and help the compiler out.
      */
-    if ( !paging_mode_translate(d) )
-    {
-        ASSERT_UNREACHABLE();
-        return -EACCES;
-    }
+    ASSERT(paging_mode_translate(d), return -EACCES);
 
     if ( unlikely(xatpb->size < extent) )
         return -EILSEQ;
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -49,11 +49,13 @@
 #endif
 
 #ifndef NDEBUG
-#define ASSERT(p) \
+#define ASSERT(p, ...) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
 #else
-#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
+#define ASSERT(p, failsafe...) do { \
+        if ( !count_args(failsafe) || unlikely(!(p)) ) { failsafe; } \
+    } while ( 0 )
 #define ASSERT_UNREACHABLE() do { } while (0)
 #endif
 


