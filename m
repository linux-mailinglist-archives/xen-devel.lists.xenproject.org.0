Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB548C02B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256382.439911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZFt-0005Kx-QD; Wed, 12 Jan 2022 08:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256382.439911; Wed, 12 Jan 2022 08:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZFt-0005Hp-MG; Wed, 12 Jan 2022 08:45:17 +0000
Received: by outflank-mailman (input) for mailman id 256382;
 Wed, 12 Jan 2022 08:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZFr-0005Hd-NT
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:45:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d41d6a-7383-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 09:45:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-uNXqJPNBMKKlrODqv1WUJg-1; Wed, 12 Jan 2022 09:45:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 08:45:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:45:09 +0000
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
X-Inumbo-ID: f4d41d6a-7383-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641977112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vscs0Ld50Z2FxslJ+PxeiZQ5qyRFcfaBGNlyXBD69qo=;
	b=B/LzOh1sl4WyYzu66pGVbBNNHEjPAW8vv+rF71JL8Ts0LA+b29LF9ae1fQMVfnDsu5KntZ
	4BFf4lQ78lU9FLDJcDMen6HKK6VbuO66PpT6kBiMjF44MGo4G4jhleqs56tp8jMsN3Dvl5
	sZ+veYWPZ1MWNZNhu4vj7cwXA23JFTc=
X-MC-Unique: uNXqJPNBMKKlrODqv1WUJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqWMbzs136iWSNP2QY22DLRipopY9+LJtNncXJpFeNQt4gPfbrZgrNYEokTd+WSYgyPNKbkzowRCzjoFoYlNJI7JGtvS+vi6fTRNjd8jKQ0GbrIxmjVcU8X31n0ZnnSgRvvU7QI+OZhYTp83G5D5doZOdlF1o+8gSqgJMhs8GGlWvy0n2pXphVhUbMbaSpn0FY0WJ+ZNoukcvI1LjGk3PgtArNKdAy7IoeJBnPYWdwvD3IkB8GGtnS1mSKc9tLLbwAEs+tsRSTisUsdTDVAOEHjsK1LqL/b8r9iM7W2ocBg1pKjDmqMgbx6iQNag1RL8KZJt4eumdW2r/9nfKUrSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vscs0Ld50Z2FxslJ+PxeiZQ5qyRFcfaBGNlyXBD69qo=;
 b=Npdv9MtrolITCmNZzD1wCjOhFbGCWDWNu8B1snsmm1244vQ8zm3jGZYF6t1RHQtoAFNojTiVoARIrjYR/pgtOL9VTQq+EHjcTWZw+2qms4oY+9LlWk2v7orMCimlyQ1WAHdUXDzP3GfPQgXCJDXFSy5cNtbzwFz/6mBz36YAaLoVRDUVBaJyk2iiq9LIattm9x3EpoYWdAMLtNwH3mFSF2PZSbrpkBitCtn0CL89oLr798eAOLkA9ZSfZw4Kd8IPZHWZ4/te5SoMfEfgUI/Zi2ltjSBvMqbzZD5uDqQp3l6iKClehxhzNSIONQzFp0bATbwgIVcMzeujvUI6jmFxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
