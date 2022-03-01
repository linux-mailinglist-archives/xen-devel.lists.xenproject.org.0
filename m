Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653704C872B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281000.479132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyIF-000111-So; Tue, 01 Mar 2022 08:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281000.479132; Tue, 01 Mar 2022 08:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyIF-0000zB-Pc; Tue, 01 Mar 2022 08:55:39 +0000
Received: by outflank-mailman (input) for mailman id 281000;
 Tue, 01 Mar 2022 08:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOyIE-0000z5-4W
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 08:55:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca63873-993d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 09:55:37 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-GkYsPyKJPLiDnji0F45UfA-1; Tue, 01 Mar 2022 09:55:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4497.eurprd04.prod.outlook.com (2603:10a6:208:6a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 1 Mar
 2022 08:55:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:55:34 +0000
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
X-Inumbo-ID: 5ca63873-993d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646124936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R4Pgof5PQtcWSd4BB7sXGDJ55OaF2iH1mZ5hQRwpEXM=;
	b=JDo0k/1GgQ/RRlTMc3WTK0YJUZgMX3A18H1LL6MihmPZq6hcz7w/5PddItWxEuWk2rXiP1
	As8eZJgHBAmXHDqDvs2Y4qj8XheQRyub/Zg7cNa6lPXEQwHDdA9r8knmU2Qk2UunknOOiH
	sofWRTr6Qmiw3Ua6V2i/GnSNnoRuiDk=
X-MC-Unique: GkYsPyKJPLiDnji0F45UfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNK6/qsgiRrauq2Y6QzhSDGroHWMsaDShh/4WHhmJTftwjQg+VcyselGr4chzFrKTrITOPNAOBh5KOA6eBLO9spdLO2DuaKQGyc93mbWpZehlN0XRvwyvk+1I0/KfHzHr3ZnTcT8iLI3znMRMcdBdMwydzgJG5mVBlXYD2SH9Yys0MS1fAyH9QFgjrxKLLsabAl4bOVxOziupkcnNizipChdZ/bILLMX3QTTVbeBr90zmeGtJRMMoYXoWp3fASzqbdTuklqbjVZNp6R1DZls0K2veo37Jh9VdTYR75LFIcUz+FSy8dofJLeecEsoLBLcSRE1ovF4RqI4me8I+pTTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4Pgof5PQtcWSd4BB7sXGDJ55OaF2iH1mZ5hQRwpEXM=;
 b=R0wA/rNv3JE1hdHynTKnclIunI6xu33m/bsTXln4doAjqHrCaqNJ+yV74aBgYqB4fT6PEGlDvY/JJFFR+McIVt/33OcxZRDqFFUIlJl/FwNquPb9bK5SEOCGwi1bTPJVPVgmnkk7aaSRv5uBoNb1Vilto1SAX/H/9BwPildEJESGxnvbOC8LqlULL2tmKiaCTq94a2kRsLC/l/0GYpdkg/ZVKlfgzYiqxe86zyXOfL5S5gLAhoH3swQ01SU0cNUGdV/NIVlDcFrBQnPoaGQ3skHMrSxIPUDecm8aphpgjdIBbQ3RJNO2SdoASXLZsawIJ9dWEthuWZTlf67tEqJtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Date: Tue, 1 Mar 2022 09:55:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fold sections in final binaries
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:206:14::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ffda49a-0a09-4c43-b07d-08d9fb613f24
X-MS-TrafficTypeDiagnostic: AM0PR04MB4497:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB44977F26FECD306A482964ABB3029@AM0PR04MB4497.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KmalUWtGgVI16Papu1zmOORnMpmdzXJbqe3Bs3pgYYYvWneegZGwFyyzuDOVYK73Gr7uqOfjWMX/kwKrnT73M+XPojhlVdCNYQFwsUx2pPqzFNqQG5cjCht6/3QFY30G30U7ez5XO9IO432vmctW5oH0nvu6cBCKwCz7mPWMGhfi1Dns3K0dScAwUGpX/yfCgQuRA3nkPhZ8WdpNAnP1K6EbaaahB2s9hqMDXy6TYVK44Ws9ZMg+pIBY0M5J46fMntq+I+qVabrUSE/vyySqNXsvckyR1br9hEl2My/l622gfD6mJYL70QGMoi+1TJwTfDUDEorib0jwPFPzMf4miHCENalvWL5aF9fYVXaiivrONvf1bIfKjpAlZDr6bibFBOmKYmUaRc5n6EWzZvyDqwbJaHVwd5xP0f3ylf9P/vMe0IvN+F6XSR2RHocKl55bNtZWnFo67Rvaj05jPKIKguuv38DJZb6y0UVMvhEyVyFSxh/8BPY6PeeQk6D904UtTPDc3Fzg+05j5kqdgiuEQCY47RBbZAogSGoSFbv7wTzJ3CoTJ5jZOsg2QQZzTDCb5CRO1xb/FaKbRnZE3cYOnnCnEXNxm/dUIyPDnBuQt65+eMVanVaW3uUR6czizpMmKRz79i34cYyXukfqjS9BGnyyuUvHTG5wUjx+06hDe1hpr+DUHGgNDKgW5sQcjyJphXZGJpm3kBlmaugcjaIMmgyRG1BOVXkR8puJRjd7dSiBOpJJwB0QbsPUtnN3JbhZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(2616005)(26005)(186003)(8936002)(6506007)(6512007)(83380400001)(38100700002)(31686004)(36756003)(8676002)(4326008)(54906003)(66946007)(316002)(66556008)(66476007)(6916009)(6486002)(31696002)(508600001)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVkwRnJBYXQ0Yit1UVNoYWU1RFNudjlHajRFa0V5eExHSDczWXNjZkMzSUJH?=
 =?utf-8?B?aDB6WFo1bFkvZUZVVS9TWUdvT0NMN05TV3hsN1ZMUjFTR2Z3eklqNEdNVE9u?=
 =?utf-8?B?Ym1sVUpnK29hVXJFQk5sd2M2eTNtOTRGMkdUNGpiQUMvdmcrZTAwSDYvS0Rs?=
 =?utf-8?B?SEVLMEU4ZzdjOTVEVGQrTmp5R2hUajRYam1IUERhdVhyUUNxbW92Zk5JUVJ3?=
 =?utf-8?B?cFg5NnZOSWw4R0JjSDVRdWVhNEhRUTRBN1FqdnZhbUV1eHJNNkZXR0dQaGVG?=
 =?utf-8?B?M01nU3pHSGNxTGVoakQ5VC9kWnJmaEJRWDA1OFBoWnpnUTZGSWhvRTdqU1pj?=
 =?utf-8?B?OUV2Zm5nRlNUMnloQytOZ01ndFhvemRiZlBjWFN6QmJ1Tk9Jbkx1ZTZHbGFJ?=
 =?utf-8?B?ci8wQ1UycEhCazJPclQwTi9uM1BFQm05TUJFeWNEWVZEcGpwRGhjR2xyTHhv?=
 =?utf-8?B?elZZSlJJZmhXWVNMWGpHOFh0d3lsTkY2OG9mUytyN0x3UTIraFpwVWZtanhs?=
 =?utf-8?B?V0FxbEdPbkVlQzBtMkdKUksraUFWVFJXZldjd2c5SlFNM0p1VGVVUDg0c2Vu?=
 =?utf-8?B?bGd0MytpbnNkb3pVWHRrckxlRkNqeCs2cExCak55TU1IeFpiZTR4U3VDM3F2?=
 =?utf-8?B?Zmtqb2FKYmdQQkhwS3pmUTZ0ZXZGbkRET2c1bGlZbkNjSTUzbXM1UE00MXhZ?=
 =?utf-8?B?aU93NndjNlJ3TklmeHo5YUxEc2YwV0QyRjU0ZGVDcU1QbTJXRmhab0lvclJS?=
 =?utf-8?B?WmpHRi9LTXV4NlQ1dlI5Wi81dUdPRVVtOGMrNHFNT0dqdHZMMHJFYm90RFZt?=
 =?utf-8?B?ZW9sWGRFWU5PZ09nWFhZdGlyRjNjQWJVU3RlbTZYZVBLU3ZUMzBwR0V2dG94?=
 =?utf-8?B?OTM2RmZoL25XNTYwRmovRTNFNGpaS3dMMXdPRVNpVHl2TFpvb21lSmV1bU5L?=
 =?utf-8?B?MWdhdlJVRXdnMWhjazJaWnAvYyszeitoQURXaUduSDBSazVWOGpMY084K3RT?=
 =?utf-8?B?dWZVSXA3TW42VmxKblJMazg0YjYvdHVVamQwbUJkOXc1L05vOG9vTlYwT3h2?=
 =?utf-8?B?bkI5UEQ0elhGY0NVRlgyVjVUc0lKMURhQTRnSXFHRHd1RDNuVUZ4Y2NFaWVK?=
 =?utf-8?B?UExXSmMyNXJiN0VnUEdjblBzMTNXa3EzcExmbEU3TWFscDR6V2d3VjkxcE1N?=
 =?utf-8?B?Um5yU28xcFhZVms1ZjJCWEZwYUNFeHY0Rlo5c2lBbEZ2SWFVekRjc05SSmhU?=
 =?utf-8?B?ZkswdURBS3BsVjhlZlcxb2g4V1NZVGhENTVwblR0SGlvZVlIMEdRQTVOOVE0?=
 =?utf-8?B?Y3ZuRTBBdW93T0V0YklZTHVvQXBjSlNqQWtqWXdDSjFZOHI5WXZMYnI0eGZ0?=
 =?utf-8?B?ajRuL3FPMHpOdXR3YjFQYWwxd3pqWUZtbWdqam5EWVF0UmdYOGx2cWVrZkpp?=
 =?utf-8?B?TWt5R0V5b2pGb29wSkRMN0xTdE9ieWhlRkw2bDBOeUc5WWlnV2V6andXTFFl?=
 =?utf-8?B?V2ViR1RURS9yRFVLT1B5VG9OcnMrbTRxQTB2R3I5ZHMzZWpuZ1NWaTBORE00?=
 =?utf-8?B?dlhMaFdrZzJsR1ZSWDdRNDUvV1V3ejJobU5lRXhsNVlvYnRVR3BvQWJ1eFR3?=
 =?utf-8?B?c0tBT1hndDg2K2M5WjRkZGI3Unc4NmVqdk1zZkFjZkpSb21lcy9POGZVdE1R?=
 =?utf-8?B?Tm0vM1pwcGV0WVdPUDJsODdod3BsWWVVQno3UFlFU2RoaUp4eGwrekdvV1Nw?=
 =?utf-8?B?M0VYYzBOM3RKUnNJc2NqL2xiSzl3bmRZbmI2TFBtaHQwQnNnekFGM2tLaDFE?=
 =?utf-8?B?VlJTdHk4cTE4SmI1QnJqNXhKN2lGbTIyK2VQMGNBaTdYdXZFb252OGNrV3A5?=
 =?utf-8?B?OHlhL2dXdU00ejV2SUNGUi81Mys4K0tKOXc5Sk9rNFU2RHREdGcvYmkxeE1I?=
 =?utf-8?B?blpDZ0VPdkd3VEhMVXpZSldubWwxVFBvSFY0L3p4bzNYNGx4RmRNS0lqY0Vw?=
 =?utf-8?B?QVJleFFVSU1KTnFxc1p1eml4NTdyNHRQRDBTNTVNSFhNZFVWZFJEbDdLb2RQ?=
 =?utf-8?B?cTJMc0J5SUx5cnNEanhVSTBTZm44WTZzS3ZiMTdWcTFReUFyNWZoRk5qTm1O?=
 =?utf-8?B?NUwwSElUcEF4MHhjT05sdUR2U2srMExMY2lidVkwK1JjSWJ4bDZxc2dXMlJh?=
 =?utf-8?Q?8ezBtu+8sgOCryHCOfpYBO0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffda49a-0a09-4c43-b07d-08d9fb613f24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:55:34.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU0TLPfUXG+T9lUzjJ2USZqh07nuH4BnVElDs+PvKhY22QniC/JWJuKnj0F7L9Y2f8kJaqTOMyKy/72YIumKUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4497

Especially when linking a PE binary (xen.efi), standalone output
sections are expensive: Often the linker will align the subsequent one
on the section alignment boundary (2Mb) when the linker script doesn't
otherwise place it. (I haven't been able to derive from observed
behavior under what conditions it would not do so.)

With gcov enabled (and with gcc11) I'm observing enough sections that,
as of quite recently, the resulting image doesn't fit in 16Mb anymore,
failing the final ASSERT() in the linker script. (That assertion is
slated to go away, but that's a separate change.)

Any destructor related sections can be discarded, as we never "exit"
the hypervisor. This includes .text.exit, which is referenced from
.dtors.*. Constructor related sections need to all be taken care of, not
just those with historically used names: .ctors.* and .text.startup is
what gcc11 populates. While there re-arrange ordering / sorting to match
that used by the linker provided scripts.

Finally, for xen.efi only, also discard .note.gnu.*. These are
meaningless in a PE binary. Quite likely, while not meaningless there,
the section is also of no use in ELF, but keep it there for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
     ld is quite clear that this is an a.out-only construct.
     Implementation doesn't look to fully match this for ELF, but I'd
     nevertheless be inclined to remove its use.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -194,6 +194,7 @@ SECTIONS
 #endif
        _sinittext = .;
        *(.init.text)
+       *(.text.startup)
        _einittext = .;
        /*
         * Here are the replacement instructions. The linker sticks them
@@ -258,9 +259,10 @@ SECTIONS
 
        . = ALIGN(8);
        __ctors_start = .;
-       *(.ctors)
+       *(SORT_BY_INIT_PRIORITY(.init_array.*))
+       *(SORT_BY_INIT_PRIORITY(.ctors.*))
        *(.init_array)
-       *(SORT(.init_array.*))
+       *(.ctors)
        __ctors_end = .;
   } PHDR(text)
 
@@ -404,16 +406,20 @@ SECTIONS
 
   /* Sections to be discarded */
   /DISCARD/ : {
+       *(.text.exit)
        *(.exit.text)
        *(.exit.data)
        *(.exitcall.exit)
        *(.discard)
        *(.discard.*)
        *(.eh_frame)
+       *(.dtors)
+       *(.dtors.*)
 #ifdef EFI
        *(.comment)
        *(.comment.*)
        *(.note.Xen)
+       *(.note.gnu.*)
 #endif
   }
 


