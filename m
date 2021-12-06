Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4B46988D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239071.414400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEq9-0008KR-0P; Mon, 06 Dec 2021 14:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239071.414400; Mon, 06 Dec 2021 14:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEq8-0008Hc-Ri; Mon, 06 Dec 2021 14:19:36 +0000
Received: by outflank-mailman (input) for mailman id 239071;
 Mon, 06 Dec 2021 14:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEq7-0007zW-Uj
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:19:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89b0cfbe-569f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:19:35 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-lJdjzbS3MuOjJ_ka8juchA-1; Mon, 06 Dec 2021 15:19:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:19:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:19:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0060.eurprd04.prod.outlook.com (2603:10a6:20b:312::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 14:19:32 +0000
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
X-Inumbo-ID: 89b0cfbe-569f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
	b=RZense3Ddp5Q+ToGfwvz7aET70HX/Px2n6dQ7chC0gYTOOM9iptNY4PNwC2XAy9/eT7DMZ
	p+3++ZK3TKjd4aTBmOl/bGTsBaeD42DcummmlgbSmjPaidIOgolpYfFBnwam4gEj+IdwgK
	VYCHbdCT0tAExxoAODnYTfZCKOlqFdg=
X-MC-Unique: lJdjzbS3MuOjJ_ka8juchA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1mqj9o9WuS1AMchop50knu52etmeAqFRsUCqrvJqnFuLEIpDyccFvSzv1PqGLoF06CpiMxoooo769691scWOs5I+lmNgsI9/M9r/r+2y3cSmnV0uoZ3qTXTiBrfnCgg1oPuZLC4BBlfsOrPqtX9HBHkbE7YAic+EaOJDOCYPfrb0B3xoAVth5XTQlkXuwJi5UAMzdFPyEBUK5jdvItwjf1Yoft31SGmhI6KgSvpM+BwXs5INp6QVAWH8x9o3BYL70FhBW8YqxO1XUooIY5CBiI1BGjvM0M8Qbwi2fIbQ5QjbuHzfvi8Rs+KntThd4mndjKHfCJUAvZ9t/ConMZPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
 b=nRRek+Dt6p8yYmmrup+jN+UOE4ERZjbBj6CGTydgQ26XDsUNNAJdySomfaGZZjpgd1zUp/uM2Xd2HnYhCQ8/OZ+5dzsq31zj01VF8IZRvCMA34/ghibVGCA2m00t+6mBye6Km3blJV+gIrvRyhFpvmmBDZaCfyXSp3KzYSYO26R1m+tq8ncJoWXuLIL5Yde1JmtgyyBxqP+R1vulBm4an+KXJXpJi3k+XduyQ+30d/649oPdmfMZ1JsWNgnKUo/aae6X1MSbMGzTnRW6yvaqJ572ZuXomDQY1v0aQqDxuYCyTpj4qfsIL/4YQReCzahgFH6loWbmAsli6tG5vy/ulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dda4e10a-6b52-1690-801a-f997d0307277@suse.com>
Date: Mon, 6 Dec 2021 15:19:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 5/7] x86/boot: fold branches in video handling code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0060.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd288551-6fe5-4ab8-23f7-08d9b8c36cc2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23333D5104FD8B8C4673DF00B36D9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6m8uUsnsvvzTt7yNTqDLYdmiMBqXzXA32E/myIxYj+kHtrlbg746IGTqtIvOA3ODm91oqPNDTVsn326aejeC+PCfZxxWVoF3n9wMnQU/r3rYDkJEqgvHdZ9LZkJS8OHW1Fc38XeV+yCC8iI6KAQz0658SfojTnUVxQrawdiUJ3WItBFAz7BjAB71sZ7CBpHOBAtqEg6Nf2+InnrQ5TYgGSUeufnhF6QwLuBYEU78CO1Mk7Q7jKbwPixcksdtAJUbl0Eg6VTxpWYnlcpvKi05FS94RzoCKR1wZLVcxN+3fY06aJ43g7ypaBDDaWs61SZ+D4bupZI9Fh+PAIUC2oKurGhBt+CMfOD4mwVf9Q3Fswcp53kYhKlSaadL4Ey1ccCUCxjy9250afp0lJoGvV/7UfGrxkd9H+QZPC4ErXKR1J9L9U5L5hCp3GqNyn7/bnUO1mGQmSVidfwhCgBsp+YJud+jZNpPtG3jL9Y/hDCXmdajmCwTUwJPlRGvDXJuVLE7WWLAOR8HV8yv6wewZIzgHg95HngcWYmcTUGMg1peYEjcRs8HIb5UhOrNqnRTStZav1QNkCo9wQ1cPa4uIdq/tgbZYndbBa5BCqkxrqyTXhDxJJTMPZntr6oX6FPCgXLxQc2PlawRCain/MNF/bmMLNCwa+7OPMf1Wwao1YrReJ6fojT9TraJDi/y9Z089/Uw6h2x126JXkvemrGZzlnqMWbUezz5meplkOOR+9qDwBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(316002)(16576012)(86362001)(31696002)(66476007)(66556008)(4744005)(66946007)(5660300002)(2906002)(508600001)(8936002)(4326008)(8676002)(186003)(6486002)(2616005)(956004)(83380400001)(38100700002)(6916009)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJRemlvRjFwY0pnWWF4U2g5R2xPOXVkaE9JNm9aKzJseUtwalVwTFF5UERO?=
 =?utf-8?B?cWc4Ym5EUGRKQktrRndDditqZ1UrTExyTlRpbysyMWZuOW9qQ3RmU1dzTm5k?=
 =?utf-8?B?WDdmSXU2dVpjZlpkVXU4SHlvOUlmekRVa21rTEI3WWJobmJyMjNQc1BUNDM0?=
 =?utf-8?B?RHRDYWRSQVpxajhabGlaT2R6TC84NVpoZlEyOVM1Z2dva2VoMTA3a1hNWG13?=
 =?utf-8?B?Z2NaUThHVGV1NlpnUHRxMXh4WnZ4VldyQllvWGxPOUZxWjlZR0JENkJYSUhG?=
 =?utf-8?B?NDEwd2JpRC9QUFRqbFVQZDYzeXFUajlxeGw3cEFFdkw2dkRtU3NIWXRJNUwr?=
 =?utf-8?B?RlRXMHYzYkxEWk1yYmhDakROL2xsa2NNazdFbDVnQXlMTmVpcDU5QWhZdkNV?=
 =?utf-8?B?MHJ5V1ZJM2N0MlhJbzhUdnJ2b2FMM2k3WGxkb3k1WlNKTUVEOTdCeE1XRmpy?=
 =?utf-8?B?S2UwVmFEQkppdkwvTkV1ZU9uQjREMy9oMnNsZHNLLzRYN0FWZ2dsYW14REF0?=
 =?utf-8?B?dEpOZmdRU284Q3FWdno2N3NBKzEyZktxV213VTVsNTNjTnVHK1FlUUZoZFI3?=
 =?utf-8?B?NjJTcFRPSE43d3RWTUhWc2dYV2VGUEhkNisyclRCd01JOHVmdUtIYjczc2xX?=
 =?utf-8?B?eTBxUnZPSjNKQVl4T2wvZEdLTXJ6anhXcG01MFpLVnhpT2dKWkU4eDZrTldN?=
 =?utf-8?B?emRWcmlrYjFNNmZDSktvNHlIT21zeDdtazVMV3BVdnNPT1g5dTI1cnNXTy9w?=
 =?utf-8?B?REt4R0g2RG9CUVJkcURWb0JiVkEwNFFvb2w3OGVYRXFSWlJjdVE3TE1LQms0?=
 =?utf-8?B?VUFOTGFoNmtiN3U0S3FKeUFXQnlmeDYvaHF1aUN1L1pSUW42NS9KZS83R003?=
 =?utf-8?B?eGNSdGdiWjlXUDBoMUZDR0Y3S1RKVllJekFKV21zODFFZ1VuZTBwNnpJRTEz?=
 =?utf-8?B?UWY1cXRWUHBqQUpraURYb1ljejVMaFE3cEpQZHMyeUZ2YkphbVdzSm5hWFNW?=
 =?utf-8?B?UnpJTVdyZHVPYzhWZDN5dU0zdW1yNDlxVmdudys0ODJYUndxZUM3bmwxUzBr?=
 =?utf-8?B?WVVaSS9IMGpzUUtUNTRoc0JSVmluR3BQMmVJV2crY3RYL0NPNmVMeGpGSzhn?=
 =?utf-8?B?N0pqTmVvWklha3hUbFRTMWtNZE8yK2JMTFVXNE1ZY0tLd25rdnZtaHJhM29y?=
 =?utf-8?B?Q3ZtWWNocDRiVFdRYjhVVUdjVCtmb0s1Tk0rYlpqeGs0VUlHK3RtdUVMWkps?=
 =?utf-8?B?M1VaWGF6UWJ4YkRRelQ3TU40SHJxWEVmc3JVUC9BdmdLcGRqTnNla2F1bGxk?=
 =?utf-8?B?SmhaTlpNVm53bjc2Q3JyTmUyRVE1U0U0OVl5RkI5RjBtMGVYRUdyd0VXM1l4?=
 =?utf-8?B?aFFnbUswUVhWTWNTUGRlbzNGYmJJQzZVdG9yaU80cS9yOWU5bGZsdzBSYVAz?=
 =?utf-8?B?QXNQM2duRXNHNVJZeHJXRmF6c1NlYTArYVh3ZGtMZnM2bmdHSVJmWVpOU2Z1?=
 =?utf-8?B?WDI3cDBEdUdMSGsrNUV5SFk5MVBjMW9uZU5PSFFQSnNNN0Z4Y0xEbUJDUzBY?=
 =?utf-8?B?MHl1dng5NU5sK0dXczdjbDlOems5R3hJb2JSRHgvMElVd1ZUUkttbW9HYS82?=
 =?utf-8?B?NTQxUHJqNE9Eb2xTV2ZCR3o4c3gzZXNxTkllWCt6UUVYRUN0ZVozK2JBUTk0?=
 =?utf-8?B?U2lkR2tGaXdOdGhsaXpnVkF5T2IvNWFtRThVbXpXZmNOVWdQeVBaQ0pHMld3?=
 =?utf-8?B?YzVRVlRCOFRCNHBNRUFtb3BZYWtUTzFsZnJJT3c1WnRzSzlJWU9GNjBQbkpz?=
 =?utf-8?B?blE4VGFvc0h5ZE40dUo3Wk9XSXBZSXArVHMrNThTc01yTnlUQXN4N2lmUTR1?=
 =?utf-8?B?WDZZSW94aXhzcUZnT2EyZXJha0hzYUJwQkpHT1ByVDFpekpJQWRveVJKUnhC?=
 =?utf-8?B?SXppWjFTeGNscCs0NktuUjEyaGFpREpud3VTajBZeXBxbTRsb0M2dDdWTmUw?=
 =?utf-8?B?VnBvdHo4R05WcVNTa3VyZlQ3NnNIZEVUclhNelYzV2ZBZ3IwWmc0bDZGeHF5?=
 =?utf-8?B?Y2VXeVlaMkRZdUQxcGM1S2Z5RnNQeDkvWVBxbzZRS2lRZWdRenFSNWE4a1p3?=
 =?utf-8?B?dlVFR1BWVEIydnpud1RKaTVQM01Ua0xXOG1EVE1HT0d6OVdCRmlSZ09naExP?=
 =?utf-8?Q?POZ4z74SO3PXDUDybc4hFHs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd288551-6fe5-4ab8-23f7-08d9b8c36cc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:19:33.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fajpi0vNe3WitnrpJTtJR6EXEiHW6k/fQjAM8r4EEHEtAIbZnSgiDKOSuEbuilnrmYXVR5W0XoLrDXuPgXfg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

Using Jcc to branch around a JMP is necessary only in pre-386 code,
where Jcc is limited to disp8. Use the opposite Jcc directly in two
places. Since it's adjacent, also convert an ORB to TESTB.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -332,8 +332,7 @@ lment:  movb    $0, (%di)
         cmpw    $0x656d, (%si)          # 'me'
         jnz     lmhx
         cmpw    $0x756e, 2(%si)         # 'nu'
-        jnz     lmhx
-        jmp     listm
+        jz      listm
 
 lmhx:   xorw    %bx, %bx                # Else => mode ID in hex
 lmhex:  lodsb
@@ -401,10 +400,8 @@ mode_set:
         cmpb    $VIDEO_FIRST_VESA>>8, %ah
         jnc     check_vesa
 
-        orb     %ah, %ah
-        jnz     setbad
-
-        jmp     setmenu
+        testb   %ah, %ah
+        jz      setmenu
 
 setbad: clc
         ret