Date: Wed, 12 Jan 2022 09:45:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] EFI: always map EfiRuntimeServices{Code,Data}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5261dba7-d3f7-4d22-ff08-08d9d5a7d6a6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24487ECFCFB796268AFD67E5B3529@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gfz5vzG8glNsHNa2xneDqlSDPbzFIjh4x0QgRmeNdDsEfzaZM/WHf/PH8XCvy0/M9AnHKVZso5MEL5oEqV0WiMw6vSfRB2KU3fI5B6HEfWXXHyFP7Z5NOcictZu4aJxhRFhY+n+onGau5iAw2kE1aXqJhPM8hsIPj+z0EMsZb+Hc9+W74Ee7ltBfj9t7UFMx9erSxX4ZPDlQygxC2Oag7HSfCic0ZFEE1lUjms1iejZ4uDL+rD+agUS/5MXs7tDMplQM17lx4JXfhFc2KhMsU5FYZtg0FYjALzuJqFB3/N+lxknWySULsR9oUI/GoVOXjCJ5U9lQEq+1UeeNuCFx6uT3GgCDqMLeErrxP81fwdx7idm6nAA/j2mQqEVksqlf33sS4D/NfBWsLQ8VybxqPN8pSkXBguEp1NWhNwbG7Q40qdKfeBgqPtlhMFFH7DmEQyREKmasmu2JZfUSTKWxEv2HtIIFX+Yt1d/4vJAb7ZoooalQxlk9uRz748aP1G8DvQ2D057szR555Jf6QV42g1P+uDzPJpYLUxIyfh05PGi+YdlzyjSYGTOUcJyBfctuVZ0mKwbysCBtMYauYP50hfIS3MKXpPOeSO+KOXqYH1wHBVGXbRnGCXDLgMTXyCIkikIwpAdFrmVjwLZxhAuxz7PkwVQQ1s7KXchvpkfJsQWb0qybwLJiBpfxoPNHwrevL2bVdN52VKqV5Vy2DqyRdfyyITCO3HgDDlgiccoXIRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6506007)(26005)(6666004)(508600001)(54906003)(83380400001)(6512007)(316002)(66946007)(4326008)(5660300002)(186003)(86362001)(2616005)(66556008)(8676002)(36756003)(31696002)(6486002)(66476007)(8936002)(2906002)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXRUVHlCbTlBelU1UE1nQTZPOWtMby9vekh5bUVMem9FRXBTbFVEek5uMFZn?=
 =?utf-8?B?NXRIeG0xZE11TzVKc08zbHFUTFFZS3owMUZFaFJLdTVZMllub3F0dWFUeFJi?=
 =?utf-8?B?NXRCc2J6L1VPK2lmTUdOaTY5WVJBQkMzY1Z3bjFBMVVJd3pKdzNuMlMvcDBT?=
 =?utf-8?B?allIU0RRSnhmWVh1cEdCNVZaQUJybkhuQTdReU53TERMRjlEYXo5Ymk0a2pL?=
 =?utf-8?B?MzZUcWs2ZUtleU5nMGl5N0pTQXJVRHZTc1ZsVTVNRmN1b0JlcjlHKytuS0pw?=
 =?utf-8?B?VVJWWmVIL2VhZFVhUDJGUDF5OXVRbTJrdW1KQThWSVEyUHVpTlAveXMrdHFW?=
 =?utf-8?B?ekVBcU16azNVUzVCck0zc3ozekxDQnFYckJFRWZ6RjhkcktjckZjbDlnOGxO?=
 =?utf-8?B?ZzY5NXRjRXFWa29Xeitoa0JKdllJK1VJbUx3L254QkRrc0NoSTR0NnNaSzBE?=
 =?utf-8?B?SGIzQXZOTWRoa09wRWhyVGUrNWFzNDA4TWR0NzZqSDdUT1lKWkNhVVkwYXBk?=
 =?utf-8?B?QU9zZzJwcGJXVCt4NUZORHNkVU5reVJOanUvcXpKTVBiSnpOMGI0aTlhTXUw?=
 =?utf-8?B?bk5mVWc5UHhidm9ybkNTbUNBbTkrdVg0dEo3SEFka2FsdUp0Wk9KRTdzbVBF?=
 =?utf-8?B?MkN0VWVwdTRZenBrRHZvWlBxRkJBQjh3blhraTFicWx4aE5XNGRSem54N3Rv?=
 =?utf-8?B?Z2FkWVgvaXR1cytGL0lJa25zSUZqWG04RlVGS3h3b3QrUUMwNXU4eGpIRE9O?=
 =?utf-8?B?a3h1VnZhQlBxa2ZBdVZpNGYreFdQZm80QmpTaWdta2hnOUFrZ29QZlh5ZlRN?=
 =?utf-8?B?ZUg4Mzg1bEZiL3hCWVAyb0hMWnprMG9VTnV6RE1nRVZqT3VzbWwrbmtRUmF4?=
 =?utf-8?B?UFRDVFNDU0VmSmhmUE1nYWJ3em1qa2tUdEpzYTN1Q1ArNkJsZkRzdUc2cHZm?=
 =?utf-8?B?bHJHN2hnaFVjSCt5REs5WW9PWDFZc0xuditxdGpkeEZZOFlYYkVTdHlUd2Ny?=
 =?utf-8?B?OFZ5NWtnaythMGhJcHQxRkpJK3lYS3Y2c1JZWUVHbjdKN2I3MmpLenk4L3ds?=
 =?utf-8?B?cHZFSjRadlVnUDQ5TFc5akFKMnBSWkM4MG9kWjdFZEUwN0owNEVUblRFWmlt?=
 =?utf-8?B?VHdwRFBNQ3VueUVjU1pUa3hwb0VqTmlFWjdKZmQ2ZHZTRnlkZS9KTmNWdnlm?=
 =?utf-8?B?RzliWktJKzZkbyt5cUgyZStIMjFyVlBGNFBERWFuM21vQ0JtV29IMjBqTEg0?=
 =?utf-8?B?UWJNVUdjSnVJb3NiL3cxTHBYNnI3T0YzaTlQaWlLRHNaVjdmQkJ6TFJvdmlF?=
 =?utf-8?B?ek9CUDQxWmpUcHBRSVlPVE5SeGRGOVgweGRqd01FQlBWbHRxNW5GYmIrN0pG?=
 =?utf-8?B?dFd1aUZRNzFwMFFEN3A5VHFTb1E4YjRXZDVBbTBTSGl6WHFuN0hnV3E3U01P?=
 =?utf-8?B?WDhhb2ZCZnV2Um9PSCtabmlmMXFEL2JUN3RjREFoSEVuSXdtcGV1ZWN3eE02?=
 =?utf-8?B?dHI3UTBadTlxSGd5WmpLU3UvVTJITzNtSGRoa0pvSUxDRjh1REMvQytiSW5j?=
 =?utf-8?B?Z3dkUjVVOUlDS29TL25JUENpQ3pFdTc5NXFsKzhNRlhCYVF3T3p6SFhEd2Z5?=
 =?utf-8?B?RnVxSVJKMWpkUzR6dHduc0dGQlJrRFQ0Vmg5NERDSkh3TWZWVWsxNGVUclJK?=
 =?utf-8?B?Y0c1QnRINEZCRysyVS9Ja1BRT2NZcTUrOFBFVGJ6UGI0S3FPN0V0RkVHR1Rl?=
 =?utf-8?B?TnM5d3YyOG9jcEZlNWVheFA4c0cyb1pPcnowZDhhSlZiQndUekNvZmpHNzN0?=
 =?utf-8?B?M3d1QzFvSlRUWjl1ZWVpZW5BVjlvc1Fja1JUS1ZENzFPTjFUd0VHc3VzUG80?=
 =?utf-8?B?ZkFCcWI2QnREV0tnMXRlT2F4bWNkTHVZd2ZKU3pmV25XemxySEdFSFBhazJI?=
 =?utf-8?B?NEZpRzNhTm1XQk5XVy9HU3VaQnRNU3luNnJURjJ2MVVwWSt4c3dkOHA4Rysw?=
 =?utf-8?B?d1N1SDU4TitRY0NsMytiOXZRMnRwejJJUHJ4S3MzSDVVTGZ3ajhEY2JNODVJ?=
 =?utf-8?B?R0JaSENJZjN2R3dVNGRpSUUwWmc4WHZmbGFjdDh2OFh1V0FMS2dxUUw4K0hu?=
 =?utf-8?B?THFuUzNnRGVEZTRaYy91Njd4R0dpN1VSc3dFZTlyNys2ZWZoV3BmN1NiajNm?=
 =?utf-8?Q?tSGyjySfBrxbMULNXhOfCKE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5261dba7-d3f7-4d22-ff08-08d9d5a7d6a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:45:08.9997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D0XXSuAwhOU6mncp7W+qlsZDNdaCyFIyKRGSlqGkKMcLmK60tvqprKPQNOq2lC4h/eqBoRKiPuidEgyZCIhgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

From: Sergey Temerkhanov <s.temerkhanov@gmail.com>

This helps overcome problems observed with some UEFI implementations
which don't set the Attributes field in memery descriptors properly.

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Drop EFI_MEMORY_CACHEABILITY_MASK. Fold with pre-existing if() (into
    switch()). Style.
---
I guess "map_bs" would also want honoring in efi_exit_boot(), but that's
yet another patch then I suppose.

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1094,7 +1094,13 @@ static void __init efi_exit_boot(EFI_HAN
     {
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
 
-        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+        /*
+         * Runtime services regions are always mapped here.
+         * Attributes may be adjusted in efi_init_memory().
+         */
+        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
+             desc->Type == EfiRuntimeServicesCode ||
+             desc->Type == EfiRuntimeServicesData )
             desc->VirtualStart = desc->PhysicalStart;
         else
             desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
@@ -1545,13 +1551,36 @@ void __init efi_init_memory(void)
                     ROUNDUP(desc->PhysicalStart + len, PAGE_SIZE));
         }
 
-        if ( !efi_enabled(EFI_RS) ||
-             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
-              (!map_bs ||
-               (desc->Type != EfiBootServicesCode &&
-                desc->Type != EfiBootServicesData))) )
+        if ( !efi_enabled(EFI_RS) )
             continue;
 
+        if ( !(desc->Attribute & EFI_MEMORY_RUNTIME) )
+        {
+            switch ( desc->Type )
+            {
+            default:
+                continue;
+
+            /*
+             * Adjust runtime services regions. Keep in sync with
+             * efi_exit_boot().
+             */
+            case EfiRuntimeServicesCode:
+            case EfiRuntimeServicesData:
+                printk(XENLOG_WARNING
+                       "Setting RUNTIME attribute for %013" PRIx64 "-%013" PRIx64 "\n",
+                       desc->PhysicalStart, desc->PhysicalStart + len - 1);
+                desc->Attribute |= EFI_MEMORY_RUNTIME;
+                break;
+
+            case EfiBootServicesCode:
+            case EfiBootServicesData:
+                if ( !map_bs )
+                    continue;
+                break;
+            }
+        }
+
         desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
 
         smfn = PFN_DOWN(desc->PhysicalStart);


